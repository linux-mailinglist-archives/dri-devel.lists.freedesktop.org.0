Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A75B244F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 19:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF09E10EB74;
	Thu,  8 Sep 2022 17:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17B910EB74;
 Thu,  8 Sep 2022 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662657689; x=1694193689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YJz2dcVuBdAElVpoLDoELXabptFUOR4HcbCyYP/ELrE=;
 b=coF+eNkEu2zCPNsETZuvKhze/CnsxcIhJO0ER6AmqeJMsBi50ttdfOvF
 tDqcdQSZE3spjg9GBPseQVY76S6gb+yXLvAHelEFEwZFK7W8l+0Px7/tT
 n4v3KY4QQAkefT1iMl52uLvSjk3a2XDoe5pFhKtb9YEu8S/LdPcxldF+Q
 W8x8pCuHD5i4ee3QUsIB/8SgxoqCKAkPgTjWddookR1Uw9rkkXOi+/O40
 UnNTmVee5jxr8LWxD0eAp3e4hcALSDKGPQwraOn+llnt/ZXWOTly7PQe2
 x2oY3250zKizq0LomANhO9i6T8I+mu/bl2BRX00yFlJvwkSPd2YIftgld w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="358998491"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="358998491"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 10:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="617552629"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2022 10:21:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 10:21:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 10:21:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 10:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnVDyJSvnt+e47IAbtcI8Ck51eqPIUGAMmoNefcJ9Z8OV/TNN2oilHxc0ntXRqmDAUidc7Jn+vZMnJo5w2jzYdTAi0W16JYl7whUCq5XuXSoP3TsF+uQlcVTCfTiwPCVztRlH0A0ookr7XIe09ddHZDXhZ828k4PxdoAe1rCkjHmMZwMxP1AIUxUEPUmQ2Ay6XkfypZE9LMaJ6DQ/tMSyMgEbZoFN6xyORk6OzIiCxKXl0a2LsKT4uAdSdrP8L26l8P9Yu3UwKSjS8NFxdkamqrsuKY8+wj1SWlhPq5WiqefgA9n/SZpnOXi02mBkPrldbE1X1rouXdb6wHx31mrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s41Q4X6Ddg6hb2lVw925TBzdSYsfk2XyhEMlcgbtakI=;
 b=TiqoadatpbHRiOgqezusTr4197X7amBtXZWDdRANGBfJPs2awuK/s00TDObsp/NQPJmC2vTSUUTWxCjgw8bh2urOotjC1v3p4ailT+9yYsDvZHyFFnk1OR6drZQmSUYY3Waxf1OHz3lXg1jaF9/IKX+sFOhYEstmUUHbkN6ZzWn6DTrXJJco6h23D5OGCfvbmdoINF02j/Wg3M3y3vrbYvdpEFHqUqdhwahqLK95Jhl97195f93RB3n27DgkGbgrVt4azfc5Qvzce3z3FiMgXQwef3tSB92tzMd3ES0QCcodKboI0qeTdxBCS0oTtIDptZo+RVxdu+f5GuLWeUHhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY4PR11MB1877.namprd11.prod.outlook.com (2603:10b6:903:127::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Thu, 8 Sep
 2022 17:21:25 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 17:21:25 +0000
Date: Thu, 8 Sep 2022 10:21:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4.1] drm/i915: Move display and media IP version to
 runtime info
Message-ID: <Yxokk5v2W9rK+0i+@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-2-radhakrishna.sripada@intel.com>
 <20220902221054.173524-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220902221054.173524-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d922a13-8dbb-4bdf-073f-08da91be8efe
