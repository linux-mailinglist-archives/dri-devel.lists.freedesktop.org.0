Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E772D986FF6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FB810EB29;
	Thu, 26 Sep 2024 09:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LaEW4uL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303C610EB2B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:22:59 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6e235a61bcbso2313447b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727342578; x=1727947378; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LZGtXs4SnucH/2vV0KGS1J8bE5d3j0Fh63iPQCBAM80=;
 b=LaEW4uL3qv3k+7X6Wn8NMrkuhX1eE0jYGUjhnxLZimirYZEXzDIDQSvBS0TidAJ6ed
 iCp9AMGq6FH9Br0S7zg7JZKxLl9OEOpPDuBFm7tj6OKWMsp6MvM7ZVUxR9s1cfVkH4Uv
 PToS8WgmNZpeQVMkPnBMLMVWNMPJAD4QmPBmZxQfZrb/ZfLwmQig9YodK+cd2+ruLZXg
 dKzIH86pNpr10/WaCEqvKNuhKkfOx+KtpD6kVzmp5AwOTHrVmOcJmHM80HzxsT4cqkLd
 dzkszSiKjL2HI87kNWZz6wzaYlA+tLTNd4OhvwMiO8wkNud1i2+WuUZx6PS/vRrYvBQG
 poAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727342578; x=1727947378;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZGtXs4SnucH/2vV0KGS1J8bE5d3j0Fh63iPQCBAM80=;
 b=G5h2p0WYz/CbWUuYuqOh8u9FMu34HyAv7F1MjfB9KXaNgnqeySNFRtLYnxmi5Jd1ar
 Awl6uSKtSu4tBb7833OJU/pLsL/KTZv1ayRXrT4/Uyc/mwzXjs/q8HQdqGP6JExDhDmq
 x9z8VoBM+LCK5ebO4LmUiadEFqJHy9JqCLfNGCz3IvnNbOZ7/WizZFW0/LXjAAgqbrZp
 NYmsx2LMNSBVh1qxrq2NDeVH0WMUWAgDnGA8Q71+u/CNdsFeEhQisP/DmjwPmnficeIE
 U89W0xomFLu36VdNboFU6KSViKdMRKxbYxp3Nwxr8FtPLFILwZsOjhBnKpOAKySU+GJS
 PULA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/1YMH8xFKeiEts0IzCk1L84MIsUFT6BWDEXLBBH3DDwYr3Ulo/oZXseDkIO5qgbgedFkYztPcGNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVKLr0u7pyTi/gC57crmtsYfHssy6OUgsA2qQhU8m7IBLWxe5q
 3fEOFg+ztBcqy3dsF2G6ruRz5pPhnWDDirkBQh/R53o/tCwD9QnVDh0G9OmcM5Az6z6ip+YJUx5
 XnaBnxl3N8kP33rftQRCWq4PcIlTuZoC4fjNezA==
X-Google-Smtp-Source: AGHT+IFt9+XUc/nU9CnjzfY8rchFZ60R0ODamPwBCn1bvMLBUHAlkIVUGyZ+P/73Bxs2FGRrF7jjbcdhBdl3LCi67FQ=
X-Received: by 2002:a05:690c:660b:b0:6e2:611:7abd with SMTP id
 00721157ae682-6e22f004833mr18307427b3.20.1727342578171; Thu, 26 Sep 2024
 02:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
 <7pazkukfrskc6o2zd23h6o4wyt7ougjjgnmogy2effr2lof7di@7opphoswhebf>
 <7ac7de7a5c7e417484bc2a4a1ad59ac3@ite.com.tw>
In-Reply-To: <7ac7de7a5c7e417484bc2a4a1ad59ac3@ite.com.tw>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 11:22:46 +0200
Message-ID: <CAA8EJpq2rZu5ciSc4Zg6cO66B9b7QLszgZjhhqX6Mk2Q0sHpdQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] drm/bridge: it6505: fix HDCP CTS ksv wait timer
To: Hermes.Wu@ite.com.tw
Cc: Kenneth.Hung@ite.com.tw, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Sept 2024 at 10:39, <Hermes.Wu@ite.com.tw> wrote:
>
> >On Thu, Sep 26, 2024 at 03:51:33PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >> When running the HDCP CTS test on UNIGRAF DPR-100.
> >> HDCP must disabled after waiting KSV for 5s.
> >> Consider system ksv work schedules. The original timer has a chance to expire.
> >
> >I can't understand two last sentences, excuse me.
> >
> >Nit: KSV, not ksv
>
> Form HDCP CTS, DUT should wait downstream KSV list at least 5s.
> And driver use a while loop with a 20ms sleep to reach the scope.
> The true wait timer will reach 10s which is much longer then it supposed to.
>
> It should better use other APIs to implement this waiting, rather than just reduce the counter.

See all the macros in <linux/iopoll.h>, maybe that helps. Consider
adding a version of read_poll_timeout with the in-loop break
condition.

>
>         timeout /= 20;
>         while (timeout > 0) {
>                 if (!it6505_get_sink_hpd_status(it6505))
>                         return;
>
>                 bstatus = it6505_dpcd_read(it6505, DP_AUX_HDCP_BSTATUS);
>
>                 if (bstatus & DP_BSTATUS_READY)
>                         break;
>
>                 msleep(20);
>                 timeout--;
>         }
>
> >>
> >> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index e75bc1575aa8..22d9bec3faea 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -2093,7 +2093,8 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
> >>      struct it6505 *it6505 = container_of(work, struct it6505,
> >>                                           hdcp_wait_ksv_list);
> >>      struct device *dev = it6505->dev;
> >> -    unsigned int timeout = 5000;
> >> +    /* 1B-04 fail, wait to long to Stop encription(5s->3s). */
> >
> >encryption, most likely it's also "too long".
> >
> >> +    unsigned int timeout = 3000;
> >
> >What is the timeout per the standard?
> >
> >>      u8 bstatus = 0;
> >>      bool ksv_list_check;
> >>
> >> --
> >> 2.34.1
> >>
> >
> >--
> >With best wishes
> >Dmitry
> >



-- 
With best wishes
Dmitry
