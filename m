Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOhLIk7RqWmYFgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:54:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398721725D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D48C10EC60;
	Thu,  5 Mar 2026 18:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZcrEsgAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8754610EC60;
 Thu,  5 Mar 2026 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772736842; x=1804272842;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M+2zdz7IqJb9/2BQ+eH5I/TFBURovno86ajEFLaTLTE=;
 b=ZcrEsgAKX5bRN2jj8vuIoJ68Gu4c7bQk+WyAwInWM7TOjm+Y4pYjWHmZ
 kpNMutTOSVzRUI4vD9ld+EOHHRuJdDSKaVv8oOpsPOllXC//ccbrOxkKf
 lQdEjkRJaumoLBXXe6uJrJ2/NpR/8WPGayrvP5E55qXJ/4miPJb2+oHE3
 oSM3twkTWBs5rk21yROwkaeOOzq2cRnBDpPScJT71DY7SYIyiSKtpSCT9
 u99CUYF+eRIqiQKd2MnaOUYHdGVAfLn7KIFslDF06XDJLM+HsoJLgK8c8
 2KZlWnLAVyO3bHGxT47vUdk/JhxOixqnmpbPfdeDZZzEHP1/bRDHz3p0q Q==;
X-CSE-ConnectionGUID: UPfkQV6MShispJaehtetdw==
X-CSE-MsgGUID: FZ2a4fmFRc2weQoZmCTsxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85183682"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="85183682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:54:02 -0800
X-CSE-ConnectionGUID: bZW2l85ERtmhO3jVlhyL4w==
X-CSE-MsgGUID: +gYAM0dmQhKFFMv1hx3mXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223729884"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:54:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 10:54:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 10:54:01 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 10:54:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjapzwR4i/eqKUzB9UuiESBOzlrSssYM+OSvGVKuZ/GN2clB0GiIg2drRMBqsXtT8s1RohidFRqWJ8uY4bMA3fiypkc3P5sjvUFiZfDAi1q/qIPJhCI/4ZuGAtIioBtzp4WFU+gBRmKkdK+9PBV0y8D1Y8rrUf5OjXxZLcEpCUGdqZGC7YP7TleY57FMcNkgVtJ8yKsqcBoDcArr+lM5aEH7HXk0gi7JsWbQ3HW6FXzB4HzNgyxqMvoTR9aTMrh5kXYfPZ4rIU55tibLNU8bWICzFU4yPB8fYO+Y1m1tuuHBywiyqXLbqMiLZ50hX+FtCpwk6RSEMTcQ30U92I/IsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuXXiVIEJGhYNivfpDX3BoU75gSEnAZAkhtMVqcIuZM=;
 b=GNhDYN2e7NRqMYDcuqB1aeCPaF2sveovstlr1NEAU43MR2pdL95Txjc6Qxs6l7AzwR6QTcXY9QSv25oty2uIlXrhnrdv+hLBOuCYHgpeh9FsROp09S2kW/w1Yp4ANHP2stRiQPSEyCZAQYrnmoHxqfDpTcs5deJeLMlqyT+J0t/o3ViZJvwkQRBghaShcxdI9w6Yyc0J6VvX4h92SKzeNty19J+gG/V2mpmXD6BfCZliLfnyUsEomBb7wEEKSX+StVn9liO5wQanD3MdpCXaqzjZIT0MAEm4AKAqtYwGRcxwZ6re78QaXEalyd4hubYOF7DLKInHbtwAtreS9pAXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 18:53:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 18:53:58 +0000
Date: Thu, 5 Mar 2026 13:53:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Krzysztof
 Karas" <krzysztof.karas@intel.com>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
