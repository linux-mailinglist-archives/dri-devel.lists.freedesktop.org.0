Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D325B45CBC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4BB10EBED;
	Fri,  5 Sep 2025 15:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaRuxUB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AE110EBED;
 Fri,  5 Sep 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757086834; x=1788622834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=blhpXiNbb4hbhMdRTHVZAEnvMeHIb5vXCrXl9+69sLk=;
 b=jaRuxUB5u0Dz28R+GHCmUrh0v1/jNpcXPyAwBIzlQ/ccxiw6f0a9g5Ro
 k0ahKK3smYgBYk8NlKmQy0cc2Tn/Rix2kzqHU04+hc/k2ZRf7cYkQMtWH
 y/11yiQLbI6tU/0+JWcPVQtIgjtwKygmJK7tQkmmn//JHscfLGqLBCcSi
 BMfoedl0PqKG2nmsupWX7kiGbkl3OMwuNH5rOBGX2CA313+U2aZYUipmW
 iddQk5UwHVhpcbIXCOKFQy2L7I2upChx9bcBOMRTwVgfe9JhZyz/eiNA+
 /3Gw3AbVa5BVh5pmLj7wtjcvwnGXEfqviP5d6iu4GACWiGaSgVWJtYNje w==;
X-CSE-ConnectionGUID: EJblKCrQRh+HlG64GFCDFw==
X-CSE-MsgGUID: QNWnq95kSl2H1tF3TDkKfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70058419"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70058419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:40:33 -0700
X-CSE-ConnectionGUID: ko8PlQuBRyCheJLnaTCvew==
X-CSE-MsgGUID: 4K0KuYMmS4GxIFE1SK80eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="203004366"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:40:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 08:40:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 08:40:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 08:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm0fflZ7G7ZjkrItKZq/7Jsn4/HUkfUx3giIrddTXxAs5uukEIy7nJ+odbfZq6nDgsoLEhzaQqXXKFhDaz08N2xAVAplHFGLJ+DUe2zB+RCMs70hVxarlaTRheZY68ZszZfaf/TxMFpds3G7ffg/uY4X3ToJgW9UZ2QGLQPN/CZWYVLE/G7wXUD6c7VDA6lFr5TB6zIIdmDCgJ8vKUUdyrRdzE5tfCNW4zRCnctyiEpCYy422Ni90wdTCkYYEL0H8X+8SceGZoyNOhbxLbSS192unywnkT1wPepVTvVeqSkoqmy0imzHFY0E4SA5LUbrAcPlhzW125WTAr+wkFqN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXhlrgDaTCDzWxCEsKf3MGJjs64Y2it/D+6sL20W+4Y=;
 b=FHFk8/LUYVlcmNF9MzYuiyXan2tY6xSMPm0LENxxw9luqptNgd+NVyLfdJ11qn+K1pwvPPE3B95ooZalLLbftLZxSD6asti7hBj8+e7MguPhBXthd3gz6gPz7gYc19V7VAEL8sZ7kBHfNh1scknprPCDA5Snixa42c1T74UyMXi/MyhLFYywfx1fTS+df8eP7XjHaDyuZ11Iy8j16QrMg+M/ROFknUsMPGZJNofjfOHODzKLAJ6lCxOYgyVJnrwcCrBZ8djluVn96Zq8kSCLYWCF6DdbYFWr7a7rGkIbX6hfVYU1SEl7rmye8zSl/dBeNunomvoLhDqRi0rwuidEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 15:40:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 15:40:27 +0000
