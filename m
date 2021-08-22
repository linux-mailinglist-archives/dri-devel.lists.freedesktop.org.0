Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10E3F3E97
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 10:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3389CF9;
	Sun, 22 Aug 2021 08:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F15389CF9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 08:11:35 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id j2so3966866pll.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
 b=RQdXywP6yts45USpiw/5k2ZmYqVHMSbk9lus7YCqnHd8h/dka/Mtc/dvJ9OXe5Otvy
 Sqan4jaX0EaO6pSp84INK0mTwB48SVVmVb4c2YqbHrlCvd6ldJuCPTsbKqBjRTW6P8oo
 9Ux/xZOvOXbIQtNK3Akl22kbAtyj0C7ROjsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
 b=hihH6fFCL3e99Tqw7iqt1NnmnZf5OcQRXOqlLXuftcMYU/joutOygdv0AHUDFoCu2n
 gJRkTqebcM3Y32pLkDvzVkgr6d9/siDvyoq0DpvCCDeYsGLBX9zEwwg/a13FxFd6rYRK
 xvEeainuHDP6OgJkLyYCrQ45bMYpjxY3EwUQjvhhXpnq7xtDE0n8cKqGOgfKHw/4Eykp
 X5f6YTrfPfSyJi0H0LfABBsGNf+Yw/VxFMaYA6elHdUg91Gx1lDbcqAOjSnK7Kj40lHu
 bxKZtKaIQjJl2Fk3uL6dOyk8aF8gBD/0SVjgdkjQvtWQuC+xXCFgMum9enW98fVx42WG
 z9HQ==
X-Gm-Message-State: AOAM531RV8peuBvAiG4wz1is09Don/mlocln0cwcCCSqbvPZSAJDpg0Y
 LgTLjm3YLi1pj8ap+j4ouZaQxg==
X-Google-Smtp-Source: ABdhPJwd1ju8xuF6lspQHjJq0552r+HoTrwzTs5HEFbQVZzpc/fLKP3ldMoQP6w86dYwBror2p+DQQ==
X-Received: by 2002:a17:902:c643:b0:130:eab4:bd22 with SMTP id
 s3-20020a170902c64300b00130eab4bd22mr9764805pls.13.1629619894669; 
 Sun, 22 Aug 2021 01:11:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 186sm12621542pfg.11.2021.08.22.01.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 01:11:33 -0700 (PDT)
Date: Sun, 22 Aug 2021 01:11:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
Message-ID: <202108220107.3E26FE6C9C@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net>
 <202108190923.30FD4FC6E@keescook> <87pmu7t83j.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmu7t83j.fsf@codeaurora.org>
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

On Sat, Aug 21, 2021 at 01:17:36PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
> >> Kees Cook <keescook@chromium.org> writes:
> >> 
> >> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> > field bounds checking for memset(), avoid intentionally writing across
> >> > neighboring fields.
> >> >
> >> > Use memset_startat() so memset() doesn't get confused about writing
> >> > beyond the destination member that is intended to be the starting point
> >> > of zeroing through the end of the struct. Additionally split up a later
> >> > field-spanning memset() so that memset() can reason about the size.
> >> >
> >> > Cc: Kalle Valo <kvalo@codeaurora.org>
> >> > Cc: "David S. Miller" <davem@davemloft.net>
> >> > Cc: Jakub Kicinski <kuba@kernel.org>
> >> > Cc: ath11k@lists.infradead.org
> >> > Cc: linux-wireless@vger.kernel.org
> >> > Cc: netdev@vger.kernel.org
> >> > Signed-off-by: Kees Cook <keescook@chromium.org>
> >> 
> >> To avoid conflicts I prefer taking this via my ath tree.
> >
> > The memset helpers are introduced as part of this series, so that makes
> > things more difficult. Do you want me to create a branch with the
> > helpers that you can merge?
> 
> Is this patch really worth the extra complexity? Why can't I apply this
> ath11k patch after the helpers have landed Linus' tree? That would be
> very simple.

Not singularly, no. But I have a bit of a catch-22 in that I can't turn
on greater FORTIFY strictness without first fixing the false positives,
and I can't fix the false positives in "other" trees without those trees
first having the helpers that get introduced by the FORTIFY series. :)

Anyway, since we're close to the merge window anyway, the FORTIFY series
won't land in 1 release at this point regardless, so I'll just get
the helpers landed and we can do the individual pieces once the merge
window closes.

Wheee :)

-- 
Kees Cook
