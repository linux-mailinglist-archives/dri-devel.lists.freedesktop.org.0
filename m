Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83CFA3FE52
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C004F10EB13;
	Fri, 21 Feb 2025 18:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqDD/UfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7F10EB13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740161419; x=1771697419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qxXch41y01FRKSdCLoPPFrkzB/mAdJ1+4CZhUmqzX64=;
 b=RqDD/UfSaHjkeKeaIuN+dNYVtnzMiQUTOsjRzgQScbOhFFEF6XEiXKaq
 O/L4iVAOEdjbw4MiMssorJVEwcqGhobQPD7SoPK9gIOocCpsVSZxTZpuw
 +GQChVurNvgUhxJuCG/VKEWTlTwlqB0lLus+KppYRj5eN4olOJOyDmM/k
 c4KIvMQIz9CuAIm6slPTFdT6i06w6UQHKFdh/xoXwRQZ11VAuYsbE8P7A
 gMY8IUVatzQ1dvYAJ7wQIPOX55TSd1mSYU/Y7lOBeOyUXoWOjV8ok4gHH
 64t80qxf0k8/iXhJlBBv34GTEWriI7Zl435S32my8sxb8tdXfEjuPOaDi g==;
X-CSE-ConnectionGUID: IZMohjxVRlCV6wEWOfHU+A==
X-CSE-MsgGUID: FLopdgjCThaaq5mSbmB1LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44639589"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="44639589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:10:17 -0800
X-CSE-ConnectionGUID: rA4deqS2RNai/CC5xSO/JQ==
X-CSE-MsgGUID: OYdUInMjRG+kbHEU7xjd1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115447541"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:10:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 10:10:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 10:10:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 10:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYzAC/ZCl9Ggaq+j5kI418gilN2aZKqXprK9VeWB3SPAScdqYdECH4U2ksNzkim9LIvZ1dU7qVwqVa8BeTT3ZHdMXrjgpFEbYdEL+2R481tL2rG2ArMTUah0Lif6l9mpsKNa3UIQSKJs6gsKTbOZsXjAShbQOKXucp1rjTW7K2nq0RvxN99ycKkfF6DuP2rADe9OA9rgIYBiWGjj/7mgyQAD9TGTOaZpuP/p9Fe1XJ+ruQPB9wzXbYIMkMojwjTQX1tViEH/n9BoEE/OXCZuTIQFpbwzZ3nP/KW6GvJaZmhR25xtATs7I2lvAuYzht1k4dHt6zNnwmwo+J7MrfS/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q89xW2xY95lGSzyBgnLA2f2tETUGoCAM8nB6MGy+iNg=;
 b=GGAspOMVAFsA961HrlUwYFLdMfdRP4ce4JFdzp2vKPImNgikXzqEzdcgmeTIwtb2acXcdru5qQSHQUsLuPNhY/v1NkwV4Y+aoxAjBdGxslMF8QZXFEXvS0oxkHPFhUq8WLhJlCxxISg0NP0W6PsNCchAskSYpvuth1pbugJ66CEqf3OD1lO6nisiPP9lqPykMX4fe8P8C0WLe/+yY7sT750l9T6bnBPzyO7GAhBS/ZCrGi6dMCe3oFdvE3A+nOv++vlMgs8HLxWxXxieIQFAuZpkyU+/Rvz3ZsUMJVM7mrizd6RNrJ+AnEK5FuBNAOpt98ImdiW7DxHljcPGkCFrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 18:10:11 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8445.017; Fri, 21 Feb 2025
 18:10:11 +0000
