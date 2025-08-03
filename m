Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00650B1920A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5489A10E4BE;
	Sun,  3 Aug 2025 03:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTDW9U40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007F10E4C6;
 Sun,  3 Aug 2025 03:59:28 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3e3e4c564ffso20215205ab.2; 
 Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193567; x=1754798367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
 b=fTDW9U403YkzHwqXQgVY23C8XDPm7G5uQEosfCZ0whY/2STsz70kH8wvpm+6nnu7Xx
 Zzy+77D1llOXDWlpTpptnSbNrQEcQEmhx2B5p992KbYmiIgOSlQV3ceRZL9mM8u0Ao2T
 qF4wajbB0DKadp5WqR+Khgzy0+Oh9hiZY98UM1q+aKQzJyHdcwm1DFN5rakGHGqAjapY
 QxnNNh2+3Gpa6SLhgCqj3ZBKXUq+lvKnYR0D9QJQ09bwhViQh3eY7b3TBqnUChHhdaD7
 TbbNyZXuXyLle4UxmNVKHMieQzU6gJzh5p4BJniK74X4j+JDQeQPNAWxvDwFZ9mfz7dK
 EfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193567; x=1754798367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
 b=raOTHSh5lcSkieebRGsqhqJshv29Me2Azz2FHT7Kuzzc1UjoUMrC0hsX15CVSfstj4
 /o1znmNlOI3qMtQZQ1u2eao5PsLItq+ECZ7QmZq3gG3sK4yJ9tMbm7bWWLkj1Md6oauB
 BtxH1Z2VIm9HmZRyQ6jNIJQ1RwljBtqJeptDVlUc2GhhLEVKCpP3t5Thb25MYmYJ2X+e
 4HjEhyRFHfWd3NJda6a3j3/hEfZ15sMnUs2TN7EbsUrHJkNEHattev0rE+G6mh2d9IXH
 KAJ+1j9ZicjyUlVvn/W+cOaWY8LpeXXZSIe85XPS0wzQhr/4mjyL1NFtJ1W1mmBd4y+9
 4mCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRygPZXHAXmNDMJSzuUVmgJjL47ghT3kR0QERhjgb60MOPTCJ6oavNmoJpcMbvb9a5s9Eu/mkN/MvC5qmLnQ==@lists.freedesktop.org,
 AJvYcCWa+Qhm6mTXLivPsiczwpJfv2JjTTK3HLF7SAl9EpLmpVUwEFdSfOS4Lq4quAnbacFaoR3SCq1UILpE@lists.freedesktop.org,
 AJvYcCWqCbIL3Jf1oo9j3/hi4fd8Br5OGHjFgbR90Ac/BBObN1MhaMnkLZM5Uq5DgJqIOAnnBiyjwXJb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBoeKl9DG14JIPwA8GqCLmLR6XpN49aSojKlWb7vJWd++4c3fj
 eKe1SGrmdil4iaYq0/35T2qNin3Ml5QVu/O8S/yTMSMmupHRF1iXtdvi
X-Gm-Gg: ASbGnctsIZ/nQZ9tWh/+hCm6i80WcvFJTK7SH2UK9ZoLxwBJ3h+015EXEhGZYxeXavi
 lgUx0iITIiGW3QhXrWiAFw75GXwgiZH+vVDPIdCJuqqc2DOqc+4pr9kE5X5oKX+7kPX7pFM5O5R
 T7CLoP7c6lBRZHwOAQ/GhMRJVUig2jxmxrd4MowDsRo0QX9hxUwj0F+C+OnsXBthsB2KjjYHMp4
 G7o1Wpap+HzMD/g9XAUCt0nHrswCk43dlUb07gPk8dluSyUbpgeTe1zy/64eJkp3c4VzjC+0+ae
 ZFVTTJv8RUpJca37t2yvZFSqFVxCKojZlyXieH8CmO6YUslG5QCURmFjWJuJnp1Atm72AP7NTG4
 Cs2noRNqSagwwmFbilfvQs/HG8Jf3L4UXhKl9TuX2mBNl64HKcybHlnvby5NNQaYK7djtQyTodu
 Ef8g==
X-Google-Smtp-Source: AGHT+IEu1fZhS4PGdMY445gHt6SyAM90kHYvE6rk3Vh6MeLyr4clbAteyYxBE5x1gS+10mLcC/WLSw==
X-Received: by 2002:a05:6e02:967:b0:3e3:faaf:df05 with SMTP id
 e9e14a558f8ab-3e4161ae4a2mr76953355ab.16.1754193567464; 
 Sat, 02 Aug 2025 20:59:27 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
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
Subject: [PATCH v4 36/58] drm-print: fix config-dependent unused variable
Date: Sat,  2 Aug 2025 21:57:54 -0600
Message-ID: <20250803035816.603405-37-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe302047..41ad11247b487 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.50.1

