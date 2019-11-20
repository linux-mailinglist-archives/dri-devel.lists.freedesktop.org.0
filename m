Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9D1045DF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 22:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28436EA2E;
	Wed, 20 Nov 2019 21:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3F66EA28;
 Wed, 20 Nov 2019 21:37:17 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m15so976371otq.7;
 Wed, 20 Nov 2019 13:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCVkX5zJWXohjxns4syxefXspebuJN052ShGvcXSY0Q=;
 b=BvdFi/5cyMQKFPj4ZoQtommTQv+Y+um4xRXPZXJCe9M9wIfUbIpwBgYcQ7oo+0bSD5
 O60AdnnYYnZbXXTqUs1EO/fYHUTycMKpCLbJJ2gji50fNofwHFSvHfu5FLtYhcQX/Prh
 bIb+32MFRqOkGYIEFFKMDq5NoB/6HrtVKd66gG8i/fVfQaHPR0xakMaCUoifQlCnDyTq
 QAKTSRet9ZOPox3lJnHugScGK9uZCA7vRg3wwEOK4/jCbSlqQugKH8Wb+rtDeD/Rg7g7
 AXjwrUiGEqPNlKyIpuW8IRn6MDq51YnFVP61LABI0ta2jxbzolaYFNwMqSp1DCtfOqcc
 ws7Q==
X-Gm-Message-State: APjAAAXiJ5z+m0vaO6y17dEM+OKmR4JtAJdTUuJtWE9fQColjR3RlSQa
 0WMrwlPVSLWAK1zLWdAHieyX1h+Xo8PIkjRAqlI=
X-Google-Smtp-Source: APXvYqyRmkpra7eCONirWdvpeM1m2+b4g+wNLsgwEi2XIALPyQJCt4qe8N7ImCPtPVHMrV4j5umXCYDJtFGHlucB2gA=
X-Received: by 2002:a05:6830:103:: with SMTP id
 i3mr3888714otp.266.1574285836460; 
 Wed, 20 Nov 2019 13:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
