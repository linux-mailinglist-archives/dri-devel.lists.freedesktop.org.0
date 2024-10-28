Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49F9B33C8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDC910E180;
	Mon, 28 Oct 2024 14:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQWMMnd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E17F10E180
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730126347; x=1761662347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uXSTSP9LZvlzVnDN4kjlRcBl179jN+FpKvrEDa7DsIA=;
 b=cQWMMnd72llynW6IoshqnIMz+QjUc7dSeka9w0V8KdJSKRgOUhMGPVcd
 a+fb+4+AmNeYnuI7DOZxP2mAJ5Qh6bgO7umvFw55LBVclzLVa2QrxHpta
 EFPoCk9oVqEhpkqdUO4iTMi3EK2GWObQfrJybrbU7YIjs7OL2YLURMK7t
 EI4BQUHI0kj/9K+jpHSGCpnReOmEefSMS0PF7oa3/71489XBEBgFmD5DS
 y79s99WpG83wY56o48Hr6n4xn8+JYDOYPXfpRxVSxsH3m39Ew+rVxj8gu
 nTUa5ZrWTGoDGzolHRFuzIn1EJVKAsG7a9Rf0zRlDJpcR6jBDZioO0XBw A==;
X-CSE-ConnectionGUID: qQkVMAXLRAeXH+D5GW/IzQ==
X-CSE-MsgGUID: GcRTSF5uQgC4K0SmeCzYQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52277531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52277531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:39:01 -0700
X-CSE-ConnectionGUID: 4vKiPucPSZaxZHAEqXDQOg==
X-CSE-MsgGUID: 10l1NnlvQwqJpWmuiXnsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81742537"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Oct 2024 07:38:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Oct 2024 16:38:50 +0200
Date: Mon, 28 Oct 2024 16:38:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/edid: convert drm_parse_hdmi_vsdb_video to use
 struct cea_db *
Message-ID: <Zx-h-qCeU0e9B-eK@intel.com>
References: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
 <20241027075108.14273-2-vamsikrishna.brahmajosyula@gmail.com>
 <87cyjkpcik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyjkpcik.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 28, 2024 at 03:45:07PM +0200, Jani Nikula wrote:
> On Sun, 27 Oct 2024, Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com> wrote:
> > @@ -6320,19 +6321,20 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> >  
> >  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
> >  static void
> > -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
> > +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const struct cea_db *db)
> >  {
> >  	struct drm_display_info *info = &connector->display_info;
> >  	u8 len = cea_db_payload_len(db);
> > +	const u8 *data = cea_db_data(db);
> >  
> >  	info->is_hdmi = true;
> >  
> > -	info->source_physical_address = (db[4] << 8) | db[5];
> > +	info->source_physical_address = (data[3] << 8) | data[4];
> >  
> >  	if (len >= 6)
> > -		info->dvi_dual = db[6] & 1;
> > +		info->dvi_dual = data[5] & 1;
> 
> Just commenting on one hunk, because it's a good example of the whole
> series I think.
> 
> The above is nice, because it improves the offset vs. length
> comparisons. Many of the old checks like above look like off-by-ones,
> when indexing from the beginning of the data block, not from the
> beginning of payload, and cea_db_payload_len() excludes the first byte.
> 
> The main problem is that the specs are written with indexing from the
> beginning of the data block. For example, HDMI 1.4 table 8-16 defining
> the HDMI VSDB says source physical address is at byte offsets 4 and 5,
> and dvi dual flag at byte offset 6. That will no longer be the case in
> code. It gets tricky to review when you have to keep adjusting the
> offsets in your head. (I don't remember if there are specs that specify
> the offsets starting from the "actual" payload after all the meta stuff
> has been removed.)

IIRC there was some off-by-one indexing difference between
some of the specs. But I don't remember which ones use what.

> 
> Now, if we accept having to do that mental acrobatics, why stop there?
> You also have extended tags (first payload byte is the tag), as well as
> vendor tags (first three payload bytes are the OUI). It begs the
> question whether there should be higher level data and length helpers
> that identify and remove the tags (including extended tags and OUI
> stuff). For example, the actual data for HDMI VSDB starts at payload
> offset 3, as the first three bytes are the HDMI OUI.
> 
> What to do? Ville, thoughts?

So just different *_{data,len}() for the different indexing variants
(as defined by the relevant spec)? That seems like a reasonable
apporach as then the len vs. index checks might actually make sense.

-- 
Ville Syrjälä
Intel
