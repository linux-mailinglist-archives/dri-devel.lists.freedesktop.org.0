Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4675110F00F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9256E2C7;
	Mon,  2 Dec 2019 19:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753196E2B6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a13so790701ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
 b=uI/B6K7FG27EQ6WmGm7hdYZAcNQ9vYiM2oHjDJxAQ7sEwcr0gKO4gB1v33xpiy44UM
 qsceNc1sGqCxSZdNzCHZ+8wKTtQmJbZmmByipuQDTgsZOzmHCC4/rNMi04fnVWFBmlUI
 C37ftqxQm8lqmwLJr9Vu2Hl6T7DEyhAWmRvwFSsFWGA96cbuLgealdWQ3kxFSJav3Z1Z
 WeXlsVUfWAFuzSsDk9Mtdt7AZml4FVco06qhz40ZMKU/SeLbVKoOfOAYGXLXt2zYiFsW
 Mq8OYBTv5g6ANHawjHXZCLRgXgZyBZ6P0rImWVlDzg5TOBaUgEzTFIt4MHb9ofPGeBx7
 QROA==
X-Gm-Message-State: APjAAAU6qqAnUadLksEnlmeRPERewLxLKQE+F/N+K6EJRmshc7ayiZgT
 1xojIeG7TTM2orF2uYSGwulnt1MAJHSHkw==
X-Google-Smtp-Source: APXvYqxqWDVM+ppo9LUJvIL0zSPxHW/xwhiU6h6G2FvCLak5I1Hn77t5p5FArs7DmDjbO05gcgebKA==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr219541ljj.207.1575315185572;
 Mon, 02 Dec 2019 11:33:05 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:04 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 01/26] drm/drm_panel: no error when no callback
Date: Mon,  2 Dec 2019 20:32:05 +0100
Message-Id: <20191202193230.21310-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGOgtva2q0s1MxBZFBlNQnZLc92S/tb/mTErWAKqBVc=;
 b=h7uMpYQXU8nqH68TzydRnhCOy45ksFGq28L6tPaxa9aEiPfo5jSOpVakkWN+0K9IK7
 1qclRlZSneydfgb76u5Ne20nNLk1wsQj7Cj3Z64NUtI+I5OintjAleMXZo4ugNCWp8cR
 TIJ2NPk5BEhgyBCMlG9HktzmqwwZDSKf95YjiSNXJqGur69kbxDYG6cpihUCHnCAnA9c
 FwdPExbDCZ0VRivGRZ3sHk6QYNEYi4Xtmw7nn9Oqqkg5edr6javNtcxYL2hagI7YMyrp
 K4DxbC0F1zZ4WICEWZPbLWQ4xrh18gufaVK0s5f6vAXNDlFps/DBo/4ma1VXmzNRXKkX
 YoYw==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNhbGxiYWNrcyBpbiBkcm1fcGFuZWxfZnVuY3MgYXJlIG9wdGlvbmFsLCBzbyBkbyBub3QK
cmV0dXJuIGFuIGVycm9yIGp1c3QgYmVjYXVzZSBubyBjYWxsYmFjayBpcyBhc3NpZ25lZC4KClNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYyB8IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9w
YW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCmluZGV4IGVkNzk4NWMwNTM1YS4u
MmQ1OWNkZDA1ZTUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCkBAIC0xNTEsMTAgKzE1MSwxMyBAQCBFWFBP
UlRfU1lNQk9MKGRybV9wYW5lbF9kZXRhY2gpOwogICovCiBpbnQgZHJtX3BhbmVsX3ByZXBhcmUo
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7Ci0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAm
JiBwYW5lbC0+ZnVuY3MtPnByZXBhcmUpCisJaWYgKCFwYW5lbCkKKwkJcmV0dXJuIC1FSU5WQUw7
CisKKwlpZiAocGFuZWwtPmZ1bmNzICYmIHBhbmVsLT5mdW5jcy0+cHJlcGFyZSkKIAkJcmV0dXJu
IHBhbmVsLT5mdW5jcy0+cHJlcGFyZShwYW5lbCk7CiAKLQlyZXR1cm4gcGFuZWwgPyAtRU5PU1lT
IDogLUVJTlZBTDsKKwlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX3ByZXBh
cmUpOwogCkBAIC0xNzEsMTAgKzE3NCwxMyBAQCBFWFBPUlRfU1lNQk9MKGRybV9wYW5lbF9wcmVw
YXJlKTsKICAqLwogaW50IGRybV9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpCiB7Ci0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPnVucHJl
cGFyZSkKKwlpZiAoIXBhbmVsKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChwYW5lbC0+ZnVu
Y3MgJiYgcGFuZWwtPmZ1bmNzLT51bnByZXBhcmUpCiAJCXJldHVybiBwYW5lbC0+ZnVuY3MtPnVu
cHJlcGFyZShwYW5lbCk7CiAKLQlyZXR1cm4gcGFuZWwgPyAtRU5PU1lTIDogLUVJTlZBTDsKKwly
ZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX3VucHJlcGFyZSk7CiAKQEAgLTE5
MCwxMCArMTk2LDEzIEBAIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX3VucHJlcGFyZSk7CiAgKi8K
IGludCBkcm1fcGFuZWxfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewotCWlmIChw
YW5lbCAmJiBwYW5lbC0+ZnVuY3MgJiYgcGFuZWwtPmZ1bmNzLT5lbmFibGUpCisJaWYgKCFwYW5l
bCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAocGFuZWwtPmZ1bmNzICYmIHBhbmVsLT5mdW5j
cy0+ZW5hYmxlKQogCQlyZXR1cm4gcGFuZWwtPmZ1bmNzLT5lbmFibGUocGFuZWwpOwogCi0JcmV0
dXJuIHBhbmVsID8gLUVOT1NZUyA6IC1FSU5WQUw7CisJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lN
Qk9MKGRybV9wYW5lbF9lbmFibGUpOwogCkBAIC0yMDksMTAgKzIxOCwxMyBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9wYW5lbF9lbmFibGUpOwogICovCiBpbnQgZHJtX3BhbmVsX2Rpc2FibGUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiB7Ci0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5l
bC0+ZnVuY3MtPmRpc2FibGUpCisJaWYgKCFwYW5lbCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlp
ZiAocGFuZWwtPmZ1bmNzICYmIHBhbmVsLT5mdW5jcy0+ZGlzYWJsZSkKIAkJcmV0dXJuIHBhbmVs
LT5mdW5jcy0+ZGlzYWJsZShwYW5lbCk7CiAKLQlyZXR1cm4gcGFuZWwgPyAtRU5PU1lTIDogLUVJ
TlZBTDsKKwlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2Rpc2FibGUpOwog
CkBAIC0yMjgsMTAgKzI0MCwxMyBAQCBFWFBPUlRfU1lNQk9MKGRybV9wYW5lbF9kaXNhYmxlKTsK
ICAqLwogaW50IGRybV9wYW5lbF9nZXRfbW9kZXMoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7
Ci0JaWYgKHBhbmVsICYmIHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykK
KwlpZiAoIXBhbmVsKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChwYW5lbC0+ZnVuY3MgJiYg
cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMpCiAJCXJldHVybiBwYW5lbC0+ZnVuY3MtPmdldF9tb2Rl
cyhwYW5lbCk7CiAKLQlyZXR1cm4gcGFuZWwgPyAtRU5PU1lTIDogLUVJTlZBTDsKKwlyZXR1cm4g
MDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2dldF9tb2Rlcyk7CiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
