Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77864294777
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 06:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0F6E876;
	Wed, 21 Oct 2020 04:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975776E876
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 04:42:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u8so1085865ejg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 21:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Z/fIoG6/Qr3dQp4T1ptm4H6EfmSI9ctvnx4muJcK4E=;
 b=gdF86n5SVYK1z9BSar8QgFSgNsdP2vPzqfcottRV9EV/bQCT8ytYjIcSl2nDdZXEO0
 kz5z8EPS9IFe6BnVODPEA8Wx7taqgYlgvHobqMpQPUIUjrwbjFmgSPrFg0L4izVpwMLg
 kaTEruK4xhFo64Yapcjvqf0Rj1IwIx5NWQNPUPvU9NW+OCI2bDCWiUhc57reaJkg5YEA
 e0Byglxgpicsn9o5wqJ4TX2iRb+gosNKYb8OI1e1fTYAXIKkaBsGmAq7L7i8zTWc/GNH
 ozxOgF2lERWAZhvI+EJG5fzw/juBEuvYGMS0yL3YN6aLoe0tYbPa8cA0aaE6AbyXc+aN
 JKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Z/fIoG6/Qr3dQp4T1ptm4H6EfmSI9ctvnx4muJcK4E=;
 b=fqz9CVt9J7BSwesNfwdBOzBqocGLdzrKS9x5754yuKHe3Nix1SCtrf2tzcuxakUNNE
 xj/nrrU/jKogQ/AcRZvv+caQ+DTiFRUt0dKzubX3DPi5jJvHTNz2tZI8QF4TzgBD3Ne6
 NRKWVZlpbJL2bWaFLwZDetpNY3W+JXAP9gCAzlLIQ/6xNGeMdsnSB/rIOBt7MsEaQ1L8
 MiQV0a/XCy8p1T0ZXgUIhhL5S7iDWIClEvFIjoWq/OXwFIC1Rut/W8kPclNN/k9Mo1Zk
 1HIaqHEhDBoLXXesh8G+SGmd+q2KWkNPvK1RudB1TS1K4/A/V9+i9mQAMaRVOmQHIeHo
 1UJw==
X-Gm-Message-State: AOAM531YaWCqZD0X5qOLnbA0X2+ub6NSU8zNMZ+FS5WaRfZ+RfEP+C+2
 HeUNO7zjI9E8URD43O1lqCMqny0Pu2KO64Ye5O8=
X-Google-Smtp-Source: ABdhPJyXzjkPsyaxNuLi4tJrwwciY1U97pvZhiFd/HM5LNrWHMaJGBKYjlQoioHFqyYk130V7E+xdPT+bbGmBpTcP0U=
X-Received: by 2002:a17:906:3bc9:: with SMTP id
 v9mr1500075ejf.340.1603255332821; 
 Tue, 20 Oct 2020 21:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201020041606.1701145-1-airlied@gmail.com>
 <20201020041606.1701145-2-airlied@gmail.com>
 <4d47f905-5380-0208-672b-531ba91fed64@amd.com>
