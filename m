Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C9E9A2CDA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 20:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B099110E1DE;
	Thu, 17 Oct 2024 18:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4ColfuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF39110E1DE;
 Thu, 17 Oct 2024 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729191478; x=1760727478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lOOfuJ5+fBlS/S/yRbZIQtwjgukHrE2eKrJQp6B8saI=;
 b=P4ColfuPUqTGP3LwAcubV9qmx99/+MrwuPdNQsoDoTVZHzhegTSt+iV1
 NKKvD5o7DS8fDaCEjfo+YbMlrQ0VfyVGZZk5YXnAnXPRYYSk/e0FD91bi
 +SdK9/Xy+IHG65johD1bdh19LWE95Um2dKN+fFV+yyp3j3bPXmqj64xXv
 CFrnXFBmwn5FMjC7kd9H5FhVQ7OK17AlrJR9la3Zort3pXh3zGLGi/env
 7ArF5YTvDexiH74fscbJL0Y9RXlYqOHM4nDG1y6WUuZBSw4cF42cffECd
 CRTDZ3IzNj6QW+pxSWT4Q3OAUz8fq38sGEIR+i4ymqQr6CRA9UKaVjzIL w==;
X-CSE-ConnectionGUID: fExUs6ClQR+9+oWKacVGeQ==
X-CSE-MsgGUID: z80kTwvPSiW76/AJ56Xo1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46162459"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46162459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 11:57:57 -0700
X-CSE-ConnectionGUID: 8Ft8QwSgTX2DQCYNftQzEg==
X-CSE-MsgGUID: 4ybswI/YQZ+JJLzD0ZuoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83406022"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 11:57:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 11:57:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 11:57:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 11:57:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 11:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3cNs118BQIOou0WLhmJ8u2CrzN3FyCr1CS5krnh5DQSD2AF0Uaxv5Ofdz6TRX/4pmslAO4GSJvDwMzZmEVW3AGnI2CbF8koXgj3Pa0P2Me9dNHSnQh5EgWcFOGLdSdpZVeAHU5Kj+J6hLMcIB0cuLH242zJVZHyDMkianSiw838Hsvhb+biikf61SeOgoLSJrQ4SJWP1uy/XOJXjFra8GbLhlhylnViAtt83YRiHacl+k0utobTrY4WA4KXuQoljaA5jg3+ipfBCRmyK/v3YLGAN1FXPmVIrMjn2sZ1cnGdc4ZRWAQpIfaK6l7E9cc9kl6615ZgiMr3cSrMqUaJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B+F0lp6k0QPUhQWLiqkxn1Cx+4U60QjQE2MlnJHyRA=;
 b=dQ9hXkHd1YK9xbdLikR9xWEUYct/1sNOUbqEuLnwtMUdWQFmQMGknRdQEj2Rnv5txIzAcOqa642WsFXagbx7ulVfrKq4RhxqUpsQtRbr6MjSw29ujUDo8BfhUfxk0LXa7ZVfquudIHDReJkVlVjKP7/ROE8rGFeDv5GopG8hRqjZu0x7XogKsk+qm5n3ExovByhrLYFpgEqN/7fzm0/j0/E4TCXrkFg+pFNw8I6aVkCLQFhF92YMTuHQktiy0aIjsRsDEcJhgX0zoH9MoLqHAyTHZrzBCxTrbwTwi/cOjgYLIkYRSmhJj7eoxz3JSzjAxw5c6DdsnQEs2UrRUcx9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 18:57:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 18:57:51 +0000
Date: Thu, 17 Oct 2024 14:57:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, John
 Harrison <john.c.harrison@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Message-ID: <ZxFeKwZqxcCq3ogb@intel.com>
