Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3132DB95
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE856E2CA;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687756E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:45 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q17so1339109pfq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qfu+lCX+mg4CHoSzn6sx71PO1L0xmj8Ng2bghmWxVtM=;
 b=hAVkGasPlcsCkhg3Pj1ynUu5E3Uv7PBa6lx6w6Y89IX3LZuiO1laC0GLiZgX2SBk/c
 EMKVhJd/a9FsJ/rv0T9s8jdGJ6RCqfzYJsO+8ZWH4cJDq7wQ9LhmBS5oJrJxpki/GGFf
 kmbUxaAAvNyffbEliOfOAV8nnZqsbB6A7Qd5b7duqbYwzMhAzOMUPma5xbq3D5eEkuNq
 P+O7+JOc9Fss3L2QLRsqUEL4hcnd370XJvhJpiCZB4P4gujELi6Dz+Fz4yXN5mZ6Mfia
 23F/HXH7tNo5Viqzl8jSnx1BsbXwJBDGq3PkCuFy8LmAwgPNtP5fME8u/h84eYoH//3f
 Capg==
X-Gm-Message-State: APjAAAVm0EZ83cgs1DRm+76onUri00KvLBZLUUk5ZuUTPdkvIitsRwJf
 v8Xh52H/BuNDBPqrTvfmWOwx1FF9w+f+4g==
X-Google-Smtp-Source: APXvYqwsCTf8MIeFhkI7oHCKHu8V4WhT0bsggX6aKGiM/Kq0hphXwbIVOk7WcOZTuamgoCEOW8/5cQ==
X-Received: by 2002:aa7:83d4:: with SMTP id j20mr129161356pfn.90.1559125605031; 
 Wed, 29 May 2019 03:26:45 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e12sm18992183pfl.122.2019.05.29.03.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 May 2019 03:26:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] drm: mediatek: unbind components in mtk_drm_unbind()
Date: Wed, 29 May 2019 18:25:53 +0800
Message-Id: <20190529102555.251579-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529102555.251579-1-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qfu+lCX+mg4CHoSzn6sx71PO1L0xmj8Ng2bghmWxVtM=;
 b=nTovKIIjyeNQQu+BPV60MWd+6ikmDz5CTYIk7CO5q1I9JxYa/Y2hi1UEa7N1uc53tJ
 0Ml03crB3KYobulpw2zmaJAB4YPE4Y1W1VCWvM74IWI/JBAFlblmjKqTrMCg0ajk1wD7
 xGj5Gl5TJoDwlMuNXDh+oCwzMlUvgpwT9stYs=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VW5iaW5kaW5nIGNvbXBvbmVudHMgKGkuZS4gbXRrX2RzaSBhbmQgbXRrX2Rpc3Bfb3ZsL3JkbWEv
Y29sb3IpIHdpbGwKdHJpZ2dlciBtYXN0ZXIobXRrX2RybSkncyAudW5iaW5kKCksIGFuZCBjdXJy
ZW50bHkgbXRrX2RybSdzIHVuYmluZAp3b24ndCBhY3R1YWxseSB1bmJpbmQgY29tcG9uZW50cy4g
RHVyaW5nIHRoZSBuZXh0IGJpbmQsCm10a19kcm1fa21zX2luaXQoKSBpcyBjYWxsZWQsIGFuZCB0
aGUgY29tcG9uZW50cyBhcmUgYWRkZWQgYmFjay4KCi51bmJpbmQoKSBzaG91bGQgY2FsbCBtdGtf
ZHJtX2ttc19kZWluaXQoKSB0byB1bmJpbmQgY29tcG9uZW50cy4KCkFuZCBzaW5jZSBjb21wb25l
bnRfbWFzdGVyX2RlbCgpIGluIC5yZW1vdmUoKSB3aWxsIHRyaWdnZXIgLnVuYmluZCgpLAp3aGlj
aCB3aWxsIGFsc28gdW5yZWdpc3RlciBkZXZpY2UsIGl0J3MgZmluZSB0byByZW1vdmUgb3JpZ2lu
YWwgZnVuY3Rpb25zCmNhbGxlZCBoZXJlLgoKRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRp
YXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKU2lnbmVkLW9m
Zi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgotLS0KY2hhbmdlIGxvZyB2
MS0+djI6Ciogc2VwYXJhdGUgYW5vdGhlciAyIGZpeGVzIHRvIG90aGVyIHBhdGNoZXMuCi0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCA2ICstLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggNTdjZTQ3MDhlZjFiLi5lNzM2MmJkYWZhODIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0zOTcsNiArMzk3LDcgQEAg
c3RhdGljIHZvaWQgbXRrX2RybV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBt
dGtfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAogCWRybV9k
ZXZfdW5yZWdpc3Rlcihwcml2YXRlLT5kcm0pOworCW10a19kcm1fa21zX2RlaW5pdChwcml2YXRl
LT5kcm0pOwogCWRybV9kZXZfcHV0KHByaXZhdGUtPmRybSk7CiAJcHJpdmF0ZS0+ZHJtID0gTlVM
TDsKIH0KQEAgLTU2OCwxMyArNTY5LDggQEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IG10a19kcm1fcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJp
dmF0ZSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpk
cm0gPSBwcml2YXRlLT5kcm07CiAJaW50IGk7CiAKLQlkcm1fZGV2X3VucmVnaXN0ZXIoZHJtKTsK
LQltdGtfZHJtX2ttc19kZWluaXQoZHJtKTsKLQlkcm1fZGV2X3B1dChkcm0pOwotCiAJY29tcG9u
ZW50X21hc3Rlcl9kZWwoJnBkZXYtPmRldiwgJm10a19kcm1fb3BzKTsKIAlwbV9ydW50aW1lX2Rp
c2FibGUoJnBkZXYtPmRldik7CiAJb2Zfbm9kZV9wdXQocHJpdmF0ZS0+bXV0ZXhfbm9kZSk7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
