Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A758C8CCC
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97E710E360;
	Fri, 17 May 2024 19:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QhJh42YO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711310E360
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 19:27:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so31545061fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715974051; x=1716578851;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T9M6F97XE4rXzWiUArT6i3Fj8MiLIPSp5Zokso35LN8=;
 b=QhJh42YOvy3KbjMnIJ4MMBQdtyH89myPfMar/Wf3lAuIukxE18R/2wuIeqarLFdZBb
 kb0oztxYY38HrcFTy9A+6LR74DfDgRUl4VC5UgdGRPRr68eUw+Bom/m2WS37Z4MiesLe
 PDOjeEJOhAUH5TFu9QK62AnJlNECOu8Tqyd3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715974051; x=1716578851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9M6F97XE4rXzWiUArT6i3Fj8MiLIPSp5Zokso35LN8=;
 b=cTfqNPvwsRpSuqPlxh9qmcxaN2aiKRi3bz+zqrdvboryi4llSNLaHe31qzN9cifdre
 JFQfERxG5GXPqeWJu60VdGlVnYkTAfgcLSDQ79V+4M3R9t48FQp0ZCCMuUOuKeSaGQ3X
 9jre2o0b7UJlAtvq3Go4XEpGxXlDx15oj11mFB/pdUsaCsTW9tlrByFSgioG0HbMWcE6
 c0JvEShos3w5MgVM5qH3vJZX+CU46bDfJjzHeDBO1AGILpdV/t6PFwjLHHDMKD6PEUZ9
 9WXgRSefeEiorlgCvPFyB60E/CUwYgsVrRtKYBPYnV8Xkw66h832obwdcLy5B+QkF4n/
 nLog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwny2pplDZpyXvOozmy74uKmmC+XnRxcqyOozT4rp4kNGUmWkazGzj11WHr4C+qOZmwst47HYrVqyEds+efSlFDSssNaTYInbcELJ0h9V
X-Gm-Message-State: AOJu0YxvPWlwpdWcn7709bgitCikSeIcWzOmgHagHNWgotq1F3JG4Ber
 pZ/WrHtRBvS3WEH6Ya7lVU5vuLJvyrO5qJy/1oD4gvUabn57eChH46zoMGWO9B6yVLx6k28uc3b
 csR2fbA==
X-Google-Smtp-Source: AGHT+IHmnQzSXjczTMuwlaPIH9xD1UgRBlWilDRBSFnIx7IEmySyTqs2VLgjARfR+gwYfng/MHBa4g==
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id
 38308e7fff4ca-2e5204b2ed4mr153607531fa.32.1715974050981; 
 Fri, 17 May 2024 12:27:30 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c323866sm12230234a12.87.2024.05.17.12.27.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 12:27:30 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a5a88339780so525581766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOiCxKFx593BIu9TIe/uqDMMGn6/uFLjPiNxUdFQ6wGOIoD7elQRQPlC7UUJ4Dll27sVlTHIQZwSyiOgibb4Ar+lDFJkeY2Tp8gdgRaj56
X-Received: by 2002:a17:907:1118:b0:a59:c5c2:a320 with SMTP id
 a640c23a62f3a-a5a2d581b19mr1527950266b.23.1715974049802; Fri, 17 May 2024
 12:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
 <CADnq5_P3pR8C=SsZWv85h7rZUxxfoQBeMsNbTWnLpOqeQ-2m=Q@mail.gmail.com>
In-Reply-To: <CADnq5_P3pR8C=SsZWv85h7rZUxxfoQBeMsNbTWnLpOqeQ-2m=Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 May 2024 12:27:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEo=eTSjAcHWV=cAiBFnRJ3R35nV_bt8uSq=CEKehHMw@mail.gmail.com>
Message-ID: <CAHk-=whEo=eTSjAcHWV=cAiBFnRJ3R35nV_bt8uSq=CEKehHMw@mail.gmail.com>
Subject: Re: [git pull] drm urgent for 6.10-rc1
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
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

On Fri, 17 May 2024 at 06:55, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Can you try this patch?
> https://patchwork.freedesktop.org/patch/594539/

Ack. This seems to fix it for me - unless the problem is random and
only happens sometimes, and I've just been *very* unlucky until now.

                Linus
