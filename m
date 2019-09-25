Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4937BECC2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2CC6EE13;
	Thu, 26 Sep 2019 07:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38476EE7E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 22:58:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w10so336397plq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 15:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a8l1h42oL5P23xHtbf5VYzA5ZkeKmzbH6tKjUBSBl+E=;
 b=f53xeD2uwIh3yorIbmvXfe/clIX0g1hd49zwbrT418BnA6PzuWrD0gtUdWAxtozUC4
 vesJuFLSFShLpli0aazHOgICrL7Lc0pfHEWCwu5ugwpomEYN8mUMVjttL1ain+l9qzD9
 riqjC1a5apJxnzXqUeR1k1oXLnBtRFZ2QOAUEIRuLSsBZfOzfBubMQfYJiSJxiyEq3WC
 hwvZTboivGZu3ha7UuQkrtvaOBdAGiW6ClD+T7TXP+xRCTEL0EN71R1rQjvk9gWS1n61
 fEEx5OcbujRYTfXQo+4k+tOpCJQlESEH8IcI0PXowexS4NpgGu+Je6vB3++6uuHle2bL
 ettg==
X-Gm-Message-State: APjAAAV0r8xjV6enWagVmsGXQZotFSiBwp9Rj7Rl6B/uZaSFljB2gke/
 TxoAGLsk/xAaNPs90kBy1bZgNA==
X-Google-Smtp-Source: APXvYqzDNs3vEprSzaoe6gRCguGllX+tDvFlstkCquRzzh0Piq6427vQeaol87qaa+E6o95eLxbqbg==
X-Received: by 2002:a17:902:b68e:: with SMTP id
 c14mr539964pls.306.1569452325220; 
 Wed, 25 Sep 2019 15:58:45 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id j24sm76185pff.71.2019.09.25.15.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 15:58:44 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] drm/mtk: add panel orientation property
Date: Wed, 25 Sep 2019 15:58:33 -0700
Message-Id: <20190925225833.7310-5-dbasehore@chromium.org>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190925225833.7310-1-dbasehore@chromium.org>
References: <20190925225833.7310-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2019 07:42:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a8l1h42oL5P23xHtbf5VYzA5ZkeKmzbH6tKjUBSBl+E=;
 b=mZdbN7PU15gvrkxboOz4EvcivX/ux1fVAqsJCq6EgzispzgwuhEsAlz2ZHeBFsy6AF
 nFJVLzl+LytoIKO4/YdZ1xWZH80l5SKrIIa2WxgJD+p+QXWSPvNvoGV2JOLti0PYNVZd
 IpeblEXMS3gfQeMUmm75yJ/NL7jP6a/9DNtx4=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpbml0cyB0aGUgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgZm9yIHRoZSBtZWRpYXRl
ayBkc2kgZHJpdmVyCmlmIHRoZSBwYW5lbCBvcmllbnRhdGlvbiAoY29ubmVjdG9yLmRpc3BsYXlf
aW5mby5wYW5lbF9vcmllbnRhdGlvbikgaXMKbm90IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV04uCgpTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9t
aXVtLm9yZz4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCAyMjRhZmI2NjY4ODEuLjI5
MzY5MzIzNDRlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC03OTIsMTAgKzc5
MiwxOCBAQCBzdGF0aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
YXR0YWNoIHBhbmVsIHRvIGRybVxuIik7CiAJCQlnb3RvIGVycl9jb25uZWN0b3JfY2xlYW51cDsK
IAkJfQorCisJCXJldCA9IGRybV9jb25uZWN0b3JfaW5pdF9wYW5lbF9vcmllbnRhdGlvbl9wcm9w
ZXJ0eSgmZHNpLT5jb25uKTsKKwkJaWYgKHJldCkgeworCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
aW5pdCBwYW5lbCBvcmllbnRhdGlvblxuIik7CisJCQlnb3RvIGVycl9wYW5lbF9kZXRhY2g7CisJ
CX0KIAl9CiAKIAlyZXR1cm4gMDsKIAorZXJyX3BhbmVsX2RldGFjaDoKKwlkcm1fcGFuZWxfZGV0
YWNoKGRzaS0+cGFuZWwpOwogZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOgogCWRybV9jb25uZWN0b3Jf
Y2xlYW51cCgmZHNpLT5jb25uKTsKIAlyZXR1cm4gcmV0OwotLSAKMi4yMy4wLjM1MS5nYzQzMTcw
MzJlNi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
