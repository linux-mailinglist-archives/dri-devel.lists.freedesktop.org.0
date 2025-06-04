Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704EEACD780
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 07:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF1E10E6D3;
	Wed,  4 Jun 2025 05:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1AZtIb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1767F10E5CB;
 Wed,  4 Jun 2025 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749015431; x=1780551431;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AAQWa2bvTrHLEEPXTzxMdth5B0JYff/qtw7yiyXCN0I=;
 b=h1AZtIb6+XFZhZAiqExGdcgXCDye2zhrxlM5BFdtzK4lyjUsUja/KnFH
 bftq38uP2Y7byQV9BwXlc/f3IvcgVtWrJOIqNi6XJBj7QQ+IqPAI8yTO5
 yg9xvAfcJ9/sVTOwiWp2s1pbrJ4kOOkfAw4Mq6GRgLml9OnmqfkXPUvC3
 EsBqTLXO1sB6SzvlZaJfPeLNsieEzZpqEerE3wYf+lKvG5f/lK67tkZyZ
 GPz8+CrzZEx9j914FXZCkcTwBygLIkbLoeqcbaMDDDNgJg4h1l3mYoppv
 pfzkwFn5LGIgtxdlgFBqqQzciNFsbORaEl0w0erkJMQOwkZPoRRYcgHLj w==;
X-CSE-ConnectionGUID: pvy/nIEJSeGEyhZeC+XrPA==
X-CSE-MsgGUID: IFoQLMcfTPSZn6kSw1lEQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50773533"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50773533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:37:02 -0700
X-CSE-ConnectionGUID: 3HNPd7GmQv2XnW4XEmAUxw==
X-CSE-MsgGUID: XXhNeBJKRRuR6hy5gac8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145044267"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:37:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 22:37:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 22:37:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 22:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9YE6M1PZO4OYNVOZTI1d/giNO8J2DJFWz6RW3pfmkMZl+rZOt3Q09aTyEJGxY9SeWAcC6m/4K+yAAOTDaZ9C1B+KWKgwrbagaMXQs+LjVCyqPophr0MqL70TqvUvQvSaxqNm1ei3nlgzcHhy22jNbOwfK+cOr/sJrGdsbiF/xTI6nNXIWW59OYoZSCHCo9ECiIy9hMvyIOrWpGbf/EIMpUJX+CPgNLYYgIXtygMe9XGjsUBPdRDfZ3BI//jQ0DUFGrD1vKeKW0qHkD+e3fqjena1r9Cy23UWgGLj2Rw50xIVOAfkuWVVPBrWa9MA7q+htUQLqmBp96Bx6qcCRnXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtr+RGCZIzkpnCKvgZv0dgnBwTdE5B1Yzlzgj5xtFu4=;
 b=F5ZbFYZAZ91qOvUFRcFKKUTguN9wMtPQ/akUxht70UaxSazQ8YnWBk6vBvj0zd2rQ4S6HY7zrciyFRltbfSWIAiaVHL13qOSoaHQJ5Mvb7NgP2tbvY7FqSIOiONR3036gdtWD42vsHoG76Ci+nU4yr9tgE1VtQpAcc6cqYAtmVHLeR6mMYZK2rxr9qHXwyoq9GF2KmaCgaHC2URMjmlH3d85nA3LzXi11OJ9wePIgCwVZLgMMSAQelsQwTc1FVA/xXA4yPeZOsqAQlhz8WM7pGUpYaPTIvxvw5U92/BbuINSFNUpFbusdV+0OwL2MWhhPWhrlqczB4MtFHoLjQOkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Wed, 4 Jun
 2025 05:36:53 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 05:36:53 +0000
