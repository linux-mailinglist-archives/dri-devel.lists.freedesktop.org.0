Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43E190191
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CC56E405;
	Mon, 23 Mar 2020 23:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AD66E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:09:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g62so1550911wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNgl4lWOGJ95ga1HdYsjUp4EAhTY9YRhQarh47ivnqo=;
 b=hFe2LfH/kNWE4Bbjj2K3hRaEC8C3L1Gfi1g8WtpZlAnjeKnIinMSkmx01lQjrr1h+1
 5lR4PRY+G5s0OUXrgf7D1Qm453ihpBOo0oKvPlQr0pp457Z48jV5M2yWNntEE62FYZKb
 Iy5fpVLwBkBax9xF5Vq7MySQp5A1LcHrsK/ch66XRpuUqyA0TcDdPYccH7OnpFNU4hq6
 hzLEtBiUAADXG3cFyEvJxm4PJnkeMCTgWeDlSYKzpQlY61Vp54PYTpbGdfZyd8mqhikb
 nv7UQsXfmUd87IHg25Gr5x3ExUNzl5VcsL4vAxs1e8Cp0XGfpgLx3fYKToyY6tbeopiy
 YD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNgl4lWOGJ95ga1HdYsjUp4EAhTY9YRhQarh47ivnqo=;
 b=dCOspTqWMgUNTSPQoDEAGLWsfh+qM2kR9aTLH4Jn1L0fLXhLncCxXgqg71FroEpOwr
 et8Y3uEFwyWtezfVP9gxAD7f8iRzM1xUeci+q3cfAQ0w2Fk4KlMvHQeap1EF9+8y/Yuh
 qCsowvDnAuqrc/494aN8u2jZMo1usW1SFypj/thkbdzejMBngZGIrZ900MZKQ21eL0Wq
 AvlF1Za/EgNug1cKG0h1rvv3d/tfZyLJ6Q7h0nrtowdmfFSBRSWCJs8Wk8a/ignMuE8m
 sU4IpymPyiclSiNxi7btxNam+n1NUrgUveJanAS+cxFwGD5lKQ0Puf9ilzDV02dUJc9r
 hg7A==
X-Gm-Message-State: ANhLgQ3o+WyjlY8LRf/6utRK4SE9n1Jh7vrnrZLzuL/rHWp6gOkGfmT6
 G1i91NkncQPPJk8T7pXK3Qp3L8rq
X-Google-Smtp-Source: ADFU+vstezCTOLAEERY/YSQXVbsA33AFlKMz6auIlymtWSy+2/UTBDJq7dK/skPZOyaIKiUisvdsXg==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr1703638wmf.141.1585004961096; 
 Mon, 23 Mar 2020 16:09:21 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id q185sm1641937wme.10.2020.03.23.16.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:09:20 -0700 (PDT)
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
X-Google-Original-From: Roland Scheidegger <sroland@vmware.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 16/17] drm/vmwgfx: Add SM5 param for userspace
Date: Tue, 24 Mar 2020 00:09:00 +0100
Message-Id: <20200323230901.13302-17-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323230901.13302-1-sroland@vmware.com>
References: <20200323230901.13302-1-sroland@vmware.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKQWRkIGEgbmV3IHBh
cmFtIGZvciB1c2VyLXNwYWNlIHRvIGRldGVybWluZSBpZiBrZXJuZWwgbW9kdWxlIGlzIFNNNQpj
YXBhYmxlLgoKU2lnbmVkLW9mZi1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwu
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+ClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13
YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2Fy
ZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfaW9jdGwuYyB8IDMgKysr
CiBpbmNsdWRlL3VhcGkvZHJtL3Ztd2dmeF9kcm0uaCAgICAgICAgIHwgNCArKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0
bC5jCmluZGV4IDBhZjQyODc1YmE0ZS4uZjY4MWI3YjRkZjFiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2lvY3RsLmMKQEAgLTExOSw2ICsxMTksOSBAQCBpbnQgdm13X2dldHBhcmFtX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJY2FzZSBEUk1fVk1XX1BB
UkFNX1NNNF8xOgogCQlwYXJhbS0+dmFsdWUgPSBoYXNfc200XzFfY29udGV4dChkZXZfcHJpdik7
CiAJCWJyZWFrOworCWNhc2UgRFJNX1ZNV19QQVJBTV9TTTU6CisJCXBhcmFtLT52YWx1ZSA9IGhh
c19zbTVfY29udGV4dChkZXZfcHJpdik7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAt
RUlOVkFMOwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oIGIv
aW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmgKaW5kZXggOGNkNGIzMjE1OTdjLi4wMmU5MTc1
MDc0NzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCisrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCkBAIC04Niw2ICs4Niw5IEBAIGV4dGVybiAiQyIg
ewogICoKICAqIERSTV9WTVdfUEFSQU1fU000XzEKICAqIFNNNF8xIHN1cHBvcnQgaXMgZW5hYmxl
ZC4KKyAqCisgKiBEUk1fVk1XX1BBUkFNX1NNNQorICogU001IHN1cHBvcnQgaXMgZW5hYmxlZC4K
ICAqLwogCiAjZGVmaW5lIERSTV9WTVdfUEFSQU1fTlVNX1NUUkVBTVMgICAgICAwCkBAIC0xMDMs
NiArMTA2LDcgQEAgZXh0ZXJuICJDIiB7CiAjZGVmaW5lIERSTV9WTVdfUEFSQU1fRFggICAgICAg
ICAgICAgICAxMgogI2RlZmluZSBEUk1fVk1XX1BBUkFNX0hXX0NBUFMyICAgICAgICAgMTMKICNk
ZWZpbmUgRFJNX1ZNV19QQVJBTV9TTTRfMSAgICAgICAgICAgIDE0CisjZGVmaW5lIERSTV9WTVdf
UEFSQU1fU001ICAgICAgICAgICAgICAxNQogCiAvKioKICAqIGVudW0gZHJtX3Ztd19oYW5kbGVf
dHlwZSAtIGhhbmRsZSB0eXBlIGZvciByZWYgaW9jdGxzCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
