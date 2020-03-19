Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5D18C142
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001D06EA69;
	Thu, 19 Mar 2020 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649D86EA66
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:24:51 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w4so4014975lji.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mqn+2M/Pdwz2D/rGtWBp7ZJpLibPqA1KGoTog7qIghc=;
 b=tWa4SOQv4gCBsM88gzqH/JwcBYIzBq25Gs241vugNNagxzy9x3eQCzawd/CLtAuPOw
 5bKU66FFSPuoR4jfWOwhHWaz1mD46mLQ7loUBS1Ow+pTAh/kaQ/KeTsIPty5DBbFGwxr
 fOhO21M07LrrzBOdsQabThOFKQhDZe9fc5CB7Wxw5jDTdKiiv8VAjMp9pGQkNqabcC0M
 eBv/qianbL1WmfDJN9NjQy1Z2Nrw66mLkU3zOSjvpFavNiESncf+XjxqxL1EDj69fy2w
 liPvyBQpkiPqqS8RwFPuMNUrde4vNYPIuhmr5Amo03g3Qg5JCMxEOqWCrLONvuhAqAHe
 Jg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mqn+2M/Pdwz2D/rGtWBp7ZJpLibPqA1KGoTog7qIghc=;
 b=O/WhemKwJAOiYKKWKYZGuuGEdplQ80Boyu+zQYf9LTfyjS2fjFkPe2kRflxc379QPs
 SZm56fJJjMI9rTXa63VvcopDp54NorUYfRd1Je+ynLQzJ1Tp2aXnzsEIjZxj4KNh/X4f
 kf0tiBEykhxNj8fqKQfirTsRTcjZyAmWcPXJWdueQnLuXMKdWLosg+XDzdjJ9c8tbfDd
 MVYGVkmhBcMUfIYvy6ImlLd8/2DcOWv92mNC9O8SaXP9aUnSKC8SVIXY/aEGXqY0Ws2C
 EhKmxPM0PqVX84QFZjuWf9/2XduywrLZSOi0eHM4mVaQDw6x5zD2LltQI0hRLeYxQ3GJ
 NN+Q==
X-Gm-Message-State: ANhLgQ2YY2McPpoN8/xUi2dADR1Uq/N56jW8HMTA6AdPgMYH1k7ZwVoy
 w3N6P1L4cbuWzc5X7kb3RlyUc3736PY=
X-Google-Smtp-Source: ADFU+vtDN8JExdC/Tcrzou2Pk/neMZqbeuP5mqL5iOJaf00G8v407fiaote9bqq9v4PlBzf+K7zdbg==
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr3117579ljl.48.1584649489379; 
 Thu, 19 Mar 2020 13:24:49 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:24:48 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/17] drm/vmwgfx: Also check for SVGA_CAP_DX before reading
 DX context support
Date: Thu, 19 Mar 2020 21:23:58 +0100
Message-Id: <20200319202414.9296-2-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319202414.9296-1-sroland@vmware.com>
References: <20200319202414.9296-1-sroland@vmware.com>
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
Lm9yZz4KU2lnbmVkLW9mZi1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIChWTXdhcmUpIDxyc2NoZWlk
ZWdnZXIub3NzQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggMDZkMjc2YzljYmUyLi4wZDVh
NDcyNTBkMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC04ODMsNyArODgz
LDcgQEAgc3RhdGljIGludCB2bXdfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dW5zaWduZWQgbG9uZyBjaGlwc2V0KQogCQl9CiAJfQogCi0JaWYgKGRldl9wcml2LT5oYXNfbW9i
KSB7CisJaWYgKGRldl9wcml2LT5oYXNfbW9iICYmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYg
U1ZHQV9DQVBfRFgpKSB7CiAJCXNwaW5fbG9jaygmZGV2X3ByaXYtPmNhcF9sb2NrKTsKIAkJdm13
X3dyaXRlKGRldl9wcml2LCBTVkdBX1JFR19ERVZfQ0FQLCBTVkdBM0RfREVWQ0FQX0RYQ09OVEVY
VCk7CiAJCWRldl9wcml2LT5oYXNfZHggPSAhIXZtd19yZWFkKGRldl9wcml2LCBTVkdBX1JFR19E
RVZfQ0FQKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
