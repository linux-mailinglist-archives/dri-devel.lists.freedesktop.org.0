Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF97832C2C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 16:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A126D10EA43;
	Fri, 19 Jan 2024 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E710EA41;
 Fri, 19 Jan 2024 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705677204; x=1737213204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ctFS1W7bOYg7SD5tACVJt4rG+SeKpxV0gWchQOIYEfs=;
 b=YEvFES49yCr+YG9jZIhN9ee6tyjzMB6jkFwUy44fRgbpR5lm6AhHo5I2
 UARKzj+IrSPdrJfXwqD+MAEXjhh3XaTJimj8B1wx3JAwYpvPLhIo1k/L9
 vqItCSPtXzrYd4AK1cdHkN/6GH7dsDiOycmSvqN+R50VzG7wnYDJiXexn
 mDS9f/lnQ7+1WcIdtztp1iNufTMCNdKusflGe09yR0UVLXjNAWTFbUlY5
 XICQdx+nyIaTgGF6IeUSTMFOWRQK0o2RUaoethKBkkxpeyCJOF+MRL/Kg
 mNX3iZZ9PiF69YkbiI3vQ0P8cysz4kIUYfsbmfAceeqLOTr5QVHGLhUJC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="397932599"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="397932599"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904163835"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="904163835"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 07:13:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:13:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 07:13:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 07:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtsuO0UvJdCSq80OwzBkR0URvwwzxoc/RudcfZY3ewZEDL4PrWmZ9V3S/4g8E1gHtMA+Il/Ks4T5XeffTxGMRHfEEM6Co8j/yGOxR27EWRNZBtLVz4y3aOPkchM+iYt3jLdui12X5cFLqH8xzGFfGy6zL4wHv43tK93Hn4hP/I2YuvfU2d/EOphQEgUn3fkWGCHwrfEkErhQswD1wfUPVO8vDqeGGnfk6noAyiE+g1ojArOk00vYt9YbvUzQqLb+3yexyB5TBA9UuCI918ZNZ5vyZ3l+fM8q3mfr3cnYIpyL5HCrAMWb9zE1yBJvxwBH7CpS/z2fejl2h+3vO4/g8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzggK2lcQqdjmMXCRBglJGpI/v8rWVF6gRJl3zQZpoM=;
 b=MIiAYDhIcKSDYIGRvipE6yJ+bjACM9xOqK4YiO2UlYsoo+BTqEDCU18hxYYCedIHklh6L7nmJqwCiB++5TCcbiWWKkAN/bJYvYxFpNxt8qJ3MxWeSmHt0NJeY718bdJ085aTXbIyDjsJwz3rHQV7rVF6MY5xuR08fug15knxFAzU+5m2OBlKyFYwa9pwykPI2L4ZMkrq9msHIOAeSUJ0jTSqew5pzS9U1iY/pcJs6pjFF7ODo+xF11IDiwlckT+4w2MmjpGJWB/u4fnQQOHh8jbl8q55Zg2myNrk2vPddQqmkpf5ybVb8EUL7Do2SGtXULVO+4f4cb4i3t2B72HWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 15:13:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:13:10 +0000
