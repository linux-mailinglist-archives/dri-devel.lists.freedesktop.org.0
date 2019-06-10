Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A232E3BB5E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 19:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07F18915B;
	Mon, 10 Jun 2019 17:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9298915B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:52:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 83so5422570pgg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+j33U/KoRlNgTFzxm2+JBRTgicwoY0lYBd07TSgrA8=;
 b=Xraak/iJcMaqF7TN2Ljs+nSD5IdnoerQ1wjqeRwcJYoN+mZsu9KKjjMPy1tdNBnmFj
 W1o9a6oE1ExTfO9qVhzhCc11LE9MogKOA62F9RUW48FZ+hFob/F9meAJI9oam9PRe9ev
 6f7YIsEPNwxapqzM9/I1YbuTIaFdkIv4/CxdA1tGlTx7BNt4nN3cvSqUfnIThLqymfTG
 P3a3Cxc+mvPzNtX3dZTPth5F4oTH4vmdK2WfXt48a3s6l5BYX9duu8sVKb1N/YfyCioT
 TF66D6JuEjwJENnH8eeKpIWUnZf6BwkezKivfpp9BdzkuFkdmIjaovKpZ6De1mcL6HJ/
 by5A==
X-Gm-Message-State: APjAAAVUZpeDWmmca/WqqniWBED5UGPWsooFGP4SZjQRj+XTUXkwCxfd
 83mDXCoCyyD7vTGUP6wzEtgGqg==
X-Google-Smtp-Source: APXvYqzU1Wm58XzoJcqWjPmPcWmK6k9fe25HmAb+1sgysyHkY4qvbyB6DYlP3+BcnzlJSNDd0YA7aA==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr22154592pjz.140.1560189169114; 
 Mon, 10 Jun 2019 10:52:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id o192sm12247158pgo.74.2019.06.10.10.52.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 10:52:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/bridge/synopsys: dw-hdmi: Fix unwedge crash when no
 pinctrl entries
Date: Mon, 10 Jun 2019 10:52:34 -0700
Message-Id: <20190610175234.196844-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+j33U/KoRlNgTFzxm2+JBRTgicwoY0lYBd07TSgrA8=;
 b=cxF1nMuo6dYPyZe7IW550Tuvt/62sqAH3zxqkBDBP60Zvf09/H9NyJ84Hes67AMcs+
 FT0mKqC866kkF5lMJa9TjElrohQWwc7L7NecmxSE5p/88FgBlI315lwC72hDmcLD12FS
 La1s9o0nVajzrUxY6540kLZ1wY50dWzDdtCIg=
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
Cc: David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29tbWl0IDUwZjk0OTVlZmUzMCAoImRybS9icmlkZ2Uvc3lub3BzeXM6IGR3LWhkbWk6IEFk
ZCAidW53ZWRnZSIKZm9yIGRkYyBidXMiKSBJIHN0dXBpZGx5IHVzZWQgSVNfRVJSKCkgdG8gY2hl
Y2sgZm9yIHdoZXRoZXIgd2UgaGF2ZSBhbgoidW53ZWRnZSIgcGluY3RybCBzdGF0ZSBldmVuIHRo
b3VnaCBvbiBtb3N0IGZsb3dzIHRocm91Z2ggdGhlIGRyaXZlcgp0aGUgdW53ZWRnZSBzdGF0ZSB3
aWxsIGp1c3QgYmUgTlVMTC4KCkZpeCBpdCBzbyB0aGF0IHdlIGNvbnNpc3RlbnRseSB1c2UgTlVM
TCBmb3Igbm8gdW53ZWRnZSBzdGF0ZS4KCkZpeGVzOiA1MGY5NDk1ZWZlMzAgKCJkcm0vYnJpZGdl
L3N5bm9wc3lzOiBkdy1oZG1pOiBBZGQgInVud2VkZ2UiIGZvciBkZGMgYnVzIikKUmVwb3J0ZWQt
Ynk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IERv
dWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KLS0tCgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IGYyNWUwOTFiOTNjNS4uNWU0ZTk0MDhk
MDBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMjUx
LDcgKzI1MSw3IEBAIHN0YXRpYyB2b2lkIGR3X2hkbWlfaTJjX2luaXQoc3RydWN0IGR3X2hkbWkg
KmhkbWkpCiBzdGF0aWMgYm9vbCBkd19oZG1pX2kyY191bndlZGdlKHN0cnVjdCBkd19oZG1pICpo
ZG1pKQogewogCS8qIElmIG5vIHVud2VkZ2Ugc3RhdGUgdGhlbiBnaXZlIHVwICovCi0JaWYgKElT
X0VSUihoZG1pLT51bndlZGdlX3N0YXRlKSkKKwlpZiAoIWhkbWktPnVud2VkZ2Vfc3RhdGUpCiAJ
CXJldHVybiBmYWxzZTsKIAogCWRldl9pbmZvKGhkbWktPmRldiwgIkF0dGVtcHRpbmcgdG8gdW53
ZWRnZSBzdHVjayBpMmMgYnVzXG4iKTsKQEAgLTI2ODYsMTEgKzI2ODYsMTMgQEAgX19kd19oZG1p
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCQloZG1pLT5kZWZhdWx0X3N0
YXRlID0KIAkJCQlwaW5jdHJsX2xvb2t1cF9zdGF0ZShoZG1pLT5waW5jdHJsLCAiZGVmYXVsdCIp
OwogCi0JCQlpZiAoSVNfRVJSKGhkbWktPmRlZmF1bHRfc3RhdGUpICYmCi0JCQkgICAgIUlTX0VS
UihoZG1pLT51bndlZGdlX3N0YXRlKSkgewotCQkJCWRldl93YXJuKGRldiwKLQkJCQkJICJVbndl
ZGdlIHJlcXVpcmVzIGRlZmF1bHQgcGluY3RybFxuIik7Ci0JCQkJaGRtaS0+dW53ZWRnZV9zdGF0
ZSA9IEVSUl9QVFIoLUVOT0RFVik7CisJCQlpZiAoSVNfRVJSKGhkbWktPmRlZmF1bHRfc3RhdGUp
IHx8CisJCQkgICAgSVNfRVJSKGhkbWktPnVud2VkZ2Vfc3RhdGUpKSB7CisJCQkJaWYgKCFJU19F
UlIoaGRtaS0+dW53ZWRnZV9zdGF0ZSkpCisJCQkJCWRldl93YXJuKGRldiwKKwkJCQkJCSAiVW53
ZWRnZSByZXF1aXJlcyBkZWZhdWx0IHBpbmN0cmxcbiIpOworCQkJCWhkbWktPmRlZmF1bHRfc3Rh
dGUgPSBOVUxMOworCQkJCWhkbWktPnVud2VkZ2Vfc3RhdGUgPSBOVUxMOwogCQkJfQogCQl9CiAK
LS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
