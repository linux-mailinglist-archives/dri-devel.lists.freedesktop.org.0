Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B09B87CF6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 05:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8010E0F8;
	Fri, 19 Sep 2025 03:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BRV3taMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06A10E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758252609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hARynVBx6wUtc+ogEnVgwz4bGXfrmnzWAy4AkQM2lGY=;
 b=BRV3taMjaj6BLA9jjpCNUV6gIcMI0KA+jvcMdCa7ebH4GKMAeGVvV1AB0iOH5aZgjBNw/Q
 sZIYSu/4JAxaRI87WEh6ynGc3kBInGziCkXonqKOsw76Y2JydRJw3TfBs03/TFxQTD19U8
 jSv5XF6W6PFOi+D99JTwBYCDVbKyyi8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-bYKYwxJLPZ-5VWtN1FEVjA-1; Thu, 18 Sep 2025 23:30:07 -0400
X-MC-Unique: bYKYwxJLPZ-5VWtN1FEVjA-1
X-Mimecast-MFC-AGG-ID: bYKYwxJLPZ-5VWtN1FEVjA_1758252607
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25bdf8126ceso34839175ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 20:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758252606; x=1758857406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hARynVBx6wUtc+ogEnVgwz4bGXfrmnzWAy4AkQM2lGY=;
 b=UAbzKP0qEktYuvMIyPWMwU0Jw59meoljN8+KT/0096I/9JW9ASXr2ZPNSZIPCZp9xs
 zPiMU3B30y/j6+sBKXZbJZeRTR7hVrSBvnmROzeqkr3vwDjZqfD1am/x86pjsRNeCpx9
 pLzSQPLY/wbJKj+r0TukUkyGyoilAHtl1iwux/KwfFfCRE8lh45/6Kc2x/KRncbEh+YZ
 /XjY4VetsLBAEIExAqh0Th9snbiBk55bOiYNw+vbARmVroP9l5ZwNCKj9d6wpiDsn3XP
 WI0LXSth05C8HMYQMiQL3Bn5OH7D9mZeKsniTbyCRcZ/OgKTClzdq3xS2BHTgLr1RqSy
 xaZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW7jGlUd/I8CvFslnO0Gcsv1M5LrOc8lOVmfoA0Ca3Id3ez0npruUjn7szBUwaHtA/Ret3wcpuiqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylUZRLwLGhEcehp5f/b3rhGVeefYI0jZgKU7FCg9s2pSLdu9qB
 CcyqhoEfVKELB//hDb2j3PyOVfI5jO6TN2IVJC63JOd+fM5wyd0tFcqKJ2IqraYAKHEDtXZBv81
 iinvWDgSRxqlMhqyoFxFGtlYPJwnLs9s7O2G/alPvhNujde3toW3iKqfqTcvawzGB6PiYeg==
X-Gm-Gg: ASbGncvtWkgSEk/xPrYZTiS7+XgchvYVvkIEeyTvyYOSYGFEygtYziDWXfvQY2AZzci
 lNHLfitmbq3X4nPoieteLricbQW/FC98UQLDyXsk56/BKrm6x5hz14j559vvtRFN3b+XVxz7WZ6
 tMKI0F/qlQjG9d/SF7dXKf9jXnUVGp0hh7wu6+TfUehGnbQVor6KpbdXCQYCO1BHF/UAhBZfXsw
 4V5mfHeDxXrNYYGrtBNcWq0eA8nFSD/PdQ5ChA5LRVAIWeuLi9qfCJLNJgxmZMSkp0KDb4lFrOQ
 ssgka53IsqbH4ARpXxt2kYUn3FBDkfvWzJs=
X-Received: by 2002:a17:903:b48:b0:269:8c12:909a with SMTP id
 d9443c01a7336-269ba51175amr24401405ad.31.1758252606567; 
 Thu, 18 Sep 2025 20:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsOZ+qyws+SGDCdwtAw9gyecdBjV3fndhavA2LPihQIkNaarPBI9MMby+SKHSIxbr1bqlpGQ==
X-Received: by 2002:a17:903:b48:b0:269:8c12:909a with SMTP id
 d9443c01a7336-269ba51175amr24401005ad.31.1758252606138; 
 Thu, 18 Sep 2025 20:30:06 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-330606509e9sm4054289a91.9.2025.09.18.20.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 20:30:05 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com, ian.forbes@broadcom.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next v3 0/1] add drm_panic_support for vmwgfx-stdu
Date: Fri, 19 Sep 2025 12:29:29 +0900
Message-ID: <20250919032936.2267240-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QEr4t-SHlwl8ror-ckrRHDbXv3PJ9e3lsvlJ6F53w2o_1758252607
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic support for stdu in vmwgfx. This patch was tested in a VM
with VMSVGA on Virtual Box.

Based on the feedback for v2 patch, I've made the following updates in
my v3 patch.
- Use MEMREMAP_WB | MEMREMAP_DEC flags for memremap
- Use vmw_priv->initial_height and initial_width for sb and VRAM
- Move all panic related functions to the vmwgfx_kms.c file
- Ensure if the current display unit is 0 in get_scanout_buffer()

I did not apply all of Ian's feedback in this v3 patch for the reasons
outlined below.

> 1. You can call `vmw_kms_write_svga` directly in `panic_flush`. There
> is no need to mark the buffer as dirty or send any commands.

In my test environment (VirtualBox), the panic screen appears unstably 
without dirty command's submission. Without it, the screen sometimes
appears immediately as expected, and at other times, there's a delay
of 15 to 20 seconds. I've also observed that it sometimes only appears
after switching between the VirtualBox console window and other windows.

With command submission, we can stably get a panic screen. Even if it
fails, we may get the panic screen ultimately. Therefore, I think we
should retain vmw_kms_panic_do_bo_dirty() to submit commands.

> 2. The format should be hardcoded to RGB565 to minimize the risk of
> overrunning VRAM. Adjust the pitch accordingly to 2x width.

While it's possible to output the panic screen with RGB565 by adjusting
pitch and width, and BPP on the (virtual) hardware side, this approach
causes debugfs to fail. It appears that the BPP must be reset after the
panic screen is displayed, and there is no way to wait for the screen
to be fully displayed within the drm_panic handler code.

In my test environment, as VRAM has enough space even when using
XRGB8888 (32 bits), I think the risk of overruning VRAM is low. So I've
kept the default format and CPP size.

v1:
https://lore.kernel.org/all/20250901083701.32365-1-ryasuoka@redhat.com/

v2:
https://lore.kernel.org/all/20250908141152.221291-2-ryasuoka@redhat.com/
- Map a scanout_buffer to VRAM in .get_scanout_buffer
- And then write to VRAM directly using fifo in legacy mode to avoid
allocations or command submissions.


Ryosuke Yasuoka (1):
  drm/vmwgfx: add drm_panic support for stdu mode

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 165 +++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +
 3 files changed, 171 insertions(+)


base-commit: d41c79838c47bc822534cd53628fe5e0f8ad2424
-- 
2.51.0

