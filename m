Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D06C8767A8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2C10F923;
	Fri,  8 Mar 2024 15:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV1HfVui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23F910F923;
 Fri,  8 Mar 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709912990; x=1741448990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LpfwCOvv6lnR0/LqqlQGXmQa0UqBjanabnOLG9Zc+xg=;
 b=ZV1HfVuiB62OEhphIuLDevoOkwSeUn5XpRdG8XuqA2IfKvzUMZLoiZCI
 1MR+y08CH9O43MHOkvVNmcaqh16px1x0yeyWCIjPfqpvkrCsydZrOWHZK
 Wg6GVjricAZcyQltnIpRBDwYH/GgWOsp9put6vMYDC6hIAqxdn7ylA4Ra
 KItzvXsorCwEQpyxqA1lvnpUrvfrOSiOz4PYLIHwvVMophBmmWUcTqZZW
 nS3XWeQvLl2MlQq9WayKXXeDjXMBtENXbu/my6gW5eyGPlIg2Jz5QebgI
 IKyuWQa7HvwZBNXGwdcVOx/lZugAKpTAhdB9fJsStz3ze1+ltyl0cxqtu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4774994"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4774994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="10385685"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:49:42 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:49:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:49:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:49:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:49:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO9hga8PeDiKrLgY22F8+QgWh2Z4JPxeMYYI9JzD/P3b3p4NkFYlSYPVehSEcnjYzMODjFjTl5UQ1GouUVfIFQrekRosMIOSBsynM/GlaQLUwR7WqRuHGGYhIMku+fb3G+VUZHKhbdbgIz1NMdLQ4yPT6WpV5dOOBhVM4sT4dmznhn1LrKPQD8iHWl1HnEWs4Yw/rGIPdhB+n5V8dlVTBjYfwO/HE9LVxFXWLTcCzYJPC/TZgcUr0bIQGRhFPcz1SOApqfQAqEDZz5lqdUvb3qNKCmv9OaW52JLRMEyUg/JmNX11HPlarMNuVbr76pTzMZxUrpuepT9vJbOQtkcyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5euVg4bx2VDAqtDph0hryTBYj8JLAJjhEcnX/HMSjQ=;
 b=BpgNAfA66LrBVxX3VUhv+xPSa0C4mp0/PGm6xt6kEnaPhJlKN7pNqrA7bN1Qn6vuPJLZ8284ThDOupKSe14zx5q/8Ws3fe22TDgGHFLrUkgQRmOkUsM8lLlv5IotRcnWLuHAZagy8YaTXQpkibanBianABi9Xt0y07I8exM7R8i69BDjPGEcbaJ3pznHSuvPPBWdX2imH1AA+bkuMzfY/3XU8naslJKon3wVacOCOLfD44RcqY0UhdwRbgPwIg3DiU7bwqbmoQMCAYgNp2A9PwO3HfYU6FiGz2QDkoOjobK78KNmc4JoLg2lOq9uqe3UV3G0cyxeh9+rfwuZ5qs9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 15:49:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 15:49:38 +0000
Date: Fri, 8 Mar 2024 10:49:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <imre.deak@intel.com>, <tejas.upadhyay@intel.com>,
 <jouni.hogander@intel.com>, <javierm@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <lucas.demarchi@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/6] drm/client: Export drm_client_dev_unregister()
