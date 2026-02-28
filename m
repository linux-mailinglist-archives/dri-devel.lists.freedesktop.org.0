Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F9UNd6Oomk04AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:44:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457361C09D6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6BB10E219;
	Sat, 28 Feb 2026 06:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJ2Y1rBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453AF10E20C;
 Sat, 28 Feb 2026 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772261081; x=1803797081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m9fRWaI1UemAaV0Xa9COFGDnnmiMzemnzkg+RWoQsIM=;
 b=jJ2Y1rBYU7W8Qnb7Zvilc6TC/xVpTiIaJ1vIhvJJVZitNFlEHAhGdkDP
 +Pwafw00rzuYhmX+LfkVy12Ck//x+crQDDnZNwugkbL6c6oA9JAfY9yPc
 uCi0SCLmAr4OfMkO3spgsLLUwZrOXAiG6CmpC+il8/7ZYkh7X7lHZeUez
 Zm/nyoBbagNFiv3oIeKpFZUQ63Dsxd4zGLh8F6NsFonzZlW6dldNjED6j
 gQXlXUTROmn9Rij2V86UUyokK1+qR8Ax8DkGEVjDwXQfonmX6LYR2jdOZ
 dnk7bu8PtLrzl5UWKc3Ly+HOeDncV33eiXfNe/8z24M9zVwO4+1b1S0nL A==;
X-CSE-ConnectionGUID: /eKhwsYBR06FC7sK8h2shA==
X-CSE-MsgGUID: dQYt5r3GTxypPBBw6bQEyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73450322"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73450322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:44:40 -0800
X-CSE-ConnectionGUID: ay8JhoGIQNy2FNKq3EUQHA==
X-CSE-MsgGUID: QIJoRQQATMi/9rbPmfiHIQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:44:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:44:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 22:44:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSXU5F+CyWOLZqKpaLLpJ22WnhH4dkSEUJHcUkDz2OE/CvdOp58+Xw7zoHiNIw9BoS3kPGZh4F2xhVH++/9tfcp3f2rNP13MlQUygiCyg1rRTwlvzg+48Z5nYMBmZIb5HBu6pu6EtCgKD+Hlw6h/ieAmDlfA9P32HAvHTixdyLubFye0Gg7uiSOvuORzEb0X0zSK8w6AnA6NoQYW0MwmT2//uqvxMKuRm2pVj/E9qSXcK5Wi2uQNthG/UsgCUHHxkN0DCPSyTnbamIBemfpSMcWyU/9/5+BTN0POiS7kbGqXIFSglx2E2M6V5jcyf6k3aX5ULsWpdZJlNaZYgwG9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5HzBui0sVLsdbiboiaZCL0jcEXaehm9C7aiMZ1oEyg=;
 b=GsAolB/aohE2If9Umxbduf6JtRLf3upZNCa4yxN94AYbehzm6/oPvS/NaEOi1Uepik0wNEggmjlgdXDtvXO38o3ut65XI3aVVh5NFbQ425nlG2sRRiIXFSHPf57Vx8IpGcMikYGgvFjc1HhbERqDyQOu+qdHNoIOCXuv0ISsVZt4UtCdaZcYlmY9E/fzumD5zU8b87UCkTAvd0mr1D6mLbISFwpPGOPMeVpmILuWq0ueRvIA4pp92yAfixgWl4sJnYirq0/WKk371ln2GUVvumo1v7sNOzsq4kUN4nRClJ8t/5950Gu9IP6AAgGnxLshaPQbhGTx0peZxSbaOCOLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:44:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:44:36 +0000
