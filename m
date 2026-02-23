Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOCiFiSonGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:19:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB70017C41F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519210E42E;
	Mon, 23 Feb 2026 19:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgzFKgij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0D610E42E;
 Mon, 23 Feb 2026 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771874335; x=1803410335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vwdBKJfg0FxkKOyrRNVzO7SdSlXi3w3RWQk5zuuNWos=;
 b=lgzFKgijG6tnfa2KwNQhVh5y4kbRp14rHesYgGPL6uXdRKRqwMf9NuVj
 OBgrhEUQlYI0qeen327dxTUOInTsanRr+QlRJ48XLv+kTXNYEjJ8HbOGo
 qi95ieRYRdR9AWlNUksM50KjTY57wP5qNiZZ4aRVsv2vFsFLLSrBpivm+
 pV8h1GfceJk8JLSQ8Yw8stErWsWryo1ap+74np9UT+fqQwYofCZ4jsinc
 Vm4FaVq0XcaU98Wpb88vZ4tbfv3oXI/Tdj2/fWsoP4tvwowBFSpxLUTR+
 fuMsN+ZJ+AC54Ap8vKG4KWUVFVi+aU3kjhBFIJJ8otiy3Gt0WhtNpDmtM w==;
X-CSE-ConnectionGUID: c/r277uyRmKwyq+Ha81WKw==
X-CSE-MsgGUID: o7wniQwGR9qv+kMFnWuanw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83202148"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83202148"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:18:55 -0800
X-CSE-ConnectionGUID: VtqbLv9bRiCvVbFb9mCjtg==
X-CSE-MsgGUID: MqAO6EX0TkK0bYnhGLf0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="213976768"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.65])
 ([10.245.244.65])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:18:53 -0800
Message-ID: <666476e1-3cfb-4574-af74-b9feda2d57ca@linux.intel.com>
Date: Mon, 23 Feb 2026 20:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked()
 kernel-doc
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com
References: <20260219205029.1011336-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260219205029.1011336-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: DB70017C41F
X-Rspamd-Action: no action

Hey,

Den 2026-02-19 kl. 21:50, skrev Matthew Brost:
> The kernel-doc for drm_gpusvm_pages_valid_unlocked() was stale and still
> referenced old range-based arguments and naming. Update the documentation
> to match the current function arguments and signature.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 81626b00b755..2e229bc944f0 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1338,14 +1338,14 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>  
>  /**
> - * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
> + * drm_gpusvm_pages_valid_unlocked() - GPU SVM pages valid unlocked
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
>   *
> - * This function determines if a GPU SVM range pages are valid. Expected be
> - * called without holding gpusvm->notifier_lock.
> + * This function determines if a GPU SVM pages are valid. Expected be called
> + * without holding gpusvm->notifier_lock.
>   *
> - * Return: True if GPU SVM range has valid pages, False otherwise
> + * Return: True if GPU SVM pages are valid, False otherwise
>   */
>  static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
>  					    struct drm_gpusvm_pages *svm_pages)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
