Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE31055FA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121D16F3D1;
	Thu, 21 Nov 2019 15:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90E36F3D1;
 Thu, 21 Nov 2019 15:47:25 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b16so3312187otk.9;
 Thu, 21 Nov 2019 07:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cENdR/YNP8WrkCnrRlfKo/wx15sIIepZ4jmxr2d85Gc=;
 b=dnceOKYAttOJs0332WEGkBvNXQAY6QwnpXGdhnYenYmXRUL9H4iUQ+nnEuHvc7gGGL
 DGU13TC3CnMWo2te4zZE+j0iElLOi+BZMks64Roof8WiUaNFF2qjUzZpaBKN11RynrvI
 1qqrEYyIW44IDGBUn112BtoInLhw3nTfrNXU6CCBarG33H0a0BqLTGsjfs70xvDLinFZ
 e904yj7hEPKSJ21Nto6zdj/61p9SiXEjIIY5AJih2jwNIEJZVdb061ylY0v9l6yoABZB
 u5wXVkbRa7Gq+Pdgxxd3AKs28ycXjfzdJBzV3vQjgiuinEjR2U8a5t6AC29Ld904xToK
 XhSQ==
X-Gm-Message-State: APjAAAVyUuB04mhs2drWmEijnhvYSOAp054xxiGx5l+Cl/SXQUvta8lf
 Fb9cdB/p86coyew22d61lpV3i/z1BqvwEziW+fc=
