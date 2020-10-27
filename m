Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20E29CB7B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 22:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F846E108;
	Tue, 27 Oct 2020 21:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D186E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 21:49:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k21so1962471wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V8no5NLx/EPXeK3IR/DnmSVtE8r9cF0bSgSu8ZLPdMw=;
 b=aRDyobZ7krZL7Pf7BVzo8QG2FDxcmJ9CXt4MjKL+s/67M3acWl0aexo7kZUXiyHG1e
 ft6UrfT8UxfndswEBrXy8J3WJNnkao3SGzh9zQSFQP9xQCs09ullxZIeAvJ0mD/Q983a
 QsKRhHKdvA78dAun2cI/4M1yS3ykh8QDJAwI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V8no5NLx/EPXeK3IR/DnmSVtE8r9cF0bSgSu8ZLPdMw=;
 b=unh7c0U6eqNLxFtaw5i+/zutWBnEDDJ1H1PatURU5L/3YFymaLg22WpBtaUxGNfwns
 QYd5W/W/N9tqz9CJVjwTbguZlkTjLvLKmcQfCuuGcQPNkIp50ukNVmBVPyp5yz29tZel
 RyUaj28R+nCrEcSXqRe1i6FRsIJpQJYpVQ29ns9Ul/SNng6ASD9KXecMiqNvGEnDwS/A
 WIMAVFqg/Gt9fnVtU7nBHlmMmUaMG9O5+tgczlCWAFWmB8Fb5u23xmdMmc4YuQe3CZq6
 WpLJ6lke3eYblA++t+LyIXPE7luj9nlTwSM7zAiv/2lrO/M06zWxKqyuLLIRFTq6urEY
 /pQg==
X-Gm-Message-State: AOAM531tTA/BU8s4+8QluHiX3HY4w9+IqPPTIqDeZiF11JcUKK3m9yvr
 jmS4CFqYHmCOEgrJCMlbqB+Zhg8JvrEnBIQg
X-Google-Smtp-Source: ABdhPJxbLJNJ+DNsc2Vj5AgNJFuMtAN0kc4/8NmFGgYnXE7uZIMveSFMusf90xuHdaxHEKHu608YJw==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr4653420wmj.81.1603835378528; 
 Tue, 27 Oct 2020 14:49:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e11sm3444488wrj.75.2020.10.27.14.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 14:49:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/shme-helpers: Fix dma_buf_mmap forwarding bug
