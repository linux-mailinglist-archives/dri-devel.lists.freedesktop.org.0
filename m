Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADDA9B64
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986189E32;
	Thu,  5 Sep 2019 07:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1275989C61
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 20:08:39 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id 4so34932pld.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kh3Db9I7Xebgd/JXo/7tdzEdpkE9kcIoF13CE+aAkEE=;
 b=s23W+zK56iDLY/qW1iz4yiY0ftHbRUJmSIZ6NrOlbhoX6GhCp8RkZyW3W/8zMZfoN0
 D7HeXVVJs8tvPDBP0IA92qYeysnhYIzJFup2Sgjbyprmahf2R0UR7kP0heCGHKkqYFRE
 ooMJgIvd5ZZVqG9ruODLMFMiA9vtqt5K0wU4gUwafnaKX9gztPEr0+KIEoTWEBVqJe9V
 VQ69aEh1YfUYt+sqetZHl0YeKvBLCECyt1X0niCE8u7N6MkHcgt2ZPCj9dMf/XDJ7u6f
 9xlcVUdYYmsgvZQHco5PqVLqNMdL7UpTJHuFuWB1dJbBtvw4L3YSJ+l7/f03xo1aQhwb
 n71Q==
X-Gm-Message-State: APjAAAXT/QiPVlzZ2/HBHZ8wCSoUtstxN/nAuToUmeSjDKJf2hp6fXR3
 f0YBF8U3702t9KksODinlKY=
X-Google-Smtp-Source: APXvYqwjGoqqc2jFPB/XpUTiHEx4gG3gOWNX9YG+HjDfQCyNlyc9JVLCe5zU/6Gnw+sb7s4O0ycnTA==
X-Received: by 2002:a17:902:bb85:: with SMTP id
 m5mr8163482pls.336.1567627718035; 
 Wed, 04 Sep 2019 13:08:38 -0700 (PDT)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id x8sm6494440pfn.106.2019.09.04.13.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:08:37 -0700 (PDT)
From: Lepton Wu <ytht.net@gmail.com>
To: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 ray.huang@amd.com
Subject: [PATCH] drm/ttm: let ttm_bo_wait timeout be configurable
Date: Wed,  4 Sep 2019 13:08:27 -0700
Message-Id: <20190904200827.65930-1-ytht.net@gmail.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kh3Db9I7Xebgd/JXo/7tdzEdpkE9kcIoF13CE+aAkEE=;
 b=tyZd4y6N+JPRpcs9wvuZzU+8Vqds0BHbb4+1G+g2nQMaBK/XOwYKbmYcGsWoSdUaQo
 Q9b7GQJk2O09VxPwZS71X+I1QUX8e1z+bLcQ6oCD7BWw+W3fr42h3iiYxcy24aropwGM
 DehF0Laxn9bWvlhsayMJql5+IMRiAPcQyDF9y5dmmp9S4Wma8pyO7kZT2HgGWLnBXc72
 nvsac5Wb3J2RCnv1k9RTrDqh8wObO8xDyusCRhu7K6DfSz7cxhFZH5yATi2J89znfeHy
 z/V6C0AwdUuk3HFYB/bDZwUepJzI9j0LcJ/CmNBja+NvM3G0xHAsBRbXS6CCCcv9SAMe
 Gaog==
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
Cc: Lepton Wu <ytht.net@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBydW5uaW5nIGRFUVAgYWdhaW5zdCB2aXJnbCBkcml2ZXIsIGl0IHR1cm5zIG91dCB0aGUg
ZGVmYXVsdAoxNSBzZWNvbmRzIHRpbWVvdXQgZm9yIHR0bV9ib193YWl0IGlzIG5vdCBiaWcgZW5v
dWdoIGZvcgpHTEVTMzEuZnVuY3Rpb25hbC5zc2JvLmxheW91dC5yYW5kb20ubmVzdGVkX3N0cnVj
dHNfYXJyYXlzX2luc3RhbmNlX2FycmF5cy4yMgpDaGFuZ2UgaXQgdG8gYSBjb25maWd1cmFibGUg
dmFsdWUgc28gd2UgY2FuIHR1bmUgaXQgYmVmb3JlIHZpcmdsCnBlcmZvcm1hbmNlIGdldHMgaW1w
cm92ZWQuCgpTaWduZWQtb2ZmLWJ5OiBMZXB0b24gV3UgPHl0aHQubmV0QGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL3R0
bS9LY29uZmlnICB8IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDIg
Ky0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90dG0vS2NvbmZpZwoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKaW5kZXgg
YmQ5NDNhNzE3NTZjLi40MzIwNTQwMTJmYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCkBAIC0xNjAsNiArMTYwLDggQEAg
Y29uZmlnIERSTV9UVE0KIAkgIEdQVSBtZW1vcnkgdHlwZXMuIFdpbGwgYmUgZW5hYmxlZCBhdXRv
bWF0aWNhbGx5IGlmIGEgZGV2aWNlIGRyaXZlcgogCSAgdXNlcyBpdC4KIAorc291cmNlICJkcml2
ZXJzL2dwdS9kcm0vdHRtL0tjb25maWciCisKIGNvbmZpZyBEUk1fR0VNX0NNQV9IRUxQRVIKIAli
b29sCiAJZGVwZW5kcyBvbiBEUk0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vS2Nv
bmZpZyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vS2NvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLmM3OTUzMjcxYzU5YgotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vS2NvbmZpZwpAQCAtMCwwICsxLDcgQEAKK2NvbmZpZyBEUk1fVFRNX0JP
X1dBSVRfVElNRU9VVAorCWludCAiRGVmYXVsdCB0aW1lb3V0IGZvciB0dG0gYm8gd2FpdCAoaW4g
c2Vjb25kcykiCisJZGVwZW5kcyBvbiBEUk1fVFRNCisJZGVmYXVsdCAxNQorCWhlbHAKKwkgIFRo
aXMgb3B0aW9uIGNvbnRyb2xzIHRoZSBkZWZhdWx0IHRpbWVvdXQgKGluIHNlY29uZHMpIHVzZWQg
aW4KKwkgIHR0bV9ib193YWl0CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAzZjU2NjQ3Y2RiMzUuLmZi
Njk5MTgxMWVkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xNzA5LDcgKzE3MDksNyBAQCBFWFBP
UlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKIGludCB0dG1fYm9fd2FpdChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlib29sIGludGVycnVwdGlibGUsIGJvb2wgbm9fd2Fp
dCkKIHsKLQlsb25nIHRpbWVvdXQgPSAxNSAqIEhaOworCWxvbmcgdGltZW91dCA9IENPTkZJR19E
Uk1fVFRNX0JPX1dBSVRfVElNRU9VVCAqIEhaOwogCiAJaWYgKG5vX3dhaXQpIHsKIAkJaWYgKHJl
c2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25hbGVkX3JjdShiby0+cmVzdiwgdHJ1ZSkpCi0tIAoy
LjIzLjAuMTg3LmcxN2Y1Yjc1NTZjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
