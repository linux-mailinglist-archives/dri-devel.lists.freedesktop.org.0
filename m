Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEadMrE+d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:15:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02F86927
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901D410E166;
	Mon, 26 Jan 2026 10:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="th67tr5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0411110E3E9;
 Mon, 26 Jan 2026 10:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHuSXTvNkBhNf00tpgu6ZIEQTUMnCRifz+qfTcoXuIudr6Ib0V5GjA8UVxDOXRTmWh/aape9EIbgcqpexwSfRImMVrv5OrIQFh6Pn58Vk3G1azpL5W9TFOyNftospf4pqfDQGJMdscCyJJ1vChv95u3EEWSrlHeJeLJlgaKWTFuPoS5GUHrAZOuiB0aV07loiSAbg+6sMGGSAChJYG2tKTatM5eMjIjGz+PHQbmsb8J42j5Fxt4kpnS5XVk/PAeCut4OSNZXZ9oQNuAWevJBJdqPhcbrYCHGvlxOyB/AGsyoBti0BlDiXOM3avdxc9QH01+X7yPuUg6QvS7kTKb50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jst+muCZWydKCPCCUglqVUAiCm8z3PClzcy3WrPFWeI=;
 b=sSC5z8Tsw/Sv2ahH7YNxD5vvmvfEdUjDqjHKvOvmAtW4quMKOb3Hwl7pWVAbUcbhKMa5S5FGmuutihR3Ej55Asa7xpJDZihYzNqOz98QG68PSw+z3buA4YFOP6WOAa9pipLfbfyU6CUdU6LQmQYhVh9lRusE4557Siaeu3rezAUkrCZ+d1+wiI/GNRvPzJBjzTIrEltWKATmLtqAJT2JxEZAZwWysqf+HJanVc/698K9IJiTktgQINCBZmonR+2Vn5PmYJJ/egQkw99xg68yO+XhktCfZG/D8PITelY3Gh/FDB5O0PmBmVPHAQNVDMQNpgyBJ7dBv9SbkLSNRx68yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jst+muCZWydKCPCCUglqVUAiCm8z3PClzcy3WrPFWeI=;
 b=th67tr5A1xm5LC8Ex94q72kwt8FwXwig3zgoKrozpmDRLz+GB8z2QxukyfIcuxi2HI3PqT+vMkbQI86UXb/1zLip2i7rNce1s+IF7Rpf+XIMpXmnXxjjEfUXllrP484oWe16RE6FwKxYQvqwmRk3mDqTezfc/YTPXRlGk8RK+do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 10:15:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 10:15:06 +0000
