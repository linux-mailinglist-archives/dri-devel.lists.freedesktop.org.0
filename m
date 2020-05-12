Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E21D0B8B
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F0E6E2D6;
	Wed, 13 May 2020 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41CA6E854
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:33:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w19so7315130wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
 b=CFFfkHPeWAA6BWb6cFCjifEnJfjfyW8vqr5uZuCntCcA6PiJplULoRvFSupY7gbk2i
 W/hBRBIDIDH8dYhGpppydhOGeeDHR6G0rfEeKwaZFNtZkfRrv2i4wd2Yt3gpmA1PtbCL
 A/bzbOJbOehSlzuI9ZfXvQMrdgvMKWAVpz6SUyd6+ToP7RIds6fmAkDcyK6KMGsLwOev
 DaY3NTsrFW0bpILRbx64bx4W20dks7qPpLulwCNdFvtWrsJgyZaRSsNMJdzpjStm0YOJ
 PpvK2VVOruCqRzQxSoI93rCkDeoDEkhhyF1NLfWqV3L/plT/67JGqKsRayNoI0vMuJay
 BSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
 b=nm0neAK1mt0l1fPQkkLC3vfP2IVfRWnoh1rhWiwJL8kTuZMd0T+/M4sayYQYA6Ea1+
 nWmApxt+k9W5/7gl1+1mh6Yzvu57Xm5L3+sFA9AViWR736wlz9QMFFGyRYuz1BUw5Ay4
 4SXtpCQlXDLPdei7jmwa26WVbrGfYiZSPac03X6l/uD5f737E7G5hDbhdiJBeH7EH4B3
 90vuFR1xp2gHubNNRQog9dNcqYqxUjlh/1CJPyRPSnSSFl9GhYKrqfakmvznX/t3mwSc
 vkrWAeVTP7XzONlxieXwRlmPmMNznPxQ/W4QKHMQhJpztV/YxjwjqrcXAxBmmEOTz5tB
 QGVQ==
X-Gm-Message-State: AGi0PuYeRvCMYAi4IEjg2oGgsRFuGqLUhzyBIcBqTMP8hDe9N+VSxLBC
 9yG7E3QGfFoefVQV3dEUiarjlz3JqzU=
X-Google-Smtp-Source: APiQypJHlU7E9KgvyqCnZSJ9eLmQdj13uPEZz/FURvTrOPOTv+arPqj9HTfqURAv8oZpNu18CNr2DQ==
X-Received: by 2002:a1c:9ac3:: with SMTP id c186mr5172702wme.150.1589268815649; 
 Tue, 12 May 2020 00:33:35 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:35 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Tue, 12 May 2020 09:33:26 +0200
Message-Id: <20200512073329.742893-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSB2My4zLXY1LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgbGF5b3V0LgpDb250cm9sbGVycyBi
ZWZvcmUgdjMuMyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KCkZpeGVzOiAyN2M1
YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2Fk
Y29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYyOiBmaXggY29tbWl0IGxvZy4KCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwppbmRleCA2YTA4ZGQwN2IwNTguLjcyYjI2OGQ4ZTNh
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC02MDYsOCAr
NjA2LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBicmNtbmFu
ZF9jb250cm9sbGVyICpjdHJsKQogCX0gZWxzZSB7CiAJCWN0cmwtPmNzX29mZnNldHMgPSBicmNt
bmFuZF9jc19vZmZzZXRzOwogCi0JCS8qIHY1LjAgYW5kIGVhcmxpZXIgaGFzIGEgZGlmZmVyZW50
IENTMCBvZmZzZXQgbGF5b3V0ICovCi0JCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPD0gMHgwNTAw
KQorCQkvKiB2My4zLTUuMCBoYXZlIGEgZGlmZmVyZW50IENTMCBvZmZzZXQgbGF5b3V0ICovCisJ
CWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwMzAzICYmCisJCSAgICBjdHJsLT5uYW5kX3Zl
cnNpb24gPD0gMHgwNTAwKQogCQkJY3RybC0+Y3MwX29mZnNldHMgPSBicmNtbmFuZF9jc19vZmZz
ZXRzX2NzMDsKIAl9CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
