Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB021A25049
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 23:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF7710E32B;
	Sun,  2 Feb 2025 22:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a8WVQxCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45A10E32B;
 Sun,  2 Feb 2025 22:14:59 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso44383045e9.2; 
 Sun, 02 Feb 2025 14:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738534497; x=1739139297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/d+6kPbWsXoeRB2D7/hAE4JuKSelsZt/eO8TnxXuCpk=;
 b=a8WVQxCCoYILBVYdwO8S1CL3aP2R72u+KEweUCl1iyjCrxW8EXI6Ne2yEYIKyX/GUR
 Jw1uD/aaVT5nDaKYQGPTtztdv3efP+pEZrjTAFqCzxKve3bxHMqJzA0b7/UDpaIGIBQk
 wx5gbzJCXVcfWMKOifo/wwaDeMq3M5Nv+YCIst+b1cqC3SDS6OTCh3VmaGlPe2Ps6ydD
 E3aiTuSBAuTfpkUAeDiIlk+0AoXo1btL8HMGHpx3v9AbYJvbQm+aFO7BOHLHptECpOa4
 dBUM2bf61hQviKIHs7UW/RGIiDPYt/GHCd1KlwI9UTPk3P6nCFqZ57FHgAw4OV0/pPyq
 SWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738534497; x=1739139297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/d+6kPbWsXoeRB2D7/hAE4JuKSelsZt/eO8TnxXuCpk=;
 b=HkwEI2J6HsW5OeTumd7qi9xyOskegeaUrK9UnDQ3xHaae95K/DiVC0pWB8mBohk4Qd
 UBjAWB/rRFMyXFUkiVTXDEY7YQlH53TD4fTkGKaDmi+ipdhJRSFp7XMOTCtDLXjdFHuu
 JqQ0d1KQzE1te7FKO0uZMNGOpQxOzGRpo1gdGnD4OdSDPvxanIpMBc695ztoX5EZSMnE
 NE0GUAea+ykGzN5nSvV48fytlALi2XqmZQB0kSiiyti+2b2lf0S6KKIvip9yB7alGEJt
 NrRVg0w9IoovuYpstqczJhZK/iCkLZa7varmYw6p7Sk28819NhPdSxPK/YpQISiRKurz
 ZByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNx4Sr6Vu1gL7PLKARerHdlQgbi8oDfwfFmVcr94Z7yHB0k1Ul22JgbgEml1jmkGdOFYFlJrJ7zBuT@lists.freedesktop.org,
 AJvYcCXTC5jZsdSeHDbdJWEdX5x/jM6hrMSTL0+LdldeYWwrQ9LyQp7zE6J9edT7Ld+9eHdAFX0BtIbOoYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypJH/S3gFC8ioIHKXfHj+vW0HhqWDp/vdamYc+njzIPgNNfjK6
 wtvr0fkyny5huPJigPokRNjo6aZnG6qdZnp554FqXrNinfTykg6g
X-Gm-Gg: ASbGnctEVTNIJbjt4Nc3V4XlBjYH7FJdEWALAdHfecbDCbihtF85sq23+ircQ+csGYA
 kggJKRAGQcnJjsYAs6keqTLqmEk49NSYPrD0dRNVQSQxIla8xJ8iuRP51nekWcpn0lfA3vxy5ye
 gW3NFQ2dGh5l8ZRyneZmmKqiLgZYNHPRbo24eeTX+A6SG1MSIaVSTlCJVcfHV5R2mma9D31/btP
 dT7OvcWmmCVCcJlARL6KeHeMIKyVsUiZxt0j70iQF/CT//A359phy9gm6gqXE2r2Qd4CzpRRchR
 4kdWIzk3EbSNvFQo
X-Google-Smtp-Source: AGHT+IHplxqjgEP0dFwLXvJfrL/A1CbJGFKEyQ9oY6WjTEsVIqOplrcFOwDsR1meWL5D4TeYkh8bkg==
X-Received: by 2002:a05:600c:3306:b0:435:294:f1c8 with SMTP id
 5b1f17b1804b1-438e018288dmr124323665e9.28.1738534496966; 
 Sun, 02 Feb 2025 14:14:56 -0800 (PST)
Received: from localhost ([194.120.133.72])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c5c1b51e1sm10974566f8f.77.2025.02.02.14.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 14:14:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/selftest: Fix spelling mistake "ofset" ->
 "offset"
Date: Sun,  2 Feb 2025 22:14:31 +0000
Message-ID: <20250202221431.199802-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5c397a2df70e..3eff0894c26c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -964,7 +964,7 @@ static int __shrink_hole(struct i915_address_space *vm,
 			break;
 
 		if (igt_timeout(end_time,
-				"%s timed out at ofset %llx [%llx - %llx]\n",
+				"%s timed out at offset %llx [%llx - %llx]\n",
 				__func__, addr, hole_start, hole_end)) {
 			err = -EINTR;
 			break;
-- 
2.47.2