Message-ID: <fd3f2b16-41e7-4a9b-999d-e137e5abb7df@amd.com>
Date: Mon, 26 Jan 2026 11:14:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2349754.vFx2qVVIhK@timur-hyperion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: aad7e706-03b7-4f93-14ae-08de5cc3c70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFETjdrQTRqU0pQbE8xNFhqenpLMUR4bERVTzlRUy8rOHlJaVhYaHlUeWJQ?=
 =?utf-8?B?QlZWS2o4NURvSHFWb08rSC9VVWtBUDhLa0JVMHVESnlCNm8wZzNHVkYxaWUv?=
 =?utf-8?B?bVRiM2xCVC9xQ3VkWW5KYjFXdWI1M0VhM0pGaTc3clNIc2xaa29veEpTYUpx?=
 =?utf-8?B?ejFTc29OdEk3MXhXb0lRMUVDMGNFMytMampzR2lTbkxkOVZ6R2s1VGpBaUVC?=
 =?utf-8?B?S044clJFSXJGbFF5cFk2Yk5YYzQ3aU1OSy93ZUpiMFYvVkJVV0dRVDZrVktl?=
 =?utf-8?B?YmVpR01TVm1FU3lKTUQxTHlCcTNTd1JjdHN5ZnUzQk9pUEV0Y05PSHBhcWQz?=
 =?utf-8?B?UFVvREJZbVFJRmFQbGYzd2M4UzFGc1gzeTZxNldwYU95bkdobEU4TktDNWc3?=
 =?utf-8?B?Q0xkYyt5WXBNLys2d3F3enFYbGg0QThWb1l5YzgrMjk2Ym13a2lVdG5UUkdw?=
 =?utf-8?B?OEFrNTB4c1ZpeHdEaTl1d1VLalhjaHRvZGJXdlRmWUNGTmxVK1hublR2a01X?=
 =?utf-8?B?cUdtMmYrTFBBRjY0WWVrWmY0VWg1TG8rcGdMOUhUNTIvalArN1drWjNvR2Iy?=
 =?utf-8?B?UjJrbjFiUnBFVkFqcXh5d254UG54UUlHRUd4UXE3RlF2NmphaEtkNTFONm5j?=
 =?utf-8?B?VUg5NUVnbmh4QSt6R1NlM0ZhR0ZEYm5maldkZjlWWXZaWWRVQXhadCt3Slov?=
 =?utf-8?B?VVFNZ3o4RzdUYUc0b2tOeEpheGRyd2VXN3dwY0hZSWpnejVxaC9DY2RxSmVH?=
 =?utf-8?B?dTVleldDYzVVS25xTHJuZm5SbVEyek5CWE9OZldsakloUHc5RXhEMnY5L0c1?=
 =?utf-8?B?YVJ1RlY4akVwMEhGWUFsOG51TVdndGVvUDllWXNtallzVHA4SmJXSEh5VXF0?=
 =?utf-8?B?MjBKdEZxaDh2ZXFUMDQxTWZ4QWtUTEpzdnF4Wjl6NGtUOXFjaXZ4WXFXbGVV?=
 =?utf-8?B?U2VoeEIxWkk5aFhIVkZqMXJLTG41REhuejZJYUNGRnMwWHNkYndNeTNJcGxm?=
 =?utf-8?B?bFMyalduRGNRWlhUcUprbzg3K2hGcm5hOGh0VW1ZUmx1K2FDZXdDaVB3Y1V2?=
 =?utf-8?B?c3A3R2xLVi9SZENIWjExSnhCaUJxamhUeWJTeDBQS1hYRVRkbWZMeVUvRzZv?=
 =?utf-8?B?dUtHUVExWk13dkFUWW5oN0FBbE5kZzl2TWFCSDdSclhva3RIUU14amVObFRw?=
 =?utf-8?B?b29mWldTTUIzeUtJaGR6NFo3Z3VPUnFTbEh6NGtrd2JYNndvWVVuNE83b0c5?=
 =?utf-8?B?LzZ5U3dwRnk0MzhCNVUyOER1MDd1NmRabnNQakJYL1VyT2xybVdqeXR5OVd2?=
 =?utf-8?B?RXZ6NE93cGFydWNTU1g3UmU0Wlh3RmZUMmVqanlCQktLc0JWUEFEUXBBUWNh?=
 =?utf-8?B?Ky9GOWpYRExZU1BFWU9MY3RTTUJlNllEWDVMbW8wUWM2UTMvbElvMjFDUlEr?=
 =?utf-8?B?SnB2R3NJcXBVVDA3T0FKVHBsOFVlQWNCQnd4WkFySTN5ZlR5RmkvYk9TRmxw?=
 =?utf-8?B?SU9mQXllcXg3U0IzVUQzcC9aSUZONVl5SjZnQTFEM3BxVVJPenlxbU45Wlhv?=
 =?utf-8?B?OG82K3ErYUg2L2RsZzdva3BpSFR5N1ArWUdzZzNKNG1ObHFZTmh5SXNJM0VF?=
 =?utf-8?B?QkFrVHc2b2Z0U3JCRCsrUktDWmQ0VlVFcnhFMGpQQllEN29ycWJNbDYwazJE?=
 =?utf-8?B?R3FHSTk4bDhJRHBnTEZyMzVlVTBXTW5DL3A2b3AxYlhLTVY3TDBURTdXUE50?=
 =?utf-8?B?eEhNNmNhZW5Ua3lMOVQ5bkplMmtYdlErVXdLQW8vSVFuZXo4am5NaE1nUTJj?=
 =?utf-8?B?QS9KUkt6YTVaeGFtOHNhRENkOEpua3Z6VGcrRDlXRlBLZWJ5MGNUMDVKK1hx?=
 =?utf-8?B?bFY4Z0dKM1N1VU1GM3JPOUY2RUZhOW5DZExNeFdlYkJRSlNFZlVwcldoV2xV?=
 =?utf-8?B?S1BpeUgyQzAvakFFQk5naFJ3ZHdWNjZOelcxYzBUaGtuWjFSbVB4Zm44dG5u?=
 =?utf-8?B?dEJGUWlFNUJ3YzhERmRFT0w3WW1wKzJ6SW56Vjdlb3NkRTNmWHB0OWRYcy9C?=
 =?utf-8?Q?v4Mfim?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJqWFJVNnVqc2FiaE1hWWlkOGNaeXJXdlVOL1VxTVhHVmp0WXkwc0ZBdWtV?=
 =?utf-8?B?TksrQ2Z5VC92d1cvODBYRS84ZWlZN05ZV09QVndBdzNleUN3MGtzMmh4S3kr?=
 =?utf-8?B?NXFTNkVwMUpXSWZWeW91dUVHOWpSZHFUTDdTUDFXMWs4SjFyOGIzN3ZxaTFa?=
 =?utf-8?B?aVFpM0xXS0s4Wmk0YXNPMjROREhLUFB1NWtGSjlPWCtpL1FtV0NsZVhsaEdW?=
 =?utf-8?B?OGZhaGRmcDZwMUlqT2tUTEg1QS9LZHgzZ251bjhtMUdHRjc5STB0UXN4SExM?=
 =?utf-8?B?TDQxeU9yV1BMZVVYVStPVXF5T0RKeHR5SVBJWHAzOXpNUzA0dGVqYmFobjky?=
 =?utf-8?B?dkdIVGRTSVg0THE2RktuTStJSGM3NkpRNVJObVR4cFFvV0dGSldVbjJ3c3lw?=
 =?utf-8?B?OUNSc3p1REI4cnFiY2R0RXZPTUVjWlhscldQYlFFVFBseUg0ZXhpdGx4UkRu?=
 =?utf-8?B?K0hMSzVCcW5KdEFKalZNeTJzRDREcHNCVFFUTGlSOUlwbDhLdit0MzBva0Z5?=
 =?utf-8?B?UDhGVzV4L1JNODVNc3RtcU9samVWbDhQenppSjNramZ4R1ZmY2lOcG9mZE00?=
 =?utf-8?B?eEZ1ckNsWU1QbXp2Z2xESXpheFpDRmZTdWpTNVNhb1Q4TkNCZVYrcHFQc3VC?=
 =?utf-8?B?Ti9ZZVdKcHFHSGNNMEtZWTYvL0o1MnNRSkp4WlpoY2puRHlKR3ArZFprZGZN?=
 =?utf-8?B?WWFBS1JEZER4aXIydjh3NzI0cFB4NjVzY3dOcmRFYk9IeU1HMFVXQXkyL1dJ?=
 =?utf-8?B?QkpYeDY1c0w4TU5WaDc4WFFZK1pIY05WZnBETHY0RmI5amhVZWRTU3JKVUlT?=
 =?utf-8?B?dzRaUkVXZHo0dTRZdTFWZzlGVlJFRFUyT0V2aWp3clpsa0U4ZWk5ZUVhWldz?=
 =?utf-8?B?MUt1a1A5RXhzTXpaZ3NDcWppWVFYYzY0RThSdDRtWE1IQ2pKL0kyQ2xDOGMv?=
 =?utf-8?B?cFp1cmwrZUpWdjRGK2wvZGF3bW5tamNGVVFpb1piVjhlYkRpajhxbGlmdXpq?=
 =?utf-8?B?cnVkcDB2R2RrRDV0UzRqOEtkSWsrUnJrWTJOTVR2ZHhjeklWNjQ5UVJUSld4?=
 =?utf-8?B?OFlZcUZPN3VDTmRMMGdBN25WV2RBc2ZCYUZwVHNBUkJuRUdQN1ZkT0dzdGRw?=
 =?utf-8?B?TG9jeDdHL0N0MzdHTjQ4N2tZK0hDRyt4KzNsUDFOdnVHU3h6L3NCQUo1ajFn?=
 =?utf-8?B?aVhoTlpsYy9JWHNxSTA0K2c5czNGZkdDY0dMbEZ0YzM5RSs4Rm1xN0c2Sm1I?=
 =?utf-8?B?T2tWdXhRUGk0TGh2dlUrelNEdWU1Y2dPRVo2cGFRRWRrSzNDeVl5dW5icHdu?=
 =?utf-8?B?eDdOUkxFbm5XZ0VVbm1aRFhwTnJjTWZ4a2NINThHSGFSbXpDRVM2VzZZdkxV?=
 =?utf-8?B?SDEzODlNNk9FbytJVFN1SmtzK2dWdDkwY016UitsWVVnSVN2VTRPRmlBYlF1?=
 =?utf-8?B?aVJZMUI5MUlCbXBCc2d2QXlSaCtmNUQrUnArd3R0Z3hJVEJZcTQ5OVByUTAz?=
 =?utf-8?B?OTFyNHNlTTVEeE1qN3o2Q28wR0NLQ0lKdEhZWjY0c3JPV3oyWWM3V0RFd0Jx?=
 =?utf-8?B?WDNKczVmR0hYOS85aTlnaW9pMU1iZFFNNFo1bTVBNEt5aTFRd3k0QVVDUmRO?=
 =?utf-8?B?dkx5aUVSLzRMa0RzcjdRdHZTNDJpMG5uYzdVemdHZUs1SEtNVHl6RTU0UFVR?=
 =?utf-8?B?SHBpN1NZWTBoYzVqL0tWVllaaXc1aENKd21UWC81UzMrblpTZ2NVaDAyTUlO?=
 =?utf-8?B?a29OcWpZdjlwV0FhMFhSSWlFY3BlTWNleThObU1SdnVXeG5ZbkIyMWNXd1cv?=
 =?utf-8?B?cmdnRFY3N0ZDWmh5ZDl5MGtaWnMwT2s5MnFFd3BDMm9BdzJQcVAvM3dwSzZv?=
 =?utf-8?B?NUN1S0I4N0JiZDdQNnFDS1hlanI0a2Frcm8rRUJIaEZaSTA1L3pqdm1ZblB4?=
 =?utf-8?B?bk5pdDZxRXNJdE43OHM1WUhub3E2RFg0YmE2Zy9NZkw5elErVWt4M1dQZnZw?=
 =?utf-8?B?VnBhcDhpejA5ZmxsWTNuc0N5WXkvMEVTQlk0RTZ6SlBTZWtPWUtYUXJ0L3px?=
 =?utf-8?B?azhJM29LNUJ2ZVcwVGxReFFEZjJOVWNVL0tGU3RaOGxpMHFscjlkOThyM0FP?=
 =?utf-8?B?WVZ4cjU2MDlqSkQvbENMcGtROUEyMDZOMlhwbllXUWlFUndRaHJkckQyY3lX?=
 =?utf-8?B?NFhLallPM21LN0FvaUFWZGI4aHV3OHFXN3didjdBSjBQYXJsRkdITVpMdG5z?=
 =?utf-8?B?dmFUay9MVnlyVmlrYVJZYUNkVE1UN0Y4aU9KZG1hcWNJSHo1ZXQzVi9sUmJm?=
 =?utf-8?Q?MZWOuvxuwyJa34UdQY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad7e706-03b7-4f93-14ae-08de5cc3c70d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 10:15:06.2847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OQspVgaW6+J/weBwQcombRFFDxfjXBptXgtmhLJdBkjsYdVIwI/3ME2E34OrgUx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 7C02F86927
