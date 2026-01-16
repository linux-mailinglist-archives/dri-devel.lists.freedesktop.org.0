Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181DD2F98A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CBE10E857;
	Fri, 16 Jan 2026 10:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J5T3c23T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70B10E857
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMT4o9qLBzJXvVDipjII8+pFUju27nMLXH74oAq9AZZHgiJ6/PjxPV3GT388HjqNZskMyxJOyVtjYoCqpB9xGboO0TJCiIXb8IQcJo3XImw1do2DYPHcMfVbg2Ku7/TJom7Erp9V7bVExgoCRFz+NnvPzWQlfuvgcJ/xRtBeiU36qyT2SU4Bab9udf17b1TlWOgMCQAeSlHucA21UDJHlZiRJ9ynpw91fY9F6sd7cqyz4p6EkDsnI+Vh5LhxKk16tjmo6YZ+tog56cmFZOmg3VT0n3ZQ33BNc23FPjTeRNrNJDoKzt958mtMz+Kf73PgUob181thLJjHPO3KvIKbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z8DRcE14Kvx3CVmda2AsThc/Mlzua3DvnHDOLdSPg0=;
 b=RuLnmqLVSFeDNWzPkkBKyT855zIJdPBsPAlOLrhnYLy9VecPTHbOMmTtAxW3DzwYI+9yg0aCkMJ1NNIohTzf/bndiRwHJg421aAQI8Zg56k0izNcbXWcsLEw6n+DmN3CNWEQjlifobsX+wbNgQYw6EHGecozKeeU1BWDuCQ4r2ktviuIqE+nhsEEDeXr7aV4hgYv9+OZKSkLjBsrPipFgFoidEsD2NxrSQp5mfOb6eYetpeS/L84boy0WldkQFYIfD8r6+BO/nlDle8SOi28Cw/V8ksA4rFLef+6iqiek4lGEYAHzOiBIGpcBz/Pa16capFuUAAIRU94puuOEu+3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z8DRcE14Kvx3CVmda2AsThc/Mlzua3DvnHDOLdSPg0=;
 b=J5T3c23Tf48gkJTkLbzIB8ule1lG9cZOxz0hPHqnWBf2knZK6xjAefoN88+UqzHSXRHqW3g2H9E3jkpRCj0Fvg7sN2HPvPLJDoq9I8WMD/MohvwWweKbxe/Dh4rlS9r3LRJY3Ja29vwVqChVgAGBlzo3SucUV4TJMx3G9wcbiRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Fri, 16 Jan
 2026 10:32:48 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:32:48 +0000
