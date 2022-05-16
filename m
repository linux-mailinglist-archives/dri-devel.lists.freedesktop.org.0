Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1052945B
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955B710F51E;
	Mon, 16 May 2022 22:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C010F5EC;
 Mon, 16 May 2022 22:57:31 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id l15so11555902ilh.3;
 Mon, 16 May 2022 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+2n+Qi5LKo8xdlXx8cZCrXhjdY5i9BhXeRgFpMPxBs=;
 b=NQvoUylIO5JvRYRKkb/PCHnnwolYl6EbdFp0mMCOv7MitmhVqHAb5guVHOretvbXjK
 ZljP5Zq8ojGECCuyNcDWedKGEwHiFr3bCx9zWLEYf9W0C+nds9whhURlD9XhKiSCO7DQ
 OGyXFxaVtVysjInj2DdhVyi2W/F6rtyFXOxT1NDAy0Fyt81yzfNimcH58u9kA9Qk38k+
 sAUPfKneovsA95xw04+fA0iGvfWCZmSteGV7Z7d92x+iUTw7lesFH+Yg1NwMefbEH99a
 RIrxuNyTYvZK9T+FMAQcUTHSJMrLbpYDwtOrpy/1WdhW9+HOExR1Q6lM+Eh1+wASXI2c
 ojNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+2n+Qi5LKo8xdlXx8cZCrXhjdY5i9BhXeRgFpMPxBs=;
 b=LLDVCQJmufRAAgRclwpneWPZDBVwQvkYcZejFObwUbb3RMo4XZWmXxyPMKQAEKoX7u
 fTrANpO4xM2zE+sC4Y8YbUZM05xDwf0d7oDOYvkS59ftt5HkODA1ybzV3YHGheeY+IHE
 NXEopMo1t/X5a1PhZhrnvTs+U98aZCuhPxxMWXStaLQ0u7CzpJQjqguMsssvuAM2/ovl
 2jyfUFdtPb2xlkvZYOKVrp93Sbii2b2PAUk2jaKOAwlYABxPQ0GzPztGBBMsaNzBo/Ah
 WQusHPbV9iUOhUksjGaE7ElYMPysrnBO+eM5PMa8jpBJIUGnCB0XTxOTYAXTQWv/4f2f
 /yJQ==
X-Gm-Message-State: AOAM530kVXWVPdcO+8HN9utgV3s7RhJdxZ5q32gaDQUoXoalWdqjuBcY
 r5uE6nAoNS4t/78ze1oBDKbnboTB5vw=
X-Google-Smtp-Source: ABdhPJzgjBowqiniO3Eh7ofaYMSxlAshWUZJs/9dRQj0V0v9y1HG3rau/LeKW1REX4tDssVHSSqPxQ==
X-Received: by 2002:a05:6e02:1bc6:b0:2d1:1344:6727 with SMTP id
 x6-20020a056e021bc600b002d113446727mr5815014ilv.58.1652741851004; 
 Mon, 16 May 2022 15:57:31 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 24/27] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Mon, 16 May 2022 16:56:37 -0600
Message-Id: <20220516225640.3102269-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 vincent.whitchurch@axis.com, rostedt@goodmis.org, mingo@redhat.com,
 mathieu.desnoyers@efficios.com, quic_psodagud@quicinc.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add new flag, and OR it into _DPRINTK_FLAGS_ENABLED definition

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0a81a3582281..7581fe79980a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -42,7 +42,9 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
-#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+#define _DPRINTK_FLAGS_TRACE		(1 << 5)
+#define _DPRINTK_FLAGS_ENABLED		(_DPRINTK_FLAGS_PRINTK | \
+					 _DPRINTK_FLAGS_TRACE)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
-- 
2.35.3

