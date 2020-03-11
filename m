Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F937181A3F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9156E98B;
	Wed, 11 Mar 2020 13:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39DF6E1F7;
 Wed, 11 Mar 2020 13:52:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n2so2224578wmc.3;
 Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BrBZ7BRIxlz8FrRAnyr/unjtGHr0zUbPTL3/EC4XXLw=;
 b=dS70QwaBALfXqGFh/hPS8VDcp5/7jII+D3MVVverNaHTK0+3xxLLx5wdKoel7HDXvH
 2arfrNFDrlq4xaO0fExSZFdqDXFqzM/swpL9Yh3vbc2a420rhI6Yf8H7uW/PYnHz0798
 Ub6jVwv4dTq8r3RDb5Z1Wu8tkx23tosGteiETYrR/esHHoiQouzpRG5TBWDMnZg4Xv0d
 JZ8lW2kXCthRwELDrGi5AdQyu8Cd3mvP682JoPMNBkIoX4wIy9WiC8H7psnVj99+7vgq
 1XQ5Oy2eNN+1260mvCQiVl9c8lRsZaa9vHb239GMQLVVtNFZOTD2lxsEDS2iijhG6Y1U
 4wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrBZ7BRIxlz8FrRAnyr/unjtGHr0zUbPTL3/EC4XXLw=;
 b=J5nT2C+KayKLmNggsIOF0dqsmXJcm1bqMcW1O+SMfhFvYH0p+trBBNFBqbOr84+8xG
 cjnCjL2hveGGANy/jltN4TTw1v/YtmFS6EYqyE9+1O5fBLiE7A5dQCmgWPsXq7y2nTvt
 7+0NFNPLryWQ7/7LVHzYvSLSrvdYkKgrPNtSKZ+jmoOfQt0sZozkFtEZScQMZZPCLM30
 K740w+r1KRh65gav/00DOUj8GWDkgkhm3NdC/w4SUrkd3kTcDiY6XwUH2wD1iQs8YX8r
 C+zkINfpdaE/zQVJcvzSPqMPe68XdE3ByP1fqv+euw9OKNYuWUlUcVUO1JGOtpC0lQnO
 1NBA==
X-Gm-Message-State: ANhLgQ0HAZ/4gnN5opOztwJXRvOxDgeRb8Cp0lp8Mx/OGP8yrwIw7RHJ
 V5YmhtNpzm54AF4GjPO9N3A=
X-Google-Smtp-Source: ADFU+vsPAfdCms9K/oMpKj27gQSzAvyZZSi4wAa/XqnIbxORrNV6RGa/WoMb+HcXHpWWm6Gw162qsA==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr3752519wma.108.1583934725433; 
 Wed, 11 Mar 2020 06:52:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Date: Wed, 11 Mar 2020 14:51:56 +0100
Message-Id: <20200311135158.3310-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgaWYgd2UgY2FuIGRvIHBlZXIycGVlciBvbiB0aGUgUENJZSBidXMuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDQgKysrKwogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG1hX2J1Zi5jCmluZGV4IGFlZjEyZWUyZjFlMy4uYmJmNjc4MDBjOGE2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKQEAgLTM4LDYgKzM4LDcg
QEAKICNpbmNsdWRlIDxkcm0vYW1kZ3B1X2RybS5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYu
aD4KICNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UtYXJyYXkuaD4KKyNpbmNsdWRlIDxsaW51eC9w
Y2ktcDJwZG1hLmg+CiAKIC8qKgogICogYW1kZ3B1X2dlbV9wcmltZV92bWFwIC0gJmRtYV9idWZf
b3BzLnZtYXAgaW1wbGVtZW50YXRpb24KQEAgLTE3OSw2ICsxODAsOSBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9kbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAogCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7CiAJaW50IHI7
CiAKKwlpZiAocGNpX3AycGRtYV9kaXN0YW5jZV9tYW55KGFkZXYtPnBkZXYsICZhdHRhY2gtPmRl
diwgMSwgdHJ1ZSkgPCAwKQorCQlhdHRhY2gtPnBlZXIycGVlciA9IGZhbHNlOworCiAJaWYgKGF0
dGFjaC0+ZGV2LT5kcml2ZXIgPT0gYWRldi0+ZGV2LT5kcml2ZXIpCiAJCXJldHVybiAwOwogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
