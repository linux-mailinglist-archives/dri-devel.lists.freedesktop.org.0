Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683B5AFD9
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 15:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C274589C0A;
	Sun, 30 Jun 2019 13:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94289C0A;
 Sun, 30 Jun 2019 13:15:04 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so11719075qtj.8;
 Sun, 30 Jun 2019 06:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=riq7pIWvMTDPqVqjETndidX913621E7xFA3bRlBlSUg=;
 b=Y6stKH8/59T1eXm1zeQ6yDuv0aB3G5JzztLDh5Uv/bmGvd5vG0Y68GiR3KZacmS3nM
 kVoBuh5jwbBReJjB2S/CBqi+H7woRGKMKgr+PL11/yuCQdfk0m/0TLRw8jZo9IWAOeU4
 9w9BCdY4ugAIWAlYy4B0yFkZSU1qL8rXtmLmHFvk3VwKuJTFe9Vj6l5BUQ7MkWjL7kdr
 Amjm30ny+CN0jnTWa1AZ2hwtcKbtcXnFie86ijfCSt8ODDpXgS+hbk0mylamArS41Mn5
 HCqEpdP9+88zizLw6wcQgUoKGUxCzpcX8Gnfz14HEQsC7OycffCMqMQqf4+c2w0Y2vh5
 wgow==
X-Gm-Message-State: APjAAAWrZI59fTRxZJopSB2g8+AQXX5gYXuknZexk0rlCy8Kld92bWLi
 9KB5EvigC1ba+kEST6pZEwcwb/MUML8=
X-Google-Smtp-Source: APXvYqx7b5A+sDjJlT5l1rlIsq1Vay1GNZmKba43BBQIDhD4gh2+LZZcRKttP5biv/PTNpxePVeh1w==
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr16784207qvh.238.1561900503111; 
 Sun, 30 Jun 2019 06:15:03 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id s130sm3656117qke.104.2019.06.30.06.15.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 06:15:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: don't open-code governor name
Date: Sun, 30 Jun 2019 06:14:41 -0700
Message-Id: <20190630131445.25712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630131445.25712-1-robdclark@gmail.com>
References: <20190630131445.25712-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=riq7pIWvMTDPqVqjETndidX913621E7xFA3bRlBlSUg=;
 b=h4XpgKT8JcW4J5Duus56KZ5uReiYiL1HWSxE0n6TomvnmrzHCCC1U96N8RS5AiiIZm
 i3Xt11sdsQ05Lv1j0YGULZjOBm6LHhO30TmZgXf5CaAHZ7pszm4mAfSmtza8NdlAp84s
 aifK1YPoxJrAGFbpE1dt9oGmXdeDbzzHLwIQCN57/FBhpYtZ6O12asZ6yzHllSIuXKHA
 DV5wDIcRiqTjfObes56x/qf2wpi5YFWEMDWQ23klhbgFiYAeD12K0u7M65vyGaISzcUM
 f0gNYP5XhltyyUeZJs3Rc2ma3Daupjh+VRpu4MW3iItnz++kDUE69CfJvpCeBFAOQAxh
 a6dA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dwdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYwppbmRleCAwYTRjNzdmYjNkOTQuLmUzMjMyNTlh
MTZkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKQEAgLTEwNiw3ICsxMDYsNyBAQCBzdGF0aWMgdm9p
ZCBtc21fZGV2ZnJlcV9pbml0KHN0cnVjdCBtc21fZ3B1ICpncHUpCiAJICovCiAKIAlncHUtPmRl
dmZyZXEuZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2aWNlKCZncHUtPnBkZXYtPmRldiwK
LQkJCSZtc21fZGV2ZnJlcV9wcm9maWxlLCAic2ltcGxlX29uZGVtYW5kIiwgTlVMTCk7CisJCQkm
bXNtX2RldmZyZXFfcHJvZmlsZSwgREVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5ELCBOVUxMKTsK
IAogCWlmIChJU19FUlIoZ3B1LT5kZXZmcmVxLmRldmZyZXEpKSB7CiAJCURSTV9ERVZfRVJST1Io
JmdwdS0+cGRldi0+ZGV2LCAiQ291bGRuJ3QgaW5pdGlhbGl6ZSBHUFUgZGV2ZnJlcVxuIik7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
