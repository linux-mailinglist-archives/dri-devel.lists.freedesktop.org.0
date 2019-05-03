Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A0127EA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E8895C1;
	Fri,  3 May 2019 06:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E664895C1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 06:42:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8DA92075E;
 Fri,  3 May 2019 06:42:42 +0000 (UTC)
Date: Fri, 3 May 2019 08:42:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190503064241.GC20723@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
 <CAFd5g471Wawu6g14p0AO3aY8VPBKLA0mjHSdfR1qStFGzp3iGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g471Wawu6g14p0AO3aY8VPBKLA0mjHSdfR1qStFGzp3iGQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556865763;
 bh=eSwQ5MQqLLW9fJpp5z5L5wdOX/D46QfRbdkcz2wVbPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8bRpPlYbJzGxvGVmp2uL9uXUULFTshM8QSJGuUzKTk19JZNQGVZMB/Y6WWZUO0Xk
 +Bv6ggtukUnBovktNVzoNapiH66e7QwUF2ou6Nv/zJgv58EYkE7vJAmpFpEvKEp4BX
 kligVpalV/krymcpGsId8WYpq006/flMnMSyr3rA=
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Iurii Zaikin <yzaikin@google.com>, Jeff Dike <jdike@addtoit.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6NDU6NDNBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFRodSwgTWF5IDIsIDIwMTkgYXQgMTE6MTUgQU0gPFRpbS5CaXJkQHNvbnku
Y29tPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
PiA+ID4gRnJvbTogR3JlZyBLSAo+ID4gPgo+ID4gPiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAw
NDowMToyNVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiA+ID4gRnJvbTogSXVy
aWkgWmFpa2luIDx5emFpa2luQGdvb2dsZS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBLVW5pdCB0ZXN0
cyBmb3IgaW5pdGlhbGl6ZWQgZGF0YSBiZWhhdmlvciBvZiBwcm9jX2RvaW50dmVjIHRoYXQgaXMK
PiA+ID4gPiBleHBsaWNpdGx5IGNoZWNrZWQgaW4gdGhlIGNvZGUuIEluY2x1ZGVzIGJhc2ljIHBh
cnNpbmcgdGVzdHMgaW5jbHVkaW5nCj4gPiA+ID4gaW50IG1pbi9tYXggb3ZlcmZsb3cuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNv
bT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5z
QGdvb2dsZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGtlcm5lbC9NYWtlZmlsZSAgICAgIHwg
ICAyICsKPiA+ID4gPiAga2VybmVsL3N5c2N0bC10ZXN0LmMgfCAyOTIKPiA+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBsaWIvS2NvbmZpZy5k
ZWJ1ZyAgICB8ICAgNiArCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzAwIGluc2VydGlvbnMo
KykKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zeXNjdGwtdGVzdC5jCj4gPiA+
ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL01ha2VmaWxlIGIva2VybmVsL01ha2VmaWxl
Cj4gPiA+ID4gaW5kZXggNmM1N2U3ODgxN2RhZC4uYzgxYTg5NzZiNmE0YiAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9rZXJuZWwvTWFrZWZpbGUKPiA+ID4gPiArKysgYi9rZXJuZWwvTWFrZWZpbGUKPiA+
ID4gPiBAQCAtMTEyLDYgKzExMiw4IEBAIG9iai0kKENPTkZJR19IQVNfSU9NRU0pICs9IGlvbWVt
Lm8KPiA+ID4gPiAgb2JqLSQoQ09ORklHX1pPTkVfREVWSUNFKSArPSBtZW1yZW1hcC5vCj4gPiA+
ID4gIG9iai0kKENPTkZJR19SU0VRKSArPSByc2VxLm8KPiA+ID4gPgo+ID4gPiA+ICtvYmotJChD
T05GSUdfU1lTQ1RMX0tVTklUX1RFU1QpICs9IHN5c2N0bC10ZXN0Lm8KPiA+ID4KPiA+ID4gWW91
IGFyZSBnb2luZyB0byBoYXZlIHRvIGhhdmUgYSAic3RhbmRhcmQiIG5hbWluZyBzY2hlbWUgZm9y
IHRlc3QKPiA+ID4gbW9kdWxlcywgYXJlIHlvdSBnb2luZyB0byByZWNvbW1lbmQgImZvby10ZXN0
IiBvdmVyICJ0ZXN0LWZvbyI/ICBJZiBzbywKPiA+ID4gdGhhdCdzIGZpbmUsIHdlIHNob3VsZCBq
dXN0IGJlIGNvbnNpc3RhbnQgYW5kIGRvY3VtZW50IGl0IHNvbWV3aGVyZS4KPiA+ID4KPiA+ID4g
UGVyc29uYWxseSwgSSdkIHByZWZlciAidGVzdC1mb28iLCBidXQgdGhhdCdzIGp1c3QgbWUsIG5h
bWluZyBpcyBoYXJkLi4uCj4gPgo+ID4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSAidGVzdC1mb28i
IGFzIHdlbGwuICBKdXN0IG15IDIgY2VudHMuCj4gCj4gSSBkZWZpbml0ZWx5IGFncmVlIHdlIHNo
b3VsZCBiZSBjb25zaXN0ZW50LiBNeSBwZXJzb25hbCBiaWFzCj4gKHVuc3VycHJpc2luZ2x5KSBp
cyAiZm9vLXRlc3QsIiBidXQgdGhpcyBpcyBqdXN0IGJlY2F1c2UgdGhhdCBpcyB0aGUKPiBjb252
ZW50aW9uIEkgYW0gdXNlZCB0byBpbiBvdGhlciBwcm9qZWN0cyBJIGhhdmUgd29ya2VkIG9uLgo+
IAo+IE9uIGFuIHVuYmlhc2VkIG5vdGUsIHdlIGFyZSBjdXJyZW50bHkgYWxtb3N0IGV2ZW5seSBz
cGxpdCBiZXR3ZWVuIHRoZQo+IHR3byBjb252ZW50aW9ucyB3aXRoICpzbGlnaHQqIHByZWZlcmVu
Y2UgZm9yICJmb28tdGVzdCI6IEkgcmFuIHRoZSB0d28KPiBmb2xsb3dpbmcgZ3JlcCBjb21tYW5k
cyBvbiB2NS4xLXJjNzoKPiAKPiBncmVwIC1Icm4gLS1leGNsdWRlLWRpcj0iYnVpbGQiIC1lICJj
b25maWcgW2EtekEtWl8wLTldXCtfVEVTVCQiIHwgd2MgLWwKPiBncmVwIC1Icm4gLS1leGNsdWRl
LWRpcj0iYnVpbGQiIC1lICJjb25maWcgVEVTVF9bYS16QS1aXzAtOV1cKyIgfCB3YyAtbAo+IAo+
ICJmb28tdGVzdCIgaGFzIDM2IG9jY3VycmVuY2VzLgo+ICJ0ZXN0LWZvbyIgaGFzIDMzIG9jY3Vy
cmVuY2VzLgo+IAo+IFRoZSB0aGluZ3MgSSBhbSBtb3JlIGNvbmNlcm5lZCBhYm91dCBpcyBob3cg
dGhpcyB3b3VsZCBhZmZlY3QgZmlsZQo+IG5hbWluZy4gSWYgd2UgaGF2ZSBhIHVuaXQgdGVzdCBm
b3IgZm9vLmMsIEkgdGhpbmsgZm9vX3Rlc3QuYyBpcyBtb3JlCj4gY29uc2lzdGVudCB3aXRoIG91
ciBuYW1lc3BhY2luZyBjb252ZW50aW9ucy4gVGhlIG90aGVyIHRoaW5nLCBpcyBpZiB3ZQo+IGFs
cmVhZHkgaGF2ZSBhIEtjb25maWcgc3ltYm9sIGNhbGxlZCBGT09fVEVTVCAob3IgVEVTVF9GT08p
IHdoYXQKPiBzaG91bGQgd2UgbmFtZSB0aGUgS1VuaXQgdGVzdCBpbiB0aGlzIGNhc2U/IEZPT19V
TklUX1RFU1Q/Cj4gRk9PX0tVTklUX1RFU1QsIGxpa2UgSSBkaWQgYWJvdmU/CgpPaywgSSBjYW4g
bGl2ZSB3aXRoICJmb28tdGVzdCIsIGFzIHlvdSBhcmUgcmlnaHQsIGluIGEgZGlyZWN0b3J5IGxp
c3RpbmcKYW5kIGNvbmZpZyBvcHRpb24sIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gYWRkIGl0IGFz
IGEgc3VmZml4LgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
