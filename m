Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5B627D48
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F8010E094;
	Mon, 14 Nov 2022 12:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16E10E08B;
 Mon, 14 Nov 2022 12:03:47 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q127so11168364vsa.7;
 Mon, 14 Nov 2022 04:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gpdanuSwwO6X3X7T6r4R8z4NqpyKIrM5g/Eo+jbe8s4=;
 b=qTU0knnzgVorZuppvxBh4xwHQOp02pgeF6gbZoD+ipfckmrFcp2kWD++6KlgM2XHj7
 5w2On67PQ/+Uw3++eStaBdXi7f0vkT/XfZIO4zkPFWQCkiN0FFrYLK2obcMNcASXBzMX
 aUPVWrqC3hBIg2Wy308gRoVlICevrJszIhe3WvyB0BpSGJKxPkJV12Qk/m8B23tfv0GX
 0f3BYFBDg3hfaNhmBuUZCp1nL1Hi06cCVrk1aNkjCmgYUxBs1MLSqbo+n/lcWmDpaY+y
 Zse47tNU+zmAXkQBV78b8QvnXxOiVK89BsdpknG2pRJ3hyTiYHdGM7JG7Z+kcpcJ7K4h
 jvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gpdanuSwwO6X3X7T6r4R8z4NqpyKIrM5g/Eo+jbe8s4=;
 b=pqfklSW9XB/bgMFNADRCgBm1SEkylVRanNWYKG+Bc7nQ43i9M87K4/mwd7DkSs2aMO
 3rf5Gx8AZ9ukzadiyNwi6ar0SpEdCFAC2BuwjifME7wCXFaGe7N9IDnb4cqcbQm9oUU+
 +M+LC08Tr0KPBJ8TFyJhsvnrx+MfF+JEJDzC1mhOn91w9+3V4Wl33uuvKs3bqc4m8mIo
 mGo5oO6KkMpAtIgBYCjmvYaUtHzEOQlZxWypUQw9vCqeNh2Zcgmt2XajK0gSGm4eWGSg
 nnA246YCPWvnaL1Rl8lpqV6kEKK/s5egyQvio3pjOAG727vqqupyTI8xtfiutUmiXLFI
 xeyQ==
X-Gm-Message-State: ANoB5pmpbiRPGfGQXLcOvpL6Y9ntoMcKh0OfDEBEVNy+/2MzqSnL0OUM
 ffEZtxgeGL7OoA1WgBexqJ5s6GDnjGt/FbvZKUc=
X-Google-Smtp-Source: AA0mqf7pkKuFk4tE9fl+T9CticDFgkHAKochY0B2QzfVfymqfKAPEq9f8MR4s10cLi8hp5eVpX//sJkwwr8ixMAWUdw=
X-Received: by 2002:a67:c415:0:b0:3ab:89bb:2066 with SMTP id
 c21-20020a67c415000000b003ab89bb2066mr5717549vsk.21.1668427426182; Mon, 14
 Nov 2022 04:03:46 -0800 (PST)
MIME-Version: 1.0
References: <20221027073200.3885839-1-nunes.erico@gmail.com>
 <20221027080519.lfpduyt7jcwh3b4k@vireshk-i7>
 <CAK4VdL2V+Rnpb-rr=ov_81GUTDt=6i+6QRnKaYztZ7xfkvmMzw@mail.gmail.com>
In-Reply-To: <CAK4VdL2V+Rnpb-rr=ov_81GUTDt=6i+6QRnKaYztZ7xfkvmMzw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 14 Nov 2022 20:03:34 +0800
Message-ID: <CAKGbVbsLS7PdePan+fPkVhtexc36CViC7iREdcwR1+vnjLxrwg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/lima: Fix opp clkname setting in case of missing
 regulator
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-fixes.

On Mon, Oct 31, 2022 at 6:35 PM Erico Nunes <nunes.erico@gmail.com> wrote:
>
> On Thu, Oct 27, 2022 at 10:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Thanks.
>
> Could someone take a final look and apply this? I don't have drm-misc
> commit rights.
>
> Erico
