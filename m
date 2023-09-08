Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7F7990BF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3810E1FD;
	Fri,  8 Sep 2023 20:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A35710E1FD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CVUWiNi0XyDqlB1JxyjZ0R/Ir5gIUCrvEGnFOU6/cQM=;
 b=Za734TGqvidP8fMYkVKWozJOtZQd7ZqV/csWPFOBTc5Sq57h/Nf6Y76Mp+5mUb85XHmbkN
 nMrMWVL8xtmMSkpNj4gR6E5rMgInzFMEJqR8Di4IzJioT2KaEqHBvFPVLKAuGxv5rbagPq
 68+HsK/o4vrvrOlfojaCUPll6emhqIw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-Mcit6pGxMaGCznWpizcWfQ-1; Fri, 08 Sep 2023 16:02:43 -0400
X-MC-Unique: Mcit6pGxMaGCznWpizcWfQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-40559875dd1so4944271cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203362; x=1694808162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVUWiNi0XyDqlB1JxyjZ0R/Ir5gIUCrvEGnFOU6/cQM=;
 b=RHm6LjJHIIMnEcNuht9GT/gl6lMViev1T+1I7blG8DKaAGeo4bEEFP8w9xm3RSUHDk
 u6ZTbMESpKHve5YBLVKykf9VylTGQ6gowcOO9JWLerxKDp5tWhUV9vjz6/SOvWVzBUCZ
 4GaOfPw5mY7am26ZFFV3PWeimpo2Dr4fkfoCgNBzXyg2/FnThQay8HqgYy2Fj1h6Ss54
 vV/KUdPOdTobvLibMgK18yPm0PqKSWdrJK03rNl5vhUBKUIpMZqtPQloeO3Xk2M+6u+C
 lG/eRlw6smiqzOTIkEILh4DzCGl/SPhgijiP85lcnUpttEaftTUKPFrIeDbj/Md47/5a
 kY5g==
X-Gm-Message-State: AOJu0YzoCGbvqiTGOC5h/wM1BPwlPe8U731Gf4y6Z+UY5PkxKO0WLA34
 NIYVgpLvx8HBeGgVosDKH3UyAGzkNQkPqg9RYqN+iii9KzYBFPlYrj44ddWWovrJaR/r0b2QOia
 WUsQ0O7SLSWuhXQn89OCKcjooV9pJ
X-Received: by 2002:a05:622a:1915:b0:412:1c5f:4781 with SMTP id
 w21-20020a05622a191500b004121c5f4781mr4701194qtc.4.1694203362644; 
 Fri, 08 Sep 2023 13:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuiGnmMFWAKLSh30zPQGkgvOkX4VTvQk/17jsSVc5WjoNTNjt80rBc5lL7G+qjPScKuI3czQ==
X-Received: by 2002:a05:622a:1915:b0:412:1c5f:4781 with SMTP id
 w21-20020a05622a191500b004121c5f4781mr4701161qtc.4.1694203362351; 
 Fri, 08 Sep 2023 13:02:42 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 jm8-20020a05622a750800b003f9c6a311e1sm840078qtb.47.2023.09.08.13.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:02:42 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
Date: Fri,  8 Sep 2023 21:59:39 +0200
Message-ID: <cover.1694202430.git.pstanner@redhat.com>
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


Changes since v1:
- Insert new headers alphabetically ordered
- Remove empty lines in functions' docstrings
- Return -EOVERFLOW instead of -EINVAL from wrapper functions


@Andy:
I test-build it for UM on my x86_64. Builds successfully.
A kernel build (localmodconfig) for my Fedora38 @ x86_64 does also boot
fine.

If there is more I can do to verify the early boot stages are fine,
please let me know!

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

