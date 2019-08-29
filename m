Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D7A2147
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 18:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3BD6E139;
	Thu, 29 Aug 2019 16:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5DB6E134;
 Thu, 29 Aug 2019 16:49:06 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l21so1895293pgm.3;
 Thu, 29 Aug 2019 09:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+npB6gUnTr3XNVbB8y8PFXfDiZznn6tH9wpAPdNtoUY=;
 b=szNlWC3+ji6nJ39bp7dbw2sTPSK4G9Gl0V2SE5dwOUkJuJ1yrYQXaXRo4K7sykuMgY
 eRTTZL5/XBKU1rPUPExvhoWUjAerVDp+MnGTmZD4YKCj7lZNE5c9zDzkbmMSVe+6a0Dt
 mIVctipm0cPKFPWmcrxvnWkYi5SC7g89j5ubXwkkLVfRpJPi5Ve8BVrlygc558rhxz/H
 xoIpHw2S85SloQHvpl/QBUBy0XOzU7ZV8CA3yZ3q3A5Ib4CvRCUp/+XF1vaA2/EJZmNU
 H6iAeUimGF3vibakhklZBq+jTqy52VHUKqATek4gIXQEY1JmAONuKqAkT76hgeCdN92Z
 qNBQ==
X-Gm-Message-State: APjAAAVA77GUcOhZEgh9zvEB/+qP846vTJt21fBfb0sOZbIOXyR7b2G4
 WAJyFhgMp+L/XP64oX+Wxq6PAe2xoYo=
X-Google-Smtp-Source: APXvYqxLUVD6+RHIyQbQ5RzIhVdLH8xfXFQXctXy0PMz8f8mfl97Hj12wgCKW6hQnaI6O8GFBBO2BA==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr11133504pjs.31.1567097345796; 
 Thu, 29 Aug 2019 09:49:05 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id y9sm3548671pfn.152.2019.08.29.09.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:49:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] drm/msm: async commit support (v2)
Date: Thu, 29 Aug 2019 09:45:08 -0700
Message-Id: <20190829164601.11615-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+npB6gUnTr3XNVbB8y8PFXfDiZznn6tH9wpAPdNtoUY=;
 b=H6PCbsL4lkrK49kVBBw7zNbF2XUqct4jZEBExuqbxGaqcHnBLk6MWn6QLAgnza710W
 JGNb16n+DysidYP3kakhXN15EUuJ+qLDiX96yNuKm+s1Vk3bSXCgX0Kajimk/WQNyJmU
 6UNX6hrLBZR1lbTrJIxyOrGYmE0P3ijlx1K7rPwVdCcjacCNPYGZjPze69HcJA30yVkM
 9alFhTfuEIxNUCAMyFC7fmRR9tFf++1Zf9YPYFRsgEyWuCAsQXZZotGfBgG1fMlNOObD
 QXu/0M31fbjOU+3HI0dE1l65vOHT/dGR/1IJ3zKz3zqjkNgRV1b79XkKya0zM80m/1bR
 Mpxw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Marek <jonathan@marek.ca>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, Georgi Djakov <georgi.djakov@linaro.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKQ3VycmVudGx5IHRoZSBk
