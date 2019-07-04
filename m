Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A15F3A0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFDB6E290;
	Thu,  4 Jul 2019 07:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190806E25C;
 Thu,  4 Jul 2019 05:52:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so4220687eds.8;
 Wed, 03 Jul 2019 22:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzHsVfpI34IYG5D0jQtkbgHPoBjsvNWNqyndhQSAU9M=;
 b=TKDEmoaU8uPUsQZEY/Pfg2Nj965BUZPRuM+oZdpZJzwN4YY+KLKRmSHUXs+EZJa+v5
 Rlj6yUMQ11MBv7S/se6SfM7qM9MOCuM2ShVHfeL1e1/GEIno1KFDpq1IfvvQGFbdo1kV
 dOS5y1TFXgy2FLlIX2fNzmf2+pKN4RmLmxZ6CdU+bEofq0xRSzDOu+UTK7Zqucx5Jrai
 1W8XilMVf3elFB09kQ+o46wy4mxM1TTIkANeUxbFiyoLrux47euMGSKK0V/FFVa6A9U1
 psNcHCz4ffCxI1t9lZSMayn1WlsUHxwjWCdPVR6gacP8MHCGrRZ+LMvKY2KvgFJqsVex
 Eiog==
X-Gm-Message-State: APjAAAXLInybuNymFlnANU4m3qm16n10Jw8dPH06UsimTZzbc/RI9dZQ
 gJgDaeSMxb3xMr+ttAp2jR0=
X-Google-Smtp-Source: APXvYqwFYrv5eXZXck3JkVT8qdGEMw5ozUGNhEk+KRFvqZ4OkLwZGS9mGnTiQdTrdefs/dFt8Tq6mA==
X-Received: by 2002:a17:906:9416:: with SMTP id
 q22mr37733050ejx.153.1562219568656; 
 Wed, 03 Jul 2019 22:52:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:48 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 2/7] drm/amd/powerplay: Use memset to initialize metrics
 structs
Date: Wed,  3 Jul 2019 22:52:13 -0700
Message-Id: <20190704055217.45860-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzHsVfpI34IYG5D0jQtkbgHPoBjsvNWNqyndhQSAU9M=;
 b=Km5gFDAIGiqRxX8AZ+jvqa6iEfdaxMBPKdgoPBf4kY9yM68/OKn8OsBp8g0DiCIsxX
 +WNqxpotA864maNIE1jUYuKd5icSwIXwdwge1btb9P6GHrkQxzXVIWpaSK3im63cZ7r5
 boQG+kz8yZe8kMaIfHCD+pbFgPU3SS7tWpjQPjc4zhpNZZlMP+n9gY+KEbEMrSN1e183
 7/X77+kGmZ+sLVOz+BFJfSqd6TV9BC1Kbq45CZcaw63RV1aRRvKdFXyQajIta+j7ZMGS
 nWAs59N930jc6q6LZzoOjRwMvJWYiYi0waGWikb+IYsEXFD0Pi9bgSHi3inhu3nG8giT
 lNRA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jOjYwMTozMzogd2FybmluZzoKc3VnZ2VzdCBicmFjZXMgYXJvdW5kIGluaXRpYWxp
