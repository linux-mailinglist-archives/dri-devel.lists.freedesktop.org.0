Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7CF4CE4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 14:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FCA6F987;
	Fri,  8 Nov 2019 13:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731206F987
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 13:14:14 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id r4so1458433vkf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 05:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMz0RmuFJEjc4flS+S0m6QXgOmb1aXAEvyojIgunTAA=;
 b=X7E/mTZRv4D5aRiGNUIM00RdCGH2je7bci7kCLFW+y9M3OP8Ldo5xtvfwHXr4LqEnK
 DX0ciGgKIBHGlTtYqalwYgplGlYgC4uL+n5p3P8+fzQIi87vIObg8zz5t11ao0rNB7bk
 kt5kERJnpUgzmH3G+js5cotKAA3KtkGg7mS/Nsl/WqwMg9lslZXWHF6WoIc7O02pmyRy
 15XDCHs1QQ4W1kv9R64Iue9SU6S4jdVwIGcjcmTa5wkObo3fg1Ln5maF3xRgWvnuiWS3
 w59JkHw8ggHAL47tMyJZ4tnvdrRJCVdj7PBZ2dV9E0ZfzyQJiGyUTp8ei38wZPhlR9eo
 nuXQ==
X-Gm-Message-State: APjAAAXB4dX9iWHzBcm23HcvBSzNc3uF99xJX79HV2Mn3P0xNadAP79Y
 XmcCBqtYXZxbDo61VOkFp5eLlXCQe18ViRw0zegJxw==
X-Google-Smtp-Source: APXvYqyQTW9bLkJlFsc286jmokZuamIkAeS+7w6Eev6h9t4NegukQjFxf7TUGzZ1T9I6MbD1z8kQuMQK6X9dAkt+Wws=
X-Received: by 2002:a1f:a1ce:: with SMTP id k197mr1753374vke.28.1573218853331; 
 Fri, 08 Nov 2019 05:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
In-Reply-To: <20191101130313.8862-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 Nov 2019 13:13:55 +0000
Message-ID: <CACvgo53BpkBLVic3v7UbcLS94PKyd8a+9cSd+4ttdRJD8+i99A@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NMz0RmuFJEjc4flS+S0m6QXgOmb1aXAEvyojIgunTAA=;
 b=eN5jOy/Bvax9ooJftpqI+7SwcJWzK/7ooWQjpi5x1m/NJ2Tz1kRimaGFVJFshgo40b
 8i+KKh2lYCSQ7PGjJx81yUdr9MdDUIFgEgKP1TsA3xEFSgpCO0HcwBMhvcIPGugeBmhj
 /+Cq0EhPZGmWfmdBzVFseYVk/M7EXUA5f16quwtxXK3HQ/xV2dNvuybReWrbAXK7IMI5
 Ltrx0piuSYbq9CdwM8PYLakqhjxp3S4/adp6eL+O4mqddCwt07Rr/TqhiSZ7moWMve24
 ZDupuy26ixKy8zzfnOYZS9klTxBysz4gLrceaESds88IviTjizrc/874USC9DEhPch9/
 W0Ag==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxIE5vdiAyMDE5IGF0IDEzOjA1LCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgo+Cj4gTW92ZSB0aGUgcmVuZGVyX2NsaWVudCBodW5rIGZvciByZXF1aXJl
X2V4aXN0IGFsb25nc2lkZSB0aGUgcmVzdC4KPiBLZWVwaW5nIGFsbCB0aGUgcmVhc29ucyB3aHkg
YW4gZXhpc3Rpbmcgb2JqZWN0IGlzIG5lZWRlZCwgaW4gYSBzaW5nbGUKPiBwbGFjZSBtYWtlcyBp
dCBlYXNpZXIgdG8gZm9sbG93Lgo+Cj4gQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhp
Y3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0
cm9tQHZtd2FyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
c3VyZmFjZS5jIHwgOSArKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9zdXJmYWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNl
LmMKPiBpbmRleCAyOWQ4Nzk0ZjA0MjEuLjFmOTg5ZjM2MDVjOCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKPiBAQCAtOTA5LDE2ICs5MDksMTIgQEAgdm13X3N1
cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LAo+ICAg
ICAgICAgdWludDMyX3QgaGFuZGxlOwo+ICAgICAgICAgc3RydWN0IHR0bV9iYXNlX29iamVjdCAq
YmFzZTsKPiAgICAgICAgIGludCByZXQ7Cj4gLSAgICAgICBib29sIHJlcXVpcmVfZXhpc3QgPSBm
YWxzZTsKPgo+ICAgICAgICAgaWYgKGhhbmRsZV90eXBlID09IERSTV9WTVdfSEFORExFX1BSSU1F
KSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IHR0bV9wcmltZV9mZF90b19oYW5kbGUodGZpbGUs
IHVfaGFuZGxlLCAmaGFuZGxlKTsKPiAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgfSBl
bHNlIHsKPiAtICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGRybV9pc19yZW5kZXJfY2xpZW50
KGZpbGVfcHJpdikpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJlcXVpcmVfZXhpc3QgPSB0
cnVlOwo+IC0KPiAgICAgICAgICAgICAgICAgaGFuZGxlID0gdV9oYW5kbGU7Cj4gICAgICAgICB9
Cj4KPiBAQCAtOTM1LDYgKzkzMSw4IEBAIHZtd19zdXJmYWNlX2hhbmRsZV9yZWZlcmVuY2Uoc3Ry
dWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKGhh
bmRsZV90eXBlICE9IERSTV9WTVdfSEFORExFX1BSSU1FKSB7Cj4gKyAgICAgICAgICAgICAgIGJv
b2wgcmVxdWlyZV9leGlzdCA9IGZhbHNlOwo+ICsKPiAgICAgICAgICAgICAgICAgdXNlcl9zcmYg
PSBjb250YWluZXJfb2YoYmFzZSwgc3RydWN0IHZtd191c2VyX3N1cmZhY2UsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW1lLmJhc2UpOwo+Cj4gQEAgLTk0Niw2
ICs5NDQsOSBAQCB2bXdfc3VyZmFjZV9oYW5kbGVfcmVmZXJlbmNlKHN0cnVjdCB2bXdfcHJpdmF0
ZSAqZGV2X3ByaXYsCj4gICAgICAgICAgICAgICAgICAgICB1c2VyX3NyZi0+bWFzdGVyICE9IGZp
bGVfcHJpdi0+bWFzdGVyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVpcmVfZXhpc3Qg
PSB0cnVlOwo+Cj4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShkcm1faXNfcmVuZGVyX2Ns
aWVudChmaWxlX3ByaXYpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXF1aXJlX2V4aXN0
ID0gdHJ1ZTsKPiArCj4gICAgICAgICAgICAgICAgIHJldCA9IHR0bV9yZWZfb2JqZWN0X2FkZCh0
ZmlsZSwgYmFzZSwgVFRNX1JFRl9VU0FHRSwgTlVMTCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlcXVpcmVfZXhpc3QpOwo+ICAgICAgICAgICAgICAgICBpZiAo
dW5saWtlbHkocmV0ICE9IDApKSB7Cj4gLS0KVGhvbWFzLCBWTXdhcmUgZGV2cywgaHVtYmxlIHBv
a2U/CkFueSBjb21tZW50cyBhbmQgcmV2aWV3IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgoKVGhhbmtz
CkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
