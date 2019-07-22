Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45E70869
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831BD89DB8;
	Mon, 22 Jul 2019 18:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BFA89DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:25:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id az7so19517797plb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gkGn8pX+SnGbncQZILWgKTNC3yYNo8zAMY1G6oxP7Bk=;
 b=Arl+OBvULfCVyKFwOOM2UulOObD7xpnvaNR+WeaUbYGKjm+BSHTlXmqgSWiivmj21K
 5OoGroZrLRrTVTdHWneDD7XzdCP6qTZtqiz2wj3ahKyiqlwSfB+7mZJz6CE3TnGF4nty
 Ac7YpPLSN2vGfDW9mIqtj2tK2veuw5gS5cbrFC4DCkl91JQgCZHsF2/pe2ta6/vi0FkL
 0elQdUsXnFHs8dz0rSeA9z8DUlUgetql7Fj45/R9oLvcVJ2fMm9i3pHOpW+E4ybjJFO/
 RePGWKv7Q5HwzaWtGZudBuB4bGMd99nRX2bt9Tt6sHqeoOGsYnnDsWcnCzagfFvP90At
 9BqA==
X-Gm-Message-State: APjAAAUfmeO/ImGwwtXRSlsL19eDs5ynjCS52gzBYTQmQjU+ZxRibND/
 48dLcSazDNJXsb22a46FHCR7FA==
X-Google-Smtp-Source: APXvYqwt8O0L83AANnlACuiSZO0y3AW9dmuUUC7ooEfiwSxSjS1wz+BGd5M4s1GjUn44c68TKPzdkg==
X-Received: by 2002:a17:902:9688:: with SMTP id
 n8mr75084152plp.227.1563819904526; 
 Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/4] video: of: display_timing: Add of_node_put() in
 of_get_display_timing()
Date: Mon, 22 Jul 2019 11:24:36 -0700
Message-Id: <20190722182439.44844-2-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gkGn8pX+SnGbncQZILWgKTNC3yYNo8zAMY1G6oxP7Bk=;
 b=kODRaWBKJXyuIRTX369dvcz8KsHsvOXWSPRckcRa6ktNtHmxUsikmQlXEMgVRiPoeq
 x7NoYUYH8Oo67zCDzUZ7wEDv9Hzk/Sk5FxtB3AcougBOrP4zw/IuxrqGJXNSUKywLpqf
 SqCtChZV6KHIRQ+rM0myXRa1+dwp1B6eBHx64=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbSBjb2RlIGluc3BlY3Rpb24gaXQgY2FuIGJlIHNlZW4gdGhhdCBvZl9nZXRfZGlzcGxheV90
aW1pbmcoKSBpcwpsYWNraW5nIGFuIG9mX25vZGVfcHV0KCkuICBBZGQgaXQuCgpGaXhlczogZmZh
M2ZkMjFkZThhICgidmlkZW9tb2RlOiBpbXBsZW1lbnQgcHVibGljIG9mX2dldF9kaXNwbGF5X3Rp
bWluZygpIikKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPgotLS0KCiBkcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMgfCA3ICsrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMgYi9kcml2ZXJzL3ZpZGVv
L29mX2Rpc3BsYXlfdGltaW5nLmMKaW5kZXggZjVjMWM0NjljMGFmLi41ZWVkYWUwNzk5ZjAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYworKysgYi9kcml2ZXJz
L3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMKQEAgLTExOSw2ICsxMTksNyBAQCBpbnQgb2ZfZ2V0
X2Rpc3BsYXlfdGltaW5nKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGNvbnN0IGNoYXIg
Km5hbWUsCiAJCXN0cnVjdCBkaXNwbGF5X3RpbWluZyAqZHQpCiB7CiAJc3RydWN0IGRldmljZV9u
b2RlICp0aW1pbmdfbnA7CisJaW50IHJldDsKIAogCWlmICghbnApCiAJCXJldHVybiAtRUlOVkFM
OwpAQCAtMTI5LDcgKzEzMCwxMSBAQCBpbnQgb2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKGNvbnN0IHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGNvbnN0IGNoYXIgKm5hbWUsCiAJCXJldHVybiAtRU5PRU5U
OwogCX0KIAotCXJldHVybiBvZl9wYXJzZV9kaXNwbGF5X3RpbWluZyh0aW1pbmdfbnAsIGR0KTsK
KwlyZXQgPSBvZl9wYXJzZV9kaXNwbGF5X3RpbWluZyh0aW1pbmdfbnAsIGR0KTsKKworCW9mX25v
ZGVfcHV0KHRpbWluZ19ucCk7CisKKwlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTF9HUEwo
b2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKTsKIAotLSAKMi4yMi4wLjY1Ny5nOTYwZTkyZDI0Zi1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
