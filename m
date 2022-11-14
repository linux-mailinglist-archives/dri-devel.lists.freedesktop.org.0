Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC43628AC8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 21:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463DF10E318;
	Mon, 14 Nov 2022 20:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2DC10E063;
 Mon, 14 Nov 2022 20:49:26 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13bef14ea06so13912287fac.3; 
 Mon, 14 Nov 2022 12:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/zs5GFS4zX5I6/Faq+e+SUg4iVEYXlwxarNYXij8AkM=;
 b=ImPaTYpH20pxonMgoWCi8i5Qs38yYeoMefN7Ur6gCETa7/kYYYRJoRy4jpTu1Vpzn3
 hWLLOgAeDNUPVTO+5huo0TYVcwfWujK0Aw1JE/wJwtx//tDBo9QX57HtwqowqYi+65MH
 3v3CO/F0ngn4sRyzWvOXMehFGzagpS0FBLRlphqddJCIOtVf0miMSb3Qsx6VfbltPPPz
 rwAVxmLlrArcsS97jBiWyztSuCfBFEehxgy0Ck+9LbqJHYbe//kCtwbRZsJQNO6veN/7
 J3DXqrlpMQxiGuUN9aDF4KMoC6Ld18+V4aHI/oXi83S5KpWO/sq5NJt+6H9JILlgOhOk
 3a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zs5GFS4zX5I6/Faq+e+SUg4iVEYXlwxarNYXij8AkM=;
 b=6XpWGqU2uEo7G+8HDLQeGu5mvDXJbsYKjoIo6gmntpzrI3zUTwlpmZOKOeZGH8S1al
 jJrDPcJVWcsViDCTRBsNeLFpLYTn8SBJVTsrYxUWg062ZlPjvAJj5CUd5a2GPprLUUik
 Etcdm/S4IhTTlur1YcLwi2eVl1szY9gUSBHojw3JdgGqR2SbaxGy4DPuZtOLFY6duNdT
 d7U6Yekm/iHoX0vQFphaUbzDIw/eiERRsDwr7UnOOHoTAZHqM4kkHKhgyNtbISkmfiY3
 DHilJmEUFy6zu1bc2tO3O1sl7mJ+qAnXVFO96s9/VUEs0SwIkcb/Rra+1OFhpdPVC2bh
 +iVA==
X-Gm-Message-State: ANoB5pn9Ha39sQkAzfcz4d91itR0J0wizCDb5tSPGY7geunEM3aNYvsW
 IQmSQAHI7cdta07/S6fBcBC4nINgZcuM1T4o2is=
X-Google-Smtp-Source: AA0mqf5Oo2AzjTceHKiJk2Mi+Kzjn7EOsa7GoBX8c8TdPP3ULdrZxu7oElvFZNnKbpBB817J/M/OWPoG7FxpTmV9EYw=
X-Received: by 2002:a05:6870:b87:b0:13d:51fe:3404 with SMTP id
 lg7-20020a0568700b8700b0013d51fe3404mr7667561oab.183.1668458965345; Mon, 14
 Nov 2022 12:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20221114194133.1535178-1-robdclark@gmail.com>
 <97429a67-e763-4226-828c-8381a2abe9f9@quicinc.com>
In-Reply-To: <97429a67-e763-4226-828c-8381a2abe9f9@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 12:49:45 -0800
Message-ID: <CAF6AEGu2soY3Xm_obivcLKqgJ0HVj0H90C7zN5YOTFK0RmRbdA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 11:59 AM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 11/15/2022 1:11 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If we get an error (other than -ENOENT) we need to propagate that up the
> > stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
> > whatever OPP(s) are represented by bit zero.
> >
> > Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 7fe60c65a1eb..96de2202c86c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1956,7 +1956,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
> >               DRM_DEV_ERROR(dev,
> >                             "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
> I just noticed and was going to send a similar fix. We should remove ".
> Some OPPs may not be supported by hardware" here.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
> Btw, on msm-next-external-fixes + this fix,  I still see boot up issue
> in herobrine due to drm_dev_alloc() failure with -ENOSPC error.

Could you track it down one level deeper? I wonder if there is some
missing cleanup in the probe-defer path and we end up failing in
drm_minor_alloc() or something along those lines

BR,
-R

> -Akhil.
> >                             ret);
> > -             goto done;
> > +             return ret;
> >       }
> >
> >       supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
>
