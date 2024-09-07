Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69289702E0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 17:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7210E009;
	Sat,  7 Sep 2024 15:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlK3+ntu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04AB10E009;
 Sat,  7 Sep 2024 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725721670; x=1757257670;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1sy6FuX7JVKghcbxejWWga9ZI4EY6X2C8RtdVIU9kPs=;
 b=XlK3+ntuUfAjv0+hcI6O9U1gI08e06+seO7nVaQI3aDbprkddVg9rObY
 /m+85ZXX/syrp36AZjWEn3OSoybpvErV3KxSTEKEtn+/PrV7UDjz2aezM
 ZK7spj+Fv5YyWI7hGNCrtwckf5nAGsDny8KgotxRcSG3bWfxJcai8Py1R
 NsRogNjjaM5SskrxOQxb++HJpAU/iAylploI2KI+bvauqOVDFUehzFl4H
 3s93gXx4gPG15SJelUsMXKR5PaSRV8nqH2f7kBeT72hjb3IoUW4kqlKcN
 LNFyNEycp6CkHOlCVII7XNEKYNt0wCeErwwga6c0OGapUhd2hqG7AjrNe g==;
X-CSE-ConnectionGUID: Jnp1LIj5QuqWdQC+fzwyDA==
X-CSE-MsgGUID: Bwn2TwYxTemOXmu3iTuDEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24017608"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="24017608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 08:07:49 -0700
X-CSE-ConnectionGUID: sAkXxK1XR7qnzKUHUrI6ZA==
X-CSE-MsgGUID: 4ysVJrEdS4SurTMfyBo1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="70626080"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 08:07:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 08:07:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 08:07:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 08:07:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 08:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUQumvfN9lwc+PEjXth5dfGxJk1mtjpMB+PCMQdbRATOzcIz0KGPlI9C8Ton6CLd3SHht9YGT0H7/Na5QeV83l0jd0zhJ8KITsLg1L0JFH70Pm+jmhq79DnvtoJbnC1t+zhh9aJhG3tBMBNL5e4SioH//Y3lG3ZPoBYxy47S0456JWn+moh+58ngbjhkd6nb/1yx8Mft0cMsIcpxEj9+Xrtk1tf2PF0sxEMrwgKfXTIXuObVxEem7Jp5aI0D0MwAAc6ajmnjbPzxTVVk2WG8/xwjYqI5v5CpdmUvabjL2Kk6sC8nwcDXvmoz3ZWWLx8ANXsSh7gzFZBhsiOTdQVqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sy6FuX7JVKghcbxejWWga9ZI4EY6X2C8RtdVIU9kPs=;
 b=mluKNUoisxlotphOqOhxrFGBWaeygGHsO83I3rBm91ySDfHHmE5XGwk5HGrteLx2olT0c55+ymfskzgmI82kG7eYmJuK+pLb14SThMntkkCmvrTbdlnO3eOvIkZJFFTtzcif+IH67eubFiivPHYMkZlWZnOp3chq/m2WcbOdrNr3UirqYd8prfNvRfZwxDhrbtYCWmw0WwJrUVFN6leQBGuvOULPpbKPeuCqDaUPMYcQO9eUkW0MZe4Me8wKkNjoSA4ePxuIlo2m+ePzAsK3XmyuCTmkiKxz2tJR4X4zxbjc1V9MqOcN9eBy0dWThMYecKzXIR8lyFLPKrsgOjXW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sat, 7 Sep
 2024 15:07:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Sat, 7 Sep 2024
 15:07:45 +0000
