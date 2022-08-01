Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE91586F58
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C305912A21B;
	Mon,  1 Aug 2022 17:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988612A21B;
 Mon,  1 Aug 2022 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659373938; x=1690909938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DFXStBY5eMGiDbcr0wAufBmc0V3fo8FmbFKEExuiPpw=;
 b=J0v5LqL1qMl8OGh2UH2whti+UMn8mQtDiZqEmPTxnOJClP6InlNQoB0l
 m+NVgC85pUSYyByTV5TwAB0eCubqYCUu0ACA94HiGoxlwH7SwfH+c0YPk
 h+O8hghCtISToLynElxduMTjzlf8JIHn60jT3JALL4jLHYIGAcahTMLAL
 +6KLqagDzFhr56n5FbDv/Q9TkWPK3NGLowRf5tL4UqJN+Al23xWRTzyUp
 hoojGXOQyBDcyCWPcVfjjn5S67XWETkQxsPrVgwGbmRSvvoxP2wiWThBR
 8oXsDwygtWX8vvo0OseHhErI+kGNt+u+ETCrntumU7g0+xIyP/YQPx6BS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="375501973"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="375501973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 10:12:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="929632376"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 10:12:16 -0700
Date: Mon, 1 Aug 2022 10:11:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH] drm/i915/userptr: remove redundation assignment to
 variable ret
Message-ID: <20220801171153.GI14039@nvishwa1-DESK>
References: <20220730122342.146475-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220730122342.146475-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 30, 2022 at 01:23:42PM +0100, Colin Ian King wrote:
>Variable ret is assigned a value that is never read; it is either
>being re-assigned during the following while-loop or after the loop.
>The assignmnt is redundant and can be removed.
>
>Cleans up clang scan build warning:
>drivers/gpu/drm/i915/gem/i915_gem_userptr.c:295:11: warning: Although
>the value stored to 'ret' is used in the enclosing expression, the
>value is never actually read from 'ret' [deadcode.DeadStores]
>
>Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>index 8423df021b71..075aef875a07 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>@@ -292,7 +292,7 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
> 	if (!i915_gem_object_is_readonly(obj))
> 		gup_flags |= FOLL_WRITE;
>
>-	pinned = ret = 0;
>+	pinned = 0;
> 	while (pinned < num_pages) {
> 		ret = pin_user_pages_fast(obj->userptr.ptr + pinned * PAGE_SIZE,
> 					  num_pages - pinned, gup_flags,

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-- 
>2.35.3
>
