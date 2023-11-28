Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A645B7FC0FC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 19:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4CE10E5A0;
	Tue, 28 Nov 2023 18:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57F10E186;
 Tue, 28 Nov 2023 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701194756; x=1732730756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hq8ntbZWOSAmHMUF+ujiSZXL5f9Anr9ZjrPm72iJ3RY=;
 b=hxL1/bGmOEfyGdLnt1C0hdq9MegYnxFF5FTY17RTlWYPwiqH5FE/ARug
 HR3w19Gf6w2Q7gZOV0bSiTmHqJ+kuhEPNRd11OTlqSxshE8BEBwe306oq
 bZGRA7hCRC+MO2l3KGgp82Dq/R/7xdZcO3a2wcXkWRxsded5K9b94S3W2
 7PYbCTK9CXLql+VIiGTj/Fv3Hce6rJ98m35oDBCPW6Rb+DdFerpgcYHa5
 9b5VBDtwCGQXPeLpeAMDdWY41jcySimdSAWmJnvxz5W+ZyEcH81VubSKj
 ICbks+n9yqLEtZql0ftrrsy3Sj9tTVawPkDiFlqpGy3fb0PgOoqib+tW8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395802482"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395802482"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 10:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839143408"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="839143408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 10:03:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:03:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:03:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 10:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGPOEFhthk5FZQBn1Ztpc+fgtMcTWiWSjX2NCIXi6gnjGWU7dCvVa28R5hfr5jJb3TKKxU48a/DD8sImLyL85Ka7IT7qkKH81yXDHBZfMPJh21q5xHl3s866nf3732FkHjTcbRG0HEExczEjlOLJUHR3GScqpDwvB6mmbgBrVD1u4NFSIsKjTL4Xmwy2Q9fFv8P0bWbOidmdjxggyzmhgpAnCWCUXmqlFS0aix2B/sjPVNlX0C1b2lAq1QNE9YIv+otyI7yGQX2R7pjLY/ePf73bLxSiCeXYuYufLb4YUgXiXNUgihc5SB3UhtWzEBWlHTgU7Ax2eFdQpcMtT1yB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDSpfVdZMsY8WVv2uCW95qVB3Fmuqp4lajcfvfmGdLU=;
 b=NZR9ToL2YgrOgU9anvL+w2MMu6QdjfOygJWZ0WKsfYcyWSvnfuZe3VlP6LQZ7iNBJXSZ9/dbhZNyE1FfG7/bKIKS3ysJkmWs0C5mXmGgvFEBpdNO4ELpEEPYpDPkRktIF4AQfnRX1K1aZ0nBe42AAGkMqs/LqNN/jsz5cpg5k2R6ybX15bQynh07xg2LRNetNurJKg6Z7pkDQkenMICTPpkrSQ/vbJX+JX7MHGIieiXbLgZ4kcfq521mQNoZmeVkSgaUcVWlpaWTrSS0qq12jGqU81ZAIYKNv9Sk1UjMjxjU091lXQVePKbncFo7vj1YtgxzskjPdlRy4wrJHQNehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 18:03:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 18:03:24 +0000
Date: Tue, 28 Nov 2023 10:03:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/1] drm/i915/pxp: Add missing tag for
 Wa_14019159160
