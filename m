Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D2116CBD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629646E43A;
	Mon,  9 Dec 2019 12:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530026E421;
 Mon,  9 Dec 2019 12:00:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a15so15851080wrf.9;
 Mon, 09 Dec 2019 04:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=VIDuLskP5BBKSu3gyY0bn3vAbJeWQteMB1WYVNwX3g0cSbV3npdbp9w1n71QGsASzB
 3TT7JZkjAgcopJoQJeeQvLCVKGROmMiJ+hUW4y74blfwbm8l45AG5Ef6wi3O1NQ/G2h1
 KOTBvf6rsFWghZNvLH6fOFhOIZ7I87hZmYOzDKRE2/wSV4CB5dcOMUCMcKZaHX1vPYbK
 ymQ4OWjY6J+eKwM/8wPPD3sBFxLy/qSsHIePT8xSCqqW6nDaBJMs0mOWy+1MkfOtzVoh
 UREX05jwR0K67OeMrWAIKI94T9/ys/7Mmru9qxhZ/t8rNShbtzp7/1SkEEDFsB5qfWwm
 84mg==
X-Gm-Message-State: APjAAAUfBSww9+bDPu2w9Eg0xICKwHhrebU+kdOCnOQLSFV/TWz9xe3F
 DIcKedsLY9GbFC0iYoD3qUg=
X-Google-Smtp-Source: APXvYqzXPoZDxBiw+5no9dfH5axKmd4vK6atZbcQ1BeBP6m3W9lIvlzVLMCJTuPWlpxT9mBV93YTdg==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr1816420wrm.223.1575892817765; 
 Mon, 09 Dec 2019 04:00:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id x26sm1672491wmc.30.2019.12.09.04.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 5/9] drm/nouveau: tegra: Avoid pulsing reset twice
Date: Mon,  9 Dec 2019 13:00:01 +0100
Message-Id: <20191209120005.2254786-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=SKUQl8T0YZIUWCBN3443ZKkGVN5Go8c7h7XoQozfP9MSykuO+Pr3ftH+ORSi2RAxAy
 rVEc36/ZlaiBKn9c7DSQjG0flhGKIDydl/ehc5l83+f6M1V+hhn8VX3GlYvVZscEZm9E
 mWcDoMQMPMFSjYAfKT4gb0hMZd0JlEgN69vDkGlN8M0PwdvOi5GlqMPR2YUongTZDMKK
 E35byK4fLXznAaOeCH2zat5ch0ut19tjVuqTQljNAmuJbpSaA2fRXb1I5vSywAV+r08j
 NrA6PHXYX0f1usHdmKDVtTrwi5Y6/UgBsQ4C1ZxoJih8av5JFBFhS+xYgfhA6d4ac9Lj
 JZrw==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhlIEdQVSBw
b3dlcmdhdGUgaXMgY29udHJvbGxlZCBieSBhIGdlbmVyaWMgcG93ZXIgZG9tYWluIHByb3ZpZGVy
LAp0aGUgcmVzZXQgd2lsbCBhdXRvbWF0aWNhbGx5IGJlIGFzc2VydGVkIGFuZCBkZWFzc2VydGVk
IGFzIHBhcnQgb2YgdGhlCnBvd2VyLXVuZ2F0aW5nIHByb2NlZHVyZS4KCk9uIHNvbWUgSmV0c29u
IFRYMiBib2FyZHMsIGRvaW5nIGFuIGFkZGl0aW9uYWwgYXNzZXJ0IGFuZCBkZWFzc2VydCBvZgp0
aGUgR1BVIG91dHNpZGUgb2YgdGhlIHBvd2VyLXVuZ2F0ZSBwcm9jZWR1cmUgY2FuIGNhdXNlIHRo
ZSBHUFUgdG8gZ28KaW50byBhIGJhZCBzdGF0ZSB3aGVyZSB0aGUgbWVtb3J5IGludGVyZmFjZSBj
YW4gbm8gbG9uZ2VyIGFjY2VzcyBzeXN0ZW0KbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS90ZWdyYS5jCmluZGV4IDBlMzcyYTE5
MGQzZi4uNzQ3YTc3NTEyMWNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwpAQCAtNTIsMTggKzUyLDE4IEBAIG52a21fZGV2aWNl
X3RlZ3JhX3Bvd2VyX3VwKHN0cnVjdCBudmttX2RldmljZV90ZWdyYSAqdGRldikKIAljbGtfc2V0
X3JhdGUodGRldi0+Y2xrX3B3ciwgMjA0MDAwMDAwKTsKIAl1ZGVsYXkoMTApOwogCi0JcmVzZXRf
Y29udHJvbF9hc3NlcnQodGRldi0+cnN0KTsKLQl1ZGVsYXkoMTApOwotCiAJaWYgKCF0ZGV2LT5w
ZGV2LT5kZXYucG1fZG9tYWluKSB7CisJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHRkZXYtPnJzdCk7
CisJCXVkZWxheSgxMCk7CisKIAkJcmV0ID0gdGVncmFfcG93ZXJnYXRlX3JlbW92ZV9jbGFtcGlu
ZyhURUdSQV9QT1dFUkdBVEVfM0QpOwogCQlpZiAocmV0KQogCQkJZ290byBlcnJfY2xhbXA7CiAJ
CXVkZWxheSgxMCk7Ci0JfQogCi0JcmVzZXRfY29udHJvbF9kZWFzc2VydCh0ZGV2LT5yc3QpOwot
CXVkZWxheSgxMCk7CisJCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQodGRldi0+cnN0KTsKKwkJdWRl
bGF5KDEwKTsKKwl9CiAKIAlyZXR1cm4gMDsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
