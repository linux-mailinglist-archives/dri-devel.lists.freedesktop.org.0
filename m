Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD836276560
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3426EA36;
	Thu, 24 Sep 2020 00:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C036EA36
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:46:38 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id i26so2037253ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1jgyt/1iwbb3q0lDXIA/Aid2Mb+XF3yAthvVcx7Xxfg=;
 b=D+FPW9eeXCMXenmGUvXLjHZBaEU7AnY4E1b8PIUSZOICjeOJdp4RAPkU1MMHouwefQ
 88AKlTyV30SnrfrXwMzmSinPUOQ2PwoWxADqna42UJupBiyNPUOaLKHx2FYembgr3mXg
 05H0NgO8EUamMt+B66tZuT61g3p7U49xyiEZL3CGy2e3ujctkfpTCM4je5sQx42GaPXs
 BzRSRiD9q38BukoDK/qVEVKcr07cpOJF5GqnyKuJo8XMWutVUXTU3V1OhKIgkQABpoTq
 7H3hAyx20exe0LLTXnlAbRKV3rHEnTN3vCIzVwIfyx7Y6nu0WZK53C6ZPqaNP+KvhSfh
 nlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1jgyt/1iwbb3q0lDXIA/Aid2Mb+XF3yAthvVcx7Xxfg=;
 b=lI9PzCM/+nUjnkd0MTUfW05kL9XweJ//ryLv3ldVjcbLuYaCw600/aciloi18I1wKe
 /cTa4SqCqreA/3yg+lv5UJyqs0AIEGBcwzsIiXZALT8PmjvMKyTyo6lCcQcYYf9uwhx0
 Q33qIHzYW4vhaf16brxOBX9Amv1rTTvRvWqf2Di9zpc3yRscQyiZbeUWs6AK7kecAQf0
 M1MqkuDBs2JZXedVJmVg2v3v0BFABoUSJqA1tu7HjRebbumrwOY+eOfdL3jjpbC4AIup
 WcLSmm0RtWruPnm05Zo4f+EO3iYLo/JRd/Pv6EqXuEs+loPbCy80ALG/1TmyZzyzgf1b
 0NcQ==
X-Gm-Message-State: AOAM533/+D3VAm2Bx+k5VeuXObWho1HulJz7gX0vRh8339oFbEVQwtLV
 rx2ZNyxzoX3JTcaz6al7dZh6OrkuamDTSwX3ops=
X-Google-Smtp-Source: ABdhPJx+JHKfVyIttdolDfBGTEpVyqyqr9jDRcAs7GHsYfPfX2K4rDdOrw1156EHJpYIM0MCR0KSg90LshY7bS2yPq0=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr2139825ejd.419.1600908397326; 
 Wed, 23 Sep 2020 17:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-8-airlied@gmail.com>
 <51eae609-0ea5-d204-f34b-ea5d67989760@amd.com>
In-Reply-To: <51eae609-0ea5-d204-f34b-ea5d67989760@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Sep 2020 10:46:25 +1000
Message-ID: <CAPM=9tyC7fjfGhY8Hz1UzSdjvigJou39nZ-cd9omqiMZJHi-3w@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/amdgpu/ttm: handle tt moves properly.
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCBhdCAwMDo0NiwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDIzLjA5LjIwIHVtIDA1OjA0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoZSBjb3JlIG1vdmUgY29kZSBjdXJyZW50bHkgaGFuZGxlcyB1c2VfdHQgbW92ZXMs
IGZvciBhbWRncHUKPiA+IHRoaXMgd2FzIGJlaW5nIGhhbmRsZWQgYWxzbyBpbiB0aGUgZHJpdmVy
LCBidXQgbm90IHVzaW5nIHRoZSBzYW1lCj4gPiBwYXRocy4KPiA+Cj4gPiBJZiBtb3ZpbmcgYmV0
d2VlbiBUVC9TWVNURU0gKGFsbCB0aGUgdXNlX3R0IHBhdGhzIG9uIGFtZGdwdSkgdXNlCj4gPiB0
aGUgY29yZSBtb3ZlIGZ1bmN0aW9uLgo+ID4KPiA+IEV2ZW50dWFsbHkgdGhlIGNvcmUgd2lsbCBi
ZSBmbGlwcGVkIG92ZXIgdG8gY2FsbGluZyB0aGUgZHJpdmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTIgKysrKysrKy0tLS0tCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gaW5kZXggZGI1Zjc2MWYz
N2VjLi5kM2JkMmZkNDQ4YmUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+ID4gQEAgLTY3MSwxNCArNjcxLDE2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Jv
X21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKPiA+ICAgICAg
ICAgICAgICAgdHRtX2JvX21vdmVfbnVsbChibywgbmV3X21lbSk7Cj4gPiAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4gICAgICAgfQo+ID4gLSAgICAgaWYgKChvbGRfbWVtLT5tZW1fdHlwZSA9
PSBUVE1fUExfVFQgJiYKPiA+IC0gICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BM
X1NZU1RFTSkgfHwKPiA+IC0gICAgICAgICAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZ
U1RFTSAmJgo+ID4gLSAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpKSB7
Cj4gPiAtICAgICAgICAgICAgIC8qIGJpbmQgaXMgZW5vdWdoICovCj4gPiArICAgICBpZiAob2xk
X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+ID4gKyAgICAgICAgIG5ld19tZW0t
Pm1lbV90eXBlID09IFRUTV9QTF9UVCkgewo+ID4gICAgICAgICAgICAgICB0dG1fYm9fbW92ZV9u
dWxsKGJvLCBuZXdfbWVtKTsKPgo+IEkgd291bGQgZmVlbCBiZXR0ZXIgaWYgd2UgbnVrZSB0dG1f
Ym9fbW92ZV9udWxsKCkgYW5kIGFsd2F5cyB1c2UKPiB0dG1fYm9fbW92ZV90dG0oKS4KCkFueSBy
ZWFzb24/IFRoZSBjb2RlIHBhdGggaW4gdGhlIGN1cnJlbnQgbW92ZSBjb2RlIHByZXR0eSBtdWNo
CmlzIHRoaXMuCgpUaGUgY3VycmVudCBtb3ZlIHBhdGhzIGFyZQoKaWYgKG5ld190dCAmJiBvbGRf
dHQpCiAgaWYgb2xkIGlzIHN5c3RlbQogICAgIG1vdmUgbnVsbAogIGVsc2UKICAgIG1vdmUgdHRt
CmVsc2UKICBjYWxsIGRyaXZlciBtb3ZlLgoKU28gSSB3YW50ZWQgdG8gbWFpbnRhaW4gdGhhdCBv
cmRlci4gY2FsbGluZyB0aGUgbW92ZSB0dG0gd2lsbCBqdXN0Cm1ha2UgYSBwb2ludGxlc3MgY2Fj
aGluZywgcG9wdWxhdGUsIGJpbmQgc3RlcC4KCkJ1dCBJJ20gZ29pbmcgdG8gdGhpbmsgYWJvdXQg
aXQgYSBiaXQgbW9yZS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
