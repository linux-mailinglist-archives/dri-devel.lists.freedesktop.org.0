Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7D6D1759
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 08:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEE610E02B;
	Fri, 31 Mar 2023 06:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212110E02B;
 Fri, 31 Mar 2023 06:25:40 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y20so27616846lfj.2;
 Thu, 30 Mar 2023 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680243938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hgtInxHR98O+yLhpVW2/mvrEUc6/7NQut93JIoqVYmE=;
 b=Ur92w2KF9CB99Lo/wFgVxmv6E2bnDa9tbVh9f+8jTkkUYSL2bJIAlXLVF4upb7DbpQ
 Dkbs5WDpJIR+JB1bWUURd64whGvU1sMc68qg/Bnzst76wnQ03fAadppWA6WxWyZkxUCr
 AHMniH3uh2ShwL0Xyaz+s+tKFZvjIHdC3FMO17nueJ0bAGWSpszJVOdOFQDOTNbxkvCK
 e3VZGKErOyRhxi+y1c26uT5hnTjw1uHo8Nwcf6KZIJKKwnWPNUu1uEw9lDjgzMw/Un0O
 Tne9fDd6OxT/MAUEDSK1glsdVEaYqnMyEeV8tMDF8XrTLgQWGNyDfzTIEomFzLe9zRYb
 yi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680243938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgtInxHR98O+yLhpVW2/mvrEUc6/7NQut93JIoqVYmE=;
 b=R7Bcow6UQFD2TQ/LwcXgwLoQoRZ3Pjn7gzsiI/OFlAHprlX6oTH3q0h7XqzcMjZoez
 ttmmJ/3EU4ClqGPfbuZqJ/XXgYV2hYhBzgWs+rJSgLadXqP/9OK355MT8ew6SipJeDLH
 J2A0EWZBs66YuQDyDAbVZvnLpLxnFKF7ljNYUcDnh/0aEuiVga2/55qBNaOTOK8eSQTm
 Ihix4uE+b6CInCSwSvZ89JFHStyzu5Y6DYGbxNXkOQbw1pVG/Ba0smKWNTwgG7njm05x
 fhm5DvT/ULbdBCTLgwyTj1731NYJ7Y9ThSiJHtiwpmwIHpL0tyfReorRnVt0S3e8biAr
 J13g==
X-Gm-Message-State: AAQBX9ciFp4AXTHhxkNFxhjvG/Dwlu+ROBPdvPNBvbmlMRtGy+lPDulq
 K0jJSRC9HGkkVR30ZMwHYHg7+xpNc5LMihNH12il8qxixeM=
X-Google-Smtp-Source: AKy350Z1pHMdHOwDLajGCN+NxBSZWAFI2Ep7D9no6OYbptZeuDBw6+xKPvq14eDGaAfTewVNcAnpLZQRLm8Iip640Rs=
X-Received: by 2002:ac2:519c:0:b0:4d5:ca43:7047 with SMTP id
 u28-20020ac2519c000000b004d5ca437047mr7735343lfi.10.1680243938346; Thu, 30
 Mar 2023 23:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230320151423.1708436-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230320151423.1708436-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 31 Mar 2023 07:25:11 +0100
Message-ID: <CAM0jSHMFF7VeRFMqRwfbvVtRdc6-6RXipe3nvLijrCtTNdKweQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix context runtime accounting
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Mar 2023 at 15:14, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> When considering whether to mark one context as stopped and another as
> started we need to look at whether the previous and new _contexts_ are
> different and not just requests. Otherwise the software tracked context
> start time was incorrectly updated to the most recent lite-restore time-
> stamp, which was in some cases resulting in active time going backward,
> until the context switch (typically the hearbeat pulse) would synchronise
> with the hardware tracked context runtime. Easiest use case to observe
> this behaviour was with a full screen clients with close to 100% engine
> load.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: bb6287cb1886 ("drm/i915: Track context current active time")
> Cc: <stable@vger.kernel.org> # v5.19+

Seems reasonable to me, fwiw,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
