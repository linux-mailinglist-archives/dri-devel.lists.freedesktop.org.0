Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C7253F3
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7A89330;
	Tue, 21 May 2019 15:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40089330;
 Tue, 21 May 2019 15:32:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18E00883D7;
 Tue, 21 May 2019 15:32:05 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1505C5378A;
 Tue, 21 May 2019 15:32:02 +0000 (UTC)
Date: Tue, 21 May 2019 11:32:00 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/4] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190521153200.GB3836@redhat.com>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190520213945.17046-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520213945.17046-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 21 May 2019 15:32:12 +0000 (UTC)
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSBpbXBsZW1lbnRhdGlvbnMgZG9uJ3QgY2hlYXQg
YW5kIGRvbid0IGhhdmUgYQo+IHBvc3NpYmxlIHNjaGVkdWxlL2Jsb2NraW5nIHBvaW50IGRlZXBs
eSBidXJyaWVkIHdoZXJlIHJldmlldyBjYW4ndAo+IGNhdGNoIGl0Lgo+IAo+IEknbSBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgaXMgdGhlIGJlc3Qgd2F5IHRvIG1ha2Ugc3VyZSBhbGwgdGhlCj4gbWln
aHRfc2xlZXAoKSBjYWxsc2l0ZXMgdHJpZ2dlciwgYW5kIGl0J3MgYSBiaXQgdWdseSBpbiB0aGUg
Y29kZSBmbG93Lgo+IEJ1dCBpdCBnZXRzIHRoZSBqb2IgZG9uZS4KPiAKPiBJbnNwaXJlZCBieSBh
biBpOTE1IHBhdGNoIHNlcmllcyB3aGljaCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQo+
IHJ1bGVzIGhhdmVuJ3QgYmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KPiAKPiB2MjogVXNlIHRo
ZSBzaGlueSBuZXcgbm9uX2Jsb2NrX3N0YXJ0L2VuZCBhbm5vdGF0aW9ucyBpbnN0ZWFkIG9mCj4g
YWJ1c2luZyBwcmVlbXB0X2Rpc2FibGUvZW5hYmxlLgo+IAo+IHYzOiBSZWJhc2Ugb24gdG9wIG9m
IEdsaXNzZSdzIGFyZyByZXdvcmsuCj4gCj4gdjQ6IFJlYmFzZSBvbiB0b3Agb2YgbW9yZSBHbGlz
c2UgcmV3b3JrLgo+IAo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBDYzogRGF2aWQgUmll
bnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+
IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICBtbS9tbXVfbm90aWZpZXIuYyB8IDgg
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3RpZmllci5j
Cj4gaW5kZXggYzA1ZTQwNmE3Y2Q3Li5hMDllNzM3NzExZDUgMTAwNjQ0Cj4gLS0tIGEvbW0vbW11
X25vdGlmaWVyLmMKPiArKysgYi9tbS9tbXVfbm90aWZpZXIuYwo+IEBAIC0xNzYsNyArMTc2LDEz
IEBAIGludCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVf
bm90aWZpZXJfcmFuZ2UgKnJhbmdlKQo+ICAJaWQgPSBzcmN1X3JlYWRfbG9jaygmc3JjdSk7Cj4g
IAlobGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UobW4sICZyYW5nZS0+bW0tPm1tdV9ub3RpZmllcl9t
bS0+bGlzdCwgaGxpc3QpIHsKPiAgCQlpZiAobW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFy
dCkgewo+IC0JCQlpbnQgX3JldCA9IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQobW4s
IHJhbmdlKTsKPiArCQkJaW50IF9yZXQ7Cj4gKwo+ICsJCQlpZiAoIW1tdV9ub3RpZmllcl9yYW5n
ZV9ibG9ja2FibGUocmFuZ2UpKQo+ICsJCQkJbm9uX2Jsb2NrX3N0YXJ0KCk7Cj4gKwkJCV9yZXQg
PSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1uLCByYW5nZSk7Cj4gKwkJCWlmICgh
bW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCj4gKwkJCQlub25fYmxvY2tfZW5k
KCk7CgpUaGlzIGlzIGEgdGFzdGUgdGhpbmcgc28gZmVlbCBmcmVlIHRvIGlnbm9yZSBpdCBhcyBt
YXliZSBvdGhlcgp3aWxsIGRpc2xpa2UgbW9yZSB3aGF0IGkgcHJlZmVyOgoKKwkJCWlmICghbW11
X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpIHsKKwkJCQlub25fYmxvY2tfc3RhcnQo
KTsKKwkJCQlfcmV0ID0gbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydChtbiwgcmFuZ2Up
OworCQkJCW5vbl9ibG9ja19lbmQoKTsKKwkJCX0gZWxzZQorCQkJCV9yZXQgPSBtbi0+b3BzLT5p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1uLCByYW5nZSk7CgpJZiBvbmx5IHdlIGhhZCBwcmVkaWNh
dGUgb24gQ1BVIGxpa2Ugb24gR1BVIDopCgpJbiBhbnkgY2FzZToKClJldmlld2VkLWJ5OiBKw6ly
w7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KCgo+ICAJCQlpZiAoX3JldCkgewo+ICAJ
CQkJcHJfaW5mbygiJXBTIGNhbGxiYWNrIGZhaWxlZCB3aXRoICVkIGluICVzYmxvY2thYmxlIGNv
bnRleHQuXG4iLAo+ICAJCQkJCW1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQsIF9yZXQs
Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
