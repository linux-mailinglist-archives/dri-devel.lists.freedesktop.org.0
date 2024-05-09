Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD218C1232
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 17:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F96410E30F;
	Thu,  9 May 2024 15:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q7uowmsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD6210E30F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 15:48:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so188083566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715269717; x=1715874517;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=38BuvpIpkB3oaxq+zw4VsWBKcS3P81IEjFcYuWVYCpU=;
 b=Q7uowmsPcWD4j1ez/l1XvmFfmE3Z7z9hToS51F7WrbSKicBNKIcBgq13I5Tb6lDjkb
 c1UKo7y90x8gBJhH/8BwYwNvMps5N5ys1eDFiQPW+fP5vzz7lu2gId8ko7DZ9qSDUX1s
 dk829lFjyJo2RG3ZOJ6RHtKa1+U2zsqPlP1Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715269717; x=1715874517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38BuvpIpkB3oaxq+zw4VsWBKcS3P81IEjFcYuWVYCpU=;
 b=Z71gP4QI6JRMCKRgmec3wscKsRAlho8r1MR8dcpTo7eaHU9ZXnZPT9WSWX9HVAiw4W
 PBbuYb9aG5tZHCPmmn/XnCPxmHoycn5WQqTlsIyWvx8/sxPc9uREkVWN7vfoMIukpLdW
 6hLWjvayk9tQGM+6rxjojU98mGPzpSbIj6adCZ6xQxwB8s+4sbQyQzNeglIfFxHyjIcm
 aDDwUBydK/Q6BoLP1xWlhfZ4XfVTeF/BaK9g9nwt5tvT1ePInsUvQdgDeAka3ApfsWcK
 MsBi5EnDGtiDVmRfrQl+b3YDN979fdx1Hxq7uAO6drGA7xOuJImqLkKyubiM7vbfsCqc
 vmKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKxm4Oa7RhAbpPf7VAYCLhGopsKepzB4yaX2jNy+jOvfKrLbul5/+kczBOd6AMMSiK+WDQjM5tU470yWA+pVGb9zBBb8HLGW3Bfyw1zdPf
X-Gm-Message-State: AOJu0YwkCG6eIvXRj+SYHki58C6yP5VJ0hVk8oCCBenrECRCQLnRoCoy
 Vpal9xDgIC+RDQA5k5hGUCzvkZa0i187PGsnlaOfe7FCD4XwKUf8oDQrvs5xqT2KraOriUtnuYc
 HNzRUAQ==
X-Google-Smtp-Source: AGHT+IGbjOaXZxD57WyK2p9fwGVxyCYTl9E2nVD74y2hNLBvZvd/91Bp4+j/zobKRxuNORIEUWfIRw==
X-Received: by 2002:a17:907:bb8a:b0:a55:5698:3ea6 with SMTP id
 a640c23a62f3a-a5a11842569mr247865266b.29.1715269717216; 
 Thu, 09 May 2024 08:48:37 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c70asm86470166b.56.2024.05.09.08.48.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 08:48:37 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so384556666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 08:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWn6XVfO2SB+awgCi6EXZWuVchfcNV6OugjLYKHy2oLIbi/6cNswX/soq7y7RVmi8gxvCdln3PMLC09C+jIrRYnT9M5nhmU2d/oGA1WWvit
X-Received: by 2002:a17:906:19d0:b0:a59:fb06:5d35 with SMTP id
 a640c23a62f3a-a5a1156665fmr240732966b.8.1715269716628; Thu, 09 May 2024
 08:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
 <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
 <20240509-kutschieren-tacker-c3968b8d3853@brauner>
In-Reply-To: <20240509-kutschieren-tacker-c3968b8d3853@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 08:48:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
Message-ID: <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
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

On Thu, 9 May 2024 at 04:39, Christian Brauner <brauner@kernel.org> wrote:
>
> Not worth it without someone explaining in detail why imho. First pass
> should be to try and replace kcmp() in scenarios where it's obviously
> not needed or overkill.

Ack.

> I've added a CLASS(fd_raw) in a preliminary patch since we'll need that
> anyway which means that your comparison patch becomes even simpler imho.
> I've also added a selftest patch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.misc

LGTM.

Maybe worth adding an explicit test for "open same file, but two
separate opens, F_DUPFD_QUERY returns 0? Just to clarify the "it's not
testing the file on the filesystem for equality, but the file pointer
itself".

             Linus
