Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB89FCFA2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 03:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA20010E08C;
	Fri, 27 Dec 2024 02:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o/gLTk+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0299310E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 02:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhmlZOA0qSG207CRZuHY12w81LeRguiOQBtPiIFJPs2Job1QPuPFtaTqN/xmHhurjTO25AApDjs/UgQG+IFxb6bDwYZnrRQAR3YxYfmSyi53SAkj7gaiefVLwToP4L2Y0Z+uGHVRRfqMErRexrGPlNhavtpnRZ8bNai4Buw2ApCEHXF7aqAQCDuz4AXPNlrupfKJIZ5Ast3PoxGooCJvwR9NNthv2wlubyui6+Od2R40W9mA6GTHdcTVM7cIpVrY8gAgtgEvCtIx9N2cq7l2bFUuNdw0pi6+qku5x6dq5fAQWP1szUAPOl3j7MpRHs4Kwzf2ab9dmyWyXVf2ELadvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQrVJZHBRcCj7VE3ZIt+LD6+HX4i/shC4oZ/rALrRlA=;
 b=YEcjkmXfIZ71OFZ6dDEkprnY5HxR1HVB16z1FeIYo/YQmnrc1m/Y538yJtkPQmH0l8VCv+Y34KDQc6rzwLPG+ztuCWci/ka2fZcd1+3/p3z5hw+E2YfPv+IW3CGX9quKOuWAcQzXwnVnCrSohutEDtZOoSss8GO0Xn+lr+RKpg7tgxOfZax0a9ncL3nNKs/Lci1AfbIbmMcVZamSgBj32uUioHfrk3J4SNtvmFfRqcRJ0lIXZ0aIj+4MIKAAcVqNuYe46v/mU4e9u+LvAwlX4cy+u4ynXtE6XrjB79sCpcBbmjkAlqlZAIl/Z10b2W8eRreJuAuBq5BOVwR/f47hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQrVJZHBRcCj7VE3ZIt+LD6+HX4i/shC4oZ/rALrRlA=;
 b=o/gLTk+ycxNGLim0HelUaXJXr/TItHvPi/6q4DSlwCDana2htP+AOJi7bzlNkKyRWcevDOqpRQkyEmjWqTpDNuD5HlO5y2VyTCEuWgR4nXd4Poyv97RoFOYOBtmx3HEJuceUnmyjyWX+HtXECZXPUFoxqEtER+mRQe5t+ELvbk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 02:24:40 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%2]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 02:24:40 +0000
