Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8128D65CD
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 17:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466F10E377;
	Fri, 31 May 2024 15:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4qLNps/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FF210E10C;
 Fri, 31 May 2024 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717169551; x=1748705551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZjnjX/sj7/Te3FZt1NBV0YDWfn4pPuF3NPPGCHSrgS4=;
 b=a4qLNps/ZQ5nmgqQvaDAudnFodgkAIh6l9EoO7WTmLyG6pT2DaOcYcpI
 edSzcCb/32MWbj2jXZuOhQ5qitAxDK5LjKO/QRUp9wQHv1H6ZKCEKejIP
 JNzXMbIWYHKqlhNrFJnBQgJP0war4fu1C/zZo3x27FuMJjHZ3meoZXG4b
 RYJ30FmjSipBiDzii+d/y5Z48G2FCTIqAMvPCXlHS+9voRMPGhXhwY8W2
 Hi+APW5tv6e1ZTwsNVYUvkvogYzhrDd7RiBftGEgPpgbD9xVGQPRsIzQ/
 r6m52ADcn2xoDzVFntAQ7UC3xjmdMcHam38UVGrvw/1CCJyF62nnICVmT w==;
X-CSE-ConnectionGUID: mo65R+FIQUGodBVRmf6f+Q==
X-CSE-MsgGUID: bvR0OE7hTJqVkfKFdu4Cbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13565130"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13565130"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:32:30 -0700
X-CSE-ConnectionGUID: pPxPn3QIQo6CJH/YvbBQdw==
X-CSE-MsgGUID: aultwUPmTY2pw7G1miqntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36814085"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 08:32:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 08:32:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 08:31:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 08:31:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 08:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l11Sjs2X4Tl0wMnZ1CInX3GvmRhFhiiGrmPMb+Q8JPb8Fe/76exAiBBU9wFZ8N4DQ2kuGktEPtnISXR5acQvFNotXRIO+bORLwOJUSYh+cSS4ILKRuEe7zNtn5Js2U3793xFJ8xvPhpkgLTvLgwE0AaSJs4Vp1zaRYD85SytmNBjPU3tUi7f/qCe91lsKT9rDylcMCdk7+So9yftkGTtBaa2J7Ax/7arvX/imtm+u5JK2T1UjCsq3IiCr4wq8uMQ1KP3cwFDvGnAc63Az/s54SkEe21lEXha+potXpEjVFYaMdpNdCs3/oAWSJZ97+AniicV0OPiI6kr4sTHkORRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgI243BWlmKANBX7rSD8pyVHufBEvTd0PtprgSKArek=;
 b=PfxOMpiPLnICxGJ7/nABD9gMJBB8bF0DU+pHSkija+uoiGnUaVjsSNd0X4NBCe1hU97SOvPEbB0gF59C4S6T9JnnCaxgRDqXRGE6nrep3DO9aLlp4L2ciPHe4mPVQ6aeGUzKrNWWAFh3CY7G8C/+rJ1Ndu7maouoLedY95/KJiEuzknB/2Z0Gn8CTZ9JGluY2fXJHxXe8mtPT5j41UgXgxY//U7QIC2TrSSah0Tim24j3BYKf8e2WdtPCnXVF7qc/50aD3P4dD8Mq+v40LbyzOUn09cczZN+6/tiDyHEUEWeUo2coJPAk+IrqCurPf1wWBmqVuE5+wdtInsbmA6Y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 15:30:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 15:30:02 +0000
