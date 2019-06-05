Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEF357DF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA489624;
	Wed,  5 Jun 2019 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B234892A1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d126so14314011pfd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQDXy+HnUfgnkG61CQzmVPka5AA3kE5ajdtEw9kTzGA=;
 b=EDVzdcwARmb2J4jHZ6Ds8Tl7Exy/Nk8U52Qyhm36cEMAYuKYsD0xuqB70cpjeTpEXC
 7bFnDceT9bCyf4nKY3Q9cp2Mj9zBjXc73iXps44bOVvKuxkSv8FBkdjpfxLnVBiEFFEZ
 kY/2be+DYePmP/HjhCf2hSjH3TDvFrKBIwX9mDyTFw1f4h/aYiqSN/VsI70tjADWekzF
 hVWexcP6trbk05563fJRuY3Cfh6Ir2KS+ftm6rxvJbwoEfRT66HWMfDHiNNxJfmoXw6G
 iLQKgQC9euurA6IGVp4HVp9YLlv2w1BRfj9SuJ3yIwKVsn0pISCX7j/lWCLKBptvQf4f
 IRMw==
X-Gm-Message-State: APjAAAXSSkRkTX0IvTbuDAd7W74bQYvvm1cPlP4QFgHfWdP4iRNosBLr
 KDGz4yyxs3hI3Bow/GenlTz1ge5vfHg=
X-Google-Smtp-Source: APXvYqyPa/jIWF9TiK5toybcTHSLUzjMSrkUQDGpCbglp7r6fxWNk69jO+RmimgwTrVUa+33h6ONNw==
X-Received: by 2002:a63:6111:: with SMTP id v17mr2444359pgb.206.1559718335807; 
 Wed, 05 Jun 2019 00:05:35 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:35 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/15] drm/bridge: tc358767: Use reported AUX transfer size
Date: Wed,  5 Jun 2019 00:05:01 -0700
Message-Id: <20190605070507.11417-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQDXy+HnUfgnkG61CQzmVPka5AA3kE5ajdtEw9kTzGA=;
 b=OVPIYke/b/AIKAzyPux8I7yZ7ovCGIn+2LxvLJt9s/ISoCcFERqZq3sO3IP56UsOKN
 32Kv5LyNimcOqysNm/VvAy1lvohHuI9wnd1Ag9QdqzJbxy4G1msJDx/z+r6t3UOMKZTS
 byGyg1/N40tuVrl/IgqUahQXHjQ/JYxZU9EV1yz5iY7AjUJt0qvnpfstKDNZKCIFaVcK
 Mr078IyHi3Q50uvBDFu4F4rZeXw19PjqtoSxByzV4NxEKEwBlF/hIj3tIzAQTglMjYQW
 O8lW0mBBRysyn4RW4RtgTV1ihhMPC2wLQtfdSZlDiN5gDhF/nNrePEL4PConR1Fagd5D
 Dd6A==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgYXNzdW1lIHRoYXQgcmVxdWVzdGVkIGRhdGEgdHJhbnNmZXIgc2l6ZSBpcyB0aGUgc2Ft
