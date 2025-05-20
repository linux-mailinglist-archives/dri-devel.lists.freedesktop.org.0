Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66723ABDD61
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB4110E0D7;
	Tue, 20 May 2025 14:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSOiXxmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4AA10E0D7;
 Tue, 20 May 2025 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747752002; x=1779288002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=INQ1ieKmCAALvo4DA+pnKjaELkHLTmxgnrFnpUmfleA=;
 b=SSOiXxmLPvhTtue1VgMO9/bXvL5EvgjFw6laav8LDAwCRHIOJv20/zol
 xBtHpHJLyEKTBTfse4cyLnq5MsMX8AQ9OFIjoODPFyIBSJyZAmPjkOqwp
 1pWgwKEo2oHmBzNBO0judEOwfxt63X82GmsOxUhIc2gzf8R7qfE/oJzhu
 tDu+g2QK8myJ5/WZEmepheKfyHJBRfODGp7EuCWEEuptxlgkuaWGmFV3R
 oTpwmcdJEaYxzurF3ZxXOLBU+eyhYiGtC+4uAlmFMd2L9EAVudNHUk8m5
 qhgZtV79BIq6ToNTkVVTQFMUfttSzAU4+lyDjP66N3B/XP5kuV9ok/ceB w==;
X-CSE-ConnectionGUID: BWq1k7VYRRydoVh4iL5CCA==
X-CSE-MsgGUID: sc/nt5UhSBSt7RG+/Z7t5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75092626"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="75092626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:40:02 -0700
X-CSE-ConnectionGUID: hS7+dnWxTsidYSR/3dS8Tg==
X-CSE-MsgGUID: lMsa8wTvQNiz6HWeXU20Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139428380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:40:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 07:40:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 07:40:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 07:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZfAr4btgSh9takMTOKHF5c8dKgnJIcLK0/mt2+CGVA/u5X1wz4DNTaMQopId9e78a+IF2epdfkitUcB2olFzbrHHouo4Xd8OLNjPnPDG8UlDoSCipKHOUgKFnWY9WsoR6z417UECcX+1B1KHbN6qXR4wJsBVBv5x2njCrafcQCDpyTvaPtd4LhpLrw588aVZwq62ue1tiwdZwKQhPXRKOj5zyTrl2lzD2kfVDZBrevZd3+A7fYBFudtVW82ctLDB520kVCoHP8oSFwc7EPJGQ0XBqVdzH6rjuI0r+2jbikRh7K4DK6EeV9gUAgi26Qt51VUs0LdB3mFl1Pyvlc8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6xJNDB7fHMeT8/xlOSU5uh5YD9Er9FbmxwPe9yuqDk=;
 b=TQrYmLCpkwitgTcZVv4S8CYx53cIcnh2bR6TSdGyWzqYx3aLkYATajpU6Wd2vNmlPsKJS4Swginyxn2aCECeEWgFQalVQnvqpYcaRdE2jwTceFv5O3EZxV99cPLQa5sviuHvnf72euA0pLh3kTNOSC4hSwuVlE+FvTbqmEcXSACz6OLTmfF3OU+/yaZShpx+jqfRfg8vD9uHhxoGEmCYBaEjHaqDat8kA5NAEb9Dn4vft6DopmYJA21dQbdh2mAJQTgpfNIRYNXfCaufjIIJq4HIphT9PO78nl7DS6TUzbAVO6r9YWncObEVIST0pvoaG/Zc075moZfoM4p3Y/XsWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 14:39:17 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Tue, 20 May 2025
 14:39:17 +0000
Date: Tue, 20 May 2025 14:39:08 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@intel.com>
Subject: Re: [RFC 2/2] drm/i915: Add protections to sysfs local memory
 information
