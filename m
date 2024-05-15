Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4284B8C6D3B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13810E7B2;
	Wed, 15 May 2024 20:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h9Q49s4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5FD10E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:29:31 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so959076a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715804970; x=1716409770;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HySmuUBRFJcyBMiUjWtXa9eokDnDTjSCJ7VGY9yEOOE=;
 b=h9Q49s4zKJIJVQScZiW6lwgG4fDwl/kihHDE40GFrq1/RPGHOP9snKqvlJHw3eNWJK
 +jUhXy4TWytZdxXeXRX0thtV41EOyQj//GgiVXOKkRbcg3UrRXTEPJmvSzHYde7U8tit
 tyX8XCCvJdzVQqjPFUEZKptFWeJkYRaRFD7Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715804970; x=1716409770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HySmuUBRFJcyBMiUjWtXa9eokDnDTjSCJ7VGY9yEOOE=;
 b=lsdFHp2oBLDG7xRdG209+dXZWtHE25BTcJEpZWQWrEmuU7f0b7Jm7bFg4OGDIG/tRv
 e71XEMygocaCuO0knxR4+vqsaxLa6eWVSj1xk1SJA6V8+B9ZlXr93D3jk5jmh1rbstfz
 orXd+4Ppg0bCDfxSwK8TPBDtgdGvtTso1ZldX3SIvscYjlBpQp2+7ieozqj85N7hII3j
 W1utGTCUPLoE5ncHeUMHJKPpLx59GxpNF7O89682CkcIGZT4aSHr6srrvBJywWadjioy
 hnWJ/rMn7bgufWVlleEo5mg6pbNCNH9yYbTjTWdlkxCosfUzujvg3nWof9iQe0COmM/Q
 PJcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb2S1swogn+ZhY28a6+i/pjiPMtY0Nmd+MMNvvcrUYm2a00bys3BxhRWXqNJtccnl/KNa58j/jW81wi3FiSjAZOzp+5Kr1WnnwXt0ZoKNh
X-Gm-Message-State: AOJu0YyxZYMMDOs7BuaZpAasDR7ojJtLxSK3V33Ox8xc7+FxnVPq8lC5
 mMzClA0Q+ilUGvE/+xC202iPVAiuZ9wM1zwSAZEC0M0MWkN+5b6zjVgxROzCcbWOhr67fF2nwR0
 7tJnQtQ==
X-Google-Smtp-Source: AGHT+IHh85If/NZHyssdx666aqRTq3GW3PELGN55MiH1+LXDfOOQ6dQVj9Mpl48kmJNOYpLVkz5QlA==
X-Received: by 2002:aa7:c35a:0:b0:574:b106:57db with SMTP id
 4fb4d7f45d1cf-574b1065a14mr11770880a12.21.1715804969850; 
 Wed, 15 May 2024 13:29:29 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c2c7de4sm9414457a12.63.2024.05.15.13.29.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 13:29:29 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34eb52bfca3so6257772f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0sZgdYbvC1t2b/H2/Nobe56yxXfuKND28SjBu4k0qCMUCldal/KdwbmDAa+NcbyxbU9DH13kblIuHmKABKfmNDPm5w6f3A1x6IAD27O8u
X-Received: by 2002:a5d:5549:0:b0:351:c68e:48c5 with SMTP id
 ffacd0b85a97d-351c68e4aabmr5614302f8f.29.1715804968926; Wed, 15 May 2024
 13:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 13:29:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
Message-ID: <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>
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

On Wed, 15 May 2024 at 13:24, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I have to revert both
>
>   a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>   e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
>
> to make things build cleanly. Next step: see if it boots and fixes the
> problem for me.

Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
this, and everything looks fine.

Let's see if the machine ends up being stable now. It took several
hours for the "scary messages" state to turn into the "hung machine"
state, so they *could* have been independent issues, but it seems a
bit unlikely.

               Linus
