Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEz5BUHyeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:25:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE25A04F3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B36610E691;
	Wed, 28 Jan 2026 11:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vP0szRX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010018.outbound.protection.outlook.com
 [40.93.198.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8510E691;
 Wed, 28 Jan 2026 11:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKvTUmYu5bS77WBKMs+wZP+vInE9WDcGBTp2PiWMJCmBWSjUwi9PSB4zTkWLgh5XzofaKy5ttyZrjH7QW05NMwsJtDMH5qCHq2FR2h8JGMvNf+mPmaiW6sU018mv4WVCW5lDliPMLchJ3W2Nyaazo/SfujZeroN3kzUSM1tP8sMauigEPXh+QP+Ol0mIVDNfvo5CUQ1UEMxJfir1XPxG/4viGQuFVGhY4A122tldZJd5/l4oDj95gY4gePaPe+GG00PwCCOQceoU5vsaXAMBi3lM4vrhPOeA2b4KQL3hT3T64hbEC+6zCEaOYjH1EtOhoKKpSSYwpqUSoOhNcHpDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKsIgjvUTYSwOSxQzUz3awgowQGO78cRkQExcdqQPAg=;
 b=IN80g/IZIXRC6W0sTuZ9U1XXMtUzYu1f07XNWmOc7QRDyoNAiWocN9KE1y6PiHOXiOPMrnFdQxhIiTyX7Zg+En4l3R50/HAuaK5lf4z6qCiRwoO9P0gpp/EuzZ55GlGugyg99/PBJbsiPuioPOK0ukPhJcTgasisd1chpL1mT4Br25TX+HA7c/ir/p9DJtYeEg8PRkYc8TOaosiJP9w0egCw4yqFKLW4HVup+8cuQyv2CO9zIYQj/mo3pAMiwArJvCKKAbfl4JkhLvWIrjZrtl/2yO1Od3VFwLN7TUS9M/KylXsziCeBwYus7qiktw2eLnfPyawGR+f3figxn3OOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKsIgjvUTYSwOSxQzUz3awgowQGO78cRkQExcdqQPAg=;
 b=vP0szRX8v02URHgeQgQNQj3p++TA//9nTGX/9usPpJjamEXhIFY6f82wZVtiK8w6XUxZxWHRgRr7Eza5eCHcRz6V5K614E5cT8BuZkxSpf7ArD8KhkhQmpxCaPlCFW9lIsfOBkMWhx++hT0BGf/x6lrCVbvHrTQ9YsFeXOqBKaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 11:25:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Wed, 28 Jan 2026
 11:25:44 +0000
Message-ID: <a2fe8187-9271-4cbf-8b7e-37ffda0799de@amd.com>
Date: Wed, 28 Jan 2026 12:25:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
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
 <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
 <601b38b5-1890-48f9-adf9-54fb85650852@amd.com> <5173841.OV4Wx5bFTl@timur-max>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5173841.OV4Wx5bFTl@timur-max>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 3826ca3c-1673-4e1a-7217-08de5e5ffa06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmpMcHVZczJYcXBuZmZ1U3FOMi95UVF3VmZHanRGRE53ODFyQTVoanlPb3pr?=
 =?utf-8?B?TnRlWEVZd1VNVGIxZ09rRzhnMlRkUVpKN2I0T2ZJMzc2Z0lkVkRRT0RsZGs5?=
 =?utf-8?B?YnRudU4wNUI5b1Y1TEpMQzhQSFhBOGd4dm0xSFVFdVFFQ3ZOZGFBdkk2VlIv?=
 =?utf-8?B?cEYxZVh1NWppbnYwUHkxTnhzR01hdmdReXZ6NmdvVWN2VlJEVkwzbUdKRnQ4?=
 =?utf-8?B?Y2o2RkFDcWxpdXY4QWFiRE8ySElFcTV2dkhXZVBjSmMxM2Rqb2JmdDFOb1VH?=
 =?utf-8?B?YlFvOVVLREVVK3B6WDBpSW1Fekd5MXg0Y3lHYWtVbk81bWdhNXQ5dGtuWnN2?=
 =?utf-8?B?WmdtUWRpYVZQRnZIS3F4NG8vSmNSTjQreFlaNU1oalliZWMrdnk5ZHhwZU9q?=
 =?utf-8?B?Rk5GQXpzS2hRbWZEN0g3Z3oxMTBRdFFJM25pWXhmRmJjT3hFTHVyRTdQQjVa?=
 =?utf-8?B?NGd2WG8wZ091M3BGcnc3M2c3bmwxMXJTemFFem1qK3pyenRFMVFoVENxdzhh?=
 =?utf-8?B?KzJ2cW1wWEZra0NxWWxsbUVhZkNETC8yeXN2UXB4a3NVSFVRUTNpcVBad1Q0?=
 =?utf-8?B?OERjb1dvNnFEb0NRT29yZkdXbmwzUHhjTjdkWEVsZnFoZEp2bmhIeXc4M2Jr?=
 =?utf-8?B?NmVCcndiUmpXRVBaZ2NncmFTMUFqQ2w2bjFGWjJJeGgyM0NESlA5ZUc4RlJ3?=
 =?utf-8?B?dGU2Z0hMc3JuN3gwK0ZDcGRqMUVnSWlZU1hCYjZZNlRQYXBCRythTHhLZ0dW?=
 =?utf-8?B?WWdyM0VzbmZuRGRiNXZlWXNNeHNhL0lvUXRQYmpZRHh4M3FNWnYxSXh4Lytu?=
 =?utf-8?B?dHUwNmRWV1dTM1RvRDZlU01wTTBmRGdTWGYyZWovSmFxd1JRVHVFUmpYMlZz?=
 =?utf-8?B?Vnh6TlJsRjl3UGJiK2dKMG9GOHdYRUs0dkhqSjhuV3E2YXB1bEF0TzFTc25W?=
 =?utf-8?B?MEFSU3UxVTVRNkdGRUt4eEFCRFlKenFNdzUybEM2cnpMOTdFVktRT1Y4b2hn?=
 =?utf-8?B?Uytzd1cvcXUzMm5La0xVN2o1TkdjR0JIUkR0VDk3UWthUEdoS004ODg5ZFZy?=
 =?utf-8?B?SkNDbE02SjVXM1UyS1BzMWJLdjMyY2s2QjAzeUp1SDBLVzNENU0ycXdhUTYv?=
 =?utf-8?B?TEFLcnJvUlRXdTYzaURmMGJ3UmVQVXlEU0QrdzZncjU0eThhYVlXM0tXUUI0?=
 =?utf-8?B?VVRoMzFsM3dTSkdqWm5zL1kzOWVCUlFoK0kxbGt3TnpkSzkwUzJUTTlUU2R6?=
 =?utf-8?B?dndvR1VSU04yeVF4dVBqR2ZjV3NweHJ2akhSM29ENkFZTi80OXhYMmpKRUNN?=
 =?utf-8?B?MGY0QnAxYTFCWVUvWjNxQnFvc0tRRnRFUEREYTdWSmdWbVRtc09HM0UydnBh?=
 =?utf-8?B?aWl2UDE0aW0vU2p6M1c0dWJxdUFvdlJSckFPeUdwODk1Q2RjdHdycVp4YkhG?=
 =?utf-8?B?MU9ZMUJXSTNYamluVkhlNUx2NUlRc1Vtb1Yra2IrTlo2enVLVk03UlM3L05a?=
 =?utf-8?B?NWg5UCtyZDNJcHBXOE5sZzlua3FOdnYwVTFqbnNIalhnVG1RMXFZdDd4NzlB?=
 =?utf-8?B?N0JnRjAvV2tyaFVrR1Y1VVBhK3liSU9wdUphT0EydzhOWkRNS0JKNGw4WFNo?=
 =?utf-8?B?Q2p0ZDcwMXBCczh4QVRMblhjajhKRlF2RG1zL05iaHJnMUxJK29sZHlYZU5I?=
 =?utf-8?B?bk1Lczk1dUxmZVM0SXhPVmt2bTlRM201OWVnSkhSRkhjRWFoanhGd3g3M1ls?=
 =?utf-8?B?SWxmUkx1dnJyUlJCY1lxbjUwbkFyckpjU3o4WmNMS1lubkM3RXYrMy8vVHN3?=
 =?utf-8?B?NUl0RmxiN0w2YkJDd1JJMFYyd3ovNDRDNUltRVdOeGdUaWVlTC9kZDlpWFZ0?=
 =?utf-8?B?SEhUeWFEMFphZEEydWgxS2ZnVXEzQXZPemZRYWF6Z3U3Q1hiQ3duTmV4NEN1?=
 =?utf-8?B?TVlZVnJWb2xWMFMzTEU1cmlpK2NIMDAzbDNuaW4rMldMS253aENUNDdLaitH?=
 =?utf-8?B?TnlhUWlmSytSYzEwN0w5WGtkeXhTUEZoZ001SlYrM3NCMFFRZ3h6YkxDTG9y?=
 =?utf-8?Q?tRbSXc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk84M2NaZU5kV2NnSnFTSkpOUDNyUlVidWNsZkVEVnJvNWJoZ28yeThuWkJV?=
 =?utf-8?B?R0srYUVxK3ZWbklWdEl3dkhCQmEreEVBdmFDOUpNY0VXdk4xUTVRd0YxOFo5?=
 =?utf-8?B?K0pvbVR2dXhmbXZnWnlXbE5wK3krMG9zRHFHdnpDSFZSMUlDYlVXcEhKMmtw?=
 =?utf-8?B?eXBxUUtLRDllSXp5aFFiSXBiT3kxcldJMFZybUdXSlYzTXdVUDJHTWlGN0Nv?=
 =?utf-8?B?YkpVQkdYZEJpTkoyaFNaYlNCeEk0LzJSUXdjYVA3S0ZFcklKSmZpV3ZnbzR1?=
 =?utf-8?B?dkxnMDRvZnhqRkRqdXBkcStGaTVUQ1dvMnp3TE5xN2w2Y1I5Nkw4b0M2SXo0?=
 =?utf-8?B?UzlBRGV2eWxmR0tRN202MUFqY3NhZkVrS01BUGpxZU15RkhySjQvelVEamtu?=
 =?utf-8?B?UGNHWjVRb3FZK1Q4Tk9LTkN1NWxzZ05KN2xrS1lZWEQ2RkVDLzFPMkZvK2pR?=
 =?utf-8?B?cFlIQVBKcDFlaFQyWm5WSEszcE9qZy9vQlBNRWxkZEgyYTdnLzc3UDF0NFo3?=
 =?utf-8?B?NVNjSEFpNTlGWHZBMGJGcHBlM2NTSHFoVExuM01uaVE4alkxeGs0MFJDRmxF?=
 =?utf-8?B?UVllS2o2N2FIbGJSY2VaQThqNWVYcjhLTW5CSXJJL3VKM1dUc2paQlVld2pU?=
 =?utf-8?B?VlZGQUprQ05JZnROOWVsekJ5SUhtYTdoa2hOTU1paHZNYWdRWG9RaVhKWDdV?=
 =?utf-8?B?cG9QZkF1NHdENHd3eDN2SlpWTFgvR2ZqTUNjY2kwN0hVVXd0Y2h4UzVmZzNx?=
 =?utf-8?B?WVlEVUt2YTc3K2pWbldPZG5rUVlFdHgzYjZmVkoyNlNFSWxOcDFtekE4UmFi?=
 =?utf-8?B?Q1ZhNjNyNGtSM0FIME0wckRqVU92U2VTdndSM01hV3AzekQ5TEJsVjBGQVl4?=
 =?utf-8?B?VnV2b3I3bmpwT0tGdXZrYUtwb1I3WDFUanZ4UjNud3VTbEhuNmlzbGZKT2hx?=
 =?utf-8?B?Nk5KMnY4UkJGa1pXSTAwbzlLTTc3QzduaFVRaFdyS3ZQbFBIYWo1NzFkdDJB?=
 =?utf-8?B?L3BFdGx0NWNUZzFURVQ1RmduKzJCTkRPQyttZGhmL2VRN0NPaWc3Rk1pcVRs?=
 =?utf-8?B?ckl3RUhvMjhYTVJsMWxyam9wUDE3SkhKL1ByRkxVcHJocVZJZnJFMDVTWFBq?=
 =?utf-8?B?emlMTzdtcnJtNnVzTWpTdlFOcGVBNURrazYrOEtxRktzSWt1UytJTjFRbDY2?=
 =?utf-8?B?aXJ5NnZTR2M1cU1wL3hTVDczdjAwN0hHQk9iQ2tnRDd5VFdoMFZCelF0SHlB?=
 =?utf-8?B?VmRTeDdvcnNhejhoUFczR09xUmpLNmJHRjZoK2NDUVg1dXh0M2IyN0R5MSsx?=
 =?utf-8?B?cTNXTzQ0eSt1YzdSR1RrTkxGUEo5MjNiejFaL25CNHcwVWRlS2FsU3Qyakwr?=
 =?utf-8?B?MG44eFJJNHNWM3M5WFRqN2RKQnQxYUxaL2I3S3VSSmdieTZtYXk2S3JJSEdr?=
 =?utf-8?B?bVNaWjJ2N0M4d283SVNJVXpLeGFBZCt6N01TUzdrQTRpaXVFT2hRczV5SjNs?=
 =?utf-8?B?c1BrT3ppZE02cGtBUkM1c3pTV2FPYUVWMWhCZnhJUDJNKzdlRXFnUUpjWXFr?=
 =?utf-8?B?MkNHeDNTRDVCOWVSTTBJNTVxM3ZoOXVPNTdXUXRzN25pZDBsUm80SjRQcTJi?=
 =?utf-8?B?d2ZJWHFhUy9lMzhYV0Z5aVFYUklPWDBJNzBZdENGQ1ZmT0h6WWFSVEpGL29I?=
 =?utf-8?B?VG1uaERjdDgxTzJWaHFwVkN0ODc5UjMzQTZiSHgvWlZ3RThVNzFLNGl3UU9y?=
 =?utf-8?B?blozTzB2a2N1ZFkvTEFGdWRBaUlhUTNOSXBHT3gyd0UybXp0ZlFpMmdkak0x?=
 =?utf-8?B?a0VpdEtBTHpjZWR3OWQzY0w0UFIwa0NWTlBnRm1ISDFmaDNqdnBmcnBzTzZm?=
 =?utf-8?B?THc0Yll0Sk9HOTlMbXhrQS9WdUEzZi9semNnSWNzTmFjY1ZaM1dWcUJ3YUI2?=
 =?utf-8?B?S3ZjZ01CTTFEMzU3c0IwU2lwVkNSVS94bTVEcDduZ2NCSlNJR0I5dnB4emRT?=
 =?utf-8?B?WGp2VUZmb0RpQWdzMm42UHRJZXBJT1JTcHE4TEJJVUE4bC9yVjdTak5Cdjda?=
 =?utf-8?B?K2ZKTWNXMVM0TWxJaTB1MDBoR3ptWG1HZFk2bEVGWklVZG9DNzhTK0gya3RI?=
 =?utf-8?B?SVgreHFGT2pWV05MN0thSjJoOG9PTm5NeGdLYUxzL1V1a1FDZFpZbTBBVk1I?=
 =?utf-8?B?SVF0bmt2eDhVSXBLdUF2eFVPVGxQRWtxUGlST01oN3lSWUk3UzY4ZngyVXND?=
 =?utf-8?B?MklYQTNFazZzS0h5SUpRY0plWFpKWldVdW1LS3RLQVlsUkw2UXBTay9mUEo1?=
 =?utf-8?Q?ZtPmoFCe0R30zK1RDm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3826ca3c-1673-4e1a-7217-08de5e5ffa06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:25:44.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+hT4ThG3AB/dFa7OtYYaRmGJvGnmPdagpeDvLm5PZljmfLPkfWQKOFpHj9kxuoQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,effective-light.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:mid,amd.com:dkim,indico.freedesktop.org:url]
