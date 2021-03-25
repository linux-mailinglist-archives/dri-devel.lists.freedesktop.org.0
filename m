Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048434999A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92AA6E053;
	Thu, 25 Mar 2021 18:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3F6E053
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 435E03F3B2;
 Thu, 25 Mar 2021 19:42:19 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Wj1JOJcd; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MF524rY7BNQG; Thu, 25 Mar 2021 19:42:18 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4DA9D3F27F;
 Thu, 25 Mar 2021 19:42:17 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E75B436059E;
 Thu, 25 Mar 2021 19:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616697736; bh=8GFYWnQPYCiN2M+PBNjHsNO3soivwm3ln02svNRajX8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wj1JOJcdbTP/JTvFBvpvJy9mle9Q6w++mH7KUmgFoeLdDz0gEgltJCQEOYtHkHlQw
 oGzJznK3W4yJK20Ft0Qqqa2v52HBleZr7q2Ikla8PDvw9pgO/my42DJuvmzxnOVfLq
 iz7nc9TafMwV7HJONjvuCiUULNZFa0+d3ethgJo8=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
 <20210325175504.GH2356281@nvidia.com>
 <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
 <20210325182442.GI2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <6c952be3-8be8-c4c9-a1f9-ddec027645bf@shipmail.org>
Date: Thu, 25 Mar 2021 19:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325182442.GI2356281@nvidia.com>
Content-Language: en-US
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
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjUvMjEgNzoyNCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRodSwgTWFy
IDI1LCAyMDIxIGF0IDA3OjEzOjMzUE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IE9uIDMvMjUvMjEgNjo1NSBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4g
T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDY6NTE6MjZQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPj4+PiBPbiAzLzI0LzIxIDk6MjUgUE0sIERhdmUgSGFuc2VuIHdy
b3RlOgo+Pj4+PiBPbiAzLzI0LzIxIDE6MjIgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+Pj4+Pj4gV2UgYWxzbyBoYXZlIG5vdCBiZWVuIGNhcmVmdWwgYXQgKmFsbCogYWJv
dXQgaG93IF9QQUdFX0JJVF9TT0ZUVyogYXJlCj4+Pj4+Pj4gdXNlZC7CoCBJdCdzIHF1aXRlIHBv
c3NpYmxlIHdlIGNhbiBlbmNvZGUgYW5vdGhlciB1c2UgZXZlbiBpbiB0aGUKPj4+Pj4+PiBleGlz
dGluZyBiaXRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gUGVyc29uYWxseSwgSSdkIGp1c3QgdHJ5Ogo+Pj4+
Pj4+Cj4+Pj4+Pj4gI2RlZmluZSBfUEFHRV9CSVRfU09GVFc1wqDCoMKgwqDCoMKgwqAgNTfCoMKg
wqDCoMKgIC8qIGF2YWlsYWJsZSBmb3IgcHJvZ3JhbW1lciAqLwo+Pj4+Pj4+Cj4+Pj4+PiBPSywg
SSdsbCBmb2xsb3cgeW91ciBhZHZpc2UgaGVyZS4gRldJVyBJIGdyZXBwZWQgZm9yIFNXMSBhbmQg
aXQgc2VlbXMKPj4+Pj4+IHVzZWQgaW4gYSBzZWxmdGVzdCwgYnV0IG9ubHkgZm9yIFBURXMgQUZB
SUNULgo+Pj4+Pj4KPj4+Pj4+IE9oLCBhbmQgd2UgZG9uJ3QgY2FyZSBhYm91dCAzMi1iaXQgbXVj
aCBhbnltb3JlPwo+Pj4+PiBPbiB4ODYsIHdlIGhhdmUgNjQtYml0IFBURXMgd2hlbiBydW5uaW5n
IDMyLWJpdCBrZXJuZWxzIGlmIFBBRSBpcwo+Pj4+PiBlbmFibGVkLiAgSU9XLCB3ZSBjYW4gaGFu
ZGxlIHRoZSBtYWpvcml0eSBvZiAzMi1iaXQgQ1BVcyBvdXQgdGhlcmUuCj4+Pj4+Cj4+Pj4+IEJ1
dCwgeWVhaCwgd2UgZG9uJ3QgY2FyZSBhYm91dCAzMi1iaXQuIDopCj4+Pj4gSG1tLAo+Pj4+Cj4+
Pj4gQWN0dWFsbHkgaXQgbWFrZXMgc29tZSBzZW5zZSB0byB1c2UgU1cxLCB0byBtYWtlIGl0IGVu
ZCB1cCBpbiB0aGUgc2FtZSBkd29yZAo+Pj4+IGFzIHRoZSBQU0UgYml0LCBhcyBmcm9tIHdoYXQg
SSBjYW4gdGVsbCwgcmVhZGluZyBvZiBhIDY0LWJpdCBwbWRfdCBvbiAzMi1iaXQKPj4+PiBQQUUg
aXMgbm90IGF0b21pYywgc28gaW4gdGhlb3J5IGEgaHVnZSBwbWQgY291bGQgYmUgbW9kaWZpZWQg
d2hpbGUgcmVhZGluZwo+Pj4+IHRoZSBwbWRfdCBtYWtpbmcgdGhlIGR3b3JkcyBpbmNvbnNpc3Rl
bnQuLi4uIEhvdyBkb2VzIHRoYXQgd29yayB3aXRoIGZhc3QKPj4+PiBndXAgYW55d2F5Pwo+Pj4g
SXQgbG9vcHMgdG8gZ2V0IGFuIGF0b21pYyA2NCBiaXQgdmFsdWUgaWYgdGhlIGFyY2ggY2FuJ3Qg
cHJvdmlkZSBhbgo+Pj4gYXRvbWljIDY0IGJpdCBsb2FkCj4+IEhtbSwgb2ssIEkgc2VlIGEgUkVB
RF9PTkNFKCkgaW4gZ3VwX3BtZF9yYW5nZSgpLCBhbmQgdGhlbiB0aGUgcmVzdWx0aW5nIHBtZAo+
PiBpcyBkZXJlZmVyZW5jZWQgZWl0aGVyIGluIHRyeV9ncmFiX2NvbXBvdW5kX2hlYWQoKSBvciBf
X2d1cF9kZXZpY2VfaHVnZSgpLAo+PiBiZWZvcmUgdGhlIHBtZCBpcyBjb21wYXJlZCB0byB0aGUg
dmFsdWUgdGhlIHBvaW50ZXIgaXMgY3VycmVudGx5IHBvaW50aW5nCj4+IHRvLiBDb3VsZG4ndCB0
aG9zZSBkZXJlZmVyZW5jZXMgYmUgb24gaW52YWxpZCBwb2ludGVycz8KPiBVaGhoaGguLiBUaGF0
IGRvZXMgbG9vayBxdWVzdGlvbmFibGUsIHllcy4gVW5sZXNzIHRoZXJlIGlzIHNvbWUgdHJpY2t5
Cj4gcmVhc29uIHdoeSBhIDY0IGJpdCBwbWQgZW50cnkgb24gYSAzMiBiaXQgYXJjaCBlaXRoZXIg
Y2FuJ3QgZXhpc3Qgb3IKPiBoYXMgYSBzdGFibGUgdXBwZXIgMzIgYml0cy4uCj4KPiBUaGUgcHRl
IGRvZXMgaXQgd2l0aCBwdGVwX2dldF9sb2NrbGVzcygpLCB3ZSBwcm9iYWJseSBuZWVkIHRoZSBz
YW1lCj4gZm9yIHRoZSBvdGhlciBsZXZlbHMgdG9vIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYSBS
RUFEX09OQ0U/Cj4KPiBKYXNvbgoKWWVzLCB1bmxlc3MgdGhhdCBjb21tZW50IGJlZm9yZSBsb2Nh
bF9pcnFfZGlzYWJsZSgpIG1lYW5zIHNvbWUgbWFnaWMgaXMgCmRvbmUgdG8gcHJldmVudCBiYWQg
dGhpbmdzIGhhcHBlbmluZywgYnV0IEkgZ3Vlc3MgaWYgaXQncyBuZWVkZWQgZm9yIApwdGVzLCBp
dCdzIHByb2JhYmx5IG5lZWRlZCBmb3IgcG1kcyBhbmQgcHVkcyBhcyB3ZWxsLgoKL1Rob21hcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