Message-ID: <wc4sjm2asyrbz655bxlc5fxbg5xmg2ucbsewgs7c6db6lew3pc@beepy2xirpjp>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <20250519153418.44543-3-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250519153418.44543-3-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: VI1PR06CA0130.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::23) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5d1e43-bfef-4a86-5d8e-08dd97ac195e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUJtc1pRQksxcFUyZkN3SWM4Y2RoVEZvYUVLa1dVdmhxRW83MXJXSTBBNVRD?=
 =?utf-8?B?aE5CaWkza040OUpyWmxqc3BqNHdGcVlSVVZtUWtUeVJreUxaQ3lCNFlMUW1W?=
 =?utf-8?B?T3VBaW1mYmJsUkRzb095cVovYyszbjdITTFTeVVRWmR1T3RXdHlNZHlBMEg5?=
 =?utf-8?B?YWZ0UlFUZFVUdm8zL2dJWm9kbWlqMzJ0UXhtc0hRTkJhTFlZMCt4cUhrYkdx?=
 =?utf-8?B?QkZmbktWNkw5SzU1UXpjbWg3OEkxenBEUjFiS3k2NVdEVDgrTVlQb2NNcTBn?=
 =?utf-8?B?eWx4dEkzTmxCS1ZYenBZaHQyNi9nRHJUVFdVOS9vQlAwamRBa24rakZBM3Nk?=
 =?utf-8?B?RWJabnFkQldGQXc2YkNnS1Q1WURuT1pYY0pJcDVpeUgyd1NRUUlOVHNMV1Nk?=
 =?utf-8?B?TlN5L1k2dXF4YndTQmJIS0VMWEtXaUhKcnB5YUJ3SStzSm5FQkxsWVNNNDFX?=
 =?utf-8?B?OVhqSmFreWFnMTc4MkZJZWNYUlFpTUpmMDEra293UktrMVlXM3VJNFZSMW85?=
 =?utf-8?B?VXRrNzVWZE9oT2dxQUN5KzhuWGlxcWJoYmorVU05ZHdKQmppNnc2NG5kdmpM?=
 =?utf-8?B?MmRxTGI5MnprWHpVR1VxN2k2OWJmWjQ2czlEZnhrODVacVNKY1MvakRRKzZN?=
 =?utf-8?B?aHl4WVV5QlZpbDVjNGd2MmFKMmN1UWt0MTY3Wm1sbnlwNENqUm9qdHdKMXJq?=
 =?utf-8?B?a3VFbmpoTUlueW1TdlJFYnc2Q2hUQXpiK0tmVFlJN242RUNZb2J6TGJBam1O?=
 =?utf-8?B?V3RGa1pnK1hqSVNqaEdJanJhc2JZT0VwYWltd0lPcGdFSnZYZWp5bWVXZGJC?=
 =?utf-8?B?SldUdENQMS85SnY3eXNmVXpTb0JrcFIwQThxZ0U2d0w4UG1IMFhOdEllTUhw?=
 =?utf-8?B?dzl1T0JhZnhzRzNsaHFmRVhOcGY4dXd2dTIvQlJiZ3E1SGdZZDJPSlNvaXcx?=
 =?utf-8?B?NElES2lpV2NrUmxuS2hkbHZMS1JROVNuMXZaRzVnMVFRaUpWcmxFR1UyMnEv?=
 =?utf-8?B?MlExOXBTOE8zSE1Yd1dJWHpySEVaUTF4TUJ5bXlZb2V3SHVIK0dZZWJQcDM5?=
 =?utf-8?B?eGxvaFpUQ2h6enJORFE0NEM4a2xBTkt5YUNtbXIwbEhlU05Od2l2KzljUXhW?=
 =?utf-8?B?eWcveHlGeW9SQ3RaZ1dONmRleTRrUzZtZEw0Y1NVNzhTeXZmSzQ3TjROT0ph?=
 =?utf-8?B?blhKY0dYRnk1eCtESnZXdlNsZng2cXJXcS9UbTkwdHBMTnIzTzlpUFNHMUhD?=
 =?utf-8?B?aVJvNy90V1RkWTJabWcrTnNWRHdwVFU1VzRHbFNLQlJPUE1ZRGhuZXBJaEtm?=
 =?utf-8?B?ek5OTFlCMk16UHpyTEwwZGRrc01TTjBSb0NBcnlTV3JaaEVtbG5GTWltUWQy?=
 =?utf-8?B?QitXQ2NSWkowTWR3dFdORnIraEM1eVFtTi9KcDR5OWJTTEVSbzhjbW5ySFZW?=
 =?utf-8?B?MUtHcEJRV0hDTzRlWlRROHZjaW9NRFoyZ3ROZW5OM2NHNDhCQjhjNmdJRGM1?=
 =?utf-8?B?QkN2UldqcEhCdFprWiszaG1VczI3R3JwZjVnTi9LaFpwdmJuRUk1b2N6bjJH?=
 =?utf-8?B?TW5ZYWR4d2dxSVBXVDB4UmtsbENPSEtBODlKVXA3MUliN2RKRXhkSFNaMnJF?=
 =?utf-8?B?d3hmYmJKWlZrM2YzNUoyVk1JTFdwQmI2dlNZbWI0QVl3cGN0N2dES3ZUdU9j?=
 =?utf-8?B?WGRPV2t2TUVaYnlqVm1XM2MwakxCWDdGYWJkM0dOaUVoY2lkdnlscEJjS3ZM?=
 =?utf-8?B?RzAyWFVINm45Ujd1RHVETU5XWjRGcFVDeTQ4eFlBVUM5YkhPWDh3UnZSUjlQ?=
 =?utf-8?B?bjhDMHBMZUxzZVVkMnBCMDhxNERyeG9aY2JSdGhMcFJKVjVSZnBGMHNWL3Bk?=
 =?utf-8?B?SUc5WmZKMHhCdnFwTFVEb1lBaTZXK25TZ2kyTjBrZTNPVU45aFRRZnlWaGZr?=
 =?utf-8?Q?j8RmqPijuSg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y05RRisrZ1FrWTU1ZjlDQTJxYkRrTDhXdlAxdkROU25vQ25hTnhlSm84bmsz?=
 =?utf-8?B?bEE3TGFqaWp1c2hjdlFWa0FNM3F1SDNVaXhnWkpxdjZSZTk1MnlTTkRaa21y?=
 =?utf-8?B?TUNJRlo3YWM3d0pGLzVTNDZoVkJmK1E0YzRvZytYZDRYQXpLNUFZSGtLQ0lC?=
 =?utf-8?B?RCsvZXY0bnpsOFVLMTFLU1I2WkIwRDBSRy9EVTk0SUgyZnlWK25lNzVkRlph?=
 =?utf-8?B?MzIvMnI4VFN2aWd1bzFjdkYrQjJwUy9MMG5yRElPUnV6ZGVhODl5Q1lrL3BT?=
 =?utf-8?B?ZTQwVE83dXcvdUNndUs3ejc5Tmg3RWpWYkd3MUtVMXZwNm1LZXRGcTdibHNq?=
 =?utf-8?B?QXRGM3cyT3NPa0hjRDhObmpJaGpGdjhoekhoZ3BzWlZ1clNOY29vMnJDZlFR?=
 =?utf-8?B?TFRYNUFETFg1Y1R2bll2Z1RqQkh5K2RhclY3dHlqUEpDS0t1bVhvdUNENFpQ?=
 =?utf-8?B?ZEsyOWtVZDczTEFaTk9OaG5tNW14Y1lqTHlYZjlQVDRXbWtsNzgra2lITVZt?=
 =?utf-8?B?eWN2em9UcUtabFBxbmhzMXE0cWNxMkNoQVMrRDdIYVJBUGxmV2J4WlNJWU8r?=
 =?utf-8?B?Ky9ldzdjYm1YeHNtZlB2YnhvbDJ4MUhoUmpFRUdRVkR4UVRIM1lpMjdpY0RL?=
 =?utf-8?B?N0d2M1BsTGhPN3VEVjNjc3BhSXRHU2pBREN3dUpsNG5CTnhZay9Wc1ljYWZw?=
 =?utf-8?B?TnF0QnhqR2sySmhtZE85M213UVNMbk5ERStvK29KaFhDeVY0OEdVamFHT05j?=
 =?utf-8?B?RXdtUHcrVjYwc1BnaEZHSE03NG1JbkZvOVk4aFRncXNldG1CSUpQQUhEZlFO?=
 =?utf-8?B?U2V1MjJ4V05xZHhlTitTaGxnWFJ5allzZEJYKzNqNFQwN3UzbWUrNE13bThj?=
 =?utf-8?B?ZTVQZlZLd21pZ0ZPMWtnbVVadWlDd3h1cG9LTXd5RUNocE05U0ZJQk42TGdR?=
 =?utf-8?B?bjRoeW9JL2QxK1ZXbEUweldnSGNKZEN4WGpvcEhJYkhaWmlkVW5aK2xUVUJU?=
 =?utf-8?B?NENIRGxCSEtjdVFCS2R3bXhTKysrV25ibVEzZDEvd3RUTWkvNUpscDBDQXY1?=
 =?utf-8?B?V1FSMXhwTXRaRU5RTVRqM3BrRmVaMHB2SnAwYjVTam12UVNJRFVmR2wwN3BO?=
 =?utf-8?B?NVBiczdCVzJkOWd1UU1MaVdidFpBY05QOVJhYWVoV1BKL1dzSFJBdHlyOVFN?=
 =?utf-8?B?cXA0WDZveG16TWJRODdsK1VZaGxtZVlRbzZNczlrZHBFVEZwOG9kdm1CWWFV?=
 =?utf-8?B?anNCVHpYMzRhV0lmOGJheGM2NjBUNXIwblkreEI3aFBvVWh3NXd3M2NqR0tP?=
 =?utf-8?B?bnFhVnZtKzEwTE1xZDBZWUV4Tm5RVWVSUFVBRG5OZDIzMGpMQS9QTmIvaytr?=
 =?utf-8?B?Mkd3WGw3K3RRYUgzb3owRmZPRkJrbnRZZDdJdnJVZDRIQjNnaTJESHVmcExn?=
 =?utf-8?B?Tmd3MUZiejg1ekJHSzZXVWFtaFlrejZMbFFNVi9TZFVzeFdiQk51cnM2VjNP?=
 =?utf-8?B?aEtYdDBWTTZtbG9scHFFTnRsbXFNM25DR3FxbFQwejhENUoramt2VU4yTjA0?=
 =?utf-8?B?N1plT09hQ1NtZk5yRXZEakJocFdVU0t3elA5OGg0cGc0Y2llQng1dTlQMFk2?=
 =?utf-8?B?U0pXUDhlUFMzeTF3eTdGVWorNWR1MFB1OVdIY251bGNZRUk1Mk5ud3l1ODdr?=
 =?utf-8?B?eHhveURZSXNDUGhYcCtqVVdsaUxQdlRhYkJqUW1Xd2xablZxN0llV1d1MkNl?=
 =?utf-8?B?Q0Uxc0hKczNJcUZLb0JQVkJyMXVidWVzZmpLaDV5Y29maFJIbTQzY2p4cHha?=
 =?utf-8?B?MlV4cHYrcDNQNDVwMkxldCt5NjNHaXlZSHNJQktvbm1YYUV0ZDZHcEVvNzVW?=
 =?utf-8?B?eWlrb3U1dTdOUEtVUm5IcHZLU2UrYjF3VFQ3blAyWUN3cEtEOFJSOUJGajR5?=
 =?utf-8?B?K2dweERmMWlzU3BiU3BpbFN0cU5NRUUvVG1qL2hEVXZIN1RncjBGd3JNc1NO?=
 =?utf-8?B?eExFb1h5WTZmVjAyajBieG5nQmpvNWJyY0JZUTFiaWN3QlozaUVhUHdXd2sv?=
 =?utf-8?B?aE1MQmc1aWlGclphNHBiK3dnOGxPRjlTczBsV0tSc1BpSkpDQnJFR0d1aWls?=
 =?utf-8?B?V04yNXJUMFVsYjhWekJFaE15RFNBWmVvcVMyMkhKQmMwd2Z0aFBEVUMvL2VJ?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5d1e43-bfef-4a86-5d8e-08dd97ac195e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:39:17.3311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNtnecETzVWnieUCnmdhU2Io0Os8huZ59SM0w+ZomCyfJWn7i/7uWtvRInwP9kJiymK49Rcys89L+8kDSze6fF6nHwSZMqVeVgEUz7gIxpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

Hi Krzysztof,

> Introduce a CAP_PERFMON check when accessing sysfs entries related to
> local memory information. Also introduce a intel_memory_info_paranoid
> sysctl parameter, which allows the administrator to control whether the
> check is enforced.
If we decide that this patch is neede, I think we should squash
it with the first one to introduce a mechanism that can already
be secured.

[...]
>  
> +static u32 intel_memory_info_paranoid = 1;
Maybe change that to "intel_memory_info_restrictive"?
"Paranoid" relates to extreme fearfulness/paranoia/anxiety,
which might seem a bit over the top :)

Best Regards,
Krzysztof
