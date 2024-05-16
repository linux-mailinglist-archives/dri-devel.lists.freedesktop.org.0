Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34078C6F61
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 02:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC3F10E326;
	Thu, 16 May 2024 00:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U19c24uD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A5910E326
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:06:03 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a5a88339780so248397866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715817961; x=1716422761;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9uSO/C+TlKTnIQVTkiRs+aNrBDYs8IQvFyIDb79vDAQ=;
 b=U19c24uDvUJ28hmioSndLsqsU113CmStdR8ko7wthgOT858luNbYFSiM9LiS8J/pzE
 BWdFSmFWMqt7Ov6nuNAoNKW/CQFqs5AJE27ZxsytlLe/c7ZoRwXy7liEVPM27v0X8HOG
 R0nX+28gijcJRZb9JJ57lUHkABc8/VCb39IIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715817961; x=1716422761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9uSO/C+TlKTnIQVTkiRs+aNrBDYs8IQvFyIDb79vDAQ=;
 b=kbDByK9/omTcR2FzT22tVOPEJE8TBCIxM7AdBs8JKviCoc92S93p0s/iBkmcvukjQX
 g1AtOVQtUmMWRQHxNDJrvJoOAYabaNjB7HR9RKyuxkkpG9vOJRwC4V7lK82YOfMY1CGp
 At8LvqvXuy7jR4x8it6E0yQ3bksVVnpzucl8E8RwCpu0gRBWv55OY99yYGcyokHDhSwC
 uFg2cegUMw3w7sV5amAs0xLmitFmuSdu3wLP2b6atgxy//glNEZxSMlceZsPDZrJv6/5
 QFHbKMqoVj/BY+JG64QxwMIcre6dHEK8cZcZGzDeTFfGbHFe6CbukQhd/d15qu/xo6V8
 366Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEFJGCCq51DDS47AnyAaWhLmcLti63ueojiuF6V27gVDlSLg32YltHgINds5/njI+4I09NCQ7ziTfoVDte7SlUyQQDZybRDgWLNCoDbtv+
X-Gm-Message-State: AOJu0YwfP4gn6EWBL2B9yseiMJEqQAX7mgAq5KrWTWeslwMIwJ/1DUQ4
 Ni3tf6qBBYZx1aIiAdVZ7ax+zwGODVY+ug3LasQqCcIwYoqth943fU0Rlb1b5gTHnNNZhbZU89D
 APEjFBQ==
X-Google-Smtp-Source: AGHT+IFhfB3jiTf/pU8XoRr7HPhL5TGZl7owoN3ZcvCdE9Kjg8IjJ4kEn1fphVWU0aiUvqLnh3UnSA==
X-Received: by 2002:a17:906:3155:b0:a5a:1b78:9450 with SMTP id
 a640c23a62f3a-a5a2d54c0aamr1104349466b.6.1715817961482; 
 Wed, 15 May 2024 17:06:01 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8a55f2e8sm235794866b.126.2024.05.15.17.06.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 17:06:00 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a5a88339780so248396866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPEXojjYntFf1W2b+l44AQ3dfhVgn/q2pr8a2Y4ceT/DvXJNRXfcgV+TE87katqpIcCZwL0Ta0RG/kzH18YXB/KW4EIXbz/fjyvGnuKZbJ
X-Received: by 2002:a17:906:31d7:b0:a59:c7d9:9d39 with SMTP id
 a640c23a62f3a-a5a2d54c0b5mr1162843166b.10.1715817960352; Wed, 15 May 2024
 17:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
 <CAPM=9ty=xoLrCJGx+TfcQe66pMCi5-9etPhhb7HgWUOHFM8dUw@mail.gmail.com>
In-Reply-To: <CAPM=9ty=xoLrCJGx+TfcQe66pMCi5-9etPhhb7HgWUOHFM8dUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 17:05:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizH1b8vv67xVSoSHqp5B=dNsqtpP+86RM7G5z14nuRHw@mail.gmail.com>
Message-ID: <CAHk-=wizH1b8vv67xVSoSHqp5B=dNsqtpP+86RM7G5z14nuRHw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
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

On Wed, 15 May 2024 at 16:51, Dave Airlie <airlied@gmail.com> wrote:
>
> > Let's see if the machine ends up being stable now. It took several
> > hours for the "scary messages" state to turn into the "hung machine"
> > state, so they *could* have been independent issues, but it seems a
> > bit unlikely.
>
> This worries me actually, it's possible this warn could cause a
> problem, but I'm not convinced it should have machine ending
> properties without some sort of different error at the end, so I'd
> keep an eye open here.

Well, since I'm a big believer in dogfooding, I always run my own
kernel even during the merge window. I don't reboot between each pull,
but I try to basically reboot daily.

And it's entirely possible that the eventual "bad page flags" error -
which is what I think triggered the eventual hang - is something else
that came in during this merge window.

I haven't actually gotten the -mm changes from Andrew yet, but it did
happen in the btrfs kworker, and I have merged the btrfs changes for
6.10.  So maybe they are the cause.

I was blaming the DRM case mainly because it clearly *was* about some
kind of allocation management, and I got a *lot* of those warnings:

    $ journalctl -b -1 | grep 'WARNING: CPU' | wc -1
      16015

but let's see if it happens with my amdgpu reverts in place, and no
drm warnings.

It most definitely wouldn't be the first time we had multiple
independent bugs during the merge window ;/

              Linus