X-Rspamd-Action: no action

On 1/23/26 15:44, Timur Kristóf wrote:
> On Friday, January 23, 2026 2:52:44 PM Central European Standard Time 
> Christian König wrote:
>> On 1/23/26 01:05, Hamza Mahfooz wrote:
>>> There should be a mechanism for drivers to respond to flip_done
>>> time outs.
>>
> 
> I am adding Harry and Mario to this email as they are more familiar with this.
> 
>> I can only see two reasons why you could run into a timeout:
>>
>> 1. A dma_fence never signals.
>> 	How that should be handled is already well documented and doesn't 
> require
>> any of this.
> 
> Page flip timeouts have nothing to do with fence timeouts.

A page flip can be associated with a dma_fence as well. This is used for example on Android to immediately re-use the BO not scanned out any more.

That dma_fence has a well defined behavior, especially error handling and that it needs to signal in a finite amount of time even when driver doesn't confirm that the flip has completed.

The purpose of of the page flip timeout is now to guarantee that this defined behavior is actually fulfilled even when the driver does something bad.

> A page flip timeout can occur even when all fences of all job submissions 
> complete correctly and on time.

But only when you have a major coding error in the driver. In other words a page flip can only timeout if there is no vblank or hblank signaling any more.

And that in turn means that somebody turned the CRTC off or hot plugged or we missed an (re-occuring) interrupt....

