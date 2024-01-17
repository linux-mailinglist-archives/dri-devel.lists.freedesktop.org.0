Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB382FF33
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7410E607;
	Wed, 17 Jan 2024 03:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD0C10E607;
 Wed, 17 Jan 2024 03:13:20 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so12254611a12.3; 
 Tue, 16 Jan 2024 19:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461139; x=1706065939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TgJly174tiM7wU2wdf3QPw2xjcF1it+Gf9c5BM/HUdU=;
 b=IRaS8su6ejXmdKVYhAwap3iw0ZFcO85SJA43dzuk49ym+PNmqrUJAiH2quRJvFbtAU
 k6avyT+6FLPc6YawKdJE978lqWzYXLCRrskyXvg8u1ulBYxT3dfcKgmaviH6LSbD+URn
 GocjjdO16X9PVy8vc+AMHWNYDD/uB1hTzGPEkFUWZrMnRKeF72ufGtxBk0DsgzE6fAxZ
 7SlcpOXfkcrd/PjQ6NoIFXTdb9bC1OvudOzZa9wjIAdLQoqe5yzYPcmcGUMxMNg5HdVY
 S7dwsYLt7Uk7wppoIiciDeehspsL8lMLZ9BeypNilRTJwEIXrYzB5x7PaN5Ewi/DS6G9
 oFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461139; x=1706065939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TgJly174tiM7wU2wdf3QPw2xjcF1it+Gf9c5BM/HUdU=;
 b=OrYT2DLQCxYhfpJjoWjcFrBadavzox1cn90sHAZDOT4r4d7jP4tk4N9fGEKqALDd0A
 gCPzfVh4STEIWnOy2/NJyBPpBT9tpSR+cd8p05sejMTCiivZD2x9Dss2v91pbT9PzUW/
 jvhP+m9kbmY62fBfoWxkwgBDGpgAsMCyvGTMSkhS4d2mzO9YqCmyEO9KIsHCepOQdNFr
 fWSbHnBhTpIXYGwNquAY29MNO7JFW4dlHrRI3mZ5TFVV6mrrU4MteleQlK0nFSB2UWnf
 YwrBcKGUExDJ5wSpANyCRmIzgtHbnfn3amhBtyNvACWn6WtF9uhn4Uen9OC7dFb4hGen
 3VTg==
X-Gm-Message-State: AOJu0YzMdfgeAkNQFZilZoYlTTixPHrcS6t0LRdPNblPbzQCT3fN4zel
 tJEKy3lrsjMd0n8KWYmllsI=
X-Google-Smtp-Source: AGHT+IF3Mtz0neSHZglpJaChYFRyU3wCE0V0Yh2hb5IoExwBm0o8NlPDjsDyqDHpOvHo1u492LlMTg==
X-Received: by 2002:a05:6402:5214:b0:558:c366:f010 with SMTP id
 s20-20020a056402521400b00558c366f010mr4914667edd.24.1705461138849; 
 Tue, 16 Jan 2024 19:12:18 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:18 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 0/6] drm/lima: fixes and improvements to error recovery
Date: Wed, 17 Jan 2024 04:12:06 +0100
Message-ID: <20240117031212.1104034-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There have been reports from users for a long time about applications
hitting random "*ERROR* lima job timeout" and the application or GPU
becoming unresponsive.

This series addresses a number of related bugs, especially in the pp
timeout recovery path.

Patch 1 fixes a stack trace initially featured in a user report here:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/8415

Patch 2 fixes a "pp reset time out" message which was fairly confusing
at first. Debugging with an application which just submits one single
job at a time made it clear that the timeout actually was reported in
the application that runs next, even if that is a good application.

Patch 3 is one of the most important fixes and stops random "mmu command
2 timeout" ppmmu timeouts that I hit while running my tests. Initially I
thought it came from some race condition on running/resetting jobs, but
it was actually due to hard resetting live tasks.
After setting this there was never a mmu timeout anymore (even after
dropping the guilty flag in the upcoming patch, which by itself was
actually the easiest reproducer of the ppmmu timeouts).

Patch 4 might be debatable, but hopefully we can agree to go with it
since it was already discussed in Panfrost here:
https://patchwork.freedesktop.org/series/120820/
It is actually not that hard to reproduce both "spurious timeout" and
"unexpectedly high interrupt latency" by creating an irq which takes a
longer than usual to execute, and paired with the issues in timeout
recovery this could cause an unrelated application to hang.

Patch 5 removes the guilty drm_sched from context handling in lima.
Often users report issues with a user-visible effect of "application
flipping the last 2 rendered frames":
https://gitlab.freedesktop.org/mesa/mesa/-/issues/8410
This was ultimately caused because lima sets the guilty flag to a
context which causes all further rendering jobs from that context to be
dropped.
Without the fixes from patches 1-4 it was not possible to just drop the
guilty flag as that could trigger the mentioned issues and still hang
the GPU by attempting a recovery.
After the fixes above it seems to be reliable and survives some fairly
torturing tests mentioned below.
Other similar GPU drivers like panfrost, v3d don't make use of the
guilty context flag. So I think we can drop it for lima too.

Patch 6 is just some debug message cleanup.


Some of the tests which I ran with this patchset:

- Application which renders normal frames, then frames which /barely/
timeout, then frames which legitimely timeout, then frames which timeout
enough to trigger the hardware watchdog irq, then goes back to render
normal frames. This used to hang the application at first but now
survives the entire process repeated indefinitely.

- High irq latency from an unrelated source while rendering. I put a
mdelay() in the touchscreen driver irq and could cause all "spurious
timeout", "unexpectedly high interrupt latency" and actual timeouts.
Those are now all reported to dmesg for information and I am no longer
able to cause an unrelated application to hang.

- Game running with lower configured drm_sched timeout (locally set to
200ms) with other applications triggering timeouts in the background.
Different applications trigger resets independently but none of them
cause the GPU to hang or the game to stop working.


Erico Nunes (6):
  drm/lima: fix devfreq refcount imbalance for job timeouts
  drm/lima: reset async_reset on pp hard reset
  drm/lima: set bus_stop bit before hard reset
  drm/lima: handle spurious timeouts due to high irq latency
  drm/lima: remove guilty drm_sched context handling
  drm/lima: improve some pp debug messages

 drivers/gpu/drm/lima/lima_ctx.c   |  2 +-
 drivers/gpu/drm/lima/lima_ctx.h   |  1 -
 drivers/gpu/drm/lima/lima_pp.c    | 26 +++++++++++++++++---
 drivers/gpu/drm/lima/lima_sched.c | 40 ++++++++++++++++++++++++-------
 drivers/gpu/drm/lima/lima_sched.h |  5 ++--
 5 files changed, 58 insertions(+), 16 deletions(-)

-- 
2.43.0

