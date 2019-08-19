Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9929498B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34976E201;
	Mon, 19 Aug 2019 16:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418236E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:12:11 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j5so5470058ioj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAPAq7xSxjjLTecPqKAR65l3wBupYMfUEeatXDRr6eM=;
 b=VbJtlTjzG2FH89+pXrfpjLYXOlLkXSmA50hDaNc2AnzG9+YD50bK5RJxDCIvAC4NFo
 LZuwrM93BX8O9vs6EH9i4alCXHAiw+ufprHFPggbXCu8ix421Cw0P9K2p+3Kx1ajfVhB
 E7CYfR9Q9uM31x7Z53CKjK9Qm9/vWI+jO7BJC7JX4N2sSNJG5hG3rAPR8dWc4h7lgaXC
 KKPsP0w/N6uY3mgtf9Bjh2Pvkjqum/XlvAIyEFbRzLIYILQT6Pl5z7Es0tpy1Lwgm+vC
 KGrnOMR2eH75SuvUR9zOdk7/5JLitqYKjHGdAwrbm4da2kW7EaAB0AGmIdElmT6D+VEz
 Khug==
X-Gm-Message-State: APjAAAVKVN9OZYbOds3oBKb9ahUUhxtckcLoJVBQOwKIyBm4eIKkn0I4
 HJIpXZZJbCQy/sDT9lFjFGL0Lmg=
X-Google-Smtp-Source: APXvYqwD2y3/zbB9pvN4/eg5JUKajKxTKQWEOBwKH9/QlmRe5GsVcDPLZhFtDwTt9QO8hu9P+JD7gA==
X-Received: by 2002:a02:9644:: with SMTP id c62mr27156363jai.45.1566231130158; 
 Mon, 19 Aug 2019 09:12:10 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c19sm4770584ioi.22.2019.08.19.09.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 09:12:09 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/panfrost: Fix shrinker lockdep issues using
 drm_gem_shmem_purge()
Date: Mon, 19 Aug 2019 11:12:03 -0500
Message-Id: <20190819161204.3106-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819161204.3106-1-robh@kernel.org>
References: <20190819161204.3106-1-robh@kernel.org>
MIME-Version: 1.0
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyAyIGlzc3VlcyBmb3VuZCBieSBsb2NrZGVwLiBGaXJzdCwgZHJtX2dlbV9zaG1l
bV9wdXJnZSgpCm5vdyB1c2VzIG11dGV4X3RyeWxvY2sgZm9yIHRoZSBwYWdlc19sb2NrIHRvIGF2
b2lkIGEgY2lyY3VsYXIKZGVwZW5kZW5jeS4KClNlY29uZCwgaXQgZHJvcHMgdGhlIGNhbGwgdG8g
cGFuZnJvc3RfbW11X3VubWFwKCkgd2hpY2ggdGFrZXMgc2V2ZXJhbApsb2NrcyBkdWUgdG8gcnVu
dGltZSBQTSBjYWxscy4gVGhlIGNhbGwgaXMgbm90IG5lY2Vzc2FyeSBiZWNhdXNlIHRoZQp1bm1h
cHBpbmcgaXMgYWxzbyBjYWxsZWQgaW4gcGFuZnJvc3RfZ2VtX2Nsb3NlKCkgYWxyZWFkeS4KCkZp
eGVzOiAwMTNiNjUxMDEzMTUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNlIGFuZCBzaHJpbmtl
ciBzdXBwb3J0IikKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5j
IHwgMTUgKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZ2VtX3Nocmlua2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtX3Nocmlua2VyLmMKaW5kZXggZDE5MTYzMmI2MTk3Li5jYzE1MDA1ZGM2OGYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hyaW5rZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKQEAgLTM2
LDE3ICszNiw2IEBAIHBhbmZyb3N0X2dlbV9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qgc2hyaW5rZXIg
KnNocmlua2VyLCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjCiAJcmV0dXJuIGNvdW50OwogfQog
Ci1zdGF0aWMgdm9pZCBwYW5mcm9zdF9nZW1fcHVyZ2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopCi17Ci0Jc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbSA9IHRvX2RybV9nZW1f
c2htZW1fb2JqKG9iaik7Ci0JbXV0ZXhfbG9jaygmc2htZW0tPnBhZ2VzX2xvY2spOwotCi0JcGFu
ZnJvc3RfbW11X3VubWFwKHRvX3BhbmZyb3N0X2JvKG9iaikpOwotCWRybV9nZW1fc2htZW1fcHVy
Z2VfbG9ja2VkKG9iaik7Ci0KLQltdXRleF91bmxvY2soJnNobWVtLT5wYWdlc19sb2NrKTsKLX0K
LQogc3RhdGljIHVuc2lnbmVkIGxvbmcKIHBhbmZyb3N0X2dlbV9zaHJpbmtlcl9zY2FuKHN0cnVj
dCBzaHJpbmtlciAqc2hyaW5rZXIsIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCiB7CkBAIC02
MSw4ICs1MCw4IEBAIHBhbmZyb3N0X2dlbV9zaHJpbmtlcl9zY2FuKHN0cnVjdCBzaHJpbmtlciAq
c2hyaW5rZXIsIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCiAJbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKHNobWVtLCB0bXAsICZwZmRldi0+c2hyaW5rZXJfbGlzdCwgbWFkdl9saXN0KSB7CiAJ
CWlmIChmcmVlZCA+PSBzYy0+bnJfdG9fc2NhbikKIAkJCWJyZWFrOwotCQlpZiAoZHJtX2dlbV9z
aG1lbV9pc19wdXJnZWFibGUoc2htZW0pKSB7Ci0JCQlwYW5mcm9zdF9nZW1fcHVyZ2UoJnNobWVt
LT5iYXNlKTsKKwkJaWYgKGRybV9nZW1fc2htZW1faXNfcHVyZ2VhYmxlKHNobWVtKSAmJgorCQkg
ICAgZHJtX2dlbV9zaG1lbV9wdXJnZSgmc2htZW0tPmJhc2UpKSB7CiAJCQlmcmVlZCArPSBzaG1l
bS0+YmFzZS5zaXplID4+IFBBR0VfU0hJRlQ7CiAJCQlsaXN0X2RlbF9pbml0KCZzaG1lbS0+bWFk
dl9saXN0KTsKIAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
