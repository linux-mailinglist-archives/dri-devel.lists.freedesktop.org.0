Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA722B191E0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468B10E3E5;
	Sun,  3 Aug 2025 03:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNLwl7Ko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083E810E3E5;
 Sun,  3 Aug 2025 03:59:01 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3e3e4a5715dso8642905ab.3; 
 Sat, 02 Aug 2025 20:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193540; x=1754798340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
 b=gNLwl7Ko1zswlccCZ3HRFc0E+0Z+H6jGzimYAaJQLM8TR7FdINi/wXssDGYmAKvjvz
 haZwr7+9Lidh6nd5BSihrkc678ikm526xt2zeGTAO6e2Pc8tueODAQTMGQpe5lqMYIN5
 dw2P6/rF+xY60kfT/tI3ej0Tk1ygGOGC6ucdyWSWmVUjhpvp97Sh3Taq8B4bWWAMW3Ez
 xdPG7Zj+9WH3KzSSMc3muPEf5CYT81/lEI4D35ln5AQIpMxHWIFYlKZvxjvTcz4uUX68
 lr4yn6ne0MD1ZC6hQw2WiAPnfAdCrGpBp+S2MVx1aST6zxqBuisjfMIi/cjgdjc7p2Ce
 ZS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193540; x=1754798340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
 b=mi0zwxR7rOXIMhmzJ+OrbCnNBPC7pkfrxuvq5k4W8KDjHT0AYzTgTPy0pLMil1hNc3
 wLMvFFUllh87aMP+MNv1SggQeVNI0JjSnmNUgUfIYd9HhbQPoYcuZmFtft/trSa+LFl2
 TrMlW44BcuexfavrtBZVm8dVzygxSuvN1BpL6ydPRljokGLp/9hmpQubeZ9ST5YFWMGp
 C2b34QTS5hodZPktCc79tnjSMkOz7Hjw/6Y4WmEhovUpPCziHklGtIHS3orxcZJV5+Tf
 2oU/5g2bBwDxzbPCW/9LbM3apgC00nbW47h9/3Mj4amQ7GiCrvbcUm8hX5l7wPiu9wnH
 abOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIAL1Gu2I5hGZiCoza9D5yaspUcucuToq7/CJ+Ar+dLAM2GE7Aqo/Cxa6b/WF6tyHH4ayrJ0mF@lists.freedesktop.org,
 AJvYcCVmgdOCvgoqKshKym22PLEeTMQRHNsxeukbjV5FESC74hX7uoCbASfhxxlS9Rts1qE77ibRYyeFJ+Eu4/+j8A==@lists.freedesktop.org,
 AJvYcCWagcbLzrbgblQgHZWN11/oTKGoL/J8IWUjJFxqy7F+SszvDdeMz3mMDinlurUHfeI5EbExLf2inylM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys7L0t29aTN1Ho+ggdcRZDAXEZGP1kBGr5qT+VhvoDWmyXLvpt
 QJkNK3h0YrbQt8f3YXbfWi8Q4mYU+6zC2WqShb1qn6sDFkKvMt+FnneG
X-Gm-Gg: ASbGncsQhDfZ9Jd52N7N4ioWrfqxaVBQ1TAMbt/UfyaQ8vPq68Twp48XfM7X9L931aZ
 Pn0rso9gFE3SZhfKcWfx6NXTl1jP0l9urvkCH3WcTims56VAX+FhYr9p2hlkCUkOynZTN6ZQli7
 QzsIklIcpCbRwZnc6jb18SCNEbCovi3rFwMa+HY3Km3/fHFiPrmx0niZpu+dBd17WHQNW54di3/
 cU9XQ6Rvo2Wo48PMYrE5ThcZ3Ximky974mpCRk7SRSsY4sRy8/PjzL9FvVwu38BuSgPsUYPVeWe
 o5am4wSgMCsFHwCxDQaIjaTvR3gHrIvIEvedwOn4TapgxZiSpou93cuQVqY9K9xYvDRTw+FsL4I
 abncx/9hFH6Zmbc37G4brflExV5h/eVykv+hciRb6zcYuPHRpgBQL5vOKn2mp+ndJ+T7S9YzR9/
 PXOQ==
X-Google-Smtp-Source: AGHT+IHGjrGeB/JwKNMq2lNHvYPJcP3h9GIpyCQ+sHPo7dWlzj+a9+9jFlwqwwnEMpSJYhvD73NT9A==
X-Received: by 2002:a05:6e02:2194:b0:3d9:65b6:d4db with SMTP id
 e9e14a558f8ab-3e416191d1dmr96253475ab.12.1754193540188; 
 Sat, 02 Aug 2025 20:59:00 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:59 -0700 (PDT)
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
Subject: [PATCH v4 18/58] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Sat,  2 Aug 2025 21:57:36 -0600
Message-ID: <20250803035816.603405-19-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 769f02456c8e0..1785ef5b93b15 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.50.1

