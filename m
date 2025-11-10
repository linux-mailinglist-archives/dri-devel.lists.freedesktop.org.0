Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E39C47763
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C630E10E3FA;
	Mon, 10 Nov 2025 15:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e20M9q2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBDB10E3FA;
 Mon, 10 Nov 2025 15:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1tHoiUAABE8kodMXUCeyBrphdu9vTI4PeKuHEOYBqXYcu7SpC5ZndhuT9S7eoPo/GS2+/iPxzeNH/LwREJsp0Ksg9ojE6JB0CR98ny4BJpx7VlpU2c8p46NVNODO6CPSyvBBVju+xDWwQx7XzEFD96w6VLc5l59Zc62Jk6Ob1C6F0owgj1U8zVreVmyH6p4PWMUAWecxABj3tmK47Wev3Out8GfT7/rl0UcHey7u/rd8398yziSGnHpJNqr/r60Srd4NhvG68eLGJuA5FzMU/Nk8WFP8jUslf4xCQDFSXmhUxOQzMm0yKSBCYMxTTcBaQAN/o+zGe/aPCU9ZWTfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qighp2L/6APX379gKD1ZCJt7ld6eHyNxcHDX4XIiOn8=;
 b=K/TxcvBObHR6EzPkqDVPiBdwgLfQ0PtqNotBj/qYm7e3WReJ9N4XEKmOrnhTa7m7bFgvEnlATmNpt/VLJdz1M+jF7O+p9PI4kIUcf4EvCNEdbZUd9EdWS1waPamGqmE3iAgHZip4IuBoHMfixnGTpL2sXUgRvdoq/+KjY1Fn8TwIkd26Otit06ku+iAicMikTPX+Jd1uuyehf7rucBrMm1JApm3E6TxOH0AQxhg9DbKXsym0jx2DEcvW2yUwZuJT9gimjo8nwsSo63eDc479eqN2luWEGisjKUD3TkbwfmeguIDFf2ShfTPNbANlg0gwNh7TudDhxxbCljR+jduikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qighp2L/6APX379gKD1ZCJt7ld6eHyNxcHDX4XIiOn8=;
 b=e20M9q2+RvI6IHrcs2TKy2evDK6k9McbQIEwt2onqDoF8YrckkIY31BBIJRd5YZKmIKXlXl32JeZwgFedhcgIpu65SzAKM8lc6hbbW2lwAJZVc0lczVphMCReyDrOZsb6+/rD1n4ODaKeuzjbRXK8ZoX0JpdsaN1nwBeXLTb6UCbC8+SdtcoRPO3chP2Vf+N58nXAwXWzAdJiMvsqd6l+JUJZ4vx9M1OEMEaxBVPqzr0W3kl3Khxsag9CBRdAdBVCm38Ft000y2BP548/7Mtvcw9VIBH0ERt+TOUc7iEa3wQcPuKMEQsVbBigt8fA7gh9dQFpxjJaN2dAoxY38fk3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:16:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:16:48 +0000
Message-ID: <b07b21e8-5dd4-4d40-bcad-dd8dc4fbaef4@nvidia.com>
Date: Mon, 10 Nov 2025 10:16:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Alistair Popple <apopple@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
 <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
