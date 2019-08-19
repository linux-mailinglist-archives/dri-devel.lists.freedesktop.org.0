Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC59498C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B446E216;
	Mon, 19 Aug 2019 16:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913276E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:12:12 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so5506617iog.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNgMoUuANjdtngNMgikfiFN/8UrV/9wNLIuF2chDYhI=;
 b=q9lXDIUP7RUhEAZWqyJolNk1SSOrD+BAJCUDdffTYI9nTzjFki8mVp58vZ5+RGR4iT
 90Hqknvg2jWW7prj+4AufSI7RSKnccT1FcbLKHo93D57lGkMmIw8Yry18Qsjls7Jb9TQ
 7nN+dCUh2yYCTVDPkA/+K1hwyI3rkSwtCjaOizIpY6HIgWV97za0k/A+YVOKZ7ZtbLpR
 bUUrn1TrNI/XosdcNg8Z6WFC2f3OsQrF1PrKi6PZikSYt27rQn5i9g6vKiSTPUHvPUFz
 4qJSQ2z8k9bH4gzaJLM2g+sNPjLTtOkrGQDHqajrv1ePumxE5GBTxdOPsjaG7CERmQSe
 /tPQ==
X-Gm-Message-State: APjAAAXDAhTYWurdHXWj2LXg3JO3f2QGU98tLy4WEJUKzF4cpyUKcmSX
 DsMEhEe7aaLdUWWfp6RQXxHCVvw=
X-Google-Smtp-Source: APXvYqyLS79pmXbPGwYAwg8uYM4cC5f5A40X63jXTcfsxwGZ8Ah4Y5sBSFoOKgiqwZOlAPLyqjQfXw==
X-Received: by 2002:a5d:980d:: with SMTP id a13mr23539456iol.240.1566231131600; 
 Mon, 19 Aug 2019 09:12:11 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c19sm4770584ioi.22.2019.08.19.09.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 09:12:10 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/panfrost: Fix sleeping while atomic in
 panfrost_gem_open
Date: Mon, 19 Aug 2019 11:12:04 -0500
Message-Id: <20190819161204.3106-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819161204.3106-1-robh@kernel.org>
References: <20190819161204.3106-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgaG9sZCB0aGUgbW1fbG9jayBzcGlubG9jayBhcyBwYW5mcm9zdF9tbXVfbWFwKCkg
Y2FuIHNsZWVwOgoKQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNv
bnRleHQgYXQga2VybmVsL2xvY2tpbmcvbXV0ZXguYzo5MDkKaW5fYXRvbWljKCk6IDEsIGlycXNf
ZGlzYWJsZWQoKTogMCwgcGlkOiA5NzQsIG5hbWU6IGdsbWFyazItZXMyLWRybQoxIGxvY2sgaGVs
ZCBieSBnbG1hcmsyLWVzMi1kcm0vOTc0OgpDUFU6IDUgUElEOiA5NzQgQ29tbTogZ2xtYXJrMi1l
czItZHJtIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgTCAgICA1LjMuMC1yYzErICM5NApIYXJkd2Fy
ZSBuYW1lOiA5NmJvYXJkcyBSb2NrOTYwIChEVCkKQ2FsbCB0cmFjZToKIGR1bXBfYmFja3RyYWNl
KzB4MC8weDEzMAogc2hvd19zdGFjaysweDE0LzB4MjAKIGR1bXBfc3RhY2srMHhjNC8weDEwYwog
X19fbWlnaHRfc2xlZXArMHgxNTgvMHgyMjgKIF9fbWlnaHRfc2xlZXArMHg1MC8weDg4CiBfX211
dGV4X2xvY2srMHg1OC8weDgwMAogbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlX25lc3RlZCsweDFj
LzB4MjgKIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKzB4MjQvMHhhMAogZHJtX2dlbV9zaG1lbV9n
ZXRfcGFnZXNfc2d0KzB4NDgvMHhkMAogcGFuZnJvc3RfbW11X21hcCsweDM4LzB4ZjggW3BhbmZy
b3N0XQogcGFuZnJvc3RfZ2VtX29wZW4rMHhjMC8weGQ4IFtwYW5mcm9zdF0KIGRybV9nZW1faGFu
ZGxlX2NyZWF0ZV90YWlsKzB4ZTgvMHgxOTgKIGRybV9nZW1faGFuZGxlX2NyZWF0ZSsweDNjLzB4
NTAKIHBhbmZyb3N0X2dlbV9jcmVhdGVfd2l0aF9oYW5kbGUrMHg3MC8weGEwIFtwYW5mcm9zdF0K
IHBhbmZyb3N0X2lvY3RsX2NyZWF0ZV9ibysweDQ4LzB4ODAgW3BhbmZyb3N0XQogZHJtX2lvY3Rs
X2tlcm5lbCsweGI4LzB4MTEwCiBkcm1faW9jdGwrMHgyNDQvMHgzZjAKIGRvX3Zmc19pb2N0bCsw
eGJjLzB4OTEwCiBrc3lzX2lvY3RsKzB4NzgvMHhhOAogX19hcm02NF9zeXNfaW9jdGwrMHgxYy8w
eDI4CiBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweDkwLzB4MTY4CiBlbDBfc3ZjX2hhbmRs
ZXIrMHgyOC8weDc4CiBlbDBfc3ZjKzB4OC8weGMKCkZpeGVzOiA2ODMzN2QwYjg2NDQgKCJkcm0v
cGFuZnJvc3Q6IFJlc3RydWN0dXJlIHRoZSBHRU0gb2JqZWN0IGNyZWF0aW9uIikKQ2M6IFRvbWV1
IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZ2VtLmMKaW5kZXggZTA4NGJjNGU5MDgzLi5hY2IwN2ZlMDY1ODAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKQEAgLTY1LDE2ICs2NSwxOCBAQCBz
dGF0aWMgaW50IHBhbmZyb3N0X2dlbV9vcGVuKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcAogCXNwaW5fbG9jaygmcHJpdi0+bW1fbG9jayk7CiAJcmV0
ID0gZHJtX21tX2luc2VydF9ub2RlX2dlbmVyaWMoJnByaXYtPm1tLCAmYm8tPm5vZGUsCiAJCQkJ
CSBzaXplID4+IFBBR0VfU0hJRlQsIGFsaWduLCBjb2xvciwgMCk7CisJc3Bpbl91bmxvY2soJnBy
aXYtPm1tX2xvY2spOwogCWlmIChyZXQpCi0JCWdvdG8gb3V0OworCQlyZXR1cm4gcmV0OwogCiAJ
aWYgKCFiby0+aXNfaGVhcCkgewogCQlyZXQgPSBwYW5mcm9zdF9tbXVfbWFwKGJvKTsKLQkJaWYg
KHJldCkKKwkJaWYgKHJldCkgeworCQkJc3Bpbl9sb2NrKCZwcml2LT5tbV9sb2NrKTsKIAkJCWRy
bV9tbV9yZW1vdmVfbm9kZSgmYm8tPm5vZGUpOworCQkJc3Bpbl91bmxvY2soJnByaXYtPm1tX2xv
Y2spOworCQl9CiAJfQotb3V0OgotCXNwaW5fdW5sb2NrKCZwcml2LT5tbV9sb2NrKTsKIAlyZXR1
cm4gcmV0OwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
