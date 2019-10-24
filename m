Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B747DE388E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C916E4A2;
	Thu, 24 Oct 2019 16:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADF86E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v6so3287011wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9SI3/7KEnup2lABZq6qRUS5Tek0bF2ZiqM4PxAGcko=;
 b=S5rUipozM/cV7tBsqfq5sEWhcBLBDS68WUazeBtjM2UmNqV90obRSDUhta6SUYCxRb
 c9sxsgybP5NLm3sUXKka0P5K8OseuXE4mliRNz+2g5MRMzJR0vLIX7bZyJYH89znAJEp
 Kc9e0iiMCKLIRIXoVwoeolSH2Z6WldHk7eBO1+3nJU/Crz3RO3DIE5mloJ7mlCfyHrhZ
 kOKQbSo4JRHQG/8TohDnYh+gfbY9NRN2JxVhcOYpHbSt3HJEFkBqa84Hv5C83Pjfnky3
 3z8WYzIkU3Y7Obg8qd7qPqsTz/sfysICgJvd07tBy1ziLurLR3YlHLz+5ePMMOSk3dl/
 R3KA==
X-Gm-Message-State: APjAAAWfKuaAl0iRiyUkgqr7HjpbOr5uEgOEPd/reEP1L5x2jApbcTS5
 jLMilQyuGaSg+JffGUpF8WiMtN8T
X-Google-Smtp-Source: APXvYqyv4rA+Hp2xsAFcvJ/wzAlNSBiHkV23Ji4mYrcVhZFeenfluQxWhoiaUWPwAAuh8N2LBeogSg==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr5975598wmh.7.1571935555583;
 Thu, 24 Oct 2019 09:45:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id p17sm22595775wrn.4.2019.10.24.09.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/32] drm/tegra: dp: Read channel coding capability from sink
Date: Thu, 24 Oct 2019 18:45:10 +0200
Message-Id: <20191024164534.132764-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9SI3/7KEnup2lABZq6qRUS5Tek0bF2ZiqM4PxAGcko=;
 b=FEtaRflDCATBZy8YPHJkPoNZVI+yjg+9VjgnqxeMFx6vAZhLUk8mRG8xCoG+d3rNp1
 f3VMurZmZPX8x88uMccNkkdt6pmaLN1eDL8FfFsIKr8DcxrZw/0QPQd2xWbgI3Pgg66N
 D+sZPN7nZA64gJoym+9feP7BEeKm+DdQDlO7HcArGQyY+jIyh0sMJVOI2hYACucjYbsp
 jghzqa5oel8g7x9wtl5T6fGvdKoUTHU4BpguPWO+txD+e8RFQdEX4mQJ17+xOVJm9Dkq
 IEX6OPGy9W7qHXurNA3NALVI/QjVSq0IhXeIx/3+5fGiyNbo4lu+WQ0GeB4NSX1D3P93
 INYA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClBhcnNlIGZyb20gdGhl
IHNpbmsgY2FwYWJpbGl0aWVzIHdoZXRoZXIgb3Igbm90IGl0IHN1cHBvcnRzIEFOU0kgOEIvMTBC
CmNoYW5uZWwgY29kaW5nIGFzIHNwZWNpZmllZCBpbiBBTlNJIFgzLjIzMC0xOTk0LCBjbGF1c2Ug
MTEuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcC5oIHwgNyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcC5jCmluZGV4IGUyMmViYWI2NzdiOS4uMGJkODdjZmY0NTc1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZHAuYwpAQCAtMTMsNiArMTMsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19jYXBzX3Jlc2V0
KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpjYXBzKQogCWNhcHMtPmVuaGFuY2VkX2ZyYW1pbmcg
PSBmYWxzZTsKIAljYXBzLT50cHMzX3N1cHBvcnRlZCA9IGZhbHNlOwogCWNhcHMtPmZhc3RfdHJh
aW5pbmcgPSBmYWxzZTsKKwljYXBzLT5jaGFubmVsX2NvZGluZyA9IGZhbHNlOwogfQogCiB2b2lk
IGRybV9kcF9saW5rX2NhcHNfY29weShzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqZGVzdCwKQEAg
LTIxLDYgKzIyLDcgQEAgdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9s
aW5rX2NhcHMgKmRlc3QsCiAJZGVzdC0+ZW5oYW5jZWRfZnJhbWluZyA9IHNyYy0+ZW5oYW5jZWRf
ZnJhbWluZzsKIAlkZXN0LT50cHMzX3N1cHBvcnRlZCA9IHNyYy0+dHBzM19zdXBwb3J0ZWQ7CiAJ
ZGVzdC0+ZmFzdF90cmFpbmluZyA9IHNyYy0+ZmFzdF90cmFpbmluZzsKKwlkZXN0LT5jaGFubmVs
X2NvZGluZyA9IHNyYy0+Y2hhbm5lbF9jb2Rpbmc7CiB9CiAKIHN0YXRpYyB2b2lkIGRybV9kcF9s
aW5rX3Jlc2V0KHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKQEAgLTY3LDYgKzY5LDcgQEAgaW50
IGRybV9kcF9saW5rX3Byb2JlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBf
bGluayAqbGluaykKIAlsaW5rLT5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcgPSBkcm1fZHBfZW5oYW5j
ZWRfZnJhbWVfY2FwKGRwY2QpOwogCWxpbmstPmNhcHMudHBzM19zdXBwb3J0ZWQgPSBkcm1fZHBf
dHBzM19zdXBwb3J0ZWQoZHBjZCk7CiAJbGluay0+Y2Fwcy5mYXN0X3RyYWluaW5nID0gZHJtX2Rw
X2Zhc3RfdHJhaW5pbmdfY2FwKGRwY2QpOworCWxpbmstPmNhcHMuY2hhbm5lbF9jb2RpbmcgPSBk
cm1fZHBfY2hhbm5lbF9jb2Rpbmdfc3VwcG9ydGVkKGRwY2QpOwogCiAJbGluay0+cmF0ZSA9IGxp
bmstPm1heF9yYXRlOwogCWxpbmstPmxhbmVzID0gbGluay0+bWF4X2xhbmVzOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmggYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAu
aAppbmRleCA5OTkwNzg4MTI5NDMuLjk4NGRhYzIxNTY4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKQEAgLTM1
LDYgKzM1LDEzIEBAIHN0cnVjdCBkcm1fZHBfbGlua19jYXBzIHsKIAkgKiBBVVggQ0ggaGFuZHNo
YWtlIG5vdCByZXF1aXJlZCBmb3IgbGluayB0cmFpbmluZwogCSAqLwogCWJvb2wgZmFzdF90cmFp
bmluZzsKKworCS8qKgorCSAqIEBjaGFubmVsX2NvZGluZzoKKwkgKgorCSAqIEFOU0kgOEIvMTBC
IGNoYW5uZWwgY29kaW5nIGNhcGFiaWxpdHkKKwkgKi8KKwlib29sIGNoYW5uZWxfY29kaW5nOwog
fTsKIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2NhcHMg
KmRlc3QsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
