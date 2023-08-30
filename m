Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393678D648
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8710E14F;
	Wed, 30 Aug 2023 13:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1610E144
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693403184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PzqfQ88022ZJBnlN9XJGH4Rch2pPLUTbjECBn8E9VEk=;
 b=DN1Tqt3clHoxo73R7PnSFAqo34lXpu9aMaVFTHaXY+k8j/7veF9a9AoZ7DRb76NbhZ6lMe
 3qJ8eetD6X5J52uXnz2OtdzJLmi3D7Qc8aQ7W8+ykB3RN5zkrHyA8aYY4Z1HGTvF7iw5D7
 /2lMY1nmDC4Z0S9lnxE60m1ksFaBv6s=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-ofndmMzUP6uDSlOl21nI7Q-1; Wed, 30 Aug 2023 09:46:23 -0400
X-MC-Unique: ofndmMzUP6uDSlOl21nI7Q-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso19451831fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693403181; x=1694007981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzqfQ88022ZJBnlN9XJGH4Rch2pPLUTbjECBn8E9VEk=;
 b=W9lcrhXDvR+hHX3kx09AgTPPe4RPnsl6djF+YHJXZ7cmi8oB156KF1UfyzxfrX88xo
 PAhN8e47WqoaWmmEbge+Kj94mRf7WRjB/4a11WtO2eUnnl7D6lcb+zYihTrwaxTz6fhU
 O2+61da/31d2LsXlQPAMA4p5PNfbVuU0nYpfwcOoJlEnS+C1hECLcor4MlDUtcN6UelP
 f/FhOcWZoCMlr9Z6juYjK174DtHzGq+3tczJnSKVNUiPq219VOo96FLZr+EIDHqcr7v+
 19w8l9fcw9QfKrBbz6a/cXGaidg6MnSq6cDEKNL/SsAzSSs1xvC/WVBOW2tuE3TF50Xu
 gjoQ==
X-Gm-Message-State: AOJu0YzB58A7HYbARm92wR+j9Oinl4VNN/tIe7g6CPq5ggtPVHGzOyVf
 TuxsyEL1B0+jAvEFYZK5lUKUR2mrzM2dMgOImgA/cZkXqawRPLqzU1u5lcWD992+wFyXbbqJYfG
 hefLmUv+hiqpUrt6lXtwUkzYUowBa
X-Received: by 2002:a05:651c:201b:b0:2bb:8d47:9d95 with SMTP id
 s27-20020a05651c201b00b002bb8d479d95mr1564048ljo.2.1693403181696; 
 Wed, 30 Aug 2023 06:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj7gH1IKBMS0NWbE4Xd4vUNDX4WI+F2xE2mn0UylTciMqkBXPKro8KLHlIW5rak33HRcstNQ==
X-Received: by 2002:a05:651c:201b:b0:2bb:8d47:9d95 with SMTP id
 s27-20020a05651c201b00b002bb8d479d95mr1564026ljo.2.1693403181300; 
 Wed, 30 Aug 2023 06:46:21 -0700 (PDT)
Received: from fedorinator.fritz.box ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a1709063e5a00b009829dc0f2a0sm7174346eji.111.2023.08.30.06.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:46:20 -0700 (PDT)
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
Subject: [PATCH 0/5] Introduce new wrappers to copy user-arrays
Date: Wed, 30 Aug 2023 15:45:51 +0200
Message-ID: <cover.1693386602.git.pstanner@redhat.com>
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

P.

Philipp Stanner (5):
  string.h: add array-wrappers for (v)memdup_user()
  kernel: kexec: copy user-array safely
  kernel: watch_queue: copy user-array safely
  drm_lease.c: copy user-array safely
  drm: vmgfx_surface.c: copy user-array safely

 drivers/gpu/drm/drm_lease.c             |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 +--
 include/linux/string.h                  | 42 +++++++++++++++++++++++++
 kernel/kexec.c                          |  2 +-
 kernel/watch_queue.c                    |  2 +-
 5 files changed, 48 insertions(+), 6 deletions(-)

-- 
2.41.0

