Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3BD97A627
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 18:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC33910E0C0;
	Mon, 16 Sep 2024 16:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft2M4okM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B9B10E0C0;
 Mon, 16 Sep 2024 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726504713; x=1758040713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mok9eW82W5dUal3wLhnuJmTzobO/XMCy2lWxZtGd/s8=;
 b=Ft2M4okM389o4RH5NSL9sYg5e2Pnfrfu8HRcuuMxBHVtG24lC/bAZx9S
 Jigj30o0ufZVXqyYR/3W+f4Qhor8/6mDK2SQfa5BdZ+vIaIE7mEFYdRYQ
 SFKzKBA18gEqx0M159LaoTerquJIWg8+6MYpyY736YivYB/yiJRvk6Dgb
 71GDnSNEBBm8c1i10b11a0C4ig1cj7UvdB+0MqJL76X2SCwFBQu7UPTlJ
 UlT83uRoNF2P6S123mtHgkYSnSlE/z1GB4Jev5XWOKoJrtIK51zzdqojr
 YE4IW+VDatsNQjPjWH8IR8LHmASVJieaK9j8ZYoeOFMv9qOr/GZuy49rr g==;
X-CSE-ConnectionGUID: ZpLaL8SYQcqKgQYZ/r/bow==
X-CSE-MsgGUID: srRFfSVHT2yJYJp44DyhUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25465242"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25465242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 09:38:32 -0700
X-CSE-ConnectionGUID: DM3/8mnSSLCpQxYIJZAKdQ==
X-CSE-MsgGUID: 1GmM0K4XRsaKCbYwwScqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69224409"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 09:38:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 09:38:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 09:38:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 09:38:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 09:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1u5afr0EcJmZZgaZLxsEL7xQ4vvDIPh5b9wasIlsGyFRfwflg9uUc8Ihun838ntnM+WVmfVEbx9DjPdEUJMzKvNyVedMibjLaiGEevyrBQkUqkEzp4Q4fd8CdXGx/sr8Nq5+zn58SayhEL2E1XttHfgxaDR6gnXNybT4WYCRHbtLV7M43KgY1hiif5TwhlLA9AWpQqF3tVRYW71X05pGBMtERRuL8eFPE95mht26h4Y9VSkysXwSHTPZxDcbpTi+7/mCo2Xg2/9RHejhUYurZaxujYVet57CojeJge/4dagXFS7y/IhBLArIzLNn4rZ/DJOcvly0wLZMsedCM09mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FeveHAO6M5b/qdakL9xCwedSVxUEpx0V/jJ4QylpYg=;
 b=Qgt7c4fqvOBlYmorqE3affPNBRS79qMg81EgjTLnKjYUgCSnvypBGYr65GkjgbBz/4UUSAJbaXkwbTtrk+A7FPwSxX5d6C3zTFoE3PFvvbntQzxMILGGwtBi8P2ZAnyVnsq8q+LWsBX+ue/VdObDuK8Ili+vybMOAvQS6UYSPOkSVI1AD0Mly3K4rSPSAbNJqk0TI2jtlKeaXrTwkHrXqglvMpAucd8Q2iFOUz4WGlJAVyGP8Q9A9DFaZ3sTydFNrtOnPskiPRbggNYuV2R6/idraHQ6/RS6bnwB6BqG7JnLw9OBAGm3BH8I846NYvurhNPCKgfMvasebfqQ//wa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 16:38:29 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 16:38:29 +0000
