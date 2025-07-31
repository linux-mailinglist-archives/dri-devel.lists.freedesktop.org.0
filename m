Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527DB16B41
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4F10E6F6;
	Thu, 31 Jul 2025 04:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ESH90Qc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F71B10E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:36:24 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-af66d49daffso77739666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753936583; x=1754541383; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=21OF6T2HE4ELxQs2mP8X4ESpa3O4vj0vAWBbSYVti5s=;
 b=ESH90Qc6Kl1jlWJV0F3xVcRAIAEMsGbibEjAou5cZ7Ha+lZlZOI7Kcgp9NILl5ZfP7
 zl1G9ftFPiIC7diJzcpoGY4ISpGK2R2FxUmqLISB1EGglPN//p/IPSceOVvhmIsUUSMK
 kN0q9zrrENsl+gyzfn7TBlMvl5alh0lzKLTyeyeVQVoqN/w2Df8SRRJrPtb4MK7MpJ8H
 HN7NHUJe7ZiNZb3nMmwGmf4oOCI4u9QI32yCwyLu30rv1cokA/kEcwaFpREJa0L4BOmJ
 Zd/sIEZZMHwzYRLyopJIkKv3iWpLf+6AK63aUzvPBZQlpJZowRexW0o9J5HndJB5EVx5
 o0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753936583; x=1754541383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21OF6T2HE4ELxQs2mP8X4ESpa3O4vj0vAWBbSYVti5s=;
 b=jU8E3/kfELYIbRPJaTHZIN8wDDRKl8kHDIUAqLmI19dl3c1mrlg6yxYZNAOZ1aNzMX
 b8S/z7YeGUXaVJ6yY+UNJo2b5ULo7dhCqkL8jpkC63w6XbDIHfVatpCIFZMsgqH+K2d0
 NtKOlqRKlz5O3GYA0Pt9ZYJNnX+2WXEYfys8uXbpNcpq3dCiYW6vcaC8JwzlYJYxNmgj
 DpwKjH/+WJoiQNJUgl+uaE+q0V1JjoJ+nRYvUwc4I3fUkZwXoXVCSaoajp8z3wx6AUrZ
 u+JmsEsHTj7N/ovAwUWpVmkgpj+ldyyIh0lWIuXlP1zFz0ixeNfZc9C+JkZb6UCt9HKU
 Kf5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT8UKlAoyG/oQ3dC8q8b80WfxHICuCw1NVMeHVhFTwTILfpajm52s7k4l7bM+m64Rrh32o/KbI8SM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytacOofsrzEt6Vfzk9Ve41MuhJT/pZsfxtIyvAUTcN349FqrdX
 xRqkQwFBWyC9AVEm07yp2zLyFCmM2rfZ7MuYuMeLG4EW/FYX33xdQANf9kB3E9sS5++PKmIJqfU
 hsltNsbhScapdiLVkV9f1Qcm8NyUtG+U=
X-Gm-Gg: ASbGnctdGI52PKO0x0CWtA0LRQExHlJJ8pL42Le4gZxxkWtaOlHmsuAUcNGFGBe1VzN
 Cvip+e7zgQB5pgYn4Ld34ARg7MTyT42cKFGGZ5V4ZxXXSCuWx9briKVLidXqlvnlpJIV0LrzkJ3
 XlkYgnEhK+es9JFDoeUz//0jyqcs4qfTCqvFKl8q2bsq6Qiy2kcX9LV5KxYFNWCAGKulHmzG6ks
 KI+SA==
X-Google-Smtp-Source: AGHT+IHt8zXUEbU3uDBO2OBPjItSRqo+K1Uvvu2Z74SY8+04QgQzeq/5DUZSTY0K+0y5LyFUphTzmyk7hHFZdAjXVJ8=
X-Received: by 2002:a17:906:7945:b0:ade:44f6:e3d6 with SMTP id
 a640c23a62f3a-af8fd9ad9c7mr655825266b.46.1753936582675; Wed, 30 Jul 2025
 21:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
In-Reply-To: <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 14:36:11 +1000
X-Gm-Features: Ac12FXyggAnv_vUCzftDVLdOsUcon8a2AjoKpSc2jMLh64RtNqK26XHwib2traU
Message-ID: <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
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

On Thu, 31 Jul 2025 at 14:32, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 31 Jul 2025 at 14:27, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 30 Jul 2025 at 21:21, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > Okay I don't have an rx580, but I have an rx480 which is pretty close,
> > > but it is booting fine with your tree at least, DP and HDMI connected,
> > > so it's not widespread AMD breakage, anything in journalctl/dmesg?
> >
> > The machine doesn't come up far enough to mount a filesystem - my
> > disks are all encrypted, I never even get to the "type your password"
> > thing.
> >
> > So no logs.
> >
> > The good news is that it's bisecting without any ambiguity. So nowhere
> > near as painful as last merge window.
> >
>
> You can boot with modprobe.blacklist=amdgpu and then modprobe amdgpu
> once it boots and see if dmesg
>
> But hopefully bisect lands somewhere good,
>
> Just seeing if there's been any NULL ptrs on old GPU reported.

https://lore.kernel.org/dri-devel/20250717204819.731936-1-mustela@erminea.space/

is the only thing I can see that might not be in the merge.

Dave.