X-Rspamd-Queue-Id: BBE25A04F3
X-Rspamd-Action: no action

On 1/28/26 10:19, Timur Kristóf wrote:
> On 2026. január 26., hétfő 14:00:59 közép-európai téli idő Christian König 
> wrote:
>> On 1/26/26 11:27, Michel Dänzer wrote:
>>> On 1/26/26 11:14, Christian König wrote:
>>>> On 1/23/26 15:44, Timur Kristóf wrote:
>>>>> On Friday, January 23, 2026 2:52:44 PM Central European Standard Time
>>>>>
>>>>> Christian König wrote:
>>>>>> So as far as I can see the whole approach doesn't make any sense at
>>>>>> all.
>>>>>
>>>>> Actually this approach was proposed as a solution at XDC 2025 in Harry's
>>>>> presentation, "DRM calls driver callback to attempt recovery", see page
>>>>> 9 in this slide deck:
>>>>>
>>>>> https://indico.freedesktop.org/event/10/contributions/431/attachments/
>>>>> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
>>>>>
>>>>> If you disagree with Harry, please make a counter-proposal.
>>>>
>>>> Well I must have missed that detail otherwise I would have objected.
>>>>
>>>> But looking at the slide Harry actually pointed out what immediately came
>>>> to my mind as well, e.g. that the Compositor needs to issue a full
>>>> modeset to re-program the CRTC.> 
>>> In principle, the kernel driver has all the information it needs to
>>> reprogram the HW by itself. Not sure why the compositor would need to be
>>> actively involved.
>> Well first of all I'm not sure if we can reprogram the HW even if all
>> information are available.
>>
>> Please keep in mind that we are in a dma_fence timeout handler here with the
>> usual rat tail of consequences. So no allocation of memory or taking locks
>> under which memory is allocated or are part of preparing the page flip
>> etc... I'm not so deep in the atomic code, so Alex, Sima and probably you
>> as well can answer that much better than I do, but of hand it sounds
>> questionable.
>>
>> On the other hand we could of course postpone reprogramming the CRTC into an
>> async work item, but that might created more problems then it solves.
>>
>> Then second even if the kernel can do it I'm not sure if it should do it.
>>
>> I mean userspace asked for a quick page flip and not some expensive CRTC/PLL
>> reprogramming. Stuff like that usually takes some time and by then the
>> frame which should be displayed by the page flip might already be stale and
>> it would be better to tell userspace that we couldn't display it on time
>> and wait for a new frame to be generated.
> 
> I agree with Michel here. It's a kernel bug, it should be solved by the 
> kernel. I don't like the tendency of pushing userspace to handle kernel bugs, 
> especially if this is just needed for one vendor's buggy driver. (No offence.)

