Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A42699CC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1DA6E81D;
	Mon, 14 Sep 2020 23:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE05A6E81C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:39:03 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A61D21D41
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126743;
 bh=SqboHRni2bD1vhdXq+F163RDYtXSS69vUAB3qmgkNBY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yZrILwRiKWB3Exo04Zl6br1gc+l/7hc0rbEEUZD7eGpkF/vnTrrTegyPWxzZlH87e
 tb/Nrq3h6DTC2VNTI/4r9e/2B8tbTGokLt/nAf07oTEem9NBKbIYnPTedsGXImc/ry
 4FBNmwk9IUb+vT8xq31IVkhGuXPDsglLsK9TiP8k=
Received: by mail-ed1-f47.google.com with SMTP id w1so1266742edr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:39:03 -0700 (PDT)
X-Gm-Message-State: AOAM533dVCB45/1GhgNRYh0qWQDZNST1QcfoDygKDr5KVR3KUe43gmsU
 k3hOUl4TuygKmwOANjCO7Oj6cBsn7qwoCgzGhA==
X-Google-Smtp-Source: ABdhPJw6RlAfURdpFIW30aW+5Mnee4BOMoBlhb5m43SWlzBpt3unMBFHnJE1V6y4/LgtpshCnDhXAjKJywhgMoXw5nw=
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr20041867edu.288.1600126742006; 
 Mon, 14 Sep 2020 16:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084942.2122349-1-yukuai3@huawei.com>
In-Reply-To: <20200909084942.2122349-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:38:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OPKHd+=WD_nfPJVbXh8As8CDi=tGzbMAtxBQXbzjQYg@mail.gmail.com>
Message-ID: <CAAOTY__OPKHd+=WD_nfPJVbXh8As8CDi=tGzbMAtxBQXbzjQYg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add exception handing in mtk_drm_probe() if
 component init fail
To: Yu Kuai <yukuai3@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 littlecvr@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDnml6Ug6YCx5LiJIOS4i+WNiDQ6NTDlr6vpgZPvvJoKPgo+IG10a19kZHBfY29tcF9pbml0KCkg
aXMgY2FsbGVkIGluIGEgbG9vcCBpbiBtdGtfZHJtX3Byb2JlKCksIGlmIGl0Cj4gZmFpbCwgcHJl
dmlvdXMgc3VjY2Vzc2l2ZSBpbml0IGNvbXBvbmVudCBpcyBub3QgcHJvY2Nlc3NlZC4KPgo+IFRo
dXMgdW5pbml0aWFsaXplIHZhbGlkIGNvbXBvbmVudCBhbmQgcHV0IHRoZWlyIGRldmljZSBpZiBj
b21wb25lbnQKPiBpbml0IGZhaWxlZC4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlh
dGVrOiBBZGQgRFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQo+IFNpZ25lZC1v
ZmYtYnk6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYwo+IGluZGV4IDA0MGE4ZjM5M2ZlMi4uNzVhNmNmMjMxZmQ3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtNTQ0LDggKzU0NCwxMyBAQCBz
dGF0aWMgaW50IG10a19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOwo+ICBlcnJfbm9kZToKPiAgICAgICAgIG9m
X25vZGVfcHV0KHByaXZhdGUtPm11dGV4X25vZGUpOwo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8
IEREUF9DT01QT05FTlRfSURfTUFYOyBpKyspCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgRERQ
X0NPTVBPTkVOVF9JRF9NQVg7IGkrKykgewo+ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChw
cml2YXRlLT5jb21wX25vZGVbaV0pOwo+ICsgICAgICAgICAgICAgICBpZiAocHJpdmF0ZS0+ZGRw
X2NvbXBbaV0pIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwdXRfZGV2aWNlKHByaXZhdGUt
PmRkcF9jb21wW2ldLT5sYXJiX2Rldik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJpdmF0
ZS0+ZGRwX2NvbXBbaV0gPSBOVUxMOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4g
ICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAtLQo+IDIuMjUuNAo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