Message-ID: <17a563f0-14ad-49bf-a734-648615b822fc@amd.com>
Date: Fri, 16 Jan 2026 18:32:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Ray.Huang@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
 <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
 <2ae03f22-740d-4a48-b5f3-114eef92fb29@amd.com>
 <cc444faa-af80-4bab-ac3b-a013fef4a695@rsg.ci.i.u-tokyo.ac.jp>
 <4aff513b-eb38-494d-a4f8-78dbc18d0062@amd.com>
 <9874a952-e084-4594-a397-cb4fbe5cc3b7@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <9874a952-e084-4594-a397-cb4fbe5cc3b7@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::32) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|SJ1PR12MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aef696a-6c1c-4ab3-6818-08de54ea97dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm1KV21yL3lVZjhIKyttczdsSTlZRldkZmdidXh1cEFIWXRaSitsc0hXcDB1?=
 =?utf-8?B?aXV5dGxMZCtFZjYwUmE4R3ltWHIzb0d5d2d1UlAzQkJPVkZXYXUxcnhxcWN6?=
 =?utf-8?B?aVRvbmg5M0pZVG1vTFFnVi8vZEZLOEduY0xGbDFHTitmSy9BbmhIN1V6T1Ez?=
 =?utf-8?B?KzlWN21naTVXYWZqSzM3YTRlays2WVZjNUU5dWwxL0hMcm5OZ3h3SEJhcFpL?=
 =?utf-8?B?MDJDcXNzbldyQTNoNzNhcUhySlBYRG5uaXBxNmIzVEdaY2VlMjkyaHBpeU9K?=
 =?utf-8?B?MlJ4TExJSWQvVzh6Y0M2UWYzcXErN0k4UVdseHhOLzNzYmF6RVV6T2NqSHBJ?=
 =?utf-8?B?cy83c2ZMeXBndUZGbmRDWVVUTHc4emFWanlMNWFhcmJJdWxTMVY1cmNQekRT?=
 =?utf-8?B?UFlpOWZsUlRydmU3V2JrVlV5RThKcUJyVmsyTjhGRkVzOTI0VjRFN1lkZXh4?=
 =?utf-8?B?N3o4TCtzUlI5N0hkaTJXaFV5Y216QnJkVUxFSmIvOWhnU3ZzZTU0c3Z0emcv?=
 =?utf-8?B?OXJSYlNIcGxSTFpsM1E0QVdtVGdCMHpFK0hWb2RFVHhHaHZHT3RiYVRLeStH?=
 =?utf-8?B?RE96VTF5WWE1bkFja2QxRkJKWmwzMXJQWE1Ud0tEM2VYazZyUDhwR09zdXNN?=
 =?utf-8?B?Q2ZhVCtHdFBKaDAvZkZmK2xTVWY0enNIRy9CTVVnbzIwL21iUzlJdlFXWkd1?=
 =?utf-8?B?djBOVWRYWlU0N0N1SVFQR1h4Y2FTNE52OEVWdUVVK0dtZVZ0MC82UktrN205?=
 =?utf-8?B?c2l2RjE5VjAvdTRCREN4WklnVkViemh2YjN5Z0lSUnBwOWFCWVBvY0ZLTzZC?=
 =?utf-8?B?cGpLaTJIS2ZpbUFRczlPRlRqcHZ5WUdwMHlpdldOSVVRM1BwYUZjQTl1WW9G?=
 =?utf-8?B?VTMybnh4eDF5Umd6QVdQWTg3YUh6VzduVDQyWjIzYzlEY1V5RC9qMEszTTNX?=
 =?utf-8?B?eFFENXJoakdHU2MxdFp0UHRLZjBpTzJlZGcrNFI0b3NJL09GdUVqaGRXRlZJ?=
 =?utf-8?B?L1lES2k1Q3JVaENBTElrMmhBUlJiMlBJSGlUOWVzd25ONVB4VjV3cG1ITlBu?=
 =?utf-8?B?ZkpWUG9jSjZnN2Z0bDVQTUlXQzZTUmI0QXp4RkljMXZWTXFRbTFWdlNPbjVK?=
 =?utf-8?B?TGQ2cEFCQUhhbTE1RGxrcWhNZmxuaTVVSEFuT3NkNTkxeFpMRW1NTjkwUjdh?=
 =?utf-8?B?MEM2anhUbUtVR0gxWitxRUI2MmpPVWg3MDhwS2RlWUM5ME4vMUpSMUNDZXdG?=
 =?utf-8?B?RkJ6bnpGckRFbUpCeWUvSm4yN0JsRk0wQ3F5NUN3SmY4N05EVWpCOG16aXBh?=
 =?utf-8?B?V1lXT0xkeGVwWHE2akN4RmdBTnJRcHNOVFNoUTVybFpYVm0yVFRHWnA1bi82?=
 =?utf-8?B?RTZnQko5MEhKZERaVTM0L0tKNlA3SE1RUEVTbXpyWkkrbjhOUERQbzRLQnVn?=
 =?utf-8?B?NDdVc0UzeHJ4ZFZLb2dGTXRTUkpXTmNvZy9wdVpVUUpnSnVCck9TSVFLcU9N?=
 =?utf-8?B?dm95aHB0MDRwU1BER2dWM2lLQzE5UGg2bVdBQWtpZVpLbm5qSlVCUkdhM3Bh?=
 =?utf-8?B?dnQrblMvaTh0RHhVNjZ5YURpd2lxUzk1bndyZHVwdkFqYzl5RWVlSFlWcEVs?=
 =?utf-8?B?UjFrbEdyN1JndnBnejFTd2h1bVV1ck4rUHZoemdXNmQwVjV1djN6ZWNCQzZl?=
 =?utf-8?B?L2NTc1lkZWZxb2lnb2ovOXRSTlYyUEdyZW5MZ1lYVGhGMDlTWDVkSWJKRlhB?=
 =?utf-8?B?dW1MT0doMkloL29XZ294TWt2QWRYYXBQK2hHWnROeWtVZFlDMVdDNXN5UGJY?=
 =?utf-8?B?V2lNYWwzL3ppR0g2M20wM1JWaitrQzVrRUdjMlJxSlNsSnFJd1V6T3FIdVhi?=
 =?utf-8?B?c3dpbkRKd3RaUlBXYlhVVzJEWDR6ak9udUozWWt2ZGdGOUREb0JBSW1PNk5O?=
 =?utf-8?B?STVmNzU5MXFSQUJZUnZkNmtQSG9tdnNWUDJxUzVxUTNvbzlZNW1JMnQ3a3Ay?=
 =?utf-8?B?bHZEYTcwbVFzT2NibjBzWk1yclh1dFljSDYxWW9vRXlGOFhPdjdCdXp5QXpp?=
 =?utf-8?B?a1lsSGx3RGd5ZlBRTnVVK211L1hBc2I3OE4rUTNNUTg4VU1Fc1hIdTl2MVV2?=
 =?utf-8?Q?ds7TRjdpy1wm3vdLfFgh6AmO9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhGRTdFcWw0TWFCTlo3Rkl1d1lvcTBYVTM2K1FhOTdZUlVRU3l2QzgyOWla?=
 =?utf-8?B?M2U5QXMzaTYxMFUraDBTazhLdDZBSmg1THNuMWo0RzFybExNZVE5YXJkZlpT?=
 =?utf-8?B?aGFHRStLZjRjTjRYNnRka3ZoQ1Z5TE9tZkNuaUhJWTdnZCtmYkJ5bUY4aHFW?=
 =?utf-8?B?QXJWWno5eTcvbEpDNmJCNVJxcDNhNEd2UUM3a1VCbUtYVEtvTVI5U2RkNmtO?=
 =?utf-8?B?SEdUc3BrNE9NRXFaaXlEWEJKUlgyMWhSVEE1U1J3RDNKS3BaQ3J3aXJxYnBo?=
 =?utf-8?B?dDVMeEhzdnQ5TlQ4dWVoNUVNMUdTTlY5amlPemRDYUtnSnZkU0oyK0tjcXpL?=
 =?utf-8?B?ZFhJTWRYNDBJRDdHNk1zbVFhVVQrLy84Y0ZUZlI3VENUQ01lcG1kS1BYN2NF?=
 =?utf-8?B?V3lDRGs4WGFCVnJuYTllVVRnajM1QUllSEEwNTNxbUlVNlJhaG9LZDNMVGFW?=
 =?utf-8?B?YnplU3YrM2J1Y1RRWDZXRklwTEE3V2Rsa3AwaC8xcThwMUJvZm01bkJQQ3Ba?=
 =?utf-8?B?NW9raWE1QWtwS09MeHRiQ0xRUlRLUmFuTXp2YW1mV2ZOaEVFbzlBQmN2R1VE?=
 =?utf-8?B?aWx3aUdPTUR3VkVyTnBnUVg0RWhueDJRMlRKbmRITjdSakI4ZkllSTBVT0Vv?=
 =?utf-8?B?cHZ1ckFqbWc3NkFtUlZtK05ibjFvZjNlZEJGNXNDNTh3aEhSRUFMWk5GU2xU?=
 =?utf-8?B?d1BHby82cm4xRkhQd0xrRjFxcG8xK05SakpqbDJuZ203OEhMNDRjeHJYb05X?=
 =?utf-8?B?VTUzRkdrVjZldTRQaE9JSjVPdU9mSWRJcUwrM0VBdDZuZDNORFh1MWhOUHpu?=
 =?utf-8?B?RnhCamtPcXhTZDNDT0kwcWFPK2hCQ2dpMmE1WDgvYnh0MGI4UUVHSnFhOWlh?=
 =?utf-8?B?NlZIN1R3WTYxZ0VDZU1NVmtXOXhSYmJYTW5maWZ0UzdSZ2prT0plbVZKSExT?=
 =?utf-8?B?YXQrWEozWkZtMUR0eXZSbzNNRlpDdWpuRUJVYXZXdWRqVDlzYXhlc0dJK2NJ?=
 =?utf-8?B?QVlTcU1ha2FTbTQ4cG1lbXpoNW1HZlBxQlRSYk12dGlxeHNXb2p5Tk1xdHNR?=
 =?utf-8?B?Nkp1ZHdZU2Z0M3NjeDhvbGU4VEcwaUVPQVlzTUsrOFVQYmJ3TVNISXNiRGdj?=
 =?utf-8?B?cEhNLzRwQ1psSUZNWEhqSklxNm1mODFoL2puUTBaSHVaRWVKQXhpUXJoMVl3?=
 =?utf-8?B?aDZTckFLaTRQUW9BSlBkamNtZk5sdU1nMFZjMVdlc0dYa2sxdEoyMmM5U21j?=
 =?utf-8?B?aktGNWZBQzIzU3pMd0hLSHZvN3laUkhBZ1ZKYzBKRUo2eUorRzJYVGpqY3hN?=
 =?utf-8?B?SHZlMTdPbjlEK05NRGpKQzNXbUF4NTl1Ni9NQ0xOOGU2ZEdsOElLOW9FSlFj?=
 =?utf-8?B?a2REdUJSQ2k1VUVScVI1aFRHdFRnL0RmT3VpRHFqQi8wbFBLK3loMnFOSzc0?=
 =?utf-8?B?RHJNS0tWb0E3MnlkZ01sNi83YkQrKytIK29OVngrajV5TGlBWmtzQlppSTM3?=
 =?utf-8?B?SmVrWkNkYmJHOVYxTzJpM09YWlY3SVd4eFlvSmRVcU1HOTI5TG5lOXNXcjhD?=
 =?utf-8?B?MGNNN0FBNVlTNEIvWGZwRnFMbWpMRXF1WEsydVhIcnp4Q0MwR0k5d2Y2ODRO?=
 =?utf-8?B?Slp0VjVwbWF2clNvRGJsMEN0Q25ZNEJHZnF1NzgrT0padTNqckJubzI3S0Rp?=
 =?utf-8?B?TEx1VHl6V0I2cTRMVEZaRmxWcEtrbTFDQW5CU0VZMW01UkRERXd2U3c4enpr?=
 =?utf-8?B?WXlKbDRjUUZVeG81Qk02TmgrcHJYeW9FVXAwTDg5cVBVd2Nic01Nall3YnJC?=
 =?utf-8?B?Tzc1a1kyaUp1WTVaQSthOFlZcXJXWGt4UXVTdzByR2t5R3l2ekx3Q0ZIbzEw?=
 =?utf-8?B?aTFGeW5vaE5qT1V1TFJEL2tQdDJMQUZXRFNtQ25QQy9KTWdiTURQSnJGczVK?=
 =?utf-8?B?TUZZeGxIUlVjNFNaVkdqOTJkRkR0SmhLZ1pCT1ZDb2JyRDhqbE92QVBza3pM?=
 =?utf-8?B?MHVLOHBGSHdQd0pra3pwWGNHbndqRnVwTTBFbTc1MzJjU29YVjl0VWNZNmtW?=
 =?utf-8?B?WnZ6dmV2NjA5Rms2UldadkFSdmdYVzBRMkpPVE8yd1lIK2plOERVeTdJcFFU?=
 =?utf-8?B?WkRCVXRIYmpIRXFtNDl4RlBvbE5wVDk4enEwRWp1TlR6VGppZzdOaFJ6NGsx?=
 =?utf-8?B?Q3l6VzJaNDhQSW1GVWZ3eGYvNFJUUXRjMzVrVmZsZW54RjljeWM0WU1MSDdr?=
 =?utf-8?B?bEpGcStrSXkwcTJsRDNjTDJlVk5FcjF5eVFzS3YyT1IreDcrNmhOMGduczNk?=
 =?utf-8?Q?136FdHYnhW7L9cBPp5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aef696a-6c1c-4ab3-6818-08de54ea97dd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:32:48.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wb90Tc8KOdBQv/t9y2udXd7MT8GTn2LaxvLOtED/hxU6eesmaR71lzETxGciBCTfIHTrsHwnITxWDoDjoE8eNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338
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



