Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0F34C19
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDFA89A34;
	Tue,  4 Jun 2019 15:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697589A1F;
 Tue,  4 Jun 2019 15:23:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so3849177wru.0;
 Tue, 04 Jun 2019 08:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Ki+jI7DBSZXrOyMAa00BM/0AXBNzyMbeeIo9sgtBTg=;
 b=oyMs0ItPsGG6IBPa6J/3wFm02ywGl/rqZVb3HxLR0E4fOXQzOWdcMoGvd73Ux4Ghrh
 wtOo/EIFrKWLmu6FwnP2mZoBkgv8M9DqyDkI9grz0LV+UBXhE10eHrMNrtQ0+LdhU1wW
 6oAd3HghIsJ/iwPqZsjJGLvttTqPLK43Xw3JauTIsVTLYAKqf7ZXesmDau7zkX9lo79h
 RMIYNwG8N48IJ1aZizI0g2LJ/dkwt+udgVXHW1IRBTBxTkAkPfKXU09RyXzGhPRyYGRO
 wPP3Ed0Dd9DDbuDmTJ5vf3JmogRDQQ8U+nBUNsZ2+EYBEupX+izVYIi8pskyBnHKkZu8
 3dpw==
X-Gm-Message-State: APjAAAUHaFJdb5Qb1El94S0E156q3+ko3qv4oeAvpKluQcLOeq4SIFxg
 kd1huGcuwBUeGBUh/eUIgfQIgV99
X-Google-Smtp-Source: APXvYqwNQ/p+nnId1LjYEkbLuEzarW/E7HDMxbS53W68UrHOVFSShbbzgTe5M7NxqIPsO9ZyYAVDyA==
X-Received: by 2002:a05:6000:1285:: with SMTP id
 f5mr21118382wrx.112.1559661788195; 
 Tue, 04 Jun 2019 08:23:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b84a:e668:be1b:b8b7])
 by smtp.gmail.com with ESMTPSA id d3sm13514043wrs.8.2019.06.04.08.23.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 08:23:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix ttm_bo_unreserve
Date: Tue,  4 Jun 2019 17:23:06 +0200
Message-Id: <20190604152306.1804-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Ki+jI7DBSZXrOyMAa00BM/0AXBNzyMbeeIo9sgtBTg=;
 b=V3WZVn+7lu7B61VR/cjKYjaSx12Z7LlU0zUsWBD4RjxZ8+nnRPq0vo71E9u5Szv560
 D1cEyqu8OBXJ3M6mSlI034BiYIJdsqAZYsz6w4y0OSWXWksS96ki8UTj34GjKX+3wpd1
 dGH/dksm4kbflOTL54QTDHKLbfuh+pgHSsKGxY1/DeyXOSiT8MRHFupUkDZDIlhHdVTT
 /8NX5oGOda09l85Sg1zG5+Qs4pku+pHkoGkta/lJoiObyDsS1VS1eLav3xPkYghDHArq
 93oL8NUOpZxenEFs+9gPvvJAox6A4QvY5ujDudsCJJ1IbFoJw9cG7zDB2zfAGxWJtga2
 ByuQ==
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

U2luY2Ugd2Ugbm93IGtlZXAgQk9zIG9uIHRoZSBMUlUgd2UgbmVlZCB0byBtYWtlIHN1cmUKdGhh
dCB0aGV5IGFyZSByZW1vdmVkIHdoZW4gdGhleSBhcmUgcGlubmVkLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAxNCArKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIu
aAppbmRleCA5ZjU0Y2Y5YzYwZGYuLmM5YjhiYTQ5MmYyNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oCkBAIC03NjcsMTQgKzc2NywxMiBAQCBzdGF0aWMgaW5saW5lIGludCB0dG1fYm9fcmVzZXJ2
ZV9zbG93cGF0aChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogICovCiBzdGF0aWMgaW5s
aW5lIHZvaWQgdHRtX2JvX3VucmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQog
ewotCWlmICghKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpKSB7Ci0J
CXNwaW5fbG9jaygmYm8tPmJkZXYtPmdsb2ItPmxydV9sb2NrKTsKLQkJaWYgKGxpc3RfZW1wdHko
JmJvLT5scnUpKQotCQkJdHRtX2JvX2FkZF90b19scnUoYm8pOwotCQllbHNlCi0JCQl0dG1fYm9f
bW92ZV90b19scnVfdGFpbChibywgTlVMTCk7Ci0JCXNwaW5fdW5sb2NrKCZiby0+YmRldi0+Z2xv
Yi0+bHJ1X2xvY2spOwotCX0KKwlzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7
CisJaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQorCQl0dG1fYm9fYWRkX3RvX2xydShibyk7CisJ
ZWxzZQorCQl0dG1fYm9fbW92ZV90b19scnVfdGFpbChibywgTlVMTCk7CisJc3Bpbl91bmxvY2so
JmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7CiAJcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhi
by0+cmVzdik7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
