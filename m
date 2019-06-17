Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0A490E9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0688830;
	Mon, 17 Jun 2019 20:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB28888BBA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:09:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c11so7026156qkk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnuYMa6vIBfYmE14DNuXdWYP2V9cYpPN1XP5Rkgp6fA=;
 b=kOHCBoVbWc8t1zemkUi9uN79cYKeg3zzScN85dlZ+7SK/xAKepneo4n96ISBnvTfQa
 fh/h1/yVLi915xM6R7ESadFMezhaonGD0T4luUqvrqJh9Gj0cSt1OQCfya9Vpr/VFDEt
 HaUfNvHUiwbaAAhddUC5a1/oQK10KAEQ7tmmu0YvL8lgy0/2kC+lhkgQAzbGkUHtwR5Y
 +xp89OOWgKkI1D5AoAPyxhspGK9M82kTXucYSxtI43tOvcAgTWrExt5Z4QxuL8xlhAk4
 NScd+fyld1npcltZYGm0MIqvZnL9RvyW7p+czMZT5wfRkEWobyX7NitnU3wKDNWkRMar
 SINg==
X-Gm-Message-State: APjAAAUmClBMpa4VJjE0OsNkaeyS8C3+49gcT8c6A046i39epnI4Q8Dp
 X5DQsyceiAbK1b6bT4LuWKK47Qw17t8=
X-Google-Smtp-Source: APXvYqzsEntNgVAPgcjag9ZN8RYTpVZ7OhVksMaCG0wgtxyD8CuLCaHM1I/CD5xcFOVbil7MXHowtw==
X-Received: by 2002:a37:4d82:: with SMTP id a124mr19092881qkb.72.1560802177050; 
 Mon, 17 Jun 2019 13:09:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id n5sm7962291qta.29.2019.06.17.13.09.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:09:36 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 03/13] drm/msm/phy/dsi_phy: Set pll to NULL in case
 initialization fails
Date: Mon, 17 Jun 2019 16:09:17 -0400
Message-Id: <20190617200920.133104-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617200405.131843-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnuYMa6vIBfYmE14DNuXdWYP2V9cYpPN1XP5Rkgp6fA=;
 b=IpQnUzLOlbu+Z8jGufVfx562/7WbHg41yXFqDIQIi/BDind+eo4DiBrXchQ5WX0KqX
 HEyXsjSljsaXbvdxgD4jW9j8AigGx1JbUhrbQUsTZkB+qPxKxCw8ryGoMYEjnkqcLq97
 Yy53/Ir6PneTDgVfMIHrUb7XbYotmhcfaxyxeYef2LS3RXeaM2fmVjMvAl838spPVeAJ
 Eaj5KkvdmS5lsvBNwM5JYTVgP9eXdfmVI3+cgtAhMVj9+j0dskQCbI4r70QX3UwtO+Mf
 LuQqvX0Rm4FcOt0rALKeSDiy1SwjGsiBXzPSxbBlarDBruZG1U/VAwHYDmtBDMGwzxBR
 nFLQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXZSBoYXZlIGlmICghcGh5
LT5wbGwpIGNoZWNrcyBzY2F0dGVyZWQgdGhyb3VnaCB0aGUgZHJpdmVyIGFuZCBpZgpwaHktPnBs
bCBpcyBhbiBlcnJvciBwb2ludGVyLCB0aG9zZSBjaGVja3Mgd2lsbCBwYXNzIGFuZCBiYWQgdGhp
bmdzIHdpbGwKaGFwcGVuIDooCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jIHwg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMKaW5kZXggMTc2MDQ4M2IyNDdlLi42NDkx
YjBjZWFiMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYwpAQCAtNjE2LDEw
ICs2MTYsMTIgQEAgc3RhdGljIGludCBkc2lfcGh5X2RyaXZlcl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGZhaWw7CiAKIAlwaHktPnBsbCA9IG1zbV9kc2lfcGxs
X2luaXQocGRldiwgcGh5LT5jZmctPnR5cGUsIHBoeS0+aWQpOwotCWlmIChJU19FUlJfT1JfTlVM
TChwaHktPnBsbCkpCisJaWYgKElTX0VSUl9PUl9OVUxMKHBoeS0+cGxsKSkgewogCQlEUk1fREVW
X0lORk8oZGV2LAogCQkJIiVzOiBwbGwgaW5pdCBmYWlsZWQ6ICVsZCwgbmVlZCBzZXBhcmF0ZSBw
bGwgY2xrIGRyaXZlclxuIiwKIAkJCV9fZnVuY19fLCBQVFJfRVJSKHBoeS0+cGxsKSk7CisJCXBo
eS0+cGxsID0gTlVMTDsKKwl9CiAKIAlkc2lfcGh5X2Rpc2FibGVfcmVzb3VyY2UocGh5KTsKIAot
LSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
