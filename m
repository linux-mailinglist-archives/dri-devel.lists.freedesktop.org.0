Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83799777F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 23:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFA410E0E4;
	Wed,  9 Oct 2024 21:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YbjKHazB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8B10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 19:38:34 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-2e06acff261so159352a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728502714; x=1729107514; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OH8f2UfHQLS1Uk4OTYmpWefs2ZbPXSwJYoEvFZGGKqk=;
 b=YbjKHazBvG/h1oBjBiNGB4oL4LZrr/TKPwjk38NqB9R1UMhDOze62kF+Mh7v/GFRuh
 2kJdJhw9y0N6VLuopKlwh4XhjH1Bm6qpQLWsO89XrNaHVgMuRSo9mu+iFISxE90MnDOX
 O5EcVMhnByJKkZuniO4s21VqWCcTiYKwHzL1eZ4+95jnqWMt9rEHAi3FZ3id7ttSpxyC
 5FKVJlp+sHB2nTPe66dCdBuPx7GSPmuVNAwyYGXArofzmiVAZAIUoH/drMJLtC1vhoRT
 IbZ0CAtuVzzTPgnBtFNyHQDYHf7I6sECJ2a965ShxEEj9nDF4dmpsyWLW8GwdTfuJQOL
 7xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728502714; x=1729107514;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OH8f2UfHQLS1Uk4OTYmpWefs2ZbPXSwJYoEvFZGGKqk=;
 b=phCrieezwiF1jA6yilVg2D+ipf7tulI1Q3WtARL6vAYwUAgAPT1V6iB4E1XQ0pLAm/
 5YFWYSkYVrvww8L9an7XPJE6XjHkCeNv6BNEgdXUR+chUCLgAH+MHEejrHr4CkgQ6KSp
 VLBp1DvXJwLKewHHKm0st0rOUzquT1+dIJBpicxeMepqEBuXXaw/ifZsO4E+6yxrFxds
 qWV8/WTtzXumm+oR4K4dDG7GYTm3OEaZ2MPU2fhd8BQ1cooqu21kwkQIvGVVpbDw7DUC
 hPJJThrGsv0P9ap1s8RGfrr/PMp2QxdwNijSDJgGWLijzH69Sq02JUBHqbg6Wl57QK6x
 hpjg==
X-Gm-Message-State: AOJu0YwFc0SzbcZ3yYLnsrjGA66AoG0mXgWCMbCWx65D9iShgHOGc31a
 L6BcNojMYMJ5/Y2VlCv6PK5AtCoiOGerBDMmfE4EKy+SgD9IBiwXbH1GiyRrkwU8XJpeh7WKegt
 kAZsyGILafwCj7CYaPNDAgJyx5l0=
X-Google-Smtp-Source: AGHT+IFscBjbdJY8WUMu2a9M3Lw5+ijAeq1AJVFRe1DLyGQtFmyKNjlYSpClZKD+5rqAFqnfaJusSSCN7a50SFd1FMI=
X-Received: by 2002:a17:90a:be11:b0:2d3:b357:7857 with SMTP id
 98e67ed59e1d1-2e2a23301cdmr4240080a91.16.1728502714084; Wed, 09 Oct 2024
 12:38:34 -0700 (PDT)
MIME-Version: 1.0
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Wed, 9 Oct 2024 14:38:22 -0500
Message-ID: <CANdh5G6d823W0-LxWqWE8RnXc8iX97aHUEd2ZFL-=7++UpY04w@mail.gmail.com>
Subject: Question about possible NULL Pointer Dereference in
 hx83102_get_modes()
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Zijie Zhao <zzjas98@gmail.com>, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Oct 2024 21:30:23 +0000
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

Dear Developers for DRM PANEL DRIVERS,

We are developing a static analyzer for Linux Kernel, and we are
curious about the function drm_mode_duplicate() in
hx83102_get_modes().
https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/panel/panel-himax-hx83102.c#L567

```

struct drm_display_mode *mode;

mode = drm_mode_duplicate(connector->dev, m);

mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;

```

drm_mode_duplicate() will return NULL if it fails to allocate memory,
so NULL check is necessary for this function.
Directly accessing 'mode->type' may lead to NULL Pointer Dereference.

Please kindly correct us if we missed any key information. Looking
forward to your response!
We can help provide a patch if it's a true bug.

Best regards,
Zichen
