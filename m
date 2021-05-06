Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C428375D32
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 00:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41176E524;
	Thu,  6 May 2021 22:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67C6E524
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 22:31:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i9so3481056lfe.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
 b=BORPcZuE9+rrQQNFUoJnt6f4FpTDIRpdNZeTdxMdbIECzBdY5oiwCD0JpZedlSNZ+7
 bix+fDrgKkNKxnNlizSFTjxEzgqSzLtT6D02CJDWAGt9oBFGQ4VHrgxc6tYB6CmAeE2+
 8YQ9a8BVm4oo8k7TJnGL+6WsOCsGhg6VQJj04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
 b=I6D3yCWwHWI/kVW7e40Ts+FgWBl0QOQQ55oCEjo0JyzQp/fXmvVv1ZXAi+BI3U+6hp
 ofL8GIS2KJZcVwGZSZ9+0XqMQMEqWK2xGvkOtYb7QSZ+VIupm7GKWKTKeb2NJEcR5+P4
 5WV8DiqnqrHWryW3Tg8OsGpD+WSHHTBM8f6On4nDVfd9BioevS+IwESvpKeosJOE5UX+
 IuMIEq5XhMMtojPvMfZ47iHNNr5w5ooMKnIhTqXqC8dJzu3k4iHrCVmDWsxkJXr1lTOU
 c+SfrHwrJ1ZxRtWLGm6KL3zqFLD7kgFMZ1IElhdFhz/QKx/Wy05quEu3ENrnbOoIu4L8
 AX4Q==
X-Gm-Message-State: AOAM5303cgE6Ry2UMRWHZso6HzvdRh7XLSvDPaE+lg4yp8M0DdC6ZQHS
 GgKQUEcGHq0xdSlZaoSBFwG/r5vyA5J4yiV4
X-Google-Smtp-Source: ABdhPJwAcELf4D5Cvo4h21GMByDUT+NqLi3VwMQMj7UeGdKLuu9x8bMwkLdW/fhc3P0HOt/2B3K3Dw==
X-Received: by 2002:ac2:5632:: with SMTP id b18mr4298046lff.62.1620340262896; 
 Thu, 06 May 2021 15:31:02 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id t14sm1348748ljj.49.2021.05.06.15.31.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 15:31:02 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id c3so10030027lfs.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 15:31:02 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id
 j21mr4272160lfg.40.1620340261797; 
 Thu, 06 May 2021 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
In-Reply-To: <YJBHiRiCGzojk25U@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 May 2021 15:30:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ You had a really odd Reply-to on this one ]

On Mon, May 3, 2021 at 12:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Anyway here's a small pull for you to ponder, now that the big ones are
> all through.

Well, _now_ I'm all caught up. Knock wood. Anyway, time to look at it:

> Follow-up to my pull from last merge window: kvm and vfio lost their
> very unsafe use of follow_pfn, this appropriately marks up the very
> last user for some userptr-as-buffer use-cases in media. There was
> some resistance to outright removing it, maybe we can do this in a few
> releases.

Hmm. So this looks mostly ok to me, although I think the change to the
nommu case is pretty ridiculous.

On nommu, unsafe_follow_pfn() should just be a wrapper around
follow_pfn(). There's no races when you can't remap anything. No?

Do the two media cases even work on nommu?

Finally - did you intend fo this to be a real pull request? Because
the email read to me like "think about this and tell me what you
think" rather than "please pull"..

And I have now fulfilled that "think about and tell me" part ;)

              Linus
