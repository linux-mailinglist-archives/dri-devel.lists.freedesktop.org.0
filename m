Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB7BF4175
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B47910E545;
	Tue, 21 Oct 2025 00:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcqTBCPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F5A10E2B5;
 Tue, 21 Oct 2025 00:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761004915; x=1792540915;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0vDeyK1CHXAJjYojnAwublQmu943OVpumo9QfZuAORI=;
 b=WcqTBCPH/qpvwYXEH3e2B24rU6mMsj2kUhDDx3yE0OHDfFYD/SoC2Gpg
 NzcZOsYIG9MxT52sLc/HSjZXlQVmu8SRzKfiraGZLRULefvwFCq+DHgTS
 FB9gElxicJwGzhtNb6slwpH+59E5kMN1AqJMi125p053UpDti1KekU5DG
 oVOxAI/EevEVNu+K/hXHnuQuy3jwcq7q5FAl0zrCoSDfHrnmEd4pZ/V4/
 /f4qKA6NMaiwOH1K8E2U+c8fsbxuPiYCbLp8LvYM8rJTEvIOp1SCN//U3
 rFPNoKVoxBztcZTb0WHzmZmq7sHFuMPBEukX4u9IiLYFNt+S+kx0qf4BT Q==;
X-CSE-ConnectionGUID: nfrhEZJyT1izb/6L9omuYw==
X-CSE-MsgGUID: ic78BYTERTS/X72pGm7JxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63036663"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63036663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:01:55 -0700
X-CSE-ConnectionGUID: GF9zAw0bT7Gh5pMA+55/SQ==
X-CSE-MsgGUID: tiRSlnsBQeSlWXoXdRm5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183301898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:01:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:01:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:01:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai7fRs4vZGoWH56HwwR4X2zu4kO5DJpJ8NHFdX51S+usw+8X2XfFmKDKxwviRT028YdSUP4Dc97KDIdJFH2+YWgD/D/sb+ag1tL7dxFxYH0EOWomt1Eju72wKzReOOIgTJNsV1KnC2srR5BlSmG31PtSEIlLxKJXtNGRU/Y8EAAYpG43akaGZ4owBRNto5buX2a8q1s5wFBMjEFYHYajfFTsfzZ7wFQVlz8FP6ZJqjmDWMpHQ3v1sXlSwAwNKCXXwG0JZQeZrtdDHIp65Gcrn4CY9JvSYfgV+g7zeRslrJaIvBLf7gkt7ADDnGCRZfpuw/ygTr/zPMgATQplIHjHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ6fSEot3c+KHKfL92xo6TyJDf6+Wqsnc9KWd2cYwcM=;
 b=xvAiisRNIlUNWEqzRVHh+GyEN900iq5gD4lLFAu7L41SXSDMpus9YmGUEQH6ETpCUZv/CiaglyTxNkSfFBBOSVTUGiFwegOb2ftOKcGlXtygmWtchRMnGMCCj/Nwx+b1xB/QvdhqWoqStiTdd1gZXsdYd9sGrvuACD+Eb6HU6a8Sns2/IoP4lybD063zo3KEciBLdO6jYCkbUFsUPGKKg8+jHHDjVTjRhbC6DOnlLh7kNvAbsnmMhPj/YPLQFrWXII6sIverwCAOmQzTvE/5T54Lq2gMJQEmKdekUWJAN/XSiegLeehZoVFmFg0Apf9zL51GsTq1AE1UimlvrAjpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 00:01:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:01:46 +0000
Date: Tue, 21 Oct 2025 02:01:41 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 06/26] drm/xe/pf: Add helpers for migration data
 allocation / free
Message-ID: <lyzvwwgye7cmfrjkbwl44mlkkisaz5p7knkpofc52zfgcoh5t7@kiac2wah6yt2>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-7-michal.winiarski@intel.com>
 <8ce3bccc-a65a-48bd-b7ad-7f2599f1d3bb@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ce3bccc-a65a-48bd-b7ad-7f2599f1d3bb@intel.com>
