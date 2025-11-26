Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7EC8AFA4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4075D10E689;
	Wed, 26 Nov 2025 16:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDUAsUOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FBB10E684;
 Wed, 26 Nov 2025 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764174737; x=1795710737;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rp2SpZaF6iQ3o6c34uTXAkgGn4LOVpDoT9sdnx373Xc=;
 b=jDUAsUORMnda/D5SZqQSMdHi0UYsxuRdeSm4bnyJYyXoaqej/dNt9aIo
 kSplNTgzPEdc1ZKn3+UJzc4xlvDG4GTAx5dRfIy04W33lGDFqXvGowHsX
 3hgb17qbZNXmym3r3NmvNdw/IKg5dQn6TbNuLi3f+JB4HH90emAwgd1X9
 rQOs0ps5GrtdNdFWk69Uq7yQAXv+hKb2BKjZD2iEGAUYTOLHiWx7L5Fgp
 mO7SxfWKExTvhx6Px8o9QUOd0fk0/8HUI9NINRGMCCaCtcMiYmZ64E8A6
 PHTl4vZqyV4dbOSglO2GCZ9z3B50Si3ms9AN9WEqu40yXz+R/rOcEUyPv w==;
X-CSE-ConnectionGUID: ncwF/xBGQgWdfH54acr7Fw==
X-CSE-MsgGUID: Ng0akzFRTUamDoUwXbkWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83609410"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83609410"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:32:17 -0800
X-CSE-ConnectionGUID: e+W8eaAbTh+7wIinnQftNQ==
X-CSE-MsgGUID: 71N6siFPR2qxGvhg9e82yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197471272"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:32:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:32:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 08:32:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsfSohHoNb8n2zyP5MhqovDKbIKd56xbgzXXqWBHNANJfHzd6BtLWaPwYY3YTIpLtw2IuiiQjBTXZ7Ik/4pYt2W2EJ6EnuHQGZZtFbgfPArgGrEMZbSXTX9eAhzh2nG9gKZpGcCxfvAOzhsk0rNdgo3Mvr/b9ruoeOfauFuc/5nP/0/kUiqG6PcDKeOlDvYOYs+exo3IxL3vNBxpFO22IYVbW3IwTihOwCrKNWgdgdEnoUzp1xn0ry+MNDhyLM6cqkze82/ypC7TwwnMyhhvMbn0CDwjKy0IZxj06uFEtjS2nnL247snqxAkYr3CeOiYMlvBVaxwFRibTkWedI88sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dVQkJ71aPG1LVx2MtGB+sbVBDoEeP2wXRZxzaPGoxE=;
 b=SxFeeMmpf//ZNvzd6nXZ/uWuh4ThtwhAj054oEpXGRe+aRRJpAxm7yAg29sXDdASKsrq/k+Wz/MdqHGyLP35TS9zZ/eqspq9DxFKho2u1chZRx5FsXpv6wGkDfSGYFEGj/HOcxqgmr19EPOo/EW6HIlpp1JCc624R9TLas0H0mfWIW3OH3X7pbuGa2pyQkTUrOK3pzrM7r1jYninKCK67cFpmdfom/ystm3v31ohPZgSAchJf/3UktAH+PB+1aWLbMqfARrWUFAPhiLTZoxTX7wDHbBiOo/V/8ckJqZxGO22H+AilEuv9K6EG7YTYudvYoOix2Jqa4AiXx/PY7Lozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:32:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:32:12 +0000
Date: Wed, 26 Nov 2025 08:32:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 16/17] drm/pagemap, drm/xe: Support migration over
 interconnect
