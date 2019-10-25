Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1E2E52AB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A0A6EB25;
	Fri, 25 Oct 2019 17:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CABE6EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:57:07 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r1so1989929pgj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3Mki6uub+NAK80E3ntfBcsFK0xNEI4Pl6xkUsSgIeM=;
 b=T5HEm1BRrQeF+lsZaYHJDLEQkTA8YH+LpHYU0Kh1NGHG1weRFy353byujIgaIlfMF+
 iLcojL4qJAiaSY5pyqb/Lgrm2QN5sNii56nirqKOdPWTgIGaOxBCebR08UlfsbRHEUHR
 3GaveCCMprlRFhLZzmtqh2jfD4HnGGC+op+CHl0M/Ng4sAxwPLcQ27tZaKQBbwhNwnh3
 Yonhmx+F7jXP7D3nqMNUnD+GkCXbWETg42dDNF2+Fu0imnbM59qLpgERBdiDq44Ln18Y
 ldX2Yzae3dLa6UPEAyrhW/oHo8G3QJZyuprY65dT9f8bdET/Us02KUoV2e+97UAKWM05
 vsPA==
X-Gm-Message-State: APjAAAVxXd2kbys69IHXF/BC6IDFWuvOyg1iq6R3SJBLO7OgXcLuTI6f
 LrEIFxdCl1S0E0VYNPKxmKn6LQ==
X-Google-Smtp-Source: APXvYqwQDEhpc37JYujaBlS0c+W1Le7LhGIIS5sXpnrhe8K1umdFkvWh0OaUWV5zfFMK68Yte1XnMQ==
X-Received: by 2002:a62:58c2:: with SMTP id m185mr6044311pfb.10.1572026227045; 
 Fri, 25 Oct 2019 10:57:07 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:57:06 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 4/7] =?UTF-8?q?drm/sun4i:=20dsi:=20Handle=20bus=20cloc?=
 =?UTF-8?q?k=20explicitly=C2=A0?=
Date: Fri, 25 Oct 2019 23:26:22 +0530
Message-Id: <20191025175625.8011-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3Mki6uub+NAK80E3ntfBcsFK0xNEI4Pl6xkUsSgIeM=;
 b=i3MIHeuYlYEVmU4821ovZp6xUdW9w+0CO4+t4aQLQryHnwktMguR3UUD+Yd9ZkzbTJ
 4iQrMyZXSu1Za0QtBnk0m4NeXcBDnmIdW7LtsfXsM4RHfFgOEWbXEXuvHz130kkxKtiF
 fH4VjdQ2kJHmdErld9s1DPCCJz7NeHLkpyWIA=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNhZ2Ugb2YgY2xvY2tzIGFyZSB2YXJpZXMgYmV0d2VlbiBkaWZmZXJlbnQgQWxsd2lubmVyCkRT