References: <20241016001658.2671225-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241016001658.2671225-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 3239314b-7974-454d-0e74-08dceedd9927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ohONOT4xtO44gDLumY9oV+Or/OAcvA+KLu5a+hFGiScxqEQ1pa4HXf0h+04U?=
 =?us-ascii?Q?4ZhC8EJTsnHYtp8a4Vb3/UM7LtvQpvNOcgYAvlhPl3D7o89MPyxvH073CRxC?=
 =?us-ascii?Q?csSnSGy1G+kesQSPQTzEixVN7xlS0tdkkYs7zfSgWyQ1j6/d5fXt24qCjHr7?=
 =?us-ascii?Q?K7f5RBq67KFBiysTzNOjOUsnKLX8ymKHmg3j+IkcaVE+jYXUqLFytg7prjhA?=
 =?us-ascii?Q?hPdRk+quRgP/CKLHx5Wl5jDxME3gv/bs+mIokaHNb2qHgG5qTJd8ipk8KVcR?=
 =?us-ascii?Q?A3YqbzQB0vLZoELQpBAquysrCb/jAuT+tz4/eAwj60Xq3EbZBfI3JN/ttWo3?=
 =?us-ascii?Q?Vf23FcRZkv6+ESBArQMCHfow4fJdWVDe9zpRRhlfV84cuM2U975qgwKASjyF?=
 =?us-ascii?Q?8SrrCz8AejeW7M8xOUvlC7uvEGonirqwVmLuOvaNg3KnFCPzQf6PfU4vNZbK?=
 =?us-ascii?Q?dGSR3JYWMj/U5RSb+bwXHBrJEiNLDb5SPLAZSExjdLkuF822b69BEcHqOPKn?=
 =?us-ascii?Q?CGFMOR63+EfoPQHCbzxuJyOOHIYRQF0OMqId+HNiNtHe6mHJAG4ErNalGm6r?=
 =?us-ascii?Q?GWnae1GvKV7ryfn1wfrpn8lSdbWbGGLi4MH9UmYQZZXXQhAdKtdfnub5mo9g?=
 =?us-ascii?Q?ge8ubwWjqK5v5vr/zLdioTouhYi8rQCqyG4XdCRDviepCt3djo6nY++LDPG8?=
 =?us-ascii?Q?u9lQMqSyKEIW0rxcmK2oGg9e1x49yx9jFD9Qdu+k2riK41wobCaaSsOzyRsy?=
 =?us-ascii?Q?4kfruONvcacARlx4ZZuWQF88YyzKpM+W1NSfCszomgvID5oym7E3vSiJZ+lL?=
 =?us-ascii?Q?ZBW50/DDYdbUahNNGYYMhEl5WSbpw6A9geSBIdL2L3PnfhlfSKp+8K9qUiq2?=
 =?us-ascii?Q?xAhzeWZrhAr7EviULSWnrCW1UDbTT0QTNNDTqjfohEqdKTIj13UdklRB3IhP?=
 =?us-ascii?Q?7wcPu0mx9mzLcC908LWxITXgxObML+i7DMcKwNsXXCyVNKse0YvZrGRic5Sm?=
 =?us-ascii?Q?fe3W+YYVxla2KpLWmtspM7N/ijBnX0PodbbDIyePkKlPQIRmOJyzloN8bmr1?=
 =?us-ascii?Q?5MxM62lRo6GfLnKR3ccflUNwEqz6JN9jPtjmYsMNN3VMqImg9cHOKCgZWnxB?=
 =?us-ascii?Q?ycI3HjbQB3Cc9Wwlc/gkELaYfeewqcYIYdzP8tw13ttekat5dxPq8LgApg9X?=
 =?us-ascii?Q?S3aH8w6U2tmzQUBDI9eBgH3J5XXHVW4Rukvasi9BSu6ClyIT+QdRLmUtwRG0?=
 =?us-ascii?Q?u9MUjG/nWmQDtD5wnW4zvZJ6xGvDUS2qMZBQC4f/uYq1s4z3z1ycOkivXqBh?=
 =?us-ascii?Q?MCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nZQDHKKAtSA6YJlK/S/PY6iVfPTpJ0YyI8h/5goXJg3Tllg/PBacUTVMk6A?=
 =?us-ascii?Q?XeqXhB/rIxnSyQZ/zaI3X+DLHZKPEwq1FqVjabf/GHJrMEUqTH7TUfbSGhD7?=
 =?us-ascii?Q?478TtXKKJnQaCgDHJyTRgbpq89NbiqWQ9xM6I8ntK0Qvl709LRMKmysqexgf?=
 =?us-ascii?Q?gMtpZAz3uxF+n4hy6T3HZDfgdgdNnghiSi+Eqn0bpZd1Q7WtVW6Yi1d/hSra?=
 =?us-ascii?Q?WTXlu7itYeNR8UgVpClEM6f+ffivddttm6oDZCypbOi5fKkndsHridSwqlLU?=
 =?us-ascii?Q?dfeMoRESKgGskjDeU+bVhsWs5Vi5lrq8YmTECVTSM67bw/38RNBwFR4wb3oM?=
 =?us-ascii?Q?v52bRsEXSEhsgerPecpo4oVZ25Vpp/JeYJsprdiLDua7nxprPZS+4MDeCAJ9?=
 =?us-ascii?Q?kyy7dQ0YBmPnDvQCwPi7H0/V+bKCPk48uEdnYBTNETDfOfqM2S18Sc9maYuK?=
 =?us-ascii?Q?2gwbxLnR/rGdEfDDv4GJKJrM131v1W27Qc2J1Jw9YF+QVDLArt60YKtjpmd3?=
 =?us-ascii?Q?Pxic2cLhng756cWhpf9yIKwcwsF3Hd5RZtPe/yH1lCR6EYT+iLvpCVZXQ12R?=
 =?us-ascii?Q?zZjMWVpRaYwQwswVcju49ARvmkbwKMsSj8APdV/CjlMG6fgpbJxrX23Q3WC9?=
 =?us-ascii?Q?4uNceDYIJycqfaiJaU9dWEdaf3dgs+08dmCtq0xuMHR/34fKUomwpXDkvVeM?=
 =?us-ascii?Q?i3Gj7SD72uSP/R42yr8xNn3Ni+btCsN/+ugTVIo6Cmh4K91ZaCl8gFK9TmkW?=
 =?us-ascii?Q?pVlUjgvMt2bp+VogEKtepq9AvC6bWsapLh544rPzhq8cgHuu+7fDDpJUgbl3?=
 =?us-ascii?Q?s/Xs2DAziNTS2esuj3f8QJEjZIPuhTiCWU+YWGdUdKMgh+Yd+mU2RzUahI0l?=
 =?us-ascii?Q?+YzlEfKG3jHJ2jFCh/6Ty1sQVPTtR4QVKh0UvUQvHMvLH2zxP7skYb5cRSeb?=
 =?us-ascii?Q?0X97zL7Jz92moabnqRY1i/5dJfI/fCf2rIzzXusPyh4O6/FVRb/hNoF/+5Ce?=
 =?us-ascii?Q?cl6b+DHDBZE1Ein09pRhNVnIj+URAtyRbDnW3mZL7PIyvbv5fYQKEsZ4DolQ?=
 =?us-ascii?Q?GW0O2kR3LYEDiXDXTg77d0IRRKmKNdHQHNGIN4oBCO/2KqUsOhubvPaEbV1L?=
 =?us-ascii?Q?VydUDxgsqVivbbuW6hDdKZrvFaKoEPSfMw+02haV0kdATKV+V8gR+w2G4kz8?=
 =?us-ascii?Q?rq9y+yB9+2riotkDMCsuibjFlL8zdkL27lWZjpEtnciXALdMoDXeE8s+T7EM?=
 =?us-ascii?Q?xmJX7o7SNQ2Wd2aNBnqr/bwH5K5zx7x+T0HsNB9zhSdQ0zTnklIYsMMNo7Af?=
 =?us-ascii?Q?9hW3qtbSMfhVxrPm4zPepxF5j1DwPu5DnFtOcsorMVofRgmdCSQCly2Y/A+Z?=
 =?us-ascii?Q?m9PDm/hbQA8uLukvj3i5EHEr+Qg0BemTS9wg4irLtfF3oy3cD4bXYjfBJqUC?=
 =?us-ascii?Q?6sXEKtXNz64ueVpPGXNFJngFDbuHp8q4QggoBYNML7/gAyDgI3TT+sSLu6ZN?=
 =?us-ascii?Q?pj8MvVh4bcHucnAsRudCH/6exrna1VKl3tD3uACB2mfFRUrQSNxjbDBEJ/Ya?=
 =?us-ascii?Q?lYR+A9uqpZTWjRxso0f+c9haIRN32Pe7ux+QasS0fBwN3Ir17WwsFaUn0KL1?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3239314b-7974-454d-0e74-08dceedd9927
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 18:57:51.5935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y76arzWxw8bl21RpwGpjwKL4yHysoLKHPgllB1QGdPq2teVNdFtaw4iYRR3ZRttp4S5QD/aoNFSsIChYP9E+ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

