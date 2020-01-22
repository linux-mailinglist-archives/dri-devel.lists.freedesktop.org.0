Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046A145CA1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 20:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AFF6F897;
	Wed, 22 Jan 2020 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413676F896
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579722222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5tEuUkKDhsAj/8wgfLzijJY2JLpoVThoT94FD+ztjuA=;
 b=A+p7OrQuEDOIxnUhG2PVzrTcN7HejjrFr2bfUKM19ByTXP9QZQK4tmsHRKcpL6Xq6TkKg2
 URS99DxuU7hlb/NedvG5q8hZBARH/34XPPTxcNL34/yJhM1jNRh1hsK6H/652+aHOgxsto
 bS+OjOs7H0HNx5olP/fnAzayGRdVXZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-nKyCzFggNiS1Ck3kiyDaKg-1; Wed, 22 Jan 2020 14:43:38 -0500
X-MC-Unique: nKyCzFggNiS1Ck3kiyDaKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9547803776;
 Wed, 22 Jan 2020 19:43:35 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB5C219C5B;
 Wed, 22 Jan 2020 19:43:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/dp_mst: Fix clearing payload state on topology
 disable
Date: Wed, 22 Jan 2020 14:43:20 -0500
Message-Id: <20200122194321.14953-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGlzc3VlcyBjYXVzZWQgYnk6Cgo2NGU2MmJkZjA0YWIgKCJkcm0vZHBfbXN0OiBSZW1vdmUg
VkNQSSB3aGlsZSBkaXNhYmxpbmcgdG9wb2xvZ3kgbWdyIikKClByb21wdGVkIG1lIHRvIHRha2Ug
YSBjbG9zZXIgbG9vayBhdCBob3cgd2UgY2xlYXIgdGhlIHBheWxvYWQgc3RhdGUgaW4KZ2VuZXJh
bCB3aGVuIGRpc2FibGluZyB0aGUgdG9wb2xvZ3ksIGFuZCBpdCB0dXJucyBvdXQgdGhlcmUncyBh
Y3R1YWxseQp0d28gc3VidGxlIGlzc3VlcyBoZXJlLgoKVGhlIGZpcnN0IGlzIHRoYXQgd2UncmUg
bm90IGdyYWJiaW5nICZtZ3IucGF5bG9hZF9sb2NrIHdoZW4gY2xlYXJpbmcgdGhlCnBheWxvYWRz
IGluIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QoKS4gU2VlaW5nIGFzIHRoZSBjYW5v
bmljYWwKbG9jayBvcmRlciBpcyAmbWdyLnBheWxvYWRfbG9jayAtPiAmbWdyLmxvY2sgKGJlY2F1
c2Ugd2UgYWx3YXlzIHdhbnQKJm1nci5sb2NrIHRvIGJlIHRoZSBpbm5lci1tb3N0IGxvY2sgc28g
dG9wb2xvZ3kgdmFsaWRhdGlvbiBhbHdheXMKd29ya3MpLCB0aGlzIG1ha2VzIHBlcmZlY3Qgc2Vu
c2UuIEl0IGFsc28gbWVhbnMgdGhhdCAtdGVjaG5pY2FsbHktIHRoZXJlCmNvdWxkIGJlIHJhY2lu
ZyBiZXR3ZWVuIHNvbWVvbmUgY2FsbGluZwpkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0
KCkgdG8gZGlzYWJsZSB0aGUgdG9wb2xvZ3ksIGFsb25nIHdpdGggYQptb2Rlc2V0IG9jY3Vycmlu
ZyB0aGF0J3MgbW9kaWZ5aW5nIHRoZSBwYXlsb2FkIHN0YXRlIGF0IHRoZSBzYW1lIHRpbWUuCgpU
aGUgc2Vjb25kIGlzIHRoZSBtb3JlIG9idmlvdXMgaXNzdWUgdGhhdCBXYXluZSBMaW4gZGlzY292
ZXJlZCwgdGhhdAp3ZSdyZSBub3QgY2xlYXJpbmcgcHJvcG9zZWRfcGF5bG9hZHMgd2hlbiBkaXNh
YmxpbmcgdGhlIHRvcG9sb2d5LgoKSSBhY3R1YWxseSBjYW4ndCBzZWUgYW55IG9idmlvdXMgcGxh
Y2VzIHdoZXJlIHRoZSByYWNpbmcgY2F1c2VkIGJ5IHRoZQpmaXJzdCBpc3N1ZSB3b3VsZCBicmVh
ayBzb21ldGhpbmcsIGFuZCBpdCBjb3VsZCBiZSB0aGF0IHNvbWUgb2Ygb3VyCmhpZ2hlci1sZXZl
bCBsb2NrcyBhbHJlYWR5IHByZXZlbnQgdGhpcyBieSBoYXBwZW5zdGFuY2UsIGJ1dCBiZXR0ZXIg
c2FmZQp0aGVuIHNvcnJ5LiBTbywgbGV0J3MgbWFrZSBpdCBzbyB0aGF0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyX3NldF9tc3QoKQpmaXJzdCBncmFicyAmbWdyLnBheWxvYWRfbG9jayBmb2xsb3dl
ZCBieSAmbWdyLmxvY2sgc28gdGhhdCB3ZSBuZXZlcgpyYWNlIHdoZW4gbW9kaWZ5aW5nIHRoZSBw
YXlsb2FkIHN0YXRlLiBUaGVuLCB3ZSBhbHNvIGNsZWFyCnByb3Bvc2VkX3BheWxvYWRzIHRvIGZp
eCB0aGUgb3JpZ2luYWwgaXNzdWUgb2YgZW5hYmxpbmcgYSBuZXcgdG9wb2xvZ3kKd2l0aCBhIGRp
cnR5IHBheWxvYWQgc3RhdGUuIFRoaXMgZG9lc24ndCBjbGVhciBhbnkgb2YgdGhlIGRybV9kcF92
Y3BpCnN0cnVjdHVyZXMsIGJ1dCB0aG9zZSBhcmUgZ2V0dGluZyBkZXN0cm95ZWQgYWxvbmcgd2l0
aCB0aGUgcG9ydHMgYW55d2F5LgoKQ2hhbmdlcyBzaW5jZSB2MToKKiBVc2Ugc2l6ZW9mKG1nci0+
cGF5bG9hZHNbMF0pL3NpemVvZihtZ3ItPnByb3Bvc2VkX3ZjcGlzWzBdKSBpbnN0ZWFkIC0KICB2
c3lyamFsYQoKQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogV2F5bmUgTGluIDxX
YXluZS5MaW5AYW1kLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDM2NDllODJiOTYzZC4uMjNjZjQ2YmZlZjc0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTM1MDEsNiArMzUwMSw3
IEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLCBib29sIG1zCiAJaW50IHJldCA9IDA7CiAJc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoICptc3RiID0gTlVMTDsKIAorCW11dGV4X2xvY2soJm1nci0+cGF5bG9hZF9s
b2NrKTsKIAltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwogCWlmIChtc3Rfc3RhdGUgPT0gbWdyLT5t
c3Rfc3RhdGUpCiAJCWdvdG8gb3V0X3VubG9jazsKQEAgLTM1NTksNyArMzU2MCwxMCBAQCBpbnQg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1nciwgYm9vbCBtcwogCQkvKiB0aGlzIGNhbiBmYWlsIGlmIHRoZSBkZXZpY2UgaXMg
Z29uZSAqLwogCQlkcm1fZHBfZHBjZF93cml0ZWIobWdyLT5hdXgsIERQX01TVE1fQ1RSTCwgMCk7
CiAJCXJldCA9IDA7Ci0JCW1lbXNldChtZ3ItPnBheWxvYWRzLCAwLCBtZ3ItPm1heF9wYXlsb2Fk
cyAqIHNpemVvZihzdHJ1Y3QgZHJtX2RwX3BheWxvYWQpKTsKKwkJbWVtc2V0KG1nci0+cGF5bG9h
ZHMsIDAsCisJCSAgICAgICBtZ3ItPm1heF9wYXlsb2FkcyAqIHNpemVvZihtZ3ItPnBheWxvYWRz
WzBdKSk7CisJCW1lbXNldChtZ3ItPnByb3Bvc2VkX3ZjcGlzLCAwLAorCQkgICAgICAgbWdyLT5t
YXhfcGF5bG9hZHMgKiBzaXplb2YobWdyLT5wcm9wb3NlZF92Y3Bpc1swXSkpOwogCQltZ3ItPnBh
eWxvYWRfbWFzayA9IDA7CiAJCXNldF9iaXQoMCwgJm1nci0+cGF5bG9hZF9tYXNrKTsKIAkJbWdy
LT52Y3BpX21hc2sgPSAwOwpAQCAtMzU2OCw2ICszNTcyLDcgQEAgaW50IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsIGJv
b2wgbXMKIAogb3V0X3VubG9jazoKIAltdXRleF91bmxvY2soJm1nci0+bG9jayk7CisJbXV0ZXhf
dW5sb2NrKCZtZ3ItPnBheWxvYWRfbG9jayk7CiAJaWYgKG1zdGIpCiAJCWRybV9kcF9tc3RfdG9w
b2xvZ3lfcHV0X21zdGIobXN0Yik7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
