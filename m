Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C6445CEE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 01:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5973B25;
	Fri,  5 Nov 2021 00:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4973B25
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 00:11:15 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y73so8935272iof.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
 b=nFhNJs/6zLfX/HDdX03yOBZsFn//RbfnTbfvj+8xfIcqZA01a8sEJdr7u7Hg2yFwIx
 UQ8Wr+wzrwqo1ljEOyT7Z0fOU4gCqarwPqUzj1f018BbkV8CPIPaNqLH+1IHHrzBv5SB
 u/PfIRUb4ABRnF3OXo6a4xpOLivk43cyxfPcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
 b=Io7GLeVWPB+GbDmMXmCDQr3eY3WO+AI+fGTMnWpUryqg4+xyQHVRvYbjsuLIEBNqP/
 dmRA7fq4Lt2kZySPDOfQTio0kSdvrHJ4QgL2ZVmxqgu2A3g4HxNQqLRTYUAAn7E+dG1V
 aOaXvbEfTOxq2JoyXb+3xbw+5LvnhvoM28tjyCa3UiQBp5TsVn8oqAFXY3n7VkCF/rP2
 iF6ZqIKW6kjzmqSbUNLU7fg3+cnZQguwgFsxJ4i8GZ9beoD701nIiA6WL5JUmLQ7MU1n
 oLUV47BOAANPHx1JBhqs2VCb7nkeKgOC/47B8eTYC//a51KR51n/35fKcF5LxrrguVQ7
 NZiw==
X-Gm-Message-State: AOAM530HABRXJTcw5QKh615r7RbGZWIFUGK+uANgct4tTmBOx3xDjlzy
 EObQJm1gxpatK4n2Wyn5Ibbq0bxIr+EYiQ==
X-Google-Smtp-Source: ABdhPJxsLjVfREeLwDT0m26cnz55+YPw5bz7FUw8RVkasJXSlR0ziqAbuOm0yjdFTx+NfJYXdLsofA==
X-Received: by 2002:a6b:c991:: with SMTP id z139mr4483610iof.41.1636071074786; 
 Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id c16sm3018267ilk.3.2021.11.04.17.11.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id h23so7917913ila.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a85:: with SMTP id
 k5mr18841136ilv.27.1636071073597; 
 Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com>
In-Reply-To: <20211104222840.781314-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Nov 2021 17:11:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 4, 2021 at 3:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
