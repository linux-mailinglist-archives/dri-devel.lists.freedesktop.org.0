Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CF10517D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53576EDEA;
	Thu, 21 Nov 2019 11:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84B6EDBB;
 Thu, 21 Nov 2019 11:34:34 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z25so2613944oti.5;
 Thu, 21 Nov 2019 03:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kuqs327pUhPcYZgV8CR1QRbPOc0dkeg/XwrNu/owu1o=;
 b=j3oWTOivKyTf6sZkFM8V8lR0gleOZNC9kLjSW8J9xIEJHSAn9LK1C4OyLCJ7Uvu+pJ
 Trxajr3X0zlnyobgf38PSuQywgQVrP7O9b9wUQ9tno7U3TT2qUdgbcHFBRTLKCzd6hWq
 hLXmCzi2LV+2zjadbaI5v85j7pV/gncT83P+VjvJWrJp0XixBi8RyXhdOI1jcmYDSPKL
 tXvKQi2sH6VKW621NDJq2SV58PFiiZHfYQKpDgtVYSTczYfGQLkJO9d55qTCvOSErYJ/
 84OMAXPJnLpJWJ+H9g65J1AlEKnmj+GobmvGQkvgHLDS85fCdOR0Qiw8g5y16YJZ187p
 LOdA==
X-Gm-Message-State: APjAAAUg4IBDHNxQTzNHOGFZnt69PwsAZYBqI53aw4uzjNEl2E/jes1G
 5dcUn7pwYQZ3IeMPf9lZ9DawR4EHWYyBb3oMNCQ=
X-Google-Smtp-Source: APXvYqy+gJzz6eLtFc3d/wbKk0w7lTaILzB/lspRYo4XruXCjYN7NRCgCvcvUCZmIe0BinxitYhww1KtRDfarQFUdcY=
X-Received: by 2002:a05:6830:103:: with SMTP id
 i3mr6231632otp.266.1574336073815; 
 Thu, 21 Nov 2019 03:34:33 -0800 (PST)
