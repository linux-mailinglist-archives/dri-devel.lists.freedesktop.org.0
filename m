Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F88C6ED9
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 00:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A0810E0BE;
	Wed, 15 May 2024 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L7hYbHsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588E610E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 22:56:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51ffff16400so155455e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715813807; x=1716418607;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rflWttzbWDSOQUcPljiI/Fl7JoN/xYtdVg8WGCfv+UE=;
 b=L7hYbHsr6JypkDcFVl+mZiy4J8XNSpridXuT09w1ePzuTFRvU/U4LM/K2JHeOPvMgD
 mtDbINQ3cl//HNbswnPzRL5J5uNxU1Ky9Q+kpkyYusURXAhf0KnwpvAh2/ZmNcXRE0qe
 8NXTSU/gi4W9I88KT7KVZ4fX5OTRqZGWWPp+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715813807; x=1716418607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rflWttzbWDSOQUcPljiI/Fl7JoN/xYtdVg8WGCfv+UE=;
 b=DgqdPQ28N9DGe/Nw+2n3wAvz6PIgR5ejxuyxtCY6Ko1A104ajog1Jz+6YGrFKm6anV
 T884rQTDetKR5GpjwPiwXPhXyWMQag/89qrYI61SzzLErn79MHOEPtA0xbtWxWX2I4tn
 xhtJRMRJojOWf6sml63r6Pu0AQH4mWGsep6hsLPkrIT91Xu0J+AHRvas8PQZ+zd/YcuP
 Ncw8JKMZuXQCg6yQQV+UuSsSqMSm5DR87GHy49xGZfWVHH4AsMMSoCCdcULq9kDq//aP
 qUUNqxnwh5NA3NJdW0zq7v7IJUoI+tp0xCZLB8ccvK7DSKUKach34d9ogtOayGPRUONq
 RbaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC/GW7W0tRU/WEl+hGGwvhNtvhdiADOQd7iQYjA1vNMC+kXyv6XZ6LytdjguRAYjjc40EzLy0eNqpdD0d6hmrgzONmATUmYnO6S/KpsADF
X-Gm-Message-State: AOJu0Yw99BzoS4PwOcbXEdbQEN+z/MBGAtgnsNKfYM0vUm4R45/gkqfa
 nXVD9Bjh7qkKC5DtdekLQABoqQ1i29TBqQonSbdaQWJ/hDm5c0nziGX0xPFDgVei2xGRAOs5IxM
 ch16Ijw==
X-Google-Smtp-Source: AGHT+IF1jRDcQ3zbF0iEVZzC1YZcHc+VGeXs3YVzTjzeGaT5sPeuf2nqkhI738QuS6qVoGnPB1zKVg==
X-Received: by 2002:a05:6512:1281:b0:522:3356:3b8 with SMTP id
 2adb3069b0e04-5223356040bmr15203253e87.27.1715813806570; 
 Wed, 15 May 2024 15:56:46 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba82asm2680349e87.115.2024.05.15.15.56.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 15:56:46 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so193008e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 15:56:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPM899fcx11In2poxkuKjCeLYGJ389/QRkqKJPaTajeBACiOyxFF4vpFOaeC9RNgZNZ8lsLzvfHvQCrn/C1An9A2hTOzQ/ae6V30X2vPeO
X-Received: by 2002:ac2:4158:0:b0:51c:fd0a:7e37 with SMTP id
 2adb3069b0e04-5220fd7c82dmr10712859e87.20.1715813805252; Wed, 15 May 2024
 15:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
In-Reply-To: <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 15:56:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
Message-ID: <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
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

On Wed, 15 May 2024 at 15:45, Dave Airlie <airlied@gmail.com> wrote:
>
>           The drm subsystem enables more warnings than the kernel default, so
>           this config option is disabled by default.

Irrelevant.

If the *main* CONFIG_WERROR is on, then it does NOT MATTER if somebody
sets CONFIG_DRM_WERROR or not. It's a no-op. It's pointless.

And that means that it's also entirely pointless to ask. It's only annoying.

> depends on DRM && EXPERT
>
> so we aren't throwing it at random users.

Yes you are.

Because - rightly or wrongly - distros enable EXPERT by default. At
least Fedora does. So any user that starts from a distro config will
have EXPERT enabled.

> should we rename it CONFIG_DRM_WERROR_MORE or something?

Renaming does nothing. If it's pointless, it's pointless even if it's renamed.

It needs to have a

   depends on !WERROR

because if WERROR is already true, then it's stupid and wrong to ask AGAIN.

To summarize: if the main WERROR is enabled, then the DRM tree is
*ALREADY* built with WERROR. Asking for DRM_WERROR is wrong.

I keep harping on bad config variables because our kernel config thing
is already much too messy and is by far the most difficult part of
building your own kernel.

Everything else is literally just "make" followed by "make
modules_install" and "make install". Very straightforward.

But doing a kernel config? Nasty. And made nastier by bad and
nonsensical questions.

            Linus
