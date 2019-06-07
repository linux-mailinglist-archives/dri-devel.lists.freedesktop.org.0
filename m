Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91558388C0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2E289D4F;
	Fri,  7 Jun 2019 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C4689D4F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:15:09 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j19so1687910qtr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 04:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z0XIc20VAx01mJosghNPKKwi9cMpmbeAnP+WNjIIzRM=;
 b=eJxPNJ3d/9CDyXg+pCU5UfgYZYKk/mW2fooH+/QmPFSbkaT6DDVn17BKRAPjRDgPWp
 v1kbiHwnAEoEKeNIusAlyUH0/PB87PqfvZdXI3ZR4rP1JFLFZ1tEijWYQPHqG6zmzyto
 2Sum4bASHjFKqlQpXhEGIbM8uBXlbdNZ+FNFYPOHUP7PlG4uSMXkzUvHxRepusfljRJj
 Wwr3kPtjgjo3k++G/2E5rC76BXrrvAqtPM9R/avm/fJzIi5EL5j9T6UniKdYJsnOwkeV
 NBctQTzLV9oqZo/AATpOem9HGkB6GVjO0miPUd1pNhaR+0d+otO5TwxOw4JL+FfSjApA
 QaNw==
X-Gm-Message-State: APjAAAWDB5anCmbdK2UIy5x3P1d0h69GT+BC1i/GiBn+AK4nGRjokKdD
 tsheqLf4szD4/IvJkdgEL+t5Sz55FvBMFYiT0qMLjA==
X-Google-Smtp-Source: APXvYqyfDTEYJBGAsaTUVytJYlzQYcTE/K3UKO9PiIsYXvYbzV6foOUC1bLSc+H5JbzBebYsawjsP64b+zDfQPFYq8Q=
X-Received: by 2002:a0c:99d5:: with SMTP id y21mr43243887qve.106.1559906108632; 
 Fri, 07 Jun 2019 04:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190606211544.5389-1-daniel.vetter@ffwll.ch>
 <CACvgo50ACVW1haAnXBhdvOJZ_6vNDinMHq9QpBc2yydrpeFSRA@mail.gmail.com>
In-Reply-To: <CACvgo50ACVW1haAnXBhdvOJZ_6vNDinMHq9QpBc2yydrpeFSRA@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 7 Jun 2019 13:14:57 +0200
Message-ID: <CA+M3ks6ypjy=M2zqmJ_RxUpoTi+czD5pMP+p2LMDiGSWk24wUg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/crc-debugfs: Also sprinkle irqrestore
 over early exits
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z0XIc20VAx01mJosghNPKKwi9cMpmbeAnP+WNjIIzRM=;
 b=UB3qm6JTzea1feZt1W2uWiXfyul0r/OTHaoCfeJ0WKu4O+fmBlBOTjsFmjeEDm9+Ha
 K+ZrR1Yu2PYzw4I6eZw7jMXznsNZIWG2qo3DlHDWcw8vnvm8bsKS7oM0PMaGxB7f518Q
 9OceOvGD2pY2t1hnEvHYB6q8UkGUSHhJ9uWgsHYZQE8xKzNoljTWBXGQneKrohpfrj+e
 /mswF/zFwUDdE35g4N1PYP5TmpvlyRaFxwB/XYMg2oDHLw+hpTqQ+UrGdPzHiOyKoGtN
 pj9wmGuLR0qzYjIQ+4BCvezCEPtGXMrQeeNNfaXeRmI3hkqjrW00QBi/nKTBVsFGJrGa
 11bw==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiA3IGp1aW4gMjAxOSDDoCAxMjowNywgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFRodSwgNiBKdW4gMjAxOSBhdCAyMjoxNSwg
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gSS4g
d2FzLiBibGluZC4KPiA+Cj4gPiBDYXVnaHQgd2l0aCB2a21zLCB3aGljaCBoYXMgc29tZSByZWFs
bHkgc2xvdyBjcmMgY29tcHV0YXRpb24gZnVuY3Rpb24uCj4gPgo+ID4gRml4ZXM6IDE4ODIwMThh
NzBlMCAoImRybS9jcmMtZGVidWdmczogVXNlciBpcnFzYWZlIHNwaW5sb2NrIGluIGRybV9jcnRj
X2FkZF9jcmNfZW50cnkiKQo+ID4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWly
YW1lbG9AZ21haWwuY29tPgo+ID4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxh
Ym9yYS5jb20+Cj4gPiBDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPiA+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9y
Zz4KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KClJldmlld2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
bGluYXJvLm9yZz4KCj4KPiAtRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
