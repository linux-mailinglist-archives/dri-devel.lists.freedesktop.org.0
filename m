Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6D21E8CA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9489F6E8E3;
	Tue, 14 Jul 2020 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED796EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so5284066wrl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wIuyTvTvTJehZ+ep4u+btSK7FBgl8Se97pFISO/LVI=;
 b=m7n1kBQLnqX0x0Z7KrLWKLon0R/jEGObo3tJKl/M3JR8hO1NFX9rnFsRRlyfAAL8S8
 oIoC/bpgVvUID7qcVpfqmSRRV7vmDDdxUXOvRk1H+06seBYGR9oWV2dHbJ9IgbBzuDpR
 RVQ50jVglHfhFUgO6+tLYVwru6EAE00YPLHGiPfoXMgHq7WvkFhywyPKZ1ORe6OD9hpx
 2vtXnnxt4ulVkxs+SRpQMCwiebfSV4SxEolRJvg1pJrQO7FIHJDDZuXjU3sGX/doQnRr
 6EuD6+r+zLFPvRsQd3TvDNyJPC9VR2bU3cQgUm29daIpKMfANgXSW1Qv4L5QZXhO5Ql6
 nCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wIuyTvTvTJehZ+ep4u+btSK7FBgl8Se97pFISO/LVI=;
 b=dgl3rMrRJSqlLxdhx0auUEt+32N6T+v9HZMipDkAIwpUW6roniYOe3HTWukbFCr/pn
 24RVjxo8NgHsqD4AP8AR5itPpIrKzoj2MCWNIhTyTgCFiatssJBTZl/qSa6ZAGGahaco
 CfjdsKgQi7eNAXvdqpYAOFJxLgWS3fJdQeMpHrov2mzFA0MEsWY94R05Cgp17LHEM1DA
 nl1wxk50hyI6FAWmR36IOMz4FHjVCoZFu4JeGLtvJJBbnJkxkyYz1r3QLWezTibcZoe8
 89A4fmY7q44n2zlmGvylwukqnusN0GSUhJyL0FcZIeMIR2OOrwd83rZNav/YJt3zBDVE
 p/mg==
X-Gm-Message-State: AOAM531oetoWKCwzmhTJ7u27ElQbKXrCqF/xqn/8C7k+EmJynt0lVws8
 AdXzmdNAP86y3kVEAGyucRjtll21Uzw=
X-Google-Smtp-Source: ABdhPJyLvYZYbHbkm5E8+fZ5ImyFxvJCgcZRFEN/DyaV7WIJ2KvUwkLKLlR8oyebgiUcvxC2Od5cVQ==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr71801657wrv.394.1594374855952; 
 Fri, 10 Jul 2020 02:54:15 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 03/14] drm/panfrost: don't use pfdevfreq.busy_count to know
 if hw is idle
Date: Fri, 10 Jul 2020 11:53:58 +0200
Message-Id: <20200710095409.407087-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
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