In-Reply-To: <4d47f905-5380-0208-672b-531ba91fed64@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 Oct 2020 14:42:01 +1000
Message-ID: <CAPM=9tz_cR8BO+3wYXu4gN2Fw4JfKuGvQR1BCsSBQt1L9ZED6A@mail.gmail.com>
Subject: Re: [PATCH] [RFC/HACK] drm/ttm: avoid multihop moves in drivers.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBPY3QgMjAyMCBhdCAxODozMSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFllcywgcGxlYXNlISBUaGF0IGFwcHJvYWNoIGxv
b2tzIGV2ZW4gYmV0dGVyIHRoYW4gd2hhdCBJIGhhZCBpbiBtaW5kLgo+Cj4gQSBmZXcgY29tbWVu
dHMgYmVsb3c6Cj4KPiBBbSAyMC4xMC4yMCB1bSAwNjoxNiBzY2hyaWViIERhdmUgQWlybGllOgo+
ID4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+Cj4gPiBbU05JUF0K
PiA+ICsgICAgIC8qIGRvbid0IGdvIGZyb20gc3lzdGVtLT52cmFtIGluIG9uZSBob3AsCj4gPiAr
ICAgICAgICByZXBvcnQgdGhpcyBiYWNrIHRvIHRoZSBjYWxsZXIgdGVsbCBpdAo+ID4gKyAgICAg
ICAgd2hlcmUgdG8gYm91bmNlIHRoaXMgYnVmZmVyIHRocm91Z2guICovCj4gPiArCj4gPiArICAg
ICBpZiAoKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYKPiA+ICsgICAgICAg
ICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0pIHx8Cj4gPiArICAgICAgICAgKG9s
ZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9WUkFNICYmCj4gPiArICAgICAgICAgIG5ld19tZW0t
Pm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pKSB7Cj4gPiArICAgICAgICAgICAgIG5ld19tZW0t
Pm1lbV90eXBlID0gVFRNX1BMX1RUOwo+Cj4gTm90IHN1cmUgaWYgdGhhdCBpcyBzdWNoIGEgZ29v
ZCBpZGVhLCBuZXdfbWVtIGNhbiBiZSBzb21lIGFsbG9jYXRlZAo+IG1lbW9yeSBpbiB0aGUgVlJB
TSBkb21haW4gYXQgdGhpcyBtb21lbnQuCj4KPiBNYXliZSBpbnN0ZWFkIGdpdmUgdGhlIGNhbGxi
YWNrIGEgc2VwYXJhdGUgYm91bmNlIGFyZ3VtZW50IGluc3RlYWQuCgpJJ3ZlIGNoYW5nZWQgdGhp
cyBpbiB0aGUgbGF0ZXN0IHBvc3RpbmcgdG8gdGFrZSBhIHR0bV9wbGFjZSB0aGF0IHRoZQpkcml2
ZXIgZmlsbHMgb3V0CmlmIGl0IG5lZWRzIGEgaG9wLgoKPiA+ICsgICAgIC8qIGZpbmQgc3BhY2Ug
aW4gdGhlIGJvdW5jZSBkb21haW4gKi8KPiA+ICsgICAgIHJldCA9IHR0bV9ib19tZW1fc3BhY2Uo
Ym8sICZib3VuY2VfcGxhY2VtZW50LCBtZW0sIGN0eCk7Cj4gPiArICAgICBpZiAocmV0KQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgLyogbW92ZSB0byB0aGUgYm91bmNl
IGRvbWFpbiAqLwo+ID4gKyAgICAgcmV0ID0gdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShibywgbWVt
LCBmYWxzZSwgY3R4KTsKPgo+IElzIHRoaXMgYSByZWN1cnNpb24/IEkgZG9uJ3QgdGhpbmsgaXQg
aXMsIGJ1dCBJIHRob3VnaHQgSSBiZXR0ZXIgZG91YmxlCj4gY2hlY2suCgpObyBpdCBzaG91bGQg
bmV2ZXIgcmVjdXJzZSBiZWNhdXNlIHRoZSBkcml2ZXIgc2hvdWxkIG9ubHkgcmV0dXJuCi1FTVVM
VElIT1Agb25jZSwKZXZlbiBpZiBhIHRoZW9yZXRpY2FsIGRyaXZlciB3YXMgdG8gbmVlZCA+IDEg
aG9wcyBpdCBzaG91bGQgd29yayB1bnRpbAppdCByZXR1cm5zIHNvbWV0aGluZwpvdGhlciB0aGFu
IC1FTVVMVElIT1AuIE9mIGNvdXJzZSBhIGJyb2tlbiBkcml2ZXIgY291bGQgY2F1c2UgYmFkCnRo
aW5ncywgYnV0IHRoYXQgaXMKYWx3YXlzIHRydWUuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
