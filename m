Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE092115
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D689A92;
	Mon, 19 Aug 2019 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64056E03D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 18:06:05 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id u17so5554332pgi.6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 11:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KoFYGqM6Xclsd27/smLN8/exw0zz59nAWxnbzaaspPA=;
 b=omLMOkD2pJ0+Ep8J/lgi6v2kxtVRaD3rZ8xpzoUUGfZjrX4ANJzgNEIPUHw5/L6Fpm
 JdY0ejbJx+jd5ET25MIJlS629GsLgORtNE+SMwe+0WVk787knvdRggo410oX/Tp7GUwo
 0RS3iRqryvO6XB8opu69giN8HCcUmxlmJ0Zl6P8aU+NPuV9dr29lJNtUgY1t7ozeqUmv
 DDS1e3g5ozwD5477vRd77TPGaKa34q9Faov4ni+Kw7OotJB1AYL3dq4NEFS98TX/hY2N
 yP9W7Q2RzyIU+Bfb73VdKyuk/COBFr/+ywVmXVALaKakz7L7nxsFewqpR1wToRhI4u7m
 TzwA==
X-Gm-Message-State: APjAAAXavtCmOyaAH2uej2zvT5eoV5jmTecConZY15l3rmc7sowQodds
 rUkg/11IJrkglJ05DyqIZug=
X-Google-Smtp-Source: APXvYqxMGgYzFsoJzSt06l1qcfCVphHMaarquycLPP0x0CO/AugzXKjgYJD9y7NE5wAo4u10+bL+gA==
X-Received: by 2002:a17:90b:8ce:: with SMTP id
 ds14mr7981035pjb.105.1566151565354; 
 Sun, 18 Aug 2019 11:06:05 -0700 (PDT)
Received: from bharath12345-Inspiron-5559 ([103.110.42.34])
 by smtp.gmail.com with ESMTPSA id y188sm13950162pfb.115.2019.08.18.11.06.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 11:06:04 -0700 (PDT)