Message-ID: <ZeszikpTbZuYTav8@intel.com>
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-2-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240301134448.31289-2-tzimmermann@suse.de>
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: e548d80d-7335-4202-2152-08dc3f875c1c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4uaUBO1cXk47Sbf9nRO9TsYNCQF8/K7ombZurX/mXHcCMExGr5IgSNpunBc27/FkuZAtkMzyONHP3zUIxe0GYAZVK7clDcGYbR6fEkAMA/tjo14HXMDK+re+kBjl+YO/AGdZhpStegNa6d0nX1SKTWZ/O9ZOiNq2suY2xoiHl3CHcte63WHSxv0EEGft0oDx0OHZ8bkASKPvBEXYxdQg+FZD4bH2oTBOh7J5e3ilqcKftqut0nhSu8otvDqfI0t5VxAcQHCktM+0XoL//h3r9kxG2TVnIv2Tn2yQOjrvkQ0xF8gkxorGC/2D7ZzgRxO+86cPdlCSspy5jEq26mW4aIKcYv9XLshGdl+Sx1xcJI5mjZeRSWdYYOp4u0v7yj09U5RD9FQ8o5XXFYTRnvpjF4dzXxL8NDSTwX62e122UExmBtcOFndynLlG0vBCol0IoUon/1KHSrzSMdmERiLzGzKYI0nktKE5JhLWs/AM5P99G3uhc0mrQE2qzTrQHGCIyqberyDVh6oo0QroErYgkUw8O5o1Ze9IzLqx/cCOFBRdMiUifdZ3DSrjVZxlpVYfQmvDErMmO7ofRzeyCFEskYkNVBwKgOUvDgcKCX1FCzQjVyBUOM1ycSloARq5QobD3pf6kp4MBC18+uE+2jN2IM6t6mhi5iHRB6Aw1ZE7a8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?52oRiqqf6bE9l7/vGX3CovDJuR/cE3iFgLWWOpJuPMz7enJ2AFREjUIQhi24?=
 =?us-ascii?Q?1CvkE//v7nh3NkCJT5MHJXi9S5FHr7g+hv8imzvhsWowfQF+DXiR0A2zKdVn?=
 =?us-ascii?Q?GdE+B6iPcyyLBuLm61Hzau5isTPdkbf1Dj2cfYvBeNOhqRTWgXAEN+UqKmk9?=
 =?us-ascii?Q?IVd/jN/7tBPBqg+X/4S3aMsgrQWn4NptAq0nJnNiHT/Cre9zOH8nuRqVPWwG?=
 =?us-ascii?Q?kKNzZT/T9bsOKZSQwheQOkGX/hljpKlj9fLEJJD4oMIe0HA8nX7u1owbg5lE?=
 =?us-ascii?Q?7gB6kpPn7p9afeoiT9NPqFjCaOZpREXweSzD3BQDnPaSrCeZoa+lPqDsh1wB?=
 =?us-ascii?Q?oQ09phRMaF2PHilruuENpcFF4b1PHPYr5ta9mmEh/AltPFcXgqRWnUUB8xw4?=
 =?us-ascii?Q?v6OJ0pnvvZ0J73jSrgRTUfAAOvsw7h5g96oipk9sGD9KsACLCGadO/BSELES?=
 =?us-ascii?Q?1kbrQAU8rQmRPqCM4UjxKl0mb6MJkBonouD0pS0XhG1pIdJayIU+oJZWfIjq?=
 =?us-ascii?Q?RVOsXL6uj9ilTK3i30nFF2UT7GW/Vrk4gx7WQyupo0pVbnpw2WSB4DYy+VQQ?=
 =?us-ascii?Q?3MvB7Nw+dXNMBgG5DMyXqOiOpwjcYRw6ZsavJZ08l2Xafaa/2wjzZir6NMF/?=
 =?us-ascii?Q?4Cv91MSs2K5Duab2dH5fRQ+NR6QGXBwUDeGuj112ivs7oiqp7dJaH1AY6lrz?=
 =?us-ascii?Q?ME8IYvyRXQwaTrRCGgDB0HKWweuulKtavZbyzP9M83s7OkSccDzqq4qz6QcW?=
 =?us-ascii?Q?IHg/NhMK56a6mgeMEY4thcWRw5MpzDzRavgSmCnd4UyH0DufsCFwbiow2nRa?=
 =?us-ascii?Q?kEicBSMI/F37YZFfrwMZWeLUYV08sEa4mg5eVd1LwstL6dDuu/w55S+XFzsv?=
 =?us-ascii?Q?HGSGnO7G1DHYk8VTkGZpNvPv7ow2ZuaGpMxkDI5HlK5MUZFJoGIXqIyzfv3R?=
 =?us-ascii?Q?+SYAN94Tc9nvNbp19JwENRlIfCJ9PXHGcaysIgClZZFzFcWqZn8WXS3suR+q?=
 =?us-ascii?Q?YNkJOaXpSRTliqePhqSg+DGgNPxqyi6jmbe9pYNgjbP0jkdxqoGVHW8gvYOh?=
 =?us-ascii?Q?RxcPnOZWyWN5YlMm5ELC19mPS6pa8SFPvSuvIAGy0gf0zmdchmvBNHzbaGs7?=
 =?us-ascii?Q?+lt5U3biUXgF4zF/nYTMCNmyEPgXnXGcydGaIyeCU3f9Q/D8g9Tt1ObYVBYR?=
 =?us-ascii?Q?FPQPKotB1n6VqA1JWvIsS0BTSK0DEDACNH43IDf7FGfQkRhs83B/vt8MM1xl?=
 =?us-ascii?Q?0D/9HO5F+DgzMNUE5T/GaVFYYoN1JjOlgxVLxbd6R4W8+KTj312J0u6BcAUa?=
 =?us-ascii?Q?GrgodFwTpVFDtZBeJLByl9KZeE7aoinDpbVAVtoJFGCHrZaALqlPch2HMXoe?=
 =?us-ascii?Q?4EECaVYMKOKDqpZdLqSGHpj8i2OAVezQUz98XVeNNgi+QdewngFCTWSrk9/l?=
 =?us-ascii?Q?ZeEsBRkk7hwUxopOurdAIRJqTsYvMqNjdvo/P8M8vXe2NPRoNY+mYx5JT0TV?=
 =?us-ascii?Q?3Ni4V451qIxsqdi/zl24efgofHTkJ6pXIdaAJcvJMZbWvKauhZ/fanAXjhfP?=
 =?us-ascii?Q?FCYHMT0WqlCOaJKgkBRDmCdNdhHUMLcSuKoqvN/pQ7tUNPEp29WnbHN+fyyd?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e548d80d-7335-4202-2152-08dc3f875c1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:49:38.1556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XIeBNYG2Y7ZcS3Egrn7A0Cp4A2AqmuzoyVM+eJdD97JK4ouRJVjU+GScbDl8l509+TCr0fFmZQZpK9saIxd+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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

