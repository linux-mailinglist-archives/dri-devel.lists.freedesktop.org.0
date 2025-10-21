Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31FBF8F69
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32410E12D;
	Tue, 21 Oct 2025 21:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFL/Ou6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7419B10E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761082987; x=1792618987;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NCTkvWXak8meNG9i60N4Mml1QhdqX+ijWVJvLdilUZs=;
 b=CFL/Ou6L1IpsVen5+dKNoXlEHsHd4fbi+qY8xihjsMWMz+fdtyjFRFKg
 3HOpy2deIeNCLQdW0ge5fShIThVnUKKzOKtXR+8RcSsVtR2Jh2BkDb8ec
 dBs+dsmH275IeXcIfMU3IemRlSRLwlphZY4bbA8c0LyS76HjHPH5Y/L/7
 yNuDpFQDJ6PEYP6jnOglFF4pv8d9x5sq17nOhxCkS7a2bVgVDBRqMylNv
 bn4ko0VXdKtAkrPJrCDWqyZ2iUsp/SLfCsfYkpD1zuFtjBYqNdofESxnc
 OyHTKryY8cNOjXD35CyYaWA0wmGbqkVatzYL/Bh0A1r2hHF10vG8OFVhR g==;
X-CSE-ConnectionGUID: uE8hk1I/TpCS3x09sspfVw==
X-CSE-MsgGUID: W4YoV2rMQaGkBBX5RmOIGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63131782"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63131782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:43:07 -0700
X-CSE-ConnectionGUID: adCaib4USzONpJeI3EMOpw==
X-CSE-MsgGUID: Qc9OFsakSKaztze0NZZ6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188103211"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:43:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:43:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:43:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHoWxjxjFT0laqA6e0zo08k38iFSwh/2aLjEWm+75Bkx4/7B+YO64yQl6Nc+kq8cvQf3sfrmM/3OsI18cVBUFImyJ2IuvWrZOj1GIwbSmY1rrbpcYD3SiN7yxBjEhlip42SRuydJlR78WzSqXjjZv55rmzfmFUmOcJaJ2s2cgGg4ULDft9Tj3KJOneDNzz8o2iCNQ5UnpeY1jhGZ2xyWDsjHgc5jVFWaFaewYDMC+lM3+NY+HbLjB/Z64G89TqiF30XJPaSRDLAF5cv9VGUWWyKD/82yGRC70O3TFTcNTBVioSnBHiZYAzpGBm/rEl9ac2Wl7/KYBp3R+xqwG28gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpWmtFyGAetesvVJjWJhNs/ocoUWOQjhsrjEuUJgaH4=;
 b=e6Imcy4GsW2R8ZXX4AeZdzMojoopA3sS2LW81XSY1FzwsAMtDExOjEtukBSt1NkSA28Q31AFaE3s9jd6LphLEzQXD9RnR8wFjyeWoniud6zDdUTNJWVP1fIxWIJEKvpaRlNWTcL+cI4vk1bTR8CuZO9k05JFDe+7OcaZn2P0Wgd3GuRm5xmJon4sVWcFZi58TaOtFbTsxkfiQqfigdoGeTJ1VPA6foh70IasXh2gpZIm6KtPFqN6CY5l/VNTNkRwCIQt1GGkRGJOYuU82IH254bcYlbzpxhnj4H/KC6GblblG2WOKAf0HUps5YmjBPhOEXP53r6G6OivddDGRTRDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF451ADEEF0.namprd11.prod.outlook.com (2603:10b6:f:fc02::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 21:43:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 21:43:04 +0000
Date: Tue, 21 Oct 2025 14:43:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rob Herring <robh@kernel.org>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, Steven Price
 <steven.price@arm.com>, Daniel Stone <daniel@fooishbar.org>, Frank Li
 <Frank.li@nxp.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aPf+ZLJ2KIsz+lZx@lstrano-desk.jf.intel.com>
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org>
 <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>
 <20251017153746.GA1579747-robh@kernel.org>
 <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com>
 <aPNE5po45Umson5V@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPNE5po45Umson5V@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF451ADEEF0:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d90c70-931b-4d11-2ae6-08de10ead085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtMR2ZHSUluL3dUTDBNTWUvU1lrVmJIOTZRSzYyWWpaTStyb1dlSUoxT05v?=
 =?utf-8?B?OVdjYmwrZndJQVB5K0JvcFc2c1dWMzE3bWs1MU5kMGpQYWlkeDlmNGg0YS9y?=
 =?utf-8?B?WnlKdW54b0ZYWHRsaUpjSGF4OGFSQ0JyWnBqcWFSVXBOMzBzbUM0amJtVHJ1?=
 =?utf-8?B?M1ROTUpmemIwUUsxUlhsT1hKYUE5dzNJZmlxb1IxYlRGQlRTaWZ3R01GUnNl?=
 =?utf-8?B?czhudkxHbDA0Ynk3Y3R2R0JDK0JkNzVVUWxCY3Z3ajZMbnV2amxsQ2U2STgy?=
 =?utf-8?B?Q1ZBNGYzODBiNElYdHo1UnNoTzFYWUw3bkxxSFhXNTl4aDN3b3pEeGZKRkZD?=
 =?utf-8?B?RUk2VjRxeXJFM1dXYUdlRWp5SWRSSzlIOEkzd21FejJKSyswcjYyc0xUd2Vr?=
 =?utf-8?B?ekZ0UkdyVHRLSjJQbU5OWVhiODlIY2MrTzQ0UFhvWTIxQ0o1alV6RGZrTHhG?=
 =?utf-8?B?VFJHNU5SeEthWG0zdmpEd0NyMUpYK1dMODRERk5Yc2FTUW9rVlo0M1NmNXFX?=
 =?utf-8?B?WTZ3WEdlVmdBZWNmYzZZc1YzYkZwd0wrVGJKL2J5dHMxZml0eUc0UnpXOCts?=
 =?utf-8?B?UTBDVTgxMlNTU0x6MnYzZE9mNXYvRmNjMlQwSkZwcjNDb2hQOUdVOTNVZDZi?=
 =?utf-8?B?Z2lMdHBVdE9iQmkyazJRNTc5bXRRMTJZOGRHM3NucjhKYlJ6enVXTFU5Kzkz?=
 =?utf-8?B?YXRMbFJKbGRmRWE4V1hrUExvRFZvVUdCNEhFRitEYmpaek55RGNsZEtaV0d2?=
 =?utf-8?B?MHJ0N01WRWxkK3cra0VQdE51N2VWNWRQR040eWRYaE5YSVhQSHpuQVQ1SEFq?=
 =?utf-8?B?V0V5OHpuWktIblVvSDhaSVk0Qmk5M1dxV0RIeUtIRnFRL1RGQ21iY0QxV3RL?=
 =?utf-8?B?b25xMURobURrelBKZWMyMUV0Z0tRejBLay9Jb0tSRFRkS3BZb3puc1FqZXN2?=
 =?utf-8?B?ZzJxN0ZXc1crVkVFL2RwR0ZrREs4Vm9tWlJMY0xhWHRuSDBMWlRqcHVhK1hL?=
 =?utf-8?B?S2JMd2ZOa1ZxSXZEQXkrT0RHZGpBOWpZSnZBajBCanNWN0E0Z2J3S0h1RDR3?=
 =?utf-8?B?NVNqWDFHYW9uNDFnb2pPTnFISlE5aUJSUGN4TlgxRk95MjlKZmNSSjBURHNJ?=
 =?utf-8?B?YUVydm9KNU5GWk82SlVGM3FFZWNzWEI4SkdRTlhjTlhMbmR0eEl3TG43d3Z3?=
 =?utf-8?B?ZnBMQWs2L2ZDaUd0NjdwRnIvSGhxTVlJTnpYeWFPSDZRQUJNaWJaTVBqRU1C?=
 =?utf-8?B?QUpYdGVPTVlKME1JTjRRRFhpUjF3Z1RUOElqNnVuM3Q4YTZkSUdqQ3diR096?=
 =?utf-8?B?MjBPbnFoZk9PbDlob2t2c2ZueUN4MEVNdk5zMUl6NnJUSXhYRzZjbmlTR2pz?=
 =?utf-8?B?bi9ZbjkwdDFxWmJpY0Y2QW5IeitYcVhTQTRHOEUzWTZGcnJiTzJWOHNxV1lZ?=
 =?utf-8?B?OVpIL3NWbEphd3Z6OVllT0REOFdzWFp0NFZpMUxsaTVMbG94MGJZM3hDSmZ6?=
 =?utf-8?B?YktTOVk2V1pBTE5Pd2trTTN3Y01lYXlhR1o0NGJsTGdqMUh5c0JKbU5Jd0Q3?=
 =?utf-8?B?Nyt6MjVtcWZ0UzBoTHh2VTVVVmJBSjkwMkFaeFc5aVdBcmRLNUYwWXkxQWxU?=
 =?utf-8?B?cm5tcmZ4Y2V1RWpkckJra2lRajB4Uk9zUXdSVE1sVTdVaU1MMzNnTXpmWHg5?=
 =?utf-8?B?bUV0a3hMc29YVXVyZ2xNZTV1akR2WjVaODdKZGE0QUNVNmcybkVoUDZsTVYx?=
 =?utf-8?B?VHBYRVFRTW9SUTFsc25Oa3pKbm1CKzZJWDJUdmpRWEdrUGVJRisvbTlsTlFo?=
 =?utf-8?B?R3R5YlUzMVUvc2VVNG9kenFvbkNZNUk4ZmtCbzliSUlQamE4b1B6bDAxRG9j?=
 =?utf-8?B?by8yREI2aHBMa1piUEZSWWZKSlZudXJoZ05wamR1a3d0T3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlmZFhtVDlYQ0lPVDZHc29uTmYzZTlOZ1dpSUZZV3ZlZHB1eTRYYUNJa0R3?=
 =?utf-8?B?VG80eWVrZFA4cUJqZEdjSy80NTNORTB1b2RoL3hKMkt4MjRJa1R0TDZHdFU3?=
 =?utf-8?B?eS9Pb283YW12OEFIVXE2bVFMaWJEQkx6bFVvWitTWE1DS1ZkNzhSS1dXTUxI?=
 =?utf-8?B?SS9YSFV6aWR1dDhFMHkrY2hldnNOUGtyQjB6ZjRoOVI1NDBycnRPK1NFelFP?=
 =?utf-8?B?b0xocXNsaXBBRzdnamhKdXNWSzhOSzVUWlFzKzJvNTZBQUdmZXRNditqQ3ZP?=
 =?utf-8?B?VHRPSkJxZTlNekZDdGhRejRYM2prWnJBaE9WQ3E5UzNNcFV0dDhXODkwcWF1?=
 =?utf-8?B?WCtKMVJjMFVpaDhVNnBQYnh3Q2IxUlgzY3JPTjlNS0lHeUU5cDhVTXhSU0ZY?=
 =?utf-8?B?K3lTTDNvOTBYYTluSGlIS1dFYnB6d1M5eThkZVpRUGM2UFFhaG15OTQvSm0r?=
 =?utf-8?B?aHl2Q2FmNmIxUFlyNERBK2x6emFyWmVVTHl1U3lqVzNWV1FaWUpYTC9uTVI3?=
 =?utf-8?B?QXBJeEZ3YngwTG5lTitlUVJRRjhFb0RzTjJ0NEtWYUhhSUlsbkQ4QWlqV2tP?=
 =?utf-8?B?ZXNaclN1TmJkRHRWSkRTeE5pa3diWnBwYmFWSjBEeGlRUGV4eDIwSkludmRY?=
 =?utf-8?B?dmdtd0FLTDA0dkdRRXRGMFo3N0JLTmN2TVIyUE9wSEM0MlBhblZpc0pKT0FE?=
 =?utf-8?B?c1hKR291WERGSDkwUER4Wmo3bUJOWnRZY0doVmRYczFuZFVpbjQwZmU0UHh2?=
 =?utf-8?B?WXUyeTRtN2o2Z2NwTS9HNGo0U0lWNWR1VHV0UUpXT3JYN2J0QjRYa1ozRVRM?=
 =?utf-8?B?WDFVb2dGUGVrTVQydTZXdTNmeEpYMWNHTmVVSlZRLzJVMjBFd25IcndMaHQ0?=
 =?utf-8?B?L3BWaHdaYVQzVFEyZ0xKckRrY0htWS9mNmZvNFFvWUlLOXZjandVQ2hZOU9F?=
 =?utf-8?B?SUs3NHlFS3RKUWlVdG5pRk5RMVdCbHFXVkkzYkt5WjdZbmJUUGdZOTdhVjlk?=
 =?utf-8?B?ZGtqdE9BTHladmw3bU1pcGxhaWF5ZXFYMWJPRWR6VHFYZU1yaFN4Q3pyNWJ5?=
 =?utf-8?B?MzcvVXREYWsyeHNZUnZNR0ZhYlFUUWd1MkZrb3hIK096R09jWEg0b3FaRVdY?=
 =?utf-8?B?VE8rKzhzdnpJOXJESGxZdU9aRWE5c1I5SVA3L1VxbVVuVHQ5cTR3N0lrWVJT?=
 =?utf-8?B?Yk0yUm5JV203SjRML0x6WllsbmprZmtodGVLZ2prZFRldVBwVDVlSklMUjVG?=
 =?utf-8?B?cEtyYzVOZmdOZzJ2eE1CcmhrWUEzZG9MeGY5N04zRHZEWS9TWGU1YkR4cmNE?=
 =?utf-8?B?K1pMVUF5Ung1bkZadmc5Sk1WeHM1bEFPSndVcFdQaEYvSk8rUG1ndTBwS2Uz?=
 =?utf-8?B?RHZvaFR3aE02MTV3dGkyOUR4VmRONjhPTVRBbDh5U3lJT29SSzAwV2h2NmJZ?=
 =?utf-8?B?YlZsL2tObitjaTRrN2htdFVCVmJsd1FlN0RVWlpKVFZCelUzVWV5WHFqR1BX?=
 =?utf-8?B?ZTZmTnJCdFZLVW9MMW03eGJDUlpoTlNsWjlvQnR6cEdqNnlIOFZicWQveWcy?=
 =?utf-8?B?My80M3JNUHN3ZGxTYVVvd21Fd3pqRzNONkhxSHozR2hOL3JJUi94cWl2MjN4?=
 =?utf-8?B?bHFXTlRTS0dObDFpREYrbHMzaXRVQVBMamJoOUlZOUkxVlExY0FWcWxmc3ov?=
 =?utf-8?B?elZkVGQ0RXBEOG5oTnFOcUVFUjltTmlZMDdBdlpZZ2Z6VCs3ZDVnVWJTYmVx?=
 =?utf-8?B?aTliNmVreWZhRVIzMmh0aWxYUHpDL2c0eFhiQWp1R2lXb0gyRG44MGFSU0NY?=
 =?utf-8?B?aUgyR2NPeW5NVk1kS3R5UVMwbGNITkZNN1lTYXloZjd1dUt6QXpOcks1bjhE?=
 =?utf-8?B?bGRhajh6UkpnSjNHYU8wVnJOTkh3Z3owaUEwbDBwRi9hamNGUkFZOFZJWmhv?=
 =?utf-8?B?Q1lWWXBMRHpVR1k2bUtGbzMveDMyMVNYNGI4SEM4RnFDL2FlSXJxTWZZNk9w?=
 =?utf-8?B?UU5hWnVOT3FmdHMweHRCd3pxYTl5TlRpdlN5U20wbXF5TCtqWVg5WGJsL0Ew?=
 =?utf-8?B?SWNXVWF3ZmU0Q2M4WW5yQ1FTL0J6Sm1ZcmhaSEpQQkt4V3VPV1pKVStHNWtX?=
 =?utf-8?B?TDh2L09GRFJJNmxra2UyQ3FXNHhYL2VsZEludjFpVzRISHFsWlJMS1haNU5a?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d90c70-931b-4d11-2ae6-08de10ead085
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:43:04.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nK3GSf/qSlJo0OUhqJ7jcEYJuIgW8tecCNdununpdaYCBNshxuK5f5VvDh6JWX5V1i/ixDlpgGZcw/vVbcSP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF451ADEEF0
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

On Sat, Oct 18, 2025 at 12:42:30AM -0700, Matthew Brost wrote:
> On Fri, Oct 17, 2025 at 11:43:51PM -0700, Matthew Brost wrote:
> > On Fri, Oct 17, 2025 at 10:37:46AM -0500, Rob Herring wrote:
> > > On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> > > > On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote:
> > > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > > relatively simple interface with single command stream to describe
> > > > > buffers, operation settings, and network operations. It supports up to 8
> > > > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > > > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > > > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > > > doesn't need access to the SRAM.
> > > 
> > > Thanks for the review.
> > > 
> > > [...]
> > > 
> > > > > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
> > > > > +{
> > > > > +	struct ethosu_job *job = to_ethosu_job(sched_job);
> > > > > +	struct ethosu_device *dev = job->dev;
> > > > > +	struct dma_fence *fence = NULL;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (unlikely(job->base.s_fence->finished.error))
> > > > > +		return NULL;
> > > > > +
> > > > > +	fence = ethosu_fence_create(dev);
> > > > 
> > > > Another reclaim issue: ethosu_fence_create allocates memory using
> > > > GFP_KERNEL. Since we're already in the DMA fence signaling path
> > > > (reclaim), this can lead to a deadlock.
> > > > 
> > > > Without too much thought, you likely want to move this allocation to
> > > > ethosu_job_do_push, but before taking dev->sched_lock or calling
> > > > drm_sched_job_arm.
> > > > 
> > > > We really should fix the DRM scheduler work queue to be tainted with
> > > > reclaim. If I recall correctly, we'd need to update the work queue
> > > > layer. Let me look into that—I've seen this type of bug several times,
> > > > and lockdep should be able to catch it.
> > > 
> > > Likely the rocket driver suffers from the same issues...
> > > 
> > 
> > I am not surprised by this statement.
> > 
> > > > 
> > > > > +	if (IS_ERR(fence))
> > > > > +		return fence;
> > > > > +
> > > > > +	if (job->done_fence)
> > > > > +		dma_fence_put(job->done_fence);
> > > > > +	job->done_fence = dma_fence_get(fence);
> > > > > +
> > > > > +	ret = pm_runtime_get_sync(dev->base.dev);
> > > > 
> > > > I haven't looked at your PM design, but this generally looks quite
> > > > dangerous with respect to reclaim. For example, if your PM resume paths
> > > > allocate memory or take locks that allocate memory underneath, you're
> > > > likely to run into issues.
> > > > 
> > > > A better approach would be to attach a PM reference to your job upon
> > > > creation and release it upon job destruction. That would be safer and
> > > > save you headaches in the long run.
> > > 
> > > Our PM is nothing more than clock enable/disable and register init. 
> > > 
> > > If the runtime PM API doesn't work and needs special driver wrappers, 
> > > then I'm inclined to just not use it and manage clocks directly (as 
> > > that's all it is doing).
> > > 
> > 
> > Yes, then you’re probably fine. More complex drivers can do all sorts of
> > things during a PM wake, which is why PM wakes should generally be the
> > outermost layer. I still suggest, to future-proof your code, that you
> > move the PM reference to an outer layer.
> > 
> 
> Also, taking a PM reference in a function call — as opposed to tying it
> to a object's lifetime — is risky. It can quickly lead to imbalances in
> PM references if things go sideways or function calls become unbalanced.
> Depending on how your driver uses the DRM scheduler, this seems like a
> real possibility.
> 
> Matt
> 
> > > > 
> > > > This is what we do in Xe [1] [2].
> > > > 
> > > > Also, in general, this driver has been reviewed (RB’d), but it's not
> > > > great that I spotted numerous issues within just five minutes. I suggest
> > > > taking a step back and thoroughly evaluating everything this driver is
> > > > doing.
> > > 
> > > Well, if it is hard to get simple drivers right, then it's a problem 
> > > with the subsystem APIs IMO.
> > > 
> > 
> > Yes, agreed. We should have assertions and lockdep annotations in place
> > to catch driver-side misuses. This is the second driver I’ve randomly
> > looked at over the past year that has broken DMA fencing and reclaim
> > rules. I’ll take an action item to fix this in the DRM scheduler, but
> > I’m afraid I’ll likely break multiple drivers in the process as misuess
> > / lockdep will complain. 

I've posted a series [1] for the DRM scheduler which will complain about the
things I've pointed out here.

Matt 

[1] https://patchwork.freedesktop.org/series/156284/

> > 
> > Matt
> > 
> > > Rob
