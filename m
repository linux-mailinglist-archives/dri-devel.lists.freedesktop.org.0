Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3515145F49
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 00:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839C96F93C;
	Wed, 22 Jan 2020 23:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80136F93C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579736636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptdQoUA8cwG/cONLXbS6IYCmMYGKxH56JCiQdsrQvf8=;
 b=XemjnXfF+eQXjxahNLdxJUEKQhsGww3o9IKXEFbDgUXZZ5/lrZHpy7EndDzjRZ3jLpBdj3
 EHS5+PTfgTX4aFzWCLcojL7f0hP+YTR1qYZlwRKgNRWatiIPA3G4f7DllBDT7lh0m2EglI
 J8skx++B2p9zTy/478Oc+fpm6HA9tNE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-knzWoYTVPgytcGZo0iJ4sA-1; Wed, 22 Jan 2020 18:43:53 -0500
Received: by mail-qv1-f69.google.com with SMTP id g15so917769qvk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 15:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xB1GttdbT3t+7BmVYHCi+SL61EAOwYzXDDXUKLb+yKA=;
 b=NIrad9HekY1yz0wopiCk+UlwF33Yth8Zgv+eR51CA0nkZVF4Jaatk/j0cqhKHR6BUI
 dYF2V3ROQureKamVdj63nMg19sfZkj6NRNqdP1+C4XVTjSpC2706yLpHhXVlyayzw+1v
 a4fzHZkQOICltMS3LwjnrSDAb4IuCRwPctRBc68TQLjNcrANVb1yJXe6ptKapx3TDvdI
 LJQqaq2HPCCba/mctgcHMWUO19PG6Fb9e6Bi4ikmqy3b73Brbyh21T5a4PAJZhwjp481
 Ia0utaePR5nSOwCjHERWHoMT9SW61OAExnHuPNpjsvKtmGa0cRomJcfzDz+F1qr4TsMK
 JjDQ==
X-Gm-Message-State: APjAAAWnkADxIpwSrgf/Cdzx2juyGKFgvzIds5Ba1ZUSqBeI7nAeP4+R
 cYUubUzuFdmhGtAliAYMaUI7lSvpD+tVCIDPTarl1aUX1nTGev+tOBfnZSanZt2TjMFqCd8LcZt
 SImk8JJicQOWhLvvvT/0JCP9ELD54
X-Received: by 2002:a05:620a:4db:: with SMTP id
 27mr13443396qks.146.1579736632702; 
 Wed, 22 Jan 2020 15:43:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzg0UCKLKoVY9Z3OtxOCjftnbr7zi/VmqEuXqfcFBxwvH7MQrJvnBBVQhlwACialzg1m07iuQ==
X-Received: by 2002:a05:620a:4db:: with SMTP id
 27mr13443368qks.146.1579736632418; 
 Wed, 22 Jan 2020 15:43:52 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id i5sm94751qtv.80.2020.01.22.15.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 15:43:51 -0800 (PST)
Message-ID: <bedb14c54b1cbd93117e2a64675ea31ad4b23d5a.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/dp_mst: Fix clearing payload state on
 topology disable
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 22 Jan 2020 18:43:50 -0500
In-Reply-To: <20200122205153.GJ13686@intel.com>
References: <20200122194321.14953-1-lyude@redhat.com>
 <20200122205153.GJ13686@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: knzWoYTVPgytcGZo0iJ4sA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTAxLTIyIGF0IDIyOjUxICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDI6NDM6MjBQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IFRoZSBpc3N1ZXMgY2F1c2VkIGJ5Ogo+ID4gCj4gPiA2NGU2MmJkZjA0YWIgKCJk
