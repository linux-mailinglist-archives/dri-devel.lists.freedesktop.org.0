Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DDBEEAF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 11:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0A6EC5B;
	Thu, 26 Sep 2019 09:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6E9A6EC5B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 09:47:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789381000;
 Thu, 26 Sep 2019 02:47:15 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72A2E3F67D;
 Thu, 26 Sep 2019 02:47:14 -0700 (PDT)
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <20190925151404.23222-1-steven.price@arm.com>
 <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <bcdeda56-619d-cff1-7b62-12dd446c532e@arm.com>
Date: Thu, 26 Sep 2019 10:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
Content-Language: en-GB
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
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDkvMjAxOSAwODowNywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjUuMDku
MTkgdW0gMTc6MTQgc2NocmllYiBTdGV2ZW4gUHJpY2U6Cj4+IGRybV9zY2hlZF9jbGVhbnVwX2pv
YnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVjYXVzZQo+PiBp
dCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUo
KSBpdCBtdXN0IG5vdAo+PiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUgY2FsbGJhY2tz
IChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuCj4+Cj4+IEluc3RlYWQgbGV0J3MgcmVu
YW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bwo+PiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBf
am9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYKPj4gdGhlcmUg
aXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkgY2FsbGJhY2sg
b3V0c2lkZQo+PiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUgc2xlZXBpbmcg
aXMgcG9zc2libGUgYmVmb3JlCj4+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5pbmcgdG8gc2xlZXAg
aWYgbmVjZXNzYXJ5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYyB8IDQ0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+PiBpbmRleCA5YTBlZTc0ZDgyZGMuLjBlZDRhYWE0ZTZk
MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4gQEAgLTYy
Miw0MyArNjIyLDQxIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikKPj4gICB9Cj4+ICAgCj4+ICAg
LyoqCj4+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJveSBmaW5pc2hlZCBqb2Jz
Cj4+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIC0gZmV0Y2ggdGhlIG5leHQgZmluaXNo
ZWQgam9iIHRvIGJlIGRlc3Ryb3llZAo+PiAgICAqCj4+ICAgICogQHNjaGVkOiBzY2hlZHVsZXIg
aW5zdGFuY2UKPj4gICAgKgo+PiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2JzIGZyb20gdGhl
IG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uCj4+ICsgKiBSZXR1cm5zIHRoZSBuZXh0IGZp
bmlzaGVkIGpvYiBmcm9tIHRoZSBtaXJyb3IgbGlzdCAoaWYgdGhlcmUgaXMgb25lKQo+PiArICog
cmVhZHkgZm9yIGl0IHRvIGJlIGRlc3Ryb3llZC4KPj4gICAgKi8KPj4gLXN0YXRpYyB2b2lkIGRy
bV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4g
K3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqCj4+ICtkcm1fc2NoZWRfZ2V0X2NsZWFudXBf
am9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+ICAgewo+PiArCXN0cnVjdCBk
cm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOwo+PiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiAg
IAo+PiAgIAkvKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlz
IHJ1bm5pbmcgKi8KPj4gICAJaWYgKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1F
T1VUICYmCj4+ICAgCSAgICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkK
Pj4gLQkJcmV0dXJuOwo+PiAtCj4+IC0KPj4gLQl3aGlsZSAoIWxpc3RfZW1wdHkoJnNjaGVkLT5y
aW5nX21pcnJvcl9saXN0KSkgewo+PiAtCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iOwo+PiAr
CQlyZXR1cm4gTlVMTDsKPj4gICAKPj4gLQkJam9iID0gbGlzdF9maXJzdF9lbnRyeSgmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QsCj4+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZz
Y2hlZC0+cmluZ19taXJyb3JfbGlzdCwKPj4gICAJCQkJICAgICAgIHN0cnVjdCBkcm1fc2NoZWRf
am9iLCBub2RlKTsKPiAKPiBUaGlzIGlzIHByb2JhYmx5IGJldHRlciBkb25lIGFmdGVyIHRha2lu
ZyB0aGUgbG9jaywgYXBhcnQgZnJvbSB0aGF0IAo+IGxvb2tzIGdvb2QgdG8gbWUuCgpJdCB3YXNu
J3QgcHJldmlvdXNseSBwcm90ZWN0ZWQgYnkgdGhlIGxvY2sgLSBidXQgSSBkb24ndCBzZWUgYW55
IGhhcm0gc28KSSdsbCBwb3N0IGEgdjIuCgpTdGV2ZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