Message-ID: <20231128180321.GL5757@mdroper-desk1.amr.corp.intel.com>
References: <20231127201150.8407-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127201150.8407-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: d44e66b7-0136-4eac-7349-08dbf03c5048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0sV269X1RNjS7l8CSGc3FJ1XhOiL/224Feyi7feMUgqNF+dTHkpLs+RuewC1zJpL4QP5c1wj94IQY2LvKjMyd6Gdwn07LstVLCLbibnd7jQGUnpb4oS3PWuUsrDIJbI44vdPRFhuQCW5gHDwDB+vsSD8c8JgOc3vBdrds5bzLxVaIbex8J9MStL9P2SkuvGFmMKh5REDWTJ92Zbs9z+sge6HoN3EeKY97M+4bGmhsdCU2HZWhmF6eE53Ks+lB/GKGs7trWPgQMPRaqfDOlyWpXPGTt+d70C3E+S/U7UOgNQVM5krpp2Bk7IvtvJ209Zl/J3MvX8fYnevpkPRMX9lH/XA2E2IB5nRW+iQ3+Jebi7nn+qUIrHWHIEsQNm9TiWCk4Wz98xbFNZLaIoJvWyli7xGBOZm23x36eYdRB+1ZfNGulJNIh1Y8HSpX2t/JKan+D1Hq3ECF/ZuyOdA5IOJsMVPZtx6RPf7gu8qrja9gPP2sVIWoxUc/nylOkWYY5IKs4D7cmT80qz6G9ftZiNkLfJlTYfzD9VmjU0teLiZ16K+TEy08VTiddPvP1+qYeg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(316002)(66476007)(66556008)(6636002)(450100002)(8936002)(8676002)(6862004)(4326008)(6486002)(478600001)(2906002)(86362001)(5660300002)(41300700001)(33656002)(38100700002)(1076003)(6506007)(6666004)(6512007)(83380400001)(26005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yp1xo3SfiGxihv/eg3OcQ5m9IhD5ioC/q1SCR+xIKhE+a8muzXn43ujYC6hq?=
 =?us-ascii?Q?yugJzAG1nrlz7SujqhDUBwGN7GwekE3SROfY6/dMQ17mVC8MaAdFA+Ms1ubE?=
 =?us-ascii?Q?DPQj+xv19o9m56t7xMeDg3xhccL50obwslSapxfkrZYmBkwdi4DtOYa+GJ+8?=
 =?us-ascii?Q?JGMvW2jcfQjNZfkkTapFPU6/v1znhCnM87FfinzcO3456YZnym30efyY9yWU?=
 =?us-ascii?Q?uU21RsVEcMt7hED3Z3h29BXAGgQPqkFpbrX0F/cjJKLYiZafxyEbXLFxITP8?=
 =?us-ascii?Q?KjZeZLQMELRmmXgCKNP6etBEUzcmxcrdSJaUKCYDydfhWgmx9lBU8hWV7fmI?=
 =?us-ascii?Q?nsqSQSICo4nab3AHJnC+uOROdb49LT4gOYdnDbPCp8nufqHH9B0VzAWbJhN4?=
 =?us-ascii?Q?bS0hYWjRUicjkJ3Dl60yqQplptpoUu2JX6fdPJ+hMwRkdV/0FWakOA554ekp?=
 =?us-ascii?Q?WtyycSIC0f//RBsJDnDMIw70sow9j3vpTtJlmXpR1fNDGV1oUkQL/rYd4BdC?=
 =?us-ascii?Q?vt7WTeXSY7/PtMEgQVEP0FusHfUs/A5kwQgkxNJYhRUudeaZCVut9x78+yNF?=
 =?us-ascii?Q?nzXcPvWAGRBy/cbfRlKiAOyD2gu869FhB+6+mFRRDv3a5XR2V78qXVNoognL?=
 =?us-ascii?Q?EuXr6ukSPraUfDv/i/AUCKoRcfLRaJiUfVafUm6grZq0t4LsyPWxnsZi1OsA?=
 =?us-ascii?Q?L00tutdWnoTR+q3kI5/5bTHegQKC4LsCs5HXZDOSRMx2m1tQwYWd7DTdAfYI?=
 =?us-ascii?Q?pYOiO5PRTYd8KL6bWkR+uMK8rD2olP8wuSGFyE9/KCqQ4dG5UlfdiU9jkn9d?=
 =?us-ascii?Q?SrVmMXyEmfA1P9oY2XKQw7G+BDTz9vtql8F61nVxzlkdfl4WdlbtfqjpprvF?=
 =?us-ascii?Q?UvKHt/YTymd5zWafsQNwFyLJfzWeIFXE5AzNHE3vq+AsMRE2nlPJVtipBbnq?=
 =?us-ascii?Q?xUV+q70IIjll3tEnWinQ0iS2Eo8wm8/gRYlCYRMUjlSnmJAlOQ2aYAyo7Yhw?=
 =?us-ascii?Q?tXQWrJD/lzLmMWoEjCGuo3SXiJSH0v1ePTNQgTe5zOKTRHNgbW/uFinprrpR?=
 =?us-ascii?Q?ptOAgSS5YR9cheg6XkXvUaTQzw3+ji/r81gUl8E7hE9HE7AFWx9d5OhCsHBw?=
 =?us-ascii?Q?pX/HhDW5lys3khT1WAkxD6LoxEdrLZJeAIb3/b98Hxbw3mqPTcnNoiNJ/N/h?=
 =?us-ascii?Q?MOLagAf2nFDcqORUf9BzyLAybPwMdVHDYue3uAqXF3GmMmGFi3e3jEbYXWzA?=
 =?us-ascii?Q?oJ/X1GYnFa93ZHRRQ8TEJDSrjQZvo1W73wtIRxKIr9ti4i2A6l6p4On7yA0g?=
 =?us-ascii?Q?O+a+UrnVka7U4faXqH4xFgQISis1oswdZtnyO8JT+zN8iNP01vW2Jqup4ZCk?=
 =?us-ascii?Q?9t1Nysmwz6oNYxHvolEzCJ74fZd+4NYk80pkrZhpJ1N/WzwAcwV9K8uGv89/?=
 =?us-ascii?Q?I0xvmZ6JSMAHvU3Abh50K5mkeJYhoDhyswXC1Y5L8EQbKLH8n16+HtvyV3e+?=
 =?us-ascii?Q?irWJhLsfH+0i/MYDHGRVhfA5iWBjZ3iegP0C4k4ah7UOMAN4hFH7BKUJPbDr?=
 =?us-ascii?Q?IQnIZL/ClQ5GZOM5Cwv9k44FRTi7u+2Vk+n/mrR2bVu1Yk/RttwqagdUFVNx?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d44e66b7-0136-4eac-7349-08dbf03c5048
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 18:03:23.9713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9WoG0wn3BB81tw25VR0jDr3dUSmoA9vJ9ylakJRdNAtEL5+P0e2dj7YsOrwceSciiSH+r5A/5doAkAXcRXB+xpuTqOhHzw9piNeokzi36I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

On Mon, Nov 27, 2023 at 12:11:50PM -0800, Alan Previn wrote:
> Add missing tag for "Wa_14019159160 - Case 2" (for existing
> PXP code that ensures run alone mode bit is set to allow
> PxP-decryption.
> 
>  v3: - Check targeted platforms using IP_VAL. (John Harrison)
>  v2: - Fix WA id number (John Harrison).
>      - Improve comments and code to be specific
>        for the targeted platforms (John Harrison)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7c367ba8d9dc..1152cf25d578 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -863,10 +863,12 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
>  	bool ctx_is_protected = false;
>  
>  	/*
> -	 * On MTL and newer platforms, protected contexts require setting
> -	 * the LRC run-alone bit or else the encryption will not happen.
> +	 * Wa_14019159160 - Case 2: mtl
> +	 * On some platforms, protected contexts require setting
> +	 * the LRC run-alone bit or else the encryption/decryption will not happen.
> +	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
>  	 */
> -	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
> +	if (GRAPHICS_VER_FULL(ce->engine->i915) == IP_VER(12, 70) &&

The workaround database lists this as being needed on both 12.70 and
12.71.  Should this be a

        IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))

check instead?

The workaround is also listed in the database as applying to DG2; is
this "case 2" subset of the workaround not relevant to that platform?


Matt

>  	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
>  		rcu_read_lock();
>  		gem_ctx = rcu_dereference(ce->gem_context);
> 
> base-commit: 5429d55de723544dfc0630cf39d96392052b27a1
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
