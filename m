Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E864E22E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 21:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A2710E562;
	Thu, 15 Dec 2022 20:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653B510E562
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 20:12:34 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a19so176504ljk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 12:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ma29jYxLICPfJYdRmS8iS0Sz2Ww6x0xzpK34aJyoY38=;
 b=WAMocIyQLya3cZ3eoRREWyL3BJuNCw4hHzTN4zu8lxDR5ZNKjTqCzsxYDNl+EGJJam
 gwjij75zZhMjukUfT79v+h+7g9RMduI6pfuM5dCQ9kFJGj914ZIi+iCdEMUkSEN3iKvZ
 Kjh0w0DYmCEhqLYN6dcPY+roorUbtIZ7LGas8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ma29jYxLICPfJYdRmS8iS0Sz2Ww6x0xzpK34aJyoY38=;
 b=zoPHw3nM4hl/L8eOVkCIALE6Hf5bBabeVqDJdvF1o897izfSYYirJuQh9+4pn/z98u
 /UdHxcjc9LasgxryyqqcW8z/ooHX/zLJp3fSUrgiKI4vOE1sfnwm9WmVmZCJw8XlnAyH
 Zgk3De4nZll9AznP8dT1VfT7hZ0MzetL48T3O+8L/rQbTRHJd/VkZ7TOgFKoCDsMSb9t
 4a0a0QBrKoq8X4TzyCOW5wRi0Akt9IxGoqWXuDuFBkOqiGmJOoNSjaDhyPXrJlD71q0m
 O5IR1HwHZ0GjzPnKQAXWkIAnOMYqlcgOh3M5iS63bPB4F1wxXDTKi99cTJvZPJjB++TB
 Gyrg==
X-Gm-Message-State: AFqh2kpxW1F2CpR2ELwXhenDj+ADgUY4dCLxzWp5plkRfJhfCYcwndp2
 UB1dXCrAz3S4ZkcgNoIN145fE85FJQ86hodjfiL9Nw==
X-Google-Smtp-Source: AMrXdXt3ybfdYsbW+NzMUL4sJXmfO6ubzbiioxX2yF9TmOb2VxGIBXIKmk+OiSkMyH6erDrmmUsl31yNVnS26c1UhTo=
X-Received: by 2002:a05:651c:3c7:b0:27d:75b3:8fd0 with SMTP id
 f7-20020a05651c03c700b0027d75b38fd0mr510146ljp.39.1671135152456; Thu, 15 Dec
 2022 12:12:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Dec 2022 15:12:31 -0500
MIME-Version: 1.0
In-Reply-To: <98cc6d55-f9c7-a369-6004-42b242d01339@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
 <98cc6d55-f9c7-a369-6004-42b242d01339@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Dec 2022 15:12:31 -0500
Message-ID: <CAE-0n52j8vYYTRSpBo82MHqLiSjxikL=2P6NQwa0-DW__sc6WA@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-12-15 09:08:04)
>
> On 12/14/2022 4:38 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-12-14 14:56:23)
> >> On 12/13/2022 3:06 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2022-12-13 13:44:05)
> >
> >> Therefore I think add data-lanes and link-frequencies properties in th=
e
> >> DP PHY binding directly will not helps.
> >>
> > I didn't follow your logic. Sorry.
>
> Sorry, probably i did not understand your proposal clearly.
>
> 1) move both data-lanes and link-frequencies property from dp controller
> endpoint to phy
>
> 2) phy_configure() return succeed if both data-lanes and link
> frequencies are supported. otherwise return failed.
>
> is above two summary items correct?

Yes.

>
> Currently phy_configure()=C2=A0 is part of link training process and call=
ed
> if link lanes or rate changes.
>
> however, since current phy_configure() implementation always return 0,
> the return value is not checking.
>
> This proposal is new, can we discuss more detail at meeting and decide
> to implement it or not.
>
> Meanwhile can we merge current implementation (both data-lanes and
> link-frequqncies at dp controller end point) first?
>

I don't think we can merge this patch because it depends on a DT binding
change. If the PHY approach works then I'd prefer we just go with that.
