Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217F5F261
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 07:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCED6E252;
	Thu,  4 Jul 2019 05:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC276E1CD;
 Thu,  4 Jul 2019 05:50:22 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id k9so1268441vso.5;
 Wed, 03 Jul 2019 22:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNj8Am5UXGLoiXxYPyOV6TXKP3Pj9OzQjZH9m5seI/U=;
 b=YDyfRhZZK2jNnM63pBjsYjLdKJbtpS4tGcv4wX/s2kKaCfL7WO9uJ7sV3PE5JzSyKc
 2Hk+MWmogYxSHM01rvUW88CAEXWH4CeVVfIRatnFtJa927nqbJGLD9ON3Hq/fmF7FNXx
 0RGH4fZKTrs/R0eC7FzuRqA1D+a+V/+z4/qOSZE+t+iLmxHPo5BkUnQiFes9xZXTdQDh
 Du2eoW0eCjCFdp0iOay1A9DO+MHmhpclKpksG5+Uel9A6vc8MQHhcQdPl5zqUduzzBV6
 V+Cdjd4TzyrP56fIt0rmCWjog14f8mje1oyTYTIyFGZ/dUCPB7PnPQRVlAUL7BVMG6Sn
 KRrA==
X-Gm-Message-State: APjAAAWJ0uFBD9BxVc+75nEWVgXudKYtHfp4IwrMg3y3D6pDu2PMEoSA
 Ki/yokzjcEjjcCzuKHFN5jcudtdk5KzrIgQlikg=
X-Google-Smtp-Source: APXvYqzzCr04x1Z85t6PbnuGJpYy2/K3hgA93DC+JpgDZ8qLSkOiq+Xv1YXShYOs6qw8i6YHBftvD73Q8gmNHgnH0VA=
X-Received: by 2002:a67:bb03:: with SMTP id m3mr20897325vsn.84.1562219421096; 
 Wed, 03 Jul 2019 22:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190701014622.13199-1-yongxin.liu@windriver.com>
In-Reply-To: <20190701014622.13199-1-yongxin.liu@windriver.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 4 Jul 2019 15:50:10 +1000
Message-ID: <CACAvsv5b2D4SSz0OTWS6gygs5+guc5cdWeBWCiJ2bqXu-RP=wA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix memory leak in
 nouveau_conn_reset()
To: Yongxin Liu <yongxin.liu@windriver.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TNj8Am5UXGLoiXxYPyOV6TXKP3Pj9OzQjZH9m5seI/U=;
 b=Ph2soGqAZJYBe073IIotpxCUKWW0L9T5aeVan9RW3PwIV1hYcJCDktWMeUWEHn6t2L
 DcjAide/x/YaaLHihXcmq5oc6BKu9gGxRGp9h13RPs3rILxjI2fPD80SSQ7S1uXatYSA
 hfmmN0F0LS1AcJ0Xce/8mM9jMeSPqtLGtvlp0rR3gUZOydxmGw6m2VKccXt9HpTcVL+W
 QQsLiclXhfSpk9WUAunywdQlv7gn5SCfwfPXStlT/pjmU6SVaRk5BeaLayH3QqsV9laY
 fYe3IjjUXaKZ+DWU0GgL2kDDGEbttfH7tDZcUmm4hoY+fVn75jOdGVvIi3x52o05HKjG
 GD0g==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxIEp1bCAyMDE5IGF0IDEyOjM3LCBZb25neGluIExpdSA8eW9uZ3hpbi5saXVAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6Cj4KPiBJbiBub3V2ZWF1X2Nvbm5fcmVzZXQoKSwgaWYgY29ubmVj