Date: Fri, 21 Feb 2025 13:10:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 6/6] drm/xe: Drop remove callback support
Message-ID: <Z7jBf1m6xzVMqj95@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212200542.515493-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39)
 To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: b55a8009-8589-4c33-7eb2-08dd52a2fb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJH5bYAMmBP7bXtlUmYEOrBDxgKvDxMwv8WoQzo3VS+hlouJyNAGYWSc/HKs?=
 =?us-ascii?Q?uMU7D/ov7nYyj0wLucBPwCNZs53MqgFTh0WQPSDRFSjkokdPyuH86nAl6kwg?=
 =?us-ascii?Q?Q5ROIEhBetEvpWowXcPjGdXBC6ecjWW9YHAIcHi9s8m64NohEeKuvchLpX2G?=
 =?us-ascii?Q?3cMQTnyr0VeeFggS+Ppt+CCtfeGonqIssQOMTgkV3QIhRn0VBlb/kmf8DscQ?=
 =?us-ascii?Q?HqTBC/eJeioTfgamnAErKzJuI9Ey/pckthCQH+j+/Qw5JMR8b+XZdg3RYQgg?=
 =?us-ascii?Q?8FjzdOQU3iWICMi7qm8G8zVXORXz0xihSXEUXSBvzTMhq2sk+Pyw05DzVPBr?=
 =?us-ascii?Q?JN7NFOEu4/zFeX1cwJw0U+GWMk9bwqhlo9dHQ/vZW4NutrHoxKYqRR8HaaeX?=
 =?us-ascii?Q?qF3k6oJ1foXXByVh1f9ZNFtsy3j3O6KRnoI2FGrrTR74f+mYOEnc+DLfOQF5?=
 =?us-ascii?Q?m2cx5Jpgiz+VxgfisMwJQ0/cTXZK+LfQd9XNu6viE6WwjDvN8GGvp7YBqrEa?=
 =?us-ascii?Q?3pgHR0m6KiYEpaOKdvChaOP1AzVgtiVGUYZDFdDwkpihkkmm3nSk9FAD3Epj?=
 =?us-ascii?Q?GuqQ0S112ff6yidv8gNYRcyq2qwlyLIuHDNDFCN9+dDmTt1+/9aPZhy8MKyi?=
 =?us-ascii?Q?Mg3FjLa9uUD1d6EpDeqX1sg8wEXluz/flZd3uyLbVHkOcP4AnFwojl/Tuu3u?=
 =?us-ascii?Q?nOcPUHM0OaYaw1T4Mr7jg3HLuP7xTP+v1J4zWcTswuKlVMTqd1a111p9iCz5?=
 =?us-ascii?Q?z85HVflvbzgKZYQnfjZdJYVm2H+XW4GPQnNb0FLF4J6sPIJxnGl6Z845gYew?=
 =?us-ascii?Q?C8UhOLznqzaeCfcSCycFpXAfbGaVX/0etopKqGwe9fqnS6rsqraEbvsAmD3E?=
 =?us-ascii?Q?GEuGZxDUYD7RhZ2cYgrhMykbC2JDI/GOcRtVSRVR3Lytl9zQM2GlNbnBPX1h?=
 =?us-ascii?Q?mv/xDJJ+DKT/mdsdIgR2s15oMtOkzHPHSvj/W3isEf5w3rICvt76DmvWotaX?=
 =?us-ascii?Q?D14iVu39GRxRPO9l1tSF9yQrWgjcUmxMlJ/nSStqwhElxnEdcd6+3Ce2gaT1?=
 =?us-ascii?Q?aRIXvsxrev+05W50NXkb/PjoZyeN3O+CjcwZxi/bfw7sjqTdvnTwuR3K9t3w?=
 =?us-ascii?Q?6lO6rRiQeBUq+e5YaT83MOSuPxzlcuTvwTbDYPgnDbE7JHrKS8gzXcTX+vro?=
 =?us-ascii?Q?BPij8Z5mkzJ+3fc72vyJRqlCzIOpl+pUDn9UO7RD+dJkybgugVf9PsFeToPH?=
 =?us-ascii?Q?bVurQ4LNbgMKaCr6bxc+fi8fwKaPFwnJHMOjZMdRMxPcEB6ZWsOLqwSpi6ms?=
 =?us-ascii?Q?5S1OgJ56AhLIvZZDSYV89FxjW1LknmUvLdDXjDjhHQ/Nh/q+u3Wc5C/9Zaof?=
 =?us-ascii?Q?S89IxzQFY+3nR2rRpgdpaicvFdj7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jmj2zZYKWNJW/yw5CHb4oVUv2JvkYHahiOibCH0g6XHJE508DHLx6UKXtZpT?=
 =?us-ascii?Q?1FvBuFVPqn0nNWtae3WndIZIKLLFmnt4nWogqO3jV89GWv9xmKJH5fz2ACbe?=
 =?us-ascii?Q?FhCGuR9DydK/KHQoDlW/4T/6eiT7m9aM7VfGb/QzrOgD6WXtCL/HBigw2qIX?=
 =?us-ascii?Q?7pnn+BWcy/Fc6ChH/kQH9zC8N7jPNBcImF7NCajH1+CTULgtLypLm3PTcfqk?=
 =?us-ascii?Q?e3JtYOYD9mQkGBlRIZWMOahds6b0QjS/Wkx6ba04uPLdVJcHFdITSOfLqy2O?=
 =?us-ascii?Q?UlXTo8qNxXi9XFdDSpYi0bn4xMQsXD5UwqoR8U9zS0lKpXgNy5Fd9tiCeDxP?=
 =?us-ascii?Q?9TFVadv2dwAWGPDzNG2rV1ZgSQDomFZj69ABmpGglsIwqKiEArf2I1SULsrX?=
 =?us-ascii?Q?/bzhhhZzWKlfW33omtVtObnFs2J89OW6MEB16ABGivjd/mbTgBFVwoTFU4Ol?=
 =?us-ascii?Q?R7SDrIpQDuKntC6GeGgmWXBYse6IBQ/SwKkmzuod3vMz5bivuu/rfljuurbA?=
 =?us-ascii?Q?TGFqHInAaatA2Q0VXuC3YSC9ayaJh4l5DOK2FTiTh23hkr/8JblHzeTZ8ttt?=
 =?us-ascii?Q?TTuYdcHArcroHttgtRQq5ZfakIz6c7ieZWMLmDc7tkdhA0V6V5nIL64YBzot?=
 =?us-ascii?Q?NxrEtpIfexQUxuDCUreOGpDuu93BKWAebJamPmXscRQJeyQ6mtewp5n/xeM0?=
 =?us-ascii?Q?tsS7vSDcONpp2D5JFdawbOOCMef3vvo4eER2ehljnjvhidi9fCBxEIO8J3rz?=
 =?us-ascii?Q?gCni2hDtGpF3irdEcB1AXlgrNp2lfa7SS5+GWMkbxEpL0quRc0ItXM+De1Jw?=
 =?us-ascii?Q?qtCLUM1xqziISu1dQ39Hy9Hsj/GE//eQt6xGPKPD3RVUKrjlI4q4eWH1iEiY?=
 =?us-ascii?Q?BpdvAfyyWEFo/ZxwQy5f4eVHvbyQI83z9IWZTq4nUD3J9wT4/a34HagWlQ5w?=
 =?us-ascii?Q?b3qXm5oa4NcM05Vp/1iXRSlWQDCc4weQ5yOSkARygSUpUyOwii8iFPYc9lX7?=
 =?us-ascii?Q?ZlgAj9QadfcjSs8rbT4P1wkK9KTFtkeUvJqwNa9tpin4K6uVciPtwe7yva8w?=
 =?us-ascii?Q?LheONnp2g21P7ga4JzZ7xhxyAdZN81kKW4mb9IwZPPtKzR+SeQ1yrGrHlN9S?=
 =?us-ascii?Q?+LziZtZfJ3Hm+gqQS5u29nPDcMe1/HZVet2Spst7nM/LZZCQ8+04Uk/7z7RV?=
 =?us-ascii?Q?Zspf+Mw9W0CqJN/m1LVNDxukGQV67CsDGjMfc2waPW6rR1LkVtjBwDkB24vB?=
 =?us-ascii?Q?3Cck89yt0vrdxxMqJ/rRVeFX4RBQdCPeDs26HYZwBExSzDf/oPE0PKhmurb0?=
 =?us-ascii?Q?g7e81WGz9MaF8c/1mh72k5euwE9pJU1nKugtw9XWCnriy9xrcLwf8+LmFqvR?=
 =?us-ascii?Q?AkN94ccSzCoKlQX/rcr2bOXBY4bxYrzgFbSJWjvIinyUxdHSlZivQbwgKVqF?=
 =?us-ascii?Q?J2EahWRQTa95MH2/c6IDUAbSBGovSf00CXiMo74JC47wNQIvM4WM2info+Qk?=
 =?us-ascii?Q?NiMTSPql7bphvf5IG4OkFIz/fvd86GcstbECOqN1DrGuvf182i9MJLSjk15w?=
 =?us-ascii?Q?csIIpMA+TxIhEEUUbuCJk9wQf9PIQaY28LW/Xv9+W+V6NJLNYQjKU6n1jcX+?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b55a8009-8589-4c33-7eb2-08dd52a2fb29
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 18:10:11.1579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow5IR5BSs8UJwKyDf5uSC4NcFfzPDiVruZzfv+cMgPBJpD3lgtJGEvk8Y9/FYXZC/Ex6Nf/UUVvItYm9zRg9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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

