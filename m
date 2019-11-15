Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9DFE6D2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 22:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11C6EAF5;
	Fri, 15 Nov 2019 21:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692EA6EAEE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 21:07:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-MredWJhJMy6M4kxd31DseA-1; Fri, 15 Nov 2019 16:07:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E790800686;
 Fri, 15 Nov 2019 21:07:46 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A534169191;
 Fri, 15 Nov 2019 21:07:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/nouveau/kms/nv50-: Call outp_atomic_check_view()
 before handling PBN
Date: Fri, 15 Nov 2019 16:07:18 -0500
Message-Id: <20191115210728.3467-2-lyude@redhat.com>
In-Reply-To: <20191115210728.3467-1-lyude@redhat.com>
References: <20191115210728.3467-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MredWJhJMy6M4kxd31DseA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573852072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99C9DdpWoNeWvAM/k6T9CAEG7JR/+DsOeDA4+LGqn/w=;
 b=Kn/sU9wgk7IZcn/+qNKFYG/B+PuQl1IcHS8V2dfm21d07tOuE/RJl9AccrokJ66w6GQzbe
 1P5piIXH3fyD2Tk4SH5+JhWQLU605J10MUXK5d6lXMTEjUfOjKQ+rFl2D+WfI5dVAQsD10
 MIlXCRIvW+gQq08pcIh5MLq4gTwhVUY=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <Jerry.Zuo@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>,
 Juston Li <juston.li@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgbnY1MF9vdXRwX2F0b21pY19jaGVja192aWV3KCkgY2FuIHNldCBjcnRjX3N0YXRlLT5t
b2RlX2NoYW5nZWQsIHdlCnByb2JhYmx5IHNob3VsZCBiZSBjYWxsaW5nIGl0IGJlZm9yZSBoYW5k
bGluZyBhbnkgUEJOIGNoYW5nZXMuIEp1c3QgYQpwcmVjYXV0aW9uLgoKU2lnbmVkLW9mZi1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KRml4ZXM6IDIzMmM5ZWVjNDE3YSAoImRybS9u
b3V2ZWF1OiBVc2UgYXRvbWljIFZDUEkgaGVscGVycyBmb3IgTVNUIikKQ2M6IEJlbiBTa2VnZ3Mg
PGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEplcnJ5IFp1
byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRA
YW1kLmNvbT4KQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KQ2M6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMg
djUuMSsKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCA0NCAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
CmluZGV4IDU0OTQ4NmYxZDkzNy4uNjMyN2FhZjM3YzA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jCkBAIC03NzAsMzIgKzc3MCwzNiBAQCBudjUwX21zdG9fYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAlzdHJ1Y3QgbnY1MF9tc3RtICpt
c3RtID0gbXN0Yy0+bXN0bTsKIAlzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWggPSBudjUwX2hl
YWRfYXRvbShjcnRjX3N0YXRlKTsKIAlpbnQgc2xvdHM7CisJaW50IHJldDsKIAotCWlmIChjcnRj
X3N0YXRlLT5tb2RlX2NoYW5nZWQgfHwgY3J0Y19zdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkKSB7
Ci0JCS8qCi0JCSAqIFdoZW4gcmVzdG9yaW5nIGR1cGxpY2F0ZWQgc3RhdGVzLCB3ZSBuZWVkIHRv
IG1ha2Ugc3VyZSB0aGF0Ci0JCSAqIHRoZSBidyByZW1haW5zIHRoZSBzYW1lIGFuZCBhdm9pZCBy
ZWNhbGN1bGF0aW5nIGl0LCBhcyB0aGUKLQkJICogY29ubmVjdG9yJ3MgYnBjIG1heSBoYXZlIGNo
YW5nZWQgYWZ0ZXIgdGhlIHN0YXRlIHdhcwotCQkgKiBkdXBsaWNhdGVkCi0JCSAqLwotCQlpZiAo
IXN0YXRlLT5kdXBsaWNhdGVkKSB7Ci0JCQljb25zdCBpbnQgYnBwID0gY29ubmVjdG9yLT5kaXNw
bGF5X2luZm8uYnBjICogMzsKLQkJCWNvbnN0IGludCBjbG9jayA9IGNydGNfc3RhdGUtPmFkanVz
dGVkX21vZGUuY2xvY2s7CisJcmV0ID0gbnY1MF9vdXRwX2F0b21pY19jaGVja192aWV3KGVuY29k
ZXIsIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUsCisJCQkJCSAgbXN0Yy0+bmF0aXZlKTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OwogCi0JCQlhc3loLT5kcC5wYm4gPSBkcm1fZHBfY2FsY19wYm5f
bW9kZShjbG9jaywgYnBwKTsKLQkJfQorCWlmICghY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkICYm
ICFjcnRjX3N0YXRlLT5jb25uZWN0b3JzX2NoYW5nZWQpCisJCXJldHVybiAwOwogCi0JCXNsb3Rz
ID0gZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsICZtc3RtLT5tZ3IsCi0JCQkJ
CQkgICAgICBtc3RjLT5wb3J0LAotCQkJCQkJICAgICAgYXN5aC0+ZHAucGJuKTsKLQkJaWYgKHNs
b3RzIDwgMCkKLQkJCXJldHVybiBzbG90czsKKwkvKgorCSAqIFdoZW4gcmVzdG9yaW5nIGR1cGxp
Y2F0ZWQgc3RhdGVzLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBidworCSAqIHJlbWFp
bnMgdGhlIHNhbWUgYW5kIGF2b2lkIHJlY2FsY3VsYXRpbmcgaXQsIGFzIHRoZSBjb25uZWN0b3In
cyBicGMKKwkgKiBtYXkgaGF2ZSBjaGFuZ2VkIGFmdGVyIHRoZSBzdGF0ZSB3YXMgZHVwbGljYXRl
ZAorCSAqLworCWlmICghc3RhdGUtPmR1cGxpY2F0ZWQpIHsKKwkJY29uc3QgaW50IGJwcCA9IGNv
bm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYyAqIDM7CisJCWNvbnN0IGludCBjbG9jayA9IGNydGNf
c3RhdGUtPmFkanVzdGVkX21vZGUuY2xvY2s7CiAKLQkJYXN5aC0+ZHAudHUgPSBzbG90czsKKwkJ
YXN5aC0+ZHAucGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoY2xvY2ssIGJwcCk7CiAJfQogCi0J
cmV0dXJuIG52NTBfb3V0cF9hdG9taWNfY2hlY2tfdmlldyhlbmNvZGVyLCBjcnRjX3N0YXRlLCBj
b25uX3N0YXRlLAotCQkJCQkgICBtc3RjLT5uYXRpdmUpOworCXNsb3RzID0gZHJtX2RwX2F0b21p
Y19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsICZtc3RtLT5tZ3IsIG1zdGMtPnBvcnQsCisJCQkJCSAg
ICAgIGFzeWgtPmRwLnBibik7CisJaWYgKHNsb3RzIDwgMCkKKwkJcmV0dXJuIHNsb3RzOworCisJ
YXN5aC0+ZHAudHUgPSBzbG90czsKKworCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZAotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
