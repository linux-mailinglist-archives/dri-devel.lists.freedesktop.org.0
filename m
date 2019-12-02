Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F710E716
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37889AE6;
	Mon,  2 Dec 2019 08:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0DB89BAC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 08:52:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j42so17252595wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 00:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z0MLJ1lDR7bVZ0PIp3pKq+TiqzPMdPZDCt8wWgy9uT8=;
 b=sswG1GDBydJvJLi8fnDJB8Fav8OzWi6fY71q15x1xR3zBnXBMSLBmHr7Vqxqgd7zvg
 0mKJ0ASUHUu+EnW9hqSNLAPmlNLFoLnsCEcPr8YWenmcrz2LhBXN9RzN9cNV1hZldXTS
 xzK/tEer4bmZegshd4djaOvfVaxVRbjMZvP7ztzcs9Ayiusn2AwIXWHN+qUnd4yuekkK
 3ApIr/hcUxxNh0lTHO6+buwP2DIUO0xbZjFdxB0dIa97wGVjMTwCsNqPMkUZ+oxE/N/t
 M0PKaJl3lEhiaTLNq6RThUgZ0wN1sCcp0EZrjb7d0dgXk7RBvJBHvrg3go5afAAvX75i
 X9AA==
X-Gm-Message-State: APjAAAViXFI7r/jW0vhUUzVgvNYefVTKHUDoTUtM2Gt/UPlKM6fjJikh
 M8aNFxS15j+1NY4Bw7K5+wox4Q==
X-Google-Smtp-Source: APXvYqy8s8egn9cXDKjzeBprcWvs9qgPaH/3c9HZFV/Yh0QMw5AxH89PISxxXh51P4XHoT8FaD1Luw==
X-Received: by 2002:adf:9dc1:: with SMTP id q1mr2174480wre.20.1575276766331;
 Mon, 02 Dec 2019 00:52:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 76sm23458234wma.0.2019.12.02.00.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 00:52:45 -0800 (PST)
Date: Mon, 2 Dec 2019 09:52:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 6/8] drm/panfrost: Make sure imported/exported BOs are
 never purged
