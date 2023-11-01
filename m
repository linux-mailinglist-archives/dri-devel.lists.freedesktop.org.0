Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B497DDA02
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE3C10E633;
	Wed,  1 Nov 2023 00:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30BB10E628;
 Wed,  1 Nov 2023 00:26:43 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7a66a7fc2d4so230522039f.0; 
 Tue, 31 Oct 2023 17:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798403; x=1699403203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XXimEcMUHLKcy89kdpmOcYiRa3Yj2O0YL1kh5UVcGE=;
 b=W4G5c3rw2yB0jdnDOeBICQIjoOb+jKR0rZWcUfvej4tJNJP8SxKtz/K58jpabfFGOk
 PdzKVnVP0FoN8JGNXw8tPYd6HFXtMBer4PU9G6MHbVhFg4gxN/2Fwb3cikYHfTowwH18
 bLOAYIfhCDkH+kHDciXLfkaE8A2UXlyG/rz29TlHLQZZE0WKL6WXJrx7/utdI5r7/Tc/
 7+wBxRLr3VSDXCxep4TdGkgDc1ZgDXWfB+tbwWIIbPOwJKkfdOkpou0ot12h05ahkC55
 MtVJui7Hy1n885EQ2wmbBvv/YuOGgpGuztc8rLKPWE+tUeosIdIQy+hmiYt++LF20C9T
 tO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798403; x=1699403203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4XXimEcMUHLKcy89kdpmOcYiRa3Yj2O0YL1kh5UVcGE=;
 b=h9VYuoYz9npSJz5/ygDx2dT0j/Kg08Fv8IJMJBUNEAuby81sTqdWwU2PZhoSPOltUB
 gDCY0q5Aljnr4bVirK2ZNtRqeYT+LsoS1asB9HOPcClXxlDbdImMKwyq1VYzkLMpOLts
 JmFK4lQTFPd7HTSLeZ/YqnzxT/dld7f159PpGYThaTqPjAxHWxIWDXGuZEh9j6/KRmlW
 hQVr04rRNk4f+YNQRIbLptYt2TkSn2edIijogvmv3lcOgTDzYEeukAf/yEpcmZj5rd5f
 uTe1UWJ8Mtn8nXo9keuFuhGh2y+vYPBARDxfNhvOeREJi3mUSK4YvRNQpDl5wpRG8Xnk
 GaQQ==
X-Gm-Message-State: AOJu0Yy7Qwm2fOEg37miOcDVfnMMfws1CQHt4yoi0jtZcVTP21MM6yHM
 eHP/z0gbLA+yp6dnANZaCPk=
X-Google-Smtp-Source: AGHT+IEuxw5w71K77jdcQFb+x0zSRbj1XYX7dWzhjRL84L4L9BuVeF7Xwp09HkHULcT6OFMfMKAQzw==
X-Received: by 2002:a92:c24f:0:b0:350:f352:4853 with SMTP id
 k15-20020a92c24f000000b00350f3524853mr17133011ilo.25.1698798402979; 
 Tue, 31 Oct 2023 17:26:42 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 18/23] dyndbg: reserve flag bit
 _DPRINTK_FLAGS_PREFIX_CACHED
Date: Tue, 31 Oct 2023 18:26:04 -0600
Message-ID: <20231101002609.3533731-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reserve bit 7 to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with one+ of module:function:sourcfile
- was previously called
- was thus saved in the cache. NOT YET.

Its unclear whether any cache fetch would be faster than 2-3 field
fetches, but theres another factor; the 3 columns in the __dyndbg
section are highly redundant and compressible, but to get the
compression, we need field accessors, which will rebalance the
tradeoff.

So, for now, its just the bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2a7832b1ba5b..4ffddf5e9152 100644
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
2.41.0

