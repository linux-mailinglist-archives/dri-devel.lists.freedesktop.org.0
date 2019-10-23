Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C1E19A0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD4F6EA5C;
	Wed, 23 Oct 2019 12:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEB46EA5C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 12:10:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c22so10307870wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 05:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GCCFnxfgctiR7ujkuq6S73RHOtLBZpaj2MQBUfolKvQ=;
 b=ho2Gi5YaNiWDETGtExxCtpCL4O80KaNsr2zTR/JIiZERymXmfE7nTR+NoEpj72sUNh
 +WA26v2x6Vmt1Svfbh2dS+NN0rjTCCmL1mgIWayMWMaVAlM8ahEa4AaST0XBJxfr/N00
 FFNnJop7HAG34rC4QjG6POAMg8CdkAeVxLyk2dhDFyH1sBeKSPuvCQwLb8i/U5n08aGn
 oFN56pUVuO2CE+jYBS7DwKPj2E4/kQIW6vKKzG+9vknUzYwUL/tUCmaRHd/OlbozKSgB
 lTDGIpV14rV/+aRr5aTHJHQvW2oELD3u8ZVw/i1ewCm+7Xa3JXq6jR4p+grv8BAX88Jk
 o8TA==
X-Gm-Message-State: APjAAAV2y3/oQjOZkETTw8lhX0Ex7cGwpYG3nbQLBUlzgYQxYWWq4vam
 h58VrvibMywT2h5x0fCrAyg=
X-Google-Smtp-Source: APXvYqwnT1P5lpTKGC9oq14j3EyMYmkpka1Vii05lwYOx5CHpyeTJMni1eoCxD3yrgrjTtag5l7jhA==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr7709573wmg.89.1571832600353; 
 Wed, 23 Oct 2019 05:10:00 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.196])
 by smtp.gmail.com with ESMTPSA id r81sm15016575wme.16.2019.10.23.05.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:09:59 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] panfrost: Properly undo pm_runtime_enable when deferring a
 probe
Date: Wed, 23 Oct 2019 14:09:25 +0200
Message-Id: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GCCFnxfgctiR7ujkuq6S73RHOtLBZpaj2MQBUfolKvQ=;
 b=uWe4GxxaDPldHT/awU5IWmMXWiJX9zobzCZrqq+ZyDgb8jfdBUOR+PX5YFHdwI5/lC
 wNpaXg392Vm9jbCkVRfCu90EPUw3QQyy2Ow8C+AlRv+LtV+WVRkv6x/6LrOJr3mL/p8i
 k+O5wtlrs7XawlVq/0CbZKOc2Csr/QHg9ZqoZzPmac1Moazeg85zhHVWOpabc5VYPTpS
 R0weZTve0KM/FeioqgXhcJSzVojaVzAWoWKNRSZzVKSS2QdDbHNbaTC9wRwa+vDjDy4b
 J/vkMN7tTgDu/j6WkExePmXeAWgMxXVGkYUH7BMapWPdxflWaLJ8pBMUvMUmk7ZxTVuJ
 eRog==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBkZWZlcnJpbmcgdGhlIHByb2JlIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIHJlZ3VsYXRvciwg
d2Ugd2VyZSBjYWxsaW5nCnBtX3J1bnRpbWVfZGlzYWJsZSBldmVuIGlmIHBtX3J1bnRpbWVfZW5h
YmxlIHdhc24ndCBjYWxsZWQuCgpNb3ZlIHRoZSBjYWxsIHRvIHBtX3J1bnRpbWVfZGlzYWJsZSB0
byB0aGUgcmlnaHQgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZp
em9zb0Bjb2xsYWJvcmEuY29tPgpGaXhlczogZjRhM2M2YTQ0YjM1ICgiZHJtL3BhbmZyb3N0OiBE
aXNhYmxlIFBNIG9uIHByb2JlIGZhaWx1cmUiKQpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggYmMyZGRlYjU1ZjVkLi5m
MjFiYzhhN2VlM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKQEAg
LTU1NiwxMSArNTU2LDExIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIAogZXJyX291dDI6CisJcG1fcnVudGltZV9k
aXNhYmxlKHBmZGV2LT5kZXYpOwogCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRldik7CiBlcnJf
b3V0MToKIAlwYW5mcm9zdF9kZXZpY2VfZmluaShwZmRldik7CiBlcnJfb3V0MDoKLQlwbV9ydW50
aW1lX2Rpc2FibGUocGZkZXYtPmRldik7CiAJZHJtX2Rldl9wdXQoZGRldik7CiAJcmV0dXJuIGVy
cjsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