Message-ID: <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
Date: Fri, 27 Dec 2024 10:24:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 1759e712-1a2e-4a5d-216a-08dd261d9dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBVOGVpcENrUXVBUENPTmplMzM2YjJGTEp2T1V6Q0pWV0cwZ0dHcXozZmd6?=
 =?utf-8?B?SnNzUXlaeldoNWFCaTJPbWI0QzRNdGtHY3JmbXYrWkRKaVQrbHlZNHA4ZVJI?=
 =?utf-8?B?dWo0UElMaURoS3dVZlAwVnRNZjlOcUJFeVd0QS90SExHYmNpR2IwRVgvRXZV?=
 =?utf-8?B?R0V6NGlWVGdSVEJCbk8xRmpJbDAzZ3NtSS92K0J4cC9JWFJHTWo0cnpZeTJW?=
 =?utf-8?B?WXAvV0Y0YU5kUTVBOEV2YWx5ejFjQThkQ2dhd1VWeTA2V2JjTW9tTGRwK29K?=
 =?utf-8?B?RUJVYi9OSUN1OWlmRnFJcFhaY0ZrQnlidndobDltakNsTHJKNklRU0tZS1BJ?=
 =?utf-8?B?bGxDUW15SXJTd29Bcy91clRYc3VwdXZ0T2R5RW9WcUJHRWhZUWhadkQ3V2pP?=
 =?utf-8?B?aGNvTGlXSXp6L3dpY3l4UXlpR3Z1cUhuRFluY2RidlBaSmZGdmFyVjlsNUVu?=
 =?utf-8?B?Y1RVUHJGSEl1L3VJTE1HRUUvUm9xQXFSa1FSVm1RSWtwV01mUWY5OWNOWDU2?=
 =?utf-8?B?cWxnS090a0xlcDBWU2dFT3FvemFpZ2M4QXVjR2xhb0lNRmZQakJOdjhIcUE3?=
 =?utf-8?B?dVNHUmI4MW95UEdMb2JSMjMyTWl5MUIxTkMwMjZ4ejAxRWNFWDNIZjhGT2tW?=
 =?utf-8?B?NWhyVE94ZGhrQm5XYTYyTEEwWCtkelZxSWdkaENnaWZzVW5MdThZdXJranMr?=
 =?utf-8?B?S3REV1JvS0xVdU9MWi9hMThrc2Fnb1Y4UzA5QjBBSDZXb2pWMjFyTy9WU0Jm?=
 =?utf-8?B?c1BFanI5bWFlemJHTmpLSW1UMGNFRURFcjZ4QjRSbGJwQ0h0S0RZRTRRZXc1?=
 =?utf-8?B?K09yV1ZBZE1OUmZFRHFRYmYzQTJINzB4aEUyOGRzRURmNW40MG1IZ2xaMUVi?=
 =?utf-8?B?V01wK0NhemRzNTEyUG84a0hha3g4RWdrYlFic0R5TG9zUmlubXRPejlVSUxQ?=
 =?utf-8?B?VkxFM2d6N00yNGhyUzJtclp2VUcxNGFJRTRQTTNwWlNUY3p6RG80bnRTS0Zi?=
 =?utf-8?B?aG9ZTU5wc2xGUkZOYys0Um9EWDExMWJ6VUZSSFkzTndvM2MxeEhGUDBmczhU?=
 =?utf-8?B?ampCdXB5ZEhWblRBMFdFajJKRmZhNlFpajVYTmdtckpoVzZhMUZhbExDWWRr?=
 =?utf-8?B?eENOejJDUFZKNU5rVEYvOUV1NzNVeExONVVpNm1LeUNSZ0ZiYXFKazRMaDBp?=
 =?utf-8?B?NmdGRkNGVVMzN2M5RFliZ1JXSlU2R1FNSERqOHA1b2kzZnpHUm5EeXp3aWlY?=
 =?utf-8?B?MlZ2eVF0ajVJajlhc2JQeFJkbjhOaTJxZFB4OXRGUkNPeG16Z004N1RKdERW?=
 =?utf-8?B?K0ZpMzlkc2xRM0w1WHI3TmZxQzFVeU9lMWMyS2FYQmQ2NkNMN0M1L3lhb3ZF?=
 =?utf-8?B?dFg5c3d1bGRhdmpWSGV5UlZ6NjcrcEp1UXQ0bDlYNDloUnlKeFdpK2Npdjgr?=
 =?utf-8?B?T2Z5QTk2RXdUMnJoQ2tMZlQ1b015bGlKVVFGVUtvajFZSFZKS0VzN0xCSkx0?=
 =?utf-8?B?UTUwaTJKSWxRV3RrMC80dlp5VG16K3d2NDhaelYxM1pBOFcvN21rekkvUWVs?=
 =?utf-8?B?b2ZESWJBR0dPOUl1bjFxUFBESFMyd2tkdFJPK0J5SUtyOUI1K0VDYzhGMDgv?=
 =?utf-8?B?aC9qZGNRZTRxcUZzY0hiMml0RGZYQXBvRmthUFhVaG1UT2VyQzZzMzhyNzhp?=
 =?utf-8?B?NGl4L2xVUzA5V3lWUWFlNWVnY2tWU0g3S0JEdDJDdWM1clZLczVSS0VKRFVJ?=
 =?utf-8?B?MXZzODJoMHBGSTltN1lleUNNZzREcTJjYmpObk5YUEcxRVBVYlc2ME5lVHZs?=
 =?utf-8?B?T01MZHpJRkNnWUc1dWV4eFBwQmJxa2NuaXpLVWJBRDJWbnVjbzRRQ1dYV1o0?=
 =?utf-8?B?dG5VNG9IMlpxeUx4a2ZFRzZ6SFhYSG9pUXJDZEZENjZBN3krWExlTFpqazY0?=
 =?utf-8?Q?lBhxb47A1I4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHpUL1Q3OHZ2YWtOdDVPNDJNUk9TRE51UUVzNk5wRWlvN05waTVjRWFCOWNN?=
 =?utf-8?B?Q1ZtU2JlY2RpRmdITkJrRXNpL01tSVBSdnZWb29JMVpTUU1jT0VnUzdnQXRu?=
 =?utf-8?B?Tm16ZlBscXJZY2NlZ3ZxNU5ETnprTmNuWkVZT1VHQTcrWUEwVWFZazAvUmNt?=
 =?utf-8?B?THhKQmgvODUxM2dOOUZJR1UvTFVDMHRuTy9SMG9WL0ZJOG9EVUlSTjFiWVBh?=
 =?utf-8?B?QVpmK2xxZ2NtczIreExJWEVhTksyd1Q5Z2JSNnVmUi9yQk5SWThqeEhpTGpr?=
 =?utf-8?B?ZjlveklSVkNSUFNTd012NE1GL01DZTVqUjM0WUFIa3RYYVpzcHlMOEFFeUlM?=
 =?utf-8?B?b1BjeGR5NUNJUm11bTlrU3owZ1oybUVkTTFsOHYyV3hQVnBkUS83b09vU1ZU?=
 =?utf-8?B?SytVamhoNHUvSkxXcWJJOFI1YXVXeXhEaVdpclRWQTFUVStqNmh0QzZnR2k1?=
 =?utf-8?B?Z21MY1MxY1ErbTU3ZW1tVVQ0bktuQXJEZ3VScS9DV0Y4Y0dOazdsNVRBNGs4?=
 =?utf-8?B?cklubzE1R1pxTFhwTG1TWDBDNGQ5RW5hNURkcVc5RmtuVWZHNUtuNkFpaUhQ?=
 =?utf-8?B?Z0hQcmI0WElyZ3J0MU11YnZmNWxrd0NWRXpCalc5V1Yzci9MKzVaeUZ2TS9N?=
 =?utf-8?B?ck9WZFRkZncvSXNNRjNZTGVmSjVDaTlBMklNMGNtMkVMSkhDUnFyYlVNUmtF?=
 =?utf-8?B?bUVpenArZEMrY0kyd1BpRmRzN1ZGSXVPVlVVNUg3aVc1M3RhWVh0RnJHVkxU?=
 =?utf-8?B?cHFtUjdmTnZzQ2IzMmNLTENSMTNjOHJ4VFhEYlB2cVJPMEY1OU5DUXhyNnVZ?=
 =?utf-8?B?SXYyVVJKRXB4d2JueHlYRlhQMExqclRPcjhjUXhwUjFTWVp1NFo2b2x1RStN?=
 =?utf-8?B?UXdiS2lHL3g3TjhZMWNxTTBwTzFHb1R4OXBxL2JvRjhjTXo0WkJ2NlpPR0ZQ?=
 =?utf-8?B?Y25xUjdzVloxdWZQSG5rZjY2OEd5ZXpDU3R4b3doSkFxUXRLdHUxeGwvbUtG?=
 =?utf-8?B?MGVaRURSNkJVZy8yYmsxQXp5MVJSMU1mWDAzNS9jcndXZFVSWEZLeEdvY3d1?=
 =?utf-8?B?bFBUY2FJd3ZpblRhekNTUGpRL1huYTFqazJBa3BrYVRCb3A2TjJQUHErWE9O?=
 =?utf-8?B?bk92cEpKTUpYeEVrbng1YVgwWVdIcjdwek42UG5qTHV0aG9tWWJtbmJ3YVFG?=
 =?utf-8?B?Zm96K2xIU3N0Q1ZHYTFFdEJFOC8zQlVPcGpodHVRT041clFsVWJtM2JVL3Vu?=
 =?utf-8?B?K1ZrOFBvWUE4dE1MelJqdEpMNHFtQVlMOGV2NFpSRUdvRDlpRjJBQ08ySUFZ?=
 =?utf-8?B?WWZvNHdPcVBKbUJueTRqWmZXODZEWWFYTW1ZVEtQSVZWTTQ1NktFM2ZJdjZy?=
 =?utf-8?B?M013eUxUc3ZkZ0s2RHJUbE5wZ256NkY2UmJiWitvU3AvdFN6ZGozTHNoaHdz?=
 =?utf-8?B?dldGK3FTOGs2WGN4aVJYdUx1R2dmMHZEaSttTVZPZDlIeVgzS1VWK0I1WUhP?=
 =?utf-8?B?T09leTFOSkFPQjUrK3Y5TG1VckhZSmJUTDRxUUlLVEIrUmpUNTdROWVOY09R?=
 =?utf-8?B?dUl6c2xOOE9GejZQVldRbHBnU25LM2ZVSW5BS0NvWjQ0dUdVME82bHE0VVVS?=
 =?utf-8?B?OEVHS2haeWdmQk53Vy9qd2UzSVRJeXk2QzA5WG5jdmV1ZmlGem9yWHg1U1dG?=
 =?utf-8?B?eFhsWEtFV09iM1NPS0p2TDFhbW05aE1IcFB2VlczcHNjNURWbllwNzhDM080?=
 =?utf-8?B?SzN6NlcvN2xucmxVUTVMM2c0ekF1bnZjQW1iSW5TcUNRendRZEhSdlIyZVVq?=
 =?utf-8?B?ZE5MYnhDb3NRbjF5Ulgrc05EekxjQmwxQ1Rsc1d6alJ5UkZrbzBJVlNDdmx1?=
 =?utf-8?B?cUp4ODRUQU80NnN4Uk1TOWNYQzhTcW1LakdVb3U3VDdIenJtK0s2S2d5QmEz?=
 =?utf-8?B?RWNJRDJrbUpJWjdGRVhsUEw4OFNZUCtqNzVTUzlBTXNNQkM1OGt2T0NUZ0Vz?=
 =?utf-8?B?d3BwSTBXekYvYmtrbkc5R01EZGlXa3MzK3FEaEFSdWtBUUFrRlVSRXpTcXdM?=
 =?utf-8?B?akg2d0IvdmQrUTZoZnZncUtQNmNndlhRRG9EUmh2aFBhdE43aVlmeXN6YWZz?=
 =?utf-8?Q?9FiVqMb/MlYqjRTgAQSPySt7K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1759e712-1a2e-4a5d-216a-08dd261d9dcd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 02:24:40.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnGCP8BETah3rkfkryDyZpDyGqGm41aQJvSmAkZXBmi5NgC7SOvfv0PMlphqSGObFaOXP05mOoTEu3UFoO/GsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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