Message-ID: <cac484c8-485a-415e-b97f-302e2578e5b7@intel.com>
Date: Fri, 5 Sep 2025 21:10:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to
 disable late binding
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-19-rodrigo.vivi@intel.com>
 <1f323cf45af3ba781d46d2e889f89bc26aa9b85a.camel@intel.com>
 <aIzafHWskNOEcXuC@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aIzafHWskNOEcXuC@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: a429e6d4-7e28-4e13-d98a-08ddec92898a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3V1VXBSL05zNXhmdHZHYkZIZWY5a3ZFUG9INWZZWmN5UkFXZ0R6VzBuZ1JI?=
 =?utf-8?B?ZUt2bXR2RDh4N3ZCbW5zWGZtZTZHbDZDNUlWYm1WeWcyS1VMRC8wcmZrZTRK?=
 =?utf-8?B?YmhaejlWeDc2UTZqTjc4WXZtdHcySytadWFUdEpHYUZERGdVTklndC9GRmhv?=
 =?utf-8?B?dVhiWHZKdzhFckFoeldlQTF2UEFuWTBCVGtqUjUwNHd2Sys0UzV4YVhpckwx?=
 =?utf-8?B?WHFydHQwWXBkRWo0N3B3TjNzMGFNTm1RYVd2Y2daSXZnMDE1bHcrdDlpSE9L?=
 =?utf-8?B?UUZmMFk5Ky9Rbm5uVUFNcUZockcxQWZNczZGcllxMlZyNXF6L3hham1QMGlj?=
 =?utf-8?B?Z1VUUnlXRVNPYURqVGFBa1VKWFp3bDZ0SVEvZW1uWEdNZnQvSnN5MHNJZUVD?=
 =?utf-8?B?ZEpYcmk3aisvWDhRODZYZHBPMmtWUmNxUW10bTEzUTd6SVdmZDVSb252b0JJ?=
 =?utf-8?B?L25jejhYNXJYL2pxUElmZHp4M1lSMy9ldW5XMWcxSXZZVHhEUWp3TWNGMi9Z?=
 =?utf-8?B?RmFDWEYzc3FyMjBKb1ZkSDdFazVKd1VZQTdreEhrbldJcnFJVVdzOGJheGVQ?=
 =?utf-8?B?a2tMSmgvZHNuZlc1SDl6SmpmYjNLL2FEUHlVeUplQzBkTlVQTWU5ZmZxYnpi?=
 =?utf-8?B?UmRXOWR4VDcwKzhlci9oS3JXMDhwSzdDSVZkNWt3Q2cxY0M3WDcvY3hkS2xG?=
 =?utf-8?B?OVZQYVgxdEd1UyttS1o1QzZOcklBeXVrNmlCK3ZSVzljdVZuZkpKM2VPc3Z6?=
 =?utf-8?B?ZnRIajhhL0FuTlo0bkRFR1dEckJRQ2ZjNEVSM0lobnRuMXcyRHcybmtRQnlw?=
 =?utf-8?B?NVRaT0lWWWNrV0ZYNWlIM2lpQm9tWDNNa3owblY3RlYxVnpiR2pkWXpvOXFO?=
 =?utf-8?B?dDlpVFMyem1Xb1k4YkpQRy9IeUp5UnZjWHlreVhnQWhGenV6RThmYXRjTzlH?=
 =?utf-8?B?VHBaTmp6MGhyWWRvOTUzeHY3cVpLU0tTeW1UYXRPMWhGRDBkSzh2Y3I3TkVD?=
 =?utf-8?B?ekNZczErUk4wQTE2NmFxMnR4QXEreUozbnhhZURTbWZRN1lGTSt6MmlZcHJL?=
 =?utf-8?B?OXllQ0pmUDBNOVI1QVlVTTMrWTF6Y0RxSlRQWnVyZmhOWUYxQmhZMGwrL0xS?=
 =?utf-8?B?YWRMdWh5eDhuMnFRVE1mQkhieFUxZm1IZ2RGbDEvVkYwbFhvTnhyVzdkTWRQ?=
 =?utf-8?B?bjlmdWFTOFBjMnlLY09WTFZqMjNzeWFrZ0ZaMmVFV0w1R1pYWEdPU2lJMnhs?=
 =?utf-8?B?c0JjWHZoUGt0V0xXSVNTZ0FvT1ZPc0Vna2hLdk81R2Y0bTh0bUFIM0Vkc1I3?=
 =?utf-8?B?cmpiUmZkZjRZVy9uWVI2L3M4dm9GR3JqTTN0VlZYbVFWTXc5MUNVUUhuOTlX?=
 =?utf-8?B?dG5vaUwzVWExUlpFWHJET2hMNE14ck9tMHArV2xzcGp1Z1lDb2kxaFhTcnRk?=
 =?utf-8?B?YzJIcnErWE4vTlFBZ3dHY3VmSHFoWTNHMUVUM1JwT3NUTUZuUUZUSTZYdmRW?=
 =?utf-8?B?RVJka3FaVnRtUzRrVDJzVGlHSTNEN0VrQS83RDZhQTExQkprNGZDQkM5Y253?=
 =?utf-8?B?RW5zSzZmWElmSnVGelZiVFRYL1JGZWV1TGRCWElRSW1SejRMU2tGYVBhR2do?=
 =?utf-8?B?OENoSVlJQkc1Ky9NZldPL1F5LzZzWEZGeEJSQUpUTnBldisxWWNTUmhNNi9J?=
 =?utf-8?B?REIzZU9RS1lRTkIvVnZhRXdvY1pvN2tHVElwSGM3eTVnSllhSVlzR3JZR25q?=
 =?utf-8?B?VGFPYWVFd0lPa2Z1V0lseFZacy9lalIySG5TR1IwK1FZUVNNMnlBc0R0YW0w?=
 =?utf-8?B?Z09mZjRXSk5oazlOYk1EcWMxeXp3QWNnM28zTjNHZC9mYzNROW0rNVBFaSs5?=
 =?utf-8?B?MDlNNHJORDN5Mm9HNlJ6YWJjRFVHNmlOSXphYkZOTm5RRE1KejJMTGF5eVA2?=
 =?utf-8?Q?TTVOfs0XkuU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFp0U0h3WW55TVR4cGVlNW0yT2IyWkZNbHFmODBuaEd0S3kyVzhKTzNJd0pD?=
 =?utf-8?B?Z21VRmU2OEZvRHlPODRXTzNCRFdacHVXOHFNbDZuOEdaNCtrdnJtL1d2eFAr?=
 =?utf-8?B?M3d6M1dvdTVxYmtIRHJrd1dBSjUzSm13OE1xSHhVYW52ell3SnkyRCtVdkxY?=
 =?utf-8?B?SUp2NGJCMTIyOUZjUHNiV0JiQS9leHpRVDVLOWFzMHAydC9HcVZwbjVCQ3RU?=
 =?utf-8?B?T0FzR2RlQ3RCbTAvODU2RVY5cWc0amZ1MmNrbnRVQWlUNlpnZ0hOQ2VNUlQw?=
 =?utf-8?B?M1VEbDhaTVR5NG9saTFYd3djemhwMjdpKzB4OTNqSXJJQ1ZOSTBmdWp6UW1N?=
 =?utf-8?B?Q2lYRUJMNTJQRUtia2xiVU9OMFBpd0xFcmVKT3B6U0RqRnJDTHdSTkVNUGpF?=
 =?utf-8?B?RXVBYjQ1UWxyYXhuS2R5UUQ1bFdpSUZTY3ZmbHVSWmx4VllxRXhFbEpFK1J1?=
 =?utf-8?B?QndidEhZTTJ6dTZPeG9td2dEazJoYXEvWlhnRGtFcmtvcjJDRUh0NkZFemt2?=
 =?utf-8?B?WFJ5NEdSN0JMQkxyZ2tHZkRZVE10OUd0ZkVQRWF4emNxYUlFaEFGNXFWSG9U?=
 =?utf-8?B?UnJyc3hRbk83MjNxYTl4RXVJZmJPTEdLR3FFOGZvWEtIMG9HaWNDMUJJZjRH?=
 =?utf-8?B?MUpaM3Rwdm9FbmtaLzNFVHVIMUNrQkdnRHRGL3JjUkpkd1MyZDZXanRyZGhy?=
 =?utf-8?B?aDlsNkVqNzJSR3o4Q0x6dW81Y1NWS1Qva0cwalJpclpSc1dxdGI5ckw1bjZL?=
 =?utf-8?B?Q3Z0ZUREbWpaWSs5Ynh3YnNqWjFKdk9HMFRPTWptR0tMbGRQN0J4UGV2V3A2?=
 =?utf-8?B?OTBDbGdjWlYxcHdVakhXUnBqcnAxT1RKR0x3TThZMC9WWFVXTFJTdDlxOHdt?=
 =?utf-8?B?Tjlndlp2bGRPbXZKWEF3VVQwU3dFK09YKzFxcC9rTUlPSmZEK3k4VlJuOUNI?=
 =?utf-8?B?N1VOWnRaRys2NWF1cnV0SWt2Z0RmRUY0WUFZdmZHbjdiM0gxWm9MTldtK1ly?=
 =?utf-8?B?UG5ZOGl4MG1sdW9yR0wra2NOWGVReTZ3THNFTVloaXozRFU3dk9PdVJneHls?=
 =?utf-8?B?cVJvRDJWNEtxWUpPYnpuSkRZT1Iwby9YY3B0d0NEeTFyYWd0NURSZXhUdHgy?=
 =?utf-8?B?NU9kb0draVc5dEdFaTdUVFZrdUJlVlpEVlN2dWZBZGhoQUlkY1FPMks2L09Y?=
 =?utf-8?B?VjlGUG0ydHhYOWdESlZmdnc5SWg1UkhlYVl6dHpTU0JFZkp5RkFabVVYejQv?=
 =?utf-8?B?U0VWaGxmRFBpYjk0cEhXaHZQWm5XTjMzSWxvS0JhYWUrODZtenl3eUtVeldp?=
 =?utf-8?B?dGNkSFdxS3NYN3pkcVprWjVQYWNvNjQ2cWlUL29ZSHFnS1JOalN1S254UlpY?=
 =?utf-8?B?ZVJhUmhxVHZKd3p6S1htWW9MNTV4dW1rOU0vb2I2dXBmTDM0WTcwOW10Z2pB?=
 =?utf-8?B?b3ZLMFpLbHVxYzBvbVkwZTZlYnhnYlBQTkozdW8zMlRWZm01eHdZMGdjZ2VO?=
 =?utf-8?B?SERrSWNwT0JZZmNTbHZJTXZVOUt3MUNHazVnNEtPTE9PMkRDR2x2WTZFcE5R?=
 =?utf-8?B?NVp1NDA2dzdnRUIxdEllc3RpZnlXbkFGTGhZRmpTMXpRSjQwNEgxVGcrcVVE?=
 =?utf-8?B?dk9sTFl6Unp4b2lSSHhKRnhIUmNFUkVWRmpFN29KNlVOd1VwUDJUVGFrOWR2?=
 =?utf-8?B?djJYbVExMStpZmJhM05tb29qWGVhVmdoWDNVSXduU2VsaWlwWjAxN3J2b1BV?=
 =?utf-8?B?YmVTRmZ3dmJEM01lc0FJUUxPbm5yclhzQ1d6OHVUK1dBeExXRlRJbkdOSDZL?=
 =?utf-8?B?TFlBNkRXR2VKcEhVNFh3NkxvMU93bzBpSkFraGxlWUN3dHFWK1VCSXV1K1J6?=
 =?utf-8?B?K0kwVkdZSStibncxNWJTaC9VMmZ6WWt4RUQwTW9XMGcvODJoNlVkQk5EU1BW?=
 =?utf-8?B?YnROQ1d6bW5wNWJIVEJzczdEenRmSXFnMThXUzFDV0lWYkxpQ0gzcUxYakFT?=
 =?utf-8?B?UlZyTTlnUVI2bXIyRjRicTl0YmFyMVQ1Z1A5YVZhTHcyb1VMZHRnUklxc2dz?=
 =?utf-8?B?UHd4eHZ1SUpESGpHSU9WeXVjVUpIQ25rZzFBNHVpRDRwRGI0a0ZIUHNQbGRk?=
 =?utf-8?B?cGR3aUJ1R3lrc0RuU2o2bkJBOUFzaGNlS1pwUGNGNURJR2huaUgyTFBvRlV1?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a429e6d4-7e28-4e13-d98a-08ddec92898a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 15:40:27.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5egdn/WsxefUFzzydVPpXByj/SAhJoQQpQAyZyR2S7fH4HGl7sz8TtAFDEMZGOXxKgrl/Suv7GAgaCqqIanfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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


