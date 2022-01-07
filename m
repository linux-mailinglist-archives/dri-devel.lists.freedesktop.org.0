Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB748763C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61C910F7BC;
	Fri,  7 Jan 2022 11:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995C210F7BC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+kcDM4DA7iF+2H6LBkZldn3r6QWbKOMJ1NrH2QklOIQ=;
 b=bMWHvDo6HAWDVzJPs6g8Bxil6a5yNSvHq4suT/yeLD0jbecW4t3WBVXhF9JMkJRRte5fx3
 gLrQ6ugV0oHnK7MP/Fbywt1zraUOngl72fxLgeXz24Shy+8hbUdfkZKy54rROo4kCge+u4
 1kHsJDfbgKCF3JztDBfeRiXCQQAhmDw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-uodOZNhKMJGmpfvPoj3AeA-1; Fri, 07 Jan 2022 06:07:33 -0500
X-MC-Unique: uodOZNhKMJGmpfvPoj3AeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2116519wrr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 03:07:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+kcDM4DA7iF+2H6LBkZldn3r6QWbKOMJ1NrH2QklOIQ=;
 b=g+gFacBD49FuWRzCAPsfvzxBBxZnWZUg4qBkQTIR15JwaXJh6JmpD5bwIUUHvBVaK4
 qdZZtpVNMSScdtGXno32ZmeNlME6lczl40NyMpB7cfPNTFj63XCHN+J6OYmXSFaSzMN9
 +IeiIeggCGgx6bgpCXUbSPGDrjLBy6J62lpyYwWMNsOfFb9dcQA+qRLMn+mQ/GcRX6rS
 cosk9Ly3n0AR4lWsEyMmf/gGvB7WG7usx68er0ff40W/AX7SDx3q9a22lVnDfwzRnIVx
 imMDmPSV/RD6tncodeynkBhGUBH8SPtrvDIWWRCX4fa8Y4ZYnf0QDNGZKd4VgIRNADPa
 sjpg==
X-Gm-Message-State: AOAM531wLzgv/AOBn/LlbZftxDwgPjDqSYua75IrqZ2IaNTeHkiHjUtf
 W99Pg1Jfe74xAJuDGN38f5zFp5KGwhi6b5TGSOlE8PhhHQ2DWW2Y3B08xKbvQY00a6rD0fYHzt+
 71vughw8jAnQlpYJA5SMYp5cb/qo5
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr54376481wrx.49.1641553652095; 
 Fri, 07 Jan 2022 03:07:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtOPD/6pEBen2ILWzQHaAQuxOtuwbQ3rz4DnLfmgOAOVsFRE5K9lxV3eeCKmjU9fywMsfmMw==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr54376465wrx.49.1641553651914; 
 Fri, 07 Jan 2022 03:07:31 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r9sm9337273wmq.18.2022.01.07.03.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:07:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] video: A couple of fixes for the vga16fb driver
Date: Fri,  7 Jan 2022 12:07:21 +0100
Message-Id: <20220107110723.323276-1-javierm@redhat.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
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

Patch #1 is fixing the wrong check to determine if either EGA or VGA is
used and patch #2 adds a check to the driver to only be loaded for EGA
and VGA 16 color graphic cards.

[0]: https://bugzilla.kernel.org/show_bug.cgi?id=215001

Best regards,
Javier


Javier Martinez Canillas (2):
  video: vga16fb: Fix logic that checks for the display standard
  video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

 drivers/video/fbdev/vga16fb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.33.1

