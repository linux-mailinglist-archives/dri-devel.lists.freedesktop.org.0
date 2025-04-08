Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09033A80E71
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5427910E6CB;
	Tue,  8 Apr 2025 14:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpxR4GZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924E10E6CB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744123166; x=1775659166;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vL6gwxkGT248ZzLnDaH63q8t2n9LnEmSloQHNNZrfrk=;
 b=fpxR4GZnlgxkYLDxBgsBKF6EackS2EqCfdniyyMhat516yDrl8E0DU/I
 HsMwaWDjPZSq0Qz9JGf3MAeFICT3BijcleBBSQNmznMkobnoCV/QvkkQd
 /XkAsKApJAqK+WyV/ZJxXtlAhXMLgyn39dG5MBfrIn/7ISi4Q1uPUOBzK
 zzPaQLOg/i06z1PdAUKfHyNGH7CDpOBY1Ntf/JTsACaj7VoKpjutLxbBX
 gkEMKBcUoyGOENq3kzIuWXt1Df6sFTVFznndgVXbWLdqXtULb75J2OH2y
 Obfzy6AXJi9I5sfSl4owHU9h9Nyz9zYfZt0uDO/Q+fBsqobwtnH8wikMH g==;
X-CSE-ConnectionGUID: 7J0I4LULT7S4PPr4txv1xA==
X-CSE-MsgGUID: LR5aubenQ4qoLDZ2ksLHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45680214"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45680214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:39:21 -0700
X-CSE-ConnectionGUID: mJCFLzzHRvuGLkTGW0Esng==
X-CSE-MsgGUID: bbeRT4IxTdWgDfChwbRXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="159290692"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:39:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 07:39:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 07:39:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjE2yuXWQxsI0fQ5cJmxQhBXEuFrrUbXC3zl4Zdzo68ROFlKvMr1JwwopHlX60CYoDkJrOBZ8zkIYHqoGjpDdWmPCNY+fjVdaQULwImceK9CUisZzYy+VYCosf6GnmW3JpneSkyeJevjtYBjnJEcY3obXT32hU1KO5qBT+WlXxk+3Zj+ZJAxkW92Ap9LT73+XXFwEM8kaTxyCoO2ztxh9HC/YaxksyEfdVSnLFW7bHM8D6GCHKOLExWO6OvJuKD88+nEgCRfxrlz9lwqPsFXkNNtvk3ND4Dp8p/MsmAOLD00V7mcfbabqwal6MIEam9rLHdvk3JtkH/Vr9C8GNDOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL6gwxkGT248ZzLnDaH63q8t2n9LnEmSloQHNNZrfrk=;
 b=KhoKluVD/xf8W/01+16I2CulrTR3uwSilqQ57oFkN6TLXYAcUCsoXIsfxJusc2DDFbT/fue8jReYaUCfnw+vq3hHAUeVJ+HsgaYQ5sNvng/Qn9ZUqvPyEtEAO7vtQL5gwG0Ml2A8WnhcJK8spBEUWVlMH1nBeGYNHvYOMOCKtQMGGgOgOuyWXJDrOFsYwul5YflZuJNe5ytyYWTyj5tilciHMAAkoCqd0QU+MsMFYhDNpfUiALUiXm6AgHyYjqW0HXE/FoJpbQFXvfYjyTBJ05yKRBcjV3OosAqpSek8l4OGhpt9ILu9gq2VCMoRr5q2JICbxnMfDttU178mo7Mhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 14:38:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:38:32 +0000
Date: Tue, 8 Apr 2025 09:38:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Anusha Srivatsa
 <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj
 <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <atwyoik3h7d75lpvgfzxeix654az74qpy64h5cfyjklvfquvz5@vceiiwsmxzvw>
