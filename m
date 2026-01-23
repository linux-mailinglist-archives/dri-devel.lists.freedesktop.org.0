Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPfAEYL2c2nG0QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:30:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF407B2C2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579F10EBED;
	Fri, 23 Jan 2026 22:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KvrcZACh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011026.outbound.protection.outlook.com
 [40.93.194.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3810EBEC;
 Fri, 23 Jan 2026 22:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ainBzV1wuR8fDNj0dUeCILYSeP+fhdIQjnP1IO4owJT2+N3GNvGpuXb2pTRWx945n4OvrWlsdTP2lzBGuHoupqmWXw1evvv6XVR+w37y2jWyO30Vb56yYUVcCN6oXcK4qEntBt4HT5x+rESQdSceyhZirrV57YK+owZ1pfnDt9g91YvDboxikWfMRJAiRsLhB+/3W5r/p10MgJykCnWFYY1ZfM6BHto3wlZ6mQkJOHqIeP4OuoGEP7xE+j2W6fo1Z8FNn2uVnzVZc/wKuZe7aqHI4zn+df0gBE7dgpiWJuWje/idCKO4xAfxeWoOEGFrWOl9cy672A/vN8yq9wBi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUnenntgu8Lg1OGf7oQn3SxCePidiYXhokUZ97UVlqA=;
 b=xahfuXmzlaOb6/KYQ47cm3o8LMAAm3HeLpcZ8Kic07AywryWcGZKHO7nrqSKXfKvaN4EMhCqAqCtJsirpzCXJtkd4hXMG3nn2kZdYD7IV4LzrP5GO6eKzTYmoVAorgqo6c3nKebkdeLhEUGgCdo0L1S2CeWQgjaqe8Po2lBrvsW8G5A+V74C0iYap+jOlgSQSg73Yq7fDldgvj/0dkNEeMOd6peQKZ3wEfEv7GvW4NkHhtjZp/AQkUGys2SVEN4ImBoa58V6HLSy4kgFo8D/av+fkKIiBwFm+3EKsfpL7/kn0hMvuj3bRBa7UWUOVzdLtncMxpBUMrEnZ560pnQXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUnenntgu8Lg1OGf7oQn3SxCePidiYXhokUZ97UVlqA=;
 b=KvrcZAChvPiZdgXY4zw+BCJyUR4ts13lcU8aBL1Qz1MjLZFkIDolCFhm7BQA1tBEWN784bmrCJNHmkUEh4JYJIwQrq5++aMpizRKgUKnPwOZbb5pv+xSJN6XYtEpjyyazVkm2mUQCGkrmAqpxmsXtYNgTm+w1xKViYQmeacvLz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:30:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 22:30:17 +0000
Message-ID: <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
Date: Fri, 23 Jan 2026 16:30:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
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
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2349754.vFx2qVVIhK@timur-hyperion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:806:d0::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eac0daf-1e17-4014-441e-08de5acefbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGt5QU9Pb2kxaXBUWlNOWW5kZzRTVW1UdVJMVnE3SFpLSG1zVE9xdHNCSXUy?=
 =?utf-8?B?QWEyYlhOZzhreE52dlUxK3Q1Q1FtdzV5SXJEWVEzSW5rNk5LMTFmdkQvMHFy?=
 =?utf-8?B?eGhQV2ZZaStFZGQ4YmdrOXRsbHRrN2ZtOFZSV2VFblVOMURkVk9KYUc1ZUcz?=
 =?utf-8?B?cE5sYzloMkN3OEpnSjBUek4rS0ZXTk5aaHp6QjRVVm80am03TVRoazU4aitx?=
 =?utf-8?B?b0NoaXZiWCtuUFZhbGdKdHI4QmV0QTBmalF4aTJmZGRXbkFzTjJnUVVNTUty?=
 =?utf-8?B?aWw0eDFLQ2pxWml0dTFNNGpMVkxQQmRGU0RVMW91L2tmUmtSOG5teFBLVzBF?=
 =?utf-8?B?dnFUNEhpNklJRzV5MGVtaGtTVXJjRkMxd3o0MzJvRUhqRTZSSmRkeDA3alVq?=
 =?utf-8?B?YVB1c3NEUVEzUGZ5ZzlCaFZPWlZUT1ZUcHQrM2FFK3B3cThNV21TbU1NWVd4?=
 =?utf-8?B?U1JXdHJIaDlqV1U4MmJ6SUhDKzgwOVMzVnhha2hjc2lVbHJ1TGFxTDl3ZEZl?=
 =?utf-8?B?dUlPaEl3L2pXT3lCMDcvWDJra3JLN3RzY1l2VCtuRDVhRkt2dmRBNTdPcW1N?=
 =?utf-8?B?aVAvUXpUMktNKzhETS9hcGcwOUs3V1RtQVpjRDJNRU9LUGdLUXU1bERCV1Nz?=
 =?utf-8?B?eVNlVmovWG83OFloZzB4TnR4aGhsaUU1MnJGTlB3N2ZhTGN0UEpoZjZIK1dF?=
 =?utf-8?B?UnlBekxOUTBCK3hVWTYrZ0pDYzNzNVl2cEF0YnhqWUdnNmZVTFAwTXVGU2xR?=
 =?utf-8?B?ZStEbU9VYnoxTXlwME1NU3VWWnhwSHp3d2NKSWNkWjUrUXdXNEtWcmpKNys1?=
 =?utf-8?B?a1ZqWDRURmtob05aTGc3VWM0cG5YQmdFcVJobGM3Y01BU29zWVZRMnFzajRL?=
 =?utf-8?B?RUlTYVF2ZW1ONXpKbk9OUFJRN20xVWt3eVZWV3lXem1ibUR5WWZ6RzJ2VlhR?=
 =?utf-8?B?VVc1a0twZkJ4aDRwUldJS0JPT25WRlFONlpiOFRyTmR4aDlaeUNia1ZLRW41?=
 =?utf-8?B?Qm50eE1kcWlJTTlLWjNrZG5DSmUwQm1uNlVPL29TejdoNnRFMlZ5QXNZbWh6?=
 =?utf-8?B?bWFKZVVuV05JcW1KWWVLQVh2b0pDQWhCVXN1b1RnQ0Z1dnlpOVQwRjFIdU9W?=
 =?utf-8?B?WE03TmVHL3JDbm5mUk0xOUoxYmZ6cmNPYUJvTllIVmlKNDZoaGZzczFZNEhB?=
 =?utf-8?B?eHlwcGVGVkZKdDFWTW00ajVyRGxITHB5Uy9kREU0aFZ2cmhLdXNjM1dRYUF1?=
 =?utf-8?B?dEhpRlEvL1F5Z25tMEdVSVhFNENSMUlkSG9ZanViM2UzVzN2cmRsU3VUeVdR?=
 =?utf-8?B?RHUrTEFyalBraGhwWGNtc0lmR0x2aHhJamo3ZytSbE9reVFUc21HMXZtMXFV?=
 =?utf-8?B?dk5pZXJuTUZ6OEdES1dMU1QweHQ3STJac2gyeHQxN3ZaWEJ1Rm13a01rSys3?=
 =?utf-8?B?eDF2YWJEbkNlaVVMdzFhbUN2V2VHTzBpL0xpR3RIQXdqMWEzUVZWQWNORTVx?=
 =?utf-8?B?cVJHYlgwVFhFbjRwNUQyVk56OWVETHk1cmdUOUpEYVgrci9sY3REbDMwbVY1?=
 =?utf-8?B?clp0MURZNE5JOXFrMnZ1dTM4R0xGOGg1M1hTTHNSUW95Yjk4TU5uM2JaVW51?=
 =?utf-8?B?b1dmREYxbk1OaUdOT0JzSGxrRjJYbDNLcTZYMzJ1S3FVVnNOK0pFVytiWmRw?=
 =?utf-8?B?UiszaGJ5VWVtYUs2ZUhTMnBBUVRJbTR2NVBpQkNjYkRQQXVGVW1DV1FKeTNu?=
 =?utf-8?B?bG1GNkY3eEZUUmhUYUJoQXZqTkV6Z1hVNFJEbW1HcVdRMFlaMzl3Nm5wajhI?=
 =?utf-8?B?Qm1RU2w2Z3JzL0t0V1lURHoyUEViTkV3K3BlUnIrUU9ZNjVzQTIwbkZZMjBK?=
 =?utf-8?B?K08wN3M0eGxiMm9IVjJ5bzhEK012eFc5K1JIVEt2RC9JVHlFdUdYTXlzbFVY?=
 =?utf-8?B?UWxQZW1NemxCVXlYRnpCaHBHc2tCYk9iQWRQM01IWDFqaW9CY3lEUlVBcHVn?=
 =?utf-8?B?LytHSEVMSU1YQjdTdEdFMm5pZW51Y01yM0pycGUwUlBDZk1FemJuM1NjeDlN?=
 =?utf-8?Q?WN2Eqk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0I5dDJJRTcvOW5FQlNiaHRPdTdyZ0RONUE2UGgwZ0k2V2hVbGhUWUFBZEw2?=
 =?utf-8?B?Q1F2OVlJOEFOTjN4aThCY0xhemJFS2Rud3pKZG5QTXNsK3FIOXFpMzB4YXIy?=
 =?utf-8?B?K2d2bEl0ZmlrM2RrTE54Myt2TjE0MVRhTHhZRWlCSjlEUlBsclM3T04rU0FL?=
 =?utf-8?B?cEFMMWM3aHZBeG1ZNXZqa0FMZVE1L29ORzN0S2xQOFE3MXphbU91cVh0ekFz?=
 =?utf-8?B?U09RNEFZdXRYbTZDNHVVbnRrSWZaWG41bUdEMmFmNU1iUStMQUJwODRISkZh?=
 =?utf-8?B?bUV2anRYbGJxbEF3YkpndTBURU9yazhINUJaa3VHTkVwYm8xa2l6dlNZaW01?=
 =?utf-8?B?bDRCK1JybnViaXJtY2FKRTdMM1pwbTVWZGd6aWJDbnFLaHZzZlZuNmFCN25o?=
 =?utf-8?B?QkdSd1BKckRPeHpuVE1XaHFOTzFraGZvbGo3ajgrUUY2MHNUNkFQNUsyUXU5?=
 =?utf-8?B?YTcyMUlGRmdXT1JjNWdSaVhXV1k3d0c4OHlPZUpZVmJVNHc5bGYxS2tMc0Zn?=
 =?utf-8?B?b3RkYVkyWG1CM1FLVWpRRm9PUUZVb3N4VGtmUlN3WEp0Q3FZU2FpQVpBNnJ3?=
 =?utf-8?B?T2JmWUVpdTM1Zy9TUzEvdzd2NzY2bXcweTdlMTlEYnBqRE9YNDNHOUYyMFda?=
 =?utf-8?B?Wk1qdXVFbExxWEFSbTFRdFBuWFVpSk5rc1JrNUhWR0VDMnNObWxRZDFVamcz?=
 =?utf-8?B?dkE0UWM0azVmcC9tT1JveFVyQ3R4L3hKdzFMUVBxSllFWHlreXQrSXpkSTg3?=
 =?utf-8?B?VERzZ0tkNTJ6WlRTRTRlaE1tN0crL01ic0Y4UndFVVJ4czhpVERHWm85TkhJ?=
 =?utf-8?B?bVdqdWJpZjhrNCtLQ2xHRGNCRm0xelhMVWtPTjdDTnBZUlVrWFJseEVUS01p?=
 =?utf-8?B?ZUxYSjJJVDJhWTY3ck1oR1BxZnRHUUp4dnZlSnAxSHNVRTMrMGhubXJmY25R?=
 =?utf-8?B?cWZyd2l0WVVaZzNIUDZnZjNCSGV1N3J4Y1hkWEp6ck1seHZHck9BdXBNRmFU?=
 =?utf-8?B?dGVQSllvOFFORUlEeXBwekpZcGlVSzZ3cTBDaDFRd09aa1dTb24wWWhSb2Jm?=
 =?utf-8?B?MUtTNUVzWlJOVVVLTnJaQ3QreTJ2UHVGYkhKM0JPNThrNkZmdTJUa05NQXNx?=
 =?utf-8?B?YkRRTGVWUUVWVTh2MTVOS1VVQUJKUVROK1Q3bWRaRzU0ZURDRGNtdlpJRkpv?=
 =?utf-8?B?T3Fzd1FrdEtsL2I0bjlpazVGcUFFc2hFSVozclhCdjd4TW03SnVCWlBOT2do?=
 =?utf-8?B?eEhhaXFjU1VFNXB5TVlxOVFRWkx3VjBCa2ZtZ21VUmtGMGpkTzdEbWpldHVL?=
 =?utf-8?B?Z0pKNWNmaitKd1JYUEpZdnZvWTdRVUZvdWNxeUVkOEJJUmduVERTK29KTXJM?=
 =?utf-8?B?ZjZFNm5uL1cyWVl1WWpRcEFCKzE4cS9PYnp4YmhLb3dxQzZvNFdxaG5lZm9G?=
 =?utf-8?B?NnN2alNnMmFRMnJJMkpFeTJIZ0dWSnJtNEhCT3RlRHVTQjNGSjJTT2YrTjFl?=
 =?utf-8?B?NU9XUDR4MkJuN1dqTTBFaktkYjk0alRKZjExS005ZlNIeHhvVUFVS0h5NktC?=
 =?utf-8?B?NUpOS3Z5TUpIV3lJNWR0WFVFakJWcFVnenFRZ05HV1VKMjFXZG83UFdVY2U0?=
 =?utf-8?B?MTBsYWVJNHY1NW02UTRUcnJTdThOZzlnT1hMSlowalhrUUdCdjJJVW1wZ0oz?=
 =?utf-8?B?UGJNbnRFcWtwb2VGZXR2ZEUyMyszUy9lSjY1VXV6L0JVTHZYc0puUmJZVXBM?=
 =?utf-8?B?QUlncGt2RFVpWHRNZE5ocjBPUzlGUlpGT3Y0QVkrTEJrUWVwRGszcHd6VE1l?=
 =?utf-8?B?Q0M4OHptNzBxYmlLMUhRS3BmY0VZRXVUTGxkeGhWdmRtRHNOb0p0NWlhMFNS?=
 =?utf-8?B?OTU0bU5NNkVFUlQxTWFITkZkS0tpUHZTa29hQlRLd3M5UWxwNVRibVJtRWVI?=
 =?utf-8?B?QzlBc3NjdkpGT1lEMG8zRjZ3allTY0M0U0gyY042RHIxcW1NUG5WQVg0RlN4?=
 =?utf-8?B?QUtoQzcxbXN0NE5sV09wNlpKZE42UlpZelVZc3pDUjdqUWczNzRSUElPWGRC?=
 =?utf-8?B?N0kvNkhoUnh1aHZsTDZKSVNIL28rSFA2QUgySTNXRzdWRVUwNnZmN2NUNTdJ?=
 =?utf-8?B?cUo5OXAxQUFlYW5QNnVEU2xYNU0yb0orSkVLcXRTRkd6M0RnV2RLUisyWVRG?=
 =?utf-8?B?eWpOdXZ5UXJrSjY0OFI5Q2V3bXIrMzlVNlJDY3RYYkNTSkFacnF6bjZDNDBs?=
 =?utf-8?B?ZDhtUVFrV0xYRFB5MncrUUI5TUpBTlkzSjhOeWZnMkN0RHJpNFdoU0NQN2R2?=
 =?utf-8?B?THUrd1Rnd0FrT0ZoMFlYYU55M29jTHZkK1lzQ1J1RXJ4Y1dQSGRZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac0daf-1e17-4014-441e-08de5acefbda
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:30:17.3478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbiyAx5lDM7psPceDZfSlkUTKVKzTn09pSqrjYLYKFePePprNEefrtTxsX048dg3dxE64SAXvQN8ilncm3sdwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,lists.freedesktop.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,indico.freedesktop.org:url]
X-Rspamd-Queue-Id: EAF407B2C2
X-Rspamd-Action: no action

