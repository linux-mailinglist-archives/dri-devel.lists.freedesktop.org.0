Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8923329D4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7303E89688;
	Mon,  3 Jun 2019 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9A894EB;
 Mon,  3 Jun 2019 03:01:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u17so9711737pfn.7;
 Sun, 02 Jun 2019 20:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FVbLKJ7aHdVl9olP6rdiDo2FyvciQZ6SOLC15bFopUs=;
 b=lcQaLQam1jd6lw/rCVtlu2hWylZRQaaopQ6OzuUnmH5fEFhmFnHjgZ1BVWhnMRstbC
 k8d0FqXYrpPRSWjCy/E7oBIaPiZYlo+aH9jyn1oHvJBIoB7abhhil+YCVzgjYMfPpm7V
 VEERXhbyQFtbKufGPJbMXtDMmNR2rmMIZJL3Dia7/9FG/YLJMjoToC4guExNLI+u5qjy
 WVWjPzp+AAOhnIt/T/1Ed/zNK6MW/q0rcOT4HScFajp3QMSKVKjy5yZyqFspi53B/NHj
 bwnk0tbj0lfGPp0IS+98r3BtiPEpM+xiuGIQv1IXeolCii7OT/kACHS6tA9BieUH4XSG
 PK5g==
X-Gm-Message-State: APjAAAUQoERSebLaFN7Ptm64MQ9S1XTgpTq/Burm01OiZKPINs8J9GMc
 DAJ1w+yz7AKheTNbKFVsItKa3xJ9qN+prw==
X-Google-Smtp-Source: APXvYqxUNmDjQvpsM4PrbSHqDfF6Oikg3UOWVN0H3OuTPiIN+Wg0Uy4PR0jcHezKI0HJgfNmeklV8Q==
X-Received: by 2002:a62:ee04:: with SMTP id e4mr27285689pfi.232.1559530888348; 
 Sun, 02 Jun 2019 20:01:28 -0700 (PDT)
Received: from xy-data.openstacklocal
 (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
 by smtp.gmail.com with ESMTPSA id c16sm2244467pfc.69.2019.06.02.20.01.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 02 Jun 2019 20:01:27 -0700 (PDT)
From: Young Xiao <92siuyang@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: avoid a possible arrary overflow
Date: Mon,  3 Jun 2019 11:02:37 +0800
Message-Id: <1559530957-11103-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FVbLKJ7aHdVl9olP6rdiDo2FyvciQZ6SOLC15bFopUs=;
 b=JUxJ14EuMKRdzXXJnHjWCIA4R7kBcEmsSkQGdZH3lE4jYv715BnrdakjQqAJCSDOxf
 r2GEm4mvgKjfY57U2QZpUW3K/12ItP9/9YQb2NmTUd6SaiQmwpvgXJJynTZ/B6ZGCJSi
 pBwpTZ3DcSpHVkZZZfV/+bETZne+g8EmRI1F8oxbo9d4i93hzY7O0EeKoPgeAYzHCouH
 fCE321KyIc9QtGVLY1THGxJvgwkcQhbMWZVV3MncuHzMKU3G5KHF+mQx76SfczhJZFQd
 DQci1EcpJdg4D5/pTZADlFJs+s08N5QqrsrqDevtITPm83s2Beye6kyFOl0ttPo3r52j
 d4Rg==
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
Cc: Young Xiao <92siuyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBsb29raW5nIHVwIHRoZSBjb25uZWN0b3IgdHlwZSBtYWtlIHN1cmUgdGhlIGluZGV4Cmlz
IHZhbGlkLiAgQXZvaWRzIGEgbGF0ZXIgY3Jhc2ggaWYgd2UgcmVhZCBwYXN0IHRoZSBlbmQKb2Yg
dGhlIGFycmF5LgoKVGhpcyBidWcgaXMgc2ltaWxhciB0byB0aGUgaXNzdWUgd2hpY2ggd2FzIGZp
eGVkIGluCmNvbW1pdCBlMTcxOGQ5N2FhODggKCJkcm0vYW1kZ3B1OiBhdm9pZCBhIHBvc3NpYmxl
CmFycmF5IG92ZXJmbG93IikuCgpTaWduZWQtb2ZmLWJ5OiBZb3VuZyBYaWFvIDw5MnNpdXlhbmdA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMg
fCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYwppbmRleCBmNDIyYThkLi45NzFjNTQxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMKQEAgLTYzMiw2ICs2MzIsMTAgQEAg
Ym9vbCByYWRlb25fZ2V0X2F0b21fY29ubmVjdG9yX2luZm9fZnJvbV9vYmplY3RfdGFibGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKIAkJCQkJY29ubmVjdG9yX29iamVjdF9pZCA9IGNvbl9vYmpf
aWQ7CiAJCQkJfQogCQkJfSBlbHNlIHsKKwkJCQlpZiAoY29uX29ial9pZCA+PSBBUlJBWV9TSVpF
KG9iamVjdF9jb25uZWN0b3JfY29udmVydCkpIHsKKwkJCQkJRFJNX0VSUk9SKCJpbnZhbGlkIGNv
bl9vYmpfaWQgJWRcbiIsIGNvbl9vYmpfaWQpOworCQkJCQljb250aW51ZTsKKwkJCQl9CiAJCQkJ
aWdwX2xhbmVfaW5mbyA9IDA7CiAJCQkJY29ubmVjdG9yX3R5cGUgPQogCQkJCSAgICBvYmplY3Rf
Y29ubmVjdG9yX2NvbnZlcnRbY29uX29ial9pZF07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
