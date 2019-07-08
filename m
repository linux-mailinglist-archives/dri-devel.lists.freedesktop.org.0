Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12263157
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BFF897C8;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80789D4B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 12:33:14 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g15so7623211pgi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 05:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=twuCq4CMuW36LIT7fXsJGUM7Fs1QiuVh+SZP8dTMu2g=;
 b=uU/r8dNPMpf/bpf5Y+bkAn0MuLk3mfgr7kOiK+jLLzJrQNgxm2EFN7RMAqJjDrL8+h
 eCLU64gkEZZWEDLU/8Nc28+TuJ/z1EeqhOw9SNEamWEU2Qbt1xyi7iIieueFLNX+Uk0K
 5FwMmbp/KKSOsKzoUHX6aLtkiB7TZgoILOByHDB0cykkoGCFZQgMZ1/Yq9LTtDWVn08T
 TdPVFahBWOOeeteqeI7ebCXRx4BIciStlJsoCcAmPILxkI9eYd9NlG+UsSYImHV3veg+
 mUGWl45Bj4Aqfl/GWVeVw4MwOXYAUNHlnmmu+StgoOgf1gabjgQhB8Ci6t6y6BtAG0SS
 u0Gg==
X-Gm-Message-State: APjAAAUtLmPhM0bekMD1yDweqMpx31p9ruMBs+HPwuk27yFmMkf677Dd
 ATIZjO1PTC/25VeeLmsctDY=
X-Google-Smtp-Source: APXvYqwOCIYDwfW3ZxqxI8lfOzFQLxdaJusZemcs3HS67k3h0J/DeXoOKpv3z08uR7WcumYix3/XpQ==
X-Received: by 2002:a17:90a:ab01:: with SMTP id
 m1mr24348826pjq.69.1562589194511; 
 Mon, 08 Jul 2019 05:33:14 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id m13sm14784236pgv.89.2019.07.08.05.33.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 05:33:14 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 05/14] drm/drv: Replace devm_add_action() followed by failure
 action with devm_add_action_or_reset()
Date: Mon,  8 Jul 2019 20:33:06 +0800
Message-Id: <20190708123306.11851-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=twuCq4CMuW36LIT7fXsJGUM7Fs1QiuVh+SZP8dTMu2g=;
 b=g4STA3iwGzf928aVXnjUh7FKMoEON/A89yQ4VfN8v8WA0TkIPrB/mJSsAAOiAU8u1t
 tqaGBFR7dR4ihWaglx5Ywd4HhP8UsifMqbm2F8uSzao9BzHOWY+hk91xpRLWM8Dd3Cdx
 d271Vp/adwXnRtdYqwW6k+b70cG0MQuA1G/yOMnRhRCVkcpZg2/O/Uzo8PlqAbeEuYr+
 UmHE5mZy0Cp9qcj84PbewFV8wYeoAKPIBLlXYsa1fjc4u3+gMjpU6fCgwzsfRciGoG/8
 CIDTglFoC99p447X+CHPDbAjdiHns7MG3z5WsSd8D2Jb/nLs7tmjnu3LWcROvruibWe0
 33Tw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgaXMgaW50cm9kdWNlZCBhcyBhIGhlbHBlciBmdW5j
dGlvbiB3aGljaCAKaW50ZXJuYWxseSBjYWxscyBkZXZtX2FkZF9hY3Rpb24oKS4gSWYgZGV2bV9h
ZGRfYWN0aW9uKCkgZmFpbHMgCnRoZW4gaXQgd2lsbCBleGVjdXRlIHRoZSBhY3Rpb24gbWVudGlv
bmVkIGFuZCByZXR1cm4gdGhlIGVycm9yIGNvZGUuClRoaXMgcmVkdWNlIHNvdXJjZSBjb2RlIHNp
emUgKGF2b2lkIHdyaXRpbmcgdGhlIGFjdGlvbiB0d2ljZSkgCmFuZCByZWR1Y2UgdGhlIGxpa2Vs
eWhvb2Qgb2YgYnVncy4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhp
YW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgfCA0ICstLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwpp
bmRleCA4NjI2MjE0OTRhOTMuLmRkMDA0ZWJiYjVmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC03NjAsOSAr
NzYwLDcgQEAgaW50IGRldm1fZHJtX2Rldl9pbml0KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKIAlp
ZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gZGV2bV9hZGRfYWN0aW9uKHBhcmVudCwg
ZGV2bV9kcm1fZGV2X2luaXRfcmVsZWFzZSwgZGV2KTsKLQlpZiAocmV0KQotCQlkZXZtX2RybV9k
ZXZfaW5pdF9yZWxlYXNlKGRldik7CisJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHBh
cmVudCwgZGV2bV9kcm1fZGV2X2luaXRfcmVsZWFzZSwgZGV2KTsKIAogCXJldHVybiByZXQ7CiB9
Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