References: <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
 <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87o6x6yd5u.fsf@intel.com>
 <4ixxpk4shsva6ryut4vdvbsafuefpwhiydzb7f5gky2sbl7mkv@4nrigdhvz3z2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4ixxpk4shsva6ryut4vdvbsafuefpwhiydzb7f5gky2sbl7mkv@4nrigdhvz3z2>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1103a523-7fce-4370-901a-08dd76ab090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SHsk2+MtzGdYTvE6x0MKO3YTzngV5dogQcfWhJcCfAhQoKC7nnu4rUjYw0sN?=
 =?us-ascii?Q?Lo+PnBCYJr31Z/yF4RotzG3pj3CJIUMhvekXNLJZRUtOaR5BLB8yGmkSYFOB?=
 =?us-ascii?Q?DSo+DwE7OwtwMogT7CpZFt9PXwag7wK69JMh7NxGSsR3la6BRKGy6GaYnFGX?=
 =?us-ascii?Q?GUXZ3BlSTpHVhcIHcnJ5Q1vwMLbslwQdFf6plRXOmMLGfxFFGcXLjspiWx6A?=
 =?us-ascii?Q?M3HdJ0reeUjlpx4Kl3uSwQuePC/DJJMq6fDu78SQjf9yclyXvNw9Xus15Fya?=
 =?us-ascii?Q?5IOblWGgYLXLGi+ZlhiztQ1T8neoHVnfF4DO714QqQMYNFKVcDer1CG3IHb7?=
 =?us-ascii?Q?aSsOQH6+NGKdj3IKri0dnbLbPHYCfFqI8A0KZ4UKgaOm7Gj5zulUAoI4xRFh?=
 =?us-ascii?Q?fumCaNCK1oVwqx87y/InEBbdQgickmob3JZ+GeRCr0g6/7CR36amyUHrO5y/?=
 =?us-ascii?Q?NkPQM2OnbxMXY5dZBxj1r2ehhkfh0wVmp570Q8dA3+HRkbPZUsuMNYV0OaS4?=
 =?us-ascii?Q?ZABgqK6+pToaYkAswg/twH9G4JZbdPUIyF/MPGauxtzcNkVK6Mo5/JXCnlb6?=
 =?us-ascii?Q?82nf7lyDFFbeKoztpMQ8jGmLKOYglzqr8eaiQMnuOJdZ/nTSw5s+CIeW03nF?=
 =?us-ascii?Q?jtE5Ag8rxj5hC5FYmSfdumGxTeSYqXu/6GxHj4tckMsgZTi9Q1SG5SlHnO/d?=
 =?us-ascii?Q?GfjqYH9dYSItU6RpKrgB+a+Mq4KRPmkHrlpuN6WzTqJi2UdyuuToaY9fp/8H?=
 =?us-ascii?Q?N9SEALQzGbGmHuiT8Rki38+Z/iVZjLcU57aduLo2yoC3VVd1bcVy1mJC/4vR?=
 =?us-ascii?Q?qNhIHL1BFdzGQh0IW1uphmErMSlhrtXHEB4b7UhE4M71omiK2R2K3Q+l9y+4?=
 =?us-ascii?Q?9OIgla3lsRoB0VI3pwm6/irTBQYk/NzWpc1SYgUDkoRGRQZIYSabd/OemBIQ?=
 =?us-ascii?Q?9rMEcf1LaPJYM3rFsFqUeqS+jwPePNwmhvdvnJb+Z2Wy0XOikNB5wHxB1wEn?=
 =?us-ascii?Q?aDnmLnq4hf00zJ3STe8PYDj3egIKSdYZEP2WRbNju85rBU27gQ45zvBjzq6z?=
 =?us-ascii?Q?vhxj2snjvuDblUdI/gIpxO4+p1EqqKQFezlywVJH7ZIEszBmvddPMdTxPtpF?=
 =?us-ascii?Q?fxem47jQYgXBmlliCp31LPxC43NTuIipIOjba7u1CXBGIYTMareF8TQeYIct?=
 =?us-ascii?Q?/FlXaAVOJBtrUoupQ8+r1sLVyCoGLrQak51RTQGVNRVZAN/vfMRsj64jHbYD?=
 =?us-ascii?Q?vJULZdRVu4+Cwipr4bL9383GQJZeBQT3ai13NmpFk4GFAp7qa2voGjOG9P24?=
 =?us-ascii?Q?V2N4vke0UfxcMZKbbS3b8QPN+b8PhvTK4yC7Q67k5JK1kI9e80QbE1lpy6xM?=
 =?us-ascii?Q?s4KpSoHYspeXDeV9feZybRR4swvx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRtP78Du+01iwDi/uwzyl0Au4ztjhlYyVwMQlV7JXxH73WHYaglEc5Ijx9Pj?=
 =?us-ascii?Q?13wytMKs7wxPxu/ca9B2yO3JURjpVse0UI8FLHJTr4QHSRiiI8cmmLRxlCiy?=
 =?us-ascii?Q?33y7av0voSTKJ2j3tSn82EARCXNLUEFulFutbCpKxlPBtlV+IxiDE16ph2kp?=
 =?us-ascii?Q?B2Lta6ZclbaxjFoIO3YVKsITaek4/lvEJehENBXBobfYN02OHPxyMKOOFX9W?=
 =?us-ascii?Q?TFao91BsdcabKeiXSbVbF2jAnakMYDcAe3lWY3UaIR1GLK925uThrfY+qtCt?=
 =?us-ascii?Q?zaS3tXvkk54W1pFV8dr3X8HTrsuoXGZtUW1yPRlCezC6cB52ghM91l4ieD/Q?=
 =?us-ascii?Q?jcP8EyJRiIzHm5WnahZ8ZPIFTr5MpsubJj5s3Xm4U8CvR8QMNs5FkWsvPunp?=
 =?us-ascii?Q?DxnVx+iV79kjcS6tEAvUzd7WwAXjyfQbGWuU1Fss0ecUIMrxqnNUF6ZmNz3W?=
 =?us-ascii?Q?aYwMn0+S49V8GWj/lXibznq9/TxW6zr24SQ6aH8KRtTp4W2mkvyrbm5Qu2Jh?=
 =?us-ascii?Q?RVKwfciRbtGUgsWUmuIc8c+KY/dTeIep4DdxbA2FSzfzrg6M3pZd09nwFvfY?=
 =?us-ascii?Q?9r6Ee+rOAtrKgQhruMN5MeGh1cl6PpeAN9M3mfqqPIAZgT5eqHVFexmh1SGA?=
 =?us-ascii?Q?BIWjyp0lEjaOlyNzmJd1T+7ffOj79jDSSqa0QRbixTWRDStCk5acFLv+8+q4?=
 =?us-ascii?Q?S/YLdIygkrFuyDiJ1g9h/zeR/Yns6UIfIBpxfTcgOpYoc1j5LyWlYYFfBLUB?=
 =?us-ascii?Q?SQGKq0KFCTqYFELTrJ81KuIc+QnK0P6geFiktNVxxy17sMtOgonLh/1KMVij?=
 =?us-ascii?Q?Cls+W8mBVs4m4op88Bwy4hxI+3Uta1rpm8FpzLSOw/Te59dFQyna1tUZOPLk?=
 =?us-ascii?Q?RyVh/CESi5Qnl9DnmBq69r+jbF908PD+V8VrsssEZN0I7QA9Cg1yeRrFK8KP?=
 =?us-ascii?Q?vm4g+VadGbgux+1eM1Ao4z3ZvcQaW0qNMMtF2g+yXJSdVOxisXSDJHsKsG/g?=
 =?us-ascii?Q?wi/xc65JZwkq98KvMQ69gZPNM+rro6VtFLeLo7o9vikIrJnl5OGJwNt9bgay?=
 =?us-ascii?Q?xIgzt9Qee3zzrhpjO0sMCSfI1jckIooYwctT8JVgUDtB+cRPY+TNP31ep+lF?=
 =?us-ascii?Q?mCWneSxZg854zdnTLu/6BoDUyGT4BcmUtZ4BsrOUKXPr65ML9rIrWSHD1AnK?=
 =?us-ascii?Q?CnL0xevlm/SRn+9847gIdsxqEszeqw/UBrizvOnAhmwPudPrjqX7mMFZlIdt?=
 =?us-ascii?Q?okOz4gXq78t1fJoLOn4Zkj0+BBLn/J9hJH8I1jW/Zd4Y3wln3P5ZEMVxYQ9Q?=
 =?us-ascii?Q?CFKZGxRTxKgYjjIdUH7gdbcMrLVB09dxyNfo/4dwWMonk7+1XkmssYY2YhSw?=
 =?us-ascii?Q?KQbKQHHkPvLXDDRdT7zB0Dtmn2luJPSoHkwO4wG9ZyXqiTACGI7LiuWfqQLK?=
 =?us-ascii?Q?4B3nijYKnLdkCs4E/zUfU9NWnfiWWW7YCCapNU3aWWNMnfcp/FZkIZRCtGsG?=
 =?us-ascii?Q?CPMaBZQexhgMdSHbfRk1kKmp4C0F0SqyUI5tREZtHg6UDrxFH6jexnY02ah1?=
 =?us-ascii?Q?jvlBESRtlDl528/yEhTSQGb3Lp6Z7ngWsbiIVQKPAGG7T4FZxOlt2KH1/tL/?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1103a523-7fce-4370-901a-08dd76ab090b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:38:32.2337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkfqvlWwZlSmrupuD455u98utvJ5XJT7YJ5Q4+okAZtYBqbr7w2z2IWI4AJKmDKm5ol+SbynrXT4wMxGwJNYHW8Jyp2N5qjcE73Vc4OWcKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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

