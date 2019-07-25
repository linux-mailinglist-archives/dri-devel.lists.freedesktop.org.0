Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E909742C2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590AF6E2FD;
	Thu, 25 Jul 2019 01:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A706E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:06 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i10so93582385iol.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGyYGtLjbKds+3glB3UfrB7+qwwsSsr9jvvvmMTVCs4=;
 b=Kbur7jfPvutNYtm841sQxUnmRK99JhomZM5Q0+F3SPsypUqO8ENtzU2HsY0oScsNKX
 p65RaOu+jrH34BIDZQaidVJe4gWtd/UL+W8sw308b8L8tOgStafmnNzFsWvN+T2BozOG
 deDRwNAGhkPZ8mdgrSq1heMRtjrQS6mQqfn4za1wZ4RY6e07YYrp4ALg676R4y6H0M7s
 EKkrj968ELmD2go1Z818ETCfm2T7JpqRoXvTFNjdqCyblgbmiisI0m8q81mQFnd9Z8eG
 oSn0y08H0GBqfqNcUGNR9x47F6nvg7KUzjeeSV234T/Do3j+deKwI9EklNKeC5et9ef+
 RsaQ==
X-Gm-Message-State: APjAAAVY0znL1VPmxjmG5djryL9BtMqBminQr4EE5KIBD2vIRLYXLb4k
 ry1ixrdIgw9CWaoDpbD9poWTaIc=
X-Google-Smtp-Source: APXvYqyaD39wsVkSDIQtLzFTvQTPvJC4ZBefVK3E4wywtT8J7OuoFPaXxAJzR67WcgmhISa55qutiA==
X-Received: by 2002:a02:8814:: with SMTP id r20mr92120525jai.115.1564017005527; 
 Wed, 24 Jul 2019 18:10:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id o7sm40675924ioo.81.2019.07.24.18.10.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 18:10:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/panfrost: Add heap and no execute buffer allocation
Date: Wed, 24 Jul 2019 19:09:56 -0600
Message-Id: <20190725011003.30837-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBuZXcgQk8gYWxsb2NhdGlvbiBmbGFncyBQQU5GUk9TVF9CT19IRUFQ
IGFuZApQQU5GUk9TVF9CT19OT0VYRUMuIFRoZSBoZWFwIGFsbG9jYXRpb25zIGFyZSBwYWdlZCBp
biBvbiBHUFUgcGFnZSBmYXVsdHMuCgpUaGlzIGlzIGJhc2VkIG9uIGRybS1taXNjLW5leHQuIEEg
YnJhbmNoIGlzIGhlcmVbMV0uCgpSb2IKClsxXSBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcm9iaC9saW51eC5naXQgcGFuZnJvc3QvaGVhcC1ub2V4ZWMKClJv
YiBIZXJyaW5nICg3KToKICBkcm0vZ2VtOiBBbGxvdyBzcGFyc2VseSBwb3B1bGF0ZWQgcGFnZSBh
cnJheXMgaW4gZHJtX2dlbV9wdXRfcGFnZXMKICBkcm0vc2htZW06IFB1dCBwYWdlcyBpbmRlcGVu
ZGVudCBvZiBhIFNHIHRhYmxlIGJlaW5nIHNldAogIGRybS9wYW5mcm9zdDogUmVzdHJ1Y3R1cmUg
dGhlIEdFTSBvYmplY3QgY3JlYXRpb24KICBkcm0vcGFuZnJvc3Q6IFNwbGl0IHBhbmZyb3N0X21t
dV9tYXAgU0cgbGlzdCBtYXBwaW5nIHRvIGl0cyBvd24KICAgIGZ1bmN0aW9uCiAgZHJtL3BhbmZy
b3N0OiBBZGQgYSBubyBleGVjdXRlIGZsYWcgZm9yIEJPIGFsbG9jYXRpb25zCiAgZHJtL3BhbmZy
b3N0OiBBZGQgc3VwcG9ydCBmb3IgR1BVIGhlYXAgYWxsb2NhdGlvbnMKICBkcm0vcGFuZnJvc3Q6
IEJ1bXAgZHJpdmVyIHZlcnNpb24gdG8gMS4xCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAg
ICAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBl
ci5jICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8gICAgICAgICAgIHwg
ICAyIC0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8ICA2MSArKysr
KystLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jIHwgIDkzICsrKysr
KysrKystLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwgIDE2ICst
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAxODkgKysrKysrKysr
KysrKysrKysrKystLS0tCiBpbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oICAgICAgICAg
fCAgIDMgKwogOCBmaWxlcyBjaGFuZ2VkLCAzMDcgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25z
KC0pCgotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
