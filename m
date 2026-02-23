Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJg1HiwfnGmT/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:34:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBC173F5F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A2410E2A6;
	Mon, 23 Feb 2026 09:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DXZVvMRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013064.outbound.protection.outlook.com
 [40.93.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B810E2A6;
 Mon, 23 Feb 2026 09:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD1kRt6WT2JMnS6r5AkJHnVhYScVgIp04CAcvum4anJAJLgbDE68suXflGvVHvv57jt24a7gpq9QRMznMduRjMZX5/PGaDRL0qTw6wi9ZCZlO0w8xUcOkWuCJbhFOnDBWuOwGtubUfWAlhjxm2AH4w/Ln/LPZaq9D7asqnR8uc7nuHq3C4WGcGtFcblKH+DLtvIbTQWwtGBmB18l9pb5bNLNmuAols62ePt856gcIs4ujXVhIoZZrpK0HCOhLKVs2ErLAq2ZOgnHackaRxM3ckKfWQs4CvEsfyt4NOBQhP9oX/7cUr6zDkp5/lawShgx4gfMx5wNBUAYYLoX/QPdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUkZuuKwXtyxsJJIfpuUUQhC4pGK8feh9YXOMiEUTkw=;
 b=PHZP19atSsH1kaZSawQXEiRmKxnDYw2YZBNhp1Fajcs0obDzpRynR85z5XcfttZISowpjp3GitjGXyGu0//Q2MjpC0VbRHgkhTttZaXGx5XCG01oAPxzYUTfPqwqdQG9Dch9F/rIVRTHEZKBqtGDd7N49c94scErFdeqpZss1aoxzhTX0r60mOAQl5ATytRKnFPGZTuMRJ8nrpfny8Yz4VZgaFUNkrIsHo5QidAnVncTDMoAf4Gp2dRo04U47bhYA1EaMx3Wb4vDXd/66kkBJmmpLyJzdWhTbDZD9RfnGWPAXu36XZh4GGx3P8liGkdzi43Dnmu6p35KM31k/FbW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUkZuuKwXtyxsJJIfpuUUQhC4pGK8feh9YXOMiEUTkw=;
 b=DXZVvMRtrXqR5FRdsYg9mKcuKyAUnPayCBU4bC+tJuRgrAoNblvI+7JQDrINylwe27GP7Q2zwC45rxZXMveSw+TWSQvwTLonLsPnhkWWGJFEcOegeR9prhCQtRaigrvJuhs772Jz51vbq9vPJcREvsVuP3ZtU4pOmIJfUPlUL00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:34:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:34:28 +0000
Message-ID: <c5ef0c6d-3620-4c8e-8b44-0c217897e6ed@amd.com>
Date: Mon, 23 Feb 2026 10:34:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/amd/display: add vendor specific reset
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260220171518.711594-1-someguy@effective-light.com>
 <20260220171518.711594-2-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260220171518.711594-2-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 596ea1dd-e3e8-4d9e-e430-08de72bebd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXB6cTFYa1VCUTJ2OFE5bnpMNy81Sm9WcjUreFpVRWhRanlwbzlETElsbGt5?=
 =?utf-8?B?aGtjd0JDMVpyQnRCNVo0VnVuV1plQWIrUjByVHBBZksyWUtIVlJqZ3dVNUtI?=
 =?utf-8?B?NE1QekkvTjVMZkJVN3dpNElsS1k4aEgzaFoxaG1lUllpUTdnY3N5Mm5rbUZD?=
 =?utf-8?B?WmxqVVArcCthYTJPRmhES3N1eGZsQXdtYy9QMkV2dFdldG55b0h6QjBxUzgr?=
 =?utf-8?B?WEw3ZDVQdXdlS2dTNTR4WnNuSG9TdWdFbWlrb1o3cWNpQ202dnMzSEIyZ1R4?=
 =?utf-8?B?N3JHd0NNSDI4TmdZczlhZTVxQlFEL2hHeWNkQ3M5YnhqUFhzSDBrUC9sNm1M?=
 =?utf-8?B?SjU0V0VqbUo3ck5kYjRsSzZuc25Dd0N5a3NPOVRqNlliYU5TQllkWjgwQTh6?=
 =?utf-8?B?bDA2MnZmcStxY0xHekVQK1liTHJoZmozVjVxMnpMUlBEVi9yc0NNNFRUYnUw?=
 =?utf-8?B?cGFQUk9Fd1pjR3hvcG5WazFaTVlUOTF5N25rVHdDbUlJWERoMXZWdW96dTVB?=
 =?utf-8?B?RjkyeGU0dEF2UmtVeGx4cTF2QkQ0Q3VmN3J1MXcwbjUzQStKNVRJdmpDRDN2?=
 =?utf-8?B?SzltckpEUWtPb2o2ZkVBQWpUaFdoRmRBaHJlbExqZzJOSHlYM25qTCtSSmpy?=
 =?utf-8?B?cml2Mjc1M0k1a3piNTY1bkJYdUZyZExJdUpVbVBwRU5SV0dFMFpOelpYMWlq?=
 =?utf-8?B?a1FTRTNNekJiR2Z1cjBlVFNEeFRQNGVXdE9Id1VUeXk0eDdJbVhHUkkzcldM?=
 =?utf-8?B?OVU0ZzBveXk5M1krR2F0VHdNUHh2M1ZlNTVUbEJNaWxCYWtRUzZBK291MXpP?=
 =?utf-8?B?VFB3ZGw4Q2ZjOG5VZnU1QjBvUU1CSCtrcEEzM3NlUlZGYy92UDltV0tPcHJK?=
 =?utf-8?B?eSs4aFNEUy9La3NWMnNYbkZDNC8zL2V0V2tqT3RoVDlYNEo1bEM3UVkvS2FG?=
 =?utf-8?B?SGovNXdyamRQVVg3dkQzL3duZDBTNXVtTUZTbDJLRFdLektFL2tXWk5pcGxP?=
 =?utf-8?B?Yitva09JcE5USG55WGNKWGRtWVRwRERTUmx0Y090eXgyNVdrQzhHZzYvSnJL?=
 =?utf-8?B?MnhHN1JFNWlDM0FNYWd1VTMyYVhMdEhLUURnVm5MVmhVUDBTSFZGRzJZd0lU?=
 =?utf-8?B?OS9RbTJyUExRY0duelJMcXNGUXoxUlNMSnRsUmlzRmtSSlovclZ0TnUrV3Ru?=
 =?utf-8?B?UW5JZ2ZRNzA3Z3VpUGtVTlp4WFJpN3pzSS80ektqQmRtUDJsV01VY1hjcC9X?=
 =?utf-8?B?RXljWHNyMytkMm9yelZqdG9mVkxFT25PakhEajdIeDFuL1RFbW5YRld0ZmZB?=
 =?utf-8?B?cWhSYlBuSER3czMvb1AyVk5OZHVodmpIUmlldCtUaGNMcmJwTmZrdk9hMkFt?=
 =?utf-8?B?QWljY21tN0c0cGJ0b1RRQlFkN2pDK3gvN20yTlkrVzV6dzJaWjU1WmNqdkZH?=
 =?utf-8?B?bjNJcTgyUmNCdXBvZlFjSm1Rc0pkaVhDV093dWExcUZyWWxkSUl2VUJQaElk?=
 =?utf-8?B?QjV4WlRIbUZNOEtqYi9DcWZRL3Y2aU9LYllNSUFITitCOUNsNEt3SmZOYVFX?=
 =?utf-8?B?V3NudlIwajJucmNVMFFDZTVYZ2JtMkpEdm9FUFJHYlZCcXo0K2x1Si9pQlR6?=
 =?utf-8?B?cCsyZllsYTdsT2hsbXYwWVk1bTUzK2FwcFl6NGxUTmMrQ0tualVmQVpWVVg4?=
 =?utf-8?B?Y3N5ZWtFMzM5a0JxMGlVRjVPMGt0cHkwa29uMUdYc2pDWTdCQkhoUHk2Nmx1?=
 =?utf-8?B?TVJ1WnVua0dIeURvck1xamNXSmtwanpmZkxLYVhnbmdpOHVxdDRQckpvYXg4?=
 =?utf-8?B?enphQ3BxRjh0OU5tWjhoNEhab0ZCb09mMS9sYW5HWDNYLzRBNG1JbExmN2dJ?=
 =?utf-8?B?MHBKajJncnVEWjVVQVBlMVNmcnRjRFVNL2w4WEJPNER4RWtPUHhFM2I1R282?=
 =?utf-8?B?bjJWNnB3NmlTWVkwK1lyRUdMQUs5M1k2LzNEc3VDNnFXTjNYWmwvSUNRT0Z1?=
 =?utf-8?B?WllGbU1aSTVZM3lPeGI5cXBRMndvbHJvUGEyNm5aQVJacm5acm9GUERjYXI0?=
 =?utf-8?B?MkRlOVNNQlhxaTFjbm1EcUxMRDdXT2lDN1MxcGtZMU5ucFFRek5aeW52WkEw?=
 =?utf-8?Q?nLaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dkMVREK1cyQUc4QmVOTi9SS2t5WFZOS2N6K1ZXM3BqSHdOT1pnK2xoNklQ?=
 =?utf-8?B?UlVWNkFtVmNMbEl6ZkdxWVozblRXQ3ZXeFNBRk41SFFVSG1YbUNvbWE4Rm9i?=
 =?utf-8?B?Ym5xeG5YQ0srT2QvaElaTkt1NWgwaXBNL2tyTGNwRHRSUEpMMkhLQ3BrZWRl?=
 =?utf-8?B?VGxRSnVJMEZKbTU5MTlNL2ZQbGNGVWJWOXZXTjdVdlBJWUd4NmgrdGYzQTFI?=
 =?utf-8?B?WDgrMWNWWVFGOFcrSjVmSjlrTVBkQWUzM1VLK2ZPcElvTkVndWh3NkhFbnhP?=
 =?utf-8?B?cnZST2RydjA1UjUrSjZrVDNKb0tma0V1WFNlNk1tNmNackVLUFN4S2ZRdWpp?=
 =?utf-8?B?VnB2T2hMQ3ZYSEc1c043a0hjekNDMXRuRklGdHdnbmdyQ1JaZU55ZnNYb0FU?=
 =?utf-8?B?ZCtHS2xHU0JlRWttRUpHamFJSHNOSFoyNkJaeFZtQ0pXNzBqL1c4b0lFQTF5?=
 =?utf-8?B?N0lnUUJjNmRsSkg2eDNrZzJHNHVFUkw0Y0tqWWx1elJ6VnZHTFpBM0cyNWds?=
 =?utf-8?B?NHFwK0M5WXFKenl1cHZ4L1ZreXNHQjRoV1lJYXZGb25IK0VvREtiNllqMCtK?=
 =?utf-8?B?N0xQVTlZTEYxdVZLY3pjOCt1Y3hUQXV1T3B2QWh5REx6VHZueUc3ekwzNFYr?=
 =?utf-8?B?MnN0OW5XS24wN1FDV2ViMEVYTUx4cklwdVJPeERXMkdnVHB3aEpTdHRubFdN?=
 =?utf-8?B?TzZ1T1M2S29OUFlEMFFtVnpWUTV4VFNSa3IySFI5SHJSOFpvSVIxZWV0YlF2?=
 =?utf-8?B?TjA0TkJjaW43aS9zaEtPUXk1SjFiUVBkbzNTcjU2TnNJS280SnpkdE9VMmxC?=
 =?utf-8?B?ejk1L3hoK0Nxc21FSnBpc3plQXNmcFBNSTVMazFONHludVZsWjg2bWkzQVpl?=
 =?utf-8?B?OWl6eHNoaTBaUStqMHc4dCs0WUNXL2RwMVZBanRqNmtxeUtSNXVuTUh5YWtN?=
 =?utf-8?B?L2ZPMThmMDBoQnlyRFRkLzM1Yysyb2lmU3JLNXFVZE5PWk51NEZrZ2lYbGVQ?=
 =?utf-8?B?SlBMQkg1dUsvRFBVNXRjRHFoK3lxM0tsVGJDMzNsWU93VHV1NEZZZjAvVFFl?=
 =?utf-8?B?U3pmVzllKzgxRVc2UTZ3UDFUdWQ0K1p4SDJlU3JSbGU1K2d5Z2dxclE2U1dK?=
 =?utf-8?B?Q3NXTjFkOElvK0x5bGVqWmdvZy96VFdhRVNwVDduamNvWnhYSXVzeXVVbyt6?=
 =?utf-8?B?eENSWElTeWhRanFvOEFxUks3d1pRK2xycXFOMk5CY1ZWangrb01MMHQ3WXNp?=
 =?utf-8?B?cTBJK3RkeUNYK3R5QzFIYUphQ1J5RU1waEFQTjRjWjk5SkxCVGtCMndLdThP?=
 =?utf-8?B?a281Z1Y0RHZINURKRFpiNmE1QWlBa0Z2dW1RK2t2ZE1pMEhvekNMbm5xNGNO?=
 =?utf-8?B?ckpGaTNGUllBWmNnZGhUVDNSNkJIVUpnVlFHVlNGTkYzaVIycjQxelROYlJ3?=
 =?utf-8?B?UDl3bU1LcVdsM3pSbVh4Yjh3aGhHd1U0R1dheGJqTlh6Yy8zcU52eWN6SjRm?=
 =?utf-8?B?bjZ5cHIwWk4zUUczT3Y3N29tM3FNQTNDRExRMWlOS0hRbUlCdk01NGMzOHo0?=
 =?utf-8?B?RkZnN3Q5czdZek5sUTFJM1JkZjN3bkxnV05wa2djUzBuWDFHakxndEg4NzFn?=
 =?utf-8?B?bEg5T205RitxckV2QU5RK25kbEhGVHNESitQL1BEbzMwUzRJWVJXamZMNnlv?=
 =?utf-8?B?SjhUcjJlZzVqbnBQczlGV0xjZytKMXByV0h4QWhkVmIyOGQyYmFaRkZNemF6?=
 =?utf-8?B?a0lnaXF4UVEvZm5rbWgwZkVsTnBOM1djOHlLdTR4eFZ1WlAyOStidGNsRWE4?=
 =?utf-8?B?T0d3L1B1RDUvcUZMaFQ4emFPSWxhMW1ONlZwRU5iaHlZVjVZWWllL0RPRm94?=
 =?utf-8?B?NjBOSFZlZi8wei9kRjhsOXRlNkRZS1RONGJVL1JaVkt2KzdVcDgxMFpLZnMx?=
 =?utf-8?B?MHNINnFQSmx2U3JFcm9hNk5UaUFhZG5zaWN4KzVaRUpkRzJ1ZnI0THFQcFZi?=
 =?utf-8?B?ZTE2Y25mTkczaUhIRk42MGtJNTQvazgvaFpaN2FXZE0rVm53VXZUK3IxQlE0?=
 =?utf-8?B?d3pJUW5veXBIdXRrOGZDUzF1NFAwZHRYMlYwTzc5MHJzS0JmTjNObVJxdGxF?=
 =?utf-8?B?anJabmRQSE1neFJCUVNVQWdiRE5QRDhZRGdPK3dseVh2SnNHMTZ1blZoNXNp?=
 =?utf-8?B?UURoejd1QThTRzhzd29CYmExTEVXV2U3WDAyZEY1aXZDTzY3OElQcjF2dTBa?=
 =?utf-8?B?V2NTRnlrS2FoR2dOUUlKRWVSMjRxRGpLenZOa2FCSmJiOW9rUkFSOVYrSGtB?=
 =?utf-8?Q?avcCG1jGpnRX7gD5cL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596ea1dd-e3e8-4d9e-e430-08de72bebd76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:34:28.4124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qLQzq0MEma5x+bN7RhoSZY4qFDVCh6uKapqZVihHwg9HIOUyugP6ayv/GDBRQ6O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:email]
