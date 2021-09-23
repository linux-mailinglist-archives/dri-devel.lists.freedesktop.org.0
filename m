Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A58415ABF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0694C6E0FB;
	Thu, 23 Sep 2021 09:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9536E0FB;
 Thu, 23 Sep 2021 09:18:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203300182"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="203300182"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 02:18:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="558250490"
Received: from ideacone-mobl1.ger.corp.intel.com (HELO [10.252.8.21])
 ([10.252.8.21])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 02:18:31 -0700
Subject: Re: [PATCH v6 3/9] drm/i915/gt: Increase suspend timeout
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210922062527.865433-1-thomas.hellstrom@linux.intel.com>
 <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <14313c48-8817-fc9f-2a38-32d49d69a21a@intel.com>
Date: Thu, 23 Sep 2021 10:18:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

On 22/09/2021 07:25, Thomas Hellström wrote:
> With GuC submission on DG1, the execution of the requests times out
> for the gem_exec_suspend igt test case after executing around 800-900
> of 1000 submitted requests.
> 
> Given the time we allow elsewhere for fences to signal (in the order of
> seconds), increase the timeout before we mark the gt wedged and proceed.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dea8e2479897..f84f2bfe2de0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -19,6 +19,8 @@
>   #include "intel_rps.h"
>   #include "intel_wakeref.h"
>   
> +#define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
> +
>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>   {
>   	int count = atomic_read(&gt->user_wakeref);
> @@ -279,7 +281,7 @@ static void wait_for_suspend(struct intel_gt *gt)
>   	if (!intel_gt_pm_is_awake(gt))
>   		return;
>   
> -	if (intel_gt_wait_for_idle(gt, I915_GEM_IDLE_TIMEOUT) == -ETIME) {
> +	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
>   		/*
>   		 * Forcibly cancel outstanding work and leave
>   		 * the gpu quiet.
> 
