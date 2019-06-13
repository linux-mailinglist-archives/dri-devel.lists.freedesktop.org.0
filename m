Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80F44D31
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623C8892A6;
	Thu, 13 Jun 2019 20:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B11892A5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:15:26 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id y6so326027oix.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYvi3JENt5xjT7/oQoCCDRRyhuGQKrPeHYLl1e4tUxo=;
 b=mFNRvi/xt+fOFHtJjghpGHR9C2YyBFXA3/wTjOB/UPSPde13UlV21G9s8QZfIjrLX/
 bGxVgSChUBE4nV4PFMqHpoBWVDf0iDfdh+44L69aknKCIwRPqYGEy5hOtn8s0VuFPjwK
 G4WiV/dqGUs8aUuxiWbMVBmAe9aa7DT1JMUKDwebrat+XTcz/IbY1JNI+1XWk8v8YIqO
 ImELi2g2YW6pzrYepkvXGLXudd8VRWWxJwGwRP1+5LycSjZZMT+jAmjWz+qMATRwyw0q
 FNoRGRoc1I67aa3H4M3Yu5tXHqJwXOfN98UV3YHy6HEAcHdI+63JsMmPrlysponu2Iod
 MnZw==
X-Gm-Message-State: APjAAAWxvZsAx4rY7j3K8gtsaEY26MhA6Y+0T4rO6OHH/D8YsVWXZJMM
 bvupuEaB/bX2iHSqq9IaPhApzdRfff9sEQOdp7IMTw==
X-Google-Smtp-Source: APXvYqyS333Lp+D4vjCDNGXf2txUSus++eUTfldGM7ZmElD6Qov2BJs1+/5zSo9qFUO6PniS7TXRoikGBTwqET2Ahjo=
X-Received: by 2002:aca:ec82:: with SMTP id k124mr4014371oih.73.1560456925540; 
 Thu, 13 Jun 2019 13:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-9-hch@lst.de>
 <d9e24f8e-986d-e7b8-cf1d-9344ba51719e@deltatee.com>
In-Reply-To: <d9e24f8e-986d-e7b8-cf1d-9344ba51719e@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 13:15:14 -0700
Message-ID: <CAPcyv4gApj=5eYCVSLidDJqF2V1YZiqUht1P26mSzUOjW-ykqA@mail.gmail.com>
Subject: Re: [PATCH 08/22] memremap: pass a struct dev_pagemap to ->kill
To: Logan Gunthorpe <logang@deltatee.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gYvi3JENt5xjT7/oQoCCDRRyhuGQKrPeHYLl1e4tUxo=;
 b=HiQM8Oj8L+VS1a8Hidw0xr9iYYaQmKDaapqQQLP3xBSAjW2G7zF8GCiMqjGr/ym+Mo
 M+OqlxjvRB4nsYJvbsbx5Z3ifuAo0JozSHiAbNq39t8D2waMsSabG6FDy40WGT4oYy8V
 L96EPmLmkBZ66RnBr04w7xeY6utWIJLm5CrypM9lYrEcqa9F/Z5nPa4IShCeMmTv0t0L
 gS2NRGRi4wYn5eA9ZuBqSXqoz8gXypGTSbll9Wp2Y8UNYHgTyBR1qyLVx2ig9t9lcYmD
 HVaPJZLwJOeNsVJ9c9ozc803Mh/zRF+OxcMsrpFkoEYk0fk+301QRIAXIyrgvI3K0bkW
 VbzA==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMToxMiBQTSBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0Bk
ZWx0YXRlZS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMTktMDYtMTMgMzo0MyBhLm0uLCBDaHJp
c3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IFBhc3NpbmcgdGhlIGFjdHVhbCB0eXBlZCBzdHJ1Y3R1
cmUgbGVhZHMgdG8gbW9yZSB1bmRlcnN0YW5kYWJsZSBjb2RlCj4gPiB2cyB0aGUgYWN0dWFsIHJl
ZmVyZW5jZXMuCj4KPiBIYSwgb2ssIEkgb3JpZ2luYWxseSBzdWdnZXN0ZWQgdGhpcyB0byBEYW4g
d2hlbiBoZSBpbnRyb2R1Y2VkIHRoZQo+IGNhbGxiYWNrWzFdLgo+Cj4gUmV2aWV3ZWQtYnk6IExv
Z2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KClJldmlld2VkLWJ5OiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IExvZ2FuIEd1bnRo
b3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4gOikKCgo+Cj4gTG9nYW4KPgo+IFsxXQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOGYwY2FlODItMTMwZi04YTY0LWNmYmQtZmRhNWZkNzZi
Yjc5QGRlbHRhdGVlLmNvbS9ULyN1Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
