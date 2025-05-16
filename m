Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D553AB96B3
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83410E9C2;
	Fri, 16 May 2025 07:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhH9tV6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E982910E9C2;
 Fri, 16 May 2025 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747381190; x=1778917190;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5wesYmdJx29fhrY5wPAikECpQcqPu4Q/4KcDXcE/WpI=;
 b=jhH9tV6dIpze6f8ieO+LJY1SwkjOGDtU2hwVq/PoIAzbziTxS1jiFhen
 HiAhNIPu315hy+fM94vkUg9iFN7M1YWIx83G8h3flCCYrZQcmhcHgrGGa
 YHUpRu01UMmHzcmYkDcI9+9NQaZpUBYGhnqv31es01uzAsRjfKuNkibF2
 wOVhbye4Y5fTkzVaRusN3MFPMI5lgsKhyMWLFBvOo/MswQfMzU6Lph/n9
 o9KRjQMBVK3m6Iyx/czSV/DFKBNZXz1xs88YRu5Mjy/LbZZiHrQtUDFPh
 ModZXZURCegEVxXlBSk0TaD0UcVIuA0WiSQSpRCrvnKuD9zLMrxIMepyP A==;
X-CSE-ConnectionGUID: CO/ddQP+SE67gjod0nxPyA==
X-CSE-MsgGUID: mFcuuUZWRyqRBAk0ThGu1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59982660"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="59982660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:39:49 -0700
X-CSE-ConnectionGUID: COzyM25aSDaQO5coW+VNGQ==
X-CSE-MsgGUID: 9dMoMp/PRcmLiG7IXvhU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138524093"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:39:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 00:39:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 00:39:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 00:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIm7Wf5yalnjpFFneo0gVtLvgt7ZAPJ80ZVGCb6M65dwOdKcz4ZIeA92BdFXKHFgQKIYlrJZlfvoHG+0JuVvf/QMpPLAPhrxIa7KvQksNJI1Jcrs3OjuZ9WcvcWOnxsvInkZl9F+/3jivk7T+NpBfi81kxzlmDohaMJEA/eNZxWx3qUsv8G0qXYRK/Y85zQHGe1WhGpzlmK+Y2wzv75EctMx0uRQvH/E0QntmU7YgkhU0cuvSkt3kHBNrs6X13/qenzIum4Q6zMrqfO2oYMw+pRoKv2v+huRUYl9dRQvTrPQMK2CzyWBQDT25E+2g36H2bGju3FVemp7IR5kiQbrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/9++WHBLKLOp4Ik9PoG0jLh9Mp7JFgX+mhoDoFJzHA=;
 b=bovl5EoAKQ8jmZ1P6G+ECJ58o3XSrvVO3zflrL0uPuXRbUF+MEqJr0h8VTlzOdbFbWSMd2CJr3yrIONjvVpB2LbEwWae/Y+vTvxcwUoGV9ml9b1v7yfq8ClAO/quMakiGVn0oOn2iZF8OiS46fVkAnGNn50fbgxu5jwLt0y/CyEIBrtWU9pF949kDQHkXn45PXmIgQzqSPY3B5+iOTP0WzJkcfjoEsXwUVKH7Q4YQJU8/fltEExdGOVrcRD6b00oZP3ZLP0vBgGJ4Eq27Z6qJVHq46D9U0TgJSxQCgcIvdw0cSDfduMLyWlsOMLdh3zwbgFXscKZG/AmL0dKC4QC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 07:39:30 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Fri, 16 May 2025
 07:39:30 +0000
Date: Fri, 16 May 2025 07:39:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, <siqueira@igalia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, Raag Jadav <raag.jadav@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@linux.intel.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, "Pierre-Loup A . Griffais"
 <pgriffais@valvesoftware.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/doc: Add a section about "App information"
 for the wedge API
Message-ID: <dqdajfj72ndnlmdfcy7cxhg3htfghmmt6mcjrkhsacrgyb4elv@comcou45jd2t>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250512203437.989894-1-andrealmeid@igalia.com>
 <20250512203437.989894-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512203437.989894-3-andrealmeid@igalia.com>
