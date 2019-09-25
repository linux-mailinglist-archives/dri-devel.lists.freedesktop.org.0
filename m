Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABFBE1F7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835E46EBF9;
	Wed, 25 Sep 2019 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5826EBF1;
 Wed, 25 Sep 2019 16:07:38 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83381222BF;
 Wed, 25 Sep 2019 16:07:38 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j31so7221198qta.5;
 Wed, 25 Sep 2019 09:07:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXKddDvs9QH2zrD5+tVl+xoPtL3tAWLdDM74Ewcd8SB3PfoXFn7
 QkaZoa+ZRDYglENNis4VwhKzmlzeuzMLBhSBmA==
X-Google-Smtp-Source: APXvYqz1oy5m7mjvghNWjvvttiTqJZiM9hvPOK4OCMBp672J3JDiM/K63youpJW2QLzFXg+mEvd77PmoRL1xNiFzCqU=
X-Received: by 2002:ac8:75c7:: with SMTP id z7mr19500qtq.136.1569427657263;
 Wed, 25 Sep 2019 09:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
In-Reply-To: <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Sep 2019 11:07:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKuz7WEB9zP6apZrdsC_8Q4OQmSuvqgLzJFPsZio0Z6=g@mail.gmail.com>
Message-ID: <CAL_JsqKuz7WEB9zP6apZrdsC_8Q4OQmSuvqgLzJFPsZio0Z6=g@mail.gmail.com>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569427658;
 bh=BDhFvt5VGk5cpLsmQKS0fUfwCU66ZuF9Gw8byviviXQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZJuV1cg80pgN5dVIrsTjC7nHNpCLFivnDjpwqkOACU+jgzrs95f/ObjU5069y94x6
 lIYLvZ5Z7fUWPr+ln7f2YxRfxo0Zbx7YXvc/WRwt3Y5Gwp01ZAG03eVOmAmpcuqA7q
 dmDoEZvV0iEhslx4g4bWqERTerzWbEQeJhtFz0iM=
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
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOTo1MyBBTSBOaWNvbGFzIFNhZW56IEp1bGllbm5lCjxu
c2FlbnpqdWxpZW5uZUBzdXNlLmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjAxOS0wOS0yNCBhdCAx
Njo1OSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBh
dCAxOjEyIFBNIE5pY29sYXMgU2FlbnogSnVsaWVubmUKPiA+IDxuc2FlbnpqdWxpZW5uZUBzdXNl
LmRlPiB3cm90ZToKPiA+ID4gSGkgQWxsLAo+ID4gPiB0aGlzIHNlcmllcyB0cmllcyB0byBhZGRy
ZXNzIG9uZSBvZiB0aGUgaXNzdWVzIGJsb2NraW5nIHVzIGZyb20KPiA+ID4gdXBzdHJlYW1pbmcg
QnJvYWRjb20ncyBTVEIgUENJZSBjb250cm9sbGVyWzFdLiBOYW1lbHksIHRoZSBmYWN0IHRoYXQK
PiA+ID4gZGV2aWNlcyBub3QgcmVwcmVzZW50ZWQgaW4gRFQgd2hpY2ggc2l0IGJlaGluZCBhIFBD
SSBidXMgZmFpbCB0byBnZXQgdGhlCj4gPiA+IGJ1cycgRE1BIGFkZHJlc3NpbmcgY29uc3RyYWlu
dHMuCj4gPiA+Cj4gPiA+IFRoaXMgaXMgZHVlIHRvIHRoZSBmYWN0IHRoYXQgb2ZfZG1hX2NvbmZp
Z3VyZSgpIGFzc3VtZXMgaXQncyByZWNlaXZpbmcgYQo+ID4gPiBEVCBub2RlIHJlcHJlc2VudGlu
ZyB0aGUgZGV2aWNlIGJlaW5nIGNvbmZpZ3VyZWQsIGFzIG9wcG9zZWQgdG8gdGhlIFBDSWUKPiA+
ID4gYnJpZGdlIG5vZGUgd2UgY3VycmVudGx5IHBhc3MuIFRoaXMgY2F1c2VzIHRoZSBjb2RlIHRv
IGRpcmVjdGx5IGp1bXAKPiA+ID4gaW50byBQQ0kncyBwYXJlbnQgbm9kZSB3aGVuIGNoZWNraW5n
IGZvciAnZG1hLXJhbmdlcycgYW5kIG1pc3Nlcwo+ID4gPiB3aGF0ZXZlciB3YXMgc2V0IHRoZXJl
Lgo+ID4gPgo+ID4gPiBUbyBhZGRyZXNzIHRoaXMgSSBjcmVhdGUgYSBuZXcgQVBJIGluIE9GIC0g
aW5zcGlyZWQgZnJvbSBSb2JpbiBNdXJwaHlzCj4gPiA+IG9yaWdpbmFsIHByb3Bvc2FsWzJdIC0g
d2hpY2ggYWNjZXB0cyBhIGJ1cyBEVCBub2RlIGFzIGl0J3MgaW5wdXQgaW4KPiA+ID4gb3JkZXIg
dG8gY29uZmlndXJlIGEgZGV2aWNlJ3MgRE1BIGNvbnN0cmFpbnRzLiBUaGUgY2hhbmdlcyBnbyBk
ZWVwIGludG8KPiA+ID4gb2YvYWRkcmVzcy5jJ3MgaW1wbGVtZW50YXRpb24sIGFzIGEgZGV2aWNl
IGJlaW5nIGhhdmluZyBhIERUIG5vZGUKPiA+ID4gYXNzdW1wdGlvbiB3YXMgcHJldHR5IHN0cm9u
Zy4KPiA+ID4KPiA+ID4gT24gdG9wIG9mIHRoaXMgd29yaywgSSBhbHNvIGNsZWFuZWQgdXAgb2Zf
ZG1hX2NvbmZpZ3VyZSgpIHJlbW92aW5nIGl0cwo+ID4gPiByZWR1bmRhbnQgYXJndW1lbnRzIGFu
ZCBjcmVhdGluZyBhbiBhbHRlcm5hdGl2ZSBmdW5jdGlvbiBmb3IgdGhlIHNwZWNpYWwKPiA+ID4g
Y2FzZXMKPiA+ID4gbm90IGFwcGxpY2FibGUgdG8gZWl0aGVyIHRoZSBhYm92ZSBjYXNlIG9yIHRo
ZSBkZWZhdWx0IHVzYWdlLgo+ID4gPgo+ID4gPiBJTU8gdGhlIHJlc3VsdGluZyBmdW5jdGlvbnMg
YXJlIG1vcmUgZXhwbGljaXQuIFRoZXkgd2lsbCBwcm9iYWJseQo+ID4gPiBzdXJmYWNlIHNvbWUg
aGFja3kgdXNhZ2VzIHRoYXQgY2FuIGJlIHByb3Blcmx5IGZpeGVkIGFzIEkgc2hvdyB3aXRoIHRo
ZQo+ID4gPiBEVCBmaXhlcyBvbiB0aGUgTGF5ZXJzY2FwZSBwbGF0Zm9ybS4KPiA+ID4KPiA+ID4g
VGhpcyB3YXMgYWxzbyB0ZXN0ZWQgb24gYSBSYXNwYmVycnkgUGkgNCB3aXRoIGEgY3VzdG9tIFBD
SWUgZHJpdmVyIGFuZAo+ID4gPiBvbiBhIFNlYXR0bGUgQU1EIGJvYXJkLgo+ID4KPiA+IEh1bW0s
IEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgaXNzdWUgdG9vLiBMb29rcyBzaW1pbGFyIHRob3Vn
aCB5b3Vycwo+ID4gaGFzIGEgbG90IG1vcmUgY2h1cm4gYW5kIHRoZXJlJ3Mgc29tZSBvdGhlciBi
dWdzIEkndmUgZm91bmQuCj4KPiBUaGF0J3MgZ29vZCBuZXdzLCBhbmQgeWVzIG5vdyB0aGF0IEkg
c2VlIGl0LCBzb21lIHN0dWZmIG9uIG15IHNlcmllcyBpcyBvdmVybHkKPiBjb21wbGljYXRlZC4g
U3BlY2lhbGx5IGFyb3VuZCBvZl90cmFuc2xhdGVfKigpLgo+Cj4gT24gdG9wIG9mIHRoYXQsIHlv
dSByZW1vdmVkIGluIG9mX2RtYV9nZXRfcmFuZ2UoKToKPgo+IC0gICAgICAgLyoKPiAtICAgICAg
ICAqIEF0IGxlYXN0IGVtcHR5IHJhbmdlcyBoYXMgdG8gYmUgZGVmaW5lZCBmb3IgcGFyZW50IG5v
ZGUgaWYKPiAtICAgICAgICAqIERNQSBpcyBzdXBwb3J0ZWQKPiAtICAgICAgICAqLwo+IC0gICAg
ICAgaWYgKCFyYW5nZXMpCj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gV2hpY2ggSSBhc3N1
bWVkIHdhcyBib3VuZCB0byB0aGUgc3RhbmRhcmQgYW5kIG1ha2VzIHRoaW5ncyBlYXNpZXIuCgpU
aGUgc3RhbmRhcmQgaXMgd2hhdGV2ZXIgd2Ugc2F5IGl0IGlzIGFuZCB3aGF0IGV4aXN0cyBpbiB0
aGUgd2lsZC4uLgoKUHJvYmFibHkgYmV0dGVyIGZvciBtZSB0byBnZXQgdGhlIHNlcmllcyBwb3N0
ZWQgZm9yIGNvbnRleHQsIGJ1dCB0aGUKYWJvdmUgaXMgcmVtb3ZlZCBiZWNhdXNlIHdlIGNvdWxk
IGJlIHBhc3NpbmcgaW4gdGhlIGJ1cyBkZXZpY2UvY2hpbGQKbm9kZSBhbmQgY2hlY2tpbmcgZm9y
ICdkbWEtcmFuZ2VzJyByYXRoZXIgdGhhbiBvbmx5IHRoZSBidXMgbm9kZS4KV2hpbGUgdGhpcyBk
b2VzIG1lYW4gJ2RtYS1yYW5nZXMnIGNvdWxkIGJlIGluIGEgY2hpbGQgbm9kZSB3aGljaCBpcwp3
cm9uZywgaXQgc2ltcGxpZmllcyB0aGUgb25seSBjYWxsZXIgb2ZfZG1hX2NvbmZpZ3VyZSgpLiBB
bmQgcmVhbGx5LAp0aGVyZSdzIG5vIHdheSB0byBkZXRlY3QgdGhhdCBlcnJvci4gU29tZW9uZSBj
b3VsZCBjYWxsCm9mX2RtYV9jb25maWd1cmUoTlVMTCwgY2hpbGQsIC4uLikuIFBlcmhhcHMgd2Ug
Y291bGQgYXNzZXJ0IHRoYXQKJ3JhbmdlcycgaXMgcHJlc2VudCB3aGVuZXZlciAnZG1hLXJhbmdl
cycgaXMuCgpCYWNrIHRvIHRoZSBzdGFuZGFyZCwgSSB0aGluayBpdCBjYW4gYmUgc3VtbWFyaXpl
ZCBhcyBhIGRldmljZSdzCmltbWVkaWF0ZSBwYXJlbnQgKGEgYnVzIG5vZGUpIG11c3QgY29udGFp
biAnZG1hLXJhbmdlcycuIEFsbCB0aGUKcGFyZW50IG5vZGVzIG9mIHRoZSBidXMgbm9kZSBzaG91
bGQgYWxzbyBoYXZlICdkbWEtcmFuZ2VzJywgYnV0Cm1pc3NpbmcgaXMgdHJlYXRlZCBhcyBlbXB0
eSAoMToxIHRyYW5zbGF0aW9uKS4gJ2RtYS1yYW5nZXMnIG1pc3NpbmcgaW4KYWxsIHRoZSBwYXJl
bnQgbm9kZXMgaXMgYWxzbyB0cmVhdGVkIGFzIDE6MSB0cmFuc2xhdGlvbiBhbmQgbm8KYWRkcmVz
c2luZyByZXN0cmljdGlvbnMuCgo+ID4gQ2FuIHlvdSB0ZXN0IG91dCB0aGlzIGJyYW5jaFsxXS4g
SSBkb24ndCBoYXZlIGFueSBoL3cgbmVlZGluZyB0aGlzLAo+ID4gYnV0IHdyb3RlIGEgdW5pdHRl
c3QgYW5kIHRlc3RlZCB3aXRoIG1vZGlmaWVkIFFFTVUuCj4KPiBJIHJldmlld2VkIGV2ZXJ5dGhp
bmcsIEkgZGlkIGZpbmQgYSBtaW5vciBpc3N1ZSwgc2VlIHRoZSBwYXRjaCBhdHRhY2hlZC4KPgo+
IEFsc28gSSB0ZXN0ZWQgeW91ciBicmFuY2ggYm90aCBvbiBhbiBSUGk0LCB3aXRoIGEgUENJIGRl
dmljZSB0aGF0IGRlcGVuZHMgb24KPiB0aGVzZSBjaGFuZ2VzIGFuZCBieSBjb21wYXJpbmcgdGhl
IE9GIGRlYnVncyBsb2dzIG9uIGEgTGF5ZXJzY2FwZSBib2FyZCB3aGljaAo+IHVzZXMgZG1hLXJh
bmdlcywgZG1hLWNvaGVyZW50IGFuZCBJT01NVS4gQWxsIHdvcmtzIGFzIGV4cGVjdGVkLgo+Cj4g
V2lsbCB5b3Ugc2VuZCB0aGlzIHNlcmllcyBmb3IgdjUuNT8gUGxlYXNlIGtlZXAgbWUgaW4gdGhl
IGxvb3AsIEknbGwgcmV2aWV3IGFuZAo+IHRlc3QgdGhlIGZpbmFsIHZlcnNpb24uCgpZZXMsIHNl
bmRpbmcgaXQgb3V0IHNvb24uCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
