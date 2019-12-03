Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB981101F8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EE76E83E;
	Tue,  3 Dec 2019 16:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32106E83E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so4448201wrr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjYPQ2k6428g0Cg1s43bFBcw4e2+WGwefK1SwWebzQU=;
 b=qdGFbIudsgAw0Xy7Lca0PQmTSWp63mH5/+a901XoRDpg3itHKKJvaiTjvkjoXRaf+w
 iNzHdOvEES9nnIGcEKLYQqkEgzgw7SXDEub5bVGT74ksE2A9YAzHMh/BFC3GDUSQTnHc
 RawpdDu1iItBWzC8NgvwIl5x/+h3C15f0Z47mn2vzVdu0c1EOwKJrWLDi5yv8zkPNTj7
 OEI5O6FP20YmtDXjrJxXCTCvJSFCFcrEGt+V/SpEdMdNoSNLsuwAvDCPkcMtj3JQosrY
 XHJc74dIIG7YyG5525GcvxU2r6r70bs0lYqiQSYpP21/PXc7W0Qng6kimCQctrQcXUh0
 IM6g==
X-Gm-Message-State: APjAAAXjbJATeyNLiq0R4M6KT2DtRzYRKqsMd1MCteeVTRWcNV1ehndl
 CBox8qjKoIJ8o5uygasoemE=
X-Google-Smtp-Source: APXvYqwdCR2ddyErXa8r9O+qWPWJ+/tZW2/osXU5f7BU/Bytj2oFg0HdQ2sBwLYJVead4gikfjt+kQ==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr4573223wrr.98.1575389957119; 
 Tue, 03 Dec 2019 08:19:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l17sm3518398wme.45.2019.12.03.08.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:15 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/9] drm/tegra: hub: Remove bogus connection mutex check
Date: Tue,  3 Dec 2019 17:19:06 +0100
Message-Id: <20191203161914.1312555-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjYPQ2k6428g0Cg1s43bFBcw4e2+WGwefK1SwWebzQU=;
 b=W681X+pYik3350bfuhteJclqkTvrQYBYxsAGfZE3S4lrFo+RCgdGHU564bQsdGMfm/
 8Cjcg6tmXKoAI+3Z2mVVcWJ+scF9ZE0NyFtg6kvvy67fnI5uIwaxdJT2gybqDl6lkA2v
 /R3bt0HrLoeKNPGKIqhz9Zp1ooKY4L0JU0aZ9GrBWRbVgbLMAwHx0iM4XAFsa0X3JCUG
 9Sz5EyPwMKE8GKpDO6rkbRUtj7Qq2W81LwQM15rqP4f03mhiZj2F0rI55qX8CDfw8dEt
 Vo12BUhV4SuW+2DgVoASxuHfUhqwXV4JOrDn5s2YLMIDAQ7SE7jJDnnhj4nxLhqgw921
 uXQg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBUZWdyYSBEUk0g
bmV2ZXIgYWN0dWFsbHkgdG9vayB0aGF0IGxvY2ssIHNvIHRoZSBkcml2ZXIgd2FzIGJyb2tlbgp1
bnRpbCBnZW5lcmljIGxvY2tpbmcgd2FzIGFkZGVkIGluIGNvbW1pdDoKCgljb21taXQgYjk2MmEx
MjA1MGEzODdlNGJiZjNhNDg3NDVhZmUxZDI5ZDM5NmIwZAoJQXV0aG9yOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+CglEYXRlOiAgIE1vbiBPY3QgMjIgMTQ6MzE6MjIgMjAxOCArMDIw
MAoKCSAgICBkcm0vYXRvbWljOiBpbnRlZ3JhdGUgbW9kZXNldCBsb2NrIHdpdGggcHJpdmF0ZSBv
YmplY3RzCgpJdCdzIG5vdyBubyBsb25nZXIgbmVjZXNzYXJ5IHRvIHRha2UgdGhhdCBsb2NrLCBz
byBkcm9wIHRoZSBjaGVjay4KCnYyOiBhZGQgcmF0aW9uYWxlIGZvciB3aHkgaXQgaXMgbm93IHNh
ZmUgdG8gZHJvcCB0aGUgY2hlY2sgKERhbmllbCkKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8
dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyB8IDMg
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvaHViLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMKaW5kZXgg
NmFjYTBmZDVhOGU1Li5lNTZjMGY3ZDNhMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9odWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMKQEAgLTYxNSwxMSAr
NjE1LDggQEAgc3RhdGljIHN0cnVjdCB0ZWdyYV9kaXNwbGF5X2h1Yl9zdGF0ZSAqCiB0ZWdyYV9k
aXNwbGF5X2h1Yl9nZXRfc3RhdGUoc3RydWN0IHRlZ3JhX2Rpc3BsYXlfaHViICpodWIsCiAJCQkg
ICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewotCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEoaHViLT5jbGllbnQucGFyZW50KTsKIAlzdHJ1Y3QgZHJt
X3ByaXZhdGVfc3RhdGUgKnByaXY7CiAKLQlXQVJOX09OKCFkcm1fbW9kZXNldF9pc19sb2NrZWQo
JmRybS0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCkpOwotCiAJcHJpdiA9IGRybV9hdG9t
aWNfZ2V0X3ByaXZhdGVfb2JqX3N0YXRlKHN0YXRlLCAmaHViLT5iYXNlKTsKIAlpZiAoSVNfRVJS
KHByaXYpKQogCQlyZXR1cm4gRVJSX0NBU1QocHJpdik7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
