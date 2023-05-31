Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08CC717D60
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 12:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B310E4AC;
	Wed, 31 May 2023 10:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7310E4AC;
 Wed, 31 May 2023 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685530173; x=1717066173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P4OtVBdvXMpW1v+dbrVU/sDkueZddN43qStMW7Uj/tg=;
 b=g/WKUfk/s/NUWS7EN/cOZ/YVA6NokcF8kuHQ07Rk/UoDsrvOcMQqjlgp
 kXg3upidAfVVBOUnRJyz9CEJ9VoXKOeMDpSwL8NBh0gIPbfgqiYgfWpLW
 E4mbWHB3kJwBjWc2Rs7DXqq9koggvDLn//9dtsof8Hvn6KCEgOMtNsGx/
 220oh442ETKuGT0yqRiPuB/+bUJzQD9nvsk//RVXjgejAegSezkVcIk8+
 Z1fjYzqcstmlY83ktAjsiHi/uWd8kMYF1jQnqI0JUG2JTmAFYU6gfAe+a
 /uckaTRHizHM/8pz9Im5eg2TgDucZQxZLO5v8r8RMSpUQYQShGbkyOocB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357591208"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357591208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 03:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="851166045"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="851166045"
Received: from itaraban-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 03:49:29 -0700
Date: Wed, 31 May 2023 12:49:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com, Carl Zhang <carl.zhang@intel.com>
Subject: Re: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZHcmNnr5p2e7wXYe@ashyti-mobl2.lan>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <20230524200255.443021-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524200255.443021-2-fei.yang@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com,
 rodrigo.vivi@intel.com, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carl,

On Wed, May 24, 2023 at 01:02:55PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> BSpec: 45101
> 
> Test igt@gem_create@create_ext_set_pat posted at
> https://patchwork.freedesktop.org/series/118314/
> 
> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>

was it your intention to ack this patch?

Thanks,
Andi
