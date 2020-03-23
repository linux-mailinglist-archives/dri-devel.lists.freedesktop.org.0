Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C271901A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196646E40F;
	Mon, 23 Mar 2020 23:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DF06E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:12:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m17so10305474wrw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7j0POb67yVdjJHUMnszVMGuzUGSS2UUHRAp7ly5hz+s=;
 b=adhWaMgtdQT2aemzwtgc6ON7xt7cnnz/mqgyLKEQ0+DFkIE8tOiyhZoMAZ5bljFzzm
 7MCBtnsTytRUoyUBxl4Qlc5P1a2bTRQHy048QRcCWfM1GOAfgFjjJkySoT4rIwn+q7gk
 Tb82zsWKgHR/O5Y43iTv8Hphyg2elgjjcDXANvIbMDG7HqJcG3CDhnbMMoXEMjRXH2Z/
 ZrVgQpaq5Agiqtsz+Q2VUC96chGsXbMTJCxP7Hr3QomWPtZLRIi1YNSd9eM0uJV5SSsn
 1b4b5cTCUWkMyfaBQoKW0uxt0y68ipObaG1rD8esLsdDtbvjugXT4kHkExcPSSNlGDZf
 MkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7j0POb67yVdjJHUMnszVMGuzUGSS2UUHRAp7ly5hz+s=;
 b=ZZ/xRCS2Pyhfm5xkAu+NuoCdfB4jqtfftRuVMO5yEhM9i/dKouXC9dz437CdOKcpcV
 7eFaLBSZoTno1bmDCaHwF4EyzSMxJKW9uO+JXUGFHw8QIf/+LJYwj9JQm6jdXEXHlr2m
 EBXY5oNG9yyem2w8yO5wqRh8w9Y1ABicIGd3tzqWX6gf5BYtsEg1FBR+IaxCh2+K1ucx
 ac3+TS8GdsefczEoAogTZS5W2VkkuVFgIbJzS2h63TPsr+XK1fmj9tQawhqscyX/AFYf
 0qIUgO4ANgRHr8jaBTf9+D52B7WWgQ6ectfbfONumIYF1QczGtbq/EAYRejXLorEN6T8
 xuVA==
X-Gm-Message-State: ANhLgQ2fYdBb+wulMNHazfGeZQJocyaxzPtZ7Q7a3sV+HB60vPn+sfah
 J21Z4DIq+hLsOA1A2IhsyMyp1PMH
X-Google-Smtp-Source: ADFU+vvGx0ws0iA/Cbx1GMbKnF2H0cKMUK4aCrUdPf1yKBxrIoJPcEYTqFKJQ0jmQlZB3qRiETSIqA==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr26742177wrt.136.1585005168980; 
 Mon, 23 Mar 2020 16:12:48 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id b82sm1495262wmb.46.2020.03.23.16.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:12:48 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 07/17] drm/vmwgfx: Read new register for GB memory when
 available
Date: Tue, 24 Mar 2020 00:12:28 +0100
Message-Id: <20200323231238.14839-8-rscheidegger.oss@gmail.com>
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
