Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953E861E2C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4393310E031;
	Fri, 23 Feb 2024 20:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QR8rPiWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C5010E031
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 20:52:52 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc74e33fe1bso804849276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708721571; x=1709326371; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NxODghQMamK2SljX5x9IFGf+/9bKTXqE2yI7GzUqoio=;
 b=QR8rPiWIWroE3XlH0n/MNFMia0IFSKQVXZQlJ5E/X3GZwFhNLsUpVhcB9VeD9Sab4c
 AM2SnCj/2CL1JuefNOeMecpO2+84PotzDw4PkYjVFTA36dZZ1G6dyJrdHF1JKgwWmqJP
 NzG6sTsNjzHRNY8VEiYf5U1Wan4ozWMussGjAPLX7Lmi08CVFIdTOIARW/auv68NHFd/
 q/0uvchvt5/iKAWDUF/tfJy0xskk/KknEzIug5pKwdxmNg250lBmS8m9zaof/cngtOLe
 xjScgHqmQNLOGHPQO7SNFJaY63NX0y/hs+d9DWi1VaoIXhIq+ytyNSsl4YENtUSbHEu7
 bNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708721571; x=1709326371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxODghQMamK2SljX5x9IFGf+/9bKTXqE2yI7GzUqoio=;
 b=FRrr/6B/U1QSEv5tpjxYR4O2LgrQqtHfOEwJx9E8ZX2TzAppr51WzYZ4KatGCneGpr
 d9B8O8AL7KSSj+USTDwGCoZg2pwCY1RAGWLcayO14/bOEcTH2b99CU9OKbQ5o25Wax8F
 Q0wx985yT0ze+pIv7X8ndLY6kNlSNjQwpQQmnuny+eOFuYJV7UToP+miqiFxe0myV8aP
 eZ/WfHQbZdi5gtvIlQhx/ccYqxfQH+yJ7xfYeIuz4SzdQPWq/ukoHJyt/iA1idUjyc0Z
 i8YlZ3uONB3b84kpxVx8MZCc37ZhSI87c3NDUxaLc9UT3ApSZGx6dZWb2fhVNgNjSo/+
 JgMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCtm9CxxLdjXI4lKr27qsIBrytHRiMPqvc31iBdINQznEnzP6aBCJO2+Yzt9YPvew2VPFd50ODjtTHaJsI2G1P93+A7zBNndGYX7GY5gMS
X-Gm-Message-State: AOJu0YwHP8TjZo4+gr+1O4JTtrzZGjKm6RfB84/PCJ4N8BTigitLdAY8
 RJckYJrGryuZoNowcA23rRA7ZCUVR8Tt4cZ+h9pVtzcE/lksV6DQ3gleB3uD4x8MBf0ZQqbbmBn
 6q7b7rLs/bjhNxQhuQu0pc7cdMiKSPAB5hPxg2g==
X-Google-Smtp-Source: AGHT+IHZ4hv1SyiQwuPj/DGpQnYbZ1k7ZnN6iq5FQGS2hnMIJawQ/6XD7dXtl7UaSQWqFV1jxKvJifN7iBXBctwJ910=
X-Received: by 2002:a05:6902:2ca:b0:dc6:9d35:f9aa with SMTP id
 w10-20020a05690202ca00b00dc69d35f9aamr972227ybh.19.1708721571664; Fri, 23 Feb
 2024 12:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
In-Reply-To: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 22:52:40 +0200
Message-ID: <CAA8EJpr3BJF_F231L3D8Qmx0Onvua7wcm2g=FM_YxMukw5-swQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> > The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> > Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >
>
> I checked myself and also internally on this. On sm8250, the DPU planes
> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>
> May I know what was the reference to add these formats to DPU
> considering that even downstream sources didn't add them?

No reference. I was interested in checking different YUV formats for
the test. It worked, so I wanted to discuss this. In the end, we are
just changing several bits, which are used for other formats.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> > the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> > correct way to handle it, so I'm sending this as an RFC. If we agree
> > that bumping the .clk_inefficiency_factor is a correct way, I'll send
> > v2, including catalog changes.
> >
> > I had no such issues for the YV16/YU16 formats.
>
> We don't support this too on sm8250. But interesting it worked.

As I wrote, YV24 also works if I slightly bump the clock inefficiency.
I think this points out that maybe we should calculate clock factor
dynamically.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
> >   2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index e366ab134249..1b763cd95e5a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
> >               C1_B_Cb, C2_R_Cr, C0_G_Y,
> >               false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
> >               DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YUV422,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C2_R_Cr, C1_B_Cb, C0_G_Y,
> > +             false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YVU422,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C1_B_Cb, C2_R_Cr, C0_G_Y,
> > +             false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YUV444,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C2_R_Cr, C1_B_Cb, C0_G_Y,
> > +             false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YVU444,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C1_B_Cb, C2_R_Cr, C0_G_Y,
> > +             false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> >   };
> >
> >   /*
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index ccbee0f40ad7..949c86a44ec7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
> >       DRM_FORMAT_YVYU,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU422,
> > +     DRM_FORMAT_YUV444,
> > +     DRM_FORMAT_YVU444,
> >   };
> >
> >   static const u32 rotation_v2_formats[] = {
> >
> > ---
> > base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
> > change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3
> >
> > Best regards,



-- 
With best wishes
Dmitry
