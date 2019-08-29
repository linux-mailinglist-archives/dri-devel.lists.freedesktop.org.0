Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D4A327A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4356E2C8;
	Fri, 30 Aug 2019 08:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF9B6E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 20:00:06 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n190so2170106pgn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S9d3dFoh7F6gGH5LTQyJ8UyxGo/MvVuvj+hyEE/NkTM=;
 b=kzXVDEKqfIxX9lb6MYvGjOUovOttmlF80niWrRjGpkUVMgaJoUlvr2MPB66kqH9daS
 ky6MHS+sMkf2nj+pSVHiaJWFMO22igK6fsWkBIzczDq804V5P6xVRPluSpD8UKZ6zGa0
 VdYXHCIVy3WriZv3xGa52Q3fksR9hHKUmvYiL4cZ1vTrS+To9PZS8EFaOkazN1iBcVG4
 5VIY+6ncSpljetvug28/rzmODToq9KenWhDDBViHHlpfQCLrDlxpmKXzWQ57wcutyVcJ
 j08RKiPvlrH0z0xaxasEI8V1Gs+v/m6EhxNbZonU+bqIbHgBO2iestim3IcIxDR4707d
 Otsw==
X-Gm-Message-State: APjAAAV5MGPwL5hiphK2NcEIk7xmcSYMvVttFyEyog2NwGkAZS98LrNi
 RBkAoRbyNklezPp7CZYYAg0wCQ==
X-Google-Smtp-Source: APXvYqwgfpvBc6rpBf/WbtITtoaWYyjizOJiXzMZpQhfc76Y+pvPxSdoJdzus+CAnHFnfaEjre9aBw==
X-Received: by 2002:a63:5951:: with SMTP id j17mr9734953pgm.143.1567108805398; 
 Thu, 29 Aug 2019 13:00:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id u7sm3053766pgr.94.2019.08.29.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 13:00:04 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.19.y 1/3] drm/bridge: tfp410: fix memleak in get_modes()
Date: Thu, 29 Aug 2019 13:59:59 -0600
Message-Id: <20190829200001.17092-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829200001.17092-1-mathieu.poirier@linaro.org>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S9d3dFoh7F6gGH5LTQyJ8UyxGo/MvVuvj+hyEE/NkTM=;
 b=CH3Z10dMKFNa5EUmXWfmO9kVZYBLmTzxs99xBrQZa34CnaWlLZ/e/TJGcWMmfgsVB6
 fbGWYVF61zStU3OZ3c4J09h572gEWcekJS9a9s1STntCydJRS4S+bJjKr1GFFPevhKjB
 uZXZuULcjvP9TNWnWZ5gUtJuhXkCpGo5Q1FylX1MGpXn4QIk5JEjXSX1Q1MWBWAsfSZh
 Y3XGxXaszNMDvWfih8zVS5X6l5P1jhp0JnKuzXXsLsas1cnOI0l6wWvsEjPjBR0TMyLp
 ZP5J3Hy4nDNsUH7UsCts6P9CduZTxfhth9z6VwRWe6YZX49SH0wun0MhB+e7V7D2e2kT
 LlUw==
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, vinholikatti@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCmNvbW1pdCBjMDhm
OTljMzkwODNhYjU1YTljOTNiM2U5M2NlZjQ4NzExMjk0ZGFkIHVwc3RyZWFtCgpXZSBkb24ndCBm
cmVlIHRoZSBlZGlkIGJsb2IgYWxsb2NhdGVkIGJ5IHRoZSBjYWxsIHRvIGRybV9nZXRfZWRpZCgp
LApjYXVzaW5nIGEgbWVtbGVhay4gRml4IHRoaXMgYnkgY2FsbGluZyBrZnJlZShlZGlkKSBhdCB0
aGUgZW5kIG9mIHRoZQpnZXRfbW9kZXMoKS4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC9tc2dpZC8yMDE5MDYxMDEzNTczOS42MDc3LTEtdG9taS52YWxrZWluZW5AdGkuY29t
ClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IGMzZTMyMTM4YzZiYi4uOWRjMTA5ZGYwODA4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAgLTY0LDcgKzY0LDEyIEBAIHN0YXRpYyBpbnQg
dGZwNDEwX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCiAJZHJt
X2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOwogCi0JcmV0
dXJuIGRybV9hZGRfZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOworCXJldCA9IGRybV9hZGRf
ZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOworCisJa2ZyZWUoZWRpZCk7CisKKwlyZXR1cm4g
cmV0OworCiBmYWxsYmFjazoKIAkvKiBObyBFRElELCBmYWxsYmFjayBvbiB0aGUgWEdBIHN0YW5k
YXJkIG1vZGVzICovCiAJcmV0ID0gZHJtX2FkZF9tb2Rlc19ub2VkaWQoY29ubmVjdG9yLCAxOTIw
LCAxMjAwKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
