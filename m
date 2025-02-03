Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FCA26813
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 00:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CBB10E04A;
	Mon,  3 Feb 2025 23:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9rOsv8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86D110E04A;
 Mon,  3 Feb 2025 23:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738626678; x=1770162678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XGhoOY+0RyxhRTJkVeO7DIKQe7nfWGh3OhNFcEdSzf4=;
 b=j9rOsv8NhHWUpoRujw7wr+4BwvGNIrDZBqzQhb3EPaaU8jKvMs/UwLHm
 B4CTRoM1+ttH/Htf4zLN/qtzaVw/nXz0IemBEW8MU6zJ74mnIM+mTa7+/
 RtfZimUX5i1Ofv/rwmPI/3mWZG0V1KJwTixZKpFBGqdSiVGLlmnCTfl32
 YrOt42Akcc/VaK8R1/FjT4RYfQlP73qd9IufLcZlGhqS/u+4AQ5obVyhL
 pCwmkZ1I0HRd5UvdKUH5lK3EFQgJ8EZN8Ehhq7gpAqG3j4mvIeJ7KoXlI
 x9CYDNQbGOfGOS5NpA52yBfTVgQGebfyPLlR1ft9QUPIC93pM1mCQB31i A==;
X-CSE-ConnectionGUID: rLqNi9mrT7KvqE9BLgVK4g==
X-CSE-MsgGUID: P6sQD39JS9uCYlWwLwHIdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39018183"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="39018183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:50:23 -0800
X-CSE-ConnectionGUID: muTgDMRPQ6OnXhmm4ipI1g==
X-CSE-MsgGUID: fH9j3rR6S32MAaJRApSFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115592221"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 15:50:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 15:50:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 15:50:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 15:50:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFP0cxLOOjqGIM+cVwzB0N1qFHrFyFo1XFxSXercW940Oa6M7RcYGO+lcJNmSpxS+lV0axlXgyPZbAHn6gP1Zx6CXV7ES9a5TOp1xQEbg3RZM/Fj/KtTAvtD1bKze1DDttZ6NExwP0+Hm+fmFDdopBOPxl1OQ6Jy2iUkPi1nmgMjAUthwxYYPjeXyCKZOuJaL8QNvoOVLOgjey1d464TtvLRubucgrnD8Al7M9tGKh+cdXXDBcIW73Kipb98aMRhQvlxj5S8iZVGfz8kFiNkWuK5YA5q7yMIzAwKl2XDcYqxiXcKsawIP/9thnB4aQaU1cs8RBrGXQcFOPdDXbmK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AdykeCC68vqySqVorIOPy9kZIt0iFmMZt7fj8TuQXg=;
 b=GJNZx/TN4t3Z+aXn/z+KTR/SHkMTO+6brD2JXJ0KDfV+iItfe+vS9jPG5vzEwgJGDLa/xCvZikXys6vRlju4R6dH4l3v2aL3BkjkUDITMPKneUUiMZ7+77vTVzWG8T1s4Zd5T3VjZoHRZyeelVXU+IzkqYOKq9yLcObKEOUHgZEOuFvxBQoEIbnczdzcLdI1bH2Q5tLv6O7JWhFEd5OplYX0cVVpEAzmD8+z++pTryVe5a62MQYAN3q+tcNAz0Ci6w2X48/VvzI1FJ4rnW8qZMrw16/GfoCKXHHzHEdXqIrrKjw27nsQnPKOwnBRBuxNtY+B8lSd+GdHdWZs+iHcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 23:50:19 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 23:50:19 +0000
