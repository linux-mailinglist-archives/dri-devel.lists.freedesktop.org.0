Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBE38744A
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECDC6EAD7;
	Tue, 18 May 2021 08:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A076EAD6;
 Tue, 18 May 2021 08:47:06 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id t7so6885043qtn.3;
 Tue, 18 May 2021 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RzcAG9+5Xn7T3JpLN7BeZQfX4fWVYsjz+RxiuTuqBSs=;
 b=PWwlQatHaS59miwE6mHih+pZYFdxBvcmXV1Evh5U64il9zusSoDO20zHLLb3g8/5Zu
 nM3PdyreRFcBuPt9sdPjCODGuC/xoDUkAcJ8fph9n6m/mw5uO+jLjyeo0grgB08KUREY
 MIPVhgz5e6PHxNop9mO52gm0pz7f8rJSlfGozbCvQJSzhbO6wRU8u2DZCqtNI98vOoWs
 jToKaNDkr7YsizhF7reR+QhhsFcIt+TSDIDRmUqVchLXq9F4GDM0KlPOuowzy+Hrnrbo
 eDvsbK/PdKXdBJ4U4gd+N3IU2APOZsCfSSd7f8tQcdxnex8N/QvdxhYMvQvkq7zoj4ks
 qXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RzcAG9+5Xn7T3JpLN7BeZQfX4fWVYsjz+RxiuTuqBSs=;
 b=t+A2ld4kocsK0otymEoOj2kMcAycrLjoZLign11Snq+a/Mbn/RQVOx9gWbb9vfTOae
 Eoimqwprzs/TBV/W+7qM6Ok6uP0gjQkmp7uPLuz0k+G7vw2cgmTjwLI1AtYAZ9t2pTlM
 Hd/g/6tuhBfRPucgFv7NjmnUqNECMViiFu2ra4H1xEShr1gB0qOrQCPF4dO+zv+92/4r
 rLv34iPWN1jOcgKWzo464hTPLQXl6DE/sbZd0IXCsDGVemzM7xLo8TRX4XuTig+PxDQ0
 1RHi4XDeDAqRPB1eGIlGSrGy9TZffdzNFRv2DMdur8wfyQlzeO1H84zzUlNn2t1EPMOz
 OauQ==
X-Gm-Message-State: AOAM532ny/DDtMom9XNFTt3F4Lj95zxHwadcQQxFEEdb6ZwahwJ91TtE
 hQrU1pT9BVviEElX5aBk9s9o+QPRCm5JZWX3bbQ=
X-Google-Smtp-Source: ABdhPJwcHz5ZNxqkRr95ykveaZxy1AnWFANjMyioeRnedduyLVhoBNGCtQZlZdArAW3dFR8TyQbDDltY/o/8/uADHUQ=
X-Received: by 2002:ac8:7353:: with SMTP id q19mr3623254qtp.341.1621327625463; 
 Tue, 18 May 2021 01:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 18 May 2021 09:46:39 +0100
Message-ID: <CAM0jSHOQ0jJEMC3VXRU02H8ttAWn9dC+2UHbrMAEmpcKCBe+BA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/15] drm/i915: Fix i915_sg_page_sizes to
 record dma segments rather than physical pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 09:27, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> All users of this function actually want the dma segment sizes, but that'=
s
> not what's calculated. Fix that and rename the function to
> i915_sg_dma_sizes to reflect what's calculated.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
