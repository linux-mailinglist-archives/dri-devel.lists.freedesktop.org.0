Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B28AA55F92
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BAF10E990;
	Fri,  7 Mar 2025 04:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NfSZNWjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6110E990
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 04:37:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2204320e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 20:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741322228; x=1741927028; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D44Ht247p5X2IacT/H00G0KgxP5FZ6f/aPx0Tfu79bg=;
 b=NfSZNWjsonGOJBCel3Izcw7IIF4cag7VbaT+HUuIMBaVkGfRAO6A/s5YS4Wgv9bwyM
 iUXUYbYWoovbRRB3lrZl/3PwzKd5qfWRa2dUzs53mtqABSe5RcFX4sIoxvgNHwScPg/W
 GhakbLle/o6Y0fxHablXQKAotTgUZP5ZFtgiQHTQsfJzDjuKv1WcyJHg5X0k/+KXPt7y
 UZ7A1f83MoVe8IUhzVft5tJX6R8Y/bHha7ld5CqTPCtZan804O61WhTk24QkJnzjdd4o
 0q9ql2AHjRl+ARxSs1vLz919VP29xC1AUbyUUs4Bqe/08jnK6CbTNED8RgF4SkfD2nqo
 aUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741322228; x=1741927028;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D44Ht247p5X2IacT/H00G0KgxP5FZ6f/aPx0Tfu79bg=;
 b=Q+mdRc0x/bg0punQZWpIY12GKnljqLn6rey8iuR5jJYBKcAD6OMhXZGTQ3wNyFTsvT
 WPIV0iXc4EGFqBt6Qhub9nfcDoa35SdmfxNZqF10hsTeFQESECF2A4Eb40yEf622ed2f
 cjQl6UY8I1sZeeuADh/+wfNXNcl3u0kTPIAV9+mVCxtkTQOpEff1ICJWXZD2CIgemS7y
 nLwKPMIOCQs3n83DQklT5m2C+AAqtc2ZeBAU1RUCELyuafo7aMdo8pjZB26DEba7ApTH
 2vBlKm9SFk2PbafLMpaNldO7IMadL6gOSX25ncDnqquwe/34zqFgOM9LBT6poZtFP1Pb
 VD9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXk8M7n2tt5kHKL6vMCyG3yBuyYb/Us7UfsItjHMtlQjblfepdOIZZXS8j8qoltoI9ETnbviNKMEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjE1JrDZ5PBKKwI1N0fcw6ymPvO/OZoj00Xsz6l3t9i1ESTCVh
 tF823RfXvx0vWWOGfflZgnjKI0wM1++4utA2Rzh1EGuOQTtgqAvdf5LIpsQCG08=
X-Gm-Gg: ASbGncsDjen8LbeDP04cm9TSwfbU0Fy9iqQJH+3ddj6YC6FQ9Xdu2zZrx24kWLYe5d2
 jWuZMyZ9qeeFBlK8d0SNhGLltHkibG6JcODAbX6JzCeFL4dIg4mFtpb1IUwAkhuuA8qFVpupcmu
 lER8k7zbniOzLmyKz/OK31KQABKCcpiQ7v/dOHeynvub4G01R5TAAqJkJy+caunQW50Gd8DiENE
 pL/swQOBV2+S+65zW3K9qC5+9UCv8EY8FXNomsWemI7MwK2JHOelfX5+Nd2840bDApC9YEIv9d7
 VXVF7XI3ACs1G/K6gh/dM8N/WMWe2dBwx/MyqJvvBgIycjtucy4GkqQaLOiHFAuprlxmDlcYpWx
 1x+uOboPt+HEWrrc6oe0BGzSa
X-Google-Smtp-Source: AGHT+IHgNHqKB7KlB9uYThtwbLU/NeMyGpitbkGHoqHOlS38yLdzWQtqtEd33GHB2srLLCDq7+iGzA==
X-Received: by 2002:a05:6512:281b:b0:545:2c40:ec1d with SMTP id
 2adb3069b0e04-549910d721dmr588204e87.44.1741322228445; 
 Thu, 06 Mar 2025 20:37:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae461dfsm370344e87.43.2025.03.06.20.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 20:37:07 -0800 (PST)
Date: Fri, 7 Mar 2025 06:37:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, lujianhua000@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
Message-ID: <ejcvjq5nttlnjlvv2gf46bvxzg7mhvhh4dkgif33iarfjzcq7w@ubs7duhhsdkl>
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
 <0d473dc1-cbbe-4a1e-933a-938438db24f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d473dc1-cbbe-4a1e-933a-938438db24f5@gmail.com>
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

On Thu, Mar 06, 2025 at 11:08:18PM +0530, Tejas Vipin wrote:
> 
> 
> On 3/6/25 10:58 PM, Doug Anderson wrote:
> > Hi,
> > 
> > On Thu, Mar 6, 2025 at 6:05 AM <neil.armstrong@linaro.org> wrote:
> >>
> >> On 06/03/2025 14:43, Tejas Vipin wrote:
> >>> Changes the novatek-nt36523 panel to use multi style functions for
> >>> improved error handling.
> >>>
> >>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
> >>>   1 file changed, 823 insertions(+), 860 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> >>> index 04f1d2676c78..922a225f6258 100644
> >>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> >>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> >>> @@ -23,10 +23,12 @@
> >>>
> >>>   #define DSI_NUM_MIN 1
> >>>
> >>> -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
> >>> -             do {                                                 \
> >>> -                     mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> >>> -                     mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> >>> +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq...)      \
> >>> +             do {                                                            \
> >>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);      \
> >>> +                     dsi_ctx1.accum_err = dsi_ctx0.accum_err;                \
> >>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);      \
> >>> +                     dsi_ctx0.accum_err = dsi_ctx1.accum_err;                \
> >>
> >> Just thinking out loud, but can't we do :
> >>
> >> struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
> >>
> >> #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)      \
> >>                 do {
> >>                         dsi_ctx.dsi = dsi0;                                     \
> >>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
> >>                         dsi_ctx.dsi = dsi1;                                     \
> >>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
> >>
> >> ?
> >>
> >> So we have a single accum_err.
> > 
> > Even though the code you used was what I suggested in IRC, I like
> > Neil's suggestion better here. What do you think?
> 
> I like Dmitry's suggestion [1]. If we went ahead with this we'd also
> only need to equate the accum_err for the few msleep calls.

I think we will have more and more double-DSI panels. So I'd suggest
to add msleep wrapper which gets two DSI contexts.

> Since it
> does change the behavior, I'd like to hear another opinion on it before
> I go ahead with it.
> 
> [1]: https://lore.kernel.org/all/p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb/
> 
> > 
> > Other than that, it looks good to me.
> > 
> > -Doug
> 
> -- 
> Tejas Vipin

-- 
With best wishes
Dmitry
