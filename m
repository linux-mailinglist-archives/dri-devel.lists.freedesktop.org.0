Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441AC2EB63
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8E910E4FE;
	Tue,  4 Nov 2025 01:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d/Hfyyz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2289910E060;
 Tue,  4 Nov 2025 01:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2064pYwfOSJYaA9NF5HbjYzkxQRx8TTOSfpLrAHcCAToeHoZZIEfrqasRZx11JUUJ/pY0cZIgNQTzEzr/pHoiZ1ChwS4cCHSW9rfHNJTzblWO8nqIIRCfodRqW0+SXlj4s/EdCibAFOazSiXMOPfuBdVOCpWIh1D1RSECWWK2CSwJ3pavnIq6/waQOv8odByqHJQs6Hx7NbwAriqRpL7A2M46HU44r2nfdu34LM3VQqdV/dF9ABWKhqnwKWFXqOXrLQY5KgCxDWQJGM97r4KBPM+JPPD7KLVV+jco2HhZiClPw8OlWwH6mgUB+KQ208jLgPLD0sOwAmgZBiJOa5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgF3a2Ve50SrI+qyHokYVGRRG/kSBZyPLbHkAT2lO5g=;
 b=drQzDeshKI4FLHSpUzJ2eOmO4tJsSTBCi+rLnifrQZj9Totj3Ng93jythv85NeJ+73zKRLKB6abraTHXvhOAl6Y8Um+vhX8TYy4JZqyF7163B4nN4Do10akJNpXJ5pJuDSb0yfHjjjARZ/CpOS85jLw9VzXmPOcK60bX44fpqxSXB08+Xpd1KNtnrcFMTttiur2cyFnfc9Q+bgMO8faty/DuPb79F4CxsY+beMzf5AVGcGbnG+Cp00ast27PNdb/T41/b4ZxiOsiGCWcVuctBvsyotk+TTSRloHchlYP/z4frSpVO6YcrNq802Xhh+n/BgrTvHAujKFQu/idwPu+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgF3a2Ve50SrI+qyHokYVGRRG/kSBZyPLbHkAT2lO5g=;
 b=d/Hfyyz7Oadgf5lwfbU2XjM3bDG4HptBYwTWGBVLWGJ2rlB3qSj4ZJukosUXRP3msbZKKblR1RVwfZlRQ3ag5KuwSAQZYe1ccDJKJ0OjWvlZUcpf8tc6Aq29kK/QP1gzB9COinC33GUDALupzt1ypdoAxckpOx0Sm6D4RroJ3nrLxClBd9OzNbfF9WTAJOXXBX86diiVSf1qkyE4Y26H+G+DGSPGtwaCnKekoUbojx7Cp1tpfgMXXEtKYh+GQyHDBjT/fLj0U7nUNoozvvtDbUZ+o/lcmjn6+Y73zHW+sRmVKXegKXiWmSJAl6Swcyv0l+SZXiSSDDp3Ro4VWCUw8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by IA0PR12MB9011.namprd12.prod.outlook.com (2603:10b6:208:488::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 01:12:13 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 01:12:13 +0000
Message-ID: <15cc6de2-d1af-4504-a08d-1278329a2113@nvidia.com>
Date: Mon, 3 Nov 2025 17:12:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
 <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
 <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::28) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|IA0PR12MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 713d55e7-8fa0-485a-3df0-08de1b3f2fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2NXNTV4MWNYbmhIMXNLT2tHNFZiWWFvZ3JobWROemVPMURCUG1RUERLd3dX?=
 =?utf-8?B?aDdIY013dWphaUswdVJ5d3dyREZVRG9uMlZ0TzMwWWhybklNWG9wclFFaVdO?=
 =?utf-8?B?SHB2Rms4ZzZ0My9Bc2RtUm55RGNTOXBsUXVldDZNT2R5ci9wVGYyeDhLZVgw?=
 =?utf-8?B?THhHR0NZbnFVWU9vbnBOWTFwVHkyMnJ5QlIvRHRRa1VDS3NqTmNGeVdFYWZ4?=
 =?utf-8?B?cGNxZ2NiZXJQaXF6dUxWQkJWeVZhK3YrVkhMeHdoWDJCNTlXaHV2MWR3R3JE?=
 =?utf-8?B?d2FlM29xQ0Z1MTl1U1A0enBmWHlTMzNWZEVFb0NMSXgvTFpxQ0gwQXo0TGFv?=
 =?utf-8?B?bm0vdlpwcEtSRUFiYkNlZFUxVjA1ajE4NjRydDdSaWNyNUVPR2Z3blFrdHE0?=
 =?utf-8?B?QnY5MWlMdmxyZlV1bkZqNHA2V2J3QXBJMnoxRE9Vc0hwb1dTSThpK1cxelZu?=
 =?utf-8?B?VGNucEFjeTZjaVIyZmp5UGRlcWllUS9YR2ZWU2hOWldURmozRkF2U0pPSFdi?=
 =?utf-8?B?WUJGYm5NbHRjenRTWllwV3hoVmJ6MHhoWCt0Z21QUEN5c0U1M1FKbDVZTFV0?=
 =?utf-8?B?SytKTlZPWURRVVl3VUxVbEVvRUQ3YzArdE5PbXFQQWNXWFFJalE1OFZITHJn?=
 =?utf-8?B?M2RrbnhFY21wSDJDclRERHAwRGxoMU9WSDJJN2tLc1JScUkzMHNnRHJVN25I?=
 =?utf-8?B?Y3BEdU5yZUVrNnBKY3o2aWJKV3AzcjZ0SnBtd0F1Sk8wZkdySHduYlNPRmlC?=
 =?utf-8?B?NExRSkdyaGJHVEVZOTRqRGhIVFNHVmhvdjZBYkFSWmw2MkFzN0hlWDd2Ym1i?=
 =?utf-8?B?RmtiVkNXYWp5cExuaDByWW5yNE9HYThLVUhjUEhZUEhnaDNMOXJPVFBRejdL?=
 =?utf-8?B?a0FCMjZqSUxlaXRoNEQzSFVXT1p0cHlEMjRDQUg4Sm9xS1dGV1EzYXprWGpl?=
 =?utf-8?B?YXFqYmx1c3JLZ3lMeXFHNURwZm96SGRFNTRMQXN3M3lldnA0TVllMXFoV0pP?=
 =?utf-8?B?WStHU1VYa2UxY1FsN3JQSUxmZ09vbHM0MG5YQmtjTUwxdml3RVdpQWNZODdD?=
 =?utf-8?B?MjlKZHJLNFFmNExTbVZRaWtXRTU5aG04S2ZuMFBCbVdWNXF0azFmUVR2cjZQ?=
 =?utf-8?B?d1ZuUGhWeGg1TTgxdURuZnZZUUtiRFlId2x3UU1aZUxZdTc2WUVpK0VyYjk1?=
 =?utf-8?B?dDdsSENCMWhKbWpiQUpKUElQZW43S3ZyeFUxcDYzeW91anJBMjJVYmVaYllh?=
 =?utf-8?B?SFRVUVRheW8rcnRrSko1WFNtcXFFd2gxVEJQTEtRcFJjUnF2blk0MU5lbVFz?=
 =?utf-8?B?eUZIbksyMmdwQkZZY3pyMWVqaE5YMlhhYmVkUkc0YkJNN2VQbmc3QVNEbzgr?=
 =?utf-8?B?b3BWQUZuSkVuUCtCc2ZobXJ0eVRBa0JoYUV3RE5JWWp0SkdpM0NwbzVFZitH?=
 =?utf-8?B?RmQyUitZT3p1djFOdU95UktnYTI1Z1V1Z1N2RkNTRzN6N0xxbUdyYVRSSk5E?=
 =?utf-8?B?bkQ3L1RVT3gxUWVaWHUrVENqT1FNRXY5Sm00TmJ1ZlRzcW5LNmFEeEtvbndV?=
 =?utf-8?B?WlU0QlhWb2crQ2d5cUZnRk4zcng0T3lNZ1lEeXBJVGhrSUZUdEhzbFlBY1dn?=
 =?utf-8?B?bE9JM1krRXFqUFVWd2xJOVpaMFlCOE9KQTk4MU1tQTlzeHo2UEpwNndKc0Ra?=
 =?utf-8?B?OVpGN1BSNXhFckl0Q1I0T1BITnBYVzZBWGJjRWtGMHIzVE9LSjB4bk1seUtH?=
 =?utf-8?B?Z3NBVmVreCtZMTZXcDBJdjdXNXM2VG45QmsyVEE2WC91VnFheXpxRE5vSXQz?=
 =?utf-8?B?WGl1clhUWjRuTjNoK3hiTlhiRE02a29pYUdwblRyMEd1UktuZDR0MUFaeExh?=
 =?utf-8?B?TUN4bmE1bWZtY1BTUmttUEdsNXlEVWRpSWpuaHlUYXQ4eTQvNGF3bkxycVpI?=
 =?utf-8?Q?Uzff+3HJUfqfkGG4mFOx8Eee6zrApUYN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBrTGpkTFhOMG9TMHQ0RnJDK25ydDRkTzJCVkN0aFIvSHVwODJuMWgyaHhW?=
 =?utf-8?B?QXdISVM3UHVnY0VnMWF0R2tpdDkrMW1MekN5eVJ3aFJ6OHdiUkE3VnpDMlB6?=
 =?utf-8?B?ME5TM0hDaTg2Vkg1Vzduc2MxS3ZJdU5yeCtLalFUWjJ5b2wzYzBxcHpSM0Fi?=
 =?utf-8?B?TFpOdTlKVzVMcUhDQjdET3ByZzVDRVZRcWdHMld0QzNIVUVNdEg5emExWkhH?=
 =?utf-8?B?UzlHeVlBTE1QTkQrbnF6dVNBcVBMUUNRUjFxcmY5alpkanZNVkhYeHcrTEc5?=
 =?utf-8?B?Z3dnK1JkUEEzenV3Y2E0djFQb2k0cWZiLzVUb1YrandldmZpc3NmM1RvM3Vr?=
 =?utf-8?B?QlZFSkYvVS9PWlg1NmNlSnBYbm9yaUlmTnp0ZEJiYjVvQmZJV2R1aU0wOW04?=
 =?utf-8?B?U21wME9OODR0anpaVW9DMjhXZlgwNDVHcGtmMTFMQmM5cU5zYXFoSWo1NEhv?=
 =?utf-8?B?ZGYreFRVN0JpaTNXZTlPWEt1T3ZXUkJQckNFWmliMkFxWHZ6RzNnenF4V0xE?=
 =?utf-8?B?aWpyYlk0VkRENDVtWktPeS95WlFoU0V0SitJUnAvZXJuWXJsRjVKUnBJN2hm?=
 =?utf-8?B?emR0RlZ0d3FXd2hiVkxLUGNJNDFzWDBoWE1XNURmU0lxNzc3KzBmSVRjN3pm?=
 =?utf-8?B?dlhYSFdRRWhqU2ZhSXkxVG0rUVNLZGJwVElWbFRvOGd0WnFNVVJWNk9CZ2Rp?=
 =?utf-8?B?RjFQSlozSVNWOVZjdHV4RmtVRUo2aS9tWTF4R0g1blJ1SFFqejRrK09KVzBR?=
 =?utf-8?B?MXMxMDBPT2ZsQlVyUkdHTFg1NXpKaHR2KzJuODZzSUQyQzNhYTlXcGJQT29Z?=
 =?utf-8?B?T1dXNGxsTWQxaHZzWDdJc1VjVmVDSTh3eXNXTWkzNzJ1WXE4WHhjT1g2L004?=
 =?utf-8?B?T0pZVUYwcTJaVnlZR2YxNmpNZ3BqYXV6NmtOaTlwdGo0N3p6bEk4bUJJM0lY?=
 =?utf-8?B?RUZjaHVnNFRrYStuRjVSdXFXb2RkOVg0STJmRFp1WGFON05aYzNEVW94aTNQ?=
 =?utf-8?B?cnBFUlZCTGYvdHZBaWpTSWVGT1dpMWdaT0FBM0h2b1JCV2xtSEJJZEhZYXZP?=
 =?utf-8?B?Y3BlTmJjTlZKY3A4S3dIU2VZT0psTG1NcFA5YzVSVnd5Z2FtSU82a056Z28v?=
 =?utf-8?B?SENFdEVkcVo3bWZzdmN1Sml2M0VjTHhhSUFpejFyaUVkdkJRa2tCMlI4d3JG?=
 =?utf-8?B?ek9lTmhiT0FRNjFXaVVBaEVFODBvOGdJNnFWVzM5K0FLOFYrNG1HZUNJbm1J?=
 =?utf-8?B?YkNqU3AvQmFZYlpXSFJ0dE9qajFOMVhMVTRSNkNMOHZ4QmxXUEhQMkZxdTQ4?=
 =?utf-8?B?RDd3YXc3cjl0ZGpPSXphZWJxYmwrWXd1Um9GaVVnL25rV1FEUnkzMHFRWStH?=
 =?utf-8?B?SDlRVnEvbkN0SU9YVG1FRnNtT2lZR2JVaVZOOXo1TVFzb2t6YkRYSXl3a01V?=
 =?utf-8?B?WnNWK2QrVVJVME8xYlk4Nm0xaHBZcUh0dmRQd1ROaG9ZNko4YXZFTDRaMlk4?=
 =?utf-8?B?dVVlMGVGUm1FNVZSN3FTVktzSjlrUFJjQyt5aXEwcUZOTlpxemZMb1JyaDd5?=
 =?utf-8?B?V0UyWEZEQUtmQ0c3Znh6ZzNBSEtqNW0yajdoT1BVSG1JYXI3NkdDNFhheCtw?=
 =?utf-8?B?T3U1ZjJXMCtaTkJ3eGs5c0ZNN1ROVithNERsUzBTeldnZDF4eEt6ckhFU2hi?=
 =?utf-8?B?enYxQ1VoZnY4STFpYVFUL3VkN1pyQ1NuTmxGSi9rNTVtcVZNVFZPWnVBdFBh?=
 =?utf-8?B?VU42Z2dKUXBzZUhMUzhBVnhsK0JYYWllNk8rUWJYOGZBZXdkeG5mVEZTZXdW?=
 =?utf-8?B?ejdCSjhKdFRkSHRwZ2VWdTlQbnE0bW9KbElCSW05KzVyeE82cWFmZG5hYi9G?=
 =?utf-8?B?RG5ZQytHYUR6TTRlNlgzekxwRThLNnJlUkk5OXV3OUVLMDkrdDVTL1p2TXY3?=
 =?utf-8?B?WWZFNC9lR1B4UXRlY1V5L0Y5a1RBYnRndkJPUkw4cVhWOUpTRWJtbWZmQnA5?=
 =?utf-8?B?MmFBbDZMdGFOZUJVTU03S2c5UE1haFUzTHIrRGxFczBiUzV4S1I1a3A1dHVH?=
 =?utf-8?B?T2dJYVNJU0NxMHB5aThIWlViazd3dTNkUUxvZkRYRlJLbkJ3QU1MSUJQOGdB?=
 =?utf-8?Q?fBJZpp/nxM9vlYyCkIJEFVHsX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d55e7-8fa0-485a-3df0-08de1b3f2fa0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 01:12:13.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSp4Z+z69z3NB81+97DShZ6VkwbxD3eNPzKu/VSjBkuFjEJ7PJMllPOb3vhR/SgMD16aDMHazO7WRc3+YptQMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9011
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/25 15:53, Mohamed Ahmed wrote:
> Thanks a lot for the shout out! Looking more at things, the logic here
> is actually redundant. It was originally copied over directly from the
> bo allocation code to stay on the safer side (basically the idea back
> then was to make both the bo and vmm sides match exactly). We aren't
> at risk of having an aligned address that is in the wrong memory type
> because the bo allocation code (nouveau_bo.c:321) forces anything that
> has the GART flag to have a page size of 4K. Anything getting a page
> size higher than that is exclusively VRAM only. Additionally,
> currently things marked VRAM only don't get evicted to host memory
> except under high memory pressure and in that case, the context is
> paused until the objects in question are paged back in, so we also
> don't have to worry about memory placement there.
> 
> The memory placement check in the vmm code could be removed but I am
> leaning more towards leaving it as is just to stay on the safer side.
> At the same time, it would be more useful to keep it for the future as
> one of the future investigation targets that we want to look into is
> all the memory placement rules because the "only 4K is allowed for
> host memory" limit that nouveau imposes is a source of many pains in
> userspace (originally thought to be a HW thing but seems it's actually
> not), and having the checks on both bo and vmm paths would help
> starting out with that.

