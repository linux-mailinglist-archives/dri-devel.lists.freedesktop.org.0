Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CB8BEC41
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 21:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D1210FD39;
	Tue,  7 May 2024 19:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ay3inSfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF7810F5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 19:07:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so918584366b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 12:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715108848; x=1715713648;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JwU1IWNzhlSP5EH9iyMHaFmRpSbbE8IFJCVgZMlAkcM=;
 b=ay3inSfGvCa9YlvF/z6/Pb+hyimbmHIBOTRZNCHMoRB9/dKdPLxyebgp01FAjUW5hW
 e+DdjApJyBGJapdj5Z4WofEH5NlRJUPQ3RZ/Gr8gcIzz2duwX5cpdH+azx7lxZGamprj
 3gQp0+2vfH4W5C9kRSOgFcJ+XPRFFDesKxNE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715108848; x=1715713648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JwU1IWNzhlSP5EH9iyMHaFmRpSbbE8IFJCVgZMlAkcM=;
 b=OOL9U3/2G3VKR7Dyl3SKwls05HQsRR+eeW5vYwsYHJU+PhWwonYd/W1zrk0Cr9DEeM
 apzTPJfx2N1nJrMoKaVN97Erkd1oIPJ/NYAhCadebRu66Vb0zqHKWWdbojvJPgqN2OJE
 vbZ0sPBjJJADOx2virLAWjqZ76XGZYxvE7n3BWWz2Ai5024vDRbpFD6Aiki8s85YzdDh
 l+xfp9qc3m/XykgT9m6BlGaLgilKG3VtFNef+DtCEE5yZAYsitAjkQs3/pIb5pn7YP73
 Bs+gOlUPHQJBAyQRz1cyWbW8wCyOmpgwsbYIvYS701fsJ3yvoLHDbA07pYawalkdniAw
 zI/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSmk/dfcNCNYPnbp2ebcaZ+SYazXdgdoP7A+uzuXEQnADy2rs1Cwp8ULW+AudROkNcqRD+bQ+kb7HRuWmk9HzfaoVkMYu7sG/ZiHK8xByT
X-Gm-Message-State: AOJu0YwQW8cqCAdMo3xmemfQlTouViKyVuQU+JUTx+QUmkEadvtd9jyQ
 qn0zUI++ufQ1gGFANnrcHXaFY6ad7yN3AZ8k1+PRO2ry4XYefmKEAKHhLtA/B7sZoU9i2WkRWtX
 b6Ykjiw==
X-Google-Smtp-Source: AGHT+IEzyeLKB5svJTA9yrqGBNohvA0wBfWt3pS/4hNne360cWIlboZe/HXDNFZaORlSIg+5qKFmXw==
X-Received: by 2002:a50:d590:0:b0:570:388:ee0b with SMTP id
 4fb4d7f45d1cf-5731da9c021mr361075a12.42.1715108848505; 
 Tue, 07 May 2024 12:07:28 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402160600b005722ce89ae2sm6669659edv.38.2024.05.07.12.07.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 12:07:27 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso695079966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 12:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtiGAz5dKFkdQs8TMy8lOPL45u30VDX/gTfUAq6p2U6ERQhDQcGkP5Vjk3xRc8Zufe68U/e/cSdQtzqwiL8pJJYnh2/iiBuUC0CM/LLnZe
X-Received: by 2002:a17:906:1957:b0:a59:a977:a157 with SMTP id
 a640c23a62f3a-a59fb9f209dmr23097766b.73.1715108847432; Tue, 07 May 2024
 12:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
In-Reply-To: <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 May 2024 12:07:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
Message-ID: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com
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

On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
>
> > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > too, if this is possibly a more common thing. and not just DRM wants
> > it.
> >
> > Would something like that work for you?
>
> Yes.
>
> Adding Simon and Pekka as two of the usual suspects for this kind of
> stuff. Also example code (the int return value is just so that callers know
> when kcmp isn't available, they all only care about equality):
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239

That example thing shows that we shouldn't make it a FISAME ioctl - we
should make it a fcntl() instead, and it would just be a companion to
F_DUPFD.

Doesn't that strike everybody as a *much* cleaner interface? I think
F_ISDUP would work very naturally indeed with F_DUPFD.

Yes? No?

                       Linus
