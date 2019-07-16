Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E466A680
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 12:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC626E110;
	Tue, 16 Jul 2019 10:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD656E110
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:27:58 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o101so20481208ota.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 03:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InV49k/g4n8kkX89qOOPmJMNqj/Q2fuW/aBD6hhUrXA=;
 b=iYW09zHtK/TLMWQJfOyGRRAdFOJiXV567JNfklbGFqprZvBSdZ8HYQkxolV3XgGDln
 UVXQPup6NLFoLWjG4acai605AsLfKdbwdge91AgdVsdBMEMTCxFp1s7x64gpNzqSGrdH
 ZxYigR+ffygGz2kP+h1wEBV5CKzM/dZaEbi2X3huymas9fcuh23h7MaX+PiSYoX3j7dF
 tXHIl/4bjs4Ty+dZsF8uIyM7Mz/sVH60yQ8BB1txQvPX3Ie0NpnRRxv3DEUZkwVhESgo
 jXGd3GuhNhHDff0tJNumuWGpwu/TduuwUJk/nxUzMQU4MU6+lM7LY5p9pjS3e+LDQjg9
 YZvA==
X-Gm-Message-State: APjAAAUIYFqq2lZOsKl26CG4lKJI9WinNFEh449RQABSLuyJ5sHBni12
 cuxj1NNahaD5+hB2aI3SXeSvsaQrXAQ2jijrTw0=
X-Google-Smtp-Source: APXvYqwNxa4ESy69KwPnztnMj6Vvcz27ajFqshxcVQs8WVfJTe1ykblJ31kt949Zta05jFdEjaTLyPSqql/gvXR4C4Y=
X-Received: by 2002:a05:6830:8a:: with SMTP id
 a10mr18446800oto.167.1563272877613; 
 Tue, 16 Jul 2019 03:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563269894.git.viresh.kumar@linaro.org>
 <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
 <20190716101416.ntk353cfnrcykoek@vireshk-i7>
