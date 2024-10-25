Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05699B0D5B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C310EB79;
	Fri, 25 Oct 2024 18:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aPFaWPMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50610EB78
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:32:20 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso311197166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1729881138; x=1730485938;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bzuNw67+MpGyTXn9LaJ+2b1si0MHMNXbchvz8Oa27fU=;
 b=aPFaWPMveygb/EtvV0VdEAKyaQk/N5jd9RahDYos2K8dyl6YXTO7ECo2Q8n+myLzp2
 J/9Z8ZNtBKJFI40Verdt5t6mV1wMrYEjS6Og4gwl6LzdD/0OSUJ8oks2Lor2fvCV2NNM
 02ZAsFAUMxngB0hEx6y0oCUjt+x6GOA8hAlJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729881138; x=1730485938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bzuNw67+MpGyTXn9LaJ+2b1si0MHMNXbchvz8Oa27fU=;
 b=njQ5yvUtNna3vCzAbcHaSYkeZDQTvyLP/3+mgD5C3KlwR90eipJrDJxMf22wbdBqx6
 pSC7xjL9FfebZxElB0IiQRufjqJL12xdCYj/54dTYYwxKoGBHWoKnr6DsYldAgpvxCtM
 ACKUYJl4o/SPdpO8mvB9WUdzDZJYfsphZltHE/USAF5Ff2WdvC/Q8NlTpFIPvOcyXGb/
 kY6cAil2Nr4X1cLPN2NvoNk14OYebiPdqGXpLdA6CbkcegyctXKHoadkDNOfp3195WJS
 QRI6QVgIZ+EXwtvulMtObZaEaFv0EzShTchSQ8kECsbd1mnCt4Gf/YkyHblxhiiL56ze
 fkTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6AulspWQby9xQWTtTeoJtzA1C4+PG9HyyiXn3rCByLoOsj4kyJVH/7h30mRvByGl9x92pykexZYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjyQtBakzD6Pa31rwMBc/Xcm4v6UVsLaWcpIQaYqdv2t1sUzMy
 aSLnBNy0X4edMgnrFRyFcQAenfzc+1ekMliaWlEq4QpcEBR4kUFAGXtybN7f7hTsPQ3tTDsh/HN
 xFTM=
X-Google-Smtp-Source: AGHT+IFRN4VOa47J+qUNVgH5SuKyEhSblRWh3XyCo6lcrONjrcQmBtg/zCRdYRY8lwHmQByGgQNTtw==
X-Received: by 2002:a17:907:ea0:b0:a99:f9d6:5590 with SMTP id
 a640c23a62f3a-a9de6331185mr5152166b.60.1729881136562; 
 Fri, 25 Oct 2024 11:32:16 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f028e1asm95774566b.55.2024.10.25.11.32.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 11:32:15 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso311192666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 11:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ6XFAzyR3g5kqKFHmrojG8uGNAOm4vtolrcZwQ9tGCeSJ/PeWCpLtfEXJWICCxbdMFXVsPGoK4EE=@lists.freedesktop.org
X-Received: by 2002:a17:907:2d89:b0:a99:33dd:d8a0 with SMTP id
 a640c23a62f3a-a9de5ff9ad3mr4825866b.38.1729881135176; Fri, 25 Oct 2024
 11:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <ZxvBfDuqSC_TEM78@carbonx1>
In-Reply-To: <ZxvBfDuqSC_TEM78@carbonx1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Oct 2024 11:31:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjKouRizUF97ZABtCmijjKR+sAOmWA4uiYhhSOwhxCT3w@mail.gmail.com>
Message-ID: <CAHk-=wjKouRizUF97ZABtCmijjKR+sAOmWA4uiYhhSOwhxCT3w@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev late fixes for v6.12-rc5
To: Helge Deller <deller@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, 25 Oct 2024 at 09:04, Helge Deller <deller@kernel.org> wrote:
>
> It's mostly about build warning fixes with cornercase CONFIG settings
> and one big patch which removes the now unused da8xx fbdev driver.

So I pulled this, but only later noticed that some of the Kconfig
"fixes" are anything but.

At least commit 447794e44744 ("fbdev: sstfb: Make CONFIG_FB_DEVICE
optional") is not fixing anything, and very questionable.

For no reason at all does it seem to enable 30-year old hardware in a
new configuration.

There were no build issues before, the build issues that existed were
*introduced* by broken early versions of this patch.

Does anybody even *have* that hardware? Why were those pointless changes made?

Sure, the Voodoo1 was the bomb back in 1996 if you wanted to run
hw-accelerated Quake, but in 2024, this change should have had more
explanation for why anybody would care about the CONFIG_FB_DEVICE
dependency.

And in no case should it have been marked as a "fix".

                 Linus