Message-ID: <aScriYMCR15BN6Jo@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-17-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-17-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f68dc2-70c2-46c6-d1c1-08de2d095a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmlkdS8ydllldkxMbHc0YzdDR2ZraXhTWXJjTXdwajgwM09GZDhBbDFqT2hB?=
 =?utf-8?B?TjVyRUE0UkhRNFpSQXVPNytjRHZwY1dVQ1dTY1B5a29VQ2hhMmFtbDV2SkhZ?=
 =?utf-8?B?VWJ4TmpjcVhNRjRUTmRZM0FKSGZscVZWaGkzQ0Q2WVFuY0liWkJBbVhMVC84?=
 =?utf-8?B?cWtBZ0pDVC9rLzdBdXJvRXJ1M20vckYxanBYQlFTcUdYTkluVjNOYkxCV2xV?=
 =?utf-8?B?RnlDc0lYK0ZhYTNIZ0kzRWdCRCswWmVTWUJsNWhEdEJKTHcrWUhGcW5wS1pU?=
 =?utf-8?B?R1FpZUNmR21OcXBiQmc2ZnZyL2Y5STkzZWN0cVBwVmRKRDBkdUxXenRFOEkv?=
 =?utf-8?B?dzNRQitiOFpXTjQzSUMrbmloN2FEQk1GODdYOGpXczJTME9taXV6MjdJTFEx?=
 =?utf-8?B?SHEwMHplRURtZ0hSMGdXRjFpajVqckxGcHVRa3RwUXFDSmdFaS82U29QVGl0?=
 =?utf-8?B?Ynd0NHZraWczQUtSMjI3MldRYjBma2xrSHZmWk9weEROc0ZSNElRZjl0ZzdZ?=
 =?utf-8?B?eDBMYWJTK0ZRa2R3SHdub21NamE2Sit6bGdWdXJ0U2d1V1loQWlIblduMEtL?=
 =?utf-8?B?TlArOFk4L3licTlvRmtuWUZqeWJMOHhjZjFqRWJoVy9vN3A0bTBjN0hzbGto?=
 =?utf-8?B?ZUtlRW80d2ZBRVZJTktYQ25Hc3ZxVk9ZUFVHM3Vlek1uVWlnNndHek54S2lv?=
 =?utf-8?B?SHczVmh5N0JRV0lCNmZZL0NaKzVoM3RKOHpmKzZmY3pWMHc0a0VSYThGaUl2?=
 =?utf-8?B?YzBrdEJNaHRGSHN6QVRlb0kzdktNYUROU2xGVGtPbGJ5Mnh5WTlIVUZhYzcr?=
 =?utf-8?B?ZUVVeGp5bnp6N2FvbElLUk1XSmdWeFpncEd3UDB3Qy9XZXpBOEdxSzkrcVRE?=
 =?utf-8?B?d0NUaERxdVJKM3NyZklPMWFVSUZDSkxpNDd0dEhSREFyUW5uRWx3Tkk2OHhI?=
 =?utf-8?B?MTMvZlpVaWMvaTlXYmNnU09NS3BRQURQY05GeS9zaW1MOHJZTURhYmRobnlv?=
 =?utf-8?B?ZThKQi92M0YxZkx0NjNhRDg3NlNacFBkZ0RRTC9LazU4R2N6R3RZaG5xRzZj?=
 =?utf-8?B?OS9YOWt0Y3NGeXQyLytiMVVRb0I1cW8yM2tXVXU4OVc3K3NCZVBPQ0tCUnF4?=
 =?utf-8?B?NE1VS3JZVVdrVlVUSmRsR1NxeTZ0Uks0U0R1czNPWHB4a3ZKNHV2NHNGQ3NF?=
 =?utf-8?B?MDZUMXVUc1hwQjZ4YnlScko0WTVBN3crRzBQVmlyZElDNEhOY2N3MmpYb1kv?=
 =?utf-8?B?Uis2S3luUkxkb0VWTW1NN2Ztak9Tamw2RFlVUFpaM1FhVGpFeEhQK2hKd056?=
 =?utf-8?B?TFhmT0dqRE9xL2EwMW5XZDJUdlIzVVpTV0FidGF6azhubTlZNXZsWWtzRTd1?=
 =?utf-8?B?eEZEOVQ2bTRRQzNSSy9id3VxeURhZXhBazdzdERYaUtTMDJ4YUs5RXVQWjlr?=
 =?utf-8?B?N3EwSnhwdjl1QzRyOEpIRjlNaFNiaHhaVUtEck5DMUgwZVVaRUFFVFNxc1pY?=
 =?utf-8?B?bjJLNndkQkpjZGlYNkM2OUhMcm1nUWIxWnQ1OHNoOXZFVnByOExGemtWQW5C?=
 =?utf-8?B?MDNReU9NdUtOa2RyeWNLRGIvYVJJbGh2OGNxdW4zQU1VS21lL2FDL2FHaFNm?=
 =?utf-8?B?STdwZXNVVHlJVmk2aUtKUzZRZVhoMWg3aEIrbEVkODJORzhCZS9SRUJCOVFI?=
 =?utf-8?B?Tml1ZzFnS3p4aXF4NVNMMFBldlQrNTJkUG92MW5oVzU2b2E2cmZYNHZka1cv?=
 =?utf-8?B?RkFlMHV2bUdDZUxLM1BrN1ZhYVNuOG1wSElTcUJQdHN1blgwYnZXNTBGT0h1?=
 =?utf-8?B?Yjl0OEVjWkxNcW4rS2NrOVBXTXJFU2llY01TOTYrOXl1di9SVW43ZEhsT2M0?=
 =?utf-8?B?bG5KM0RJc1JBL2szYm9aaENSTDJnM1A2b3lLak1TSXFUd3N2UWFZQ0FtLzBu?=
 =?utf-8?Q?B1burKp3rjfPkiKUvogJx4xga6QduKS6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elV6aitqSWYzMFFtWjdINGNsSVRoUFBycUFxcFJGN2l1RkZNTm5JaWx5eENw?=
 =?utf-8?B?VE5DdDhSN3J0bGdWUHFENkZ6bi91clhRVVRMQllTVjg4VSsybXdiMCtRU0x3?=
 =?utf-8?B?RFozbk94aGRJOGMyZHNBQ1VsQS96bExiTkc1V1lzN2l2QUNpRUlqZUYyUjNz?=
 =?utf-8?B?bU5YK3NGMnZna0pxMEoyM3QvR2NpdWtqMlMrSXU0WmRaMWM0YUEyTE0vUDd0?=
 =?utf-8?B?OVJxZGoxOU41dlo3SnVNOU5vN2FuMXoycWxTSjVueWVKWDJIUk95Y1ZxZW9n?=
 =?utf-8?B?aXdOUnp5M01obVErRkRESm9YOUZMZStma0c3bmZ0UUxvQTByWnZVb2N1N2g4?=
 =?utf-8?B?MHc0RW9nY2s0ZFlSOEtZVTViOVNLeWVRSFoyRDdpZ2NlYkJNU1VKZFF4Rnd2?=
 =?utf-8?B?ci9KMkkzTmtFVlN2N2VBdmJCOFFJcmFWbSt2M0wxaGVqaVRnWnlpRVo4YnVw?=
 =?utf-8?B?bThDYjcyV1lyUjR0QWhyenpVVVpSZ1pFWXhHblNjdHgyR2NBdlg2ckhsQmJU?=
 =?utf-8?B?RkxqaW11OHozRmNtaUNMaUpMYW4ycEloTkx5b0lYaEM5K2NWMU95bTlRVjFD?=
 =?utf-8?B?UW5INWFhNHprZkVzL3l0d2E3SFhMci9DM0pGaFFDQTY5a1Qrd1p2VVZGZzlV?=
 =?utf-8?B?UTYyS1VLK0FFbFFzVy85ajZEVHk0M0I1b3VVcnBhYkFIajF5Z01GUGJpUitF?=
 =?utf-8?B?M1pkVm9UK1NpVjIvTnYycGRBcmpaamdDVHRkSEVxa0FHZkMvTVcxcEwrNkow?=
 =?utf-8?B?MkxWZGlWTUdRYVQ1NTVCd2RUaGVJcmpITThFMkRncnMyRUhIZkYzdlYwWm9D?=
 =?utf-8?B?Q1ErdkFZTW9BM1Yxb2I2Zlp2MHNkdXVVeEZlUG5rVXRMSXFqazAxcXJiMjlw?=
 =?utf-8?B?dW83L0JBbFplSEN4UDZ2N1JEN1pONktibXVnZEczeCtrNk5na2liS0F0NzVJ?=
 =?utf-8?B?REhqa1pCRVRlbnQ5ZkNNTSt0N3lhYWNsMURFd2szTmFBL0EwRjFjWHpSUXFF?=
 =?utf-8?B?bFNMUms2RnFwU0tpWTFmVHlKY0wrMUs0MjYwNUJMdVZlUE9YTHdCaVhtYTVG?=
 =?utf-8?B?VGZ3MWRsTS8yZTd0VllJUGdMSkJ6aEV6MGZ6c2JlZHNFMllsSHdlQURnd1NU?=
 =?utf-8?B?aUR3L0h5U3V1RWlpYW43d3lVakl5Tk93blhYTXlQRTZaTHJDNUhTd2tUakov?=
 =?utf-8?B?Vm1TNnZ1UStKZE8rRVRBdm5SMlQyREQ3MDZselZqSWRyR0RNSVNXaGNYczA1?=
 =?utf-8?B?OTEvUG9pMjFzZ3Uzb3VzaWFmSmVFcU1XbjYrRXVCREtxWVNOUkh0K1FmNjV3?=
 =?utf-8?B?NW1ERjZaNVRUdCtoclBwVkJ5UEZxMFBqeURiTVpqV3dWUlpEQ3RhQTRyWTFB?=
 =?utf-8?B?NEdHNTZOVmNBbHVtVy9RbzdBNmVYdmpZRXIzT3JpN0dnZWNiV1FNUVpsNURG?=
 =?utf-8?B?UjlQU3pOdllSdG85a1piUFB4bGZRdDBUQk95eGg1WU5URmJSV3dJcWc3YWpF?=
 =?utf-8?B?QWJnTkl3ZWk4Ni9EcXVsZDNLUXFmTVJDNXA5ZFpnT2pZNTErYW42dzlEeVJk?=
 =?utf-8?B?bnhsZnFackwwckE2RW5jZURBRlY5R0k3b0VnZFdualYrUUcra1hmUWlya09H?=
 =?utf-8?B?QlUwTTVTS2hPMXkvWmlScUlzVWIrZWVtcHplL1B4Rmc5Q1VRRTRKcEJRYU5T?=
 =?utf-8?B?eEg3cUU2alVvMjB0VmFsZExFUzRJQklMUVdscGNRTVZXeUNSczVMNGduNXNT?=
 =?utf-8?B?OEo2QUVQZHcycmNyNk9IR2p6L3BwalZMQjdpcXpGTVluY1BvK1lIb3M5azhL?=
 =?utf-8?B?NWRpQk9YNFVKUWVwMGpzbktTUXBENnoyM3FveTgrbU5HanRYalpqTVhoYUgy?=
 =?utf-8?B?TDNlWUowMUdQeTlVcWN5K0hnYlFoanhsQndWMlBBK2JpalFWVDJ2ODZMeEV5?=
 =?utf-8?B?YzlzbVlNbVczMUQ3RVExS3MvN2k3SkJodHNjZWtsM3kxQ0I3bzZaa0hzdHR0?=
 =?utf-8?B?Qk1oL2hlcUhqV0tnU281RmorSXpGaUwwdlZEWTBEMjBEYzQvbERXM1g1N2Vz?=
 =?utf-8?B?L29wWE9VZjE0SVJIT1R6OVJENXpicTRaeVphME1hZGZMYi96d2UvYzdKZEJJ?=
 =?utf-8?B?a1VNVElvUDNFVTN4WEJXL09oRkJqcHJoQlRkZHZ2dWNQUCtXUjhzUWdiOUdS?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f68dc2-70c2-46c6-d1c1-08de2d095a40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:32:12.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9XTruzLbgeRQxJ4Y+PgK99c8sjMKzmzDk8khSn+BAqLll1mZsJv+V9Ef9d0KixnmV0l5dM9DO8h+sBIDwlpcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

