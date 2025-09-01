Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A375B3E7E1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CC010E0AE;
	Mon,  1 Sep 2025 14:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MjgC36Iq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C08C10E0AE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:52:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b84367affso20586795e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756738336; x=1757343136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7w1Tbo1J3hCx1txGwhp2+EuzkbUEfr2XiGFdNUS8Gbg=;
 b=MjgC36IqDs2I9ocuzmKr6CETWOiixRx/Y1VOWvd9xBYZjomm45VCg1L3mlt8o0OnMN
 gMi93Lqr/XqBZ07MKzee31Q6ThniTAI15aQL3PoyozOlfbcCs1sbjDSurqRkkSXGGl06
 rTmYbrEuVtSAHUajfYmB6yGrkbuBq/tamqf5f5J3NLDxtGm2KjQ+XZwe9fXx6gaxGzOH
 bxLsA6buQ5UMiF/bdO5uKNUsdILIY7F2P8oCcDyxqXbQuJk5N97ITvSdhAuYm/xSMPIp
 TDtQDPkaGbOiTUgn8vxToGDY+FN1M7XBo3eljsiRtcH0ad7zQAWTz/svfcGpXfgEd56V
 +LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756738336; x=1757343136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7w1Tbo1J3hCx1txGwhp2+EuzkbUEfr2XiGFdNUS8Gbg=;
 b=SVT/9z4x0PoZU3XnE6OYOJ3ucWU+IJBI/xguUiVo9Dh8RlJQQ15fICjatvRm3JuLQq
 8INotqZfzabj34TpUnoDefnPtXF4FU7knvFfeK2j174vRVILGQK4KoSqJw/zqkeERSic
 gb2n832tTLlFAkTc+FxLlQ5MIVT7qtwnWK4zZpvx45jlXYBIvKrUpNrrsrYBMHSTprqm
 D5Gn+5Wionnfab3leAmfDfof1f5J3/fm40PBA1va4y0XX/XXlUshHkkg23l9dJ6OnUxY
 owCtaJCeKYBeIw9qZws8C7JDkbaAN2Ru7synXMKTBAVH4XjQWnTdaYvGo6jOPKuFWxdj
 M0BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAuFdROFaT7DIln4uv7KrrWBhtbTMka/Rr43WWaTlyCmMpnfk4b6xvyzd4ayWwzqFSSfQtMVq+LqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZfpLs0PRShOiexuhGZJymbA3ugDKpJa9KGXC5HTLmecxKCk+w
 DgSVeUxOG2G2Glq/Q+K6AdyX7eqvgYMHTNVoIoX5dsIOVGTZW70s7oLG
X-Gm-Gg: ASbGncvEDgiGAhq4ZPYl4lM5nsuDIkzabZyb2I8cLOvF3flYi0Yz+gtKicDYV8BWVOH
 W6r4tG06t0WW51jLRKs0gHEUJOjaug4lfbhKq0UZbTtnf3hCHGjUcdrdVAl6ZueSzvtLxaE9gTn
 QzslJ9lWcPgOZHOrR/KE1WkJJGjyPV6kHAxwd7iCzz6hKdoO2JnER4synR7EGyme4JheGmQGPzC
 VIP4xFsU12m4+aISs2mRtP3slxCAdzwNAxsL3yvvFtbvEcMeAuAY3lnyPwBwFvCK54Ndvx4pi3M
 X7eWQ6Y/oYHhaUDQYLsJQl6nvdNTJhGIbezfYQahYzIZe8l4oKRxJN5EevAdY6XW2BmTmA8SDNZ
 Si1NIZU5SZvzlppHj9jJsZk9vjdIA
X-Google-Smtp-Source: AGHT+IG+SvqNSIccCz0rsXPSX3cW6clNxgls15pKY4xfgXvdWIzmy6IrSvkz4NehpGFyAP+osZ/C2g==
X-Received: by 2002:a05:6000:2409:b0:3d6:89f0:f348 with SMTP id
 ffacd0b85a97d-3d689f0f684mr2925978f8f.15.1756738336309; 
 Mon, 01 Sep 2025 07:52:16 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b69b7529asm146874265e9.0.2025.09.01.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 07:52:15 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: [PATCH 0/2] drm/vkms: Fix plane blending z-order
Date: Mon,  1 Sep 2025 16:52:05 +0200
Message-ID: <20250901145206.51213-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
References: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Louis,

I already made some comments about zpos here:
https://lore.kernel.org/dri-devel/aJDDr_9soeNRAmm0@fedora/
But let's start the conversation here as well!

> As reported by Marius [1], the current blending algorithm for vkms planes 
> is not future-proof. Currently the z-ordering is only garanteed by the 
> creation order. As the future ConfigFS interface will allows to create 
> planes, this order may vary.
>
> To avoid this, add the zpos property and blend the planes according to 
> this zpos order.
>
> [1]:https://lore.kernel.org/all/aHpGGxZyimpJ8Ehz@xpredator/

In case you want to have a look, 3 years ago I sent a patch adding the
property and blending following the zpos order, but it wasn't merged:
https://github.com/JoseExposito/linux/commit/befc79a1341b27eb328b582c3841097d17ccce71
The way "vkms_state->active_planes" is set is a bit simpler, but it might
not be valid anymore due to code changes.

About this series, I didn't have a chance to run IGT test to validate it,
but in general your code looks good.

My only question is, how do we avoid breaking changes in the configfs side?

For the mutable/immutable configuration it'd be easy: We set it to
immutable by default, i.e, when the user creates a new plane via configfs:

  $ sudo mkdir /sys/kernel/config/vkms/<device name>/planes/<plane name>

We set "planes/<plane name>/zpos_mutability" to immutable.

However, we don't know the plane type (required to set the zpos value) when
the user creates a new plane on configfs.
Therefore, we can not set the correct value in "planes/<plane name>/zpos".
Have you already figured out a solution for this?

Jose

PS - In case you missed it, I created:
https://github.com/JoseExposito/vkmsctl
I'll add zpos there once we support it in configfs :)