>> 2. A coding error in the vblank or page flip handler leading to waiting>> forever. In that case calling back into the driver doesn't help either.
> 
> At the moment, a page flip timeout will leave the whole system in a hung state 
> and the driver does not even attempt to recover it in any way, it just stops 
> doing anything

Yeah and that is expected behavior. See there is no way the driver can recover from this on its own.

When this condition happens you can't take locks or allocate memory, otherwise you have the full potential to run into a very low level deadlock.

I'm not an expert for the atomic mode setting stuff but as far as I can see the only reasonable thing you can do is to set an error code on the page flip and return to userspace to signal that a flip has completed but with an error.

> which is unacceptable and I'm pretty surprised that it was 
> left like that for so long.
> Note that we have approximately a hundred bug reports open on the drm/amd bug 
> tracker about "random" page flip timeouts. It affects a lot of users.

Wow that is a boomer, I completely agree that sounds like a serious problem.

>> So as far as I can see the whole approach doesn't make any sense at all.
> 
> Actually this approach was proposed as a solution at XDC 2025 in Harry's 
> presentation, "DRM calls driver callback to attempt recovery", see page 9 in 
> this slide deck:
> 
> https://indico.freedesktop.org/event/10/contributions/431/attachments/
> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
> 
> If you disagree with Harry, please make a counter-proposal.

