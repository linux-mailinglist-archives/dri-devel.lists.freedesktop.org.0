Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C892111
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01DE89A4F;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C626E090
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 03:34:53 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id f187so145718ywa.5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 20:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uGOYgJda+j4dqh4YXabhCX5Nh2M2wJdXHWQKsrei+A0=;
 b=Apm5wq7WmWj2JQ9T+Jzxf8m53jHo6MiooJgR9G1m8Be0RH7q9l5uUR0wbN3IIHgoks
 oBVpaHJGy+d6BXVF7IYlika0RQf/kNJWsEyYvWSqNczGtbcSO8V+Drsg62Ea/TCwtllZ
 XkiCwmsBgreUVrVlYz1xqGfeQ5l8mYKzv3jOA0cvr24q7VvddX7GvjmXyxJa3OxMTOMt
 /bUpgH2PVav3Lm2Q9gThPgUyzJOlLJF7z9CGSjDZhhSfcM70skiQ8uCeChfnNrZd3R2w
 GCWSUuANJUPuuUiT8v3aDWsPI177B/S/xbWFlO50jGjwTF9WyGua2nJFfu9mKBS+yIyD
 hkvA==
X-Gm-Message-State: APjAAAVMH9gf48DRnAQakYnJyJRlu+xHAtol4FA6KYZhzpbvYdY41AR6
 1XdH65eFjQfpqGJVMArTXiA=
X-Google-Smtp-Source: APXvYqx/Ey+ck+08aUX1naJ+M5Dxnh85vNnbkoHC+QbtC+Md9D2ZDtdB4Divyj/mbjlLXsQOOx/0bg==
X-Received: by 2002:a81:9144:: with SMTP id i65mr14960039ywg.361.1566185692434; 
 Sun, 18 Aug 2019 20:34:52 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id b66sm537423ywd.110.2019.08.18.20.34.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 20:34:51 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH v2] drm/gma500: fix memory leaks
Date: Sun, 18 Aug 2019 22:34:30 -0500
Message-Id: <1566185684-8014-1-git-send-email-wenwen@cs.uga.edu>
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

SW4gbWRmbGRfZHNpX291dHB1dF9pbml0KCksIGlmIGFuIGVycm9yIG9jY3VycywgdGhlIGV4ZWN1
dGlvbiBpcyBkaXJlY3RlZAp0byAnZHNpX2luaXRfZXJyMCcgb3IgJ2RzaV9pbml0X2VycjEnLiBI
b3dldmVyLCBpbiBzb21lIGNhc2VzLCBzb21lCnByZXZpb3VzbHkgYWxsb2NhdGVkIGJ1ZmZlcnMg
YW5kIHJlc291cmNlcyBhcmUgbm90IGRlYWxsb2NhdGVkLCBsZWFkaW5nIHRvCm1lbW9yeS9yZXNv
dXJjZSBsZWFrcy4gVG8gZml4IHRoaXMgaXNzdWUsIHJldmlzZSB0aGUgbGFiZWxzLgoKU2lnbmVk
LW9mZi1ieTogV2Vud2VuIFdhbmcgPHdlbndlbkBjcy51Z2EuZWR1PgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lfb3V0cHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYwppbmRleCAwMzAyM2ZhLi4wY2Y0MTIxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYwpAQCAtNTczLDEzICs1NzMsMTMg
QEAgdm9pZCBtZGZsZF9kc2lfb3V0cHV0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlp
ZiAobWRmbGRfZHNpX3BrZ19zZW5kZXJfaW5pdChkc2lfY29ubmVjdG9yLCBwaXBlKSkgewogCQlE
Uk1fRVJST1IoIlBhY2thZ2UgU2VuZGVyIGluaXRpYWxpemF0aW9uIGZhaWxlZCBvbiBwaXBlICVk
XG4iLAogCQkJCQkJCQkJcGlwZSk7Ci0JCWdvdG8gZHNpX2luaXRfZXJyMDsKKwkJZ290byBkc2lf
aW5pdF9lcnIxOwogCX0KIAogCWVuY29kZXIgPSBtZGZsZF9kc2lfZHBpX2luaXQoZGV2LCBkc2lf
Y29ubmVjdG9yLCBwX3ZpZF9mdW5jcyk7CiAJaWYgKCFlbmNvZGVyKSB7CiAJCURSTV9FUlJPUigi
Q3JlYXRlIERQSSBlbmNvZGVyIGZhaWxlZFxuIik7Ci0JCWdvdG8gZHNpX2luaXRfZXJyMTsKKwkJ
Z290byBkc2lfaW5pdF9lcnIyOwogCX0KIAllbmNvZGVyLT5wcml2YXRlID0gZHNpX2NvbmZpZzsK
IAlkc2lfY29uZmlnLT5lbmNvZGVyID0gZW5jb2RlcjsKQEAgLTU4OSwxNCArNTg5LDEzIEBAIHZv
aWQgbWRmbGRfZHNpX291dHB1dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJcmV0dXJu
OwogCiAJLypUT0RPOiBhZGQgY29kZSB0byBkZXN0cm95IG91dHB1dHMgb24gZXJyb3IqLwotZHNp
X2luaXRfZXJyMToKK2RzaV9pbml0X2VycjI6CiAJLypkZXN0cm95IHNlbmRlciovCiAJbWRmbGRf
ZHNpX3BrZ19zZW5kZXJfZGVzdHJveShkc2lfY29ubmVjdG9yLT5wa2dfc2VuZGVyKTsKLQorZHNp
X2luaXRfZXJyMToKIAlkcm1fY29ubmVjdG9yX2NsZWFudXAoY29ubmVjdG9yKTsKLQorZHNpX2lu
aXRfZXJyMDoKIAlrZnJlZShkc2lfY29uZmlnLT5maXhlZF9tb2RlKTsKIAlrZnJlZShkc2lfY29u
ZmlnKTsKLWRzaV9pbml0X2VycjA6CiAJa2ZyZWUoZHNpX2Nvbm5lY3Rvcik7CiB9Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