dG9yLT5zdGF0ZSBpcyB0cnVlLAo+IF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ry
b3lfc3RhdGUoKSB3aWxsIGJlIGNhbGxlZCwKPiBidXQgdGhlIG1lbW9yeSBwb2ludGVkIGJ5IGFz
eWMgaXNuJ3QgZnJlZWQuIE1lbW9yeSBsZWFrIGhhcHBlbnMKPiBpbiB0aGUgZm9sbG93aW5nIGZ1
bmN0aW9uIF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KCksCj4gd2hlcmUgbmV3
bHkgYWxsb2NhdGVkIGFzeWMtPnN0YXRlIHdpbGwgYmUgYXNzaWduZWQgdG8gY29ubmVjdG9yLT5z
dGF0ZS4KPgo+IFNvIHVzaW5nIG5vdXZlYXVfY29ubl9hdG9taWNfZGVzdHJveV9zdGF0ZSgpIGlu
c3RlYWQgb2YKPiBfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlIHRv
IGZyZWUgdGhlICJvbGQiIGFzeWMuCj4KPiBIZXJlIHRoZSBpcyB0aGUgbG9nIHNob3dpbmcgbWVt
b3J5IGxlYWsuCj4KPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjhjNTQ4MDQ4M2M4MCAoc2l6
ZSAxOTIpOgo+ICAgY29tbSAia3dvcmtlci8wOjIiLCBwaWQgMTg4LCBqaWZmaWVzIDQyOTQ2OTUy
NzkgKGFnZSA1My4xNzlzKQo+ICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgMDAg
ZjAgYmEgN2IgNTQgOGMgZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLntULi4uLi4u
Li4uLi4KPiAgICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIC4uLi4uLi4uLi4uLi4uLi4KPiAgIGJhY2t0cmFjZToKPiAgICAgWzwwMDAwMDAwMDUwMDVj
MGQwPl0ga21lbV9jYWNoZV9hbGxvY190cmFjZSsweDE5NS8weDJjMAo+ICAgICBbPDAwMDAwMDAw
YTEyMmJhZWQ+XSBub3V2ZWF1X2Nvbm5fcmVzZXQrMHgyNS8weGMwIFtub3V2ZWF1XQo+ICAgICBb
PDAwMDAwMDAwNGZkMTg5YTI+XSBub3V2ZWF1X2Nvbm5lY3Rvcl9jcmVhdGUrMHgzYTcvMHg2MTAg
W25vdXZlYXVdCj4gICAgIFs8MDAwMDAwMDBjNzMzNDNhOD5dIG52NTBfZGlzcGxheV9jcmVhdGUr
MHgzNDMvMHg5ODAgW25vdXZlYXVdCj4gICAgIFs8MDAwMDAwMDAyZTJiMDNjMz5dIG5vdXZlYXVf
ZGlzcGxheV9jcmVhdGUrMHg1MWYvMHg2NjAgW25vdXZlYXVdCj4gICAgIFs8MDAwMDAwMDBjOTI0
Njk5Yj5dIG5vdXZlYXVfZHJtX2RldmljZV9pbml0KzB4MTgyLzB4N2YwIFtub3V2ZWF1XQo+ICAg
ICBbPDAwMDAwMDAwY2MwMjk0MzY+XSBub3V2ZWF1X2RybV9wcm9iZSsweDIwYy8weDJjMCBbbm91
dmVhdV0KPiAgICAgWzwwMDAwMDAwMDdlOTYxYzNlPl0gbG9jYWxfcGNpX3Byb2JlKzB4NDcvMHhh
MAo+ICAgICBbPDAwMDAwMDAwZGExNGQ1Njk+XSB3b3JrX2Zvcl9jcHVfZm4rMHgxYS8weDMwCj4g
ICAgIFs8MDAwMDAwMDAyOGRhNDgwNT5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2MvMHg2NjAKPiAg
ICAgWzwwMDAwMDAwMDFkNDE1YjA0Pl0gd29ya2VyX3RocmVhZCsweDIyYi8weDNmMAo+ICAgICBb
PDAwMDAwMDAwMDNiNjlmMWY+XSBrdGhyZWFkKzB4MTJmLzB4MTUwCj4gICAgIFs8MDAwMDAwMDBj
OTRjMjliNz5dIHJldF9mcm9tX2ZvcmsrMHgzYS8weDUwCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
eGluIExpdSA8eW9uZ3hpbi5saXVAd2luZHJpdmVyLmNvbT4KVGhhbmtzISAgR290IGl0LgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiBpbmRleCA0MTE2ZWU2
MmFkYWYuLmY2OWZmMjJiZWVlMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9jb25uZWN0b3IuYwo+IEBAIC0yNTIsNyArMjUyLDcgQEAgbm91dmVhdV9jb25uX3Jlc2V0
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gICAgICAgICAgICAgICAgIHJldHVy
bjsKPgo+ICAgICAgICAgaWYgKGNvbm5lY3Rvci0+c3RhdGUpCj4gLSAgICAgICAgICAgICAgIF9f
ZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUoY29ubmVjdG9yLT5zdGF0
ZSk7Cj4gKyAgICAgICAgICAgICAgIG5vdXZlYXVfY29ubl9hdG9taWNfZGVzdHJveV9zdGF0ZShj
b25uZWN0b3IsIGNvbm5lY3Rvci0+c3RhdGUpOwo+ICAgICAgICAgX19kcm1fYXRvbWljX2hlbHBl
cl9jb25uZWN0b3JfcmVzZXQoY29ubmVjdG9yLCAmYXN5Yy0+c3RhdGUpOwo+ICAgICAgICAgYXN5
Yy0+ZGl0aGVyLm1vZGUgPSBESVRIRVJJTkdfTU9ERV9BVVRPOwo+ICAgICAgICAgYXN5Yy0+ZGl0
aGVyLmRlcHRoID0gRElUSEVSSU5HX0RFUFRIX0FVVE87Cj4gLS0KPiAyLjE0LjQKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWls
aW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