X-Google-Smtp-Source: APXvYqw1iwAHzb0NCqnuFton0CCPRqV6XwmgvO+O7iPDqA3/HjpBzqll2kKyoYasjd6DGrsXRz/cJtR9Xj0PRUbIR3g=
X-Received: by 2002:a05:6830:103:: with SMTP id
 i3mr7223613otp.266.1574351245103; 
 Thu, 21 Nov 2019 07:47:25 -0800 (PST)
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
In-Reply-To: <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 16:47:13 +0100
Message-ID: <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTo1MyBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMjo0NiBQTSBNaWth
IFdlc3RlcmJlcmcKPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MzQ6MjJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEyOjI4IFBNIE1pa2EgV2Vz
dGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMToyOTozM1BNICswMTAwLCBSYWZhZWwg
Si4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+ID4gbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQgc3lz
dGVtcyB3aGVyZSB0aGUgR1BVIHdhcyB1bmRlciB0aGUgIlBDSQo+ID4gPiA+ID4gPiBFeHByZXNz
IFJvb3QgUG9ydCIgKG5hbWUgZnJvbSBsc3BjaSkgYW5kIG9uIHRob3NlIHN5c3RlbXMgYWxsIG9m
IHRoYXQKPiA+ID4gPiA+ID4gc2VlbXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQn
cyBpbmRlZWQganVzdCB0aGUgMHgxOTAxIG9uZSwKPiA+ID4gPiA+ID4gd2hpY2ggYWxzbyBleHBs
YWlucyBNaWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29ya3MgYXMgZGV2aWNlcwo+
ID4gPiA+ID4gPiBuZXZlciBnZXQgcG9wdWxhdGVkIHVuZGVyIHRoaXMgcGFydGljdWxhciBicmlk
Z2UgY29udHJvbGxlciwgYnV0IHVuZGVyCj4gPiA+ID4gPiA+IHRob3NlICJSb290IFBvcnQicwo+
ID4gPiA+ID4KPiA+ID4gPiA+IEl0IGFsd2F5cyBpcyBhIFBDSWUgcG9ydCwgYnV0IGl0cyBsb2Nh
dGlvbiB3aXRoaW4gdGhlIFNvQyBtYXkgbWF0dGVyLgo+ID4gPiA+Cj4gPiA+ID4gRXhhY3RseS4g
SW50ZWwgaGFyZHdhcmUgaGFzIFBDSWUgcG9ydHMgb24gQ1BVIHNpZGUgKHRoZXNlIGFyZSBjYWxs
ZWQKPiA+ID4gPiBQRUcsIFBDSSBFeHByZXNzIEdyYXBoaWNzLCBwb3J0cyksIGFuZCB0aGUgUENI
IHNpZGUuIEkgdGhpbmsgdGhlIElQIGlzCj4gPiA+ID4gc3RpbGwgdGhlIHNhbWUuCj4gPiA+ID4K
Pgo+IHllYWgsIEkgbWVhbnQgdGhlIGJyaWRnZSBjb250cm9sbGVyIHdpdGggdGhlIElEIDB4MTkw
MSBpcyBvbiB0aGUgQ1BVCj4gc2lkZS4gQW5kIGlmIHRoZSBOdmlkaWEgR1BVIGlzIG9uIGEgcG9y
dCBvbiB0aGUgUENIIHNpZGUgaXQgYWxsIHNlZW1zCj4gdG8gd29yayBqdXN0IGZpbmUuCgpCdXQg
dGhhdCBtYXkgaW52b2x2ZSBkaWZmZXJlbnQgQU1MIHRvbywgbWF5IGl0IG5vdD8KCj4gPiA+ID4g
PiBBbHNvIHNvbWUgY3VzdG9tIEFNTC1iYXNlZCBwb3dlciBtYW5hZ2VtZW50IGlzIGludm9sdmVk
IGFuZCB0aGF0IG1heQo+ID4gPiA+ID4gYmUgbWFraW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9u
IHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBTb0MgYW5kIHRoZQo+ID4gPiA+ID4gR1BVIGF0IHRo
ZSB0aW1lIG9mIGl0cyBpbnZvY2F0aW9uIHdoaWNoIHVuZm9ydHVuYXRlbHkgYXJlIG5vdCBrbm93
biB0bwo+ID4gPiA+ID4gdXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSG93ZXZlciwgaXQgbG9va3Mg
bGlrZSB0aGUgQU1MIGludm9rZWQgdG8gcG93ZXIgZG93biB0aGUgR1BVIGZyb20KPiA+ID4gPiA+
IGFjcGlfcGNpX3NldF9wb3dlcl9zdGF0ZSgpIGdldHMgY29uZnVzZWQgaWYgaXQgaXMgbm90IGlu
IFBDSSBEMCBhdAo+ID4gPiA+ID4gdGhhdCBwb2ludCwgc28gaXQgbG9va3MgbGlrZSB0aGF0IEFN
TCB0cmllcyB0byBhY2Nlc3MgZGV2aWNlIG1lbW9yeSBvbgo+ID4gPiA+ID4gdGhlIEdQVSAoYmV5
b25kIHRoZSBQQ0kgY29uZmlnIHNwYWNlKSBvciBzaW1pbGFyIHdoaWNoIGlzIG5vdAo+ID4gPiA+
ID4gYWNjZXNzaWJsZSBpbiBQQ0kgcG93ZXIgc3RhdGVzIGJlbG93IEQwLgo+ID4gPiA+Cj4gPiA+
ID4gT3IgdGhlIFBDSSBjb25maWcgc3BhY2Ugb2YgdGhlIEdQVSB3aGVuIHRoZSBwYXJlbnQgcm9v
dCBwb3J0IGlzIGluIEQzaG90Cj4gPiA+ID4gKGFzIGl0IGlzIHRoZSBjYXNlIGhlcmUpLiBBbHNv
IHRoZW4gdGhlIEdQVSBjb25maWcgc3BhY2UgaXMgbm90Cj4gPiA+ID4gYWNjZXNzaWJsZS4KPiA+
ID4KPiA+ID4gV2h5IHdvdWxkIHRoZSBwYXJlbnQgcG9ydCBiZSBpbiBEM2hvdCBhdCB0aGF0IHBv
aW50PyAgV291bGRuJ3QgdGhhdCBiZQo+ID4gPiBhIHN1c3BlbmQgb3JkZXJpbmcgdmlvbGF0aW9u
Pwo+ID4KPiA+IE5vLiBXZSBwdXQgdGhlIEdQVSBpbnRvIEQzaG90IGZpcnN0LCB0aGVuIHRoZSBy
b290IHBvcnQgYW5kIHRoZW4gdHVybgo+ID4gb2ZmIHRoZSBwb3dlciByZXNvdXJjZSAod2hpY2gg
aXMgYXR0YWNoZWQgdG8gdGhlIHJvb3QgcG9ydCkgcmVzdWx0aW5nCj4gPiB0aGUgdG9wb2xvZ3kg
ZW50ZXJpbmcgRDNjb2xkLgo+ID4KPgo+IElmIHRoZSBrZXJuZWwgZG9lcyBhIEQwIC0+IEQzaG90
IC0+IEQwIGN5Y2xlIHRoaXMgd29ya3MgYXMgd2VsbCwgYnV0Cj4gdGhlIHBvd2VyIHNhdmluZ3Mg
YXJlIHdheSBsb3dlciwgc28gSSBraW5kIG9mIHByZWZlciBza2lwcGluZyBEM2hvdAo+IGluc3Rl
YWQgb2YgRDNjb2xkLiBTa2lwcGluZyBEM2hvdCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBhbnkgZGlm
ZmVyZW5jZQo+IGluIHBvd2VyIHNhdmluZ3MgaW4gbXkgdGVzdGluZy4KCk9LCgpXaGF0IGV4YWN0
bHkgZGlkIHlvdSBkbyB0byBza2lwIEQzY29sZCBpbiB5b3VyIHRlc3Rpbmc/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