Well I strongly disagree. The kernel is not here to serve userspace, but to give userspace access to the HW in a generalized manner.

If this is caused by a HW failure then reporting back to userspace is the most reasonable thing to do.
>>
>> And third, there must be a root cause of the page flip not completing.
>>
>> My educated guess is that we have some atomic property change or even
>> turning the CRTC off in parallel with the page flip. I mean HW rarely turns
>> off its reoccurring vblank interrupt on its own.
> 
> I think a page flip timeout can many root causes, so it's unlikely that a 
> single solution would solve all of it.

That's actually what I'm not sure about. I mean what seems to happen consistently is that somehow the CRTC is turned off, who is doing that and why?

As far as I can see drm_atomic_helper_wait_for_flip_done() is called by amdgpu_dm_atomic_commit_tail() to wait for the page flip to finish. So the message comes from our DM/DC code calling into the DRM code.

That in turn makes the callback completely superfluous, we could just signal an error back from drm_atomic_helper_wait_for_flip_done().

Additional to that I don't see much locking here. Who is preventing multiple atomic changes from happening at the same time?

Regards,
Christian.

> 
> See:
> https://gitlab.freedesktop.org/drm/amd/-/issues?
> label_name[]=page%20flip%20timeout
> 
> Best regards,
> Timur
> 
> 
> 

