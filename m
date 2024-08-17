Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B49558E8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 18:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954D10E0C1;
	Sat, 17 Aug 2024 16:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CFZq26xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0EF10E0C4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 16:26:43 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f3bfcc2727so31121691fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1723912001; x=1724516801;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bJUpF+ZilJ5tJUWYdG1B4XodSC5itu+LywsKXdFMvvc=;
 b=CFZq26xMbdQL3gBW2OxhDlFRMoIcsQCZwcFs6JPbCEHRjjC/CIzYmkj3qZ0/sAuauv
 3lCpjhLLYJ9GZiDyocFmy/vUU/OlOz2GUVV7DPgzWTKW/vfxe+PQ/6hxVUNCe9qjh7HB
 iOyA5QI+SKJALIZjrQv3WnlZLhLLhJEDO9dq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723912001; x=1724516801;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJUpF+ZilJ5tJUWYdG1B4XodSC5itu+LywsKXdFMvvc=;
 b=hQmpR214EvMsFRYZASaZR4YB2awnYzK0Ex7MmYjZSxX8xwFRmwNOhQefw5fbzEwFUZ
 BPAG6dX80t4miL6zMmaWiu+8m+svQF0X7PuwF5X9oOhLGH0ughFKyFOiFbdE1PEg81nJ
 GWlCRfNxPWGudpr8/EJnNPN9pn0teGt0XL/H51/ejIe6b5GlGjBQ1rg9NOg176oYQ98s
 2zBngOcxjk8MEuAotKBjrc2lzNGH4En6VA1Kd66zThRdoX+vddnxlRK2krE4fKrYnREb
 kbUBnt9vRKzotXowN9ASiicYM0VEfhuk/4V6sak1u1BRqAvBPrhvFTFRKOIf04FWMDOi
 hNxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlfoA381xAn7t93KkOzQ7nBurhcE31V3BHwxd0dqIblYLPe8HWw5AxZNbt9cJZZ80kAAGhFSf72gIseA2T4puw9e7Y0H8oi6yquwcX1Hg0
X-Gm-Message-State: AOJu0YwuFdM2Dw82uAiqpn7gwS3HoL5MUQxvo6OtaopsX8BjaPH1qTBS
 hq/r1imglaLknQrpq+95+urZvfOzWAg5HGbmnvinVsi5rZPnsCxcYWaWq4D4WtVBkBmsyJ/wonS
 MsP7hlQ==
X-Google-Smtp-Source: AGHT+IEPMCypP9qXO0RvaGuM4VgITU5QLgzqlG04rhgp5J4k84UGcYifk87jufMYjm+QHwA0EFLDjg==
X-Received: by 2002:a2e:be28:0:b0:2ef:29cd:3191 with SMTP id
 38308e7fff4ca-2f3be5d9997mr56289061fa.35.1723912000919; 
 Sat, 17 Aug 2024 09:26:40 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838eee8bsm421088966b.92.2024.08.17.09.26.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Aug 2024 09:26:39 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6117aso1263122a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 09:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIgN4jw/2OOV6jBgvcXefQ4+wpe7Fi3DHOqjjJPqEUrGvEZYrNZKvmSNE9NIyCDeZsWctF15+lA1iY0fzWijfO2eFxQOhhRXr9VIlx07gx
X-Received: by 2002:a05:6402:278b:b0:5a1:b6d8:b561 with SMTP id
 4fb4d7f45d1cf-5beca527ec4mr6027442a12.9.1723911998605; Sat, 17 Aug 2024
 09:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
 <w6fx3gozq73slfpge4xucpezffrdioauzvoscdw2is5xf7viea@a4doumg264s4>
In-Reply-To: <w6fx3gozq73slfpge4xucpezffrdioauzvoscdw2is5xf7viea@a4doumg264s4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 17 Aug 2024 09:26:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_U7S=R2ptr3dN21fOVbDGimY3-qpkSebeGtYh6pDCKA@mail.gmail.com>
Message-ID: <CAHk-=wi_U7S=R2ptr3dN21fOVbDGimY3-qpkSebeGtYh6pDCKA@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
To: Alejandro Colomar <alx@kernel.org>
Cc: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org,
 justinstitt@google.com, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sat, 17 Aug 2024 at 01:48, Alejandro Colomar <alx@kernel.org> wrote:
>
> I would compact the above to:
>
>         len = strlen(s);
>         buf = kmalloc_track_caller(len + 1, gfp);
>         if (buf)
>                 strcpy(mempcpy(buf, s, len), "");

No, we're not doing this kind of horror.

If _FORTIFY_SOURCE has problems with a simple "memcpy and add NUL",
then _FORTIFY_SOURCE needs to be fixed.

We don't replace a "buf[len] = 0" with strcpy(,""). Yes, compilers may
simplify it, but dammit, it's an unreadable incomprehensible mess to
humans, and humans still matter a LOT more.

                Linus
