Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13F387C7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 12:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A0389AC2;
	Fri,  7 Jun 2019 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57BF89AC2;
 Fri,  7 Jun 2019 10:17:02 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id d128so817139vsc.10;
 Fri, 07 Jun 2019 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9MFO+IVNLSuig9C2OwDlzgkjfzmwye5tIu6viOl58L8=;
 b=lAHUbwKqCAplp0dWEnqBWFxFWqaZ51K3obj7t6ugb6yYq3P9t2PyVMs27VdP78DMpa
 VEJmyp9PCIBd2i36vDZfZva9CxDskEJLl1rn/JhzkT9oIa2MebDCifhpuK9uCZ/ZcXwk
 U9PfrQ4Bj6v9fXGDYr4GtODKcNb8vxiFjT2gkErXwG9JALRfb49Gkv2fjO+7IA8fNKkn
 HlkKPl19pJSwjg2uKqbwaL1XKtSX61TTOC9l6XBRjwx80i/majqDQ+FQnubYQRg6re7g
 SVixWudeFNi1CPl2d7x9rVJHA6YUwzo+SOCaK+KEps9HgVWlcsVT7yfYAr3/Rgo7puvh
 KYGQ==
X-Gm-Message-State: APjAAAXeCxfLNJf12FEZpbpjByrbupSX3S/yAZ9ZzLD0JOSQ7bxKcWKK
 zhU5Wbf1AT/urVB9D/iEPOU0H5tHoPgSJiN7P58=
X-Google-Smtp-Source: APXvYqy5R7UqSMABE2+4vGHSjp5IK37iXPcBcg7G6bLE6C70/elnh4KWGHiTmOvlPmEnwOwIsl2DSEqgfw3+07M9aQk=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr3940766vsd.85.1559902071810; 
 Fri, 07 Jun 2019 03:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190606211544.5389-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190606211544.5389-1-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 7 Jun 2019 11:05:59 +0100
Message-ID: <CACvgo50ACVW1haAnXBhdvOJZ_6vNDinMHq9QpBc2yydrpeFSRA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/crc-debugfs: Also sprinkle irqrestore
 over early exits
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9MFO+IVNLSuig9C2OwDlzgkjfzmwye5tIu6viOl58L8=;
 b=EseaK/wRuWwN5W1XvXmwVDJMolRZaCKX6az6C0IPvgkp4w+Q4E/smw7870Ee2JbRh1
 9/FeWoS//qcmUPttFIyJQXMLUKPL637LThnirAg/yy/u/KIpEVvRzMOqp6GIye1HmHIU
 s/gWatZKIFFVYbvfppy8o625/QdYYb7oM3Mb1GdnaPGD/UVHG+rTiYZV+f4hkiQfUFWc
 PlxRr+GZ7EgnYVJW+BvK9QBWxBe4Dkhoq1st2W6NKJA/+xx6sre8BQaXHATMDToMv5Fa
 uR+BrWKoYR9s7NFgFt6o0x0m559wECcd0KY/TZQ9KFuhzibB7+o1ToK1LvPZgUTh7Bgk
 i9IA==
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEp1biAyMDE5IGF0IDIyOjE1LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPiB3cm90ZToKPgo+IEkuIHdhcy4gYmxpbmQuCj4KPiBDYXVnaHQgd2l0aCB2a21z
LCB3aGljaCBoYXMgc29tZSByZWFsbHkgc2xvdyBjcmMgY29tcHV0YXRpb24gZnVuY3Rpb24uCj4K
PiBGaXhlczogMTg4MjAxOGE3MGUwICgiZHJtL2NyYy1kZWJ1Z2ZzOiBVc2VyIGlycXNhZmUgc3Bp
bmxvY2sgaW4gZHJtX2NydGNfYWRkX2NyY19lbnRyeSIpCj4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEg
PHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1
LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
bGluYXJvLm9yZz4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
