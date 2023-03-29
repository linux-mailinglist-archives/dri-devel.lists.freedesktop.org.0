Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7476CD258
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 08:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258868826D;
	Wed, 29 Mar 2023 06:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396D110EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:55:52 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536a4eba107so146591307b3.19
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680072951;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yb6T5Nix/3hrpi04qTRDKmlC5J5N+Z2zQezjqCwHQSc=;
 b=I70iBO8V621lm+2OBg9UTLn3NwNxaOjH81/kUFD8B1L+O1fwBhekEA+10JCdKiD3tA
 kECwcwUJvSNC88bYchl5stnbjXXBAo59zC+OgGa1lyXqpdfSBAdKUplbtKbZ6b4sx+Io
 fOQ63v3lHvtOi4jdjxoivD4NQGgJEUDTIXFSDL+0qLQm7CfslCBvEOlc6kmoSJRnTYhx
 pEEhi7f4mATzlqPFiW1w4VEErXrG7EzcULjUI2XpAcYsYU34pW9Tn9qbtYIEjkN0lEZr
 djC+4bkDVcIBW8KqxkB9oMzR05gvvb+gdeHsobNc5dq91YSjLozfTnVS9sd8c8258dDQ
 ayIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680072951;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yb6T5Nix/3hrpi04qTRDKmlC5J5N+Z2zQezjqCwHQSc=;
 b=kHvmUITVCjMGI6zck8LM9nEfisfms+bdx89NOcWoECfDb0z0ZubIxnVWHwUIjHnsDa
 utAATVHjFDa+Y2UX1J0s2tlfeTbT04kRS7MePuF3K/qrsnf2NkTPh1DVG/9CT+9OaWTg
 HYHJuNcBlww9f/3YxKldQ89eb1nxJBdHXkb+LSgwNKJH3//+Fl1rIofTKNeX3KSTJkTW
 XH0VDWnccx/prwRCVMvbhYNBiCXKNxVNaQN/gTwyf0I53eGE58yvyr/flsn7kW2tSy5N
 87UUDLZF/mEuX6VfqoaAIL0q7rcLGGA6/XQFHSfgkmD2fEJ+DdGFT8pXFaZ0wt/FxvtC
 yGyg==
X-Gm-Message-State: AAQBX9eGpMhLXOHUqVdM5ot8mrNuiQ7N4c0A+LB9A5+cwbnh0zN1KBE0
 TgH4JeV+BVJYTtPNC7W2QPXbYBDap1Ck7A==
X-Google-Smtp-Source: AKy350bNaANkNE4LgBYqCLQFYMuy5mciHvuGb6vV8PhgtV00DdwwHufAEgSeA7hH9hghIP+DtRXhzI8HE8iwTQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1003:b0:b1d:5061:98e3 with SMTP
 id w3-20020a056902100300b00b1d506198e3mr12429289ybt.6.1680072951072; Tue, 28
 Mar 2023 23:55:51 -0700 (PDT)
Date: Wed, 29 Mar 2023 14:55:32 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230329065532.2122295-1-davidgow@google.com>
Subject: [PATCH 1/2] drm: buddy_allocator: Fix buddy allocator init on 32-bit
 systems
From: David Gow <davidgow@google.com>
To: "=?UTF-8?q?Lu=C3=ADs=20Mendes?=" <luis.p.mendes@gmail.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm buddy allocator tests were broken on 32-bit systems, as
rounddown_pow_of_two() takes a long, and the buddy allocator handles
64-bit sizes even on 32-bit systems.

This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
	./tools/testing/kunit/kunit.py run --arch i386 \
	--kunitconfig ./drivers/gpu/drm/tests drm_buddy

(It results in kernel BUG_ON() when too many blocks are created, due to
the block size being too small.)

This was independently uncovered (and fixed) by Lu=C3=ADs Mendes, whose pat=
ch
added a new u64 variant of rounddown_pow_of_two(). This version instead
recalculates the size based on the order.

Reported-by: Lu=C3=ADs Mendes <luis.p.mendes@gmail.com>
Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=3D-CviDQbNaH0qfgYTSS=
jZgvvyj4U78AA@mail.gmail.com/T/
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/drm_buddy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 3d1f50f481cf..7098f125b54a 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 =
chunk_size)
 		unsigned int order;
 		u64 root_size;
=20
-		root_size =3D rounddown_pow_of_two(size);
-		order =3D ilog2(root_size) - ilog2(chunk_size);
+		order =3D ilog2(size) - ilog2(chunk_size);
+		root_size =3D chunk_size << order;
=20
 		root =3D drm_block_alloc(mm, NULL, order, offset);
 		if (!root)
--=20
2.40.0.348.gf938b09366-goog

