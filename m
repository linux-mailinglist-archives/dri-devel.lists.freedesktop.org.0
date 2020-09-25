Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4784278314
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C96EC64;
	Fri, 25 Sep 2020 08:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284136EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:46:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so2621224wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IqZitQ9KORvFRfCpUB9I8VYakITuk7r9Yti4Q92atc=;
 b=elDZetC9HgJWDohrUIphsyj5A5B1tb6sEQbwJ6XFmUrEgfpQsK5ImF/JGNH66Dqth+
 jwYE2NysxzDAQFSq9Bg8PPi0O72WlSWdPci6OFwLGz4RZUSmHmqS6Ku0NPzqG0k+0+Hu
 40Js49057bL2TNma0cXiVUISSvCmOB/HLX7RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IqZitQ9KORvFRfCpUB9I8VYakITuk7r9Yti4Q92atc=;
 b=oKEPWPxo6W+uyvYnSbMdH008jISP6yXYXeI+7/Ay3eUf0Z3K5tQnsc4SP+4MABPb6M
 Feum5xyWEGHz+dlQP/Rg/77TyPGmiqX+l3mmg/D4S58E4MFMA8NBd3AA5Hb1FOLAOUmF
 ekj+uy/vLsJSLwvH7QTPiWZusgxCZBBu415U8KrHMg37+gzh1uAxJhX/OJhOHJxnpsIt
 IHve4IYKaRJhFsQMJ8qekWTHdWxxBEM6WDIUXKgvtLJj5ma7T2L7oIz+UwAWH3Wjpj6p
 82MpRcDggxeUd5aJ1IrWeJOkr68UMGojYZZgqed4BzJ13Lkz34XjIf6oZQmqOsSdhDO7
 peGg==
X-Gm-Message-State: AOAM5320i+uPOL6Fh5RsC1Viyyp/jDIwuzPBvhWnabx7m/MADDCcbshN
 n19DIHjAZ+Zcaqei6VrDKagn7i5WLFGbsiBe
X-Google-Smtp-Source: ABdhPJy7Xm8XjOk+WDpx5dr+exmR4qUt4wJqFCWS145GRpRmJYVH4VtmGoKN5RnVMK5tgX+IL2we4g==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr3289510wrs.107.1601023617530; 
 Fri, 25 Sep 2020 01:46:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 18sm2031034wmj.28.2020.09.25.01.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:46:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/atomic: debug output for EBUSY
