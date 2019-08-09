Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A987E07
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 17:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BE16EE2F;
	Fri,  9 Aug 2019 15:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395D26EE2F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 15:31:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p17so98616469wrf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYPymOPGv3UuTF6mHn6CMjkLcF5JaspOeR9tB9F8HGs=;
 b=STz+lb1qNVGEffQYeAPCOL+yuoFwNrJyrBZbQeCNSq5kBRHHHoveCnR8Lec6vOVS+r
 uSLaOiJuXBQPj65KkrRyY2YfUjsuNEnoGUActiOD8lYzEwpAgwJsmWqVjDWP4WzZ/OL1
 rewGg7RRmkY4USfnykG1INBO5OF/VqtvpdiL/nWFKc5U4eddR2Zq68gicSwOcrAzCnE8
 4BYGZtFhT7WPZ9OHEVwIxpqx2VWKAJOApAnuZZaLu4IZqAht4EZzXi1ZvB1JoyNl6UpJ
 pN3TAImc2laLuZLQKGPcOjbfDiS8I9e+rhtrwVsibIx6ir3X+VEyj7MQLsAfi0p/p3hg
 R8Ug==
X-Gm-Message-State: APjAAAWS9ThZARvMsRVXCXDxVpVvXDujHeQ+SP0fHgZaRbs9lHwkxDGQ
 8QB6rRUJB2x46xs8EoOs1CAT1JAm
X-Google-Smtp-Source: APXvYqw5W8X2asAA9ZN1t6OfiyqOhjfXkX1iculB03umAqON6hcLSHuqZhn8bMHhrwFtHCiutFym5Q==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr25618291wrx.17.1565364670875; 
 Fri, 09 Aug 2019 08:31:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e1a5:55ca:9dd5:309])
 by smtp.gmail.com with ESMTPSA id z2sm4309645wmi.2.2019.08.09.08.31.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 08:31:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: andrey.grodzovsky@amd.com, dri-devel@lists.freedesktop.org,
 Monk.Liu@amd.com, Emily.Deng@amd.com
Subject: [PATCH] drm/scheduler: use job count instead of peek
Date: Fri,  9 Aug 2019 17:31:09 +0200
Message-Id: <20190809153109.79228-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYPymOPGv3UuTF6mHn6CMjkLcF5JaspOeR9tB9F8HGs=;
 b=g9nRMBdbiEzXidxMCiTslPt+SVMtwtXIC0DYSY7CSjFE+9v0L5zc4OVd45+2VfrH2t
 QlRdbWwhqorbRv00t5TYTFTzXVLdg3yELRSHD0xZ/Iy+aWGcVnTCziQwHzvRhK9gfiG4
 tYF8gYeDS/+5DLZIMu8A9Qu57YL4DCGMsa8DKCDKZNAW44YY1UbAnfo2j2GEpcQIim9n
 sZenXZTjKsBrq7YDdxskyG2ysnFDA+RiyjK2NA7fLk+1VWVFUZaPRXNrq2XwPiRTFIC9
 DCw9ec66BaeJhmiEFeUlOGteIADU4Y4VRd1Z1Zsbqa+AJLf8GzxcAdoMv9cN4zSzRZB4
 Ce+Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNwc2NfcXVldWVfcGVlayBmdW5jdGlvbiBpcyBhY2Nlc3NpbmcgcXVldWUtPmhlYWQgd2hp
Y2ggYmVsb25ncyB0bwp0aGUgY29uc3VtZXIgdGhyZWFkIGFuZCBzaG91bGRuJ3QgYmUgYWNjZXNz
ZWQgYnkgdGhlIHByb2R1Y2VyCgpUaGlzIGlzIGZpeGluZyBhIHJhcmUgcmFjZSBjb25kaXRpb24g
d2hlbiBkZXN0cm95aW5nIGVudGl0aWVzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfZW50aXR5LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5
LmMKaW5kZXggMzVkZGJlYzEzNzVhLi42NzFjOTBmMzRlZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9lbnRpdHkuYwpAQCAtOTUsNyArOTUsNyBAQCBzdGF0aWMgYm9vbCBkcm1f
c2NoZWRfZW50aXR5X2lzX2lkbGUoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKIAly
bWIoKTsgLyogZm9yIGxpc3RfZW1wdHkgdG8gd29yayB3aXRob3V0IGxvY2sgKi8KIAogCWlmIChs
aXN0X2VtcHR5KCZlbnRpdHktPmxpc3QpIHx8Ci0JICAgIHNwc2NfcXVldWVfcGVlaygmZW50aXR5
LT5qb2JfcXVldWUpID09IE5VTEwpCisJICAgIHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9i
X3F1ZXVlKSA9PSAwKQogCQlyZXR1cm4gdHJ1ZTsKIAogCXJldHVybiBmYWxzZTsKQEAgLTI4MSw3
ICsyODEsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfZmluaShzdHJ1Y3QgZHJtX3NjaGVkX2Vu
dGl0eSAqZW50aXR5KQogCS8qIENvbnN1bXB0aW9uIG9mIGV4aXN0aW5nIElCcyB3YXNuJ3QgY29t
cGxldGVkLiBGb3JjZWZ1bGx5CiAJICogcmVtb3ZlIHRoZW0gaGVyZS4KIAkgKi8KLQlpZiAoc3Bz
Y19xdWV1ZV9wZWVrKCZlbnRpdHktPmpvYl9xdWV1ZSkpIHsKKwlpZiAoc3BzY19xdWV1ZV9jb3Vu
dCgmZW50aXR5LT5qb2JfcXVldWUpKSB7CiAJCWlmIChzY2hlZCkgewogCQkJLyogUGFyayB0aGUg
a2VybmVsIGZvciBhIG1vbWVudCB0byBtYWtlIHN1cmUgaXQgaXNuJ3QgcHJvY2Vzc2luZwogCQkJ
ICogb3VyIGVuaXR5LgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