On 2026/1/16 18:01, Akihiko Odaki wrote:
> On 2026/01/16 18:39, Honglei Huang wrote:
>>
>>
>> On 2026/1/16 16:54, Akihiko Odaki wrote:
>>> On 2026/01/16 16:20, Honglei Huang wrote:
>>>>
>>>>
>>>> On 2026/1/15 17:20, Akihiko Odaki wrote:
>>>>> On 2026/01/15 16:58, Honglei Huang wrote:
>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> This series adds virtio-gpu userptr support to enable ROCm native
>>>>>> context for compute workloads. The userptr feature allows the host to
>>>>>> directly access guest userspace memory without memcpy overhead, 
>>>>>> which is
>>>>>> essential for GPU compute performance.
>>>>>>
>>>>>> The userptr implementation provides buffer-based zero-copy memory 
>>>>>> access.
>>>>>> This approach pins guest userspace pages and exposes them to the host
>>>>>> via scatter-gather tables, enabling efficient compute operations.
>>>>>
>>>>> This description looks identical with what 
>>>>> VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
>>>>> explanation how it makes difference.
>>>>>
>>>>> I have already pointed out this when reviewing the QEMU patches[1], 
>>>>> but I note that here too, since QEMU is just a middleman and this 
>>>>> matter is better discussed by Linux and virglrenderer developers.
>>>>>
>>>>> [1] https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69- 
>>>>> d213f52c771a@amd.com/
>>>>>
>>>>
>>>> Thanks for raising this important point about the distinction between
>>>> VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.
>>>> I might not have explained it clearly previously.
>>>>
>>>> The key difference is memory ownership and lifecycle:
>>>>
>>>> BLOB_MEM_HOST3D_GUEST:
>>>>    - Kernel allocates memory (drm_gem_shmem_create)
>>>>    - Userspace accesses via mmap(GEM_BO)
>>>>    - Use case: Graphics resources (Vulkan/OpenGL)
>>>>
>>>> BLOB_FLAG_USE_USERPTR:
>>>>    - Userspace pre-allocates memory (malloc/mmap)
>>>
>>> "Kernel allocates memory" and "userspace pre-allocates memory" is a 
>>> bit ambiguous phrasing. Either way, the userspace requests the kernel 
>>> to map memory with a system call, brk() or mmap().
>>
>> They are different:
>> BLOB_MEM_HOST3D_GUEST (kernel-managed pages):
>>    - Allocated via drm_gem_shmem_create() as GFP_KERNEL pages
>>    - Kernel guarantees pages won't swap or migrate while GEM object 
>> exists
>>    - Physical addresses remain stable → safe for DMA
>>
>> BLOB_FLAG_USE_USERPTR (userspace pages):
>>    - From regular malloc/mmap - subject to MM policies
>>    - Can be swapped, migrated, or compacted by kernel
>>    - Requires FOLL_LONGTERM pinning to make DMA-safe
>>
>> The device must treat them differently. Kernel-managed pages have 
>> stable physical
>> addresses. Userspace pages need explicit pinning and the device must 
>> be prepared
>> for potential invalidation.
>>
>> This is why all compute drivers (amdgpu, i915, nouveau) implement 
>> userptr - to
>> make arbitrary userspace allocations DMA-accessible while respecting 
>> their different
>> page mobility characteristics.
>> And the drm already has a better frame work for it: SVM, and this 
>> verions is a super simplified verion.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> tree/ drivers/gpu/drm/ 
>> drm_gpusvm.c#:~:text=*%20GPU%20Shared%20Virtual%20Memory%20(GPU%20SVM)%20layer%20for%20the%20Direct%20Rendering%20Manager%20(DRM)
> 
> I referred to phrasing "kernel allocates" vs "userspace allocates". 
> Using GFP_KERNEL, swapping, migrating, or pinning is all what the kernel 
> does.