On Wed, Feb 12, 2025 at 12:05:42PM -0800, Lucas De Marchi wrote:
> Now that devres supports component driver cleanup during driver removal
> cleanup, the xe custom support for removal callbacks is not needed
> anymore. Drop it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 79 ----------------------------
>  drivers/gpu/drm/xe/xe_device.h       |  4 --
>  drivers/gpu/drm/xe/xe_device_types.h | 17 ------
>  drivers/gpu/drm/xe/xe_pci.c          |  4 +-
>  4 files changed, 1 insertion(+), 103 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b4039cf29fd4..d83400bbff8b1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -65,12 +65,6 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> -struct xe_device_remove_action {
> -	struct list_head node;
> -	xe_device_remove_action_t remove;
> -	void *data;
> -};
> -
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -752,9 +746,6 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> -	xe->probing = true;
> -	INIT_LIST_HEAD(&xe->remove_action_list);
> -
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> @@ -904,8 +895,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> -	xe->probing = false;
> -
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> @@ -916,72 +905,6 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
>  
> -/**
> - * xe_device_call_remove_actions - Call the remove actions
> - * @xe: xe device instance
> - *
> - * This is only to be used by xe_pci and xe_device to call the remove actions
> - * while removing the driver or handling probe failures.
> - */
> -void xe_device_call_remove_actions(struct xe_device *xe)
> -{
> -	struct xe_device_remove_action *ra, *tmp;
> -
> -	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
> -		ra->remove(xe, ra->data);
> -		list_del(&ra->node);
> -		kfree(ra);
> -	}
> -
> -	xe->probing = false;
> -}
> -
> -/**
> - * xe_device_add_action_or_reset - Add an action to run on driver removal
> - * @xe: xe device instance
> - * @ra: pointer to the object embedded into the object to cleanup
> - * @remove: function to execute. The @ra is passed as argument
> - *
> - * Example:
> - *
> - * .. code-block:: c
> - *
> - *	static void foo_remove(struct xe_device_remove_action *ra)
> - *	{
> - *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
> - *		...
> - *	}
> - *
> - *	int xe_foo_init(struct xe_foo *foo)
> - *	{
> - *		...
> - *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
> - *		...
> - *		return 0;
> - *	};
> - */
> -int xe_device_add_action_or_reset(struct xe_device *xe,
> -				  xe_device_remove_action_t action,
> -				  void *data)
> -{
> -	struct xe_device_remove_action *ra;
> -
> -	drm_WARN_ON(&xe->drm, !xe->probing);
> -
> -	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
> -	if (!ra) {
> -		action(xe, data);
> -		return -ENOMEM;
> -	}
> -
> -	INIT_LIST_HEAD(&ra->node);
> -	ra->remove = action;
> -	ra->data = data;
> -	list_add(&ra->node, &xe->remove_action_list);
> -
> -	return 0;
> -}
> -
>  void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -991,8 +914,6 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_display_driver_remove(xe);
>  
>  	xe_heci_gsc_fini(xe);
> -
> -	xe_device_call_remove_actions(xe);
>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index a6fedf1ef3c7b..0bc3bc8e68030 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -45,10 +45,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
> -int xe_device_add_action_or_reset(struct xe_device *xe,
> -				  xe_device_remove_action_t action,
> -				  void *data);
> -void xe_device_call_remove_actions(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b322d49c83c77..833c29fed3a37 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,7 +35,6 @@
>  #include "intel_display_device.h"
>  #endif
>  
> -struct xe_device;
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -71,8 +70,6 @@ struct xe_pxp;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> -typedef void (*xe_device_remove_action_t)(struct xe_device *xe, void *data);
> -
>  /**
>   * struct xe_vram_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -431,20 +428,6 @@ struct xe_device {
>  	/** @tiles: device tiles */
>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
> -	/**
> -	 * @remove_action_list: list of actions to execute on device remove.
> -	 * Use xe_device_add_remove_action() for that. Actions can only be added
> -	 * during probe and are executed during the call from PCI subsystem to
> -	 * remove the driver from the device.
> -	 */
> -	struct list_head remove_action_list;
> -
> -	/**
> -	 * @probing: cover the section in which @remove_action_list can be used
> -	 * to post cleaning actions
> -	 */
> -	bool probing;
> -
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
>  	 * triggering additional actions when they occur.
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 41ec6825b9bcc..447eacb355d7c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -900,10 +900,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe(xe);
> -	if (err) {
> -		xe_device_call_remove_actions(xe);
> +	if (err)
>  		return err;
> -	}
>  

For the series:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	err = xe_pm_init(xe);
>  	if (err)
> -- 
> 2.48.1
> 
