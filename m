Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47CC4A2B6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAD210E47D;
	Tue, 11 Nov 2025 01:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmVXdyUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAA810E47D;
 Tue, 11 Nov 2025 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823118; x=1794359118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+NhxtylLy7TfnzanuboPshugMKe4FqSCsalNbdreIz0=;
 b=lmVXdyUWaleY4sXIOH/kKVN8Y680y9Rxs/vtkzbSJG9EIIv/fX7T4iIg
 pw6QhD+YsF5La9YW3LjaAj10tkiPAqOtgHdlJiG1NloFzmVTNkOhrFlp+
 xzIBMZLgJXLxtE6/9vcZ9r5P0QsZv0Rvknt2KHzOYyNovDv39pvkHM1uu
 8A+sdKDtPzpFUcx0y1fxdfyZg9QfxavQ+cZwZkUAyaNYrzD3qdX0Wf3md
 wGA0Zr23hZmRqtESopGmN0HETbadiRKvDag7T5TTEDIfL+gsn92vwLnLr
 9lsBLQmIHp6esPLqz4Obn0l6xfo1TqcQOtsnpGz8jMnmx6kjpuFd+gIH8 A==;
X-CSE-ConnectionGUID: /OqUIovrRyyMpuyD5Pdsbg==
X-CSE-MsgGUID: sIH5F1xpRQ2ifjLnBgmSJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64789555"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64789555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:17 -0800
X-CSE-ConnectionGUID: JXRawOM/S76ze2xMdkwJ/w==
X-CSE-MsgGUID: 4y/+2ePeRJy6cFb+3OeD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193203602"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:16 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm2lfFrznkfe4ZAtXl8szqxPdhUxFQJe3Gn5k5Gby1M/9Or7qdHszSQF/9+rhBjFmkOeO13hYDGCi/2y1NmxvbjXBQxj9juZFGKUXaTXR4S7+8STthMFoBok0XnFLadPNYxj64TymJ4lgnVgRG/FaOv4tlW1jT3trTnoYQ9pwMm+0w5D+0YlQrgnAoqi54fxYgGANoKXWUA3yEUUMXtGf7yc9XSN8H0c3NDwvPeS+T7xtH2AxFHqlj0I55Ui9kEk+zDnq0Xh2RIDS6EApjg6bVjAVOV+K+6vtRnE4zbr+batHsxtL54AxIF9cQqdiUYgdK5oVEsADWfwp8FMtmuJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzzpPRQf/iX0LpgzKSCs2ND/kJqSwgnGmsHsdoLypYY=;
 b=qFylOrNUM3CnDpqWVOatLK1mJGIiwWcRTsiCG6M3X77IIV3vvp2juf1zcqfZZQadwakBuRMXjCKDu7iwRJqzo4fpRqtX+xTNjp7XQuy4W0t9aZzNTxbn42OCtVD462m3HgfiUBmTbpw/zRyv0RFgq2YYA11Iy5znapSitx4XffIx4tgcEyZRekcqJTOWXU9LORTFkOcbcg2UZjvOOpHdUnv3k99yshjSC+juYSbPdbYMZXmMlAaqtSAnd6eHcGqBHFKYVWAMnmeyMBtmteVg5/geG/geBJv2FnruJcR2K6+BjMVddzboqOsVyOYZP0dNJhvUG0ywu0EvV1evIJxbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:14 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 01/28] drm/xe/pf: Remove GuC version check for migration
 support