I am talking about the virtio gpu driver side, the virtio gpu driver 
need handle those two type memory differently.

> 
>>
>>
>>>
>>>>    - Kernel only get existing pages
>>>>    - Use case: Compute workloads (ROCm/CUDA) with large datasets, like
>>>> GPU needs load a big model file 10G+, UMD mmap the fd file, then 
>>>> give the mmap ptr into userspace then driver do not need a another 
>>>> copy.
>>>> But if the shmem is used, the userspace needs copy the file data 
>>>> into a shmem mmap ptr there is a copy overhead.
>>>>
>>>> Userptr:
>>>>
>>>> file -> open/mmap -> userspace ptr -> driver
>>>>
>>>> shmem:
>>>>
>>>> user alloc shmem ──→ mmap shmem ──→ shmem userspace ptr -> driver
>>>>                                                ↑
>>>>                                                │ copy
>>>>                                                │
>>>> file ──→ open/mmap ──→ file userptr ──────────┘
>>>>
>>>>
>>>> For compute workloads, this matters significantly:
>>>>    Without userptr: malloc(8GB) → alloc GEM BO → memcpy 8GB → 
>>>> compute → memcpy 8GB back
>>>>    With userptr:    malloc(8GB) → create userptr BO → compute (zero- 
>>>> copy)
>>>
>>> Why don't you alloc GEM BO first and read the file into there?
>>
>> Because that defeats the purpose of zero-copy.
>>
>> With GEM-BO-first (what you suggest):
>>
>> void *gembo = virtgpu_gem_create(10GB);     // Allocate GEM buffer
>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>> memcpy(gembo, model, 10GB);                 // Copy 10GB - NOT zero-copy
>> munmap(model, 10GB);
>> gpu_compute(gembo);
>>
>> Result: 10GB copy overhead + double memory usage during copy.
> 
> How about:
> 
> void *gembo = virtgpu_gem_create(10GB);
> read(model_file_fd, gembo, 10GB);

