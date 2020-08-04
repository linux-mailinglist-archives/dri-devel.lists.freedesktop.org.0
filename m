Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B797723B2FF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79056E3D6;
	Tue,  4 Aug 2020 02:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE326E3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-5g-3C7aINk2UE5u7eoPzUg-1; Mon, 03 Aug 2020 22:58:06 -0400
X-MC-Unique: 5g-3C7aINk2UE5u7eoPzUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEEEF18FF662;
 Tue,  4 Aug 2020 02:58:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40C108AD1C;
 Tue,  4 Aug 2020 02:58:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 34/59] drm/ttm: remove range manager legacy takedown path
Date: Tue,  4 Aug 2020 12:56:07 +1000
Message-Id: <20200804025632.3868079-35-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCk5vdyBhbGwgZHJpdmVycyBo
YXZlIGJlZW4gY29udmVydGVkLCBkcm9wIHRoZSBub24tZHJpdmVyIHBhdGguCgpSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX21hbmFnZXIuYyB8IDI4ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwppbmRleCA5NmRhMjJiZTY3MmIuLjg2YmY1ZTcxZTk1
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwpAQCAtMTI5LDI2ICsxMjksMTEg
QEAgaW50IHR0bV9yYW5nZV9tYW5faW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIH0K
IEVYUE9SVF9TWU1CT0wodHRtX3JhbmdlX21hbl9pbml0KTsKIAotc3RhdGljIGludCB0dG1fYm9f
bWFuX3Rha2Vkb3duX3ByaXZhdGUoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCi17
Ci0Jc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gKHN0cnVjdCB0dG1fcmFuZ2VfbWFu
YWdlciAqKSBtYW4tPnByaXY7Ci0Jc3RydWN0IGRybV9tbSAqbW0gPSAmcm1hbi0+bW07Ci0KLQlz
cGluX2xvY2soJnJtYW4tPmxvY2spOwotCWlmIChkcm1fbW1fY2xlYW4obW0pKSB7Ci0JCWRybV9t
bV90YWtlZG93bihtbSk7Ci0JCXNwaW5fdW5sb2NrKCZybWFuLT5sb2NrKTsKLQkJa2ZyZWUocm1h
bik7Ci0JCW1hbi0+cHJpdiA9IE5VTEw7Ci0JCXJldHVybiAwOwotCX0KLQlzcGluX3VubG9jaygm
cm1hbi0+bG9jayk7Ci0JcmV0dXJuIC1FQlVTWTsKLX0KLQogaW50IHR0bV9yYW5nZV9tYW5fZmlu
aShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJICAgICAgIHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuKQogeworCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IChz
dHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFuLT5wcml2OworCXN0cnVjdCBkcm1fbW0gKm1t
ID0gJnJtYW4tPm1tOwogCWludCByZXQ7CiAKIAl0dG1fbWVtX3R5cGVfbWFuYWdlcl9kaXNhYmxl
KG1hbik7CkBAIC0xNTcsNyArMTQyLDEzIEBAIGludCB0dG1fcmFuZ2VfbWFuX2Zpbmkoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXR0bV9i
b19tYW5fdGFrZWRvd25fcHJpdmF0ZShtYW4pOworCXNwaW5fbG9jaygmcm1hbi0+bG9jayk7CisJ
ZHJtX21tX2NsZWFuKG1tKTsKKwlkcm1fbW1fdGFrZWRvd24obW0pOworCXNwaW5fdW5sb2NrKCZy
bWFuLT5sb2NrKTsKKwlrZnJlZShybWFuKTsKKwltYW4tPnByaXYgPSBOVUxMOworCiAJdHRtX21l
bV90eXBlX21hbmFnZXJfY2xlYW51cChtYW4pOwogCXJldHVybiAwOwogfQpAQCAtMTc0LDcgKzE2
NSw2IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19tYW5fZGVidWcoc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4sCiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFn
ZXJfZnVuYyB0dG1fYm9fbWFuYWdlcl9mdW5jID0gewotCS50YWtlZG93biA9IHR0bV9ib19tYW5f
dGFrZWRvd25fcHJpdmF0ZSwKIAkuZ2V0X25vZGUgPSB0dG1fYm9fbWFuX2dldF9ub2RlLAogCS5w
dXRfbm9kZSA9IHR0bV9ib19tYW5fcHV0X25vZGUsCiAJLmRlYnVnID0gdHRtX2JvX21hbl9kZWJ1
ZwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
