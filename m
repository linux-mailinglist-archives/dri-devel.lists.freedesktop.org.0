Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1DD9E53
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 00:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0836E926;
	Wed, 16 Oct 2019 22:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B3F6E926;
 Wed, 16 Oct 2019 22:03:35 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA193218DE;
 Wed, 16 Oct 2019 22:03:34 +0000 (UTC)
Date: Wed, 16 Oct 2019 17:03:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191016220333.GA88523@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571263415;
 bh=O0G17YN2tPEZ7i3JnTYzZCDAa/F7uCFuiSjmZ3wvrfA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BiWb/svlRwEwax+APMGEapJwph2a8ugfWL3JZwsnqQTfPQWA4SLexSE+F2cnVPgRU
 2qJGp2NUMGqKYOWdToD89u2zQk8Y+dHmcIMFsy8yShVFJYscHruIHQrj9VnRNp7mlu
 i5f8AtdnKEMXdw3+v/a8iBP1vkESb0pk/b5c38S4=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTE6NDg6MjJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDExOjM3IFBNIEJqb3JuIEhlbGdhYXMgPGhl
bGdhYXNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwOTox
ODozMlBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+IGJ1dCBzZXR0aW5nIHRoZSBQ
Q0lfREVWX0ZMQUdTX05PX0QzIGZsYWcgZG9lcyBwcmV2ZW50IHVzaW5nIHRoZQo+ID4gPiBwbGF0
Zm9ybSBtZWFucyBvZiBwdXR0aW5nIHRoZSBkZXZpY2UgaW50byBEM2NvbGQsIHJpZ2h0PyBUaGF0
J3MKPiA+ID4gYWN0dWFsbHkgd2hhdCBzaG91bGQgc3RpbGwgaGFwcGVuLCBqdXN0IHRoZSBEM2hv
dCBzdGVwIHNob3VsZCBiZQo+ID4gPiBza2lwcGVkLgo+ID4KPiA+IElmIEkgdW5kZXJzdGFuZCBj
b3JyZWN0bHksIHdoZW4gd2UgcHV0IGEgZGV2aWNlIGluIEQzY29sZCBvbiBhbiBBQ1BJCj4gPiBz
eXN0ZW0sIHdlIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPgo+ID4gICBwY2lfc2V0X3Bvd2Vy
X3N0YXRlKEQzY29sZCkKPiA+ICAgICBpZiAoUENJX0RFVl9GTEFHU19OT19EMykKPiA+ICAgICAg
IHJldHVybiAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8LS0gbm90aGluZyBh
dCBhbGwgaWYgcXVpcmtlZAo+ID4gICAgIHBjaV9yYXdfc2V0X3Bvd2VyX3N0YXRlCj4gPiAgICAg
ICBwY2lfd3JpdGVfY29uZmlnX3dvcmQoUENJX1BNX0NUUkwsIEQzaG90KSAgPC0tIHNldCB0byBE
M2hvdAo+ID4gICAgIF9fcGNpX2NvbXBsZXRlX3Bvd2VyX3RyYW5zaXRpb24oRDNjb2xkKQo+ID4g
ICAgICAgcGNpX3BsYXRmb3JtX3Bvd2VyX3RyYW5zaXRpb24oRDNjb2xkKQo+ID4gICAgICAgICBw
bGF0Zm9ybV9wY2lfc2V0X3Bvd2VyX3N0YXRlKEQzY29sZCkKPiA+ICAgICAgICAgICBhY3BpX3Bj
aV9zZXRfcG93ZXJfc3RhdGUoRDNjb2xkKQo+ID4gICAgICAgICAgICAgYWNwaV9kZXZpY2Vfc2V0
X3Bvd2VyKEFDUElfU1RBVEVfRDNfQ09MRCkKPiA+ICAgICAgICAgICAgICAgLi4uCj4gPiAgICAg
ICAgICAgICAgICAgYWNwaV9ldmFsdWF0ZV9vYmplY3QoIl9PRkYiKSAgICAgPC0tIHNldCB0byBE
M2NvbGQKPiA+Cj4gPiBJIGRpZCBub3QgdW5kZXJzdGFuZCB0aGUgY29ubmVjdGlvbiB3aXRoIHBs
YXRmb3JtIChBQ1BJKSBwb3dlcgo+ID4gbWFuYWdlbWVudCBmcm9tIHlvdXIgcGF0Y2guICBJdCBz
b3VuZHMgbGlrZSB5b3Ugd2FudCB0aGlzIGVudGlyZSBwYXRoCj4gPiBleGNlcHQgdGhhdCB5b3Ug
d2FudCB0byBza2lwIHRoZSBQQ0lfUE1fQ1RSTCB3cml0ZT8KPiA+Cj4gCj4gZXhhY3RseS4gSSBh
bSBydW5uaW5nIHdpdGggdGhpcyB3b3JrYXJvdW5kIGZvciBhIHdoaWxlIG5vdyBhbmQgbmV2ZXIK
PiBoYWQgYW55IGZhaWxzIHdpdGggaXQgYW55bW9yZS4gVGhlIEdQVSBnZXRzIHR1cm5lZCBvZmYg
Y29ycmVjdGx5IGFuZCBJCj4gc2VlIHRoZSBzYW1lIHBvd2VyIHNhdmluZ3MsIGp1c3QgdGhhdCB0
aGUgR1BVIGNhbiBiZSBwb3dlcmVkIG9uIGFnYWluLgo+IAo+ID4gVGhhdCBzZWVtcyBsaWtlIHNv
bWV0aGluZyBSYWZhZWwgc2hvdWxkIHdlaWdoIGluIG9uLiAgSSBkb24ndCBrbm93Cj4gPiB3aHkg
d2Ugc2V0IHRoZSBkZXZpY2UgdG8gRDNob3Qgd2l0aCBQQ0lfUE1fQ1RSTCBiZWZvcmUgdXNpbmcg
dGhlIEFDUEkKPiA+IG1ldGhvZHMsIGFuZCBJIGRvbid0IGtub3cgd2hhdCB0aGUgZWZmZWN0IG9m
IHNraXBwaW5nIHRoYXQgaXMuICBJdAo+ID4gc2VlbXMgYSBsaXR0bGUgbWVzc3kgdG8gc2xpY2Ug
b3V0IHRoaXMgdGlueSBwaWVjZSBmcm9tIHRoZSBtaWRkbGUsIGJ1dAo+ID4gbWF5YmUgaXQgbWFr
ZXMgc2Vuc2UuCj4gPgo+IAo+IGFmYWlrIHdoZW4gSSB3YXMgdGFsa2luZyB3aXRoIG90aGVycyBp
biB0aGUgcGFzdCBhYm91dCBpdCwgV2luZG93cyBpcwo+IGRvaW5nIHRoYXQgYmVmb3JlIHVzaW5n
IEFDUEkgY2FsbHMsIGJ1dCBtYXliZSB0aGV5IGhhdmUgc29tZSBzaW1pbGFyCj4gd29ya2Fyb3Vu
ZHMgZm9yIGNlcnRhaW4gaW50ZWwgYnJpZGdlcyBhcyB3ZWxsPyBJIGFtIHN1cmUgaXQgYWZmZWN0
cwo+IG1vcmUgdGhhbiB0aGUgb25lIEkgYW0gYmxhY2tsaXN0aW5nIGhlcmUsIGJ1dCBJIHJhdGhl
ciB3YW50IHRvIGNoZWNrCj4gZWFjaCBkZXZpY2UgYmVmb3JlIGJsYWNrbGlzdGluZyBhbGwga2Fi
eWxha2UgYW5kIHNreSBsYWtlIGJyaWRnZXMgKGFzCj4gdGhvc2UgYXJlIHRoZSBvbmVzIHdlcmUg
dGhpcyBpc3N1ZSBjYW4gYmUgb2JzZXJ2ZWQpLgoKRnJvbSBhIHF1aWNrIGxvb2sgYXQgdGhlIEFD
UEkgc3BlYywgSSBkaWRuJ3Qgc2VlIGNvbmRpdGlvbnMgbGlrZSAiT1NQTQptdXN0IHB1dCBQQ0kg
ZGV2aWNlcyBpbiBEM2hvdCBiZWZvcmUgZXhlY3V0aW5nIF9PRkYiLiAgQnV0IG9idmlvdXNseQp0
aGVyZSdzICpzb21lKiByZWFzb24gYW5kIEkgcHJvYmFibHkganVzdCBtaXNzZWQgaXQuCgo+IFNh
ZGx5IHdlIGhhZCBubyBsdWNrIGdldHRpbmcgYW55IGluZm9ybWF0aW9uIGFib3V0IHN1Y2ggd29y
a2Fyb3VuZCBvdXQKPiBvZiBOdmlkaWEgb3IgSW50ZWwuCgpJJ20gbm90IHN1cnByaXNlZDsgaXQg
ZG9lc24ndCBzZWVtIGxpa2Ugd2UgcmVhbGx5IGhhdmUgdGhlIGRldGFpbHMKbmVlZGVkIHRvIGdl
dCB0byBhIHJvb3QgY2F1c2UgeWV0LiAgSSB0aGluayB3aGF0IHdlIHJlYWxseSBuZWVkIGlzIGEK
UENJZSBhbmFseXplciB0cmFjZSB0byBzZWUgd2hhdCBoYXBwZW5zIHdoZW4gdGhlIGRldmljZSAi
ZmFsbHMgb2ZmIHRoZQpidXMiLgoKQmpvcm4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
