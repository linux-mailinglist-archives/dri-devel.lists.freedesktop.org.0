Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AD492EF3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 21:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163A10E536;
	Tue, 18 Jan 2022 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E8D10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 20:03:52 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id d11so252065qkj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 12:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wENgBtFx+SKg314Nt2R03IJrdEQ1srCCjyzpwFWhdoM=;
 b=w8Iq5wKugK3wbhIBnndPL+raH2pUn2hhwiaswHu3uOCinm93VCS/6Gf2cwfUK0Sp4C
 If9D1O60oDHLVEYC9qfWxKAhHHFI4Ve83eEo8l5q8Ngv91DzEh4KctVJNaUZhIFZz6o3
 0PLL9qpg349PdrHyl/+1NUJsJDeVqfUjxfUIqbFdfS+HyBCtTz/Dzy6ZrW12i2GCoBnD
 KTOU8R9UqkqjueynxbI2H3o2eG14F9OP8o0JAOtupYiHU2O2T5wM9ICmfZC9ZQYK7RgY
 Xlffu+MZcVGH3yAL401M1U5XFWRbiaGJmEHkyi8u/oyXT/aAO3YK7KNPC8Zlc6wGz5wW
 0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wENgBtFx+SKg314Nt2R03IJrdEQ1srCCjyzpwFWhdoM=;
 b=fLTz53hNF85JvxSyizw3NkM34Wv5CSUe2nfEIcrzLMPs6TUG9mSpn7tBd/Zz4AMeRW
 gd3TR+OQ4QJU4kDbwqt6rdp7svY3lWwmxq77HAFLwoBaX0divSl56qohCdTjiMm2RX31
 OlvAb1gc4zgZqul3naT3VJ1SHwVMEwAfhDReoPMOlj5Mz3BWKPQZ5XcPWbgu4MKbikAe
 PTaQsRM1QRnMDfGV8jyFTU3hgHRcqCsBu5RaCsF9hpCNjVaBUJigWSQVMsumT+2ocqH4
 CpefTvI4HGprhOlxg+YP789CZPGQ2MuZxILJenPD1aGBQkfpd9AJhHBCvtcdGzEryild
 VpIw==
X-Gm-Message-State: AOAM532eyya3EP1FhEqqXUljvq/MMZewIrv+77YFqIbi5oQnfHDSyUjf
 qwybZUjZ+6bJhrVcaGFyBbxfsh5S/q2NY95f6vSktg==
X-Google-Smtp-Source: ABdhPJxk8mcgR65ryz0QeCihUsc5LpyUWDJ/9pm/f1QwLDujgvubKBskKiRxBWZApgA58oIe+pgkU8iuGEfDII+Kwoo=
X-Received: by 2002:a05:620a:c52:: with SMTP id
 u18mr19724917qki.203.1642536231128; 
 Tue, 18 Jan 2022 12:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
 <9fc8d452-7541-cbc5-57ca-96d1e480150c@quicinc.com>
In-Reply-To: <9fc8d452-7541-cbc5-57ca-96d1e480150c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 18 Jan 2022 23:03:40 +0300
Message-ID: <CAA8EJpp_re=UYYpuY90FiFJjARcFr+sZoR_WtJ9ETU40Dc_wig@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jan 2022 at 22:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/7/2021 2:29 PM, Dmitry Baryshkov wrote:
> > The DSI subsystem does not fully fall into the pre-enable/enable system
> > of callbacks, since typically DSI device bridge drivers expect to be
> > able to communicate with DSI devices at the pre-enable() callback. The
> > reason is that for some DSI hosts enabling the video stream would
> > prevent other drivers from sending DSI commands. For example see the
> > panel-bridge driver, which does drm_panel_prepare() from the
> > pre_enable() callback (which would be called before our pre_enable()
> > callback, resulting in panel preparation failures as the link is not yet
> > ready).
> >
> > Therewere several attempts to solve this issue, but currently the best
> > approach is to power up the DSI link from the mode_set() callback,
> > allowing next bridge/panel to use DSI transfers in the pre_enable()
> > time. Follow this approach.
> >
> Change looks okay. As per the programming guideline, we should set the
> VIDEO_MODE_EN register in the DSI controller followed by enabling the
> timing engine which will still happen even now because we will do it in
> modeset instead of the pre_enable().
> But, this can potentially increase the delay between VIDEO_MODE_EN
> and TIMING_ENGINE_EN. I dont see anything in the programming guide
> against this but since this is a change from the original flow, I would
> like to do one test before acking this. Can you please try adding a huge
> delay like 200-300ms between VIDEO_MODE_EN and timing engine enable to
> make sure there are no issues? You can do that here:


Fine, I'll do the test as the time permits.

>
> int msm_dsi_host_enable(struct mipi_dsi_host *host)
> {
>      struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>
>      dsi_op_mode_config(msm_host,
>          !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO), true);
>
>      msleep(300);
> }
>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
> >   1 file changed, 31 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 681ca74fe410..497719efb9e9 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
> >       return msm_dsi_get_encoder(msm_dsi);
> >   }
> >
> > -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> > +static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >   {
> >       int id = dsi_mgr_bridge_get_id(bridge);
> >       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >       struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> >       struct mipi_dsi_host *host = msm_dsi->host;
> > -     struct drm_panel *panel = msm_dsi->panel;
> >       struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
> >       bool is_bonded_dsi = IS_BONDED_DSI();
> >       int ret;
> > @@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> >       if (is_bonded_dsi && msm_dsi1)
> >               msm_dsi_host_enable_irq(msm_dsi1->host);
> >
> > +     return;
> > +
> > +host1_on_fail:
> > +     msm_dsi_host_power_off(host);
> > +host_on_fail:
> > +     dsi_mgr_phy_disable(id);
> > +phy_en_fail:
> > +     return;
> > +}
> > +
> > +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +     int id = dsi_mgr_bridge_get_id(bridge);
> > +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> > +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> > +     struct mipi_dsi_host *host = msm_dsi->host;
> > +     struct drm_panel *panel = msm_dsi->panel;
> > +     bool is_bonded_dsi = IS_BONDED_DSI();
> > +     int ret;
> > +
> > +     DBG("id=%d", id);
> > +     if (!msm_dsi_device_connected(msm_dsi))
> > +             return;
> > +
> > +     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> > +     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> > +             return;
> > +
> >       /* Always call panel functions once, because even for dual panels,
> >        * there is only one drm_panel instance.
> >        */
> > @@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> >       if (panel)
> >               drm_panel_unprepare(panel);
> >   panel_prep_fail:
> > -     msm_dsi_host_disable_irq(host);
> > -     if (is_bonded_dsi && msm_dsi1)
> > -             msm_dsi_host_disable_irq(msm_dsi1->host);
> >
> > -     if (is_bonded_dsi && msm_dsi1)
> > -             msm_dsi_host_power_off(msm_dsi1->host);
> > -host1_on_fail:
> > -     msm_dsi_host_power_off(host);
> > -host_on_fail:
> > -     dsi_mgr_phy_disable(id);
> > -phy_en_fail:
> >       return;
> >   }
> >
> > @@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
> >       msm_dsi_host_set_display_mode(host, adjusted_mode);
> >       if (is_bonded_dsi && other_dsi)
> >               msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
> > +
> > +     dsi_mgr_bridge_power_on(bridge);
> >   }
> >
> >   static const struct drm_connector_funcs dsi_mgr_connector_funcs = {



-- 
With best wishes
Dmitry
