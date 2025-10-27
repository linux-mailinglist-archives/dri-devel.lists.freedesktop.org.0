Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A0C0D8C5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D2310E468;
	Mon, 27 Oct 2025 12:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gdd6rja1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85710E468;
 Mon, 27 Oct 2025 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568421; x=1793104421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RnpGYe4miDF58stEnt6RNbRnfUXYC9Oy/9wIpufGbdg=;
 b=Gdd6rja16ECXeXlBJMEhGykdEoelbQac0WU/OeIjk6iGGOqHY9YBcVPw
 temW+8d7o1KjtrPuX2Rmv9KfJdOd9RrzkebFFFziKVS8Qhp20Vm+IofOA
 UIT14iqaAJulZNGqLPix2sGM5f/cKZIhemYsHyLUa0HyDfpZU/Fti9l22
 xJa1b/fzE/YkBL9EBHQZpcrG9MxNPKz8Nfy+/XoHc2Ihs4WX0LxRpnNnZ
 dT/SJwlVg/TLoggy2Oy2Lii82lwjfAfX3VUt24uWpvJZk/vRix3XSzgyO
 lijJpfxpFFSxuBRMDzJy0iCKg21inUd0CCCJJ7S2GttbEs1Ch0dqEHB42 Q==;
X-CSE-ConnectionGUID: c3uv423sSCKlkA/vu1K7Iw==
X-CSE-MsgGUID: 8hx6n8MjQoasPiHgUkMIOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81070133"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="81070133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:33:41 -0700
X-CSE-ConnectionGUID: RtmGW0jAQ669IxNZw4Gf3Q==
X-CSE-MsgGUID: bgspilpEQWKn6kkIcLUSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190162755"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:33:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:33:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 05:33:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 05:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBjPZ+cpXVVbqmz1f1R3m9sn3gUbf/IejkHFwYYsgEMbBAXN/lm+x7AJz7nScUUs6PsXQMvKoUMcvViXNXISizhIL5odUGwsrSnBfiiC8zjqs7uTYY8ae9JZ+8jDHptlNVHc98o+LkpQE33X0huPCuqU2RICsW4pwb+S+5p2qGsiH0NfqWyrKsMvwlu35TZu3Z4vEGdzgDwu9YniaWAm0U7Ro7AJHUSDDom504BGmEsJWubRV/23gu7lMxaGnPdqd8fBh+nAKx00HEE0eqc/e1zSydCGTfgne7vXnmLLo73tsUJK4X2WFvtNhfEhUMH+DOMt4rfW/CQIj9i6W9xOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrJcxNf1gWJJSl4Vukhrj9DMz3TVqUCailSNCnaJJL4=;
 b=Q3FXHiSRL8v+Bz3YqIE/ZGhej5GJaVp7j98VXeUj4DlklAMwMk9/NntZ1qAz1AWejHvA86/G30WfbWz/CGu6+zcqWqgFHm7Leef2n8aw1tb3WF1wgqQjrst2jFIcylhwbCFRoxwxWXOotYIjQhxt/1KnIuE8ce7oBQdfp4zeGHurGBffTYYDOrKyAiI1K9T7LbbGlZs6NejmSn00CINcfcOdKA7JMw/Jl05p1ptDMDt0FZ7LNJa93kazMr9JDwb3oNgQToEQ4oCoT2zQVh/RzakQ3C8WHNxz2fZMrqbbvbgAH3M+SKyOkOKdMGMXe8rgTtlyDNXDQcJaS+dcEWbR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 12:33:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:33:37 +0000
Date: Mon, 27 Oct 2025 13:33:33 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 04/26] drm/xe/pf: Add data structures and handlers for
 migration rings
Message-ID: <2xxp3cytad6rou53mwjnv4xt5lkxqfl7g2s4ig2q5g2u3ptvko@xnsh5bbd4rbx>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-5-michal.winiarski@intel.com>
 <34891f4c-07bd-4c18-b049-5b499695b6b2@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34891f4c-07bd-4c18-b049-5b499695b6b2@intel.com>
