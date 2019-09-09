Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817F1AD1F1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 04:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED488972D;
	Mon,  9 Sep 2019 02:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267288972C;
 Mon,  9 Sep 2019 02:30:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id b136so25286742iof.3;
 Sun, 08 Sep 2019 19:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1kBM8+FpCn5DwArkBe4qisyPtgF0D1ChYizbMJcwFY=;
 b=lrfoPPZTrlixqujOP6xu83Yn5kWgbpdk9iew/E9w8ziSICl6wxB5JEXls9tVYAUn1S
 nuiN9+kh93Z3yl0OQ3Rle0YXvDdjvW8xr9XCAIOE0vGioGXw/3fIIGgjoloBp9ro31U3
 vlDsKnRmWxLNdK9LJcQwX1HLS2G/ImuTpZQFv4M8GAf7378aRDPdzR+fmaFEeTcdotcC
 QxTRW53Tago1MHbn/2mEck/X+XPI/hSHwqZnljm30tZl/0fZdq89XeNvEx/5941zqnez
 ua/yt7IGHkM2no5C7C5mtmtVcunmGKvvQJlHf16RfqZXjkZbrESlp6ETvt3cyN653dla
 ZOPQ==
X-Gm-Message-State: APjAAAWzQ5am7vzG35LowVPmJrw/ZZfijJ8iEWMelnCDcNQrwZtr/uUY
 y603VQHuo/Wc08wKzlvBefNFEEgNXvIOQrTfS9M=
X-Google-Smtp-Source: APXvYqyrCRQRwtZO2cJ0+ag91SP1gVT+1Xx5uH6/S0Y8lrBOq+8Dv2NKb0Hllam9Zz1D3Zr/9La3rNfeotnolKfrwNI=
X-Received: by 2002:a02:608:: with SMTP id 8mr23052655jav.88.1567996254437;
 Sun, 08 Sep 2019 19:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190908024800.23229-1-anarsoul@gmail.com>
In-Reply-To: <20190908024800.23229-1-anarsoul@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 9 Sep 2019 10:30:43 +0800
Message-ID: <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix lima_gem_wait() return value
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r1kBM8+FpCn5DwArkBe4qisyPtgF0D1ChYizbMJcwFY=;
 b=f99c3fWlG0hXsPYKN1ha72hlU183tKwmYztOnrgbbGD5XZnzv4em8Y9vsOCyx9DSlS
 dUarEbTMEHWjtf7eMG0g1uFW7cCPXMx5p0J73Z8s8I6CRNHP8Zfzt4ZOVacCn4ecwMKi
 tUyk9xKtYjU6KIkeibQe6Tqske60T+U1+UxfFSO0nsEKzwnqUPOhy8SbKNjrUNqBPu+g
 2yT3JE09WyZsoKHDzmVrPK/+8W4FLmypaWCiQcjXU8sCBo4qs83TwZ8p6lOfl/1AZYD7
 lxwZNrzwMqKFix5+OwAXYkkSWgSlpHeKMG6xTdTNegui8bKsIZ0tUYMxsMgExlO3Xea7
 JUyQ==
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
Cc: David Airlie <airlied@linux.ie>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2gsIEkgd2FzIG1pc3MgbGVhZGluZyBieSB0aGUgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rf
d2FpdApjb21tZW50cy4gUGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdt
YWlsLmNvbT4KCkknbGwgYXBwbHkgdGhpcyBwYXRjaCB0byBkcm0tbWlzYy1uZXh0LgoKQ3VycmVu
dCBrZXJuZWwgcmVsZWFzZSBpcyA1LjMtcmM4LCBpcyBpdCB0b28gbGF0ZSBmb3IgdGhpcyBmaXgg
dG8gZ28KaW50byB0aGUgbWFpbmxpbmUgNS4zIHJlbGVhc2U/CkknZCBsaWtlIHRvIGtub3cgaG93
IHRvIGFwcGx5IHRoaXMgZml4IGZvciBjdXJyZW50IHJjIGtlcm5lbHMsIGJ5CmRybS1taXNjLWZp
eGVzPyBDYW4gSSBwdXNoCnRvIGRybS1taXNjLWZpeGVzIGJ5IGRpbSBvciBJIGNhbiBvbmx5IHB1
c2ggdG8gZHJtLW1pc2MtbmV4dCBhbmQKZHJtLW1pc2MgbWFpbnRhaW5lciB3aWxsCnBpY2sgZml4
ZXMgZnJvbSBpdCB0byBkcm0tbWlzYy1maXhlcz8KClRoYW5rcywKUWlhbmcKCk9uIFN1biwgU2Vw
IDgsIDIwMTkgYXQgMTA6NDggQU0gVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KCkgcmV0dXJucyAw
IGlmIGl0IHN1Y2NlZWRzIGFuZCAtRVRJTUUKPiBpZiBpdCB0aW1lb3V0cywgYnV0IGxpbWEgZHJp
dmVyIGFzc3VtZWQgdGhhdCAwIGlzIGVycm9yLgo+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEv
bGltYV9nZW0uYwo+IGluZGV4IDQ3N2MwZjc2NjY2My4uYjYwOWRjMDMwZDZjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbGltYS9saW1hX2dlbS5jCj4gQEAgLTM0Miw3ICszNDIsNyBAQCBpbnQgbGltYV9nZW1fd2Fp
dChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHUzMiBoYW5kbGUsIHUzMiBvcCwgczY0IHRpbWVvdXRf
bnMpCj4gICAgICAgICB0aW1lb3V0ID0gZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXModGltZW91
dF9ucyk7Cj4KPiAgICAgICAgIHJldCA9IGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQo
ZmlsZSwgaGFuZGxlLCB3cml0ZSwgdGltZW91dCk7Cj4gLSAgICAgICBpZiAocmV0ID09IDApCj4g
KyAgICAgICBpZiAocmV0ID09IC1FVElNRSkKPiAgICAgICAgICAgICAgICAgcmV0ID0gdGltZW91
dCA/IC1FVElNRURPVVQgOiAtRUJVU1k7Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gLS0KPiAy
LjIzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
