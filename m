Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D6180645
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 19:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FCB6E8C6;
	Tue, 10 Mar 2020 18:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145C16E8C4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583864952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kG5+PQP3ksQc5cU9/4J1Z7ERE0FS8MynHoBNfI6/fdw=;
 b=bP6AAkeBnVvbF7Yp1Xz+qYjZfzh3jRawfoINE67p5RRo7kE6UZvcXOYFojItJ4R0gMB4Fl
 pWS8Cuvg6go/H3fexmj476nykq6Htj8sevWUJ4cuZZAhB/iacQ6+cwHgK6yKk1PgNh7A00
 H6+qH+YaEL6+rQCOLMmjfkoQ4sSxf5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-l4peUl40OXeRVkokqsvQiA-1; Tue, 10 Mar 2020 14:29:04 -0400
X-MC-Unique: l4peUl40OXeRVkokqsvQiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD5F800D4E;
 Tue, 10 Mar 2020 18:29:01 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D11C5D9CA;
 Tue, 10 Mar 2020 18:28:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
Date: Tue, 10 Mar 2020 14:28:54 -0400
Message-Id: <20200310182856.1587752-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aTkxNSBjYW4gZW5hYmxlIGF1eCBkZXZpY2Ugbm9kZXMgZm9yIERQIE1TVCBieSBjYWxsaW5nCmRy
bV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoKS9kcm1fZHBfbXN0X2Nvbm5lY3Rvcl9l
YXJseV91bnJlZ2lzdGVyKCksCnNvIGxldCdzIGhvb2sgdGhhdCB1cC4KCkNjOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFuYXNpIE5hdmFyZSA8
bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KQ2M6ICJMZWUsIFNoYXduIEMiIDxzaGF3bi5jLmxl
ZUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDIyICsr
KysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0
LmMKaW5kZXggZDUzOTc4ZWQzYzEyLi5iY2ZmMmUwNmVhZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwpAQCAtNTQ4LDEyICs1NDgsMzAgQEAgc3RhdGlj
IGludCBpbnRlbF9kcF9tc3RfZ2V0X2RkY19tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQKK2ludGVsX2RwX21zdF9jb25u
ZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQorewor
CXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5l
Y3Rvcihjb25uZWN0b3IpOworCisJcmV0dXJuIGRybV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVn
aXN0ZXIoY29ubmVjdG9yLAorCQkJCQkJICBpbnRlbF9jb25uZWN0b3ItPnBvcnQpOworfQorCitz
dGF0aWMgdm9pZAoraW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJc3RydWN0IGludGVsX2Nvbm5lY3RvciAq
aW50ZWxfY29ubmVjdG9yID0gdG9faW50ZWxfY29ubmVjdG9yKGNvbm5lY3Rvcik7CisKKwlkcm1f
ZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKGNvbm5lY3RvciwKKwkJCQkJICAgICAg
aW50ZWxfY29ubmVjdG9yLT5wb3J0KTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX2Z1bmNzIGludGVsX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmZpbGxfbW9k
ZXMgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCiAJLmF0b21pY19n
ZXRfcHJvcGVydHkgPSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5
LAogCS5hdG9taWNfc2V0X3Byb3BlcnR5ID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfYXRvbWlj
X3NldF9wcm9wZXJ0eSwKLQkubGF0ZV9yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl9yZWdpc3Rl
ciwKLQkuZWFybHlfdW5yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyLAorCS5s
YXRlX3JlZ2lzdGVyID0gaW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyLAorCS5l
YXJseV91bnJlZ2lzdGVyID0gaW50ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVy
LAogCS5kZXN0cm95ID0gaW50ZWxfY29ubmVjdG9yX2Rlc3Ryb3ksCiAJLmF0b21pY19kZXN0cm95
X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0
b21pY19kdXBsaWNhdGVfc3RhdGUgPSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9kdXBsaWNhdGVf
c3RhdGUsCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
