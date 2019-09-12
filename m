Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3721B092B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321146EB93;
	Thu, 12 Sep 2019 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682FA6E029
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 01:37:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y22so14877303pfr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yKeAg+VF+an1CS4EAOX6mzh4xSkLDxRJGmMk96zvPtg=;
 b=M9V8/aOI+C0VJrzXjkVAd3g//iuVCxEyYrsZ7OciRqhK5szgblWNOF0nh/UoEAZ9vz
 PH/n4AMXRiWsXVRXml5AG2nfB0QWsWWrkNVzmMVNJMXSxTrVrmwKn73a0RNYym2WMftj
 l25ZpOJTDENvw+1sE+tFGbn/ok86eOwA/VRLKq0aGexTYRhpd2mJymfBDlfKI5B1bJxq
 yundHq3nJy20kn2CeHPrynUvhdQVEaztSJdo34wAu5Zz+BqPnV0X0GBEJKtxDDtflkBV
 zFh6z7k6O3kguW/LKwOZH4m9sgEB+Ej5vkWrWA7ZxP9hUPgPvpn5AV3uqRFQ88rlu7pD
 cuQw==
X-Gm-Message-State: APjAAAXu6mU3kCx6wBHVm0g3u5pOaDHNy+oU4TyyuQ6+hlh1jDGBYYp4
 MTvDO1ll43N3XxU6zV7FWezsMRh+yNY=
X-Google-Smtp-Source: APXvYqxNosCn6ujN1bE5LevzZf60CVo34Xv1sZu8cGf+q+1adoxxMxF7CrQnTVSHjsX5cxvhEchZSA==
X-Received: by 2002:a62:5ac1:: with SMTP id o184mr44954059pfb.67.1568252268670; 
 Wed, 11 Sep 2019 18:37:48 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net.
 [67.185.54.80])
 by smtp.gmail.com with ESMTPSA id f22sm8682967pgb.4.2019.09.11.18.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 18:37:47 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/bridge: tc358767: Introduce
 __tc_bridge_enable/disable()
Date: Wed, 11 Sep 2019 18:37:39 -0700
Message-Id: <20190912013740.5638-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912013740.5638-1-andrew.smirnov@gmail.com>
References: <20190912013740.5638-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yKeAg+VF+an1CS4EAOX6mzh4xSkLDxRJGmMk96zvPtg=;
 b=R8RkoSynna9fUZ82qTTBLWsp8mmGw0D1aNjBWsLQkMBGqjUZb1Gu7HthaRUwfFvWp9
 B6iu7K3RNF0qXfz01/zG8Sg2nQknz/X/bWwi1XaOmRngYqgqWLQeZy4249AtaVDGVkKR
 nU3Ejjp7LBypukxflAzpJN3KrUzLN5HsO2wxXXnxLyBh80S9XG4wwYQjeH7Q20ikpxa3
 NofseIH7W9lG3EKBQSgtVm9kbhQOGQEJQR6N48kcmBUvdDa1oECos0ZXZW13Z6r4g2Cc
 IjcLiEd/GCNMJmxsOYo2qsXiYLyj3wbvI8mIvt7RgIkBo55cStBqaJBkNLWWJ2gAkUzO
 HFCw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwb3NlIHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb24gb2YgYnJpZGdlJ3MgZW5hYmxlL2Rpc2Fi
bGUgZnVuY3Rpb25zLApzbyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byB1c2UgdGhlbSBpbiBvdGhl
ciBwYXJ0cyBvZiB0aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFu
ZHJldy5zbWlybm92QGdtYWlsLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQ29y
eSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdt
YWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA2MzA4ZDkz
YWQ5MWQuLjg1MzIwNDhlMDU1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTIy
MCwzOSArMTIyMCw0MyBAQCBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfcHJlX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKQogCWRybV9wYW5lbF9wcmVwYXJlKHRjLT5wYW5lbCk7CiB9CiAK
LXN0YXRpYyB2b2lkIHRjX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkK
K3N0YXRpYyBpbnQgX190Y19icmlkZ2VfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIHsKLQlz
dHJ1Y3QgdGNfZGF0YSAqdGMgPSBicmlkZ2VfdG9fdGMoYnJpZGdlKTsKIAlpbnQgcmV0OwogCiAJ
cmV0ID0gdGNfZ2V0X2Rpc3BsYXlfcHJvcHModGMpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9l
cnIodGMtPmRldiwgImZhaWxlZCB0byByZWFkIGRpc3BsYXkgcHJvcHM6ICVkXG4iLCByZXQpOwot
CQlyZXR1cm47CisJCXJldHVybiByZXQ7CiAJfQogCiAJcmV0ID0gdGNfbWFpbl9saW5rX2VuYWJs
ZSh0Yyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2Vycih0Yy0+ZGV2LCAibWFpbiBsaW5rIGVu
YWJsZSBlcnJvcjogJWRcbiIsIHJldCk7Ci0JCXJldHVybjsKKwkJcmV0dXJuIHJldDsKIAl9CiAK
IAlyZXQgPSB0Y19zdHJlYW1fZW5hYmxlKHRjKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJy
KHRjLT5kZXYsICJtYWluIGxpbmsgc3RyZWFtIHN0YXJ0IGVycm9yOiAlZFxuIiwgcmV0KTsKIAkJ
dGNfbWFpbl9saW5rX2Rpc2FibGUodGMpOwotCQlyZXR1cm47CisJCXJldHVybiByZXQ7CiAJfQog
Ci0JZHJtX3BhbmVsX2VuYWJsZSh0Yy0+cGFuZWwpOworCXJldHVybiAwOwogfQogCi1zdGF0aWMg
dm9pZCB0Y19icmlkZ2VfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQorc3RhdGlj
IHZvaWQgdGNfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0
cnVjdCB0Y19kYXRhICp0YyA9IGJyaWRnZV90b190YyhicmlkZ2UpOwotCWludCByZXQ7CiAKLQlk
cm1fcGFuZWxfZGlzYWJsZSh0Yy0+cGFuZWwpOworCWlmICghX190Y19icmlkZ2VfZW5hYmxlKHRj
KSkKKwkJZHJtX3BhbmVsX2VuYWJsZSh0Yy0+cGFuZWwpOworfQorCitzdGF0aWMgaW50IF9fdGNf
YnJpZGdlX2Rpc2FibGUoc3RydWN0IHRjX2RhdGEgKnRjKQoreworCWludCByZXQ7CiAKIAlyZXQg
PSB0Y19zdHJlYW1fZGlzYWJsZSh0Yyk7CiAJaWYgKHJldCA8IDApCkBAIC0xMjYxLDYgKzEyNjUs
MTYgQEAgc3RhdGljIHZvaWQgdGNfYnJpZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKIAlyZXQgPSB0Y19tYWluX2xpbmtfZGlzYWJsZSh0Yyk7CiAJaWYgKHJldCA8IDApCiAJ
CWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBkaXNhYmxlIGVycm9yOiAlZFxuIiwgcmV0KTsK
KworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyB2b2lkIHRjX2JyaWRnZV9kaXNhYmxlKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpCit7CisJc3RydWN0IHRjX2RhdGEgKnRjID0gYnJpZGdlX3Rv
X3RjKGJyaWRnZSk7CisKKwlkcm1fcGFuZWxfZGlzYWJsZSh0Yy0+cGFuZWwpOworCV9fdGNfYnJp
ZGdlX2Rpc2FibGUodGMpOwogfQogCiBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfcG9zdF9kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
