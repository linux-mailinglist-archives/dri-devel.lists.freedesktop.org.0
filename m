Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F6C411B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 21:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43D6E220;
	Tue,  1 Oct 2019 19:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFA56E220;
 Tue,  1 Oct 2019 19:34:29 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EB7020B7C;
 Tue,  1 Oct 2019 19:34:29 +0000 (UTC)
Date: Tue, 1 Oct 2019 14:34:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20191001193427.GA59137@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tvjFPAMgz6DMGmJQ3adtJBX6yYnFRO9gVBEpMVTEBu0og@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569958469;
 bh=X0ODSdcm/NVAagYO7ccY+UsMr3yH1nYd7QAe62Cvk1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=g55px0NQzX8MpOTtfvfb2etHfMWOg3sxn8w/FHf64rDOsoeZP9nBWtFbiC8JWfXmA
 B6U37pYseJdyozoirhZjl0l6K9O2pJSUV+k2BLC+nFKaRvlbZnNTgawggYkrFslod+
 oDZFmAwT0dHjVmduL4xiAnV/WWz1VDYFx31vJTCY=
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDY6MjE6MjhQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDEsIDIwMTkgYXQgMzoyNyBQTSBCam9ybiBIZWxnYWFzIDxoZWxn
YWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDY6MzY6
MTJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiBPbiBNb24sIFNlcCAzMCwgMjAx
OSBhdCA2OjMwIFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBh
dCAwNjowNToxNFBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gPiBzdGlsbCBo
YXBwZW5zIHdpdGggeW91ciBwYXRjaCBhcHBsaWVkLiBUaGUgbWFjaGluZSBzaW1wbHkgZ2V0cyBz
aHV0IGRvd24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gZG1lc2cgY2FuIGJlIGZvdW5kIGhlcmU6Cj4g
PiA+ID4gPiBodHRwczovL2dpc3QuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2thcm9saGVyYnN0LzQw
ZWIwOTFjN2I3YjMzZWY5OTM1MjVkZTY2MGYxYTNiL3Jhdy8yMzgwZTMxZjU2NmU5M2U1YmE3Yzg3
ZWY1NDU0MjA5NjVkNGM0OTJjL2dpc3RmaWxlMS50eHQKPiA+ID4gPgo+ID4gPiA+IExvb2tpbmcg
eW91ciBkbWVzZzoKPiA+ID4gPgo+ID4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IG5vdXZl
YXUgMDAwMDowMTowMC4wOiBEUk06IERDQiB2ZXJzaW9uIDQuMQo+ID4gPiA+IFNlcCAzMCAxNzoy
NDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IE1NOiB1c2luZyBDT1BZIGZv
ciBidWZmZXIgY29waWVzCj4gPiA+ID4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogW2RybV0gSW5p
dGlhbGl6ZWQgbm91dmVhdSAxLjMuMSAyMDEyMDgwMSBmb3IgMDAwMDowMTowMC4wIG9uIG1pbm9y
IDEKPiA+ID4gPgo+ID4gPiA+IEkgd291bGQgYXNzdW1lIGl0IHJ1bnRpbWUgc3VzcGVuZHMgaGVy
ZS4gVGhlbiBpdCB3YWtlcyB1cCBiZWNhdXNlIG9mIFBDSQo+ID4gPiA+IGFjY2VzcyBmcm9tIHVz
ZXJzcGFjZToKPiA+ID4gPgo+ID4gPiA+IFNlcCAzMCAxNzoyNDo0MiBrZXJuZWw6IHBjaV9yYXdf
c2V0X3Bvd2VyX3N0YXRlOiA1NiBjYWxsYmFja3Mgc3VwcHJlc3NlZAo+ID4gPiA+Cj4gPiA+ID4g
YW5kIGZvciBzb21lIHJlYXNvbiBpdCBkb2VzIG5vdCBnZXQgcmVzdW1lZCBwcm9wZXJseS4gVGhl
cmUgYXJlIGFsc28gZmV3Cj4gPiA+ID4gd2FybmluZ3MgZnJvbSBBQ1BJIHRoYXQgbWlnaHQgYmUg
cmVsZXZhbnQ6Cj4gPiA+ID4KPiA+ID4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBBQ1BJIFdh
cm5pbmc6IFxfU0IuUENJMC5HRlgwLl9EU006IEFyZ3VtZW50ICM0IHR5cGUgbWlzbWF0Y2ggLSBG
b3VuZCBbQnVmZmVyXSwgQUNQSSByZXF1aXJlcyBbUGFja2FnZV0gKDIwMTkwNTA5L25zYXJndW1l
bnRzLTU5KQo+ID4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IEFDUEkgV2FybmluZzogXF9T
Qi5QQ0kwLlBFRzAuUEVHUC5fRFNNOiBBcmd1bWVudCAjNCB0eXBlIG1pc21hdGNoIC0gRm91bmQg
W0J1ZmZlcl0sIEFDUEkgcmVxdWlyZXMgW1BhY2thZ2VdICgyMDE5MDUwOS9uc2FyZ3VtZW50cy01
OSkKPiA+ID4KPiA+ID4gYWZhaWsgdGhpcyBpcyB0aGUgY2FzZSBmb3IgZXNzZW50aWFsbHkgZXZl
cnkgbGFwdG9wIG91dCB0aGVyZS4KPiA+Cj4gPiBJIHRoaW5rIHdlIHNob3VsZCBsb29rIGludG8g
dGhpcyBhIGxpdHRsZSBiaXQuCj4gPiBhY3BpX25zX2NoZWNrX2FyZ3VtZW50X3R5cGVzKCkgY2hl
Y2tzIHRoZSBhcmd1bWVudCB0eXBlIGFuZCBwcmludHMKPiA+IHRoaXMgbWVzc2FnZSwgYnV0IEFG
QUlDVCBpdCBkb2Vzbid0IGFjdHVhbGx5IGZpeCBhbnl0aGluZyBvciBwcmV2ZW50Cj4gPiBleGVj
dXRpb24gb2YgdGhlIG1ldGhvZCwgc28gSSBoYXZlIG5vIGlkZWEgd2hhdCBoYXBwZW5zIHdoZW4g
d2UKPiA+IGFjdHVhbGx5IGV4ZWN1dGUgdGhlIF9EU00uCj4gCj4gSSBjYW4gYXNzdXJlIHlvdSB0
aGF0IHRoaXMgd2FybmluZyBoYXBwZW5zIG9uIGV2ZXJ5IHNpbmdsZSBsYXB0b3Agb3V0Cj4gdGhl
cmUgd2l0aCBkdWFsIE52aWRpYSBncmFwaGljcyBhbmQgaXQncyBlc3NlbnRpYWxseSBqdXN0IGEg
ZmlybXdhcmUKPiBidWcuIEFuZCBpdCBuZXZlciBjYXVzZWQgYW55IGlzc3VlcyBvbiBhbnkgb2Yg
dGhlIG9sZGVyIGxhcHRvcHMgKG9yCj4gbmV3ZXN0IG9uZSBmb3IgdGhhdCBtYXR0ZXIpLgoKUmFm
YWVsLCBkbyB5b3Uga25vdyBhbnl0aGluZyBhYm91dCB0aGlzPyAgSWYgQUNQSSBoYXMgc29tZSBz
b3J0IG9mCndvcmthcm91bmQgc28gaXQgY2FuIGV4ZWN1dGUgdGhlIG1ldGhvZCBjb3JyZWN0bHkg
YW55d2F5LCBtYXliZSB3ZQpzaG91bGQgcmVtb3ZlIG9yIHJld29yZCB0aGUgd2FybmluZz8KCk9y
IGlmIHRoaXMgZG9lcyBwcmV2ZW50IGV4ZWN1dGlvbiBvZiB0aGUgbWV0aG9kLCBtYXliZSB3ZSBu
ZWVkIHRvIGFkZAphIHdvcmthcm91bmQgc2luY2UgdGhlIHByb2JsZW0gaXMgc28gcHJldmFsZW50
IGluIHRoZSBmaWVsZD8KCj4gPiBJZiB3ZSBleGVjdXRlIHRoaXMgX0RTTSBhcyBwYXJ0IG9mIHBv
d2VyIG1hbmFnZW1lbnQsIGFuZCB0aGUgX0RTTQo+ID4gZG9lc24ndCB3b3JrIHJpZ2h0LCBpdCB3
b3VsZCBiZSBubyBzdXJwcmlzZSB0aGF0IHdlIGhhdmUgcHJvYmxlbXMuCj4gPgo+ID4gTWF5YmUg
d2UgY291bGQgbGVhcm4gc29tZXRoaW5nIGJ5IHR1cm5pbmcgb24gQUNQSV9EQl9QQVJTRSBvdXRw
dXQgKHNlZQo+ID4gRG9jdW1lbnRhdGlvbi9maXJtd2FyZS1ndWlkZS9hY3BpL2RlYnVnLnJzdCku
Cj4gPgo+ID4gWW91IG11c3QgaGF2ZSBhbiBhY3BpZHVtcCBhbHJlYWR5IGZyb20gYWxsIHlvdXIg
aW52ZXN0aWdhdGlvbi4gIENhbgo+ID4geW91IHB1dCBpdCBzb21ld2hlcmUsIGUuZy4sIGJ1Z3pp
bGxhLmtlcm5lbC5vcmcsIGFuZCBpbmNsdWRlIGEgVVJMPwo+IAo+IFdpbGwgZG8gc28gbGF0ZXIs
IHJpZ2h0IG5vdyBJIGFtIHRyYXZlbGluZyB0byBYREMgYW5kIHdpbGwgaGF2ZSBtb3JlCj4gdGlt
ZSBmb3IgdGhhdCB0aGVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