I believe there is still memory copy in read operation
model_file_fd -> gembo, they have different physical pages,
but the userptr/SVM feature will access the model_file_fd physical pages 
directly.


> 
> Result: zero-copy + simpler code.
> 
>>
>> With userptr (zero-copy):
>>
>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>> hsa_memory_register(model, 10GB);           // Pin pages, create 
>> userptr BO
>> gpu_compute(model);                         // GPU reads directly from 
>> file pages
>>
>>
>>>
>>>>
>>>> The explicit flag serves three purposes:
>>>>
>>>> 1. Although both send scatter-gather entries to host. The flag makes 
>>>> the intent unambiguous.
>>>
>>> Why will the host care?
>>
>> The flag tells host this is a userptr, host side need handle it 
>> specially.
> 
> Please provide the concrete requirement. What is the special handling 
> the host side needs to perform?

Every hardware has it own special API to handle userptr, for amdgpu ROCm
it is hsaKmtRegisterMemoryWithFlags.

> 
>>
>>
>>>
>>>>
>>>> 2. Ensures consistency between flag and userptr address field.
>>>
>>> Addresses are represented with the nr_entries and following struct 
>>> virtio_gpu_mem_entry entries, whenever 
>>> VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB or 
>>> VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING is used. Having a special flag 
>>> introduces inconsistency.
>>
>> For this part I am talking about the virito gpu guest UMD side, in 
>> blob create io ctrl we need this flag to
>> check the userptr address and is it a read-only attribute:
>>      if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_USERPTR) {
>>          if (!rc_blob->userptr)
>>              return -EINVAL;
>>      } else {
>>          if (rc_blob->userptr)
>>              return -EINVAL;
>>
>>          if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
>>              return -EINVAL;
>>      }
> 
> I see. That shows VIRTGPU_BLOB_FLAG_USE_USERPTR is necessary for the ioctl.
> 
>>
>>>
>>>>
>>>> 3. Future HMM support: There is a plan to upgrade userptr 
>>>> implementation to use Heterogeneous Memory Management for better GPU 
>>>> coherency and dynamic page migration. The flag provides a clean path 
>>>> to future upgrade.
>>>
>>> How will the upgrade path with the flag and the one without the flag 
>>> look like, and in what aspect the upgrade path with the flag is 
>>> "cleaner"?
>>
>> As I mentioned above the userptr handling is different with shmem/GEM BO.
> 
> All the above describes the guest-internal behavior. What about the 
> interaction between the guest and host? How will virtio as a guest-host 
> interface having VIRTIO_GPU_BLOB_FLAG_USE_USERPTR ease future upgrade?