On 2024/12/22 9:59, Demi Marie Obenour wrote:
> On 12/20/24 10:35 AM, Simona Vetter wrote:
>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>
>>> A virtio-gpu userptr is based on HMM notifier.
>>> Used for let host access guest userspace memory and
>>> notice the change of userspace memory.
>>> This series patches are in very beginning state,
>>> User space are pinned currently to ensure the host
>>> device memory operations are correct.
>>> The free and unmap operations for userspace can be
>>> handled by MMU notifier this is a simple and basice
>>> SVM feature for this series patches.
>>> The physical PFNS update operations is splited into
>>> two OPs in here. The evicted memories won't be used
>>> anymore but remap into host again to achieve same
>>> effect with hmm_rang_fault.
>>
>> So in my opinion there are two ways to implement userptr that make sense:
>>
>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>    notifier
>>
>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>    page references or page pins at all, for full SVM integration. This
>>    should use hmm_range_fault ideally, since that's the version that
>>    doesn't ever grab any page reference pins.
>>
>> All the in-between variants are imo really bad hacks, whether they hold a
>> page reference or a temporary page pin (which seems to be what you're
>> doing here). In much older kernels there was some justification for them,
>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>> now all sorted out. So there's really only fully pinned, or true svm left
>> as clean design choices imo.
>>
>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>> you?
> 
> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
> in complexity that pinning everything avoids.  Furthermore, this avoids the
> host having to take action in response to guest memory reclaim requests.
> This avoids additional complexity (and thus attack surface) on the host side.
> Furthermore, since this is for ROCm and not for graphics, I am less concerned
> about supporting systems that require swappable GPU VRAM.

