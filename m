Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF779C46CD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 21:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94C210E1DB;
	Mon, 11 Nov 2024 20:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjToWled";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAAF10E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731356956; x=1762892956;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QeIVx/N5alsFYswRNyn812QtXWlTWcjjJILmqu3MhFQ=;
 b=gjToWled3qwvk3eS5LSTRcSIh9H9OdH5VHlVnOtEzqFkq0NeVZCg4f8A
 Ou6a6vVVu8TWsRn3BeMDYhzDaw2qIg3VVG1XKLQTtSs1evCHcAjNq5vks
 XAlNhvJg3Z3PzRPHj9RgBD/8FlkVXzOtR0OJNSPX4dXkSlQUxfl7kheWS
 h93KPmyEitbuoa6ZZ1sd++jz9bq/+f13rLDK6ZD9FI8CMIWE0lYmRjRCX
 esQqZ8fEf5fqmU9r0n3BXKRa23hASBaXQ56o8b90bHqGONKuM+ZhRmDWZ
 KnsOXG4OXFBiBHAu+Z/sfBkHiODqajDmF+frAQG0gGZaZmVOXZI+UkYng w==;
X-CSE-ConnectionGUID: 3tc0Zz5AS7KsTi100wD6IA==
X-CSE-MsgGUID: qPCawhJ0QVW4acV9mwtfyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34966497"
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="34966497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 12:29:15 -0800
X-CSE-ConnectionGUID: ch7wpMEfQAGTxexLllz8rQ==
X-CSE-MsgGUID: 1iqg5Ld8SfO022O/ZQhXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="87232207"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 12:29:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 12:29:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 12:29:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 12:29:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOMSgbwukp94qdYl4h6WWunqYMwqju0jnrDQi2XvgqjSijg4kyZB9FHSUdlllAsbLN6EDoxwPGB1K5AY6TSHuQ/YHyALb1CaSf/b5qUDtUbl9amUP9PlVwM2E1IV9nmJXOFcRE01jU3IdVGPdIk8swvyHmGhhs/vo/rapVy3PEgl847YTcH7tVs5EcL8Ewx1junx5cTlm1c9Bc0nUWUZkeBYe4P218Ieo8nIsGPoc3uiY5Pa+drDaobSS1vgeTgB+5p3xR/zGWrxmm6WPSleglTszVr07lj0r0bZieN5np1FrMury8ALa+yA4UGCcToEGX0TVQ6qYeiOZbAuY3f0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPX7OVMNsfkWcFbCmCeJT9PcKkPgxC9SJ3dCGcsuwrs=;
 b=eAbw+0ktjhazSRdeAOWoVJko6Ho/60a17GgzV2TpctOroeqkAHcAdvsEtCB15xHWH/5VhM6NbvH9Cg59nlD8ptely0DzYg5vaTLLFAa29j4ZOH0204gZgEyzw+Mw0V3sbu2g1COBpib/oRD4hNNXK8EKzEkBM7OhB+OCr72PmRU4QLNpRARWpPIt67RXg2fySOPwMjxwZDdaK1MnQfJxnuscQBlRC7K6+Zpkxfh54PceyR8cKnSAUwH6mDQZ2ZUK5F/LSeMhtOdtgeaqCbk87KsLjP/VUbiGV+aAWteDmkKpoV50Dgf3CnxQb4E4irIW0qyIGe4O4hiY6/j1Rosjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 20:29:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8137.019; Mon, 11 Nov 2024
 20:29:06 +0000
Date: Mon, 11 Nov 2024 12:29:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, "Mihail
 Atanassov" <mihail.atanassov@arm.com>, <linux-kernel@vger.kernel.org>, "Liviu
 Dudau" <liviu.dudau@arm.com>, <dri-devel@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Ketil Johnsen
 <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <ZzJpMnjXErxac1DH@lstrano-desk.jf.intel.com>
