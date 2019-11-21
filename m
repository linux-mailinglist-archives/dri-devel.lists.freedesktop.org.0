Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D90105739
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 17:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AD96F4A8;
	Thu, 21 Nov 2019 16:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDA56F4AF;
 Thu, 21 Nov 2019 16:39:33 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c19so3459478otr.11;
 Thu, 21 Nov 2019 08:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IrWX6mmJ7b0mwXpxOSU05DSHjWhwtw3uJnCs1X0/To=;
 b=JKcPtWvfanbvb/KmMC/maqeATdQ9KjiD7dLJXI9c+XlUqE22NBiMoi50w7SHYZmqy6
 A7LqP1P6p98+iQdVk+MsQ14o67/BumC6iJ/4FVj5TMLe1+6ezqFR00FmFNmQ3lSFymRR
 wDKTLM9Clj6g8ILZVsmeJRLbv6uwfXdxOKGNpwkBdYrevQ0+8wme68qgJ8QovxtzkQvk
 q2qjJEj17QQm1z0l3k7vvRD3hXRxWXVkQfhrGsR5f8CjkELLFk0mwgrsOh2/QutQqmHX
 s/jxuCvPDyymdLFekJxTfIkYrKwzaS2b20HwoC7xyk00rFlF2+Zt+KwKj5ZvIgzrCmez
 lChw==
X-Gm-Message-State: APjAAAXsQJT9AgE4hfunOPcdWWLZmgRsxw8diE1UPXD0kw0ZmtiBRNl7
 HXmF20Ip1hK+CYtqAyTa/hLpsRBWUdDIA+CXhdg=
X-Google-Smtp-Source: APXvYqw6yon06gwMBAkTS9wKaEXc0zY3KLNduZz9aAoaAE9fqyZLVmoRNCkTobjOW0RmAi51YDxLQ+kr/wefdJcTvpQ=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr6911159otn.167.1574354372881; 
 Thu, 21 Nov 2019 08:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
