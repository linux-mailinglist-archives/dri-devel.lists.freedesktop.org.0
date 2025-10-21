Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22241BF914B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F610E645;
	Tue, 21 Oct 2025 22:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke4pfANV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F1710E653;
 Tue, 21 Oct 2025 22:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086571; x=1792622571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VdtccHmtpdA9g5YYKJJZXXmJlLwMQTaKEg6Vjrb8f08=;
 b=ke4pfANVtV/SHw2VwAgEZ2ebZWmIeoM+uLp9KwVlM+usvJePtlSNtqt+
 KwnCfRkoCWTShAVmPk3X5N/RVhHPMpU3MJoKQXs8MLaLRUbQrgUe1e3r7
 vaANVASXyV5uP4d8R5385hElq2yeyvu5LZaq3FXhE11qZqzumWB3piN9h
 Hp2alBaDOwBAzqaw5XUJ4f56CZfGOJrG6VL8UDEUD4ySWzgpg5tiRvcU7
 QcKf/bnCRjCiCmvVELx9J+s1ayH/sMgf8DID+WS0Svec7fnNajCzvT7+7
 yVG1WULNed6qBydJ/XGfnum8KTFh+S4BI+bpTA4hAK9wx3oEkSazsS3E3 Q==;
X-CSE-ConnectionGUID: biPNOEY5TTSjYh14I63kyg==
X-CSE-MsgGUID: lhASKEi7QTSSwMaaVMKb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73895143"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="73895143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:51 -0700
X-CSE-ConnectionGUID: UUlGihZkRNGrDCw5IzW3rw==
X-CSE-MsgGUID: UPsHgc1+QjSZ6Kz3Qw2nLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183644355"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:49 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbQvfpyBAZnXLh6yrmiWH0gLu26TjvMFyMbqmPTjxiEWFrGxq4F4b1bzUvCaSuIn6m1PQ95ZGwMYoVjZ92Yi+LuZqyzCqlFdjVcRargeic8ElW72w60jnYv71/C3q6YacpeEbNHymFmKeswGJNqm+anPt0nDRjMO1ERua4UgvOUyQSOUH5bCyJhBH9yGmwXRmZjLivhkAVY8s/U6n8zR6CkP6kxtUtBTgWtsorz0Lo979Tj8XOJK+8C8S17XJUUwBCzfDbHfP8bJKc0jCf/RIDnISY7dTUs/bps5HvhaeLnxN1MEc+2Y6rONxgTtFwIPNdQAfb9C25DxVvA3eiTNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCPvYsBuo7h/mVdHQ8FtkLh6oW5w8DxDmRT3+p+fvbM=;
 b=TW7bZ89n4aRqS1LLsBQw+P0PfadZf5NZ9dZgGl6oLe520bHvyGMbuI1bpyND4ZlTgUQW65ipuWgrrVWj00rijORuw/lq+8lGGfLG5jphnXgcomh4GHlc760jbxmjsvDc6y6c4vy91+D0M4BjBx9sGzLNp+GLIPUepGdgRAisW0colic00ONggRH/PQVEX1ykQTaE80MtEl3e1FZJoEdLfY5YmlxmyaszVADs3NNC+PzrDVF6ICda1X2paPQM69ib5YSL4e3cDCbbN0Ea4R+kjHHc9xKzw8iaeCWHwJsyyFcHVUlS7vf40D0dfyIQ2A2fNAQBQ285niL7Mdlr8x/kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:48 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 08/26] drm/xe/pf: Expose VF migration data size over debugfs
