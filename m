Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807FDFBDA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CC66E353;
	Tue, 22 Oct 2019 02:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4BF89622
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:40:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-B9jwI_PLNlqixRHimYRCog-1; Mon, 21 Oct 2019 22:40:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199371800DC7;
 Tue, 22 Oct 2019 02:40:16 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C580360126;
 Tue, 22 Oct 2019 02:40:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 07/14] drm/dp_mst: Don't forget to update port->input in
 drm_dp_mst_handle_conn_stat()
Date: Mon, 21 Oct 2019 22:36:02 -0400
Message-Id: <20191022023641.8026-8-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: B9jwI_PLNlqixRHimYRCog-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571712024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmwWa3TWD3uShU2mHZzpR5scuhFQ16OxsUlTglKtdsA=;
 b=eMEU3XpIDIKcy/S3bpSO9kqj3MFhFyRCnfzHe//a3EoI5UMPq5P4qMuc3lm27b8kgE5Y1/
 m6o5Zu8H7C+pc9/IWcQTW3q45G6SYRIa/ZlSzyJMN+Pcx92xCtVLhR/qfjn5ilfIdrQUrj
 7FxWdKZO/fyZGV31ubpuhMaKMM/BWgc=
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
 Juston Li <juston.li@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwcm9iYWJseSBoYXNuJ3QgY2F1c2VkIGFueSBwcm9ibGVtcyB1cCB1bnRpbCBub3cgc2lu