In-Reply-To: <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 17:39:21 +0100
Message-ID: <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNTowNiBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCA0OjQ3IFBNIFJhZmFl
bCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBO
b3YgMjEsIDIwMTkgYXQgMTo1MyBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEyOjQ2IFBNIE1pa2Eg
V2VzdGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMjozNDoyMlBNICswMTAwLCBSYWZh
ZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEy
OjI4IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5j
b20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBh
dCAxMToyOTozM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+ID4g
PiA+IGxhc3Qgd2VlayBvciBzbyBJIGZvdW5kIHN5c3RlbXMgd2hlcmUgdGhlIEdQVSB3YXMgdW5k
ZXIgdGhlICJQQ0kKPiA+ID4gPiA+ID4gPiA+IEV4cHJlc3MgUm9vdCBQb3J0IiAobmFtZSBmcm9t
IGxzcGNpKSBhbmQgb24gdGhvc2Ugc3lzdGVtcyBhbGwgb2YgdGhhdAo+ID4gPiA+ID4gPiA+ID4g
c2VlbXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBpbmRlZWQganVzdCB0aGUg
MHgxOTAxIG9uZSwKPiA+ID4gPiA+ID4gPiA+IHdoaWNoIGFsc28gZXhwbGFpbnMgTWlrYXMgY2Fz
ZSB0aGF0IFRodW5kZXJib2x0IHN0dWZmIHdvcmtzIGFzIGRldmljZXMKPiA+ID4gPiA+ID4gPiA+
IG5ldmVyIGdldCBwb3B1bGF0ZWQgdW5kZXIgdGhpcyBwYXJ0aWN1bGFyIGJyaWRnZSBjb250cm9s
bGVyLCBidXQgdW5kZXIKPiA+ID4gPiA+ID4gPiA+IHRob3NlICJSb290IFBvcnQicwo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSXQgYWx3YXlzIGlzIGEgUENJZSBwb3J0LCBidXQgaXRzIGxv
Y2F0aW9uIHdpdGhpbiB0aGUgU29DIG1heSBtYXR0ZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IEV4YWN0bHkuIEludGVsIGhhcmR3YXJlIGhhcyBQQ0llIHBvcnRzIG9uIENQVSBzaWRlICh0aGVz
ZSBhcmUgY2FsbGVkCj4gPiA+ID4gPiA+IFBFRywgUENJIEV4cHJlc3MgR3JhcGhpY3MsIHBvcnRz
KSwgYW5kIHRoZSBQQ0ggc2lkZS4gSSB0aGluayB0aGUgSVAgaXMKPiA+ID4gPiA+ID4gc3RpbGwg
dGhlIHNhbWUuCj4gPiA+ID4gPiA+Cj4gPiA+Cj4gPiA+IHllYWgsIEkgbWVhbnQgdGhlIGJyaWRn
ZSBjb250cm9sbGVyIHdpdGggdGhlIElEIDB4MTkwMSBpcyBvbiB0aGUgQ1BVCj4gPiA+IHNpZGUu
IEFuZCBpZiB0aGUgTnZpZGlhIEdQVSBpcyBvbiBhIHBvcnQgb24gdGhlIFBDSCBzaWRlIGl0IGFs
bCBzZWVtcwo+ID4gPiB0byB3b3JrIGp1c3QgZmluZS4KPiA+Cj4gPiBCdXQgdGhhdCBtYXkgaW52
b2x2ZSBkaWZmZXJlbnQgQU1MIHRvbywgbWF5IGl0IG5vdD8KPiA+Cj4gPiA+ID4gPiA+ID4gQWxz
byBzb21lIGN1c3RvbSBBTUwtYmFzZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQg
dGhhdCBtYXkKPiA+ID4gPiA+ID4gPiBiZSBtYWtpbmcgc3BlY2lmaWMgYXNzdW1wdGlvbnMgb24g
dGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIFNvQyBhbmQgdGhlCj4gPiA+ID4gPiA+ID4gR1BVIGF0
IHRoZSB0aW1lIG9mIGl0cyBpbnZvY2F0aW9uIHdoaWNoIHVuZm9ydHVuYXRlbHkgYXJlIG5vdCBr
bm93biB0bwo+ID4gPiA+ID4gPiA+IHVzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSG93
ZXZlciwgaXQgbG9va3MgbGlrZSB0aGUgQU1MIGludm9rZWQgdG8gcG93ZXIgZG93biB0aGUgR1BV
IGZyb20KPiA+ID4gPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJfc3RhdGUoKSBnZXRzIGNvbmZ1
c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiA+ID4gPiB0aGF0IHBvaW50LCBz
byBpdCBsb29rcyBsaWtlIHRoYXQgQU1MIHRyaWVzIHRvIGFjY2VzcyBkZXZpY2UgbWVtb3J5IG9u
Cj4gPiA+ID4gPiA+ID4gdGhlIEdQVSAoYmV5b25kIHRoZSBQQ0kgY29uZmlnIHNwYWNlKSBvciBz
aW1pbGFyIHdoaWNoIGlzIG5vdAo+ID4gPiA+ID4gPiA+IGFjY2Vzc2libGUgaW4gUENJIHBvd2Vy
IHN0YXRlcyBiZWxvdyBEMC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT3IgdGhlIFBDSSBjb25m
aWcgc3BhY2Ugb2YgdGhlIEdQVSB3aGVuIHRoZSBwYXJlbnQgcm9vdCBwb3J0IGlzIGluIEQzaG90
Cj4gPiA+ID4gPiA+IChhcyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBHUFUg
Y29uZmlnIHNwYWNlIGlzIG5vdAo+ID4gPiA+ID4gPiBhY2Nlc3NpYmxlLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3QgYXQgdGhhdCBwb2lu
dD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+ID4gPiA+IGEgc3VzcGVuZCBvcmRlcmluZyB2aW9sYXRp
b24/Cj4gPiA+ID4KPiA+ID4gPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50byBEM2hvdCBmaXJzdCwg
dGhlbiB0aGUgcm9vdCBwb3J0IGFuZCB0aGVuIHR1cm4KPiA+ID4gPiBvZmYgdGhlIHBvd2VyIHJl
c291cmNlICh3aGljaCBpcyBhdHRhY2hlZCB0byB0aGUgcm9vdCBwb3J0KSByZXN1bHRpbmcKPiA+
ID4gPiB0aGUgdG9wb2xvZ3kgZW50ZXJpbmcgRDNjb2xkLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IElm
IHRoZSBrZXJuZWwgZG9lcyBhIEQwIC0+IEQzaG90IC0+IEQwIGN5Y2xlIHRoaXMgd29ya3MgYXMg
d2VsbCwgYnV0Cj4gPiA+IHRoZSBwb3dlciBzYXZpbmdzIGFyZSB3YXkgbG93ZXIsIHNvIEkga2lu
ZCBvZiBwcmVmZXIgc2tpcHBpbmcgRDNob3QKPiA+ID4gaW5zdGVhZCBvZiBEM2NvbGQuIFNraXBw
aW5nIEQzaG90IGRvZXNuJ3Qgc2VlbSB0byBtYWtlIGFueSBkaWZmZXJlbmNlCj4gPiA+IGluIHBv
d2VyIHNhdmluZ3MgaW4gbXkgdGVzdGluZy4KPiA+Cj4gPiBPSwo+ID4KPiA+IFdoYXQgZXhhY3Rs
eSBkaWQgeW91IGRvIHRvIHNraXAgRDNjb2xkIGluIHlvdXIgdGVzdGluZz8KPiA+Cj4KPiBGb3Ig
dGhhdCBJIHBva2VkIGludG8gdGhlIFBDSSByZWdpc3RlcnMgZGlyZWN0bHkgYW5kIHNraXBwZWQg
ZG9pbmcgdGhlCj4gQUNQSSBjYWxscyBhbmQgc2ltcGx5IGNoZWNrZWQgZm9yIHRoZSBpZGxlIHBv
d2VyIGNvbnN1bXB0aW9uIG9uIG15Cj4gbGFwdG9wLgoKVGhhdCBkb2Vzbid0IGludm9sdmUgdGhl
IFBDSWUgcG9ydCBQTSwgaG93ZXZlci4KCj4gQnV0IEkgZ3Vlc3MgSSBzaG91bGQgcmV0ZXN0IHdp
dGggY2FsbGluZyBwY2lfZDNjb2xkX2Rpc2FibGUKPiBmcm9tIG5vdXZlYXUgaW5zdGVhZD8gT3Ig
aXMgdGhlcmUgYSBkaWZmZXJlbnQgcHJlZmVyYWJsZSB3YXkgb2YKPiB0ZXN0aW5nIHRoaXM/CgpU
aGVyZSBpcyBhIHN5c2ZzIGF0dHJpYnV0ZSBjYWxsZWQgImQzY29sZF9hbGxvd2VkIiB3aGljaCBj
YW4gYmUgdXNlZApmb3IgImJsb2NraW5nIiBEM2NvbGQsIHNvIGNhbiB5b3UgcGxlYXNlIHJldGVz
dCB1c2luZyB0aGF0PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
