Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBA190185
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE016E3EF;
	Mon, 23 Mar 2020 23:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45D16E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:09:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b2so19243985wrj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzveIRW2GmoBia4K/xiiAJEiKM6pSIRJP7YoEzWFeRE=;
 b=XgSxhNb2pY2OvNhze0kvBTzsnFOsxAPvZWPTD7NKHhuBMM2oZHchveMbqHP1hQa12j
 wRbIlPJPuE9I4r+kRbu2i31WIjrWt5OSbI5cQkA8/nQwI8V+Ur0t0MJZRJlr6Be6gU4e
 9V3GtgRPiViWqn4+zSR1vjXeIKeC69RwJBDkpfEACuh/ybCcgOnpr58sLN2CSQDJiRSb
 6fYe8iPuhaDEInLVKNUA0An2AzPxKU7AsS2ZT/ctA4JElwjQlSqyeEGNBUvd1YL2Nm1o
 wUS1h5/kmBLQM+oXlsgsM51KeUje3UPKv0Z5z2oXjX/q9715EssnzexbWpue0zP2gjFA
 Pozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzveIRW2GmoBia4K/xiiAJEiKM6pSIRJP7YoEzWFeRE=;
 b=o7ZE16mfpmFH9YkGbCF9/56eWmT5bmnYnxAqRiSBGamqCO993UxfFoFDbpsiUup2fH
 LZJI7/eNAaDNYYh9NmIq7EKKLXcBg/24TE6z38I9tMetYQqoX1yZ0WFlaq3/mP5kfrv/
 iK4XioHu5S4jJylfOYphSwFja9/4UmL1ftZ9iZjE1PQzpnhGZaIQQCpPRDyALli2SCiv
 egl/BXJcLnQgrluOLmmMTPOfRoVL7OlfA68M/sBKKBcGH2cXc4fY11OlozviVHx566zi
 SuSc4ABYmwI1Xm3xbtfPxc4bLYnz2XeTYeYHW5Jt87DzKWThY1gIQ9VIr/AGVEwBNW6O
 3APg==
X-Gm-Message-State: ANhLgQ0F95StmhqdxqTobt1YmPw/IqZnBdUD/4WEsBFIe36a5sX0QvYI
 S5mGpTxkCntWeV94uV4DmFjGu1oS
X-Google-Smtp-Source: ADFU+vtEPRZ6WwphyfdxZBZ/lj0m+hLzWREVkJuv5/gQJDGqjs0A6ofeEsSFEGnmZWhn033Ppxxi1g==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr4465510wrl.278.1585004947054; 
 Mon, 23 Mar 2020 16:09:07 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id q185sm1641937wme.10.2020.03.23.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:09:06 -0700 (PDT)
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
X-Google-Original-From: Roland Scheidegger <sroland@vmware.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 01/17] drm/vmwgfx: Also check for SVGA_CAP_DX before
 reading DX context support
Date: Tue, 24 Mar 2020 00:08:45 +0100
Message-Id: <20200323230901.13302-2-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323230901.13302-1-sroland@vmware.com>
References: <20200323230901.13302-1-sroland@vmware.com>
MIME-Version: 1.0
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKVmlydHVhbCBkZXZp
Y2UgY29uc2lkZXIgU1ZHQV9DQVBfRFggYW5kIFNWR0EzRF9ERVZDQVBfRFhDT05URVhUCmluZGVw
ZW5kZW50IG9mIGVhY2ggb3RoZXIuIFNvbWUgb2YgdGhlIGNvbW1hbmRzIGluIGNtZF9idWYgZGVw
ZW5kcyBvbgpTVkdBX0NBUF9EWCwgc28gYmV0dGVyIHRvIGNoZWNrIGZvciB0aGF0IGFzIHdlbGwu
CgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSA8dGhvbWFzX29zQHNoaXBtYWls
Lm9yZz4KUmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMKaW5kZXggNGY1ODM2NDQyMWNlLi5mOTc2ZGFiZTE4ZGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC04ODMsNyArODgzLDcgQEAgc3RhdGljIGludCB2bXdf
ZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBjaGlwc2V0
KQogCQl9CiAJfQogCi0JaWYgKGRldl9wcml2LT5oYXNfbW9iKSB7CisJaWYgKGRldl9wcml2LT5o
YXNfbW9iICYmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYgU1ZHQV9DQVBfRFgpKSB7CiAJCXNw
aW5fbG9jaygmZGV2X3ByaXYtPmNhcF9sb2NrKTsKIAkJdm13X3dyaXRlKGRldl9wcml2LCBTVkdB
X1JFR19ERVZfQ0FQLCBTVkdBM0RfREVWQ0FQX0RYQ09OVEVYVCk7CiAJCWRldl9wcml2LT5oYXNf
ZHggPSAhIXZtd19yZWFkKGRldl9wcml2LCBTVkdBX1JFR19ERVZfQ0FQKTsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
