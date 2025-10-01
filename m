Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD987BB14B6
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF52010E737;
	Wed,  1 Oct 2025 16:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="movN8AtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676910E737
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759337319; x=1790873319;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u+NSfkT50kfNSLD3X1eKeqO5BGZsPnRy/2xT04evmLA=;
 b=movN8AtEu6vd+5Lxwq9UIpuYILXxGqicGXzR/ex8UVt6f8cZEjsK4R5h
 AEDdbobncVDCZ2PWujBnqLgzAkXZDqA6SdNqQuqoGYEggo2u7bl8vgGAV
 bcEp/RwsHq4MgIJTSM7smK7iX2RJYZ94SfOu2MxFRGX7XpTKCfADmz2Q4
 yh9r/tx6A34e1tD1QnaBTRgeL7XIE6TRCqm2HAtR2DEqTvxEFJKQZ/MkD
 +SCFT8zQc9HNrdbkggqr3oS8jWUKh/AkiyIAV2lXZ2xoNRTq4vPSWGaIa
 Q7LvktQIOIXZ8jLTc8P3H3iqBn8f/eahUI+OnMA4A4Hs/lq4A/N7i07Wi A==;
X-CSE-ConnectionGUID: n8YObb5WQHui1h+DMxOvRQ==
X-CSE-MsgGUID: wrlNIa/BSA+hc0hHtw6Whg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65439496"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65439496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:48:39 -0700
X-CSE-ConnectionGUID: 3sf7xxTkRCGgrmlgP7/Bzw==
X-CSE-MsgGUID: ArVkisiOSG6lE7IipBy7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="183119367"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:48:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:48:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 09:48:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO2+sizzb/IXtgG53inwneVqU88tzASZiwzPBRwedEzB4QjaPNIcU97JDepdjRJiYIC4WeQxp8CAFygleTKFjFl/rOgifep2n0UhIaSdJ6WpqVUiJTttMNf0cDZIm8JWXeIUEo095v3fjnvBLaxsehqYvXX3XHVyIj3Al+Sc8qDPX0DPsLuYIz6OpuleHFZCAmkx8eg56KxDmUR7BKDgzVwPPcFtJmmZTT+cRvWn7Ro72l2mG1aoKiGmOe9p9i/1Nzrmz9cqhaX/upUn8Cdt8CSHcIjs9sRVfELVert6Qv8sUXMOty75Jse1z+Y4WOBlP4bWpTZRj2G6rm7l2KKmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+NSfkT50kfNSLD3X1eKeqO5BGZsPnRy/2xT04evmLA=;
 b=BPj5tFiFdDtsv7CPJzJDHRNcx7NsXqLRzLXXnmPa91o5KWIp2OQUd5yk1ZPkv5VduIJHRHg7B9+mZ2KFJHVHRlDUghefDw0Npr49uHN9FagkjKsXHawZX96Kn3AjKNuFufRF5kPUJ2KSBbKrTEZyoSc0QBANHN/fGxjUAftONxRUzU20/ZNqrt3j46hWJq3jqOgKKpv5rpCphYogIWKIT3+BIzoETUMNSzFa1H4j0m2gNhYzpIRl3M700hYT0Xn8ZlrGbxXcJYejc4bbe2UODa1T0WHWZZzSSvfvAt6RpoxSrBP8SGHOtxWCIthj0hk5JqseTqjD2Fngz/2jfi8iPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:48:34 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 16:48:34 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Nirmoy Das
 <nirmoyd@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcMtU25OkudopcmUewljv39WnivrStWKUAgAAnecA=
Date: Wed, 1 Oct 2025 16:48:34 +0000
Message-ID: <PH0PR11MB51129A9A13BBA286464787FEFAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-3-dongwon.kim@intel.com>
 <abcef795-4c39-4334-9ae2-91e6fb3b11d1@nvidia.com>
 <31aec005-6fc8-4f16-abe2-b4cf23a684ec@collabora.com>
