Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB6A86E9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 19:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ABB89BCD;
	Wed,  4 Sep 2019 17:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA17895E1;
 Wed,  4 Sep 2019 17:19:48 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 4so8032789pgm.12;
 Wed, 04 Sep 2019 10:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=09xouYfGtM7P/+Szurweb+Wo4prOf3fUjEfXXhSPvME=;
 b=YXKndG9eNsRwvPqeC7oOF+0UdgYhQOjkmXQWkbQlegiIsg1Q/j/R3uCUs69cxgZqMW
 x7mgcA5kCG/NF2CSXpPeHUVZ0SpFYizyp3q4afYcpEsXyPgssa8eyYrEZ+SLdOY6IIVV
 xPC3spn1oslYpjko15PGbzWwckt95nkFtcaoa0Fb22CgNx5IyEndES7k394dJv/CyS9q
 AmKnP4bw6DjFjwN6Jc5clxxRALuxgnoSLqcUegN01xoI/q0lXgB/vstvWsOv+4Ixu3Bn
 Jjx41MVdDnmHQ8vGpmnyTHOXCgg1s42wR+vVw9Gukl8ulddFBUmfdmB+FCOEI3Caquw0
 T6kg==
X-Gm-Message-State: APjAAAXEJr/9SctQTuQGjDD4bCEhh2SdBmoA9mgudu/BaW/6kkuYgFvN
 IxlqYpFgz1TwGn6a2wmRJqVNDp9PVrM=
X-Google-Smtp-Source: APXvYqzYc/xI1nMtMO8Q1TmWhNupziMCqcsew+YiGdEK3/Q/34lirq+6VDV81HR7x7yQFYWo9F0bUw==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr9951490pfq.111.1567617587533; 
 Wed, 04 Sep 2019 10:19:47 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id z23sm1407891pfn.45.2019.09.04.10.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:19:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Use the correct dma_sync calls harder
Date: Wed,  4 Sep 2019 10:17:23 -0700
Message-Id: <20190904171723.2956-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=09xouYfGtM7P/+Szurweb+Wo4prOf3fUjEfXXhSPvME=;
 b=bxDni1+RWIcCrmcmzKZQBT7cquE1szM+Rm10Syh+xw44EBp11UXsk0Zc5eo59dnbyr
 Ox9VL0O3wgC9uBUAlNkC9RBa/Sjk753Igi3sCtiB4BKPQv8Mg1v0IZktFKSbMVg1scyA
 FAZUOYfe11oasXe+cMmbFHMxcerzZvp0R65AVCvE8DtaZitzI+9Zpoi2hJSFsjP3+JhO
 BXV9F+Qwa0ha9xmxnIPvSBF9Dxovp7Jrrc7V7JRWUe9xIY8+I5j9VnQw8EYBJLpVlWxn
 hU83BGp2e75k5uOvyQ1/nbcDPdpqx5tGktn9Usl7STni53tGJYSGs3knulQDQ+l57PPo
 zofg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTG9va3MgbGlrZSB0aGUg
ZG1hX3N5bmMgY2FsbHMgZG9uJ3QgZG8gd2hhdCB3ZSB3YW50IG9uIGFybXY3IGVpdGhlci4KRml4
ZXM6CgogIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwg
YWRkcmVzcyA1MDAwMTAwMAogIHBnZCA9IChwdHJ2YWwpCiAgWzUwMDAxMDAwXSAqcGdkPTAwMDAw
MDAwCiAgSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDgwNSBbIzFdIFNNUCBBUk0KICBNb2R1bGVzIGxp
bmtlZCBpbjoKICBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjMu
MC1yYzYtMDAyNzEtZzlmMTU5YWUwN2YwNyAjNAogIEhhcmR3YXJlIG5hbWU6IEZyZWVzY2FsZSBp
Lk1YNTMgKERldmljZSBUcmVlIFN1cHBvcnQpCiAgUEMgaXMgYXQgdjdfZG1hX2NsZWFuX3Jhbmdl
KzB4MjAvMHgzOAogIExSIGlzIGF0IF9fZG1hX3BhZ2VfY3B1X3RvX2RldisweDI4LzB4OTAKICBw
YyA6IFs8YzAxMWM3NmM+XSAgICBsciA6IFs8YzAxMTgxYzQ+XSAgICBwc3I6IDIwMDAwMDEzCiAg
c3AgOiBkODBiNWE4OCAgaXAgOiBkZTk2YzAwMCAgZnAgOiBkODQwY2U2YwogIHIxMDogMDAwMDAw
MDAgIHI5IDogMDAwMDAwMDEgIHI4IDogZDg0M2UwMTAKICByNyA6IDAwMDAwMDAwICByNiA6IDAw
MDA4MDAwICByNSA6IGRkYjZjMDAwICByNCA6IDAwMDAwMDAwCiAgcjMgOiAwMDAwMDAzZiAgcjIg
OiAwMDAwMDA0MCAgcjEgOiA1MDAwODAwMCAgcjAgOiA1MDAwMTAwMAogIEZsYWdzOiBuekN2ICBJ
UlFzIG9uICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgSVNBIEFSTSAgU2VnbWVudCBub25lCiAgQ29u
dHJvbDogMTBjNTM4N2QgIFRhYmxlOiA3MDAwNDAxOSAgREFDOiAwMDAwMDA1MQogIFByb2Nlc3Mg
c3dhcHBlci8wIChwaWQ6IDEsIHN0YWNrIGxpbWl0ID0gMHgocHRydmFsKSkKClNpZ25lZC1vZmYt
Ynk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KRml4ZXM6IDNkZTQzM2M1YjM4
YSAoImRybS9tc206IFVzZSB0aGUgY29ycmVjdCBkbWFfc3luYyBjYWxscyBpbiBtc21fZ2VtIikK
VGVzdGVkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwppbmRleCA3MjYzZjQz
NzNmMDcuLjVhNmE3OWZiYzlkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
Z2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKQEAgLTUyLDcgKzUyLDcg
QEAgc3RhdGljIHZvaWQgc3luY19mb3JfZGV2aWNlKHN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNt
X29iaikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtc21fb2JqLT5iYXNlLmRldi0+ZGV2Owog
Ci0JaWYgKGdldF9kbWFfb3BzKGRldikpIHsKKwlpZiAoZ2V0X2RtYV9vcHMoZGV2KSAmJiBJU19F
TkFCTEVEKENPTkZJR19BUk02NCkpIHsKIAkJZG1hX3N5bmNfc2dfZm9yX2RldmljZShkZXYsIG1z
bV9vYmotPnNndC0+c2dsLAogCQkJbXNtX29iai0+c2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9O
QUwpOwogCX0gZWxzZSB7CkBAIC02NSw3ICs2NSw3IEBAIHN0YXRpYyB2b2lkIHN5bmNfZm9yX2Nw
dShzdHJ1Y3QgbXNtX2dlbV9vYmplY3QgKm1zbV9vYmopCiB7CiAJc3RydWN0IGRldmljZSAqZGV2
ID0gbXNtX29iai0+YmFzZS5kZXYtPmRldjsKIAotCWlmIChnZXRfZG1hX29wcyhkZXYpKSB7CisJ
aWYgKGdldF9kbWFfb3BzKGRldikgJiYgSVNfRU5BQkxFRChDT05GSUdfQVJNNjQpKSB7CiAJCWRt
YV9zeW5jX3NnX2Zvcl9jcHUoZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKIAkJCW1zbV9vYmotPnNn
dC0+bmVudHMsIERNQV9CSURJUkVDVElPTkFMKTsKIAl9IGVsc2UgewotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
