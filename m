Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05F72EC07
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 21:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD10D10E3DD;
	Tue, 13 Jun 2023 19:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56710E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 19:34:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so856027066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686684854; x=1689276854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
 b=ZAmodfsGtPSXQ87+KBHTeCFdj+vVJzeWud4mhOUi7DvWouuKUjDjGEl5aJcpqKcQMa
 PhI2XCq14TmSFheHQeWQVOyI0MzG8PkQSgQPSRjEv6n1RCzsQCYPYPkjUFJRGGaWj/er
 E0v98qxAokt8WZV29TXwqb4el9D+9L0YjaU/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686684854; x=1689276854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
 b=XpiXjynW8cQXiy1kgU2NPyvcU4CJOQ+EN8/vmi8fqPtVScLfC8P8pqWeqmqrCu0U6d
 LoHdWSEFO8yonvmlkS+jtJ4BuicdGHcYcKuE1646LTfHezO7QZygPysbRbNiuKKGXgI8
 5jSRfMCvSIXCGgSXXHMnTwYVojURSAEIfyW5FMbwRM4m5ZiBSEhHC9JoWQp3X9V1a8tx
 9UGtx3l4v3y5pwFC7OEKXYoI0AstORIXLtXydsAtHFyrVbk5xSJMZoGjA+DiOcsADUKn
 RkxJv0tSx3Zh6mlSd/Y0drZ605A62K0IwMvS0yyddSb0L7GVtxBniCUN3mkWxccnQo+T
 ElEQ==
X-Gm-Message-State: AC+VfDwz3PQ5anpla+EAK2qBjisF2uEY7fLWScDCUtNIIJL/r0jxbAE/
 cB6T6BzOKpGlJRpVPpcH1Hrr+P+Y7vozI7Otfl2l+xrX
X-Google-Smtp-Source: ACHHUZ7Xocn+WDafx7ZRwZId7q2QXIIL4m/sWNS0CVBZhVLpBQe89XmhfWDy0ADhehMAi3oC47nsxw==
X-Received: by 2002:a17:907:6e23:b0:970:e80:e29a with SMTP id
 sd35-20020a1709076e2300b009700e80e29amr12506388ejc.68.1686684853886; 
 Tue, 13 Jun 2023 12:34:13 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 h21-20020a1709063c1500b00978937e9dcdsm6923218ejg.42.2023.06.13.12.34.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 12:34:13 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-513ea2990b8so2984a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:34:12 -0700 (PDT)
X-Received: by 2002:a50:bac8:0:b0:507:6632:bbbf with SMTP id
 x66-20020a50bac8000000b005076632bbbfmr11406ede.6.1686684852516; Tue, 13 Jun
 2023 12:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
 <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
In-Reply-To: <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jun 2023 12:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Drop aux devices together with DP controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 12, 2023 at 3:40=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 13/06/2023 01:01, Bjorn Andersson wrote:
> > Using devres to depopulate the aux bus made sure that upon a probe
> > deferral the EDP panel device would be destroyed and recreated upon nex=
t
> > attempt.
> >
> > But the struct device which the devres is tied to is the DPUs
> > (drm_dev->dev), which may be happen after the DP controller is torn
> > down.
> >
> > Indications of this can be seen in the commonly seen EDID-hexdump full
> > of zeros in the log, or the occasional/rare KASAN fault where the
> > panel's attempt to read the EDID information causes a use after free on
> > DP resources.
> >
> > It's tempting to move the devres to the DP controller's struct device,
> > but the resources used by the device(s) on the aux bus are explicitly
> > torn down in the error path.
>
> I hoped that proper usage of of_dp_aux_populate_bus(), with the callback
> function being non-NULL would have solved at least this part. But it
> seems I'll never see this patch.

Agreed. This has been pending for > 1 year now with no significant
progress. Abhinav: Is there anything that can be done about this? Not
following up on agreed-to cleanups in a timely manner doesn't set a
good precedent. Next time the Qualcomm display wants to land something
and promises to land a followup people will be less likely to believe
them...


> > The KASAN-reported use-after-free also
> > remains, as the DP aux "module" explicitly frees its devres-allocated
> > memory in this code path.
> >
> > As such, explicitly depopulate the aux bus in the error path, and in th=
e
> > component unbind path, to avoid these issues.
> >
> > Fixes: 2b57f726611e ("drm/msm/dp: fix aux-bus EP lifetime")
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
