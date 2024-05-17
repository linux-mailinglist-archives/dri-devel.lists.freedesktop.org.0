Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1218C8CBE
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6316810E30B;
	Fri, 17 May 2024 19:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PZFaSNra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388E310E30B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 19:22:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so1998289e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715973762; x=1716578562;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sh8TQN24HdRct7EWlhzUHnCJ0TtfqGC3HskYLHQN1S4=;
 b=PZFaSNrapdQMoWkR1ixKg4zIuIakHU3CDRweHLgZQ61BIpMIg0mbCGBESdbLARLOZA
 OzXQBsuQhKhJy7wxGLvZ9iFs8ndeIGh95jkfEpMZAxzchkjaV3OEdFsXsrI12qCOMRxr
 vJHLLdHFSnPfazxpFmu0xtlThCZaN9nCDmevw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715973762; x=1716578562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sh8TQN24HdRct7EWlhzUHnCJ0TtfqGC3HskYLHQN1S4=;
 b=OdM0cInPcTJ8oBLRAAWxcY2OkcdGpxqMecM3BIMBIzS2ez1nr5O/OHY/cdceAJE0Nh
 M2hlT9UiwHIROkVHA2XvJ1j9Eb0vp8PjvoidE8+Rntkgrm96S79Te80uvNRptKjIXezy
 NXJrxDYMKWiV5PpTvFSWHlv4Qmjw0U65EyOnXlmh/21Mt2juNaubzSaCTOHVxkNN1S/r
 eJb9OpfZiMkO/Ahp0Mb3zAtzanOdHtB8aPC7mgb52HeAWf1mwrlk+NOI86W4zx9m6lMQ
 rjb47/pSEms5X9j/2ozNBOKJqwejigB808D5r/gXhExxpF3l0I17XRyGCz/xsKcw2gL+
 O4Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZn0uNdp2F0Qg/404OAtvD1zOaxTHPWLrneSf6QXug5XHDD1wBGD2sr7dEWjOd0/ukZb8DJyhdLwhFjfKWSUeothRKmXC3f4vUIrZ+a7d4
X-Gm-Message-State: AOJu0Yx2cgx+OfhQ5+cJ+SGlAJXqhLurjzywokiBV4JpDplEJX/Qy3v+
 hEcKCY2fcoCvTlI6Y+NoZ067YWCf7CbAW1cfvTWtqqK56Kt+PAOoj48zZ66srQOD2IRIFajyQnW
 e9fyLdw==
X-Google-Smtp-Source: AGHT+IH00MStMbuaBKRMnFRY3FVp0h1s22aXqQeOax+TNHYhsPTwD88VdK0AAOyA1f7zXxN90TKtsg==
X-Received: by 2002:a19:644d:0:b0:51f:3b4d:b087 with SMTP id
 2adb3069b0e04-52210473f62mr16868781e87.63.1715973761577; 
 Fri, 17 May 2024 12:22:41 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523b261ace6sm764506e87.8.2024.05.17.12.22.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 12:22:40 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51ffff16400so3880661e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIpwYER5SzrsuC9/bNMMeQK+jd0rYV2IVihs1G6X9ZSQozjJ4Ma2wtOTee4UQi7HDIbmqXdcPxLsjNWSI7AAJb9OVnbznKBU1gZfluW3EB
X-Received: by 2002:ac2:4a84:0:b0:51d:9aa7:23e with SMTP id
 2adb3069b0e04-52210475801mr17957902e87.65.1715973760408; Fri, 17 May 2024
 12:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
 <CADnq5_NmC9bYkPFUD35gBtxsk_9jYhOTugni-q4WGXggf6=rLA@mail.gmail.com>
 <6225ecf4-f4ca-4ed7-a316-69c86f4ade7f@amd.com>
 <CAPM=9tyJCJ+D4h7BZ3dBpm6R33gTfwtigDtmt6g9KX25Jun9Hg@mail.gmail.com>
In-Reply-To: <CAPM=9tyJCJ+D4h7BZ3dBpm6R33gTfwtigDtmt6g9KX25Jun9Hg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 May 2024 12:22:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=whp9ixiDVNvSXRcVWYifXfQaZH9taHxD-i5noppY30e1w@mail.gmail.com>
Message-ID: <CAHk-=whp9ixiDVNvSXRcVWYifXfQaZH9taHxD-i5noppY30e1w@mail.gmail.com>
Subject: Re: [git pull] drm urgent for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
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

On Thu, 16 May 2024 at 18:08, Dave Airlie <airlied@gmail.com> wrote:
>
> Linus, do you see it a boot straight away?

Ok, back at that computer now, and yes, I see those messages right
away. In fact, they seem to happen before gnome even starts up, ie I
see those messages long before the first messages from gnome-session:

    May 17 12:07:17 tr3970x kernel: WARNING: CPU: 4 PID: 1067 at
drivers/gpu/drm/drm_buddy.c:198 __force_merge+0x184/0x1b0 [drm_buddy]
    .. lots and lots and lots of them ..
    ...
    May 17 12:07:23 tr3970x systemd-cryptsetup[982]: ...
    ...
    May 17 12:07:25 tr3970x systemd[1]: Reached target basic.target
    ...
    May 17 12:07:25 tr3970x systemd[1]: Mounted sysroot.mount - /sysroot.
    ...
    May 17 12:07:25 tr3970x systemd[1]: Switching root.
    ...
    May 17 12:07:36 tr3970x gnome-session[2824]: ..
    ...
    May 17 12:07:36 tr3970x gnome-shell[2836]: Obtained a high
priority EGL context
    May 17 12:07:36 tr3970x kernel: WARNING: CPU: 31 PID: 2836 at
drivers/gpu/drm/drm_buddy.c:198 __force_merge+0x184/0x1b0 [drm_buddy]
    .. lots of warnings resume ...

IOW, it happens already during the graphical boot before I have even
typed in my disk encryption password.

Then it starts again when gnome starts.

I just checked: I have exactly 8192 warnings from the early boot
before the first gnome warning. Which sounds like too round a number
to be an accident.

I will try the patch Alex pointed at next:

    https://patchwork.freedesktop.org/patch/594539/

and see if that fixes it for me.

                 Linus
