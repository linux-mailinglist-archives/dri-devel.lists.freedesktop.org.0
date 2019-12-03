Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219B110257
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344276E9E8;
	Tue,  3 Dec 2019 16:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2C96E9E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:32:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so4506613wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EYcVq3D13Cv4p0YNI7vV4r0UyMzhZvJG8/eW5rX0Js=;
 b=n0ypZRmUVNgmJ7DcPTu0+EYALPV4HY3ED82K5yQPfGtayuwrxGDJ0YpNhRfdra6bzB
 ljgCHDB6Nv6hQk9/4cEaBqhXDjEBwDka+qRuzGhtdMdwhRT9fOQkI/4dEPC0XcE4MsoI
 /oiEBNlaM9ELlzvyw5WDgrIDdJnuAB+55Ae36Lj/tvSfQuRujWlDX0BxDsakb01lPusq
 nt8vu3E4EbA3oYaLrz5+6D8OwLwT4LpVLB5JOxV7QbgOA+G6CITdL7dZWO0IrZf0GtdT
 OL9aAhS5N7XUBmLtIzI93irnHeQKNqu+XUZr750A6unVNtFj+PFGO9gMtJNkUJgKor26
 6TjQ==
X-Gm-Message-State: APjAAAU2gQYnZcQ/+c40TZ78bV8OdBXfEnKJ4doMINTPQa2Idce5S66l
 H2FdFTb720yWxb0v1elY8oI=
X-Google-Smtp-Source: APXvYqxCJLqegjUn/l5I5qAgvCYWCXdjUUQz8EvWQ8Op1wr04iv9ZZZm3F1PIX8jSwd2TOD6xGCZ4A==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
 l14mr6580381wrx.342.1575390725033; 
 Tue, 03 Dec 2019 08:32:05 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id h17sm4460645wrs.18.2019.12.03.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:32:04 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] lib/scatterlist: Add contiguous DMA chunks helpers
Date: Tue,  3 Dec 2019 17:32:01 +0100
Message-Id: <20191203163203.1486837-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EYcVq3D13Cv4p0YNI7vV4r0UyMzhZvJG8/eW5rX0Js=;
 b=M1RiCYW2WNP7GbjFLZELTAtnhtCw8Gpb8OacJDUGjYNnOkqc76EaY7gHlP+UgXvCa1
 GJddsGVbqve62OHibGYMYYB8iPyMKbNgYcxCdXW3el6pAJPj6ARv0LUSCbyzcP/TnTrD
 eTaKuFyO8WaN6LuOcS0vZWE3vxg24NRasxoKICvL2ykDKXGBs2+ABCEV5INxlrKWmr7A
 8sAyAaUyU1xhNNo0o/xOh4JCiBdyGuXYE2TxyGheydfWEb8EeLNrAJehemOH4MgPEH/8
 pa0hmcvKk60hubUMJL7587wLjV0Gh9YIxYFXuNIvY6W+ZJdhpYQVRaqi2chuYThleQ6M
 V+Wg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGZldyBoZWxw
ZXJzIHRvIGNvdW50IHRoZSBudW1iZXIgb2YgY29udGlndW91cyBETUEgY2h1bmtzIGZvdW5kIGlu
CmFuIFNHIHRhYmxlLiBUaGlzIGlzIHVzZWZ1bCB0byBkZXRlcm1pbmUgd2hldGhlciBvciBub3Qg
YSBtYXBwaW5nIGNhbiBiZQp1c2VkIGJ5IGRyaXZlcnMgd2hvc2UgZGV2aWNlcyBuZWVkIGNvbnRp
Z3VvdXMgbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmggfCAxMSArKysrKysrKysr
KwogbGliL3NjYXR0ZXJsaXN0LmMgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc2NhdHRlcmxpc3QuaCBiL2luY2x1ZGUvbGludXgvc2NhdHRlcmxpc3Qu
aAppbmRleCA2ZWVjNTBmYjM2YzguLjUxYTg0MTY2MjNhOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9zY2F0dGVybGlzdC5oCisrKyBiL2luY2x1ZGUvbGludXgvc2NhdHRlcmxpc3QuaApAQCAt
MjYyLDYgKzI2Miw3IEBAIGludCBzZ19zcGxpdChzdHJ1Y3Qgc2NhdHRlcmxpc3QgKmluLCBjb25z
dCBpbnQgaW5fbWFwcGVkX25lbnRzLAogCSAgICAgY29uc3Qgc2l6ZV90ICpzcGxpdF9zaXplcywK
IAkgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqKm91dCwgaW50ICpvdXRfbWFwcGVkX25lbnRzLAog
CSAgICAgZ2ZwX3QgZ2ZwX21hc2spOwordW5zaWduZWQgaW50IHNnX2RtYV9jb3VudF9jaHVua3Mo
c3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsIHVuc2lnbmVkIGludCBuZW50cyk7CiAKIHR5cGVkZWYg
c3RydWN0IHNjYXR0ZXJsaXN0ICooc2dfYWxsb2NfZm4pKHVuc2lnbmVkIGludCwgZ2ZwX3QpOwog
dHlwZWRlZiB2b2lkIChzZ19mcmVlX2ZuKShzdHJ1Y3Qgc2NhdHRlcmxpc3QgKiwgdW5zaWduZWQg
aW50KTsKQEAgLTMwNiw2ICszMDcsMTYgQEAgc2l6ZV90IHNnX3Bjb3B5X3RvX2J1ZmZlcihzdHJ1
Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgdW5zaWduZWQgaW50IG5lbnRzLAogc2l6ZV90IHNnX3plcm9f
YnVmZmVyKHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLCB1bnNpZ25lZCBpbnQgbmVudHMsCiAJCSAg
ICAgICBzaXplX3QgYnVmbGVuLCBvZmZfdCBza2lwKTsKIAorc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgc2d0X2RtYV9jb3VudF9jaHVua3Moc3RydWN0IHNnX3RhYmxlICpzZ3QpCit7CisJcmV0
dXJuIHNnX2RtYV9jb3VudF9jaHVua3Moc2d0LT5zZ2wsIHNndC0+bmVudHMpOworfQorCitzdGF0
aWMgaW5saW5lIGJvb2wgc2d0X2RtYV9jb250aWd1b3VzKHN0cnVjdCBzZ190YWJsZSAqc2d0KQor
eworCXJldHVybiBzZ3RfZG1hX2NvdW50X2NodW5rcyhzZ3QpID09IDE7Cit9CisKIC8qCiAgKiBN
YXhpbXVtIG51bWJlciBvZiBlbnRyaWVzIHRoYXQgd2lsbCBiZSBhbGxvY2F0ZWQgaW4gb25lIHBp
ZWNlLCBpZgogICogYSBsaXN0IGxhcmdlciB0aGFuIHRoaXMgaXMgcmVxdWlyZWQgdGhlbiBjaGFp
bmluZyB3aWxsIGJlIHV0aWxpemVkLgpkaWZmIC0tZ2l0IGEvbGliL3NjYXR0ZXJsaXN0LmMgYi9s
aWIvc2NhdHRlcmxpc3QuYwppbmRleCBjMmNmMmMzMTFiN2QuLjRjMGQxMTk2OGY4ZCAxMDA2NDQK
LS0tIGEvbGliL3NjYXR0ZXJsaXN0LmMKKysrIGIvbGliL3NjYXR0ZXJsaXN0LmMKQEAgLTE0Miw2
ICsxNDIsMzUgQEAgdm9pZCBzZ19pbml0X29uZShzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLCBjb25z
dCB2b2lkICpidWYsIHVuc2lnbmVkIGludCBidWZsZW4pCiB9CiBFWFBPUlRfU1lNQk9MKHNnX2lu
aXRfb25lKTsKIAorLyoqCisgKiBzZ19kbWFfY291bnRfY2h1bmtzIC0gcmV0dXJuIG51bWJlciBv
ZiBjb250aWd1b3VzIERNQSBjaHVua3MgaW4gc2NhdHRlcmxpc3QKKyAqIEBzZ2w6IFNHIHRhYmxl
CisgKiBAbmVudHM6IG51bWJlciBvZiBlbnRyaWVzIGluIFNHIHRhYmxlCisgKi8KK3Vuc2lnbmVk
IGludCBzZ19kbWFfY291bnRfY2h1bmtzKHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLCB1bnNpZ25l
ZCBpbnQgbmVudHMpCit7CisJZG1hX2FkZHJfdCBuZXh0ID0gfihkbWFfYWRkcl90KTA7CisJdW5z
aWduZWQgaW50IGNvdW50ID0gMCwgaTsKKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnM7CisKKwlmb3Jf
ZWFjaF9zZyhzZ2wsIHMsIG5lbnRzLCBpKSB7CisJCS8qCisJCSAqIHNnX2RtYV9hZGRyZXNzKHMp
IGlzIG9ubHkgdmFsaWQgZm9yIGVudHJpZXMgdGhhdCBoYXZlCisJCSAqIHNnX2RtYV9sZW4ocykg
IT0gMC4KKwkJICovCisJCWlmICghc2dfZG1hX2xlbihzKSkKKwkJCWNvbnRpbnVlOworCisJCWlm
IChzZ19kbWFfYWRkcmVzcyhzKSAhPSBuZXh0KSB7CisJCQluZXh0ID0gc2dfZG1hX2FkZHJlc3Mo
cykgKyBzZ19kbWFfbGVuKHMpOworCQkJY291bnQrKzsKKwkJfQorCX0KKworCXJldHVybiBjb3Vu
dDsKK30KK0VYUE9SVF9TWU1CT0woc2dfZG1hX2NvdW50X2NodW5rcyk7CisKIC8qCiAgKiBUaGUg
ZGVmYXVsdCBiZWhhdmlvdXIgb2Ygc2dfYWxsb2NfdGFibGUoKSBpcyB0byB1c2UgdGhlc2Uga21h
bGxvYy9rZnJlZQogICogaGVscGVycy4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