On Tue, Nov 11, 2025 at 05:44:06PM +0100, Thomas Hellström wrote:
> Support migration over interconnect when migrating from
> device-private pages with the same dev_pagemap owner.
> 
> Since we now also collect device-private pages to migrate,
> also abort migration if the range to migrate is already
> fully populated with pages from the desired pagemap.
> 
> Finally return -EBUSY from drm_pagemap_populate_mm()
> if the migration can't be completed without first migrating all
> pages in the range to system. It is expected that the caller
> will perform that before retrying the call to
> drm_pagemap_populate_mm().
> 
> Assume for now that the drm_pagemap implementation is *not*
> capable of migrating data within the pagemap itself. This
> restriction will be configurable in upcoming patches.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 177 +++++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_svm.c   |  20 ++--
>  2 files changed, 143 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 1477a2057a15..e87676313ff9 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -210,6 +210,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
>   * @dev: The device for which the pages are being mapped
> + * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
>   * @pagemap_addr: Array to store DMA information corresponding to mapped pages
>   * @migrate_pfn: Array of migrate page frame numbers to map
>   * @npages: Number of pages to map
> @@ -223,12 +224,14 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
>   */
>  static int drm_pagemap_migrate_map_pages(struct device *dev,
> +					 struct drm_pagemap *local_dpagemap,
>  					 struct drm_pagemap_addr *pagemap_addr,
>  					 unsigned long *migrate_pfn,
>  					 unsigned long npages,
>  					 enum dma_data_direction dir)
>  {
>  	unsigned long i;
> +	unsigned long num_peer_pages = 0;
>  
>  	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> @@ -239,31 +242,48 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		if (!page)
>  			goto next;
>  
> -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> -			return -EFAULT;
> -
>  		folio = page_folio(page);
>  		order = folio_order(folio);
>  
> -		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> -		if (dma_mapping_error(dev, dma_addr))
> -			return -EFAULT;
> +		if (is_zone_device_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +			struct drm_pagemap_addr addr;
> +
> +			if (dpagemap == local_dpagemap)
> +				goto next;
>  
> -		pagemap_addr[i] =
> -			drm_pagemap_addr_encode(dma_addr,
> -						DRM_INTERCONNECT_SYSTEM,
> -						order, dir);
> +			num_peer_pages += NR_PAGES(order);
> +			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
> +			if (dma_mapping_error(dev, addr.addr))
> +				return -EFAULT;
> +		} else {
> +			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> +			if (dma_mapping_error(dev, dma_addr))
> +				return -EFAULT;
> +
> +			pagemap_addr[i] =
> +				drm_pagemap_addr_encode(dma_addr,
> +							DRM_INTERCONNECT_SYSTEM,
> +							order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(order);
>  	}
>  
> +	if (num_peer_pages)
> +		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
> +			num_peer_pages);
> +
>  	return 0;
>  }
>  
>  /**
>   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>   * @dev: The device for which the pages were mapped
> + * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
> + * determine the drm_pagemap of a peer device private page.
>   * @pagemap_addr: Array of DMA information corresponding to mapped pages
>   * @npages: Number of pages to unmap
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> @@ -274,16 +294,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>   */
>  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  					    struct drm_pagemap_addr *pagemap_addr,
> +					    unsigned long *migrate_pfn,
>  					    unsigned long npages,
>  					    enum dma_data_direction dir)
>  {
>  	unsigned long i;
>  
>  	for (i = 0; i < npages;) {
> -		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
>  			goto next;
>  
> -		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
> +		if (is_zone_device_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +
> +			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> +		} else {
> +			dma_unmap_page(dev, pagemap_addr[i].addr,
> +				       PAGE_SIZE << pagemap_addr[i].order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(pagemap_addr[i].order);
> @@ -308,6 +339,7 @@ npages_in_range(unsigned long start, unsigned long end)
>   * @timeslice_ms: The time requested for the migrated pagemap pages to
>   * be present in @mm before being allowed to be migrated back.
>   * @pgmap_owner: Not used currently, since only system memory is considered.
> + * @mflags: Flags governing the migration.
>   *
>   * This function migrates the specified virtual address range to device memory.
>   * It performs the necessary setup and invokes the driver-specific operations for
> @@ -333,13 +365,18 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pgmap_owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM |
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
> +	unsigned long own_pages = 0, migrated_pages = 0;
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
>  	struct drm_pagemap_addr *pagemap_addr;
> +	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
> +	struct dev_pagemap *pagemap = dpagemap->pagemap;
>  	void *buf;
>  	int err;
>  
> @@ -374,11 +411,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
>  	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
>  
> -	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
> +	zdd = drm_pagemap_zdd_alloc(dpagemap, pgmap_owner);
>  	if (!zdd) {
>  		err = -ENOMEM;
> -		goto err_free;
> +		kvfree(buf);
> +		goto err_out;
>  	}
> +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
>  
>  	migrate.vma = vas;
>  	migrate.src = buf;
> @@ -389,54 +428,108 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  
>  	if (!migrate.cpages) {
> -		err = -EFAULT;
> +		/* No pages to migrate. Raced or unknown device pages. */
> +		err = -EBUSY;
>  		goto err_free;
>  	}
>  
>  	if (migrate.cpages != npages) {
> +		/*
> +		 * Some pages to migrate. But we want to migrate all or
> +		 * nothing. Raced or unknown device pages.
> +		 */
>  		err = -EBUSY;
> -		goto err_finalize;
> +		goto err_aborted_migration;
> +	}
> +
> +	/* Count device-private pages to migrate */
> +	for (i = 0; i < npages; ++i) {
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> +
> +		if (src_page && is_zone_device_page(src_page)) {
> +			if (page_pgmap(src_page) == pagemap)
> +				own_pages++;
> +		}
> +	}

I understand what this is doing—aborting the migration if the pages are
in the correct location. Conceptually, I believe this is correct, but
implementation-wise it is likely not. The pages collected here are
gathered via migrate_vma_setup. This step issues an MMU notifier and
installs migration PTEs, which are expensive operations. For example, if
another GPU already has the correct mappings and the pages are in the
correct location, migrate_vma_setup will result in the range being
invalidated and the GPU<->GPU mapping being removed. Installing
migration PTEs is also CPU-intensive.

I think the step to check own_pages should be built on top of
hmm_range_fault without HMM_PFN_REQ_FAULT set, which is fast and will
not issue an MMU notifier.

Matt

> +
> +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
> +		npages, own_pages);
> +	if (own_pages == npages) {
> +		err = 0;
> +		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
> +		goto err_aborted_migration;
> +	} else if (own_pages) {
> +		err = -EBUSY;
> +		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
> +		goto err_aborted_migration;
>  	}
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
>  					    migrate.src, npages, DMA_TO_DEVICE);
>  
> -	if (err)
> +	if (err) {
> +		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +						migrate.src, npages, DMA_TO_DEVICE);
> +
>  		goto err_finalize;
> +	}
>  
> +	own_pages = 0;
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page = pfn_to_page(migrate.dst[i]);
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
>  
> +		if (unlikely(src_page && is_zone_device_page(src_page) &&
> +			     page_pgmap(src_page) == pagemap)) {
> +			migrate.dst[i] = 0;
> +			pages[i] = NULL;
> +			own_pages++;
> +			continue;
> +		}
>  		pages[i] = page;
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
> +	drm_WARN_ON(dpagemap->drm, !!own_pages);
>  
>  	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +					migrate.src, npages, DMA_TO_DEVICE);
>  	if (err)
>  		goto err_finalize;
>  
>  	/* Upon success bind devmem allocation to range and zdd */
>  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
>  		msecs_to_jiffies(timeslice_ms);
> -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
>  
>  err_finalize:
>  	if (err)
>  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +err_aborted_migration:
>  	migrate_vma_pages(&migrate);
> +
> +	for (i = 0; i < npages; ++i)
> +		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
> +			migrated_pages++;
> +
> +	if (!err && migrated_pages < npages - own_pages) {
> +		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
> +		err = -EBUSY;
> +	}
> +
>  	migrate_vma_finalize(&migrate);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> -					DMA_TO_DEVICE);
>  err_free:
> -	if (zdd)
> -		drm_pagemap_zdd_put(zdd);
> +	drm_pagemap_zdd_put(zdd);
>  	kvfree(buf);
> +	return err;
> +
>  err_out:
> +	devmem_allocation->ops->devmem_release(devmem_allocation);
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> @@ -747,7 +840,8 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
>  					    dst, npages, DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -764,7 +858,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		drm_pagemap_migration_unlock_put_pages(npages, dst);
>  	migrate_device_pages(src, dst, npages);
>  	migrate_device_finalize(src, dst, npages);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
>  					DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
> @@ -820,12 +914,10 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	void *buf;
>  	int i, err = 0;
>  
> -	if (page) {
> -		zdd = page->zone_device_data;
> -		if (time_before64(get_jiffies_64(),
> -				  zdd->devmem_allocation->timeslice_expiration))
> -			return 0;
> -	}
> +	zdd = page->zone_device_data;
> +	if (time_before64(get_jiffies_64(),
> +			  zdd->devmem_allocation->timeslice_expiration))
> +		return 0;
>  
>  	start = ALIGN_DOWN(fault_addr, size);
>  	end = ALIGN(fault_addr + 1, size);
> @@ -861,19 +953,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (!migrate.cpages)
>  		goto err_free;
>  
> -	if (!page) {
> -		for (i = 0; i < npages; ++i) {
> -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -
> -			page = migrate_pfn_to_page(migrate.src[i]);
> -			break;
> -		}
> -
> -		if (!page)
> -			goto err_finalize;
> -	}
> -	zdd = page->zone_device_data;
>  	ops = zdd->devmem_allocation->ops;
>  	dev = zdd->devmem_allocation->dev;
>  
> @@ -883,7 +962,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
> +	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
>  					    DMA_FROM_DEVICE);
>  	if (err)
>  		goto err_finalize;
> @@ -901,8 +980,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
>  	if (dev)
> -		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
> -						DMA_FROM_DEVICE);
> +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
> +						npages, DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
>  err_out:
> @@ -938,10 +1017,12 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
>  	int err;
>  
> +	drm_pagemap_zdd_get(zdd);
>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
>  					   zdd->device_private_page_owner,
>  					   vmf->page, vmf->address,
>  					   zdd->devmem_allocation->size);
> +	drm_pagemap_zdd_put(zdd);
>  
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 0b39905c9312..56bb3896b89a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1028,11 +1028,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  		/* Ensure the device has a pm ref while there are device pages active. */
>  		xe_pm_runtime_get_noresume(xe);
> +		/* Consumes the devmem allocation. */
>  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
>  						    start, end, timeslice_ms,
>  						    xpagemap->pagemap.owner);
> -		if (err)
> -			xe_svm_devmem_release(&bo->devmem_allocation);
>  		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  	}
> @@ -1546,6 +1545,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  		      struct drm_pagemap *dpagemap)
>  {
>  	struct xe_device *xe = range_to_vm(&range->base)->xe;
> +	int err, retries = 1;
>  
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
> @@ -1554,10 +1554,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>  			dpagemap->drm->unique);
>  
> -	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> -				       xe_svm_range_end(range),
> -				       range->base.gpusvm->mm,
> -				       ctx->timeslice_ms);
> +	do {
> +		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +					      xe_svm_range_end(range),
> +					      range->base.gpusvm->mm,
> +					      ctx->timeslice_ms);
> +
> +		if (err == -EBUSY && retries)
> +			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> +
> +	} while (err == -EBUSY && retries--);
> +
> +	return err;
>  }
>  
>  static struct drm_pagemap_addr
> -- 
> 2.51.1
> 