Message-ID: <43a08974-fb35-47a5-b77d-f14e284aea98@intel.com>
Date: Sat, 28 Feb 2026 12:14:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Jakub Kicinski <kuba@kernel.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <anvesh.bakwad@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
 <20260224162203.279f7b74@kernel.org>
 <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
 <20260225161857.55fd4ba4@kernel.org>
 <53fc3f6f-b5b6-4ec6-9468-3cd668efb070@intel.com>
 <20260226070509.2c7346b3@kernel.org>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260226070509.2c7346b3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401f7d5-fbd4-4ec3-d29a-08de7694d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 3U2vSQx+sdqB5JWwdVTKUfvf7sFlziYE9S71lpC3AhwHdGw31EidcZYjh/NkSFci0LuN2xx+VPAl3N5j5kaCihd+Z7TybrAMI8vf4UeWJZusJgz2rKqMI7iRRHmymCkk7xZZCtTW0Xz/W+m2VtAyHDtHE4SIeuK50Syoj3GzcAf0hthfSZJyLbjaagNmu0Cqlp38POT0TOH4GRE1v/sA7wLkO+njEZJsnuqCzpjrvyW2ZLnt5P6O8PsbeMFTMy6Q0H9S1FhBAgcV3fP8J26m+2tugouHZQlUH/4mQ4SSN88/MyKRfPAfQ6NS1D+/9MBGtewYZwqLx06ThVItwSYAyylOxpz+g6m4Jkt7uNfaFpb4fobwJGZ9PtyjDNE4kSAoHzZzacbEj/nUoUihizMHkChgazE/AK/CmTWCc6yXpCZpCKL32QB4sFea3uLVq7pcJqJiTGK0mJyXLcU17VeWZYo5sZVR1Z3N3XgFZbvrHe9xgnp+FmYetiQQppLDwhgo6+l349bF1kcHDwIzOx4a5gmrD2xk6Mim+CSv1eD5lEZsBSNCqCkpGvV3xaxoxYyjWBdZH51qiS+RAKFi3rhKZ2bfar1Come1hxqF7lvKzyTNDwzHQIGqRBGxReGMz2xvy06g8dzLvwpBGDeJjWyZQzP6uts8tot5JRs/5Om3/su1B5ou/lPt13ewS+ss7rw5pGQmxgMhLJF4Z4Zuq/1QiQK3kwVVCrvEc9O1wivsJBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBaZFVqeHBzY3JNQ0xmL21VSUtTeUwrb0dGTHVySytHNzlWeXhubm5Pakhs?=
 =?utf-8?B?R2hsMmxtNTgwYVNUaENMdFdxUkJOOThaWlVrRnp1RDlocDFQZUQ4SjkwVmUz?=
 =?utf-8?B?L1NNc0k2TlZRdWN2cE1uZzh2Nm5RZjFBSVpaeUIvMk43RjZ2b29GdzNmWW1r?=
 =?utf-8?B?bHpmb3k4bUxhOHhIV0ZEc2o2S3VmbTQxSkVqY282ZG9pS2tGcHdnK2wzL091?=
 =?utf-8?B?dndYdVc0YkN5dW52OEx0dTR5TmV2Y2lXUlpvNGVUV1lVaEdJWEN0WWQ0SC9m?=
 =?utf-8?B?VVZOYkhtSURUTjUzdmY2NlNvbmZ1V2xiKzBPZUtHdXJCWmpiVXNwSHJ6Y2d0?=
 =?utf-8?B?UFhIWkFGVnBzS0JIRzVxYXhIQjBuY1d0aFZ6YWFIeXhEMXhhZytCamcvTTFz?=
 =?utf-8?B?MXhqZGpJUnRCMW9FMk5rSERHdHNMbnczVFhLei9ubDFmSVFMcVpXUFJNSFRL?=
 =?utf-8?B?NGxsWHJSaDI4c1NUMEk2RVBKSXBPV3VwN21WR3BuQzhmVklSSURMWk1vcEJG?=
 =?utf-8?B?UGVIVE02VUhDWVpxVzltVGdoQzVsU2tEeW5lOHY1NXltOTZlZTNLQUJ3Vk9z?=
 =?utf-8?B?dzhPcDI0dGw1T3NlZUV1L3R5WXh3bVJsR3pwUy80MmxKRm9ZL3ovcmQxN0pq?=
 =?utf-8?B?MXBLaWg3SmJYRG5sTmhINzhBSG5IYWJEb2t4aWxuWkgybjNvYzBxYjI0Vi9C?=
 =?utf-8?B?aFVxQ0s4MWJHbmJtWmduLzNyRDk0alBNVmZyelpPZ2hxNitGREtnNCtCSDNO?=
 =?utf-8?B?MnBCcUlDeUc0cklCa0p0RlVYQTJvZ2JGZDVpTmdwYVd5TXIxaFB3dGp4MExt?=
 =?utf-8?B?UHNDcEkzNVFCVE5QUDliSVV5OXgrMGdaYXU4eFBRMzhuZklST0I1cDVzajZt?=
 =?utf-8?B?N0I0RHcwMUlpR0dvTU1TWXVrR1RNc2ZSR2NIa3NJUlhwYlRqZE1OVnRYT2o4?=
 =?utf-8?B?T0Q5WWp4dzJQNE5yYTdESmlMQ0c5SlFGZzM4d09NUjdFdlhWNWNDZ29RZmZl?=
 =?utf-8?B?RjZ2Sk41SzFWaFh1SUlJZ1FsUGRINmcwVUFlWUp3WHViUXFLcHA2L3R2N3pa?=
 =?utf-8?B?dE1VcVRQdG1LdkZqZ01TbDh1TDE3UnhYUERzRkxKZnNuYjF6TWFHLzNaZkR3?=
 =?utf-8?B?b3c2V2ZTNTFHcnRWWTRNQ0NDYyt5Rk41S3c5eDZuWUJ6c1dBUmRGM0IreTZ4?=
 =?utf-8?B?QXdBY1dFTHQ3NTBDMy8vb2tGckc2cUtRTWh4amlJbTRvaW03bzk4RG5xSG02?=
 =?utf-8?B?ZHRQY08zdTJtYm9XdUNKK04ya1NMRnJZQjN5UWQ2ZzZLWlhMbUE3K3NBQ1py?=
 =?utf-8?B?R2o1bEdrRXA1WUx1NTU5bHR6OVdhZFZ1VHlBeWlrakxKWEZkSEZkOENPcWZl?=
 =?utf-8?B?L3Jxb3JiSGszZXJ5MTF5NVZxSW5NK1RnMmVYQXVSS1cwaTkydEtkdklhRDZN?=
 =?utf-8?B?bkdvRlN0clkwYTFaRC9vcndlQ0pBalJmOHpOdVNnY1U5S2xkOGVrcjE3Rmk0?=
 =?utf-8?B?blUvRis4aGNHdHJYc29PY0owcnM0bEVzM2xGZ3pvZDVuYWk5M3g5eWMrYWNa?=
 =?utf-8?B?ck5WZnBhN1lCbUgxcWUrNkZ1V3lYdEh1c284NE9LK1UveVhNV2FXN01idkQ0?=
 =?utf-8?B?QXVsR0M4NHZrOWVUcXNsdEFrc20renlTYXhrKzhBQlg5UVNGTXNtdVdOZk1p?=
 =?utf-8?B?K1FxK2ZPK2lhTmdaL2ExT2M4SHh5RWtvaTVJcko4UlVrNUkyY3lPZ001NVhh?=
 =?utf-8?B?YkpkMU9DUmxYczNsWlFuV2NkVFp2NjVtSnQrNmRXNlFtK1ZIbEJncFM5YVdU?=
 =?utf-8?B?dmhXTmdMZ1k5TVV5QkZWUGRjL09PL3BOZ2pDaGZVWmwwOWlNbGRBWWlFTFA0?=
 =?utf-8?B?YkFIMjhQdmxwM3ZtMXM2bWN0MkRNUzNXRG9JU3UyeVd4d2V4RlZXRDRYRHhW?=
 =?utf-8?B?cUFTSEorRTh3OThZSTIvZXkzeHViQ0pJbFRmMlJXbHNvdCsvZWM5dHhpaTcz?=
 =?utf-8?B?UDF0eGZHYkNyTks5Y09oVjJtdDhxNHh1Y3ZiQTFWOWZJSlRNWi93dVpUTThN?=
 =?utf-8?B?ZUMzb05VVFpFWHN2SmVha3BOdFgzOVR6ZG5wSkxLbTAvVkpScUViVmZtb1Rw?=
 =?utf-8?B?RStRdG5IWlhCTGJjSzVWM29lL21ZY3lFSHRzQmhhL3E5OXdUaHFwMDJqSnN0?=
 =?utf-8?B?S2ROQlR1ajdYeFpKbm5xeHVsVS9mS0pGTmxuMXp0aEp0cFA4MkpxRkRxd05r?=
 =?utf-8?B?MXIrTkREL2x5VnlwRGYzZG02RkxpaXUzZFN6bEhKWGpCQmV3VkhIOTQyT29w?=
 =?utf-8?B?elRIYmhSRUphdVV0TGU5cjJrUTZLWkZPSkxJcnI1YVRVZ2Q4TitkZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401f7d5-fbd4-4ec3-d29a-08de7694d6cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:44:36.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3AbcI7SOlPgM/tIahdm8KqEMyJyJcyZJ3SzKKC5gnUbglOVIJ+LQidNnr5TmZJeCLcPE66AWChBYEdHgdMwcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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
	FREEMAIL_CC(0.00)[intel.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,davemloft.net,redhat.com,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ynl-regen.sh:url,ynl_gen_c.py:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 457361C09D6
X-Rspamd-Action: no action



On 2/26/2026 8:35 PM, Jakub Kicinski wrote:
> On Thu, 26 Feb 2026 15:17:55 +0530 Riana Tauro wrote:
>>> Oh interesting.. that's technically supported but the regen script
>>> uses "-o $file --cmp-out" instead of "> $file". If we were to use
>>> a shell redirect we override the file each time which makes incremental
>>> kernel builds much larger.
>>
>> If i am using this for the first time (not every time). Shouldn't it
>> include the header file (#include "drm_ras_nl.h) too?
>>
>> tools/net/ynl/pyynl/ynl_gen_c.py --spec
>> Documentation/netlink/specs/drm_ras.yaml --mode kernel --source
>>
>> But i am seeing this include only when i regenerate using ynl-regen.sh.
>> Is it mandatory to regenerate after the initial use of the above command.
>>
>>>    
>>>> I used above commands to generate the initial files moving the
>>>> drm_ras_nl.h from include/ to drm layer.
>>>>
>>>> Even after that if i regen using tools/net/ynl/ynl-regen.sh -f
>>>> I see the above diff.
>>>>
>>>> Am i using the commands wrong or missing something?
>>>
>>> If you use the redirect the script doesn't know what the file name is
>>> so it gives up on adding the local header. If you really want to have
>>> the header under include we can just add an option for "--no-auto-hdr"
>>
>> No its not necessary to be in the include directory as it is used
>> internally by drm code.  @Rodrigo I will move this since this is used
>> only by drm_ras.c
>>
>> But even after i move it to drivers/gpu/drm/. The initial generation
>> using ynl_gen_c.py doesn't include this header even if the header was
>> generated first.
>>
>> The header is included only when i use ynl-regen. Is that expected?
> 
> As I explained above you should use the -o $file argument rather than
> a redirect of stdout.

This worked. Thanks a lot for the suggestion

I had tried this approach but i must have made some other mistake.
Maybe i tried with the existing file.


Thank you
Riana






