Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF90377342
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 18:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8356E0BC;
	Sat,  8 May 2021 16:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39196E0BC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 16:47:02 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id w15so15471737ljo.10
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpBgi0AKlff8147OOEepLQzMBGFd2Jt9bavNArPpQME=;
 b=bypPdqFJPA5UGrC7VjMqIpDRd67/c4G9oxLzYlL8bqj5WHAW1G0t+zlQDg0DLILqA8
 K4pattodnxkJL9u3sPT5fbfMSAiz0Z1Bc3f1KBYDfpdNL36j/INuMqu9tRPTnyIKMJaK
 wTzy/qU2N01zcOpGy1Hz/2WG6ax9Mzy9on2bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpBgi0AKlff8147OOEepLQzMBGFd2Jt9bavNArPpQME=;
 b=UC1mep60p/8OJI7DuET3efky0N9PvsuTory/9rX2RRZRkvPf+wdmZyNEadMmzgUMmR
 mhny4n8/yYC2YBWnP3H3z56CTBUnZnD+4FZEJi8THcYW18t4vLAdStwrX48Rn37OYu5n
 94q/xRIgefOaT6XC7PJ85AgruimFL4GQo+Ry2CWh1/yMvu9RZB/eLJWp9Ggcd/gzyiPv
 vEcqQ/bM5/UIjLlMDH/7HJ8V2OGgDeMaxYkRokKBQxtxxRfxzTvBfmynD9BVcMAoi2C1
 IhK4qtTe1eWvgFLYgOqjX5ntZV+kodxe5DQPndBWV/HUR3LGXU0wdY7dzE2FbFyMI+uR
 AUYg==
X-Gm-Message-State: AOAM5326pvAXuSyhMFh6KF1Tswwu2vyRhLYa8Azgka1ll4BOAT8yn/o1
 mG7+Ep4Nw0vpcJGsah8GkeHrWbrqIshWexGBdbk=
X-Google-Smtp-Source: ABdhPJz9RMKQ7r62jQxRfFf2JRhhA07HtkNf1tQUoLGy2uBkn2L6LMrtK9Q7KCgq4cQTu6FgaYX9/Q==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr12621932ljc.412.1620492420611; 
 Sat, 08 May 2021 09:47:00 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id 6sm1655236lfz.189.2021.05.08.09.46.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 09:46:57 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id j10so17124431lfb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 09:46:57 -0700 (PDT)
X-Received: by 2002:a19:7504:: with SMTP id y4mr10031878lfe.41.1620492417345; 
 Sat, 08 May 2021 09:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
In-Reply-To: <YJVijmznt1xnsCxc@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 May 2021 09:46:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
Message-ID: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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

[ Daniel, please fix your broken email setup. You have this insane
"Reply-to" list that just duplicates all the participants. Very
broken, very annoying ]

On Fri, May 7, 2021 at 8:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> So personally I think the entire thing should just be thrown out, it's all
> levels of scary and we have zero-copy buffer sharing done properly with
> dma-buf since years in v4l.

So I've been looking at this more, and the more I look at it, the less
I like this series.

I think the proper fix is to just fix things.

For example, I'm looking at the v4l users of follow_pfn(), and I find
get_vaddr_frames(), which is just broken.

Fine, we know users are broken, but look at what appears to be the
main user of get_vaddr_frames(): vb2_dc_get_userptr().

What does that function do? Immediately after doing
get_vaddr_frames(), it tries to turn those pfn's into page pointers,
and then do sg_alloc_table_from_pages() on the end result.

Yes, yes, it also has that "ok, that failed, let's try to see if it's
some physically contiguous mapping" and do DMA directly to those
physical pages, but the point there is that that only happens when
they weren't normal pages to begin with.

So thew *fix* for at least that path is to

 (a) just use the regular pin_user_pages() for normal pages

 (b) perhaps keep the follow_pfn() case, but then limit it to that "no
page backing" and that physical pages case.

And honestly, the "struct frame_vector" thing already *has* support
for this, and the problem is simply that the v4l code has decided to
have the callers ask for pfn's rather than have the callers just ask
for a frame-vector that is either "pfn's with no paeg backing" _or_
"page list with proper page reference counting".

So this series of yours that just disables follow_pfn() actually seems
very wrong.

I think follow_pfn() is ok for the actual "this is not a 'struct page'
backed area", and disabling that case is wrong even going forward.

End result, I think the proper model is:

 - keep follow_pfn(), but limit it to the "not vm_normal_page()" case,
and return error for some real page mapping

 - make the get_vaddr_frames() first try "pin_user_pages()" (and
create a page array) and fall back to "follow_pfn()" if that fails (or
the other way around). Set the

IOW, get_vaddr_frames() would just do

        vec->got_ref = is_pages;
        vec->is_pfns = !is_pages;

and everything would just work out - the v4l code seems to already
have all the support for "it's a ofn array" vs "it's properly
refcounted pages".

So the only case we should disallow is the mixed case, that the v4l
code already seems to not be able to handle anyway (and honestly, it
looks like "got_ref/is_pfns" should be just one flag - they always
have to have the opposite values).

So I think this "unsafe_follow_pfn()" halfway step is actively wrong.
It doesn't move us forward. Quite the reverse. It just makes the
proper fix harder.

End result: not pulling it, unless somebody can explain to me in small
words why I'm wrong and have the mental capacity of a damaged rodent.

                Linus
