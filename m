Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C3FB300
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 15:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3774B890FF;
	Wed, 13 Nov 2019 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48C4890FF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 14:58:23 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id c25so1539415vsp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 06:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0gOVwnr8RZ3Od+Q+Wt9xsj7qG4zJHYItky1OrLz/7Q=;
 b=cxetxegQ26oj7o3SIo82AuWCby7DdbSCpJ0ZVMTXgbyM4e23alOSedr1aiAD0KJs5n
 RfYJcRmKfACBMiSntkeHkJ0pN8ODUnNmP/TrZAZ850EqlI4CG+Vqv0bhl8j/DyyIz7JM
 wmyjKV7YbKCBnmZwI3Zhp+gL3UaOBc8Ggs8EvBArTnQNx/lAcNtIKjRvQoEIQG2kRLE0
 W6V4PzsK+WyMr6MfghozvyGIg2rS0bybFpMxLZDKdFtzBoInGzxJZdDrZiLngDT91CC6
 tAst2J9DjCjopVuNK0GRrFUc7TUkgnzq9u46v1b9HDJBIkUw6g0YUJzSzMBIBGDKtJrq
 EuyQ==
X-Gm-Message-State: APjAAAUS5tyocl4dssBqERZIFDnN6XrTGxGW2xc9VOnApZBEObPwAnLa
 JF0AbZKGB86SuN4sdrRPrQz8eZ6gxK7F6isdVLQ=
X-Google-Smtp-Source: APXvYqxOKdMQmyVzBi5/m0j44R6MDEw4mJPbYG+meE9Q68qt41BmgvfQGKrtpZllT36/0ae1bMdzT/KICvdwYOGzTAE=
X-Received: by 2002:a05:6102:20d1:: with SMTP id
 i17mr2197246vsr.186.1573657102968; 
 Wed, 13 Nov 2019 06:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-2-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-2-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 14:57:55 +0000
Message-ID: <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm: bridge: dw_mipi_dsi: access registers via a
 regmap
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P0gOVwnr8RZ3Od+Q+Wt9xsj7qG4zJHYItky1OrLz/7Q=;
 b=DntvAiimaxy5eO8WmD5HKsaq8paiLEDN0gZRqng+Xx9VyAUgIR4AjdrfvQMMtiSy+c
 kzIT1vF4PL6dW0q4lybAHUTIe/fZzxIfPJN9RiZYhS7TtFC33OI9cLMC+p8J1NFNgr+S
 WZjtZx1j7LqChx64foynsNatq1nK0axjAIv7cDN2Qi3ahX7gnhLFxIaefxu8Zl2L1/Bu
 cm/hKxxW2E7gV0/llr8hOWDu2HTnj3y3VD+Z0wLlyeGdgupdyArE1NA7g2xNoI7Z1i25
 aKclClidbXBgBWKKlVODU4ZNnkr4+R2uaHhlOkkhZqSP8r1MhySo2WiOit311x1n+NJV
 r9KA==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDE2OjMwLCBBZHJpYW4gUmF0aXUgPGFkcmlhbi5yYXRpdUBj
b2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IENvbnZlcnQgdGhlIGNvbW1vbiBicmlkZ2UgY29kZSBh
bmQgdGhlIHR3byByb2NrY2hpcCAmIHN0bSBkcml2ZXJzCj4gd2hpY2ggY3VycmVudGx5IHVzZSBp
dCB0byB0aGUgcmVnbWFwIEFQSSBpbiBhbnRpY2lwYXRpb24gZm9yIGZ1cnRoZXIKPiBjaGFuZ2Vz
IHRvIG1ha2UgaXQgbW9yZSBnZW5lcmljIGFuZCBhZGQgb2xkZXIgRFNJIGhvc3QgY29udHJvbGxl
cgo+IHN1cHBvcnQgYXMgZm91bmQgb24gaS5teDYgYmFzZWQgZGV2aWNlcy4KPgo+IFRoZSByZWdt
YXAgYmVjb21lcyBhbiBpbnRlcm5hbCBzdGF0ZSBvZiB0aGUgYnJpZGdlLiBObyBmdW5jdGlvbmFs
Cj4gY2hhbmdlcyBvdGhlciB0aGFuIHJlcXVpcmluZyB0aGUgcGxhdGZvcm0gZHJpdmVycyB0byB1
c2UgdGhlCj4gcHJlLWNvbmZpZ3VyZWQgcmVnbWFwIHN1cHBsaWVkIGJ5IHRoZSBicmlkZ2UgYWZ0
ZXIgaXRzIHByb2JlKCkgY2FsbAo+IGluc3RlYWQgb2YgaW9yZW1wJ2luZyB0aGUgcmVnaXN0ZXJz
IHRoZW1zZWx2ZXMuCj4KPiBJbiBzdWJzZXF1ZW50IGNvbW1pdHMgdGhlIGJyaWRnZSB3aWxsIGJl
Y29tZSBhYmxlIHRvIGRldGVjdCB0aGUKPiBEU0kgaG9zdCBjb3JlIHZlcnNpb24gYW5kIGluaXQg
dGhlIHJlZ21hcCB3aXRoIGRpZmZlcmVudCByZWdpc3Rlcgo+IGxheW91dHMuIFRoZSBwbGF0Zm9y
bSBkcml2ZXJzIHdpbGwgY29udGludWUgdG8gdXNlIHRoZSByZWdtYXAgd2l0aG91dAo+IG1vZGlm
aWNhdGlvbnMgb3Igd29ycnlpbmcgYWJvdXQgdGhlIHNwZWNpZmljIGxheW91dCBpbiB1c2UgKGlu
IG90aGVyCj4gd29yZHMgdGhlIGxheW91dCBpcyBhYnN0cmFjdGVkIGF3YXkgdmlhIHRoZSByZWdt
YXApLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZA
Z21haWwuY29tPgoKSSBzaG91bGQgaGF2ZSBiZWVuIGNsZWFyZXIgZWFybGllciAtIEkgZGlkbid0
IHF1aXRlIHJldmlldyB0aGUgcGF0Y2guCklzIGlzIG5vdyB0aG91Z2guClJldmlld2VkLWJ5OiBF
bWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKQWRtaXR0ZWRseSBhIGNv
dXBsZSBvZiBuaXRwaWNrcyAoRFJJVkVSX05BTUUsIHplcm8gaW5pdGlhbGl6ZSBvZiB2YWwpCmNv
dWxkIGhhdmUgYmVlbiBsZWZ0IG91dC4KSXQncyBub3QgYSBiaWcgZGVhbCwgdGhlcmUncyBubyBu
ZWVkIHRvIHBvbGlzaCB0aG9zZS4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