MIME-Version: 1.0
References: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
In-Reply-To: <20191121112821.GU11621@lahna.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 12:34:22 +0100
Message-ID: <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MjggUE0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEx
OjI5OjMzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiBsYXN0IHdlZWsg
b3Igc28gSSBmb3VuZCBzeXN0ZW1zIHdoZXJlIHRoZSBHUFUgd2FzIHVuZGVyIHRoZSAiUENJCj4g
PiA+IEV4cHJlc3MgUm9vdCBQb3J0IiAobmFtZSBmcm9tIGxzcGNpKSBhbmQgb24gdGhvc2Ugc3lz
dGVtcyBhbGwgb2YgdGhhdAo+ID4gPiBzZWVtcyB0byB3b3JrLiBTbyBJIGFtIHdvbmRlcmluZyBp
ZiBpdCdzIGluZGVlZCBqdXN0IHRoZSAweDE5MDEgb25lLAo+ID4gPiB3aGljaCBhbHNvIGV4cGxh
aW5zIE1pa2FzIGNhc2UgdGhhdCBUaHVuZGVyYm9sdCBzdHVmZiB3b3JrcyBhcyBkZXZpY2VzCj4g
PiA+IG5ldmVyIGdldCBwb3B1bGF0ZWQgdW5kZXIgdGhpcyBwYXJ0aWN1bGFyIGJyaWRnZSBjb250
cm9sbGVyLCBidXQgdW5kZXIKPiA+ID4gdGhvc2UgIlJvb3QgUG9ydCJzCj4gPgo+ID4gSXQgYWx3
YXlzIGlzIGEgUENJZSBwb3J0LCBidXQgaXRzIGxvY2F0aW9uIHdpdGhpbiB0aGUgU29DIG1heSBt
YXR0ZXIuCj4KPiBFeGFjdGx5LiBJbnRlbCBoYXJkd2FyZSBoYXMgUENJZSBwb3J0cyBvbiBDUFUg
c2lkZSAodGhlc2UgYXJlIGNhbGxlZAo+IFBFRywgUENJIEV4cHJlc3MgR3JhcGhpY3MsIHBvcnRz
KSwgYW5kIHRoZSBQQ0ggc2lkZS4gSSB0aGluayB0aGUgSVAgaXMKPiBzdGlsbCB0aGUgc2FtZS4K
Pgo+ID4gQWxzbyBzb21lIGN1c3RvbSBBTUwtYmFzZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZv
bHZlZCBhbmQgdGhhdCBtYXkKPiA+IGJlIG1ha2luZyBzcGVjaWZpYyBhc3N1bXB0aW9ucyBvbiB0
aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgU29DIGFuZCB0aGUKPiA+IEdQVSBhdCB0aGUgdGltZSBv
ZiBpdHMgaW52b2NhdGlvbiB3aGljaCB1bmZvcnR1bmF0ZWx5IGFyZSBub3Qga25vd24gdG8KPiA+
IHVzLgo+ID4KPiA+IEhvd2V2ZXIsIGl0IGxvb2tzIGxpa2UgdGhlIEFNTCBpbnZva2VkIHRvIHBv
d2VyIGRvd24gdGhlIEdQVSBmcm9tCj4gPiBhY3BpX3BjaV9zZXRfcG93ZXJfc3RhdGUoKSBnZXRz
IGNvbmZ1c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+IHRoYXQgcG9pbnQsIHNvIGl0
IGxvb2tzIGxpa2UgdGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNzIGRldmljZSBtZW1vcnkgb24KPiA+
IHRoZSBHUFUgKGJleW9uZCB0aGUgUENJIGNvbmZpZyBzcGFjZSkgb3Igc2ltaWxhciB3aGljaCBp
cyBub3QKPiA+IGFjY2Vzc2libGUgaW4gUENJIHBvd2VyIHN0YXRlcyBiZWxvdyBEMC4KPgo+IE9y
IHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9mIHRoZSBHUFUgd2hlbiB0aGUgcGFyZW50IHJvb3QgcG9y
dCBpcyBpbiBEM2hvdAo+IChhcyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBH
UFUgY29uZmlnIHNwYWNlIGlzIG5vdAo+IGFjY2Vzc2libGUuCgpXaHkgd291bGQgdGhlIHBhcmVu
dCBwb3J0IGJlIGluIEQzaG90IGF0IHRoYXQgcG9pbnQ/ICBXb3VsZG4ndCB0aGF0IGJlCmEgc3Vz
cGVuZCBvcmRlcmluZyB2aW9sYXRpb24/Cgo+IEkgdG9vayBhIGxvb2sgYXQgdGhlIEhQIE9tZW4g
QUNQSSB0YWJsZXMgd2hpY2ggaGFzIHNpbWlsYXIgcHJvYmxlbSBhbmQKPiB0aGVyZSBpcyBhbHNv
IGNoZWNrIGZvciBXaW5kb3dzIDcgKGJ1dCBub3QgTGludXgpIHNvIEkgdGhpbmsgb25lCj4gYWx0
ZXJuYXRpdmUgd29ya2Fyb3VuZCB3b3VsZCBiZSB0byBhZGQgdGhlc2UgZGV2aWNlcyBpbnRvCj4g
YWNwaV9vc2lfZG1pX3RhYmxlW10gd2hlcmUgLmNhbGxiYWNrIGlzIHNldCB0byBkbWlfZGlzYWJs
ZV9vc2lfd2luOCAob3IKPiBwYXNzICdhY3BpX29zaT0iIVdpbmRvd3MgMjAxMiInIGluIHRoZSBr
ZXJuZWwgY29tbWFuZCBsaW5lKS4KCkknZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhlIGZhY3RzIHRo
YXQgaGF2ZSBiZWVuIGVzdGFibGlzaGVkIHNvIGZhcgpiZWZvcmUgZGVjaWRpbmcgd2hhdCB0byBk
byBhYm91dCB0aGVtLiA6LSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
