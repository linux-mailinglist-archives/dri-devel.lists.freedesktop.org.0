Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD70B191C2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9410E497;
	Sun,  3 Aug 2025 03:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WwuTptF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713510E497;
 Sun,  3 Aug 2025 03:58:42 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3e3f135bccdso15273935ab.1; 
 Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193522; x=1754798322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
 b=WwuTptF7kBvqBPSvrRURy6NLDdG8V6DYAx51ag59+WiZVKcN3lPM4GPHvY5nu7zwqo
 /eb+4UkIoc+C6h8Rhud5UZiCGrX23YEM6CLoW3GRXcwnrNuMXFI+qOv/kIhrlNp6Jk8Y
 uaLNQQCxS0krYxuHmCJOSpZUL70L0TCaje0f4rtFxsJ8yk1gV6FtlJk2Hp4ZKiHp+zYc
 2knDvoAtd6C4y7R722OBx17tLoQB0FMXbB5eyB6y+Z7tkk3jWsAZFzVMjBNIFtfMl+Mq
 zfw1ioUdPmaRVvPEC/z7UkZmx4elZhJimaA1mh8hzWYxXm1tlpaiWHVOUR8B54F635Wi
 awJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193522; x=1754798322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
 b=n3gfkDgHQJAsee1yFmF2td2sD3OkijejO+odGmeIK97SZvkd3nAvW6Yl3GKAqj/4ob
 Gd+Ir6+nnrguqRv63N0sntPPmeIol+FD8ODc4JmG/Qr8XPgkFfQhHexL2ArDt+tjASSF
 KaDMa/7zNxDxayfP+2mVzD0hfR/+YISWSYoiOR0mpmkFORB7naJ+GUsrTuNr437TJoC7
 dbaiVy4l/GfBcJW2Vfk9gw1vrkvTtvgnps3BFn0gSzDP74QXj4t8I9+Tadop2naDndND
 KMPjOOViM9eVEnb88MZw/yKVwqPPWLMqaO7URQbWmD5oeujp6e+fgmVOLlxCS0w+T9E1
 W7+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHLwel3yQPQUtVOMagC7VLL40a/BN1C5AT8T5ueepSLzswzJN1SVQsLSkLHTdCy97QOwtVhy5Z@lists.freedesktop.org,
 AJvYcCWvuiKdLvUf2l6rP/FlQUWffBMpx1UV5UCKBuZLR+hQsTkxAjm5SdgyBqwwiWtMf2rVjbUA0shVlPSHHJJj8A==@lists.freedesktop.org,
 AJvYcCXt4iiLzXH1iEBZi2hZGdlU6Tf2s44j3F8Ltf3W2SDBTAkPQoXwHqV/Rd3p1YWrT+KRN0cJUUMJ/Z7O@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdpxyd0xf2Bxe5leqef7cCRfSgSLRVSZL1aCRW3Myxc4He6Wq0
 e3L7KVJYtAf/Hk5ox4KTwV3mRnH0LLIJ39l9oox/ExAjC+zUJv8+m7IH
X-Gm-Gg: ASbGncsMCqqkkUJUnm3da4keqvpd/byLL7AFAOvQTe9h/v5ciHZkbJU3nZu41ERmUu3
 ld4FbWXTzoIFh1TZcYNVi/lgw9A3nqz28lyns/ag35ugu+nJuFHR3Vy9xj5ctlOsIqSmzC1+3d5
 kf1A5wUvolamRoKf51HDZKkZJPmBfoEimnmDjp7B81QEfyf7pKoH7EVTmhPckFdbO6sTQJ/TQNt
 Wr6d5qOenjoZH7xgnMEvFIEqO/fnO26CuN3b+0lUnm8ZapQY6NTNnlhpm7HwbmC2qpA/X6GDcAw
 DnYmLUL913XmSppqlgB/8w8zFmFJr7ZgGzhjni1N3j+1GwkbQw9JH/2rwIpX8d0iWIVP46C2wyr
 SfkpQi88auyjLkLhoJy6Ws5QHifF1KS0Zecq5Cq3+OnZUYniOzxZc62b/wx5CV/WoFv8SACUCov
 Kb3Q==
X-Google-Smtp-Source: AGHT+IEBPg9osrUDJ2eMDLZJ8n8wcDzvlf2PJNGm/kwan5N45OjUBgHKkKoWTIKMjcalGwUYti/UbA==
X-Received: by 2002:a05:6e02:348c:b0:3e3:d674:6754 with SMTP id
 e9e14a558f8ab-3e4160fb6fcmr87580415ab.3.1754193521740; 
 Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 06/58] dyndbg: drop NUM_TYPE_ARRAY
Date: Sat,  2 Aug 2025 21:57:24 -0600
Message-ID: <20250803035816.603405-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7ca..ac199293d2032 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.50.1