ZSBhcyBhbW91bnQKb2YgZGF0YSB0aGF0IHdhcyB0cmFuc2ZlcnJlZC4gQ2hhbmdlIHRoZSBjb2Rl
IHRvIGdldCB0aGF0IGluZm9ybWF0aW9uCmZyb20gRFAwX0FVWFNUQVRVUyBpbnN0ZWFkLgoKU2lu
Y2UgdGhlIGNoZWNrIGZvciBBVVhfQlVTWSBpbiB0Y19hdXhfZ2V0X3N0YXR1cygpIGlzIHBvaW50
bGVzcyAoaXQKd2lsbCBhbHdheXMgY2FsbGVkIGFmdGVyIHRjX2F1eF93YWl0X2J1c3koKSkgYW5k
IHRoZXJlJ3Mgb25seSBvbmUgdXNlcgpvZiBpdCwgaW5saW5lIGl0cyBjb2RlIGludG8gdGNfYXV4
X3RyYW5zZmVyKCkgaW5zdGVhZCBvZiB0cnlpbmcgdG8KYWNjb21tb2RhdGUgdGhlIGNoYW5nZSBh
Ym92ZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20+CkNjOiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEub3JnPgpDYzogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29n
ZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+CkNjOiBDaHJpcyBIZWFseSA8
Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA0
MCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmlu
ZGV4IDAxMjVlMmY3ZTA3Ni4uOTBlYzMzY2FhY2JjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCkBAIC0xNTIsMTAgKzE1MiwxMCBAQAogI2RlZmluZSBEUDBfQVVYV0RBVEEoaSkJCSgweDA2
NmMgKyAoaSkgKiA0KQogI2RlZmluZSBEUDBfQVVYUkRBVEEoaSkJCSgweDA2N2MgKyAoaSkgKiA0
KQogI2RlZmluZSBEUDBfQVVYU1RBVFVTCQkweDA2OGMKLSNkZWZpbmUgQVVYX1NUQVRVU19NQVNL
CQkJMHhmMAotI2RlZmluZSBBVVhfU1RBVFVTX1NISUZUCQk0Ci0jZGVmaW5lIEFVWF9USU1FT1VU
CQkJQklUKDEpCi0jZGVmaW5lIEFVWF9CVVNZCQkJQklUKDApCisjZGVmaW5lIEFVWF9CWVRFUwkJ
R0VOTUFTSygxNSwgOCkKKyNkZWZpbmUgQVVYX1NUQVRVUwkJR0VOTUFTSyg3LCA0KQorI2RlZmlu
ZSBBVVhfVElNRU9VVAkJQklUKDEpCisjZGVmaW5lIEFVWF9CVVNZCQlCSVQoMCkKICNkZWZpbmUg
RFAwX0FVWEkyQ0FEUgkJMHgwNjk4CiAKIC8qIExpbmsgVHJhaW5pbmcgKi8KQEAgLTI5OCwyOSAr
Mjk4LDYgQEAgc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0Y19kYXRhICp0Yywg
dW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCiAJCQkgICAgICAgMTAwMCwgMTAwMCAqIHRpbWVvdXRf
bXMpOwogfQogCi1zdGF0aWMgaW50IHRjX2F1eF9nZXRfc3RhdHVzKHN0cnVjdCB0Y19kYXRhICp0
YywgdTggKnJlcGx5KQotewotCWludCByZXQ7Ci0JdTMyIHZhbHVlOwotCi0JcmV0ID0gcmVnbWFw
X3JlYWQodGMtPnJlZ21hcCwgRFAwX0FVWFNUQVRVUywgJnZhbHVlKTsKLQlpZiAocmV0IDwgMCkK
LQkJcmV0dXJuIHJldDsKLQotCWlmICh2YWx1ZSAmIEFVWF9CVVNZKSB7Ci0JCWRldl9lcnIodGMt
PmRldiwgImF1eCBidXN5IVxuIik7Ci0JCXJldHVybiAtRUJVU1k7Ci0JfQotCi0JaWYgKHZhbHVl
ICYgQVVYX1RJTUVPVVQpIHsKLQkJZGV2X2Vycih0Yy0+ZGV2LCAiYXV4IGFjY2VzcyB0aW1lb3V0
IVxuIik7Ci0JCXJldHVybiAtRVRJTUVET1VUOwotCX0KLQotCSpyZXBseSA9ICh2YWx1ZSAmIEFV
WF9TVEFUVVNfTUFTSykgPj4gQVVYX1NUQVRVU19TSElGVDsKLQlyZXR1cm4gMDsKLX0KLQogc3Rh
dGljIGludCB0Y19hdXhfd3JpdGVfZGF0YShzdHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0IHZvaWQg
KmRhdGEsCiAJCQkgICAgIHNpemVfdCBzaXplKQogewpAQCAtMzc2LDYgKzM1Myw3IEBAIHN0YXRp
YyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCXN0cnVj
dCB0Y19kYXRhICp0YyA9IGF1eF90b190YyhhdXgpOwogCXNpemVfdCBzaXplID0gbWluX3Qoc2l6
ZV90LCBEUF9BVVhfTUFYX1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNpemUpOwogCXU4IHJlcXVl
c3QgPSBtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1Q7CisJdTMyIGF1eHN0YXR1czsKIAlp
bnQgcmV0OwogCiAJaWYgKHNpemUgPT0gMCkKQEAgLTQxMywxMCArMzkxLDE2IEBAIHN0YXRpYyBz
c2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSB0Y19hdXhfZ2V0X3N0YXR1cyh0YywgJm1zZy0+cmVw
bHkpOworCXJldCA9IHJlZ21hcF9yZWFkKHRjLT5yZWdtYXAsIERQMF9BVVhTVEFUVVMsICZhdXhz
dGF0dXMpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwlpZiAoYXV4c3RhdHVzICYgQVVY
X1RJTUVPVVQpCisJCXJldHVybiAtRVRJTUVET1VUOworCisJc2l6ZSA9IEZJRUxEX0dFVChBVVhf
QllURVMsIGF1eHN0YXR1cyk7CisJbXNnLT5yZXBseSA9IEZJRUxEX0dFVChBVVhfU1RBVFVTLCBh
dXhzdGF0dXMpOworCiAJc3dpdGNoIChyZXF1ZXN0KSB7CiAJY2FzZSBEUF9BVVhfTkFUSVZFX1JF
QUQ6CiAJY2FzZSBEUF9BVVhfSTJDX1JFQUQ6Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
