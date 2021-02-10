Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E678316D06
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 18:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174ED6E30F;
	Wed, 10 Feb 2021 17:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B586EC09
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 17:43:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id e5so2549636otb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOwEXRdvVMZvfZEaxMVJf2OldGo/hEkLnws83/gy1v0=;
 b=aSVQeyO4q1SyZ99Fx7g8reh4zcI1aH3PnMoub+qk1TikH0aJexvkhIzg4srOUi51Pr
 b+AAPUlkcwrzbLD4NYqC4amBaspRGlM01Vo4Fkjax6nExQQ/Znn0hckIUG3tLzxeKD8V
 xFUNFSxUmoaeOlJbCq1EzPzfPxhFV3+GCpZZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOwEXRdvVMZvfZEaxMVJf2OldGo/hEkLnws83/gy1v0=;
 b=N9tAHof5DoI+z6KvMubiyEjIpzcvGe8nZKZBSw6sO4pwFU32hyU/Jq5/99FDosGwjy
 /cqEWLWLoD6jRePYxxbANxUEoMsnhS8XMp82KGqt4SSBNPpFBcXhzvVYunzvMD9tdJaA
 ClybA24P6kqSuvWdGi7xOixGxpcfVdPnolihUkC/bGdFIypyVtRJmPz4JIIQJsnuCs3K
 qwC7nkeECeDN5gxccuPETfeToHNnE42O1a2uv4bnvnGwoFB6CAcsRQJmnId/kxqwQEjt
 dBhQK9XK5ODdCRAJ9Mj+XlWBUG5VocDzSEq8e8/CkZONXh6hmh+OlvJuwSXo9dRB6vMS
 2kzA==
X-Gm-Message-State: AOAM5307cfPDb3CcJ7cn0Q2G+ury8tfp5voZIeJ7I/1SjTwGVs3MU5eZ
 4GXZOTKCi1eNG8Rop/6HkuCjRDyMnBsVXftcUZAeXw==
X-Google-Smtp-Source: ABdhPJyf0c/kQbPLFv9k7KYsyYq25CZR3JWicuNJgZ3n4s/yKoff44lu/fP6XuJ5GLjcgeB2grbmGucW3joUFNL7tbI=
X-Received: by 2002:a9d:2270:: with SMTP id o103mr2896760ota.303.1612978991821; 
 Wed, 10 Feb 2021 09:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 10 Feb 2021 18:43:00 +0100