Date: Wed, 22 Oct 2025 00:41:15 +0200
Message-ID: <20251021224133.577765-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dba436-b1e5-4225-b5be-08de10f328af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWo2SUc1d1BnVjUzc1V0L1lhdWJ2TkJtZk1SL1V1czBLYTJaTFJ1UUdOT1Vi?=
 =?utf-8?B?YzdaUGx1RkZZVVZVWVF6bXdJVEdFRnhSeFlmc2hGN2ZQL0Ezc3UwTFdkMVdz?=
 =?utf-8?B?cVo1dDFWYmNjZmJCaDkzbWIrYXg2NXFaSFNIZVJHdGtIb3BlbEpqZHBlZkVk?=
 =?utf-8?B?bmFseU5QQWNnalNBc2VQTFpISmF1bEVMaTRiVGJXNWU5OVJCOE9RTlJvbkRB?=
 =?utf-8?B?Wks1eHBGdG5ZS0lrVXFWM2tMdHBOV2dUV0lzaVNPLy90b0ZJYnc3bmh4dHc5?=
 =?utf-8?B?d2VLZ1BGNzZtUkZlRHYxbnRrQkZFMk5ldHYyNXdpem5TdnpvQnI3RWRabVI2?=
 =?utf-8?B?WVl5TGM5NWFRTjh1L3BKaE9TRUZuQytNYm1TWFp4WkZ4YXlicTBDQ2wrV3FQ?=
 =?utf-8?B?L2lYSjdVZzYvUXFVKzA1Zll6T0puajJ3NmNabnM5b1RZSXFPL3JSWGhtTWsw?=
 =?utf-8?B?OTdDZ21HKzhnNURTT3p5bjFHT3RmaVRiaG05TGRHU1E5eFJOZjJuZmtGZTJE?=
 =?utf-8?B?ZGkwVU9jUFBSRmpVcXd6UUxqdkp0M2MzbmRFRWpQWXZJaTlDdFNMcEF2U1hU?=
 =?utf-8?B?WnduS3l6aWtkcDY0NGVMa0tvWk5Uclh6UllxYjBnL2dhUXlvU3I3eThxTlFY?=
 =?utf-8?B?WlJXTld1S0cyOHRYTmlqQlZ2WkwwNWF2TmRYOHY4SVcrMVVnZnc3aVdnWW93?=
 =?utf-8?B?SmZmSmlmSVNBNUlUcDQxWURIVlpLbGlLTW1DRU8xYlVEVmszSkRmMFNYTndY?=
 =?utf-8?B?UXhzaUZYVU1JblFycEp0cHdsc2g3Zng3cnBSRlN4MkludVhUYjlsdFF2ZlJB?=
 =?utf-8?B?UFdsalR3NDNJWmxnb0tmanpqNkNZQzRldWZtbTlNaFA5eWVRMUJqWXVFNW9v?=
 =?utf-8?B?dVVDWHZTV0U0ZTJDVWlvcVg5cndjNmZpY0RmWTZsTEdrK1NFNEVUK3loeFRs?=
 =?utf-8?B?ZlFuOFdPUmVuTmF6L2dnYmwzOEdXYkJYUG1ibGRXWkFmV3Z3cy9SK1pXVnNX?=
 =?utf-8?B?V3NCMWp0MlpldG1heEt6SWFzU2l0bVlrNXVhRlZjZ2IwUitkZnpGcmNHd3c0?=
 =?utf-8?B?Tkc1U0tsbXlnNUdZUTRkYUQ0WDM3SVdqL1lTKy9MaUVXRFVjb2dYTnhyeGgw?=
 =?utf-8?B?VDZhOExMRTRocVlhSzM5KzlRVEpWamlncEQ0MHZEbENHdkFONHF4a2JkMndX?=
 =?utf-8?B?UnVVem9GZnJFVlJWRG4rc2ZtQ1NoM3laOEdUTkxmVG95dWl2NkhEcTgrYmlG?=
 =?utf-8?B?cHI3RVBEdFZvTjdqbUJzOUdJWERLWFhEMmhRODVOUVppUFpkVGxoLytlYVl0?=
 =?utf-8?B?V0ZBTzNoNTFzRjVqS2IyREhxSHVEeGRJUUhPRm92MCttSmJzb1J3K3ZHcE5x?=
 =?utf-8?B?OW9yZkYrVDkxVmY4bjBhWFgwMzBSK05JZi9RKzhRZzk0Y0xXYnFPUytzRXIr?=
 =?utf-8?B?SmdvbWlDbEI2UGpuejFlMFM2TWJ3RG9rZU1BN29qTjB3TDVXc3ZoQ3MyS3dO?=
 =?utf-8?B?U0VVVVFtRHMvUWZrMnZac3RQQTBYVEdITlZkK2NEK254aFNLUkF3MWZRTnZ1?=
 =?utf-8?B?NVhSYXBWUFp4ZXRWUEdDMXBCbXYzSmNENHRoY0NXWkxPR2x1SzZJdFpTN0lu?=
 =?utf-8?B?TG02UmtlbnllK1gzVTBXWlkvL0VnTWlnSk1WT0xuUVhhZWMrc0VZR0kzZlpB?=
 =?utf-8?B?eFpPc1gydVM5S2pYYklYcGZRUjFZaU1Td0VzR1BRUk9rUjdoemd6M2JONDdn?=
 =?utf-8?B?UmxlSlVpanJUNmxLYmdVZzN0R2U3dDJjQ1k1L0hKb3p2MmdlWjNDMEdFWUl2?=
 =?utf-8?B?blNBbHRaVnRSbFA3SHRSMFdzUlpHZ2FtbzhuUlBiVjNFNGk3dndnUFkyWXc4?=
 =?utf-8?B?N25OQVJhOURPZG15eEZYamNPTHlpenlkaTFJbThzOWJjNnhoZ2kyeVV1R21L?=
 =?utf-8?B?dG8rUGFQUlEwek5WOGlLNlhTdXJCMVpGV1puWFcwaDdWalBxTVZCd0tSNFVh?=
 =?utf-8?Q?vD3CjNpd40j0XaPcaDi6jB6hu5GmaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNmcGJwbEVlNFdQQnRsZE9uNkdzVTdIYUc2YWRXK29CWGVBSTJUYjN5Z3g0?=
 =?utf-8?B?ZzdrQWNYWGxsV3pEYmlEbWNiVDh0T2t5cC91VVYzbVBYNTc4SFJoYVhXc1NR?=
 =?utf-8?B?T3gzOENuQ05HN0ZOTlNvbjAvZjlGb29ya0xqdnM5K0drRCtOM0RRRU5rVlVF?=
 =?utf-8?B?QkdWL2Z0S1B6blFXM3A0STBWakNPdkZTWUJuK0FuMWNNcDI3ZVRDb3Q0eDZ5?=
 =?utf-8?B?OEU2cmEwcXJ3cEQyYU9XTFphUnZjVk11NjBGVzJoQTBlRWpNeXNMVWNYckF2?=
 =?utf-8?B?d1JoY3hZc2RLSnJLbUNhKzZPQzJKUjdFYkJqQWVkYnJVMDFhNnllMVVtcWZS?=
 =?utf-8?B?UkNRYnFVbHR1ZDZGazEvM3czdVR1Q20ybjFjbCs4bGs4aGtzS2hMQ3U1TjNq?=
 =?utf-8?B?T1JNWEM0dEQ3Z0VkY1llZ2tJbFgyMVVxZEU5YXVyV0Z2OXliTTNDcURLWVNx?=
 =?utf-8?B?Y3dUYkljeFNkTjVXMVd5V1Z6OE16R2l4a3pxMVJiOVVtZDVTeFI2UmxSNWk3?=
 =?utf-8?B?QzFhUjlndlJ6VnhpVC9MY1FDRk5WZnlXck11eDRlckhTT1U0T0NwakVpSU1Q?=
 =?utf-8?B?MnkwSktmOFVQaUQwaEpBVlF2MlVFcE11c0NhZE8yY2d3VUdNZFpLU1JZWmFv?=
 =?utf-8?B?TVdETVVDeUZsWjB6VnhmVjBKSjFyRWxWbER2V0FMcHBBQlFZZVlYSnFzYXZ3?=
 =?utf-8?B?WmNabVhTZXZVcVBOS1Zodjl2REh4eE9WYTVua1V3UE1WRE5qK2F5UXplVUpy?=
 =?utf-8?B?VUp2RThnRnR6ekx5QS9TVnlsUzRoL0ZYZ2tuZ0FHTXNUenlBaUcrRzM4RmhO?=
 =?utf-8?B?Mk5pNFk1aWpFekZkdXc4U20vMUY3Y2p6WS85Mm1VVHVMSTZ0WmxLem1icFlZ?=
 =?utf-8?B?OVJTNWVELzFiZCtoYzFlNXV1N2dEVnUyRlNoRW9mc09kVm9Yb0ZjUFBoWmk4?=
 =?utf-8?B?MEJFYk1XRExPTXJCY0s1ekJXdUNxaDZzM0VBaENRTTY3UHlHakpnZ1FGUG1X?=
 =?utf-8?B?RVduT01ZU3A5MFpubllqVytuZk40WTM5REVmL0ZwSktwQlp0dGg0TTFnU284?=
 =?utf-8?B?V29vMVEzQTBEZEp6VldoMVV1L3JHQjcxZ29ZcVB3K2pjZHM1RkFhVUdNTjU4?=
 =?utf-8?B?aU96Vm8xdnRvMEJvaDhLdkFPalJFU2R0OXpmUm5WRUc1S3VCUHozUFlhWHNz?=
 =?utf-8?B?YlIrOFhQSC9JaXlINjQwV20rVk5RcXN6Tzg3c09kbm5pMFptblFvU0FZNTFl?=
 =?utf-8?B?VXdrY3JrSmZrRDJDYTZQNTQyRHI1d1YxVjRIZ01HK3Zabi9BVHl3RHJEWEdB?=
 =?utf-8?B?RnpaMkNGWU1SNmpEOVhpWjZ5RmkzaFRseERVSHdsVEVRanR4Ny94VFp1c0Fn?=
 =?utf-8?B?U2FicTVSOHNIQWlIV1Mybzl3NmZTZmQxR2hkU3hzWStoditWNjdraityYlJF?=
 =?utf-8?B?ZTFFaldYdW83cFJnS2NjcW9iU2RBN05rQ2N0L1lJL1daNEFiQTlqa0p2Y0h4?=
 =?utf-8?B?bUdxeUVlUjFnZHFJTjNRcTR4RW54RUJCMVlUc2FvYnk4NTJoZ3JsSEgyajVv?=
 =?utf-8?B?amsrTktxVWhxTmJiVVViT1B1Y3ZSOGVpZmsveVZySzFyaW8rLytzek0xeE5m?=
 =?utf-8?B?YUFBV3JWQk1OMkJqL0JLaFNqSDdPU05yOEJ4d3EzOEtxb0RlN0dKN0tiUGpG?=
 =?utf-8?B?VUZYbzduMzBmV1JTUkZiRUlzZE5XOCtDUUVYQ1drY0JFR21TbVFJdklwSU5T?=
 =?utf-8?B?TXhwU0J6d1FHNE1XQ0ZPdUprZURvbHYwSXZrNEtRc0N2QUg0YW9tRUl5VUhz?=
 =?utf-8?B?cnRMYnVTYW1PYi9pY0l6d0pZeGQzZXB1KzVKNnJvWVlNajhvMG51UFh1VGkx?=
 =?utf-8?B?SmhsZ3NTUC9sOS9JVXNuaHF4WjRIKzZhSjBIZUZOS3dzZ1lWeUI5NWlFU2t3?=
 =?utf-8?B?d1IwS2ZvTWdQaSt3b1l5Mk1DTmdYYXJsM2pGMEJmaVBUaWlBVVdqbWF2SGZl?=
 =?utf-8?B?anN5cmxYS0JhUW9YZ1dHaU1wTTVkWkpNZHpkTC9udmZMMXZYTCt1eXl2RE9Q?=
 =?utf-8?B?bVFRRnRuc3BhSW5GK1plM0NkZnVtS3hnZWNESHFjYWg0MUcrVEpIWlpQSWlM?=
 =?utf-8?B?OVF5czNJZ3NCem9jcENhSjJBd1c3dGxjc25aS21oSFNsbEF1cXZCZmwyWVhP?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dba436-b1e5-4225-b5be-08de10f328af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:48.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV95/aeZItlmAy+ncLOqcKWjPV1N0+BzFKDqwjYXwNjW/6rGJC2iY8xVmVpmbqa+h33ypKipB7OUiv1103qHwXVqrvrwAE32972zP77Jxqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 19 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 29 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 8ba72165759b3..4e26feb9c267f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -395,6 +395,25 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1ed2248f0a17e..e2d41750f863c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a9a28aec22421..bc2d0b0342f22 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -14,6 +14,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -254,6 +255,33 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -263,6 +291,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 0b4b237780102..88babec9c893e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -242,3 +242,33 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0)
+			return ret;
+
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index df81a540c246a..16cb444c36aa6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 					  struct xe_sriov_migration_data *data);
 struct xe_sriov_migration_data *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 #endif
-- 
2.50.1

