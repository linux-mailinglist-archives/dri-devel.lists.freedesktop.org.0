Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC931BC278
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB16C6E824;
	Tue, 28 Apr 2020 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE4F6E824;
 Tue, 28 Apr 2020 15:15:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u127so3292691wmg.1;
 Tue, 28 Apr 2020 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6RQa3/Ivl+erv2MC5JIerdVHsjcRsy5jElt25/tvg/I=;
 b=c/rDYXyVx+iz8SQtNmdLLH9jiyFcXnPbgx93UfB9RgZOLHKZjwmjlrpMpBrqvtv6Fw
 e3pdYB7gxw+aEHxM30rDVR+kHPY1rl9jcotFrTRSnlHN/Sy7vvx+LPXJNZwgEggzcTWB
 LuNAmn0HSFJVT70SwHLf3sgYl/Kx3gKsWpMIEQtqM8k0x9ytKRe8td2LPY1rCkMV3dw7
 psiw49gPvhkuxILNWN08yqhHImHmiI27uI55UfLBdsWcku7ZE2NvnEY2pv3lxOw5UkS9
 RV6DV8J10tXn4Za5fUe0JvrTCtHazLo7gOx6UIJnFQwRYybjgD3lh2zZDTK0vKtWyWpe
 IJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6RQa3/Ivl+erv2MC5JIerdVHsjcRsy5jElt25/tvg/I=;
 b=WXe06aIztxz2ftohZHDdB/mz+QyBAY2PzlDpHJ4D22/KWOTD0+JyGMUeWQ5UVGebMt
 kfm/fPLm5J0jIdk635n7v140AK2o/CW4wwqv+A5BrZyovFNjyKriL3DjfTY6Hh1kJ/at
 eO+gt75f9eYMtYeW4jVB1jMx1sNSpq8sJYTUoTOXrPfvBriSL8uy/U2oH5wozdfyz1Co
 7YIRYdjtyr6fbHynKzj1bkZIGZcJaWQNqJVl1ts+qXgf9GjvV8mCGR4VytlH61/D59oI
 hiPUa9FRTWknmL+PsOPlxw1lHg811QRmkVdIn7CPsSjA+tNAqQS1yuF9ejHknDmAU2Tx
 qYqQ==
X-Gm-Message-State: AGi0PuZcXdUt6fOkwq8/pvK8dcaLNO9FJFwmWxFoA+OGe/EtcMI0aCLI
 TZz9zZi91NUpyf3BgFm3ldk=
X-Google-Smtp-Source: APiQypJXqdagbY7C95ErpdLoYp1uRYumNOUPPDPTkG1JE8zcrJsSYL5DCZa3nXGytS0h2Vy2ksxDbg==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr5373467wmk.92.1588086918255; 
 Tue, 28 Apr 2020 08:15:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 74sm26988379wrk.30.2020.04.28.08.15.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 08:15:17 -0700 (PDT)
Subject: Re: [RFC 10/17] drm: radeon: fix sg_table nents vs. orig_nents misuse
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132028eucas1p155a84ab14c6a6820b4c8240f01e98905@eucas1p1.samsung.com>
 <20200428132005.21424-11-m.szyprowski@samsung.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <94c45ded-6544-a922-7177-8255b44c4cfa@gmail.com>
