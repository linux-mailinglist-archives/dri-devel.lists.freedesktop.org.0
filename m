Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E07190194
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449B96E40A;
	Mon, 23 Mar 2020 23:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AA6E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:09:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b2so19244159wrj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7j0POb67yVdjJHUMnszVMGuzUGSS2UUHRAp7ly5hz+s=;
 b=A6/styuq91tkwK+Erf0/Ws4pZNyGZawSMFnVme3cxPntCqZ/negRVVR6aT3F903hBk
 f5zXh8qPnMOxcqg52lkADlIUo2muWF22fjLjwe+C3oQmQmnLt3b+wSyljLPe8CRxzexZ
 ZXitT+1ZzeYf4W9xVBNE2odkPMzdybCy8LgZ1Nju+1S1DsK1ngiK7lIcfhoFA/h7B5DK
 V4TOgUGf/zeYxGwXZVpkIr6IGvUloBhuNhrSdCdwA7k/pW+7ralLP8QUp2Ng0JDpq2wA
 T8mS5WN+bKs4iOIo75wZXae7aip8Vcie0BTDdwzGCm8++LHAT2uUHA9xhVKZTqUPvK0e
 tQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7j0POb67yVdjJHUMnszVMGuzUGSS2UUHRAp7ly5hz+s=;
 b=UpzWSy6omefBrWOXEoPbgXXWMfIDVYcQf9UrBKSD69YV0X3GIVG+uzegNChF6bAbbl
 7yGTFwUTOQOWHA3YsfYIy2lDbLpkzBZqdwgPAhgQ6gYjChvJvLExz+MO8/tcePI2W9PP
 uvCiWYGSlxmFCpL81KmTF5DEhsaIHiXnau41ArppakGvOb+1e17brRfbyre3a0N3pj3f
 OcrrgMojREobEjYBsXzf1y97/GNp+E6NP24MI9AYxYpIXnF5mGC5VvJpXWaw2JD8dV8g
 jz0wBymXZW/Dv7lilcBROLT2wU6YsyneFp1zWCobOoS3d2Ft+0IQd4llqUAQYgf8O8CO
 lvRA==
X-Gm-Message-State: ANhLgQ0+gurZFXlaS/cDPWSdjjX/FzmXHybLUNwhwzrmAc6k+KEYnWzS
 J2AB6Qw4PudHX91ILwLNP+bxfH4l
X-Google-Smtp-Source: ADFU+vv/Sx29zcMtbUaA2D6Jh62NLScA9Cr3QtusYjLEcv/wsR91iC4VzvyYHRRJ7tgQufFSjPzIww==
X-Received: by 2002:adf:de01:: with SMTP id b1mr7168982wrm.376.1585004953068; 
 Mon, 23 Mar 2020 16:09:13 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id q185sm1641937wme.10.2020.03.23.16.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:09:12 -0700 (PDT)
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
X-Google-Original-From: Roland Scheidegger <sroland@vmware.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 07/17] drm/vmwgfx: Read new register for GB memory when
 available
Date: Tue, 24 Mar 2020 00:08:51 +0100
Message-Id: <20200323230901.13302-8-sroland@vmware.com>
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
Y2UgYWRkZWQgbmV3IHJlZ2lzdGVyIGZvciBzdWdnZXN0ZWQgR0IgbWVtb3J5LCByZWFkIHRoZSBu
ZXcKcmVnaXN0ZXIgd2hlbiBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQg
PGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KUmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hl
aWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2xhbmQgU2NoZWlk
ZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCmluZGV4
IGI1NWJkM2I1ZjVjZC4uNzFlNDViNTY4NTExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuYwpAQCAtNzIwLDkgKzcyMCwxNSBAQCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9hZChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNoaXBzZXQpCiAJZGV2X3ByaXYtPm1h
eF9tb2JfcGFnZXMgPSAwOwogCWRldl9wcml2LT5tYXhfbW9iX3NpemUgPSAwOwogCWlmIChkZXZf
cHJpdi0+Y2FwYWJpbGl0aWVzICYgU1ZHQV9DQVBfR0JPQkpFQ1RTKSB7Ci0JCXVpbnQ2NF90IG1l
bV9zaXplID0KLQkJCXZtd19yZWFkKGRldl9wcml2LAotCQkJCSBTVkdBX1JFR19TVUdHRVNURURf
R0JPQkpFQ1RfTUVNX1NJWkVfS0IpOworCQl1aW50NjRfdCBtZW1fc2l6ZTsKKworCQlpZiAoZGV2
X3ByaXYtPmNhcGFiaWxpdGllczIgJiBTVkdBX0NBUDJfR0JfTUVNU0laRV8yKQorCQkJbWVtX3Np
emUgPSB2bXdfcmVhZChkZXZfcHJpdiwKKwkJCQkJICAgIFNWR0FfUkVHX0dCT0JKRUNUX01FTV9T
SVpFX0tCKTsKKwkJZWxzZQorCQkJbWVtX3NpemUgPQorCQkJCXZtd19yZWFkKGRldl9wcml2LAor
CQkJCQkgU1ZHQV9SRUdfU1VHR0VTVEVEX0dCT0JKRUNUX01FTV9TSVpFX0tCKTsKIAogCQkvKgog
CQkgKiBXb3JrYXJvdW5kIGZvciBsb3cgbWVtb3J5IDJEIFZNcyB0byBjb21wZW5zYXRlIGZvciB0
aGUKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
