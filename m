Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D69ED6C8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC2410E61F;
	Wed, 11 Dec 2024 19:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOZiG4yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCEE10E61F;
 Wed, 11 Dec 2024 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733946597; x=1765482597;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YAiw0zOSA1yo0FeRtwLlOnX4/N9IZzolMUWyMCgB4t4=;
 b=BOZiG4yilKkefa2ulbZtjjsOTa5Myy4vSTagN5HRTGjP5edqkyOgBjT3
 P/imdc6kt8DgF6xP57zGhQCRr+Swwbf0BF/fumEfD/goPKNhTJHgPPcLf
 CmC0AhwkwJWKV8l896pgS1UQgMfkMYrCBUDKMuH8eoEp+7lERO8M92q4V
 kYb2YR/1lrjSDkLB/rq+O/SVUqXkpydirvvKIK3lzsi0rxk0iGK8Ak3en
 DaMA+wyI5vQzWjNGUoVzQRZ91PAkCPjXVl69eGlPwfMH4IKqp4k52jO79
 FJplvRV1Q5dQX6XoSL5BmkC2T1u/gwLyt1lKsa0Z+9OXsOuh94dIg04az Q==;
X-CSE-ConnectionGUID: WhD5wZ3eRUqJlb1QDhvkQQ==
X-CSE-MsgGUID: KRG1IdneTSK3vo6ETRLu0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="33661180"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="33661180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:49:56 -0800
X-CSE-ConnectionGUID: sAFjh73wTU++5BYrr1MZKw==
X-CSE-MsgGUID: wj3SLS1lTm243uxwE64j/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="96012333"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:49:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:49:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:49:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTu7L18WIerH4aBc7uO0upRwDomPxvZgBFNBCDI5MDcdPzJvfU/cKEYSKILy2VbgPqR9o6upoZGy3rdsHnN6RqNrze4gDDWvOJJnH+SivHaj3OYkUuNJlbhzUGKnInBYXuGVSciayKcUv8GovGb0kL1MjBdq5w9Oh1NkfIotNvN+VRMrv4zJF6XFNkBO3B+fD0UrGMXgzqnrFsUM28LAdcVYFBk595G5LiQZcTEWByKxZqoGJtWnj5zyYJ8ZYrUOXir0P/GXm3kLVF6B0gPepaLtz6ZZNcUp2cjkjji/rK1ATjPhMQmW9s+KY3zqPuWNE+IKWYEqogVj4ZpVnAbDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDdGtxTsR/xPxks0XeWeKac5yFF01K4ENRy6ck0i3ew=;
 b=e4AEsl2rsKSt2UYM8v+PMlIctoKXvpYd2CPcg4UJjrf7adNOjuSLSuZDmeOre21WgBy4Sw6+FbNCUNFopn9sJ2Rt1rS/j0G9w3ctxCIKRPxL+c8HHjoObsQvF3bpLHhRd0vqg5zbtt1TQwhXm1OPNeM5cNqfzkNoMMPkV/NQpiqjgwN6NY3VoHCgch90IW6Rz79r69orxB/c0aFLFGsdG8Ky490aiPnJNNaoheyfgoPuv7DxkjpeGFr3dffycMDeo2l8UtF8NFYfK34tbOdt6qGqLu9/ptmMtjFNLSQbM9NPb+SIHmZV19PFFdhWrFdC4acFSV4mI3tiAiErqLav7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 19:49:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:49:48 +0000
