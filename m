Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A407E19EC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4CB6EA77;
	Wed, 23 Oct 2019 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019F6EA77
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 12:22:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o28so21847315wro.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 05:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e3FCsAeT5K9ZdHIcSbJyMOoHwnh6UPbcGp5phHrUoac=;
 b=Vt9/wxvP5fyoAsM4RhfJo1VaukH72ObWA0f3SJzXqXSuw1p1HRCp12D/L6sKQvWTR5
 taronmVfAmR1VbBQ/sHskFih5pEVnWBdnpZfciH0yeri+ssXceSseRy/xyO7lZ6G+rFA
 fB7LC6gM0QjYxfEdV1sxOhqOLaE3M+Tw4VMfQQQViurdrDMTQjHz1jm4Di+CaPGEI6KS
 3eydEq5vv7+8B9SwD9KD63KwmQWuOjlRXxBe5W48vL8Rb4uqz1WQFjawOg+wVMkc6nt7
 +eQ4IDHbXFJx/LXfK57QBpHYqD+7Dn4uE8rctNmZO2Xi+fKPuE4DIPwOGOm94wwUMycr
 m+3w==
X-Gm-Message-State: APjAAAUMM1Vq3o+myIljrZHSC+fCq7Z3HSktkMuYD0cpIkamoUVFGSw1
 1Uatks6SZRZmOHn34Ti71Fw=
X-Google-Smtp-Source: APXvYqw1NcJwe73jzpm/8PbdxicLWL/zyK/dS0vS9s2mDoXESRNQsH6ykzl6XO+SGpl9tHwnGk+JPg==
X-Received: by 2002:a5d:614e:: with SMTP id y14mr8543618wrt.329.1571833348216; 
 Wed, 23 Oct 2019 05:22:28 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.196])
 by smtp.gmail.com with ESMTPSA id x21sm9773421wmj.42.2019.10.23.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:22:26 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] panfrost: Properly undo pm_runtime_enable when deferring a
 probe
Date: Wed, 23 Oct 2019 14:21:57 +0200
Message-Id: <20191023122157.32067-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
References: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3FCsAeT5K9ZdHIcSbJyMOoHwnh6UPbcGp5phHrUoac=;
 b=i4gpfqIdPEPkJ1QTxEJgpm5N7TxdtUNBaeo3ktliHpa/YrfYV2a3i2DLSwCxuUukH9
 5TBN+AvjFQiQA0UV/Hkv6aO5jNaR4406iJlviEAeXPGBQaTJ5GD0Kdm8oFZ1SzW+QcXp
 iF+D5gv+SV4HN074ghZz+TnklNwpyqUjIAwUMtudRiYI1ar4jdk21PUbwtx/1FHTsU2k
 61hNyMVQzIbPy8GPcmcLnu0hTRDyF2h0Fc1ULq+DPnDucNhBlXLz5rfO32KQr34Trwlf
 7RBEdT//fDSlbCU/5Z/W7DqNLzDRCiJGL7TqE/xY5T5qCc9qf7iV1yzXr9sEZu5nAg/T
 PJwg==
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
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBkZWZlcnJpbmcgdGhlIHByb2JlIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIHJlZ3VsYXRvciwg
d2Ugd2VyZSBjYWxsaW5nCnBtX3J1bnRpbWVfZGlzYWJsZSBldmVuIGlmIHBtX3J1bnRpbWVfZW5h
YmxlIHdhc24ndCBjYWxsZWQuCgpNb3ZlIHRoZSBjYWxsIHRvIHBtX3J1bnRpbWVfZGlzYWJsZSB0
byB0aGUgcmlnaHQgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZp
em9zb0Bjb2xsYWJvcmEuY29tPgpSZXBvcnRlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KRml4ZXM6IGY0YTNj
NmE0NGIzNSAoImRybS9wYW5mcm9zdDogRGlzYWJsZSBQTSBvbiBwcm9iZSBmYWlsdXJlIikKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggYmMyZGRlYjU1ZjVkLi5mMjFiYzhhN2VlM2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKQEAgLTU1NiwxMSArNTU2LDEx
IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlyZXR1cm4gMDsKIAogZXJyX291dDI6CisJcG1fcnVudGltZV9kaXNhYmxlKHBmZGV2LT5k
ZXYpOwogCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRldik7CiBlcnJfb3V0MToKIAlwYW5mcm9z
dF9kZXZpY2VfZmluaShwZmRldik7CiBlcnJfb3V0MDoKLQlwbV9ydW50aW1lX2Rpc2FibGUocGZk
ZXYtPmRldik7CiAJZHJtX2Rldl9wdXQoZGRldik7CiAJcmV0dXJuIGVycjsKIH0KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
