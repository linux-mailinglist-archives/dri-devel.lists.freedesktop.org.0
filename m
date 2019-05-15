Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3225A1F90B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 19:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D138920F;
	Wed, 15 May 2019 17:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536168920F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 17:01:07 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z19so424323qtz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 10:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZE7g/HGauausRDTK6bZw/q/K+Gnd9OS+XsSVo0GduUI=;
 b=XJny/JuevBb6POvJGcEVfts0ms42i5n5d1mu+XKuCpzJxx19QV8/aHG5v+wBc0FTZa
 pc8f0hOnYK0VUfUM9jeEq92mIoYbA1Du8MtpQsZGgNOfXloxWIEJHCr+Fe7cq/SpcMD8
 oePFSlslY8yF1m4niyeSF828B3uIxSPliWdSC9RW0Zqv/QnfKdh0FrP/SN1mKwkbBjyO
 QP6RigvAAR1CUCB2kzSajAiotN0+Qhf7rAxduL85B5/dGgqcT+li862jS/jON+KzE8W/
 boN4yIg8UNkjzZO8Yyah/mAQdBFWgbzGBVivcvP89KkdPkF7/qqpI+wrmA+Yegr6E+7r
 r2Qw==
X-Gm-Message-State: APjAAAXVCVKzFkyLQJXLbR3WFVKLyqWUQxv3MpCV283p4G/1DkzXBWS2
 3Mld62Xxde184lpFxcQGh2uI9IPlb2Y=
X-Google-Smtp-Source: APXvYqzLdXfuFpI0sV/8xgRItzIbC+3nYZhFJaitBs9ADziTO4/uBh4d2TolOL9dKNIG9a/UkMfzUQ==
X-Received: by 2002:a0c:a91d:: with SMTP id y29mr9117072qva.0.1557939666252;
 Wed, 15 May 2019 10:01:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k63sm1100934qkf.97.2019.05.15.10.01.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 10:01:05 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
Date: Wed, 15 May 2019 13:00:52 -0400
Message-Id: <20190515170104.155525-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZE7g/HGauausRDTK6bZw/q/K+Gnd9OS+XsSVo0GduUI=;
 b=P7qIIA/qcOgl9iUWmNJT4dv7IVphTUQWjFwSwh3SX2rrflcjjeSGKiF5UFInKtBH+Y
 WEtBBwkRWy0nZbCSC2thQEBxDvr8GY9jAgoBY++4LiJ8JPAhhV+u3V1A3X4jzE7UORMY
 dqX5CSnv7c+JrmFgu6wbyaG93t1sfhxF6E3wsOI2zKJ34XanLHagzRf2OUA017jVAtP5
 j4I7gpYUCjLYJnZ+OXDp+WrDKlZuwKwI9fFtijzx6cYuF0DrE8Bimef9jVOxop5TQGIB
 ux2I6KZ9tqb2qhyOiSb1ch3xRq+jbUxiIW1Qa11gVOwoTj10QgVlBAM4KAo1JthByqj0
 72Ow==
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpkZXZfcG1fZG9tYWluX2F0
dGFjaF9ieV9uYW1lKCkgY2FuIHJldHVybiBOVUxMLCBzbyB3ZSBzaG91bGQgY2hlY2sgZm9yCnRo
YXQgY2FzZSB3aGVuIHdlJ3JlIGFib3V0IHRvIGRlcmVmZXJlbmNlIGd4cGQuCgpGaXhlczogOTMy
NWQ0MjY2YWZkICgiZHJtL21zbS9ncHU6IEF0dGFjaCB0byB0aGUgR1BVIEdYIHBvd2VyIGRvbWFp
biIpCkNjOiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgpDYzogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4
X2dtdS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKaW5kZXggOTE1NWRh
ZmFlMmE5MC4uMzhlMmNmYTljZWM3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9nbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jCkBAIC03NDcsNyArNzQ3LDcgQEAgaW50IGE2eHhfZ211X3Jlc3VtZShzdHJ1Y3QgYTZ4eF9n
cHUgKmE2eHhfZ3B1KQogCSAqIHdpbGwgbWFrZSBzdXJlIHRoYXQgdGhlIHJlZmNvdW50aW5nIGlz
IGNvcnJlY3QgaW4gY2FzZSB3ZSBuZWVkIHRvCiAJICogYnJpbmcgZG93biB0aGUgR1ggYWZ0ZXIg
YSBHTVUgZmFpbHVyZQogCSAqLwotCWlmICghSVNfRVJSKGdtdS0+Z3hwZCkpCisJaWYgKCFJU19F
UlJfT1JfTlVMTChnbXUtPmd4cGQpKQogCQlwbV9ydW50aW1lX2dldChnbXUtPmd4cGQpOwogCiBv
dXQ6CkBAIC04NjMsNyArODYzLDcgQEAgaW50IGE2eHhfZ211X3N0b3Aoc3RydWN0IGE2eHhfZ3B1
ICphNnh4X2dwdSkKIAkgKiBkb21haW4uIFVzdWFsbHkgdGhlIEdNVSBkb2VzIHRoaXMgYnV0IG9u
bHkgaWYgdGhlIHNodXRkb3duIHNlcXVlbmNlCiAJICogd2FzIHN1Y2Nlc3NmdWwKIAkgKi8KLQlp
ZiAoIUlTX0VSUihnbXUtPmd4cGQpKQorCWlmICghSVNfRVJSX09SX05VTEwoZ211LT5neHBkKSkK
IAkJcG1fcnVudGltZV9wdXRfc3luYyhnbXUtPmd4cGQpOwogCiAJY2xrX2J1bGtfZGlzYWJsZV91
bnByZXBhcmUoZ211LT5ucl9jbG9ja3MsIGdtdS0+Y2xvY2tzKTsKQEAgLTEyMzQsNyArMTIzNCw3
IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUpCiAKIAlw
bV9ydW50aW1lX2Rpc2FibGUoZ211LT5kZXYpOwogCi0JaWYgKCFJU19FUlIoZ211LT5neHBkKSkg
eworCWlmICghSVNfRVJSX09SX05VTEwoZ211LT5neHBkKSkgewogCQlwbV9ydW50aW1lX2Rpc2Fi
bGUoZ211LT5neHBkKTsKIAkJZGV2X3BtX2RvbWFpbl9kZXRhY2goZ211LT5neHBkLCBmYWxzZSk7
CiAJfQotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0g
T1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
