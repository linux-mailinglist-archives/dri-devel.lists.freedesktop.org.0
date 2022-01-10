Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B398A4895C5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B83512B59F;
	Mon, 10 Jan 2022 09:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7DB12B58B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641808590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ObCOlx7qc1MuxpL5+ry8PrWxS3J2SNPySVs4WNajgno=;
 b=XoTCjaIPiKWFxAqq+erF3YVXnZSX9o1aEhes0hynkcVrr6jGaXCB7Fa9kCUehFN1dYV0ZN
 Si5l2FT3GNu45Z2uf9HVvSAR7BQyXQFr8Wq4R+8bAiFAm2zakB+3BrO96qGKvvXPvoLFbn
 O3Jcd7c6cvc9JrD9fdgx2+uAAMuJ39M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-uQaafxRHOPqOMX_laFzhkQ-1; Mon, 10 Jan 2022 04:56:29 -0500
X-MC-Unique: uQaafxRHOPqOMX_laFzhkQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so6107486wmc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ObCOlx7qc1MuxpL5+ry8PrWxS3J2SNPySVs4WNajgno=;
 b=U6VPbknwDiCevc/BJ3kamWbgcChLBBZ1lJBQ5L6VOAyWmeMSp2bqcA3J62UxY2RX+U
 AZguX6UoflsI5P3lqXavAh4p/PDiPZv7zfjOmVQhWINswXWcMEkRU+C6glirJxyvcrsd
 STVijqVj5mhZhdFiW9/TAdKpUvuCyCs/WJNUbK4sVZZu8+E8ATxrEeSdP0tfpErRc9IP
 vlr981CqafvodiABOdBcwc3Nf8HMVjv2k2/uPHF+VEmCD7VqK2FLqFJkmTjtVkLl9Goa
 fFC/JbwlSDuArMtw/HC//zaMB0+iRm2br99xPI6s7mvBXV/FwmFJyDzpupxbbpglpTd5
 UhCw==
X-Gm-Message-State: AOAM5331uFaIhYfaLMBA0y874BmnPwdPicVQksFsqzUnZ1J/+VUSwdT0
 51n9BrgifyFRMcbL5vMwD8PmTO4BCyZGAgv/P4k5wQ+n98ny0rhFuAjlHYops4fKvtq7lY/BCin
 lsCjJdUgPISlO3SdamMth53lKRHDa
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr62811733wrd.636.1641808588374; 
 Mon, 10 Jan 2022 01:56:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGrDXSR/pexIPk1NzHcVn2qTkgOkF6tU7OxEDfgPSVggBPqdm80ZGadCbvMnDG9B5WHjpKYA==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr62811720wrd.636.1641808588144; 
 Mon, 10 Jan 2022 01:56:28 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b13sm6315167wrf.64.2022.01.10.01.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:56:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] video: A couple of fixes for the vga16fb driver
Date: Mon, 10 Jan 2022 10:56:23 +0100
Message-Id: <20220110095625.278836-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Kris Karas <bugs-a21@moonlit-rail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series contains two fixes for the vga16fb driver. I looked at
the driver due a regression reported [0], caused by commit d391c5827107
("drivers/firmware: move x86 Generic System Framebuffers support").

The mentioned commit didn't change any logic but just moved the platform
device registration that matches the vesafb and efifb drivers to happen
later. And this caused the vga16fb driver to be probed even in machines
that don't have an EGA or VGA video adapter.

This is a v2 of the patch series that addresses issues pointed out by
Geert Uytterhoeven.

Patch #1 is fixing the wrong check to determine if either EGA or VGA is
used and patch #2 adds a check to the driver to only be loaded for EGA
and VGA 16 color graphic cards.

[0]: https://bugzilla.kernel.org/show_bug.cgi?id=215001

Best regards,
Javier

Changes in v2:
- Make the change only for x86 (Geert Uytterhoeven)
- Only check the suppported video mode for x86 (Geert Uytterhoeven).

Javier Martinez Canillas (2):
  video: vga16fb: Fix logic that checks for the display standard
  video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

 drivers/video/fbdev/vga16fb.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.33.1