Well I must have missed that detail otherwise I would have objected.

But looking at the slide Harry actually pointed out what immediately came to my mind as well, e.g. that the Compositor needs to issue a full modeset to re-program the CRTC.

We need to get the atomic mode setting experts on this and some suggesting on how to fix the error handling.

Regards,
Christian.

> 
> Thanks,
> Timur
> 
> 
> 
>>
>>> Since, as it stands it is possible for the display
>>> to stall indefinitely, necessitating a hard reset. So, introduce
>>> a new crtc callback that is called by
>>> drm_atomic_helper_wait_for_flip_done() to give drivers a shot
>>> at recovering from page flip timeouts.
>>>
>>> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
>>> ---
>>>
>>>  drivers/gpu/drm/drm_atomic_helper.c | 6 +++++-
>>>  include/drm/drm_crtc.h              | 9 +++++++++
>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>> b/drivers/gpu/drm/drm_atomic_helper.c index 5840e9cc6f66..3a144c324b19
>>> 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -1881,9 +1881,13 @@ void drm_atomic_helper_wait_for_flip_done(struct
>>> drm_device *dev,> 
>>>  			continue;
>>>  		
>>>  		ret = wait_for_completion_timeout(&commit->flip_done, 10 
> * HZ);
>>>
>>> -		if (ret == 0)
>>> +		if (!ret) {
>>>
>>>  			drm_err(dev, "[CRTC:%d:%s] flip_done timed 
> out\n",
>>>  			
>>>  				crtc->base.id, crtc->name);
>>>
>>> +
>>> +			if (crtc->funcs->page_flip_timeout)
>>> +				crtc->funcs-
>> page_flip_timeout(crtc);
>>> +		}
>>>
>>>  	}
>>>  	
>>>  	if (state->fake_commit)
>>>
>>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>>> index 66278ffeebd6..45dc5a76e915 100644
>>> --- a/include/drm/drm_crtc.h
>>> +++ b/include/drm/drm_crtc.h
>>> @@ -609,6 +609,15 @@ struct drm_crtc_funcs {
>>>
>>>  				uint32_t flags, uint32_t target,
>>>  				struct drm_modeset_acquire_ctx 
> *ctx);
>>>
>>> +	/**
>>> +	 * @page_flip_timeout:
>>> +	 *
>>> +	 * This optional hook is called if &drm_crtc_commit.flip_done times 
> out,
>>> +	 * and can be used by drivers to attempt to recover from a page 
> flip
>>> +	 * timeout.
>>> +	 */
>>> +	void (*page_flip_timeout)(struct drm_crtc *crtc);
>>> +
>>>
>>>  	/**
>>>  	
>>>  	 * @set_property:
>>>  	 *
> 
> 
> 
> 