References: <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
 <ZvKGzSeA7OT-hZQS@phenom.ffwll.local>
 <Zy6QVH9FpAI32hMz@lstrano-desk.jf.intel.com>
 <ba1bf723-1f0b-440e-b7eb-87dd94d8aba8@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba1bf723-1f0b-440e-b7eb-87dd94d8aba8@amd.com>
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adb57ec-efe9-41d2-8aee-08dd028f7d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWVMTGkxVkpXUWQ3U2hmT2drRG9LSDR0d25kRVBjbC9mWmJlNXluWks1cG1R?=
 =?utf-8?B?VWtzZ2s5UERzUGcwak4zODRYWkdLVklLTWlMZXJ5Qi9icGRmU1R0dS9qZytM?=
 =?utf-8?B?S2lDQlkrVUE4K3lHTGsreFpnYUYzcm5LRW16aDVMOE9SVk9WMXR1TVlReG5s?=
 =?utf-8?B?Zm5Qbkt0Z3F6ZDhTR1FpZzYyZHlBOWFvU21vY1R1TFgzRWNGZnFuUWtGTkdG?=
 =?utf-8?B?NnFsQjlId2l4b3ZwL0k2dncwc29ST2ZuYlE3N1pZdzdxWisrdFdsWHc2QW9O?=
 =?utf-8?B?eFZqTHh5YmNmMlo0QXFFZFExS3QwWnU1TUFTY3FOaUhDNExVMFowOHlZZEMy?=
 =?utf-8?B?SnVMQ2Y0WUNGb1QyTm1PeEJCdXJySDNBVjVBY3ZPQkhISkFQNkkrWmhhSXd5?=
 =?utf-8?B?dlpPODRPb2NTT09Ha0phKy9jdTBwekQ1YWZSTjZIZHRuV1FYUEd4aGszdEN3?=
 =?utf-8?B?L3RLaE52SGJ4bVREc0JzMVFGeU5ZVVJxczhBUXp4NXVVdkVzSkowcTVPT0Iw?=
 =?utf-8?B?SXdMS2pxTjR6RUhCRkwyU3dlUmVWM1hCV3JkZExhZXRHVlNveFRYaHptMjl1?=
 =?utf-8?B?UkpSTnVUYWx3ZnB4ZExhMVQ2SFpyeUJYOEtGcFRrTGlxT0IzMFJlWUpwa3h1?=
 =?utf-8?B?N3ZqTTN2RXZ2RDhDSFg2SkFhbTdPUTQvdUJ6N0VZK2ZtRXpLTEp5MXlhN1Jh?=
 =?utf-8?B?d3pZODY4WXo2SmlJMUFwYXdVMjZZTUhLOEpKeFlnNGg3Zk5heUFwSElYZ2Q4?=
 =?utf-8?B?WFpRekx1RmdBcWMzN0l4NStvU2pIdm9YTmhEbk9FUzlta1h4cnhia3ZtWVpM?=
 =?utf-8?B?V0U1bzA2dmRvd3pRWWtjeUdLTEk2N0IrUkNoZHNVc3RIOG9YOHFodjl3ZC9Q?=
 =?utf-8?B?K1ZrOVlnM2FMRjI2UzRkeDRyaWcxaWJ5NmJPeHlSMTRCNHdKYmkweS9TcFBs?=
 =?utf-8?B?Z3F4NVZNWnNXbHVtWVluelUvNmRGRVBHR3JrMVdHSmdYM2M5dTRHTFZwcnBG?=
 =?utf-8?B?alN1aEdLb3Z1VHN1dnNyRFBMb0puSVpuN2ZOVnJSa1ltWDhLczI4SVBqZmlL?=
 =?utf-8?B?MklrYkxQNVZVK29oSXlQSDNnc3JQaEtrY201bTFrRDM4dkdGclZXYXBhdjJH?=
 =?utf-8?B?VWJBMlRKbXpscjE0UTJCQmxManN3VFY3VWY1cXJ2TW1EUDdSNHdmRkJWL1Bo?=
 =?utf-8?B?TWJUV1NrVnJ3YWRSaDZuS05MaGVVSFN6NU5oYlB3V090QUNrRmRGLzhDc1V6?=
 =?utf-8?B?V29rQTI4cUdSVWswZXM5bnFxM0xmSDgyb0o3RVdYWWpqTzB6d1dGVzBBNVM5?=
 =?utf-8?B?QUk3TmFDc2NEVGV3MUFZUXhwSmxuOXB0bDVuenB5OG1wTGxXMVpxWlV0eFR1?=
 =?utf-8?B?RXQrdjkwRVN6NkV5WlQ2eWpXR3luY2xmWTZQbjRBSFJaTWw3UHROcmZlem9G?=
 =?utf-8?B?SzBEb2xTRzB5UGFCUWJiY0E0WGRXYXpHSGxzbDArSmhLYXlteXZrclFiSWpy?=
 =?utf-8?B?ZThBV3BJYXpKRXE2QXhyZmpuVGFrazdLZll2bjJDcVNDZFdNRFhubXN3dDBi?=
 =?utf-8?B?VENyMjgrdFNSRFBNRnJ1SHN5ZkJsOWdBYytmSzM1MmVzUU9Uenc4WU5tWkZP?=
 =?utf-8?B?QTRobHU1eE90T2VXeVNNNWZPckVjU0g1RzRTa3h6UVRjUTRkVllBdlRLeDNw?=
 =?utf-8?B?YmNMYmtFVWxCREVPNG9nRDVMUldTZTY5SzZXTnh2UE5LOVBqMVRua1Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjUyeGp3cHZqZm9Jc3hiZGt0cU5OaVh2aFg2ZXNPWkhXT2dBSUZibkJxV2Va?=
 =?utf-8?B?cjJHM2VKVHdsYzBLUEJZUC9PeHowNFFJNFhmc2RCVC9mcUg2bDV1M0cyNDk0?=
 =?utf-8?B?UEpwTW5NN1BFWUZSMWhTc2dxNm80N0hwblhzUE91aXYyMmY5QWhDWHBGWnVx?=
 =?utf-8?B?UmFsKzQwTGZFZEJyYU1GSWoxcmV1R25PTUtmb0loRGkxNjdsTFl0MXJQQmVr?=
 =?utf-8?B?c0lvSWx3SEMxUkljd0M2YWUyL0FlY05aQkpwWWJBZE9ZdHE3WEJJMU1GdVlK?=
 =?utf-8?B?YzZUdVZBNTJDZ295bSt1Q0ZqbW9nczB3TE5zT1djK0NuV21Icm5BS2xVWjBo?=
 =?utf-8?B?MlkyTWwwQWlHcldVSTFoRmJRd3ZCRHZEY2hWTllvQ2NSdnBGZktXM2hVbmFU?=
 =?utf-8?B?UmNlUlU5b25ZZjUyZDZObFViRDJ3YWxKSDZTaEJTYzJ4OTV4aWd4TyttSGdX?=
 =?utf-8?B?cmQxemM2K1psNGhSay9WYUVpV1pTd0xmWmpUT3UzbWVDVXNEdTBwK0tYOUVW?=
 =?utf-8?B?eUt5THVRTzRwZkY0OE4yaEZzd2xTdzFUNDFSSFZEWDgzcmxFVUlvOXRhMzhw?=
 =?utf-8?B?QjZKTnBsRGd4NUNVMUV0M2JQczE3U1RmaU9ZaytPM1ViSzdBZWRMS0VRbUpI?=
 =?utf-8?B?ZjhFV0hmL0x3K05SOUZWNG5YWFBTaFdwSnhJRmNHQWZPTnUzbk9zamI5RGp4?=
 =?utf-8?B?anczdzJORlhQbE0rd2Z6emNSYm5Ua05WNzhMaUY5aDN0UVR3eEdOWnE2Y2VH?=
 =?utf-8?B?cUtsbGdHZ1hqZHVidHVNdHB2N3l6aGpXUEtTdk84N1hwV0l5cGFobnVBTm5W?=
 =?utf-8?B?MWxkZFZWN2xvZ1dwaWt3SUZaVUVpbjUwVytVNmY0TTkxU0gvWk9nbUk2KzZL?=
 =?utf-8?B?UmcxSlp2WGhmNEUxMnIvN0JvZDZacXRKT0xaSnJzM2QyV1dPQlBIQnNUVVZR?=
 =?utf-8?B?TTNGT3pFNjBYbjB0QVpXWitJNnVISkhJUy9VUzFtcmQ3YVVlMEl4eTRSREp2?=
 =?utf-8?B?c25UaGFGeDBrbUN0Sm92N3lwZm5aN1VqVHAwekUyeEh1Q2NKOWNJWXJIMFl5?=
 =?utf-8?B?ZnJoNWpGckFFT2VLbnJXRWJONVdwVVBQS0xyeHdnaFZQdW1uL1lFdUFjUzVs?=
 =?utf-8?B?OHVFaU1UVmJWNm5UM3NKZ0dqdXJROWpuekFMczAwc0lkQXFDMkRoVEg2WHFj?=
 =?utf-8?B?eTRqNEJzSm1UUVRYbXl4VnZmMG8xNWl1L0FvS1M4THg4eVluSnJzL01KRGhP?=
 =?utf-8?B?WnRBRTBLb3RXZG9xTlpteGxCQlErV0IzRUVLZHRJWkpvdDBRSGxXZjFEdEhX?=
 =?utf-8?B?NW1maDh1ZTFHejVrMWZzYnN3R3Z6N0ZLbVNhbkVlMmtGTWUxNVJ1aUZTbmJ1?=
 =?utf-8?B?UktiTDhQakx6R0RqTlFJNm4vYUlDRHY5MU9lOU43ZUlHL09tQ0hVQ2pmU2pN?=
 =?utf-8?B?RytRdEdjYUU4UzNiZjBIMnBZTCt3L20wc2NLL3VrcGlYV2M3TTVvMWlsWndS?=
 =?utf-8?B?UTVXMWE0QWkzZUhpTitRMmx6VFlwVE43MUkvVzJ1L1d3Tk56V3gxMzdGV1pu?=
 =?utf-8?B?Y1lUcHpuSVV4MkZyaUFwTEZhSHpzbFo0dFFoNWxWbXR5dDZGTDhWSzZxdXlx?=
 =?utf-8?B?NllGQi9jMWpsZTkrOHlLcThvK1crWG4zb2hPRmZZalIvdElOcERFSHVjbGhH?=
 =?utf-8?B?WDhqREdzTXZJNFlNck9LQUVqRUtrdlBqdzEzZEZIQ3FpTXEyTzdZQWs3RkxE?=
 =?utf-8?B?d2dZOVlMM2lWU1NtRlhuMzY1VDVnaVhsOVdHRFB4c1hwdHkwdDRPQnR3c3lL?=
 =?utf-8?B?WFpLUlhvRUVYY0dJaituQ0ZyTzhIOGdGQldVa1A3Ky83WEx0dDlFb2dhYmlu?=
 =?utf-8?B?SHJHNTI2N0UrMTJMd01wZ2R4Tmw4MjhyU0hHSURGTjBWTjVvSWFwK1dyVkNN?=
 =?utf-8?B?UXRlYXBWSUMvSXhMT2RQMXlCRnE0ZGpCSzJoZ3pIRlMyQjBCM0l4NStYNnFZ?=
 =?utf-8?B?bDNZOGJOWmQ3Z2hSSmJveHFzWHBPVVp3WUYrYmxkbDBDNlo2MlAyWmxCMXdv?=
 =?utf-8?B?MWthbStvcEgycTUvQlNjZHNXYXg1d2JLZm5oZUtJRHhnZzNGV2lqcDF2L3Ft?=
 =?utf-8?B?ZlRCOFBEcE96V3RhL09CRDhvcjBhTjA4T3JlSTVnTUF3b24yY3hVUXdxcFNk?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adb57ec-efe9-41d2-8aee-08dd028f7d12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 20:29:05.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs/R6YUWyNGQlgsC/yFnnLH9Gvm9FyBO9D9pQs6H7SvD8aFww7XoAKFUd1EUFhshdk6H/eVuf1/FXnlrwctDJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
