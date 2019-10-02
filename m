Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C9C45B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 03:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF5E897DC;
	Wed,  2 Oct 2019 01:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA826897DC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 01:49:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v27so10975891pgk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 18:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqt1llNkQVMjtqE7BXPtP6+dPRgbYEn9xPiuVRxKYdA=;
 b=QDpDyiLlwU9xD61leeCcjpMcJBR2aDNOpTbgOvDuQmL6uj2VYJwvm2v34NrkVr+b+W
 wCZBz6/HXN4XyS+gELFqYILuA/H+qBuiuG66yle8m5EHsEqZOt1ec4ZbDxrrSy6xyUuy
 qbySDvt0SM2NySf45kBnBK++6USxBHOK5XcTPqFCRaAkEv05VOED25SHJVQ8Ek8S5q5K
 ZTOjBUau9Yq5K1sIgEVxj+trgKnLl8A6ArOI7TE63Jfg1prr31kk+j3cFDsXGg7zoyfE
 H/JXol2wUtGv06Km+OX4LaDtL5mAvX2kDwneOoafxW0V1VLqrM7u37U3zO7l5qPLf1dH
 SNrg==
X-Gm-Message-State: APjAAAV/xgwXtXySXX0KzXdYQxNaz5PUFVzCd0fMeUomSmmeCc1x+nWE
 7ekYqRWneOt551MKJ2Q2LIQFjxu5XiQ=
X-Google-Smtp-Source: APXvYqy5Z/ypPSHttbSNXeYae8/YavPqj5itIz9cwIjHCtD9ei8gaAsujlV/LuLlqwfig5n/GhNmZQ==
X-Received: by 2002:a62:1888:: with SMTP id 130mr1669883pfy.72.1569980982859; 
 Tue, 01 Oct 2019 18:49:42 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id k15sm19404326pgt.66.2019.10.01.18.49.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Oct 2019 18:49:42 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with stride/layer_stride
 fix
