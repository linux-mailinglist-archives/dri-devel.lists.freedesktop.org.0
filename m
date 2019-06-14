Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44546A58
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EFC8945B;
	Fri, 14 Jun 2019 20:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA178945B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:36 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i11so5283975edq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/HFJ8xaLEHwyjjrt+RdMUJHdDgaU0IH5iuh88DNNqg=;
 b=WftQWlrD92ptHXNzC9H+ZmhRIuf9baspiOMmZkhXy5nXghsHwM2rPeP0zF86xaPBxv
 NZb+r628BZQb1GrSCSnEJaM1ff3C6ckP8GgZC4wh9USJG12JGfC5yDxoe0soY/kfxBE8
 3RM31rIXXt9muL7esFspuI2nwO+H3JHq8+gNQy3p1xo/fOe7FQdLQ07AXfNMpD1yoace
 A539zeC5c6MSZbVjNMMQvmPHS3lwsrlcdKh6uczkyfH279DazeGOPE6QCl56p9hoDL2u
 xMUjWKoER8UJ/wp0j+igWIa2m33IXbZIinht62KtKxTt52yNImuqVzjsAOVTu+6NctQC
 0ZGg==
X-Gm-Message-State: APjAAAXm0RomKHnF+60wtVz9sFeM1Vo6Wx5wmnd+FtOAk4N4bwHELPoz
 PzhfdQNyILQBBDNJIlvokJSheg+Vi/U=
X-Google-Smtp-Source: APXvYqxPpQiu2E4BPlYPb8OE1gNv97KbIicDDUqfeAfg5NxbmRSnogGgm6JDFp4ktf1SuEfbO5tg2g==
X-Received: by 2002:a17:906:a4cf:: with SMTP id
 cc15mr31638106ejb.12.1560544595110; 
 Fri, 14 Jun 2019 13:36:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/59] drm/arm: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:27 +0200
Message-Id: <20190614203615.12639-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/HFJ8xaLEHwyjjrt+RdMUJHdDgaU0IH5iuh88DNNqg=;
 b=FwOMv11u2nlam0TF7/SS9gks6QK1oF5MtVHwun0Os0BHY5IqUlFK9/Jwwfzsp7ay9v
 7FSEFZOdhuA44iHB25f6oSFX2WGEkvbXDEj2BtaCuXj/bSVbfJ3+NPG4zjPeWLNZ/BBv
 qAMZScJecT35RZoQW4OT98RBHbRLv2LHUsjS8=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiAiSmFtZXMgKFFp
YW4pIFdhbmciIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KQ2M6IExpdml1IER1ZGF1IDxsaXZp
dS5kdWRhdUBhcm0uY29tPgpDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwg
MiAtLQogZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYyAgICAgICAgICAgICAgICAgfCAy
IC0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyAgICAgICAgICAgICAgICB8IDIg
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCmluZGV4IGI5ZDY5OWNjN2JiZi4uNDVm
MDViYzk0NDg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYwpAQCAtNjMsOCArNjMsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga29t
ZWRhX2ttc19kcml2ZXIgPSB7CiAJLmR1bWJfY3JlYXRlCQkJPSBrb21lZGFfZ2VtX2NtYV9kdW1i
X2NyZWF0ZSwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkCQk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3Rv
X2ZkLAogCS5wcmltZV9mZF90b19oYW5kbGUJCT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUs
Ci0JLmdlbV9wcmltZV9leHBvcnQJCT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCi0JLmdlbV9wcmlt
ZV9pbXBvcnQJCT0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFi
bGUJCT0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0
X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJp
bWVfdm1hcAkJCT0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5j
CmluZGV4IGIxMjY1NTU4OTVkOC4uMjdjNDZhMjgzOGM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2hkbGNkX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2
LmMKQEAgLTI0MCw4ICsyNDAsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgaGRsY2RfZHJp
dmVyID0gewogCS5kdW1iX2NyZWF0ZSA9IGRybV9nZW1fY21hX2R1bWJfY3JlYXRlLAogCS5wcmlt
ZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRf
dG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9leHBv
cnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1f
cHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJp
bWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9j
bWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21h
X3ByaW1lX3ZtYXAsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCmluZGV4IDVkY2NjNzEzMDczOS4u
M2VjZGYxMzExMzM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwpAQCAtNTc0LDggKzU3NCw2
IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBtYWxpZHBfZHJpdmVyID0gewogCS5kdW1iX2Ny
ZWF0ZSA9IG1hbGlkcF9kdW1iX2NyZWF0ZSwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dl
bV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlLAotCS5nZW1fcHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9wcmltZV9leHBv
cnQsCi0JLmdlbV9wcmltZV9pbXBvcnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKIAkuZ2VtX3By
aW1lX2dldF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2Vt
X3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