On 1/23/2026 8:44 AM, Timur Kristóf wrote:
> On Friday, January 23, 2026 2:52:44 PM Central European Standard Time
> Christian König wrote:
>> On 1/23/26 01:05, Hamza Mahfooz wrote:
>>> There should be a mechanism for drivers to respond to flip_done
>>> time outs.
>>
> 

When there is a display hang, I think that resetting the GPU IP is 
really heavy handed.  I second what Alex said - Why not instead just 
reset DCN?  I would think move DCN into D3 and back out should be enough 
if trying to use something to recover.

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
> A page flip timeout can occur even when all fences of all job submissions
> complete correctly and on time.
> 
>>
>> 2. A coding error in the vblank or page flip handler leading to waiting
>> forever. In that case calling back into the driver doesn't help either.
> 
> At the moment, a page flip timeout will leave the whole system in a hung state
> and the driver does not even attempt to recover it in any way, it just stops
> doing anything, which is unacceptable and I'm pretty surprised that it was
> left like that for so long.
> 
> Note that we have approximately a hundred bug reports open on the drm/amd bug
> tracker about "random" page flip timeouts. It affects a lot of users.

Yeah I would much rather leave some messages in the log that this 
happened and see a recovery occur than a hang.

> 
>>
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

Hamza - since you seem to have a "workload" that can run overnight and 
this series recovers, can you try what Alex said and do a dc_suspend() 
and dc_resume() for failure?