In-Reply-To: <31aec005-6fc8-4f16-abe2-b4cf23a684ec@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|MN2PR11MB4598:EE_
x-ms-office365-filtering-correlation-id: 1321f41a-246b-483d-1502-08de010a5c99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RWlEeTlIVk5FUFpYUm1VR2ZMMXA5UWtQUytPQzVIQUFtYkYySTBRbjJQODk4?=
 =?utf-8?B?NTdOT3ZNYm5DRW16Q0hrRUNucDZYbGlkNC83OFlyakEyZ2Q3UWNOb3lGczUz?=
 =?utf-8?B?bEgwYUovV01RdUhWZmNwYUtPcjhlWk1NTmlpckx1UUZUdTArd3U2aFJ2VjlU?=
 =?utf-8?B?QVBQc2VHUUNlaC80c1NZdzU4bjkyczkzL3k4aU5LQVo5VXMxT2NUZWVhYVZQ?=
 =?utf-8?B?ZW9hUUZpM2JGeTJrMkg0UVRpNTh6cDZNdHF0dXBBak1URkU3YUVsSjBuRlFF?=
 =?utf-8?B?MXFlMFIxQkZkS3hWL0RMSTVCQWU1WUFLSElvdlA5bUM4VkZIcEhETnR1Tzlq?=
 =?utf-8?B?S3kreVRZZVFGTk9mcjJyU0NoU0pYZ3RVOFM3WlhCQmZRMUVnV2RZOFlPVHFP?=
 =?utf-8?B?ZFMzTEFobktDT2kvSXpMa2FlVDJzZzlXRzVPTEhtV2svcDRuMmpkTURtaWQr?=
 =?utf-8?B?UkFHazJENW1HUUZkdVFEOTlvYVkzYmFlSytTZ2h1T2NMdDFNQ3dUQVpCZHN0?=
 =?utf-8?B?M2JWbVJnN2VCZVA2TUJEL1JlZ2M3YUhudnJUWkFETDZ1dFluUUxsbjdFaUZX?=
 =?utf-8?B?WktFMTZWZFhud1JKZDUvSTU4ZTNkU0FvQ0hNZWw1MnBoazQ2aWp2YU9MV0F3?=
 =?utf-8?B?RFZsNzRJd05QR080eDhTa3NmT3BPbXF3cXgxcnI2aHhjeGp2YWlQdVF2bGxR?=
 =?utf-8?B?VDk1azdVdzBJcWZQMWIvSWZ2ZUorZkxnM1AwS3lTZGJyUDlEZWppRm5LcC9F?=
 =?utf-8?B?ZHBGQ3NuWEFQYzg5ZDlNSmNXNHlKaUVBMVFHaEdSTUpXSHRVWUpleG1nRE4r?=
 =?utf-8?B?TGZ6VWhyeG9idXBCTzZ6NkM2eC9QVFhURGpqanVYQ3NOMjlpQlllUmZyNVVY?=
 =?utf-8?B?SnNpVDBBSTBRK1RJSmFlbklkZndwZVhSa1lsUnllbTRCeEYyK1JOUWJFQ0wz?=
 =?utf-8?B?T1F0UzFjS1ZjOGxId0JHcGh1V09LQU9oRno5UjBVRHB6M0lSTmFPdmpxZkZ1?=
 =?utf-8?B?ZmU0MFhDdFkvcDZWMkJta2UvZ0JCd054QTg1Q3RCMXhJSVpBcXhvYUpzaDBz?=
 =?utf-8?B?SUdnR0VIVlpjSkFZZ1J5YjFKN0w2allobUtmU09zVDI0bXhEWFAxRTRjL0lU?=
 =?utf-8?B?aHVjaCtzT1cwWTdWYTlJekNwcmZFUUZkWjBoQWdMOWZEQUg4V3Z4ZGZ0cVBN?=
 =?utf-8?B?cU82QVdBc3J5aCtmQVBlUlgyTEp1WDVQdFZOTGVpRm5wVXdDVmZjMTBlRlhp?=
 =?utf-8?B?T2J0akFBdFZ0MjhLVGJLTW40MXEwVzdZdlM1THdYcUlVWW9HMzRVaVJhUGR4?=
 =?utf-8?B?WS92YyswUlBiWURFOTdlTVJDeDZldDFUYXVPL1FhWFdWWHdmUS9Ub0tTazI5?=
 =?utf-8?B?Q0NTWkdRWjQyMjJzVUU3c2FOVHQxOGc0eVpqc0ZPOGpqeCtaczFTOUxyaCt4?=
 =?utf-8?B?VlhiVGE4RVpsd0x0NUJDTFRmamNGYW0rbnMwS1VheVhPUzduUDBBSnhsOVl0?=
 =?utf-8?B?Z0JaMzdGQlJIVjNqbklTNkZhV1ZWUXBOR25IWUV5WGQ0RG1Sa2hyZlVVM2Ex?=
 =?utf-8?B?YmJtUXBoNmhtdHV3YTEwMmhFMmNHS0ZhbFNJOGMxTzQ4VGpSbXlmZklyTSsv?=
 =?utf-8?B?ZkoyRHlOcGJCVXFYYSt0UXNUbE1KVHJwd21UN0Z5QjZYdkhiaVQwZWtYUHJC?=
 =?utf-8?B?T2FzNzU4QzZ1Ni9RcU13ay8rWHpIeGtqYlRyU3hRMkZ0UGdpYzNXbm8xdU1L?=
 =?utf-8?B?VHJ3RnVNOHZFNzRkWjdKZk9tV3k0VnlsVmNOOG5HSTBJMGZLM1lER2tuclJF?=
 =?utf-8?B?NlFDdExjYmR4UWd4NEE3UkNLYlNyZ3hjZFN0Yjh6cS9uVk52b2k0VFNtTlVX?=
 =?utf-8?B?TFZnUi9OU01BTjJXMThYOEZHRVU2azlsNElsRjMwTWdjMWdoemJ0S0dRMGZm?=
 =?utf-8?B?cnRwOHpGV3hoaGpndkRTbzJrMEJtemxlTFMwRWJublF3c3pxUlVsR3dFbEhh?=
 =?utf-8?B?TDNENE9LRW16RnJ6d0d1MVVJc1dlbjhKSXJtaDdWRFR1K0lEeEVkd2p3R0sv?=
 =?utf-8?Q?zzhyq/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3YweDY1cEZ0MndBcWhCNVpjNkZPSzNvdkUzRy95YU42cGZwYTdiMjNVc0Er?=
 =?utf-8?B?cTJJeWNUbnBYUFZ5Rkd5a1VDaURaZDZzL3VkQk9TN3c2WE1QRHRjV1FkbWVz?=
 =?utf-8?B?ZUU4aytVTjNNSTNaaWRlMUtzbTFXUHFZOGtzZDd5dVk4c0tJM08za1JoYVgy?=
 =?utf-8?B?eG5EZWZ4ME9WbXBRUHZ2WWphWUpuQmFmbEZNVExTdUJXQjRRL3JvbVNqUysz?=
 =?utf-8?B?NWtJM1JPeUJMb3c3TTJ6ZkdjdHJrYS93TGFwODBtOGNMcTVtQWpZUWYvTWsx?=
 =?utf-8?B?R0FOSFdWMU90dWN1NU1aZVNWSVZpZk5JWTNPR1hHQWNiczdhWktWclc3Q2tS?=
 =?utf-8?B?RGI4Q3ZqQkFCMGRqYllDRXYvVGpZbjVkY2RHT2NZbmRTSGI1OGxYY2RNMUZK?=
 =?utf-8?B?MndCT1lxZHowMUxpdTJ4NUg3VTliSVl4bVdrakV4SWl2T2JKRTZsb243VUd0?=
 =?utf-8?B?U3RNOHBVazRGbUtPclhyOFFKdCtnamFQUlZGcGtqWGRCWkV4dEhJVXdnMlhl?=
 =?utf-8?B?b09YZjBjZ3pGeE1oV25iNGVBb1R5THZjYklPcHZvNThKSFBCbU5oc095RVlq?=
 =?utf-8?B?WnJOazQvZkRHK0dYZkl3Rm1ENTQvS0Qxb2tISjJEWE1FR3hodFNDQS9oeG5Y?=
 =?utf-8?B?VUYxbVM4TjhXTFVaTkN0NXM3K1BDL0toRlVjWWpWbSs1SkE2WGl6S1lMbTFj?=
 =?utf-8?B?Z2ZRL3lzZ2VpMjlwaVFLSHNML3p0UTllbmttSndaQkxZK1dUcDhuTTd1TjQ1?=
 =?utf-8?B?RDJGS2dxZmF2SW5mMU0vbTY3SEpFekkveU8vaTZHa2xDRW5vNUlNa0JkMkd1?=
 =?utf-8?B?MEFmcXpsQkgxTHh1L3VTZ29ZMmhqZHl6RTZUQncrbHBZUkpkNlhjcmU4MU9Y?=
 =?utf-8?B?Tmx5OXpEcisrLzRQdEY1M053SWZuWTZnUk5DSEh2N2gzejdWbitmejlRbVRu?=
 =?utf-8?B?R0dKSU1QU0dFRE93K3FRM0tRYkZjOWlMbkdVc25kMlk2TWR5czR2OGlweGYv?=
 =?utf-8?B?aU9vaURPc09vMmQ4M0pJMTMrZUtKVythZDhHcHFzSlJDVkpKbzl5SlYyWkJI?=
 =?utf-8?B?dTVWeU9mOGNMalUrKzg0b1RMTno3aTkvc0xYQlZvZnVEL0tvSUhOL2ZXYTBn?=
 =?utf-8?B?TFhZMU1pbWNmbmhsejYvMkZFUUJiRDJtVjlZR0VhV1Z2OGZVeExWVFhzTDVV?=
 =?utf-8?B?TWxBN1VpZEU4cG5URW0xWmFZanFyTi9ORlZEYU8xczVER05BSWlkTEFMYkQ5?=
 =?utf-8?B?R1FHZE5oSE1CNGZYNktqdXdnanJYSjEwcEh5Zk5TLzBzbG0reWlZcmhZam1N?=
 =?utf-8?B?eWh2RTJLRXM1RU41VXUxT2x3d2VORE9lQ3ZFUGZ6NmR4aWxEc3cxL1d6V1lN?=
 =?utf-8?B?V2QydVN3eTd0Rnh1VUM1dFBIS01zZlZ1ZmRwZFUzbDhOSzN4azVrWmJkdU1J?=
 =?utf-8?B?NGFzMEZyWXVuUGpldTVYRWNMVFVyVENaYWk1cW96aGY5Vk1zUW02TDNvU3VZ?=
 =?utf-8?B?NTFCWS92dGJoWCtqQXE5Wnp1YytjK2ZUazNPTjc1V3QxRUlUMzZCZUpacTJK?=
 =?utf-8?B?Rm9WMzBJYUdnNTcvb2ZhQjAwb25xYlFTNHFJWUNQaTRXelBNcE5EZWc3L0xy?=
 =?utf-8?B?RGcrWHBzNlVaQkJpN2RLTElFbVRDdEMvMkFKZU9RSjUyb1p1OC9PY0J0QVkw?=
 =?utf-8?B?bHZUNmlOMEd3NUloeGozWTZCbUZFejhFSW9xSE9DOXpYV0I1Z093SEVrdW9W?=
 =?utf-8?B?R0pPK2V0QUd4eWxKOHQzQW5MdnFtSXVkMkV0MmZOTVdJQ09uUDJRSnpWVnhi?=
 =?utf-8?B?OHRHSVBET1NKZlhabUFXUVdHUjh0Rm9TbE5GZ0FVOWdVajBlNGVsSndrSHl4?=
 =?utf-8?B?TEZjSlE1YlJJdC9Rb2M2anVieG52QmZYd3ZEdzJ1NkpzTGtDemxrTVR0MVBL?=
 =?utf-8?B?ZGlzUmpKQ0gwVDYyT2grdEcvSEtBK2VxSlRHRDdBN0lseGt6ZWNEN2R4ZDI3?=
 =?utf-8?B?U0tzZkZvWHZNSEpTU1JhcktHblVDc3h2ZmJ2d0s0YkZ0ci8vTFBTT0Q1UlVV?=
 =?utf-8?B?WjM2enIxU3pWYzY2RUFZQ2ZxMEtpUEUveWk4MzYvbHZWSVAvVVVQREM5TVUy?=
 =?utf-8?Q?4zR5GmOrHk4HdaiIeBty267x5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321f41a-246b-483d-1502-08de010a5c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 16:48:34.7849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OuT07yUiGDLxNrjG75uUZCy613zKX8FCUeuCE7FMf6YtIyshX3mQYJCvZDySE7c7hJ9R7MW5FbY1PofwJgWLfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

