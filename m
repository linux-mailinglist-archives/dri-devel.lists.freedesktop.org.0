Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB2164178
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480E46EB3B;
	Wed, 19 Feb 2020 10:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC16EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b17so6178161wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBGyfIEZ/eK+u9ah92tPDVEX0uvnD8lrrYEtM+U9GUc=;
 b=P1ZsrkgJxTP9s/2P6DLwoBhGIJkZ19RpM+wzVbE58Bb9buV1U51bfuDJ/dNa7M69Fn
 yW9OvdxS88holpFWsCIX+kLsfUe2ENd78QB0+g7jR/gWMqtE5fgP8NgwmnRy62cMo2PO
 87jncis7ubaWNpH1p3ulJsBsaJ0LJpSDtwHxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBGyfIEZ/eK+u9ah92tPDVEX0uvnD8lrrYEtM+U9GUc=;
 b=XmSztfZkFJR/CqomVW4skC3WeAm4S7AefTkZaGwK0eU8YfCor3OsJ1khts3KMOmwJE
 6cEap5eVPc6kQ3KZ3Mmu/vGFKquWeL8Ca8xS+de1uNn+8ddGwLkcm3/+0rcjVQ+GY28q
 RLcQvdXecVkHeSf7A9Va1Scty2cWDF8+lPew5PWBd7U/dChmv5Vw6ufxWkPi5zIVi7x0
 45C7Mzlklax0NKXq+ij9Bs8PqgfebM86Pj7r6NsIuEJvURhP/ffT/y1iA+OjWGIeV0NE
 UN3CWdISo88M41BtpO/0w6rixifMFdvRK3UdH8JBZfWZ+z+Mvv+zquPMrGgM0B5dk0g5
 IqcQ==
X-Gm-Message-State: APjAAAWod4OdTyIrh0dOWq+3RcAK3jtZjjUeC2YasvWf9L9f10bKxNWu
 6aX4+2mgC2MR4sA4nTmWtUH72+HXSMQ=
X-Google-Smtp-Source: APXvYqxTJAXLjwbfcfMxnaRQbeq++9QHmYOsZJZEWOPdtZBwNtKc/MdjXoIgM2TScbkwzNeDtXTymw==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr9508591wmc.9.1582107698627;
 Wed, 19 Feb 2020 02:21:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/52] drm/udl: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:36 +0100
Message-Id: <20200219102122.1607365-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6ICJOb3JhbGYgVHLDuG5uZXMi
IDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwppbmRleCBlNmMxY2Q3N2Q0ZDQu
LmQ1Yjg5NzExYWIxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNp
bmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgog
I2luY2x1ZGUgPGRybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1f
bWFuYWdlZC5oPgogI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KQEAgLTM4LDcgKzM5
LDYgQEAgc3RhdGljIHZvaWQgdWRsX2RyaXZlcl9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCiAJdWRsX2ZpbmkoZGV2KTsKIAl1ZGxfbW9kZXNldF9jbGVhbnVwKGRldik7CiAJZHJtX2Rl
dl9maW5pKGRldik7Ci0Ja2ZyZWUoZGV2KTsKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IGRyaXZlciA9IHsKQEAgLTc3LDYgKzc3LDcgQEAgc3RhdGljIHN0cnVjdCB1ZGxfZGV2aWNlICp1
ZGxfZHJpdmVyX2NyZWF0ZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogCiAJdWRs
LT51ZGV2ID0gdWRldjsKIAl1ZGwtPmRybS5kZXZfcHJpdmF0ZSA9IHVkbDsKKwlkcm1tX2FkZF9m
aW5hbF9rZnJlZSgmdWRsLT5kcm0sIHVkbCk7CiAKIAlyID0gdWRsX2luaXQodWRsKTsKIAlpZiAo
cikgewotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
