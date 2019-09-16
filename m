Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C9B3D1E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA476E9B1;
	Mon, 16 Sep 2019 15:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED046E9BA;
 Mon, 16 Sep 2019 15:04:17 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v8so394905eds.2;
 Mon, 16 Sep 2019 08:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=sZBNi3QjPCAZa5ygHJP8+kNu1JLNGNxWKlnY02xYNZx+9uAnunWwI2kW6ocRTrMYnq
 tpDVYGdGhTxL6suRKAk22u1zsKK4ySRtFe4G3ISZvUyrWfhbeK/xd+MczFcsG5jdPz8g
 iVCIYG2nvusuAQZyccGiCKwyeZsdOOX7TSLj6P6uQF+E1MWtZnPkkrb9cmmkgWbbGcvF
 9rVheE6cvEW21BtS3R9QXo6QG8ZILX0rY5bNdwm9GnPDY969GHQNEJQX97gLsOfK/zvR
 ZtZQU0wlByPAMPQxc/+QNUSkCuThsm4Gz+oRpPOUbPg8/UEBoI2OX2nfjJnhcq7iz4cd
 1WlA==
X-Gm-Message-State: APjAAAVFldzProbTIPha29fLIz+w2KYsUNSV8bc1VVp00aNbHfqxUcXG
 bic7a1kfighwDrCKnNYO8iM=
X-Google-Smtp-Source: APXvYqwRvWyCUvUSTGCISgYTe/nKEOMhmiSYAAorp+BG4taJxap2eTfS+WK1OPfHXXWLZ0AdhPisKA==
X-Received: by 2002:aa7:c5c1:: with SMTP id h1mr5031118eds.10.1568646256458;
 Mon, 16 Sep 2019 08:04:16 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id jx11sm4259038ejb.19.2019.09.16.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/11] drm/nouveau: tegra: Avoid pulsing reset twice
Date: Mon, 16 Sep 2019 17:04:02 +0200
Message-Id: <20190916150412.10025-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=n8cpQzdf6s+dwC812zcO+7PvElTqDg+8hJE7U3KrfCMjOFtdWxDa4AJU6vizAOF8kx
 7+wHB4E79A57I9H9KDh0hfrIzvocxOUG+Vboq45ipHeK5Ki93Magx64al6XM+itTg8xC
 lLBsB9dXfcxyRCzlMI9CmoxXGh3Hky0DME5+Y6b+/pm3C4vIiOlpGI8HlSsyKizziURi
 gWOR4SGPztqHdy8rD4xbSA7DS+lXINJVFB+tZrl/mdsf15bmi651VzNYJZk5y4rqLFXT
 4EVHf9TskykwWPoDJ4XtOseObo7tRWOBnRJUUT/1dTUn88ia4NpikfphSrUnKF45LEcu
 zHpA==
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
