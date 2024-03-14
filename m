Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534387B633
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839D210ED42;
	Thu, 14 Mar 2024 01:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iBkY+0lK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C852D10ED42
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:49:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so174135f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1710380973; x=1710985773;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t319UmoMBPRcB8lPsWRleDMOWnBo8zQ3du7ZSGpezIE=;
 b=iBkY+0lKoYvWoOs1sYKRvNmiMNAWlTzj0XYELdsTsKg5YukejlDLG1sJrhS//RiCCO
 YKNfW/AeUeI5q33Qjj6K+hHQy+03tQh6P1XzJPkkBB7TS25oqxvArzqHu4T1jBOzM8Vt
 j8jeKB/6fxadRYe0oXFcYWf7W2MVb49sfn0LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710380973; x=1710985773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t319UmoMBPRcB8lPsWRleDMOWnBo8zQ3du7ZSGpezIE=;
 b=o1LnVGITVHOv5apBCKHo4fJUmk1NBKvSDVjGsz8AlvyjLynNjdzg+sJmMHQWS0usFd
 +p3lI33RAjL8NY1zHSWvhxugJzRZzUDDTiaK/TfpBeqd0+cHOIn40uH29iBmGX4jS4ld
 HR8YBwuzrKG0h+uCedoNDLVFARzKluHreM89349ojaaXbKyBdq1XzSQKpPfb/PuZiG3F
 9IE2hD+MqSc+gitQdS8gDvCbBxuTvHxwpUJ2mMPPYs7eVMpsC2kwGlPWNpwUTQZ6JOaO
 7id/VWKtnrHP1wqCFYIf9ldnHZKm7OvjABV0l51ko7SO0XKdliE/99hx2guOC6FLPYZO
 DYBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo5H1OHFZJnp4VtzqoxTz/4Unbebn8M/FFxLVYTejST/O9uL+g/a+cjVbt4O5WbREo0+r4Bdd7BtwG0mExXjBh3vEjgnnQD0FQYHc4TS5H
X-Gm-Message-State: AOJu0Yw1LSDbFN7fJDxmSl4dYq7oYEfNdWF2veIyV5p+iESfsnRoD0dM
 f3+Yzt9x37vt4+kqE+b+3xIdJYht7L4HFcSWyk8XuUEw+5jAZy/+M80V7sLChnhT10giOYmqrF8
 lSeBMIQ==
X-Google-Smtp-Source: AGHT+IG/fdJiHtHK7gi5HjPulrR4L//6DCOuthifzrn6CCHFTdVjQuISlBxQpa7jqc7EO4fvhYSpOA==
X-Received: by 2002:a5d:6505:0:b0:33e:1e0:2679 with SMTP id
 x5-20020a5d6505000000b0033e01e02679mr176720wru.47.1710380972663; 
 Wed, 13 Mar 2024 18:49:32 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 v21-20020aa7cd55000000b005689f9158ddsm127861edw.23.2024.03.13.18.49.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 18:49:31 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a45bb2a9c20so40497166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:49:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGFZwieStVgmHmgm+nwWi6Mr9NmcMghmApkqhzkNEfiIyNN7bSxgO4f7Rno55obmda66AwRlcQ4/JDNkQdiemBRWbKx6ECfQfhopwZqwfY
X-Received: by 2002:a17:906:a449:b0:a45:ac3b:4aca with SMTP id
 cb9-20020a170906a44900b00a45ac3b4acamr157510ejb.44.1710380971337; Wed, 13 Mar
 2024 18:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
In-Reply-To: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Mar 2024 18:49:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTWLKkg0Hht4ofDTVsebD2Zq-m4UP-DsiZjM+w4b7qug@mail.gmail.com>
Message-ID: <CAHk-=wiTWLKkg0Hht4ofDTVsebD2Zq-m4UP-DsiZjM+w4b7qug@mail.gmail.com>
Subject: Re: [git pull] drm for 6.9-rc1
To: Dave Airlie <airlied@gmail.com>, Animesh Manna <animesh.manna@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
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

On Tue, 12 Mar 2024 at 21:07, Dave Airlie <airlied@gmail.com> wrote:
>
> I've done a trial merge into your tree from a few hours ago, there
> are definitely some slighty messy conflicts, I've pushed a sample
> branch here:

I appreciate your sample merges since I like verifying my end result,
but I think your merge is wrong.

I got two differences when I did the merge. The one in
intel_dp_detect() I think is just syntactic - I ended up placing the

        if (!intel_dp_is_edp(intel_dp))
                intel_psr_init_dpcd(intel_dp);

differently than you did (I did it *after* the tunnel_detect()).

I don't _think,_ that placement matters, but somebody more familiar
with the code should check it out. Added Animesh and Jani to the
participants.

But I think your merge gets the TP_printk() for the xe_bo_move trace
event is actively wrong. You don't have the destination for the move
in the printk.

Or maybe I got it wrong. Our merges end up _close_, but not identical.

               Linus
