Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADA15B1E6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 21:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FBB6E109;
	Wed, 12 Feb 2020 20:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A06E109
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:32:57 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91BE82173E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581539577;
 bh=V9VyxKzfYIKf9VtsnordIWaam8t73E49S8DNnAueIq0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vT1e2f7TUdqvh664uuU8BB+7xkT6nw9k5xvJ8hLssM4n2EmNS3w2G46Ual5aE2SvB
 dJbOe8X58FwRb2Cvdvc5m08vtxQAsjUhzDrnM5NnPmCNv5/tsIT/ETOWJ5QNdNEth3
 K1G72GJdYfy72D3u8euOZJPNmkvudVBiwDdo41/Q=
Received: by mail-qt1-f170.google.com with SMTP id h12so2690638qtu.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 12:32:57 -0800 (PST)
X-Gm-Message-State: APjAAAWDeor7DdTvd3sVDHFG/+ZJES8zdqljWXxOIoE8kuwfyWElzJIr
 ewJlUjkJyUcbyxsQ3yR2zXcLkxnCHzpwIO6Vlg==
X-Google-Smtp-Source: APXvYqz0go2FPjNTnDnmXjjdtP1WbfxbUtV3PkQip537yESGdY4MxxAo1/ie4PEdRuXCxmYV4nfdfyuy9cz4Qvvh7Z0=
X-Received: by 2002:ac8:59:: with SMTP id i25mr21097269qtg.110.1581539576653; 
 Wed, 12 Feb 2020 12:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20200206141327.446127-1-boris.brezillon@collabora.com>
In-Reply-To: <20200206141327.446127-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Feb 2020 14:32:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLcZ=R0kYX+Bqw=NqoqsL6En21t_gPMCHEOBkK-xN7vg@mail.gmail.com>
Message-ID: <CAL_JsqKLcZ=R0kYX+Bqw=NqoqsL6En21t_gPMCHEOBkK-xN7vg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: perfcnt: Reserve/use the AS attached to the
 perfcnt MMU context
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: Antonio Caggiano <antonio.caggiano@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Icecream95 <ixn@keemail.me>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 stable <stable@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 8:13 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> We need to use the AS attached to the opened FD when dumping counters.
>
> Reported-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Fixes: 7282f7645d06 ("drm/panfrost: Implement per FD address spaces")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     |  7 ++++++-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 11 ++++-------
>  2 files changed, 10 insertions(+), 8 deletions(-)

Applied to drm-misc-fixes.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
