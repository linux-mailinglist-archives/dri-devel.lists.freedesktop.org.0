Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC531748E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 00:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B926ED74;
	Wed, 10 Feb 2021 23:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF606ED74
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 23:41:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l12so5090138edt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vM//4U9/+YKnq/E5n2pFW1Akp/52mAADNYiWm65AElA=;
 b=iLbknNn8g5cXQ9Y5WEZB/SuN/D7M44YoydiXZwO90Ea603ZhkZk+X2DhxR2l/7Ou7W
 O9lbiJXseLd5lHzZXZXHBHf3rC5nAkVCv1/mhuxcvVL6B9jzWe6McyoFHB7NwMfZ6jLj
 FQWDrTow6HC7XADzkQz+NStxb4/OrSKj+PUp3/S3HR+wpZoP2TFcqoA1fcK1/iykCQOf
 IlV8wPg5jqpMj3TwEcTnxIoQZ9cF2eLGIo0/0zTnuZb/HKNUzwQlBxqw3m6ZB4w9QjQs
 bdV7YGO0n0NsfBuyAvU/hJvlACy90vZ5b+xRW3YcJapCxclEQaRVwLbB1BgqIa2NT9Qr
 kAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vM//4U9/+YKnq/E5n2pFW1Akp/52mAADNYiWm65AElA=;
 b=iZc+OBiSytmv3CcG7YH1RSxbyEodV7UlOIx2ZZgK63qCDH45Yfs/xEiLQ07t4N21hQ
 qYuDLNf9O9SJgk+AMTW7WsjWCaSCLS1kiambfxgXLI/j7bzclRQVTDoGYa2o06iaLu/x
 hAHRgt80s42bp29in4Gqlnhm6dQRL1NnFmiEaAQlXh2hSysF+INEB4bOcCRqnmkVOdiO
 HQKVL58MUzI3n8PflOBNZWnoGge7mqug/bOZ0r2JFGOpuBwathUYaEDwfZ9/zoOlBiJe
 B7OHvgq42zdajdrdOGxBN9qddkvXbXkn5NYALxwEtdJlJag2MeCexBRxypbl9saw5YgV
 A2gw==
X-Gm-Message-State: AOAM533cju3meQVzkxYt7c8Eyhf+rwaOm/kHeEJfbLInczovp1SKh3gk
 icTCUiPJMmcoQrt1sd1h/26lgT+ayWa31ge3894zEg==
X-Google-Smtp-Source: ABdhPJyzOOsjzeNegxjWLA64CRyamr52BQ7tdtH8yRwCD3yHfBmFpCDjXQjjyBdheo2dwUS59Eb4MOAlE+OG71etSGo=
X-Received: by 2002:a50:fe11:: with SMTP id f17mr5530428edt.88.1613000461311; 
 Wed, 10 Feb 2021 15:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20210208185557.15703-1-jonathan@marek.ca>
 <20210210012450.GA26503@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210210012450.GA26503@jcrouse1-lnx.qualcomm.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 10 Feb 2021 15:40:50 -0800
Message-ID: <CADaigPWA8Vw6YxAFztorYN_zQsX=y5U9X_N_TBRcB8Hd3U61Tg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix a6xx_gmu_clear_oob
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 9, 2021 at 5:24 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Feb 08, 2021 at 01:55:54PM -0500, Jonathan Marek wrote:
> > The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
> > bitshift operation.
> >
> > Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>
> Thanks.  I feel silly that I missed that.
>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

Yeah, oops.

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
