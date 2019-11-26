Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AB8109770
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 02:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2636E1BE;
	Tue, 26 Nov 2019 01:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61146E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:11:18 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 6so3564014pgk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 17:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/aY1zeifCUazA2R7W+5YbKLA6FIG6CMK8P5lmxEc9w=;
 b=Okfqe3utiCLPYyIoKBsWYPlkHmp0hXIaeF8sTELVVEelxFhENBsoUATBgehTVsnj8J
 z1UNVgr7eEg+VYm9pUuCJpBPGiD52lWkFef9iKRwXwe4edsRGjqvJVshjftfMBEtWnb9
 Es15qrtLUKst9YhAPrj/xwNkjEsikMCPtHdMJn5vfA+zmcFRc2fZljExB/r7Oae28MeI
 30NwZEJkfgA9HEbLpBdeP7DaKF18YsH2+AJaaZERKSkb2o6ZLyDwYTfSmQQGtrycEZiB
 GQlNWRw/d5avPIk7VtFVWMN7O/685l+jReF3OggOJn8CcdNyZSh7XTXYUeTGhtl9NJyp
 tudw==
X-Gm-Message-State: APjAAAU72DLrhojFpWHR5wIFlpqg3m7q2hVb1PIhJBoaGOZvKB5ZME8v
 uUCSmTh4/0lHMgtv8QfnK1mEMyToMBA=
X-Google-Smtp-Source: APXvYqzU2Mkl6zxLrwxnguxy4Ta6s3lQMXAGyCk8xupI/jtFSu0iy5cbt6SwFCWMAIuzgAbU0lwsIQ==
X-Received: by 2002:a62:6086:: with SMTP id u128mr38357762pfb.4.1574730678352; 
 Mon, 25 Nov 2019 17:11:18 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z10sm9672903pgg.39.2019.11.25.17.11.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Nov 2019 17:11:17 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] udmabuf: use cache_sgt_mapping option
Date: Mon, 25 Nov 2019 17:10:52 -0800
Message-Id: <20191126011056.67928-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/aY1zeifCUazA2R7W+5YbKLA6FIG6CMK8P5lmxEc9w=;
 b=noUTO8FLsA53qPu6+gJpr/+Emaxjj5VhyAIk6MPejpNh5pgSldm6/GbSYDE8k5xqzi
 zuyUMtzTn2c/PZm2DGDHvn/EVPRcVrzZFYlVUWHs1AGkx0ou40FwL02Thvp0DGgptU5O
 Dtf9GzICEQM4p1Ef65ozZIA2EQRAmJU4j4mbo=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
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
LAogfTsKIAogI2RlZmluZSBTRUFMU19XQU5URUQgKEZfU0VBTF9TSFJJTkspCi0tIAoyLjI0LjAu
NDMyLmc5ZDNmNWY1YjYzLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