Hi Sima and Demi,

I totally agree the flag FOLL_LONGTERM is needed, I will add it in next 
version.

And for the first pin variants implementation, the MMU notifier is also 
needed I think.Cause the userptr feature in UMD generally used like 
this: the registering of userptr always is explicitly invoked by user 
code like "registerMemoryToGPU(userptrAddr, ...)", but for the userptr 
release/free, there is no explicit API for it, at least in hsakmt/KFD 
stack. User just need call system call "free(userptrAddr)", then kernel 
driver will release the userptr by MMU notifier callback.Virtio-GPU has 
no other way to know if user has been free the userptr except for MMU 
notifior.And in UMD theres is no way to get the free() operation is 
invoked by user.The only way is use MMU notifier in virtio-GPU driver 
and free the corresponding data in host by some virtio CMDs as far as I 
can see.

And for the second way that is use hmm_range_fault, there is a 
predictable issues as far as I can see, at least in hsakmt/KFD stack. 
That is the memory may migrate when GPU/device is working. In bare 
metal, when memory is migrating KFD driver will pause the compute work 
of the device in mmap_wirte_lock then use hmm_range_fault to remap the 
migrated/evicted memories to GPU then restore the compute work of device 
to ensure the correction of the data. But in virtio-GPU driver the 
migration happen in guest kernel, the evict mmu notifier callback 
happens in guest, a virtio CMD can be used for notify host but as lack 
of mmap_write_lock protection in host kernel, host will hold invalid 
data for a short period of time, this may lead to some issues. And it is 
hard to fix as far as I can see.

I will extract some APIs into helper according to your request, and I 
will refactor the whole userptr implementation, use some callbacks in 
page getting path, let the pin method and hmm_range_fault can be choiced
in this series patches.

Regards,
Honglei

