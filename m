Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F950933E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 00:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2708E10F0F2;
	Wed, 20 Apr 2022 22:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E7A10F12C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 22:58:51 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 w27-20020a056830061b00b00604cde931a0so2128837oti.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=D/sEi/2+cVqpCIq91LcVmWCZlF+pWsMqa17bfCQo3OU=;
 b=hCDsogPxydJMDkQ7gKztLKAEpi3v1TiAqC/NcA4UkhO4iJYHUO6SZDdqSxQwpv2H5j
 B0ZNeLFb4y3Bjtm7hPANo7XuEBdttK8x00YkOmhPzTxB/oeoUYgssEUDBzHanAgDxhOC
 x3fBBNGIdyLbaTTGWNeT9EySdGmM5ZGB6VmPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=D/sEi/2+cVqpCIq91LcVmWCZlF+pWsMqa17bfCQo3OU=;
 b=b5/Cwoa016qwHwLQBBWVNKLABNytHZ2bPC9g9vZYKIPhF7eeCwNa+cuaWmU4TXFs7N
 9HKKvfm8cG48xcrP+JRrg0Z/gjOPUdQo2rgWL/ydPP06VphaJaCVN5J+umBkf39ivm5Y
 rNUYGuTObD1vmJdhWRQSTRjwp8lxMWxjAWjULu0/Poj+XYSLu6N63A7g1mbla1Sj1iTI
 zzkxLZtqQJ1zMkhVQ8vQbH8mxrbTOExArRDTTkfyK63HCcjg9FqFAbZy//cQ4FHv7xta
 eIFU2upivZVDuvRiHJPYWAW5TkbCaANdWMFSz94EULE7jlPO3Mei+pdX9nCML948YNe7
 XdYQ==
X-Gm-Message-State: AOAM531K3E5tqrz9m5H/Mx3yaLeDfkhNA4YaOJjJ2lkBDmNqAuvmoVlp
 tZHpxZwEtupFdU2oFqc5k0ot2Zh/xv0LaoQTS7JFlw==
X-Google-Smtp-Source: ABdhPJxVwjd5x5zLGqJQIHe9mf25daLALtOL8ozyt8Hvub9dABrVZsKj8sNwp81VZNO9erWnf6HfF7+CU1PIT/aikfw=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr8524679oth.77.1650495530519; Wed, 20 Apr
 2022 15:58:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Apr 2022 15:58:49 -0700
MIME-Version: 1.0
In-Reply-To: <02d31565-4ae4-a319-30b0-76a6e4917f6f@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
 <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
 <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
 <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com>
 <27bb2732-b322-75b0-3883-773e6eb4b1b9@linaro.org>
 <02d31565-4ae4-a319-30b0-76a6e4917f6f@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 20 Apr 2022 15:58:49 -0700
Message-ID: <CAE-0n51F+S4a2mQoyWa-TpJcd73hstm2Sh1uO+4T_75UaWQASQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-15 17:06:48)
>
> On 4/14/2022 4:34 PM, Dmitry Baryshkov wrote:
> >
> > I'm not sure how should the driver react if the client doesn't disable
> > the output, but then the sink gets reattached?
>
> I do not know that either.
>
> But it should not happen as long as framework response to uevent.

In talking with seanpaul@ it sounds like we can update the link status
to BAD with drm_connector_set_link_status_property() and then put it
back to GOOD when the link is re-established. This way userspace will
know it needs to retry the modeset. Does that help here?
