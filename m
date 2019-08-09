Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A887E28
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 17:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87F36EE30;
	Fri,  9 Aug 2019 15:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3716EE30
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 15:37:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v19so6000033wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 08:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rq4cGtMQd925FidugZdlpPW8cBLDdAs/Lx7hL0uzO8s=;
 b=QlceSXpHI8t+ON3juqEpxfMAAJBk8d+8MoCwdGnU8Xm8N3DnNLKE4Sx8n0txnrwHUW
 pBxOylxdWlMUn1+NJC1tmkp/5LWgTzDYRijAkaRJ1vQzjBScl3uLTS16dJS1azf0oRXY
 qofBEXFBaLoO5tb34NtkVKdHyjgJMAwb4A227Wo3fZbPk9rzwPfKCYLyilGDZRF8FFlZ
 TbP7vzQRgMIq8v3Ld6wj0yRkVpy+vXkqzas1D07Y9MpCzI6QOzPC+vDr/+mw20LIrI24
 trz/6pL39wvEt1rV2UaD8waFbKGh8+wiRTi40A2bLizwpZAO9DF/d1SibpTCGhwDq9a/
 aUYQ==
X-Gm-Message-State: APjAAAUPW2TSTo1ndxUaS4xSl7f5SadwZCbwG9WexxRhTklljeB6sBF5
 Sj/S+jTpBeQAGx2ycCSEDqFtCXRMl9i7oQ==
X-Google-Smtp-Source: APXvYqxFt1xPHqmoYsJYaajsFxVO67rNRLmGv+HtoiA3BGCuMehGXm06kgqN0g4ZfeYqZBYrkT90XA==
X-Received: by 2002:a7b:c0c6:: with SMTP id s6mr12292440wmh.115.1565365033861; 
 Fri, 09 Aug 2019 08:37:13 -0700 (PDT)
Received: from HeinrichFink-DPT-IR1433.local ([213.86.25.14])
 by smtp.gmail.com with ESMTPSA id l8sm196596288wrg.40.2019.08.09.08.37.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:37:12 -0700 (PDT)
