Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5A102756
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728556E920;
	Tue, 19 Nov 2019 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274B6E921
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:51:04 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B414C08FE;
 Tue, 19 Nov 2019 14:41:54 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 62061A0060;
 Tue, 19 Nov 2019 14:41:52 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 1/4] DRM: ARC: PGU: fix framebuffer format switching
Date: Tue, 19 Nov 2019 17:41:44 +0300
Message-Id: <20191119144147.8022-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574174516; bh=qqXWvfWwuI+nZia268XDs83BGemiBWv1K7uf/sFQhLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dQUN7TodesjqoTqzqIvGXhuRpK/NqfzwNPoJlTF5j+TtxfPqT1XjjIpgN3t2BkXXh
 CJpNZwhisEUe68pH6sFmzl9kb9NVMLeQtk4MC+C2vwnDnfh+/B0fwHv1CbL9GSmOfu
 SX0muNWsAbZ19+pY43MywWDEs9RScYqNdgRAdicSkqf9e/fypLgWu+KmUFXvCY6yWl
 xjIEQFRwlGHlKexzICn7aFPoO2YHFcXGYIWiAsxF/AK+wQ3sXfAHrvcf3xASYv6KvH
 gGvmIC6DjzjayJXrd+a0Gxf5poxJkXBEmBIr+cXiaXw3ODfHW0VshFA1eAQ2cS30Vo
 c49T1RpbKitQQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBkb24ndCBzd2l0Y2ggdG8gUkdCNTY1IGZvcm1hdCBpZiBC
R1I4ODggd2FzCnByZXZpb3VzbHkgdXNlZC4gRml4IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBFdWdl
bml5IFBhbHRzZXYgPEV1Z2VuaXkuUGFsdHNldkBzeW5vcHN5cy5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jIHwgMTIgKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2Ny
dGMuYwppbmRleCBkZmFkZGJiN2RhMGQuLjMxZDk4MjRjNDZjYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJj
cGd1X2NydGMuYwpAQCAtMzIsNiArMzIsNyBAQCBzdGF0aWMgdm9pZCBhcmNfcGd1X3NldF9weGxf
Zm10KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAl1aW50MzJfdCBwaXhlbF9mb3JtYXQgPSBmYi0+
Zm9ybWF0LT5mb3JtYXQ7CiAJc3RydWN0IHNpbXBsZWZiX2Zvcm1hdCAqZm9ybWF0ID0gTlVMTDsK
IAlpbnQgaTsKKwl1MzIgcmVnX2N0cmw7CiAKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShz
dXBwb3J0ZWRfZm9ybWF0cyk7IGkrKykgewogCQlpZiAoc3VwcG9ydGVkX2Zvcm1hdHNbaV0uZm91
cmNjID09IHBpeGVsX2Zvcm1hdCkKQEAgLTQxLDExICs0MiwxMiBAQCBzdGF0aWMgdm9pZCBhcmNf
cGd1X3NldF9weGxfZm10KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlpZiAoV0FSTl9PTighZm9y
bWF0KSkKIAkJcmV0dXJuOwogCi0JaWYgKGZvcm1hdC0+Zm91cmNjID09IERSTV9GT1JNQVRfUkdC
ODg4KQotCQlhcmNfcGd1X3dyaXRlKGFyY3BndSwgQVJDUEdVX1JFR19DVFJMLAotCQkJICAgICAg
YXJjX3BndV9yZWFkKGFyY3BndSwgQVJDUEdVX1JFR19DVFJMKSB8Ci0JCQkJCSAgIEFSQ1BHVV9N
T0RFX1JHQjg4OF9NQVNLKTsKLQorCXJlZ19jdHJsID0gYXJjX3BndV9yZWFkKGFyY3BndSwgQVJD
UEdVX1JFR19DVFJMKTsKKwlpZiAoZm9ybWF0LT5mb3VyY2MgPT0gRFJNX0ZPUk1BVF9SR0I1NjUp
CisJCXJlZ19jdHJsICY9IH5BUkNQR1VfTU9ERV9SR0I4ODhfTUFTSzsKKwllbHNlCisJCXJlZ19j
dHJsIHw9IEFSQ1BHVV9NT0RFX1JHQjg4OF9NQVNLOworCWFyY19wZ3Vfd3JpdGUoYXJjcGd1LCBB
UkNQR1VfUkVHX0NUUkwsIHJlZ19jdHJsKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y3J0Y19mdW5jcyBhcmNfcGd1X2NydGNfZnVuY3MgPSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
