Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC26477A17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B3E10EBF2;
	Thu, 16 Dec 2021 17:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76DF10EC41
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:12:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AD7F61EAF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6AFC36AE0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639674776;
 bh=Gam0vMqxhg3fMjDM2J47EzqX0PN7wLTKmYA/31ba58w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HP0cXDDZy1D3XSP3jdFORP8HgsxHZhpZblqZY0DfkkbyaQqjrCnvHnS+0AcKR3mcs
 pivQ1/BMk/vbP8BgCFAKz0C0arKhx6oiHQmfMtwvhxUAHZwVuyX2vCNakbPorbaIhx
 geA4DRj2BonR1m5p3kBwS87kaPVh9eHKKeKnMKSLJSz8yKmVGHt1Nwoj2wi/9R06di
 PkSA+1SCvnRUoOIfAxrh4C9UrdW32ZfRNy/oQVfycjby/xBgkzuGzO9xZmCzQMEplx
 s93WlOZhToTnkTd48T5nz0AFu7TzmGesJEm8uNUVUKkVA3+RhUMZIERZHexW3ciPKK
 PXRE/vFyUzQWA==
Received: by mail-ed1-f50.google.com with SMTP id y22so18651289edq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:12:56 -0800 (PST)
X-Gm-Message-State: AOAM530M3Py8To5u1Oly78yEw4pDjJRQj6GYtX5vUQyZ5aKNKv72Yat8
 4/b1jS7LXGEHDCrKt9jK1e8rImaerW7eOlvOYw==
X-Google-Smtp-Source: ABdhPJy4K3dx/sGYsqhgV8wmgEjIFmcECrjgBYyz626Gzm6BptoFhZ4nX7fCOtS+OYoICFzMNreYe6y8UhoeNM6ETho=
X-Received: by 2002:a17:907:94c2:: with SMTP id
 dn2mr16290161ejc.325.1639674774860; 
 Thu, 16 Dec 2021 09:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20211216161603.983711-1-steven.price@arm.com>
In-Reply-To: <20211216161603.983711-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Dec 2021 11:12:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
Message-ID: <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
To: Steven Price <steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 10:16 AM Steven Price <steven.price@arm.com> wrote:
>
> panfrost_copy_in_sync() takes the number of fences from user space
> (in_sync_count) and used to kvmalloc() an array to hold that number of
> fences before processing them. This provides an easy method for user
> space to trigger the OOM killer (by temporarily allocating large amounts
> of kernel memory) or hit the WARN_ONCE() added by 7661809d493b ("mm:
> don't allow oversized kvmalloc() calls").
>
> Since we don't expect there to be a large number of fences we can
> instead iterate over the fences one-by-one and avoid the temporary
> allocation altogether. This also makes the code simpler.

Doesn't the BO lookup suffer from the same issue?

Rob