X-ClientProxiedBy: BE1P281CA0319.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a763dcd-e58e-4015-7631-08de15550ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFZZZldiUE1PZ0FkaGFnNXRCWmpOUWNKSDdxUzBuRmVkSXFhN3JKQXZ6aWJD?=
 =?utf-8?B?K1crY1VuMlk0Ui9Wc2M2OURpWGF6ODRxM1pVVkJ4YitIbXlwZ1poOGY5RlNk?=
 =?utf-8?B?M0ltUlFDLzJkVjZmbU1QZms1dXNLSy84NVhCTjNxTXdHcEw3SW5QN3NZV1Bu?=
 =?utf-8?B?SE5jbi9KTGd0R1JQaHUyN0ZydjNTdUYzSm4vOUpHL0UyTnJhZFBwNW1aMEtR?=
 =?utf-8?B?UE02RForM1loS2hxTzR0NlFJblM5ZmlFSlVXbW5ESXFPNi96WTRWcFBpTGFS?=
 =?utf-8?B?MUlVR2d3MWFvbGlVMUhnMXNyL1pqS21MSHQvN1NuQnprSnZUSUlEcVFzTG5E?=
 =?utf-8?B?aEJRaVF3UGtYRVhKVkx1bHk3Z3gyKzZLaW1BWVR2em5jTW1aR2xveHZnWUU3?=
 =?utf-8?B?YXpXVmJUZWJsWjN1YVNBb0RNOWxVRDBQaTRXUm9EUVhGOGZaK281TTY5UU5j?=
 =?utf-8?B?anhjR3Ftd1lWZU4zditWSTArcnpDeTNTb3d3bEJqcXJncFljcE9VRmN0aVVa?=
 =?utf-8?B?RVl5S2ozdjd5bXoyZ2JvQjdJK1VSSXl3Y2xHekwzaW1YbFZhWXR4Q2h6QkVn?=
 =?utf-8?B?UVQydmk2aG12RVVpb3VPZnFCL01wZGxEWlVoNGJpMzB0UTB4UlFmN1N0bWtQ?=
 =?utf-8?B?clBZUVZ1MU1WQWhhbUdybU5hY2xxRHhmWDVWbVA3Z29PVm5OQ0ZkMTQ5N0I5?=
 =?utf-8?B?SStlL2RPZG1pZ2lyckhqdXNFNzNYSGNMc01wUWRuMXdEZmVkMHpUc3ZXcS8w?=
 =?utf-8?B?Sk1IM2pIM1N3UUJZUFZ5YlYrTUF4MW1INEx6NFRQbmRGajUyUXRxMEZpVFRY?=
 =?utf-8?B?dHl3K3hubURLZ0R3WnVkY1JpMDY1NDNiSUU3V1VMZXFlM0RrRXV3Rmg2VmlU?=
 =?utf-8?B?ZzF4dDlUcGZ2YTNFQmt5dkwrSEp1Smlyd2lLUUk2SENsdStNbEhkUTRVbXZI?=
 =?utf-8?B?ZGxuRGM0cEl1VWlWZ1o2UkFUZ0VGRXdJanJYaFNlMk9hT0g5dEhpUTBoU3Ja?=
 =?utf-8?B?NmI4bzUvbTNxUTZYQnBOWUplVS9sUERnMERhYkQwaytFL3dPd1dVdHBSZVll?=
 =?utf-8?B?bk9VbjFMV2lqOWltS09rVituUmJWVm1tUmgzcEMycERZMHFmbkRxZWZRNkZV?=
 =?utf-8?B?bTZkTlJ6YlNwcjdiY2RKQnMweHpnV2Rxd3I3NDZEeFdQdWhwMXNqNEhDdU0w?=
 =?utf-8?B?OWNBSFpYOWQrRGR0ZWRvWW85Y2lodFZJUXNYL29UTVdpNzNwTTd3S0xmb1Jq?=
 =?utf-8?B?RmU0UEE1ZjlETjZqYmhzbmhaWE5OVXp4QkFEV0xSdGdOVnA4NHVBcFgzb0dY?=
 =?utf-8?B?N3hLdVpKOUdYWGlQSzYwTWxzMnBvT01qYkczaGhLbGgyYWJLS0FtbHozdlpk?=
 =?utf-8?B?cXB1QmxpWWQ1L1ZMVkNzNjFaU3g4dnpvVldoRzgwQmFZZzEvb2ttRDlKWS9V?=
 =?utf-8?B?ZmxTZzZIQzRGd2ttcmE5b2N2UW5OdWdIT0JIUkpqVXJacWhDQ3dWRnJNMFh3?=
 =?utf-8?B?TmVxdVhDcU0xa0FsSittSXJRYUdIWG1lY2ZEQmJBSDJrYWNKNVdqQzMwdEc5?=
 =?utf-8?B?azZiY0VpZFp0czgyc3hTbmFjb2pXL1o1OHhoVE5vMFZkNEpQVDE4L3l0SXFZ?=
 =?utf-8?B?VE5mNDhhN21SQ1grWlk3VGtlUENLdzN3b2VaVEwveTVRb2dsWTE5ZzNZZVY1?=
 =?utf-8?B?VWVLRXByZHNmMVQ5Z3l6U01nMFJhZFRsNEcxYWtEL1NSQ1hMLzBnZkUyNVF3?=
 =?utf-8?B?NDdjbjBiWmZOUzJBRFNITE1MZDlDSXFOanM4eUE4Tk11cENXZVF1ZE5QMk5P?=
 =?utf-8?B?UkVQRUZVbmZ5QjgrdFlxMit2NGhBS1JUUHZwNFNwT202UGRYUHVVMWFtMjhs?=
 =?utf-8?B?ZTZWYTIrOUc0N2d3RUt0MlkwODdCZm1FOWdPaXRQejlHcWZBNkhySThTK1c3?=
 =?utf-8?Q?s0AadAhHwZYyWoG/TTpZihduOxZe0jkK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QURwSTNabWswS1JoUThJVmowUExCMVVlTnFrcnR5OWs5L2I0TXRWS2t6V3ZU?=
 =?utf-8?B?eEtDVzVvVHFXTTRTaFpMN3QrMlZPY0hST2FaSElUVEgrSEpHeG5hL2NSTVFo?=
 =?utf-8?B?Qjh4OHhIY05HM0xVREMrKzZKclVJNFVmNkpTelNUa2pPWS8rSW5JejRzRWZs?=
 =?utf-8?B?VUVmNS82NWtsN21BNENuTE8zVlNPQWpZV1l0RlE3UmZCSG9BeXpOWi93bjJz?=
 =?utf-8?B?eXd3YXA5ZFZzZkI4d2IzM0tEU2dCSXQ1Sytxc3pxRExibk4wS3ZZdk5MZFpy?=
 =?utf-8?B?c3kzMEpDTVplVlUwRFhtdktNQmorYkNMQmZqaDh6SmR2M1NmRWFobnVjZC82?=
 =?utf-8?B?NVQ0YXUrVFV3TDV6ODFTUkkyVm1PdUFwNm5zV2ZsdUlUdFB6NTJpcC9mQmF5?=
 =?utf-8?B?Y2FmRWM0K2NKYkM4aEN1UWFneTJxYXJIcUk1VlFyenJJa2s1ZUxNeCtPOXJn?=
 =?utf-8?B?b0k2cC8ycS8zdy9GTzdPdVdmcHpMZi83bURjNnoyUGltUUJhMHZYUVdabGFC?=
 =?utf-8?B?UDFJQUhJYlpmSm1neHcwdUJjL280RmlXcS9RQnhxUnBSZ0xxNzBSWkYrNTVN?=
 =?utf-8?B?d3hsMlJlZW85VUE5WWRGQ1R1aTc2K3JxOUUzZUpjcENjVWlWRksvUzhORUZL?=
 =?utf-8?B?SjhoWlMwU1EvYTN3aW5SclpkTHR4VTdscTZTMXFlU3hncE1uQ3dZamJubFh0?=
 =?utf-8?B?bXNMWC85NTVucjZrUVNpZnBLaG9DZmFCMm9yekozaXI4SkE4dnNyc2p6OU1H?=
 =?utf-8?B?ckdyYjlIOVRjTzlCd3AzRlNTTGY0Qlpiek1yS1RoK1NaS09pUGJjR2dhSXIx?=
 =?utf-8?B?dnNYcTVhVnYxTWMzVytMVXRLVjNIaGtwa3gwRld5K2F0UHlLWWczbFMrd0Zu?=
 =?utf-8?B?ZVk0QnNTZDZCRVNuWndiYzk2ZjlERENvWEIyVGV5SCtwcFVYQkVla1A0dnFC?=
 =?utf-8?B?RWFIQWVleHdNRGlvYzR2a041bzZ6Z0Z1Tm9SU1hmQWF2QjFuUWJuS0crTW9U?=
 =?utf-8?B?MHRBanpWaFFGTWdMM010bmJzdFg4WjRFWEhSS21HeFNOQTlmS1BDMUtCZDlF?=
 =?utf-8?B?TS9pUGliOS9RS1ZNNDNaRkROeENaVVVhSzg4Tm0xWi8wbzVkVGMrYytDMGR2?=
 =?utf-8?B?RWVYNWdDSnRFT1hreDhCUG9PNm1TR3VDQ2ttdWdrSnRWcE1uM2k3T3Z5ZW05?=
 =?utf-8?B?VEJiYmhtMDB0VktNa042RXR0Q1h3Tjk5MXNFVHBiM0tQeldVWjY5TGJCY284?=
 =?utf-8?B?aVhhUlBhSVBiUXZWaVVwUWw1UVQ1dm9XUG81RlpvWk9vUDN5NFR2TmVSOVE4?=
 =?utf-8?B?ZGQ4VGIwTUVuQ21nK28va2U0UzNTcU5rVEgwbzg3RzBYdlh5WFdPWlJ2ZGpW?=
 =?utf-8?B?N1RnT3BHNGd1ZlpMM3lsRGtGK0Q4eHhWc0hoT25uREQzTjBqU3QxVmxOOUIy?=
 =?utf-8?B?SmU4NWJVdDFVcVhKdVJ6ZURUNENyT2lWVTlEL3l4Tjg1N3hTODErL2lmQVQ4?=
 =?utf-8?B?eDhWRndNWDVLQy9TZFE1dFBWVURBSDBhVWZMTFR6cXRPZ09oQ2dhQWJWdHVD?=
 =?utf-8?B?TjFuTzJWMVVqK3JxMVAvWnVrVk9id3V1K0g2RGZFUWdTMElyRnJ6RWNiVzZk?=
 =?utf-8?B?Zm5Fa002YzUyYTlTWk1vaFBkYVdZMndjeWVFbmR2TmNPbDhIbUFJaFlXSmMr?=
 =?utf-8?B?azJpWjVmYkhGRk5XcHNxS2VvenNwS1l2ZWU2a0lra1JRemdiaXlqSmVRaWxh?=
 =?utf-8?B?RmtiNytyNlNqVTFRMjcyUFR2Q3l1TE9ZZ2R4Y1dTazk5aW44VnZkYjA2Y0tT?=
 =?utf-8?B?MDZ5cllBTjVuMTlhOFRyZU43V1FwaWswcmJlRFNMSm5saURrb2xXMDg3dDBE?=
 =?utf-8?B?clcvak04dUhOek5HVWFUSHBZZkg5aVVnQjcydlE2STJVdFpadDloMlhSdlA0?=
 =?utf-8?B?MlNySmtPYTVMVjNMK3BOR0U2eUpGQUFlWitUbXFyWFo1OTMvZXpRMm1tTmlj?=
 =?utf-8?B?VjJ1bnZpRTg5SGtkcUhkRjVvUW5zVHBJWlFaWWJPYzFrNnB6RXhKSUhkM3Rw?=
 =?utf-8?B?amFleUlnOGFnQ2JYYmI0SnRnK3o4T0oxeDJRRk1YeHA3akhtUDZxWFJiVk1q?=
 =?utf-8?B?OE9kWURFWlMyNEs2VmE2Q0tQaHNDazUzNWxpeWhMRjNBdXpTOGF1ekprSzds?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a763dcd-e58e-4015-7631-08de15550ce3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:33:37.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTQHipW9dPTp7BK37PRADAqIf+Ku70Y0KN16xlCV6oprYPGlYBLaWZQMyZrMBEKeYqnwoXaudPTAi+z1QXXOPXFi1FxyffIE5UztgbPhTNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
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