OK, thanks for the explanation. I'm fine with leaving the check as-is in 
that case.

Given that, for the series:

Reviewed-by: James Jones <jajones@nvidia.com>

Thanks,
-James

> Thanks a lot again,
> Mohamed
> 
> On Fri, Oct 31, 2025 at 7:01 PM James Jones <jajones@nvidia.com> wrote:
>>
>> On 10/31/25 03:49, Mohamed Ahmed wrote:
>>> From: Mary Guillemard <mary@mary.zone>
>>>
>>> Now that everything in UVMM knows about the variable page shift, we can
>>> select larger values.
>>>
>>> The proposed approach relies on nouveau_bo::page unless if it would cause
>>> alignment issues (in which case we fall back to searching for an
>>> appropriate shift)
>>>
>>> Signed-off-by: Mary Guillemard <mary@mary.zone>
>>> Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
>>> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
>>> ---
>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++-
>>>    1 file changed, 58 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index 2cd0835b05e8..ab8933b88337 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -454,6 +454,62 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
>>>        drm_gpuva_insert(va->vm, va);
>>>    }
>>>
>>> +static bool
>>> +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
>>> +{
>>> +     u64 non_page_bits = (1ULL << page_shift) - 1;
>>> +
>>> +     return (op->va.addr & non_page_bits) == 0 &&
>>> +            (op->va.range & non_page_bits) == 0 &&
>>> +            (op->gem.offset & non_page_bits) == 0;
>>> +}
>>> +
>>> +static u8
>>> +select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
>>> +{
>>> +     struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
>>> +
>>> +     /* nouveau_bo_fixup_align() guarantees that the page size will be aligned
>>> +      * for most cases, but it can't handle cases where userspace allocates with
>>> +      * a size and then binds with a smaller granularity. So in order to avoid
>>> +      * breaking old userspace, we need to ensure that the VA is actually
>>> +      * aligned before using it, and if it isn't, then we downgrade to the first
>>> +      * granularity that will fit, which is optimal from a correctness and
>>> +      * performance perspective.
>>> +      */
>>> +     if (op_map_aligned_to_page_shift(op, nvbo->page))
>>> +             return nvbo->page;
>>> +
>>> +     struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
>>> +     struct nvif_vmm *vmm = &uvmm->vmm.vmm;
>>> +     int i;
>>> +
>>> +     /* If the given granularity doesn't fit, let's find one that will fit. */
>>> +     for (i = 0; i < vmm->page_nr; i++) {
>>> +             /* Ignore anything that is bigger or identical to the BO preference. */
>>> +             if (vmm->page[i].shift >= nvbo->page)
>>> +                     continue;
>>> +
>>> +             /* Skip incompatible domains. */
>>> +             if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
>>> +                     continue;
>>> +             if ((mem->mem.type & NVIF_MEM_HOST) &&
>>> +                 (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
>>> +                     continue;
>>
>> This logic doesn't seem correct. I'm not sure why there's a need to
>> limit the page size on the host memory type, but assuming there is due
>> to nouveau architecture or HW limitations I'm not aware of, it should be
>> applied universally, not just when falling back due to misaligned
>> addresses. You can get lucky and have aligned addresses regardless of
>> the target page size. Hence, this check would need to precede the above
>> early-out for the case where op_map_aligned_to_page_shift() succeeds.
>>
>> Thanks,
>> -James
>>
>>> +             /* If it fits, return the proposed shift. */
>>> +             if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
>>> +                     return vmm->page[i].shift;
>>> +     }
>>> +
>>> +     /* If we get here then nothing can reconcile the requirements. This should never
>>> +      * happen.
>>> +      */
>>> +     WARN_ON(1);
>>> +
>>> +     return PAGE_SHIFT;
>>> +}
>>> +
>>>    static void
>>>    nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
>>>                               struct nouveau_uvma_prealloc *new,
>>> @@ -506,7 +562,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
>>>                        if (vmm_get_range)
>>>                                nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
>>>                                                     vmm_get_range,
>>> -                                                  PAGE_SHIFT);
>>> +                                                  select_page_shift(uvmm, &op->map));
>>>                        break;
>>>                }
>>>                case DRM_GPUVA_OP_REMAP: {
>>> @@ -599,7 +655,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
>>>
>>>        uvma->region = args->region;
>>>        uvma->kind = args->kind;
>>> -     uvma->page_shift = PAGE_SHIFT;
>>> +     uvma->page_shift = select_page_shift(uvmm, op);
>>>
>>>        drm_gpuva_map(&uvmm->base, &uvma->va, op);
>>>
>>