Content-Language: en-US
In-Reply-To: <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be2b8ae-6801-4dd5-62b5-08de206c2adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXBXWi81WFJXQ3pBRVdkaTBVRU9PdE1DYlVzY3FZYmlJekpRZFc3WlI2Y0xt?=
 =?utf-8?B?UkNrK0R3SU55Vk9HSTNuekpwb2FSN20rZ2YwV1pLcXJXaHRxRWtRZS80WkFS?=
 =?utf-8?B?bXp1NzBUQ0hrOGFFOWd2eXNydHdSOGlkREVGeldPU05LbVhOakEyblJHdUZT?=
 =?utf-8?B?K1RPMlFidmovcjdkTjdadDJEQ09NRGkwOG1uN2ZvWDdIRXpWYjBLOVlLSG5z?=
 =?utf-8?B?Sm43ZUZIbk1lWitGZ1llZXkybFlKcHJBbWdwQVBpTkZtOFNJcHJnZkdnMGtL?=
 =?utf-8?B?L2xQaE5RdjRkQU9TaFZZTzhQSTBKQnp6V3BPVXMrZXVGcnpJVjErVlBEUDdJ?=
 =?utf-8?B?cmVIRS94dkk0RldNTm42RkJjRWZmQ0hJb1lJaWdMU3hQNnFUenFWUU9DaHN6?=
 =?utf-8?B?WmRIblZiUjM5YjJQaXQwVFpQc0FuSWppQXJ4SUZ6dUdwbC80RGNhNE5hT25v?=
 =?utf-8?B?RmF0ZVBHdmFCSlJrUS8ycG1nbDh5K2kvTmMwZ1BlSUEvZ3J5YUMvejdYcWNn?=
 =?utf-8?B?aHovYXdqZmlSVExsOUJsREtTeC9md25VWXNRdHdJU2w0WGg5d0xtell6STBa?=
 =?utf-8?B?UFh6Y09LYUthVE9LSXlTMmd4TUlTTENQcHdJWVZZWlpUOFdMMTcxbHhNeFEz?=
 =?utf-8?B?L2FKcUs4bUlVTmlScEZ4OVVxNEd3THlYd3JiUTQ0bzVCZTZEK1FnaE1vaVN4?=
 =?utf-8?B?cmloTTBybE1abGhHaVc5SU1UREU0UlZmT3l5c1hoallyTjNkNFg3TjI3M1ha?=
 =?utf-8?B?U2E2SkNPNTVGeTBZdjB3S3BjSEFaOWExQXlMTDlLanlsN1paeStIZUI0T3hG?=
 =?utf-8?B?MDhIYXMyM1BVeERLTVU1R1NFQ2t5bXFBTHJQdzlVbW9hN3hVQmd0ZXNyVWls?=
 =?utf-8?B?NVVCTGY1RHR4bHY4YW5WZFNRUjQ2U1E1akoyN1p2a0hoaXVLS3FlZjJQVkF0?=
 =?utf-8?B?dHlRWElib1lVZmpaemxzT2gveklMNXYwSDBMRGM5cndrdksxMEttUWplMWRE?=
 =?utf-8?B?R1NjSUtrYkp4L0RwU2hhN3ZTU2FwdWZPS1FNQnBkenJ1NUNhOUJUZmN6UC9r?=
 =?utf-8?B?YnZrWDR2TW4wR2pucE5kN2hMSEVxbHZlcWhLdTNXRDdtcGxmYnNzMmUyRWVk?=
 =?utf-8?B?Y2Z2b1ZKTVhhVmdzTWw3SVpaMFhkdkQwaXNhQzN3S3JVQnhqQ1RzL3FOaTc1?=
 =?utf-8?B?cmU1Zk44MGhGMlhSUW9PZlgyYWlIYmVYMlZkbWZseHZCdDlmMkNORklnb0FJ?=
 =?utf-8?B?c1pTazNXRTU2Vm55bGpPczl0Y09WdEV3ZXNrSVZjWXo4TzJnKzVITGI3RFdD?=
 =?utf-8?B?Y2FwRW96M0NWUWZTZVBJc1JCRk13czVzQS8xanlURTJ2WEYrZ1hkSFdwTytT?=
 =?utf-8?B?RzVGMkZrZWJjeVR5bXV1UEhESGY0dFNsMWlTVVl6WWpUdEVZaUxiRVFTYlJ4?=
 =?utf-8?B?UVFXYzVBMnZXaXFVUUU3UGh4UWhCc09YVDJxMURMeEdyd1Vya3ZTOUZzYTFn?=
 =?utf-8?B?MEl5alIxdXhzdkJENUk2NGNrS3RBYmJIWXIvcmhPc3lhT1BaMityb0xZS1ds?=
 =?utf-8?B?SFlYeVJtTFBKZHdNZ1BsR1RzMStjUVppcDJZUllBdXk4TE8zMUZZNitUcUFx?=
 =?utf-8?B?NjNaMGNPMlZvZzI3S1JqMlNoMTYwYVNUTTJqbHdEalUrSEhrNlB1QUoyNG1n?=
 =?utf-8?B?UHpwUUZoZDg5bllGZCtGMnl1MnQrc29iM2lxNEVLMTgzU2ExZnFOV2ZEQjJN?=
 =?utf-8?B?UlBpYWd5UEpNZEtlQ1FFbTVjWjNNb0xwazJ1VmxZS05XQWZ4R3pBRXczc0dh?=
 =?utf-8?B?UEdidGQ5ZVkyRGRYOEpQVFRLNWRNUFBIZTRGKzVPeDlTNW5majNuYzlCWlR4?=
 =?utf-8?B?WExrZ0RBWE1zTDFBTEtTWjdGeHk3VUw4Z0JROHFsSjN2eldVd1owR1NYdUlI?=
 =?utf-8?Q?x0ZCDCUsuuN8MbYSjTTWQt8Ql3Wqzx2A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pTeGU2Q1JxT2lRdGtwaXB5S2VkRW40bVROd1JiYzR2WDBNYUdTdHhxTk80?=
 =?utf-8?B?RGNLYkVyb1ByUGYrMlNaTC9PZWQ0YUpVaW5oenFQekIxOEpCZXhBL3JKL1lr?=
 =?utf-8?B?dnlCZmYwSHFwT1FtRFBhdFl4SVdvSW1TeE4rR1dvY241KzdZUG9Hd3NKZkFE?=
 =?utf-8?B?ZDVIMHZweWt3b0NZcXoyTkpEdWl0ck9icVl6YzF0VW9MdVZpRnpPTDlUdnJu?=
 =?utf-8?B?U1pEdnJVYlNjbGJuU2ZVUkp3T0FMYlJCeHhuUDhjR3U1ck5ML1NmdlEyNjlV?=
 =?utf-8?B?ZkRJN2t3RG1Sb1ZIc2VuaFJaeGtXc2JsT0pWaHhFTUlZTU5DSExsK2VjV3Ar?=
 =?utf-8?B?SmFQZ2NER3Nhd2VvMXp2Yzl5cmoybVRybnhPYjFHd1JkczkwNXVYQ3hoeit1?=
 =?utf-8?B?YkVHYW1MRHlYR2E4Z1NpMVlLUmdoRmFpbUFFZlRKeW1uUG5BZkYwbkNQUk9T?=
 =?utf-8?B?U3VXYWxJOWNGNU5MMlhYUjZvbzhKWXJCSkJ4RFpNUjhoYnI4NW52dlFleFpE?=
 =?utf-8?B?dGFOMVJ5NXl5SVlxRTNIRFlPU2tVWWZSWWdDbUtvZlZheUNFdjlGeTFtZ2xv?=
 =?utf-8?B?bW5xSFNESXdST1Fma05sdXpEK3cvbEplV25ReUJ6QUhYTlhPbTdmYnFsaSs3?=
 =?utf-8?B?dFhmOEhhUXZwUjFMUmYza1QvSlg1UmpaQk4xbWVsK1dGK01GQTZoZUM5Qlo5?=
 =?utf-8?B?Vk4vcGdNNzMvUXEvUGpvbUQ3dzNlbmZGMnNLNUt1RFE5OE1WWkljQTlNWWJ5?=
 =?utf-8?B?b0RocFJDSmZ4SC9BRW44ZFk5TXpYV3VwYmVKNmM1UWlGb1JvMVhQQVBXeHRN?=
 =?utf-8?B?dHZGVFZwQ0p2NnBlYk9CcEdmY0JjY3VBaEtHd015eHV4YWNPL2xpdGcvbkt4?=
 =?utf-8?B?aVluSWpPdHFESHovUU9nRlB5WHZQbGZ0YTZXV1RUdUpTeGxvN0VZOXYxd2FL?=
 =?utf-8?B?V0RQVitKSUM1OFhCVG02S2xsSUk5SVNXQVg1eUI0V0o5Q0lrUE4wbFpPV29v?=
 =?utf-8?B?MlB6T1E1Wmc1Y1IydE9mazcwVkorN0lHb1NjYWJKaXoxZ3djTGt4NVoyZnhy?=
 =?utf-8?B?dFZPY252YUFVSzJ5ZHVkY3FGbnRwcndqRkpUWG5rSDBwMEllMkRXMWFFb21Q?=
 =?utf-8?B?Vk92TVZsTEN1amRHN1hnY2tLc0kwcmxYaXBjdmtsNEFJZkpxaFA2UmhWcnVY?=
 =?utf-8?B?UUVwK3BmK1U0cmx0eWc4b1hWd1lHWVl6T1d3THl3bE9xcmpZTlBwWkZsZkVP?=
 =?utf-8?B?YlFiWHhKNDI2MmZLMjZPRXZwUnE5dkpvMnk4R2UvN21rTWFoUVdlbjNqdEZG?=
 =?utf-8?B?WWU3bVd4amY2cjBEMXVRN0laZ1Vmd0FiT0FZQUx5N0p3bWF0ekJHRFJONXk5?=
 =?utf-8?B?aGVNdnkyZU8zTExTb3dTQ2dybzFUbXF0bk52VU92YUxlcll1UDdBY1VLQ0hM?=
 =?utf-8?B?Si9YM1J1ZGxFOWVKam5CYUZRWmEybjcyZjB3MWlFTGhmVk5JSERwVGRzenVw?=
 =?utf-8?B?Y3VRa0M5d2dzL3RYQ0g4Zzl2WEVoeGtyc0wzeWRrS2JnWEVtd256VDBkSnZx?=
 =?utf-8?B?N3djSzdnS0FqNWcxNEFnUlJSei9JdGFOTk9VS0RHWmdsRDErL2VrODA2Q0pZ?=
 =?utf-8?B?NDVCT252bUJvanJDVnFERFZSa002K0k2WTQ4MWh1cDBUR29LL2pzbUM0eUJz?=
 =?utf-8?B?NVFLUWkvMkNDQjVxam5sdVNVOG84SXhCWlIxTUFnTjlFdkRoeHowc3FrdVV4?=
 =?utf-8?B?aFRSSk9zSkErOU1OL3QwQUlXb3RwUlRkdDYxSFg5RjI2QjJTNkMzVkFPbW4x?=
 =?utf-8?B?ZVhwZzA1dXdvek5Gc2xCUXNXbU5VNXhKZWM5NzNTaGx1czBsR0tUK3AxWUkv?=
 =?utf-8?B?cUFJT1RQdVNuckxuUEJuWkdWOHVLcC9CbFVGMnBIMXVwTDVWZFRaQmg3aFdS?=
 =?utf-8?B?VmJPZS8rQ0RCTHFGVXhkMW1LYVJQQjkzbjdNdDBCZ08wcXV5aHlpbVFNMjF3?=
 =?utf-8?B?N2Zkc2g5bExZamRLbUdiaHlzMm5JY1pSdlZpOFVPU1V6OUwzTW1tRFBuMHIv?=
 =?utf-8?B?QnhlVFJMbHpRU2VWZkpIZ1YySnlFQTV4QkJybmNWTHVncGUyeVF0eExENlZz?=
 =?utf-8?Q?YUxq7X1VDG/qBJU5iHbeqoxfn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be2b8ae-6801-4dd5-62b5-08de206c2adf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:16:48.3759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/R05JXla7OZ12sjK2lQXgMvPoFgWlLypky4sTChXiNlS/xnYnodKMPgllaHImCCLtbKLNhrrOKSluoeNrdFIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531
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

