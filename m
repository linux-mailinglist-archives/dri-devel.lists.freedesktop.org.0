Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB043CB71C0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E99B10E764;
	Thu, 11 Dec 2025 19:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="U5toQvtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3B10E625;
 Thu, 11 Dec 2025 19:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765483166; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PapCYrGOA0DdMdEGqYe8wSbVIMgmWtTx9Ajd3S+/lPqhJQ/Tpj8uBEwf+hBtuyHSFC/706YpOtQ6gsr8LHXYsIb1Yb9TlGNzvX4TItjetl7m/Y14QiE77f5CcqVB9hnnQbYK/SqjO4gxHLNKl3eEoMSr40w2cXD7hIERrS5pKRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765483166;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1Dh7aECitOB9k9I8NTgAp9Wi9RahEZHruitjqRy2ayc=; 
 b=BKn84KfImSg64WEv/gHkaFqxl2XbwOYSVlJj6kC7tLzf4FfvHc0KAXPiaQWvFG22irZUtesPQHpS6atOwKkKwVimS5tFUrVDABB1JJJbs94pGfkSJSItfFaDs0VRCQ0URWX9aHNinF7QbpqAkZRhIpdt6xDuiFjgD2itpWr4Q6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765483166; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1Dh7aECitOB9k9I8NTgAp9Wi9RahEZHruitjqRy2ayc=;
 b=U5toQvtRKHWzGyOiOOT0n9f8hMBVqtET17wX+Ha5qp60DmHE0JxiLQ+B05LilYa5
 /cVsZJEEwURhPFX+3AF4ZuqBtma4nmBCO9IHA1HSsKx6CBuEcNlNXlJvkB7GL0rHiRI
 G4GFL8yY4SMgQHfu9hAz/6+OC2BxiK+5FRPy94O4=
Received: by mx.zohomail.com with SMTPS id 1765483163864458.18267084626757;
 Thu, 11 Dec 2025 11:59:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 06/17] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Date: Thu, 11 Dec 2025 20:59:14 +0100
Message-ID: <9409315.NyiUUSuA9g@workhorse>
In-Reply-To: <20251209-dramatic-caiman-of-luck-db9d0f@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-6-63e82f1db1e1@collabora.com>
 <20251209-dramatic-caiman-of-luck-db9d0f@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 9 December 2025 15:18:25 Central European Standard Time Maxime Ripard wrote:
> On Fri, Nov 28, 2025 at 10:05:42PM +0100, Nicolas Frattaroli wrote:
> > drm_hdmi_connector_mode_valid assumes modes are only valid if they work
> > with RGB. The reality is more complex however: YCbCr 4:2:0
> > chroma-subsampled modes only require half the pixel clock that the same
> > mode would require in RGB.
> > 
> > This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
> > 420-only modes.
> > 
> > Fix this by checking whether the mode is 420-only first. If so, then
> > proceed by checking it with HDMI_COLORSPACE_YUV420 so long as the
> > connector has legalized 420, otherwise error out. If the mode is not
> > 420-only, check with RGB as was previously always the case.
> > 
> > Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 5da956bdd68c..1800e00b30c5 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -892,8 +892,18 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
> >  			      const struct drm_display_mode *mode)
> >  {
> >  	unsigned long long clock;
> > +	enum hdmi_colorspace fmt;
> > +
> > +	if (drm_mode_is_420_only(&connector->display_info, mode)) {
> > +		if (connector->ycbcr_420_allowed)
> > +			fmt = HDMI_COLORSPACE_YUV420;
> > +		else
> > +			return MODE_NO_420;
> > +	} else {
> > +		fmt = HDMI_COLORSPACE_RGB;
> > +	}
> >  
> > -	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > +	clock = drm_hdmi_compute_mode_clock(mode, 8, fmt);
> 
> I agree on principle, but we need to have a test for this.

I'd like to change `drm_mode_is_420_only` to `drm_mode_is_420` in
the next revision, and modify the control flow to work correctly
in this case, because rejecting 420-also modes on the basis that
we can't do them in RGB isn't correct either.

But my concern with adding yet more tests is that I found this bug
in a function unrelated to the series while adding tests you asked
for, because the tests relied on this function to not be broken as
part of the test setup. Yes, I was not be able to get any 4:2:0
modes on the test connector in the kunit tests because
drm_hdmi_connector_mode_valid helpfully discarded all of them.

So now I am wondering whether adding yet more tests will uncover
more bugs in functions unrelated to implementing the "color format"
property, that were only called because the new test required them
to set up some test fixture. And then I have to add another fix and
another test to this series, rinse and repeat.

Can we just agree that I am not going to expand the scope of this
series any further? If you want me to send a follow-up series that
adds tests to some of the hdmi state helper functions, then I can
do that, but I don't want to do it as a precondition for the 17
other patches in this series to get merged.

> 
> Maxime
> 




