Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBEB3D3D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D090E89A0E;
	Mon, 16 Sep 2019 15:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189C6E9C7;
 Mon, 16 Sep 2019 15:04:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g12so368329eds.6;
 Mon, 16 Sep 2019 08:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfPuDIoqxO+EfcdiH09cBQD3cfw36Vn5aZ4Gj9bKPZ0=;
 b=cE7fY5+ZoWuq+NhD4jykNlAdslwCXEuNfOYzHtxKlvkYr9lsGMD2YCFzHVndU48Gj9
 QraSIw67I+H7ZnJGADJQGfRkIMCT2ClND4VYpx1DFJatcTgN4GLrB+9I8DEBIctSK25c
 vLVefRPURWt7owtgxTo0TbXvCICYtuU096yvk8zIWoLiq33Xns6WLqUWravIREAbs09o
 GBSTjj9ghg4zzE/uxsqf35ab7ED0PQa2YeLTbKwbkRhzNsslxLcwRrlZqmmcRAN2keXE
 PMdorvHVu8exlPXj+IzvZowlhfnTekOgFOwPE6qZmV6F4SDVdSlby4N3uxeJjzcYEGxn
 UWHg==
X-Gm-Message-State: APjAAAXKsHwhiretGaSHhbzvWCH5KTE4fi0TfKGAxu7aSbfRm2qdKs00
 lmoWX0bXDqurEqUMA6YvnGE=
X-Google-Smtp-Source: APXvYqwlEh/FpKENN0bXpEVTQdvK5Ztr+FswlhvtQ97kRq0zXB5kH9rjGzIek18E7lo9cP4Uc8MqCA==
X-Received: by 2002:a50:d903:: with SMTP id t3mr60797258edj.117.1568646278358; 
 Mon, 16 Sep 2019 08:04:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v10sm7145413eds.75.2019.09.16.08.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/11] arm64: tegra: Enable GPU on Jetson TX2
Date: Mon, 16 Sep 2019 17:04:11 +0200
Message-Id: <20190916150412.10025-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfPuDIoqxO+EfcdiH09cBQD3cfw36Vn5aZ4Gj9bKPZ0=;
 b=e0E6VXzD2e/fPg3Y87nQDpYT5oK/vPxEeE74u2xzyIzPxkVXqyywLX+pyTBXsO3jF/
 fVceGThyKfx259zBhRYDHFnSodJidqwuR4rAivSIALDdwHo9vkrZ5mg31zQIw3S/hwdv
 HmeC6UhF+sMMrW0kLt9Zu2GNv0VVpYOjYTN2xsQs0jO+jgVwavdkxMRbANdRwsV0OrJO
 Fj7+/WRMzpIRI5isY3ntRFBysuu0w3doaJClz5feYyh/T9VmUvYUicluEvnFnIzU2nPQ
 qUPn/eIorX0s/HKEgla8LPxZC032W7xLYcg6h3dRXjZ5XuUhbJLhV/WyJ7RZonn8f4Wi
 x1ew==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+CgpFbmFibGUgdGhl
IEdQVSBub2RlIGZvciB0aGUgSmV0c29uIFRYMiBib2FyZC4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5
IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMTg2LXAyNzcxLTAwMDAuZHRzIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVn
cmExODYtcDI3NzEtMDAwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4
Ni1wMjc3MS0wMDAwLmR0cwppbmRleCBiZGFjZTAxNTYxYmEuLjZmN2M3YzRjNWMyOSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYtcDI3NzEtMDAwMC5kdHMK
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYtcDI3NzEtMDAwMC5kdHMK
QEAgLTI3Niw2ICsyNzYsMTAgQEAKIAkJfTsKIAl9OwogCisJZ3B1QDE3MDAwMDAwIHsKKwkJc3Rh
dHVzID0gIm9rYXkiOworCX07CisKIAlncGlvLWtleXMgewogCQljb21wYXRpYmxlID0gImdwaW8t
a2V5cyI7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
