Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3307A8976
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 18:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E05A10E51B;
	Wed, 20 Sep 2023 16:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CD10E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695227476; x=1726763476;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GoHDfxWmP1TTPAGMIxLhDm5KqXyo4RRgetunfbLJ/do=;
 b=nFj/Ui2sHjqGw0qxq959DMR4dMKC4sbEYx9oTxh1ytV3veJXxkuy2NNI
 2zOHNNcU1iGMQ9Kj3awJ/q97tDZ4V9ewUoIdI1OK3b7JIuM6VLOtvd6lN
 zeBpHnRvD36xfkeTyTz2HXT1UzeikrMl2yZ2pQzp2yQyu4TGnReotWZHn
 a8v9V8nAJusjFccDidrGlKt2DUxyEg9Mw0AamegxAWH60Y32W26chEmKx
 mTSAzXdIDEEwg5i94D1RsW9iLCOK5MgjGhcO/5UI8/AXULDqoolsR+98Z
 ljM6aAMwrvLk9E75Z08Gxyw1bRrXgLW1zmadcxY/55st3ECS6DpAnyzmb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370584599"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="370584599"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 09:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816969030"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="816969030"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 09:31:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
In-Reply-To: <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Date: Wed, 20 Sep 2023 19:31:03 +0300
Message-ID: <87msxgrem0.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Hi,
>
> On Thu, 14 Sep 2023 16:10:15 +0300, Jani Nikula wrote:
>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>> 
>> 
>
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
>
> [1/1] drm/meson: fix memory leak on ->hpd_notify callback
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=099f0af9d98231bb74956ce92508e87cbcb896be

Thanks,
Jani.


-- 
Jani Nikula, Intel
