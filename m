Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2951B1DD
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 00:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17A10F78E;
	Wed,  4 May 2022 22:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3610F785;
 Wed,  4 May 2022 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651703436; x=1683239436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7+M/13vry+5F8KVstpIcYBrNT70QG3hPY4nxnXQYfA8=;
 b=UoYjJEfI0Uc2soMf/CziX1fnv14Uf5nSYcU+0pJhyoGZYMdZn0rlnpEC
 7qkzeNcgKUuZc0hLlA37vz84XXuqsmnzSvB/MEuAhOKOS/yI9gA2t0dzV
 c9n/Q3VjwhAjAjUuOrXMhXwPpd0R8HFRUsBtOek6OKq43cG3+V8xioqvc
 e1O7W2Vf3HvZ4yXa7lmY5D6iA2EKF1usQrvFyugj5LNeXEHAkSNLCySzV
 MHfS3nl3Jz/wGYWT6xKNfuF2AdQnVfTG4p6Y4FYRHzxImRC3kHywo0ZOy
 MzYDQytbUfYvHWZ8mlW50ijQ99BBy3ZSrivSBPmMsDcRGTmjc3z44IFcb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="265512241"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="265512241"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 15:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="599737184"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga001.jf.intel.com with SMTP; 04 May 2022 15:30:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 May 2022 01:30:32 +0300
Date: Thu, 5 May 2022 01:30:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/20] drm/edid: CEA data block iterators, and more
Message-ID: <YnL+iIClH+aXHalJ@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Tue, May 03, 2022 at 12:23:45PM +0300, Jani Nikula wrote:
> I've kind of lost track of the version numbers on some of the iterator
> patches, but this is the next version (or mostly a resend) of
> [1]. There's an additional rename patch for SCDS.
> 
> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/series/102703/
> 
> 
> Jani Nikula (19):
>   drm/edid: reset display info in drm_add_edid_modes() for NULL edid
>   drm/edid: rename HDMI Forum VSDB to SCDS
>   drm/edid: clean up CTA data block tag definitions
>   drm/edid: add iterator for EDID base and extension blocks
>   drm/edid: add iterator for CTA data blocks
>   drm/edid: clean up cea_db_is_*() functions
>   drm/edid: convert add_cea_modes() to use cea db iter
>   drm/edid: convert drm_edid_to_speaker_allocation() to use cea db iter
>   drm/edid: convert drm_edid_to_sad() to use cea db iter
>   drm/edid: convert drm_detect_hdmi_monitor() to use cea db iter
>   drm/edid: convert drm_detect_monitor_audio() to use cea db iter
>   drm/edid: convert drm_parse_cea_ext() to use cea db iter
>   drm/edid: convert drm_edid_to_eld() to use cea db iter
>   drm/edid: sunset the old unused cea data block iterators
>   drm/edid: restore some type safety to cea_db_*() functions
>   drm/edid: detect basic audio in all CEA extensions
>   drm/edid: skip CTA extension scan in drm_edid_to_eld() just for CTA
>     rev
>   drm/edid: sunset drm_find_cea_extension()
> 
> Lee Shawn C (1):
>   drm/edid: check for HF-SCDB block

All of the above patches look OK to me.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>   drm/edid: detect color formats and CTA revision in all CTA extensions

For this one I'm not entirely convinced the behavioural change
for the no-CTA ext case is what we want. Replied to that one
individually.

> 
>  drivers/gpu/drm/drm_edid.c | 799 +++++++++++++++++++++----------------
>  1 file changed, 458 insertions(+), 341 deletions(-)
> 
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
