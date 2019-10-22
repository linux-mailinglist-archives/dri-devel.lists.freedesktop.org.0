Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D275DFBE8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7EB6E37C;
	Tue, 22 Oct 2019 02:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3FB6E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:40:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-HUmMC_PYMZ27M5xQzaJrQA-1; Mon, 21 Oct 2019 22:40:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04AC1107AD31;
 Tue, 22 Oct 2019 02:40:26 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54FD60126;
 Tue, 22 Oct 2019 02:40:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 09/14] drm/nouveau: Don't grab runtime PM refs for HPD IRQs
Date: Mon, 21 Oct 2019 22:36:04 -0400
Message-Id: <20191022023641.8026-10-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: HUmMC_PYMZ27M5xQzaJrQA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571712031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5jcZwjlYxKIN+ZIuBL1G9ofGIMh7sLLjPY6LJCqd3Y=;
 b=VYexCj9HVHfFAwee78e6BqdzFg+H580U10e7FAH9DNsDroFv4j/js+n9xo9wB8WeNeUxhR
 9WxYFcrfWNflVoIE6tFGmywDqR9OFW3wQ68c7PySZjrYBXFcwcz+Z2omQ3zJDRsr0tTYcg
 o93M0OHhEG2VqDGn7WLUe2HCupuaYtA=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Harry Wentland <hwentlan@amd.com>,
 Juston Li <juston.li@intel.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgZm9yIHN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZyB0byB3b3JrLCB3ZSBuZWVkIHRv