SGkgTmlybW95IGFuZCBEbWl0cnksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzNdIGRy
bS92aXJ0aW86IEFkZCBzdXBwb3J0IGZvciBzYXZpbmcgYW5kIHJlc3RvcmluZw0KPiB2aXJ0aW9f
Z3B1X29iamVjdHMNCj4gDQo+IE9uIDEwLzEvMjUgMTY6MTMsIE5pcm1veSBEYXMgd3JvdGU6DQo+
IC4uLg0KPiA+PiDCoCBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVyOw0KPiA+PiDCoCBzdHJ1Y3Qg
dmlydGlvX2dwdV9kZXZpY2U7DQo+ID4+IMKgIEBAIC0yNjUsNiArMjcxLDcgQEAgc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlIHsNCj4gPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgd29ya19zdHJ1Y3Qgb2Jq
X2ZyZWVfd29yazsNCj4gPj4gwqDCoMKgwqDCoCBzcGlubG9ja190IG9ial9mcmVlX2xvY2s7DQo+
ID4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZCBvYmpfZnJlZV9saXN0Ow0KPiA+PiArwqDC
oMKgIHN0cnVjdCBsaXN0X2hlYWQgb2JqX3Jlc3RvcmU7DQo+ID4NCj4gPiBJIGFtIG5vdCB2ZXJ5
IGZhbWlsaWFyIHdpdGggdGhlIGNvZGUgYnV0IEkgYW0gY3VyaW91cyBkbyB3ZSBub3QgYSBsb2Nr
DQo+ID4gdG8ga2VlcCB0aGUgbGlzdCBzYW1lPw0KPiANCj4gVGhlcmUgc2hvdWxkIGJlIGEgbG9j
ayB0byBwcm90ZWN0IGxpc3QNCg0KW0tpbSwgRG9uZ3dvbl0gT2ssIEkgd2lsbCB0YWtlIGEgbG9v
ayBhbmQgbWFrZSBhIHByb3BlciBjaGFuZ2UgdGhlcmUuDQo+IA0KPiAuLi4NCj4gPj4gwqAgdm9p
ZCB2aXJ0aW9fZ3B1X2NsZWFudXBfb2JqZWN0KHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8p
DQo+ID4+IMKgIHsNCj4gPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZn
ZGV2ID0NCj4gPj4gYm8tPmJhc2UuYmFzZS5kZXYtPmRldl9wcml2YXRlOyBAQCAtODQsNiArMTE2
LDcgQEAgdm9pZA0KPiA+PiB2aXJ0aW9fZ3B1X2NsZWFudXBfb2JqZWN0KHN0cnVjdCB2aXJ0aW9f
Z3B1X29iamVjdCAqYm8pDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZ2VtX29iamVjdF9y
ZWxlYXNlKCZiby0+YmFzZS5iYXNlKTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGJv
KTsNCj4gPj4gwqDCoMKgwqDCoCB9DQo+ID4+ICvCoMKgwqAgdmlydGlvX2dwdV9vYmplY3RfZGVs
X3Jlc3RvcmVfbGlzdCh2Z2RldiwgYm8pOw0KPiA+DQo+ID4gSXMgdGhlcmUgYSBwb3NzaWJpbGl0
eSB0byBoaXR0aW5nIHVzZSBhZnRlciBmcmVlIGhlcmUgP8KgIEkgc2VlDQo+ID4ga2ZyZWUoYm8p
IGJlZm9yZSB0aGlzLg0KPiANCj4gSXQncyBVQUYgYnVnIGhlcmUuIFRoYW5rcyBmb3IgdGhlIHJl
dmlldy4NCg0KW0tpbSwgRG9uZ3dvbl0gU2FtZSBoZXJlLiBJIHdpbGwgdGFrZSBjYXJlIG9mIGl0
LiBUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRz
LA0KPiBEbWl0cnkNCg==
