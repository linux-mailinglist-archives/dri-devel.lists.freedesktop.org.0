Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE618F751
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A08B6E182;
	Mon, 23 Mar 2020 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A76E14E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b2so17403391wrj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtsrD/aFJQAx1LKfUnSPy4VErkcJPE9ispYy08oNiec=;
 b=FnCNYm/h3O11W73yUrrq4IYHNAT7v0gn7YNQ+I1h3OimV7UNSvAZjk+Ie4HohTgRNW
 C+AUMgdgTPIELi5S9GG5ak60t0p3b26W4AFtYB3pvT7ybeaczfLxqZVvgh9wAkkPcsl5
 uhkXubC7LmZs3Nn/bSLf32wF3UwtNtEAZucrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtsrD/aFJQAx1LKfUnSPy4VErkcJPE9ispYy08oNiec=;
 b=CdIinJv/WcIOsP2tQw7pSkUSaPsGnvXYhNbmanyOuQT20DUW3nt/fESUPGO96YDn3F
 /R9zruJ7odMroRfjECbYTxdR/Y9ob7G9S+kFmhMp0/sT9WckfdeNRbZSe60854KCdCf1
 dy4Uxv2XuplWM2cLjJbIBoZSoVYyNqrn5bFOqmf9uEwwHsqagzZrHQBtpcWBrs49P5v3
 LrGHluZlttAZyIa0wr8YEPid7g9xrH/0ABqlnZGylx72S0Qt3fcwAymzSQlV918V4rwQ
 in4W1i3FI/90BEYRU9V3K9LImIOw57yfOuzfRKr0zVWiCwjlPyycqG3/haW1RrDv1Fbq
 ONBg==
X-Gm-Message-State: ANhLgQ2Z2a4flCCe7DpZ86QRAKentmQknJfADUKlLOIkMB5CmUv3o7Hj
 g2NMg5SvzbKTSDQlQyI7MhASS+4zq2d76Q==
X-Google-Smtp-Source: ADFU+vtEod6poXJM57oOycTdEiRIYy+MxMIgQeYR2m6kYJZ6RjXo9lYNGin1i7rgXBWM7aoeYwFAYw==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr29802263wrc.373.1584975009633; 
 Mon, 23 Mar 2020 07:50:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:08 +0100
Message-Id: <20200323144950.3018436-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKSSBhbHNvIG5vdGljZWQgdGhhdCBjaXJydXMgZm9yZ290IHRvIGNhbGwgZHJtX2Rl
dl9maW5pKCkuCgp2MjogRG9uJ3QgY2FsbCBrZnJlZShjaXJydXMpIGFmdGVyIHdlJ3ZlIGhhbmRl
ZCBvdmVyc2hpcCBvZiB0aGF0IHRvCmRybV9kZXZpY2UgYW5kIHRoZSBkcm1tXyBzdHVmZi4KCkFj
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIHwgMTQg
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggZDJmZjYzY2U4ZWFmLi4yMjMyNTU2
Y2UzNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1
ZGUgPGRybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2Zy
YW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KKyNpbmNsdWRl
IDxkcm0vZHJtX21hbmFnZWQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0
YWJsZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KQEAgLTUyNywxMCArNTI4LDggQEAgc3RhdGljIHZv
aWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykK
IAogc3RhdGljIHZvaWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsK
LQlzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzID0gZGV2LT5kZXZfcHJpdmF0ZTsKLQogCWRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Ci0Ja2ZyZWUoY2lycnVzKTsKKwlkcm1fZGV2X2Zp
bmkoZGV2KTsKIH0KIAogREVGSU5FX0RSTV9HRU1fRk9QUyhjaXJydXNfZm9wcyk7CkBAIC01NzUs
OSArNTc0LDEyIEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAogCWRldiA9ICZjaXJydXMtPmRldjsKIAlyZXQgPSBkcm1fZGV2X2luaXQoZGV2LCAm
Y2lycnVzX2RyaXZlciwgJnBkZXYtPmRldik7Ci0JaWYgKHJldCkKLQkJZ290byBlcnJfZnJlZV9j
aXJydXM7CisJaWYgKHJldCkgeworCQlrZnJlZShjaXJydXMpOworCQlnb3RvIGVycl9wY2lfcmVs
ZWFzZTsKKwl9CiAJZGV2LT5kZXZfcHJpdmF0ZSA9IGNpcnJ1czsKKwlkcm1tX2FkZF9maW5hbF9r
ZnJlZShkZXYsIGNpcnJ1cyk7CiAKIAlyZXQgPSAtRU5PTUVNOwogCWNpcnJ1cy0+dnJhbSA9IGlv
cmVtYXAocGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApLApAQCAtNjE4LDggKzYyMCw2IEBAIHN0
YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlpb3VubWFw
KGNpcnJ1cy0+dnJhbSk7CiBlcnJfZGV2X3B1dDoKIAlkcm1fZGV2X3B1dChkZXYpOwotZXJyX2Zy
ZWVfY2lycnVzOgotCWtmcmVlKGNpcnJ1cyk7CiBlcnJfcGNpX3JlbGVhc2U6CiAJcGNpX3JlbGVh
c2VfcmVnaW9ucyhwZGV2KTsKIAlyZXR1cm4gcmV0OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
