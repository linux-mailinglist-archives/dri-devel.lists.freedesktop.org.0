Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD96C24DF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8510E336;
	Mon, 20 Mar 2023 22:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E484910E336
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 22:47:11 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id y5so15100281ybu.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679352431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=esp6cKP39SW7VrbYJYp1ef7KVmb7Hzx1oU28AkM81GQ=;
 b=BO/e58vbrVMexyaPkEDwfd4rp7kpkgQ9Xm5KkkEDqA6HV2pwD8EVL3BUlKn+jeGhCt
 wIQmSyzLblivHG5fhj1/i0DXlkUett5ufb6cl3s8Yx+UsvhnC3L1qitrfiTgBhEstf73
 JlbAiiOavPVfqPdRtDkc+xr3qUfL6SmAsx/iBge5i/ttZZmmK/ujLTp0+Blocgp9yFEF
 uAzbwrWBKaZjC7uNhFt95tKJK/73EpJorvkU3kAxmOOGO5aoIdf8wbWb7Ht97kTJ/Xa+
 3siCHrZRPrCu7uUpmOinVikYbquPc9XAhcb+knxz9rVGSv5FMQUQ7DF1YH/Aw16W14ax
 Yu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679352431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esp6cKP39SW7VrbYJYp1ef7KVmb7Hzx1oU28AkM81GQ=;
 b=Wbk8xdHLv3EvxL0bR0YvwYXhqgWMTeJqPp4Bdalqp8YMdSOlnficirsHPf0finoc+3
 +aSnzrv/mBh3XbEnpf+93MrLjpRPoTumnTRqgQPPL4bTWwlHDsvjZDhD7RW/wXCZG463
 +hLtnHRrpU0XemNfIPuIh/PPUAuorUQ3zlY8kskUIBcQCjPTg1z8ePFQHImkXJqI6lqT
 KV1KcLbhhZr67JD0PZ0mTko939+MT4XcNRsej4O8Bs7pwdpNg/+lCkCHFZoFJUwS9+RB
 82bEYwDua6r8ceHfc3ildiUMxKy8Gx+CGCx6a2w/gXvXWF1jtH7d75xWIrGlqDMZepuF
 vicg==
X-Gm-Message-State: AAQBX9fny298gLHuBm0hPbdYhbE3xRn+H6QyXQanpn5XZMAb6XJwuYft
 PQAr0dGH5WvGS4YN0SVJqtE1DwpTe9LMS3guLIk=
X-Google-Smtp-Source: AKy350ZUoZRDNsaj9I3L7cKJv46hjwFlCwxqFtd3K2rAVGd1GDOWL6YHWGaoijaFJJNPVuCMDnyxj8XxFtrzfVpMpmw=
X-Received: by 2002:a5b:60c:0:b0:a0d:8150:becf with SMTP id
 d12-20020a5b060c000000b00a0d8150becfmr76755ybq.13.1679352431015; Mon, 20 Mar
 2023 15:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230314211445.1363828-1-zack@kde.org>
 <98e9cc9a-6986-4425-3906-03dce337a0df@gmail.com>
In-Reply-To: <98e9cc9a-6986-4425-3906-03dce337a0df@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 21 Mar 2023 08:46:57 +1000
Message-ID: <CAPM=9tyLPQ2SEGbsHXJcpDxW3AXY7sA0wDcG+5szQQqRf3swZA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
To: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 at 01:25, Martin Krastev (VMware)
<martinkrastev768@gmail.com> wrote:
>
> From: Martin Krastev <krastevm@vmware.com>
>
> We reviewers botched that one.
>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>

Can someone land this into drm-misc-next please so I can start
building with clang again?

Dave.