Message-ID: <CAKMK7uFdR=SGD+LwH4nES0afYzuxzKr0EbHQ=Ea03appvVwD9Q@mail.gmail.com>
Subject: Re: [PATCH] PCI: Also set up legacy files only after sysfs init
To: LKML <linux-kernel@vger.kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Linux MM <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, Linux PCI <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmpvcm4sCgpDYW4geW91IGFjayB0aGlzIGZvciBtZXJnaW5nIHRocm91Z2ggbXkgdG9waWMg
YnJhbmNoIHdpdGggdGhlIG90aGVyCmZvbGxvd19wZm4vaW9tZW0gcmV2b2tlIGZpeGVzIGZvciA1
LjEyPwoKSWYgbm90LCB3aGF0J3MgdGhlIHBsYW4gZm9yIGdldHRpbmcgdGhpcyAob3IgZXF1aXZh
bGVudCBmdW5jdGlvbmFsaXR5KQppbiBmb3IgNS4xMz8gSSBoYXZlIG1vcmUgb2YgdGhlc2UgZm9s
bG93X3Bmbi9pb21lbSByZXZva2UgcGF0Y2hlcyBvbgp0b3AsIHNvIEknZCBsaWtlIHRvIGdldCB0
aGUgZmlyc3QgY3V0IG1lcmdlZCBzb29uZXIgdGhhbiBsYXRlciBpZgpwb3NzaWJsZS4gQW5kIHRo
ZSBvdGhlciBwcmVwIHdvcmsgaGFzIGJlZW4gaW4gLW5leHQgc2luY2UgLXJjMS4KClRoYW5rcywg
RGFuaWVsCgpPbiBGcmksIEZlYiA1LCAyMDIxIGF0IDI6MzYgUE0gRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBXZSBhcmUgYWxyZWFkeSBkb2luZyB0aGlz
IGZvciBhbGwgdGhlIHJlZ3VsYXIgc3lzZnMgZmlsZXMgb24gUENJCj4gZGV2aWNlcywgYnV0IG5v
dCB5ZXQgb24gdGhlIGxlZ2FjeSBpbyBmaWxlcyBvbiB0aGUgUENJIGJ1c2VzLiBUaHVzIGZhcgo+
IG5vIHByb2JsZW0sIGJ1dCBpbiB0aGUgbmV4dCBwYXRjaCBJIHdhbnQgdG8gd2lyZSB1cCBpb21l
bSByZXZva2UKPiBzdXBwb3J0LiBUaGF0IG5lZWRzIHRoZSB2ZnMgdXAgYW5kIHJ1bm5pbmcgYWxy
ZWFkeSB0byBtYWtlIHN1cmUgdGhhdAo+IGlvbWVtX2dldF9tYXBwaW5nKCkgd29ya3MuCj4KPiBX
aXJlIGl0IHVwIGV4YWN0bHkgbGlrZSB0aGUgZXhpc3RpbmcgY29kZSBpbgo+IHBjaV9jcmVhdGVf
c3lzZnNfZGV2X2ZpbGVzKCkuIE5vdGUgdGhhdCBwY2lfcmVtb3ZlX2xlZ2FjeV9maWxlcygpCj4g
ZG9lc24ndCBuZWVkIGEgY2hlY2sgc2luY2UgdGhlIG9uZSBmb3IgcGNpX2J1cy0+bGVnYWN5X2lv
IGlzCj4gc3VmZmljaWVudC4KPgo+IEFuIGFsdGVybmF0aXZlIHNvbHV0aW9uIHdvdWxkIGJlIHRv
IGltcGxlbWVudCBhIGNhbGxiYWNrIGluIHN5c2ZzIHRvCj4gc2V0IHVwIHRoZSBhZGRyZXNzIHNw
YWNlIGZyb20gaW9tZW1fZ2V0X21hcHBpbmcoKSB3aGVuIHVzZXJzcGFjZSBjYWxscwo+IG1tYXAo
KS4gVGhpcyBhbHNvIHdvcmtzLCBidXQgR3JlZyBkaWRuJ3QgcmVhbGx5IGxpa2UgdGhhdCBqdXN0
IHRvIHdvcmsKPiBhcm91bmQgYW4gb3JkZXJpbmcgaXNzdWUgd2hlbiB0aGUga2VybmVsIGxvYWRz
IGluaXRpYWxseS4KPgo+IHYyOiBJbXByb3ZlIGNvbW1pdCBtZXNzYWdlIChCam9ybikKPgo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENj
OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPiBDYzogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0u
b3JnPgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VA
cmVkaGF0LmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBDYzogRGFuIFdpbGxp
YW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3Vu
Zy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+
IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+IENjOiBsaW51eC1wY2lA
dmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvcGNpL3BjaS1zeXNmcy5jIHwgNyArKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9wY2ktc3lzZnMuYyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jCj4gaW5kZXgg
ZmIwNzJmNGIzMTc2Li4wYzQ1YjRmN2IyMTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvcGNp
LXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYwo+IEBAIC05MjcsNiArOTI3
LDkgQEAgdm9pZCBwY2lfY3JlYXRlX2xlZ2FjeV9maWxlcyhzdHJ1Y3QgcGNpX2J1cyAqYikKPiAg
ewo+ICAgICAgICAgaW50IGVycm9yOwo+Cj4gKyAgICAgICBpZiAoIXN5c2ZzX2luaXRpYWxpemVk
KQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICAgICAgICAgYi0+bGVnYWN5X2lvID0g
a2NhbGxvYygyLCBzaXplb2Yoc3RydWN0IGJpbl9hdHRyaWJ1dGUpLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHRlBfQVRPTUlDKTsKPiAgICAgICAgIGlmICghYi0+bGVnYWN5X2lv
KQo+IEBAIC0xNDQ4LDYgKzE0NTEsNyBAQCB2b2lkIHBjaV9yZW1vdmVfc3lzZnNfZGV2X2ZpbGVz
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICBzdGF0aWMgaW50IF9faW5pdCBwY2lfc3lzZnNfaW5p
dCh2b2lkKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IE5VTEw7Cj4gKyAg
ICAgICBzdHJ1Y3QgcGNpX2J1cyAqcGJ1cyA9IE5VTEw7Cj4gICAgICAgICBpbnQgcmV0dmFsOwo+
Cj4gICAgICAgICBzeXNmc19pbml0aWFsaXplZCA9IDE7Cj4gQEAgLTE0NTksNiArMTQ2Myw5IEBA
IHN0YXRpYyBpbnQgX19pbml0IHBjaV9zeXNmc19pbml0KHZvaWQpCj4gICAgICAgICAgICAgICAg
IH0KPiAgICAgICAgIH0KPgo+ICsgICAgICAgd2hpbGUgKChwYnVzID0gcGNpX2ZpbmRfbmV4dF9i
dXMocGJ1cykpKQo+ICsgICAgICAgICAgICAgICBwY2lfY3JlYXRlX2xlZ2FjeV9maWxlcyhwYnVz
KTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICBsYXRlX2luaXRjYWxsKHBjaV9zeXNm
c19pbml0KTsKPiAtLQo+IDIuMzAuMAo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
