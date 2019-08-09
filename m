Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A64E8724E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 08:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6B6ECFF;
	Fri,  9 Aug 2019 06:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0052C6ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 06:40:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x796eaGB033320;
 Fri, 9 Aug 2019 01:40:36 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x796eaD6078619
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 01:40:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 01:40:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 01:40:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x796eXO0070071;
 Fri, 9 Aug 2019 01:40:33 -0500
Subject: Re: [PATCH for-5.3] drm/omap: ensure we have a valid dma_mask
To: Christoph Hellwig <hch@lst.de>
References: <20190808101042.18809-1-hch@lst.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7fff8fd3-16ae-1f42-fcd6-9aa360fe36b5@ti.com>
Date: Fri, 9 Aug 2019 09:40:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808101042.18809-1-hch@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565332836;
 bh=hIPNXoolm+R//pJaCGr9G32GodD/jqixzmQHbhz7icI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hLiBqtHOGzLgU897v6BBPIJQlbOH7izr+RIcMbzP2GOUM6yWg96rPad3c6AIIjMns
 W1hxE67Fw6NeQYwKFfAi25tctnrAzoaB2uMfC7wE4J3VEbuFyg2Hb5WGXvug4D4wDe
 VaeLrUrFSjqVQdbod5yguhAJeeiKqwWJ9w624r24=
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
Cc: airlied@linux.ie, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwOC8wOC8yMDE5IDEzOjEwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUg
b21hcGZiIHBsYXRmb3JtIGRldmljZXMgZG9lcyBub3QgaGF2ZSBhIERNQSBtYXNrIHNldC4gIFRo
ZQo+IHRyYWRpdGlvbmFsIGFybSBETUEgY29kZSBpZ25vcmVzLCBidXQgdGhlIGdlbmVyaWMgZG1h
LWRpcmVjdC9zd2lvdGxiCj4gaGFzIHN0cmljdGVyIGNoZWNrcyBhbmQgdGh1cyBmYWlscyBtYXBw
aW5ncyB3aXRob3V0IGEgRE1BIG1hc2suCj4gQXMgd2UgdXNlIHN3aW90bGIgZm9yIGFybSB3aXRo
IExQQUUgbm93LCBvbWFwIG5lZWRzIHRvIGNhdGNoIHVwCj4gYW5kIGFjdHVhbGx5IHNldCBhIERN
QSBtYXNrLgo+IAo+IEZpeGVzOiBhZDNjN2IxOGM1YjMgKCJhcm06IHVzZSBzd2lvdGxiIGZvciBi
b3VuY2UgYnVmZmVyaW5nIG9uIExQQUUgY29uZmlncyIpCj4gUmVwb3J0ZWQtYnk6ICJILiBOaWtv
bGF1cyBTY2hhbGxlciIgPGhuc0Bnb2xkZWxpY28uY29tPgo+IFRlc3RlZC1ieTogIkguIE5pa29s
YXVzIFNjaGFsbGVyIiA8aG5zQGdvbGRlbGljby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2ZiZGV2LmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYwo+IGluZGV4IDU2MWM0ODEyNTQ1
Yi4uMmM4YWJmMDdlNjE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZmJkZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYwo+
IEBAIC0yMzIsNiArMjMyLDggQEAgdm9pZCBvbWFwX2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPiAgIAlpZiAoIXByaXYtPm51bV9waXBlcykKPiAgIAkJcmV0dXJuOwo+ICAgCj4g
KwlkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50KGRldi0+ZGV2LCBETUFfQklUX01BU0soMzIp
KTsKPiArCj4gICAJZmJkZXYgPSBremFsbG9jKHNpemVvZigqZmJkZXYpLCBHRlBfS0VSTkVMKTsK
PiAgIAlpZiAoIWZiZGV2KQo+ICAgCQlnb3RvIGZhaWw7Cj4gCgpXZSBkbyBjYWxsIGRtYV9zZXRf
Y29oZXJlbnRfbWFzaygpIGluIG9tYXBkcm0ncyBwcm9iZSgpIChpbiBvbWFwX2Rydi5jKSwgCmJ1
dCBhcHBhcmVudGx5IHRoYXQncyBub3QgZW5vdWdoIGFueW1vcmUuIENoYW5naW5nIHRoYXQgY2Fs
bCB0byAKZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudCgpIHJlbW92ZXMgdGhlIFdBUk4uIEkg
Y2FuIGNyZWF0ZSBhIHBhdGNoIApmb3IgdGhhdCwgb3IgQ2hyaXN0b3BoIGNhbiByZXNwaW4gdGhp
cyBvbmUuCgpJIGFtIG5vdCB0b28gZmFtaWxpYXIgd2l0aCB0aGUgZG1hIG1hc2sgaGFuZGxpbmcs
IHNvIG1heWJlIHNvbWVvbmUgY2FuIAplZHVjYXRlOgoKZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hl
cmVudCgpIG92ZXJ3cml0ZXMgZGV2LT5kbWFfbWFzay4gSXNuJ3QgdGhhdCBhIApiYWQgdGhpbmc/
IFdoYXQgaWYgdGhlIHBsYXRmb3JtIGhhcyBzZXQgZGV2LT5kbWFfbWFzaywgYW5kIHRoZSBkcml2
ZXIgCm92ZXJ3cml0ZXMgaXQgd2l0aCBpdHMgdmFsdWU/IE9yIHdobyBpcyBzdXBwb3NlZCB0byBz
ZXQgZGV2LT5kbWFfbWFzaz8KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