X-ClientProxiedBy: BE1P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0934e3-1294-40cd-f2d2-08de103505a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTRvbzlZcE5ldXg1c1VBazFVeVlkeGRnZWVJbVB3eEVLakRaQThObi93MlEv?=
 =?utf-8?B?eFJIVHhqVExwSGFSV3VKUDhsMDUrY3k1Y3MzWE1vYlh2MlF1UkV1dGxlTW5m?=
 =?utf-8?B?WWZLcGpTSDR2MndtbGc2cEJtSDVycDJYNllzdEdHSzFvdlhIem9sN2tlTHlj?=
 =?utf-8?B?MmdVSEhidG5VaWUrdVBTbUpkOU1SZVFQTVBXWC83aGQzNDJyOXB1OEtiUkcw?=
 =?utf-8?B?MXlZKzY5cnBPL2g5R2V0RjlKYjIzNXJMWXlKN1pmMkVRMUVwL054QVRwTlFH?=
 =?utf-8?B?MkxVS21XdnZraHFKZmlpM2UxNkRJdkFLS3Q4WjNFNjVXeHF5dUM3NTRGVFRh?=
 =?utf-8?B?QTZvZnFYR2Jwc1JyOUFseU1qZjRBUkxBdVJHRnl6YUlRQ0M1ckZwSnZ2QXhW?=
 =?utf-8?B?WVFYZXpiMkNEN283b2ZZVmYzOVJtbFBzYi9jTjBGSlZXeXAvZlloVi9pWHJE?=
 =?utf-8?B?azJPcG9iaURYeHg3WXRTSy9JQ0F0ZnNFUk5Wc29zaVZiUGhuM2dMbG02WDBJ?=
 =?utf-8?B?aXNodWU1Qng3TWFKVmtaSUU0dDYxUWR4UkZ6VGx2OVFON0EzaWh3M3lnN3F0?=
 =?utf-8?B?TEs1SE1SVlJhKzYwTDArWjdwSDVJWmM0bVhvYm12bk5sWWVDaTFnVTM2TU95?=
 =?utf-8?B?QlpuRWNsa2NxWlplYU9pV2tCRHJFNEpmRzVaYUVnMEl3NEdBTmw0N2pXeHVE?=
 =?utf-8?B?N0RYanVzVGZwSGUxZGdaRHE4L1Ayc3F2WnVZOXZoMnVncktwRldtcTZXcng3?=
 =?utf-8?B?WGV2WTNTcmJGUG9KWmtBdnBocEMzaW93eHBsMXZ4U0gxTDBPVEpCWEdmUzBG?=
 =?utf-8?B?ck9Ga09pbjZuM3krZ1lQZ1NXeWp2emhNNkxyRlJyQ2NFMHJpc0NDNGZ5ZjJC?=
 =?utf-8?B?cmZ6SXAyUUxJNWVCang0S1NCZVdtVmxNWkkvSXN3UFVmc2t0ZFgrTmlRRDRO?=
 =?utf-8?B?U0VRYUVHZTBabzZMMzI5UlhwOU1sVVlCdkZJVE1kOWlxOWFEQk9RQjJnQmJB?=
 =?utf-8?B?WkhuaUdYVm51bUNRMFR1aXZPNXBRMmZzcGQ4RHlqLzkxekVtQytKMFBpRVBu?=
 =?utf-8?B?QUczZ09mYjMxTktOU05hQ2JjOFBJRWovMUMwRDlXZzBtcnNkR3V4NDI0V2t3?=
 =?utf-8?B?ZVFKNFE2VGZBSlMvaUIyTGtYTVVSblk5MEh0a1BMQVRuc1EzQ0xBejljNSsz?=
 =?utf-8?B?TGxLWVN4Rlo0TmFTQ1FJUnpWRWYwN3JjVkhNZTZDdG1Jdm1QcVJnWVN3eDlt?=
 =?utf-8?B?bUFhQS9SNktqNWZIcWFHam8xZXdIb0Y5Y21Dd1dqUy9lbUlPMTNSNXpNTGdu?=
 =?utf-8?B?L3drSGRQNGVBSGdaRmM2UXAxdUxqKzNROE9MNHVNVFl6V2tCb1lON3VBSHhk?=
 =?utf-8?B?UCtMaElUMHdMMDEzSENxSkl1RkFONi9CNEIvYWk3MUljOS9HcnI1Y1RVUmp1?=
 =?utf-8?B?bUJxZkpMTksza2lXblRraUxtakNaZEJkUEFjQTc3TktVUXdaRUp6cDFuMkVa?=
 =?utf-8?B?Q2JNK2FDUXF0eWhCYjZMWGVzREhTNlBOYWFrMkNRZWlUR2FOYzBXcVdlSlM1?=
 =?utf-8?B?UjRhbzUwYkxDNSthT1ZpL3JKLy9peWQ2aHhoa3RDaHpuUUxUdng3MXBSOFkx?=
 =?utf-8?B?bHdBOS93R2dCclNBNTBWbzhMZXhvRkhlVS93cXRFWUdxdXgrYkhqTzM5Ymts?=
 =?utf-8?B?SUVCVnlPeEFjYk1TQVdWazZ2cjRKQmIvL1J2eS9uUDZQWHgyMjdHRHFKTGNv?=
 =?utf-8?B?K0NlODQyZ0t4L1NURnVnODY2QjVKMHJNYnIxYm5hcUVoNnBQUDk1Q25mZ3NJ?=
 =?utf-8?B?Y3VUb1FnYTF1dW5uNkZkc3BkUnFXOFlac0prWFh4N3BUUmU3S1hndVQ4b3V5?=
 =?utf-8?B?dXZNamdIWDF1cFpzcnhQOXBWVUdoaUFZMkFYSCt4cXRIZGFDMDZZNGJpdDUw?=
 =?utf-8?Q?jA5laYYfxrJa3e21hCM7JdqdXcoKYK2P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lEelFBdDBNVDhJRmx3S1ZObDk1S3pSN3BhdUxVeWtBVUlUeEJlNEU2eDZl?=
 =?utf-8?B?c0tEWXgwV0JpSmIzTzRFNDJ2ZU14RDA3VmpBM1FDTFY4MmpVd1IwZVN4aXdk?=
 =?utf-8?B?NlNWdmNQcVRJVER4cVdFWVBwSkVPRTY5Nlo3K3FQem44UmtsbkpBcXJWTXZq?=
 =?utf-8?B?UFRhRXN0Q0d4ZkRjNGRGbEVLdzJzS2dYaGQ5QWJ6SG5RTi93UzZXSVIvMDhE?=
 =?utf-8?B?THAvLzdzN1lRZ3UrSU51VUx3VS82UmVjQ1J1cktSdDZuRmlVMGNLSmlEZ1RJ?=
 =?utf-8?B?L3pOQlBGY0ZHd0Z6RWJxKyt2blNyYmFlaGVxV210dU83ZDZxcGlLKzQ1NEll?=
 =?utf-8?B?cmR4RWF4WjA2cGhtUVRwM2dtREJ2cVRaaFRrYnYzMWNsOXNCTnB6VlBTanQ2?=
 =?utf-8?B?cElQY3p5a2hsYjVKMmFlL3VQWUUzTmtnd241TGdpV2hHU1YycC9od0tpazRK?=
 =?utf-8?B?ZmUvVElra3l6bitqSExHZmRyMGNyTkd3T2c2dWRaZkhua1o1Wlh6VEVVRm0x?=
 =?utf-8?B?V082NnlYY1AyVzlXSktTdm9SWFRJdis2U0Y5ZXZ2dUdMR1ZYZkNlQ0dnaVda?=
 =?utf-8?B?bG40K3hwc29aTEpQaFdTZWhjZjhiNmtveW5CU3ZhMENFNVFaMkpRYUo2ZWkr?=
 =?utf-8?B?cCt2SCtYdWpXbklyTEM1SmxIMlNVZk5DVkZGS3krRlNSbGRZVlg3bkZTb2N2?=
 =?utf-8?B?TjVjWTY0RFZIbDBNZXFUV0QwM2tWd1hBUEpUTGp6alhjakkzZGMyMXpBMWsz?=
 =?utf-8?B?aHBrakZ4cVI0cWpzcXFIZVZTNWRxbjNTWk9GdmphZ0dvMkkvSGNndVFJaWNH?=
 =?utf-8?B?U05Qa2Vhc0gyczVSZnlYRW5hSWVWL3RXblh3bFBCMFh2djB0QkYydmpYWVBu?=
 =?utf-8?B?eEJPcldiOWhsMTVoTWw4MGcvd3F5YW5URkZTRUtsckVINXpTbTdacUtpSGh1?=
 =?utf-8?B?Y1ZLQUd2a0Zhc2NWdEVHUExIbG8vbWpJQ1pDdElFeklXdHcwTy9ITGt5UTJo?=
 =?utf-8?B?amw1RFhPN0o3c2RwNzhyNVlxRWQ5WTNrejZZRzVaN0l1ZVU4WFdKY2pnUEh4?=
 =?utf-8?B?allad29taXlZTHkzR1o4dkl5ZEozbmN2MERZUDU4eTFhNldmeUExVHZzdy92?=
 =?utf-8?B?Lzk5S1RrSWFEc3RJSGhQQ2lhOXJhWVk3cFNLcWNPZ3NtUUQ3TGJlcE9xaGVO?=
 =?utf-8?B?dlFDQVE4ZUQ5b0ZudUFVWG91SHAvaUhxWG9sWjQ2UGFjOVRiK1BhTUk3RkJV?=
 =?utf-8?B?RUhEZ3JTckVBeUJhbEVEQkhiUGJHOCtDN3k4dmVWUGc5S1BvVzhwcEVtSHBJ?=
 =?utf-8?B?b05Qaks2Z2pEV2FyNWQ4YUdpT3krZ0N5dmVRdm9aRlJrQm8yb0hmbnl5eXBL?=
 =?utf-8?B?VFRFRktzcWU2UmFkdlZxTVFXVWZya3BmbG8vTjRFL1F4MlF0YnlaR3d3eTVL?=
 =?utf-8?B?UXR1SWZwazBJRWpIOHVPdm1WTzFNU0RDU1p1cS9EdWt3WGxkT2RGcHFnR09S?=
 =?utf-8?B?cUpMSlVDbFppSHV4NkdsTmhsYU9EMHd2NklkYmtZVHpVYWp0bHBHcVljVzVm?=
 =?utf-8?B?TXc0YjdNVjdIbXNhUHptM3NHZ0V3VXk4RDJnUkhHZFVXTUVLNVV3ZUhFcTdt?=
 =?utf-8?B?clhWbXZ3eEhUY2hJekRNTHQ0NUpoR3ZER1FYZ2g5ZHFYWE96Rng2UWcyL3RP?=
 =?utf-8?B?cVUzUTJLazRKYVFVYUVDeSsvd2UzSmdvZnA0NVR0UW54eXZRbmRFa0UzNUUx?=
 =?utf-8?B?cS9ydkF4VnVoWkYvR05pSzRhWURsRDdvN2QzVjNHSVRmcmJBZzZJekhjRFVx?=
 =?utf-8?B?cnA1RW5CeVRiMGcyL2NvYk9MSlNIc1Buemk1M2ZiaWpkZDliTURCUkQ0TUtF?=
 =?utf-8?B?dmZab2o4Z0xMOWRsVXlIanlUcXFvVWt5ZTNqU3dCc0RNRHQyNmFDZjJ1a2Rr?=
 =?utf-8?B?VU9VenlrTHdtamZBeHZGV3lIVVIycS91L1QxMmRsOU4rZ2hNTmdHMCtZdHQ3?=
 =?utf-8?B?VHEwYVkwVldTVFBqalR0b01CdXVMaFZFdFY0OHhubG1NUFZ2SkxWVmlxMU52?=
 =?utf-8?B?dytUaDFPd0ZuZzgrQnJIdWhTY29OM3NsRTRtRE5SWHVoKzJPdW1aQnRaekZF?=
 =?utf-8?B?T1lzSDN2blJ6UDB6YmllSWFaaHZtaHhMMWtQUzF1aVZIUFNxVittZzV4WlBS?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0934e3-1294-40cd-f2d2-08de103505a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:01:46.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lD7SzdVgCpaWxKahXbbUHDXtQ6/YeSz/XdGTKFjjqTbnkPL01wCPUkX5UaUXiy9r9sw9VoAOYhiCsyyLc7bOobVHuPsfgCvBEnl/NIl1e6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
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