Date: Fri, 31 May 2024 11:29:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <Zlns9gU7kCgjvYQ6@intel.com>
References: <20240531141051.504610-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531141051.504610-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d43ab0-1c95-4e51-b76c-08dc81868a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JrrnizMfRT48bfI2bu/AHrAjGFdgVvBLnGeYB4DWVhf0jLYdx7gLoNKXVl?=
 =?iso-8859-1?Q?/T5xkHI9YP8hzBGzL1r4gBja1fV95NBMKlUTvcpRDvxk2ge9catEDhaD7V?=
 =?iso-8859-1?Q?ml0d2o5Ce3S/qXmVj88wd5OBydJJr9KKRihKvXACOoFMjQSje6xd3SMK5A?=
 =?iso-8859-1?Q?AkkGniQO7QMbL1By6ZZzbT3FYT6VLqQvxT6eLadL7oGHoDDHlzHqSr3Y4v?=
 =?iso-8859-1?Q?qkc11AfDn4mk8jtxFxq+QURf/jeyOaxiTdThWEE4bsH95cjTaRRlffqoUf?=
 =?iso-8859-1?Q?gWM9BwyPA7syabJwFfWbaaSBJQPu4MZEvB3Gwf2nbMKSs+yc0enuW3H5Ct?=
 =?iso-8859-1?Q?wHlOiAo2z2GQVxKwuMPFHobXaw4OM1FQ256y4IubQqW/Flci1NIw7tEfa6?=
 =?iso-8859-1?Q?nzKwJ4aafTxaqHKB77N4+QpIR4Xj9SLb4731VdRoKLy0qM94E5k0GM+gRk?=
 =?iso-8859-1?Q?SaOh2QPuLTFlJnG8KbK7nGkbDGeMNJfR8PPaWs0tuly3p30Kb4oPFhT2lt?=
 =?iso-8859-1?Q?pzNq4fhdEEm8N1KLBWoGCIzaCB1u672qq1V7zVt+WI/zVi2MOnaFxFvXNn?=
 =?iso-8859-1?Q?woSnq/Gpho2fAUXoF+ZYhWQJSNdbYdINn3a2V9/VXnev6PLf0NvEBD6MhM?=
 =?iso-8859-1?Q?wtNYdOZPYXFPWvxTHRG7mKEpdTvqJxOW0MMMlpmuQ7ZXOj+3DUc+oDQX5b?=
 =?iso-8859-1?Q?IxTT6lUJF/qvnc5piz31DG/l9biJHztGMUz3+xMMQEMGsLPqpp5cSQWjik?=
 =?iso-8859-1?Q?ZlQgqWZEeTPjSFWHNDiSNWjX3JuAn0if7SG8yYFrVc0Tj1WZgBIV8/e8T7?=
 =?iso-8859-1?Q?+s+M5aqRFtIGFN3TS6p63JaCKNlveg07tABu0AkQqN0ptMKLXvGhNyboTb?=
 =?iso-8859-1?Q?jtvTx7O3oMMGPMkKCH6+KryqX6u3Udemb+jB28+KDC6kn/IyCKSWS5FkmH?=
 =?iso-8859-1?Q?x6WgJ90wQB38hJEGXoUg93EvXx+5aTlX/KObDdncDMLaOx5qf3C8hX+hMB?=
 =?iso-8859-1?Q?PB4P6wi2tOJ4RAwkhmvWfOIQJGxDIdd00V69t8kCwzJ8Dz0tJB0WOweWJZ?=
 =?iso-8859-1?Q?NItcadAF24oYUzDMvS2O/kMzdf+aCyurYiAK2OulPvE6VhePx86oAiqJYE?=
 =?iso-8859-1?Q?VJEsad2X7u0lBBuBMbKg49ig79XjYkHpliQtyK17VR3SkH9k/pS7MEWoHS?=
 =?iso-8859-1?Q?W1AWI67e4/kQqpbkIgRcAloNA5J4wLzDP1H+eS64zYZ6vyce22AHHIDj/G?=
 =?iso-8859-1?Q?kTMJ3+jIbOfSPAgwtFz7xAb+Blx4EyjvAklsZev7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H3K0nSP4A5RkKEv3LaXiXVQy543KLoNn/4a4dumCYSLmouWN+iiMtNj1tR?=
 =?iso-8859-1?Q?zKUCCsPEq+O4zzYq49YLQbI/KXQmuaM0LwrNg51ucAYM0uIvb+Fo3VKrQq?=
 =?iso-8859-1?Q?EyF8+asMKbfOYIY+jJnfrJreuArafB8HzKBQhMlffgi28LaZlosqmC0vuF?=
 =?iso-8859-1?Q?r7oCobj+p4NBZkMJ5xUTDMpoEfrrnUu7+9vsagt7/Ch9qyLxnbaOXxU4eu?=
 =?iso-8859-1?Q?V0yU9h4+ieJ9Be45IUJ7YuAAU43i9gIJBTG6dz+pKI0Q4nhvZZwz6TuNlC?=
 =?iso-8859-1?Q?VWGuTFmyInIYSvFFjWmu9RYXJal6aYYVpBimKW1yshk0cG3QkA/CEI0BpU?=
 =?iso-8859-1?Q?bOkWyoG7oCKydA0eDf0tX6vwpSGuFZRYIWlxG5uNiM1UWrm2Ec4TuS/alc?=
 =?iso-8859-1?Q?wokhFHWKEZVCR8sfRuiBAdmFkBG45NXaPK9BCeowR/kybZsRfTdSjOhOYB?=
 =?iso-8859-1?Q?Or8EDKhemJPv8L8tnnG+SN6i3c16bctgE1zrdcIcNw0vdNBvMq8q8BIsBF?=
 =?iso-8859-1?Q?3Ar7hrKr0DxzueGb1V5hwHBcGIJtIsmiBhTzHKluDiM50T687eQsUh1YKF?=
 =?iso-8859-1?Q?0tok3/yxzMHdvfSNNyhXsei3DqKZpp1168pxnMmHiTRuwEISxZDsrne+GO?=
 =?iso-8859-1?Q?6GXMjjooEZXOzBcEfABg/mbMZcv8iN0/6nfppzLhjPLCkCJDDhWeNSTJQJ?=
 =?iso-8859-1?Q?nDTgE/vaOfMb5gDRv7sYp62A7RUeopjy2va3bFuQ2xAc/NwCLqVxmBlCrU?=
 =?iso-8859-1?Q?v6hOCZ/ccye2bkRGncPWTp/aNI9PZFsovLJNZcZ96LcGz35xTK5i0YsS18?=
 =?iso-8859-1?Q?08r2HRN2cTfAuD6eSDUPJ41O+pnF0i3OQv9tLIyt/jCd+ESBhyWW+o2cRD?=
 =?iso-8859-1?Q?t8Asnx8ZEnRsr0uai3UueI/0A8gGBf5XJA+FPyOZBmqa/IO5Nw808VEeOx?=
 =?iso-8859-1?Q?oEfFDNLH1IdlZDpn8UciHnHthT6VDGRo6bWlsz2pFdU0bptd4ca1uKPkkH?=
 =?iso-8859-1?Q?NMXwa8gsxlC6ffAeBX9nhIYMXPB862ufASAm19ziZS+/cyD497sQJRXMCO?=
 =?iso-8859-1?Q?fUMlNxidTT8zkMLXolwo4lxoB1sDvv7KK/R5UP52Wp96UFqfJ7W7P1Z/Gs?=
 =?iso-8859-1?Q?Al1dTPrfvgtP01GAUoswLmdbg8igAS18/dKYGtv8sSGrtUWRd3e/APc4VN?=
 =?iso-8859-1?Q?LWUJbM83EmBEG4N7ZLk9fU/B1049JDHhbvd0PY9NUKV3JbgVKK2/DcyOFM?=
 =?iso-8859-1?Q?QzVjpnRBEx/u5iOxDzFR+QDbs1r+cDxBvm+M0z7gYEZdCyd4HpJR86ZliA?=
 =?iso-8859-1?Q?N7pNubfVCqbO1NBrgDBYpHx9dtzJ3Z6u/iiKpjNxNVyOqBSzt/vlo4nbao?=
 =?iso-8859-1?Q?eWOrC5l0v6jdzUwFEg8kG7Q0FsLfNoMeAmdnZ2IH3TkXZV2ZBOZHPEo3fb?=
 =?iso-8859-1?Q?EKdJ0t0gLtoeO2HrIG66AtSn8/unkUGqbdzhVIHDqpeOcSAZxhKhierFVR?=
 =?iso-8859-1?Q?w2r8Jg3Xcomf9VtWF5M9nbIAza4R8qj3PSonLGhIrDDM4862h20+J//3i/?=
 =?iso-8859-1?Q?A/N7kgRWjrVHUBX+rZWxfApV7Gk33S0aSEculeEduRQ5BmJc9XrNqdS6HV?=
 =?iso-8859-1?Q?j9Eko62NcoXXyFKGTmGVgqTTHuzb3ANNsS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d43ab0-1c95-4e51-b76c-08dc81868a42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 15:30:02.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlLx8PBdt5aDku1MuaTmg2QOjYbJx4vzauqk9hrQD9pjhI4MxsCGeedrvE5UCsN1fJPRis5pIZhb4Hb0tIlwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
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

On Fri, May 31, 2024 at 04:10:51PM +0200, Thomas Hellström wrote:
> Add Rodrigo Vivi as an Xe driver maintainer.
> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 572be0546e21..8f9982c99257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11037,6 +11037,7 @@ F:	include/uapi/drm/i915_drm.h
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
>  M:	Lucas De Marchi <lucas.demarchi@intel.com>
>  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> +M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
>  S:	Supported
>  W:	https://drm.pages.freedesktop.org/intel-docs/
> -- 
> 2.44.0
> 
