Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4282A2D04E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 23:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A110E0FC;
	Fri,  7 Feb 2025 22:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oa8Cp+FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BE510EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 22:07:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54412a7d75cso2084646e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738966042; x=1739570842; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YoGtyAadAajUTvrSofPsqaE92yf53brkzxQxe3NpqEE=;
 b=oa8Cp+FTyDZsXp38JaKhiIveQfWzj75KxN9uAsJ3qi9Yp1uld6LJnlrUOct2LCxfT3
 TXBdcEEzNnUJh8p3IdDAq8IV4TYeZqsAq058o/RP+04NvrX0f8Yq+XQG7PoKjfWpeWdF
 mO7yg1uRPlpTdQmT5nulugKp0H+Z1plAZ8wq4TRqYSZlrWI6Vw/coyThWbm4N+WK9BKR
 sHP927YHwhX50Cx9Mx9q/RHf5joeLimaEeHm/g8xMaLdCiUD0BboUl/voB4L3KEvBMp0
 +taUfrjPSeuGA4PvMjPLHYXtAnXYqJjOn2GkyhvDNETwU1yVWrUGFZsAbTF4xob+JRpg
 I7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738966042; x=1739570842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoGtyAadAajUTvrSofPsqaE92yf53brkzxQxe3NpqEE=;
 b=jFGXiRo1q8fadn7gEOuDEGSCCfkPI/TcnhGlaDu/Ki2xAlO1VGw1gmb+ED/4lZk/YV
 ehPFHIsUHcY7CinYo7mMBto9C+l3l1jRE27JJ1/9N7Xi0SvL0uk+AWnVM9lr80tdePAu
 TAMlWUXVXFZai4id/99gS/kJklW3D+/p+My8h5ixYwwZjZiRJ5BZPz+cdVpUz5qcfNGl
 FhXxKYIxNP2OIy/209FzssjKjIQDBESfSZAmCDdPjw59aTKc0gTJvkpFsDxlPF8fdM/S
 EjROz3iriB6ag+00ij7YPjnSzz4zDDkGUH3gs2sX+hOv94JdxaNUzmUArzKxB5mOiEs2
 vLIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0HfDAf6H2n7jKBIJdbPaHY+Iwo89xsi3f7Fab6Vh8QXAjn1yl8keJ3kx6LB+x2XdiFIUpNjg8Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOAYK1BAC2YYIApgTBRofCikBpkfrCrVq99WoDPeQ3JTHLznf6
 KrI9YDgfWJwodXcEWXcxQNed7sGN8YK1/D0oL/vi3zFYabSEz2L1WVbB3b3fhOk=
X-Gm-Gg: ASbGncsX1+7zJ44Jb6hHDI7ZdBw+5sBs2LNYUaYc/grOCAN/Ua9QnvTw7V9SVREX7IT
 rqh+G3p3QMoGK1RqkYRvdc/AaWnkTMpXaF7XuAOhume5kMDU94DpEZNIwbp15rlyMWwROJkgomq
 jp0xD898hna3Vl/y5AlBQAKAQ/UdA9wra7TqEsoeXhlOkjId/5TU8RE4fmV1mlbONaZ5WkLMFgD
 45D1h1vk2VozOGaRscyY8QrsL6w9MEoI76ywZiMqoOVuCUG4EYHNXo9c/Wpa5XekfCQ9uFR15wh
 08l76OjFmqtyVIWUingaDH4XYaB8A2fVyJ1UqkB6MOeTaUfnszM06W6fj+0CQcvdBm+datY=
X-Google-Smtp-Source: AGHT+IGlt4YgbVKf+phNyM/DE8c8iLjkn4RIMGk5ksuzhbALB5C0dL4KrNR9p1aZlABR8XoI6jqj+A==
X-Received: by 2002:a05:6512:3ba8:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-54414ae1357mr1765761e87.33.1738966041556; 
 Fri, 07 Feb 2025 14:07:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f3182sm565650e87.192.2025.02.07.14.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:07:21 -0800 (PST)
