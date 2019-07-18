Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9636C469
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D123B6E2CA;
	Thu, 18 Jul 2019 01:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6796E2C0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 761DDC049E23;
 Thu, 18 Jul 2019 01:44:00 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00F7C19C78;
 Thu, 18 Jul 2019 01:43:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/26] drm/dp_mst: Move link address dumping into a function
Date: Wed, 17 Jul 2019 21:42:24 -0400
Message-Id: <20190718014329.8107-2-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 18 Jul 2019 01:44:00 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UncmUgYWJvdXQgdG8gYmUgY2FsbGluZyB0aGlzIGZyb20gbXVsdGlwbGUgcGxhY2Vz
LiBBbHNvIGl0IG1ha2VzCnRoaW5ncyBlYXNpZXIgdG8gcmVhZCEKCkNjOiBKdXN0b24gTGkgPGp1
c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFy
cnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCmluZGV4IDA5ODRiOWEzNGQ1NS4uOTk4MDgxYjliMjA1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTIwMTMsNiArMjAxMywyOCBAQCBzdGF0aWMgdm9p
ZCBkcm1fZHBfcXVldWVfZG93bl90eChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciwKIAltdXRleF91bmxvY2soJm1nci0+cWxvY2spOwogfQogCitzdGF0aWMgdm9pZAorZHJtX2Rw
X2R1bXBfbGlua19hZGRyZXNzKHN0cnVjdCBkcm1fZHBfbGlua19hZGRyZXNzX2Fja19yZXBseSAq
cmVwbHkpCit7CisJc3RydWN0IGRybV9kcF9saW5rX2FkZHJfcmVwbHlfcG9ydCAqcG9ydF9yZXBs
eTsKKwlpbnQgaTsKKworCWZvciAoaSA9IDA7IGkgPCByZXBseS0+bnBvcnRzOyBpKyspIHsKKwkJ
cG9ydF9yZXBseSA9ICZyZXBseS0+cG9ydHNbaV07CisJCURSTV9ERUJVR19LTVMoInBvcnQgJWQ6
IGlucHV0ICVkLCBwZHQ6ICVkLCBwbjogJWQsIGRwY2RfcmV2OiAlMDJ4LCBtY3M6ICVkLCBkZHBz
OiAlZCwgbGRwcyAlZCwgc2RwICVkLyVkXG4iLAorCQkJICAgICAgaSwKKwkJCSAgICAgIHBvcnRf
cmVwbHktPmlucHV0X3BvcnQsCisJCQkgICAgICBwb3J0X3JlcGx5LT5wZWVyX2RldmljZV90eXBl
LAorCQkJICAgICAgcG9ydF9yZXBseS0+cG9ydF9udW1iZXIsCisJCQkgICAgICBwb3J0X3JlcGx5
LT5kcGNkX3JldmlzaW9uLAorCQkJICAgICAgcG9ydF9yZXBseS0+bWNzLAorCQkJICAgICAgcG9y
dF9yZXBseS0+ZGRwcywKKwkJCSAgICAgIHBvcnRfcmVwbHktPmxlZ2FjeV9kZXZpY2VfcGx1Z19z
dGF0dXMsCisJCQkgICAgICBwb3J0X3JlcGx5LT5udW1fc2RwX3N0cmVhbXMsCisJCQkgICAgICBw
b3J0X3JlcGx5LT5udW1fc2RwX3N0cmVhbV9zaW5rcyk7CisJfQorfQorCiBzdGF0aWMgdm9pZCBk
cm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICpt
Z3IsCiAJCQkJICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCiB7CkBAIC0yMDM4
LDE4ICsyMDYwLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJNX0RFQlVHX0tNUygibGluayBh
ZGRyZXNzIG5hayByZWNlaXZlZFxuIik7CiAJCX0gZWxzZSB7CiAJCQlEUk1fREVCVUdfS01TKCJs
aW5rIGFkZHJlc3MgcmVwbHk6ICVkXG4iLCB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIubnBvcnRz
KTsKLQkJCWZvciAoaSA9IDA7IGkgPCB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIubnBvcnRzOyBp
KyspIHsKLQkJCQlEUk1fREVCVUdfS01TKCJwb3J0ICVkOiBpbnB1dCAlZCwgcGR0OiAlZCwgcG46
ICVkLCBkcGNkX3JldjogJTAyeCwgbWNzOiAlZCwgZGRwczogJWQsIGxkcHMgJWQsIHNkcCAlZC8l
ZFxuIiwgaSwKLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLmlu
cHV0X3BvcnQsCi0JCQkJICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5w
ZWVyX2RldmljZV90eXBlLAotCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9y
dHNbaV0ucG9ydF9udW1iZXIsCi0JCQkJICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5w
b3J0c1tpXS5kcGNkX3JldmlzaW9uLAotCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2Fk
ZHIucG9ydHNbaV0ubWNzLAotCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9y
dHNbaV0uZGRwcywKLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ld
LmxlZ2FjeV9kZXZpY2VfcGx1Z19zdGF0dXMsCi0JCQkJICAgICAgIHR4bXNnLT5yZXBseS51Lmxp
bmtfYWRkci5wb3J0c1tpXS5udW1fc2RwX3N0cmVhbXMsCi0JCQkJICAgICAgIHR4bXNnLT5yZXBs
eS51LmxpbmtfYWRkci5wb3J0c1tpXS5udW1fc2RwX3N0cmVhbV9zaW5rcyk7Ci0JCQl9CisJCQlk
cm1fZHBfZHVtcF9saW5rX2FkZHJlc3MoJnR4bXNnLT5yZXBseS51LmxpbmtfYWRkcik7CiAKIAkJ
CWRybV9kcF9jaGVja19tc3RiX2d1aWQobXN0YiwgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLmd1
aWQpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