Date: Wed, 11 Dec 2024 11:50:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 27/29] drm/xe: Add modparam for SVM notifier size
Message-ID: <Z1ntBkOoGM0p7zx+@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-28-matthew.brost@intel.com>
 <45e985a890164b388ed4c2f431f51a49b79d24f3.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45e985a890164b388ed4c2f431f51a49b79d24f3.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: c01a1dcb-1e30-4d43-c366-08dd1a1cf857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?umRbdXvO0POmDGgSvFi6o8n2RN+4NGEMFMKevb9LihCvy8tTIozntBuVEc?=
 =?iso-8859-1?Q?/nQrPK+ryBMcbwfkIOadyGt0S/m8SNLb+IUoAKLqQri5ggO16OlrxMXVQW?=
 =?iso-8859-1?Q?jGPmv+1faCwfcE7u/oyAHiaDEk/HwciJsaj+pHaoIix7O+B/gzAFEXodDt?=
 =?iso-8859-1?Q?cx1UAYiewyDUzGAk13FZ4K773nrUv/zqNNiJ/pUmsbx4X1f1e6M9l+/ib+?=
 =?iso-8859-1?Q?EITCs16wC5DsbPVBNjWxdSla/uUd38haig7XzC7ECPCunt22ZRaURg/2MS?=
 =?iso-8859-1?Q?JsyfE/UjNi7Berjeex1TJSlQx//V6ny/Rp+csFzxjELBQY2eU977p+HzzL?=
 =?iso-8859-1?Q?YrBZG20IGl3JbkRAa+6gK/WX0uSLKFY/IZpIgjtplMeGZUuNw63rto2L4S?=
 =?iso-8859-1?Q?xNwl0gZEhojmWKAOsuY8I8vWTd7H2EztV67Kp5xd+o1I/UAV/qEL5TwN8O?=
 =?iso-8859-1?Q?12LCk3Wvdl9w8P60A9umV+DvyQPNlu91KkZWl02UqKKdJOeNKjnYoOcUqX?=
 =?iso-8859-1?Q?LTaknXOhZLWUMtS5uPVQilJsbfpFyyi7N6nTMy8S2957aP1X/maUzJv/3h?=
 =?iso-8859-1?Q?aYk5rtHxKGr88wo2jW56eZYjqelJwmb8ZtgtaViWNr/9vLeTEwljNuGQd/?=
 =?iso-8859-1?Q?g7OP/6lOMGufjMIFZ1pX+f83mWQrK/AA0IcFNsJ5qXm6IqNWCk6cuzzOCY?=
 =?iso-8859-1?Q?uiVevzqC6UP0iW1nxkWlz904BMWqmUF5iu62TwT37JNCQhgC4j9GY4KkQf?=
 =?iso-8859-1?Q?Pw4NoWOexJhJ9WZxovnHjy/s1VCiSVq0f6b47U36e0yLlk9uGtwLmRTuZn?=
 =?iso-8859-1?Q?wDb4zjY0ABmsExkZTtNN/bkIcHmUXRRAhNUHVLgTRSFLTX1Bcl9XvBmmir?=
 =?iso-8859-1?Q?pcvzYoTLK4cdvp89XdI+l3ttM7iMUAjWL6sUT8ICf+3VyQGa+zgkfdjgb0?=
 =?iso-8859-1?Q?NHTCL87em90yFE/M1syZjUnTy9hDaEiaorXtf4ILipErLPEkZ9G8P101cu?=
 =?iso-8859-1?Q?FGA84Nb972nfgzFq3cNOIsqGm6vAe9DPvOaCQadTZv2sk/LDva+bFnhhtu?=
 =?iso-8859-1?Q?nsk89kWoZtx5/pkjMOF3wD2Ran0Zfd0UDdU0dV201F/KTAkftgOOnvw06U?=
 =?iso-8859-1?Q?jmGiq6WtyYuiz63+rPODrCDfmxIiBiQVbvOMrzbmFHHLU1hUJsmKLzJcZv?=
 =?iso-8859-1?Q?mSyXvnT1l7HoJtQP8Bvkw7c6PCa0ahTx5KiulBTwot0tAYzoUI/B+ATpwR?=
 =?iso-8859-1?Q?Cx3/OppxZ7MKJCgEtlwtXye0N5YIIvXX6D4XbHMBIgbCwJ1jZmSf2fVjoE?=
 =?iso-8859-1?Q?LXkDYE+glI+mB3u84mZtjfn7/4PSzcshkLAezHC15JM1+59O2AHd1Ds1Ee?=
 =?iso-8859-1?Q?c2wCdGKXNEJzc0/YHVd8AOLbZBRXQNzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tjLQjWlWfaC8PlNdifXUFMw8qDsTCaU2Cs7+MW2P0Vp8r/rBQ9LkGuyBDF?=
 =?iso-8859-1?Q?FR9Wu77qB4Y+npCaMz5NlR9RI+F4mZ020sLM3lBBlOr3nbCEsuBcj6iO9N?=
 =?iso-8859-1?Q?ICYMixAm0OBKLpeRGFJQZCDYRDseAsv8a6pep6gH2QxV0RjV40DwDWIz6f?=
 =?iso-8859-1?Q?O+UhpVkI/pt4aNewMuLJbPnCcF8i2Fm/Kpzb0YuxfJDTZaaJwHqSh2/4ci?=
 =?iso-8859-1?Q?Ynr3x/EfDaLlAGBPN9MmrlvfQpXqtcOwKz+th/9BtJWbI2pvz10DacEwsE?=
 =?iso-8859-1?Q?0KU1m9ZJy0EA/p9go7gBGXrlxNGmMtusldVyWmDPIaYFJsPHn1rQ7ISXSg?=
 =?iso-8859-1?Q?vZ8pra81bt5O/PYBR+6FURX6LjNzT7XMwvqgotdGfXokO+2YbNyB0aVMV7?=
 =?iso-8859-1?Q?HKx5diC89YB9/5ok1Sr5SXIPav4Q8jTa1b2yFClHM6yTNA5lxO4fSM4t//?=
 =?iso-8859-1?Q?q9GBhaLd6EOAr0g1TPr1nxQKRzTEABt2RQs5AuhMyOAOhFyLbWP4jeU3GU?=
 =?iso-8859-1?Q?98mtZGI9pxApeA+gylMgEaD++BJJUCQsGv4PHV5m1VzrlsxLhVAoQ56RTF?=
 =?iso-8859-1?Q?jZKtV9QY/Pw3FSoo0QayhmqH69pDWbk0O/VG+vzSsIlA8E5Sem7FQSSxKW?=
 =?iso-8859-1?Q?xoU4WmU4h8B9s+MzYDqT2+Me9wReVxJ6pCjP5xiz1/MjKju9SxY/R+3wPG?=
 =?iso-8859-1?Q?+XQiZRDV+OerxuAwBS+zqcqUWnH6uoKwAuziKWIDl0mzFNwIbd4j+Cm/Q/?=
 =?iso-8859-1?Q?KOYmb+qLQvOPdg+GztJHJFwBOueWS+8ejV+7RIFFTGYIstpS0Iogecd2Sv?=
 =?iso-8859-1?Q?DHVUE8G9t6ZEy6Sk3G4TBJPuHrczDUBTuDsafXtjZ9F0RkvJo+N3Xwi6sE?=
 =?iso-8859-1?Q?A7Yr66NaeupxOz88AgrkZKHloKZc7JR7OkGfh9tBCQrCZ6ObRb9BZGwLMd?=
 =?iso-8859-1?Q?hRgjZft/fTIR2x0lTfDle1O4+X9s8XYvKaq1fuMjCCybcGs7KThI9W2sqz?=
 =?iso-8859-1?Q?rUDbujoCtQB4AJNteaMJ5BTTcjOGwVKFAPomXDiWjuO/WM31pL0PUUF8yp?=
 =?iso-8859-1?Q?2L51C8H34XOJ2FMTNrVKVZddZGswCTzgwrMhITMERZ6B3F5dxOmHs7LS25?=
 =?iso-8859-1?Q?r2SUWlbNkY0FRJcWZFSPV7+aWO07Vmzll3RDm4jJJFcZfleshsgAx+jHFx?=
 =?iso-8859-1?Q?m9oDVldYLp0wK7lbSm5a9+nCepvzy2ql+J3PGgyp2/UwKaaZbOfx7hZSom?=
 =?iso-8859-1?Q?imGfT7yZe5pGZhCCSi2XHMuYR4ivX1YFNLVYSUrV1gKZZySjVrVpWZ7pJ/?=
 =?iso-8859-1?Q?wHfzumWV8PLFgYAAc9z5lRYKtiu/2AjTZMHpBp08EaQL5DvuMk71wiSfym?=
 =?iso-8859-1?Q?2HXDrN3nkk2zo5gNyrfAXfOURSjNscUNqhOekfxCCKL574Ay0/kL2WsiW6?=
 =?iso-8859-1?Q?rWAPF89SCIXmLh25r56sHcOqXGtrfOfUZ6iiPYiMtqHbxtEJAHOUKik9NG?=
 =?iso-8859-1?Q?Rht5cX7raPXia8/c9cakmurxVDVAPqgjUrUlyHISneXIqUq+1bADhCxJWO?=
 =?iso-8859-1?Q?5EvVRTMwyr9D8zfSc2ITTHSGRG/Z/cra1OsQZoxwU2MxUunyiu6ZzgxqZ/?=
 =?iso-8859-1?Q?/k2BjkO6l+2QBgRbmeibi2fvJ9j323IuHQa63bkFmdDMzC8WG4pi4qpA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c01a1dcb-1e30-4d43-c366-08dd1a1cf857
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:49:48.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsPYSrsBJg8+Kj5Lkklx7doaWFqlGGxRR90i+TA6cd13L9ZeDH5572yZi2nDUsK0AWdqO8xRc1FAg84xVkjVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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