IGJlIGFibGUgdG8KcGVyZm9ybSBzaWRlYmFuZCBjb21tdW5pY2F0aW9ucyBkdXJpbmcgc3VzcGVu
ZC9yZXN1bWUsIGFsb25nIHdpdGgKcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZS4gSW4gb3JkZXIg
dG8gZG8gc28sIHdlIGFsc28gbmVlZCB0byBtYWtlIHN1cmUKdGhhdCBub3V2ZWF1IGRvZXNuJ3Qg
Ym90aGVyIGdyYWJiaW5nIGEgcnVudGltZSBQTSByZWZlcmVuY2UgdG8gZG8gc28sCnNpbmNlIG90
aGVyd2lzZSB3ZSdsbCBzdGFydCBkZWFkbG9ja2luZyBydW50aW1lIFBNIGFnYWluLgoKTm90ZSB0
aGF0IHdlIHdlcmVuJ3QgYWJsZSB0byBkbyB0aGlzIGJlZm9yZSwgYmVjYXVzZSBvZiB0aGUgRFAg
TVNUCmhlbHBlcnMgcHJvY2Vzc2luZyBVUCByZXF1ZXN0cyBmcm9tIHRvcG9sb2dpZXMgaW4gdGhl
IHNhbWUgY29udGV4dCBhcwpkcm1fZHBfbXN0X2hwZF9pcnEoKSB3aGljaCB3b3VsZCBoYXZlIGNh
dXNlZCB1cyB0byBvcGVuIG91cnNlbHZlcyB1cCB0bwpyZWNlaXZpbmcgaG90cGx1ZyBldmVudHMg
YW5kIGRlYWRsb2NraW5nIHdpdGggcnVudGltZSBzdXNwZW5kL3Jlc3VtZS4KTm93IHRoYXQgdGhv
c2UgcmVxdWVzdHMgYXJlIGhhbmRsZWQgYXN5bmNocm9ub3VzbHksIHRoaXMgY2hhbmdlIHNob3Vs
ZApiZSBjb21wbGV0ZWx5IHNhZmUuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29t
PgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2Vu
dGxhbkBhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
UmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpTaWduZWQtb2ZmLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfY29ubmVjdG9yLmMgfCAzMyArKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwppbmRleCAzYTVkYjE3YmM1YzcuLjViNDEz
NTg4YjgyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25u
ZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5j
CkBAIC0xMTMwLDYgKzExMzAsMTYgQEAgbm91dmVhdV9jb25uZWN0b3JfaG90cGx1ZyhzdHJ1Y3Qg
bnZpZl9ub3RpZnkgKm5vdGlmeSkKIAljb25zdCBjaGFyICpuYW1lID0gY29ubmVjdG9yLT5uYW1l
OwogCXN0cnVjdCBub3V2ZWF1X2VuY29kZXIgKm52X2VuY29kZXI7CiAJaW50IHJldDsKKwlib29s
IHBsdWdnZWQgPSAocmVwLT5tYXNrICE9IE5WSUZfTk9USUZZX0NPTk5fVjBfVU5QTFVHKTsKKwor
CWlmIChyZXAtPm1hc2sgJiBOVklGX05PVElGWV9DT05OX1YwX0lSUSkgeworCQlOVl9ERUJVRyhk
cm0sICJzZXJ2aWNlICVzXG4iLCBuYW1lKTsKKwkJZHJtX2RwX2NlY19pcnEoJm52X2Nvbm5lY3Rv
ci0+YXV4KTsKKwkJaWYgKChudl9lbmNvZGVyID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENC
X09VVFBVVF9EUCkpKQorCQkJbnY1MF9tc3RtX3NlcnZpY2UobnZfZW5jb2Rlci0+ZHAubXN0bSk7
CisKKwkJcmV0dXJuIE5WSUZfTk9USUZZX0tFRVA7CisJfQogCiAJcmV0ID0gcG1fcnVudGltZV9n
ZXQoZHJtLT5kZXYtPmRldik7CiAJaWYgKHJldCA9PSAwKSB7CkBAIC0xMTUwLDI1ICsxMTYwLDE2
IEBAIG5vdXZlYXVfY29ubmVjdG9yX2hvdHBsdWcoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkp
CiAJCXJldHVybiBOVklGX05PVElGWV9EUk9QOwogCX0KIAotCWlmIChyZXAtPm1hc2sgJiBOVklG
X05PVElGWV9DT05OX1YwX0lSUSkgewotCQlOVl9ERUJVRyhkcm0sICJzZXJ2aWNlICVzXG4iLCBu
YW1lKTsKLQkJZHJtX2RwX2NlY19pcnEoJm52X2Nvbm5lY3Rvci0+YXV4KTsKLQkJaWYgKChudl9l
bmNvZGVyID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENCX09VVFBVVF9EUCkpKQotCQkJbnY1
MF9tc3RtX3NlcnZpY2UobnZfZW5jb2Rlci0+ZHAubXN0bSk7Ci0JfSBlbHNlIHsKLQkJYm9vbCBw
bHVnZ2VkID0gKHJlcC0+bWFzayAhPSBOVklGX05PVElGWV9DT05OX1YwX1VOUExVRyk7Ci0KKwlp
ZiAoIXBsdWdnZWQpCisJCWRybV9kcF9jZWNfdW5zZXRfZWRpZCgmbnZfY29ubmVjdG9yLT5hdXgp
OworCU5WX0RFQlVHKGRybSwgIiVzcGx1Z2dlZCAlc1xuIiwgcGx1Z2dlZCA/ICIiIDogInVuIiwg
bmFtZSk7CisJaWYgKChudl9lbmNvZGVyID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENCX09V
VFBVVF9EUCkpKSB7CiAJCWlmICghcGx1Z2dlZCkKLQkJCWRybV9kcF9jZWNfdW5zZXRfZWRpZCgm
bnZfY29ubmVjdG9yLT5hdXgpOwotCQlOVl9ERUJVRyhkcm0sICIlc3BsdWdnZWQgJXNcbiIsIHBs
dWdnZWQgPyAiIiA6ICJ1biIsIG5hbWUpOwotCQlpZiAoKG52X2VuY29kZXIgPSBmaW5kX2VuY29k
ZXIoY29ubmVjdG9yLCBEQ0JfT1VUUFVUX0RQKSkpIHsKLQkJCWlmICghcGx1Z2dlZCkKLQkJCQlu
djUwX21zdG1fcmVtb3ZlKG52X2VuY29kZXItPmRwLm1zdG0pOwotCQl9Ci0KLQkJZHJtX2hlbHBl
cl9ocGRfaXJxX2V2ZW50KGNvbm5lY3Rvci0+ZGV2KTsKKwkJCW52NTBfbXN0bV9yZW1vdmUobnZf
ZW5jb2Rlci0+ZHAubXN0bSk7CiAJfQogCisJZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGNvbm5l
Y3Rvci0+ZGV2KTsKKwogCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koZHJtLT5kZXYtPmRldik7
CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZHJtLT5kZXYtPmRldik7CiAJcmV0dXJuIE5W
SUZfTk9USUZZX0tFRVA7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
