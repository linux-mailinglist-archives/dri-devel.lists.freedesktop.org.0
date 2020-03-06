Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D087D17BD01
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FC8919B;
	Fri,  6 Mar 2020 12:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085208919B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:41:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n7so2169177wrt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 04:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQ1vpokCmUulAl3pI93utu6aHQBpkBmE5TPFZehn+1E=;
 b=h5xCy2OWTqW9l8QvCGQf/z5CYDeYIZvezKv/uNrAfgEdYivgcdwV2vE5nSUcGxeGhw
 Mabmoq+9sWvndgRQjRZwzMIzhAyK9nurN4h6yM63LVTjhn7UkeRq5NcZNcYGk5HaAK7x
 pjcCzMqUtw690YEtxQWZVrzvRZWgd2oBvFEMJLGck+Xve4rOPE2sOpXD1h/Kr0GVx+wP
 4wRUH7gsV2U7eYiT6Su44hR+RfmmSDy0PekZ+0LD6NIaYSvlXhd2Zma6mNH1fR3C1jAD
 o7mC4lbdIPFp1neT9Ce/IBAAnfgTEndTF/qFMz3JqIE8tasZqP935Fb12r2XLF19h/40
 BhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQ1vpokCmUulAl3pI93utu6aHQBpkBmE5TPFZehn+1E=;
 b=P9BhgdnQFKefZPaZNc/RhWFad6oh7Zr/CrJiAW3KbGRdDJtlyqoJGxCgLrzoDtRVdg
 Gn7BQOSpujsReYr/zDII4PnigtB8xB8ax6HlVUktFH852dkSZqdXGrUgsdjkIYLBpXfQ
 rSVwVnp94mlO126/8SSzxVZKc/LnS5aI3QHsj9Px14LP8Ijad7noTfpoJJ3qy69Ug9rx
 KlCNugAQ8IRU+7e44BBXYXMznrYmpYG39r7nHnV7Ju67f11mhYGxAfp4onqfl59LhWcK
 6jNsg7ve6O4Jh7+yoQyJKI41kq2oroqzsJNXJ88wZFVXUzHsZ/kIUYKEANRReB4iykCg
 /J8Q==
X-Gm-Message-State: ANhLgQ0iJogywfVGrYh8iwlVGYVC5N5yshiZ0L0/ia1qwXvny2xRWJFf
 GlUGc3SXjjyRsjcoefwqtVw=
X-Google-Smtp-Source: ADFU+vuM/7dA+ipSPNGETbFDmU0MMul8N1lXYMtU26vkoE9YyGO36CI8V93PG2Ensw8x+OuOSo32Xw==
X-Received: by 2002:adf:8bda:: with SMTP id w26mr651008wra.126.1583498517640; 
 Fri, 06 Mar 2020 04:41:57 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:988f:6cd9:d3df:ec0d])
 by smtp.gmail.com with ESMTPSA id w19sm12570683wmc.22.2020.03.06.04.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 04:41:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Pierre-eric.Pelloux-prayer@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix false positive assert
Date: Fri,  6 Mar 2020 13:41:55 +0100
Message-Id: <20200306124155.1995-1-christian.koenig@amd.com>
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

VGhlIGFzc2VydCBzb21ldGltZXMgaW5jb3JyZWN0bHkgdHJpZ2dlcnMgd2hlbiBwaW5uZWQgQk9z
IGFyZSBkZXN0cm95ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDUg
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKaW5kZXggMjQ0NWUyYmQ2MjY3Li5jYTVhOGQwMWZmMWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwpAQCAtMTUxLDggKzE1MSw2IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19hZGRfbWVt
X3RvX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2ID0gYm8tPmJkZXY7CiAJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47
CiAKLQlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKLQogCWlmICghbGlzdF9l
bXB0eSgmYm8tPmxydSkpCiAJCXJldHVybjsKIApAQCAtNjExLDcgKzYwOSw4IEBAIHN0YXRpYyB2
b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQogCQkgKi8KIAkJaWYgKGJvLT5t
ZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpIHsKIAkJCWJvLT5tZW0ucGxhY2Vt
ZW50ICY9IH5UVE1fUExfRkxBR19OT19FVklDVDsKLQkJCXR0bV9ib19tb3ZlX3RvX2xydV90YWls
KGJvLCBOVUxMKTsKKwkJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOworCQkJdHRtX2JvX2FkZF9t
ZW1fdG9fbHJ1KGJvLCAmYm8tPm1lbSk7CiAJCX0KIAogCQlrcmVmX2luaXQoJmJvLT5rcmVmKTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
