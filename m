Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFD748728B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E355111325F;
	Fri,  7 Jan 2022 05:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78082113237;
 Fri,  7 Jan 2022 05:30:06 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id x6so5757597iol.13;
 Thu, 06 Jan 2022 21:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O69jwEK6BGWuT7bxOYDKnQEBPlUpFxQn3cSq5pD/L6c=;
 b=kjIfxzNx9rucec9vax5OFMutL6FvvqBipuTamNE+LERXDRo6gx8l/eHFoPN6aT+3aN
 839At6W/5jr7R8zFP3y1+IwGhQE39mEt7TDVl3kRBKxcuorV8/pxARug/hXVBmf569pS
 JrT3PgROyKCagtD+A6Gwn+Zi0Ha6/M1YNlHEvnWCqADuPkOrlo5g3V3KeXEu50IoqxNI
 VxzhW5roni2KOcI2LE+/afrWFB7QTwTKMr9s5K6OdYPK/lzQNU95S8l0TmNIsgmOCR4f
 0MoIrxeICOcqDG3fniszaXgabKKQoGpnyxn6NaSlmPuvSP+XUpFOGumJBlcrv7/XAJfv
 jWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O69jwEK6BGWuT7bxOYDKnQEBPlUpFxQn3cSq5pD/L6c=;
 b=I5lvRurycf+Nyox/hk8QPwUuYt0qU12lj1fOZ8MHSWbOBBOgDS31PU2mNaadhENpFX
 TIen7i1/LnY1qkybFj3ftttQxSBHwcm+lQPBRGTuHKY+tKOSJh7POIHxpAgWLx1Dj4LX
 GRNn2O6AvCTGQ/UW3EDJwfyiqPSrrx9LlZq7bumIPdyvwJqMv6T4yB4k60GKnX1nKho0
 ZiHft3PvTeCH62YNdoFHFNY9KPolNnXIBY5Yl/XVi72rp7YSyiRmqSYOnNAxDs6IWgBe
 MOStsfctnARzFyR8d0SM1SMRF3+u7jUHaEH0q2w+1fWZvBmYGgD5yUwOTRYo0voZ1DPq
 urlg==
X-Gm-Message-State: AOAM5313VqDQhA4K+5CnvZZRmnbtyl5391XuaHzUZq/lCdc0XyTb/2Yy
 EAxqgZ4rBa8rE9SLooxE5g0=
X-Google-Smtp-Source: ABdhPJxTkXRmMBve2LtAb8XAmhR2+L3R66b7dP6c1YxaZdMVvWReyuf74i4hY6RdW4AdcGIW1ZI0lw==
X-Received: by 2002:a05:6638:370c:: with SMTP id
 k12mr28932444jav.25.1641533405766; 
 Thu, 06 Jan 2022 21:30:05 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 13/19] drm_print: refine drm_debug_enabled for
 dyndbg+jump-label
Date: Thu,  6 Jan 2022 22:29:36 -0700
Message-Id: <20220107052942.1349447-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use dynamic-debug's jump-label optimization in drm-debug,
its clarifying to refine drm_debug_enabled into 3 uses:

1.   drm_debug_enabled - legacy, public
2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
3.  _drm_debug_enabled - pr_debug instrumented, observable

1. The legacy version always checks the bits.

2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
early return unless the category is enabled (free of call/NOOP side
effects).  For dyndbg builds, debug callsites are selectively
"pre-enabled", so __drm_debug_enabled() short-circuits to true there.
Remaining callers of 1 may be able to use 2, case by case.

3. is 1st wrapped in a macro, with a pr_debug, which reports each
usage in /proc/dynamic_debug/control, making it observable in the
logs.  The macro lets the pr_debug see the real caller, not the inline
function.

When plugged into 1, it identified ~10 remaining callers of the
function, leading to the follow-on cleanup patch, and would allow
activating the pr_debugs, estimating the callrate, and the potential
savings by using the wrapper macro.

It is unused ATM, but it fills out the picture.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5dd6713c14f2..aab29dd6cad1 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -265,7 +265,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -290,7 +290,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
-- 
2.33.1

