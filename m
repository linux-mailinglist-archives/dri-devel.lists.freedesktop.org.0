Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642C35C9F5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A2789DDF;
	Mon, 12 Apr 2021 15:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576589DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:32:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DED461358
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618241539;
 bh=PfUYz7ehOP36ze9zottzqYLT6YofP1E/5QKb3NCGfRY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qo6XIw/903qdy+wsJUt0dbetUSiB8NAUHBi44/AgP/z3CwwzWhjQ3AoUvjMfZAZTw
 wl73pB3333TrKJY9sRfsirNKwk9kx5pYQec6YUTiIuxufuW5dIVNi1TK59Rbd420cT
 32KJjvzHLzKfOoAqS+spaOxLmlEuZ5lXv8vMMZoOXY3Kn2kNK7Zi0r1LvtIu3N9eVP
 Od4cU0zfkt0NeLyF83bVTqmPD4toeE4K0qjUaNli6+SVDc1Zy0PZmkrNY9S1bPz3ga
 BSKPU9rRItSSq3kE59IyWzgn6s3E8rOGe9X5iW3LbXy7Q1MBAyjtNlZQN3o3aUhYct
 CXLvKN1pHOqZQ==
Received: by mail-ej1-f46.google.com with SMTP id w23so5159169ejb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:32:19 -0700 (PDT)
X-Gm-Message-State: AOAM5302coQxnoRwCVVybp8SXm9r+dm+toP/8vEdm1L2JZ119qWrFgSU
 H3zM0yjpMYNenWb0tYP97mULp09z6cYwCGB/Tg==
X-Google-Smtp-Source: ABdhPJxUH+6kFAMsFOGXnWZU4y+lM9pGKAyUVJwsXhiMUyF3mf1ypBpE74YoOYyllLOSa7Tkz/VEl3gfdNDYBpx1tEY=
X-Received: by 2002:a17:906:c348:: with SMTP id
 ci8mr8745246ejb.303.1618241538032; 
 Mon, 12 Apr 2021 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210410034841.16567-1-wangli74@huawei.com>
In-Reply-To: <20210410034841.16567-1-wangli74@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Apr 2021 23:32:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
Message-ID: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
To: Wang Li <wangli74@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFdhbmc6CgpXYW5nIExpIDx3YW5nbGk3NEBodWF3ZWkuY29tPiDmlrwgMjAyMeW5tDTmnIgx
MOaXpSDpgLHlha0g5LiK5Y2IMTE6MzHlr6vpgZPvvJoKPgo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMg
d2lsbCBpbmNyZW1lbnQgcG0gdXNhZ2UgY291bnRlciBldmVuIGl0IGZhaWxlZC4KPiBGb3JnZXR0
aW5nIHRvIHB1dHRpbmcgb3BlcmF0aW9uIHdpbGwgcmVzdWx0IGluIHJlZmVyZW5jZSBsZWFrIGhl
cmUuCj4gRml4IGl0IGJ5IHJlcGxhY2luZyBpdCB3aXRoIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQgdG8ga2VlcCB1c2FnZQo+IGNvdW50ZXIgYmFsYW5jZWQuCgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTGkgPHdhbmds
aTc0QGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXgg
NTRhYjNhMzI0NzUyLi5mMTk1NDI0MmQ4ZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgaW50IG10a19jcnRj
X2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgICAg
ICAgICBkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIHJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY3J0Yy0+ZGV2LT5kZXYpOwo+
ICsgICAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChjcnRjLT5kZXYtPmRldik7
Cj4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkZh
aWxlZCB0byBlbmFibGUgcG93ZXIgZG9tYWluOiAlZFxuIiwgcmV0KTsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
