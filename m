Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2BF18088F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 20:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92DA6E392;
	Tue, 10 Mar 2020 19:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9D6E397
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583869897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3PhESK6uLexgJItbHee1HRK9XWHVAGUlhz9Vq1Mc4E=;
 b=aTt4VyNIaQhde14wlKLhuW+EykooJDZ//QAZvR8aUXRbeUSpYqquXLDpaz75VOV0E7cDDh
 YLSEXmPH+oAzazSlGquz6BmzvlwX+GcG0Z+EhWFUc5cfFKdNo/lKMFdDfKXVjHsEyP0NBl
 IU1RVK+bSWeKETMqZi96LMDO8F7Ofag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-vir2D4viMvG5hbmtrcKL2Q-1; Tue, 10 Mar 2020 15:51:34 -0400
X-MC-Unique: vir2D4viMvG5hbmtrcKL2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901FE8017CC;
 Tue, 10 Mar 2020 19:51:31 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 870E88F366;
 Tue, 10 Mar 2020 19:51:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
Date: Tue, 10 Mar 2020 15:51:21 -0400
Message-Id: <20200310195122.1590925-1-lyude@redhat.com>
In-Reply-To: <20200310185417.1588984-1-lyude@redhat.com>
References: <20200310185417.1588984-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aTkxNSBjYW4gZW5hYmxlIGF1eCBkZXZpY2Ugbm9kZXMgZm9yIERQIE1TVCBieSBjYWxsaW5nCmRy
bV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoKS9kcm1fZHBfbXN0X2Nvbm5lY3Rvcl9l
YXJseV91bnJlZ2lzdGVyKCksCnNvIGxldCdzIGhvb2sgdGhhdCB1cC4KCkNoYW5nZXMgc2luY2Ug
djE6CiogQ2FsbCBpbnRlbF9jb25uZWN0b3JfcmVnaXN0ZXIvdW5yZWdpc3RlcigpIGZyb20KICBp
bnRlbF9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIvdW5yZWdpc3RlcigpIHNvIHdlIGRv
bid0IGxvc2UKICBlcnJvciBpbmplY3Rpb24gLSBWaWxsZSBTeXJqw6Rsw6QKQ2hhbmdlcyBzaW5j
ZSB2MjoKKiBEb24ndCBmb3JnZXQgdG8gY2xlYW4gdXAgaWYgaW50ZWxfY29ubmVjdG9yX3JlZ2lz
dGVyKCkgZmFpbHMgLSBWaWxsZQoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+CkNjOiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwu
Y29tPgpDYzogIkxlZSwgU2hhd24gQyIgPHNoYXduLmMubGVlQGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwppbmRleCBkNTM5NzhlZDNjMTIu
LmUwOGNhY2E2NThjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
X21zdC5jCkBAIC01NDgsMTIgKzU0OCw0MSBAQCBzdGF0aWMgaW50IGludGVsX2RwX21zdF9nZXRf
ZGRjX21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJcmV0dXJuIHJldDsK
IH0KIAorc3RhdGljIGludAoraW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJc3RydWN0IGludGVsX2Nvbm5lY3Rv
ciAqaW50ZWxfY29ubmVjdG9yID0gdG9faW50ZWxfY29ubmVjdG9yKGNvbm5lY3Rvcik7CisJaW50
IHJldDsKKworCXJldCA9IGRybV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoY29ubmVj
dG9yLAorCQkJCQkJIGludGVsX2Nvbm5lY3Rvci0+cG9ydCk7CisJaWYgKHJldCA8IDApCisJCXJl
dHVybiByZXQ7CisKKwlyZXQgPSBpbnRlbF9jb25uZWN0b3JfcmVnaXN0ZXIoY29ubmVjdG9yKTsK
KwlpZiAocmV0IDwgMCkKKwkJZHJtX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3Rlcihj
b25uZWN0b3IsCisJCQkJCQkgICAgICBpbnRlbF9jb25uZWN0b3ItPnBvcnQpOworCisJcmV0dXJu
IHJldDsKK30KKworc3RhdGljIHZvaWQKK2ludGVsX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5y
ZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBpbnRl
bF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0
b3IpOworCisJaW50ZWxfY29ubmVjdG9yX3VucmVnaXN0ZXIoY29ubmVjdG9yKTsKKwlkcm1fZHBf
bXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKGNvbm5lY3RvciwKKwkJCQkJICAgICAgaW50
ZWxfY29ubmVjdG9yLT5wb3J0KTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yX2Z1bmNzIGludGVsX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmZpbGxfbW9kZXMg
PSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCiAJLmF0b21pY19nZXRf
cHJvcGVydHkgPSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5LAog
CS5hdG9taWNfc2V0X3Byb3BlcnR5ID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfYXRvbWljX3Nl
dF9wcm9wZXJ0eSwKLQkubGF0ZV9yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl9yZWdpc3RlciwK
LQkuZWFybHlfdW5yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyLAorCS5sYXRl
X3JlZ2lzdGVyID0gaW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyLAorCS5lYXJs
eV91bnJlZ2lzdGVyID0gaW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAog
CS5kZXN0cm95ID0gaW50ZWxfY29ubmVjdG9yX2Rlc3Ryb3ksCiAJLmF0b21pY19kZXN0cm95X3N0
YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21p
Y19kdXBsaWNhdGVfc3RhdGUgPSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3Rh
dGUsCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