Date: Tue, 27 Oct 2020 22:49:22 +0100
Message-Id: <20201027214922.3566743-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, piotr.oniszczuk@gmail.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, stable@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB3ZSBmb3J3YXJkIGFuIG1tYXAgdG8gdGhlIGRtYV9idWYgZXhwb3J0ZXIsIHRoZXkgZ2V0
IHRvIG93bgpldmVyeXRoaW5nLiBVbmZvcnR1bmF0ZWx5IGRybV9nZW1fbW1hcF9vYmooKSBvdmVy
d3JvdGUKdm1hLT52bV9wcml2YXRlX2RhdGEgYWZ0ZXIgdGhlIGRyaXZlciBjYWxsYmFjaywgd3Jl
YWtpbmcgdGhlCmV4cG9ydGVyIGNvbXBsZXRlLiBUaGlzIHdhcyBub3RpY2VkIGJlY2F1c2UgdmIy
X2NvbW1vbl92bV9jbG9zZSBibGV3CnVwIG9uIG1hbGkgZ3B1IHdpdGggcGFuZnJvc3QgYWZ0ZXIg
Y29tbWl0IDI2ZDNhYzNjYjA0ZAooImRybS9zaG1lbS1oZWxwZXJzOiBSZWRpcmVjdCBtbWFwIGZv
ciBpbXBvcnRlZCBkbWEtYnVmIikuCgpVbmZvcnR1bmF0ZWx5IGRybV9nZW1fbW1hcF9vYmogYWxz
byBhY3F1aXJlcyBhIHN1cnBsdXMgcmVmZXJlbmNlIHRoYXQKd2UgbmVlZCB0byBkcm9wIGluIHNo
bWVtIGhlbHBlcnMsIHdoaWNoIGlzIGEgYml0IG9mIGEgbWlzbGF5ZXIKc2l0dWF0aW9uLiBNYXli
ZSB0aGUgZW50aXJlIGRtYV9idWZfbW1hcCBmb3J3YXJkaW5nIHNob3VsZCBiZSBwdWxsZWQKaW50
byBjb3JlIGdlbSBjb2RlLgoKTm90ZSB0aGF0IHRoZSBvbmx5IHR3byBvdGhlciBkcml2ZXJzIHdo
aWNoIGZvcndhcmQgbW1hcCBpbiB0aGVpciBvd24KY29kZSAoZXRuYXZpdiBhbmQgZXh5bm9zKSBn
ZXQgdGhpcyBzb21ld2hhdCByaWdodCBieSBvdmVyd3JpdGluZyB0aGUKZ2VtIG1tYXAgY29kZS4g
QnV0IHRoZXkgc2VlbSB0byBzdGlsbCBoYXZlIHRoZSBsZWFrLiBUaGlzIG1pZ2h0IGJlIGEKZ29v
ZCBleGN1c2UgdG8gbW92ZSB0aGVzZSBkcml2ZXJzIG92ZXIgdG8gc2htZW0gaGVscGVycyBjb21w
bGV0ZWx5LgoKTm90ZSB0byBzdGFibGUgdGVhbTogVGhlcmUncyBhIHRyaXZpYWwgY29udGV4dCBj
b25mbGljdCB3aXRoCmQ2OTNkZWY0ZmQxYyAoImRybTogUmVtb3ZlIG9ic29sZXRlIEdFTSBhbmQg
UFJJTUUgY2FsbGJhY2tzIGZyb20Kc3RydWN0IGRybV9kcml2ZXIiKS4gSSdtIGFzc3VtaW5nIGl0
J3MgY2xlYXIgd2hlcmUgdG8gcHV0IHRoZSBmaXJzdApodW5rLCBvdGhlcndpc2UgSSBjYW4gc2Vu
ZCBhIDUuOSB2ZXJzaW9uIG9mIHRoaXMuCgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9y
Zz4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogUnVzc2VsbCBL
aW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51az4KQ2M6IENocmlzdGlhbiBHbWVpbmVy
IDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CkNjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ft
c3VuZy5jb20+CkNjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+CkNj
OiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgpDYzogS3l1bmdtaW4gUGFy
ayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KRml4ZXM6IDI2ZDNhYzNjYjA0ZCAoImRybS9z
aG1lbS1oZWxwZXJzOiBSZWRpcmVjdCBtbWFwIGZvciBpbXBvcnRlZCBkbWEtYnVmIikKQ2M6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+CkNjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCkNjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyB2NS45KwpSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBwaW90ci5vbmlzemN6dWtA
Z21haWwuY29tCkNjOiBwaW90ci5vbmlzemN6dWtAZ21haWwuY29tClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9zaG1lbV9oZWxwZXIuYyB8IDcgKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggMWRhNjdkMzRlNTVkLi5kNTg2
MDY4ZjU1MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtMTA3Niw2ICsxMDc2LDggQEAgaW50IGRybV9nZW1f
bW1hcF9vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3Np
emUsCiAJICovCiAJZHJtX2dlbV9vYmplY3RfZ2V0KG9iaik7CiAKKwl2bWEtPnZtX3ByaXZhdGVf
ZGF0YSA9IG9iajsKKwogCWlmIChvYmotPmZ1bmNzLT5tbWFwKSB7CiAJCXJldCA9IG9iai0+ZnVu
Y3MtPm1tYXAob2JqLCB2bWEpOwogCQlpZiAocmV0KSB7CkBAIC0xMDk2LDggKzEwOTgsNiBAQCBp
bnQgZHJtX2dlbV9tbWFwX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdW5zaWduZWQg
bG9uZyBvYmpfc2l6ZSwKIAkJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3RfZGVjcnlwdGVkKHZt
YS0+dm1fcGFnZV9wcm90KTsKIAl9CiAKLQl2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IG9iajsKLQog
CXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX21tYXBfb2JqKTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKaW5kZXggZmIxMWRmN2FjZWQ1Li44MjMzYmRhNDY5
MmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCkBAIC01OTgsOCArNTk4
LDEzIEBAIGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmos
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCS8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQg
Ki8KIAl2bWEtPnZtX3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7
CiAKLQlpZiAob2JqLT5pbXBvcnRfYXR0YWNoKQorCWlmIChvYmotPmltcG9ydF9hdHRhY2gpIHsK
KwkJLyogRHJvcCB0aGUgcmVmZXJlbmNlIGRybV9nZW1fbW1hcF9vYmooKSBhY3F1aXJlZC4qLwor
CQlkcm1fZ2VtX29iamVjdF9wdXQob2JqKTsKKwkJdm1hLT52bV9wcml2YXRlX2RhdGEgPSBOVUxM
OworCiAJCXJldHVybiBkbWFfYnVmX21tYXAob2JqLT5kbWFfYnVmLCB2bWEsIDApOworCX0KIAog
CXNobWVtID0gdG9fZHJtX2dlbV9zaG1lbV9vYmoob2JqKTsKIAotLSAKMi4yOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
