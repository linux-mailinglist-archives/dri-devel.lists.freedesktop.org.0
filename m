Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F06CC734
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872F10E11F;
	Tue, 28 Mar 2023 15:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7269310E11F;
 Tue, 28 Mar 2023 15:56:12 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17786581fe1so13158556fac.10; 
 Tue, 28 Mar 2023 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680018971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLQmwWJisvp20MnJ4qDI8yRnwjPlaeebVHetENzuzzU=;
 b=OMbM7O9EwBPWWFjEMJ+FlcmYiUgbLAfQbAtSTuyxoESDSgQ8hxghe6qUyRx/vWMcwh
 aHVOiBp14eBMTCpWI7EXffI2UDinCk6c7HEi5vnnMdOt0RWbeGRltPE7QsecSf6UZvCy
 m/dzpD6UfN14mpt/DqrhS//y9OxBhElytj2WCu1DJ5badiC7j7HoZfUgvU669VHBXz3N
 UzYknZTA9gE7NJ0H/WeB9SV6uKDRhvEHjv5o2wMVCnVVIh+eKF+8tCUOzzC7LjAztv/T
 v47jIBW3dO77hkBHYiaxICiyfMo4YGu/+7ZHQcLuQUMzxJDp4W3IVeKVsm+FbzfXUSp3
 fyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680018971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLQmwWJisvp20MnJ4qDI8yRnwjPlaeebVHetENzuzzU=;
 b=WbJz10V0X5TRuF8jtrKUGnba+z8bFd3rcwHoK3K4LASkkguessjpOoWRgeyk5Ezk5I
 Cxq3mpBgNXK9JNvB1QsvX9YHWlFBSAuF2MQLrcVlW1BhaYdg7zB6CC2YprKPpb7UWO4m
 6+JH7AMIUbGbeJUH+ilO5Daih9WFVTBKgSGPx9EDz9tebSRf3+sf1Z9Vk9BZgvs1+LvE
 RyXMEiN5OESOAjVzgXxYmtw1T/7hKS/JEP8nNzpkj4c3Il6Xi6w6y+vaMd1Vk11AeCP+
 Fh/Jt0bVqafirJT4crJyVh26GgheQe5ZWOcJMPcPDevJ2f3AIqWke36/XoLmHKUTK49g
 3pvA==
X-Gm-Message-State: AO0yUKUSLq3nT5gJN7tnnoZiDFuLtnzyT1FcwtUWJHRKzrfGdnaHgnzG
 vyKHTiDgagz03zgNOXbKx++tPiDdhQuff4AKPoM=
X-Google-Smtp-Source: AK7set9Dbu34N1vzrjqQsCVc28MeYvZObEv0k5MjUDJn0LlSibv+c/2Gjo7q6ZirexlX1fKiTuUOUJWWFpxN4YAPvJI=
X-Received: by 2002:a05:6871:4796:b0:17a:df9b:6b1b with SMTP id
 qa22-20020a056871479600b0017adf9b6b1bmr5890211oab.5.1680018971653; Tue, 28
 Mar 2023 08:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230324220013.191795-1-robdclark@gmail.com>
 <af31e11c-6c70-a358-1198-3cddc3ee2f89@linaro.org>
In-Reply-To: <af31e11c-6c70-a358-1198-3cddc3ee2f89@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Mar 2023 08:56:00 -0700
Message-ID: <CAF6AEGs8yH4SHvjDHKkHT3c4UNc35m3tFGiPBcHA3oATZQiKVA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Avoid rounding down to zero jiffies
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 8:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 25/03/2023 00:00, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If userspace asked for a timeout greater than zero, but less than a
> > jiffy, they clearly weren't planning on spinning.  So it is better
> > to round up to one.
> >
> > This fixes an issue with supertuxkart that was (for some reason)
> > spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
> > drops from:
> >
> >    15.83user 20.98system 0:47.46elapsed 77%CPU
> >
> > to:
> >
> >    8.84user 2.30system 0:46.67elapsed 23%CPU
>
> Interesting. We potentially increased the timeout, but the overall
> (elapsed) time has decreased. Nevertheless:

There is some randomness from run to run so small variations in total
--profile-laps=3DN time are normal.  So I wouldn't read too much into
that, compared to %CPU.  This shouldn't really change how long it
takes for the fence to signal, as much as just prevent the CPU from
busy looping until the fence does signal ;-)

(In theory the CPU busy looping could cause GPU thermal throttling,
but I don't think that was happening in this case.)

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

thx

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_drv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> > index 9f0c184b02a0..7936aa6cad03 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -548,7 +548,7 @@ static inline unsigned long timeout_to_jiffies(cons=
t ktime_t *timeout)
> >               remaining_jiffies =3D ktime_divns(rem, NSEC_PER_SEC / HZ)=
;
> >       }
> >
> > -     return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
> > +     return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
> >   }
> >
> >   /* Driver helpers */
>
> --
> With best wishes
> Dmitry
>
