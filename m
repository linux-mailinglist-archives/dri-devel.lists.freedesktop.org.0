Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE174B4AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF1A10E5B8;
	Fri,  7 Jul 2023 15:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666DD10E5B8;
 Fri,  7 Jul 2023 15:53:33 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a3a8d21208so1882768b6e.0; 
 Fri, 07 Jul 2023 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688745212; x=1691337212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCL53aP+hS7tciKjFD7blcuEy36DSLX5ukiouHjZxlI=;
 b=MD0SFOGCQwWl8ocgrw6iXF5GRCdimdJN1uKsubkVald2jn73QqUSrs2jfiZ9sW2j3D
 ebk7TnC9/dCgGGz5BGLEmEa3vKzJzE37uk+57QETK52SlEJ7SnFYfjj6hGgN2ytCUgYa
 QpU7ZRFBU30/aL3xfLrxhqyciH8GCvA7ZYjSQhAZTtazVOAmbMkaUOFm11QnGfhYUUGU
 dHhnfS0m2oIOQOPIdGKq+UF8Vl00Z4R+4g6jynhIT3nCyB2YAmvWWQDj+seEDf61Lc4d
 95xJhRVU6K9C2maYkCKXfR4M4z4ON1tKB78m4ZEg8/VgxmHr+9KNL+q41AiN8ewg9ljk
 uk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688745212; x=1691337212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCL53aP+hS7tciKjFD7blcuEy36DSLX5ukiouHjZxlI=;
 b=HSxAcGQC1vCXqwKM3l6/FKOAJ2aEVjW4deqQSA+bvY1huaUKnYtNREMrGhyzFCsAqE
 W50x+CSBJAU0mkv9tfm+eHs/jf7jRl48xMQ5EQ2rhALfC0tY8+e8eMW2y7cevrYHJQQw
 xNtSf36Rf8djs2hbslsamoN4wSlClSI8IxmmfRpCiLVZV/0CU9vq+APA7kKqDT++qJhc
 x3TSIghW03AFwD/hptYQ5JM5SuvvYiHI3XKxwluBXaomEzCCFo64Qwm2K49wPdc3+1yF
 ZDBKalZcuJPfPP6WX6ODvj+Q4u7bGQlO2HExfNMUKVIkXqTiUWZ6fZ08R6kFMTefsJCB
 aPFw==
X-Gm-Message-State: ABy/qLY4BHCAdcFgWK/9Ms2ayWefLwYYVZBH3rucoeIqtsjEHEdNi+NX
 zJ9UVhDXeOuLH+6cQt0/UKVZK8KBjTRi4EJWeXA=
X-Google-Smtp-Source: APBJJlEMVoC5fgJnH4032EslDGIrvj1PozPWtG1GU/u4PiOj3BGo1Mq7H5JFzTWtaNqWO+MPSYBtw7CN6so33VTDo0g=
X-Received: by 2002:a05:6808:2126:b0:3a3:e61a:c7d8 with SMTP id
 r38-20020a056808212600b003a3e61ac7d8mr4008620oiw.59.1688745212194; Fri, 07
 Jul 2023 08:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
 <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
In-Reply-To: <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Jul 2023 08:53:21 -0700
Message-ID: <CAF6AEGs2EGpEaA-sP1Y8cNS5uCyL9gXbe0U3H-jPWSQt1njokw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 7:29=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/07/2023 00:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > It is better to explicitly list it.  With the move to opaque chip-id's
> > for future devices, we should avoid trying to infer things like
> > generation from the numerical value.
>
> Would it be better to push this to DT? I mean, we already have a
> 'dma-cache-coherent' property for it.

I suppose that would also handle the case where some a6xy are coherent
but others aren't..  OTOH it isn't the case that dma operations are
coherent, just that they can be.  It depends on smmu pte bits.  Maybe
that bit of pedanticism doesn't matter since we mostly bypass the dma
api, but we still do need to (ab)use dma_map_sgtable/dma_unmap_sgtable
for cache ops

BR,
-R

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++------=
-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >   2 files changed, 17 insertions(+), 7 deletions(-)
> >
>
> --
> With best wishes
> Dmitry
>
