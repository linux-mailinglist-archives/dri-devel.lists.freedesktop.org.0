Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1F83BC24
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABF210E3A0;
	Thu, 25 Jan 2024 08:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB62B10E841
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 19:49:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-290449c30d4so2660272a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 11:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706125682; x=1706730482; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z5in7yxhrady5lTGoDYyRXRDY4MiEGt5/MmabNiOiSA=;
 b=SA6xbGOhVYU5MYbUibkNkyPhbmupq6mgwCGjpdw7ZNP1fxV6Xu1GFY75c9KpxZpn76
 DGmUwTZJe4FARRYpIXUMvdIG49laBUhKyGDp9EYnEWHazPlWrdKG3n4InZ0lqX4tjlA2
 rgwNGYEG3BvI7C9rO6HR+GtSqvSG2ER/wB+aK5grOp33YybBI061ll1H0jH59UZud3pw
 L8vKJgiqbNkOHymwTh35d4vv1WzoYEC3shSrdFnvCwWkxFBsYGxB1idBix0hhTcdfaUw
 4K5uy3kPyEbMbgv14paYb6dcVvM9/btl9TBEbKJyLV4tz7y+zsbJ+VicPsEKilqNB0sl
 Bzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706125682; x=1706730482;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z5in7yxhrady5lTGoDYyRXRDY4MiEGt5/MmabNiOiSA=;
 b=A5sSOp1zcJtt7YeMxpVCJ0NEkZpUY/gWZ/xGhnOJau5xTUMIWBLAlTPwJLSj1NFFH4
 hurZ9egsGOi5qcvsi5IyfXTfL3ZStpVoA3Xza5tbzTHkvVdb0QR4r/qXh6I9SkHiLsdK
 pt2t+WjBFj8v9eHt7hKz5BgGWIM07ZgZ2Mg18I/4sYvBcxWeRslRiaxS/dbbzbOLv4hb
 j0UKG94ikNTYCeos2ubWs+EL+xKnAYBOOhTrtNhyoZ+u9ggHFRR0BZvGbwRr4o19psfo
 fRwQ4ge1PQFKsiHGpjBB27qrPMxuV4/UDGxda23jk4PBhjepzs/ii+psLx88fYk12nk3
 5IaA==
X-Gm-Message-State: AOJu0Yw6OOTGchPpNh4F7XVfSyhTIxiRwpYXCMWwmVJmWCwatHWdVC/D
 1cGPoIRY+cGYiSAQxXntRtTEUhN0j/F4pC6u8N/AALEsJC+bXV24n0Q4QFLwUu+bWVimqRXsTBz
 0LcvU1hJydsabCC5q77E5wjGYC7o=
X-Google-Smtp-Source: AGHT+IFyxXjOG934e5n5jLLEJXDq+MUHI1v1Jjbuk7zDMyHb75jBe7esgnnldaaGUDAuOjhtRfiLHy9mnlVnHjsgizk=
X-Received: by 2002:a17:90a:1307:b0:28e:7b94:78dd with SMTP id
 h7-20020a17090a130700b0028e7b9478ddmr64854pja.25.1706125682538; Wed, 24 Jan
 2024 11:48:02 -0800 (PST)
MIME-Version: 1.0
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Wed, 24 Jan 2024 12:47:34 -0700
Message-ID: <CADBGO79JycAycKXm9A46pLrGZHTsySV4NH+yvV7VFU-8reMF=Q@mail.gmail.com>
Subject: [REGRESSION BISECTED] 6.8-rc1 - Wayland hangs when connecting via VNC
 or RDP
To: Luben Tuikov <ltuikov89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Jan 2024 08:37:05 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When I attempt to connect via VNC or RDP to my Ubuntu desktop, the Wayland
server seems to hang. The desktop GUI no longer works either locally or
remotely. I can still log in via ssh, so the system is still alive,
but the GUI is
frozen. If I boot into Xorg instead, everything works fine. Kernel 6.7
works fine
also.

I bisected this to commit f7fe64ad0f22 "drm/sched: Split free_job into
own work item".
That commit does not revert cleanly however.

I don't see anything in dmesg when this happens. Here is a snippet from
journalctl when it happens:
Jan 23 16:14:30 paulz-Precision-5820-Tower systemd[2826]: Started
Tracker metadata extractor.
Jan 23 16:14:55 paulz-Precision-5820-Tower systemd[2826]: Started
Application launched by gnome-session-binary.
Jan 23 16:16:47 paulz-Precision-5820-Tower
gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
[ERROR][com.freerdp.core.peer] - Incorrect RDP header.
Jan 23 16:16:47 paulz-Precision-5820-Tower
gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
[ERROR][com.freerdp.core.peer] - peer_recv_callback:
CONNECTION_STATE_ACTIVE - peer_recv_pdu() fail
Jan 23 16:16:47 paulz-Precision-5820-Tower
gnome-remote-desktop-daemon[4158]: [16:16:47:810] [4158:4896]
[ERROR][com.freerdp.core.transport] - transport_check_fds:
transport->ReceiveCallback() - -1
Jan 23 16:16:47 paulz-Precision-5820-Tower gnome-remote-de[4158]:
Unable to check file descriptor, closing connection
Jan 23 16:16:47 paulz-Precision-5820-Tower systemd[1]:
run-user-1001-gnome\x2dremote\x2ddesktop-cliprdr\x2d9Tp4LD.mount:
Deactivated successfully.

This is on an x86_64 Xeon system running Ubuntu 22.04.3.  Any hints on how to
debug this further? Is there a way to turn on additional debug prints for this?

Thanks,
Paul