X-MS-TrafficTypeDiagnostic: CY4PR11MB1877:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pxSE1obMRImobqDDCyp7TGINUqy9pEY6jXR7DTcMqUCZvOutwJmuVaDDAUUwI/4SlX6/avf3PUhqEWJPy7k1fCK0Z+j67RBM6FEHIRbQat3kFN+h+Jh9NVXxNNELPvv0VlFdhJyrObfoPb7dY7YwNJNsHzSwzejOUdwWZwE0vGBV8wQ0ipz3w/XbT6O0eBkH+pAct9hT2gWREtMDGs0H4PiB1ASX4dVvvFl6OSaaNtH4aF4olB+GFG0nB/MQpsUmKT+Ji3OVLOJ2wabroEejRLbY7UtR0p3IAYvqYG/SZ1WGhCJrHnX6WlWTmXkRZCsUVJG+pwVZk4ABTRfq3GVlg8PlhZXo5AJhfcIkTlpI06o4bVHsWJU3YgL00KMpTx4oPE9Ikr1qsccMpJ/eNln+bpWGetJFqswoG2SdepRNNlUqv0G6+cwHQsu3wg8KvChSRerTcgFWveHMAtS80pNUX3umNFIBotQlVut5MW3DhKcrzvtgX2PHesig8dFdTySeekGIX/3aIOWhNcxNrY9wg8KO5UPHttpscWrM1j5g/yjjYrkGY7fUgQWCF9oMDwFXD6u2McKMBOUd7ja1hZJLm4S/aZiES4qwnlN902pxIWzv70hc1I7LPXfB/LaAifvjxFSu1jELwhnUP+VWwc6hihHzRSWJaSFSWwc1fEe2gcPdf0gDWWiYAnIbCJ2u3Dm9ItqoAUAEMCOwUwdSl9jAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(376002)(39860400002)(396003)(186003)(66946007)(66476007)(66556008)(8676002)(26005)(6512007)(41300700001)(83380400001)(6486002)(478600001)(6506007)(82960400001)(86362001)(4326008)(8936002)(6636002)(2906002)(30864003)(450100002)(316002)(6862004)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqHYm79MucPiQ6iGrytcvOuntSGzEGxEkhJpG3/Zv0SymJHZwqw9ugQ6lXKu?=
 =?us-ascii?Q?gV7JaIycLupokvHuxAM4LndJHLfcvJ945xRJLefaHIeDwmxWrCUqwEFsPwX8?=
 =?us-ascii?Q?DPmpk1HW7g7vi/ChClSUGewKWxfzn0vIMGnfrxVkSed9kqVgWHajxJZo8S/A?=
 =?us-ascii?Q?mfGfkihfXQ1jJgsSlb9scYwlKfUkm07YOaG8OTchMraTrDSN4gUvTjBeMhQ+?=
 =?us-ascii?Q?Qmx8C3ECr8o9HE2VRSoPAm4Yjv7i1+BQFNkiYiXnBkGl+Cba8uaIgAPOp1gL?=
 =?us-ascii?Q?Jb8fP5OtGfiEXUUKvqD9h/0SLjhqysfpiNWsOxVZ4GeTjRzEjakjyy89yeLF?=
 =?us-ascii?Q?WtNQITwKI5DfKwTqtV4Lw72Ri/kiCJlOnG/NrZX4+LUZQbD9rpuC88Dejs1r?=
 =?us-ascii?Q?5OUEOvbKHDpK1MVtpLzswsI8oHBNqVMOOjYplvuWHV0jD9OhfxTkP9Z3a1I6?=
 =?us-ascii?Q?niARBwV+w3Y2g0D+4wfObq52XbXrw7h5XdzWh7+NNKhWsZcL/GcD2RuxdENT?=
 =?us-ascii?Q?8VuD5rERiw0gHhH1yWhwGMR1odNxY3Bn/puWlWppaxar5SFxpllZrStvOruu?=
 =?us-ascii?Q?LH2SOQwU8RcRzMBqSKPw9HST/UU1iqJ21ZCX5sBTZRemhHDnnlJA31w+tuBL?=
 =?us-ascii?Q?KzwLukr/ytY73OEs+IEhU8CKrhmPYJhTLu6FIPo32XijgDN0BBAK+SDROjy/?=
 =?us-ascii?Q?HZSI0hn0Hqng96ZviggbpuqzyUj/Y/LYCdleKiZaHtovfJBySJ6/EVFldU+C?=
 =?us-ascii?Q?tf10QM+nCZBR/8vKOqgqE/gUueOinaJFjqL7K9AbuVJcHzqHnSUokue3Dn1d?=
 =?us-ascii?Q?jaiCV2MaWEdxWjhYYn1uztLq5rgVMe+DvYaPogTX0e9kjuNFBlUXEKl6GAlN?=
 =?us-ascii?Q?YaywCZTkN/0olNxNcrtg/a/TfBYWj8d06erJw46/DKBzJJG2jSwY1EtmOPtE?=
 =?us-ascii?Q?olSaDiMMDiFVJukGwvAEa7NQItNIOGG3axAKwS8nWAUnAy7himVtEzLbx4nW?=
 =?us-ascii?Q?NRejfVV5mKNclUzckHyeYbNwOm0fiWd3TV7FDgSWsF6wAk3v1CarvMPBX3lE?=
 =?us-ascii?Q?R0G9bDVksIWoFPZncdlLTnCaRJYOHIGkIJTGLhWl2CBiS/7cYOf23RrDyIbH?=
 =?us-ascii?Q?RA5g88E2rwkPqzan3LI9pCN+6eh6zP5dY5zEGJh4tKAnEvVJex2v1zfV616o?=
 =?us-ascii?Q?M6G1Ng1oiXmez1bxWD4WH0+VxHw1TtW/OMZJ3y62mD/xm1efh1eVCq39bSet?=
 =?us-ascii?Q?ldEMX2yN0IQUq6XAXZCRLgCpTC/T8RbAJNHXRRoWIdMan5GUH1ChBIyBDCb1?=
 =?us-ascii?Q?WP6071trD4mjEOYqqMG+1VA0WdI6y+YkI0xP2ucHvTEA9bfMiCXNB/+COoTZ?=
 =?us-ascii?Q?aGOq1PlCx/RjQz6FlwzqVB00gBo0wnKLq06rUMQAFM8ME0hiYQZxrDGtpqJm?=
 =?us-ascii?Q?3Y6V69aHHYIlH9cZUOyz7Kf2I5dGvk2WHYSBgVjEqmgECO/pYTGo3eMN1lc1?=
 =?us-ascii?Q?+vuWkbjJykBH4ut2Bz2rGOjMyxDfZ+ePton+JR6yWFziYCyVR66ZYuSNtihp?=
 =?us-ascii?Q?VvtkAtu+w4kl+7Xny273DhkM6eHIkM2pLLZNkxAykfoy4zsOiw46pcE0Ja5Y?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d922a13-8dbb-4bdf-073f-08da91be8efe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 17:21:25.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvTNDxD7yRcQVLDjZCjqcOL0n8+mtx7ocJfNPJgmIN/ItxKSaZ26+ACB8WW/5Vp2EdPvc3xPjn/Dd9tVesNCnZBMOgpnkkz+oupW0/VEmpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1877
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 02, 2022 at 03:10:54PM -0700, Radhakrishna Sripada wrote:
> Future platforms can read the IP version from a register and the
> IP version numbers need not be hard coded in device info. Move the
> ip version for media and display to runtime info.
> 
> On platforms where hard coding of IP version is required, update
> the IP version in __runtime under device_info.
> 
> v2:
>  - Avoid name collision for ip versions(Jani)
> v4.1:
>  - Fix build error in mock_gem_device.c
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h               | 14 +++----
>  drivers/gpu/drm/i915/i915_pci.c               | 38 +++++++++----------
>  drivers/gpu/drm/i915/intel_device_info.c      | 28 +++++++++-----
>  drivers/gpu/drm/i915/intel_device_info.h      | 15 +++++---
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  2 +-
>  5 files changed, 54 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index c9cca165bf5d..f85a470397a5 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -469,19 +469,19 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  
>  #define IP_VER(ver, rel)		((ver) << 8 | (rel))
>  
> -#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.ver)
> -#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.ver, \
> -					       RUNTIME_INFO(i915)->graphics.rel)
> +#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.version.ver)
> +#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.version.ver, \
> +					       RUNTIME_INFO(i915)->graphics.version.rel)
>  #define IS_GRAPHICS_VER(i915, from, until) \
>  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>  
> -#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
> -#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
> -					       INTEL_INFO(i915)->media.rel)
> +#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.version.ver)
> +#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.version.ver, \
> +					       RUNTIME_INFO(i915)->media.version.rel)
>  #define IS_MEDIA_VER(i915, from, until) \
>  	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>  
> -#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
> +#define DISPLAY_VER(i915)	(RUNTIME_INFO(i915)->display.version.ver)
>  #define IS_DISPLAY_VER(i915, from, until) \
>  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 26b25d9434d6..f6aaf938c53c 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -34,9 +34,9 @@
>  
>  #define PLATFORM(x) .platform = (x)
>  #define GEN(x) \
> -	.__runtime.graphics.ver = (x), \
> -	.media.ver = (x), \
> -	.display.ver = (x)
> +	.__runtime.graphics.version.ver = (x), \
> +	.__runtime.media.version.ver = (x), \
> +	.__runtime.display.version.ver = (x)
>  
>  #define I845_PIPE_OFFSETS \
>  	.display.pipe_offsets = { \
> @@ -740,7 +740,7 @@ static const struct intel_device_info bxt_info = {
>  static const struct intel_device_info glk_info = {
>  	GEN9_LP_FEATURES,
>  	PLATFORM(INTEL_GEMINILAKE),
> -	.display.ver = 10,
> +	.__runtime.display.version.ver = 10,
>  	.display.dbuf.size = 1024 - 4, /* 4 blocks for bypass path allocation */
>  	GLK_COLORS,
>  };
> @@ -919,7 +919,7 @@ static const struct intel_device_info rkl_info = {
>  static const struct intel_device_info dg1_info = {
>  	GEN12_FEATURES,
>  	DGFX_FEATURES,
> -	.__runtime.graphics.rel = 10,
> +	.__runtime.graphics.version.rel = 10,
>  	PLATFORM(INTEL_DG1),
>  	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
>  	.require_force_probe = 1,
> @@ -962,7 +962,7 @@ static const struct intel_device_info adl_s_info = {
>  	.display.has_hotplug = 1,						\
>  	.display.has_ipc = 1,							\
>  	.display.has_psr = 1,							\
> -	.display.ver = 13,							\
> +	.__runtime.display.version.ver = 13,							\
>  	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),	\
>  	.display.pipe_offsets = {						\
>  		[TRANSCODER_A] = PIPE_A_OFFSET,					\
> @@ -1006,8 +1006,8 @@ static const struct intel_device_info adl_p_info = {
>  		I915_GTT_PAGE_SIZE_2M
>  
>  #define XE_HP_FEATURES \
> -	.__runtime.graphics.ver = 12, \
> -	.__runtime.graphics.rel = 50, \
> +	.__runtime.graphics.version.ver = 12, \
> +	.__runtime.graphics.version.rel = 50, \
>  	XE_HP_PAGE_SIZES, \
>  	.dma_mask_size = 46, \
>  	.has_3d_pipeline = 1, \
> @@ -1027,8 +1027,8 @@ static const struct intel_device_info adl_p_info = {
>  	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
>  
>  #define XE_HPM_FEATURES \
> -	.media.ver = 12, \
> -	.media.rel = 50
> +	.__runtime.media.version.ver = 12, \
> +	.__runtime.media.version.rel = 50
>  
>  __maybe_unused
>  static const struct intel_device_info xehpsdv_info = {
> @@ -1053,8 +1053,8 @@ static const struct intel_device_info xehpsdv_info = {
>  	XE_HP_FEATURES, \
>  	XE_HPM_FEATURES, \
>  	DGFX_FEATURES, \
> -	.__runtime.graphics.rel = 55, \
> -	.media.rel = 55, \
> +	.__runtime.graphics.version.rel = 55, \
> +	.__runtime.media.version.rel = 55, \
>  	PLATFORM(INTEL_DG2), \
>  	.has_4tile = 1, \
>  	.has_64k_pages = 1, \
> @@ -1097,8 +1097,8 @@ static const struct intel_device_info pvc_info = {
>  	XE_HPC_FEATURES,
>  	XE_HPM_FEATURES,
>  	DGFX_FEATURES,
> -	.__runtime.graphics.rel = 60,
> -	.media.rel = 60,
> +	.__runtime.graphics.version.rel = 60,
> +	.__runtime.media.version.rel = 60,
>  	PLATFORM(INTEL_PONTEVECCHIO),
>  	.display = { 0 },
>  	.has_flat_ccs = 0,
> @@ -1111,7 +1111,7 @@ static const struct intel_device_info pvc_info = {
>  
>  #define XE_LPDP_FEATURES	\
>  	XE_LPD_FEATURES,	\
> -	.display.ver = 14,	\
> +	.__runtime.display.version.ver = 14,	\
>  	.display.has_cdclk_crawl = 1, \
>  	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>  
> @@ -1123,9 +1123,9 @@ static const struct intel_device_info mtl_info = {
>  	 * Real graphics IP version will be obtained from hardware GMD_ID
>  	 * register.  Value provided here is just for sanity checking.
>  	 */
> -	.__runtime.graphics.ver = 12,
> -	.__runtime.graphics.rel = 70,
> -	.media.ver = 13,
> +	.__runtime.graphics.version.ver = 12,
> +	.__runtime.graphics.version.rel = 70,
> +	.__runtime.media.version.ver = 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.display.has_modular_fia = 1,
>  	.has_flat_ccs = 0,
> @@ -1281,7 +1281,7 @@ bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
>  
>  static bool intel_mmio_bar_valid(struct pci_dev *pdev, struct intel_device_info *intel_info)
>  {
> -	int gttmmaddr_bar = intel_info->__runtime.graphics.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
> +	int gttmmaddr_bar = intel_info->__runtime.graphics.version.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
>  
>  	return i915_pci_resource_valid(pdev, gttmmaddr_bar);
>  }
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 0a1f97b35f2b..56f19683dd55 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -92,21 +92,29 @@ void intel_device_info_print(const struct intel_device_info *info,
>  			     const struct intel_runtime_info *runtime,
>  			     struct drm_printer *p)
>  {
> -	if (runtime->graphics.rel)
> -		drm_printf(p, "graphics version: %u.%02u\n", runtime->graphics.ver,
> -			   runtime->graphics.rel);
> +	if (runtime->graphics.version.rel)
> +		drm_printf(p, "graphics version: %u.%02u\n",
> +			   runtime->graphics.version.ver,
> +			   runtime->graphics.version.rel);
>  	else
> -		drm_printf(p, "graphics version: %u\n", runtime->graphics.ver);
> +		drm_printf(p, "graphics version: %u\n",
> +			   runtime->graphics.version.ver);
>  
> -	if (info->media.rel)
> -		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
> +	if (runtime->media.version.rel)
> +		drm_printf(p, "media version: %u.%02u\n",
> +			   runtime->media.version.ver,
> +			   runtime->media.version.rel);
>  	else
> -		drm_printf(p, "media version: %u\n", info->media.ver);
> +		drm_printf(p, "media version: %u\n",
> +			   runtime->media.version.ver);
>  
> -	if (info->display.rel)
> -		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
> +	if (runtime->display.version.rel)
> +		drm_printf(p, "display version: %u.%02u\n",
> +			   runtime->display.version.ver,
> +			   runtime->display.version.rel);
>  	else
> -		drm_printf(p, "display version: %u\n", info->display.ver);
> +		drm_printf(p, "display version: %u\n",
> +			   runtime->display.version.ver);
>  
>  	drm_printf(p, "gt: %d\n", info->gt);
>  	drm_printf(p, "memory-regions: %x\n", runtime->memory_regions);
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 6904ad03ca19..d36cf25f1d5f 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -200,7 +200,15 @@ struct ip_version {
>  };
>  
>  struct intel_runtime_info {
> -	struct ip_version graphics;
> +	struct {
> +		struct ip_version version;

Bikeshed:  It might be more natural to name these inner structures 'ip'
rather than 'version' so that elsewhere in the code we'll be dealing
with things like runtime->graphics.ip.ver and runtime->graphics.ip.rel.

Up to you though.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	} graphics;
> +	struct {
> +		struct ip_version version;
> +	} media;
> +	struct {
> +		struct ip_version version;
> +	} display;
>  
>  	/*
>  	 * Platform mask is used for optimizing or-ed IS_PLATFORM calls into
> @@ -246,8 +254,6 @@ struct intel_runtime_info {
>  };
>  
>  struct intel_device_info {
> -	struct ip_version media;
> -
>  	enum intel_platform platform;
>  
>  	unsigned int dma_mask_size; /* available DMA address bits */
> @@ -259,9 +265,6 @@ struct intel_device_info {
>  #undef DEFINE_FLAG
>  
>  	struct {
> -		u8 ver;
> -		u8 rel;
> -
>  		u8 abox_mask;
>  
>  		struct {
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f5904e659ef2..869b952c13a0 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -172,7 +172,7 @@ struct drm_i915_private *mock_gem_device(void)
>  	/* Using the global GTT may ask questions about KMS users, so prepare */
>  	drm_mode_config_init(&i915->drm);
>  
> -	RUNTIME_INFO(i915)->graphics.ver = -1;
> +	RUNTIME_INFO(i915)->graphics.version.ver = -1;
>  
>  	RUNTIME_INFO(i915)->page_sizes =
>  		I915_GTT_PAGE_SIZE_4K |
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
