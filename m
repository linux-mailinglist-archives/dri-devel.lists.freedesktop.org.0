Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A532BA461
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7F56E880;
	Fri, 20 Nov 2020 08:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Fri, 20 Nov 2020 08:14:18 UTC
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA016E880
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:14:18 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id g1RVk0X9Olmd2g1RYkPQEf; Fri, 20 Nov 2020 09:07:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1605859628; bh=5ef7lI42EJC0jhODZv8aRbqRC0kxVqZ7bUU3H8kTkJ0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=sCz/nqjJKBqA3Iy+hXRhoPwJZL4RSnoEtFxis6hkV75LW75H+8Mmf4xAFrJVrm+pe
 8hj9fY43X0dqeh5hcaBFUdzWOJyUGVN+kLdzF+HYD2GMKZ191HzrbBTSABtTsVzA60
 CvFYS7ezfnr1FTaFjba06AEAIGK1cPKBvJnU0bV//E1AUEPH/j9aY3U67vZ93V4hF3
 6I2h2Od2vKJaEqVVhdF9KG8FIUuOZ8CG53hsXtNKL1Ch1fABIwEX5ve+bjxpFXGSyB
 aulCIunjrg9nl2+Y0ytv3CWHuxLF8HC5EnBBERF6rxbWpTScSnwiEMYNWkAwQXYMxf
 cBr7jUjdLWeiw==
