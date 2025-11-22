Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4313C7C134
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 02:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1959810E01F;
	Sat, 22 Nov 2025 01:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I+QmDUUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2797010E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 01:16:24 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so553974366b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1763774181; x=1764378981;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r+0S1SfaAKrrUi8oTGfiHDmla6v93hlgSLkVFIqoDss=;
 b=I+QmDUUkxbJhr2dM0pBtXgIe01VO/b21SV4VAG6qBLo20BNOdKZSht91piR3V536im
 QYxA8JfFNW9qSJ6yP+iejf2VLeq5Igub+ca1YD2lreINBMqlmYBgvadbNdcPdz6L0jAm
 Sz8+v6eUMkvbmMk8rvo8LlaGbrX0Lxj6jUUU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763774181; x=1764378981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+0S1SfaAKrrUi8oTGfiHDmla6v93hlgSLkVFIqoDss=;
 b=tqGDvSgX12zchirMM8UJ7tSLIrJol2Bc/98YXHMmFtjqnZETisA50bqJILyDJt5kVq
 GGCguccB3p8l6D7vArSLWT1G7aVYB00lRP9tnpQlRIiAutiPcGIBIl6Qrjaq2GLOhBAp
 AfUdAqIdMO4Dv7MJ8LNbNHUhWayFGwDju+lue+ve9v9WhQTuynZ4ZGoQ1cc7xSQSqA3T
 5vrjV6UROtHKQ1BkOGmpB93Y2tL+heSmAX82r5IlZJXC6sTjTw7+i0f+FVqXn8A89em5
 J67k7HejARK9ib4yyiE5MErAj4txAciGPpQhGEsjaqhvw9ACt7FSyLGx6qAX4elEkJuW
 stKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqOc1ernkKoh2qev3wf/kBc/VZPb5lohdDFNaOBac0Cow6mlm4US1/HWZi+L14vNP6Bx1cBskWD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVm6LRnh8Q4QVjZHhrDo5Fx2/qI+g5GAyBE7lFjD75Az62Y4NB
 6kizOQ0G//zYmOpeyXbnbAwMZlBUCjT6EUWQAVqpss96X/Dv5cN2L3CNvtuIeX2Ku0gUjz23lCk
 3+MqHiHA=
X-Gm-Gg: ASbGnctKqbl+n9H08CVZVmCAGASC7wza9+IcZeufyFlQnoOFy+tOACU0bmfaLBsgBgA
 g+bVn9aj3P11fQeF04gokAEj4ybspmjjAqPvnsAr+wcL2VohgWuoor/RAMXk2WhpHecPFyH4ZP8
 AFXGHHdfFSi9Z+Dpr/d/2phweAcijnhvyWUdvr7qbATRjxqsH8V09q9oHWzSmjeEJ3GVfs/BT69
 4tYH0VLd19/xZyVrW5522N3RSqcFbpXfmVCvbyavtIMmrucdPjwbuSYQrwvdRPgBI5xUmBZ7DZW
 XH3ui87XN/wuR6A/byLiTBXB2RZoV/v5hMR5XYYZI7nykgS/VluPrbqpKzM1uoK/bQ+gS2RG2EB
 3ebZYBVsJikupgN9xQF2wKvEe5KUVFpNkOSr6rg9J6PlPo4OEkNkZeIw4g/Pp34T1Rf46mptLlw
 ttVxj9P2COxOKsBhhOFLyPmxXAr5emcuiDsmtQtoluR1vIv6QmOx6tPi62tIPo
X-Google-Smtp-Source: AGHT+IG1cK+8Z9jUt7wFaZ54ynva62q3ENxpQJzaH/L8YtOpM/KovA74tcFUoO4CF3qq3LBlcrjaxA==
X-Received: by 2002:a17:907:9811:b0:b73:1aba:2ebf with SMTP id
 a640c23a62f3a-b766ed83649mr579544666b.2.1763774181490; 
 Fri, 21 Nov 2025 17:16:21 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ff3bbesm579125166b.51.2025.11.21.17.16.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 17:16:20 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso3318899a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ1en7B6qonlBlzyjJ28QTLFJ1rjs5sfS18tcwoNCyerJrlWbg6L9u8W9cxawKT06pBPjrLUKFzp0=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2109:b0:641:270:2c8a with SMTP id
 4fb4d7f45d1cf-645550d6130mr4510255a12.14.1763774180582; Fri, 21 Nov 2025
 17:16:20 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
 <CAHk-=wiBCPL+zeKVF7zYVSiymjFRmgunCeyryUhoZNBR06sR-g@mail.gmail.com>
 <CAPM=9twe8tCZM57YarzoAcgV-hWDVpbBsnZiYCMTk5YtVfJjeA@mail.gmail.com>
In-Reply-To: <CAPM=9twe8tCZM57YarzoAcgV-hWDVpbBsnZiYCMTk5YtVfJjeA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Nov 2025 17:16:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiMNr+wmSk=WPQ0B_wfWvzeW8wQByGKNui7z3TsvBUBwg@mail.gmail.com>
X-Gm-Features: AWmQ_bmwN4Xc3HQSnOF3MIKWBdxRy2J0Gn5EynTio7KSzu_oQXSIft7NWYh5ixI
Message-ID: <CAHk-=wiMNr+wmSk=WPQ0B_wfWvzeW8wQByGKNui7z3TsvBUBwg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.18-rc7
To: Dave Airlie <airlied@gmail.com>
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

On Fri, 21 Nov 2025 at 13:24, Dave Airlie <airlied@gmail.com> wrote:
>
> gpg2 appears to be sending it to keyserver.ubuntu.com

Ok, thanks, I have your updated key now.

            Linus
