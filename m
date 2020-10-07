Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD6286F30
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1026EA33;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D186E029
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:39:13 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d20so3804364qka.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=muCEajJ6hDOPl6eL85j4HlmJ9WtV9zWU+bfCV/Cq9BI=;
 b=Dz0OOWtV09rElfhUKte1coDG1XmH70sU+t7XSvzch8QKv+JqccAMRzt3CfP44+/AfQ
 BSOmkO0/4DojdkfFvQXoQgyy0jQhFfYLuGtSpIEzw2ZgOz60sA9Vk6P6Joyx8mLM7oVI
 GulM3GKMb4JRE2TKQ53Eo7+b0LYA9pmvGiN/xhtwvUGDgP8zpeZiK3xp1njllpvHZ6s7
 +zEZsvi99NmVaNYy4acbivpnVkuHyfeEWt1WrvUqBOOC668uWgAj9EFU3nanuKQfFrvC
 NI/B5LDgDV7l6mq+xucfE4i5Vmh8E5S9NLZXdlnDCI7i7X4L/RR/AAH2/qqGFU9zUkKq
 IF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=muCEajJ6hDOPl6eL85j4HlmJ9WtV9zWU+bfCV/Cq9BI=;
 b=F2UXga+jJ49o0EQfc1llIuUFTEDv7Uag2U5D6Y2NSopEY6kGG3BWU3XDH/FbjuPnh5
 SUrA+sEhTbfWc3baWPTcx+WiqvGlplglScrgrUTNQ+P37PAkVuubpAOeQcOZXFvZRNu/
 vn8n8oEsN4q/f1GSqR/Y7UUa7NZoB7jD8VyKCyXERb+cqBZD++5oaHl51cZYQYy24zZO
 AY5VftUXevlo22A5X6D+kcUCxycbrOh85A2df7aXh25LGmuhqeEOssu5pf251cm3oZpW
 J/rafltmVrTQMjW6oxLDv8Y7tEJHIQ7S8R9KcTGXXBiBrAuBSLuvhoBregFErgwj6NiD
 fncQ==
X-Gm-Message-State: AOAM533hRXHkDfK8iNd72yR2aC7N5U2yW+51AE8FPjhJqmaD3GaYNaKh
 eowQdq2CjcUILm0sM+/tqv3MzA==
X-Google-Smtp-Source: ABdhPJwRH/CX2FYRARUgG1+mzIa/QuVNWzg4jQoHZB7NOT97+fmtc0eat9IRh9q/mSpxChFc0Hp56Q==
X-Received: by 2002:a05:620a:54f:: with SMTP id
 o15mr3905794qko.91.1602092352650; 
 Wed, 07 Oct 2020 10:39:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d14sm2013598qtr.62.2020.10.07.10.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 10:39:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQDPD-00112O-7o; Wed, 07 Oct 2020 14:39:11 -0300
Date: Wed, 7 Oct 2020 14:39:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 13/13] vfio/type1: Mark follow_pfn as unsafe
Message-ID: <20201007173911.GX5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-14-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-14-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDcsIDIwMjAgYXQgMDY6NDQ6MjZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGUgY29kZSBzZWVtcyB0byBzdHVmZiB0aGVzZSBwZm5zIGludG8gaW9tbXUgcHRz
IChvciBzb21ldGhpbmcgbGlrZQo+IHRoYXQsIEkgZGlkbid0IGZvbGxvdyksIGJ1dCB0aGVyZSdz
IG5vIG1tdV9ub3RpZmllciB0byBlbnN1cmUgdGhhdAo+IGFjY2VzcyBpcyBzeW5jaHJvbml6ZWQg
d2l0aCBwdGUgdXBkYXRlcy4KPiAKPiBIZW5jZSBtYXJrIHRoZXNlIGFzIHVuc2FmZS4gVGhpcyBt
ZWFucyB0aGF0IHdpdGgKPiBDT05GSUdfU1RSSUNUX0ZPTExPV19QRk4sIHRoZXNlIHdpbGwgYmUg
cmVqZWN0ZWQuCj4gCj4gUmVhbCBmaXggaXMgdG8gd2lyZSB1cCBhbiBtbXVfbm90aWZpZXIgLi4u
IHNvbWVob3cuIFByb2JhYmx5IG1lYW5zIGFueQo+IGludmFsaWRhdGUgaXMgYSBmYXRhbCBmYXVs
dCBmb3IgdGhpcyB2ZmlvIGRldmljZSwgYnV0IHRoZW4gdGhpcwo+IHNob3VsZG4ndCBldmVyIGhh
cHBlbiBpZiB1c2Vyc3BhY2UgaXMgcmVhc29uYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+
IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgo+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBDYzogRGFuIFdpbGxpYW1zIDxk
YW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1z
b2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENj
OiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+IENjOiBDb3Ju
ZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KPiBDYzoga3ZtQHZnZXIua2VybmVsLm9yZwo+
IC0tLQo+ICBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCj4gaW5kZXggNWZiZjBjMWY3NDMzLi5hNGQ1M2YzZDBhMzUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwo+ICsrKyBiL2RyaXZlcnMvdmZp
by92ZmlvX2lvbW11X3R5cGUxLmMKPiBAQCAtNDIxLDcgKzQyMSw3IEBAIHN0YXRpYyBpbnQgZm9s
bG93X2ZhdWx0X3BmbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IG1tX3N0cnVj
dCAqbW0sCj4gIHsKPiAgCWludCByZXQ7Cj4gIAo+IC0JcmV0ID0gZm9sbG93X3Bmbih2bWEsIHZh
ZGRyLCBwZm4pOwo+ICsJcmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZuKTsK
PiAgCWlmIChyZXQpIHsKPiAgCQlib29sIHVubG9ja2VkID0gZmFsc2U7Cj4gIAo+IEBAIC00MzUs
NyArNDM1LDcgQEAgc3RhdGljIGludCBmb2xsb3dfZmF1bHRfcGZuKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAgCQlpZiAocmV0KQo+ICAJCQlyZXR1
cm4gcmV0Owo+ICAKPiAtCQlyZXQgPSBmb2xsb3dfcGZuKHZtYSwgdmFkZHIsIHBmbik7Cj4gKwkJ
cmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZuKTsKPiAgCX0KClRoaXMgaXMg
YWN0dWFsbHkgYmVpbmcgY29tbW9ubHkgdXNlZCwgc28gaXQgbmVlZHMgZml4aW5nLgoKV2hlbiBJ
IHRhbGtlZCB0byBBbGV4IGFib3V0IHRoaXMgbGFzdCB3ZSBoYWQgd29ya2VkIG91dCBhIHBhdGNo
IHNlcmllcwp0aGF0IGFkZHMgYSB0ZXN0IG9uIHZtX29wcyB0aGF0IHRoZSB2bWEgY2FtZSBmcm9t
IHZmaW8gaW4gdGhlIGZpcnN0CnBsYWNlLiBUaGUgVk1BJ3MgY3JlYXRlZCBieSBWRklPIGFyZSAn
c2FmZScgYXMgdGhlIFBURXMgYXJlIG5ldmVyIGNoYW5nZWQuCgpKYXNvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