On Fri, Mar 01, 2024 at 02:42:54PM +0100, Thomas Zimmermann wrote:
> Export drm_client_dev_unregister() for use by the i915 driver. The
> driver does not use drm_dev_unregister(),

Perhaps we should make i915 to call for the drm_dev_unregister since it calls
for drm_dev_register?

> so it has to clean up the
> in-kernel DRM clients by itself.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 9403b3f576f7b..3d4f8b77d0789 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -172,6 +172,18 @@ void drm_client_release(struct drm_client_dev *client)
>  }
>  EXPORT_SYMBOL(drm_client_release);
>  
> +/**
> + * drm_client_dev_unregister - Unregister clients
> + * @dev: DRM device
> + *
> + * This function releases all clients by calling each client's
> + * &drm_client_funcs.unregister callback. The callback function
> + * is responsibe for releaseing all resources including the client
> + * itself.
> + *
> + * The helper drm_dev_unregister() calls this function. Drivers
> + * that use it don't need to call this function themselves.
> + */
>  void drm_client_dev_unregister(struct drm_device *dev)
>  {
>  	struct drm_client_dev *client, *tmp;
> @@ -191,6 +203,7 @@ void drm_client_dev_unregister(struct drm_device *dev)
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> +EXPORT_SYMBOL(drm_client_dev_unregister);
>  
>  /**
>   * drm_client_dev_hotplug - Send hotplug event to clients
> -- 
> 2.43.2
> 
