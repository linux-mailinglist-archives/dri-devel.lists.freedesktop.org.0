Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65370C186
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB1E10E34A;
	Mon, 22 May 2023 14:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4EB10E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:53:38 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-561bb2be5f8so76790607b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684767217; x=1687359217;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KwHs2mmm/VCA5tPNytFJHpRKQgPTEV4nLV+muERoySw=;
 b=YWo7Yi8c0NVlcU+X95JVuKAt9JWOLF+5yIsH4eRsoLE7q5ZyzaFpeT3oyiShaxlkKH
 5cPvKEViyfBanXc3lqFg5UYexSFIWY2tXfaQCkJIf7Z1UBeGgHjYZxZasyPSzGyXvgx0
 zEh7h/O89jbWDN4FIha6UX/9EHD7RsxFaGFpYPkuBeFgyZVeHnEhMrb4mDfSC1yM9mXS
 +nBKqWH7PHsxUZ4tzj1RItV2KxasPH4oitQHa5g/FZqqDxgLYZrnR6KKDKpGyS8V7opq
 dRKJYYdkC409EZVAolKaLsvlTLbCREaEEC9gti/xDYQuEljYbCa8p4OyzeBcTsLrgJ6z
 UgaA==
X-Gm-Message-State: AC+VfDwAumgobPAz9cnEynJpt+13EABAouAL/tMepax+R8EfC+Aey4eE
 GjC4diR4A6lrynr8Xb0W/E8VLps2t80TCw==
X-Google-Smtp-Source: ACHHUZ4ptPdkqJ8T8BsDgP3jdf5F6c+FJiKUMWiauxxsWWBiIJ+IkmCqbHvaE4mTLOIvJ+zGDRyQPA==
X-Received: by 2002:a0d:e886:0:b0:55a:679f:1d90 with SMTP id
 r128-20020a0de886000000b0055a679f1d90mr11418809ywe.2.1684767217075; 
 Mon, 22 May 2023 07:53:37 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 h124-20020a0dc582000000b0055d8768408dsm2076607ywd.105.2023.05.22.07.53.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:53:36 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-ba841216e92so8951289276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:53:36 -0700 (PDT)
X-Received: by 2002:a0d:e087:0:b0:55a:105e:1a1 with SMTP id
 j129-20020a0de087000000b0055a105e01a1mr11675240ywe.13.1684767216759; Mon, 22
 May 2023 07:53:36 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 May 2023 16:53:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN7_bEodiW4M33JPhN0ZQPZ+Yj66qQk-OOK9ugqhhWtA@mail.gmail.com>
Message-ID: <CAMuHMdXN7_bEodiW4M33JPhN0ZQPZ+Yj66qQk-OOK9ugqhhWtA@mail.gmail.com>
Subject: Convert existing KMS drivers to atomic modesetting?
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel et al,

According to [1], there is a conversion guide for atomic.
Unfortunately the document does not have a link to this guide.
Where can I find it?

Thanks in advance!

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/gpu/todo.rst#L52

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
