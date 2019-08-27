Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F379F52A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 23:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D78892B5;
	Tue, 27 Aug 2019 21:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0D5892B5;
 Tue, 27 Aug 2019 21:36:44 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 4so166568pld.10;
 Tue, 27 Aug 2019 14:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+0AUBxbU6JVGwde8Yye0R2BikQpnByAsWECQmXnXdg=;
 b=B4kqgPEAtzCUu+NlUDdxegZK6H9ILaItYXBl96ejFRLMM/SNY4A4adoitsq/NmTYZm
 Slpiww1cDMQwtGCuRtXZxGGMCUouMrS8rAfREEI3ujeQFXlyi1XsMDiJ95+2OlEgXK+z
 qVsQq0SDlCR7V+6oHoFHPDistxQ1A4q/GwHvkaiXgjtBCNkL4y7oks9jXUl0GmQ/eof9
 CWZruz77HFpOXBItdGWHlpo9f7ZZwsSoBtoHOB8IXeZUaYLS/AYs4SO0v0wFgpwwQ7QL
 5PGM5FknGKeIwILt3nnCPNSjVyarCgdqzplgAGGEtzcal8aQDd0ZlCX6L9JWiSKuYsti
 abQw==
X-Gm-Message-State: APjAAAU4LYx09Ek4jW/rKsZtqPW5q7z6bhNBieRLtrq8Vbz6PcgD5/jg
 w/7hYkmW9iddh/JVLYUdpStmKsnVc5o=
X-Google-Smtp-Source: APXvYqy07weBiz46/PfoQJBr6AVmaA4u5nf1lNwSBxa3zqpE7lPXtS1ZoG1ndxvssYCOXXhfmOjHoQ==
X-Received: by 2002:a17:902:f01:: with SMTP id 1mr981614ply.337.1566941803570; 
 Tue, 27 Aug 2019 14:36:43 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id b126sm275451pfa.177.2019.08.27.14.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 14:36:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/msm: async commit support
Date: Tue, 27 Aug 2019 14:33:30 -0700
Message-Id: <20190827213421.21917-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+0AUBxbU6JVGwde8Yye0R2BikQpnByAsWECQmXnXdg=;
 b=ORQG6ecUUO5DHHrbAG09EZHk4pcKZezQuBxRAF+KWI2FGlRh5SpcXahV1RvNmYAeFl
 dn1epk7Ea0CJf26fKzI/BP5wzDexaa4K9aOFA2nGh98/oHHeHJf25lame43eyEgYOtNN
 PIexZfo4kWgQrIKgGV1PspZOBb53LpAoG5aO/wAbEqfUlEbIIcfTyK8+a52s3lXPXjbO
 bqeoqBQbMSkDMQoua45nrrUo0S9OSEBLwN9uRyZ0Zn505CbC+8+vogDtWZSCTTM6tahU
 7w9X76M1Jwnevb1HG3vcL5+/WlcOoFvyZAUVDkTldSvpT5s3xzipcHNQFsWS+KJTHJg8
 7RxA==
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
 <freedreno@lists.freedesktop.org>, Fritz Koenig <frkoenig@google.com>,
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
a3MsIHNvIGF0IGxlYXN0IHRoYXQgcGFydCBJIG1pZ2h0IHB1bnQgb24gZm9yCm5vdy4KClJvYiBD
bGFyayAoOSk6CiAgZHJtL21zbS9kcHU6IHVud2luZCBhc3luYyBjb21taXQgaGFuZGxpbmcKICBk
cm0vbXNtL2RwdTogYWRkIHJlYWwgd2FpdF9mb3JfY29tbWl0X2RvbmUoKQogIGRybS9tc20vZHB1
OiBoYW5kbGVfZnJhbWVfZG9uZSgpIGZyb20gdmJsYW5rIGlycQogIGRybS9tc206IGFkZCBrbXMt
PndhaXRfZmx1c2goKQogIGRybS9tc206IGNvbnZlcnQga21zLT5jb21wbGV0ZV9jb21taXQoKSB0
byBjcnRjX21hc2sKICBkcm0vbXNtOiBhZGQga21zLT5mbHVzaF9jb21taXQoKQogIGRybS9tc206
IHNwbGl0IHBvd2VyIGNvbnRyb2wgZnJvbSBwcmVwYXJlL2NvbXBsZXRlX2NvbW1pdAogIGRybS9t
c206IGFzeW5jIGNvbW1pdCBzdXBwb3J0CiAgZHJtL21zbS9kcHU6IGFzeW5jIGNvbW1pdCBzdXBw
b3J0CgogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyAgICAgIHwgIDQ4
ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmggICAgICB8ICAg
NyArLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyAgIHwgIDQ2
ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmggICB8ICAg
OCArLQogLi4uL2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMgIHwgIDM5
ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyAgICAgICB8ICA5
OSArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfa21zLmMgICAg
ICB8ICA0OCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICAg
ICAgfCAgNDcgKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMgICAgICAgICAg
ICAgIHwgMjEwICsrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5o
ICAgICAgICAgICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9rbXMuaCAg
ICAgICAgICAgICAgICAgfCAxMDggKysrKysrKystCiAxMiBmaWxlcyBjaGFuZ2VkLCA0NjYgaW5z
ZXJ0aW9ucygrKSwgMTk5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
