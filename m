Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCB13940
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 12:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A734D892A8;
	Sat,  4 May 2019 10:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E237892A8
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 10:40:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21B9B206DF;
 Sat,  4 May 2019 10:40:14 +0000 (UTC)
Date: Sat, 4 May 2019 12:40:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190504104012.GA1478@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
 <CAFd5g471Wawu6g14p0AO3aY8VPBKLA0mjHSdfR1qStFGzp3iGQ@mail.gmail.com>
 <20190503064241.GC20723@kroah.com>
 <CAFd5g44NrKM9WQCF1xW-BWpFNsC05UAS9jt1-S+vNRuBDZVsHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g44NrKM9WQCF1xW-BWpFNsC05UAS9jt1-S+vNRuBDZVsHQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556966414;
 bh=ZtaXllWS1pW5iu83jiogyXoGhA2z0cHfZWqL2iOl0tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RMn5lzZLL3HFn059n+mYYbCZCfCFSbJL0BubXf+7IIzwGpN3fTwhTfeyIKdjim/HM
 zSpglcbIOjRyWHBccdUctPLb1/x4vk8bwpbvSIIaVSe3FuovZlhDX5c5EOmjT62X7z
 PNcd1lmo3U/hgtHtLZnjopNCJ8osmB6ssQVrxqhc=
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
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
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

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDQ6NDE6MTBQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6NDU6NDNBTSAtMDcwMCwgQnJl
bmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDExOjE1IEFN
IDxUaW0uQmlyZEBzb255LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gRnJvbTogR3JlZyBLSAo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA0OjAxOjI1UE0gLTA3
MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gPiA+ID4gRnJvbTogSXVyaWkgWmFpa2lu
IDx5emFpa2luQGdvb2dsZS5jb20+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEtVbml0IHRlc3Rz
IGZvciBpbml0aWFsaXplZCBkYXRhIGJlaGF2aW9yIG9mIHByb2NfZG9pbnR2ZWMgdGhhdCBpcwo+
ID4gPiA+ID4gPiBleHBsaWNpdGx5IGNoZWNrZWQgaW4gdGhlIGNvZGUuIEluY2x1ZGVzIGJhc2lj
IHBhcnNpbmcgdGVzdHMgaW5jbHVkaW5nCj4gPiA+ID4gPiA+IGludCBtaW4vbWF4IG92ZXJmbG93
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJdXJpaSBaYWlraW4gPHl6
YWlraW5AZ29vZ2xlLmNvbT4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdn
aW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ID4gIGtlcm5lbC9NYWtlZmlsZSAgICAgIHwgICAyICsKPiA+ID4gPiA+ID4gIGtlcm5lbC9zeXNj
dGwtdGVzdC5jIHwgMjkyCj4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gPiA+ICBsaWIvS2NvbmZpZy5kZWJ1ZyAgICB8ICAgNiArCj4g
PiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMwMCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQga2VybmVsL3N5c2N0bC10ZXN0LmMKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9NYWtlZmlsZSBiL2tlcm5lbC9NYWtlZmlsZQo+
ID4gPiA+ID4gPiBpbmRleCA2YzU3ZTc4ODE3ZGFkLi5jODFhODk3NmI2YTRiIDEwMDY0NAo+ID4g
PiA+ID4gPiAtLS0gYS9rZXJuZWwvTWFrZWZpbGUKPiA+ID4gPiA+ID4gKysrIGIva2VybmVsL01h
a2VmaWxlCj4gPiA+ID4gPiA+IEBAIC0xMTIsNiArMTEyLDggQEAgb2JqLSQoQ09ORklHX0hBU19J
T01FTSkgKz0gaW9tZW0ubwo+ID4gPiA+ID4gPiAgb2JqLSQoQ09ORklHX1pPTkVfREVWSUNFKSAr
PSBtZW1yZW1hcC5vCj4gPiA+ID4gPiA+ICBvYmotJChDT05GSUdfUlNFUSkgKz0gcnNlcS5vCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICtvYmotJChDT05GSUdfU1lTQ1RMX0tVTklUX1RFU1QpICs9
IHN5c2N0bC10ZXN0Lm8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZb3UgYXJlIGdvaW5nIHRvIGhhdmUg
dG8gaGF2ZSBhICJzdGFuZGFyZCIgbmFtaW5nIHNjaGVtZSBmb3IgdGVzdAo+ID4gPiA+ID4gbW9k
dWxlcywgYXJlIHlvdSBnb2luZyB0byByZWNvbW1lbmQgImZvby10ZXN0IiBvdmVyICJ0ZXN0LWZv
byI/ICBJZiBzbywKPiA+ID4gPiA+IHRoYXQncyBmaW5lLCB3ZSBzaG91bGQganVzdCBiZSBjb25z
aXN0YW50IGFuZCBkb2N1bWVudCBpdCBzb21ld2hlcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUGVy
c29uYWxseSwgSSdkIHByZWZlciAidGVzdC1mb28iLCBidXQgdGhhdCdzIGp1c3QgbWUsIG5hbWlu
ZyBpcyBoYXJkLi4uCj4gPiA+ID4KPiA+ID4gPiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlICJ0ZXN0
LWZvbyIgYXMgd2VsbC4gIEp1c3QgbXkgMiBjZW50cy4KPiA+ID4KPiA+ID4gSSBkZWZpbml0ZWx5
IGFncmVlIHdlIHNob3VsZCBiZSBjb25zaXN0ZW50LiBNeSBwZXJzb25hbCBiaWFzCj4gPiA+ICh1
bnN1cnByaXNpbmdseSkgaXMgImZvby10ZXN0LCIgYnV0IHRoaXMgaXMganVzdCBiZWNhdXNlIHRo
YXQgaXMgdGhlCj4gPiA+IGNvbnZlbnRpb24gSSBhbSB1c2VkIHRvIGluIG90aGVyIHByb2plY3Rz
IEkgaGF2ZSB3b3JrZWQgb24uCj4gPiA+Cj4gPiA+IE9uIGFuIHVuYmlhc2VkIG5vdGUsIHdlIGFy
ZSBjdXJyZW50bHkgYWxtb3N0IGV2ZW5seSBzcGxpdCBiZXR3ZWVuIHRoZQo+ID4gPiB0d28gY29u
dmVudGlvbnMgd2l0aCAqc2xpZ2h0KiBwcmVmZXJlbmNlIGZvciAiZm9vLXRlc3QiOiBJIHJhbiB0
aGUgdHdvCj4gPiA+IGZvbGxvd2luZyBncmVwIGNvbW1hbmRzIG9uIHY1LjEtcmM3Ogo+ID4gPgo+
ID4gPiBncmVwIC1Icm4gLS1leGNsdWRlLWRpcj0iYnVpbGQiIC1lICJjb25maWcgW2EtekEtWl8w
LTldXCtfVEVTVCQiIHwgd2MgLWwKPiA+ID4gZ3JlcCAtSHJuIC0tZXhjbHVkZS1kaXI9ImJ1aWxk
IiAtZSAiY29uZmlnIFRFU1RfW2EtekEtWl8wLTldXCsiIHwgd2MgLWwKPiA+ID4KPiA+ID4gImZv
by10ZXN0IiBoYXMgMzYgb2NjdXJyZW5jZXMuCj4gPiA+ICJ0ZXN0LWZvbyIgaGFzIDMzIG9jY3Vy
cmVuY2VzLgo+ID4gPgo+ID4gPiBUaGUgdGhpbmdzIEkgYW0gbW9yZSBjb25jZXJuZWQgYWJvdXQg
aXMgaG93IHRoaXMgd291bGQgYWZmZWN0IGZpbGUKPiA+ID4gbmFtaW5nLiBJZiB3ZSBoYXZlIGEg
dW5pdCB0ZXN0IGZvciBmb28uYywgSSB0aGluayBmb29fdGVzdC5jIGlzIG1vcmUKPiA+ID4gY29u
c2lzdGVudCB3aXRoIG91ciBuYW1lc3BhY2luZyBjb252ZW50aW9ucy4gVGhlIG90aGVyIHRoaW5n
LCBpcyBpZiB3ZQo+ID4gPiBhbHJlYWR5IGhhdmUgYSBLY29uZmlnIHN5bWJvbCBjYWxsZWQgRk9P
X1RFU1QgKG9yIFRFU1RfRk9PKSB3aGF0Cj4gPiA+IHNob3VsZCB3ZSBuYW1lIHRoZSBLVW5pdCB0
ZXN0IGluIHRoaXMgY2FzZT8gRk9PX1VOSVRfVEVTVD8KPiA+ID4gRk9PX0tVTklUX1RFU1QsIGxp
a2UgSSBkaWQgYWJvdmU/Cj4gPgo+ID4gT2ssIEkgY2FuIGxpdmUgd2l0aCAiZm9vLXRlc3QiLCBh
cyB5b3UgYXJlIHJpZ2h0LCBpbiBhIGRpcmVjdG9yeSBsaXN0aW5nCj4gPiBhbmQgY29uZmlnIG9w
dGlvbiwgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBhZGQgaXQgYXMgYSBzdWZmaXguCj4gCj4gQ29v
bCwgc28ganVzdCBmb3IgZnV0dXJlIHJlZmVyZW5jZSwgaWYgd2UgYWxyZWFkeSBoYXZlIGEgS2Nv
bmZpZwo+IHN5bWJvbCBjYWxsZWQgRk9PX1RFU1QgKG9yIFRFU1RfRk9PKSB3aGF0IHNob3VsZCB3
ZSBuYW1lIHRoZSBLVW5pdAo+IHRlc3QgaW4gdGhpcyBjYXNlPyBGT09fVU5JVF9URVNUPyBGT09f
S1VOSVRfVEVTVCwgbGlrZSBJIGRpZCBhYm92ZT8KCkZPT19LVU5JVF9URVNUIGlzIGZpbmUsIEkg
ZG91YnQgdGhhdCdzIGdvaW5nIHRvIGNvbWUgdXAgdmVyeSBvZnRlbi4KCnRoYW5rcywKCmdyZWcg
ay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