X-OriginatorOrg: intel.com
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

On Mon, Nov 11, 2024 at 01:57:15PM +0100, Christian König wrote:
> Am 08.11.24 um 23:27 schrieb Matthew Brost:
> > On Tue, Sep 24, 2024 at 11:30:53AM +0200, Simona Vetter wrote:
> > > Apologies for the late reply ...
> > > 
> > Also late reply, just read this.
> > 
> > > On Wed, Sep 04, 2024 at 01:34:18PM +0200, Christian König wrote:
> > > > Hi Boris,
> > > > 
> > > > Am 04.09.24 um 13:23 schrieb Boris Brezillon:
> > > > > > > > > Please read up here on why that stuff isn't allowed:
> > > > > > > > > https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> > > > > > > > panthor doesn't yet have a shrinker, so all memory is pinned, which means
> > > > > > > > memory management easy mode.
> > > > > > > Ok, that at least makes things work for the moment.
> > > > > > Ah, perhaps this should have been spelt out more clearly ;)
> > > > > > 
> > > > > > The VM_BIND mechanism that's already in place jumps through some hoops
> > > > > > to ensure that memory is preallocated when the memory operations are
> > > > > > enqueued. So any memory required should have been allocated before any
> > > > > > sync object is returned. We're aware of the issue with memory
> > > > > > allocations on the signalling path and trying to ensure that we don't
> > > > > > have that.
> > > > > > 
> > > > > > I'm hoping that we don't need a shrinker which deals with (active) GPU
> > > > > > memory with our design.
> > > > > That's actually what we were planning to do: the panthor shrinker was
> > > > > about to rely on fences attached to GEM objects to know if it can
> > > > > reclaim the memory. This design relies on each job attaching its fence
> > > > > to the GEM mapped to the VM at the time the job is submitted, such that
> > > > > memory that's in-use or about-to-be-used doesn't vanish before the GPU
> > > > > is done.
> > > > Yeah and exactly that doesn't work any more when you are using user queues,
> > > > because the kernel has no opportunity to attach a fence for each submission.
> > > > 
> > > > > > Memory which user space thinks the GPU might
> > > > > > need should be pinned before the GPU work is submitted. APIs which
> > > > > > require any form of 'paging in' of data would need to be implemented by
> > > > > > the GPU work completing and being resubmitted by user space after the
> > > > > > memory changes (i.e. there could be a DMA fence pending on the GPU work).
> > > > > Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
> > > > > that means we can't really transparently swap out GPU memory, or we
> > > > > have to constantly pin/unpin around each job, which means even more
> > > > > ioctl()s than we have now. Another option would be to add the XGS fence
> > > > > to the BOs attached to the VM, assuming it's created before the job
> > > > > submission itself, but you're no longer reducing the number of user <->
> > > > > kernel round trips if you do that, because you now have to create an
> > > > > XSG job for each submission, so you basically get back to one ioctl()
> > > > > per submission.
> > > > For AMDGPU we are currently working on the following solution with memory
> > > > management and user queues:
> > > > 
> > > > 1. User queues are created through an kernel IOCTL, submissions work by
> > > > writing into a ring buffer and ringing a doorbell.
> > > > 
> > > > 2. Each queue can request the kernel to create fences for the currently
> > > > pushed work for a queues which can then be attached to BOs, syncobjs,
> > > > syncfiles etc...
> > > > 
> > > > 3. Additional to that we have and eviction/preemption fence attached to all
> > > > BOs, page tables, whatever resources we need.
> > > > 
> > > > 4. When this eviction fences are requested to signal they first wait for all
> > > > submission fences and then suspend the user queues and block creating new
> > > > submission fences until the queues are restarted again.
> > > Yup this works, at least when I play it out in my head.
> > > 
> > I just started experimenting with user submission in Xe last week and
> > ended up landing on a different PoC, blissfully unaware future fences /
> > Mesa submit thread. However, after Sima filled me in, I’ve essentially
> > landed on exactly what Christian is describing in Xe. I haven’t coded it
> > yet, but have the design in my head.
> 
> Sounds like going over that design again and again was good invested time.
> 
> And yeah we have it working and at least so far it really looks like it
> works.
> 