Y2UgaXQncwpwcm9iYWJseSBuZWFybHkgaW1wb3NzaWJsZSB0byBlbmNvdW50ZXIgdGhpcyBpbiB0
aGUgd2lsZCwgaG93ZXZlciBpZiB3ZQp3ZXJlIHRvIHJlY2VpdmUgYSBjb25uZWN0aW9uIHN0YXR1
cyBub3RpZmljYXRpb24gZnJvbSB0aGUgTVNUIGh1YiBhZnRlcgpyZXN1bWUgd2hpbGUgd2UncmUg
aW4gdGhlIG1pZGRsZSBvZiByZXByb2JpbmcgdGhlIGxpbmsgYWRkcmVzc2VzIGZvciBhCnRvcG9s
b2d5IHRoZW4gdGhlcmUncyBhIG11Y2ggbGFyZ2VyIGNoYW5jZSB0aGF0IGEgcG9ydCBjb3VsZCBo
YXZlCmNoYW5nZWQgZnJvbSBiZWluZyBhbiBvdXRwdXQgcG9ydCB0byBpbnB1dCBwb3J0IChvciB2
aWNlIHZlcnNhKS4gSWYgd2UKZm9yZ2V0IHRvIHVwZGF0ZSB0aGlzIGJpdCBvZiBpbmZvcm1hdGlv
biwgd2UnbGwgcG90ZW50aWFsbHkgaWdub3JlIGEKdmFsaWQgUERUIGNoYW5nZSBvbiBhIGRvd25z
dHJlYW0gcG9ydCBiZWNhdXNlIHdlIHRoaW5rIGl0J3MgYW4gaW5wdXQKcG9ydC4KClNvLCBtYWtl
IHN1cmUgd2UgcmVhZCB0aGUgaW5wdXRfcG9ydCBmaWVsZCBpbiBjb25uZWN0aW9uIHN0YXR1cwpu
b3RpZmljYXRpb25zIGluIGRybV9kcF9tc3RfaGFuZGxlX2Nvbm5fc3RhdCgpIHRvIHByZXZlbnQg
dGhpcyBmcm9tCmhhcHBlbmluZyBvbmNlIHdlJ3ZlIGltcGxlbWVudGVkIHN1c3BlbmQvcmVzdW1l
IHJlcHJvYmluZy4KCkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJl
IERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5j
b20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2Zm
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyB8IDUyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCmluZGV4IDdiZjRkYjkxZmY5MC4uYzhlMjE4YjkwMmFlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTIwNzksMTggKzIwNzksNDAgQEAgZHJtX2RwX21z
dF9oYW5kbGVfY29ubl9zdGF0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIHsKIAlz
dHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciA9IG1zdGItPm1ncjsKIAlzdHJ1Y3Qg
ZHJtX2RwX21zdF9wb3J0ICpwb3J0OwotCWludCBvbGRfZGRwczsKLQlib29sIGRvd29yayA9IGZh
bHNlOworCWludCBvbGRfZGRwcywgcmV0OworCXU4IG5ld19wZHQ7CisJYm9vbCBkb3dvcmsgPSBm
YWxzZSwgY3JlYXRlX2Nvbm5lY3RvciA9IGZhbHNlOwogCiAJcG9ydCA9IGRybV9kcF9nZXRfcG9y
dChtc3RiLCBjb25uX3N0YXQtPnBvcnRfbnVtYmVyKTsKIAlpZiAoIXBvcnQpCiAJCXJldHVybjsK
IAotCS8qIExvY2tpbmcgaXMgb25seSBuZWVkZWQgaWYgdGhlIHBvcnQncyBleHBvc2VkIHRvIHVz
ZXJzcGFjZSAqLwotCWlmIChwb3J0LT5jb25uZWN0b3IpCisJaWYgKHBvcnQtPmNvbm5lY3Rvcikg
eworCQlpZiAoIXBvcnQtPmlucHV0ICYmIGNvbm5fc3RhdC0+aW5wdXRfcG9ydCkgeworCQkJLyoK
KwkJCSAqIFdlIGNhbid0IHJlbW92ZSBhIGNvbm5lY3RvciBmcm9tIGFuIGFscmVhZHkgZXhwb3Nl
ZAorCQkJICogcG9ydCwgc28ganVzdCB0aHJvdyB0aGUgcG9ydCBvdXQgYW5kIG1ha2Ugc3VyZSB3
ZQorCQkJICogcmVwcm9iZSB0aGUgbGluayBhZGRyZXNzIG9mIGl0J3MgcGFyZW50IE1TVEIKKwkJ
CSAqLworCQkJZHJtX2RwX21zdF90b3BvbG9neV91bmxpbmtfcG9ydChtZ3IsIHBvcnQpOworCQkJ
bXN0Yi0+bGlua19hZGRyZXNzX3NlbnQgPSBmYWxzZTsKKwkJCWRvd29yayA9IHRydWU7CisJCQln
b3RvIG91dDsKKwkJfQorCisJCS8qCisJCSAqIExvY2tpbmcgaXMgb25seSBuZWVkZWQgaWYgdGhl
IHBvcnQncyBleHBvc2VkIHRvIHVzZXJzcGFjZQorCQkgKi8KIAkJZHJtX21vZGVzZXRfbG9jaygm
bWdyLT5iYXNlLmxvY2ssIE5VTEwpOworCX0gZWxzZSBpZiAocG9ydC0+aW5wdXQgJiYgIWNvbm5f
c3RhdC0+aW5wdXRfcG9ydCkgeworCQljcmVhdGVfY29ubmVjdG9yID0gdHJ1ZTsKKwkJLyogUmVw
cm9iZSBsaW5rIGFkZHJlc3Mgc28gd2UgZ2V0IG51bV9zZHBfc3RyZWFtcyAqLworCQltc3RiLT5s
aW5rX2FkZHJlc3Nfc2VudCA9IGZhbHNlOworCQlkb3dvcmsgPSB0cnVlOworCX0KIAogCW9sZF9k
ZHBzID0gcG9ydC0+ZGRwczsKKwlwb3J0LT5pbnB1dCA9IGNvbm5fc3RhdC0+aW5wdXRfcG9ydDsK
IAlwb3J0LT5tY3MgPSBjb25uX3N0YXQtPm1lc3NhZ2VfY2FwYWJpbGl0eV9zdGF0dXM7CiAJcG9y
dC0+bGRwcyA9IGNvbm5fc3RhdC0+bGVnYWN5X2RldmljZV9wbHVnX3N0YXR1czsKIAlwb3J0LT5k
ZHBzID0gY29ubl9zdGF0LT5kaXNwbGF5cG9ydF9kZXZpY2VfcGx1Z19zdGF0dXM7CkBAIC0yMTAz
LDIxICsyMTI1LDIzIEBAIGRybV9kcF9tc3RfaGFuZGxlX2Nvbm5fc3RhdChzdHJ1Y3QgZHJtX2Rw
X21zdF9icmFuY2ggKm1zdGIsCiAJCX0KIAl9CiAKLQlpZiAoIXBvcnQtPmlucHV0KSB7Ci0JCWlu
dCByZXQgPSBkcm1fZHBfcG9ydF9zZXRfcGR0KHBvcnQsCi0JCQkJCSAgICAgIGNvbm5fc3RhdC0+
cGVlcl9kZXZpY2VfdHlwZSk7Ci0JCWlmIChyZXQgPT0gMSkgewotCQkJZG93b3JrID0gdHJ1ZTsK
LQkJfSBlbHNlIGlmIChyZXQgPCAwKSB7Ci0JCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjaGFuZ2Ug
UERUIGZvciBwb3J0ICVwOiAlZFxuIiwKLQkJCQkgIHBvcnQsIHJldCk7Ci0JCQlkb3dvcmsgPSBm
YWxzZTsKLQkJfQorCW5ld19wZHQgPSBwb3J0LT5pbnB1dCA/IERQX1BFRVJfREVWSUNFX05PTkUg
OiBjb25uX3N0YXQtPnBlZXJfZGV2aWNlX3R5cGU7CisKKwlyZXQgPSBkcm1fZHBfcG9ydF9zZXRf
cGR0KHBvcnQsIG5ld19wZHQpOworCWlmIChyZXQgPT0gMSkgeworCQlkb3dvcmsgPSB0cnVlOwor
CX0gZWxzZSBpZiAocmV0IDwgMCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjaGFuZ2UgUERU
IGZvciBwb3J0ICVwOiAlZFxuIiwKKwkJCSAgcG9ydCwgcmV0KTsKKwkJZG93b3JrID0gZmFsc2U7
CiAJfQogCiAJaWYgKHBvcnQtPmNvbm5lY3RvcikKIAkJZHJtX21vZGVzZXRfdW5sb2NrKCZtZ3It
PmJhc2UubG9jayk7CisJZWxzZSBpZiAoY3JlYXRlX2Nvbm5lY3RvcikKKwkJZHJtX2RwX21zdF9w
b3J0X2FkZF9jb25uZWN0b3IobXN0YiwgcG9ydCk7CiAKK291dDoKIAlkcm1fZHBfbXN0X3RvcG9s
b2d5X3B1dF9wb3J0KHBvcnQpOwogCWlmIChkb3dvcmspCiAJCXF1ZXVlX3dvcmsoc3lzdGVtX2xv
bmdfd3EsICZtc3RiLT5tZ3ItPndvcmspOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