Message-ID: <3d339343-39b0-482a-88c8-11097ddbccdf@intel.com>
Date: Wed, 4 Jun 2025 11:06:46 +0530
User-Agent: Mozilla Thunderbird
From: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [RFC 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-6-badal.nilawar@intel.com>
 <6e381497-cc19-4aa5-a6d0-cc4deccfbcdc@intel.com>
Content-Language: en-US
In-Reply-To: <6e381497-cc19-4aa5-a6d0-cc4deccfbcdc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 53178587-967e-4788-af55-08dda329cfdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE55QVY4NU9PaVZrdDFBeU1uZ0FicUxvaHQvc2dsVEZzUm9NdUF0SjgwTG4r?=
 =?utf-8?B?WVZMOGVDNXFNc01hV3doYjI0WUcybzc0b01SZkhqZjNmNEVnL2NSdHpWKytz?=
 =?utf-8?B?aVhhQzJESnBpWERRTkhhVFVpQzdWS1FweVdKUC82eXFKM1BQK3BmaFpUYVRJ?=
 =?utf-8?B?b1pDb25XMVByMkRtMTJXNFF1V3ZucG8yaU9FWEgzTExMTDNNVXBkc21XNFpZ?=
 =?utf-8?B?dHB6RjFGWjV4V3A3VFJCVkVad2JmQUVDNUIrd1VjaHdUU0s5WU1wU1Ira1Np?=
 =?utf-8?B?cVpZd3k2d0c5WnkwUndMYTNRU2R1eTZwQWNRckgxeGhCVGJrUEh3ejd2elhD?=
 =?utf-8?B?cGRFWWRDNzl3cWlmc3hhSHRzdlYvZDRPT2ZSbkgyd3NiUkNVY2lxMFJNWDdp?=
 =?utf-8?B?VmNHeHc2b1V0b3VPWkc3ckhPbkI0WHBnRjRRY0MvZXE5dE9KS2F3Z09seFBJ?=
 =?utf-8?B?WE5IRk5YaWw1cEVYbzBYQ3Nybmk0QmllT01qdGc5NjZWRjJMcWQrNVg5L3Ey?=
 =?utf-8?B?SEFIa2lsNjM3TGhGeDRSdGN3aUNzbEYwYXZQQzVPbTF3UGllK01OVFFuTStJ?=
 =?utf-8?B?SVlueVBPR0Y4bGp4WHVMWENNSFZwb2tMQmRqV08rYkNTa1Z1OEtHK0lIbFFt?=
 =?utf-8?B?Q2hJbElnVDZISU1GRDV6cXR1REUzZ0pEd0I1SVJwOU5pbTROSVBsdi9RS2R2?=
 =?utf-8?B?MGtiUm12MFdSbHpRMzNYYXA3ak83RitYNEdEN0pTSFh6VXlpS0VseFBUU3J2?=
 =?utf-8?B?RG43SUlWckx6VWJ3Vm4zQW4yL0o4L3BNVmd5bHcxMUFDYk5VRjBSVmIrTnNC?=
 =?utf-8?B?VGJHSVVoTnZqeXhPYUhKdEtwWTV6bHZlM1BkUEM5YjVoQ2ZzQ3RpY0lJa0VD?=
 =?utf-8?B?TzJRZmpIQ0Q4ZHdMTWZIMkZCZnhOZnZRWlViUkZrOTBPMzRJUGJjcUFaYkhB?=
 =?utf-8?B?aWdFbWpqZ005ZzhDU2pSOVgxTGtNNVdqU09IRUx0bHFuVEphNVFtQS94Q3d4?=
 =?utf-8?B?ekowbXFxVTZwYytEMGwwTzdPaGMzZGI4Y0JlQklQNCtPamgzMU56ZEN0cXhh?=
 =?utf-8?B?djRXempBR0lUVGFnUVhKaU03aW95VDd2LzNrTThrS0VEWHQ1em15L3hNcTRQ?=
 =?utf-8?B?cjZ5WlB2Q21zY2g5MXdNeVQvWFhJa3N3aU1HazJDUG1YdTlSNkJwRWxpamE0?=
 =?utf-8?B?TWtmcTRnSHdhREpsOUY1MnR2R1F5MzVIdHJpNlRsc2E5UGNMSVZEdkNzeGdu?=
 =?utf-8?B?aGZCYUY3VmQwL3lLSTRSVEowZGdTdW11cWVyaXRIc1FKOHJUeXJDa3lYMkEr?=
 =?utf-8?B?Rm5BanpXWXZNemVHUCsvcXNLZ2g4QjZET3BtMy9TRDJ2RTBpQVRpUXJhZ2xV?=
 =?utf-8?B?WUpqTWRCc3JCcmVodkt0TEdya0tiRFZxa0dnWEY1dFFLRERMRStMZ0dsSVZp?=
 =?utf-8?B?MmkyM3NMQ2FadHR2RnBCU1Z2ZzlPNHpZNG1QOFlkdnk1NkNwdEtUcjZINFdw?=
 =?utf-8?B?TXdENGRjL3lVR3hQWno5RHZBeFY2cmoxRmpzN1FaVVVHWXJxTXdrMFNzQTdi?=
 =?utf-8?B?ZUJQMDhhREVDTUd0Qi9oUG4wbS9QL3d6UytTYy8yQWhlODc2cVczVnYxajVq?=
 =?utf-8?B?OXErVUlPblI3bWpyQkdvU3RZRUV6NmovUjI3QUtGTFk1RkZDUjF3VTNCT1M2?=
 =?utf-8?B?eGlwbWlaeVZBR3pkcUFieWRpR1lsTTFZNlc4bGg0ditoOVhxVGFFOVZITjRy?=
 =?utf-8?B?S2dzRzhSaVZpUjJleHhZYjZiQnhLcjhLM1hlT3BQTU56b2ZvZjVuRGNiOU1a?=
 =?utf-8?B?ZFFKZ1NVbCtaODZXc0g1ZlFMbHZsUExqUXkwVXF0dUpodVF2SzNIeVZvWThv?=
 =?utf-8?B?ck9sTUI0d05yOVFoWWVRUG9pU0hyRDVHQXR2cjE4Y2NaSS94dXJ6ZC9RNTlx?=
 =?utf-8?Q?IIN2lRJfYhg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZ6Y1QwTVMrMC9pTVBkR3B4ZU1mVEliZGsvL3grM2E5ZUtoV2tEZVZYUElN?=
 =?utf-8?B?bndKTUF2UnlzeXZOOG1LaGt1Q1hDZGxJcEUxMHM3NmJOWGkvWVR5MDdGbll3?=
 =?utf-8?B?QmNxT2o0MXFjSlE0bU9FaWxvbTJTRnNTdmRWZkQwZDk2TVIwR1VzR3VCQTlG?=
 =?utf-8?B?QTFGczhmWGc3aSs4TUE5TE1MeGlkbm9uUFg1QnZyWDBmTWZNcG80NmVsNGEr?=
 =?utf-8?B?c0lPek5VS1hCTHVyUnpWNCtiMWZMcEhORENLQnR3amdoTXVNb1M2VnRhY2kw?=
 =?utf-8?B?bFMyV056NS9LcUZXWTQ1K0hZMk4rYVkvNlF0KzJreUdLMThTRGhuZ3M4QmRF?=
 =?utf-8?B?aWxkU1FEOWMrbnk5RDNBRTRQcE9ZYmMyUlNlOW5IeUNGakFReVRPeDIvaVVU?=
 =?utf-8?B?cklIOG9DU2RjK3Vxa1NpQmV5MHJoSE12UXdoYjhMbWYvODBTL3hNb3A4NGtB?=
 =?utf-8?B?ZTNxTmZBNmxLWXNsMVFybTlNOVdVNjR4MGtocWlyaTZqVXYzc3k3TTJ2UjJF?=
 =?utf-8?B?ejd5cTVUU1NTTDR1Y3RJWFhKeUpQdnhVZlFEOHNOS3AvZ1NOMGlROVBlM2ZM?=
 =?utf-8?B?cDhzVjAyUTVrZFRmWVVyRWdWYlFJL2grUDE1Vk52bnlWRWozTUNtaVFFR2k1?=
 =?utf-8?B?OXA5Q2R1ZkovQlJmdlh6TUJ2MFlEd1N5MGZPOEVnc1ppcGVheTRpRkNFUWhm?=
 =?utf-8?B?eWFCYTZqeDUydEo4a0NVdUs0b2RPaHM5VHk4UFpscURCMlZGUG5oRU5mOGhv?=
 =?utf-8?B?NjBGMVJNZnJhckYwVlRGNVl5NHE4akRFMGw3aTRDTWxZY3loTTUzSHprd2FT?=
 =?utf-8?B?bUNzYmVtZHdyV2dOdVZoYkkzZHhlQ0VkbC9GMFJ2aFZwcnRvWVUzUXpQcko3?=
 =?utf-8?B?SVZ3TmRFMjlFRlN5bVNmQ2tyRnpZYUQ1U29yaGpZeTlUb2hwQnRPZ0lBWWs1?=
 =?utf-8?B?M2RaTXBXWUdnR2RCME16S29vZElQSFJqRUxjT2R6d1dsd3JMVEhjY0I2YWw4?=
 =?utf-8?B?bEZCczZ1YUJzVWl4bjhpanI2K1NBRC92ODZkbUptMDQyTkJMOWtodmVrbW9P?=
 =?utf-8?B?SzJ6UmEyb29ZMHFDOUFSVURFWWxvM0cvQmQxbjdGUjkvQXJoM1BCd1Z4SnNL?=
 =?utf-8?B?Z1ZvMFdsbmFwVDNVaUFkZnBSM2hSY0ZZRjdOSkJwaVdWbjZ4bWk2bkVublNl?=
 =?utf-8?B?T0xoTWE1MFgrUlhhTVlpKy9QRk5UM3VvNjYrQnVWM1QvbHhZVmRmcHVGSjVO?=
 =?utf-8?B?Nm9hdlFYdHk5dEoxK0pRRTdxMm1kV3FaME9YOVgxYVhoNFpGWVVZZHh0Q3Rp?=
 =?utf-8?B?U1M1WDFLSFlDd0FMb3VrS0VIaEFmUWlGdFFQQ3puQVB4QW10bWtVLzZoWEZU?=
 =?utf-8?B?QWtPSVlvU0VpaktXcm80Vyt1YVpQTmhiVW5zQjlPQlZYV1RsL3ZoZGlSaGZY?=
 =?utf-8?B?RG0xZzBSMWJ3eWM3aFcvb0ZEejB5ZjlvZ0k5ZU5QamNmNFdYV0ZQeG1RY3ox?=
 =?utf-8?B?eGRKN1dRWUp3cWMybk0zbHBaOTRqYTBXN1N4U3R3d3gybTNQN1BWT0JSYTNh?=
 =?utf-8?B?UjkyUStyUlM0a3JMV1ZqMU1CUjVxUzFyQmtJdyt6bERTQ2hXZ3BEcFlnUW1z?=
 =?utf-8?B?ZWFkRTZ4MllZRVlYakdpMnE1ek5yU3pyRUVsNEpIMFo5QVdRVlFkMWVtSUNh?=
 =?utf-8?B?T1dpb3M0MnJRdVdwNFBQY2pLV05CMmZ6NERsdjh2RnFIdFlxU0lkaWlIdEJa?=
 =?utf-8?B?cnJtNGJ6M1VuTy8xanVxdkVNMEkxNkxMTjJvSjl3d3BKdG5jQ0lRNGR1KzVj?=
 =?utf-8?B?T3JKbU5CNndEQVRrcFQ2Rmp0NXZGUksrdGVsZHFOMHBzZGVJVm5VbGFIdTY5?=
 =?utf-8?B?cnlBNVBJNVU5VE9DYmQ3bW5MdzcrVDEzWjZyRnpNS0d6WlJrQlN1NG44Y1Qv?=
 =?utf-8?B?QVZHbjY5ZExENFdzYURIaFBOb3U3S0RjR2FmS0R0MW9EWEdnNytJeUpCbDlv?=
 =?utf-8?B?bVY1Ry9SN3JSYytadE9kZEU1TWRXOE5sRHdEUXNQWTI1WklML3Y4VmtRdzds?=
 =?utf-8?B?TDcrVTdHWGFpWStvakRQMDgyTEhWVHI4Z29YVjBiOHc4VnVGaTYrcjgxaVlj?=
 =?utf-8?Q?w3/YviTUBlT4AD8DUEkk3PByC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53178587-967e-4788-af55-08dda329cfdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 05:36:53.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRr4n1hB57WE/LLYioWbl+45Omarn3LIaJVDShB16E/LqKMh/jl8IZf1zvS/GBHmWfi3CmfIf/pr8RqpjXwBqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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


On 08-05-2025 05:14, Daniele Ceraolo Spurio wrote:
>
>
> On 4/29/2025 9:09 AM, Badal Nilawar wrote:
>> Load late binding firmware
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       |  2 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 91 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h |  1 +
>>   3 files changed, 92 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index d83864e7189c..30a416323b37 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -894,6 +894,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_late_bind_fw_init(&xe->late_bind);
>>   +    xe_late_bind_fw_load(&xe->late_bind);
>> +
>
> Why does this need to be a separated call from xe_late_bind_fw_init?
In subsequent patches xe_late_bind_fw_load called during S2idle/S3/rpm 
resume.
>
>>       err = xe_oa_init(xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 297238fd3d16..7d2bc959027d 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -16,6 +16,16 @@
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it 
>> could take
>> + * a bit. Using a very big timeout just to cover the worst case 
>> scenario
>> + */
>> +#define LB_INIT_TIMEOUT_MS 20000
>> +
>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>>     static const char * const fw_id_to_name[] = {
>>           [FAN_CONTROL_ID] = "fan_control",
>> @@ -45,6 +55,78 @@ static int late_bind_fw_num_fans(struct 
>> xe_late_bind *late_bind)
>>           return 0;
>>   }
>>   +static void late_bind_work(struct work_struct *work)
>> +{
>> +    struct xe_late_bind_fw *lbfw = container_of(work, struct 
>> xe_late_bind_fw, work);
>> +    struct xe_late_bind *late_bind = container_of(lbfw, struct 
>> xe_late_bind,
>> +                              late_bind_fw[lbfw->id]);
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>> +    int ret;
>> +    int slept;
>> +
>> +    if (!late_bind->component_added)
>> +        return;
>> +
>> +    if (!lbfw->valid)
>> +        return;
>> +
>> +    /* we can queue this before the component is bound */
>> +    for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>> +        if (late_bind->component)
>> +            break;
>> +        msleep(100);
>> +    }
>> +
>> +    xe_pm_runtime_get(xe);
>> +    mutex_lock(&late_bind->mutex);
>
> You're locking the mutex here but you're not checking that any of the 
> protected data is valid (late_bind->component can be NULL when we exit 
> from the above for loop, or it might have changed from valid to NULL 
> in between).
>
>> +    drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
>> +
>> +    do {
>> +        ret = 
>> late_bind->component->ops->push_config(late_bind->component->mei_dev,
>> +                                 lbfw->type, lbfw->flags,
>> +                                 lbfw->payload, lbfw->payload_size);
>> +        if (!ret)
>> +            break;
>> +        msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>> +    } while (--retry && ret == -EAGAIN);
>
> In which scenario can this call return -EAGAIN ? As far as I can see 
> the mei driver only returns that on a non-blocking call, which is not 
> what we're doing here. Am I missing a path somewhere?
Discussed offline with Sasha, we should be using -EBUSY here as 
mei_cldev_enable() can return -EBUSY.
>
>> +
>> +    if (ret)
>> +        drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
>> +            fw_id_to_name[lbfw->id], ret);
>> +    else
>> +        drm_dbg(&xe->drm, "Load %s firmware successful\n",
>> +            fw_id_to_name[lbfw->id]);
>> +
>> +    mutex_unlock(&late_bind->mutex);
>> +    xe_pm_runtime_put(xe);
>> +}
>> +
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_late_bind_fw *lbfw;
>> +    int id;
>> +
>> +    if (!late_bind->component_added)
>> +        return -EINVAL;
>> +
>> +    for (id = 0; id < MAX_ID; id++) {
>> +        lbfw = &late_bind->late_bind_fw[id];
>> +        if (lbfw->valid) {
>> +            drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
>> +                fw_id_to_name[lbfw->id]);
>> +            queue_work(late_bind->wq, &lbfw->work);
>
> Do we need to flush this work before suspend to make sure it has 
> completed before the HW goes into D3Hot? Similarly, do we need to 
> flush it on driver unload to make sure it's done before we de-allocate 
> stuff?
Sure, I will flush this before unbind.
>
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>> +/**
>> + * late_bind_fw_init() - initialize late bind firmware
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>>   static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -93,6 +175,7 @@ static int late_bind_fw_init(struct xe_late_bind 
>> *late_bind, u32 id)
>>         memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>       release_firmware(fw);
>> +    INIT_WORK(&lb_fw->work, late_bind_work);
>>       lb_fw->valid = true;
>>         return 0;
>> @@ -108,12 +191,17 @@ int xe_late_bind_fw_init(struct xe_late_bind 
>> *late_bind)
>>       int id;
>>       int ret;
>>   +    late_bind->wq = 
>> create_singlethread_workqueue("late-bind-ordered-wq");
>
> Where is this WQ destroyed? Also, I think that using 
> alloc_ordered_workqueue would be preferred.
I missed that, will fix it.
>
> Daniele
>
>> +    if (!late_bind->wq)
>> +        return -ENOMEM;
>> +
>>       for (id = 0; id < MAX_ID; id++) {
>>           ret = late_bind_fw_init(late_bind, id);
>>           if (ret)
>>               return ret;
>>       }
>> -    return ret;
>> +
>> +    return 0;
>>   }
>>     static int xe_late_bind_component_bind(struct device *xe_kdev,
>> @@ -179,7 +267,6 @@ int xe_late_bind_init(struct xe_late_bind 
>> *late_bind)
>>       }
>>         late_bind->component_added = true;
>> -    /* the component must be removed before unload, so can't use 
>> drmm for cleanup */
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index e88c637b15a6..edd0e4c0650e 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -13,5 +13,6 @@ struct xe_late_bind;
>>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>>   void xe_late_bind_remove(struct xe_late_bind *late_bind);
>>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>     #endif
>
