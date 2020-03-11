Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A64182AD4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805CB6EA76;
	Thu, 12 Mar 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA046E98F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:04:18 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id l20so1613593qtp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Cqo7VQlzq/TPqJ6TonOp7as4n99bgQmDcdcZv6gO2F8=;
 b=TLSRpSEmfq9xFyRZcgDxGh5Lb3hW5CBEQSLBNpDGJMrD7LL5VqTgyTK0D0IkvCWszV
 PPn0UMKyCql6oHnq2pUDsMtfTl3IBd5oU9i5HK9C25J1tKKKJuSzJLrwEN+uYxyA+1bN
 S0jJ2jpKh2dB++96q4I7n7U/se7wzWOUKQu+Vz7acBANJaJTZK+GtD7boM68YeLR9nmd
 OGAJPNo8yw06zxYfHoXgmEqiaxlqcjT9cHwgr54Kj034/ot73B3bB1GsgYMbdoZxcHyd
 ds8dwdCrLusTWusZOWN/lHOxgZZB3HGA0w85dW20UDr31WyAoS01r4fKcGft5XWC4qYQ
 18mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Cqo7VQlzq/TPqJ6TonOp7as4n99bgQmDcdcZv6gO2F8=;
 b=ofvd4OyJkPkuQG395ZrXD5XP5+snhgXHG+U2RPTeDb3seLgcyXUp5Qu9A7Mc9yB7ll
 K1wRxlr48tdBgFVQwgGRiu/6xncPrJktGCaX+zLdN9sweHFoIgl6s+8EW6bhzLsLMAFK
 s38vEmSd0PVarLi20KRj/XNCgqRpSoI42Mo1lVfyErA46btERUHfc/x+N+m1hombZ1E0
 ZNE45P/6wdeoQe8Sm14jDTjVH1mnDaiVxOOiJ8U/Cm5GTIaUS8oOuyhLQBSWcG36qbN2
 u5IeQ6bqEs07Xzvh9ulN9zq6X9fxTDI6tWD0oFIjgtAhinm6kTS4o8XJ1wJJUFi985UZ
 Bszw==
X-Gm-Message-State: ANhLgQ2iuiizdfHm6nxARioipW/zmgyHBdzE9iBgThHfMjcEeMo1fz+f
 EiQPmyiK0agCWpVFmoCfHmPSFA==
X-Google-Smtp-Source: ADFU+vviajzmBXQ916Uf4yRSfIBDqtB11ZLiBbI5MR+xNrH29WCHdAQ3/YUVflC76y1uWsFSv4av7Q==
X-Received: by 2002:aed:218f:: with SMTP id l15mr2730531qtc.247.1583935457502; 
 Wed, 11 Mar 2020 07:04:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m17sm19286741qke.24.2020.03.11.07.04.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:04:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC1y4-00044U-03; Wed, 11 Mar 2020 11:04:16 -0300
Date: Wed, 11 Mar 2020 11:04:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311140415.GB31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311135158.3310-5-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDI6NTE6NTZQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBDaGVjayBpZiB3ZSBjYW4gZG8gcGVlcjJwZWVyIG9uIHRoZSBQQ0llIGJ1cy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+IGluZGV4IGFlZjEyZWUyZjFlMy4u
YmJmNjc4MDBjOGE2IDEwMDY0NAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMKPiBAQCAtMzgsNiArMzgsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2FtZGdw
dV9kcm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1mZW5jZS1hcnJheS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGNpLXAycGRtYS5oPgo+ICAK
PiAgLyoqCj4gICAqIGFtZGdwdV9nZW1fcHJpbWVfdm1hcCAtICZkbWFfYnVmX29wcy52bWFwIGlt
cGxlbWVudGF0aW9uCj4gQEAgLTE3OSw2ICsxODAsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbWFf
YnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+ICAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKPiAgCWludCByOwo+ICAK
PiArCWlmIChwY2lfcDJwZG1hX2Rpc3RhbmNlX21hbnkoYWRldi0+cGRldiwgJmF0dGFjaC0+ZGV2
LCAxLCB0cnVlKSA8IDApCj4gKwkJYXR0YWNoLT5wZWVyMnBlZXIgPSBmYWxzZTsKPiArCgpBcmUg
dGhlcmUgb3RoZXIgcmVsYXRlZCBwYXRjaGVzIHRoYW4gdGhpcyBzZXJpZXM/CgpwMnAgZG1hIG1h
cHBpbmcgbmVlZHMgdG8gYmUgZG9uZSBpbiBjb21tb24gY29kZSwgaW4gcDJwZG1hLmMgLSBpZSB0
aGlzCm9wZW4gY29kaW5nIGlzIG1pc3NpbmcgdGhlIGJ1c19vZmZzZXQgc3R1ZmYsIGF0IGxlYXN0
LiAKCkkgcmVhbGx5IGRvIG5vdCB3YW50IHRvIHNlZSBkcml2ZXJzIG9wZW4gY29kZSB0aGlzIHN0
dWZmLgoKV2UgYWxyZWFkeSBoYXZlIGEgcDJwZG1hIEFQSSBmb3IgaGFuZGxpbmcgdGhlIHN0cnVj
dCBwYWdlIGNhc2UsIHNvIEkKc3VnZ2VzdCBhZGRpbmcgc29tZSBuZXcgcDJwZG1hIEFQSSB0byBo
YW5kbGUgdGhpcyBmb3Igbm9uLXN0cnVjdCBwYWdlCmNhc2VzLgoKaWUgc29tZSB0aGluZyBsaWtl
OgoKaW50ICdwMnBkbWEgbWFwIGJhcicoCiAgIHN0cnVjdCBwY2lfZGV2aWNlICpzb3VyY2UsCiAg
IHVuc2lnbmVkIGludCBzb3VyY2VfYmFyX251bWJlciwgCiAgIHN0cnVjdCBwY2lfZGV2aWNlICpk
ZXN0LCAKICAgcGh5c2FkZHImbGVuICphcnJheV9vZl9vZmZzZXRzICYgbGVuZ3RoIHBhaXJzIGlu
dG8gc291cmNlIGJhciwKICAgc3RydWN0IHNjYXR0ZXJsaXN0ICpvdXRwdXRfc2dsKQoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