Date: Fri, 25 Sep 2020 10:46:51 +0200
Message-Id: <20200925084651.3250104-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SG9wZWZ1bGx5IHdlJ2xsIGhhdmUgdGhlIGRybSBjcmFzaCByZWNvcmRlciBSU04sIGJ1dCBtZWFu
d2hpbGUKY29tcG9zaXRvcnMgd291bGQgbGlrZSB0byBrbm93IGEgYml0IGJldHRlciB3aHkgdGhl
eSBnZXQgYW4gRUJVU1kuCgp2MjogTW92ZSBtaXNwbGFjZWQgaHVuayB0byB0aGUgcmlnaHQgcGF0
Y2ggKFBla2thKQoKQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpDYzogRGFu
aWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4KQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtr
YS5wYWFsYW5lbkBjb2xsYWJvcmEuY28udWs+CkNjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNp
b24uZnI+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDIwICsrKysrKysrKysr
KysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCmluZGV4IGU4YWJhYWFhN2ZkMS4uNmIz
YmZhYmFjMjZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwpAQCAtMTc0MCw4ICsx
NzQwLDExIEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9hc3luY19jaGVjayhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCSAqIG92ZXJyaWRkZW4gYnkgYSBwcmV2aW91cyBzeW5jaHJvbm91cyB1cGRh
dGUncyBzdGF0ZS4KIAkgKi8KIAlpZiAob2xkX3BsYW5lX3N0YXRlLT5jb21taXQgJiYKLQkgICAg
IXRyeV93YWl0X2Zvcl9jb21wbGV0aW9uKCZvbGRfcGxhbmVfc3RhdGUtPmNvbW1pdC0+aHdfZG9u
ZSkpCisJICAgICF0cnlfd2FpdF9mb3JfY29tcGxldGlvbigmb2xkX3BsYW5lX3N0YXRlLT5jb21t
aXQtPmh3X2RvbmUpKSB7CisJCURSTV9ERUJVR19BVE9NSUMoIltQTEFORTolZDolc10gaW5mbGln
aHQgcHJldmlvdXMgY29tbWl0IHByZXZlbnRpbmcgYXN5bmMgY29tbWl0XG4iLAorCQkJcGxhbmUt
PmJhc2UuaWQsIHBsYW5lLT5uYW1lKTsKIAkJcmV0dXJuIC1FQlVTWTsKKwl9CiAKIAlyZXR1cm4g
ZnVuY3MtPmF0b21pY19hc3luY19jaGVjayhwbGFuZSwgbmV3X3BsYW5lX3N0YXRlKTsKIH0KQEAg
LTE5NjQsNiArMTk2Nyw5IEBAIHN0YXRpYyBpbnQgc3RhbGxfY2hlY2tzKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywgYm9vbCBub25ibG9jaykKIAkJCSAqIGNvbW1pdCB3aXRoIG5vbmJsb2NraW5nIG9u
ZXMuICovCiAJCQlpZiAoIWNvbXBsZXRlZCAmJiBub25ibG9jaykgewogCQkJCXNwaW5fdW5sb2Nr
KCZjcnRjLT5jb21taXRfbG9jayk7CisJCQkJRFJNX0RFQlVHX0FUT01JQygiW0NSVEM6JWQ6JXNd
IGJ1c3kgd2l0aCBhIHByZXZpb3VzIGNvbW1pdFxuIiwKKwkJCQkJY3J0Yy0+YmFzZS5pZCwgY3J0
Yy0+bmFtZSk7CisKIAkJCQlyZXR1cm4gLUVCVVNZOwogCQkJfQogCQl9IGVsc2UgaWYgKGkgPT0g
MSkgewpAQCAtMjEzMiw4ICsyMTM4LDEyIEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9zZXR1cF9j
b21taXQoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkvKiBVc2Vyc3BhY2UgaXMg
bm90IGFsbG93ZWQgdG8gZ2V0IGFoZWFkIG9mIHRoZSBwcmV2aW91cwogCQkgKiBjb21taXQgd2l0
aCBub25ibG9ja2luZyBvbmVzLiAqLwogCQlpZiAobm9uYmxvY2sgJiYgb2xkX2Nvbm5fc3RhdGUt
PmNvbW1pdCAmJgotCQkgICAgIXRyeV93YWl0X2Zvcl9jb21wbGV0aW9uKCZvbGRfY29ubl9zdGF0
ZS0+Y29tbWl0LT5mbGlwX2RvbmUpKQorCQkgICAgIXRyeV93YWl0X2Zvcl9jb21wbGV0aW9uKCZv
bGRfY29ubl9zdGF0ZS0+Y29tbWl0LT5mbGlwX2RvbmUpKSB7CisJCQlEUk1fREVCVUdfQVRPTUlD
KCJbQ09OTkVDVE9SOiVkOiVzXSBidXN5IHdpdGggYSBwcmV2aW91cyBjb21taXRcbiIsCisJCQkJ
Y29ubi0+YmFzZS5pZCwgY29ubi0+bmFtZSk7CisKIAkJCXJldHVybiAtRUJVU1k7CisJCX0KIAog
CQkvKiBBbHdheXMgdHJhY2sgY29ubmVjdG9ycyBleHBsaWNpdGx5IGZvciBlLmcuIGxpbmsgcmV0
cmFpbmluZy4gKi8KIAkJY29tbWl0ID0gY3J0Y19vcl9mYWtlX2NvbW1pdChzdGF0ZSwgbmV3X2Nv
bm5fc3RhdGUtPmNydGMgPzogb2xkX2Nvbm5fc3RhdGUtPmNydGMpOwpAQCAtMjE0Nyw4ICsyMTU3
LDEyIEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9zZXR1cF9jb21taXQoc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnN0YXRlLAogCQkvKiBVc2Vyc3BhY2UgaXMgbm90IGFsbG93ZWQgdG8gZ2V0IGFo
ZWFkIG9mIHRoZSBwcmV2aW91cwogCQkgKiBjb21taXQgd2l0aCBub25ibG9ja2luZyBvbmVzLiAq
LwogCQlpZiAobm9uYmxvY2sgJiYgb2xkX3BsYW5lX3N0YXRlLT5jb21taXQgJiYKLQkJICAgICF0
cnlfd2FpdF9mb3JfY29tcGxldGlvbigmb2xkX3BsYW5lX3N0YXRlLT5jb21taXQtPmZsaXBfZG9u
ZSkpCisJCSAgICAhdHJ5X3dhaXRfZm9yX2NvbXBsZXRpb24oJm9sZF9wbGFuZV9zdGF0ZS0+Y29t
bWl0LT5mbGlwX2RvbmUpKSB7CisJCQlEUk1fREVCVUdfQVRPTUlDKCJbUExBTkU6JWQ6JXNdIGJ1
c3kgd2l0aCBhIHByZXZpb3VzIGNvbW1pdFxuIiwKKwkJCQlwbGFuZS0+YmFzZS5pZCwgcGxhbmUt
Pm5hbWUpOworCiAJCQlyZXR1cm4gLUVCVVNZOworCQl9CiAKIAkJLyogQWx3YXlzIHRyYWNrIHBs
YW5lcyBleHBsaWNpdGx5IGZvciBhc3luYyBwYWdlZmxpcCBzdXBwb3J0LiAqLwogCQljb21taXQg
PSBjcnRjX29yX2Zha2VfY29tbWl0KHN0YXRlLCBuZXdfcGxhbmVfc3RhdGUtPmNydGMgPzogb2xk
X3BsYW5lX3N0YXRlLT5jcnRjKTsKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
