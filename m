Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEBDFBEC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B686E36F;
	Tue, 22 Oct 2019 02:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BF76E370
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:40:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-tzxQeZjGNL6Y49eMud6FTw-1; Mon, 21 Oct 2019 22:40:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A46021005500;
 Tue, 22 Oct 2019 02:40:29 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C0760126;
 Tue, 22 Oct 2019 02:40:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 10/14] drm/nouveau: Resume hotplug interrupts earlier
Date: Mon, 21 Oct 2019 22:36:05 -0400
Message-Id: <20191022023641.8026-11-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: tzxQeZjGNL6Y49eMud6FTw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571712034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZdUhVKkftltagMebxpbhd4zgoUdMWHISXefOvdS+cU=;
 b=RlkmkkMmWbD7GK2eo/hNKfAAvZsGTRq5UHas1P5lpxob2gR06+wIHfsqH5B9Lyv9aeDYrw
 RgNp79U1NXKR8sIUl+LPYEMHETWCcUqA/7kZ1dm9ga0zkxFZAypEF96PgGDc0pJpIpVHn5
 OpHp/P4ZJKfOxpvelIEPmG3GncBz4mQ=
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

Q3VycmVudGx5LCB3ZSBlbmFibGUgaG90cGx1ZyBkZXRlY3Rpb24gb25seSBhZnRlciB3ZSByZS1l
bmFibGUgdGhlCmRpc3BsYXkuIEhvd2V2ZXIsIHRoaXMgaXMgdG9vIGxhdGUgaWYgd2UncmUgcGxh
bm5pbmcgb24gc2VuZGluZyBzaWRlYmFuZAptZXNzYWdlcyBkdXJpbmcgdGhlIHJlc3VtZSBwcm9j
ZXNzIC0gd2hpY2ggd2UnbGwgbmVlZCB0byBkbyBpbiBvcmRlciB0bwpyZXByb2JlIHRoZSB0b3Bv
bG9neSBvbiByZXN1bWUuCgpTbywgZW5hYmxlIGhvdHBsdWcgZXZlbnRzIGJlZm9yZSByZWluaXRp
YWxpemluZyB0aGUgZGlzcGxheS4KCkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+
CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50
bGFuQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmMgfCAxOSArKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZGlzcGxheS5jCmluZGV4IDZmMDM4NTExYTAzYS4uNTNmOWJjZWFmMTdhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYwpAQCAtNDA3LDYgKzQwNywxNyBAQCBu
b3V2ZWF1X2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHJlc3VtZSwg
Ym9vbCBydW50aW1lKQogCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7
CiAJaW50IHJldDsKIAorCS8qCisJICogRW5hYmxlIGhvdHBsdWcgaW50ZXJydXB0cyAoZG9uZSBh
cyBlYXJseSBhcyBwb3NzaWJsZSwgc2luY2Ugd2UgbmVlZAorCSAqIHRoZW0gZm9yIE1TVCkKKwkg
Ki8KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihkZXYsICZjb25uX2l0ZXIpOworCW5v
dXZlYXVfZm9yX2VhY2hfbm9uX21zdF9jb25uZWN0b3JfaXRlcihjb25uZWN0b3IsICZjb25uX2l0
ZXIpIHsKKwkJc3RydWN0IG5vdXZlYXVfY29ubmVjdG9yICpjb25uID0gbm91dmVhdV9jb25uZWN0
b3IoY29ubmVjdG9yKTsKKwkJbnZpZl9ub3RpZnlfZ2V0KCZjb25uLT5ocGQpOworCX0KKwlkcm1f
Y29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7CisKIAlyZXQgPSBkaXNwLT5pbml0
KGRldiwgcmVzdW1lLCBydW50aW1lKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpAQCAtNDE2
LDE0ICs0MjcsNiBAQCBub3V2ZWF1X2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCBib29sIHJlc3VtZSwgYm9vbCBydW50aW1lKQogCSAqLwogCWRybV9rbXNfaGVscGVyX3BvbGxf
ZW5hYmxlKGRldik7CiAKLQkvKiBlbmFibGUgaG90cGx1ZyBpbnRlcnJ1cHRzICovCi0JZHJtX2Nv
bm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGV2LCAmY29ubl9pdGVyKTsKLQlub3V2ZWF1X2Zvcl9l
YWNoX25vbl9tc3RfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7Ci0JCXN0
cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqY29ubiA9IG5vdXZlYXVfY29ubmVjdG9yKGNvbm5lY3Rv
cik7Ci0JCW52aWZfbm90aWZ5X2dldCgmY29ubi0+aHBkKTsKLQl9Ci0JZHJtX2Nvbm5lY3Rvcl9s
aXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOwotCiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
