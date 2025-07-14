Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E15B052E3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B39D10E52D;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/weZmP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C4F10E452;
 Mon, 14 Jul 2025 10:45:51 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so3352645b3a.0; 
 Mon, 14 Jul 2025 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752489951; x=1753094751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lACXWrIyx0XepFzYp8lYN3B6VObrUZBjQ6Rart3u69s=;
 b=f/weZmP95+b6x/YdPFKREiiC/90Osd8EvZj8PX76mDcrdpO11zirndDlexmwVJPPnQ
 PPyMrvhljGSQuqvKB3wWmEaWZXYbLXLKut1LOIuy3IYAq7VtcWmH5I0SWi0miljerP9x
 F+Z5p4fUtYy2E0Vd+CItGLV/7xbbNJbymMPE1+iV80GCn9h9Fmsva/sTVmWvyhr9oVqZ
 LFI6g/toIOIz7xUV6zSx1R0ge5Qdoxaos1CcW1AGflKsQeOUHcfnhGDikjo147n9wd+K
 pd0M/cL8Iu17HnhEEqOuJ+cizr0GJeXYVW8ymaglZwTuygU8r/Se7wl6Qpz7jeoHJllm
 oUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489951; x=1753094751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lACXWrIyx0XepFzYp8lYN3B6VObrUZBjQ6Rart3u69s=;
 b=cYKHifq7duG2Hv3HTEihsjTurp0nGgl4zeWXWoQBTXQNW5zbJ88zkPwqIQWX8fIgaL
 gnSPG8kGXvhwD7nUxAyQtmheBC7iUCS0ckpqmITHYEqPFJFgk5ZgTCLBDAsJCrn/OR1Q
 29SKw3di6UOqXDNNUK3i5E05MR3vOSIlXy5Rp/xNPXhQaS+D5vDzeQczfa/mBKqPJ6dC
 d1/q+s3AnKV6GeiiOFouxkaqB7Fwav6yOnRxFYb8jtU8b2EV3ES8ubrWeronEiGGh11w
 bAnekeCZ1EuALJtN69XYYLqMhP8vevzTLaz8HiYZ1q4HvxrZIl8TiA6B194W89Y+iytm
 v3ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbMy1uxaLXqLIo2QIemATCQyL5+/8ergl7ec1LlHxBitlese/h6pv42x+0tqVU3CvE5NG3bkpGwHQ=@lists.freedesktop.org,
 AJvYcCWervY65Cf4AGZWAIEFN+Yf0WpZD7P8l8xL0zSmIqQvjwRxJSeVZ6lvmoh1z6hkUzsZOjflBBMEGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqV+8VDzZLh//B5s4HNKkfXKG+vV+DmL6tcxlgmlXiZrTvmSSb
 KmhUlVAAsxbbt1b+GqRRybBJ4mkyFwfaPr3oCQKumXHKcN/U79Nfvgfs
X-Gm-Gg: ASbGncuPrCeWo7GJEzWnLqlgvx67or7A0BoYB6zwX+MtE2znn1dp02cpViX/p8+C5j2
 9kvJHtPH1fEYiZJfJyizsBChGPPv5DcIHWk7ByDGIX0wsDozUSAR13v8hJGx5rA0Jmh0iA7FspW
 a+wRAbau8gbI1XA9X8nK7Lb2cpSC8+YiQiHKgR6pi/uxOq3D/+1et4Qli81s31rnZw0bn5jokrM
 YaAMz8HlH96JbK74zdu1ZIddnO/Olx/L077f90cxChf4An3CYr6zunzstyaq8jsjk+u35iCeDJY
 bmplxLV6u+KzGfmGTca0ELWWcIHokWAHzQDJ/zzDzdy7/zdU2McTF4sMkPfOa5qJeG/sf9wgbF6
 ja00TQ0GGDwrb7hzdgG6kGzyK
X-Google-Smtp-Source: AGHT+IFLPKx1BZNNAyFNyKEkIkORD8Kmtj8nI6gAHdSOXogrL29N95gdsu5VKoCLvgamTF6GYkS1+Q==
X-Received: by 2002:a05:6a20:9d96:b0:220:898b:2ca1 with SMTP id
 adf61e73a8af0-231285725fdmr17928439637.21.1752489951050; 
 Mon, 14 Jul 2025 03:45:51 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e058fesm10320909b3a.40.2025.07.14.03.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:45:50 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: vbios: use size_of instead of magic number
Date: Mon, 14 Jul 2025 03:43:14 -0700
Message-ID: <20250714104322.100511-3-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714104322.100511-1-krakow20@gmail.com>
References: <20250714104322.100511-1-krakow20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

12 is identical to the value of `size_of::<BitHeader>()`,
so use the latter instead.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..ac35415b4ffb 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -365,7 +365,7 @@ struct BitHeader {
 
 impl BitHeader {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 12 {
+        if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }
 

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
-- 
2.50.1