Date: Tue, 11 Nov 2025 02:04:12 +0100
Message-ID: <20251111010439.347045-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7e84be-8ccd-49bf-76d0-08de20be5ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RThTL292d3huc3FRb0VXSXNvbjhsOVJ3d2Z4ZytwRmZVL3RsU2hvamw1YlJ1?=
 =?utf-8?B?dDVTbXJsRnd4U250R1N3VTRGZEtOTVN1NmxzLzdHRy8yRjRsZi8reDQrSFB0?=
 =?utf-8?B?QU1xMS8rbTVHb1ZNbVcwNDNwcFRJQVdnNkovd2wrZUFrR0xkN21vT2FXQkFj?=
 =?utf-8?B?Z1NjcEVBZUtuODZGTEtOQnFJNEdVZnIwa0Q3TTZlcU5DN205ZVVHTHd3d0Rw?=
 =?utf-8?B?ZHd2Y0pUQnpyOU1KL21xVFl6bkppaEY1MlMvSEhRZTVlOGNMc0NYTk8vMXpH?=
 =?utf-8?B?VVZINWluUGVFQjUvNk5NMWh5YUVscjZnS25vV2N4QWI2OVV2TDVrQTgvWjIz?=
 =?utf-8?B?LytWMUJJbzRnWndVcUlQWXY5VktMVFZZelZVLy9jNFZHQ3U3RDl3elN3Vm5E?=
 =?utf-8?B?ZW50dlFkRENZVStMQ2t5cmJqMWs4eTI2RkVFREtBU21pN2ZTdnkvdzAyZllp?=
 =?utf-8?B?L1FMUEQvdkZNK1V5T3pkZFRROWRXcS9oQzd1TEx4QjNGWUlHRkR3UlNKdWR5?=
 =?utf-8?B?SHRiQ1N6dEY4c2pCUExMbmc3bXFVZ3J6UjdIOUNGdEhsZ1hCTGg5VWxZeGpJ?=
 =?utf-8?B?aklCemxyNFlYSlV5VXR2K1pIV1N3bGxhdlRycnBRbVlFb1hOd0dFWDcreHpS?=
 =?utf-8?B?Sk1EYkRxbGVwMkZOK1BFVEVPU3YyV3gzRVRKQktCd2JSYmRCTU5YWGJvYzBS?=
 =?utf-8?B?YWFBNmxCRGFjU1k1UDg1aU1lYXk3aFY1R29yZitQVlgzYVYyR0Z5RS9ZSy8z?=
 =?utf-8?B?K1ZZRmxFdlFldHpNS1UzY0dHb1o4d0dJTTNodUNJelo3QVg4anFhNlpieXMy?=
 =?utf-8?B?aGdQUWd3M2RpMmtnanpaNVM1Y3h2cDcrYVpaV0wxYyswdkZHVnNsRzBjaWYz?=
 =?utf-8?B?UHdlMmNrNVRCWlVNVWNuU3hleUkwTmIzeHR4UGpQYUlNTFVDM1pTMTJ0aGoy?=
 =?utf-8?B?a3BYSlM5bTN3Mld2VTBnSnJMd1M3cE9ZZlhTN3JIS2k4Nm05MTdtekNOVFJ3?=
 =?utf-8?B?TGJBdVNRTk9IeEJ4bXRIRTVZby8vNDBwMTcwbEtQNDRPdGh5dTczekM5ajFS?=
 =?utf-8?B?VE81dmhIdGREbjc5ZTJYVmZ3U2xOWWkyYUtDSHpYQndzMVV3eTIvN1ZkenVZ?=
 =?utf-8?B?c0piRkF3T3FucXppRUZNblAvK1dVVkhUdW1PbFRUdUd3aXNyYzZtcFRKQysx?=
 =?utf-8?B?dytGZjlPa0N3Q3dhUmg2M0JmWjE3ZWx6MG5MWXh6MnYvMHNmWXZGSEtHbEM4?=
 =?utf-8?B?TFFzNTRoR2hZRUR6QTBjbkptY3k2b2lDVFZocGswTUNkTFVmZmVCTUE3RGFN?=
 =?utf-8?B?dUpjYXJBQllqYXlmblg1UmRkSFRDOUthamlqWTZCYkVZV2wxbVV3NWVUUGph?=
 =?utf-8?B?UTQ5Y0JLMGJVSkxuM1luTnplRndkNVBTUjI4L3FJWVJpS1Z5UEVjYUNGTm9I?=
 =?utf-8?B?eG5QZXNrbGlnekUyREREb1dSMDIxVVVKNUkxL2JTam5tSmhEdjJoY2NDNWNS?=
 =?utf-8?B?eERhbDVld0x6VVJhd2dhanA3QTc1YjlrUG1jSk1qdEdxcUs3ZDdBbk1RL2tL?=
 =?utf-8?B?MkFaQldKcXdveWVUZkZaRk9IUUJpcTZLZE9KeWN3YVVEZnZ6WWVENSt2czlk?=
 =?utf-8?B?WklCeUNvV3VlcVRRMk13REZFVXBORDdXbmNRZCtLNWp0ZTFVaXp4Ym1RQTY1?=
 =?utf-8?B?WVVhM3hlVnNJblMyTURrcENERTBqTkJRb0lBbWFVcmpWNjZ3YTMxWmJtZ0ZN?=
 =?utf-8?B?emNESVFpbWZjSi9DVUlqZm81eHVnWHBIR1ZRYWFCVFU2S1E1MnZMWXN6MzMz?=
 =?utf-8?B?TzNNSTZLMWUrYjQzUmhTb3RuVm5xb1NGTFM4eG5BK29jU3ZkNUdCTGUzVVJh?=
 =?utf-8?B?TGxsQlV1aG56Ym5iUnEzY2M4ZFN6RlQzWHVPWDcxUzRiZUdvVHhPaDFDZlUz?=
 =?utf-8?B?Slh4VmtXaDVZN1VDS0hyQjN4aHU1UXJiZmZjWWpjbzA2NWRPanJldCsrQVNv?=
 =?utf-8?Q?L3LPC0ywguARxR9wm+cRgBru53BVaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S290YTZLUi82dnBsWjkrdFAxVU1DdEJvTmFnZ1NnWUE1c1hNS2tTdVdINll3?=
 =?utf-8?B?aUNmbmNndWhjUzZDVy9XK0t2OUoyS3NqTmpxaDkyZUZNbGcxY2wxRVp5Ny9K?=
 =?utf-8?B?SnFZcWl2T1hQbER2cG9DblBXK3lPcWtvREJkeVRCaUZwRjhIdHdBZElINkk0?=
 =?utf-8?B?WlJiSytQOUNsQ1lFbXhpZ3JYS1hUUWRlODBvcTdqcUVKallMelJnTFBCRkFZ?=
 =?utf-8?B?VjJrNHMwVFlzUjl2OG43bElZUzJQUDE3ampZbDJobHZBU1lpY1RJc00rUEZC?=
 =?utf-8?B?ZEpPeDlVL05jVGluTXhIMzNsRjhFblFLc0VCdVpCRlZCNnNqNnVoQUxmMDRR?=
 =?utf-8?B?czIrNGFFNWdsY25zZWRwY3BtYi9oczM4YWJtcEFOVEk4YmhxWVhnWnZjVThZ?=
 =?utf-8?B?SFlPc3NpclNlSVg4ZlZLcTAvSHh5WG5CckcyTGJXRWJUR3dHU1ZsbDhYV0Q3?=
 =?utf-8?B?aVk4VWxyZVdIcWdsUXA2QjFnS3dKdFZPSUo1MHNuaFRQTld5UkpXZ3lUeEJR?=
 =?utf-8?B?RXU2OFN0UDJoa1NNb2NtY2NBaFBPR2NZZTBUcG5NWmZFOHV1TVBvekZhOGFH?=
 =?utf-8?B?bDEyMWZLOWJHZjNkMW5xc3E0bjFJN3FYdXFmRVNhNU9td21yOGZRS0lJRld6?=
 =?utf-8?B?NFZrdWZSV3lFeVpBOTdCMW1samR1dkREdjU3SjN0UjNFcEU1MlhPTzQ1RWNa?=
 =?utf-8?B?QjZJd00vOThnY3NpTXR0VFM0WTg2VzFlK0QwNzByK244ME5sT0txQkVtK2Vn?=
 =?utf-8?B?cSt5N2FnZFFqdStiaHZ3Rzc2OFFTZFZGeEVDa3dIK3FyWXMzekdJc014UUdD?=
 =?utf-8?B?MzJSTmZxTG5JYy9iME5FVWExM2FFTHMvZGZsZ1VJTmN0RzRnRUJtaGptYXh0?=
 =?utf-8?B?WTZaRmxveURPeXliOENQM3J6ZnlJTG9WUXJSc2ZXeFBaeTNHUXRzL1BOU3JO?=
 =?utf-8?B?OE10Rzd4TmI3Tm9DdG1mUDcwUFBsdWhwMjMvcmlreUsyZXpUTzhqVVV4emRq?=
 =?utf-8?B?SUtMMllmZmFLWlIwdVptdXdnWXJoQVZmbWMzbWJxZVpuV0lQVTZxb2tVRE5C?=
 =?utf-8?B?UFUyaUJOUTRraDdaSFFKb3hlNFVza2dFTStURWZzTmlGQURGRzJEYVcxa1Bz?=
 =?utf-8?B?M0JXalB4SllwUTZYNzFMYzduNitFZXBKL3N4ZEpFUVhQOEY4L0pWbzZEZVNz?=
 =?utf-8?B?N2JhMm52cStQQ2EveXJhVW1SNFVoTVNsTUV5KzNiUVBaaFFyeFNHRVVCNU91?=
 =?utf-8?B?UE5MSUtzVEl6bDd0M0Y3QmNLcm81M3ZnWG5iMWxVVlFmVFNJd0F6a3RzZTdp?=
 =?utf-8?B?M3Y5ZmxJVTFtUnU3cHcrTm5NSTZmejc5K3pFL21Ec3pBTjZsR3RSdWVIU3NF?=
 =?utf-8?B?REthSGU2SmRtZEVSQkQrK3A1RzNPQStPc3YxSG1WQTB3VVVSN3QybGpjc0pJ?=
 =?utf-8?B?VHVFTVIvVU95K0sxREFPU2QvWmlkbE5aRGxuZGphTXdhZUh2MDAxVmxYSnJo?=
 =?utf-8?B?MElxbjBicHJZQi9Ca1lTc0FRN3lFSmMxZElKSGsrZDdNaEVOeWlpRVFsVmhz?=
 =?utf-8?B?aFhBelVDRWJsaDIzWW5XMUhFUGxoZ3lJVFl6ME55UDFreUZGbXRIQkhNdit6?=
 =?utf-8?B?UVNENEliVU9sRzFwZHUrOWxEYnJSOWc5NWg5SFFWSi9KME4wd2NLRHB2TnFv?=
 =?utf-8?B?Wml4UDdBZjBwbWJpVUpBNFc1eUM5bXBheEJBaUdOejBNMW9FL25rRDFwU0dr?=
 =?utf-8?B?SmlTdVZBZnNzaGFBUUFsdFU0N2o0Kzl2cEZ3eE9qQkx3bncxU1dKcG1yUFlD?=
 =?utf-8?B?cEtVenlUQjZOaHc5MlIrMnltbUl6QlBiVUE5ckxMSmpMekdMbGR6SGNQTENh?=
 =?utf-8?B?clcvMTJYV29DMXdYT1lhaVBBVW9TazZCS1J5S2xUZlFxNnE2V25GZ2NBY2V3?=
 =?utf-8?B?SzhtVkxoM2hiVWp1Qk5UR2M4cXhmd01ibnFlR1MyUDVhVmhvVnNIaFZyTmJE?=
 =?utf-8?B?WjdKUmVCQzN1cUtpMTJ2cFdBQWRjdVdqZGE4SUtrY3JyZGZ1ZEk4MjJaaXpU?=
 =?utf-8?B?WU50MllUaFpUbURjcHlvYmV0V1B0bkJzVmNhenhjVER0djF4OCtUb2w4UE15?=
 =?utf-8?B?NG5vampTNGZ5MzQxWHUxT1A2UzhnTnVnSjBBd3lvVFNjN01wbERGTmoram1O?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7e84be-8ccd-49bf-76d0-08de20be5ec3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:14.0108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+jTtUr79xFlPtrOQhC89Zot96pzKySG4CN0oM0GYSKGQgUIweb9VG9D5hA4aodRYR07+Uz0vBz4pM3cRuvuuqoIzF52XbWYRTgJ/mkeZ/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
version to v70.29.2"), the minimum GuC version required by the driver
is v70.29.2, which should already include everything that we need for
migration.
Remove the version check.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 44cc612b0a752..a5bf327ef8889 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
-	/* GuC 70.25 with save/restore v2 is required */
-	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
-
 	/* XXX: for now this is for feature enabling only */
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
-- 
2.51.2

