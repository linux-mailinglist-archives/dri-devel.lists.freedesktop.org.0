Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932680161
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712CF6E3BF;
	Fri,  2 Aug 2019 19:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557106E3BF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:51:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j6so34878948ioa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hJ1dStHJHDZt/u7J+jUx9kQUDFd7+pS3b9F7nUFwHYA=;
 b=pTlWfcFmDvQ6Yilt8Y+PEU0y8nIhLN0XuBkwnon79HU6BrjlcLnGyX/eQ/4RgVhyQ1
 RDDFJ0EWvL1eMz0TlQRs+D2Sqmk3t3vv7sbVGq1XYVaw9VL/0XSLK/jS6LP/51XAClwH
 hWyYZkyWuTt6sbrhBz2A4Wh8gctGmx6KmV0Md30ap6uUOpYiDE9JCgTDAtgp3CZpZ69l
 POw3xX4X1mgcTvGz8kH5csuDAfQOmRb5qQhz0y8X3p9gECheyMHyu54PbcUSSNd77ccO
 Nohl60T98cZ1WwvZBqBMoDA00DBeJ9vPMRxpjQX+8YYJr/vRsNJI/1gk9x05tTimo2FQ
 WWMQ==
X-Gm-Message-State: APjAAAWV6V5w15fY5lwj8zVy9qQhCLXBDJE0dzt38u61ycd43CuOu3B6
 LjTJt56VeDVGTp95cKpibM0fdgU=
X-Google-Smtp-Source: APXvYqxTjDyHe4x7KQaq23T+DTyIohoBHrRK1UdK2pKC2rh+ZThLltY84EdV1Qyk03xGuzvxeZjv2A==
X-Received: by 2002:a05:6638:3d2:: with SMTP id
 r18mr1133283jaq.13.1564775512150; 
 Fri, 02 Aug 2019 12:51:52 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.51.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:51:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] drm/panfrost: Add heap and no execute buffer allocation
Date: Fri,  2 Aug 2019 13:51:42 -0600
Message-Id: <20190802195150.23207-1-robh@kernel.org>
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
biBvbiBHUFUgcGFnZSBmYXVsdHMuCgpUb21ldSByZXBvcnRzIGhlIGhhcyB0ZXN0ZWQgdGhpcyBp
biB0aGUgcGFuZnJvc3QgQ0kuCgpUaGlzIGlzIGJhc2VkIG9uIGRybS1taXNjLW5leHQuIEFuIHVw
ZGF0ZWQgYnJhbmNoIGlzIGhlcmVbMV0uCgp2MzoKIC0gUmV0YWluIHNoYXJlZCBpcnEgc3VwcG9y
dCwgc3BsaXR0aW5nIElSUSBjaGFuZ2VzIHRvIHNlcGFyYXRlIHBhdGNoICg2LzgpCiAtIFN0b3Ag
bGVha2luZyBTRyB0YWJsZXMKIC0gUHJldmVudCBtbWFwIGFuZCBwaW5uaW5nIHBhZ2VzIGZvciBo
ZWFwIEJPcwoKUm9iCgpbMV0gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3JvYmgvbGludXguZ2l0IHBhbmZyb3N0L2hlYXAtbm9leGVjCgoKUm9iIEhlcnJpbmcg
KDgpOgogIGRybS9nZW06IEFsbG93IHNwYXJzZWx5IHBvcHVsYXRlZCBwYWdlIGFycmF5cyBpbiBk
cm1fZ2VtX3B1dF9wYWdlcwogIGRybS9zaG1lbTogUHV0IHBhZ2VzIGluZGVwZW5kZW50IG9mIGEg
U0cgdGFibGUgYmVpbmcgc2V0CiAgZHJtL3BhbmZyb3N0OiBSZXN0cnVjdHVyZSB0aGUgR0VNIG9i
amVjdCBjcmVhdGlvbgogIGRybS9wYW5mcm9zdDogU3BsaXQgcGFuZnJvc3RfbW11X21hcCBTRyBs
aXN0IG1hcHBpbmcgdG8gaXRzIG93bgogICAgZnVuY3Rpb24KICBkcm0vcGFuZnJvc3Q6IEFkZCBh
IG5vIGV4ZWN1dGUgZmxhZyBmb3IgQk8gYWxsb2NhdGlvbnMKICBkcm0vcGFuZnJvc3Q6IENvbnZl
cnQgTU1VIElSUSBoYW5kbGVyIHRvIHRocmVhZGVkIGhhbmRsZXIKICBkcm0vcGFuZnJvc3Q6IEFk
ZCBzdXBwb3J0IGZvciBHUFUgaGVhcCBhbGxvY2F0aW9ucwogIGRybS9wYW5mcm9zdDogQnVtcCBk
cml2ZXIgdmVyc2lvbiB0byAxLjEKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAg
ICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgIHwg
ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETyAgICAgICAgICAgfCAgIDIgLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgIDY1ICsrKysrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgfCAxMDYgKysrKysrKysrKyst
LQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwgIDE2ICstCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMDAgKysrKysrKysrKysrKysr
KysrKystLS0tCiBpbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oICAgICAgICAgfCAgIDMg
KwogOCBmaWxlcyBjaGFuZ2VkLCAzMzMgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCgot
LQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