On Mon, Oct 13, 2025 at 12:15:55PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Now that it's possible to free the packets - connect the restore
> > handling logic with the ring.
> > The helpers will also be used in upcoming changes that will start producing
> > migration data packets.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  48 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  10 +-
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |   1 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 135 ++++++++++++++++++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  32 +++++
> 
> while this is used by the PF only, maybe those files don't have to include _pf_ tag (like xe_pci_sriov.c or xe_sriov_vfio.c ?)
> 
>  .../gpu/drm/xe/xe_sriov_migration_data.c   | 135 ++++++++++++++++++
>  .../gpu/drm/xe/xe_sriov_migration_data.h   |  32 +++++
> 
> or
> 
>  .../gpu/drm/xe/xe_sriov_vfio_data.c   | 135 ++++++++++++++++++
>  .../gpu/drm/xe/xe_sriov_vfio_data.h   |  32 +++++

Ok.

> 
> >  6 files changed, 224 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 71f685a315dca..e253d65366de4 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf_control.o \
> >  	xe_sriov_pf_debugfs.o \
> >  	xe_sriov_pf_migration.o \
> > +	xe_sriov_pf_migration_data.o \
> >  	xe_sriov_pf_service.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 16a88e7599f6d..04a4e92133c2e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -949,14 +950,57 @@ static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> >  }
> >  
> > +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
> > +				     struct xe_sriov_pf_migration_data *data)
> > +{
> > +	switch (data->type) {
> > +	default:
> > +		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
> > +		pf_enter_vf_restore_failed(gt, vfid);
> 
> shouldn't this be done in pf_handle_vf_restore_wip() where all other state transitions are done?

Yes - will do.

> 
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> >  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> 
> in other places in VF control state machine we use slightly different pattern:
> 
> 	// can we exit state AAA?
> 	if (!pf_exit_vf_state(AAA))
> 		return false;	// no, we are not in this state
> 				// try to process other state
> 
> 	// yes, we _were_ in AAA, process this state
> 	ret = handle_state_aaa();
> 
> 	// now decide where to go next
> 	if (ret == -EAGAIN)
> 		pf_enter_vf_state(AAA);		// back
> 	else if (ret < 0)
> 		pf_enter_vf_state(AAA_FAILED)	// failed
> 	else
> 		pf_enter_vf_state(AAA_DONE)	// next
> 
> 	// state was processed, start next iteration
> 	return true;
> 

It won't follow this exact pattern, but I'll change the state machine to
match it more closely.

> >  		return false;
> >  
> > -	pf_exit_vf_restore_wip(gt, vfid);
> > -	pf_enter_vf_restored(gt, vfid);
> > +	data = xe_gt_sriov_pf_migration_ring_consume(gt, vfid);
> > +	if (IS_ERR(data)) {
> > +		if (PTR_ERR(data) == -ENODATA &&
> > +		    !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid)) {
> > +			pf_exit_vf_restore_wip(gt, vfid);
> > +			pf_enter_vf_restored(gt, vfid);
> > +		} else {
> > +			pf_enter_vf_restore_failed(gt, vfid);
> > +		}
> > +		return false;
> 
> this should be 'true' as we completed this state processing

Ok.

> > +	}
> > +
> > +	xe_gt_assert(gt, gt->info.id == data->gt);
> > +	xe_gt_assert(gt, gt->tile->id == data->tile);
> > +
> > +	ret = pf_handle_vf_restore_data(gt, vfid, data);
> > +	if (ret) {
> > +		xe_gt_sriov_err(gt, "VF%u failed to restore data type: %d (%d)\n",
> 
> use %pe for error

Ok.

> 
> > +				vfid, data->type, ret);
> 
> maybe for debug try to dump here more details about failing data packet

The start of the packet is dbg hexdumped.

> 
> > +		xe_sriov_pf_migration_data_free(data);
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +		return false;
> > +	}
> >  
> > +	xe_sriov_pf_migration_data_free(data);
> >  	return true;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index af5952f42fff1..582aaf062cbd4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  
> >  #define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
> >  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > @@ -523,11 +524,18 @@ xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid
> >  	return ERR_PTR(-EAGAIN);
> >  }
> >  
> > +static void pf_mig_data_destroy(void *ptr)
> > +{
> > +	struct xe_sriov_pf_migration_data *data = ptr;
> > +
> > +	xe_sriov_pf_migration_data_free(data);
> > +}
> > +
> >  static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
> >  {
> >  	struct xe_gt_sriov_pf_migration *migration = arg;
> >  
> > -	ptr_ring_cleanup(&migration->ring, NULL);
> > +	ptr_ring_cleanup(&migration->ring, pf_mig_data_destroy);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 347682f29a03c..d39cee66589b5 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -12,6 +12,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_printk.h"
> >  
> >  static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > new file mode 100644
> > index 0000000000000..cfc6b512c6674
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_sriov_pf_migration_data.h"
> > +
> > +static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	unsigned int type = data->type;
> > +
> > +	return type == XE_SRIOV_MIG_DATA_CCS ||
> > +	       type == XE_SRIOV_MIG_DATA_VRAM;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_alloc() - Allocate migration data packet
> > + * @xe: the &struct xe_device
> > + *
> > + * Only allocates the "outer" structure, without initializing the migration
> > + * data backing storage.
> > + *
> > + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> > + *         NULL in case of error.
> > + */
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_data_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_sriov_pf_migration_data *data;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return NULL;
> > +
> > +	data->xe = xe;
> > +	data->hdr_remaining = sizeof(data->hdr);
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_free() - Free migration data packet
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + */
> > +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	if (data_needs_bo(data)) {
> > +		if (data->bo)
> 
> not needed, xe_bo_unpin_map_no_vm() checks for NULL

Ok.

> 
> > +			xe_bo_unpin_map_no_vm(data->bo);
> > +	} else {
> > +		if (data->buff)
> 
> not needed, kvfree() also checks for NULL

Ok.

> 
> > +			kvfree(data->buff);
> > +	}
> > +
> > +	kfree(data);
> > +}
> > +
> > +static int mig_data_init(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> > +
> > +	if (!gt || data->tile != gt->tile->id)
> > +		return -EINVAL;
> 
> didn't we check that already in xe_sriov_pf_migration_produce() ?
> 
> in other places we call xe_sriov_pf_migration_data_init() using ids from real tile and gt

I'll remove it from here.

> 
> > +
> > +	if (data->size == 0)
> > +		return 0;
> > +
> > +	if (data_needs_bo(data)) {
> > +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> > +							     PAGE_ALIGN(data->size),
> > +							     ttm_bo_type_kernel,
> > +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> > +							     false);
> > +		if (IS_ERR(bo))
> > +			return PTR_ERR(bo);
> > +
> > +		data->bo = bo;
> > +		data->vaddr = bo->vmap.vaddr;
> > +	} else {
> > +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> > +		if (!buff)
> > +			return -ENOMEM;
> > +
> > +		data->buff = buff;
> > +		data->vaddr = buff;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_init() - Initialize the migration data header and backing storage
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + * @tile_id: tile identifier
> > + * @gt_id: GT identifier
> > + * @type: &enum xe_sriov_pf_migration_data_type
> 
> here type is enum
> 
> > + * @offset: offset of data packet payload (within wider resource)
> > + * @size: size of data packet payload
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> > +				    unsigned int type, loff_t offset, size_t size)
> 
> but here is plain int ?
> 
> > +{
> > +	xe_assert(data->xe, type < XE_SRIOV_MIG_DATA_MAX);
> 
> if it's "enum" - no need to check
> 
> if it's "int" and type is coming from outside of our code, then assert is not sufficient anyway
> 
> nit: if assert stays, add sep line here
> 
> > +	data->version = 1;
> 
> magic "1" needs its own #define

XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION.

> 
> > +	data->type = type;
> > +	data->tile = tile_id;
> > +	data->gt = gt_id;
> > +	data->offset = offset;
> > +	data->size = size;
> > +	data->remaining = size;
> > +
> > +	return mig_data_init(data);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_data_init() - Initialize the migration data backing storage based on header
> > + * @data: the &struct xe_sriov_pf_migration_data packet
> > + *
> > + * Header data is expected to be filled prior to calling this function
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *data)
> > +{
> > +	if (WARN_ON(data->hdr_remaining))
> 
> better: xe_WARN_ON(xe, ....)
> 
> but does it really deserves any WARN here?
> we rather know who is the caller 

I'll remove it.

> 
> > +		return -EINVAL;
> > +
> > +	data->remaining = data->size;
> > +
> > +	return mig_data_init(data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > new file mode 100644
> > index 0000000000000..1dde4cfcdbc47
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PF_MIGRATION_DATA_H_
> > +#define _XE_SRIOV_PF_MIGRATION_DATA_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> > +
> > +enum xe_sriov_pf_migration_data_type {
> 
> maybe add a note that default 0 was skipped on purpose to catch uninitialized/invalid data
> 
> > +	XE_SRIOV_MIG_DATA_DESCRIPTOR = 1,
> 
> shouldn't we try to match enumerator names with enum name?
> 
> 	XE_SRIOV_PF_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
> 	XE_SRIOV_PF_MIGRATION_DATA_TYPE_TRAILER,
> 	XE_SRIOV_PF_MIGRATION_DATA_TYPE_...,
> 
> or change the enum (and file) name:
> 
> 	xe_sriov_migration_data.c
> 
> 	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
> 	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> 	XE_SRIOV_MIGRATION_DATA_TYPE_...,
> > +	XE_SRIOV_MIG_DATA_TRAILER,
> > +	XE_SRIOV_MIG_DATA_GGTT,
> > +	XE_SRIOV_MIG_DATA_MMIO,
> > +	XE_SRIOV_MIG_DATA_GUC,
> > +	XE_SRIOV_MIG_DATA_CCS,
> > +	XE_SRIOV_MIG_DATA_VRAM,
> > +	XE_SRIOV_MIG_DATA_MAX,
> 
> please drop it

Ok.

> > +};
> > +
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_data_alloc(struct xe_device *xe);
> > +void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot);
> > +
> > +int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
> > +				    unsigned int type, loff_t offset, size_t size);
> > +int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> > +
> > +#endif
> 
