Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3251039CE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777436E4C4;
	Wed, 20 Nov 2019 12:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EA26E40F;
 Wed, 20 Nov 2019 12:15:04 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y194so22310235oie.4;
 Wed, 20 Nov 2019 04:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esEo2BOJu3uyThpaIy1S5JuOd1hwwX4sFEOY2HfR0sY=;
 b=murWOnNIN/MfsTO2nsj9OgAc9EXs/EsINIV/giGGCo7Kv4kK2jC3UF5ebdABsLrXzI
 xKYPLtTrS93k9Wx0/ObYlbERtSrZBrHzx2LO72OJvxaf8KxVEQZO3DDckeGX0Ls/q16c
 tuy54aKL+iW9pf6H2ndnhRaFKNMBhXEOYHRTDZIvV3gBk8WgN3wEnxTawiPp6zLviRLo
 E9J/mZwchk7vVrwvv/7CgUcAAwnmb/oP/O/qG5vR0ws6cPQrmJYlMTKtelAA3XHrZ93c
 +uijv0UxIvGej00TlDM+ckPEHSr5mVoRYNwDFJ4apv2XdQsaAWUsJ7X0iPzsXrCWIfZm
 deYw==
X-Gm-Message-State: APjAAAUqlKUGc+9VZ/kAIyFrn/eQpqw742HUgZzFJIa8sjEie5juE5qp
 5BSOqjkBMHwuz16b+1OJnX16D/cE4SL+8hJdRes=
X-Google-Smtp-Source: APXvYqzm1rGGZ89lrgIDdkz3K9d/ltWTXiE3VIQlWxc9OTBjh+eklJP/fHtUrR92Ig1jPf966ZhegrG39d2NMig/rp0=
X-Received: by 2002:aca:530c:: with SMTP id h12mr2615449oib.110.1574252103376; 
 Wed, 20 Nov 2019 04:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
 <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
 <CACO55tupFbq0T1DcR+C+YxtPR=csPBQhwVXz_SHWT5F8bRK8JA@mail.gmail.com>
In-Reply-To: <CACO55tupFbq0T1DcR+C+YxtPR=csPBQhwVXz_SHWT5F8bRK8JA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Nov 2019 13:14:51 +0100
Message-ID: <CAJZ5v0h_ymqsoOVm9s2h5X0ejYdM4x03H7xPQ38uiO009OVgpQ@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Karol Herbst <kherbst@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMToxMCBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxOjA2IFBNIFJhZmFl
bCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBO
b3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMjo0OCBQTSBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6MjIgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4g
PG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9u
IFdlZCwgTm92IDIwLCAyMDE5IGF0IDExOjUyOjIyQU0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tp
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMToxOCBBTSBNaWth
IFdlc3RlcmJlcmcKPiA+ID4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+Cj4gPgo+ID4gW2N1dF0KPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IE9oLCBzbyBkb2VzIGl0IGxvb2sgbGlrZSB3ZSBhcmUgdHJ5aW5nIHRvIHdvcmsgYXJvdW5kIEFN
TCB0aGF0IHRyaWVkCj4gPiA+ID4gPiA+IHRvIHdvcmsgYXJvdW5kIHNvbWUgcHJvYmxlbWF0aWMg
YmVoYXZpb3IgaW4gTGludXggYXQgb25lIHBvaW50Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IFllcywg
aXQgbG9va3MgbGlrZSBzbyBpZiBJIHJlYWQgdGhlIEFTTCByaWdodC4KPiA+ID4gPgo+ID4gPiA+
IE9LLCBzbyB0aGF0IHdvdWxkIGNhbGwgZm9yIGEgRE1JLWJhc2VkIHF1aXJrIGFzIHRoZSByZWFs
IGNhdXNlIGZvciB0aGUKPiA+ID4gPiBpc3N1ZSBzZWVtcyB0byBiZSB0aGUgQU1MIGluIHF1ZXN0
aW9uLCB3aGljaCBtZWFucyBhIGZpcm13YXJlIHByb2JsZW0uCj4gPiA+ID4KPiA+ID4KPiA+ID4g
QW5kIEkgZGlzYWdyZWUgYXMgdGhpcyBpcyBhIGxpbnV4IHNwZWNpZmljIHdvcmthcm91bmQgYW5k
IHdpbmRvd3MgZ29lcwo+ID4gPiB0aGF0IHBhdGggYW5kIHN1Y2NlZWRzLiBUaGlzIGZpcm13YXJl
IGJhc2VkIHdvcmthcm91bmQgd2FzIGFkZGVkLAo+ID4gPiBiZWNhdXNlIGl0IGJyb2tlIG9uIExp
bnV4Lgo+ID4KPiA+IEFwcGFyZW50bHkgc28gYXQgdGhlIHRpbWUgaXQgd2FzIGFkZGVkLCBidXQg
d291bGQgaXQgc3RpbGwgYnJlYWsgYWZ0ZXIKPiA+IHRoZSBrZXJuZWwgY2hhbmdlcyBtYWRlIHNp
bmNlIHRoZW4/Cj4gPgo+ID4gTW9yZW92ZXIsIGhhcyBpdCBub3QgYmVjb21lIGhhcm1mdWwgbm93
PyAgSU9XLCB3b3VsZG4ndCBpdCB3b3JrIGFmdGVyCj4gPiByZW1vdmluZyB0aGUgIkxpbnV4IHdv
cmthcm91bmQiIGZyb20gdGhlIEFNTD8KPiA+Cj4gPiBUaGUgb25seSB3YXkgdG8gdmVyaWZ5IHRo
YXQgSSBjYW4gc2VlIHdvdWxkIGJlIHRvIHJ1biB0aGUgc3lzdGVtIHdpdGgKPiA+IGN1c3RvbSBB
Q1BJIHRhYmxlcyB3aXRob3V0IHRoZSAiTGludXggd29ya2Fyb3VuZCIgaW4gdGhlIEFNTCBpbgo+
ID4gcXVlc3Rpb24uCj4gPgo+Cj4gdGhlIHdvcmthcm91bmQgaXMgbm90IGVuYWJsZWQgYnkgZGVm
YXVsdCwgYmVjYXVzZSBpdCBoYXMgdG8gYmUKPiBleHBsaWNpdGx5IGVuYWJsZWQgYnkgdGhlIHVz
ZXIuCgpJJ20gbm90IHN1cmUgd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQuCgpJJ20gdGFraW5n
IHNwZWNpZmljYWxseSBhYm91dCB0aGUgKChPU1lTID09IDB4MDdERikgJiYgKF9SRVYgPT0gMHgw
NSkpCmNoZWNrIG1lbnRpb25lZCBieSBNaWthIHdoaWNoIGRvZXNuJ3Qgc2VlbSB0byBkZXBlbmQg
b24gdXNlciBpbnB1dCBpbgphbnkgd2F5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
