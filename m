Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC81A3C9
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 22:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ED86E7B5;
	Fri, 10 May 2019 20:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330D86E7B5;
 Fri, 10 May 2019 20:13:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 79FDD307D913;
 Fri, 10 May 2019 20:13:35 +0000 (UTC)
Received: from redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 360161A267;
 Fri, 10 May 2019 20:13:34 +0000 (UTC)
Date: Fri, 10 May 2019 16:13:32 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Message-ID: <20190510201331.GF4507@redhat.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-2-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510195258.9930-2-Felix.Kuehling@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 10 May 2019 20:13:35 +0000 (UTC)
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6NTM6MjNQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+IAo+IFdo
aWxlIHRoZSBwYWdlIGlzIG1pZ3JhdGluZyBieSBOVU1BIGJhbGFuY2luZywgSE1NIGZhaWxlZCB0
byBkZXRlY3QgdGhpcwo+IGNvbmRpdGlvbiBhbmQgc3RpbGwgcmV0dXJuIHRoZSBvbGQgcGFnZS4g
QXBwbGljYXRpb24gd2lsbCB1c2UgdGhlIG5ldwo+IHBhZ2UgbWlncmF0ZWQsIGJ1dCBkcml2ZXIg
cGFzcyB0aGUgb2xkIHBhZ2UgcGh5c2ljYWwgYWRkcmVzcyB0byBHUFUsCj4gdGhpcyBjcmFzaCB0
aGUgYXBwbGljYXRpb24gbGF0ZXIuCj4gCj4gVXNlIHB0ZV9wcm90bm9uZShwdGUpIHRvIHJldHVy
biB0aGlzIGNvbmRpdGlvbiBhbmQgdGhlbiBobW1fdm1hX2RvX2ZhdWx0Cj4gd2lsbCBhbGxvY2F0
ZSBuZXcgcGFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdA
YW1kLmNvbT4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KCj4gLS0tCj4gIG1tL2htbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0u
Ywo+IGluZGV4IDc1ZDJlYTkwNmVmYi4uYjY1YzI3ZDVjMTE5IDEwMDY0NAo+IC0tLSBhL21tL2ht
bS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtNTU0LDcgKzU1NCw3IEBAIHN0YXRpYyBpbnQgaG1t
X3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLAo+ICAKPiAgc3RhdGljIGlubGlu
ZSB1aW50NjRfdCBwdGVfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwg
cHRlX3QgcHRlKQo+ICB7Cj4gLQlpZiAocHRlX25vbmUocHRlKSB8fCAhcHRlX3ByZXNlbnQocHRl
KSkKPiArCWlmIChwdGVfbm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpIHx8IHB0ZV9wcm90
bm9uZShwdGUpKQo+ICAJCXJldHVybiAwOwo+ICAJcmV0dXJuIHB0ZV93cml0ZShwdGUpID8gcmFu
Z2UtPmZsYWdzW0hNTV9QRk5fVkFMSURdIHwKPiAgCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1dS
SVRFXSA6Cj4gLS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
