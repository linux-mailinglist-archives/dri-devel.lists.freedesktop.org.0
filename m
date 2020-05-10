Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CF1CD257
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE456E228;
	Mon, 11 May 2020 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906FD89F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m12so10523215wmc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSgv1QfgHBl9OVDnkQxlixfpsorIFLdZ30raefsXV+Y=;
 b=XyIHXFLdPmo8XDR2EbD3f4LZKJvpR5nEjFLo2fHm7OiGnG1ZLTm7Y0Oqst5lSmU0QS
 /y7AqDLRzclVlEMWXeq0rjRPYYkoOo7zwaS+KEkf6uXXNZINFC/4iPQhjuo2BnMETZzE
 wSYI/AcnCrIDVX0B7UbmAFsZXGSIsk81fU6g++gjF0nWQnqsCb5ydFeApKAzvuC0FeXx
 N+NL+tZ0IgmH1OvNDxVj1EOQhq3VpgJsJtAY+mgxn97HB2ZXVdl+eGZeBQyDurOC+x63
 SbyHVZN1A7Daz0F5JS1Vi6kJ8PbJW8mqh7aZ3s80bL5i9DjpNvzRKN0f6IEBH0yADLiQ
 P8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSgv1QfgHBl9OVDnkQxlixfpsorIFLdZ30raefsXV+Y=;
 b=tKhqelprqaZ7aqm27/k93sbpAHeoQl4ENZaB46f0olycN4mckaYuuRTzBwVOvkr9g5
 Sa1OfgLBImsKM7KDP6cv4mnIENRtAh2R4c4p26YvPt95yBLRGH1HGUp2FnM4S5rpjx8R
 1GcMg4D3UXBbM8C01pzQm3CkD9sVt0nJtsXIk2y67jYRYqjWcUXiPGqAQe095IPZN+S/
 s20pYxxKSUcgJkxAdabKHfWObOa6s9F8Az9H05ef1Jst6kSnta8Cv95A6LMMkJl2+Bk5
 PvSe+BDe6d9dCto6L3bWCUMyiOi5nXWnWAwUaOHmHvY1l54cMnE0tQFavzNdmJ6/30/s
 rl+A==
X-Gm-Message-State: AGi0PuYC9QReNSM+EQ8xRJ9de4V/q0icc+H8bVbvoFaOXzZ8x7oq1ksP
 CARK4RHU3cd/gi0HucRtIK8=
X-Google-Smtp-Source: APiQypIWZQXaykOe/sU/+MafA9q+T0VrOldhVw/hxI89FHnJ1WJoeR0FXFCU0WtQj9v6kb2KkDqi7w==
X-Received: by 2002:a05:600c:3cd:: with SMTP id
 z13mr7798860wmd.159.1589129745048; 
 Sun, 10 May 2020 09:55:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 03/15] drm/panfrost: don't use pfdevfreq.busy_count to know if
 hw is idle
Date: Sun, 10 May 2020 18:55:26 +0200
Message-Id: <20200510165538.19720-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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

VGhpcyB1c2UgZGV2ZnJlcSB2YXJpYWJsZSB0aGF0IHdpbGwgYmUgbG9jayB3aXRoIHNwaW5sb2Nr
IGluIGZ1dHVyZQpwYXRjaGVzLiBXZSBzaG91bGQgZWl0aGVyIGludHJvZHVjZSBhIGZ1bmN0aW9u
IHRvIGFjY2VzcyB0aGlzIG9uZQpidXQgYXMgZGV2ZnJlcSBpcyBvcHRpb25hbCBsZXQncyBqdXN0
IHJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIHwg
NCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggNzkxNGIxNTcwODQxLi42M2UzMmE5ZjI3NDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTU4MSwxMCArNTgxLDYg
QEAgaW50IHBhbmZyb3N0X2pvYl9pc19pZGxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCXN0cnVjdCBwYW5mcm9zdF9qb2Jfc2xvdCAqanMgPSBwZmRldi0+anM7CiAJaW50IGk7CiAK
LQkvKiBDaGVjayB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpcyBpZGxlICovCi0JaWYgKGF0b21pY19y
ZWFkKCZwZmRldi0+ZGV2ZnJlcS5idXN5X2NvdW50KSkKLQkJcmV0dXJuIGZhbHNlOwotCiAJZm9y
IChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykgewogCQkvKiBJZiB0aGVyZSBhcmUgYW55
IGpvYnMgaW4gdGhlIEhXIHF1ZXVlLCB3ZSdyZSBub3QgaWRsZSAqLwogCQlpZiAoYXRvbWljX3Jl
YWQoJmpzLT5xdWV1ZVtpXS5zY2hlZC5od19ycV9jb3VudCkpCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