Date: Mon, 16 Sep 2024 12:38:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: He Lugang <helugang@uniontech.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: use devm_add_action_or_reset() helper
Message-ID: <ZuhfAXjk93eXLOSh@intel.com>
References: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd04840-c816-4387-f039-08dcd66dfdfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7uXbAQyc9HJDTCMxy4ZcGR9Npgws7GdJYC/2JQSOFw2kV7U1MFIrV7l9+ee?=
 =?us-ascii?Q?ikeSxwmlK3/yZCY3P/Rk73vFv9zCpQBqK9JRt50PJbncflOCMXSohAhn4rRw?=
 =?us-ascii?Q?54bL70SKMGk+dlEGladUzCYOcou86/CwIsqfkgOB/AvcMVvAqx5dE+NX5ARx?=
 =?us-ascii?Q?YtIxyErqCd5KGVIUT01GLxKkxwszhWdlF6N/FFkwlMNA68YlKf0Wdm71wWIW?=
 =?us-ascii?Q?VgPtbHgOOZn///nO1N7w4WZ6NX8qFa77GJ9sbjRyPrDFxO4IkH5hCz8vpXI7?=
 =?us-ascii?Q?ZC6VkovDi82ZqabRX57HciMUGmWE6B0snkMCL0QMoLxnNTOrTLlpMGETO7hS?=
 =?us-ascii?Q?nzd/ILcPsPX61GonlhMZPH6mxFki7uvq0fuSDKv5TPKVHKedNbdkxEwVhS9C?=
 =?us-ascii?Q?zxz1jy5Q12gUfjR/9iBp9+NP0Tbe7oaPyZJ9AaIKdCNV0yhCkJEiHxf6uW18?=
 =?us-ascii?Q?qHIuTr3C5W/4UZEytHpgVJWYx6fNRsD2Sl9fAgm5n4b2Eub5yKAzKU0AjF9+?=
 =?us-ascii?Q?G5h+ApyFYEjkqfdEppTozj16UTIUHAWUfH1GofDEYYnEr0OGd22G/5RMzh8f?=
 =?us-ascii?Q?evtdlD/VaGCXTLzC+w9lqZroZx4uWJ7/AOqDRKD5Ss9HC8Xhg1WSEDvah9zE?=
 =?us-ascii?Q?TEw99PRyPXX11GA/6D5KhBVjkOQCt3Jc2SIa3UMNs90cqFl2o/Yw8Lmky1rS?=
 =?us-ascii?Q?5rqv2mBUMdMLnPGtcYFB01bR5sEQuZrDFcACAkn32uuWXtFfI6wEVmtOAXnY?=
 =?us-ascii?Q?1FrowT/ag00bRZoYtlWBFkzOYqC6Ao7EETTJMyrVhNA8gD96aYh1qWiQSZaC?=
 =?us-ascii?Q?VDStAd+eYiL09XLf/fCk54JcrEg6VDvrYn6pyILTf87VrcyS1udiIVgeJv1e?=
 =?us-ascii?Q?CwQK7OxUYYCO+izsuuyNfAaRrdbMEeHCQk5YZ0BfM1yJd8HlY8cS9GtO0bvX?=
 =?us-ascii?Q?FxgnbBGgO/kQsN5YX6qgLZlW6DaYc/l4fZKcL4cFpqcKdVvfyVkApy1lN8w0?=
 =?us-ascii?Q?TcbMs3nNsIComnWVBwL7pLhEnAMlLSZp+xuOwsOSyATIQrO99nIfDNCGnHFB?=
 =?us-ascii?Q?aBPqVCcuizrGJT9OUD9wMyXegdc92qUbGB39N24p5G7ptA3f7+3bFQl9cCau?=
 =?us-ascii?Q?adxzVVkG62Gk9YVznGSGR6PDz+EacVmwLXkm+4+gQ9Z+7hdz8SEG7mqTFeyp?=
 =?us-ascii?Q?FNZAwZCSje4gG5enf9KYXmSIolDWXXNy9S9p0xkzZZRE3xMQe5onw3nYXzMo?=
 =?us-ascii?Q?Sjds+sKf/IZ59JBfYr8EmFLfrsK9AWVO+eAKpFr8yxS0lrtyUbaUTD409K82?=
 =?us-ascii?Q?ucen7fnciarB6uUStVSDJigFxqRX0Ei8gHK1E30wzGA32A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dcVBK8i5eeoeNelz3wg8cOZageHDnd355pDgX45d6tPwofk8hjDIPFFcP2lj?=
 =?us-ascii?Q?CVK2+b+HiYw0lar0DhI/Uv6eHlTiVb38QZ7C5ZWpXu+NHQnxb3Djt/E1Kg3N?=
 =?us-ascii?Q?XjF5xAwpEd+/uJVxiA1HtOzFPXK2R6I05e0SLVz8AIX/WRjo/z0nnm6FV3D9?=
 =?us-ascii?Q?Ao4FMNeAm1Jwr1MqyV6sOHp7aeWkFe2TyHkol9OqxsIkNZJewCbimjCKH9Xt?=
 =?us-ascii?Q?U/l4a++vFZDI6yn1Xy/0VtmP4gccpqddYZ1SsAGppD2k9mzXy6ATuXMywp/b?=
 =?us-ascii?Q?3F9PjPppYEjPIpVbUXREsw5E3LR3jfE3EoMDVou3zQ9A/lyZvbv496HDPiQj?=
 =?us-ascii?Q?saO9KhBctipHLegiLam3Uub4S9BHeFEpdIEbg0tmkf5pGcqbmhh7ddFYA3NF?=
 =?us-ascii?Q?qbrHwtRj3u6xPi/g7zPXF9rSkU+p4CfEUBNNtBbj4zDOJRrcEAK8Knh1SDwq?=
 =?us-ascii?Q?K8e676Oh9BEG0O1fHAOoeQfgcpCxy9d2Y229KC89oAbBC6lRMeBMfhJZJmfW?=
 =?us-ascii?Q?Kq6F08WZ0wNOGZYVmdM3QZZoRQCeZQYe2AgrwwDIvvhjTz8j1uQlEZBUN9Zq?=
 =?us-ascii?Q?D7NNPhBeXpI5laBjMTNttRzteaRGAcWUXjOFcsivVeRymE7p3PqkE0S19zyw?=
 =?us-ascii?Q?3C9Zol6jyI9MUZX6Ia9ijjB5/OjxNOF5QbxokHCUhgESmfiyFTV0tetmOYIW?=
 =?us-ascii?Q?SlcpIzGsA2TRnT5wc49aTN2mIVc6j8yseMeDQk//omFlMhfc5wvpf43USPk8?=
 =?us-ascii?Q?R482IOcoDzIpReOOYIDLM5C7RNohych8jdHBvaozSJXP1BPwfPExECV9wBh4?=
 =?us-ascii?Q?Juah+W7wYyfQLqD4e7xTFTt0y61Ba9m8RItJ2U8odv41x017uoXo1/2i4N0E?=
 =?us-ascii?Q?ohOfq8oactgr7vrnvHtaJUWTnY4kB980DwGlpZiQ1kA1OEo+X8xdMpl+JJpF?=
 =?us-ascii?Q?/qwgJM5CsOIW2HupXOGUxxiTZrEUm9/T6W/M4h4NrRNbwSJM5BcTiqF7A256?=
 =?us-ascii?Q?9lTmCita/bPfgqFisW79TlQNTtP6O46ISgMhXfqcY92QeQcBzm0+enUvnIls?=
 =?us-ascii?Q?JwnV2yHXHzz0hu1Rz/E5r0W1Ocz1rXDIpRuzOV9ECqSE+du/Gysx/4mdknPo?=
 =?us-ascii?Q?Dseam5A34khgHsuBEW2iEYmJlewfb++8Z7a2tRZKe3osVOEHxLkr1D6HPq9r?=
 =?us-ascii?Q?D7rGLrI8wb4j0IjMn4IED8uxeZnaq3VtPA3fRk/6hp+C9nLdssf0uYpVsJPB?=
 =?us-ascii?Q?m3Od3xJre61qfQCXNcD+3cGpjBMqR443Xn42w70GE567YOOKpmgGOKM/3uUW?=
 =?us-ascii?Q?CxLaz1fXo1Y5T6UuE8k1p6mKV+e1IVb/fL8vjuWxVeUrgaRKP/BYacodKVaQ?=
 =?us-ascii?Q?mkEujrwwsLFDx6S7iNVrSfJ8EYWwUueO62Jyssj1FseFhfmvfE3CYDTfRWB/?=
 =?us-ascii?Q?EoTVyMFG3OW206+cp8m8afYzm6m5w4PfKaEbBXp5xc7fuLZTYXw5Aze7hz9h?=
 =?us-ascii?Q?ooVc5eZ3kNlvMMPVn9GhA+/W7TI0g5pLztmz6bqcOtH1LQoZ1UDOn8O6JOwj?=
 =?us-ascii?Q?ZwH/GwFPi2qnAIUHF7u+xrTc8IMBksLubetwusEV0N6IvQMI4xrYhI3QaXeK?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd04840-c816-4387-f039-08dcd66dfdfe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 16:38:29.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHpD+LMBgvy7by7eDh0mDDWql0kDZ5RUu3Qf+BNzcAqjnRdMe9yzEZzvsupz1soyxND4LPwH6VShdo3eUWwu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Wed, Sep 11, 2024 at 06:22:15PM +0800, He Lugang wrote:
> Use devm_add_action_or_reset() to release resources in case of failure,
> because the cleanup function will be automatically called.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
> v2:move devm_add_action_or_reset after sysfs_create_files to avoid removing
> the sysfs files that hadn't been created.
> ---

pushed to drm-xe-next, thanks for the patch

>  drivers/gpu/drm/xe/xe_gt_freq.c  | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 68a5778b4319..ab76973f3e1e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -237,11 +237,11 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  	if (!gt->freq)
>  		return -ENOMEM;
>  
> -	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
> +	err = sysfs_create_files(gt->freq, freq_attrs);
>  	if (err)
>  		return err;
>  
> -	err = sysfs_create_files(gt->freq, freq_attrs);
> +	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index a05c3699e8b9..ec2b8246204b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> -	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
>  }
> -- 
> 2.45.2
> 
