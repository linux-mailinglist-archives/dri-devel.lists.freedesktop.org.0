Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A117DC9
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 18:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A0B89862;
	Wed,  8 May 2019 16:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECD889862
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 16:09:47 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t1so3624767qtc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 09:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zRNTbKqT4JCfOSK6xrkUmA02JfSOD9QQELwl7WDvtpU=;
 b=i+4XFxUIK0fC7YT/vlNQxboXDrJeBHRsVN5I08UKEzqqQPR+fkpxNNiq68mo+UEX3U
 WKRuQPQpnzIVuFGSKvws8Y5lEwyjDF00hY4FEhAk5bit5le5JqWYBeXE+ko4qTAsRVjk
 eAr2UJ4uWH9ucWRq/qQwrkd5Fe76H8OHsauOo+JhGJ8oKAg/1csloAvpvcbq9RvFu0cM
 ghb9++h84wYJdail4jy+FtDquoNRzt5/Uw9P+CcTLnzrp/KSfZfbvdCsBNTRcGFMW8fH
 aXGQPFgWcRicSuHPMVBwpOM9DDBG1nUxSHU28OBCNAog3Hk8vF9YAOj5PtbjswuLWRpM
 sDSw==
X-Gm-Message-State: APjAAAWtQsyaduD38A/B2KbpKjmCxzd7/Q+mZN64JYXt6A7r6i1tiMSb
 DzXG4bVOdDJbcIOGFxjUdrM2SPW++9g=
X-Google-Smtp-Source: APXvYqy3tayWKc8duRQ+bmjeFbIIdoifi1bY3aQ16j3Eu10XqXuqG/BNha0+Qge2up4EtO7LgVBghA==
X-Received: by 2002:ac8:36ce:: with SMTP id b14mr10657578qtc.190.1557331786216; 
 Wed, 08 May 2019 09:09:46 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s50sm10936877qts.39.2019.05.08.09.09.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:09:45 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/11] drm/rockchip: Use drm_atomic_helper_commit_tail_rpm
Date: Wed,  8 May 2019 12:09:16 -0400
Message-Id: <20190508160920.144739-12-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRNTbKqT4JCfOSK6xrkUmA02JfSOD9QQELwl7WDvtpU=;
 b=SfmynSg1AWxXf5d82GnEIvAHjeX1xH/Fb+F7Moe9A/+pxMp24GZorMQ5g0XNcMK8Cm
 Gbhushqoo70XYPrnF+P/GHPL3Vdkr+y7M8sJvlzEFou8P7APvcpdZG9mJMO0u5dttHEw
 3rL2nQwHour5/S9FaIR0hI1Umt1ohM+MkqyL4n6p7EBNuW8V3WIzWxVYBE9LbSBEs4Ax
 ar45aXOK3GN/0W4hYac1bNPAQy0uP819fcgjjvUWXj65rd1R+phgA+TlZvKN1fc+4lwi
 jgidmqLUXWCzUulWoSl9KCJtev6297tYX+MTVDAVfE5Yvz4ZD8xrRkKzcU/AmORcNzpq
 nvGA==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSB1c2Ug
dGhlIGRybSBwc3IgaGVscGVycywgd2Ugbm8gbG9uZ2VyIG5lZWQgdG8gaGFuZC1yb2xsIG91cgph
dG9taWNfY29tbWl0X3RhaWwgaW1wbGVtZW50YXRpb24uIFNvIHVzZSB0aGUgaGVscGVyCgpDaGFu
Z2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBpbiB2MzoKLSBOb25lCkNoYW5nZXMgaW4gdjQ6Ci0g
Tm9uZQoKTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNo
L21zZ2lkLzIwMTkwMjI4MjEwOTM5LjgzMzg2LTYtc2VhbkBwb29ybHkucnVuCkxpbmsgdG8gdjI6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDMyNjIw
NDUwOS45NjUxNS01LXNlYW5AcG9vcmx5LnJ1bgpMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTExLXNl
YW5AcG9vcmx5LnJ1bgoKQ2M6IFphaW4gV2FuZyA8d3p6QHJvY2stY2hpcHMuY29tPgpDYzogVG9t
YXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxz
ZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV9mYi5jIHwgMjEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fZmIuYwppbmRleCAyMTQwNjRkNTk5ZWUuLjFjNjNkOWU4MzNiYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpAQCAtMTE3LDI3ICsx
MTcsOCBAQCByb2NrY2hpcF91c2VyX2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIAlyZXR1cm4gRVJSX1BUUihyZXQpOwogfQogCi1z
dGF0aWMgdm9pZAotcm9ja2NoaXBfYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0oc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKLXsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gb2xkX3N0YXRlLT5kZXY7Ci0KLQlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfbW9kZXNldF9k
aXNhYmxlcyhkZXYsIG9sZF9zdGF0ZSk7Ci0KLQlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfbW9k
ZXNldF9lbmFibGVzKGRldiwgb2xkX3N0YXRlKTsKLQotCWRybV9hdG9taWNfaGVscGVyX2NvbW1p
dF9wbGFuZXMoZGV2LCBvbGRfc3RhdGUsCi0JCQkJCURSTV9QTEFORV9DT01NSVRfQUNUSVZFX09O
TFkpOwotCi0JZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUob2xkX3N0YXRlKTsKLQot
CWRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MoZGV2LCBvbGRfc3RhdGUpOwotCi0J
ZHJtX2F0b21pY19oZWxwZXJfY2xlYW51cF9wbGFuZXMoZGV2LCBvbGRfc3RhdGUpOwotfQotCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfZnVuY3Mgcm9ja2NoaXBf
bW9kZV9jb25maWdfaGVscGVycyA9IHsKLQkuYXRvbWljX2NvbW1pdF90YWlsID0gcm9ja2NoaXBf
YXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0sCisJLmF0b21pY19jb21taXRfdGFpbCA9IGRy
bV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIHJvY2tjaGlwX2RybV9tb2RlX2NvbmZpZ19mdW5jcyA9
IHsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
