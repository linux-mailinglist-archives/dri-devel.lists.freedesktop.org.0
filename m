Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A6B970FF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 19:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FEB10E64F;
	Tue, 23 Sep 2025 17:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hyX+DTZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F2110E164;
 Tue, 23 Sep 2025 17:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tz18lYpM06e+ZblXmar3LKYx35kCUAodllUd/KgZxz/7dHe0nRPZAxw3rQM28xHs6XAKINVKKILIWZa9symY97dleHYxF29SerBPRhdib6Me8qHZfZWRTF8QzyznKKUE6l3o/vmYVOycsx1CVfTSjnHc9aQSwkCh7Sqlds5Yw4ofmyD+R0EQZJ0cWaMSZNJxQF22JDRI1/Ax2Yh3Z93OjmnPxStXpgK/t222FOzTJr0wLuZG8AzyBn6J57VC68UWpHnqib2Ii9EwYUlAj/ToT5Oqp9myVutF2NKMycPiiYjsL/0GMtdF7zk4Wtz/Wpc4JQdB97zdzkKMKI86/N2mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMzKJslAUYnEVkOT1zB5Ka35+TJqyZpTPeS1a287/qg=;
 b=pFvzMtkBVlXDNZcp4wuztfXjsbOoYpCxeW/YBfutueqCImi5gWx28TWxFi4XiTLM6UfPrFqKxbtQ+rz4M7JIa+a9GlGiZ9qGkTwCNAxmP70YmiNrxMG96cp2ME3IjmvSRiCexnEXNpeMAqDz4SsLqMpC9jCiTZW2oWdaPcD6cm7J+VD4rpTY5QHDS6N2dRN2s95aQ2+GpbHjQ/hasihvZVLPgo1Igr+dX6aDSmciPyYu4hDP4NkPeWyINfHnIA3jbt7SZJdg4xJL7RJdIkiQcQyZ7Puzl+gkojG3/9M9GbzAuwDW6i93LuT6cY4eC6y48/d+M7oVEgAXZdS624WGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMzKJslAUYnEVkOT1zB5Ka35+TJqyZpTPeS1a287/qg=;
 b=hyX+DTZgvdHcHJWYsvaw1nc2055n5X2iecq0as3JI2TOiWbnDZzC6NFPQND2UX2Or+JkpWFM792UlkcU/z86V27LQlVyjun96+1fo3hGNgLgy6EHCPcLOknIqDNRwFgR6ifdgxjmjeabSojVNvc3T1SLK1az22J246JmE5lcAjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 17:41:29 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:41:28 +0000
Message-ID: <b8abcab1-3953-410a-b639-5a74f9d2819e@amd.com>
Date: Tue, 23 Sep 2025 11:41:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
From: Alex Hung <alex.hung@amd.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
 <20250923105918.41f832c2@eldfell>
 <1c7158fc-db72-4ba0-81d2-8bfecf36a2c2@amd.com>