Message-ID: <0613d63c-d236-45e6-a610-97b6a36eee75@intel.com>
Date: Mon, 3 Feb 2025 18:50:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
 <Z5ekXVihQSDjxqQK@ashyti-mobl2.lan>
 <41833264-348a-443e-ba89-f559cc9114cb@intel.com>
 <Z6DEtCX-XzJE8cwm@ashyti-mobl2.lan>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <Z6DEtCX-XzJE8cwm@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:303:8f::15) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d83bf28-d841-4ae3-1cae-08dd44ad8425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTF5WjNaQW90S1ZiUnNzVG13cUpvOGNMMDd1VTJES3pNYUxMd2F5c1JnS2Fr?=
 =?utf-8?B?YzVWZ2NjOHUwV1lEd3hYenhXVVhiQXZnR01ySThGcUhFQ1NyMVhIOXhZTHA2?=
 =?utf-8?B?ZUFrcDhtZ25RQU4wTFFjdWtXWWFNd0h4am5qT0k5UWR4blJSb3FSdkRmU1dV?=
 =?utf-8?B?U3pSUC9RWHlSUGhMNk9IS1JIVlNzVDZyRmZwaWhoMW5NQ2l2YVE2Q2NEZWZ2?=
 =?utf-8?B?U1pBZlhtN1Q2T1h2cDkwZEtjRDJKSlVPdE5FOHhYNWR2ZEtYMWJoS2ZKSEVQ?=
 =?utf-8?B?OHMvWXhUaFFvZFlJYnlwdzZmVSthU3NyaTVQakMrM1cyb0F5c01FTzY1WDhG?=
 =?utf-8?B?SU1wUkxISnR2aE14QjNwOFNJYldWRWt4bUd5UHpqSXZ1RWI4ZGR6VlZnekZK?=
 =?utf-8?B?ZjVic25XNDc0eisxOXFvMHBVTTdKNDhzcFQ2VUxMS2NGeW4wZkc3cUNvOW1x?=
 =?utf-8?B?RFRxbXpKdkxxRzlsMXdEaXlIeEdXTlRML3U0Z2M0NEpOSHR3cm14K0txUklV?=
 =?utf-8?B?SGRnb2ZZcUdIc0VpQStNd0hEeW1nRFVOdzJCOUFDbkNDTklmdXZiSmpYS1hp?=
 =?utf-8?B?akZ4M2Z6OEd4azl3dWtBUllIdTNUKyt4bGdTZHJqV21FMzdzR0hnbnVibk9H?=
 =?utf-8?B?UWlIa0ZBYWlwcGdvS1dqaWE2UmduRndOODZXRGZWSSt2TlpQcXZnMnJzMFlV?=
 =?utf-8?B?emRtaFFUK0llanhkbEM2ZWZ4N0d6NXN5RHNGLzA3MTZ3NmtsenpFbzM5M0dC?=
 =?utf-8?B?dm1oZmhZbWJYQWx2bDhEcTBmdDdJc0NVUjBndDFXWmZ6WHdMc0VZWU1UR29Q?=
 =?utf-8?B?OUY2Ymp1Y1RNb3A5Si9Zb0trLzFRaFc0dkRZRXBNUkdiYlBzNVNBNG1SNjRu?=
 =?utf-8?B?WmxoNkFuS3JWMWtIZC9kbGw5dTJ0SmwwdnlxZEFpNytKZElzWnFZYVRpb2dO?=
 =?utf-8?B?VzBsQ0ZOVzM1VlRmUmMydjU5aTgwbFZ4NGZHbElNSU9qK3hLRHk5cWxFcXE1?=
 =?utf-8?B?aFF2NzVUd1YrZkt5OHIzVTlVWSttZ3FoQUgrSnhBVHQyRU1ZYktEaTNtVFFV?=
 =?utf-8?B?NHpqWWU4anRjRXpiYTV0Smg2dmNGaE15U2NIelBQNWFkbURkeEh5bWg4SVF0?=
 =?utf-8?B?a2p2K2puS0JUdkx0eG5lYUhQNTZzTnRRODdCeDk1NVJCb3FUaXpSdkNCOE5Y?=
 =?utf-8?B?N1UzbHcxUUF6bGNxbjBrL25NbzRuYzVFU3h5MUZXaDQxOHdvRXFOMitGZ1Z3?=
 =?utf-8?B?UVc2dzNUK1hTVDM3VnFoRzlmcUl0RzZzVFpBMTlxWCtydFVNSitEcHdvMkEz?=
 =?utf-8?B?OGdWYTYvWmdDWTRvZms2Y3dtYUprZGVnWURxV0RVeVJScnl0RHpxUEorN1Ex?=
 =?utf-8?B?bjBEdVpsU215UEJ2WllSMzdxTGNHWjVrME1HU3NidlZpZFRFdDlaTmc4c2tj?=
 =?utf-8?B?TWtGUWo4SlQvNnpUVDNXUUdtazJBTkVPVXUvZTluRzR1V0xWRzZLU2twdjN5?=
 =?utf-8?B?cUlUR1R5VVJxRHVobVo1dkJ5OEROK1l6WWRxbTAzR1JNeGk5Y1VZZ2Vwa3Ri?=
 =?utf-8?B?QlRvN1o5WDZ0UTVYZXZXNEFVWlB1MVl3alI4cWJESDJHRkw1ZnNIdlkzN1Vu?=
 =?utf-8?B?dUZCcUo0emtJUTdEYjRyT0hMaTJidmppaGc5cEovK2ErbXJ6bW9WeEZxTi9W?=
 =?utf-8?B?aUtLZVBqdG9GWmZPc09pU243Mmp4RnY5Q09VNnFlR210MTI5ejI3U3NVR2RS?=
 =?utf-8?B?aDdGMGdhSTl5ZWx5Q0p0RzFLeE5lZUF5djI2QlF4ZjBWMWI4N2hyai8xdEs4?=
 =?utf-8?B?TmsxVk9XMm5sbmlDZU1tdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUlXL0RCaGJZcTN5ZUxDSlkvUzIrOEFzSUcxWmxWQ1BuQi9tTVQ0UGN6Y0RU?=
 =?utf-8?B?UmJkdWpwY3pUUU10ZGVLSmpqVTlnTVJsd1ZscXI1Vk1FVkhVekFEaXhKWXpn?=
 =?utf-8?B?cldaNC9nM2FNYjZCeEdkSHBHSUtHU1ppUTNjb1F3YVJQQzV5L2N3bmRaUjd1?=
 =?utf-8?B?ZEltdVFrM3A4bW5rdFNUMlpaRTlQaU1qVkErZ295UlJWNVQ0UzlSSnU1cC9I?=
 =?utf-8?B?aEtjcXFCMzNOQkQ5TlRLRTFHMGsxL1I1STgwK3psMDUyZTlCMlRLMlRoQnND?=
 =?utf-8?B?S2M3ZmpQVndkOUVDQVZ1N1RTQVY4eEhZdWl6U2xiUDVUYzdUUnFYWTVza1lx?=
 =?utf-8?B?eURoZTZSaUVBUmJDT2VzMXRLVjJUMzEwNWNQZmdKdzI5QmZiK1dmOTFjMkxD?=
 =?utf-8?B?VHY1b25HUVF1cldVZU1qWi9pNTJOdzdkK0hVN2M4bm5NblEzdkttRXhCdHJl?=
 =?utf-8?B?R00yZ0dZcExqWXYxdEVldERUU1F3RWI0RG5qeis3NWczMlVUTE5Kd3B5Y3dX?=
 =?utf-8?B?dTNIaENocXpBd3kzMWFPNEU5TjJZRUF4YjNJWmgvWUdPS2gweDdKbFBsY3Jt?=
 =?utf-8?B?UDBGNGJGS3N3NXdCbStBdnlFL1dBV1UrQmROSUo5eC9ld0N1YVJnOGttdGRL?=
 =?utf-8?B?Qm41SE5zWUpVdjVMaVBtOTRURDcxUmlVeGZwOHJPWWxBMVF5Z0hnZDhzVWhV?=
 =?utf-8?B?YkdnNE1ZUEZvU3BqSDdIQVk1R0R3c1IwZFMrR3N4NkUvZUhsSHRlS1JkaTNv?=
 =?utf-8?B?SWNYVFlxeE5SNFc1U3NGdExaelVTNkR3QUQ2eHpkM29LVFY4T3B6NHRzR3VP?=
 =?utf-8?B?M1lTNnM0TE50ZkRLZXBFMC9TeGNYMDRZSy9RQndOM1BKL0NQNDd6SHNGY3R3?=
 =?utf-8?B?ZnlJRFZKV3V6cWhtWStDS3N2azN5WTdrR0I4cndjZHF6WXJ5TERqUDB3ZkIy?=
 =?utf-8?B?N04vS2U2cW9yRE51aklMdW9jY0ZwSUx2QjNrY0N5enR6R1M1ZU5wTytCSHVF?=
 =?utf-8?B?dDVtL0dldlJXZ2lIWmVUR1RPMk1JWWt5YUk3UDlNdkFUZk9WbmNacVF1UFF4?=
 =?utf-8?B?cHJaY0pza2lhd2tnK0E1ZjFLVE0xT0JTSFQzWHpOb09WSGRoREZXNnVGdjRn?=
 =?utf-8?B?NkpNRUt4aWJNSUJZeDlBTVgrWnF5dXRXSVlzNWI3OWlDRVhNbVZWWVBONTU0?=
 =?utf-8?B?V2hPcXhQNlNjb25qbG14V3hHT2wyOTZpMFhXNzI1SzVaUitHRlZEOHVaY3Q1?=
 =?utf-8?B?ZXppbWEvRE1rcnFZSktQVWNzTjRNd0tYY1Y5MDVUdUVmeHFNNWFxdnZrbVds?=
 =?utf-8?B?TjlLUm9zc3RFMi9HR0tnd1kweHNFYUV1Z0lLTHlSS3hod3JkcFYyTkJvQVhu?=
 =?utf-8?B?MG4xbzc0clFzZkFtaXFDb2Z2a0pOTHZqVGV0OVN0aEN3VmxFRUZnUEV3YVM0?=
 =?utf-8?B?Y0VKY0hTYlVoOC9Ua1g5SzBSTUZZbDlFNkhJRlIzdzRUbUs4aFdtWVg3QXZH?=
 =?utf-8?B?ZUlnOWJkRXhLUFBFODRKSlJ6WUNKd3I1NW91OGhQTzA3eVkvWlVDU3Y3eGhv?=
 =?utf-8?B?Vzc3TGUva3VuMVlmcmI2UXNxNTNZYjNkVzdxTERlWU14cUxWVHZvNnkyRzZC?=
 =?utf-8?B?MWJqM2MyUkZPMktQM0F1bStMSFFZbi90bkZrNTg3b24wbjk0b0RtNkJhNGFU?=
 =?utf-8?B?Z0lvSjBydzgyL3Uzb3RjRnBEbWVXOEwwTnR3cTg3YmRlVmNzSUptcVhSMS9U?=
 =?utf-8?B?aW9ZeWlHbDVjbU9CZHp3dkJGNHpRVEl1RWJUSWVIT3ZId01lYWR3dEQ1UytL?=
 =?utf-8?B?Z2VmWE1RL1JiQnpvSmI1azZnSmxuRG5Bb0hHaEdSKzRxblFPYmZ4d0hmTjl2?=
 =?utf-8?B?UHFIbm5VL0FOdHNLTTFKTzRyVmRjZ3ZBVlowMlBJZkM1U25ZNG40Rk1PZUQv?=
 =?utf-8?B?UGlzUXZhNEJsbUg5MnRzWHZJRktNaUhXTUdLSWUyaWNFdDRsSVJTUnN4NzFS?=
 =?utf-8?B?KzB3Z2tjUkMrK1JOWnhxcGcycW9pL09seWZObVA2M3NOWmc3Z0xxYlVTSVQ1?=
 =?utf-8?B?d3RKMjc5ZVh3bVlBWWRPaXBsTmVaSkpXdTFaSU40cUtQZFBHMWh3WFM1Nk90?=
 =?utf-8?B?TTdENGtiNUFKdjRkZWZoQ2hsOFhJelVJLzR0UGVRU0M4SmExN0xUbnlPMWsz?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d83bf28-d841-4ae3-1cae-08dd44ad8425
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 23:50:19.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvssrrBoWICYVCWAmMyJgrTcT68COOyUmyNQ+qhzIkZPbX9Hv6BJBA/KM8cKchkVWrTpUw8MgdzOgRMHyOL6YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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



