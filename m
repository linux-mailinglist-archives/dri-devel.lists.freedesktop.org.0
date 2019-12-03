Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88445110205
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5415E6E848;
	Tue,  3 Dec 2019 16:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1AE6E846
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s14so4165047wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyzOe2qMdvVwhl1mEyFjGx3TYlIMn6F7cP5QiE14+H4=;
 b=lbZk/yVE0c1B3qpBZj6GgbF3XcnW/mo3WufgTPxM3V7i174i2bTyPFpjt7lwnqhonc
 ixx1kc9Ywi7bUS0k7kRujb4kKdBPobgaIl1gJXKPKOvuDBhg1w7duc+29sENGT44POLp
 zGVomU9fTR5t0yCwxBE0iryVWxL4w60xhnrUyUx1yFn8WNxR2Snr5nGKcD6bAK4dxS3Q
 zRZDduJ+WJ4DPtppwUsIW8A6FjGJnGVFwMR7lqs+MjZB62PkpeiclmLUfol/yNZlkeUV
 j5VIu7iP2MeUjZ3UsWJXdi8LEb8uHIOyr1PfwcrTPPeW0aYJrnTU55RAsZ2acfm+8Ppv
 fR4w==
X-Gm-Message-State: APjAAAX1QOjBO7qDuhIBzsRMRzJSYif+SlZILs0R+qa6IB5WFmn/cZwl
 wruYkXwILP1CASX4dCeYEKM=
X-Google-Smtp-Source: APXvYqwT/wJuzWWV2RPfPnQ7sxDm7cPpS+KNP3aqUMF36DKBCbFhDzv97wNKTeSIru/mQVG2PMmFrw==
X-Received: by 2002:a05:600c:24d1:: with SMTP id
 17mr25491563wmu.151.1575389970584; 
 Tue, 03 Dec 2019 08:19:30 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id x18sm4081958wrr.75.2019.12.03.08.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:29 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 7/9] drm/tegra: Silence expected errors on IOMMU attach
Date: Tue,  3 Dec 2019 17:19:12 +0100
Message-Id: <20191203161914.1312555-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyzOe2qMdvVwhl1mEyFjGx3TYlIMn6F7cP5QiE14+H4=;
 b=qValVkF8/qyIg3bVfigaMdP6d1f9SDnhBW4ha4pbI66ZuSwMV0obJpRDLk2/GxQEyY
 2DduUn4hNVmBCC7I/hq1TRg/7u7mZFbldSHl68BQYaqgzYpTsCDwFiHOKjs+qytDW5P0
 SpwSOQJ3ejVxwVlzENpY3it2ox6AC4z+HhThEO5mSMlXNLD/hCwhPcolWmkOohQpLWJW
 BTZpMKbfTz8HxSEPNuqalfNVU0ppveFHwVcX4LvxFBu7OCIFsZyVprYJAv1gE/S75urs
 kxc1+uLaOk5ifq8HqdnzVuZkstGUVPGGZ0p9EdeXJFdS7SCUXmvRqUFiKSOqHO62Gfu2
 /4qA==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN1YmRldmljZXMgbWF5
IG5vdCBiZSBob29rZWQgdXAgdG8gYW4gSU9NTVUgdmlhIGRldmljZSB0cmVlLiBEZXRlY3Qgc3Vj
aApzaXR1YXRpb25zIGFuZCBhdm9pZCBjb25mdXNpbmcgdXNlcnMgYnkgbm90IGVtaXR0aW5nIGFu
IGVycm9yIG1lc3NhZ2UuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlh
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyAgfCAyICstCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHJtLmMgfCA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2RjLmMKaW5kZXggMGE1Zjg2YjYxZmRhLi4yYjlhMjVjOTc3YzAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
Yy5jCkBAIC0yMDI3LDcgKzIwMjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2RjX2luaXQoc3RydWN0
IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAkJZGV2X3dhcm4oZGMtPmRldiwgImZhaWxlZCB0byBh
bGxvY2F0ZSBzeW5jcG9pbnRcbiIpOwogCiAJZXJyID0gaG9zdDF4X2NsaWVudF9pb21tdV9hdHRh
Y2goY2xpZW50KTsKLQlpZiAoZXJyIDwgMCkgeworCWlmIChlcnIgPCAwICYmIGVyciAhPSAtRU5P
REVWKSB7CiAJCWRldl9lcnIoY2xpZW50LT5kZXYsICJmYWlsZWQgdG8gYXR0YWNoIHRvIGRvbWFp
bjogJWRcbiIsIGVycik7CiAJCXJldHVybiBlcnI7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCmluZGV4IDU2
ZTVlN2E1YzEwOC4uN2ExNmI1MWVhYTJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCkBAIC05MjAsMTAgKzky
MCw4IEBAIGludCBob3N0MXhfY2xpZW50X2lvbW11X2F0dGFjaChzdHJ1Y3QgaG9zdDF4X2NsaWVu
dCAqY2xpZW50KQogCiAJaWYgKHRlZ3JhLT5kb21haW4pIHsKIAkJZ3JvdXAgPSBpb21tdV9ncm91
cF9nZXQoY2xpZW50LT5kZXYpOwotCQlpZiAoIWdyb3VwKSB7Ci0JCQlkZXZfZXJyKGNsaWVudC0+
ZGV2LCAiZmFpbGVkIHRvIGdldCBJT01NVSBncm91cFxuIik7CisJCWlmICghZ3JvdXApCiAJCQly
ZXR1cm4gLUVOT0RFVjsKLQkJfQogCiAJCWlmIChkb21haW4gIT0gdGVncmEtPmRvbWFpbikgewog
CQkJZXJyID0gaW9tbXVfYXR0YWNoX2dyb3VwKHRlZ3JhLT5kb21haW4sIGdyb3VwKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS92aWMuYwppbmRleCBjNGQ4MmI4YjMwNjUuLjM1MjZjMjg5MmRkYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMu
YwpAQCAtMTY3LDcgKzE2Nyw3IEBAIHN0YXRpYyBpbnQgdmljX2luaXQoc3RydWN0IGhvc3QxeF9j
bGllbnQgKmNsaWVudCkKIAlpbnQgZXJyOwogCiAJZXJyID0gaG9zdDF4X2NsaWVudF9pb21tdV9h
dHRhY2goY2xpZW50KTsKLQlpZiAoZXJyIDwgMCkgeworCWlmIChlcnIgPCAwICYmIGVyciAhPSAt
RU5PREVWKSB7CiAJCWRldl9lcnIodmljLT5kZXYsICJmYWlsZWQgdG8gYXR0YWNoIHRvIGRvbWFp
bjogJWRcbiIsIGVycik7CiAJCXJldHVybiBlcnI7CiAJfQotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
