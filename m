Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735A41A94B7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B617896ED;
	Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07466E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so16160626wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68pRrV/FcZHhfKF8N6ed2Kst21jlb9WtulkqBRnU6S8=;
 b=Gyz+CtzkcX37Hl3nRFOLm4GVr0azPRX/NrKG8ap0W4baKemymnbW+Lxwz1Xp6GzRWr
 lx8lnLIxv1Ol9V12XsfA9QbmLLL+3YuN9Oi/tEmm8esrE92s8XrfhUVGnPj+V2YfEa9U
 /1rFjd2vFJTcNB51K1Lp7i6tJvkBxa6hlf7kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68pRrV/FcZHhfKF8N6ed2Kst21jlb9WtulkqBRnU6S8=;
 b=Y0Tf526xOUWTAXj0BNlL3pKQK7DVe8T9waah9aoVkbr7t7pOGnwZJVcpQs0WtBxVPy
 m/3TyhE+4srnVyuXrhHQJgqL7jenwFUBpCSxTqUE0I8RkmKEoK6Iyfi3346+670LLsCw
 R7T7HsOjezyXxwoBmLzzSdvUqcWpnv1Zh11FYVaRAZGsYOrwBOCzLMG7roZ7pubWPMlY
 1bK6gIQRr4Z0SHCH/vyzdhNUTGtZRpBR/c60nAkGlvUK6zcn4jJplLtVL5pX8vwXty7r
 GKSuGRGf84fzKtx7RlyiTeiAJMQ1ohO4JeHSP18BDkwPjaUFlByy9bcQu3MSMP3fKWzc
 KpzQ==
X-Gm-Message-State: AGi0PuZlNmdkcEfody/UL40hCQXEDHudgdAtZGIyHBPhe/ypWdP/qCx1
 kiUIJtbFWx7Qq3dn7GEx/xQhyw==
X-Google-Smtp-Source: APiQypK5zCrPi1yHK4Hs/xsz2aEThr6qJhfA2NsVnJXgzOw3DJadAR07qQZyjbKa0Tk2q2OD7lnVVg==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4095533wmd.117.1586936477577; 
 Wed, 15 Apr 2020 00:41:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 35/59] drm/cirrus: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:10 +0200
Message-Id: <20200415074034.175360-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAxMyArKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
Y2lycnVzL2NpcnJ1cy5jCmluZGV4IGEzNjI2OTcxN2MzYi4uNGI2NTYzNzE0N2JhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9jaXJydXMvY2lycnVzLmMKQEAgLTU2NywxOCArNTY3LDEzIEBAIHN0YXRpYyBpbnQgY2lycnVz
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJcmV0dXJuIHJldDsKIAogCXJldCA9
IC1FTk9NRU07Ci0JY2lycnVzID0ga3phbGxvYyhzaXplb2YoKmNpcnJ1cyksIEdGUF9LRVJORUwp
OwotCWlmIChjaXJydXMgPT0gTlVMTCkKLQkJcmV0dXJuIHJldDsKKwljaXJydXMgPSBkZXZtX2Ry
bV9kZXZfYWxsb2MoJnBkZXYtPmRldiwgJmNpcnJ1c19kcml2ZXIsCisJCQkJICAgIHN0cnVjdCBj
aXJydXNfZGV2aWNlLCBkZXYpOworCWlmIChJU19FUlIoY2lycnVzKSkKKwkJcmV0dXJuIFBUUl9F
UlIoY2lycnVzKTsKIAogCWRldiA9ICZjaXJydXMtPmRldjsKLQlyZXQgPSBkZXZtX2RybV9kZXZf
aW5pdCgmcGRldi0+ZGV2LCBkZXYsICZjaXJydXNfZHJpdmVyKTsKLQlpZiAocmV0KSB7Ci0JCWtm
cmVlKGNpcnJ1cyk7Ci0JCXJldHVybiByZXQ7Ci0JfQogCWRldi0+ZGV2X3ByaXZhdGUgPSBjaXJy
dXM7Ci0JZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBjaXJydXMpOwogCiAJY2lycnVzLT52cmFt
ID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwK
IAkJCQkgICAgcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKSk7Ci0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