From the progress I've made, yea I think this can work with some
cooperation from user space. Engaging with the Mesa team this week to
get a more clear picture on that end.

> > I also generally agree with Sima’s comments about having a somewhat
> > generic preempt fence (Christian refers to this as an eviction fence)
> > as well.
> 
> Well that is really a bike-sheet.
> 
> I don't care if we call it preempt fence or eviction fence as long as
> everybody understands what that thing is supposed to do.
> 
> Probably something we should document.
> 

Agree something common / documented would be good given how tricky this
will be to get correct.

> > Additionally, I’m thinking it might be beneficial for us to add a new
> > 'preempt' dma-resv slot to track these, which would make it easier to
> > enforce the ordering of submission fence signaling before preempt
> > fences.
> 
> That's exactly what DMA_RESV_USAGE_BOOKKEEP is good for.
> 

We can move this specific discussion to the RFC I posted. Saw you
replied there and will respond shortly / once I have followed up on a
few things on my end.

> And yes, I spend really *a lot of time* planning this :)
> 

I've looked at the list and bunch of patches are on there modifying code
which is not merged to drm-tip. e.g. This patch [1].

Trying to piece together what AMD is doing compared to what I had in
mind is bit difficult without being able to directly look at the code.
Any chance you have a public repo I can look at?