Content-Language: en-US
In-Reply-To: <1c7158fc-db72-4ba0-81d2-8bfecf36a2c2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0251f1a1-f76d-442a-6387-08ddfac86cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEw5Y2ZFd1V6dnlMR3FiekdmS2QzcHlxQ3BuOFJGbTZwcWhTMm9ZT2txc2dP?=
 =?utf-8?B?RnNmVHVjbEl6UUIxRFFQeTBWNWpEMml6UmRVcENWTVltUk93ZWkyZjdidWtP?=
 =?utf-8?B?Ulo5cU1WaWhYdVJqdFArRXd6eHVnTTQ2SWlDSUUyZ0pTbDB6Y3c5MjBZTjdD?=
 =?utf-8?B?dk5KeGtFSDQxNEJoekY0dkNVVlp4dU82YzJoZ09HeENubVk2dHAxUXlpaVJK?=
 =?utf-8?B?RmZoZEFtM0NOb1hVTEJIYWpDSEk1Ri96L0x6SlRhTEpxKy9NWkNGaXprd2JD?=
 =?utf-8?B?MGlXdlBLRmhoVDlLeWZvRThiTjdrYVhyRnNhVUoybnVyQW9oZVZQQnZWaXdJ?=
 =?utf-8?B?cTVIc29KZFQ1Z1pwZmYyanpMM08vNU1mUC9ENFJ3Y1FPQ21UaUNFRlJ4eFhX?=
 =?utf-8?B?eElGc1hqRkJ5aUt3eVhOWCtQS2g2ZmFFbXhoUmEzT3FuNURFRFpGWHFaWXZF?=
 =?utf-8?B?OGtvcTBNV0twN1pUUXRMaytTMC9NR3BnZHI3MnZtWGJFNnJ0eXpTWlI3OVFs?=
 =?utf-8?B?bmZZdTYyMURQclBIS1VOYzFSVmhYSzRFNUhJZERJWFZMUnhHWFRsZ3I1MTBh?=
 =?utf-8?B?TkRjUFlJZWMxRklzeDk5ZUxZQ0ZFc1U1dmd4ZXU1K1ByV3RycnFFMURGY0kv?=
 =?utf-8?B?MzhXMUdvbXkzTExhMlRlTFBuYTNRSkM3U3VSVUVnQXRYaElWamZRSnROTDR1?=
 =?utf-8?B?Vkl4cEpyUHExYzhJTEx6YWhGU2JWRVRBU1ZVU00zRTZkc0V4ZHQ2VmZyZEw3?=
 =?utf-8?B?LzNuK1ZBQjk3UzA4TUVUWDUyVG54bkNHZTlRT2VuTnRqb2xCcDc4SWxySHVy?=
 =?utf-8?B?SGFjd2djRStQOXR2cStEUWh0VTJGWDJRVjh5cUxRMmhoNVRQU1d4SG1kQ2lh?=
 =?utf-8?B?RmZLeUY0SjUyMlptOFpvZVF0dHFqcmVYWENSMWx2cXJXZndSSzlRVDBsYVlT?=
 =?utf-8?B?UWx3RHRUNjNSQUlDSHluRkhFZFF1bzhDYkNQS0N4L20vSWdSVmJBNG04TUMv?=
 =?utf-8?B?RzJMMFcrbHJwQmFTYnBnVXAyWldDdStMT3g3RURCWHl4czZBbE1jNjdZVWNv?=
 =?utf-8?B?NGh1SE9ua0ZrUWNyRU9VRG1GbnZuZmVWSlJSQ2IyTFJxeTJubEthcDQ1VWNm?=
 =?utf-8?B?UVN2VzloaERWbk9RWjB5Q2VZaWorbkFzc2lkR1piL3ptUHV4M3FPRXFPWVNK?=
 =?utf-8?B?c0kyN0tzWmlwNW4yZFpUMXNnSm5td3loNnNPRFpjclNvNi8wYmFWTHEya1Rr?=
 =?utf-8?B?dGdXNjhtNEhITXFTblZtVlFBVHZtalVKVm5WeHpuZ2g2Y2IvVDBkb2x0Y3ph?=
 =?utf-8?B?N3JzeUFGdTc3ZTdSeW1yV253eWdtVE12SXo5aHlGcXVVaytCUnBwc25YTlZj?=
 =?utf-8?B?VG9QV3ZUQ2I2aWRCbXRROVlieEpsSFFxR0lWM1RRcHJOeFZRVG1WV0UxT2J3?=
 =?utf-8?B?disyTDJWWU9QRGpCcFJKM1lzQXdNa2hYWnIrL1Z6QzRSb1JZTk9xbHFiL3JI?=
 =?utf-8?B?VGU2c1pSemxzb1FZbDRGVzdETWN3ZzhISGZQRWNzKzJxandMWUU2ckVQTzZi?=
 =?utf-8?B?b0hLS2FhL0NaNkJpS0pJYTNuT3VwNms5K044emVRTXg2cDZlbStUVmpwUkpU?=
 =?utf-8?B?QTV5SENDWTdRQklVVFBOaEplY3BtNTU1SnZKb1lYelp0R2l4SC9tZkpnT3Rk?=
 =?utf-8?B?c2MxNHE5Z0JhMWFFYVRZRXRKTDFIVkRNYnZFMmcyRjlybHF5NVJqNCtHeThu?=
 =?utf-8?B?bURpQ3FtVlVvU0IzSkRxenJGV2pua0M3dWs1NXZGOU45eTI4VmplNDVwMjcx?=
 =?utf-8?Q?tc0Fi2JD/emlPbmeGpHV2jbwcHjZ9c5DS4TZs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVodjk1c1ZKWTNPOFkwMlVsbFN0WENNM3ZoQ20rYXlQSFh3V0pSRUZjQmEz?=
 =?utf-8?B?eVV4bXBIK1hkcUJxWTBoOFc4V0dWeTJ2aENxVUtGa1lZMDVwRk9ENDhMUVBs?=
 =?utf-8?B?enBrR1dxZWtuTkpjbkZhNEtiU01pSHpTMUtFOVZOYXZLa3phN3VoaGJVWDVH?=
 =?utf-8?B?ZkN3dkxsc3JxMUxLNi9ocUx3M0FneXJxQmMrbU05NG1EUTluSHNTeWpOa2Np?=
 =?utf-8?B?U2lpSzhhVnBwb2JPYTJMRUs3SnFUTDI3S2kzL2FaaXdKRVJZQ0tibVNCMnVs?=
 =?utf-8?B?NjBzMFVwTUpwakxYWWlEOU9qcHJYM3dtQVE0eFpFSlpCdEhhRjBsbWhnMVZB?=
 =?utf-8?B?Sno5bmxLMG56YTFDbFF1T1g0eGJnbXV2RWYvT3BGWWdUS3ozUkhTUGVRblJ3?=
 =?utf-8?B?K1ZJc2M1OXBEdkNWRWlIZmNjRTJzV3dBdm1nTVRjNzBIWk4yeWtQbG5DOHRT?=
 =?utf-8?B?YmZzUWJic2t2WjA0UG9RUWppeWpDVnBTRS9mM2FsWStxUWp2TDZZdUo4cHNT?=
 =?utf-8?B?QzN0Y2RpSzg0eEFySDh0aGhuZ3N5b3pTOGRTeVpUR1ZhSER4L080WTYzdkpy?=
 =?utf-8?B?ek91VDl1dXRlRHFGNC9VVWw4Mmk5bzZ2NEZBeDlUVlQ5NUZRU3VkQjN3T1ph?=
 =?utf-8?B?NXcvV21CZUY1Slk3M3hJK2MraU9ZOFdzOTVCQkJCM284b3EvMXZONFVCTXUy?=
 =?utf-8?B?cEpWOUNtZGkrVUdiZk1zYXBKQU9wRU9HNko2SkVadko3bXBLYTMxWEF3TjVB?=
 =?utf-8?B?VDN3allpZXhXcm1SOHVMak5CQmJwM2o4Z2JNY0xCcHV6WnVBSUpMMllGNEdy?=
 =?utf-8?B?OUNRZWpWWWxaZWVHSkhOTytuenJMTHN3Snl1ejBOODV4ZWloMGNBaTg5Nnh4?=
 =?utf-8?B?QjJrbTBnVjJhT0djQUVuRlpGWGpIN3A2ZEQ1QzFFVi9zZnpWUDVxcjJrQnVa?=
 =?utf-8?B?WUhlTTZDM1N6c3lRZWhraU8wdU1RL0pud3ROaGVUdFZWOGRGMjIrVTZUcVd1?=
 =?utf-8?B?S0s5WG9PVW5pTWFnRlBGdGlGUlNTT1ZIcHVmVnpNUDc2TDNEaGowS2xYOUpL?=
 =?utf-8?B?VTdlRVVZZ2V2bzlreXRjRi9XUTRjVVBxcE8xOWUzZ05JUllNTjgxaUxYZmlL?=
 =?utf-8?B?cnlhQzc1QitzcFJva21DTUp5eHY4MWJFOW1sOWs3TXZQVEdRekw0amU5M0VZ?=
 =?utf-8?B?N0NEK0hmTzhnTVVmSmR1clhMVGpwRlZDTENwNzY2K1l0VXZ4dFZjVlZtM1Q4?=
 =?utf-8?B?ZjlzLzBCcTRyZFh4NHl0WGZUSFdzQ0FjcXoxaG9ac2hDOUFCWmg3WXVvcnE2?=
 =?utf-8?B?UFduUjlSUHpuSytZR1RMRVV3WTk0cEV6a0NJNEJXVWdNVzkzMStPcUlIZEZM?=
 =?utf-8?B?cEZWeVp5MTJDY1BqTXErZEFPOXdHUTMxQVdnaVdVbncyM2NhZU9Db0lneDRv?=
 =?utf-8?B?Z3pUd3Q5bmxoZzRLV3pJM2J1QmNmTzhVeURSVVUrb2xUcGRVcWNKZnI3OXJX?=
 =?utf-8?B?T2FVM0x4TUNodStIazZmTjRnQ0ZRS24zNHhXSVFQdHpUU1ZJV3ROT1RnOGk0?=
 =?utf-8?B?YUZGWG5lQ0NPek1HQ3EwSzFLYUlpMWJtUFpvSlZIc1VpQ1FKclYxbW9kOWd2?=
 =?utf-8?B?cjJ2QjhLck5XM3p3SnZCT2hvQ2djVk9YRjVPdkdPYW1RNCtJd2d5ZnJQRUxT?=
 =?utf-8?B?UExkN0Y3Yis1YzNrRVByNUVJNEpCcUZFOGxvN3l5SG5KRGZ5bjdjbk56MUZV?=
 =?utf-8?B?b0ZFdmVLU2ZadUhTNFlhNmJzd1pVREtFNzdNZnFwT05rRlUwUkM5NHBiRDVh?=
 =?utf-8?B?MWNIU0JkZkdaV3dXdUZqUUlneVZPems5cnBuQ0lrUXFtTWhoQTFWMTJFeWxH?=
 =?utf-8?B?UXpoNVUzVzRianJXMERaZm14OGsvTkRZSm02VmhTZjdpUTQzelUxQ2w4K2I2?=
 =?utf-8?B?VzYzRlZ3MCtTK2RWamtDQnJveDBjOVYzZngrdTdFTS91UWt2NU5YZk1JN25K?=
 =?utf-8?B?N3lmYmJCOEFob2FtWUt6eHh2SHJ0aWFQaThlMGdpbXZuTERDRWRaUlF6ZHNU?=
 =?utf-8?B?RE0wZk91TWgvVDZZR1FuY3AzQm5pWnhiMVh4T3hLWVNsSUFDWE0rSU5hOFBP?=
 =?utf-8?Q?ZzpI+CvkwLFx7EM4nunpdJlPn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0251f1a1-f76d-442a-6387-08ddfac86cd8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:41:28.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRiOGh1ij+LcOJwzycZ64wTlM8Pe3dE5geRewAFmdIzAeNfBVvd6GDGrOngOkbTP2PqO5iW1LgzPRSyUZ31QIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141
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



