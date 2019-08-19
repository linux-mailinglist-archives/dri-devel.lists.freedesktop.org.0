Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AF9210E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0997989A59;
	Mon, 19 Aug 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3033F6E087
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 03:13:28 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id h8so122006ybq.9
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 20:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A70pDx8ZVFbh5we0DnKpwB7v/M6I0DIAyvofyE5IBX4=;
 b=ej/9V13fYm5mjjQSvHgpJrZn5GQxAZ+RihJKYqB8yBmjPKJg6BRUHA5G090yZ2o85b
 D9Bianf9t0CPjj4JJruoaVSI1/yAAfMKMYnuNsxJsgNVC9AImpeUfmGMOT2A/buyoj4M
 64fMByXnc2kwZpm8iHVVJjIkx2FcF12OEUSl6Yicr0C5XKnO9AAjIWFtrjQ3ZX6DpgZQ
 iCIe/txvK+rerECTq/OgVoqAnIzFEEYLXvK3k17W/1phFonURTiGDj2gFcGrjUziKmD1
 XxNAWh4c4QwI5heI2i2uwF5bPVgjTm95uCC7Q7y4TdAQ4zhOm2tbCTVjEB7jvXYh+xKS
 81FQ==
X-Gm-Message-State: APjAAAUExAHIvQwM1XqE8T38kj9RqdxUvU83C5eoOcSWm7LQll0DrzzG
 DnEb4q4A8NGaUjZ+//2dzXQ=
X-Google-Smtp-Source: APXvYqyX9wJL+hv/OtNdHBPS1+KQ0hEO8h3RRoh4HTlbvfIUdjgNYFWxlhk/5mBtwwK3plBfM/zHag==
X-Received: by 2002:a25:cc8f:: with SMTP id
 l137mr14843735ybf.482.1566184407307; 
 Sun, 18 Aug 2019 20:13:27 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id q65sm2860184ywc.11.2019.08.18.20.13.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 20:13:26 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] drm/gma500: fix memory leaks
Date: Sun, 18 Aug 2019 22:12:57 -0500
Message-Id: <1566184395-7615-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWRmbGRfZHNpX291dHB1dF9pbml0KCksIGlmIG1kZmxkX2RzaV9wa2dfc2VuZGVyX2luaXQo
KSBmYWlscywgdGhlCmV4ZWN1dGlvbiBpcyBkaXJlY3RlZCB0byB0aGUgJ2RzaV9pbml0X2VycjAn
IGxhYmVsLiBIb3dldmVyLCBzb21lCnByZXZpb3VzbHkgYWxsb2NhdGVkIGJ1ZmZlcnMgYW5kIHJl
c291cmNlcyBhcmUgbm90IGRlYWxsb2NhdGVkLCBsZWFkaW5nIHRvCm1lbW9yeS9yZXNvdXJjZSBs
ZWFrcy4gVG8gZml4IHRoaXMgaXNzdWUsIHJldmlzZSB0aGUgJ2RzaV9pbml0X2VycjAnIGxhYmVs
LgoKU2lnbmVkLW9mZi1ieTogV2Vud2VuIFdhbmcgPHdlbndlbkBjcy51Z2EuZWR1PgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvbWRmbGRfZHNpX291dHB1dC5jCmluZGV4IDAzMDIzZmEuLmFiOWU5MzUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jCkBAIC01OTIsMTEgKzU5MiwxMCBA
QCB2b2lkIG1kZmxkX2RzaV9vdXRwdXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogZHNp
X2luaXRfZXJyMToKIAkvKmRlc3Ryb3kgc2VuZGVyKi8KIAltZGZsZF9kc2lfcGtnX3NlbmRlcl9k
ZXN0cm95KGRzaV9jb25uZWN0b3ItPnBrZ19zZW5kZXIpOwotCitkc2lfaW5pdF9lcnIwOgogCWRy
bV9jb25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpOwogCiAJa2ZyZWUoZHNpX2NvbmZpZy0+Zml4
ZWRfbW9kZSk7CiAJa2ZyZWUoZHNpX2NvbmZpZyk7Ci1kc2lfaW5pdF9lcnIwOgogCWtmcmVlKGRz
aV9jb25uZWN0b3IpOwogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
