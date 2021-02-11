Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD82318BB5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 14:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866346EE22;
	Thu, 11 Feb 2021 13:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F226EE22
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 13:17:02 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id w2so9944300ejk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 05:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q8lstGe22K+GNTk+BJ2fblsfoBjxRu75SUWLCFzvWGY=;
 b=sgYPHbQjzdetdW4jcV5ebh6ddEEfCNY0Egsn2Qq7Slqm2/errdhSY5dOtyy0CJDzN8
 UBtiw1RWvlFN/M7BNW4pulaI5N3r5Z7H24aSpyKOShnDc1Bg3OxuN0q85uu1+zwsKSfe
 SxgZX3uKbYANVTMMqwTkMWWm1KDEse+b6i2y5XNZr0aqxkFU/9iq3TjDS3HhGmpM4KCn
 fRzntjLu5+rYPfabEgcq87+Ab9FUBpCtCuElSVXmZQAYoUGltmsyU0tQO2aJXJLjhJiv
 QakqUY5IQvSn9IkQLz7KdEKCV8miXMS7MGjVM/SKDGRVq6ml8Dgr083HeJ1zXTr8qWBV
 TeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q8lstGe22K+GNTk+BJ2fblsfoBjxRu75SUWLCFzvWGY=;
 b=UIG4rFG4VvzdiGpn6ZPdBsVqQqYtY0RlU+qrj6o6IPMUylGPQ/kwB7LgNp3EV9CqMg
 YxzUY3a2wQNsSBkIRrXQaOy0U0hu7DQdMUmLxRYeXlsJcM2T3Iq0Dmxs2H0UVIpUtHSG
 w++FeD3JxpXJpywStyIwJ2EaLHPaYn0RxXE2gesUxG1NfhOZHiWvupdXOTjVYs4W/MK3
 +zIin+QL6ANisVlqvGUOz7Awq13u2/1kzz6KNDKSFzqY6TKXQ6MqWLNLA4orsFdKcuVl
 kSYq2X+c5OBOuj5PYeSoYGw6Xp9aKZVEp4FzTob1PQVzBHkZvSlSCreplRnbjB8/twZO
 0S+w==
X-Gm-Message-State: AOAM530d9TSfntWrfWuJ7b/0XP0fCK3dPsZxMwehjgBBnO8XvQmysbvJ
 Bn5YIT6t6wEJ5RyZq72m4q4=
X-Google-Smtp-Source: ABdhPJyyxBg6wzvUeXdLS/6VK4Mgrv31+dBzM5ThV74DoHxxCNqVyFvfvzaQ3TqZXaE65f19crUS+Q==
X-Received: by 2002:a17:907:7605:: with SMTP id
 jx5mr8665822ejc.340.1613049420991; 
 Thu, 11 Feb 2021 05:17:00 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:820:5af6:9146:2c9f])
 by smtp.gmail.com with ESMTPSA id l1sm4168614eje.12.2021.02.11.05.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 05:17:00 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 zackr@vmware.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
Date: Thu, 11 Feb 2021 14:16:56 +0100
Message-Id: <20210211131659.276275-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

U3dhcHBpbmcgYm8tPm1lbSB3YXMgY29tcGxldGVseSB1bmVjZXNzYXJ5LiBDbGVhbnVwIHRoZSBm
dW5jdGlvbiB3aGljaAppcyBqdXN0IGEgbGVmdG92ZXIgZnJvbSBhIFRUTSBjbGVhbnVwLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxOCArKysrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IGEwOTkyZjBiOGFmZC4u
MGMyMjMzZWU2MDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTU2
NCw5ICs1NjQsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0X2Zs
YWdzKHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCiAJKnBsID0gZ2JvLT5wbGFjZW1l
bnQ7CiB9CiAKLXN0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9ib19kcml2ZXJfbW92ZV9ub3RpZnko
c3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKLQkJCQkJICAgICAgIGJvb2wgZXZpY3Qs
Ci0JCQkJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKQorc3RhdGljIHZvaWQg
ZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShzdHJ1Y3QgZHJtX2dlbV92cmFtX29i
amVjdCAqZ2JvKQogewogCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSAmZ2JvLT5ibzsK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gYm8tPmJhc2UuZGV2OwpAQCAtNTgyLDE2ICs1ODAs
OCBAQCBzdGF0aWMgaW50IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfbW92ZShzdHJ1Y3QgZHJtX2dl
bV92cmFtX29iamVjdCAqZ2JvLAogCQkJCSAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHgg
KmN0eCwKIAkJCQkgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKIHsKLQlpbnQg
cmV0OwotCi0JZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShnYm8sIGV2aWN0LCBu
ZXdfbWVtKTsKLQlyZXQgPSB0dG1fYm9fbW92ZV9tZW1jcHkoJmdiby0+Ym8sIGN0eCwgbmV3X21l
bSk7Ci0JaWYgKHJldCkgewotCQlzd2FwKCpuZXdfbWVtLCBnYm8tPmJvLm1lbSk7Ci0JCWRybV9n
ZW1fdnJhbV9ib19kcml2ZXJfbW92ZV9ub3RpZnkoZ2JvLCBmYWxzZSwgbmV3X21lbSk7Ci0JCXN3
YXAoKm5ld19tZW0sIGdiby0+Ym8ubWVtKTsKLQl9Ci0JcmV0dXJuIHJldDsKKwlkcm1fZ2VtX3Zy
YW1fYm9fZHJpdmVyX21vdmVfbm90aWZ5KGdibyk7CisJcmV0dXJuIHR0bV9ib19tb3ZlX21lbWNw
eSgmZ2JvLT5ibywgY3R4LCBuZXdfbWVtKTsKIH0KIAogLyoKQEAgLTk0Nyw3ICs5MzcsNyBAQCBz
dGF0aWMgdm9pZCBib19kcml2ZXJfZGVsZXRlX21lbV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibykKIAogCWdibyA9IGRybV9nZW1fdnJhbV9vZl9ibyhibyk7CiAKLQlkcm1fZ2Vt
X3ZyYW1fYm9fZHJpdmVyX21vdmVfbm90aWZ5KGdibywgZmFsc2UsIE5VTEwpOworCWRybV9nZW1f
dnJhbV9ib19kcml2ZXJfbW92ZV9ub3RpZnkoZ2JvKTsKIH0KIAogc3RhdGljIGludCBib19kcml2
ZXJfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