On 9/23/25 10:16, Alex Hung wrote:
> 
> 
> On 9/23/25 01:59, Pekka Paalanen wrote:
>> On Mon, 22 Sep 2025 21:16:45 -0600
>> Alex Hung <alex.hung@amd.com> wrote:
>>
>>> On 9/18/25 02:40, Pekka Paalanen wrote:
>>>> On Tue, 16 Sep 2025 17:01:07 -0600
>>>> Alex Hung <alex.hung@amd.com> wrote:
>>>>> On 8/26/25 03:03, Pekka Paalanen wrote:
>>>>>> On Thu, 21 Aug 2025 11:54:32 -0600
>>>>>> Alex Hung <alex.hung@amd.com> wrote:
>>>>>>> On 8/21/25 06:23, Xaver Hugl wrote:
>>>>>>>>> We user space folks have been convinced at this point that the 
>>>>>>>>> sRGB EOTF
>>>>>>>>> is actually gamma 2.2, and not the piece-wise function. Now, if 
>>>>>>>>> the
>>>>>>>>> hardware is actually the piece-wise, then that's what should be 
>>>>>>>>> exposed,
>>>>>>>>> but I'm a bit unsure if we should do that under the name sRGB 
>>>>>>>>> EOTF.
>>>>>>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
>>>>>>>> hindsight, the naming of "srgb" in the Wayland protocol caused a 
>>>>>>>> lot
>>>>>>>> of confusion, it's better to be explicit about it where possible.
>>>>>>>
>>>>>>> I will leave this to Harry to comment. He is taking a few days 
>>>>>>> off so I
>>>>>>> will check with him later.
>>>>>>
>>>>>> "sRGB inverse OETF"?
>>>>>>
>>>>>> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> pq
>>>>>
>>>>> If an extension in future after this proposal is merged, can it be 
>>>>> GAMMA
>>>>> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] = "GAMMA 2.2" so it won't
>>>>> conflict with current name?
>>>>>
>>>>> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as
>>>>> the following? or do we still want to add "piece-wise"?
>>>>
>>>> Hi Alex,
>>>>
>>>> since my previous comment, things have muddied further again. FWIW, we
>>>> intend to remove the use of the name "srgb" transfer function
>>>> completely from the Wayland protocol as confusing:
>>>>
>>>> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/ 
>>>> merge_requests/442
>>>>
>>>> I would recommend the KMS UAPI to similarly avoid the term. I would
>>>> recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
>>>> such. These names would hopefully not trigger intuition and make people
>>>> look at the definition harder. Or any other name you can come up with.
>>>>
>>>> I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
>>>> may provoke people debating what does IEC 61966-2-1 actually define.
>>>> We've had these kind of discussions for Wayland already, and it was
>>>> suggested that it is better to define the actual mathematical function
>>>> in our specification that to leave it for interpretation from 
>>>> standards.
>>>>
>>>> For KMS, this should be even easier than for Wayland, because the
>>>> hardware implements a specific mathematical function regardless of
>>>> where it might have originated or what it is being used for.
>>>
>>> Do you mean the following changes? Userspace use Gamma 2.2, and display
>>> driver can decide to use either sRGB piece-wise EOTF or Gamma 2.2 
>>> itself.
>>
>> Sorry, the driver cannot choose. The UAPI needs to define the curves
>> explicitly, and the drivers need to implement those curves exactly(*) or
>> not at all. What I propose is, let's not use "sRGB" in any of the names
>> for the curves, because that name triggers different assumptions in
>> different people.
>>
>> (*) "Exactly" is a little vague here. I assume some error tolerance
>> needs to be allowed, e.g 1 bit on the electrical value. The maximum
>> difference between the two-piece and power-2.2 curves is several code
>> points for 8-bit electrical quantization, and that's too much error.
>>
>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>>> drm_colorop.c
>>> index e1b2b446faf2..3a6c64285d9c 100644
>>> --- a/drivers/gpu/drm/drm_colorop.c
>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>>> drm_colorop_type_enum_list[] = {
>>>    };
>>>
>>>    static const char * const colorop_curve_1d_type_names[] = {
>>> -       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>> +       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Gamma 2.2",
>>>           [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>>           [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse 
>>> EOTF",
>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>> index 3e70f66940e0..e39379f1a61c 100644
>>> --- a/include/drm/drm_colorop.h
>>> +++ b/include/drm/drm_colorop.h
>>> @@ -48,7 +48,8 @@ enum drm_colorop_curve_1d_type {
>>>            * sRGB piece-wise electro-optical transfer function. Transfer
>>>            * characteristics as defined by IEC 61966-2-1 sRGB. 
>>> Equivalent
>>>            * to H.273 TransferCharacteristics code point 13 with
>>> -        * MatrixCoefficients set to 0.
>>> +        * MatrixCoefficients set to 0. This can also be approximated as
>>> +        * Gamma 2.2.
>>
>> The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
>> the sRGB curve means different things for different people (two-piece
>> vs. power-2.2).
>>
>> The difference is minor but visible, and therefore I would not make
>> two-piece and power-2.2 equivalent nor have one approximated by the
>> other.
>>
>> They both need their own entries in the enum. Let's leave any decision
>> about whether substituting one for the other is ok to the userspace.
>>
>>>            */
>>>           DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>>>
>>>
>>> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise
>>> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may
>>> not be used at all, right?
>>
>> If hardware implements the two-piece curve, then there is reason to
>> expose it, especially when it does not implement power-2.2. Userspace
>> can choose to use it as an approximation when that is appropriate.
>>
>>
>> Thanks,
>> pq
>>
> 
> Does the following diff make sense?
> 
> 1. Change "sRGB EOTF" -> "Piece-wise EOTF"
> 2. Add "Gamma 2.2"
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index e1b2b446faf2..823e39b8f3fe 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -71,12 +71,13 @@ static const struct drm_prop_enum_list 
> drm_colorop_type_enum_list[] = {
>   };
> 
>   static const char * const colorop_curve_1d_type_names[] = {
> -    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
> +    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Piece-wise EOTF",
>       [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>       [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>       [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>       [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
>       [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
> +    [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
>   };
> 
>   static const struct drm_prop_enum_list 
> drm_colorop_lut1d_interpolation_list[] = {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 3e70f66940e0..3428a27cd9ad 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.hsRGB EOTF
> @@ -43,12 +43,9 @@ enum drm_colorop_curve_1d_type {
>       /**
>        * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>        *
> -     * enum string "sRGB EOTF"
> +     * enum string "Piece-wise EOTF"
>        *
> -     * sRGB piece-wise electro-optical transfer function. Transfer
> -     * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
> -     * to H.273 TransferCharacteristics code point 13 with
> -     * MatrixCoefficients set to 0.
> +     * sRGB piece-wise electro-optical transfer function.
>        */
>       DRM_COLOROP_1D_CURVE_SRGB_EOTF,
> 
> @@ -108,6 +105,16 @@ enum drm_colorop_curve_1d_type {
>        */
>       DRM_COLOROP_1D_CURVE_BT2020_OETF,
> 
> +    /**
> +     * @DRM_COLOROP_1D_CURVE_GAMMA22:
> +     *
> +     * enum string "Gamma 2.2"
> +     *
> +     * A gamma 2.2 power function. This applies a power curve with
> +     * gamma value of 2.2 to the input values.
> +     */
> +    DRM_COLOROP_1D_CURVE_GAMMA22,
> +
>       /**
>        * @DRM_COLOROP_1D_CURVE_COUNT:
>        *
> 

Both DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_GAMMA22 are 
defined and it should be clear that sRGB EOTF are piece-wise TF and 
Gamma 2.2 is for power 2.2. Is it still a concern of using "sRGB" for as 
the original patch?

More precisely, adding DRM_COLOROP_1D_CURVE_GAMMA22 with "Gamma 2.2" 
string without touching "sRGB EOTF" should be sufficient. If a userspace 
need to choose one or another it can precisely do so.

> 
>>> --- a/drivers/gpu/drm/drm_colorop.c
>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>> @@ -77,6 +77,7 @@ static const char * const
>>> colorop_curve_1d_type_names[] = {
>>>           [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>>           [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse 
>>> EOTF",
>>>           [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse 
>>> OETF",
>>>           [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
>>> +       [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
>>>    };
>>>
>>> Does anyone have comments or concerns if we use the first option?
>>>
>>> Alex H.
>>>
>>>>
>>>> Thanks,
>>>> pq
>>>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>>>>> drm_colorop.c
>>>>> index 1551b86471ce..90a216c0b6ac 100644
>>>>> --- a/drivers/gpu/drm/drm_colorop.c
>>>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>>>> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
>>>>> drm_colorop_type_enum_list[] = {
>>>>>     };
>>>>>
>>>>>     static const char * const colorop_curve_1d_type_names[] = {
>>>>> -    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>>>> +    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB Inverse OETF",
>>>>>         [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>>>>         [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>>>>         [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse 
>>>>> EOTF",
>>>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>>>> index e4250b7d8de8..ce85c52c60c8 100644
>>>>> --- a/include/drm/drm_colorop.h
>>>>> +++ b/include/drm/drm_colorop.h
>>>>> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
>>>>>         /**
>>>>>          * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>>>>          *
>>>>> -     * enum string "sRGB EOTF"
>>>>> +     * enum string "sRGB Inverse OETF"
>>>>>          *
>>>>>          * sRGB piece-wise electro-optical transfer function. Transfer
>>>>>          * characteristics as defined by IEC 61966-2-1 sRGB. 
>>>>> Equivalent
>>>
>>
> 