Date: Sun, 18 Aug 2019 23:35:59 +0530
From: Bharath Vedartham <linux.bhar@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] dma-buf: Fix memory leak in dma_buf_set_name
Message-ID: <20190818180559.GB6635@bharath12345-Inspiron-5559>
References: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
 <43d7adfb9ae9d25fc7c6093d3119c62f742df2cb.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43d7adfb9ae9d25fc7c6093d3119c62f742df2cb.camel@collabora.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KoFYGqM6Xclsd27/smLN8/exw0zz59nAWxnbzaaspPA=;
 b=iDdCHbmtRQ8Pztw9R5H28RB2AbDmZD7WPontfKyeFJGZ1WE1640ZFfVcpV0PD8E3cX
 XdAyVtQUIungyDngmkyeo5kgrwI1hpjCEueI2mfQ7Y8HjV8UByFsOuMMh8k3WtNGQqYj
 qLNzLVUBtb51pFfwb44Y42DvjWF2ydZXK/aKrRuEKV3+2eVn6Zq6QMmyxVOzcjz+6386
 xWuy6tCIrja2oG2gXoVXh5V3o89tkMexp2zQOD2mB5fGJp4Kfts8L/ViDhiINzd+aLxz
 UXPdcNiRGXjyIvpl7m+QtIXI8tHEBmUOJmjwGSg/BzLS8HMBkvJKlNBi8DtiK6h4Yfgv
 szDw==
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDU6MTQ6MjRQTSAtMDMwMCwgRXplcXVpZWwgR2FyY2lh
IHdyb3RlOgo+IEhpIEJoYXJhdGgsCj4gCj4gVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8g
dHJ5IHRvIGZpeCB0aGlzIHJlcG9ydC4KPiAKPiBIb3dldmVyLCB0aGlzIGRvZXNuJ3QgbG9vayBy
aWdodC4KPiAKPiBPbiBGcmksIDIwMTktMDgtMTYgYXQgMjM6MzAgKzA1MzAsIEJoYXJhdGggVmVk
YXJ0aGFtIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBmaXhlcyBhIG1lbW9yeSBsZWFrIGJ1ZyByZXBv
cnRlZCBieSBzeXpib3QuIExpbmsgdG8gdGhlCj4gPiBidWcgaXMgZ2l2ZW4gYXQgWzFdLgo+ID4g
Cj4gPiBBIGxvY2FsIHZhcmlhYmxlIG5hbWUgaXMgdXNlZCB0byBob2xkIHRoZSBjb3BpZWQgdXNl
ciBidWZmZXIgc3RyaW5nCj4gPiB1c2luZyBzdHJuZHVwX3VzZXIuIHN0cm5kdXBfdXNlciBhbGxv
Y2F0ZXMgbWVtb3J5IHVzaW5nCj4gPiBrbWFsbG9jX3RyYWNrX2NhbGxlciBpbiBtZW1kdXBfdXNl
ci4gVGhpcyBrbWFsbG9jIGFsbG9jYXRpb24gbmVlZHMgdG8gYmUKPiA+IGZvbGxvd2VkIGJ5IGEg
a2ZyZWUuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggaGFzIGJlZW4gdGVzdGVkIGJ5IGEgY29tcGlsZSB0
ZXN0Lgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWNl
NjkyYTNhYTEzZTAwZTMzNWUwOTBiZTc4NDZjNmViNjBkZGZmN2EKPiA+IAo+ID4gUmVwb3J0ZWQt
Ynk6IHN5emJvdCtiMjA5OGJjNDQ3MjhhNGVmYjNlOUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29t
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaGFyYXRoIFZlZGFydGhhbSA8bGludXguYmhhckBnbWFpbC5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMSArCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ID4gaW5kZXgg
ZjQ1YmZiMi4uOTc5OGY2ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiA+IEBAIC0zNDIsNiArMzQy
LDcgQEAgc3RhdGljIGxvbmcgZG1hX2J1Zl9zZXRfbmFtZShzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVm
LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmKQo+ID4gIAl9Cj4gPiAgCWtmcmVlKGRtYWJ1Zi0+bmFt
ZSk7Cj4gPiAgCWRtYWJ1Zi0+bmFtZSA9IG5hbWU7Cj4gPiArCWtmcmVlKG5hbWUpOwo+ID4gIAo+
IAo+IEp1c3QgYnkgbG9va2luZyBhdCB0aGlzLCB5b3UgY2FuIGRlZHVjZSBzb21ldGhpbmcgaXMg
bm90IHJpZ2h0Lgo+IFlvdSBhcmUgYXNzaWduaW5nICJuYW1lIiB0byBkbWFidWYtPm5hbWUsIGJ1
dCB0aGVuIHJlbGVhc2luZyAibmFtZSIhCj4gCj4gU28gbm93LCBkbWFidWYtPm5hbWUgaGFzIGZy
ZWUgbWVtb3J5LCB3aGljaCB3aWxsIGxlYWQgdG8KPiB1c2VyLWFmdGVyLWZyZWUgaXNzdWVzLgo+
IAo+IE5vdGUgYWxzbywgdGhhdCB0aGlzIGZ1bmN0aW9uIGRvZXNuJ3QgbG9vayBsZWFreSBzaW5j
ZSB0aGUgcHJldmlvdXMKPiAibmFtZSIgaXMgZnJlZWQsIGJlZm9yZSBzZXR0aW5nIGEgbmV3IG9u
ZS4KPiAKPiBNYXliZSB0aGUgc3l6Ym90IHJlcG9ydCBpcyBzb21lIGtpbmQgb2YgZmFsc2UgcG9z
aXRpdmU/Cj4gCj4gQWxzbywgSSBfc3Ryb25nbHlfIHN1Z2dlc3QgdGhhdCBpbiB0aGUgZnV0dXJl
IHlvdSBkb24ndCBjb21waWxlLXRlc3QKPiBvbmx5IHRoZXNlIGtpbmQgb2Ygbm90IHRyaXZpYWwg
Zml4ZXMuIFNpbmNlIHlvdSBhcmUgdG91Y2hpbmcgYSBjcnVjaWFsCj4gcGFydCBvZiB0aGUga2Vy
bmVsIGhlcmUsIHlvdSBzaG91bGQgcmVhbGx5IGJlIHRlc3RpbmcgcHJvcGVybHkuCj4gCj4gU3Bl
Y2lhbGx5IHNpbmNlIHN5emJvdCBwcm9kdWNlcyBhIHJlcHJvZHVjZXIuCj4gCj4gQ29uc2lkZXIg
Y29tcGlsZSB0ZXN0IGFzIHNvbWV0aGluZyB5b3UgZG8gd2hlbiB5b3VyIGNoYW5nZXMgYXJlCj4g
b25seSBjb3NtZXRpYywgYW5kIHlvdSBhcmUgY29tcGxldGVseSBhbmQgYWJzb2x1dGVseSBzdXJl
IHRoaW5ncwo+IHdpbGwgYmUgT0suCj4gCj4gVGhhbmtzLgo+IEV6ZXF1aWVsCgpIaSBFemVxdWll
bCwKClRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGlzLgoKSSBtYWRl
IGEgbWlzdGFrZSBoZXJlIGFuZCB0aGFuayB5b3UgZm9yIG5vdGlmeWluZyBtZSBvZiBpdC4KClRo
YW5rIHlvdSBmb3IgeW91ciBjb21tZW50cywgSSBsbCBrZWVwIHRoZW0gaW4gbWluZCBiZWZvcmUg
c2VuZGluZwpwYXRjaGVzIHRvIHRoZSBrZXJuZWwgOikKClRoYW5rIHlvdQpCaGFyYXRoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
