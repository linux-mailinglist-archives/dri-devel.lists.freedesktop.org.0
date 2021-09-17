Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1C4104B9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EA6E0E7;
	Sat, 18 Sep 2021 07:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8F26EE98
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 19:47:17 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id z6so6869804iof.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8Bx21q9AegTNE96Id2UsXZWLEcvlx6srL/tdQ2snFc=;
 b=kGgzhyObvn1lW/gJ+RXhzVfHISy3GATxp8JdmNf63BrlJVlMbyqBEQDh7RDkv4cAXH
 X9OXee033T64nAchCmg1+6jzJCr1SRcQP2F9MGZqP7Eqin1x63jvVJosLTCIkz5RcvHi
 Y6mPRaoArbvLDYeOY6E9zNYQRr+n1lH+4eHa50Qyy5C6a7Br4HaiTU0H+V+4+vfZynZ+
 OqZQE0fVK8IAUSsy1+E/Zk+iF0xNI8dgSxhWgoAv6KnlEy25FBu/Xg4k7UlKfyhZqMUE
 1gPlHda5QsO3nqdwPyy4/oW7q/l8jcUA/zD1DCvCwnebnaFqXjWL/ETyYrZdp2jKYPz9
 bG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8Bx21q9AegTNE96Id2UsXZWLEcvlx6srL/tdQ2snFc=;
 b=bv7Px2S8NDn6i15wG3FcgSm4XljTvllHY/nGJRCThhHsuYL3xWaHMaPMj1n4PmGipz
 mXa/Zapy3xicd3uHdZWEFk4nA0pAcj6MV6eZNh+bIL6Npq1Mh7CeC59fmIWMmd4QsDDn
 ILUkmP4ZNb9ERpnfSiVIXJTsVR23OHYafLco9E9I5Pr+BQPI1DRvmVxzezhGnxfM2emn
 +4TIPIsDSmbRYLy/+VGI7j18OZdvpT6HHthpNwKSUEc7EdkcLfWRsJOAIOKlx/+Zn7Iv
 +Fj2Z1SfICtMp6IAySTPLRh7jQ4Uf01baIkgViR7s7AQspomrAES38rkuT3368O+hU2t
 bBCQ==
X-Gm-Message-State: AOAM530IFCC85313XMoVIPJhWHn8vBrgd4HBpVBwEGZKivoZ9mYdaGgE
 /2vaDDMeEKtfSDofdLonna7SzxR4y6gkzl9tTnjMAQ==
X-Google-Smtp-Source: ABdhPJwlqiUPgqafzcRoI/Vt7FtGYlqc/TTt/M861o6pVpZ3f/jQrvfR3OcST2CA2oIONVj+WipQ1zlF9ce7+eUeaBg=
X-Received: by 2002:a6b:5913:: with SMTP id n19mr548941iob.91.1631908036562;
 Fri, 17 Sep 2021 12:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201217140933.1133969-1-robert.foss@linaro.org>
In-Reply-To: <20201217140933.1133969-1-robert.foss@linaro.org>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 17 Sep 2021 12:47:05 -0700
Message-ID: <CAMn1gO4y6yC0fcLYdGfYR4KqPq9Ff0n4DhEczWQh9J6ceobs5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: lt9611: Fix handling of 4k panels
To: Robert Foss <robert.foss@linaro.org>
Cc: a.hajda@samsung.com, Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, 
 airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Stultz <john.stultz@linaro.org>, 
 Anibal Limon <anibal.limon@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

On Thu, Dec 17, 2020 at 6:09 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> 4k requires two dsi pipes, so don't report MODE_OK when only a
> single pipe is configured. But rather report MODE_PANEL to
> signal that requirements of the panel are not being met.
>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Tested-by: Anibal Limon <anibal.limon@linaro.org>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Tested-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This landed in commit d1a97648ae028a44536927c87837c45ada7141c9. Since
this is a bug fix I'd like to request it to be applied to the 5.10
stable kernel.

Peter