Date: Fri, 19 Jan 2024 09:13:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
Message-ID: <vmyrgwkw7zi5f234cfhl6mzkphrpmsxvb7rpruv7xbc5wjkx4d@jkxky5kmd5c2>
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3a0c63-b793-423e-d06c-08dc19012609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vn7hrTw0b+cKsOzBC9rr7Qm5/K4YzUEwTHP8oBx3n9Yl8Zq2ygnOho4pL4Jggo27kmGTae3DlaDEivHdTFwNOtdQc71QV2/bkvrvgOu1K9j+X5x5IM0sBIMNMIWeQodiQXqkb2yyjPpCGJzQKX9lAuTZw4DA9wCQxnUtdb9H8qYc2EUuLOA3VmHnj6Refax52/YZ2kPWkfe2ZN6EGTEm4PWFCT/nC8tzEBj/nzTGaik30c1lBtwI2BGBkjIMX/OsuO6ixlsFV9+4anRMfseE4pobn0mLDoN4KEFIryJFjazl624/pM9l7cVBM0ILd/MECO/CT3oUiNYPXSTlWbw6cxZ4pKcY4kSyTk0nFKAn5Z0gaBe2BK0Rt+gCEqPkuCvhPLpfGW5rUsubwurWpEqQGxd7lWEq0o8KwndOyPxOeodD551vfSRn1oq1UpaJ0BI4DLGe+urtsjSroDl4Na+ub5un8BSXr7jTI7sB3FOnwWxHWDwiJqEv23nsq6WPjlbtNKzBpOqouMKxi9s4ZP6k6GrWWZE2sXjj0o5lxWf+hppNxnM7zRNKetoJ/yUVuyh1ZSWFhu8Fyozwq5fAeLWBmh7IrsGREHwN0lKGETC4g744J+7x9aG1JQHue6D/OTON
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(8936002)(4326008)(8676002)(26005)(66556008)(66476007)(66946007)(6666004)(6486002)(2906002)(6512007)(316002)(54906003)(6506007)(86362001)(6916009)(66574015)(478600001)(82960400001)(83380400001)(9686003)(41300700001)(33716001)(38100700002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rMmkzJIRs/ZbNzlg73x4iy6XO32aeCgjhsNZ0RL32iDtkjd8Db6KLrU5pu?=
 =?iso-8859-1?Q?z5Wrh72IM4icyfJk2zG0CyoN61xSTivuhUvAVHUzOSAaVuE6/JJwvE97OA?=
 =?iso-8859-1?Q?1VNbSW6gGqtNjkcHBMRA2ouJCOsAoYekVcomAJk5sZ1xR4UriO3BYfm6oK?=
 =?iso-8859-1?Q?SQiHCrbhdREdVQSl34+Daom6BxXkYBxU30thfKrijcMAmNP9EoSND91vnr?=
 =?iso-8859-1?Q?lUP5K8cSk28ZQbYdZjUuBzXaNsFzi3ADOkNnk5NBcQUHW+NUZSNYwFi//i?=
 =?iso-8859-1?Q?RMffSov758nOOPPDpHbzepTmDtMNxvj19Y+nKE9sFMN51xP9pmmxA8JMJb?=
 =?iso-8859-1?Q?DrCd9uOPYDG6DiIho7u6V3iCrlfFq9r/lq/UqPiwZluG7jFVfrtrlLNsLn?=
 =?iso-8859-1?Q?+rDSUQOouKSb97RRds/F0gWWSP5P3IH8xZqSnDsEtVh+bR5vHpHyFuioW5?=
 =?iso-8859-1?Q?wUezHwc4I95Gjlbyq3+SvLt7+n3rxZXSduBWWleM6oiRRy3MGkA7oJLtd2?=
 =?iso-8859-1?Q?bJdC9fq51AkFF4hVIaAbsHfSAcVr/Ag9wQBFSUFdZgQ+d1MRGX/WEdf1Sr?=
 =?iso-8859-1?Q?NQn2ZGmLnseJZJjsh62wFpxyePvhkzvTlrLRNSlAWjdC76h4Gwl5lT8jN9?=
 =?iso-8859-1?Q?MCi470by3u5W/S8wiGAMEPv+Pe5ddG0KPAxLMRttqk+NyvYSUhaqu8LPXC?=
 =?iso-8859-1?Q?80/ZtiJLmRoQYOp9WUDRn7LCEgQCKB0tp4gjkSYUvCCeyyHJa37tYPBr9J?=
 =?iso-8859-1?Q?DYmxoNzFeWUuEguCHPfZYqLw3XRfRSX/OvyUE81QKqKn+qM+kuYEIM4pSN?=
 =?iso-8859-1?Q?s/gyyeovnOIPNBFYmb9I2MBbC84P3fyhXOqZL2w2fZvI11AZD3oFLH5jg4?=
 =?iso-8859-1?Q?Q8weZBDwI410OgAO8U+D/6DLleimWgkYWbft5zpeAnVO2kcUClAOC/LTsd?=
 =?iso-8859-1?Q?kH6x5p5EiTRDb8a7s79Cno227YsVzKRMibAu2pA/Nnj66VV3HPgcPuqFJ8?=
 =?iso-8859-1?Q?SK/TrMhBKu9RYjmAmCzH45y4TV8lcz2WaeqBwXdtuDCwo6tM/nVwMayyu9?=
 =?iso-8859-1?Q?JMflUlQGjbrplLRxVms+zfnPWIxVxyUSNXPO0BEehRmUTZYTw8535pbY6C?=
 =?iso-8859-1?Q?/Me3H4ljY8BQnwTxQqGOFGsSyVddq+eB3gQfYCJ36UYwNzLQGX0KOpa3Be?=
 =?iso-8859-1?Q?Sd3R0fermHmKd5FV88bcBl21sGI9huCCIDGl48LbdsgrEKGL7VbZu2Ary7?=
 =?iso-8859-1?Q?jMq2t+yj59mj11WXk+73yjC1OWkvsK4U46wjZDmaUMQt3AZvmwcFGlSxqL?=
 =?iso-8859-1?Q?6eHODzwUN3MYIbqhdd31lVvy1jsFDA0OPw1LyB1HOTPD5D1NSmESwLiluI?=
 =?iso-8859-1?Q?iqVzRMBoJgm6c1+hRfLdTk8lRrzLi/HbKHpyjKGt7Kl4OyTWu86rQI+2t6?=
 =?iso-8859-1?Q?AeKDhA64p6e0OItAgN6Se3BlLN4eST4msut9l4Cd9jqq2BBESiNWCANXbE?=
 =?iso-8859-1?Q?gYdUmRK8Xwiy1fyqDs4RCcy8x1GOSKrFHTb7fsAO/QIwjR1GIUQSYOVp60?=
 =?iso-8859-1?Q?z6rh5c1KGNFgb3vpiQ52bz5MG330AP5Vt6HdMHdqFesPEd7nOLQ1jojpkB?=
 =?iso-8859-1?Q?NpshuOJ9q5XXCWHKs6EcwIQDGHRsEH5ukCk6DAcnbcjZoGjdmXgT86qg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3a0c63-b793-423e-d06c-08dc19012609
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:13:10.4791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okS1pNHBJnnY8wXm1mYaDAK0yAQg0wDMNF/PBRLUase1OpT+VfDBMFXcBp/j0MTuMK0opFQdeFJJ/8QAIkOKjuCYVH0tBDkMHTcyal+pWi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 10:05:57AM +0100, Thomas Hellström wrote:
>The relatively recently introduced drm/exec utility was using uint32_t
>in its interface, which was then also carried over to drm/gpuvm.
>
>Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
>
>Cc: Christian König <christian.koenig@amd.com>
>Cc: Danilo Krummrich <dakr@redhat.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/drm_exec.c | 2 +-
> include/drm/drm_exec.h     | 4 ++--
> include/drm/drm_gpuvm.h    | 2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I was surprised we have quite a few places using the c99 types rather
than kernel types.

$ git grep -ce uint[0-9][0-9]_t drivers/gpu/drm/*.c
drivers/gpu/drm/drm_atomic.c:1
drivers/gpu/drm/drm_atomic_helper.c:7
drivers/gpu/drm/drm_atomic_state_helper.c:1
drivers/gpu/drm/drm_atomic_uapi.c:17
drivers/gpu/drm/drm_color_mgmt.c:4
drivers/gpu/drm/drm_connector.c:6
drivers/gpu/drm/drm_crtc.c:3
drivers/gpu/drm/drm_damage_helper.c:2
drivers/gpu/drm/drm_debugfs_crc.c:1
drivers/gpu/drm/drm_exec.c:1
drivers/gpu/drm/drm_fb_helper.c:10
drivers/gpu/drm/drm_format_helper.c:6
drivers/gpu/drm/drm_fourcc.c:6
drivers/gpu/drm/drm_framebuffer.c:5
drivers/gpu/drm/drm_gem.c:1
drivers/gpu/drm/drm_gem_dma_helper.c:1
drivers/gpu/drm/drm_gem_shmem_helper.c:1
drivers/gpu/drm/drm_gem_ttm_helper.c:1
drivers/gpu/drm/drm_gem_vram_helper.c:5
drivers/gpu/drm/drm_lease.c:6
drivers/gpu/drm/drm_mipi_dbi.c:3
drivers/gpu/drm/drm_mode_config.c:4
drivers/gpu/drm/drm_mode_object.c:20
drivers/gpu/drm/drm_modeset_helper.c:1
drivers/gpu/drm/drm_modeset_lock.c:1
drivers/gpu/drm/drm_of.c:3
drivers/gpu/drm/drm_plane.c:35
drivers/gpu/drm/drm_plane_helper.c:2
drivers/gpu/drm/drm_prime.c:9
drivers/gpu/drm/drm_probe_helper.c:3
drivers/gpu/drm/drm_property.c:11
drivers/gpu/drm/drm_simple_kms_helper.c:4
drivers/gpu/drm/drm_syncobj.c:26

but maybe not worth the churn for what is already there for a long time?

Lucas De Marchi

>
>diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>index 5d2809de4517..20e59d88218d 100644
>--- a/drivers/gpu/drm/drm_exec.c
>+++ b/drivers/gpu/drm/drm_exec.c
>@@ -72,7 +72,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>  *
>  * Initialize the object and make sure that we can track locked objects.
>  */
>-void drm_exec_init(struct drm_exec *exec, uint32_t flags)
>+void drm_exec_init(struct drm_exec *exec, u32 flags)
> {
> 	exec->flags = flags;
> 	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>index b5bf0b6da791..187c3ec44606 100644
>--- a/include/drm/drm_exec.h
>+++ b/include/drm/drm_exec.h
>@@ -18,7 +18,7 @@ struct drm_exec {
> 	/**
> 	 * @flags: Flags to control locking behavior
> 	 */
>-	uint32_t		flags;
>+	u32                     flags;
>
> 	/**
> 	 * @ticket: WW ticket used for acquiring locks
>@@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
> 	return !!exec->contended;
> }
>
>-void drm_exec_init(struct drm_exec *exec, uint32_t flags);
>+void drm_exec_init(struct drm_exec *exec, u32 flags);
> void drm_exec_fini(struct drm_exec *exec);
> bool drm_exec_cleanup(struct drm_exec *exec);
> int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
>diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>index 48311e6d664c..554046321d24 100644
>--- a/include/drm/drm_gpuvm.h
>+++ b/include/drm/drm_gpuvm.h
>@@ -514,7 +514,7 @@ struct drm_gpuvm_exec {
> 	/**
> 	 * @flags: the flags for the struct drm_exec
> 	 */
>-	uint32_t flags;
>+	u32 flags;
>
> 	/**
> 	 * @vm: the &drm_gpuvm to lock its DMA reservations
>-- 
>2.43.0
>
