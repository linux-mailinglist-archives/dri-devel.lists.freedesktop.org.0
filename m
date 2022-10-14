Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71F5FF37C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 20:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42BA10E052;
	Fri, 14 Oct 2022 18:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFC810E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 18:15:27 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id o64so5862735oib.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KM3d9mUdbDj0z6oafXxyZzutznAV5jWXZ9fQzWHF6Bs=;
 b=TsKo2S7GdpxCnrWyTu2QEbbgciSN5woqwIPML3g0E6pmL75LsB288Sf+10bV5E1FMd
 +Cw39hD+tRwMpp7CEfBS80jSkGVcSwaae/dPmihuAxxWq7V7xBbSQfW1nes3ZLh+Mnsr
 72Y30bhKclxNEcE+iZB8casHWCU81PWTfK/qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KM3d9mUdbDj0z6oafXxyZzutznAV5jWXZ9fQzWHF6Bs=;
 b=M7fH8uRHqON2+dMlXY5j7x9PMCrOcoa3udVTA2nYF+Zjli1rWTohPYmW/RS2pyctB6
 5r3RoxD8fCUO5o5WQNVBztPADll4Be8voxA7lyKJ2KOJdLPKKtuhQ4oAtBN7VdwwB9yr
 mqx0X+e4zVon/QZbtRJukyx76D+1+TahpiSLGuAeIxVHyUezTx3La2VvnPU1jFG5CzXf
 cClMxVja3mvQ3Pn4iPpnWxS25P7LxSMKHctIAfbFxGJ4hJB2mIGBLagRCvko0yHbpPD1
 l09T/AKIcBTyyh04h1yigUtz8gDjIhCW5QsbDUEHKYC6aOulIdBsjC/QG+KykdY1EKnj
 +oXw==
X-Gm-Message-State: ACrzQf2ynaSdGqbQyP0Kmm+qRQJbwlcd1NkwE/WdAJyAUr/6RIGvMAxC
 naLdbasTgCAs3H6SiObFn36wiHHS5Dc+wA==
X-Google-Smtp-Source: AMsMyM7Bvp+HQ605+C7JPqEoC/buKj20XqwqTXQogipG8W6LW976pTwba28hq/lx0PkbDDkbtRbU6Q==
X-Received: by 2002:a05:6808:13c6:b0:354:93bd:4cf6 with SMTP id
 d6-20020a05680813c600b0035493bd4cf6mr8009168oiw.124.1665771325939; 
 Fri, 14 Oct 2022 11:15:25 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com.
 [209.85.160.54]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056870ea8600b0010bf07976c9sm1541887oap.41.2022.10.14.11.15.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 11:15:23 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-131dda37dddso6845055fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 11:15:22 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr3564382oad.126.1665771322642; Fri, 14
 Oct 2022 11:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221014152102.1755050-1-nathan@kernel.org>
In-Reply-To: <20221014152102.1755050-1-nathan@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Oct 2022 11:15:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8LT6iN7ZFE_6Yfydne9gWYJaJzD1ntSuGhMv8SkKCcw@mail.gmail.com>
Message-ID: <CAHk-=wg8LT6iN7ZFE_6Yfydne9gWYJaJzD1ntSuGhMv8SkKCcw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix build breakage with CONFIG_DEBUG_FS=n
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 14, 2022 at 8:22 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 8799c0be89eb ("drm/amd/display: Fix vblank refcount in vrr
> transition"), a build with CONFIG_DEBUG_FS=n is broken due to a
> misplaced brace, along the lines of:

Thanks, applied.

              Linus