SSBjb250cm9sbGVycy4gQ2xvY2tpbmcgaW4gQTMzIHdvdWxkIG5lZWQgYnVzIGFuZAptb2QgY2xv
Y2tzIHdoZXJlIGFzIEE2NCB3b3VsZCBuZWVkIG9ubHkgYnVzIGNsb2NrLgoKVG8gc3VwcG9ydCB0
aGlzIGtpbmQgb2YgY2xvY2tpbmcgc3RydWN0dXJlIHZhcmlhbnRzCmluIHRoZSBzYW1lIGRzaSBk
cml2ZXIsIGV4cGxpY2l0IGhhbmRsaW5nIG9mIGNvbW1vbgpjbG9jayB3b3VsZCByZXF1aXJlIHNp
bmNlIHRoZSBBNjQgZG9lc24ndCBuZWVkIHRvCm1lbnRpb24gdGhlIGNsb2NrLW5hbWVzIGV4cGxp
Y2l0bHkgaW4gZHRzIHNpbmNlIGl0CnN1cHBvcnQgb25seSBvbmUgYnVzIGNsb2NrLgoKQWxzbyBw
YXNzIGNsa19pZCBOVUxMIGluc3RlYWQgImJ1cyIgdG8gcmVnbWFwIGNsb2NrCmluaXQgZnVuY3Rp
b24gc2luY2UgdGhlIHNpbmdsZSBjbG9jayB2YXJpYW50cyBubyBuZWVkCnRvIG1lbnRpb24gY2xv
Y2stbmFtZXMgZXhwbGljaXRseS4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBp
X2RzaS5jIHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9t
aXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKaW5kZXgg
OGM0YzU0MTIyNGRkLi5lYWNkZmNmZjY0YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9t
aXBpX2RzaS5jCkBAIC0xMTA5LDcgKzExMDksNyBAQCBzdGF0aWMgaW50IHN1bjZpX2RzaV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihkc2ktPnJl
Z3VsYXRvcik7CiAJfQogCi0JZHNpLT5yZWdzID0gZGV2bV9yZWdtYXBfaW5pdF9tbWlvX2Nsayhk
ZXYsICJidXMiLCBiYXNlLAorCWRzaS0+cmVncyA9IGRldm1fcmVnbWFwX2luaXRfbW1pb19jbGso
ZGV2LCBOVUxMLCBiYXNlLAogCQkJCQkgICAgICAmc3VuNmlfZHNpX3JlZ21hcF9jb25maWcpOwog
CWlmIChJU19FUlIoZHNpLT5yZWdzKSkgewogCQlkZXZfZXJyKGRldiwgIkNvdWxkbid0IGNyZWF0
ZSB0aGUgRFNJIGVuY29kZXIgcmVnbWFwXG4iKTsKQEAgLTExMjIsNiArMTEyMiwxMiBAQCBzdGF0
aWMgaW50IHN1bjZpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQly
ZXR1cm4gUFRSX0VSUihkc2ktPnJlc2V0KTsKIAl9CiAKKwlkc2ktPmJ1c19jbGsgPSBkZXZtX2Ns
a19nZXQoZGV2LCBOVUxMKTsKKwlpZiAoSVNfRVJSKGRzaS0+YnVzX2NsaykpIHsKKwkJZGV2X2Vy
cihkZXYsICJDb3VsZG4ndCBnZXQgdGhlIERTSSBidXMgY2xvY2tcbiIpOworCQlyZXR1cm4gUFRS
X0VSUihkc2ktPmJ1c19jbGspOworCX0KKwogCWlmIChkc2ktPnZhcmlhbnQtPmhhc19tb2RfY2xr
KSB7CiAJCWRzaS0+bW9kX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJtb2QiKTsKIAkJaWYgKElT
X0VSUihkc2ktPm1vZF9jbGspKSB7CkBAIC0xMTk2LDYgKzEyMDIsNyBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkIHN1bjZpX2RzaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJfQogCiAJcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJlc2V0KTsKKwljbGtfcHJlcGFy
ZV9lbmFibGUoZHNpLT5idXNfY2xrKTsKIAlpZiAoZHNpLT52YXJpYW50LT5oYXNfbW9kX2NsaykK
IAkJY2xrX3ByZXBhcmVfZW5hYmxlKGRzaS0+bW9kX2Nsayk7CiAKQEAgLTEyMjcsNiArMTIzNCw3
IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3VuNmlfZHNpX3J1bnRpbWVfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAlpZiAoZHNpLT52YXJpYW50LT5oYXNfbW9kX2NsaykKIAkJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+bW9kX2Nsayk7CisJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRzaS0+YnVzX2Nsayk7CiAJcmVzZXRfY29udHJvbF9hc3NlcnQoZHNpLT5yZXNldCk7CiAJ
cmVndWxhdG9yX2Rpc2FibGUoZHNpLT5yZWd1bGF0b3IpOwogCi0tIAoyLjE4LjAuMzIxLmdmZmM2
ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