On 01-08-2025 20:47, Rodrigo Vivi wrote:
> On Thu, Jul 31, 2025 at 08:03:36PM +0000, Summers, Stuart wrote:
>> On Thu, 2025-07-10 at 11:08 -0400, Rodrigo Vivi wrote:
>>> From: Badal Nilawar <badal.nilawar@intel.com>
>>>
>>> Introduce a debug filesystem node to disable late binding fw reload
>>> during the system or runtime resume. This is intended for situations
>>> where the late binding fw needs to be loaded from user mode,
>>> perticularly for validation purpose.
>>> Note that xe kmd doesn't participate in late binding flow from user
>>> space. Binary loaded from the userspace will be lost upon entering to
>>> D3 cold hence user space app need to handle this situation.
>>>
>>> v2:
>>>    - s/(uval == 1) ? true : false/!!uval/ (Daniele)
>>> v3:
>>>    - Refine the commit message (Daniele)
>>>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Bit of a flyby comment here, but would it be better if this was
>> configfs rather than debugfs in case we wanted to skip this on the
>> first probe?
> Indeed. Configfs seems the best alternative for this. Otherwise
> by the time we get to have the debugfs, the fw was already
> attempted to get loaded at least once.

Don't want to skip fw load during probe, that's why used debugfs.

