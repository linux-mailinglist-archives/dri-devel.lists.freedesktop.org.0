Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEdIOJeGrWkY4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC5230A76
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD42410E449;
	Sun,  8 Mar 2026 14:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcfhVmjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8DD10ECBC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:29:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-65f94011dfaso2695817a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789363; x=1773394163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ODTnxXdC8dJfVMMnO8L2V2ZpKV53Q2IrgocU2xbWhg=;
 b=dcfhVmjBXG/FY44+czng/lL/U/Dyk+viV+4zxjmks2tr0+EKpkCnBfwdABrVKfRH8A
 wgd+j5+1Qwg0fKJwT6DorcLTi0+CraHF8OUODNW6dXys9AnzVMQJIgXKIO/0vYuJMg4j
 F3MVhogd2nlFcoTxMYGxLtQobATEDpGODAabGZbvrTKzcgnzi5PJzbSLtNkbfQtB+5KX
 cBONDQKjV46pJyzVVamT6fabvm4KK4zZuNKj+y+jR9K/7mD54Xkv1wHmH5yy4+9IwGgz
 H043ZEeDuv6o585ofYqkt69YCvWExYhGNBhbwcjOwG1arV0OCyJw1hssydXqAeHAar8W
 O3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789363; x=1773394163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ODTnxXdC8dJfVMMnO8L2V2ZpKV53Q2IrgocU2xbWhg=;
 b=KFDJE2pEHxeLdzvOsbiVhs7IXdBoIRymO+KNVxLswk+jX+PaHAx8QM3tKhcqot4CgL
 Zd2Xa2lo47vzJR9+KuJ+O4pjQGBY4AecnpCMKQ4j7or3SbJqTc8+aB4Kg/SDzHtYi2ml
 6WfkW0y7ohD/1e4+B7ChI+BKpH4uM8kbplA40XwOcuO3PU615oSho3FRBsZhAdUBFm2T
 WcJeAb4CgAjba5AbPapX5iLAAPYknsmhO3MG1rDNzjJ9GGUnDGkoD6XFeTqdX5zqd/Jd
 dPecrfDhXSg/rHH4JXl1TYcm54D30VM5k0wDqy+xzuQZe0NZOGWGudm4RMqkZDbp9NDs
 v/rA==
X-Gm-Message-State: AOJu0Yww2r5Vt5kYxjSJE1l1DoIsEFYscqDRTrJ/Ik7sHo54rY/PFF9J
 gVXurb05yzrAZEUvJWs0IDMpLyA4JzgiMqTYIYeQIMol3V5R3+q9o6/v
X-Gm-Gg: ATEYQzyZiNmeUJmnhqDJ6rbeeAeCe+5cbPpY0j6dPOuFEeSjZ9Okodp8rb1FSujRUkZ
 PsYHYp9kdpz4pcsNraNlvJwwPjn4G7w+9kCA0QgkzibFbFGIPLQSDtQJL6PsQ/xBXtpbBLcPrwX
 tEAMrjQlkoc5U3HwbaAhDz8lIsvwd1Lpz9IU3eo13tQjLjHrZQcyCdoNOsg8XnjLrZNL/34Dg3P
 YQYV0AGIHfgfuC3ZjBLRz3BC5eJ+7ivsEK8RnkVXG+406BCEcVUyv7iKh2l4G5wbuaI7cgEVl/g
 QeqyYlPBFfmxS2WpNhXFEjLKdJynGmyGffbfCHDvjwgzXt3pxcRkstBVwBHw/a0OUn7vNNKv4FA
 LI+xV4mQAbwDX1FK6PEZ5tc4o47KTJlSHLBMiZSKFjmVqcsg8fgWPokHLYpOCrQkWtYTB2X8vTk
 MCKxXcuo+DPM7u5u2aj55wsXOVekKgYiGXsrVAe+Sisp5sTVvJGTz98RIeHaCFPD7nNoPpJdpXi
 vfzv7PStcvpwi9Bh45EKO/UvvLnJPL90i6A8oBwa15Z7LY=
X-Received: by 2002:a05:6402:1d4c:b0:661:7ba8:a49a with SMTP id
 4fb4d7f45d1cf-6619d4c7749mr847027a12.18.1772789363257; 
 Fri, 06 Mar 2026 01:29:23 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl.
 [84.24.131.219]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Mar 2026 01:29:22 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 1/3] docs/gpu: fix typo 'varios' -> 'various' in todo.rst
Date: Fri,  6 Mar 2026 10:28:20 +0100
Message-ID: <20260306092822.48393-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: B5CC5230A76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[52];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrrothig@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..33678b669339 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
-- 
2.49.0

