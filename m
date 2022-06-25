Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E9755A547
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D3E10F5AA;
	Sat, 25 Jun 2022 00:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B1710F3DB
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:12:48 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id 59so6901127qvb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mB243O2vDZbtklHZe05Xzr0fp3GBiFubevpzgOWKzOU=;
 b=GtEibzDijC4BeVChXPiU/2H4lz4ffgbfvTFu6q18HRJhvIHF5zpBoNQ8NPZr0o1A/M
 oiq4fK/AaGi1CWJ4UXU+ukNcj8/3v6IUcOBV1fGgIJamg10q86KmF+s3fth+XvGVFXKG
 tKxgecGUfAPi/gQXQ8sClI9DJW5S1TADlDQlbwe4PQnJX5PQewGdRFpQsLSwfMXRYhGq
 urM7p8gp+eslHqSnl1R9/pEFTdYHfPOgKsT4Ck5pYmdSFpZb9fYBU6U1ZyNde8cgiV9f
 EFePB6CwBRIjvAPsYqU6jLO02i0mRY80kzzHv509055iUvjkprkTpdnOI3hkfO54lLel
 Dkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mB243O2vDZbtklHZe05Xzr0fp3GBiFubevpzgOWKzOU=;
 b=s6297zdVtnb2LITmdCaxhUO9nZaEJp6IEB7tUsd3kVl8QFDbzamuDcWly181mCeTXT
 je4RkHBsZMCPeBw2NRnWtzc681tddTHMw+I2W3eArQLDCRZ4OreiZxBFRS9tyScYhgbh
 4mH1E6YkYbXzVbSKx1NEYJwQOuQr88cbmbWDh9MK85k3SkRyW6KiQ0qp8BZTyW+89BN0
 Ejj2WSbxoosCTVsFqQII4GEWz6K6On2d+49fd8IXxWcrxzy6y4wUw5MRqe16B/2VkeGw
 rwYYAwqNwY+NsJdycKcG0d3tbkCkyIz87qDqGDMa5FC83Ww0QXFDjE7LT71r57DHGNPD
 DyxA==
X-Gm-Message-State: AJIora9Bn63zOv0ZHGVLInCX5HjlPhZ6DDvvaSIZ5CVJ5/Tdxo+eCTLT
 aoeo+YhMqhHVRZklzkm95PvG0+z9h6fZWdlz542TSw==
X-Google-Smtp-Source: AGRyM1ulqLC3UhHGmkjCmq1ZXZo6/6GUqiNwLS35/4vL9h/wWZBzRC4/Bqvi6XyEgTCXEO/7EbD2SvRu66ZMiSV7vAA=
X-Received: by 2002:a05:6214:2a83:b0:470:a898:e467 with SMTP id
 jr3-20020a0562142a8300b00470a898e467mr1174976qvb.122.1656115967606; Fri, 24
 Jun 2022 17:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220624184528.4036837-1-robdclark@gmail.com>
In-Reply-To: <20220624184528.4036837-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:12:36 +0300
Message-ID: <CAA8EJpot4qN68Edq9SZdE76DJof+2i05SUD1yJ1uBHu49jBM_w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Fix error return on fence id alloc fail
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022 at 21:45, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was a typo, we didn't actually want to return zero.
>
> Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
