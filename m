Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102F9587C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80456E604;
	Tue, 20 Aug 2019 07:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C486E283
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 19:41:02 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id g19so1284614ywe.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 12:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3jjV8Hrc7MgB8gFTbQTU8aPeFAihk9juTlaHbNEZJYw=;
 b=o1t5uNoSXPXqFXdHgrdfgcl9VAJ2EDLwwXufY1AwbnU2k8sx809fyGZNWMFKUneVeG
 rNs1Nead3VTaNZbILkU77nwn0Bet6RFkvUD3Uzo/JFBoTbV80G2LUZIFefgrdiU3J70P
 tAbxpJHVV37kLU8Gp5jFTKUKX14xXlEH6jo5iIoryfdEx3rMho0RMuVXkzYSKVacfHNU
 OZRLmsaxuMetiPm3oiLtBD/k6eKmcze8CV9yb05z8ZXzOX/tmKSFNBIMNU6KiPIfjQNx
 u8O5AWV91ahQwcbcQbfJ7g0OhcVMXDA9FmHs33k5bHX7RhavWwtIWiXRO1Xs06TYP0PC
 tz0A==
X-Gm-Message-State: APjAAAVbaMcqZKTFVmzaVlEvNky+/sfXg4qfKd191MajFWCs0tWIFhmJ
 fscXrIveNVe/toh9XVy3UVA=
X-Google-Smtp-Source: APXvYqzEZxA6S8BJgKrg01+7nFvXMq0L8IVN2kgZ+PiBjevCV5VaF9TSCUylRGOcxLDWF2bsBc3S4w==
X-Received: by 2002:a81:310b:: with SMTP id x11mr18009539ywx.420.1566243661057; 
 Mon, 19 Aug 2019 12:41:01 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id 84sm3330637ywp.45.2019.08.19.12.40.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 19 Aug 2019 12:41:00 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] drm: Fix memory leaks
Date: Mon, 19 Aug 2019 14:40:49 -0500
Message-Id: <1566243649-5249-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KCksIGlmICdmb3JtYXRfY291bnQnIGlzIGxhcmdl
ciB0aGFuIDY0LCBubwpjbGVhbnVwIGlzIGV4ZWN1dGVkLCBsZWFkaW5nIHRvIG1lbW9yeS9yZXNv
dXJjZSBsZWFrcy4gVG8gZml4IHRoaXMgaXNzdWUsCnBlcmZvcm0gY2xlYW51cCB3b3JrIGJlZm9y
ZSByZXR1cm5pbmcgLUVJTlZBTC4KClNpZ25lZC1vZmYtYnk6IFdlbndlbiBXYW5nIDx3ZW53ZW5A
Y3MudWdhLmVkdT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCA1ICsrKystCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jCmluZGV4IGQ2YWQ2MGEuLjJjMGQwMDQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCkBAIC0yMTEsOCAr
MjExLDExIEBAIGludCBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJICogRmlyc3QgZHJpdmVyIHRvIG5lZWQg
bW9yZSB0aGFuIDY0IGZvcm1hdHMgbmVlZHMgdG8gZml4IHRoaXMuIEVhY2gKIAkgKiBmb3JtYXQg
aXMgZW5jb2RlZCBhcyBhIGJpdCBhbmQgdGhlIGN1cnJlbnQgY29kZSBvbmx5IHN1cHBvcnRzIGEg
dTY0LgogCSAqLwotCWlmIChXQVJOX09OKGZvcm1hdF9jb3VudCA+IDY0KSkKKwlpZiAoV0FSTl9P
Tihmb3JtYXRfY291bnQgPiA2NCkpIHsKKwkJa2ZyZWUocGxhbmUtPmZvcm1hdF90eXBlcyk7CisJ
CWRybV9tb2RlX29iamVjdF91bnJlZ2lzdGVyKGRldiwgJnBsYW5lLT5iYXNlKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CisJfQogCiAJaWYgKGZvcm1hdF9tb2RpZmllcnMpIHsKIAkJY29uc3QgdWludDY0
X3QgKnRlbXBfbW9kaWZpZXJzID0gZm9ybWF0X21vZGlmaWVyczsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
