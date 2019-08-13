Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383F8AE59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA4F6E037;
	Tue, 13 Aug 2019 05:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96046E037
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:02:06 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A49C206C2;
 Tue, 13 Aug 2019 05:02:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190813003352.GA235915@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-6-brendanhiggins@google.com>
 <20190812235701.533E82063F@mail.kernel.org>
 <20190813003352.GA235915@google.com>
Subject: Re: [PATCH v12 05/18] kunit: test: add the concept of expectations
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 22:02:05 -0700
Message-Id: <20190813050206.2A49C206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565672526;
 bh=VlB5crXiwSSXpj9OJzMKtvlRZYtABRaxOaHE9tvmNvQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CWjDW5KmpM1E7Bx+UYTB4tyPDejc2fEUptE5IcAkuGvU7mUfDgTAAhTueY0gTM5ZJ
 Lf7aINsUW0IO9cUIA9NGU6yHEm7BhE7QOER+LlRbYnrOJlgvwyaBWpzcuKPKNq9Pqu
 6jAUm8V4d6UWvUCRS3+itnRHBDP2BfyVmt1mXiAY=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTc6MzM6NTIpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgMDQ6NTc6MDBQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4g
UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDgpCj4gPiA+ICsgKi8K
PiA+ID4gKyNkZWZpbmUgS1VOSVRfRVhQRUNUX1RSVUUodGVzdCwgY29uZGl0aW9uKSBcCj4gPiA+
ICsgICAgICAgICAgICAgICBLVU5JVF9UUlVFX0FTU0VSVElPTih0ZXN0LCBLVU5JVF9FWFBFQ1RB
VElPTiwgY29uZGl0aW9uKQo+ID4gCj4gPiBBIGxvdCBvZiB0aGVzZSBtYWNyb3Mgc2VlbSBkb3Vi
bGUgaW5kZW50ZWQuCj4gCj4gSW4gYSBjYXNlIHlvdSBwb2ludGVkIG91dCBpbiB0aGUgcHJlY2Vk
aW5nIHBhdGNoLCBJIHdhcyBqdXN0IGtlZXBpbmcgdGhlCj4gYXJndW1lbnRzIGNvbHVtbiBhbGln
bmVkLgo+IAo+IEluIHRoaXMgY2FzZSBJIGFtIGp1c3QgaW5kZW50aW5nIHR3byB0YWJzIGZvciBh
IGxpbmUgY29udGludWF0aW9uLiBJCj4gdGhvdWdodCBJIGZvdW5kIG90aGVyIGluc3RhbmNlcyBp
biB0aGUga2VybmVsIHRoYXQgZGlkIHRoaXMgZWFybHkgb24KPiAoYW5kIHRoYXQncyBhbHNvIHdo
YXQgdGhlIExpbnV4IGtlcm5lbCB2aW0gcGx1Z2luIHdhbnRlZCBtZSB0byBkbykuCj4gQWZ0ZXIg
YSBjb3VwbGUgb2Ygc3BvdCBjaGVja3MsIGl0IHNlZW1zIGxpa2Ugb25lIHRhYiBmb3IgdGhpcyBr
aW5kIG9mCj4gbGluZSBjb250aW51YXRpb24gc2VlbXMgbW9yZSBjb21tb24uIEkgcGVyc29uYWxs
eSBkb24ndCBmZWVsIHN0cm9uZ2x5Cj4gYWJvdXQgYW55IHBhcnRpY3VsYXIgdmVyc2lvbi4gSSBq
dXN0IHdhbnQgdG8ga25vdyBub3cgd2hhdCB0aGUgY29ycmVjdAo+IGluZGVudGF0aW9uIGlzIGZv
ciBtYWNyb3MgYmVmb3JlIEkgZ28gdGhyb3VnaCBhbmQgY2hhbmdlIHRoZW0gYWxsLgo+IAo+IEkg
dGhpbmsgdGhlcmUgYXJlIHRocmVlIGNhc2VzOgo+IAo+ICNkZWZpbmUgbWFjcm8wKHBhcmFtMCwg
cGFyYW0xKSBcCj4gICAgICAgICAgICAgICAgIGFfcmVhbGx5X2xvbmdfbWFjcm8oLi4uKQo+IAo+
IEluIHRoaXMgZmlyc3QgY2FzZSwgSSB1c2UgdHdvIHRhYnMgZm9yIHRoZSBmaXJzdCBpbmRlbnQs
IEkgdGhpbmsgeW91IGFyZQo+IHRlbGxpbmcgbWUgdGhpcyBzaG91bGQgYmUgb25lIHRhYi4KClll
cy4gU2hvdWxkIGJlIG9uZS4KCj4gCj4gI2RlZmluZSBtYWNybzEocGFyYW0wLCBwYXJhbTEpIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAg
IHN0YXRlbWVudF9pbl9hX2Jsb2NrMDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICAgICAgICAgc3RhdGVtZW50X2luX2FfYmxvY2sxOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAuLi4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiB9Cj4gCj4gSW4gdGhpcyBjYXNlLCBldmVyeSBsaW5lIGlzIGluIGEgYmxv
Y2sgYW5kIGlzIGluZGVudGVkIGFzIGl0IHdvdWxkIGJlIGluCj4gYSBmdW5jdGlvbiBib2R5LiBJ
IHRoaW5rIHlvdSBhcmUgb2theSB3aXRoIHRoaXMsIGFuZCBub3cgdGhhdCBJIGFtCj4gdGhpbmtp
bmcgYWJvdXQgaXQsIHdoYXQgSSB0aGluayB5b3UgYXJlIHByb3Bvc2luZyBmb3IgbWFjcm8wIHdp
bGwgbWFrZQo+IHRoZXNlIHR3byBjYXNlcyBtb3JlIGNvbnNpc3RlbnQuCj4gCj4gI2RlZmluZSBt
YWNybzIocGFyYW0wLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICBwYXJhbTEsICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAg
IHBhcmFtMiwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICAgICAgICAgcGFyYW0zLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAuLi4s
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICAgICAgICAgICAgICAgIHBhcmFtbikgLi4uICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gCj4gSW4gdGhpcyBsYXN0IGNhc2UsIHRo
ZSBib2R5IHdvdWxkIGJlIGluZGVudGVkIGFzIGluIG1hY3JvMCwgb3IgbWFjcm8xLAo+IGJ1dCB0
aGUgcGFyYW1ldGVycyBwYXNzZWQgaW50byB0aGUgbWFjcm8gYXJlIGNvbHVtbiBhbGlnbmVkLCBj
b25zaXN0ZW50Cj4gd2l0aCBvbmUgb2YgdGhlIGFjY2VwdGFibGUgd2F5cyBvZiBmb3JtYXR0aW5n
IGZ1bmN0aW9uIHBhcmFtZXRlcnMgdGhhdAo+IGRvbid0IGZpdCBvbiBhIHNpbmdsZSBsaW5lLgo+
IAo+IEluIGFsbCBjYXNlcywgSSBwdXQgMSBzcGFjZSBpbiBiZXR3ZWVuIHRoZSBjbG9zaW5nIHBh
cmFtZXRlciBwYXJlbiBhbmQKPiB0aGUgbGluZSBjb250aW51YXRpb24gYFxgLCBpZiBvbmx5IG9u
ZSBgXGAgaXMgbmVlZGVkLiBPdGhlcndpc2UsIEkgYWxpZ24KPiBhbGwgdGhlIGBcc2AgdG8gdGhl
IDgwdGggY29sdW1uLiBJcyB0aGlzIG9rYXksIG9yIHdvdWxkIHlvdSBwcmVmZXIgdGhhdAo+IEkg
YWxpZ24gdGhlbSBhbGwgdG8gdGhlIDgwdGggY29sdW1uLCBvciBzb21ldGhpbmcgZWxzZT8KPiAK
ClRoaXMgYWxsIHNvdW5kcyBmaW5lIGFuZCBJJ20gbm90IG5pdHBpY2tpbmcgdGhpcyBzdHlsZS4g
SnVzdCB0aGUgZG91YmxlCnRhYnMgbWFraW5nIGxpbmVzIGxvbmdlciB0aGFuIHJlcXVpcmVkLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
