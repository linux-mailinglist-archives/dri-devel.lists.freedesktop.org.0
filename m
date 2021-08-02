Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F943DDE9C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 19:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF236E0EE;
	Mon,  2 Aug 2021 17:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EB66E252
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 17:17:04 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o20so24861169oiw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XNmEhCYcavH8lUjF07r3laSZ11ZJHK1QVVxu5abkP1M=;
 b=TAL5Vdu+3qZZCRpP6g1+EmXLtetQl+wHhdkwpxsT+/fxPP6sJMH1Op+C3Ogsp5Jvwe
 qo5HznHDkKYo/uMBDKRWYsMV2JEx/PER4p3xMmU7pgvErWbBbRcBsi0B0OcI+piKnJAG
 KXs4zksTeKoQX3tFmDMRfPh4eaIMSiC2Vh5KXBo9cqFWkENxcpUnMUEH92byjofJsHtB
 yPe+FUW3C5CJiUhH3t7QmNGFUtvGOLroKgr5aabx1se/421I9qvEo5rUC7FP1QsgyoUB
 1DUNWij1xA4AbusIobhtWbBZXITS4zLM1f1SbUZ6PeOu+0zI0M6PKsRPbuaqtj+Gqzc1
 4roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XNmEhCYcavH8lUjF07r3laSZ11ZJHK1QVVxu5abkP1M=;
 b=XNcfz/JwG8fI/ab7a5S9X0bDJ8tYQh9nAZQQLcjp8At/AM3pZ9YQjFkyNkJFRBwFdy
 qnZ+C5Ej+84EGJ0CCb74xv3twuD7ylP96eqtzjQCA0ljCFe4lGMUe940KeyMZB4i2SFz
 dIDofmD8DU6QvrheyoqWYz0Z9CkUr8P163QQKMT1GaYRGQWwgarT1LMm8300G8dekemB
 9nRiICvY7mmfYXLigdgARVvMpfO30lNEfxaLHixS7b+/4AMo5PqHuNAVJNJ1cSWvaDWF
 PqQ80zdei8mb5AjnURDWj7ALLk2y+0A0y/x28fgspZZhecPG08OCbAF8Cdb5UOKN7rXA
 Ef9A==
X-Gm-Message-State: AOAM533LvvUA4ZEH/NqCNTYCkZv5q51n3d55PuvVfKKpFJxk/fmMWon/
 uG5DuTBChkADWGMswZOYJZ+Tz0v4tUG4DvEthos=
X-Google-Smtp-Source: ABdhPJz0ojc6DeWSvEDLNdpEWqUoNSiP9Bq90/S4qeCahoGj+1KUQMcRa6S+Ji4G5PJDkMs0LeWCBpPJw/xdRUnR3Lc=
X-Received: by 2002:a05:6808:1304:: with SMTP id
 y4mr11638385oiv.40.1627924623710; 
 Mon, 02 Aug 2021 10:17:03 -0700 (PDT)
MIME-Version: 1.0
From: Mikael Pettersson <mikpelinux@gmail.com>
Date: Mon, 2 Aug 2021 19:16:52 +0200
Message-ID: <CAM43=SNDAcS952MZpsiD2Z-WU9Bd0EPv=7Z86i7FGdvDtsSXdQ@mail.gmail.com>
Subject: [BISECTED] 5.14.0-rc4 broke drm/ttm when !CONFIG_DEBUG_FS
To: Linux Kernel list <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Aug 2021 17:36:04 +0000
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

Booting 5.14.0-rc4 on my box with Radeon graphics breaks with

[drm:radeon_ttm_init [radeon]] *ERROR* failed initializing buffer
object driver(-19).
radeon 0000:01:00.0: Fatal error during GPU init

after which the screen goes black for the rest of kernel boot and
early user-space init.
Once the console login shows up the screen is in some legacy low-res
mode and Xorg can't be started.

A git bisect between v5.14-rc3 (good) and v5.14-rc4 (bad) identified

# first bad commit: [69de4421bb4c103ef42a32bafc596e23918c106f]
drm/ttm: Initialize debugfs from ttm_global_init()

Reverting that from 5.14.0-rc4 gives me a working kernel again.

Note that I have
# CONFIG_DEBUG_FS is not set

/Mikael