Subject: Re: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f1f3a1d8-d62a-6e93-afc1-87a8e51081e9@xs4all.nl>
Date: Fri, 20 Nov 2020 09:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-CMAE-Envelope: MS4xfFkC2JJwDijdDHxk6QLdzYl86sxkzUvUR2rXQtLzS7Z3VCur8Sec0yc9/yj+teseucfM5Id3FSotdLzmsmr0WrYFYFXWblZvd586PxVzp7yalD+lMMTn
 /GP83mNKzjc5heCNLfvA46owaFZXBn0xPi+CrgcCTXCH+zCXDT/AugYk6WH31S/1fbilR/Bbn3VeP/VhTIjFK4ZkC7eOo9LJEqJWAP4kRBAdILmunjJmxXCT
 T9pw+MuwA6aQValWt8fR+2+Lohjgd26Kp3nsob/wGjkR2luEcNWBtmlzFVNrH+o+PP5aQAr4PDD+Z3dwOYMFNf76JTi6TFmlFZu78KxaX22EGz/bSPQghfFt
 yr7PTAmX010Y9mMvI/xJ8+OsZxM4+7H5b5EdPvoogEg/pCMQmvIqXLrivqredG5EOF57yPgwvUWyST9kqoBQZ0Y5vkkhX1LEjhptReds6BhrXH1RbB7N/mgZ
 ZNy1MjlvK64zXtOJ8uXaMBuHmzQtKNk3YzD5aJoakoowrkbNlF3olnS6jqrDz84rGP635GzH4xQ2JVz/bYDGw6/RyYu6BwKwqJsYho1oIn5pWJtwG6eL4Sys
 WJAb+ARL9Ka4wQ5SjbYr73z0jlMszhtNG0g91E+gV/ngoX+TfzOw3D4uv9zhis07qCCrZd9mZ+HYWRB2t95Ix5qwHZnN7P6GbcP06CUCv3W3u8KpUPI+dEI0
 b7vGOZDkWvFsE1dmLjD9sCa6x/ZGIgVOw626FWzt8bTHFsqPP2Z98RzxcN50nCJkPPI4P7rtQrMlsZmhmzigHBYPfh6cR7KNLyviHXr0Ek3rvsLoxjZOhR9P
 ZAaqSLxwNMHu8kbI+D4pvREzqEx2gbSD1KX/g26bCR0cSsz8hqf0mItBK2Ua6ADVuO/ZaLWD+DrKIUrbYZn3vfZdKI8Mrv3xJUieHzHB/b6gDHFWvMdfKJii
 mpsBubC9N+hw7++PiHs0zH7FLmEY2rO4oZf0kE/dqwF7EyrF
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 Michel Lespinasse <walken@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMTEvMjAyMCAxNTo0MSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGUgbWVkaWEgbW9k
ZWwgYXNzdW1lcyB0aGF0IGJ1ZmZlcnMgYXJlIGFsbCBwcmVhbGxvY2F0ZWQsIHNvIHRoYXQKPiB3
aGVuIGEgbWVkaWEgcGlwZWxpbmUgaXMgcnVubmluZyB3ZSBuZXZlciBtaXNzIGEgZGVhZGxpbmUg
YmVjYXVzZSB0aGUKPiBidWZmZXJzIGFyZW4ndCBhbGxvY2F0ZWQgb3IgYXZhaWxhYmxlLgo+IAo+
IFRoaXMgbWVhbnMgd2UgY2Fubm90IGZpeCB0aGUgdjRsIGZvbGxvd19wZm4gdXNhZ2UgdGhyb3Vn
aAo+IG1tdV9ub3RpZmllciwgd2l0aG91dCBicmVha2luZyBob3cgdGhpcyBhbGwgd29ya3MuIFRo
ZSBvbmx5IHJlYWwgZml4Cj4gaXMgdG8gZGVwcmVjYXRlIHVzZXJwdHIgc3VwcG9ydCBmb3IgVk1f
SU8gfCBWTV9QRk5NQVAgbWFwcGluZ3MgYW5kCj4gdGVsbCBldmVyeW9uZSB0byBjdXQgb3ZlciB0
byBkbWEtYnVmIG1lbW9yeSBzaGFyaW5nIGZvciB6ZXJvY29weS4KPiAKPiB1c2VycHRyIGZvciBu
b3JtYWwgbWVtb3J5IHdpbGwga2VlcCB3b3JraW5nIGFzLWlzLCB0aGlzIG9ubHkgYWZmZWN0cwo+
IHRoZSB6ZXJvY29weSB1c2VycHRyIHVzYWdlIGVuYWJsZWQgaW4gNTBhYzk1MmQyMjYzICgiW21l
ZGlhXQo+IHZpZGVvYnVmMi1kbWEtc2c6IFN1cHBvcnQgaW8gdXNlcnB0ciBvcGVyYXRpb25zIG9u
IGlvIG1lbW9yeSIpLgo+IAo+IEFja2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0u
b3JnPgoKQWNrZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgoK
VGhhbmtzIQoKCUhhbnMKCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+IENj
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzogRGFuIFdpbGxpYW1zIDxk
YW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
PiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IEphbiBLYXJh
IDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogUGF3ZWwgT3NjaWFrIDxwYXdl
bEBvc2NpYWsuY29tPgo+IENjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3Vu
Zy5jb20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4g
Q2M6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+Cj4gQ2M6IExhdXJlbnQgRHVmb3Vy
IDxsZHVmb3VyQGxpbnV4LmlibS5jb20+Cj4gQ2M6IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1
c2UuY3o+Cj4gQ2M6IERhbmllbCBKb3JkYW4gPGRhbmllbC5tLmpvcmRhbkBvcmFjbGUuY29tPgo+
IENjOiBNaWNoZWwgTGVzcGluYXNzZSA8d2Fsa2VuQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAtLQo+IHYzOgo+IC0g
UmVmZXJlbmNlIHRoZSBjb21taXQgdGhhdCBlbmFibGVkIHRoZSB6ZXJvY29weSB1c2VycHRyIHVz
ZSBjYXNlIHRvCj4gICBtYWtlIGl0IGFidW5kYW5kdGx5IGNsZWFyIHRoYXQgdGhpcyBwYXRjaCBv
bmx5IGFmZmVjdHMgdGhhdCwgYW5kIG5vdAo+ICAgbm9ybWFsIG1lbW9yeSB1c2VycHRyLiBUaGUg
b2xkIGNvbW1pdCBtZXNzYWdlIGFscmVhZHkgZXhwbGFpbmVkIHRoYXQKPiAgIG5vcm1hbCBtZW1v
cnkgdXNlcnB0ciBpcyB1bmFmZmVjdGVkLCBidXQgSSBndWVzcyB0aGF0IHdhcyBub3QgY2xlYXIK
PiAgIGVub3VnaC4KPiAtLS0KPiAgZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1l
X3ZlY3Rvci5jIHwgMiArLQo+ICBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEt
Y29udGlnLmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1
ZjIvZnJhbWVfdmVjdG9yLmMgYi9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVf
dmVjdG9yLmMKPiBpbmRleCBhMGU2NTQ4MWEyMDEuLjFhODJlYzEzZWEwMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMKPiArKysgYi9k
cml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMKPiBAQCAtNzAsNyAr
NzAsNyBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25l
ZCBpbnQgbnJfZnJhbWVzLAo+ICAJCQlicmVhazsKPiAgCj4gIAkJd2hpbGUgKHJldCA8IG5yX2Zy
YW1lcyAmJiBzdGFydCArIFBBR0VfU0laRSA8PSB2bWEtPnZtX2VuZCkgewo+IC0JCQllcnIgPSBm
b2xsb3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOwo+ICsJCQllcnIgPSB1bnNhZmVfZm9s
bG93X3Bmbih2bWEsIHN0YXJ0LCAmbnVtc1tyZXRdKTsKPiAgCQkJaWYgKGVycikgewo+ICAJCQkJ
aWYgKHJldCA9PSAwKQo+ICAJCQkJCXJldCA9IGVycjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIGIvZHJpdmVycy9tZWRpYS92NGwy
LWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gaW5kZXggNTIzMTJjZTJiYTA1Li44MjFjNGE3
NmFiOTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1h
LWNvbnRpZy5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNv
bnRpZy5jCj4gQEAgLTE4Myw3ICsxODMsNyBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250
aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCj4gIAl1
c2VyX2FkZHJlc3MgPSB1bnRhZ2dlZF9iYWRkcjsKPiAgCj4gIAl3aGlsZSAocGFnZXNfZG9uZSA8
IChtZW0tPnNpemUgPj4gUEFHRV9TSElGVCkpIHsKPiAtCQlyZXQgPSBmb2xsb3dfcGZuKHZtYSwg
dXNlcl9hZGRyZXNzLCAmdGhpc19wZm4pOwo+ICsJCXJldCA9IHVuc2FmZV9mb2xsb3dfcGZuKHZt
YSwgdXNlcl9hZGRyZXNzLCAmdGhpc19wZm4pOwo+ICAJCWlmIChyZXQpCj4gIAkJCWJyZWFrOwo+
ICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
