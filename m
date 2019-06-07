Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CA3A5B0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020689265;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E486289E39;
 Fri,  7 Jun 2019 18:39:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id p24so2359110lfo.6;
 Fri, 07 Jun 2019 11:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBZaGIwgweQnWOXVd6rMqfse78NHRo0T4EcStz9iVIQ=;
 b=L/VQdoOLenumzPdEe2TDri7lZoE76SCx1KVa7qLAFoXV/Co11LH8KQPceM5GaDg5DG
 HGWM30KGdAIWjrIsi1dXfaFpMPLDmMqeBlSnPkyJKe9EhrCRCWds26jEm6NYdbaWJW6j
 vYTi17AqmMKYGf40hgH6N3nGJ9Np/CsfcdWz+EnA/P0PW2nDBzO06xUOMPaaz0WXeQd9
 P2aUtCb7uQqC2zkBpOEKQMhZ35QzJPa2gduD1As7gFaJZc7gN2JgooUdxNs8iTbnb5eS
 t/iXG7c59AnbNLzUXyxp8NvFLePK0D1Nan9IQ2oBz0Uai8N7CQgIvqp42EyIiEgdQZST
 L8mA==
X-Gm-Message-State: APjAAAX2OCarN6qd/rdAFd4WofX0oMTrQ16HV5HfC/DHikQT5TgTNY0a
 UQmCW+41hHV45WtQiC6UNcY5fr1zAo9yPkRCSY7B9A==
X-Google-Smtp-Source: APXvYqzpYru1mSiIJAYAAln379ADncNx7MWnLg9IN9S/saFxt4Q/t15ioOsTVLZoxtjNBsXdLo/cW12pg/MP2MV24cM=
X-Received: by 2002:ac2:5189:: with SMTP id u9mr26487227lfi.189.1559932786305; 
 Fri, 07 Jun 2019 11:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sat, 8 Jun 2019 00:14:50 +0530
Message-ID: <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/svm: Convert to use hmm_range_fault()
To: bskeggs@redhat.com, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, jasojgg@ziepe.ca
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gBZaGIwgweQnWOXVd6rMqfse78NHRo0T4EcStz9iVIQ=;
 b=ddD/HTEp9Q9UDuxE2OsndGwM27L5u0P3bcjGx9VditCdq16qF4fOWLiTkia5NCHEC/
 1v5Ost4CHsFNdQpW1cFlTs06z2zn4hlRi3dOhy0Uu7+Cxf2W9uhXNrH7aiYYWruJqyrO
 c5ApyyrOQkorfM3Yc7/u5WB/XIvCt0VDQo2wSmDP+4yRe/LxcSYNCqPkQFsIJSNX4La3
 4W8LU8QK/BQczStVvqxD8XJF5uDRZ1lOn5p6x7JfqdxKrel1Q+hFosS6JIDFT0nZIc/8
 N7iLBzKoc2lJGV8v/gHsjhktl8xmPYIastjNXFb/fJnBdnTgux/CvqhXOzNg1+7f+TIv
 14Sw==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFzb24sCgpPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMjoyNyBBTSBTb3VwdGljayBKb2Fy
ZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDb252ZXJ0IHRvIHVzZSBobW1f
cmFuZ2VfZmF1bHQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIu
bGludXhAZ21haWwuY29tPgoKV291bGQgeW91IGxpa2UgdG8gdGFrZSBpdCB0aHJvdWdoIHlvdXIg
bmV3IGhtbSB0cmVlIG9yIGRvIEkKbmVlZCB0byByZXNlbmQgaXQgPwoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMKPiBpbmRleCA5M2VkNDNjLi44ZDU2YmQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gQEAgLTY0OSw3ICs2NDksNyBAQCBzdHJ1Y3Qgbm91dmVh
dV9zdm1tIHsKPiAgICAgICAgICAgICAgICAgcmFuZ2UudmFsdWVzID0gbm91dmVhdV9zdm1fcGZu
X3ZhbHVlczsKPiAgICAgICAgICAgICAgICAgcmFuZ2UucGZuX3NoaWZ0ID0gTlZJRl9WTU1fUEZO
TUFQX1YwX0FERFJfU0hJRlQ7Cj4gIGFnYWluOgo+IC0gICAgICAgICAgICAgICByZXQgPSBobW1f
dm1hX2ZhdWx0KCZyYW5nZSwgdHJ1ZSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGhtbV9yYW5n
ZV9mYXVsdCgmcmFuZ2UsIHRydWUpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0ID09IDApIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFobW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlKSkgewo+
IC0tCj4gMS45LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
