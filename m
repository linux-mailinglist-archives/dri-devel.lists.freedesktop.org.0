Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC0101AFC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204FB6EB90;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187136E826
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t5so20467159ljk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QyTaXEZ3tQr6gf1Qv+aBwt97ClEn/+4wm6FeUO95GEc=;
 b=pDUEqJJQag6+v08YN5Z4i4xNgqNQ+zPSnljdPqYSOTa+QPHJ8pX5aQNHjIS2OJnFkn
 3bD3OyKsWgHGMh2dTLM6ys3yn4/tmuLMuG7kTh97SvOu88OMYiSCDg7KFydKhOq+7nHS
 WFy/72jdyTcB+Y9y/QORb1Ew47LBnHebVgSBcnhCqpwpcm9HU9kKSbvSpiCta7QPa7aA
 ZHAsXPAU6oiUdZUazQRpBMbQEg9BuWKfw6Oug8Er3hMIfKARw2SmhaXcA+1IiYJJ831r
 99Jxv2yxdFsBOunuE3FcbgVE/ZCD++W6AWK9kw32xUSR82MYXo2EpJ15+cNbM4+RYbTk
 kWSA==
X-Gm-Message-State: APjAAAUs1XW1lWbERZKTWlvxn5I9jgZ37KYVfuk699QlPQZp9yJvXy5M
 4ra9190iIS+mk85Jezk1Lxk=
X-Google-Smtp-Source: APXvYqxzajfDxRsiMW98EBWaSsQPOP+h84fAddaOImVLVQhLDtN+yixqM2y+1kQbQvnGBDX3bmAHIA==
X-Received: by 2002:a05:651c:331:: with SMTP id
 b17mr890995ljp.133.1574107555600; 
 Mon, 18 Nov 2019 12:05:55 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:55 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 25/29] drm/tegra: dc: Release PM and RGB output when
 client's registration fails
Date: Mon, 18 Nov 2019 23:02:43 +0300
Message-Id: <20191118200247.3567-26-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QyTaXEZ3tQr6gf1Qv+aBwt97ClEn/+4wm6FeUO95GEc=;
 b=DwLNp0YwsQKuC9IcpcWDPUPMzmzkWJvboxFQdmvJYossT+E0yerpmntNXmzqiPEHlR
 URDoWmUIV9a6WWkmQKy0yjo777OC4xfq5TVk6hZfUo8II/1Ox20SO/ANeevsBFtTou7V
 zH4tV7JS7IkK/GpWnNdrOyslCZwwKtg75gW4MzkHhKyFoomAUu3Gt9CknsC4YuRAABSv
 1UkrNU60BC+M23SBhiu1Hx5yQ5Pc9mKnZawkeRW+jBU4SEQEgwu2eDMC7TzDXgWdq4RW
 7vrAF36bToZJin/g/l1lL/9OvnnrHePbJkT50OC53vk2HMvwY+B1JgTD18jAuIu2id/k
 WUVw==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UnVudGltZSBQTSBhbmQgUkdCIG91dHB1dCBuZWVkIHRvIGJlIHJlbGVhc2VkIHdoZW4gaG9zdDF4
IGNsaWVudApyZWdpc3RyYXRpb24gZmFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCA4
ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYwppbmRleCAxNDgzNGNiYTU0NTUuLmMyYzYxMTU2Y2RjZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RjLmMKQEAgLTI1MDQsMTAgKzI1MDQsMTYgQEAgc3RhdGljIGludCB0ZWdyYV9kY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChlcnIgPCAwKSB7CiAJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBob3N0MXggY2xpZW50OiAlZFxuIiwKIAkJ
CWVycik7Ci0JCXJldHVybiBlcnI7CisJCWdvdG8gZGlzYWJsZV9wbTsKIAl9CiAKIAlyZXR1cm4g
MDsKKworZGlzYWJsZV9wbToKKwlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7CisJdGVn
cmFfZGNfcmdiX3JlbW92ZShkYyk7CisKKwlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMgaW50IHRl
Z3JhX2RjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
