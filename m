Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBC10F06B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4E86E301;
	Mon,  2 Dec 2019 19:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E036E311
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:51 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 21so877737ljr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
 b=d+CY7P2x+LaFUzNZ8jVqkqCJNMgnnbxiASnq+T0lp6F+RbfUwQp6dj4zzkbNWJJnnC
 0waQaZRXPkqiA7U1V1fO7En3Qv9Z5HWHXET41Iii/ZOowckJxhKZhRE1TSoREK5oWpbD
 VGOGNegHD2kkDDJ0s3eCWdmbwtXgAaldbP5MAKdvGqVDTw6ibDbYoRnMNG7Xdm8vI8Oo
 BGOpDJ1/seU2eMcdxfu3uE1EHQh9iRXbhr7b1FpMWt9Y2zKd0ZBGWScf9WkvuNKFzaZK
 kHk61Qv3mhmmcOnsne5fv7lXfmkTOgdWEoXcEClwG/KS+YLfGyWiBpEhvqJ7S5pE/kLM
 T4jw==
X-Gm-Message-State: APjAAAWkgpg4DuLKgd73UIsKKAD5BEVn8LRDNar/oQWZDtfxw7tMMeeK
 NqtlMuhi0VFndjchHYwSw/ZX17Qor7cLGw==
X-Google-Smtp-Source: APXvYqwkSwEanVTfqqupRACq5bTVVsNocJ7zo+uG5n6CAnsmd9lWBvGtWMlkSAMwbQN9o+Rbbx6T4A==
X-Received: by 2002:a2e:970e:: with SMTP id r14mr254679lji.57.1575315229302;
 Mon, 02 Dec 2019 11:33:49 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:48 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 24/26] drm/panel: sitronix-st7789v: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:28 +0100