cm0vZHBfbXN0OiBSZW1vdmUgVkNQSSB3aGlsZSBkaXNhYmxpbmcgdG9wb2xvZ3kgbWdyIikKPiA+
IAo+ID4gUHJvbXB0ZWQgbWUgdG8gdGFrZSBhIGNsb3NlciBsb29rIGF0IGhvdyB3ZSBjbGVhciB0
aGUgcGF5bG9hZCBzdGF0ZSBpbgo+ID4gZ2VuZXJhbCB3aGVuIGRpc2FibGluZyB0aGUgdG9wb2xv
Z3ksIGFuZCBpdCB0dXJucyBvdXQgdGhlcmUncyBhY3R1YWxseQo+ID4gdHdvIHN1YnRsZSBpc3N1
ZXMgaGVyZS4KPiA+IAo+ID4gVGhlIGZpcnN0IGlzIHRoYXQgd2UncmUgbm90IGdyYWJiaW5nICZt
Z3IucGF5bG9hZF9sb2NrIHdoZW4gY2xlYXJpbmcgdGhlCj4gPiBwYXlsb2FkcyBpbiBkcm1fZHBf
bXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KCkuIFNlZWluZyBhcyB0aGUgY2Fub25pY2FsCj4gPiBs
b2NrIG9yZGVyIGlzICZtZ3IucGF5bG9hZF9sb2NrIC0+ICZtZ3IubG9jayAoYmVjYXVzZSB3ZSBh
bHdheXMgd2FudAo+ID4gJm1nci5sb2NrIHRvIGJlIHRoZSBpbm5lci1tb3N0IGxvY2sgc28gdG9w
b2xvZ3kgdmFsaWRhdGlvbiBhbHdheXMKPiA+IHdvcmtzKSwgdGhpcyBtYWtlcyBwZXJmZWN0IHNl
bnNlLiBJdCBhbHNvIG1lYW5zIHRoYXQgLXRlY2huaWNhbGx5LSB0aGVyZQo+ID4gY291bGQgYmUg
cmFjaW5nIGJldHdlZW4gc29tZW9uZSBjYWxsaW5nCj4gPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
cl9zZXRfbXN0KCkgdG8gZGlzYWJsZSB0aGUgdG9wb2xvZ3ksIGFsb25nIHdpdGggYQo+ID4gbW9k
ZXNldCBvY2N1cnJpbmcgdGhhdCdzIG1vZGlmeWluZyB0aGUgcGF5bG9hZCBzdGF0ZSBhdCB0aGUg
c2FtZSB0aW1lLgo+ID4gCj4gPiBUaGUgc2Vjb25kIGlzIHRoZSBtb3JlIG9idmlvdXMgaXNzdWUg
dGhhdCBXYXluZSBMaW4gZGlzY292ZXJlZCwgdGhhdAo+ID4gd2UncmUgbm90IGNsZWFyaW5nIHBy
b3Bvc2VkX3BheWxvYWRzIHdoZW4gZGlzYWJsaW5nIHRoZSB0b3BvbG9neS4KPiA+IAo+ID4gSSBh
Y3R1YWxseSBjYW4ndCBzZWUgYW55IG9idmlvdXMgcGxhY2VzIHdoZXJlIHRoZSByYWNpbmcgY2F1
c2VkIGJ5IHRoZQo+ID4gZmlyc3QgaXNzdWUgd291bGQgYnJlYWsgc29tZXRoaW5nLCBhbmQgaXQg
Y291bGQgYmUgdGhhdCBzb21lIG9mIG91cgo+ID4gaGlnaGVyLWxldmVsIGxvY2tzIGFscmVhZHkg
cHJldmVudCB0aGlzIGJ5IGhhcHBlbnN0YW5jZSwgYnV0IGJldHRlciBzYWZlCj4gPiB0aGVuIHNv
cnJ5LiBTbywgbGV0J3MgbWFrZSBpdCBzbyB0aGF0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Nl
dF9tc3QoKQo+ID4gZmlyc3QgZ3JhYnMgJm1nci5wYXlsb2FkX2xvY2sgZm9sbG93ZWQgYnkgJm1n
ci5sb2NrIHNvIHRoYXQgd2UgbmV2ZXIKPiA+IHJhY2Ugd2hlbiBtb2RpZnlpbmcgdGhlIHBheWxv
YWQgc3RhdGUuIFRoZW4sIHdlIGFsc28gY2xlYXIKPiA+IHByb3Bvc2VkX3BheWxvYWRzIHRvIGZp
eCB0aGUgb3JpZ2luYWwgaXNzdWUgb2YgZW5hYmxpbmcgYSBuZXcgdG9wb2xvZ3kKPiA+IHdpdGgg
YSBkaXJ0eSBwYXlsb2FkIHN0YXRlLiBUaGlzIGRvZXNuJ3QgY2xlYXIgYW55IG9mIHRoZSBkcm1f
ZHBfdmNwaQo+ID4gc3RydWN0dXJlcywgYnV0IHRob3NlIGFyZSBnZXR0aW5nIGRlc3Ryb3llZCBh
bG9uZyB3aXRoIHRoZSBwb3J0cyBhbnl3YXkuCj4gPiAKPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4g
PiAqIFVzZSBzaXplb2YobWdyLT5wYXlsb2Fkc1swXSkvc2l6ZW9mKG1nci0+cHJvcG9zZWRfdmNw
aXNbMF0pIGluc3RlYWQgLQo+ID4gICB2c3lyamFsYQo+ID4gCj4gPiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KPiA+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA3ICsrKysrKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGluZGV4IDM2NDllODJiOTYz
ZC4uMjNjZjQ2YmZlZjc0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwo+ID4gQEAgLTM1MDEsNiArMzUwMSw3IEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
cl9zZXRfbXN0KHN0cnVjdAo+ID4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwgYm9vbCBt
cwo+ID4gIAlpbnQgcmV0ID0gMDsKPiA+ICAJc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3Ri
ID0gTlVMTDsKPiA+ICAKPiA+ICsJbXV0ZXhfbG9jaygmbWdyLT5wYXlsb2FkX2xvY2spOwo+ID4g
IAltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+ID4gIAlpZiAobXN0X3N0YXRlID09IG1nci0+bXN0
X3N0YXRlKQo+ID4gIAkJZ290byBvdXRfdW5sb2NrOwo+ID4gQEAgLTM1NTksNyArMzU2MCwxMCBA
QCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QKPiA+IGRybV9kcF9t
c3RfdG9wb2xvZ3lfbWdyICptZ3IsIGJvb2wgbXMKPiA+ICAJCS8qIHRoaXMgY2FuIGZhaWwgaWYg
dGhlIGRldmljZSBpcyBnb25lICovCj4gPiAgCQlkcm1fZHBfZHBjZF93cml0ZWIobWdyLT5hdXgs
IERQX01TVE1fQ1RSTCwgMCk7Cj4gPiAgCQlyZXQgPSAwOwo+ID4gLQkJbWVtc2V0KG1nci0+cGF5
bG9hZHMsIDAsIG1nci0+bWF4X3BheWxvYWRzICogc2l6ZW9mKHN0cnVjdAo+ID4gZHJtX2RwX3Bh
eWxvYWQpKTsKPiA+ICsJCW1lbXNldChtZ3ItPnBheWxvYWRzLCAwLAo+ID4gKwkJICAgICAgIG1n
ci0+bWF4X3BheWxvYWRzICogc2l6ZW9mKG1nci0+cGF5bG9hZHNbMF0pKTsKPiA+ICsJCW1lbXNl
dChtZ3ItPnByb3Bvc2VkX3ZjcGlzLCAwLAo+ID4gKwkJICAgICAgIG1nci0+bWF4X3BheWxvYWRz
ICogc2l6ZW9mKG1nci0+cHJvcG9zZWRfdmNwaXNbMF0pKTsKPiA+ICAJCW1nci0+cGF5bG9hZF9t
YXNrID0gMDsKPiA+ICAJCXNldF9iaXQoMCwgJm1nci0+cGF5bG9hZF9tYXNrKTsKPiA+ICAJCW1n
ci0+dmNwaV9tYXNrID0gMDsKPiA+IEBAIC0zNTY4LDYgKzM1NzIsNyBAQCBpbnQgZHJtX2RwX21z
dF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QKPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
ICptZ3IsIGJvb2wgbXMKPiA+ICAKPiA+ICBvdXRfdW5sb2NrOgo+ID4gIAltdXRleF91bmxvY2so
Jm1nci0+bG9jayk7Cj4gPiArCW11dGV4X3VubG9jaygmbWdyLT5wYXlsb2FkX2xvY2spOwo+IAo+
IExvY2tpbmcgb3JkZXIgbG9va3Mgc2FuZS4gTm90IGVudGlyZWx5IHN1cmUgd2hhdCB0aGUgaW1w
bGljYXRpb25zIG9mCj4gY2xlYXJpbmcgYWxsIHRoYXQgc3R1ZmYgb3V0c2lkZSBvZiBhIHByb3Bl
ciBtb2Rlc2V0IGlzLCBidXQgYXQgbGVhc3QKPiBpdCBtYXRjaGVzIHdoYXQgd2UgYWxyZWFkeSBk
by4gU28KCmZ3aXcgLSBpdCdzIG5vdCBjbGVhcmluZyBhbnl0aGluZyBjdXJyZW50bHkgcHJvZ3Jh
bW1lZCBpbiBodyBhdCB0aGF0IHBvaW50LAppdCdzIGp1c3QgY2xlYXJpbmcgdGhlIGFycmF5cyB3
ZSB1c2UgZm9yIGtlZXBpbmcgdHJhY2sgb2YgcGVuZGluZy9jdXJyZW50CnBheWxvYWQgYWxsb2Nh
dGlvbnMgc28gdGhlcmUncyBub3RoaW5nIGluIHRoZW0gdGhlIG5leHQgdGltZSB3ZSBlbmFibGUg
TVNUIG9uCmEgZGlzcGxheS4gVGhpcyBpcyBiYXNpY2FsbHkgd2hhdCB3ZSB3YW50IGFueXdheSAt
IG9uY2Ugd2UgZGlzYWJsZSBNU1QgdGhyb3VnaAp0aGUgRFBDRCwgd2Ugd29uJ3QgZW5kIHVwIHNl
bmRpbmcgYW55IHBheWxvYWQgdXBkYXRlcyBhbnl3YXkgc28gdGhlc2UgZG9uJ3QKZ2V0IHVzZWQg
aW4gdGhlIG1vZGVzZXRzIHRoYXQgZm9sbG93LgoKdGJoLCBwYXJ0IG9mIG1lIHdvbmRlcnMgaWYg
d2UgY291bGQgaGFuZGxlIG1vcmUgb2YgdGhpcyBpbiBhdG9taWMgc3RhdGUgaW4gdGhlCmZ1dHVy
ZSwgYnV0IEkgaGF2ZW4ndCBzZWVuIGEgZ29vZCBlbm91Z2ggcmVhc29uIHRvIHRyeSB0aGF0IHll
dC4KPiAKPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KPiAKPiA+ICAJaWYgKG1zdGIpCj4gPiAgCQlkcm1fZHBfbXN0X3RvcG9sb2d5
X3B1dF9tc3RiKG1zdGIpOwo+ID4gIAlyZXR1cm4gcmV0Owo+ID4gLS0gCj4gPiAyLjI0LjEKLS0g
CkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
