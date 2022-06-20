Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BB5526C7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C525C10F6F9;
	Mon, 20 Jun 2022 22:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C3610F6F9;
 Mon, 20 Jun 2022 22:02:47 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-317803b61e5so87958987b3.1; 
 Mon, 20 Jun 2022 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=V5RDlGuH4ok/wrKSfWbf4O7gqkaYA5IxNcyjXFdPql8=;
 b=PmtG4s8s1trToLWSMCoV/sYvO4m3B+ktrU4VfFrdXaGsRgBDQsiNFheTQ7AvSrtLpw
 g799ABG1IsSMI6hCIT11HS+0kpIhC3gukmRF40fxeQjdRB5QWv+eiRsjWjYJ39eSymwd
 mrJ/8Zzxi9VoWrpviiLjdLMM+swVnAqgIAA16CteArP1OYDVs64JIO47a7AVqCWpoKLw
 vsbhR5w12EgnIiC98lUhsNSdZ+u9K4iIFjJlRt8jtIzUNoH4+1/wTuJ0lqC1wSD9Ud/w
 dVpBWYUPx/gi65alabXl25xLtid9RQcVpzbTCCLcPP8FcMwZuPI4Ng4GN9eaCSbJs6SZ
 dNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=V5RDlGuH4ok/wrKSfWbf4O7gqkaYA5IxNcyjXFdPql8=;
 b=Cx4wR0IaizQVgGkRGzgQwI3s3VMWPRkQ8te1nvYypqePbzg3W93gm9StV4/QzNWZN5
 Pn1uiiQxTpJ34ZDSJ4syvr3xn7+xbiKR7YNsJv2Zx0cqS13qUQtbZxA0NBNvfWy1bIWs
 TJ/JyyosV9aN49ZujaSgEZ4ZDt/RGq7zKkF48DQnrAU3LThjToUckMKscLFbGvTKuiRY
 TeVzCQJT65ZLp83OrC/hzJjNkbly/YvnjGjoSXD6TMkzwInYRJBotQ6PM42RE1/ay+yq
 CgayY5a3LO75JS7zsvcctMBO5wZ73aio1TlCw3CwNE3zqqFGthdanqjA5v5NxZV8Coxb
 ehjg==
X-Gm-Message-State: AJIora9cn4+C1RkN7qeCNVq/64q4VGtHmZFOjNeMEDnQhoc4XjV2NAis
 jxuxiJmDs3gZOFYUqNxAMrOHWvkVklI4KXQi72hqzJlRYYM=
X-Google-Smtp-Source: AGRyM1vW6BQHFOSMp7B9RMdtpiA2jMIMw7gbOAWVz2mJqr8blkMOzPmGgsmztpN1ZMIjhH+TRYJNukG0XaIiiOGdtXM=
X-Received: by 2002:a0d:e610:0:b0:317:78a1:2159 with SMTP id
 p16-20020a0de610000000b0031778a12159mr25315543ywe.268.1655762566487; Mon, 20
 Jun 2022 15:02:46 -0700 (PDT)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Jun 2022 18:02:35 -0400
Message-ID: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>
Subject: Using generic fbdev helpers breaks hibernation
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe someone more familiar with the generic drm fbdev helpers can
help me understand why they don't work with hibernation, at least with
AMD GPUs.  We converted amdgpu to use the generic helpers instead of
rolling our own in this patch[1], but it seems to have broken
hibernation[2].  amdgpu has always set mode_config.prefer_shadow = 1,
but that seems to be the cause of the hibernation breakage with the
generic helpers.  I've been staring at the code for a while now but I
can't see why this fails.  Any pointers?

Thanks,

Alex

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=087451f372bf76d971184caa258807b7c35aac8f
[2] - https://bugzilla.kernel.org/show_bug.cgi?id=216119