In-Reply-To: <20190716101416.ntk353cfnrcykoek@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 16 Jul 2019 12:27:46 +0200
Message-ID: <CAJZ5v0jZfmXN=juHX11vmSFj=vxS2Mu_b-OZprB9S+3LJjDb+g@mail.gmail.com>
Subject: Re: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Robert Moore <robert.moore@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Javi Merino <javi.merino@kernel.org>, Erik Schmauss <erik.schmauss@intel.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTI6MTQgUE0gVmlyZXNoIEt1bWFyIDx2aXJlc2gua3Vt
YXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNi0wNy0xOSwgMTI6MDYsIFJhZmFlbCBKLiBX
eXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6NDkgQU0gVmlyZXNo
IEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxv
LAo+ID4gPgo+ID4gPiBOb3cgdGhhdCBjcHVmcmVxIGNvcmUgc3VwcG9ydHMgdGFraW5nIFFvUyBy
ZXF1ZXN0cyBmb3IgbWluL21heCBjcHUKPiA+ID4gZnJlcXVlbmNpZXMsIGxldHMgbWlncmF0ZSBy
ZXN0IG9mIHRoZSB1c2VycyB0byB1c2luZyB0aGVtIGluc3RlYWQgb2YgdGhlCj4gPiA+IHBvbGlj
eSBub3RpZmllcnMuCj4gPgo+ID4gVGVjaG5pY2FsbHksIHRoaXMgc3RpbGwgaXMgbGludXgtbmV4
dCBvbmx5LiA6LSkKPgo+IFRydWUgOikKPgo+ID4gPiBUaGUgQ1BVRlJFUV9OT1RJRlkgYW5kIENQ
VUZSRVFfQURKVVNUIGV2ZW50cyBvZiB0aGUgcG9saWN5IG5vdGlmaWVycyBhcmUKPiA+ID4gcmVt
b3ZlZCBhcyBhIHJlc3VsdCwgYnV0IHdlIGhhdmUgdG8gYWRkIENQVUZSRVFfQ1JFQVRFX1BPTElD
WSBhbmQKPiA+ID4gQ1BVRlJFUV9SRU1PVkVfUE9MSUNZIGV2ZW50cyB0byBpdCBmb3IgdGhlIGFj
cGkgc3R1ZmYgc3BlY2lmaWNhbGx5LiBTbwo+ID4gPiB0aGUgcG9saWN5IG5vdGlmaWVycyBhcmVu
J3QgY29tcGxldGVseSByZW1vdmVkLgo+ID4KPiA+IFRoYXQncyBub3QgZW50aXJlbHkgYWNjdXJh
dGUsIGJlY2F1c2UgYXJjaF90b3BvbG9neSBpcyBnb2luZyB0byB1c2UKPiA+IENQVUZSRVFfQ1JF
QVRFX1BPTElDWSBub3cgdG9vLgo+Cj4gWWVhaCwgSSB0aG91Z2h0IGFib3V0IHRoYXQgd2hpbGUg
d3JpdGluZyB0aGlzIHBhdGNoc2V0IGFuZAo+IGNvdmVybGV0dGVyLiBCdXQgaGFkIGl0IG5vdCBi
ZWVuIHJlcXVpcmVkIGZvciBBQ1BJLCBJIHdvdWxkIGhhdmUgZG9uZQo+IGl0IGRpZmZlcmVudGx5
IGZvciB0aGUgYXJjaC10b3BvbG9neSBjb2RlLiBNYXliZSBkaXJlY3QgY2FsbGluZyBvZgo+IGFy
Y2gtdG9wb2xvZ3kgcm91dGluZSBmcm9tIGNwdWZyZXEgY29yZS4gSSB3YW50ZWQgdG8gZ2V0IHJp
ZCBvZiB0aGUKPiBwb2xpY3kgbm90aWZpZXJzIGNvbXBsZXRlbHkgYnV0IEkgY291bGRuJ3QgZmlu
ZCBhIGJldHRlciB3YXkgb2YgZG9pbmcKPiBpdCBmb3IgQUNQSSBzdHVmZi4KPgo+ID4gPiBCb290
IHRlc3RlZCBvbiBteSB4ODYgUEMgYW5kIEFSTSBoaWtleSBib2FyZC4gTm90aGluZyBsb29rZWQg
YnJva2VuIDopCj4gPiA+Cj4gPiA+IFRoaXMgaGFzIGFscmVhZHkgZ29uZSB0aHJvdWdoIGJ1aWxk
IGJvdCBmb3IgYSBmZXcgZGF5cyBub3cuCj4gPgo+ID4gU28gSSdkIHByZWZlciBwYXRjaGVzIFs1
LThdIHRvIGdvIHJpZ2h0IGFmdGVyIHRoZSBmaXJzdCBvbmUgYW5kIHRoZW4KPiA+IGRvIHRoZSBj
bGVhbnVwcyBvbiB0b3Agb2YgdGhhdCwgYXMgc29tZWJvZHkgbWF5IHdhbnQgdG8gYmFja3BvcnQg
dGhlCj4gPiBlc3NlbnRpYWwgY2hhbmdlcyB3aXRob3V0IHRoZSBjbGVhbnVwcy4KPgo+IEluIHRo
ZSBleGNlcHRpb25hbCBjYXNlIHdoZXJlIG5vYm9keSBmaW5kcyBhbnl0aGluZyB3cm9uZyB3aXRo
IHRoZQo+IHBhdGNoZXMgKGhpZ2hseSB1bmxpa2VseSksIGRvIHlvdSB3YW50IG1lIHRvIHJlc2Vu
ZCB3aXRoIHJlb3JkZXJpbmcgb3IKPiB5b3UgY2FuIHJlb3JkZXIgdGhlbSB3aGlsZSBhcHBseWlu
Zz8gVGhlcmUgYXJlIG5vIGRlcGVuZGVuY2llcyBiZXR3ZWVuCj4gdGhvc2UgcGF0Y2hlcyBhbnl3
YXkuCgpQbGVhc2UgcmVzZW5kIHRoZSByZW9yZGVyZWQgc2V0IHdoZW4gdGhlIG1lcmdlIHdpbmRv
dyBjbG9zZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