In-Reply-To: <20191120155301.GL11621@lahna.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Nov 2019 22:37:05 +0100
Message-ID: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgNDo1MyBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDQ6
Mzc6MTRQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjAsIDIw
MTkgYXQgNDoxNSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MTE6NTJQ
TSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5
IGF0IDE6MDkgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRl
bC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0
IDEyOjU4OjAwUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gPiA+ID4gb3ZlcmFs
bCwgd2hhdCBJIHJlYWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29yayBvbiB3
aW5kb3dzPwo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIGRvIEkgOy0pCj4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0
IGRvZXNuJ3Qgd29yaz8gSWYKPiA+ID4gPiA+ID4gYW55Ym9keSBoYXMgYW55IGlkZWEgb24gaG93
IHdlIGNvdWxkIGRpZyBpbnRvIHRoaXMgYW5kIGZpZ3VyZSBpdCBvdXQKPiA+ID4gPiA+ID4gb24g
dGhpcyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRv
IHRoZSByb290Cj4gPiA+ID4gPiA+IGNhdXNlPyBubz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIYXZl
IHlvdSB0cmllZCB0byB1c2UgdGhlIGFjcGlfcmV2X292ZXJyaWRlIHBhcmFtZXRlciBpbiB5b3Vy
IHN5c3RlbSBhbmQKPiA+ID4gPiA+IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0Pwo+ID4gPiA+ID4K
PiA+ID4gPiA+IEFsc28gZGlkIHlvdSB0cnkgdG8gdHJhY2UgdGhlIEFDUEkgX09OL19PRkYoKSBt
ZXRob2RzPyBJIHRoaW5rIHRoYXQKPiA+ID4gPiA+IHNob3VsZCBob3BlZnVsbHkgcmV2ZWFsIHNv
bWV0aGluZy4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIEkgZGlkIGluIHRoZSBw
YXN0IGFuZCBpdCBzZWVtZWQgdG8gaGF2ZSB3b3JrZWQsIHRoZXJlIGlzIGp1c3QKPiA+ID4gPiBv
bmUgYmlnIGlzc3VlIHdpdGggdGhpczogaXQncyBhIERlbGwgc3BlY2lmaWMgd29ya2Fyb3VuZCBh
ZmFpaywgYW5kCj4gPiA+ID4gdGhpcyBpc3N1ZSBwbGFndWVzIG5vdCBqdXN0IERlbGwsIGJ1dCB3
ZSd2ZSBzZWVuIGl0IG9uIEhQIGFuZCBMZW5vdm8KPiA+ID4gPiBsYXB0b3BzIGFzIHdlbGwsIGFu
ZCBJJ3ZlIGhlYXJkIGFib3V0IHVzZXJzIGhhdmluZyB0aGUgc2FtZSBpc3N1ZXMgb24KPiA+ID4g
PiBBc3VzIGFuZCBNU0kgbGFwdG9wcyBhcyB3ZWxsLgo+ID4gPgo+ID4gPiBNYXliZSBpdCBpcyBu
b3QgYSB3b3JrYXJvdW5kIGF0IGFsbCBidXQgaW5zdGVhZCBpdCBzaW1wbHkgZGV0ZXJtaW5lcwo+
ID4gPiB3aGV0aGVyIHRoZSBzeXN0ZW0gc3VwcG9ydHMgUlREMyBvciBzb21ldGhpbmcgbGlrZSB0
aGF0IChJSVJDIFdpbmRvd3MgOAo+ID4gPiBzdGFydGVkIHN1cHBvcnRpbmcgaXQpLiBNYXliZSBE
ZWxsIGFkZGVkIGNoZWNrIGZvciBMaW51eCBiZWNhdXNlIGF0IHRoYXQKPiA+ID4gdGltZSBMaW51
eCBkaWQgbm90IHN1cHBvcnQgaXQuCj4gPiA+Cj4gPgo+ID4gdGhlIHBvaW50IGlzLCBpdCdzIG5v
dCBjaGVja2luZyBpdCBieSBkZWZhdWx0LCBzbyBieSBkZWZhdWx0IHlvdSBzdGlsbAo+ID4gcnVu
IGludG8gdGhlIHdpbmRvd3MgOCBjb2RlcGF0aC4KPgo+IFdlbGwgeW91IGNhbiBhZGQgdGhlIHF1
aXJrIHRvIGFjcGlfcmV2X2RtaV90YWJsZVtdIHNvIGl0IGdvZXMgdG8gdGhhdAo+IHBhdGggYnkg
ZGVmYXVsdC4gVGhlcmUgYXJlIGEgYnVuY2ggb2Ygc2ltaWxhciBlbnRyaWVzIGZvciBEZWxsIG1h
Y2hpbmVzLgoKT0ssIHNvIHRoZSAiTGludXggcGF0aCIgd29ya3MgYW5kIHRoZSBvdGhlciBkb2Vz
bid0LgoKSSB0aG91Z2h0IHRoYXQgdGhpcyB3YXMgdGhlIG90aGVyIHdheSBhcm91bmQsIHNvcnJ5
IGZvciB0aGUgY29uZnVzaW9uLgoKPiBPZiBjb3Vyc2UgdGhpcyBkb2VzIG5vdCBoZWxwIHRoZSBu
b24tRGVsbCB1c2VycyBzbyB3ZSB3b3VsZCBzdGlsbCBuZWVkCj4gdG8gZmlndXJlIG91dCB0aGUg
cm9vdCBjYXVzZS4KClJpZ2h0LgoKV2hhdGV2ZXIgaXQgaXMsIHRob3VnaCwgQU1MIGFwcGVhcnMg
dG8gYmUgaW52b2x2ZWQgaW4gaXQgYW5kIEFGQUlDUwp0aGVyZSdzIG5vIGV2aWRlbmNlIHRoYXQg
aXQgYWZmZWN0cyBhbnkgcm9vdCBwb3J0cyB0aGF0IGFyZSBub3QKcG9wdWxhdGVkIHdpdGggTlZp
ZGlhIEdQVXMuCgpOb3csIG9uZSB0aGluZyBpcyBzdGlsbCBub3QgY2xlYXIgdG8gbWUgZnJvbSB0
aGUgZGlzY3Vzc2lvbiBzbyBmYXI6IGlzCnRoZSBfUFIzIG1ldGhvZCB5b3UgbWVudGlvbmVkIGRl
ZmluZWQgdW5kZXIgdGhlIEdQVSBkZXZpY2Ugb2JqZWN0IG9yCnVuZGVyIHRoZSBwb3J0IGRldmlj
ZSBvYmplY3Q/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