On Tue, Oct 15, 2024 at 05:16:58PM -0700, Alan Previn wrote:
> Add missing tag for "Wa_14019159160 - Case 2" (for existing
> PXP code that ensures run alone mode bit is set to allow
> PxP-decryption.
> 
>  v5: - remove the max IP_VER check since new platforms that
>        i915 supports needs this fix and tag the caller too
>        (John Harrison).
>  v4: - Include IP_VER 12.71. (Matt Roper)
>  v3: - Check targeted platforms using IP_VAL. (John Harrison)
>  v2: - Fix WA id number (John Harrison).
>      - Improve comments and code to be specific
>        for the targeted platforms (John Harrison)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7bd5d2c29056..51847a846002 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -820,8 +820,10 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
>  	bool ctx_is_protected = false;
>  
>  	/*
> -	 * On MTL and newer platforms, protected contexts require setting
> -	 * the LRC run-alone bit or else the encryption will not happen.
> +	 * Wa_14019159160 - Case 2.
> +	 * On some platforms, protected contexts require setting
> +	 * the LRC run-alone bit or else the encryption/decryption will not happen.
> +	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
>  	 */
>  	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
>  	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
> @@ -850,6 +852,7 @@ static void init_common_regs(u32 * const regs,
>  	if (GRAPHICS_VER(engine->i915) < 11)
>  		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
>  					   CTX_CTRL_RS_CTX_ENABLE);
> +	/* Wa_14019159160 - Case 2.*/

I don't believe this needs to be repeated, but it doesn't hurt

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	if (ctx_needs_runalone(ce))
>  		ctl |= _MASKED_BIT_ENABLE(GEN12_CTX_CTRL_RUNALONE_MODE);
>  	regs[CTX_CONTEXT_CONTROL] = ctl;
> 
> base-commit: 01c7b2c084e5c84313f382734c10945b9aa49823
> -- 
> 2.34.1
> 
