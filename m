Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7786DCD4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EB910EB7D;
	Fri,  1 Mar 2024 08:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OpuxTch2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1E10E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 20:21:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-565ef8af2f5so2019361a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709238078; x=1709842878;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
 b=OpuxTch2hi79/cnrhhdVK6JgYjK3NSWdoXABTC/YuPf0hOLjbhbsXJJhhi3b1Ldp9b
 rJBiVvf4HUnYswnMbxMJqto6acxdsqigS17XRWme0sLEaoCPeS34kDGQbn3BoFUKA0tV
 aIcyW+LSomqZmXkeI+9xodWS8X7tJISrip/qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709238078; x=1709842878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
 b=OJ4N9MAx9SM4sNQct+clI8JA7sh2V7ZQMRKMgc7/Vi8iYe4PmZbcig665S+4MW+xxk
 M7XNp/7vVBkMtmBZnvng4GpBrzg4D6PnY61nEGnZ/A0PwyoKKfzHkvs+GZdi+n+zzT7L
 W85qKeG7fK5PE32n1jRKvBR6M+I6df4HgXaTNlj+iM6eGAzrLB8FcSsus4nGRc0Br+uL
 hXTAieVhFqmMvF9txx/CUBSamahtk3YhRR7B/ZR+OF94Blv/F6zINj5sVv/iK0/9AZyX
 1RdByJYakkNmj4J4eCF9ldtGHuniGgtds8RXMwaIja/Qjb3ozJPA9olIVgFmk42CvCYS
 j9Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs41Mbmw5K+R53txXfww9mTGrxZ2pmYPrWYUSgDAHsZlXSFuiEyNbMCTrNVHpardgOlxL26hMdqLL30TinAbRLqUauhtF9hfiyQgKxZxXp
X-Gm-Message-State: AOJu0YyZKFg3x205mn+Quwo4dulrV5izkW6FYm21eR4G+GzBwN/vqraq
 hBILOXDDw9Kk6kQoNWtXGDQ3on+ldNXWmagMAYFBk25KY/QEnTQscH9WffZLrxTt77c4NpjtzfJ
 Zjcv2Uw==
X-Google-Smtp-Source: AGHT+IEqqh+LGH74DHNFjDoWE2D0FjIUlG8rp4LbVgREvyALvvlPBTfhXDmEbuaa/yWNMQAT2DNncQ==
X-Received: by 2002:a17:906:3c10:b0:a43:c204:1a5e with SMTP id
 h16-20020a1709063c1000b00a43c2041a5emr14319ejg.63.1709238078381; 
 Thu, 29 Feb 2024 12:21:18 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 g23-20020a1709063b1700b00a4319de07c6sm991774ejf.127.2024.02.29.12.21.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 12:21:17 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so265144766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:21:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKkzUKdP2VLg6NklkhfVJoYEH8ntAxSRjTLZ6aENXf3s0NCmkfmQQCrI9n/HYdYoWS8l2BxgOJeZzEAXkY/KsgVeDrLepHvGZ9agMZ36BH
X-Received: by 2002:a17:906:d9c9:b0:a3f:1cb6:fb00 with SMTP id
 qk9-20020a170906d9c900b00a3f1cb6fb00mr12394ejb.69.1709238077400; Thu, 29 Feb
 2024 12:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
In-Reply-To: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 29 Feb 2024 12:21:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 01 Mar 2024 08:16:26 +0000
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

On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
> file in the root of the source tree, but instead change the very same repo
> setting to point to a particular entry YAML, *inside* the repo (somewhere
> under "ci" directory) instead.

I really don't want some kind of top-level CI for the base kernel project.

We already have the situation that the drm people have their own ci
model. II'm ok with that, partly because then at least the maintainers
of that subsystem can agree on the rules for that one subsystem.

I'm not at all interested in having something that people will then
either fight about, or - more likely - ignore, at the top level
because there isn't some global agreement about what the rules are.

For example, even just running checkpatch is often a stylistic thing,
and not everybody agrees about all the checkpatch warnings.

I would suggest the CI project be separate from the kernel.

And having that slack channel that is restricted to particular
companies is just another sign of this whole disease.

If you want to make a google/microsoft project to do kernel CI, then
more power to you, but don't expect it to be some kind of agreed-upon
kernel project when it's a closed system.

               Linus