[1] https://patchwork.freedesktop.org/patch/622074/?series=140648&rev=1

> > Depending on bandwidth, I may post an RFC to the list soon. I’ll also
> > gauge the interest and bandwidth from our Mesa team to begin UMD work.
> 
> Please loop me in as well.
> 

Will do. Coming together pretty quick so it shouldn't be too long until
I can post something or push a public branch. I think the Mesa side is
going to be the more difficult piece and unsure how much interest there
be to move this along.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Note that the completion fence is only deadlock free if userspace is
> > > really, really careful. Which in practice means you need the very
> > > carefully constructed rules for e.g. vulkan winsys fences, otherwise you
> > > do indeed deadlock.
> > > 
> > > But if you keep that promise in mind, then it works, and step 2 is
> > > entirely option, which means we can start userspace in a pure long-running
> > > compute mode where there's only eviction/preemption fences. And then if
> > > userspace needs a vulkan winsys fence, we can create that with step 2 as
> > > needed.
> > > 
> > > But the important part is that you need really strict rules on userspace
> > > for when step 2 is ok and won't result in deadlocks. And those rules are
> > > uapi, which is why I think doing this in panthor without the shrinker and
> > > eviction fences (i.e. steps 3&4 above) is a very bad mistake.
> > > 
> > > > This way you can still do your memory management inside the kernel (e.g.
> > > > move BOs from local to system memory) or even completely suspend and resume
> > > > applications without their interaction, but as Sima said it is just horrible
> > > > complicated to get right.
> > > > 
> > > > We have been working on this for like two years now and it still could be
> > > > that we missed something since it is not in production testing yet.
> > > Ack.
> > > -Sima
> > > -- 
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
