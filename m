Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D4C0699
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0424C6E153;
	Fri, 27 Sep 2019 13:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CD16E14F;
 Fri, 27 Sep 2019 13:46:56 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q21so1617432pfn.11;
 Fri, 27 Sep 2019 06:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C/ds6p8Co/3yoC3Gx9T6VFw2lfvFYrffpSmoNcSQPEM=;
 b=a1nq76MkTIE+kAKfrrOQBH/rWD/xoTp1t6F6KjritwQ0e/rnq5ZUPhA/QFUveqcg/q
 i8zHPgesNtHcwX2C7pJXfJSs0QbpnL/ywqlol6RI9s2nbDfy9mp9764bxcASnVX+UIH1
 AW7+1R6c5hY61I9qA4G/dFsaJ11p4BBaaXjOALDDeopAO+SV3ouV8rLGKcY9ODFIKNeU
 +2uRcX/O5aMe/Na5VGbA62KIses5gPVWsebMuUua3m1Gg8uOPhM3NoFWeGIv4GakB7ue
 BsEuYy1o5d5xu4WDH+0Lzf6yWI/ib3psv6j7khdM5TPl+O4IDPWqk2GSwaBTJgD76ZLu
 wIOQ==
X-Gm-Message-State: APjAAAX1JQPTLMO7W0fNAhnII3oAOY8tklJddswotF1u7jO1XH2xl241
 nAQLUfMW5MYmlkdr1Cxl1wvj8er8yvw=
X-Google-Smtp-Source: APXvYqzMGjuhbePP+vF9V7TBfABoBMxJTrlFlTEpMqitk0m0KMD+Aidku1kIKBD5NruDBo/1BjGwOA==
X-Received: by 2002:a63:78cf:: with SMTP id t198mr9477305pgc.227.1569592016000; 
 Fri, 27 Sep 2019 06:46:56 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 q71sm5608860pjb.26.2019.09.27.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:46:55 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/lima: simplify driver by using more drm helpers
Date: Fri, 27 Sep 2019 21:46:10 +0800
Message-Id: <20190927134616.21899-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C/ds6p8Co/3yoC3Gx9T6VFw2lfvFYrffpSmoNcSQPEM=;
 b=gzCtKjT9lyU2NKmymeBsnUx3aNo+xjA73WPeTvloYYNPUAGuI2Vxhe4tjZhkEGfMd0
 lTukcNmgVpib4nth90WIYnLaYXzBo0QtJgGqGupDIG2hEuXKy6brvO6GWVVI3eoza+Mm
 vc0E4yArZ54lXHAfUPYcqaACj9BPh3pfjJKEi/498/TV6ZWIjTJ/aZ1zlNnMJ3k6CXbN
 2qZD8pEvlutjxmRw3fuIgK4Zt3MMDPeSpUXYsrLOvn4lzLFHnEAt/yhOpU2W82tSD1b5
 OGN9NVjCrbTbiH44ya2kQ7iQBtKDu09Ty6jOT4U+FF24MtinCsbPop9WW8ihOCtlJGj8
 XdCQ==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnkgdXNpbmcgc2hhcmVkIGRybSBoZWxwZXJzOgoxLiBkcm1fZ2VtX29iamVjdHNfbG9va3VwCjIu
IGRybV9nZW1fKHVuKWxvY2tfcmVzZXJ2YXRpb25zCjMuIGRybV9nZW1fc2htZW1faGVscGVycwp3
ZSBjYW4gc2ltcGxpZnkgbGltYSBkcml2ZXIgYSBsb3QgYW5kIGJlbmlmaXQgZnJvbSB1cGRhdGVz
IHRvCnRoZXNlIGZ1bmN0aW9ucy4KCmRybV9nZW1fb2JqZWN0c19sb29rdXAgbmVlZCBhIHJlZmlu
ZSBpbiBvcmRlciB0byBiZSB1c2VkIGJ5IGxpbWEuCgpOb3RlOgoxLiBjaGFuZ2VzIHRvIHBhbmZy
b3N0IGFuZCB2M2QgYXJlIGp1c3QgY29tcGlsZSB0ZXN0ZWQuCjIuIHBhdGNoIHNlcmllcyBpcyBi
YXNlZCBvbiBkcm0tbWlzYy1uZXh0IGJyYW5jaAoKdjI6CkFkZCBkcm1fZ2VtX29iamVjdHNfbG9v
a3VwX3VzZXIgYW5kIHVzZSBpdCBmb3IgZHJpdmVyIHdoaWNoCnBhc3MgdXNlciBHRU0gaGFuZGxl
cyBpbiBjb250aW91cyBhcnJheS4KClFpYW5nIFl1ICg2KToKICBkcm0vZ2VtOiByZWZpbmUgZHJt
X2dlbV9vYmplY3RzX2xvb2t1cAogIGRybS92M2Q6IHVzZSBkcm1fZ2VtX29iamVjdHNfbG9va3Vw
X3VzZXIKICBkcm0vbGltYTogdXNlIGRybV9nZW1fb2JqZWN0c19sb29rdXAKICBkcm0vbGltYTog
dXNlIGRybV9nZW1fc2htZW1faGVscGVycwogIGRybS9saW1hOiB1c2UgZHJtX2dlbV8odW4pbG9j
a19yZXNlcnZhdGlvbnMKICBkcm0vbGltYTogYWRkIF9fR0ZQX05PV0FSTiBmbGFnIHRvIGFsbCBk
bWFfYWxsb2Nfd2MKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCAg
NTcgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9LY29uZmlnICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9ncHUvZHJtL2xpbWEvTWFrZWZpbGUgICAgICAgICAgIHwgICA0ICstCiBkcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9saW1hL2xpbWFfZHJ2LmMgICAgICAgICB8ICAyNyArLS0KIGRyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfZ2VtLmMgICAgICAgICB8IDI1NCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmggICAgICAgICB8ICAzMiArKy0KIGRyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfZ2VtX3ByaW1lLmMgICB8ICA0NiAtLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuaCAgIHwgIDEzIC0tCiBkcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX21tdS5jICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9v
YmplY3QuYyAgICAgIHwgMTE5IC0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1h
X29iamVjdC5oICAgICAgfCAgMzUgLS0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hl
ZC5jICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMgICAgICAg
ICAgfCAgODcgKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YyB8ICAgNiArLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgICAgICAgICAgIHwgIDQ5
ICstLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgfCAgIDQgKy0K
IDE3IGZpbGVzIGNoYW5nZWQsIDIzOSBpbnNlcnRpb25zKCspLCA1MDQgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuYwog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtX3ByaW1lLmgK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5jCiBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9vYmplY3QuaAoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