X-ClientProxiedBy: DB8PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:10:100::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c9e9fa-bf5a-4223-b75d-08dd944ccb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0Y0QTRiMDBhTi9mMmVwWFdobTV2MnhWNk1KNFdsYlNLaFhLdzJRWDZRTm5l?=
 =?utf-8?B?KzUwYVhTMlk4RzltWGdsSFBrQm1MZnZIY1hWeDlrSnBsZ05VM2gwOFVIOTFu?=
 =?utf-8?B?aXNaVEk0WEN1d3RDY2kxZDVtZEE2aWtaZHFEckdlQmRlbnI0ZVEvb2djbVJJ?=
 =?utf-8?B?THQ5cHVpMFlRVjNpVzZkRE1PK0IvYnlLMW9ocmVZWS9VQlltbXZ0OFp1b01z?=
 =?utf-8?B?K0hxb3NxcktiZ2ErbHc4Q3RNcndCMmpUN1dKdzVoZVRLVnBua1JsUXYrVHky?=
 =?utf-8?B?UlFlRDZ4dFRyMFdZcjI1QWFob0crZ1pYU3dzUkN2U1hONUpPWFExdjhCUGsv?=
 =?utf-8?B?cVRXcG1UZmxFRmNxZnpsd1diZ1FtaG40dVMzSlhac1F1bTJMcEpKREtyZHoy?=
 =?utf-8?B?ZC9pYXkzQ0pFbnAzVGFLNHZBYnpMWDcxYVVlZlk4YTMwRlRBZlcrVUY5UWYy?=
 =?utf-8?B?bmJUQklTcmlUNVdKV05RUTZ1YUs3eEcxdUZxdWtiamZQbVE5aGdQemMyb3NI?=
 =?utf-8?B?b202T2ZCajJFOEx2bVBuTWk3NFZRS3dwT2FpSDY5cW9HZEFaY1NVTEpIcHN3?=
 =?utf-8?B?OWVpSFB0ZTFxQXVNZlFGcThqQXpBdmhjTEFraFdydUZqRVBPVjYxRS9kT0lM?=
 =?utf-8?B?bG8rUklhaDVkR1I5a1BuejNLSWl3aEdxQVFqU0pnNDJxdXdYSDFRTDVmMnRH?=
 =?utf-8?B?bW0zVnNIbFFjT0JCYzMzdHBydlY4MkJoN0o0RmxvN2ZJbE1MdkplWUhqZHAv?=
 =?utf-8?B?SXJ2NFZZbzdFM1ZWd1dpbWduV1p3YnlmNGhCa0hpdEYyNnlqeGpWZkV4Y01u?=
 =?utf-8?B?L1ZOWWNERkhLZkt5WVJMQTNxRWFhS3hrVkJicFZsMmowNHlpNjZ4T09UaDdU?=
 =?utf-8?B?U3kwY0NOMFdyUm91OVUyZkp3V0lueEV5RWNVc3llTlJYcmR1VnFDT0NUeHFM?=
 =?utf-8?B?dnliQ0pQeGVHZldjN29BaW9TSW5uNWx2M3dCSkprVnowOXBuais0MWxLb2ZX?=
 =?utf-8?B?U24rZ2FpdEtXMWRzL0JVVFJCbW93d3J4N1FqTFBiYkFHWk1nR0RhYkRkZmRx?=
 =?utf-8?B?cXJSODRvZFNWSUVCN3R1NXJtS3REVEhzZVFWSlRaSzROVWxpU29GN2RsejJk?=
 =?utf-8?B?RkU5Ym56VWFHUU0xOElNRU9uZDRsdnZPODFsMDRCZzhJdmhhZk5nN1lEd1p2?=
 =?utf-8?B?aVpkcmxybWpNcmRlSjExazg1T2VjMjlMTzd0NnFnSldSSDh2WWdDOWxBNE15?=
 =?utf-8?B?cmZ5em91UTBUVzYveTBaSkV6KzVneEtjMGpvYlg5RGV4bGowbzRMcC9IWU8x?=
 =?utf-8?B?dStyb0V4eHprY3ROYWVWNGNpLzB3S2toTytEWFJxL3FtUFNLUlo2Z2Z2Yllh?=
 =?utf-8?B?Vk1LL0tMK1h5TGtyZUdwWkJhYnFaZHhFaDhJMG5temxCcFFKM1BsT0duRmZB?=
 =?utf-8?B?QVFDT1dtZWJackd4aXRSeXFTZ3NEbDFLMkFscWo1RXJWWG1qTzZQYnQrWDBz?=
 =?utf-8?B?RnRsNFNOMWwxMGowejMxOTJZYkFwMS9tbmx6b2JjT2hmeUZjWUc5VlJsaUI1?=
 =?utf-8?B?ZHl0Mk9ZWnR6NlNLZ2t6MmFRU2l0Ui9wZ1g1b0xUSVE3ZVpwVTYyZ05HenZl?=
 =?utf-8?B?eVQ1SnNxUWdNaUNtT09MSE1HZHhyQktlZTRxUHA4azhNRGdFV3gvM3FQb0p2?=
 =?utf-8?B?eDY3ME8rY0l6Y0E0SENLS3MyNDJrUU1hMUpwT0ZHQjBKaE9FaXMxbzJjc3Ry?=
 =?utf-8?B?NmV3SVkyaS8zT1BSNHI4cE1UOUZXdG94alBhQ2ZsSVExSWFHMUJRanNCK0hH?=
 =?utf-8?B?d2tlYnlFRlk3Rm9YTmNMWE5IN3hMRG5CR01YUVlmWHFBaXlGY2NUSGEwVzdS?=
 =?utf-8?B?OTI1MkRFK3JROU50Z0lHZEdxVnNwVFFydHhnZXBld3dtZkJWWDU2Tlg1SWdC?=
 =?utf-8?Q?x9BUn716oDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUhMMVNzNGMyblJIbFBPTXA5REI0U3JSTFRObW9HQVhWRjJNNzg2K1FaU3NY?=
 =?utf-8?B?OU1EdnhsbGg2dElPdktoaU44TkhXYmtiNi9POGg2Vm1scnZWRmdKSFN3cGl5?=
 =?utf-8?B?R1dsR0xXenZZN3BpSzh2dktWd3dmKzhla056bXpIU1VBTTFIR1VDemlmV0d5?=
 =?utf-8?B?RmVSa0hJRjdYeFEra2VkOFZjUWgremlMekt2OVZEc2RWZGRHYkZ5UDdUY3di?=
 =?utf-8?B?VFAzOGFPZHRyUzNScDc4MGc3ZHBRczBYN2ZYblY4bFlQZnRScU00TFZhSmRU?=
 =?utf-8?B?bG4zZWVhenRIT3h0SDhoR1ZVYVRqUVpjdGRlRS91cjhiQjFIa2VQQ2duLzQ0?=
 =?utf-8?B?SkpLRE1oQUtjM0tSdThUcHlHSVA4bjRaWWlORndBVTFVU20wL0ZMMDRsQ3NW?=
 =?utf-8?B?eFpiV1I0NE12cmFqMm0zaDgzK3NzMDNBUjJtM05JRHI1MDhiV3JxejlWWUZr?=
 =?utf-8?B?TWdJS0pId3IxM3Y3V3djVVlob3g2YlA2SU5JemRVWTUxQW9CRkdSemRCUGxN?=
 =?utf-8?B?S25pWWIzUkgyZmpiTHlROW5UeDVDckpmcGMrdUl3dWl6WEh2TVFlU2RnUzBG?=
 =?utf-8?B?ZVI0Kys2UVRJdzR5b216V0Q3VjlDR0dGZVV2T0VkOEE0K0Y4YmoyMU9VMkkw?=
 =?utf-8?B?S1NYZU5TSWJMek5vdmxGeUFOdkRFdDhzc1NxSkRvMGdIbFhjZVZwYkdDZVVa?=
 =?utf-8?B?dXJTREVxaGtQSmJFdHlkazd4T2ZrTE4rWEJwYktlaGRYUTdTVXB1czlkbThV?=
 =?utf-8?B?VmhLSGdKTDdxcTNPWXpNYmpRV2FSUk9OMnJPTDErekJrbmQzR2dtT2dBUlMz?=
 =?utf-8?B?NzA2K0xYSnFzSHpzazdCUUhvckhaY2JLT3dTbFZ4T1cxYkg2SE5EVDdUMlFM?=
 =?utf-8?B?V20xYzdDY2VzRTZOVTdQVVNsb1NkWFBWS2NmVExzcG1YR1ptUCswL0M2bVd2?=
 =?utf-8?B?ZGdlNmdTTXQvQW1jblNaQUxmd1NaZTU1ZVZDVGN4LzdZTC9TQVFrN0NHdnNS?=
 =?utf-8?B?N0Zjenl4WEJvb08rOVg5V0c4YjMrZjQrUHVVelpXM0RpdWFaNnJxUFhvbnYx?=
 =?utf-8?B?M1RhYWFMQ0hFQUI0R0NEWXRRL1hpTUZ2VUVMUFF0bFJkcnhLZC91KzJESm14?=
 =?utf-8?B?S05FTnJiTWRlRmNGNWZoVDJiTWk2UnNUWkJRU2V4MjNsYU4vNW04NmRnMHZF?=
 =?utf-8?B?aTBSR2RnTTFJMUZBalJvWUJtVGcxeHkrUUk2SU9LWlRrSFN5bGpMSlhyclB1?=
 =?utf-8?B?Y2FsYzVMOVhhdVB2QzlCMVBzYWs0ZW05dFAxb2NvTWFzQmd1cG5TdmEyUytp?=
 =?utf-8?B?VXlWS3U5RXlsMGRuSURqUXdBZkh1TDBHd1Z4VDhHNmJZckFLRk0wakpGZ0g5?=
 =?utf-8?B?Z2xrVWY3bTZuWUllOFNteGc1bmdmeUF6eGJ0OHJucHg4Tjd1bVA2SlE1VnVx?=
 =?utf-8?B?NHlBdUdJWmxUK2RwTUNSeDh1TjlLa1ZxeHhZTzN4Q2VFR1RVVzY1dXRZekxC?=
 =?utf-8?B?eXdhUU5kYjN1WDQxemVaei9mbzdtVUhNVFF4MGFZNE5CdnB0ZVFDbmRnRWFp?=
 =?utf-8?B?aE9EZks2bk92bEJoSEUrb3lTUnhHVTdwVlZhM1lhSDNHeTFKLytVOXZHZHN4?=
 =?utf-8?B?Q0YxallYSnJRMjR5bm9HWFN3dnpIQVpjeEhvaHpwNG94Z2Jha1ZtTHhMb2xl?=
 =?utf-8?B?Zjk4d1hLRDdyV1UwUTVMSEFtVVZlMkpYODZXVzJzWnAzc3IrSDhJSFhtVEh0?=
 =?utf-8?B?N2s0aWttWUUzUW9ObzNGeUtTNnNNN2RweFZuSUhWZzFKZGJhejVlalFWb3BX?=
 =?utf-8?B?YTVsaDgwbHdDbkdmRnlKV0l0MkIwNG5hNkNzcjhJcjYyYnROV3M4UFYxSlZV?=
 =?utf-8?B?NG96aHk0czcrTTFzSXFSMlg1VXdoMStURE9DQzdkT0ZuVFE0dHFuNE13OE5W?=
 =?utf-8?B?eFlxOG10RnZnNW1oelNVMngyQzVUbkJFUEROSWc2Tjg4UnRlaDdndldjdVRs?=
 =?utf-8?B?MnhHYUhqUzRXdHltbmtlOTJWS1l6MDM0ZlpqOWJ0OW9uOHMwNE42M1JXRmFx?=
 =?utf-8?B?N0JJN2RXZVFIUXR0N3k4ek5xN0ZJUHEzNlFtNE9DRlA1UVZVMVBMMnkvcE95?=
 =?utf-8?B?NnZPUHhYN3FIVEFhaHJhWVordFZmaVhxUUZDdnFzMFBrRTRTbTNoQ1kwaGFE?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c9e9fa-bf5a-4223-b75d-08dd944ccb38
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:39:30.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqsiZdPuR22JPhJSI3bbCLkhG08wVyummIFfGybLS90IC6xHKktjlF764Rji/8SBWyYi1YDmS9snyShXWlJTnopaBQ27j7mDWSh/x/Gpx7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

Hi André,

On 2025-05-12 at 17:34:36 -0300, André Almeida wrote:
> Add a section about "App information" for the wedge API.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3:
>  - Change "app that caused ..." to "app involved ..."
>  - Clarify that devcoredump have more information about what happened
>  - Update that PID and APP will be empty if there's no app info
> ---
>  Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
