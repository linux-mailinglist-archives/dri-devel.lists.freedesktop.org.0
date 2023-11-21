Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DF7F3A6D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117910E2DB;
	Tue, 21 Nov 2023 23:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B5210E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 23:45:40 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5c9ea2ec8deso31536897b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700610340; x=1701215140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/nq/TjG7rk7+xffRTTuBE0xXTcJ6woqoDgmivDyuJU=;
 b=KEcds9gfG+ISAqxO0oPV6y6ikDpLK+Zask+q9h/XtyODCUgqCW8Sq7peBIT+QlEdhH
 QATy/F6s4cMDa+d95Umh69qiR3QJbyC3lxhZgtKGGtKDYX9cmvReDvB1LeQcsL9bFvKt
 1C/mFmAgFuoa/h2l0xQHRNm5RiwObduD1Bh+wpjf4GTe40F0HYxrCFVrn+ug2WRm9xsa
 Gzj4LFjnxHddA3UySOue/o9e8NW8398kTLmlte2YmajyjXCfnsRugAYch8wJpDh6nVf6
 ZQXP9Do8JXeyMRPo7Vbso30dDVbRV54m9cBPg90aFn7nwkUeTpmNKFFdSSx8PI4qD1Ld
 OPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700610340; x=1701215140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/nq/TjG7rk7+xffRTTuBE0xXTcJ6woqoDgmivDyuJU=;
 b=CRqp4JoGO2iYUII1cvNBENQXSUmf738vnHgDlctdyG4jlOXvEDYb3jORHD7Rmuk1I6
 mshzIhhDDlo/nTipd3Nc/sp+ltTV4mi0cYL1EyFfnMt1sqKkaI6rC5OE6mMzQyFkmUz0
 Yj+UT/qAGVpnEJQ03cp8ZHhxL1L4kHQcSogH+Acnv6amGpsmu+j4J8l7rYNVxoRsSz9+
 0fSWO+Ke3QaONdpftUofd4Md8w4J2uZjIjdMZLmepWaXMOL9W7Tl5dC/6qMvB5Hks5hk
 Tpt/K6qvGCnitZ87KISikL+zB1XZOGKtFWQyF4GTtqjm9RRy0MeB1IIvfk+k5j5ao4ga
 97Yg==
X-Gm-Message-State: AOJu0Yx6OHQ3XCI5YKcR4ORked+1uZZhDfqDQ5b3zPmZjvwdlUrMnpJZ
 qMUDrLnwsJmpfzDaVEpILcQkb5oyfmQvSraUa/E=
X-Google-Smtp-Source: AGHT+IEjEi3+lnREUELpm5SMBsO3Qg61OF291Hs70QV3a6TayvYJ13WtCdBT0H6J8bJeFx6RGEQI09H5FYOeJU2bkkw=
X-Received: by 2002:a81:4e92:0:b0:5ca:18e9:8ef8 with SMTP id
 c140-20020a814e92000000b005ca18e98ef8mr619477ywb.28.1700610340028; Tue, 21
 Nov 2023 15:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-11-tzimmermann@suse.de>
In-Reply-To: <20231115102954.7102-11-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Nov 2023 00:45:29 +0100
Message-ID: <CANiq72ndeK8etkQD-hM01ZdOP-tEBwf39xZBVzeLDF59rDSiYw@mail.gmail.com>
Subject: Re: [PATCH 10/32] auxdisplay/ht16k33: Initialize fb_ops with fbdev
 macros
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 11:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Robin van der Gracht <robin@protonic.nl>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
