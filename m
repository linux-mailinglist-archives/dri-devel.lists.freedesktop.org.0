Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398F22FBC
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58138930F;
	Mon, 20 May 2019 09:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711308930F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:45 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t1so5071062pgc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhq8BOri8GqXtdsxg8qxzoiDzDhWP4zxzqC5ifM9GUM=;
 b=KbafbgYJ88ucGVMsN72yRbEsd8CHHyszssn41LEdllGgmQwmH3TctOhz0ji//Dxcdq
 y2aqocz3gTeog0rKGPIRlDhoMxJ5D/MmtPtzg0TO17Ka3SdOcOMDno7qaXJ8xj7DuVwB
 2F0QfasGSWq1vBHQGOHLJdEqb6/lAUfH6Uhka2oQQptDzJdODQx9Z6/uQUAejcsZPHZ8
 MZBculC/hbkGUIY+q1YXPs7/jap8rDyKGpmelEvxI6VzByugrTSG4gjWrlSJ7kexYjr0
 P6CiHS3QRLsw4DNAHjzFQ4l+HCenZJ+ezLzwrLqzL4Uz7IBbS1rx1O1qQ27mqOxIGav6
 3XUQ==
X-Gm-Message-State: APjAAAWiUckqqAbk9Ln05hWexJRo37qId8AAdnu1DY/Dafjfwuz3Q6Zq
 GRBsKBoNlmgdrFFriBgT9yjW8Q==
X-Google-Smtp-Source: APXvYqzQbGvwKqbUYTfkmz0DyTQcGldqq+MJrZmXW5rXq1utn0gBm9ge5J4w6ezaiZlHn0axjqJVLg==
X-Received: by 2002:a65:628b:: with SMTP id f11mr71262665pgv.95.1558343265015; 
 Mon, 20 May 2019 02:07:45 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:44 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 06/11] drm/sun4i: dsi: Probe tcon0 during dsi_bind
Date: Mon, 20 May 2019 14:33:13 +0530
Message-Id: <20190520090318.27570-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhq8BOri8GqXtdsxg8qxzoiDzDhWP4zxzqC5ifM9GUM=;
 b=BwmX6vUwVXSoWUXZaDGxZnC4C2nA+2FLx9nM53JLcHkyAB5WcTW4XIBvaCMGkvN9l8
 h8ifkdY4+WuJmXFbgWagA5sRceen0HDsv0Ox5dmquIwP9fPC2bcFhBAVP4TCIRHCSf4Y
 7nZE/DDUbxoFttnsMo29hrKifDT5WRjCfoT3E=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmUgdGNvbjAgZHVyaW5nIGRzaV9iaW5kLCBzby10aGF0IHRoZSB0Y29uIGF0dHJpYnV0ZXMg
bGlrZQpkaXZpZGVyIHZhbHVlLCBjbG9jayByYXRlcyBhcmUgYXZhaWxhYmxlIHdoZW5ldmVyIGl0
IHJlcXVpcmVkLgoKVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5vcmc+
ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIHwgNiArKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMK
aW5kZXggNDdkNTcxZDk3NjAwLi4xZjllZDI2NDJhNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW42aV9taXBpX2RzaS5jCkBAIC0xMDQ1LDYgKzEwNDUsNyBAQCBzdGF0aWMgaW50IHN1bjZpX2Rz
aV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCXN0cnVj
dCBkcm1fZGV2aWNlICpkcm0gPSBkYXRhOwogCXN0cnVjdCBzdW40aV9kcnYgKmRydiA9IGRybS0+
ZGV2X3ByaXZhdGU7CiAJc3RydWN0IHN1bjZpX2RzaSAqZHNpID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CisJc3RydWN0IHN1bjRpX3Rjb24gKnRjb24wID0gc3VuNGlfZ2V0X3Rjb24wKGRybSk7CiAJ
aW50IHJldDsKIAogCWlmICghKGRzaS0+cGFuZWwgfHwgZHNpLT5icmlkZ2UpKSB7CkBAIC0xMDU0
LDYgKzEwNTUsMTEgQEAgc3RhdGljIGludCBzdW42aV9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAogCWRzaS0+ZHJ2ID0gZHJ2OwogCisJaWYgKCF0
Y29uMCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlkc2ktPnRjb24gPSB0Y29uMDsKKwogCWRybV9l
bmNvZGVyX2hlbHBlcl9hZGQoJmRzaS0+ZW5jb2RlciwKIAkJCSAgICAgICAmc3VuNmlfZHNpX2Vu
Y19oZWxwZXJfZnVuY3MpOwogCXJldCA9IGRybV9lbmNvZGVyX2luaXQoZHJtLApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmggYi9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaAppbmRleCA5YzE0MGY1NWI4MjIuLmYyODI2ZTNlYTE2
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKQEAgLTI4LDYgKzI4LDcg
QEAgc3RydWN0IHN1bjZpX2RzaSB7CiAKIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2OwogCXN0cnVjdCBz
dW40aV9kcnYJKmRydjsKKwlzdHJ1Y3Qgc3VuNGlfdGNvbgkqdGNvbjsKIAlzdHJ1Y3QgbWlwaV9k
c2lfZGV2aWNlCSpkZXZpY2U7CiAJc3RydWN0IGRybV9wYW5lbAkqcGFuZWw7CiAJc3RydWN0IGRy
bV9icmlkZ2UJKmJyaWRnZTsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
