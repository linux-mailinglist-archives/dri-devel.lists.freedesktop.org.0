Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FFAB191FC
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC6E10E4BF;
	Sun,  3 Aug 2025 03:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nY+4Z6/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B2A10E4C2;
 Sun,  3 Aug 2025 03:59:19 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3e3f135bccdso15275005ab.1; 
 Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193558; x=1754798358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
 b=nY+4Z6/sW4AQ30Tp8UoldzsNS3eBIoudu+KJOWuAuxf7Sn2gQd4Uw98hkXiQZn2coi
 oDB7/Z7mXt+PbDd82M5Lfa7T4JIDEwD7Wec7lDQfwbnXOAnMDj0t1pCjl9gRV89eaAIS
 guyeXPIoiC2isNtF3F7VGqOI8pW4e52vU9Xx1MqOiJbqKrxbbNa5rj4W+Nom/wrYy8eh
 2zluhLtUH1qqLfiiSZpTI7GbV6m00GXEJ6kgWcb8TCYJ8njBSLH7CYWgcjkpy8m0RDaK
 3M/KH1swTf+e0c460V69XiRHJfUhPfuAINkUIOyq9el4+jSKmRng9TsDr5vMSeGkJWia
 pvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193558; x=1754798358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
 b=r/74mFpA7GJT86gOd4EHIWHRnJwgXiCoqgeIWVT72ya2bMGZkJKwvsy0s6ISQIt5hk
 rm6MoXGfdE4+5L0iOei7ebs3sqaQRx+XupLirM00x0C8G7jJDYjh3BxWIntWScwuSuTW
 5milrz+el/y4ikyTdarL8ek6J8KV9UaKMhUkGl3OYZGnm8jCgLww1SGRvWGoe9k/shEZ
 1STQ2Ov46yJACOVVYzMJe8LeN2it4IuOWqWyedbHyJj+9hrhvcyqX9Si8VzyMFmCyZtR
 MM+7KBL1K1+VrhlTyF/g8r4RiYXikabL37VUuX/c6n++Glq4/VhxuRubUOPOVUf2QQ6j
 Z+Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsuowhUJtv28/PxRtnSzIZY9mO6cSB+8M/T5DPv3ai7NdxyXYYb8Ov0ohOQD90M+ykuXrg9t3T1o7n@lists.freedesktop.org,
 AJvYcCX2420CVeMuPpeHKPQ9tWpkwOlXx26y/Vpp5WECo3nB1xDi2tTC1QIjpNpJGfqSpWOkUpDrE+m5@lists.freedesktop.org,
 AJvYcCXFYI08nByz+P7YKkFcAkAZNhqDYKiY/fBhRqIDsrXEk6IRmZ4RRJJhbhr/tMlnrFHL9mE7PbEjJR8hes1L9Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7iXSnEdl2lTXvHIuMhL/hIQrfQqEYI0Q6E7j34/NbyjWnfjIn
 16+a/PxvnZHuPnUTRKOuViqW28RtoZZkg6HX06ywyeEv0PIh6Jpa5jee
X-Gm-Gg: ASbGncvM1ofErEHE44x5yIp91+k1q9rJqzIi5sBTmU2b4wHZZxxQkXm/cZDU7cBh/rw
 7mUq76637rUnqScY6dmYblSTLiA915WSgwJ/r0CXCvYzHo/eKg5jMp54v5ajdYzQ495rA+U98yN
 nSQ6s1gj+SBd+rVWb5PcygH9V68nVp9nkP9FFagqE+Ea643Bs20lryVjhMlbGhEnjY5jB56Hp/p
 Zy15UfDnS66fsrvVZRlK5UDm/JDNwrWFTNEOnDTdBjQrUFT9fZLkUUZxcpHXm8EEX6rpXsdStct
 Qe6IXbLJ+5c+VMJ5EGNV6HgbZ28NGhPyvYEErQZgnIGeFi0FxRtlfFV789pOEaVpwKElkmg3JAb
 HZnhQrgVB2PZP9y284kB6Ix5y2zC1vX7LH8LC9Lqi0w42sS1Q61p/pdKSrELc+eC+69hlC7SdOS
 PTvA==
X-Google-Smtp-Source: AGHT+IE2FO7VIZaFeVJY5KU2r630EjFzadS4s75s0S/BwhMpT2559l4J/Oty1dGX6agEpkO8lUIXsQ==
X-Received: by 2002:a05:6e02:3b82:b0:3e2:83aa:1375 with SMTP id
 e9e14a558f8ab-3e41615baf9mr95938835ab.14.1754193558557; 
 Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
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
Subject: [PATCH v4 30/58] dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
Date: Sat,  2 Aug 2025 21:57:48 -0600
Message-ID: <20250803035816.603405-31-jim.cromie@gmail.com>
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

Reserve a flag-bit to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with 1+ of module:function:sourcefile
- was previously called
- was thus saved in the prefix cache. NOT YET.

This allows (later) to cache part/all of the dynamic-prefix for each
pr_debug that gets called.

The cache contents must avoid the Thread-id (its not callsite), and
could avoid the line (to shrink the cache).  But then line needs %d
each time pr_debug is reached.

ATM, this is just the flag-bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index bc26bc9128c1c..0f7476456614e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,6 +38,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-- 
2.50.1

