Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491489C99C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 18:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEF9112781;
	Mon,  8 Apr 2024 16:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE5112786
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 16:34:25 +0000 (UTC)
Received: from SoMainline.org
 (2a02-a420-6-f162-164f-8aff-fee4-5930.mobile6.kpn.net
 [IPv6:2a02:a420:6:f162:164f:8aff:fee4:5930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 03B744042A;
 Mon,  8 Apr 2024 18:34:21 +0200 (CEST)
Date: Mon, 8 Apr 2024 18:34:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
Message-ID: <b2vdqzx3g7s4ihn6i3nkmao6m4wgpd4ivw3rcbsw6qzmby7wub@trq3c23ezt76>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
 <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
 <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>
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

On 2024-04-08 17:58:29, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年4月3日周三 17:41写道：
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Add variable for slice number of a DSC compression bit stream packet.
> > > Its value shall be specified in panel driver, or default value can be set
> > > in display controller driver if panel driver does not set it.
> >
> > This is not a part of the standard. Please justify it.
> 
> Right, I read the standard but did not find any details of packet description.
> Looks like msm silicon support tuning of number of slice packing per downstream
> code.
> The slice_per_pkt can be set in the downstream msm device tree. And I test the
> values 1 and 2 on vtdr6130 panel and both work. So I guess this is related to
> performance or something like that. I will have more test with different panel
> to check the impact.
> drivers/gpu/drm/panel/panel-raydium-rm692e5.c also mentions to pass new value
> to slice_per_pkt.
> 
> Hi Konrad,
> Do you remember why value 2 is TODO for slice_per_pkt for panel rm692e5?

Hi Jun,

I think I should indirectly answer that question, as I indirectly via "the"
MDSS panel generator place that comment there based on the suggested downstream
value:

https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator/commit/5c82e613d987d05feca423412f6de625f9c99bae#diff-dba3766d7cec900b8de500f888c64a392cd9780f9baf00aae7e3f87a7d3fefc4R458

So I don't think Konrad's answer will be any different than "that's what
downstream does, and that's what the generator put there".

---

I was fairly certain that it used for performance reasons, but panels were found
(e.g. on the FairPhone 5) that don't seem to function without combining multiple
(2) slices in one packet at all?

- Marijn

> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/display/drm_dsc.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> > > index bc90273d06a6..4fac0a2746ae 100644
> > > --- a/include/drm/display/drm_dsc.h
> > > +++ b/include/drm/display/drm_dsc.h
> > > @@ -82,6 +82,10 @@ struct drm_dsc_config {
> > >          * @bits_per_component: Bits per component to code (8/10/12)
> > >          */
> > >         u8 bits_per_component;
> > > +       /**
> > > +        * @slice_per_pkt: slice number per DSC bit stream packet
> > > +        */
> > > +       u8 slice_per_pkt;
> > >         /**
> > >          * @convert_rgb:
> > >          * Flag to indicate if RGB - YCoCg conversion is needed
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
