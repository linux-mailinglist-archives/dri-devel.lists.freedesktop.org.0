Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FC215315
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D3D6E2B8;
	Mon,  6 Jul 2020 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471EE6E3F7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z2so13055973wrp.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtYpmlK0sBLIGu+jD6jSIfVxQzKUKkc64VLLUVnW2E0=;
 b=qNFNgYAd58cWTopWsCnVpN6KF4hgB35zsvk6rweB2geap+2a/hZHA4uMl6E/nhyVcz
 4ypnl0H+eZ43sMPKGNvmbbssEXLnVdNP87/3ePmLXVN3fjJ7dBtESN0y6eZgz/eW5wmF
 D8m38BQ7KY6+zDcy3BkKBdVqRbWTVtxZd2KIOEpCgimRHWJhRsacbK1tBOENgfk557hF
 BOagm7Vf7N1RO3OOeVg5Ld4aYv490y6kKN94T2AjBJ1Cw/Q0c8EKUkwbKV+50Gyz6zZu
 zVZrjvDEvR66R7ATN6aQmSk1hr3Iw9rizpE1dlrX3vUob8+6+iU7sgzkRYRBYnzOke+h
 NsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtYpmlK0sBLIGu+jD6jSIfVxQzKUKkc64VLLUVnW2E0=;
 b=i5YNudSeB9qpsnY28cAWqCcbqxibj15BXOJoYl6GJsGYVY+aoTAZl4LruUrCC6lVqI
 bOwHYqK5pQT48UO7nqSXzASr4h3Z7iF0Aauan7kr5sl37YeGKQdGcBTtEJ0zWjUHWbCD
 +6gkAtaN9pTNDXh95UqAHdh5eD8BcYio4LGQ5RHZOqYUXedKZ1lF80cE9Mv2ZMP+Vhvn
 gitX7Bq0D8T8Bf6TrqUlvS/Fld6a2S2tfj5qsUZBat+CRyaFxtFppqCcRBC8mtS8wDOz
 rzDjR32Jev1edkx3rUizdGm1d1We0FzLvrtwX3SA4lsotZBEtQ76snwV1LgDzyJHWj5E
 XmfQ==
X-Gm-Message-State: AOAM533Fyoh8HPerglUJvSSbHA8wqi20jBXMuU2Dnt5b4RlXSe/We3pD
 bNDzyZmtnCy4Ih77wjhiS1k=
X-Google-Smtp-Source: ABdhPJy/tukX+K79X4Pugp0jciTOgHL2tsymvPVNBkXelV2FU7kvRasFKCl5O0QlvUUsoGSmQgxY2w==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr39485996wrs.36.1593858348780; 
 Sat, 04 Jul 2020 03:25:48 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 06/14] drm/panfrost: properly handle error in probe
Date: Sat,  4 Jul 2020 12:25:27 +0200
Message-Id: <20200704102535.189647-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50cm9kdWNlIGEgYm9vbGVhbiB0byBrbm93IGlmIG9wcCB0YWJsZSBoYXMgYmVlbiBhZGRlZC4K
CldpdGggdGhpcywgd2UgY2FuIGNhbGwgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKCkgaW4gY2FzZSBv
ZiBlcnJvcgphbmQgcmVsZWFzZSB3aGF0IGhhcyBiZWVuIGluaXRpYWxpc2VkLgoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDI1ICsrKysrKysrKysrKysrKystLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCB8ICAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA3ODc1M2NmYjU5ZmIuLmQ5
MDA3ZjQ0Yjc3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jCkBAIC0xMDEsNiArMTAxLDcgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAkJcmV0dXJuIDA7CiAJZWxzZSBpZiAocmV0KQogCQly
ZXR1cm4gcmV0OworCXBmZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2FkZGVkID0gdHJ1ZTsKIAogCXNw
aW5fbG9ja19pbml0KCZwZmRldmZyZXEtPmxvY2spOwogCkBAIC0xMDksOCArMTEwLDEwIEBAIGlu
dCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJ
Y3VyX2ZyZXEgPSBjbGtfZ2V0X3JhdGUocGZkZXYtPmNsb2NrKTsKIAogCW9wcCA9IGRldmZyZXFf
cmVjb21tZW5kZWRfb3BwKGRldiwgJmN1cl9mcmVxLCAwKTsKLQlpZiAoSVNfRVJSKG9wcCkpCi0J
CXJldHVybiBQVFJfRVJSKG9wcCk7CisJaWYgKElTX0VSUihvcHApKSB7CisJCXJldCA9IFBUUl9F
UlIob3BwKTsKKwkJZ290byBlcnJfZmluaTsKKwl9CiAKIAlwYW5mcm9zdF9kZXZmcmVxX3Byb2Zp
bGUuaW5pdGlhbF9mcmVxID0gY3VyX2ZyZXE7CiAJZGV2X3BtX29wcF9wdXQob3BwKTsKQEAgLTEx
OSw4ICsxMjIsOCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2KQogCQkJCQkgIERFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORCwgTlVMTCk7
CiAJaWYgKElTX0VSUihkZXZmcmVxKSkgewogCQlEUk1fREVWX0VSUk9SKGRldiwgIkNvdWxkbid0
IGluaXRpYWxpemUgR1BVIGRldmZyZXFcbiIpOwotCQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJs
ZShkZXYpOwotCQlyZXR1cm4gUFRSX0VSUihkZXZmcmVxKTsKKwkJcmV0ID0gUFRSX0VSUihkZXZm
cmVxKTsKKwkJZ290byBlcnJfZmluaTsKIAl9CiAJcGZkZXZmcmVxLT5kZXZmcmVxID0gZGV2ZnJl
cTsKIApAQCAtMTMxLDE1ICsxMzQsMjUgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAkJcGZkZXZmcmVxLT5jb29saW5nID0gY29vbGlu
ZzsKIAogCXJldHVybiAwOworCitlcnJfZmluaToKKwlwYW5mcm9zdF9kZXZmcmVxX2ZpbmkocGZk
ZXYpOworCXJldHVybiByZXQ7CiB9CiAKIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCXN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxICpw
ZmRldmZyZXEgPSAmcGZkZXYtPnBmZGV2ZnJlcTsKIAotCWlmIChwZmRldmZyZXEtPmNvb2xpbmcp
CisJaWYgKHBmZGV2ZnJlcS0+Y29vbGluZykgewogCQlkZXZmcmVxX2Nvb2xpbmdfdW5yZWdpc3Rl
cihwZmRldmZyZXEtPmNvb2xpbmcpOwotCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKCZwZmRl
di0+cGRldi0+ZGV2KTsKKwkJcGZkZXZmcmVxLT5jb29saW5nID0gTlVMTDsKKwl9CisKKwlpZiAo
cGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQpIHsKKwkJZGV2X3BtX29wcF9vZl9yZW1vdmVf
dGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOworCQlwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRl
ZCA9IGZhbHNlOworCX0KIH0KIAogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5oCmluZGV4IDMzOTJkZjEwMjBiZS4uMjEwMjY5OTQ0Njg3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKQEAgLTE1LDYgKzE1LDcgQEAg
c3RydWN0IHBhbmZyb3N0X2RldmljZTsKIHN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxIHsKIAlzdHJ1
Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKIAlzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY29v
bGluZzsKKwlib29sIG9wcF9vZl90YWJsZV9hZGRlZDsKIAogCWt0aW1lX3QgYnVzeV90aW1lOwog
CWt0aW1lX3QgaWRsZV90aW1lOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
