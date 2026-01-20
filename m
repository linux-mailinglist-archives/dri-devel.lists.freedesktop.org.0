Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABtXENasb2ncEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFF477C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7F10E5DD;
	Tue, 20 Jan 2026 12:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmmdTeU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C010E5DD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:50:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a743050256so11022495ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768913444; x=1769518244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJYUWQwQhgkeAbC/dM1w7lsNUkVncAvp21VUFc05s9E=;
 b=EmmdTeU0IPnXpSVuFeYLipxCuHZNskK24IzF4Wb20jEExE+Cz07/Jj+hKPQXYkDdNX
 jTyGuDsXfoQ8Q2LdwJRluMAqEbuVYc8v+VgDbXopKDQNh0Yza7k0tZutdnTR4t3SGOBD
 4C5ZHUikkhJbC2k3PPVvJ7pFPkKf0X57ATEHS46/Za+LUxZiSXD0I+lTZw57lemDzOoc
 Wf0BVr0NanoMajXnlNbBQY+Tdz0F4RElkqltNq2L9A8+7l5rNphm8DlQ/1GYZT96O0RM
 gd6hxEV2l6HqtcjLuANXGtWh+Bc0QkvkzJbPKmwPDdOP3UmsqNglth6gR7SORNJUpn1N
 3iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913444; x=1769518244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJYUWQwQhgkeAbC/dM1w7lsNUkVncAvp21VUFc05s9E=;
 b=xSJoa3dhd6u8es1KWYUS8zvQ5VeDoh7Ari/paESIZ4HdS8HJM5q8/G7QRQecRY3ecM
 qqXcnsorO2HsLhyFfk4IeDdb0Z7TzsuNNAsuNb579dijf/VNKW56TEx4+K1/SQzvPuWG
 XgH75aDoAs4dwt8pZr8WpXMoz4PlcCyNBiWlgUUD4jEOu5DU5Zhh41olBeO5hB0PEIXW
 S/DEZrBPaY56QWuWJ+qo11r0iXQqZ0AWQnnYrXtyt6InUJYi6VQuIM3V1lWNoyzn4v/F
 3iNtlMpBP4xjYqeq8pbOHJS7nJemlBtMPvhw/2OqfInNe+vPki41X4sRNGLOWSaVBHcr
 wmEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxQYuBZomA438Sidzmsw6Gc8abAQbeAwesDhiwjCyZ751loTITV9arNOB6WX6JlPNUbMNOfxTTMtI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQelrmwUY//78sD+Wjf7waWVGZEpCyaDkJ+JXm1ACqh82F0vP1
 J4QGoka4x7TI2tTMeQMkr0bco6pXJmws5Q3hmSQ+C/gIltVQ8HXvmCa7
X-Gm-Gg: AZuq6aKv20MGT0U9uPKb4V1FstjwQiUd38wWVoA0LXbHEMeeL2vvqM5JqPY8Br3BgwD
 Fn9P+s9sqQstZDdqgnmp1nurJylL1/1HS32eBOHXDZqC6py1I7/riYsMz7zjOv3lbugqgVC6gtk
 uABqVcbkCCt7eAuQj5eYf+8TdCYQ4l2UJtcsjME7QcJLnr02/65lGWsJEyCHYAOc8qocDB0hjdO
 wmcgQj23vHJJHHvwBp43CAXixKNhCaXhbVYLUYR+7FHf6BZ0s+w+PmI5LVd6qvScDxd3RfZeRv9
 RUIvjGTUijFwj3i9V09MavKotcpfN/AhiJIV6jhpVliIe+slEdnoDfaGy8zle/YC6XlhqSpPQA7
 j4uDJMLA6ggS5IACD/xnsqtw00CTl/pCmqMiUIQnBHS0QwSS/4keyv337dAVO9qA9tJgiNBdN25
 uVj5EZG/cMw6fh9PywuE0HyLwpmr6e96VuQ4WZ
X-Received: by 2002:a17:903:1447:b0:298:2afa:796d with SMTP id
 d9443c01a7336-2a76b26ccd2mr17322155ad.61.1768913443613; 
 Tue, 20 Jan 2026 04:50:43 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 04:50:43 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 0/2] backlight: gpio: add support for multiple GPIOs for
 backlight control
Date: Tue, 20 Jan 2026 18:20:34 +0530
Message-Id: <20260120125036.2203995-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tessolveupstream@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: BAAFF477C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This patch extends the gpio-backlight driver and its Device Tree
bindings to support multiple GPIOs for controlling a single
backlight device.

Some panels require more than one GPIO to enable or disable the
backlight, and previously the driver only supported a single GPIO.
With this change:
 - The driver now handles an array of GPIOs and updates all of them
   based on brightness state.
 - The Device Tree binding has been updated to allow specifying one
   or more GPIOs for a gpio-backlight node.

This approach avoids describing multiple backlight devices in DT for a
single panel.

Changes in v2:
 - Used devm_gpiod_get_array() and struct gpio_descs
 - Replaced per-index GPIO handling with descriptor array access
 - Moved the bitmap allocation to probe using devm_kcalloc().
 - Updated commit messages.

Thanks,
Anusha

Sudarshan Shetty (2):
  dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
  backlight: gpio: add support for multiple GPIOs for backlight control

 .../leds/backlight/gpio-backlight.yaml        | 24 ++++++-
 drivers/video/backlight/gpio_backlight.c      | 66 +++++++++++++------
 2 files changed, 67 insertions(+), 23 deletions(-)

-- 
2.34.1