Message-ID: <20191202085243.GX624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-7-boris.brezillon@collabora.com>
 <20191129201213.GR624164@phenom.ffwll.local>
 <20191129220924.7982a350@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129220924.7982a350@collabora.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z0MLJ1lDR7bVZ0PIp3pKq+TiqzPMdPZDCt8wWgy9uT8=;
 b=FKE2gGEZt1xdOh4pITvuoVWQNIfRgyoGSQQ0c++2SbwTCEUxzjzA+BF9RMPL3A2d67
 1aso1neLVHten21dhwrr4Bg2sx1Fq1SwnxPS2ZvMgNH0r8045oUo20RjH4DljNxFdW3j
 8iLN3jNylTt8pyhUed8X/GtGRbMsQBYv4Rrkc=
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MDk6MjRQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIEZyaSwgMjkgTm92IDIwMTkgMjE6MTI6MTMgKzAxMDAKPiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gT24gRnJpLCBOb3YgMjksIDIwMTkg
YXQgMDI6NTk6MDZQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+ID4gPiBXZSBkb24n
dCB3YW50IGltcG9ydGVkL2V4cG9ydGVkIEJPcyB0byBiZSBwdXJnZXMsIGFzIHRob3NlIGFyZSBz
aGFyZWQKPiA+ID4gd2l0aCBvdGhlciBwcm9jZXNzZXMgdGhhdCBtaWdodCBzdGlsbCB1c2UgdGhl
bS4gV2Ugc2hvdWxkIGFsc28gcmVmdXNlCj4gPiA+IHRvIGV4cG9ydCBhIEJPIGlmIGl0J3MgYmVl
biBtYXJrZWQgcHVyZ2VhYmxlIG9yIGhhcyBhbHJlYWR5IGJlZW4gcHVyZ2VkLgo+ID4gPiAKPiA+
ID4gRml4ZXM6IDAxM2I2NTEwMTMxNSAoImRybS9wYW5mcm9zdDogQWRkIG1hZHZpc2UgYW5kIHNo
cmlua2VyIHN1cHBvcnQiKQo+ID4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2Rydi5jIHwgMTkgKysrKysrKysrKysrKysrKy0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9nZW0uYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ID4gPiBpbmRleCAx
YzY3YWM0MzRlMTAuLjc1MWRmOTc1NTM0ZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ID4gPiBAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyBp
bnQgcGFuZnJvc3RfaW9jdGxfbWFkdmlzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ID4gPiAgCXN0cnVjdCBkcm1fcGFuZnJvc3RfbWFkdmlzZSAqYXJncyA9IGRhdGE7Cj4g
PiA+ICAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkZXYtPmRldl9wcml2YXRlOwo+
ID4gPiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iajsKPiA+ID4gKwlpbnQgcmV0Owo+
ID4gPiAgCj4gPiA+ICAJZ2VtX29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlX3ByaXYs
IGFyZ3MtPmhhbmRsZSk7Cj4gPiA+ICAJaWYgKCFnZW1fb2JqKSB7Cj4gPiA+IEBAIC0zNTAsNiAr
MzUxLDE5IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfbWFkdmlzZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ID4gPiAgCQlyZXR1cm4gLUVOT0VOVDsKPiA+ID4gIAl9
Cj4gPiA+ICAKPiA+ID4gKwkvKgo+ID4gPiArCSAqIFdlIGRvbid0IHdhbnQgdG8gbWFyayBleHBv
cnRlZC9pbXBvcnRlZCBCT3MgYXMgcHVyZ2VhYmxlOiB3ZSdyZSBub3QKPiA+ID4gKwkgKiB0aGUg
b25seSBvd25lciBpbiB0aGF0IGNhc2UuCj4gPiA+ICsJICovCj4gPiA+ICsJbXV0ZXhfbG9jaygm
ZGV2LT5vYmplY3RfbmFtZV9sb2NrKTsgIAo+ID4gCj4gPiBLaW5kYSBub3QgYXdlc29tZSB0aGF0
IHlvdSBoYXZlIHRvIHRha2UgdGhpcyBjb3JlIGxvY2sgaGVyZSBhbmQgZW5jdW1iZXIKPiA+IGNv
cmUgZHJtIGxvY2tpbmcgd2l0aCByYW5kb20gZHJpdmVyIHN0dWZmLgo+IAo+IExvb2tzIGxpa2Ug
ZHJtX2dlbV9zaG1lbV9pc19wdXJnZWFibGUoKSBhbHJlYWR5IGRvZXMgdGhlICFpbXBvcnRlZCAm
Jgo+ICFleHBvcnRlZCBjaGVjay4gRm9yIHRoZSBpbXBvcnRlZCBjYXNlLCBJIHRoaW5rIHdlJ3Jl
IGdvb2QsIHNpbmNlCj4gdXNlcnNwYWNlIGNhbid0IGNoYW5nZSB0aGUgbWFkdiB2YWx1ZSBiZWZv
cmUgLT5pbXBvcnRfYXR0YWNoIGhhcyBiZWVuCj4gc2V0LiBGb3IgdGhlIGV4cG9ydGVyIGNhc2Us
IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZXJlJ3Mgbm8gcmFjZQo+IGJldHdlZW4gdGhlIGV4cG9y
dCBhbmQgbWFkdmlzZSBvcGVyYXRpb25zLCB3aGljaCBJIGNhbiBwcm9iYWJseSBkbyBmcm9tCj4g
dGhlIGdlbS0+ZXhwb3J0KCkgaG9vayBieSB0YWtpbmcgdGhlIHNocmlua2VyIG9yIGJvLT5tYXBw
aW5ncyBsb2NrLgo+IAo+ID4gCj4gPiBDYW4ndCB0aGlzIGJlIHNvbHZlZCB3aXRoIHlvdXIgb3du
IGxvY2tpbmcgb25seSBhbmQgc29tZSByZWFzb25hYmxlCj4gPiBvcmRlcmluZyBvZiBjaGVja3M/
IGJpZyBsb2NrcyBiZWNhdXNlIGl0J3MgZWFzeSBpcyBlbmRsZXNzIGxvbmctdGVybSBwYWluLgo+
ID4gCj4gPiBBbHNvIGV4cG9ydGluZyBwdXJnZWFibGUgb2JqZWN0cyBpcyBraW5kYSBhIHVzZXJz
cGFjZSBidWcsIGFsbCB5b3UgaGF2ZSB0bwo+ID4gZG8gaXMgbm90IG9vcHMgaW4gZG1hX2J1Zl9h
dHRhY2htZW50X21hcC4gTm8gbmVlZCB0byBwcmV2ZW50IHRoZSBkYW1hZ2UKPiA+IGhlcmUgaW1v
Lgo+IAo+IEkgZmVlbCBsaWtlIG1ha2luZyBzdXJlIGFuIGV4cG9ydGVkIEJPIGNhbid0IGJlIHB1
cmdlZCBvciBhIHB1cmdlZCBCTwo+IGNhbid0IGJlIGV4cG9ydGVkIHdvdWxkIGJlIG11Y2ggc2lt
cGxlciB0aGFuIG1ha2luZyBzdXJlIGFsbCBpbXBvcnRlcnMKPiBhcmUgcmVhZHkgdG8gaGF2ZSB0
aGUgc2d0IGZyZWVkLgoKSWYgeW91IGZyZWUgdGhlIHNndCB3aGlsZSBzb21lb25lIGlzIHVzaW5n
IGl0LCB0aGF0J3Mga2luZGEgYSBkaWZmZXJlbnQKYnVnIEkgdGhpbmsuIFlvdSBhbHJlYWR5IGhh
dmUgYSBwYWdlcyByZWZjb3VudCwgdGhhdCBzaG91bGQgYmUgZW5vdWdoIHRvCnByZXZlbnQgdGhp
cz8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
