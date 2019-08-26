Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921959D929
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B8B89C8D;
	Mon, 26 Aug 2019 22:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29DB89C8D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:19 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id r20so16792716ota.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsndA9b/rejbqoOXLlE/f9LLe1+k2/Vp5Vj3Isfdruk=;
 b=ecpmjPnVaYLMC62HP8drOi4eNPapePZVSaqvV6HpusqbEOENl9dfZCGusFn4BJVOsU
 PMDqpXqT7m2Ih7hyqv6LuFKwEGg95diYKnT22v5sqeqzXB5apyoC5AkciFHOQC9brozQ
 zd/9/dFGmG/+13wYaOJX2RdNDO1wPHu/5/ysbAlGkCvHV4XVf1VJ9OODrZ5VB7pgebOc
 LNq7c0mZix0AzS1WM95bwf1WZW6vGEqR0y5FbPULg+k9akvg8dfq8sfD4PlTiIfeNfEQ
 PpFe7LyKK4XNRNgIDkCyWbqCkMBY14UpMcARjzRTIuzBo/kxfvIxL22uGfD7TcVV1Nze
 XCPw==
X-Gm-Message-State: APjAAAVZ9BZlaSKBl6eVu2/a7V00Oh5EUPuJ1Ku0VU0yGtEtnfP3BP/R
 Rv/kFlVGLD6d2mFcQga033eCpdI=
X-Google-Smtp-Source: APXvYqyr0RilZ0oP8nE2x8QknahmMNmdz14dLznaHmNDTjin7dD73nevgHwWvBd6SNzxwYk3Y8BsNg==
X-Received: by 2002:a9d:450b:: with SMTP id w11mr16660606ote.15.1566858798539; 
 Mon, 26 Aug 2019 15:33:18 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] panfrost: Locking and runtime PM fixes
Date: Mon, 26 Aug 2019 17:33:09 -0500
Message-Id: <20190826223317.28509-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBmdXJ0aGVyIHRlc3Rpbmcgb2YgcmVjZW50IGNoYW5nZXMgd2l0aCBsb2NrZGVwIGlkZW50
aWZpZWQgc29tZQpsb2NraW5nIGlzc3Vlcy4gQXZvaWRpbmcgbG9ja2RlcCBpc3N1ZXMgbWVhbnMg
d2UgbmVlZCB0byBhdm9pZCBzb21lCmxvY2tzIGluIHBhbmZyb3N0X21tdV91bm1hcCB3aGljaCBp
biB0dXJuIG1lYW5zIGF2b2lkaW5nIHJ1bnRpbWUgUE0KcmVzdW1lLiBJbiB0aGUgcHJvY2VzcyBv
ZiByZS13b3JraW5nIHJ1bnRpbWUgUE0gc2V2ZXJhbCBydW50aW1lIFBNCmFuZCBsb2NraW5nIGNs
ZWFuLXVwcyBoYXZlIGJlZW4gaWRlbnRpZmllZC4KCnYzOgogLSBBcHBsaWVkIHBhdGNoZXMgMSwg
NCwgNSwgYW5kIDYKIC0gRml4IHJhY2UgaW4gam9iIHRpbWVvdXQgaGFuZGxpbmcgd2l0aCBJU1IK
IC0gUmVtb3ZlIHNvbWUgbm8gbG9uZ2VyIG5lZWRlZCBsb2NrcwogLSBGaXggcGFuZnJvc3RfbW11
X3VubWFwIHdoZW4gYXV0b3N1c3BlbmQgZGVsYXkgaXMgPiAwCiAtIERpc2FibGUgQVMgTU1VIHdo
ZW4gZnJlZWluZyBwYWdlIHRhYmxlcwoKdjI6CiAtIERyb3AgYWxyZWFkeSBhcHBsaWVkICdkcm0v
cGFuZnJvc3Q6IEZpeCBzbGVlcGluZyB3aGlsZSBhdG9taWMgaW4KICAgcGFuZnJvc3RfZ2VtX29w
ZW4nCiAtIFJ1bnRpbWUgUE0gY2xlYW4tdXBzCiAtIEtlZXAgcGFuZnJvc3RfZ2VtX3B1cmdlIGFu
ZCB1c2UgbXV0ZXhfdHJ5bG9jayB0aGVyZQogLSBSZXdvcmsgcGFuZnJvc3RfbW11X3VubWFwIHJ1
bnRpbWUgUE0KClJvYgoKUm9iIEhlcnJpbmcgKDgpOgogIGRybS9wYW5mcm9zdDogUmV3b3JrIHJ1
bnRpbWUgUE0gaW5pdGlhbGl6YXRpb24KICBkcm0vcGFuZnJvc3Q6IEhvbGQgcnVudGltZSBQTSBy
ZWZlcmVuY2UgdW50aWwgam9icyBjb21wbGV0ZQogIGRybS9wYW5mcm9zdDogUmVtb3ZlIHVubmVj
ZXNzYXJ5IG1tdS0+bG9jayBtdXRleAogIGRybS9wYW5mcm9zdDogUmV3b3JrIHBhZ2UgdGFibGUg
Zmx1c2hpbmcgYW5kIHJ1bnRpbWUgUE0gaW50ZXJhY3Rpb24KICBkcm0vcGFuZnJvc3Q6IFNwbGl0
IG1tdV9od19kb19vcGVyYXRpb24gaW50byBsb2NrZWQgYW5kIHVubG9ja2VkCiAgICB2ZXJzaW9u
CiAgZHJtL3BhbmZyb3N0OiBBZGQgY2FjaGUvVExCIGZsdXNoIGJlZm9yZSBzd2l0Y2hpbmcgYWRk
cmVzcyBzcGFjZQogIGRybS9wYW5mcm9zdDogRmx1c2ggYW5kIGRpc2FibGUgYWRkcmVzcyBzcGFj
ZSB3aGVuIGZyZWVpbmcgcGFnZSB0YWJsZXMKICBkcm0vcGFuZnJvc3Q6IFJlbW92ZSB1bm5lY2Vz
c2FyeSBod2FjY2Vzc19sb2NrIHNwaW5fbG9jawoKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuYyB8IDEwIC0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5oIHwgIDMgLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jICAgIHwgMTAgKystCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMg
ICAgfCA0MyArKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11
LmMgICAgfCA5MSArKysrKysrKysrLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDc2IGlu
c2VydGlvbnMoKyksIDgxIGRlbGV0aW9ucygtKQoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