really +Steve Rostedt this time.

On 11/10/2025 10:16 AM, Joel Fernandes wrote:
> On 11/5/2025 6:19 PM, Timur Tabi wrote:
>> On Wed, 2025-11-05 at 13:55 -0800, John Hubbard wrote:
>>>> #define nvdev_trace(d,f,a...) nvdev_printk((d), TRACE,   info, f, ##a)
>>>> #define nvdev_spam(d,f,a...)  nvdev_printk((d),  SPAM,    dbg, f, ##a)
>>>
>>> ...and those are unusable, unfortunately. I've tried.
>>
>> This works great for me:
>>
>> modprobe nouveau dyndbg="+p" modeset=1 debug="gsp=spam" config=NvGspRm=1
>>
>> I get all sequencer messages when I boot with these options.
>>
>>> ftrace/bpftrace, maybe those are the real way to "trace"...or something
>>> other than this.
>>
>> You could say the same thing about most dev_dbg() statements.
>>
>> I agree that dev_dbg for sequencer commands is excessive, and that implementing new debug levels
>> just to get sequencer prints is also excessive.  But Nouveau implement nvkm_trace for a reason.  And
>> we all know that because of ? in Rust, NovaCore does a terrible job at telling us where an error
>> actually occurred.  So there is a lot of room for improvement.
> 
> IMO, the best way to do this is the tracing subsystem. It is the lowest overhead
> runtime kernel logging system that I know off, lockless, independent of the
> serial console etc, next to no runtime overhead when off, etc.
> 
> I recommend we use the tracing subsystem for "trace" and even "spam" level
> logging levels for Nova. The brave souls can always ask the tracing subsystem to
> also spam to kernel logs if they so wish.
> 
> ++ Tracing Czar Steven Rostedt as well. Steve, Nova is a new modern Nvidia GPU
> driver.
> 
> I guess we have to decide how to do this - what kind of tracepoints do we need
> for Nova. One use case that just came up is RPC message buffer dumps for
> debugging communication with the firmware.
> 
> thanks,
> 
>  - Joel
> 

