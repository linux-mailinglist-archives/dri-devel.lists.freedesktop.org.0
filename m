Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AF2752A3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E240089DD8;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB36E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 01:37:50 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id CC57111AC;
 Wed, 23 Sep 2020 09:37:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.39] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P19669T139950693541632S1600825059359918_; 
 Wed, 23 Sep 2020 09:37:40 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6ceb410db81355261b525d39c7a6a36f>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2 1/3] drm: rockchip: hdmi: fix clock rounding code
To: Vicente Bergas <vicencb@gmail.com>, Doug Anderson
 <dianders@chromium.org>, Andy Yan <andy.yan@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
References: <20200922203107.2932-1-vicencb@gmail.com>
 <20200922203107.2932-2-vicencb@gmail.com>
From: crj <algea.cao@rock-chips.com>
Message-ID: <50002e7b-d1f2-8209-fe65-7f60f036f7d3@rock-chips.com>
Date: Wed, 23 Sep 2020 09:37:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200922203107.2932-2-vicencb@gmail.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CtTaIDIwMjAvOS8yMyA0OjMxLCBWaWNlbnRlIEJlcmdhcyDQtLXAOgo+IFVuZGVyIGNlcnRhaW4g
Y29uZGl0aW9ucyB2b3BfY3J0Y19tb2RlX2ZpeHVwIHJvdW5kcyB0aGUgY2xvY2sKPiAxNDg1MDAw
MDAgdG8gMTQ4NTAxMDAwIHdoaWNoIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gZHdo
ZG1pLXJvY2tjaGlwIGZmOTQwMDAwLmhkbWk6IFBIWSBjb25maWd1cmF0aW9uIGZhaWxlZCAoY2xv
Y2sgMTQ4NTAxMDAwKQo+Cj4gVGhlIGlzc3VlIHdhcyBmb3VuZCBvbiBSSzMzOTkgYm9vdGluZyB3
aXRoIHUtYm9vdC4gVS1ib290IGNvbmZpZ3VyZXMgdGhlCj4gZGlzcGxheSBhdCAyNTYweDE0NDAg
YW5kIHRoZW4gbGludXggY29tZXMgdXAgd2l0aCBhIGJsYWNrIHNjcmVlbi4KPiBBIHdvcmthcm91
bmQgd2FzIHRvIHVuLXBsdWcgYW5kIHJlLXBsdWcgdGhlIEhETUkgZGlzcGxheS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFZpY2VudGUgQmVyZ2FzIDx2aWNlbmNiQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6
IFZpY2VudGUgQmVyZ2FzIDx2aWNlbmNiQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCA3ICsrLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiBpbmRleCBjODBmN2Q5ZmQxM2YuLjky
ZWZiZDg5OWRlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AuYwo+IEBAIC0xMTc2LDEyICsxMTc2LDkgQEAgc3RhdGljIGJvb2wgdm9wX2NydGNfbW9k
ZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAJICoKPiAgIAkgKiAyLiBHZXQgdGhl
IGNsb2NrIGZyYW1ld29yayB0byByb3VuZCB0aGUgcmF0ZSBmb3IgdXMgdG8gdGVsbCB1cwo+ICAg
CSAqICAgIHdoYXQgaXQgd2lsbCBhY3R1YWxseSBtYWtlLgo+IC0JICoKPiAtCSAqIDMuIFN0b3Jl
IHRoZSByb3VuZGVkIHVwIHJhdGUgc28gdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHdvcnJ5IGFib3V0
Cj4gLQkgKiAgICB0aGlzIGluIHRoZSBhY3R1YWwgY2xrX3NldF9yYXRlKCkuCj4gICAJICovCj4g
ICAJcmF0ZSA9IGNsa19yb3VuZF9yYXRlKHZvcC0+ZGNsaywgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sg
KiAxMDAwICsgOTk5KTsKPiAtCWFkanVzdGVkX21vZGUtPmNsb2NrID0gRElWX1JPVU5EX1VQKHJh
dGUsIDEwMDApOwo+ICsJYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSByYXRlIC8gMTAwMDsKPiAgIAo+
ICAgCXJldHVybiB0cnVlOwo+ICAgfQo+IEBAIC0xMzgwLDcgKzEzNzcsNyBAQCBzdGF0aWMgdm9p
ZCB2b3BfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgIAo+ICAg
CVZPUF9SRUdfU0VUKHZvcCwgaW50ciwgbGluZV9mbGFnX251bVswXSwgdmFjdF9lbmQpOwo+ICAg
Cj4gLQljbGtfc2V0X3JhdGUodm9wLT5kY2xrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayAqIDEwMDAp
Owo+ICsJY2xrX3NldF9yYXRlKHZvcC0+ZGNsaywgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgKiAxMDAw
ICsgOTk5KTsKCgpJbiBzb21lIFJLIHBsYXRmb3JtLCBzdWNoIGFzIFJLMzMyOCwgZGNsayBpcyBn
ZW5lcmF0ZWQgYnkgdGhlIElOTk8gSERNSSAKUEhZIFBMTCwgd2hpY2ggc3VwcG9ydAoKZnJhYyBk
aXZpZGVyIGNhbiBzdXBwb3J0IGFueSBkY2xrIGZyZXF1ZW5jeS4gQW5kIFRoZSBQTEwgbXVzdCB1
c2UgdGhlIApleGFjdCBjbG9jayB0byBkZXRlcm1pbmUKCnRoZSBQTEwgY29uZmlndXJhdGlvbi4g
U28gYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgKiAxMDAwICsgOTk5IG1heSBjYXVzZSAKSU5OTyBIRE1J
IFBIWSBQTEwKCmNvdWxkbid0IGZpbmQgdGhlIHJpZ2h0IGNvbmZpZ3VyYXRpb24uIElOTk8gSERN
SSBQSFkncyBkcml2ZXIgcGF0aCBpczoKCmRyaXZlcnMvcGh5L3JvY2tjaGlwL3BoeS1yb2NrY2hp
cC1pbm5vLWhkbWkuYwoKCj4gICAKPiAgIAlWT1BfUkVHX1NFVCh2b3AsIGNvbW1vbiwgc3RhbmRi
eSwgMCk7Cj4gICAJbXV0ZXhfdW5sb2NrKCZ2b3AtPnZvcF9sb2NrKTsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