X-Rspamd-Queue-Id: 29EBC173F5F
X-Rspamd-Action: no action



On 2/20/26 18:15, Hamza Mahfooz wrote:
> We now have a means to respond to page flip timeouts. So, hook up
> support by trying to reload DMUB firmware if
> drm_atomic_helper_wait_for_flip_done() fails. Also, send out a wedged
> event if the firmware reload fails.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: send a wedged event instead of attempting a GPU reset.
> v3: read return value of drm_atomic_helper_wait_for_flip_done().
> v4: only send wedged event if firmware reload fails and send out "fake"
>     page flip completes.
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7c51d8d7e73c..0ae6ada22fb0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -87,6 +87,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
> @@ -10829,6 +10830,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	struct drm_connector_state *old_con_state = NULL, *new_con_state = NULL;
>  	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>  	int crtc_disable_count = 0;
> +	struct amdgpu_crtc *acrtc;
>  
>  	trace_amdgpu_dm_atomic_commit_tail_begin(state);
>  
> @@ -11085,8 +11087,26 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	/* Signal HW programming completion */
>  	drm_atomic_helper_commit_hw_done(state);
>  
> -	if (wait_for_vblank)
> -		drm_atomic_helper_wait_for_flip_done(dev, state);
> +	if (wait_for_vblank &&
> +	    drm_atomic_helper_wait_for_flip_done(dev, state)) {
> +		mutex_lock(&dm->dc_lock);
> +		if (dm_dmub_hw_init(adev))

From Michel's explanation that is pretty much a no-go because it potentially causes other atomic commits to react in unforeseen ways.

> +			drm_dev_wedged_event(dev, DRM_WEDGE_RECOVERY_REBIND |
> +					     DRM_WEDGE_RECOVERY_BUS_RESET,
> +					     NULL);

Please completely drop that. This here is a sledge hammer and not going to fly anywhere.

> +		mutex_unlock(&dm->dc_lock);
> +
> +		spin_lock_irqsave(&dev->event_lock, flags);
> +		drm_for_each_crtc(crtc, dev) {

This should go over only the CRTCs in the atomic commit currently handled.

Have you tried sending a hotplug event for the connectors in question as Michel suggested?

Regards,
Christian.

> +			if (acrtc->event) {
> +				drm_crtc_send_vblank_event(crtc, acrtc->event);
> +				acrtc->event = NULL;
> +				drm_crtc_vblank_put(crtc);
> +				acrtc->pflip_status = AMDGPU_FLIP_NONE;
> +			}
> +		}
> +		spin_unlock_irqrestore(&dev->event_lock, flags);
> +	}
>  
>  	drm_atomic_helper_cleanup_planes(dev, state);
>  

