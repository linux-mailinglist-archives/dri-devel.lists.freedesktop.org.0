Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0CD92CE3D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58C210E1F5;
	Wed, 10 Jul 2024 09:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XV/i8w5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0410E1C5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:33:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-426744ca29bso1435925e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720604002; x=1721208802; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TzeNSBzyh7QLIzCzfuneqEVx7/nkOlCs6tKZ3S/B85c=;
 b=XV/i8w5MHyZjnQzvqNv/sN4i7qD9BiKMFxrIesBk4ksJmoapd477lei2BXuIrXJrbE
 JSkpBxqQQEp7r75bCXZ0pNrtxqmmrifzD/Qv6zwigJ7VShtnVAJRA5Hsb+OjhtfkOx58
 u32GYTcdaAzYh6u+dLHj4UTlMt3q4ThEbFPGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720604002; x=1721208802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TzeNSBzyh7QLIzCzfuneqEVx7/nkOlCs6tKZ3S/B85c=;
 b=Y4YAC/Hh1FigTlvF/RTOsThN3G23aJwaWnMKTI+WvuG49n8UFe0pPLZxWw0+dLfAKx
 LHqB6QVCiNinK3pOxSBZJZo8Fts9XD5QQ7N+2XmdZgcZToKP/URo6BdWgV09Y+Nx4z2n
 xa2aSHVT+sYx+oFNzgJC+0Pc8rsDCSnHvX3zIPnfxOQ6IdQhfItHYG4IOj8IXmeu4YNY
 nGRe2VP1Yw6IykMAn4ZtfPQL0lv7KCrgsxZyTv4fYMtNWuja/sXUHKOiquRNAvwDrDpA
 IQfRpxDnYL2crkkyjXnt841uwyrkb1WJ+MJpU388DTGyNJqPczhKHPTbFFiUGck3KcLx
 MW3g==
X-Gm-Message-State: AOJu0Yy3/BF2nW/jLvWX8y1Db/r7QGQpG6zBgPP2iOkl9A4wnXR7mhCO
 k33m7CBsAfrlGhfRHpP0sW0piTm8Vf2ydBu4aDr9fSA5SBv7ZPobMjyZABLv382EGXHFCtNDNby
 BIk8=
X-Google-Smtp-Source: AGHT+IFAxrCbKthPgF5yUWY01P3adBGwJNfKLQpHeukxHdQeDqaphx4o5novPlwU23HfZb9BgXrQug==
X-Received: by 2002:a05:600c:3b86:b0:426:5dd5:f245 with SMTP id
 5b1f17b1804b1-426708f1979mr35047955e9.2.1720604002571; 
 Wed, 10 Jul 2024 02:33:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a27sm73448935e9.23.2024.07.10.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 02:33:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/2] bcachefs: only console_trylock in
 bch2_print_string_as_lines
Date: Wed, 10 Jul 2024 11:31:17 +0200
Message-ID: <20240710093120.732208-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

console_lock is the outermost subsystem lock for a lot of subsystems,
which means get/put_user must nest within. Which means it cannot be
acquired somewhere deeply nested in other locks, and most definitely
not while holding fs locks potentially needed to resolve faults.

console_trylock is the best we can do here.

Including printk folks since even trylock feels realyl iffy here to
me.

Reported-by: syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com
References: https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Fixes: a8f354284304 ("bcachefs: bch2_print_string_as_lines()")
Cc: <stable@vger.kernel.org> # v6.7+
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Brian Foster <bfoster@redhat.com>
Cc: linux-bcachefs@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 fs/bcachefs/util.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/bcachefs/util.c b/fs/bcachefs/util.c
index de331dec2a99..02381c653603 100644
--- a/fs/bcachefs/util.c
+++ b/fs/bcachefs/util.c
@@ -255,13 +255,14 @@ void bch2_prt_u64_base2(struct printbuf *out, u64 v)
 void bch2_print_string_as_lines(const char *prefix, const char *lines)
 {
 	const char *p;
+	int locked;
 
 	if (!lines) {
 		printk("%s (null)\n", prefix);
 		return;
 	}
 
-	console_lock();
+	locked = console_trylock();
 	while (1) {
 		p = strchrnul(lines, '\n');
 		printk("%s%.*s\n", prefix, (int) (p - lines), lines);
@@ -269,7 +270,8 @@ void bch2_print_string_as_lines(const char *prefix, const char *lines)
 			break;
 		lines = p + 1;
 	}
-	console_unlock();
+	if (locked)
+		console_unlock();
 }
 
 int bch2_save_backtrace(bch_stacktrace *stack, struct task_struct *task, unsigned skipnr,
-- 
2.45.2