From: Heinrich <heinrich.fink@daqri.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Add high-precision time to vblank trace event
Date: Fri,  9 Aug 2019 17:36:39 +0200
Message-Id: <20190809153639.14193-1-heinrich.fink@daqri.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daqri.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rq4cGtMQd925FidugZdlpPW8cBLDdAs/Lx7hL0uzO8s=;
 b=djRnSwXUpJwCh/01nYRZeLAPViXQ32l9xeppa75NFXrpicgMZxH9PYo4zZSSJabW5Q
 fDNWcJgdeh2PQF3k7bZ/Ndu5OuqDuWR0BIZbtWhFSI4dmHDpZkpqb/d63tpbbp24X+wI
 0rq9sf+E//9WxoaOxkI2on7FvbRMK/yER6B80=
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
Cc: Heinrich <heinrich.fink@daqri.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcmUgdGhlIHRpbWVzdGFtcCBvZiB0aGUgY3VycmVudCB2YmxhbmsgaW4gdGhlIG5ldyBmaWVs
ZCAndGltZScgb2YgdGhlCnZibGFuayB0cmFjZSBldmVudC4gSWYgdGhlIHRpbWVzdGFtcCBpcyBj
YWxjdWxhdGVkIGJ5IGEgZHJpdmVyIHRoYXQKc3VwcG9ydHMgaGlnaC1wcmVjaXNpb24gdmJsYW5r
IHRpbWluZywgc2V0IHRoZSBmaWVsZCAnaGlnaC1wcmVjJyB0bwondHJ1ZScuCgpVc2VyIHNwYWNl
IGNhbiBub3cgYWNjZXNzIGFjdHVhbCBoYXJkd2FyZSB2YmxhbmsgdGltZXMgdmlhIHRoZSB0cmFj
aW5nCmluZnJhc3RydWN0dXJlLiBUcmFjaW5nIGFwcGxpY2F0aW9ucyAoc3VjaCBhcyBHUFVWaXMs
IHNlZSBbMF0gZm9yCnJlbGF0ZWQgZGlzY3Vzc2lvbiksIGNhbiB1c2UgdGhlIG5ld2x5IGFkZGVk
IGluZm9ybWF0aW9uIHRvIGNvbmR1Y3QgYQptb3JlIGFjY3VyYXRlIGFuYWx5c2lzIG9mIGRpc3Bs
YXkgdGltaW5nLgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9taWtlc2FydC9ncHV2aXMvaXNzdWVz
LzMwCgpTaWduZWQtb2ZmLWJ5OiBIZWlucmljaCA8aGVpbnJpY2guZmlua0BkYXFyaS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oICB8IDE0ICsrKysrKysrKystLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCmluZGV4IGJhY2NjNjNk
YjEwNi4uNDVmMjFkN2ZjZmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNl
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCkBAIC0xMSwxNyArMTEsMjMgQEAK
ICNkZWZpbmUgVFJBQ0VfSU5DTFVERV9GSUxFIGRybV90cmFjZQogCiBUUkFDRV9FVkVOVChkcm1f
dmJsYW5rX2V2ZW50LAotCSAgICBUUF9QUk9UTyhpbnQgY3J0YywgdW5zaWduZWQgaW50IHNlcSks
Ci0JICAgIFRQX0FSR1MoY3J0Yywgc2VxKSwKKwkgICAgVFBfUFJPVE8oaW50IGNydGMsIHVuc2ln
bmVkIGludCBzZXEsIGt0aW1lX3QgdGltZSwgYm9vbCBoaWdoX3ByZWMpLAorCSAgICBUUF9BUkdT
KGNydGMsIHNlcSwgdGltZSwgaGlnaF9wcmVjKSwKIAkgICAgVFBfU1RSVUNUX19lbnRyeSgKIAkJ
ICAgIF9fZmllbGQoaW50LCBjcnRjKQogCQkgICAgX19maWVsZCh1bnNpZ25lZCBpbnQsIHNlcSkK
KwkJICAgIF9fZmllbGQoa3RpbWVfdCwgdGltZSkKKwkJICAgIF9fZmllbGQoYm9vbCwgaGlnaF9w
cmVjKQogCQkgICAgKSwKIAkgICAgVFBfZmFzdF9hc3NpZ24oCiAJCSAgICBfX2VudHJ5LT5jcnRj
ID0gY3J0YzsKIAkJICAgIF9fZW50cnktPnNlcSA9IHNlcTsKLQkJICAgICksCi0JICAgIFRQX3By
aW50aygiY3J0Yz0lZCwgc2VxPSV1IiwgX19lbnRyeS0+Y3J0YywgX19lbnRyeS0+c2VxKQorCQkg
ICAgX19lbnRyeS0+dGltZSA9IHRpbWU7CisJCSAgICBfX2VudHJ5LT5oaWdoX3ByZWMgPSBoaWdo
X3ByZWM7CisJCQkpLAorCSAgICBUUF9wcmludGsoImNydGM9JWQsIHNlcT0ldSwgdGltZT0lbGxk
LCBoaWdoLXByZWM9JXMiLAorCQkJX19lbnRyeS0+Y3J0YywgX19lbnRyeS0+c2VxLCBfX2VudHJ5
LT50aW1lLAorCQkJX19lbnRyeS0+aGlnaF9wcmVjID8gInRydWUiIDogImZhbHNlIikKICk7CiAK
IFRSQUNFX0VWRU5UKGRybV92YmxhbmtfZXZlbnRfcXVldWVkLApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5k
ZXggYTFiNjVkMjZkNzYxLi5mYjA4OWE4OGI1MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMTcw
Niw3ICsxNzA2LDggQEAgc3RhdGljIHZvaWQgZHJtX2hhbmRsZV92YmxhbmtfZXZlbnRzKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCQlzZW5kX3ZibGFua19ldmVu
dChkZXYsIGUsIHNlcSwgbm93KTsKIAl9CiAKLQl0cmFjZV9kcm1fdmJsYW5rX2V2ZW50KHBpcGUs
IHNlcSk7CisJdHJhY2VfZHJtX3ZibGFua19ldmVudChwaXBlLCBzZXEsIG5vdywKKwkJCWRldi0+
ZHJpdmVyLT5nZXRfdmJsYW5rX3RpbWVzdGFtcCAhPSBOVUxMKTsKIH0KIAogLyoqCi0tIAoyLjIz
LjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