Date: Tue, 28 Apr 2020 17:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200428132005.21424-11-m.szyprowski@samsung.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDQuMjAgdW0gMTU6MTkgc2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+IFRoZSBEb2N1
bWVudGF0aW9uL0RNQS1BUEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IGRtYV9tYXBfc2cgcmV0dXJu
cyB0aGUKPiBudW1lciBvZiB0aGUgY3JlYXRlZCBlbnRyaWVzIGluIHRoZSBETUEgYWRkcmVzcyBz
cGFjZS4gSG93ZXZlciB0aGUKPiBzdWJzZXF1ZW50IGNhbGxzIHRvIGRtYV9zeW5jX3NnX2Zvcl97
ZGV2aWNlLGNwdX0gYW5kIGRtYV91bm1hcF9zZyBtdXN0IGJlCj4gY2FsbGVkIHdpdGggdGhlIG9y
aWdpbmFsIG51bWJlciBvZiBlbnRyaWVzIHBhc3NlZCB0byBkbWFfbWFwX3NnLiBUaGUKPiBzZ190
YWJsZS0+bmVudHMgaW4gdHVybiBob2xkcyB0aGUgcmVzdWx0IG9mIHRoZSBkbWFfbWFwX3NnIGNh
bGwgYXMgc3RhdGVkCj4gaW4gaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oLiBBZGFwdCB0aGUg
Y29kZSB0byBvYmV5IHRob3NlIHJ1bGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJv
d3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDEwICsrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl90dG0uYwo+IGluZGV4IDVkNTBjOWUuLjQ3NzA4ODAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl90dG0uYwo+IEBAIC00ODEsNyArNDgxLDcgQEAgc3RhdGljIGludCByYWRlb25f
dHRtX3R0X3Bpbl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKPiAgIHsKPiAgIAlzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiA9IHJhZGVvbl9nZXRfcmRldih0dG0tPmJkZXYpOwo+ICAgCXN0
cnVjdCByYWRlb25fdHRtX3R0ICpndHQgPSAodm9pZCAqKXR0bTsKPiAtCXVuc2lnbmVkIHBpbm5l
ZCA9IDAsIG5lbnRzOwo+ICsJdW5zaWduZWQgcGlubmVkID0gMDsKPiAgIAlpbnQgcjsKPiAgIAo+
ICAgCWludCB3cml0ZSA9ICEoZ3R0LT51c2VyZmxhZ3MgJiBSQURFT05fR0VNX1VTRVJQVFJfUkVB
RE9OTFkpOwo+IEBAIC01MjIsOCArNTIyLDggQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3Bp
bl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKPiAgIAkJZ290byByZWxlYXNlX3NnOwo+ICAg
Cj4gICAJciA9IC1FTk9NRU07Cj4gLQluZW50cyA9IGRtYV9tYXBfc2cocmRldi0+ZGV2LCB0dG0t
PnNnLT5zZ2wsIHR0bS0+c2ctPm5lbnRzLCBkaXJlY3Rpb24pOwo+IC0JaWYgKG5lbnRzID09IDAp
Cj4gKwl0dG0tPnNnLT5uZW50cyA9IGRtYV9tYXBfc2cocmRldi0+ZGV2LCB0dG0tPnNnLT5zZ2ws
Cj4gKwlpZiAodHRtLT5zZy0+bmVudHMgPT0gMCkKPiAgIAkJZ290byByZWxlYXNlX3NnOwo+ICAg
Cj4gICAJZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgdHRtLT5wYWdl
cywKPiBAQCAtNTU0LDkgKzU1NCw5IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl90dG1fdHRfdW5waW5f
dXNlcnB0cihzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4gICAJCXJldHVybjsKPiAgIAo+ICAgCS8qIGZy
ZWUgdGhlIHNnIHRhYmxlIGFuZCBwYWdlcyBhZ2FpbiAqLwo+IC0JZG1hX3VubWFwX3NnKHJkZXYt
PmRldiwgdHRtLT5zZy0+c2dsLCB0dG0tPnNnLT5uZW50cywgZGlyZWN0aW9uKTsKPiArCWRtYV91
bm1hcF9zZyhyZGV2LT5kZXYsIHR0bS0+c2ctPnNnbCwgdHRtLT5zZy0+b3JpZ19uZW50cywgZGly
ZWN0aW9uKTsKPiAgIAo+IC0JZm9yX2VhY2hfc2dfcGFnZSh0dG0tPnNnLT5zZ2wsICZzZ19pdGVy
LCB0dG0tPnNnLT5uZW50cywgMCkgewo+ICsJZm9yX2VhY2hfc2dfcGFnZSh0dG0tPnNnLT5zZ2ws
ICZzZ19pdGVyLCB0dG0tPnNnLT5vcmlnX25lbnRzLCAwKSB7Cj4gICAJCXN0cnVjdCBwYWdlICpw
YWdlID0gc2dfcGFnZV9pdGVyX3BhZ2UoJnNnX2l0ZXIpOwo+ICAgCQlpZiAoIShndHQtPnVzZXJm
bGFncyAmIFJBREVPTl9HRU1fVVNFUlBUUl9SRUFET05MWSkpCj4gICAJCQlzZXRfcGFnZV9kaXJ0
eShwYWdlKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