Message-ID: <aanRQseClNRRDZxq@intel.com>
References: <20251104100032.61525-1-marco.crivellari@suse.com>
 <CAAofZF4bvBoecKaJv_sEEK54htXBv_dc23tJRrwhXrGb3O_D7A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF4bvBoecKaJv_sEEK54htXBv_dc23tJRrwhXrGb3O_D7A@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 417aa50f-848f-4f60-21ea-08de7ae88f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: c6yt9VZlr5DLjUDPK370YX1SRmfRMe+4UTOjc8Ke345qDGKOeTzCbckNGaQxXCSdStqrtslM8FPeD+JmqPtwsgRde5+pp+BW4n54mKkWuMgW7NZzSmz21bLpSBmWPgRJKFDBsMh8Hq+6VEVVIc1MkcGz9LfsamGOkkQZIE0SzisSbSqQMIpjsWKQ8Qw/Nr1mIjx1VU42gmbS5P5LjE7Dot/5JZOV9sXAzCYHWFLTSSVy+zRwavk81xJIoVnmNUKrfx2Txn+MaNZiRDd37ZMg+sriqaNbUaffHzk6PCxdGg8SJMbqGaDF18onNPvWVY+BrlOuvdr/49HHlklVVH1Av1X+y1ogwJWojL02cBa1aXEyLswMq5EByy6tjN4Dp6/gXLBnksXA0LXvNSOGmsibexpxhndk0dQ2sSf62eE+lvkgPjj2XsRnDfDGXKsw9q/RCLBmi8SQfSuNihVFm+ThZGDOg1vf6OId44VA6xG1FHFre1vnUGI60hQzlmXCfjGElQTNOqEix/m9bQm+wANEAWhV9QYFgGSe0CcpSaimMh/1Zu79DjlhRdzXk5UBTjJFnyE1/KyqL8nWmbCpdMcxIv+n7LLmz1YkpF0thSgBwKYamWDgJZOXgo2lXQehsaJQvqFyde5ZqR2it3Vvn+wLKp6CqC0aWkoMawnE+ZM6iYTPBu92CaRoKkOXMwOTQkfAIPp/NbRZOZFi0xSonMiVm7Vb8HobpNfsTjhU687oxfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01ycC9tSTdHc3QrbnVNa2grWitSV2hZZC94aW1qaGs1YVFJYXdoTzQzblpu?=
 =?utf-8?B?clFuVFpxNUd5MXJmbEQ3eTNFV2J4b1ZRTFA0VTFjaWd1TWR0cVVwTVFKRDQ5?=
 =?utf-8?B?Y0Exb1p5cmNtQnJSdC9qZFU1czhUN1ZiYys3MS9lcGFmL0hBQmhRNVhVQnJy?=
 =?utf-8?B?cVpyRHd0WE1jYURFdEtBWTNRSncwM3hRYzYvSmUrVjYrVEVCSkNiQjk4ME1Q?=
 =?utf-8?B?L1g5NjFMd3dVb1RRdU9kcnRFbkk5MGxzemhMRXdHUnZSVWswbDBRaGZROWVx?=
 =?utf-8?B?dUhnNUkvTk4xN2xRS0RQazdvVGFwKyszNVNwK3RPbXVxbmQ4S3JNSzN0NlFy?=
 =?utf-8?B?VDViVS83SFBqR2RZTlNSM2pUQm45VE9HYWlKQ3EvR0o5TGEvbU9zdHJwTVRu?=
 =?utf-8?B?bnF6MDhDZDJUWEZmaitqOVNZQlJ3dDEraGVLUXBHL2thNWdyRGFXN2ZDSFg4?=
 =?utf-8?B?dGI4ZXJJckNwcFNRdmxYSUx5aUdSaHJkam5nbTAwUG1qMWh1SGZvSldtbGVH?=
 =?utf-8?B?dExhUGREcGplLzAwd3I5VXNSSEFPVnlUbDl2NTArV3ZEbXlzNUdLWm1GSkUy?=
 =?utf-8?B?VGphSXJKM3dLZHNlb1ZPckhSV2VIdzJYWnBUcm5YbHR0MzlRa0ZEQlRFMXdU?=
 =?utf-8?B?Rnd4K0k0UlBTYkNTVnZ4emxEbDNZaXVnWEh0NndmYnB1QjBPSlRRYTZTeFhn?=
 =?utf-8?B?SHF6OEZzZnpMWGRUUjFXS0UvWkMzMjBEY29lSVNYZU5LWUt2aFEyVUFLRUZV?=
 =?utf-8?B?ZzE2TEVLRkw0cU9FcWx3aWgyOGdua1oyWElTU3d5V3NyeFRBb1FmT2Yyak1G?=
 =?utf-8?B?RGNIb0JWYXlPVzRTekFiamdxNU9SWDh6Z0hBWnN0RStzVnlPdTlBWG41cUJK?=
 =?utf-8?B?clJmSzFQOWRNRjltcFZjTExMZ3cvbHoxYjhlSjRhVEticlY1bXhyRmtGUHFp?=
 =?utf-8?B?UFRYYkxLdzFSbHVMNXpKem9TZ1pDOWs5azFYcm9tR083NC9GV29QTVFDaGVq?=
 =?utf-8?B?am9NYXMvdnJ1djRuYkJxZjR1WHZPNkRSeEMwZ1E4VHVlMzRUUFMyUDUyK0dF?=
 =?utf-8?B?SkZLczc4SC9ldGplNHdUSjhyN3Q1bUdUQlM5ZjhiVk9hYVJJd1NoTUtsbFU0?=
 =?utf-8?B?Q0JhL1pBUThiUnJ3cVNBenlvR3JLdVIzR2RtOVRhYWpYU2d3Vnlxd0ZHYkVU?=
 =?utf-8?B?L05aQVdIQ3ZRelFiZkFRaXA4MEZUc1pFRTlBOEdDWU1ORDRvNGlETmFOaERM?=
 =?utf-8?B?Zksrekc3Q2RCc1ZxVlBnclN5VmFNNTM0NDY1eWFKSDFOemYvRkdYVVo3Qkg5?=
 =?utf-8?B?Q2ZoTGI5SWlnL015QlhSYThQMjQ4R05lL1JVdkdMYUxMeU91OHYzUFU3eDVU?=
 =?utf-8?B?RDBKQkJ0UmIzaUpkNXJxYVZJZkNEcVB2aG9IeXFLeVFCN0hpYS9sdGFFNnFj?=
 =?utf-8?B?YmxsdjZ3czBRa2tOSGtMeUwzVXUrejZCaDdMbWxTQ2NuUk4yaW54MGs2aTl1?=
 =?utf-8?B?MllLQTlaTDZGNGNqMjl3V1ViT1JHcXI0WGFlMFRReUZ0WmVRSmluWFEydEJD?=
 =?utf-8?B?Z01vL0RWYjF1WVNZaEp5T1lOeHBEdWt1MGZSc3ZSd09mQkxrdTQxZFJJWWl3?=
 =?utf-8?B?RmZBbzBCcmRVQWFYR3ZPWnVGUlRnb05LQjliT2Q3U0V3UGRaTDRNdWZodHFD?=
 =?utf-8?B?c3M4REJDZHVxMTdxbFlTQ3A3OW9uOUV5WklmK3FRa3dhdXhCd3VFMnM2dW1D?=
 =?utf-8?B?RDZSVUZVTVlMSm5yOHNHWHlBalR3Z1E0VFpZbnhsSEVaRDIyNElzTkFwVnpS?=
 =?utf-8?B?V216UXAxTXhzU041NE9tOUpTRFM5RmVYQW5HWUJvc1ZvSis1THlqS2tsY25q?=
 =?utf-8?B?dTNYb0RIdzZpYVliR3lwOHVONHdzdWkxTy9QTWdJS0ZyN1pNSGV4bjhrTTVt?=
 =?utf-8?B?czNVeTgyczhWNkl4YmVBTHlGZUpVL1lEODROb2hFVVdPa0lkc1FLOVYyTWlV?=
 =?utf-8?B?RzdjaUorNzA2Tk90QW5tUkgrcGhhOU1FTEpic1IrMmN6d1h4M3k0MGVtTXky?=
 =?utf-8?B?SmtvQUgzaHNjRm1rb0kwSnJvNEFaR1FMTm1xRElBaXptdlhkSkpkcnhtVVNv?=
 =?utf-8?B?bTE3Yzl4ZFdUb2VQdWtLL3NjY0I0dy90elR3NW1RM0Z0UllaSmxpMGl5QkRL?=
 =?utf-8?B?RGY5N0l5V05HQkdzWkJabXdaSDZURkdpMjd2OXlmejhIUWJJM202cVpFNk9X?=
 =?utf-8?B?M2J3QStCRjhMZVpNREQvNUxIVlJlZDBnYXBabFd0YU11cXJDWWJhWFpTTVFx?=
 =?utf-8?B?bzhFVFd2NUh3NFd2WGgzcE5NbklOYnpPVEtZV09HbW0rV0JGODNUQT09?=
