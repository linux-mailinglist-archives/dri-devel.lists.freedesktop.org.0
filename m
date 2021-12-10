Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01C4470672
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C09010E43F;
	Fri, 10 Dec 2021 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5FB10E43F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:53:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so9837285pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 08:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LVSQkz5B+7KeAhCjFmGdpHWfCyvLYQVjjI6sRW9JpRw=;
 b=RkOnCtneuOSJW2iuk1Cm7g5yzWudSU0qS42J4LYEu3Hz2uoIh7aG9koIpHtXnzlkqY
 vf4J4048EcoKv5nLnS0izFCqlYXZxEJKRiGBcWeZK6fD1ftEYNTH7lMnO4yhOal4k0Pz
 d1u2PqIIpC/7fNu17zCZa7WFQeQ4dEnEtjXRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LVSQkz5B+7KeAhCjFmGdpHWfCyvLYQVjjI6sRW9JpRw=;
 b=tr+vM0mAhAb4oput5Kqdda5kXHyCHdDcgPviEp/HhdfbrHo9MRWT75Wy+8rry7Lme6
 hDaWIlc8BlpAUKnGtgNSAY3I7P/pIJphNAxLMZnr1Kdy05MOxnsczZAEJwnojlnx2peZ
 TK7+ts7fwQlIEJ4Zxr/yh81iLtSbzr3ncqnVYx1UNyKl/N0e0UZlHhOfJBDCf+L+O+No
 CwwbQ9DEZc+OSEgFgar772cUOxdg9/u+rxn+Ahry5G/tpYzqiR1JHKC8+n41loP7vuyq
 t9SHuS0+DsE+E+A7AXPx66NvnrNbjmLpUpmBh4OcNRTeMfPrPIVYbBRWeYSnWTEn3MJP
 tDag==
X-Gm-Message-State: AOAM531Xjkr2D1IALr5DZHoNo5CRoXh1vaTf1ZhvqshQlDx6fAhnO8qu
 FgjnJSoFoTDu4wyTqXiUIZxIOg==
X-Google-Smtp-Source: ABdhPJzSyniFUpawTf97SmHGpFTfTB0FCc6mDMWVupxmHh+f0BcevSZsWPwoq3ya/luBEUOxpW/9BQ==
X-Received: by 2002:a17:902:e5d1:b0:141:cd4a:f318 with SMTP id
 u17-20020a170902e5d100b00141cd4af318mr77124757plf.47.1639155226164; 
 Fri, 10 Dec 2021 08:53:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r76sm3057454pgr.61.2021.12.10.08.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 08:53:45 -0800 (PST)
Date: Fri, 10 Dec 2021 08:53:45 -0800
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
Message-ID: <202112100853.FDB294B86@keescook>
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com> <202112082220.81ECDC63D@keescook>
 <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
 <202112091539.6B349AC@keescook> <87a6h83hb7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6h83hb7.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 12:06:20PM +0200, Jani Nikula wrote:
> On Thu, 09 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> > On Thu, Dec 09, 2021 at 05:20:45PM -0500, Harry Wentland wrote:
> >> 
> >> 
> >> On 2021-12-09 01:23, Kees Cook wrote:
> >> > On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
> >> >> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> >> >>> The link_status array was not large enough to read the Adjust Request
> >> >>> Post Cursor2 register. Adjust the size to include it. Found with a
> >> >>> -Warray-bounds build:
> >> >>>
> >> >>> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> >> >>> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >> >>>    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >> >>>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> >> >>> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >> >>>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >> >>>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> >>>
> >> >>> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> >> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
> >> >>
> >> >> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
> >> >> published in 2014, and Tegra is the only user of
> >> >> drm_dp_get_adjust_request_post_cursor().
> >> > 
> >> > I see POST_CURSOR2 is used here too:
> >> > 
> >> > drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> >> > 
> >> 
> >> Looks like we read and parse that in the admgpu driver without
> >> using drm_dp_get_adjust_request_post_cursor.
> >
> > Right, and probably that could be switched to use it, but I'm not sure
> > what the impact of the larger link_status read is.
> >
> >> 
> >> I don't have a strong feeling but I liked your original
> >> patch a bit better. I'm not sure what it means when part
> >> of a spec is deprecated. Once a spec is written display
> >> vendors might implement it. We should make sure that
> >> displays like that are always handled in a sane manner.
> >
> > Jani, Dave, any guidance here? I'm fine with whatever, but the current
> > code is for sure broken. ;)
> 
> Post Cursor2 was completely optional for the transmitter even before it
> was deprecated.
> 
> And now we'd be adding 5 bytes extra to all link status reads. To fix
> the only user of drm_dp_get_adjust_request_post_cursor() that apparently
> has never worked as intended. I'm just not convinced.
> 
> I was trying to look through the implications of DP_LINK_STATUS_SIZE
> increase, and at least drm_dp_dpcd_read_phy_link_status() comes across
> as something probably needing attention.

Okay, it sounds like you'd prefer the "make it tegra-specific" patch I
proposed. I will work that up as a proper patch and send it.

Thanks!

-- 
Kees Cook
