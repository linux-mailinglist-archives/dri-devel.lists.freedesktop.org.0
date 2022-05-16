Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60CF52943B
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06110EDBA;
	Mon, 16 May 2022 22:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7AA10E819;
 Mon, 16 May 2022 22:57:14 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id t2so8465219ilm.13;
 Mon, 16 May 2022 15:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcTCD0gjQirPulppRUPJolVEvdGl8HWNF457l2/VCpM=;
 b=Q9CmR/OAi4f1fJoHiSq/A4+KKe+6D/bRcwzXAN4CXFUDU9W2e/2rDFlaPtn9DFL3UZ
 0OP+IoKCCh6jybN/4qKugRJr9T7OMuUWB4WPcOmePoEDyIWmnOH/Ox90OJPiIk7Uj2Ay
 X08/tZRG4GW7glyZeaVHPS0481a3PaSmacbBlv0ZZESoKc5evx9H5So0ulM0I63j44yN
 SP5T0u614Gkgwz78lPA4m5oH9zHG8D7tq0xAtxEPiBhUov/810saX6SSHCROypTyuHX/
 Hi1iw+N+BFIEL+BpwjFUjSZL5bIvVsgrCFPtwfR3vAntRQZrHwooDLmOROaOb3jpAut/
 oK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcTCD0gjQirPulppRUPJolVEvdGl8HWNF457l2/VCpM=;
 b=lInQR9ZHQcm2DX4VqPQ0jw3PvdeilrPhGAcE+T1VyfMJC8bXZ8STF/xhdEMcxEI8L+
 4UJeLQXLglzSM7Zi2fpa4P3aJCZdwml7VxR6iaK9BKgeWb8YRW4XsxvNrhObBaOU/Nyk
 aKeQWT4gcPxOWzyP5TD6IxX715GGKwrg6xLiyQCD/0QNBwaY55/4P2DwqqJRBtHoFoWI
 zPjJIMPYVrYDbRWQByTKq52MlktrpdZ6Yb1lVW0O4hp9gBUtZSQ8CKYIvcmWuLXEInON
 oQiEloewMQE7cq0eetCsdNTrRglY+t+0epvwashRZWkHiFiaHD/YlZxYN6u5Q3uQumrW
 CQNA==
X-Gm-Message-State: AOAM531fhJuTP2LUmrdp/bVEIeuerosG9imcn3qMTHIgQ+iLQWAEdyxn
 WlyOW/u4p8vJ0eXDdildPhA=
X-Google-Smtp-Source: ABdhPJx/jSyAjp7ehDTr/MAgCBe4VOWPaEYbecT5v2lmg6AJpeafbX8FKEwrz5Q30LOOcV3+TCIIVg==
X-Received: by 2002:a05:6e02:158c:b0:2cf:db51:f69b with SMTP id
 m12-20020a056e02158c00b002cfdb51f69bmr9710970ilu.263.1652741834203; 
 Mon, 16 May 2022 15:57:14 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/27] dyndbg: support symbolic class-names in bitmap
Date: Mon, 16 May 2022 16:56:24 -0600
Message-Id: <20220516225640.3102269-12-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the sysfs-node bitmap support to accept class-names
registered by the module, allowing:

   #> echo DRM_UT_CORE,-DRM_UT_ATOMIC,+DRM_UT_KMS \
    	 > /sys/module/drm/parameters/debug

Do this in param_set_dyndbg_class_strings(), which is called from
param_set_dyndbg_classes() when the input string isn't a integer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

---
. continue/skip on unknown class, so following symbols are processed.
. better loadable module handling, no more KP_MOD_NAME
. add do_callback_changes
---
 lib/dynamic_debug.c | 63 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 42dce2e76014..8e1b9159e881 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -618,6 +618,61 @@ static int do_callback_changes(const struct ddebug_classes_bitmap_param *dcp,
 	return matches;
 }
 
+/* support for [+-] symbolic-name boolean list */
+static int param_set_dyndbg_class_strings(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *dcp = kp->arg;
+	unsigned long inbits;
+	int idx_rc, totct = 0;
+	bool wanted;
+	char *cls, *p;
+
+	if (!dcp || !dcp->map) {
+		pr_err("set_dyndbg_classes: no bits=>queries map\n");
+		return -EINVAL;
+	}
+
+	cls = kstrdup(instr, GFP_KERNEL);
+	p = strchr(cls, '\n');
+	if (p)
+		*p = '\0';
+
+	inbits = *dcp->bits;
+	vpr_info("set_dyndbg_class_strings: %s on 0x%lx\n", cls, inbits);
+
+	for (; cls; cls = p) {
+		p = strchr(cls, ',');
+		if (p)
+			*p++ = '\0';
+
+		if (*cls == '-') {
+			wanted = false;
+			cls++;
+		} else {
+			wanted = true;
+			if (*cls == '+')
+				cls++;
+		}
+		idx_rc = match_string(dcp->map->classes, dcp->map->length, cls);
+		if (idx_rc < 0) {
+			pr_err("%s not found for module: %s\n", cls, dcp->map->mod_name);
+			continue;
+		}
+		if (test_bit(idx_rc, &inbits) == wanted) {
+			v3pr_info("no change on %s\n", cls);
+			continue;
+		}
+
+		vpr_info("set_dyndbg_classes: bit %d: %s\n", idx_rc, dcp->map->classes[idx_rc]);
+		inbits ^= BIT(idx_rc);
+		totct += do_callback_changes(dcp, idx_rc, &inbits);
+	}
+	kfree(cls);
+	*dcp->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+
 /**
  * param_set_dyndbg_classes - bits => categories >control setter
  * @instr: string echo>d to sysfs
@@ -639,10 +694,9 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		return -EINVAL;
 	}
 	rc = kstrtoul(instr, 0, &inbits);
-	if (rc) {
-		pr_err("set_dyndbg_classes: expecting bits/integer\n");
-		return -EINVAL;
-	}
+	if (rc)
+		return param_set_dyndbg_class_strings(instr, kp);
+
 	vpr_info("set_dyndbg_classes: new 0x%lx current 0x%lx\n", inbits, *dcp->bits);
 
 	for (i = 0; i < dcp->map->length; i++) {
@@ -650,6 +704,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		if (test_bit(i, &inbits) == test_bit(i, dcp->bits))
 			continue;
 
+		vpr_info("set_dyndbg_classes: bit %d: %s\n", i, dcp->map->classes[i]);
 		totct += do_callback_changes(dcp, i, &inbits);
 	}
 	*dcp->bits = inbits;
-- 
2.35.3