On 2025-02-03 8:29 a.m., Andi Shyti wrote:
> Hi,
> 
> Please, next time, do not remove the mailing and the other folks
> you cc'ed.
> 
> I'm adding back the mailing list and Daniele who has commented
> before.

Thanks, I also found my previous response click on "reply", not the 
"reply all".

> 
> ...
> 
>>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
>>>> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
>>>> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
>>>> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
>>>> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
>>>
>>> There is an issue here, each fixes is introduced in different
>>> kernel versions and they can't be mixed all together as it would
>>> be impossible to backport them to the stable brances.
>>>
>>> E.g.:
>>> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
>>> Cc: <stable@vger.kernel.org> # v5.5+
>>>
>>> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
>>> Cc: <stable@vger.kernel.org> # v5.16+
>>>
>>> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
>>> Cc: <stable@vger.kernel.org> # v5.3+
>>>
>>> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
>>> Cc: <stable@vger.kernel.org> # v4.10+
>>>
>>> Could you please split this patch in the four different patches
>>> that address the four different fixes?
>> Sure, will split it in next rev.
> 
> First of all we need to understand if those Fixes are really
> needed or not. Daniele in his review has pointed out that...
I agree with Daniele, these fixes is not needed.

> 
>>>>
>>>
>>> No blank lines in the tag section, please.
>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>
>>>> ---
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Andi Shyti <andi.shyti@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
>>>>    drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
>>>>    3 files changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> index fa304ea088e4..0fe7a8d7f460 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> @@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>>>>    	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
>>>>    	spin_unlock_irq(gt->irq_lock);
>>>> +	rps_reset_interrupts(rps);
> 
> ... the interrupts here are already disabled (read a couple of
> lines above).
> 
> What is the reproduction rate of the issue? And how have you
> tested it?
I run the issue igt test 
(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454) on ARL 
for more than 3000 loops, but no reproduce at all. This issue seems 
happens few month a time, and auto closed by Jira as no reproduce after 
few weeks.
Due to the issue is hard to reproduce, what I do now is by code analysis.

Regards,
Zhanjun Dong

> 
> Thanks,
> Andi
> 
>>>>    	intel_synchronize_irq(gt->i915);
>>>> -
>>>
>>> Sebastian has already commented in his review, but please don't
>>> remove this blank line.
>>>
>>> Andi
>>>
>>>>    	/*
>>>>    	 * Now that we will not be generating any more work, flush any
>>>>    	 * outstanding tasks. As we are called on the RPS idle path,

