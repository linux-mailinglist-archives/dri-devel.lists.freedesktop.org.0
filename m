Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B9979FD9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 13:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E732F10E27E;
	Mon, 16 Sep 2024 11:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NA9c8Nyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB12810E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726484456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6WU8wjEM5waBEtcNYw4l2YQcbb7TE6+vCphAyrZI7KM=;
 b=NA9c8NyzgZ29VrCooOFlbgfpwj75okR2bpowrxuLbrHmHIov/FuBr9+TR2aviz/+wX6e48
 IAag+zSrVk9NeMFEWNXVeCvAcnI/0IVvRVKw9VR0u/YL2a4MuzyF4ItOSn+6j3w3WslmR1
 ZE2yKSEErJGC5CpqPA2Kh6tLVzRT/NM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-5Wo4Y1rMOOSSqHaeLDciMA-1; Mon, 16 Sep 2024 07:00:55 -0400
X-MC-Unique: 5Wo4Y1rMOOSSqHaeLDciMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3771b6da3ceso1126399f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 04:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726484454; x=1727089254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WU8wjEM5waBEtcNYw4l2YQcbb7TE6+vCphAyrZI7KM=;
 b=kRSFtGxkayTLDtwQd5hPKlFULV6CqIcJPd+bZhVYIwn/x6CmWw2HG5tSvYWBf8CwJ+
 XoQkpx29LeX8GX6lMejjnE2FuacMkgAnNNHqQx1UmragKuK5IGPDj9r7XdlrT6N493Bl
 t5EpFwK9L1eLiPdkaEK7cXk3RvhGle+iWT/tl5GCrhtwG2kSB3POsQ2WxlrElwsxTZc6
 EZi9df1+wrUppXUJfjWUp2FVqgWEin1y8fWZ5yF5CmKrkFs2iWEApQm/nn6g9W38xBkj
 bHOHyJR09cZZBu+/GMTu9mp4kv31K60UirxX72GsTREhNl3O8lrN9eJeA4637c6Oh+dD
 89Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMdylRZnMq4obNb3YQOWAc+jI/xwL3DXIm+DO8bg1tiLPAmEYnwvS3SkScy5Q8H0DEPFsu+gQq/30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPFZsfFpGX3EyQFhrNW3a/X3MAem/9PWLC43OxcGR/HRmTrgXk
 5ivSVtYiqEz2Pd4CPhm2dRSOYi4o7VSw6nOqEu5df2jjs7dEkCnfv5pHbjD3uPIAHkteUA3gMmQ
 vy2RIvHgXW5Zi11507VGP95/Dgc7EZTLpYH0TGYnDE2QVJtM5S9UGlE7S984t3ma6EQ==
X-Received: by 2002:a5d:5f56:0:b0:374:ca16:e09b with SMTP id
 ffacd0b85a97d-378d61d5073mr7098342f8f.9.1726484454305; 
 Mon, 16 Sep 2024 04:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0bDYkRLWR54cWHoQ6srXlo7gK64jJb064BDuwwm746fvy1r250h1Ko4v03+pz4HMLbwFTg==
X-Received: by 2002:a5d:5f56:0:b0:374:ca16:e09b with SMTP id
 ffacd0b85a97d-378d61d5073mr7098298f8f.9.1726484453789; 
 Mon, 16 Sep 2024 04:00:53 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da24274dfsm74035955e9.45.2024.09.16.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 04:00:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>, dri-devel@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Julius Werner <jwerner@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, chrome-platform@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Hugues Bruant <hugues.bruant@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 0/2] firmware: Avoid coreboot and sysfb to register a pdev
 for same framebuffer
Date: Mon, 16 Sep 2024 13:00:24 +0200
Message-ID: <20240916110040.1688511-1-javierm@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Hello,

This is v4 of a fix to prevent both coreboot and sysfb drivers to register
a platform device to setup a system framebuffer. It has been converted to
a series since contains changes for both drivers, to prevent build issues
on architectures that don't define a global struct screen_info.

Patch #1 adds a sysfb_handles_screen_info() helper that can be used by
drivers to check whether sysfb can use the data set in screen_info or not.

Patch #2 makes the framebuffer_coreboot driver to use that helper to know
if has to setup the system framebuffer or delegate that action to sysfb.

I haven't dropped the collected tags from patch #2 due the logic being
basically the same than in v3.

The patches have only been compiled tested because I don't have access to
a coreboot machine. Please let me know if you plan to merge both patches
through the chrome-platforms tree or if you prefer to get merged through
the drm-misc tree.

Best regards,
Javier

Changes in v4:
- New patch to add sysfb_handles_screen_info() helper (Thomas Zimmermann).
- Use a sysfb_handles_screen_info() helper instead of screen_info_video_type()
  to fix build errors on platforms that don't define a struct screen_info
  (Thomas Zimmermann).

Changes in v3:
- Fix coreboot spelling to be all in lowercase (Julius Werner).

Changes in v2:
- Declare the struct screen_info as constant variable (Thomas Zimmermann).
- Use screen_info_video_type() instead of checking the screen_info video
  types directly (Thomas Zimmermann).
- Fix missing "device" word in a comment (Brian Norris).
- Fix some mispellings in a comment (Brian Norris).
- Change error code returned from -EINVAL to -ENODEV (Brian Norris).

Javier Martinez Canillas (2):
  firmware: sysfb: Add a sysfb_handles_screen_info() helper function
  firmware: coreboot: Don't register a pdev if screen_info data is
    present

 .../firmware/google/framebuffer-coreboot.c    | 14 ++++++++++++++
 drivers/firmware/sysfb.c                      | 19 +++++++++++++++++++
 include/linux/sysfb.h                         |  7 +++++++
 3 files changed, 40 insertions(+)

-- 
2.46.0

