Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3ACBD904
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409976EB39;
	Wed, 25 Sep 2019 07:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F5D6EAD8;
 Tue, 24 Sep 2019 18:12:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D66E4AE78;
 Tue, 24 Sep 2019 18:12:56 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 05/11] of: expose __of_get_dma_parent() to OF subsystem
Date: Tue, 24 Sep 2019 20:12:36 +0200
Message-Id: <20190924181244.7159-6-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
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
Cc: f.fainelli@gmail.com, mbrugger@suse.com, wahrenst@gmx.net,
 james.quinlan@broadcom.com, robin.murphy@arm.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9uIHdhcyBvbmx5IGF2YWlsYWJsZSBsb2NhbGx5IHRvIG9mL2FkZHJlc3MuYywg
bWFrZSBpdAphdmFpbGFibGUgdG8gdGhlIE9GIHN1YnN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IE5p
Y29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQoKIGRyaXZl
cnMvb2YvYWRkcmVzcy5jICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL29mL2Jh
c2UuYyAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvb2Yvb2Zf
cHJpdmF0ZS5oIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9hZGRyZXNzLmMgYi9kcml2ZXJz
L29mL2FkZHJlc3MuYwppbmRleCBjOWViNGViY2MyZTkuLjUzNjY2MDYzZTkzOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9vZi9hZGRyZXNzLmMKKysrIGIvZHJpdmVycy9vZi9hZGRyZXNzLmMKQEAgLTY4
MSwyNCArNjgxLDYgQEAgdTY0IG9mX3RyYW5zbGF0ZV9hZGRyZXNzKHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqZGV2LCBjb25zdCBfX2JlMzIgKmluX2FkZHIpCiB9CiBFWFBPUlRfU1lNQk9MKG9mX3RyYW5z
bGF0ZV9hZGRyZXNzKTsKIAotc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqX19vZl9nZXRfZG1h
X3BhcmVudChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQotewotCXN0cnVjdCBvZl9waGFu
ZGxlX2FyZ3MgYXJnczsKLQlpbnQgcmV0LCBpbmRleDsKLQotCWluZGV4ID0gb2ZfcHJvcGVydHlf
bWF0Y2hfc3RyaW5nKG5wLCAiaW50ZXJjb25uZWN0LW5hbWVzIiwgImRtYS1tZW0iKTsKLQlpZiAo
aW5kZXggPCAwKQotCQlyZXR1cm4gb2ZfZ2V0X3BhcmVudChucCk7Ci0KLQlyZXQgPSBvZl9wYXJz
ZV9waGFuZGxlX3dpdGhfYXJncyhucCwgImludGVyY29ubmVjdHMiLAotCQkJCQkgIiNpbnRlcmNv
bm5lY3QtY2VsbHMiLAotCQkJCQkgaW5kZXgsICZhcmdzKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0
dXJuIG9mX2dldF9wYXJlbnQobnApOwotCi0JcmV0dXJuIG9mX25vZGVfZ2V0KGFyZ3MubnApOwot
fQotCiBzdGF0aWMgdTY0IG9mX3RyYW5zbGF0ZV9kbWFfYWRkcmVzc19wYXJlbnQoc3RydWN0IGRl
dmljZV9ub2RlICpwYXJlbnQsCiAJCQkJCSAgIGNvbnN0IF9fYmUzMiAqaW5fYWRkcikKIHsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvb2YvYmFzZS5jIGIvZHJpdmVycy9vZi9iYXNlLmMKaW5kZXggOTRm
ODMwNTE5MTBjLi5lYzE2MWU2YjUyMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2YvYmFzZS5jCisr
KyBiL2RyaXZlcnMvb2YvYmFzZS5jCkBAIC03MTYsNiArNzE2LDMxIEBAIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqb2ZfZ2V0X3BhcmVudChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiB9CiBF
WFBPUlRfU1lNQk9MKG9mX2dldF9wYXJlbnQpOwogCisvKioKKyAqCV9fb2ZfZ2V0X2RtYV9wYXJl
bnQgLSBHZXQgYSBub2RlJ3MgZG1hIHBhcmVudCBpZiBhbnkKKyAqCUBub2RlOglOb2RlIHRvIGdl
dCBkbWEgcGFyZW50CisgKgorICoJUmV0dXJucyBhIG5vZGUgcG9pbnRlciB3aXRoIHJlZmNvdW50
IGluY3JlbWVudGVkLCB1c2UKKyAqCW9mX25vZGVfcHV0KCkgb24gaXQgd2hlbiBkb25lLgorICov
CitzdHJ1Y3QgZGV2aWNlX25vZGUgKl9fb2ZfZ2V0X2RtYV9wYXJlbnQoY29uc3Qgc3RydWN0IGRl
dmljZV9ub2RlICpucCkKK3sKKwlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIGFyZ3M7CisJaW50IHJl
dCwgaW5kZXg7CisKKwlpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgImludGVy
Y29ubmVjdC1uYW1lcyIsICJkbWEtbWVtIik7CisJaWYgKGluZGV4IDwgMCkKKwkJcmV0dXJuIG9m
X2dldF9wYXJlbnQobnApOworCisJcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MobnAs
ICJpbnRlcmNvbm5lY3RzIiwKKwkJCQkJICIjaW50ZXJjb25uZWN0LWNlbGxzIiwKKwkJCQkJIGlu
ZGV4LCAmYXJncyk7CisJaWYgKHJldCA8IDApCisJCXJldHVybiBvZl9nZXRfcGFyZW50KG5wKTsK
KworCXJldHVybiBvZl9ub2RlX2dldChhcmdzLm5wKTsKK30KKwogLyoqCiAgKglvZl9nZXRfbmV4
dF9wYXJlbnQgLSBJdGVyYXRlIHRvIGEgbm9kZSdzIHBhcmVudAogICoJQG5vZGU6CU5vZGUgdG8g
Z2V0IHBhcmVudCBvZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9wcml2YXRlLmggYi9kcml2
ZXJzL29mL29mX3ByaXZhdGUuaAppbmRleCBiNTI4MzA0YmUyNDQuLjYzYmIxNmNjNDU0YyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9vZi9vZl9wcml2YXRlLmgKKysrIGIvZHJpdmVycy9vZi9vZl9wcml2
YXRlLmgKQEAgLTQyLDYgKzQyLDggQEAgZXh0ZXJuIHN0cnVjdCBrc2V0ICpvZl9rc2V0OwogaW50
IF9fb2Zfbl9hZGRyX2NlbGxzX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCk7CiBp
bnQgX19vZl9uX3NpemVfY2VsbHNfcGFyZW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KTsK
IAorc3RydWN0IGRldmljZV9ub2RlICpfX29mX2dldF9kbWFfcGFyZW50KGNvbnN0IHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnApOworCiAjaWYgZGVmaW5lZChDT05GSUdfT0ZfRFlOQU1JQykKIGV4dGVy
biBpbnQgb2ZfcHJvcGVydHlfbm90aWZ5KGludCBhY3Rpb24sIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCiAJCQkgICAgICBzdHJ1Y3QgcHJvcGVydHkgKnByb3AsIHN0cnVjdCBwcm9wZXJ0eSAqb2xk
X3Byb3ApOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
