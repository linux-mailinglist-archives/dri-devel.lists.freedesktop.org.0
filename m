Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829BA797E2C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 23:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE18910E817;
	Thu,  7 Sep 2023 21:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599510E81E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 21:57:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-500b66f8b27so2469845e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694123854; x=1694728654;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Jwvl3f1dyM/ZwqDQJcr1BuQmvzMJTBmDU+AvdLd8dGM=;
 b=CvfIzeCdGmEm+r++KeqKd6xWcX9Cah3cK/LyOEbsL+IUGwUlQjC5m4PmPchjVbPDzH
 a+xTLstH43XfdC5nhBqcGDaeH0DwdYPJONXK7wqdXK19ZdJQPsSGnT8jI1N1tZCZx00S
 oNcT0OP6xwC9d3WMtGPmvjnfQhkxFVyvITudo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694123854; x=1694728654;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jwvl3f1dyM/ZwqDQJcr1BuQmvzMJTBmDU+AvdLd8dGM=;
 b=Lhr75XOwKpQq79SDn5k9E86M0hxp/6m0Wn58U09CuPoQcDac/t09Luv37zfU5D++80
 fawACZeT/auBlM7++izLhLt/3Osav6QFIi+iC4pT8Ez5HzVWCp61aK68w2UunjFBUidv
 wqFJmJn9lM1NC3GL/jqdGc3OwEoNkbe4HwhqriWIcVQfTpRJEcWqKw4ZhbkNLIJzO1sK
 uUpuXlbFzebxUgv8gTNC/tYXTtWenQCooUJQsNLtxcw863cTuLn5n8MMN6cbl/HBrDRJ
 3wYlArGBd1tXaTUJS03MeIIOaZADKmB+ksaF0RrU8sIlehSdPnznZDEzz8uaFvquJeoP
 XU9Q==
X-Gm-Message-State: AOJu0Yy3Azb8si/zo+Re+NcrIPbI6da4Ulj6NOejTsgo59HGKwm9YMSV
 pjbVb62jQj5Rhf+ZuYdWUjCNYmunDvPWiob/cjFKig==
X-Google-Smtp-Source: AGHT+IGVSSijOPnlfNzQCrbEnJgfe4rGMSL8CGoZtaBOJk5rkFQD9fHQL9VYUx5D2OjlyhMtzOcbJflmFOcVz9tYUIQ=
X-Received: by 2002:ac2:5e8a:0:b0:500:9f03:9157 with SMTP id
 b10-20020ac25e8a000000b005009f039157mr433183lfq.65.1694123853885; Thu, 07 Sep
 2023 14:57:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:57:33 -0700
MIME-Version: 1.0
In-Reply-To: <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
 <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Sep 2023 14:57:33 -0700
Message-ID: <CAE-0n52F-fwjiwmeO9wZE_kKKpo+DDnuL-nCxX4f2rODrdTzRg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-07 14:48:54)
> On 08/09/2023 00:34, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 97ba41593820..1cb54f26f5aa 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
> >>                  }
> >>          }
> >>
> >> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
> >> +                                        dp_panel->downstream_ports);
> >> +       if (rc)
> >> +               return rc;
> >
> > I haven't been able to test it yet, but I think with an apple dongle
> > we'll never populate the 'downstream_ports' member if the HDMI cable is
> > not connected when this runs. That's because this function bails out
> > early before trying to read the downstream ports when there isn't a
> > sink. Perhaps we need to read it again when an hpd_irq comes in, or we
> > need to read it before bailing out from here?
>
> I don't have an Apple dongle here. But I'll run a check with first
> connecting the dongle and plugging the HDMI afterwards.
>
> However my expectation based on my previous tests is that we only get
> here when the actual display is connected.
>

We get here when HPD is high. With an apple dongle, hpd is high when
just the dongle is plugged in. That calls dp_display_process_hpd_high()
which calls dp_panel_read_sink_caps(), but that returns with an error
(-ENOTCONN) and then we wait for something to change. When the HDMI
cable is plugged in (i.e. an actual display) we get an irq_hpd. That
causes dp_irq_hpd_handle() to call dp_display_usbpd_attention_cb() which
calls dp_link_process_request() that sees 'sink_request &
DS_PORT_STATUS_CHANGED' and thus calls
dp_display_handle_port_ststus_changed() (that has a typo right?) which
hits the else condition and calls dp_display_process_hpd_high().

So yes? We will eventually call dp_panel_read_sink_caps() again, and
this time not bail out early. It's probably fine.