On Mon, Dec 02, 2024 at 01:37:46PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Useful to experiment with notifier size and how it affects
> > performance.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_module.h | 1 +
> >  drivers/gpu/drm/xe/xe_svm.c    | 5 +++--
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 161a5e6f717f..5a3bfea8b7b4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -22,6 +22,7 @@ struct xe_modparam {
> >  	unsigned int max_vfs;
> >  #endif
> >  	int wedged_mode;
> > +	u32 svm_notifier_size;
> 
> Hmm. Shouldn't this be assigned and documented somewhere?
> 

Yes, the following patch does this - this was mistake in the a rebase. Will fix.

Matt

> Thanks,
> Thomas
> 
> 
> 
> >  };
> >  
> >  extern struct xe_modparam xe_modparam;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index acf2a3750f38..16e34aaead79 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -8,6 +8,7 @@
> >  #include "xe_bo.h"
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_migrate.h"
> > +#include "xe_module.h"
> >  #include "xe_pt.h"
> >  #include "xe_svm.h"
> >  #include "xe_ttm_vram_mgr.h"
> > @@ -573,8 +574,8 @@ int xe_svm_init(struct xe_vm *vm)
> >  
> >  	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> > >drm,
> >  			       current->mm, xe_svm_devm_owner(vm-
> > >xe), 0,
> > -			       vm->size, SZ_512M, &gpusvm_ops,
> > -			       fault_chunk_sizes,
> > +			       vm->size,
> > xe_modparam.svm_notifier_size * SZ_1M,
> > +			       &gpusvm_ops, fault_chunk_sizes,
> >  			       ARRAY_SIZE(fault_chunk_sizes));
> >  }
> >  
> 
