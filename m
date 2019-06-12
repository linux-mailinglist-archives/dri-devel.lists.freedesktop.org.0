Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F95419F2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 03:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77D489218;
	Wed, 12 Jun 2019 01:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BBA89218
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:26:23 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n2so7944461pgp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UeBUMK8zne5r7f1B94AFloQ1yKIBEwqxYhdWNW1rcVE=;
 b=VCiQwkavKav2dflCZeQsPFUlf496Zm2vVtQsvx5nVXdLWDHZRYkNllXLKuElxmnIST
 vwR0KCpSxcOdyunnrqHb7lebpBpnOPUpGyf8qUc+omHpRyKFYB/eko8OQb4IrZTFKxH+
 2U7qZgxd1Suu6bLS1FcjLf1IavXkuWNvkjvTSNDPXdWqWwJh1v3lNpK9bwIUm4gR15Zh
 1/gMijTQJJ1wncg77gmXfTVUuiB1hCgTW+xzAn44IFWgrmTRqwW9/ctR9lGDTk+HmgsT
 ef3GAiz2txVx02QFWDi1HeCq0Pr79YodL1VZxT8iuEZ+xnBerZu8+w7TVlBDBYF5ec7F
 ZtWg==
X-Gm-Message-State: APjAAAURvv29a93HrDAFsOworHZ70yahpUXRQiY6OksfHF1iclVhW2eM
 u6SgYsi0AFzArbV/NBT0YWA=
X-Google-Smtp-Source: APXvYqyntFmaxAJbB17U4xr3GVjEA8ueDHeFxsQX18ZK8YIFTCP+Ma8Wk0S8hW5kzNdVIgLGkWK4ew==
X-Received: by 2002:a17:90a:5887:: with SMTP id
 j7mr9058636pji.136.1560302226962; 
 Tue, 11 Jun 2019 18:17:06 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-185-39.hsd1.ca.comcast.net.
 [107.3.185.39])
 by smtp.gmail.com with ESMTPSA id y22sm13257015pgj.38.2019.06.11.18.17.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:17:06 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 3/3] gpu: ipu-v3: image-convert: Fix image downsize
 coefficients
Date: Tue, 11 Jun 2019 18:16:57 -0700
Message-Id: <20190612011657.12119-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612011657.12119-1-slongerbeam@gmail.com>
References: <20190612011657.12119-1-slongerbeam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UeBUMK8zne5r7f1B94AFloQ1yKIBEwqxYhdWNW1rcVE=;
 b=Mc/O/i/G8dA9XR5Z2xuOdd78Q3EZA8MUm/uNTtjjqL7M9eg6OoaPGsm3+vX5liu8Eu
 OjaofnIGVXtsD846o0FACmuimMFXHM7GW8NNtNXbQkJuGLHCEAoHFxvY3cPW3eHif7mv
 rCh7+o9qUbJdHA63GM4lKNQXVZWl6FF6gUIwkYE+apHfaUJIm7rhwH99Tcc805aAf8Ad
 Wmm9UBPe0z9REZ10l5vmksImiWRxacTHAIOrYR7rU5KPpOc6DmNfO75z0k/g/gJWEJmB
 tcZiNGiayqBoTJd1l81xwR5dqG1SP0w0UVDu8/iYmV8+FEMWBYSNuT1/JCxkjuVqJ//n
 RS/A==
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX"
 <dri-devel@lists.freedesktop.org>, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG91dHB1dCBvZiB0aGUgSUMgZG93bnNpemVyIHVuaXQgaW4gYm90aCBkaW1lbnNpb25zIG11
c3QgYmUgPD0gMTAyNApiZWZvcmUgYmVpbmcgcGFzc2VkIHRvIHRoZSBJQyByZXNpemVyIHVuaXQu
IFRoaXMgd2FzIGNhdXNpbmcgY29ycnVwdGVkCmltYWdlcyB3aGVuOgoKaW5wdXRfZGltID4gMTAy
NCwgYW5kCmlucHV0X2RpbSAvIDIgPCBvdXRwdXRfZGltIDwgaW5wdXRfZGltCgpTb21lIGJyb2tl
biBleGFtcGxlcyB3ZXJlIDE5MjB4MTA4MCAtPiAxMDI0eDc2OCBhbmQgMTkyMHgxMDgwIC0+CjEy
ODB4MTA4MC4KCkZpeGVzOiA3MGI5YjZiM2JjYjIxICgiZ3B1OiBpcHUtdjM6IGltYWdlLWNvbnZl
cnQ6IGNhbGN1bGF0ZSBwZXItdGlsZQpyZXNpemUgY29lZmZpY2llbnRzIikKClNpZ25lZC1vZmYt
Ynk6IFN0ZXZlIExvbmdlcmJlYW0gPHNsb25nZXJiZWFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1p
bWFnZS1jb252ZXJ0LmMKaW5kZXggNGRmZGJkMWFkZjBkLi5lNzQ0ZjM1MjdjZTEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCkBAIC00MDAsMTIgKzQwMCwxNCBAQCBzdGF0
aWMgaW50IGNhbGNfaW1hZ2VfcmVzaXplX2NvZWZmaWNpZW50cyhzdHJ1Y3QgaXB1X2ltYWdlX2Nv
bnZlcnRfY3R4ICpjdHgsCiAJaWYgKFdBUk5fT04ocmVzaXplZF93aWR0aCA9PSAwIHx8IHJlc2l6
ZWRfaGVpZ2h0ID09IDApKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXdoaWxlIChkb3duc2l6ZWRf
d2lkdGggPj0gcmVzaXplZF93aWR0aCAqIDIpIHsKKwl3aGlsZSAoZG93bnNpemVkX3dpZHRoID4g
MTAyNCB8fAorCSAgICAgICBkb3duc2l6ZWRfd2lkdGggPj0gcmVzaXplZF93aWR0aCAqIDIpIHsK
IAkJZG93bnNpemVkX3dpZHRoID4+PSAxOwogCQlkb3duc2l6ZV9jb2VmZl9oKys7CiAJfQogCi0J
d2hpbGUgKGRvd25zaXplZF9oZWlnaHQgPj0gcmVzaXplZF9oZWlnaHQgKiAyKSB7CisJd2hpbGUg
KGRvd25zaXplZF9oZWlnaHQgPiAxMDI0IHx8CisJICAgICAgIGRvd25zaXplZF9oZWlnaHQgPj0g
cmVzaXplZF9oZWlnaHQgKiAyKSB7CiAJCWRvd25zaXplZF9oZWlnaHQgPj49IDE7CiAJCWRvd25z
aXplX2NvZWZmX3YrKzsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