Date: Sat, 7 Sep 2024 10:07:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Asahi Lina <lina@asahilina.net>
CC: Raag Jadav <raag.jadav@intel.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, 
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c40439-7133-40a4-a56b-08dccf4ed402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3LqJ5qlgKLU3Mi0W78g2GDvQ0uBwCfPdUyokWXNl8uUepdmwqsbqEANUsOqK?=
 =?us-ascii?Q?y2Pux8fQfSUssPQxNGoLzjTGhvQjB8fo7ysw+MNrl6EqfrkE8opjfmnzsk3i?=
 =?us-ascii?Q?6ARV9WKFtQ+XPLnOO8g+fhqf0pZjAU4wNdXwV5Snw3oxqfSoBzpmCG5hdKHP?=
 =?us-ascii?Q?epNYsRg4TD+t/qP3Rx5BV9GSlCvHup286t5dh02png3gPT1PMdjJPRN4HcqY?=
 =?us-ascii?Q?I/qpAnCTC54b6nco2hU5vkhzrFHuM43kI+fTtDq1WPeJ789rAEtQlmtzguUm?=
 =?us-ascii?Q?tikmOVf6whf3NZo033or3rUTVLDu64ObSQpX7fPltOvzHvJcWxDMMRS2ZqDD?=
 =?us-ascii?Q?Dp90shmcUkYsz3CyL45sQxUb6iwPgEyl8ZB7IKzCqJ3slC/rUlvadn534Flo?=
 =?us-ascii?Q?HxK/JrabCIosxyUpp1D/NEBsKMJQ+baXdqmvgaSgwLbxmv87memldwzfyQYY?=
 =?us-ascii?Q?EfxlipxCB5e/HY5w5uM0d0oFnTvpFMTsC+1Bgr/muwe2hvEmAVWe5+BZQ5Bn?=
 =?us-ascii?Q?/OR3B3FO2fL25jVWvVG7gM6MKSeiP+Gryw3YfirBGliqYxbyzxDWFXwKOqHX?=
 =?us-ascii?Q?lBpk5Yb12dLkkXEBVzjptuarO3Bxi2OyyBX8lP1g7FpGgNHdHiYdfUgtfnTl?=
 =?us-ascii?Q?XitDR0n10xHgZo3FgwrWgAofKLFDJMlmxzFJR8JoK7gJykgvOm63woRCieBq?=
 =?us-ascii?Q?DOmZSPmS1CyTcoPZCdOYYmim8uNoNV8MfUV7JlVDi2WilaRy3uwfSdK3J8Rq?=
 =?us-ascii?Q?gkRk58k2/gQk3hCxxF5qIRCrb/W/MiYPOmbJhFY6JY69k9i35muN1TKiRWyV?=
 =?us-ascii?Q?JaJ1wNEJHMGi0KyznH0mIALCz9Yb6p9nuxj4MuLun75WzZvJTYQjd/GL6Mh4?=
 =?us-ascii?Q?392NyOz6vzKV1w8fqLAhRXngYTtaftIJScd2xjYvHsq4Rr3jgpwBIQzaAFCy?=
 =?us-ascii?Q?MfklgZQrH4WZGY96sjOphbv6cXCcGb47koZz3LjxHWML0+RqjOj9rxyEvaVD?=
 =?us-ascii?Q?ZtnG+SD20tilXnPdZffjXcB0njapik7CQLa9hubTeQJ5z04kf65bBatFx4B8?=
 =?us-ascii?Q?3ufN3WjjCAhUEed9P1RYaq6ll1zz8UjWXcTmfIAMdJJ1m2lA04EQcSyxjq/f?=
 =?us-ascii?Q?dnqL7VmOrWmwqJcIA8kCrT5hesWEhwHBQWhsY/tlBzeGYaN7Xc4v0Z22xczV?=
 =?us-ascii?Q?TN1/nXiOMbFV3MSPQNCWahzugFkJOQxlphr3gXNEh2HcIfKpZQpAfhCYniq2?=
 =?us-ascii?Q?oXEImkyOkkU0fJhK+laH+mApBs/GDrrz6/zeKFfKL/Kox6ufbzo73pjPNqpw?=
 =?us-ascii?Q?YWh/eQAhzmk98z7RqD3lYZh7nRlQs+ygItTIzThZ613bmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HUtzCB9A6kRi6pyrpt9RcvufUDk0JjcFbcxD6H8+S9eqXZcaB++x4IcSAVs1?=
 =?us-ascii?Q?wlqcCXguvWytD/MlZ0awzCnV+jYzfSullf7NGuNdxVEucWYYWhIsx+aafeUB?=
 =?us-ascii?Q?0pKxghqeCTHuCPXDFWXwQxIMGXC7TslHGKhu7LcalEJO+1bEKEbPZdUt2kDv?=
 =?us-ascii?Q?EDUh6KhuWvLyrpnwmjd41g0eNII9qR1C80QktJB+oFQyTA+N7kjcAUmoAr0L?=
 =?us-ascii?Q?NWTCEPY4ULvU3iA1EC2vJk1T7UEM/ddao/VU3f4cvurMRmPd7lzyB6eLb/je?=
 =?us-ascii?Q?oBemYNol4O8HH+mzrrbCqeY6RojVHOXoPlP3pJfasfLppgukoVGfk6ncQ+Jj?=
 =?us-ascii?Q?7tU3bAFe9hcabeTa2ph+TJ0nj3vOjf2RfEFVJQCw1GRWjfjMzbe+A+HmG80i?=
 =?us-ascii?Q?tRi5gsBo1/aCn0N5k9WfzS+b2mvfpigzPY1Ydaq35HcQj/l7JIyATbr9dIqK?=
 =?us-ascii?Q?oC2DTqloHmAvcaZCR2G60051eF6f4FO6jsh3YUycXMcJU1WuVWAH8jjV1Se5?=
 =?us-ascii?Q?GYiX0n5BUm2iJdVN0bbgbQBsPjgb2xJ67dm8JSptQZTTgUWKSSB+Qy6/Me5i?=
 =?us-ascii?Q?KV4glYbOA78nArbQIxWBqxisv4ZbZC0A0+r/JIt3mBhu7myr6dfv91mnRUva?=
 =?us-ascii?Q?cGQdNzMU7f92l8S9Hdpgipv+ki3Nq2e6CaZUfJxAzQzXQ897ytI0J2/akOZF?=
 =?us-ascii?Q?8bSRVgY2ldh2jZsehBa2JXgial99xXueXYRyktUxKZyT/6zpl6lP5Yun86KJ?=
 =?us-ascii?Q?OoTK484hx52iYumRH7TohPBac2dfVmjSPyDakaQNF/CYG1H5ONb9yIuT7ash?=
 =?us-ascii?Q?g3T0omaQvY9tPInj/QrJI0t5SwSuJ2paCA/CCm8e9E7Wvxnox6NnILSiJUcd?=
 =?us-ascii?Q?/nLA9E0XF1V9DXKKLJD5FzuQFHD4Lnq0uXDyiNcv/yKMqY+Z0tFi//eGoN2i?=
 =?us-ascii?Q?rE1az7NoQyzcZwAOO3aJn6IU6eVf5eK+F8VUvWhiIV8xaSEGmOq+6ve2FgdL?=
 =?us-ascii?Q?f8E2rCdCej92gyE8i3ODpHKt+o+v+pllEFb3Ep98RRoSO9+6zgqDZUkRue5q?=
 =?us-ascii?Q?AWbciqQ+nhZkkVcKSRD3M0RWjNlGAkGlC1X+I3P37ADedQ5+sAUMpLsPKn2g?=
 =?us-ascii?Q?lla8feayaSrqQMnJm6T6ES2lswd0lzC/rP3sfMdoXYs2sM5M8NofY7LiUN9Q?=
 =?us-ascii?Q?qA+K+7+9q+hLJ7p6kWHOqld+ayfVr3gLwfAg8Gf5LQg3JFjrIpZLJTYLzh2d?=
 =?us-ascii?Q?GKRCNb+sKVLXUYbyqASaaLphckWwWacmGWeXAuu15t7zUMAyhkpdl1NrHhHr?=
 =?us-ascii?Q?COtfCnYEqsfdAEclQzdLLmOIa3Ivso0o6QZWTmymdxu07nMS2WTkI2tR921I?=
 =?us-ascii?Q?5qEi2uBCpQ7Ph2GICjsV0Vk2tBGsJ7yxiCKfi31kWl9SQ2kBx/spkppcL2nr?=
 =?us-ascii?Q?G9VW4T6zuSgz+R5jtYrUdHnmqJ1mxqPnJYlK3stBgw3TIENrdR2y6BBjzA8M?=
 =?us-ascii?Q?vfgPnouzRuw9cl/WikP9VR4aGLCV2MscboSKJof5gJtkuszYYhPeFc35g+mZ?=
 =?us-ascii?Q?Unr8xyiZMJI1Vd5AYRdojQMjvIR2cEQSFCnoeAEmde6ZdMmM27xnlRfr90BF?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c40439-7133-40a4-a56b-08dccf4ed402
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 15:07:45.3020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Woh0doFtnLlQjnWky34Juk8oLckxM/pMXgo93K3+q9e+RRKfR/9+gwnHXMTaVT07nVGrvTPx+wfZlkyEOUgY0WJdBZzj1KOCqtAzu+Jvt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
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

On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
>
>
>On 9/6/24 6:42 PM, Raag Jadav wrote:
>> Introduce device wedged event, which will notify userspace of wedged
>> (hanged/unusable) state of the DRM device through a uevent. This is
>> useful especially in cases where the device is in unrecoverable state
>> and requires userspace intervention for recovery.
>>
>> Purpose of this implementation is to be vendor agnostic. Userspace
>> consumers (sysadmin) can define udev rules to parse this event and
>> take respective action to recover the device.
>>
>> Consumer expectations:
>> ----------------------
>> 1) Unbind driver
>> 2) Reset bus device
>> 3) Re-bind driver
>
>Is this supposed to be normative? For drm/asahi we have a "wedged"
>concept (firmware crashed), but the only possible recovery action is a
>full system reboot (which might still be desirable to allow userspace to
>trigger automatically in some scenarios) since there is no bus-level
>reset and no firmware reload possible.

maybe let drivers hint possible/supported recovery mechanisms and then
sysadmin chooses what to do?

Lucas De Marchi
