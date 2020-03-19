Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF3018C149
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE586EA70;
	Thu, 19 Mar 2020 20:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38F6EA6C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:24:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n13so2767969lfh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvUXTTdGauGbD2IFXTDTSlrdrp9m5Gn1RT7OT0t3wgk=;
 b=f3/7HvhCZThliUNfdYNVlY8THrXPMzA6n/AAHK/PvcELOkQvSUsAHGa5lTqHAEWl1n
 rieqa8WXlI4HzflXlhDyF5mwISgNb3swoa4njXyDe34UVDr91K5+dSyk+2EgKtiid9c2
 15ywKfvWsKJYtH4IS8e/Hz/Jw8kI1StJyTH64vdZO5Sc5g7ujWPFf4Vk3cH29uaLbZXf
 TQN140VvTTFlqVWYdF8rGEi6w4IMWX0ScDZneUrfUpSe+0iQ4l73IzxSOgFPvB0z4Zwx
 8twokROeGURu2PuSjj4eh6CImca8bXW9i1y02b44cw/8jPsIK3ye0VTQ5XJ2aCGhQCwa
 FAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvUXTTdGauGbD2IFXTDTSlrdrp9m5Gn1RT7OT0t3wgk=;
 b=RarJgHClYQRJP2DCS+LsbtA51rexRONZLpTqtgfVqS1/8ZYGov5nEYYTGLll7FX0Zl
 uAv8ZCI0+Zr7AXdqOVHdt3QnaTtYh+ai72UA7Jc8a801NokPE6OUbuVH00LA1yflJ9WW
 vno79Kqmx5uX1fHQLd9w42celPScENQElRCdi77Ijo8of4Lx4pM4WA9f/N5o+VS7h62C
 +bGqy94aRmvbyodsHgo/Wr+tuDr6d+mcODI9fYYcmPZeP2OlkEEYbPvL7JgRUBatx+e7
 SawIXk11dHGnZswgdsm8UM1ZXueHShjQEAsgDIx0dWpXPQvkD7TDjj0//pRRoAIR+wu1
 +73w==
X-Gm-Message-State: ANhLgQ02MRA/pxtVM3whkd8nv4TU41moQGM2QpSMs6J7+BlZQXK1Z1Ic
 zNyCSq55xtveJp2LYOXivVtNEp128f4=
X-Google-Smtp-Source: ADFU+vt3un/Jiw7lBRvSlXhmhRbZfVXdxJHkPYViCvXaDRLMM34OEHhK1FdX474y7IeAOy02H3crVA==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr3158424lfi.71.1584649496815;
 Thu, 19 Mar 2020 13:24:56 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:24:56 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/17] drm/vmwgfx: Read new register for GB memory when
 available
Date: Thu, 19 Mar 2020 21:24:04 +0100
Message-Id: <20200319202414.9296-8-sroland@vmware.com>
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
Y2UgYWRkZWQgbmV3IHJlZ2lzdGVyIGZvciBzdWdnZXN0ZWQgR0IgbWVtb3J5LCByZWFkIHRoZSBu
ZXcKcmVnaXN0ZXIgd2hlbiBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQg
PGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KU2lnbmVkLW9mZi1ieTogUm9sYW5kIFNj
aGVpZGVnZ2VyIChWTXdhcmUpIDxyc2NoZWlkZWdnZXIub3NzQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jCmluZGV4IGUwNzI5MmEyOWMyNi4uNmI4ZWEwZWZhM2YwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwpAQCAtNzIwLDkgKzcyMCwxNSBAQCBzdGF0aWMgaW50
IHZtd19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNo
aXBzZXQpCiAJZGV2X3ByaXYtPm1heF9tb2JfcGFnZXMgPSAwOwogCWRldl9wcml2LT5tYXhfbW9i
X3NpemUgPSAwOwogCWlmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYgU1ZHQV9DQVBfR0JPQkpF
Q1RTKSB7Ci0JCXVpbnQ2NF90IG1lbV9zaXplID0KLQkJCXZtd19yZWFkKGRldl9wcml2LAotCQkJ
CSBTVkdBX1JFR19TVUdHRVNURURfR0JPQkpFQ1RfTUVNX1NJWkVfS0IpOworCQl1aW50NjRfdCBt
ZW1fc2l6ZTsKKworCQlpZiAoZGV2X3ByaXYtPmNhcGFiaWxpdGllczIgJiBTVkdBX0NBUDJfR0Jf
TUVNU0laRV8yKQorCQkJbWVtX3NpemUgPSB2bXdfcmVhZChkZXZfcHJpdiwKKwkJCQkJICAgIFNW
R0FfUkVHX0dCT0JKRUNUX01FTV9TSVpFX0tCKTsKKwkJZWxzZQorCQkJbWVtX3NpemUgPQorCQkJ
CXZtd19yZWFkKGRldl9wcml2LAorCQkJCQkgU1ZHQV9SRUdfU1VHR0VTVEVEX0dCT0JKRUNUX01F
TV9TSVpFX0tCKTsKIAogCQkvKgogCQkgKiBXb3JrYXJvdW5kIGZvciBsb3cgbWVtb3J5IDJEIFZN
cyB0byBjb21wZW5zYXRlIGZvciB0aGUKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