emF0aW9uIG9mIHN1Ym9iamVjdCBbLVdtaXNzaW5nLWJyYWNlc10KICAgICAgICBzdGF0aWMgU211
TWV0cmljc190IG1ldHJpY3MgPSB7MH07CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAge30KZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L25hdmkxMF9wcHQuYzo5MDU6MjY6IHdh
cm5pbmc6CnN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBpbml0aWFsaXphdGlvbiBvZiBzdWJvYmplY3Qg
Wy1XbWlzc2luZy1icmFjZXNdCiAgICAgICAgU211TWV0cmljc190IG1ldHJpY3MgPSB7MH07CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHt9CjIgd2FybmluZ3MgZ2VuZXJhdGVkLgoKT25lIHdheSB0byBmaXggdGhlc2Ugd2Fy
bmluZ3MgaXMgdG8gYWRkIGFkZGl0aW9uYWwgYnJhY2VzIGxpa2UgY2xhbmcKc3VnZ2VzdHM7IGhv
d2V2ZXIsIHRoZXJlIGhhcyBiZWVuIGEgYml0IG9mIHB1c2ggYmFjayBmcm9tIHNvbWUKbWFpbnRh
aW5lcnNbMV1bMl0sIHdobyBqdXN0IHByZWZlciBtZW1zZXQgYXMgaXQgaXMgdW5hbWJpZ3VvdXMs
IGRvZXNuJ3QKZGVwZW5kIG9uIGEgcGFydGljdWxhciBjb21waWxlciB2ZXJzaW9uWzNdLCBhbmQg
cHJvcGVybHkgaW5pdGlhbGl6ZXMgYWxsCnN1Ym9iamVjdHMuIERvIHRoYXQgaGVyZSBzbyB0aGVy
ZSBhcmUgbm8gbW9yZSB3YXJuaW5ncy4KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8wMjJlNDFjMC04NDY1LWRjN2EtYTQ1Yy02NDE4N2VjZDk2ODRAYW1kLmNvbS8KWzJdOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgxMTI4LjIxNTI0MS43MDI0MDY2NTQ0Njk1MTc1
MzkuZGF2ZW1AZGF2ZW1sb2Z0Lm5ldC8KWzNdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTgxMTE2MTUwNDMyLjI0MDhhMDc1QHJlZGhhdC5jb20vCgpGaXhlczogOThlMWE1NDNjN2Ix
ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXQgY3VycmVudCBjbG9jayBmcmVx
IGludGVyZmFjZSBmb3IgbmF2aTEwIikKRml4ZXM6IGFiNDNjNGJmMWNjOCAoImRybS9hbWQvcG93
ZXJwbGF5OiBmaXggZmFuIHNwZWVkIHNob3cgZXJyb3IgKGZvciBod21vbiBwd20pIikKTGluazog
aHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTgzClNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgOCArKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggZTAwMzk3Zjg0YjJm
Li5mNWQyYWRhMDViYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKQEAgLTU5OCwxMiArNTk4LDE0IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50
X2Nsa19mcmVxX2J5X3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgICAgICBl
bnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKIAkJCQkgICAgICAgdWludDMyX3QgKnZhbHVlKQog
ewotCXN0YXRpYyBTbXVNZXRyaWNzX3QgbWV0cmljcyA9IHswfTsKKwlzdGF0aWMgU211TWV0cmlj
c190IG1ldHJpY3M7CiAJaW50IHJldCA9IDAsIGNsa19pZCA9IDA7CiAKIAlpZiAoIXZhbHVlKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAorCW1lbXNldCgmbWV0cmljcywgMCwgc2l6ZW9mKG1ldHJpY3Mp
KTsKKwogCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfU01VX01FVFJJQ1Ms
ICh2b2lkICopJm1ldHJpY3MsIGZhbHNlKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpAQCAt
OTAyLDEyICs5MDQsMTQgQEAgc3RhdGljIGJvb2wgbmF2aTEwX2lzX2RwbV9ydW5uaW5nKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogCiBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZmFuX3NwZWVkKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MTZfdCAqdmFsdWUpCiB7Ci0JU211TWV0cmljc190
IG1ldHJpY3MgPSB7MH07CisJU211TWV0cmljc190IG1ldHJpY3M7CiAJaW50IHJldCA9IDA7CiAK
IAlpZiAoIXZhbHVlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCW1lbXNldCgmbWV0cmljcywgMCwg
c2l6ZW9mKG1ldHJpY3MpKTsKKwogCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFC
TEVfU01VX01FVFJJQ1MsCiAJCQkgICAgICAgKHZvaWQgKikmbWV0cmljcywgZmFsc2UpOwogCWlm
IChyZXQpCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
