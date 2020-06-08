Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF71F1BD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 17:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29196E95F;
	Mon,  8 Jun 2020 15:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72136E95F;
 Mon,  8 Jun 2020 15:15:53 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id mb16so18752966ejb.4;
 Mon, 08 Jun 2020 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jAc4+hPYb1yY730wa2bXInss6UylBdL9J1Kdgm1oOfk=;
 b=hjTuyL/PgSoZK2Url0WaKnYb6GmbIn2RIhgSS7jvChha9QNWnnXoJ0oFwSiV7NUMnx
 p5mjOdbHGGI/nDWLdAU0WVo0e3fH7gycwuWL3RRImSVchYPL9d6TSbAum2hkiX8k4Vyh
 XLIl3z4old+lLGVwzYDqZXlT4qKVolO1ua2m014BbeA0kI50gnZdmpP57zNAMc8/X3WB
 tdrHVl75c3xoWUgN79meoAcEPKkEXWDdGFy/aWKRwKe+tVLT/QmW+5Hn+ngPIXNGKjpt
 1DGN44+UVS6OS8VOXM0P3hBDTdczSbJ3Qduc2cyaJuK/ucK+a8dJUu0wDurt0ZoU5Kjn
 VZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jAc4+hPYb1yY730wa2bXInss6UylBdL9J1Kdgm1oOfk=;
 b=rE8zFOvGGxt8QRVB8kR+ftIvqbKKPENFSx4Vg6/CnELKdHT1SRqChI9KftJeYNMAGz
 FcJcdQT8bV02tkQjatklqZUTM5achubYnZWEah37l/6nVlKatnPg4X3nkne46lBwB4r+
 gZDIe3bYe0qPihxVINjUnrgvBh0f26d6L0+DVWKM+un+pEOAlifAL/86O7LzPoZ5cxKT
 xR/peROA+X5RGnnBAuobGgbQ2gHlaySxQLDorDFpdFvL772nL4sb1T60lHIadCzX3GK+
 3cb0qhQrqoClosKHGufBgfx2Mg1IX73IfwusEkecgZtoVteGN3CbWzypRiMhcl/AtZLv
 AKDg==
X-Gm-Message-State: AOAM533d8H+SqzaUMnCdw8Iurdk8+cNbKXqQdx/8GtltP+3zPwYyYAcE
 P8z+U/F2SKBN46mDzr38E7reHHd5
X-Google-Smtp-Source: ABdhPJyMgbpLKlGyZhUI8z/ZAW3nkU1ZZ8mPJQBF2TtWEoNOt4SJ9ZnPmL4KRhcwAvfx4miWcR8ccw==
X-Received: by 2002:a17:906:1088:: with SMTP id
 u8mr14841998eju.428.1591629352330; 
 Mon, 08 Jun 2020 08:15:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c1d:b395:5a4b:a43d])
 by smtp.gmail.com with ESMTPSA id cb6sm12713347edb.18.2020.06.08.08.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:15:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: nirmoy.das@amd.com, intel-gfx@lists.freedesktop.org,
 chris@chris-wilson.co.uk, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mm: remove invalid entry based optimization
Date: Mon,  8 Jun 2020 17:15:50 +0200
Message-Id: <20200608151550.1315-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0aGUgY3VycmVudCBlbnRyeSBpcyByZWplY3RlZCBhcyBjYW5kaWRhdGUgZm9yIHRoZSBz
ZWFyY2gKaXQgZG9lcyBub3QgbWVhbiB0aGF0IHdlIGNhbiBhYm9ydCB0aGUgc3VidHJlZSBzZWFy
Y2guCgpJdCBpcyBwZXJmZWN0bHkgcG9zc2libGUgdGhhdCBvbmx5IHRoZSBhbGlnbm1lbnQsIGJ1
dCBub3QgdGhlCnNpemUgaXMgdGhlIHJlYXNvbiBmb3IgdGhlIHJlamVjdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKaW5kZXggNjBlOWE5YzkxZTlkLi44
MmQyODg4ZWI3ZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKQEAgLTQwNiw4ICs0MDYsNyBAQCBuZXh0X2hvbGVfaGln
aF9hZGRyKHN0cnVjdCBkcm1fbW1fbm9kZSAqZW50cnksIHU2NCBzaXplKQogCQlwYXJlbnRfcmJf
bm9kZSA9IHJiX3BhcmVudChyYl9ub2RlKTsKIAkJbGVmdF9ub2RlID0gcmJfZW50cnkobGVmdF9y
Yl9ub2RlLAogCQkJCSAgICAgc3RydWN0IGRybV9tbV9ub2RlLCByYl9ob2xlX2FkZHIpOwotCQlp
ZiAoKGxlZnRfbm9kZS0+c3VidHJlZV9tYXhfaG9sZSA8IHNpemUgfHwKLQkJICAgICBIT0xFX1NJ
WkUoZW50cnkpID09IGVudHJ5LT5zdWJ0cmVlX21heF9ob2xlKSAmJgorCQlpZiAobGVmdF9ub2Rl
LT5zdWJ0cmVlX21heF9ob2xlIDwgc2l6ZSAmJgogCQkgICAgcGFyZW50X3JiX25vZGUgJiYgcGFy
ZW50X3JiX25vZGUtPnJiX2xlZnQgIT0gcmJfbm9kZSkKIAkJCXJldHVybiByYl9ob2xlX2FkZHJf
dG9fbm9kZShwYXJlbnRfcmJfbm9kZSk7CiAJfQpAQCAtNDQ2LDggKzQ0NSw3IEBAIG5leHRfaG9s
ZV9sb3dfYWRkcihzdHJ1Y3QgZHJtX21tX25vZGUgKmVudHJ5LCB1NjQgc2l6ZSkKIAkJcGFyZW50
X3JiX25vZGUgPSByYl9wYXJlbnQocmJfbm9kZSk7CiAJCXJpZ2h0X25vZGUgPSByYl9lbnRyeShy
aWdodF9yYl9ub2RlLAogCQkJCSAgICAgIHN0cnVjdCBkcm1fbW1fbm9kZSwgcmJfaG9sZV9hZGRy
KTsKLQkJaWYgKChyaWdodF9ub2RlLT5zdWJ0cmVlX21heF9ob2xlIDwgc2l6ZSB8fAotCQkgICAg
IEhPTEVfU0laRShlbnRyeSkgPT0gZW50cnktPnN1YnRyZWVfbWF4X2hvbGUpICYmCisJCWlmIChy
aWdodF9ub2RlLT5zdWJ0cmVlX21heF9ob2xlIDwgc2l6ZSAmJgogCQkgICAgcGFyZW50X3JiX25v
ZGUgJiYgcGFyZW50X3JiX25vZGUtPnJiX3JpZ2h0ICE9IHJiX25vZGUpCiAJCQlyZXR1cm4gcmJf
aG9sZV9hZGRyX3RvX25vZGUocGFyZW50X3JiX25vZGUpOwogCX0KLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