On Thu, Oct 23, 2025 at 12:06:05AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Migration data is queued in a per-GT ptr_ring to decouple the worker
> > responsible for handling the data transfer from the .read() and .write()
> > syscalls.
> > Add the data structures and handlers that will be used in future
> > commits.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 259 +++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +-
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 183 +++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 143 ++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  58 ++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
> >  11 files changed, 684 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index b770916e88e53..cad73fdaee93c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(PAUSE_FAILED);
> >  	CASE2STR(PAUSED);
> >  	CASE2STR(SAVE_WIP);
> > +	CASE2STR(SAVE_PROCESS_DATA);
> > +	CASE2STR(SAVE_WAIT_DATA);
> > +	CASE2STR(SAVE_DATA_DONE);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> >  	CASE2STR(RESTORE_WIP);
> > +	CASE2STR(RESTORE_PROCESS_DATA);
> > +	CASE2STR(RESTORE_WAIT_DATA);
> > +	CASE2STR(RESTORE_DATA_DONE);
> >  	CASE2STR(RESTORE_FAILED);
> >  	CASE2STR(RESTORED);
> >  	CASE2STR(RESUME_WIP);
> > @@ -804,9 +811,50 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  	return -ECANCELED;
> >  }
> >  
> > +/**
> > + * DOC: The VF SAVE state machine
> > + *
> > + * SAVE extends the PAUSED state.
> > + *
> > + * The VF SAVE state machine looks like::
> > + *
> > + * ....PAUSED....................................................
> > + * :                                                            :
> > + * :     (O)<---------o                                         :
> > + * :      |            \                                        :
> > + * :    save          (SAVED)    (SAVE_FAILED)                  :
> > + * :      |               ^           ^                         :
> > + * :      |               |           |                         :
> > + * :  ....V...............o...........o......SAVE_WIP.........  :
> > + * :  :   |               |           |                      :  :
> > + * :  :   |             empty         |                      :  :
> > + * :  :   |               |           |                      :  :
> > + * :  :   |               |           |                      :  :
> > + * :  :   |           DATA_DONE       |                      :  :
> > + * :  :   |               ^           |                      :  :
> > + * :  :   |               |        error                     :  :
> > + * :  :   |            no_data       /                       :  :
> > + * :  :   |              /          /                        :  :
> > + * :  :   |             /          /                         :  :
> > + * :  :   |            /          /                          :  :
> > + * :  :   o---------->PROCESS_DATA<----consume               :  :
> > + * :  :                \                      \              :  :
> > + * :  :                 \                      \             :  :
> > + * :  :                  \                      \            :  :
> > + * :  :                   ring_full----->WAIT_DATA           :  :
> > + * :  :                                                      :  :
> > + * :  :......................................................:  :
> > + * :............................................................:
> 
> this will not render correctly (missing extra indent, RESTORE_WIP below is fine)

Ok.

> 
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> > @@ -821,12 +869,39 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> >  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> >  }
> >  
> > +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_saved(gt, vfid);
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> 
> this seems to be done too early

Yeah - I'll change this (and other save/restore related placed) to the
suggested pattern.

> 
> > +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> 
> you should enter(WAIT_DATA) here
> 
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> 
> and don't re-enter(PROCESS_DATA) as we shouldn't be in both sub-states at the same time
> 
> transition from WAIT to PROCESS shall be done in
> 
> 	pf_exit_vf_wait(gt, vf)
> 	{
> 		if (exit(WAIT))
> 			enter(PROCESS_DATA)
> 			queue
> 	}
> 
> called from xe_gt_sriov_pf_control_process_save_data()
> 
> > +
> > +		return true;
> > +	}
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +
> > +	ret = pf_handle_vf_save_data(gt, vfid);
> > +	if (ret == -EAGAIN)
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +	else if (ret)
> > +		pf_enter_vf_save_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> >  
> >  	return true;
> >  }
> > @@ -834,6 +909,7 @@ static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> >  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> > @@ -842,6 +918,36 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + */
> > +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +		return;
> > +
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> > +		pf_queue_vf(gt, vfid);
> 
> this should wrapped into:
> 
> 	exit_vf_wait_data()
> 
> where actual transition to PROCESS will happen
> 
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
> >   * @gt: the &xe_gt
> > @@ -887,19 +993,62 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
> >   */
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> > -		pf_enter_vf_mismatch(gt, vfid);
> > +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> > +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
> >  		return -EIO;
> >  	}
> >  
> >  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	pf_enter_vf_saved(gt, vfid);
> >  
> >  	return 0;
> >  }
> >  
> > +/**
> > + * DOC: The VF RESTORE state machine
> > + *
> > + * RESTORE extends the PAUSED state.
> > + *
> > + * The VF RESTORE state machine looks like::
> > + *
> > + *  ....PAUSED....................................................
> > + *  :                                                            :
> > + *  :     (O)<---------o                                         :
> > + *  :      |            \                                        :
> > + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> > + *  :      |               ^           ^                         :
> > + *  :      |               |           |                         :
> > + *  :  ....V...............o...........o......RESTORE_WIP......  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |             empty         |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |           DATA_DONE       |                      :  :
> > + *  :  :   |               ^           |                      :  :
> > + *  :  :   |               |        error                     :  :
> > + *  :  :   |           trailer        /                       :  :
> > + *  :  :   |              /          /                        :  :
> > + *  :  :   |             /          /                         :  :
> > + *  :  :   |            /          /                          :  :
> > + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> > + *  :  :                \                      \              :  :
> > + *  :  :                 \                      \             :  :
> > + *  :  :                  \                      \            :  :
> > + *  :  :                   ring_empty---->WAIT_DATA           :  :
> > + *  :  :                                                      :  :
> > + *  :  :......................................................:  :
> > + *  :............................................................:
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> >  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> > @@ -914,12 +1063,50 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> >  }
> >  
> > +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int
> 
> no need to split the line

Ok.

> 
> > +pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> > +
> > +	xe_gt_assert(gt, data);
> > +
> > +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_restored(gt, vfid);
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> 
> maybe you shouldn't enter(WAIT_DATA) here
> 
> > +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> 
> but here
> 
> > +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> 
> hmm, there should be no direct transition from WAIT_DATA to DONE
> 
> > +			pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +			pf_enter_vf_restored(gt, vfid);
> > +
> > +			return true;
> > +		}
> 
> or just here
> 
> > +
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> 
> and transition back to PROCESS only on exit(WAIT) called below
> 
> > +		return true;
> > +	}
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +
> > +	ret = pf_handle_vf_restore_data(gt, vfid);
> > +	if (ret)
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  
> >  	return true;
> >  }
> > @@ -927,6 +1114,7 @@ static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> >  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> > @@ -935,6 +1123,41 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> 
> shouldn't we have additional state checks here?
> 
> 	expect(RESTORE_WIP)
> 	expect(RESTORE_PROCESS_DATA) ?
> 
> this one below just looks for one-time entry, but can we really enter anytime ?

expect(RESTORE_WIP) makes sense - I'll add it.

> 
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + */
> > +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> > +		pf_queue_vf(gt, vfid);
> 
> IMO the transition to PROCESS shall be also done as part of exit(WAIT_DATA)
> 
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> >   * @gt: the &xe_gt
> > @@ -1000,11 +1223,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
> >  {
> >  	int ret;
> >  
> > -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > -		ret = pf_wait_vf_restore_done(gt, vfid);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	ret = pf_wait_vf_restore_done(gt, vfid);
> > +	if (ret)
> > +		return ret;
> >  
> >  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
> >  		pf_enter_vf_mismatch(gt, vfid);
> > @@ -1703,9 +1924,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
> >  	if (pf_exit_vf_pause_save_guc(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_save(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_restore(gt, vfid))
> >  		return true;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > index abc233f6302ed..6b1ab339e3b73 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > @@ -14,12 +14,14 @@ struct xe_gt;
> >  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> >  
> > -bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> > -
> >  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> > +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index e113dc98b33ce..6e19a8ea88f0b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -32,9 +32,15 @@
> >   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> >   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> >   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> > + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> > + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> > + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
> >   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> >   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> >   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> > + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> > + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> > + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
> >   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
> >   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
> >   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> > @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_PAUSED,
> >  
> >  	XE_GT_SRIOV_STATE_SAVE_WIP,
> > +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> >  
> >  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> > +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> >  	XE_GT_SRIOV_STATE_RESTORED,
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index ca28f45aaf481..b6ffd982d6007 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > @@ -15,6 +16,17 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> >  
> > +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > +
> > +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return &gt->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> >  				      u64 addr, u32 ndwords)
> > @@ -382,6 +394,162 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is empty, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is full, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: &xe_sriov_migration_data packet
> > + *
> > + * Called by the save migration data producer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the save migration data consumer (userspace), that is potentially
> > + * waiting for data when the ring is empty.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	int ret;
> > +
> > +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the restore migration data producer (userspace), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &struct xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data)
> > +		wake_up_all(wq);
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: &xe_sriov_migration_data packet
> > + *
> > + * Called by the restore migration data producer (userspace) when processing
> > + * migration data.
> > + * If the ring is full, waits until there is space.
> > + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> > + * is potentially waiting for data when the ring is empty.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_migration_data *data)
> > +{
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	int ret;
> > +
> > +	xe_gt_assert(gt, data->tile == gt->tile->id);
> > +	xe_gt_assert(gt, data->gt == gt->info.id);
> > +
> > +	while (1) {
> 
> or for (;;)

Ok.

> 
> > +		ret = ptr_ring_produce(&migration->ring, data);
> > +		if (!ret)
> > +			break;
> > +
> > +		ret = wait_event_interruptible(*wq, !ptr_ring_full(&migration->ring));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &struct xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty and there's no more data available,
> > + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data) {
> > +		xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> > +		return data;
> > +	}
> > +
> > +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +		return NULL;
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +static void action_ring_cleanup(struct drm_device *dev, void *arg)
> > +{
> > +	struct ptr_ring *r = arg;
> > +
> > +	ptr_ring_cleanup(r, NULL);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -393,6 +561,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned int n, totalvfs;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > @@ -404,5 +573,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  	if (err)
> >  		return err;
> >  
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> > +
> > +		err = ptr_ring_init(&migration->ring,
> > +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> > +		if (err)
> > +			return err;
> > +
> > +		err = drmm_add_action_or_reset(&xe->drm, action_ring_cleanup, &migration->ring);
> 
> should we wait until drmm cleanup or devm cleanup ?

Worker is drmm, so I did follow that, but yeah, I guess it should match
pdev lifetime rather than DRM dev lifetime.

> 
> 
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 09faeae00ddbb..9e67f18ded205 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -9,11 +9,25 @@
> >  #include <linux/types.h>
> >  
> >  struct xe_gt;
> > +struct xe_sriov_migration_data;
> >  
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_migration_data *data);
> > +struct xe_sriov_migration_data *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> >  						char __user *buf, size_t count, loff_t *pos);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 9d672feac5f04..84be6fac16c8b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/mutex.h>
> > +#include <linux/ptr_ring.h>
> >  #include <linux/types.h>
> >  
> >  /**
> > @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
> >  	} guc;
> >  };
> >  
> > +/**
> > + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> > + *
> > + * Used by the PF driver to maintain per-VF migration data.
> > + */
> > +struct xe_gt_sriov_migration_data {
> > +	/** @ring: queue containing VF save / restore migration data */
> > +	struct ptr_ring ring;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_pf_migration - GT-level data.
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > index a64a6835ad656..812e74d3f8f80 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
> >  
> >  	/** @snapshot: snapshot of the VF state data */
> >  	struct xe_gt_sriov_state_snapshot snapshot;
> > +
> > +	/** @migration: per-VF migration data. */
> > +	struct xe_gt_sriov_migration_data migration;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 8c523c392f98b..eaf581317bdef 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -3,8 +3,36 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> > +#include "xe_pm.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: pointer to the migration waitqueue.
> > + */
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return &pf_pick_migration(xe, vfid)->wq;
> > +}
> >  
> >  /**
> >   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> > @@ -33,9 +61,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >   */
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> > +	unsigned int n, totalvfs;
> > +
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> >  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	if (!xe_sriov_pf_migration_supported(xe))
> > +		return 0;
> > +
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> > +
> > +		init_waitqueue_head(&migration->wq);
> > +	}
> >  
> >  	return 0;
> >  }
> > +
> > +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid) ||
> > +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static struct xe_sriov_migration_data *
> > +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +	bool more_data = false;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> > +		if (data && PTR_ERR(data) != EAGAIN)
> > +			return data;
> > +		if (PTR_ERR(data) == -EAGAIN)
> > +			more_data = true;
> > +	}
> > +
> > +	if (!more_data)
> > +		return NULL;
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * If there is no migration data to process, wait until more data is available.
> > + *
> > + * Return: Pointer to &xe_sriov_migration_data on success,
> > + *	   NULL if ring is empty and no more migration data is expected,
> > + *	   ERR_PTR value in case of error.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +struct xe_sriov_migration_data *
> > +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	while (1) {
> > +		data = pf_migration_consume(xe, vfid);
> > +		if (PTR_ERR(data) != -EAGAIN)
> > +			goto out;
> 
> just
> 			break; ?

Ok.

Thanks,
-Michał
