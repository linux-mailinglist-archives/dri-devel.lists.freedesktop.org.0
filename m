Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F63965541
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 04:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2194110E7BE;
	Fri, 30 Aug 2024 02:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AxtGG3qb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0251110E7BE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:32:33 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a8692bbec79so156909366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1724985152; x=1725589952;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RmoB069VF6EUIaCnpaVhJcQLLGtyhrjfKVxZgKUoxGE=;
 b=AxtGG3qbMATpnT8Ozo+p9iNWFWtuZCF8mFEJQ4CyXXW1ITSWYCWWd+OkmKVKrZUpXw
 +DH8/jt60plJHfxdnlStxJIYrfZDGRsFCNHD9dfx9+ZEl+LqIZoz6FBTHwy719IWSyRB
 +gf5KpdqLUzD1s7jbDZ0busBZj9NPr/nCdjvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724985152; x=1725589952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RmoB069VF6EUIaCnpaVhJcQLLGtyhrjfKVxZgKUoxGE=;
 b=QBKspqPFyaW6yzqBLhEaiN/kYxqWhz+szDCVr9BZo3FgZP/kCRDAH+TuOOF5gMnvSl
 8yqpgoISpDE72Fyz8WE2187af/yoW3s75Boiyy615vJB0CeXXfEZSl6bthasaDENtJ7E
 TxW8qRFUtbFk5MfTgggyBFTftjt8uvO21HBfGjo9KoktfTnTZA1Uk49dqCyLcU84Ekge
 BGf112VbCyC2bZRS4Oa4k7pL7u8K00BvWFzAk7lu8VQF1ISSUF828u4AgCDnleernm4y
 GaLisib3yRc6Pjhy7HA/v+R324K1gkTrQAzK45SbETLG+QEAtXhfWGKXghgASpoxd70v
 exCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOhoREDXldv09RZFO5mWL5tosrAMFxPBP2R+Y/lt6wIMsX67jYLhPabiDVdk7aFxRxezEJqxzfYrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4WYpZZg5rvhablbNoAZP8jQcZzldnAVAMhFcCNLX85/w3lPS4
 SG2rbMzQnYxmZUAt/RhB+a+g4P67Yb8GL7RMYyXjV/c8pDVLGVEVpt1G5u4KRnl8439WQAc0kxp
 CSWf9fQ==
X-Google-Smtp-Source: AGHT+IEIEvJq1AOegxbdNIu/DY+czhewTI10v/LnRea0l8TeMGEUoZNtQkffIvd6kAKmRvZb6JFAEw==
X-Received: by 2002:a17:907:e617:b0:a77:e0ed:8c4 with SMTP id
 a640c23a62f3a-a89a34e7ce6mr46958566b.7.1724985151645; 
 Thu, 29 Aug 2024 19:32:31 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f243sm152357866b.69.2024.08.29.19.32.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 19:32:31 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5becd359800so1453697a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUaTQsVSPTOC3nEUM4AXg28s2i+c9VMVDkebb7YjJzmDZ6nLcLGlYnLUinnsEkzoI3W6gF7PdvGqdA=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1e8c:b0:5c0:c223:48a1 with SMTP id
 4fb4d7f45d1cf-5c21ed58cecmr3849130a12.21.1724985150681; Thu, 29 Aug 2024
 19:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
In-Reply-To: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Aug 2024 14:32:13 +1200
X-Gmail-Original-Message-ID: <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
Message-ID: <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.11-rc6
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Fri, 30 Aug 2024 at 14:08, Dave Airlie <airlied@gmail.com> wrote:
>
> The TTM revert is due to some stuttering graphical apps probably due
> to longer stalls while prefaulting.

Yeah, trying to pre-fault a PMD worth of pages in one go is just crazy talk.

Now, if it was PMD-aligned and you faulted in a single PMD, that would
be different. But just doing prn_insert_page() in a loop is insane.

The code doesn't even stop when it hits a page that already existed,
and it keeps locking and unlocking the last-level page table over and
over again.

Honestly, that code is questionable even for the *small* value, much
less the "a PMD size" case.

Now, if you have an array of 'struct page *", you can use
vm_insert_pages(), and that's reasonably efficient.

And if you have a *contiguous* are of pfns, you can use remap_pfn_range().

But that "insert one pfn at a time" that the drm layer does is
complete garbage. You're not speeding anything up, you're just digging
deeper.

                  Linus