On Tue, Apr 08, 2025 at 05:26:27PM +0300, Dmitry Baryshkov wrote:
>On Tue, Apr 08, 2025 at 04:51:25PM +0300, Jani Nikula wrote:
>> On Tue, 08 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>> >> > We will need more changes than fixing the variable names.
>> >> >
>> >> > I get this error
>> >> >
>> >> > ERROR: modpost: "__devm_drm_panel_alloc"
>> >> [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
>> >> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>> >> > make[1]: ***
>> >> > [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:
>> >> modpost]
>> >> > Error 2
>> >> > make: *** [Makefile:248: __sub-make] Error 2
>> >> >
>> >> > after making the following change.
>> >>
>> >> I couldn't reproduce this one on current drm-misc-next with arm64 and
>> >> x86 allmodconfig. Could you share your configuration?
>> >>
>> >
>> > Here is the config that our CI uses
>> >
>> > https://gitlab.freedesktop.org/drm/xe/ci/-/raw/main/kernel/kconfig
>>
>> There's
>>
>> CONFIG_DRM_PANEL=y
>> # CONFIG_OF is not set
>>
>> but __devm_drm_panel_alloc is inside #ifdef CONFIG_OF. I don't know that
>> it should be.
>>
>> There are some stubs in drm_panel.h for !CONFIG_OF but not this one.
>>
>> Finally, DRM_PANEL_AUO_A030JTN01 does not depend on OF.
>>
>>
>> That's the issue, but I don't know what the correct fix would be.
>
>I'l send a patch.

I wish I had seen this thread before the patch series mentioned in IRC
to fix it. The additional patch needed is probably something like in
https://lore.kernel.org/dri-devel/nyrjnvctqnk6f3x5q7rlmy5nb7iopoti56pgh43zqknici5ms4@cibpldh7epra/

?

Lucas De Marchi