It depends on how we implement it, the current version is the simplest 
implementation, similar to the implementation in Intel's i915.
If virtio side needs HMM to implement a SVM type userptr feature
I think VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is must needed, stack needs to 
know if it is a userptr resource, and to perform advanced operations 
such as updating page tables, splitting BOs, etc.

> 
>>
>>>
>>>>
>>>> I understand the concern about API complexity. I'll defer to the 
>>>> virtio- gpu maintainers for the final decision on whether this 
>>>> design is acceptable or if they prefer an alternative approach.
>>>
>>> It is fine to have API complexity. The problem here is the lack of 
>>> clear motivation and documentation.
>>>
>>> Another way to put this is: how will you explain the flag in the 
>>> virtio specification? It should say "the driver MAY/SHOULD/MUST do 
>>> something" and/or "the device MAY/SHOULD/MUST do something", and then 
>>> Linux and virglrenderer can implement the flag accordingly.
>>
>> you're absolutely right that the specification should
>> be written in proper virtio spec language. The draft should be:
>>
>> VIRTIO_GPU_BLOB_FLAG_USE_USERPTR:
>>
>> Linux virtio driver requirements:
>> - MUST set userptr to valid guest userspace VA in 
>> drm_virtgpu_resource_create_blob
>> - SHOULD keep VA mapping valid until resource destruction
>> - MUST pin pages or use HMM at blob creation time
> 
> These descriptions are not for the virtio specification. The virtio 
> specification describes the interaction between the driver and device. 
> These statements describe the interaction between the guest userspace 
> and the guest kernel.
> 
>>
>> Virglrenderer requirements:
>> - must use correspoonding API for userptr resource
> 
> What is the "corresponding API"?

It may can be:
**VIRTIO_GPU_BLOB_FLAG_USE_USERPTR specification:**

Driver requirements:
- MUST populate mem_entry[] with valid guest physical addresses of 
pinned userspace pages
- MUST set blob_mem to VIRTIO_GPU_BLOB_FLAG_USE_USERPTR when using this flag
- SHOULD keep pages pinned until VIRTIO_GPU_CMD_RESOURCE_UNREF

Device requirements:
- MUST establish IOMMU mappings using the provided iovec array with 
specific API.(hsaKmtRegisterMemoryWithFlags for ROCm)



Really thanks for your comments, and I believe we need some input of
virito gpu maintainers.

VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag is a flag for how to use, and it 
doen't conflict with VIRTGPU_BLOB_MEM_HOST3D_GUEST. Just like a resource 
is used for VIRTGPU_BLOB_FLAG_USE_SHAREABLE but it can be a guest 
resource or a host resource.

If we don't have VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag, we may have some
resource conflict in host side, guest kernel can use 'userptr' param to 
identify. But in host side the 'userptr' param is lost, we only know it 
is just a guest flag resource.


> 
> Regards,
> Akihiko Odaki