Date: Tue,  1 Oct 2019 18:49:35 -0700
Message-Id: <20191002014935.33171-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002014935.33171-1-gurchetansingh@chromium.org>
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqt1llNkQVMjtqE7BXPtP6+dPRgbYEn9xPiuVRxKYdA=;
 b=mMAr8AOFU3D4uRRpi/Zg8lNoiBCrxnbgtUQc8QUsjgT1uI0fPA+0Aj5b2MbL8GU58/
 rFtpnAsumMWazf2DFqpCAkT4GgJuVMk9h9MxlaPE2ob1irkN8IHbtIdJsXge4zvn6qZP
 rFKH4pT+EDrg2mGoxhzdEyueUbhSgTE1SFwko=
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
Cc: airlied@linux.ie, kraxel@redhat.com,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkb2Vzbid0IHJlYWxseSBicmVhayB1c2Vyc3BhY2UsIHNpbmNlIGl0IGFsd2F5cyBwYXNz
ZXMgZG93bgowIGZvciBzdHJpZGUvbGF5ZXJfc3RyaWRlIGN1cnJlbnRseS4gV2UgY291bGQ6Cgoo
MSkgbW9kaWZ5IFVBUEkgbm93IGFuZCBhZGQgYSBWSVJUR1BVX1BBUkFNX1NUUklERV9GSVggZmVh
dHVyZQoKKDIpIG1vZGlmeSB0aGUgVUFQSSBub3csIGFuZCBub3QgZXhwb3NlIGEgY29ycmVzcG9u
ZGluZyBmZWF0dXJlCiAgICAoaS5lLCBWSVJUR1BVX1BBUkFNX1NUUklERV9GSVgpLiAgVGhpcyB3
b3VsZCBmb2xkIHRoaXMgbWlub3IgZml4CiAgICBpbnRvIGFub3RoZXIgYmlnZ2VyIGZlYXR1cmUg
KGxpa2UgdGhlIHByb3Bvc2VkIG1ldGFkYXRhIHF1ZXJ5KS4KCigzKSBkb24ndCBtb2RpZnkgVUFQ
SSBub3csIHdhaXQgdW50aWwgYW5vdGhlciBmZWF0dXJlIGxhbmRzLgoKSSBkb24ndCBoYXZlIGEg
cHJlZmVyZW5jZSBlaXRoZXIgd2F5LCBhcyBsb25nIGFzIHdlIGdldCBzb21ldGhpbmcgbGlrZQp0
aGlzIGV2ZW50dWFsbHkuCgpUaGUgY29ycmVzcG9uZGluZyB1c2Vyc3BhY2UgaXM6CgpodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL21lcmdlX3JlcXVlc3RzLzIxMjkKClNp
Z25lZC1vZmYtYnk6IEd1cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgOCArKystLS0t
LQogaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oICAgICAgICAgfCA0ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggOThiNzJkZWFkOTYyLi5jMjk0NzNhYzI0YTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCkBAIC0zMjUsMTAgKzMyNSw5
IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3RfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJZ290byBlcnJfdW5sb2NrOwogCX0KIAotCS8qIFRPRE86IGFk
ZCB0aGUgY29ycmVjdCBzdHJpZGUgLyBsYXllcl9zdHJpZGUuICovCiAJdmlydGlvX2dwdV9jbWRf
dHJhbnNmZXJfZnJvbV9ob3N0XzNkCi0JCSh2Z2RldiwgdmZwcml2LT5jdHhfaWQsIG9mZnNldCwg
YXJncy0+bGV2ZWwsIDAsIDAsCi0JCSAmYm94LCBvYmpzLCBmZW5jZSk7CisJCSh2Z2RldiwgdmZw
cml2LT5jdHhfaWQsIG9mZnNldCwgYXJncy0+bGV2ZWwsIGFyZ3MtPnN0cmlkZSwKKwkJIGFyZ3Mt
PmxheWVyX3N0cmlkZSwgJmJveCwgb2JqcywgZmVuY2UpOwogCWRtYV9mZW5jZV9wdXQoJmZlbmNl
LT5mKTsKIAlyZXR1cm4gMDsKIApAQCAtMzcxLDExICszNzAsMTAgQEAgc3RhdGljIGludCB2aXJ0
aW9fZ3B1X3RyYW5zZmVyX3RvX2hvc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAkJaWYgKCFmZW5jZSkKIAkJCWdvdG8gZXJyX3VubG9jazsKIAotCQkvKiBUT0RP
OiBhZGQgdGhlIGNvcnJlY3Qgc3RyaWRlIC8gbGF5ZXJfc3RyaWRlLiAqLwogCQl2aXJ0aW9fZ3B1
X2NtZF90cmFuc2Zlcl90b19ob3N0XzNkCiAJCQkodmdkZXYsCiAJCQkgdmZwcml2ID8gdmZwcml2
LT5jdHhfaWQgOiAwLCBvZmZzZXQsIGFyZ3MtPmxldmVsLAotCQkJIDAsIDAsICZib3gsIG9ianMs
IGZlbmNlKTsKKwkJCSBhcmdzLT5zdHJpZGUsIGFyZ3MtPmxheWVyX3N0cmlkZSwgJmJveCwgb2Jq
cywgZmVuY2UpOwogCQlkbWFfZmVuY2VfcHV0KCZmZW5jZS0+Zik7CiAJfQogCXJldHVybiAwOwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS92aXJ0Z3B1X2RybS5oCmluZGV4IGYwNmE3ODlmMzRjZC4uYjJmYzkyYzNkMmJlIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBp
L2RybS92aXJ0Z3B1X2RybS5oCkBAIC0xMTcsNiArMTE3LDggQEAgc3RydWN0IGRybV92aXJ0Z3B1
XzNkX3RyYW5zZmVyX3RvX2hvc3QgewogCXN0cnVjdCBkcm1fdmlydGdwdV8zZF9ib3ggYm94Owog
CV9fdTMyIGxldmVsOwogCV9fdTMyIG9mZnNldDsKKwlfX3UzMiBzdHJpZGU7CisJX191MzIgbGF5
ZXJfc3RyaWRlOwogfTsKIAogc3RydWN0IGRybV92aXJ0Z3B1XzNkX3RyYW5zZmVyX2Zyb21faG9z
dCB7CkBAIC0xMjQsNiArMTI2LDggQEAgc3RydWN0IGRybV92aXJ0Z3B1XzNkX3RyYW5zZmVyX2Zy
b21faG9zdCB7CiAJc3RydWN0IGRybV92aXJ0Z3B1XzNkX2JveCBib3g7CiAJX191MzIgbGV2ZWw7
CiAJX191MzIgb2Zmc2V0OworCV9fdTMyIHN0cmlkZTsKKwlfX3UzMiBsYXllcl9zdHJpZGU7CiB9
OwogCiAjZGVmaW5lIFZJUlRHUFVfV0FJVF9OT1dBSVQgMSAvKiBsaWtlIGl0ICovCi0tIAoyLjIz
LjAuNDQ0LmcxOGVlYjVhMjY1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
