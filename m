Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C792D1901A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1EA6E41B;
	Mon, 23 Mar 2020 23:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CD6E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:12:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h15so7072592wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzveIRW2GmoBia4K/xiiAJEiKM6pSIRJP7YoEzWFeRE=;
 b=h7WliMMm4PC8gMhiCwxmdaDd0SHbwbhg+Y7xTbDp0c62/lcAIcPGUIzZxEuLgpYx/j
 xCKptRXPCV7zq2U6jbuBsOWc5egzd/uf8gFZDarPxsd9Ouz5RZi8TOIlPHPibCRiEgvB
 J504MQ7kQ0WIVdemcScU+nkmWCs/BdTUznnbq3yqG/anDrM6uf4LEkjWH0iQSmzs6mrU
 DPB3QMhqOAClzP5LNg6OwAzoJdHFHZOiEWdCnmITqtf08UKb0gzwl70FNGZJ0J7YloTk
 9MgKeXkLkQw8Mv8MwAQXQyE4+rRH1lYaJgqKDW47RFiMJImMJB+TvClXYblRM8YIe4bL
 MxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzveIRW2GmoBia4K/xiiAJEiKM6pSIRJP7YoEzWFeRE=;
 b=L1gQ2QBZerhUq0eo63zvI3j/vzPN6+Cp8IarEZc/HJy4S8zyg50uqB1M/HAj8ikMz0
 smMq7BvX/UIXFGi+/s49NL01dnalDXt2/2KXsXmpvH57lvou407RW6MA3vk1zLa8letP
 Orys52mkAoXvfYru2ZFlFkB2r90z7WUB9p5iUhOK1YM8MMt6vRI/B7ttlf/emyv1vG5K
 1rzQ/LGa748MnAZSOmkxRJQvjIlJ1fdEZm9IcTLAsTHK1D7tF1NZAMgTznehvdzed6KP
 3W3dAciXz1Y/uBG51RY6YZvNNrMFp9AhC3X7SrS8IHkVkuUn8CQo+D3HAZBJs4Y31MQw
 c/GQ==
X-Gm-Message-State: ANhLgQ1TyXt6zLp16/PsmX2ATaO4syTyvGxtP8Vp6pT6OjnrdJu5lsqq
 Rkzu0GEOokOvFjfireQmW6Cf0BQJ
X-Google-Smtp-Source: ADFU+vusBjx1BhrE8coOZ7R2W3UhBFIGnEfgQXWKb5HgwwlJRfyiBFRb+3tyFqvwLj1WwjZJpBjofw==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr10764442wrw.243.1585005163933; 
 Mon, 23 Mar 2020 16:12:43 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id b82sm1495262wmb.46.2020.03.23.16.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:12:43 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 01/17] drm/vmwgfx: Also check for SVGA_CAP_DX before
 reading DX context support
Date: Tue, 24 Mar 2020 00:12:22 +0100
Message-Id: <20200323231238.14839-2-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
References: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
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