cHUgYmFja2VuZCBhdHRlbXB0cyB0byBoYW5kbGUgYXN5bmMgY29tbWl0cy4gIEJ1dCBpdAppcyBy
YWNleSBhbmQgY291bGQgcmVzdWx0IGluIGZsdXNoaW5nIG11bHRpcGxlIHRpbWVzIGluIGEgZnJh
bWUsIG9yCm1vZGlmeWluZyBodyBzdGF0ZSAoc3VjaCBhcyBzY2Fub3V0IGFkZHJlc3Mgb3IgY3Vy
c29yIHBvc2l0aW9uKSBhZnRlcgp0aGUgcHJldmlvdXMgZmx1c2gsIGJ1dCBiZWZvcmUgdmJsYW5r
LCBjYXVzaW5nIHVuZGVyZmxvd3MgKHdoaWNoCm1hbmlmZXN0IGFzIGJyaWVmIGJsYWNrIGZsYXNo
ZXMpLgoKVGhpcyBwYXRjaHNldCByZW1vdmVzIHRoZSBwcmV2aW91cyBkcHUgYXN5bmMgY29tbWl0
IGhhbmRsaW5nLCBhbmQKcmV3b3JrcyB0aGUgaW50ZXJuYWwga21zIGJhY2tlbmQgQVBJIHRvIGRl
Y291cGxlIGZsdXNoaW5nLiAgQW5kIGluCnRoZSBlbmQgaW50cm9kdWNlcyBhbiBocnRpbWVyIHRv
IGZsdXNoIGFzeW5jIHVwZGF0ZXMuICBUaGUgb3ZlcmFsbAphcHByb2FjaCBpczoKCiAxKSBNb3Zl
IGZsdXNoaW5nIHZhcmlvdXMgaHcgc3RhdGUgb3V0IG9mIGVuY29kZXIvY3J0YyBhdG9taWMgY29t
bWl0CiAgICAod2hpY2ggaXMgYW55d2F5cyBhbiBpbXByb3ZlbWVudCBvdmVyIHRoZSBjdXJyZW50
IHN0YXRlLCB3aGVyZQogICAgd2UgZWl0aGVyIGZsdXNoIGZyb20gY3J0YyBvciBlbmNvZGVyLCBk
ZXBlbmRpbmcgb24gd2hldGhlciBpdCBpcwogICAgYSBmdWxsIG1vZGVzZXQpCgogMikgU3dpdGNo
IHRvIGNydGNfbWFzayBmb3IgYW55dGhpbmcgdGhhdCBjb21wbGV0ZXMgYWZ0ZXIgYXRvbWljCiAg
ICBfY29tbWl0X3RhaWwoKSwgc28gd2UgZG8gbm90IG5lZWQgdG8ga2VlcCB0aGUgYXRvbWljIHN0
YXRlCiAgICBhcm91bmQuICBJZS4gZnJvbSBkcm0gY29yZSdzIHBlcnNwZWN0aXZlLCBhbiBhc3lu
YyBjb21taXQKICAgIGNvbXBsZXRlcyBpbW1lZGlhdGVseS4KCiAgICBUaGlzIGF2b2lkcyBmaWdo
dGluZyB3aXRoIGRybSBjb3JlIGFib3V0IHRoZSBsaWZlY3ljbGUgb2YgYW4KICAgIGF0b21pYyBz
dGF0ZSBvYmplY3QuCgogMykgVHJhY2sgYSBiaXRtYXNrIG9mIGNydGNzIHcvIHBlbmRpbmcgYXN5
bmMgZmx1c2gsIGFuZCBzZXR1cAogICAgYW4gaHJ0aW1lciB3aXRoIGV4cGlyYXRpb24gMW1zIGJl
Zm9yZSB2YmxhbmssIHRvIHRyaWdnZXIKICAgIHRoZSBmbHVzaC4gIEZvciBhc3luYyBjb21taXRz
LCB3ZSBwdXNoIHRoZSBzdGF0ZSBkb3duIHRvCiAgICB0aGUgZG91YmxlIGJ1ZmZlcmVkIGh3IHJl
Z2lzdGVycyBpbW1lZGlhdGVseSwgYW5kIG9ubHkKICAgIGRlZmVyIHdyaXRpbmcgdGhlIGZsdXNo
IHJlZ2lzdGVycy4KCkN1cnJlbnQgcGF0Y2hzZXQgb25seSBpbmNsdWRlcyB0aGUgZHB1IGJhY2tl
bmQgc3VwcG9ydCBmb3IgYXN5bmMKY29tbWl0cy4uIG1kcDQgYW5kIG1kcDUgc2hvdWxkIGJlIHJl
bGF0aXZlbHkgdHJpdmlhbCAobGVzcyBsYXllcnMKb2YgaW5kaXJlY3Rpb24gaW52b2x2ZWQpLiAg
QnV0IEkgd29uJ3QgaGF2ZSBhY2Nlc3MgdG8gYW55IG1kcDQgaHcKZm9yIGEgZmV3IG1vcmUgd2Vl
a3MsIHNvIGF0IGxlYXN0IHRoYXQgcGFydCBJIG1pZ2h0IHB1bnQgb24gZm9yCm5vdy4KCnYyOiBj
b3VwbGUgc21hbGwgY29zbWV0aWMgdXBkYXRlcywgcmUtd29yayBsb2NraW5nIHRvIGF2b2lkIHN0
YWxscywKICAgIGFkZCBzb21lIHRyYWNlcG9pbnRzCgpSb2IgQ2xhcmsgKDEwKToKICBkcm0vbXNt
L2RwdTogdW53aW5kIGFzeW5jIGNvbW1pdCBoYW5kbGluZwogIGRybS9tc20vZHB1OiBhZGQgcmVh
bCB3YWl0X2Zvcl9jb21taXRfZG9uZSgpCiAgZHJtL21zbS9kcHU6IGhhbmRsZV9mcmFtZV9kb25l
KCkgZnJvbSB2YmxhbmsgaXJxCiAgZHJtL21zbTogYWRkIGttcy0+d2FpdF9mbHVzaCgpCiAgZHJt
L21zbTogY29udmVydCBrbXMtPmNvbXBsZXRlX2NvbW1pdCgpIHRvIGNydGNfbWFzawogIGRybS9t
c206IGFkZCBrbXMtPmZsdXNoX2NvbW1pdCgpCiAgZHJtL21zbTogc3BsaXQgcG93ZXIgY29udHJv
bCBmcm9tIHByZXBhcmUvY29tcGxldGVfY29tbWl0CiAgZHJtL21zbTogYXN5bmMgY29tbWl0IHN1
cHBvcnQKICBkcm0vbXNtL2RwdTogYXN5bmMgY29tbWl0IHN1cHBvcnQKICBkcm0vbXNtOiBhZGQg
YXRvbWljIHRyYWNlcwoKIGRyaXZlcnMvZ3B1L2RybS9tc20vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jICAg
ICAgfCAgNDggKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuaCAg
ICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5j
ICAgfCAgNDYgKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIu
aCAgIHwgICA4ICstCiAuLi4vZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQu
YyAgfCAgMzkgKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgICAg
ICAgfCAgOTkgKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfa21z
LmMgICAgICB8ICA0OCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2tt
cy5jICAgICAgfCAgNDcgKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMgICAg
ICAgICAgICAgIHwgMjMzICsrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fYXRvbWljX3RyYWNlLmggICAgICAgIHwgMTEwICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fYXRvbWljX3RyYWNlcG9pbnRzLmMgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2Rydi5jICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9kcnYuaCAgICAgICAgICAgICAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1X3RyYWNlLmggICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9rbXMuaCAgICAgICAgICAgICAgICAgfCAxMDggKysrKysrKy0KIDE2IGZpbGVzIGNoYW5nZWQs
IDYwMyBpbnNlcnRpb25zKCspLCAyMDEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljX3RyYWNlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9hdG9taWNfdHJhY2Vwb2ludHMuYwoKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
