Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA17D351
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051106E328;
	Thu,  1 Aug 2019 02:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D696E328
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:25 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so33143587pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRUFnP4ofqonZexYeBGxV7EVAaZ3+L9vOKlLz0P0sBE=;
 b=f1MrXjDTtxpZMTS7mxwBVPuu8RlgSrj1FO3RRkV6lH5Ip8hKx/Vni+kN8Ru3q5IEEb
 rREi8GYo4yt8IyZhfi0Ow3xwLULGKRnPq+XoGVqOyPhaccsjA/eNZG+TovmfBuVS/Jry
 mZh/VAxJQYFqNZfaq8rMX3pGRhZdAQDIWaArIYi6XR1NDTnQ3jC+suOs8Kmu2te8pxc1
 nIoljkqTZaYvs/SqVlmMKKuBH1Psb9FU2KXvj48DqYaZuV1QxviLGTxJiSs6gbOnNGo9
 7veNWMBODmJoOwLif8mrB2cMbAVK92YK7Rec8B3doraHFkY2nlggY+/1YpBPlyQ2EuXD
 T2Tg==
X-Gm-Message-State: APjAAAV5j18NakkVPmtP3lCdAzMBYdsfDMihwTzKMbXks38VOvJBSP4R
 wX3J/fxXz0ZzJAoXu8SdUgyLB78h/nw=
X-Google-Smtp-Source: APXvYqxnEf6tanCWOd7XHEZwQLGuokiyY3veACgkT17VoC/OmESe7RwNDr0OwYtYY6g3sEZYcFW4DQ==
X-Received: by 2002:a63:784c:: with SMTP id
 t73mr120019199pgc.268.1564626324589; 
 Wed, 31 Jul 2019 19:25:24 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:24 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 1/6] udmabuf: use cache_sgt_mapping option
Date: Wed, 31 Jul 2019 19:25:12 -0700
Message-Id: <20190801022517.1903-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRUFnP4ofqonZexYeBGxV7EVAaZ3+L9vOKlLz0P0sBE=;
 b=cOCUiIiQFNLIG5NkhQrvEw3Bke0+QcCd3EPbakpe4elRzFmgsNIiBs7auPFY95B5rM
 4YKbT8Wls5WiL/uTkhycV+f+6BjdXVxIQXQTXnyAsQURt21vZCg7ronpYO7viaJ/cdmw
 fvzJooSHG4tiF3FFE/PelD3z1Btc3FE/ELXdQ=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdFTSBwcmltZSBoZWxwZXJzIGRvIGl0LCBzbyBzaG91bGQgd2UuIEl0J3MgYWxzbyBwb3Nz
aWJsZSB0byBtYWtlCml0IG9wdGlvbmFsIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFu
IFNpbmdoIDxndXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVm
L3VkbWFidWYuYyB8IDEzICsrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFi
dWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKaW5kZXggOTYzNTg5NzQ1OGEwLi5iMzQ1
ZTkxZDgzMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJp
dmVycy9kbWEtYnVmL3VkbWFidWYuYwpAQCAtMTA4LDEyICsxMDgsMTMgQEAgc3RhdGljIHZvaWQg
a3VubWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBwYWdlX251
bSwKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyB1ZG1hYnVmX29wcyA9IHsK
LQkubWFwX2RtYV9idWYJICA9IG1hcF91ZG1hYnVmLAotCS51bm1hcF9kbWFfYnVmCSAgPSB1bm1h
cF91ZG1hYnVmLAotCS5yZWxlYXNlCSAgPSByZWxlYXNlX3VkbWFidWYsCi0JLm1hcAkJICA9IGtt
YXBfdWRtYWJ1ZiwKLQkudW5tYXAJCSAgPSBrdW5tYXBfdWRtYWJ1ZiwKLQkubW1hcAkJICA9IG1t
YXBfdWRtYWJ1ZiwKKwkuY2FjaGVfc2d0X21hcHBpbmcgPSB0cnVlLAorCS5tYXBfZG1hX2J1Zgkg
ICA9IG1hcF91ZG1hYnVmLAorCS51bm1hcF9kbWFfYnVmCSAgID0gdW5tYXBfdWRtYWJ1ZiwKKwku
cmVsZWFzZQkgICA9IHJlbGVhc2VfdWRtYWJ1ZiwKKwkubWFwCQkgICA9IGttYXBfdWRtYWJ1ZiwK
KwkudW5tYXAJCSAgID0ga3VubWFwX3VkbWFidWYsCisJLm1tYXAJCSAgID0gbW1hcF91ZG1hYnVm
LAogfTsKIAogI2RlZmluZSBTRUFMU19XQU5URUQgKEZfU0VBTF9TSFJJTkspCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