Make sure you log a message so you can know it worked.

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
>>>   drivers/gpu/drm/drm_atomic_helper.c | 6 +++++-
>>>   include/drm/drm_crtc.h              | 9 +++++++++
>>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>> b/drivers/gpu/drm/drm_atomic_helper.c index 5840e9cc6f66..3a144c324b19
>>> 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -1881,9 +1881,13 @@ void drm_atomic_helper_wait_for_flip_done(struct
>>> drm_device *dev,>
>>>   			continue;
>>>   		
>>>   		ret = wait_for_completion_timeout(&commit->flip_done, 10
> * HZ);
>>>
>>> -		if (ret == 0)
>>> +		if (!ret) {
>>>
>>>   			drm_err(dev, "[CRTC:%d:%s] flip_done timed
> out\n",
>>>   			
>>>   				crtc->base.id, crtc->name);
>>>
>>> +
>>> +			if (crtc->funcs->page_flip_timeout)
>>> +				crtc->funcs-
>> page_flip_timeout(crtc);
>>> +		}
>>>
>>>   	}
>>>   	
>>>   	if (state->fake_commit)
>>>
>>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>>> index 66278ffeebd6..45dc5a76e915 100644
>>> --- a/include/drm/drm_crtc.h
>>> +++ b/include/drm/drm_crtc.h
>>> @@ -609,6 +609,15 @@ struct drm_crtc_funcs {
>>>
>>>   				uint32_t flags, uint32_t target,
>>>   				struct drm_modeset_acquire_ctx
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
>>>   	/**
>>>   	
>>>   	 * @set_property:
>>>   	 *
> 
> 
> 
> 

