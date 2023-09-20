Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF64E7A805A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CD610E181;
	Wed, 20 Sep 2023 12:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27B410E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dpwuQg4DW9CQa6W2DXgKa+/2xEjZS0PSQLwcoRBZU2A=;
 b=GQftqgF1nzeJx34ZS/zjN1leaxMM7vDbISMqAHXh88uXw/bdNkX2SwPSOkENJXdqS2VM63
 euZxqP8ZEE+ljggco0oCntxbv/bMlee4fXsJ1Nce2jdR+KR3x1ljKv6splg6sds+EV4cb+
 8cpyvGMMNjMVR2hcGse5vhKh/di30Z4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-UriwGvi2OMCoRqYuFr4hDw-1; Wed, 20 Sep 2023 08:36:29 -0400
X-MC-Unique: UriwGvi2OMCoRqYuFr4hDw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ae4b211f43so17284566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213388; x=1695818188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dpwuQg4DW9CQa6W2DXgKa+/2xEjZS0PSQLwcoRBZU2A=;
 b=qS0zgBaoyKBnW8fvHXiq74tpQfZ4VxmxoAIDxuPC+hZUDc98m2P7BTy1LwHi3hD2ra
 Pq43FCA15v9AiqmmlWX0bTrMRJdKz6/xQno8mIC2e4OIs4bk2UsCCfWeVI/4QQDdNXc+
 cjrHqxTCGY6OcFzFPHm0/hOXt+qoN+SFVDC5r1iVLRGqWdniScTa67qoWLYEnvLHTir6
 xnImbxy933QZTziP1yMEN2ewO2uDRP5ca9e6YHXkdJCBa4Xk6zEX/0OsFzRIwMrAFtXb
 GlKhMq9u9UdJ9+ne7wgE+yonM9kpPZPmO3O2iOdbLeTXuMhCv/XbWIx6JOmW3A0anF59
 mX1g==
X-Gm-Message-State: AOJu0YyqLSScOZTE+H4bITcE0buaMc1HYAZMtJgBB+VBVip1ns+linRM
 wjj+kBwOfp3W3aSU29pBETHGJ1khEf+38LfpEM5mkvlZnIufwGG9C0tLFf6JHoaDxCw7bG16JZ2
 CTb+NF+OG3bLaHgXlBO/8fPnK67zK
X-Received: by 2002:a17:906:d3:b0:9a1:d915:6372 with SMTP id
 19-20020a17090600d300b009a1d9156372mr1853810eji.4.1695213388737; 
 Wed, 20 Sep 2023 05:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWfVGOFs1cXim3gTD9PAzh0cZ1ptQJMSfTtIDViZU2bgVjNf9KAP/OZ/dlJHXc8IFPusAbnQ==
X-Received: by 2002:a17:906:d3:b0:9a1:d915:6372 with SMTP id
 19-20020a17090600d300b009a1d9156372mr1853784eji.4.1695213388364; 
 Wed, 20 Sep 2023 05:36:28 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 ld3-20020a1709079c0300b009adc81bb544sm8137735ejc.106.2023.09.20.05.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:36:24 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH v3 0/5] Introduce new wrappers to copy user-arrays
Date: Wed, 20 Sep 2023 14:36:08 +0200
Message-ID: <20230920123612.16914-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

David Airlie suggested that we could implement new wrappers around
(v)memdup_user() for duplicating user arrays.

This small patch series first implements the two new wrapper functions
memdup_array_user() and vmemdup_array_user(). They calculate the
array-sizes safely, i.e., they return an error in case of an overflow.

It then implements the new wrappers in two components in kernel/ and two
in the drm-subsystem.

In total, there are 18 files in the kernel that use (v)memdup_user() to
duplicate arrays. My plan is to provide patches for the other 14
successively once this series has been merged.


Changes since v2:
- Remove the unlikely() from the overflow-check, since the latter
  already implements one (Dan Carpenter)
- Add the Reviewd-bys for the changes already reviewed in v2

Changes since v1:
- Insert new headers alphabetically ordered
- Remove empty lines in functions' docstrings
- Return -EOVERFLOW instead of -EINVAL from wrapper functions

P.

Philipp Stanner (5):
  string.h: add array-wrappers for (v)memdup_user()
  kernel: kexec: copy user-array safely
  kernel: watch_queue: copy user-array safely
  drm_lease.c: copy user-array safely
  drm: vmgfx_surface.c: copy user-array safely

 drivers/gpu/drm/drm_lease.c             |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 +--
 include/linux/string.h                  | 40 +++++++++++++++++++++++++
 kernel/kexec.c                          |  2 +-
 kernel/watch_queue.c                    |  2 +-
 5 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.41.0

