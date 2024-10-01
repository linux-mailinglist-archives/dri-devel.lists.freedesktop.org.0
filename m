Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CE98BC0A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7CA10E30C;
	Tue,  1 Oct 2024 12:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AkdeKnVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F77E10E30C;
 Tue,  1 Oct 2024 12:27:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fada911953so6830321fa.0; 
 Tue, 01 Oct 2024 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727785658; x=1728390458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mz/frrgh2X7veajb8TRHaK7nOvFp0bcaRFEIvpq+FUs=;
 b=AkdeKnVk+eMxjRvFql7EQ1ta3DNeTZSiSMilV2GwaUPiZhUqPpajmPt3lXtX18cbqC
 ypZXJIhX0pnFx+SjPOJ+EPHrqR+yJd2HSmMucVNQh2TD69Va5RXo4H+0CO2ABEl+IEV7
 s6NkDJtVawllbZvNWiCo09jrsJB/YamtXhJAVvJLDyg2L32YpbaS1//oZ8vUS/kqXl8+
 YOYpOgweGko8IqJw3TYcE6FiWouMcqTDjEltWhCpeJi60X4AIvETNN0naQmvTUyJkrz/
 ru7KcxYh7HGGR3L+UzOYVihFjH0byTVedf6oUa2oM3TZU7Zav++C3VA2NFEWaQwUOvyF
 fb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727785658; x=1728390458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mz/frrgh2X7veajb8TRHaK7nOvFp0bcaRFEIvpq+FUs=;
 b=uAa6Z8CpQWpCvvoRAwO7Rztk6I62xx2tETuIy8X4JLSc9PEBH5VSimO0equ+BaxgGc
 seVTpcd9i41+vcgiC3Ps0Ay2k/kzF+541EMibioB7VO60MCO6O/9KXyqYjq3c5GyzCJd
 boVj2E3VRM3sAJApah8HwqT0ai/uVsle4j5kTAAweJFxAshmiaUPV/eYpNB3qKh/eRE8
 89wDMxD0uw5S4P2i/fG/fJSdv5noVSQX96uGR7ziEkabui8by0yj9dlMYS3ozfmLD0YV
 98vnvkTaSXfCH0n31mY6ux3+AyYsp+wZUxIs5+87NGMeWymdEWbu+PJGNuXfNnmEbUtN
 UHOg==
X-Gm-Message-State: AOJu0YyOYluelN2sc29Ix1419oSlNfZwWjIu1fv7G4WBoJ9U4z5pwG7M
 0sHG9q/7DMJvW4KaNmJpwgJKqCUhzIfmVpAx2ppMrlP+rlDLRp/KSP5Z7Q==
X-Google-Smtp-Source: AGHT+IF0YCu8Ao1ATLmR+ThBkMjQWDXd8xwg6dEchuwhJPVdhV2D/29Zn351/G949Yz8GY66ykez1A==
X-Received: by 2002:a05:6512:1056:b0:52e:fa08:f0f5 with SMTP id
 2adb3069b0e04-5399a2564b7mr1082698e87.13.1727785658075; 
 Tue, 01 Oct 2024 05:27:38 -0700 (PDT)
Received: from shiban.. (host-95-193-98-80.mobileonline.telia.com.
 [95.193.98.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a04417c7sm1563319e87.275.2024.10.01.05.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:27:37 -0700 (PDT)
From: =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>
Subject: [PATCH] uapi/drm: Specify time constraints of DRM_MODE_ATOMIC_NONBLOCK
Date: Tue,  1 Oct 2024 14:27:31 +0200
Message-ID: <20241001122733.3643057-1-jadahl@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd.dirty
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

From: Jonas Ådahl <jadahl@redhat.com>

In order for compositors to utilize real time scheduling capabilities,
it must be ensured by the kernel that calling a drmModeAtomicCommit()
with DRM_MODE_ATOMIC_NONBLOCK does not block in a manner that makes the
realtime scheduler watchdog send a SIGKILL to the calling process.

Thus, require drmModeAtomicCommit() explicitly with passed
DRM_MODE_ATOMIC_NONBLOCK to not block in such a way, i.e. during regular
non-mode setting page flips, the kernel must not block any extensive
period of time.

While blocking for the amount of time needed to trigger SIGKILL
(usually 250 ms) already means inadequate behavior due to a large amount
of missed frames, thus stuttering, is the result, if drivers still need
to behave this way in edge cases, they should behave in away that the
calling thread can go to sleep.

Signed-off-by: Jonas Ådahl <jadahl@redhat.com>
---

Hi,

This is a follow up from the Display Next Hackfest in Coruña[1], where the
topic was discussed, and the conclusion was to try to document the
expectations of the kernel when compositors are doing non-blocking page
flips.

As can be seen, synchronous mode setting commits are not, for the time
being, meant to guarantee finishing fast enough, which is fine, but to be
able to make use of realtime scheduling, nonblocking updates must behave
in a sensible manner.

I took it so far to describe how drivers should handle situations when checking
an update can potentially take a very very long time, but if that should just
never be allowed to happen, it can be reworded. The main take away should be
that it's a kernel bug if a non-blocking commit blocks for more than a few
milliseconds.


Jonas


[1] https://events.pages.igalia.com/linuxdisplaynexthackfest/

 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..1953ae1a37d2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1112,6 +1112,12 @@ struct drm_mode_destroy_dumb {
  * IOCTL returns immediately instead of waiting for the changes to be applied
  * in hardware. Note, the driver will still check that the update can be
  * applied before retuning.
+ *
+ * The driver must not leave the calling thread in a running state for any
+ * extensive period of time to avoid the process receiving SIGKILL by the
+ * realtime scheduler. This means if checking the update needs to wait for an
+ * excessive amount of time, the running state of the calling thread must be
+ * changed accordingly while waiting.
  */
 #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
 /**
-- 
2.44.0.501.g19981daefd.dirty

