Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3EF866AEF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 08:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8644710EEE3;
	Mon, 26 Feb 2024 07:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnPA6cFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BDB10EEF2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:35:11 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so351256066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 23:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708932909; x=1709537709; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pUKE/1khlR4GGOSrvcaQkLrtlffCXLvAWiv0mGgTovE=;
 b=jnPA6cFn+D6CXzdpzTAurQfOxyCOlFtYIIQ7dKUrMJ3DkMXfxaDdFEBRowcuyiewL5
 xpMCHR4OTrvIElrK/vWl3ihH7ePqL77HhMEWOvZNmxqESQOogPy3T9ld04vyKP6+g4TA
 VPPcKOIYZ/pE2iKjcE4D6Ac/zeKIO2faaU6bv71QSToUuTR02sty5wADfvIHLOzu+dzH
 3o/ho4bin1pKr5kK8rq/lads26XEB6YTfFYm8YNE6EpPadR9krjyvZnDuZdqk7SekSY6
 8XC5mnARXfsh2YEe+pGr/m2GdWhjSUIMq9v2iaI0V4BGHg8zf35I9VC3MnvhGAeyWe9N
 J8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708932909; x=1709537709;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pUKE/1khlR4GGOSrvcaQkLrtlffCXLvAWiv0mGgTovE=;
 b=MUuG/CJaaqsT8KWoomBmG7DBtlauCOL6heQ+Prn6BFXYjoP38xSPz6kHOm8zTS8f9J
 LIP14RtgE4As82EZjML5hh8trobXeAzhrNlko9bTJ/ZbAu/cdKcjrNSP1W4BY/E+h966
 3RUEZ2j1wrVLX1JbBcAEsew0xwmnf3R32jU3/mm7fVT+TZeDo+Md7zCoNIBTFe8PwSrb
 ijTJmUZW3q1SGukuVZrQrILEASU4yJRRh1QH8OpfQi+nWeFclX+nLkN3fuB4212sq8Tu
 46NwPrfAuogvoEmi2I8ejGesUTkAcj4kU/pIGINDvyr8BvrJ1vSOKJpdQXEPQb5S6/9n
 1JWg==
X-Gm-Message-State: AOJu0YzWRqfSV24QUK7uuagnPrD3PdJT/XWf3Wr1fosR3+WtAMwyNL1z
 N9AmLzCqRPU3YghgTfrBMrdQdBaA/JaTalcGxGDub0nSAVZVAeBbMOKDixDQ0HEgToLf/84dB6r
 b24V8QCdIOMz2O0wsZF22BurWTWcV8ZXvUvA=
X-Google-Smtp-Source: AGHT+IGdYY7442X7IB+5wHqUBazEOS/R4t471ccWVjTFfR6lWKE9dcS9d3GN3iEeze68s+NL2Ls5nEsFBKyFLfBsvlA=
X-Received: by 2002:a17:906:a40a:b0:a43:48e9:f2ad with SMTP id
 l10-20020a170906a40a00b00a4348e9f2admr1377222ejz.74.1708932909434; Sun, 25
 Feb 2024 23:35:09 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 26 Feb 2024 17:34:58 +1000
Message-ID: <CAPM=9txLf5E2G-afpq54A3uRVkgdjxfUznXqhXHZ_7jNrQNfEw@mail.gmail.com>
Subject: ttm usage inconsistency
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

This is probably something I knew about and forgot, but I'll ask if
anyone has considered cleaning it up (or maybe I should fix nouveau).

nouveau sets up the resource manager using vram_size >> PAGE_SHIFT as
the bounds, but the bo sizes are in bytes, hence usage ends up being
accounted in bytes, so we have usage > size which looks wierd and also
caused me to screw up adding an ioctl for userspace.

Should I just make nouveau use vram_size instead?

Dave.
