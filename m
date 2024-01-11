Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A371982AB63
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D610E806;
	Thu, 11 Jan 2024 09:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6AB10E818
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704966986; x=1736502986;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t43IqjNCOufpKwc0oGyWduGv4YqVe3Cp/emjYBWKogk=;
 b=g3uAM7ZncKN+h1laE4UiSYt1xkgvfaH64HclZ+0xQUb5fyd6XPhRGyBi
 sqeVkWtgfyIAcL7tojNy+zQrhACuQLrTWY2fVcigkWmT/uJD598qKY7Qx
 TfPTxkPekEeE+7qXVyhM/tRlpfVRrXbgPHGSccBiS3J/FZO4TzjwjSMax
 flgWe4gFjpZ3Z9WDh+e8Nv7rxqr/Y4olFwewCyU0b/2COMaho119FRxEs
 TSGuRkNJzsz4Rpf684J/yuBXZbG/TU56uisPxKa88LrDryKpBY920Xbgd
 UFK7b1QEa6SRLdSc+yuPtPpoKrAQVupZI8GhtqLNf6m02MyD3iRP51bxf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395943664"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="395943664"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955690367"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="955690367"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:56:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Gray <jsg@jsg.id.au>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: use ATOMIC64_INIT() for atomic64_t
In-Reply-To: <20240111023045.50013-1-jsg@jsg.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111023045.50013-1-jsg@jsg.id.au>
Date: Thu, 11 Jan 2024 11:56:20 +0200
Message-ID: <87bk9suraz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: robdclark@chromium.org, mripard@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> use ATOMIC64_INIT() not ATOMIC_INIT() for atomic64_t
>
> Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
> Signed-off-by: Jonathan Gray <jsg@jsg.id.au>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 446458aca8e9..d3b10dd91584 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -149,7 +149,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
>   */
>  struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  {
> -	static atomic64_t ident = ATOMIC_INIT(0);
> +	static atomic64_t ident = ATOMIC64_INIT(0);

I think we should probably redefine both ATOMIC_INIT and ATOMIC64_INIT
to cast the result to the correct type to avoid this problem once and
for all.

If we had

#define ATOMIC_INIT(i) (atomic_t){ (i) }

and

#define ATOMIC64_INIT(i) (atomic64_t){ (i) }

we'd get a build failure using them incorrectly.

BR,
Jani.


>  	struct drm_device *dev = minor->dev;
>  	struct drm_file *file;
>  	int ret;

-- 
Jani Nikula, Intel
