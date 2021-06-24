Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3C3B3613
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC61B6ECAA;
	Thu, 24 Jun 2021 18:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CC46EB33
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 16:59:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i24so9523735edx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nQjlbtdsxIRkg32l1I6ZcBJQW512Rk+v9V8fk7wcYo=;
 b=Y3tLqtxvefP1GXsjXvPLQkHhfFg1HOs581HGgYMTNiqbyLWyzOJ+ckllspAjOaNnFR
 ubg+BIXF1CAltuwVq04CmB3ZDMTnRKhp+ddr/nCwSvf9qf8Sw2lia703+N5fzjdrz1uM
 MQTIJyDcXcUUt89OxIJQrUkBUkvHkTsndbA10Fjx6rgqofgLq0MSTt2aJbKEkVUHFjdW
 8YclCuWEuCllXfIzbdei3M36/MubfT1HYvryuO0fKQmF9VZ+8Ppx8mYUtcW24XwTm5gM
 YsQxql40L0o0RN1FpdL0Qo/4N/DCDQsAZg9HhCVLvo/XNYKRa9sS0NiBhBzGmLQ1MLfG
 8/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nQjlbtdsxIRkg32l1I6ZcBJQW512Rk+v9V8fk7wcYo=;
 b=WGqV0cuRxRk2yy3CeCn1dylfKczu0P8QOGfkwKyRPe9vYUVwx13Isi9S+J38Aj5JfQ
 4ZREweN/hSM1FDcDLnobeDJVd43UR7QdkApEpi6OEgiILsWf7lXe44pnJSi5+/2FghiW
 4azU/3Nyma5ZA0Gof4zWt7a2dGicqOix8cDS3XMNStyR4oTS4xcuVakJ+1KEDRTD+jaq
 Hqr38u7Coz/9hGvKmzs5BLgmnnMZwRkK/FgrHwB/UHCXCSFT4MS2ezxypWvKvArniSTr
 gfRaIYk20wAJfNmaseC7KHit06sQ8kXycszw/2Sj5LihAs9ks3KXYJlKwCpXyFFyo7pL
 IYHA==
X-Gm-Message-State: AOAM533akpM+epwEkffk21rroIq5plMBv4odTObz2ucTi9DhX+rGFW8l
 yxKEPNS+IC5h7CCm4bwwvSIZ+cNF97da+uOtYUSl3VC1bCpbWg==
X-Google-Smtp-Source: ABdhPJxtd4CfFToBW2+5p89cCTXSe2pOrsQE8y5Tgbm7yrXno5H6dDKEoY3F94IRfYDg4zd2dX7s3hdCq+jId0AjqrI=
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr8347730edv.315.1624553959858; 
 Thu, 24 Jun 2021 09:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20210624140025.438303-7-daniel.vetter@ffwll.ch>
From: Emma Anholt <emma@anholt.net>
Date: Thu, 24 Jun 2021 09:59:08 -0700
Message-ID: <CADaigPXRP8RSAk6V=rH9Le9oBKpyQtxjjOSD=rRHQoGMobKVSA@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/v3d: Move drm_sched_job_init to v3d_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 7:00 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Prep work for using the scheduler dependency handling.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Emma Anholt <emma@anholt.net>

Back when I wrote this, I think there were rules that there had to be
no failure paths between a job_init and a push.  Has that changed?

I really don't have the context to evaluate this, I'm not sure what
new "scheduler dependency handling" is given that there was already
something that I considered to be dependency handling!
