Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329F21E942
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257FE6E919;
	Tue, 14 Jul 2020 07:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B06E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:25:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s10so5163151wrw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wIuyTvTvTJehZ+ep4u+btSK7FBgl8Se97pFISO/LVI=;
 b=hkFT/OKKaCVHN11jflC/fdm+RLpdfEW5QzjKHoRIV83mbHg0kxzBgflvSleihR1y3C
 IL77si70ouX8ODvCbisl4SEzwfXpAbk5C37LoWPUSGT52UzRQfnpiI2funI5ZDtgLxl+
 qfSE1wpoO3i5thBjaC1/rh5xZ39v1P/yRWx1PaQhggyZMpVyLD/DpeFqZAzVpUDNMIPx
 gwBaYwV6Ti3xpX5DTmnppuh+8T4HgrYnz56IL48KE6/0uY5nA8Tc54jsl1f+Wa2yalQD
 00RZwn6eESTl/qmuF2Bc3TmceHPg/zFr2GGwdbKNHat5ymFfYLm0l8wB3LziB0utQBsc
 f1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wIuyTvTvTJehZ+ep4u+btSK7FBgl8Se97pFISO/LVI=;
 b=DC6J0YeuvUV2B5gW5AGnC2nDUW45s0L2wtBu7bixOlf7QH057sRn+5clpmoyOg/Sy4
 B+KCe3XKr6ytP0pljU89i2ZBSBnw6v6R3AyBTb+RghDCpS5yCVYWXIenrMacpKJQhICr
 awSIN2IsaLZm6y1TaEdJ4vyTKqOIBal6FvNfsgc7WVimbMtC3DBJ96vClrhaqh10MaDG
 5bPk6F7QcRmk07nyjB82nMvxH2YgKQSv46KXVauzsgSOjJX+3oCsiTKLRd4sFNJHBufA
 qG30vs6v5k8Dja0Z0Pc//EUjs4wkwHY0AJ/lPy4JJDQwIpw9PmU0vIn84r55Icrq0/1I
 je4Q==
X-Gm-Message-State: AOAM531H69YNPc8tWj36gJg4eoBCYIsfYeBrqLxuhgRO53CwyA1TmFiD
 UnZ17c6UH/+3DvYKz0m37nQ=
X-Google-Smtp-Source: ABdhPJyGC3VRr1XqdZe9/UFYTPcwbWdNcHpTpKQDrfBZtF31oThwz+2jQt6IrAk+oh/6dpsYTbhH8Q==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr67154778wrm.193.1594373155819; 
 Fri, 10 Jul 2020 02:25:55 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:25:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 03/14] drm/panfrost: don't use pfdevfreq.busy_count to know
 if hw is idle
Date: Fri, 10 Jul 2020 11:25:37 +0200
Message-Id: <20200710092548.316054-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
IHJlbW92ZSBpdC4KClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPgpSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNv
bGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIHwg
NCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggMzYwMTQ2ZjZmM2Q5Li40YzEzZGJhZTY4ZmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTU4MSwxMCArNTgxLDYg
QEAgaW50IHBhbmZyb3N0X2pvYl9pc19pZGxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCXN0cnVjdCBwYW5mcm9zdF9qb2Jfc2xvdCAqanMgPSBwZmRldi0+anM7CiAJaW50IGk7CiAK
LQkvKiBDaGVjayB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpcyBpZGxlICovCi0JaWYgKGF0b21pY19y
ZWFkKCZwZmRldi0+ZGV2ZnJlcS5idXN5X2NvdW50KSkKLQkJcmV0dXJuIGZhbHNlOwotCiAJZm9y
IChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykgewogCQkvKiBJZiB0aGVyZSBhcmUgYW55
IGpvYnMgaW4gdGhlIEhXIHF1ZXVlLCB3ZSdyZSBub3QgaWRsZSAqLwogCQlpZiAoYXRvbWljX3Jl
YWQoJmpzLT5xdWV1ZVtpXS5zY2hlZC5od19ycV9jb3VudCkpCi0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
