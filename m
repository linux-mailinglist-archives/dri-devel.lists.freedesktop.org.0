Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA94C873E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1D10E5FC;
	Tue,  1 Mar 2022 08:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D34210E5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 08:58:58 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 195so17781721iou.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zS+cnPhBtmmIHoXqElXnQsUButXiv0E0/DwMRuRFsLQ=;
 b=dKk4qQ7LWIzAJYcabanXSX62/bwBzGNkQbny257h4oA2F/V5kxaID5hYkQF3fxysnF
 fDNVbcXoWlfAllgEoc0Decg8CFEaGxd0KoJ9+f3/8j84KLWtIbRufWVUCaPW99S+J7+x
 VXIdjnvqxyqu7R4Sxe71///9HuXYiqFP/wf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zS+cnPhBtmmIHoXqElXnQsUButXiv0E0/DwMRuRFsLQ=;
 b=n2N7qftzCXvXIzmkAbTvhv94b2fFPAjHZAzb5J8nFD66hXnOI5gbV+D+fKJc8PDSdJ
 VcDShXDt5BtGH3lSpsyt1qBaSuJxYlMUxQC5puQAmF5BTZnrUIsYImZX2/VBxZHdf3Op
 3fvPj/X0NpNe0qlxF2H0VrVRWgJTyx8Cl8D482oCcXVPG/T34aBfa8Jvm25f+E6qqegU
 mc6oD4mXbmvaqU+/kW+SeoOuDGH6Xvhv2Tw21OSoUjan1lZxjongFmxv/P2EnXYtKHhW
 ABmfjmqNeLpuAf9lqeE3bvyeF+IR+eJx8uWvaakla6uZFtpcWgX05FW9HKkUrns139h1
 8sSA==
X-Gm-Message-State: AOAM531w6rDNSHA9xds+swmv/PmDVhQIGZxxSGPZIQDrROR1rX53z7CN
 Ai7pl23W73HEyKNxoB0jcb6ux9xfn1BYiR5FAOq8Wg==
X-Google-Smtp-Source: ABdhPJxOedb42cR7Env5tKd14Yn3MvdH7P0GclmaXB02RzkvPpMNJdAl5QWXrFoa5CaeeG8sh1JIhazy20hqvbbqSvU=
X-Received: by 2002:a05:6638:3f0a:b0:315:1190:ae9b with SMTP id
 ck10-20020a0566383f0a00b003151190ae9bmr21363237jab.210.1646125137609; Tue, 01
 Mar 2022 00:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20220217024418.3780171-1-xji@analogixsemi.com>
 <CAJMQK-gDHsH=F=d+9W1-jOqKx6kveUtRRSG03W6KDVat=BzZhg@mail.gmail.com>
In-Reply-To: <CAJMQK-gDHsH=F=d+9W1-jOqKx6kveUtRRSG03W6KDVat=BzZhg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 1 Mar 2022 16:58:31 +0800
Message-ID: <CAJMQK-j6Nm4xt0oA9332+3AbqZ9YJuAR7EAK2BZnob2EkKLH1A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix release wrong workqueue
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 bliang@analogixsemi.com, Xin Ji <xji@analogix.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 11:02 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Thu, Feb 17, 2022 at 10:45 AM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > From: Xin Ji <xji@analogix.corp-partner.google.com>
> >
> > If "hdcp_workqueue" exist, must release "hdcp_workqueue",
> > not "workqueue".
> >
> > Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> This fixes an issue that the driver will crash during unbind.
>
Hi Robert,

Kindly ping on this fix. Thanks.

> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 633618bafd75..9aab879a8851 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2736,8 +2736,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> >
> >         if (platform->hdcp_workqueue) {
> >                 cancel_delayed_work(&platform->hdcp_work);
> > -               flush_workqueue(platform->workqueue);
> > -               destroy_workqueue(platform->workqueue);
> > +               flush_workqueue(platform->hdcp_workqueue);
> > +               destroy_workqueue(platform->hdcp_workqueue);
> >         }
> >
> >         if (!platform->pdata.low_power_mode)
> > --
> > 2.25.1
> >