X-Exchange-RoutingPolicyChecked: oOFYloL7kAFMfx0tsq6s+a4ib66ocjGoq5+wtmW/3Av0gjBUwNauBNd0z3XOd8990y1nuEIy9fE+hbBgUyI13fqFDlPKZivHxyQJD3e5VknlSUO9GXpUZZpuA/xzPa3WBEqsauesoI7R24lMEG0zpmnzFJk2Mh+a4qyejmNa7+GwkTFhZK5LVXed6ElG9J+ZW9/kAVLLL/e2/AhjWfX1A37hvOtLT1QfKgWq2TJEqwgVmfeKPxzT8NbXuS/3yRPjRqWIPJqvCVi4Y1NFVbZ+D090ifArqArBJlTKLe3Vj8e723vjUZDxlAxG5WFu6qe2SasN6tojGLYGqyfDRBdLUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 417aa50f-848f-4f60-21ea-08de7ae88f11
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:53:58.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2kHSsnfRzSb0a2hQGxYRzKSG9lYujWHeJtJ3q29Ipro3HH0OSElAuHwrjmrgnsdmm97/fq3J1FrRAj+AqQOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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
X-Rspamd-Queue-Id: 2398721725D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ursulin.net,ffwll.ch,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 04:04:32PM +0100, Marco Crivellari wrote:
> Hi,
> 
> On Tue, Nov 4, 2025 at 11:00 AM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > Marco Crivellari (3):
> >   drm/i915: replace use of system_unbound_wq with system_dfl_wq
> >   drm/i915: replace use of system_wq with system_percpu_wq in the
> >     documentation
> >   drm/i915: add WQ_PERCPU to alloc_workqueue users
> 
> Gentle ping.
> I checked patchwork and seems still in the "New" state.

Please ignore patchwork status.

Both patches queued towards the next merge window targeting 7.1

fa171b805f25 ("drm/xe: replace use of system_unbound_wq with system_dfl_wq")
0bc2c2e1a388 ("drm/xe: add WQ_PERCPU to alloc_workqueue users")

Thanks,
Rodrigo.

> 
> Thanks!
> 
> -- 
> 
> Marco Crivellari
> 
> L3 Support Engineer
