Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5902B3F6BC2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 00:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071D76E0DE;
	Tue, 24 Aug 2021 22:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6236E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 22:38:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1F79613B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629844680;
 bh=trvQSX2rJRWjrNLaSeH+EoF98vW2AeDpatiSlRzrcrM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BOQ3wE1NmwwPIhLseOygSis856eUvkrahEq4aiqKLmaO3y9KYD64UwBdzswDFfqCb
 Kp3yOn6+0ib0Fdes7D0p0skaQ/9i4sskpzE3VaHTjQw2HL6TAg122msA9RhoLPv++t
 0IJDPVMi7TlacxqI5dozaMeJAiFbTzB26TYaIQsl1KdT9X2siLWEd5HvO3pBYfTPZj
 YS7mbExQ05LT9xslKXZ78ctoqv+EbULUMqnb+M9Pr4IRqyB3t7te6vwHUVfiadFpOb
 elf66iqlxjfm9ey9vDLYq526GDegXBwIrfowaFaYZ4y1l/1RqrCh2cIH3HGeKElqDd
 u/k2xp4vbsavg==
Received: by mail-ed1-f46.google.com with SMTP id b7so34032770edu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 15:38:00 -0700 (PDT)
X-Gm-Message-State: AOAM530DO5OFkB/3o0DsZnBRceRYGaaoL5lMFpDQzD7D4b2mDJ8POLJr
 FXGysBNcyt6W+TRQu+S+Uc3U48QxShZQjLhf2A==
X-Google-Smtp-Source: ABdhPJzDhWPbuqXoUDyZU6JQ1us9W0MHZQTd6VrofksKXx5toZRzxtxZ1oWDbd1pY5TvIrGhGJk5UVv78myAkVYy5+c=
X-Received: by 2002:aa7:c487:: with SMTP id m7mr25907783edq.62.1629844679242; 
 Tue, 24 Aug 2021 15:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Aug 2021 17:37:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdhVMmroQLjaNVGoW3PJLS3qFRNAVRifGzR-jxNu1Stw@mail.gmail.com>
Message-ID: <CAL_JsqJdhVMmroQLjaNVGoW3PJLS3qFRNAVRifGzR-jxNu1Stw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/panfrost: Bug fixes for lock_region
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 24, 2021 at 12:30 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> Chris Morgan reported UBSAN errors in panfrost and tracked them down to
> the size computation in lock_region. This calculation is overcomplicated
> (cargo culted from kbase) and can be simplified with kernel helpers and
> some mathematical identities. The first patch in the series rewrites the
> calculation in a form avoiding undefined behaviour; Chris confirms it
> placates UBSAN.
>
> While researching this function, I noticed a pair of other potential
> bugs: Bifrost can lock more than 4GiB at a time, but must lock at least
> 32KiB at a time. The latter patches in the series handle these cases.
>
> In review of v1 of this series, Steven pointed out a fourth potential
> bug: rounding down the iova can truncate the lock region. v2 adds a new
> patch for this case.
>
> The size computation was unit-tested in userspace. Relevant code below,
> just missing some copypaste definitions for fls64/clamp/etc:
>
>         #define MIN_LOCK (1ULL << 12)
>         #define MAX_LOCK (1ULL << 48)
>
>         struct {
>                 uint64_t size;
>                 uint8_t encoded;
>         } tests[] = {
>                 /* Clamping */
>                 { 0, 11 },
>                 { 1, 11 },
>                 { 2, 11 },
>                 { 4095, 11 },
>                 /* Power of two */
>                 { 4096, 11 },
>                 /* Round up */
>                 { 4097, 12 },
>                 { 8192, 12 },
>                 { 16384, 13 },
>                 { 16385, 14 },
>                 /* Maximum */
>                 { ~0ULL, 47 },
>         };
>
>         static uint8_t region_width(uint64_t size)
>         {
>                 size = clamp(size, MIN_LOCK, MAX_LOCK);
>                 return fls64(size - 1) - 1;
>         }
>
>         int main(int argc, char **argv)
>         {
>                 for (unsigned i = 0; i < ARRAY_SIZE(tests); ++i) {
>                         uint64_t test = tests[i].size;
>                         uint8_t expected = tests[i].encoded;
>                         uint8_t actual = region_width(test);
>
>                         assert(expected == actual);
>                 }
>         }
>
> Changes in v2:
>
> * New patch for non-aligned lock addresses
> * Commit message improvements.
> * Add Steven's tags.
>
> Alyssa Rosenzweig (4):
>   drm/panfrost: Simplify lock_region calculation
>   drm/panfrost: Use u64 for size in lock_region
>   drm/panfrost: Clamp lock region to Bifrost minimum
>   drm/panfrost: Handle non-aligned lock addresses
>
>  drivers/gpu/drm/panfrost/panfrost_mmu.c  | 32 ++++++++++--------------
>  drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
>  2 files changed, 15 insertions(+), 19 deletions(-)

For the series,

Reviewed-by: Rob Herring <robh@kernel.org>