Regards,
Badal

>
>> Thanks,
>> Stuart
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c            | 41
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
>>>   3 files changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index d83cd6ed3fa8..d1f6f556efa2 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -226,6 +226,44 @@ static const struct file_operations
>>> atomic_svm_timeslice_ms_fops = {
>>>          .write = atomic_svm_timeslice_ms_set,
>>>   };
>>>   
>>> +static ssize_t disable_late_binding_show(struct file *f, char __user
>>> *ubuf,
>>> +                                        size_t size, loff_t *pos)
>>> +{
>>> +       struct xe_device *xe = file_inode(f)->i_private;
>>> +       struct xe_late_bind *late_bind = &xe->late_bind;
>>> +       char buf[32];
>>> +       int len;
>>> +
>>> +       len = scnprintf(buf, sizeof(buf), "%d\n", late_bind-
>>>> disable);
>>> +
>>> +       return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>> +}
>>> +
>>> +static ssize_t disable_late_binding_set(struct file *f, const char
>>> __user *ubuf,
>>> +                                       size_t size, loff_t *pos)
>>> +{
>>> +       struct xe_device *xe = file_inode(f)->i_private;
>>> +       struct xe_late_bind *late_bind = &xe->late_bind;
>>> +       u32 uval;
>>> +       ssize_t ret;
>>> +
>>> +       ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (uval > 1)
>>> +               return -EINVAL;
>>> +
>>> +       late_bind->disable = !!uval;
>>> +       return size;
>>> +}
>>> +
>>> +static const struct file_operations disable_late_binding_fops = {
>>> +       .owner = THIS_MODULE,
>>> +       .read = disable_late_binding_show,
>>> +       .write = disable_late_binding_set,
>>> +};
>>> +
>>>   void xe_debugfs_register(struct xe_device *xe)
>>>   {
>>>          struct ttm_device *bdev = &xe->ttm;
>>> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>          debugfs_create_file("atomic_svm_timeslice_ms", 0600, root,
>>> xe,
>>>                              &atomic_svm_timeslice_ms_fops);
>>>   
>>> +       debugfs_create_file("disable_late_binding", 0600, root, xe,
>>> +                           &disable_late_binding_fops);
>>> +
>>>          for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1;
>>> ++mem_type) {
>>>                  man = ttm_manager_type(bdev, mem_type);
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> index df43523e9043..88355adce1d0 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> @@ -167,6 +167,9 @@ int xe_late_bind_fw_load(struct xe_late_bind
>>> *late_bind)
>>>          if (!late_bind->component_added)
>>>                  return -ENODEV;
>>>   
>>> +       if (late_bind->disable)
>>> +               return 0;
>>> +
>>>          for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>>                  lbfw = &late_bind->late_bind_fw[fw_id];
>>>                  if (lbfw->payload) {
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> index 5c0574aff7b9..158dc1abe072 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>> @@ -65,6 +65,8 @@ struct xe_late_bind {
>>>          struct workqueue_struct *wq;
>>>          /** @component_added: whether the component has been added */
>>>          bool component_added;
>>> +       /** @disable: to block late binding reload during pm resume
>>> flow*/
>>> +       bool disable;
>>>   };
>>>   
>>>   #endif
