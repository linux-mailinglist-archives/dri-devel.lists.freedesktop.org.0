Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A086ABF4BE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540176ED29;
	Thu, 26 Sep 2019 14:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4576ED29;
 Thu, 26 Sep 2019 14:11:26 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id q15so1115969pll.11;
 Thu, 26 Sep 2019 07:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=r/6D0GMWgNqslpXv1q7faCjjUSVY8BftjhuplhunR5c=;
 b=iB6OeWq4AIl44ocUl68kmdED5wz+sDPHXfKVyNoW2LD8lOUgdEznb8w/5nISJ/qvtJ
 nicjCVFcbgzeFp5zwQrMh23MdubYC2ltTasKvKEMsFZ1909AGCM4MgIthAdwUD5VmfbF
 7IdSlm38sb3xW8JZx4mCeom8y+ykdaD6O0aE8Kaxya/DfOulA0hS0skILj06k0Y53F3X
 DIISJYOOuFfY/jWHKMjVuJ7uAnIqcjqMjFyMuopIbM4+S17DTPABEQlJHAGuznVKyZ2+
 9MdKvT0Z5FQpM3Ffde4W1Yc/17bpkgSPnkVvUQni8uN3Dsm3Xakx0DI6Uk4twvWDX538
 Vjdw==
X-Gm-Message-State: APjAAAVs7DvZpcW20pNWdk4CqMQGcoJyoLjrzozvAsKhZuVqnrpnVlfw
 H3XZRZJK1rtW8NqZuuPyVzcZT4W6
X-Google-Smtp-Source: APXvYqyeAQboA4yB5RR/Z3y2+WCXZYsoWqVUXwrUcjn9GMpud5NskNXIxmGW3MChXMrLPeTzzWK0lA==
X-Received: by 2002:a17:902:76c1:: with SMTP id
 j1mr4107898plt.270.1569507085818; 
 Thu, 26 Sep 2019 07:11:25 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 w188sm2176740pgw.26.2019.09.26.07.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:11:25 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/lima: simplify driver by using more drm helpers
Date: Thu, 26 Sep 2019 22:10:38 +0800
Message-Id: <20190926141046.30758-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=r/6D0GMWgNqslpXv1q7faCjjUSVY8BftjhuplhunR5c=;
 b=rPizMRqABrG/q6lr2IbPCBXR11Y9meERg35+mKUYG4N2Eaj9RtUef742Ah5Vv2u2D0
 xRkO1+dfQ3eRoWpIqnu9zqfPA7uQ/U+tmExPecxpc0jliSpTl2HbLiyO4H5Elox5Wi8n
 u/PkxMl3NQqOeHRx03PJtQsM6G/hPk/+mWf1WOreQl2kiwH+w3JSsPXgICMNx96PDd3z
 NfRqvfWSTkZEQo/IvTBWUo0EDGFUER/Iq/Ezn/zQSQnvjl0P3q7VTAwd66DJ04mJdrRk
 SlFtW405jPUBbF7sw7gcWMkqXP6wrA8D2T35GRPLTNkMY7UjTCKTiG9IX3dGZk2JG1d0
 NZAA==
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
YXNlZCBvbiBkcm0tbWlzYy1uZXh0IGJyYW5jaAoKUWlhbmcgWXUgKDYpOgogIGRybS9nZW06IHJl
ZmluZSBkcm1fZ2VtX29iamVjdHNfbG9va3VwCiAgZHJtL3YzZDogdXNlIGRybV9nZW1fb2JqZWN0
c19sb29rdXAKICBkcm0vbGltYTogdXNlIGRybV9nZW1fb2JqZWN0c19sb29rdXAKICBkcm0vbGlt
YTogdXNlIGRybV9nZW1fc2htZW1faGVscGVycwogIGRybS9saW1hOiB1c2UgZHJtX2dlbV8odW4p
bG9ja19yZXNlcnZhdGlvbnMKICBkcm0vbGltYTogYWRkIF9fR0ZQX05PV0FSTiBmbGFnIHRvIGFs
bCBkbWFfYWxsb2Nfd2MKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAg
fCAgMjggKy0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9LY29uZmlnICAgICAgICAgICAgfCAgIDEg
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
YyB8ICAyMyArKy0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jICAgICAgICAgICB8ICAz
NSArLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgfCAgIDIgKy0K
IDE3IGZpbGVzIGNoYW5nZWQsIDIyMiBpbnNlcnRpb25zKCspLCA0OTMgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuYwog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtX3ByaW1lLmgK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5jCiBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9vYmplY3QuaAoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
