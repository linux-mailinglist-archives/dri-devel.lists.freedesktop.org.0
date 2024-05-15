Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F128C6D2C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B386C10E0E7;
	Wed, 15 May 2024 20:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RmIUoWf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269E10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:25:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59b097b202so182498066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715804704; x=1716409504;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgHQeFNA/cjSL1J53O73FIjj3ip3FyKYiQHTHBqHu9I=;
 b=RmIUoWf5pL9GXNjoJAZIwCrTy8MoClSrOCb2WuFVx1dpzdX/S/wbztPzdlgrmm1hhR
 uumJ0/9PSh7YzaVzh53slunm5Uos5t+kjOIe6PagM4SJMK2q3bv7GS7hMd/yuQJRTnbx
 WUU9hQbLovedDLXSRbnyAS0VzyfWwEtNmdH9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715804704; x=1716409504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgHQeFNA/cjSL1J53O73FIjj3ip3FyKYiQHTHBqHu9I=;
 b=HR7zl8lS7BG6cgnDu6f9jhdnOxpYtItHlvU2MGR9bp65K0WBqe/wcSztHAui9WamXU
 dKjbQCf52VuQl1A95TZwV1bZEMiKOly27j0MFqp0S7gnL0x3+s/Y8et09s7h5AHDx2Jt
 7koSiGSG0hyXX9S/lKqtzkE5LwwAys9SENLJzRe9U6Ubs8KbE7pbLRoH7HM0JzO32wDX
 aIe6OW3n9ZuSIJKCbIasdpKcw3CzENVWuObnnJBa0kPhTh8Ou3G++JCPvpi9snSQX1k9
 FQBJ/rrYh7Zmr5bVO/nbz0UKl6NfzVtSbS8O/HY4zSbroahbwYUyPV6H7RBPiu8Q90+N
 7KWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7YqPNIEAbBoYxQkmy5E2R5V0ckdyYSo1U2ABDBTFwBpCEILAQ/YYRBWZV7tKPQ05+M9WNpQR3oTCwLawQU0STCrfVRWV7QyeulcMHZ19u
X-Gm-Message-State: AOJu0Yz0fcAoGlvPBMYLImP5qJPsTYObsvk9erCzCP4EQNJTwy8k3onT
 VzCZJHsvcbr3vEFlIs9AGaSGF9fPamxGy7PI/0O0K35bovpEMX+mC09fUflpoyVfoXJ+tKZ0leA
 tbAVJkQ==
X-Google-Smtp-Source: AGHT+IG7O5xq+Fb0WdHTJOpZ6yIP0NkprJsAgmlH+Ed/z6DPvDj/w0lNHpv1uZony7lpH3WQRl52Zg==
X-Received: by 2002:a17:906:3e08:b0:a5c:de12:5fbb with SMTP id
 a640c23a62f3a-a5cde12605amr77990466b.50.1715804704117; 
 Wed, 15 May 2024 13:25:04 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a5c033afasm554382366b.156.2024.05.15.13.25.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 13:25:03 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso227224066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:25:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZBKpvih2UP6bAi8vuuqe/EOpcKZKeExWKU8BBDBdxOCPGh29Mb79VRxT4Rj1GBgKJBn7c2gM/wkvfGLAerr4/GjylwsoHOWrbpZ/Sr6sn
X-Received: by 2002:a17:906:d9d9:b0:a59:b807:330a with SMTP id
 a640c23a62f3a-a5a2d55e4b8mr1135010966b.32.1715804702993; Wed, 15 May 2024
 13:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
In-Reply-To: <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 13:24:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
Message-ID: <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
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

On Wed, 15 May 2024 at 13:21, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I guess I'll try to revert the later commit that enables it for amdgpu
> (commit a68c7eaa7a8f) and see if it at least makes the horrendous
> messages go away.

I have to revert both

  a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
  e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")

to make things build cleanly. Next step: see if it boots and fixes the
problem for me.

              Linus