Date: Sat, 8 Feb 2025 00:07:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <d6lavujlmk5teri2sf4tp2tlvbkvw54azykvsqymyeyedmndb6@czsdg66h3esq>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
 <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
 <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
 <fgzcd4gm4uriqbpslh7arfyxjvzyxrck3f2uuv4mhkvcbkdmvm@b2pz5vmmqs3l>
 <b7561a2c-653b-4c56-8bef-3ae76a729d7c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7561a2c-653b-4c56-8bef-3ae76a729d7c@quicinc.com>
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

On Fri, Feb 07, 2025 at 12:11:55PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/6/2025 5:19 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 06, 2025 at 12:41:30PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/3/2025 4:59 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > > > > > The mode_set callback is deprecated, it doesn't get the
> > > > > > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > > > > > that HDMI timings should be programmed after setting up HDMI PHY and
> > > > > > PLL. Rework the code to program HDMI timings at the end of
> > > > > > atomic_pre_enable().
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> > > > > >     1 file changed, 15 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > > > >     	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > >     }
> > > > > > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > > > +					       const struct drm_display_mode *mode);
> > > > > >     static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > >     					      struct drm_bridge_state *old_bridge_state)
> > > > > >     {
> > > > > > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> > > > > >     	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > > > >     	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > > > >     	struct hdmi_phy *phy = hdmi->phy;
> > > > > > +	struct drm_encoder *encoder = bridge->encoder;
> > > > > > +	struct drm_connector *connector;
> > > > > > +	struct drm_connector_state *conn_state;
> > > > > > +	struct drm_crtc_state *crtc_state;
> > > > > >     	DBG("power up");
> > > > > > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > > > > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > > > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > > > > > +
> > > > > >     	if (!hdmi->power_on) {
> > > > > >     		msm_hdmi_phy_resource_enable(phy);
> > > > > >     		msm_hdmi_power_on(bridge);
> > > > > > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > >     	if (hdmi->hdcp_ctrl)
> > > > > >     		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > > > > > +
> > > > > > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> > > > > >     }
> > > > > 
> > > > > This addresses my comment about setting up the HDMI timing registers before
> > > > > setting up the timing engine registers.
> > > > > 
> > > > > But prior to this change, mode_set was doing the same thing as
> > > > > msm_hdmi_bridge_atomic_set_timings() which means
> > > > > msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> > > > > pre_enable()?
> > > > > 
> > > > > The controller is enabled in msm_hdmi_set_mode(). So this should be done
> > > > > before that.
> > > > 
> > > > In [1] you provided the following order:
> > > > 
> > > > 1) setup HDMI PHY and PLL
> > > > 2) setup HDMI video path correctly (HDMI timing registers)
> > > > 3) setup timing generator to match the HDMI video in (2)
> > > > 4) Enable timing engine
> > > > 
> > > > This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
> > > > end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
> > > > middle of it.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/
> > > > 
> > > 
> > > Sequence given is correct and is exactly what is given in the docs. What is
> > > somewhat not clear in the docs is the location of the enable of the HDMI
> > > controller. This is not there in the above 4 steps. I am referring to the
> > > enable bit being programmed in msm_hdmi_set_mode(). Ideally till we enable
> > > the timing engine, it should be okay but what I wanted to do was to keep the
> > > msm_hdmi_set_mode() as the last call in this function that way we program
> > > everything and then enable the controller.
> > > 
> > > This can be done in either way, move it to the beginning of the function or
> > > move it right before msm_hdmi_set_mode(). I had suggested beginning because
> > > thats how it was when things were still in mode_set.
> > 
> > Well.. following your description it might be better to put it after PHY
> > init. What do you think?
> > 
> 
> Are you referring to after msm_hdmi_phy_powerup()? Yes, thats fine too.

After doing several tests, this doesn't result in a stable enough
behaviour. I'll follow your recommendataion and call
msm_hdmi_bridge_atomic_set_timings() in the beginning of
msm_hdmi_bridge_atomic_pre_enable().

-- 
With best wishes
Dmitry