Message-Id: <20191202193230.21310-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
 b=X6seJeavAuZ4rDdxOy9hEnXoLG0oobxXRy+xY8wWgitF4tTB87MsPXIcIuEVV0uvti
 W0R5e8qXxki30sA5dYdKwlmPgklxVKxb9+aHG3PRzFh67me+5fs4qU+wAFieX4NtPJRF
 2rGj0gksOxyaY6AI60t4e0xlhYM6OlmvJoiWNC3RYbIUiNJFWLIl8b6KjN07Tv5Xu2Xa
 DRWiNyEud2lLwiSrC+fJQ4G1SvpUCCuVsxuERVCrTeQsJsBzRFAmyhlurYrx1WrWpRH7
 9wuWiasSHXHEw7O6gYBiF5ZPb+ywMbAa1wk7mSydtG0bzvyJPFr+gutNvONhGKFwSg0Q
 /Ubw==
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

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25p
eC1zdDc3ODl2LmMgICAgfCAzNyArKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpdHJvbml4LXN0Nzc4OXYuYwppbmRleCBlYmVmZTJmNGMyNmIuLmNjMDJjNTRj
MWIyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0
Nzc4OXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5
di5jCkBAIC0zLDcgKzMsNiBAQAogICogQ29weXJpZ2h0IChDKSAyMDE3IEZyZWUgRWxlY3Ryb25z
CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2Rl
bGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgpAQCAtMTE2LDcgKzExNSw2IEBAIHN0cnVjdCBzdDc3ODl2IHsKIAlzdHJ1Y3Qg
ZHJtX3BhbmVsIHBhbmVsOwogCXN0cnVjdCBzcGlfZGV2aWNlICpzcGk7CiAJc3RydWN0IGdwaW9f
ZGVzYyAqcmVzZXQ7Ci0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1
Y3QgcmVndWxhdG9yICpwb3dlcjsKIH07CiAKQEAgLTMyMywxMiArMzIxLDYgQEAgc3RhdGljIGlu
dCBzdDc3ODl2X2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3Qgc3Q3
Nzg5diAqY3R4ID0gcGFuZWxfdG9fc3Q3Nzg5dihwYW5lbCk7CiAKLQlpZiAoY3R4LT5iYWNrbGln
aHQpIHsKLQkJY3R4LT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlICY9IH5CTF9DT1JFX0ZCQkxBTks7
Ci0JCWN0eC0+YmFja2xpZ2h0LT5wcm9wcy5wb3dlciA9IEZCX0JMQU5LX1VOQkxBTks7Ci0JCWJh
Y2tsaWdodF91cGRhdGVfc3RhdHVzKGN0eC0+YmFja2xpZ2h0KTsKLQl9Ci0KIAlyZXR1cm4gc3Q3
Nzg5dl93cml0ZV9jb21tYW5kKGN0eCwgTUlQSV9EQ1NfU0VUX0RJU1BMQVlfT04pOwogfQogCkBA
IC0zMzksMTIgKzMzMSw2IEBAIHN0YXRpYyBpbnQgc3Q3Nzg5dl9kaXNhYmxlKHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKQogCiAJU1Q3Nzg5Vl9URVNUKHJldCwgc3Q3Nzg5dl93cml0ZV9jb21tYW5k
KGN0eCwgTUlQSV9EQ1NfU0VUX0RJU1BMQVlfT0ZGKSk7CiAKLQlpZiAoY3R4LT5iYWNrbGlnaHQp
IHsKLQkJY3R4LT5iYWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9XRVJET1dOOwot
CQljdHgtPmJhY2tsaWdodC0+cHJvcHMuc3RhdGUgfD0gQkxfQ09SRV9GQkJMQU5LOwotCQliYWNr
bGlnaHRfdXBkYXRlX3N0YXR1cyhjdHgtPmJhY2tsaWdodCk7Ci0JfQotCiAJcmV0dXJuIDA7CiB9
CiAKQEAgLTM3MCw3ICszNTYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wYW5lbF9mdW5j
cyBzdDc3ODl2X2RybV9mdW5jcyA9IHsKIAogc3RhdGljIGludCBzdDc3ODl2X3Byb2JlKHN0cnVj
dCBzcGlfZGV2aWNlICpzcGkpCiB7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpiYWNrbGlnaHQ7CiAJ
c3RydWN0IHN0Nzc4OXYgKmN0eDsKIAlpbnQgcmV0OwogCkBAIC0zOTQsMjYgKzM3OSwxNSBAQCBz
dGF0aWMgaW50IHN0Nzc4OXZfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAkJcmV0dXJu
IFBUUl9FUlIoY3R4LT5yZXNldCk7CiAJfQogCi0JYmFja2xpZ2h0ID0gb2ZfcGFyc2VfcGhhbmRs
ZShzcGktPmRldi5vZl9ub2RlLCAiYmFja2xpZ2h0IiwgMCk7Ci0JaWYgKGJhY2tsaWdodCkgewot
CQljdHgtPmJhY2tsaWdodCA9IG9mX2ZpbmRfYmFja2xpZ2h0X2J5X25vZGUoYmFja2xpZ2h0KTsK
LQkJb2Zfbm9kZV9wdXQoYmFja2xpZ2h0KTsKLQotCQlpZiAoIWN0eC0+YmFja2xpZ2h0KQotCQkJ
cmV0dXJuIC1FUFJPQkVfREVGRVI7Ci0JfQorCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQo
JmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKIAlyZXQgPSBkcm1fcGFu
ZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAlpZiAocmV0IDwgMCkKLQkJZ290byBlcnJfZnJlZV9iYWNr
bGlnaHQ7CisJCXJldHVybiByZXQ7CiAKIAlyZXR1cm4gMDsKLQotZXJyX2ZyZWVfYmFja2xpZ2h0
OgotCWlmIChjdHgtPmJhY2tsaWdodCkKLQkJcHV0X2RldmljZSgmY3R4LT5iYWNrbGlnaHQtPmRl
dik7Ci0KLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IHN0Nzc4OXZfcmVtb3ZlKHN0cnVj
dCBzcGlfZGV2aWNlICpzcGkpCkBAIC00MjIsOSArMzk2LDYgQEAgc3RhdGljIGludCBzdDc3ODl2
X3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogCiAJZHJtX3BhbmVsX3JlbW92ZSgmY3R4
LT5wYW5lbCk7CiAKLQlpZiAoY3R4LT5iYWNrbGlnaHQpCi0JCXB1dF9kZXZpY2UoJmN0eC0+YmFj
a2xpZ2h0LT5kZXYpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
