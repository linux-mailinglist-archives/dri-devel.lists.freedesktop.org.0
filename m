Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7B18ACF
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 15:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53D189CA0;
	Thu,  9 May 2019 13:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2A689C9B;
 Thu,  9 May 2019 13:37:05 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOjE8-0003T4-SR; Thu, 09 May 2019 13:36:49 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 613DD20268735; Thu,  9 May 2019 15:36:47 +0200 (CEST)
Date: Thu, 9 May 2019 15:36:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: console: hack up console_lock more v3
Message-ID: <20190509133647.GX2623@hirez.programming.kicks-ass.net>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509123104.GQ2589@hirez.programming.kicks-ass.net>
 <CAKMK7uGuOFGEuw1m_fiBfGbAEY0eeoDEFtP7Htt8-RCzD66MGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGuOFGEuw1m_fiBfGbAEY0eeoDEFtP7Htt8-RCzD66MGw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3CNghomBvawXt39KUULl2no8YKZp9OCsMHGGo+d4vY=; b=QSMKGU9y7AlcT7/k7D/Szm2yH
 LIbJva8UKnIQv5o1v0AjlvexOXaEtc2xlrFGSSIwQN4PNuC+KvgJAW3Taak/bKS8wioU6Lj+PDqAV
 5FqCYx0qjJ212tmfb6gBV8dv/gtKDYLw/efRQazndKIOqb5an6AFuim5SoWC8FxjAQ0cmhytPyrtI
 OhSH5p3Byn8fEhNvdfLQM8fz95glNggAcecni9jCVX9IA2ZOClVImLpRNyovV+kfzyRbkc0lAlF46
 rz63s72/1EkCmASPhSkO5PO9/l0svnRdDNXxbEHArDe3Bcqbd3fP8OEcMeCyb10YpjQ0hVs0SH5nP
 J9TuRwfNg==;
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDM6MDY6MDlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDI6MzEgUE0gUGV0ZXIgWmlqbHN0cmEgPHBl
dGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDA5LCAyMDE5IGF0IDAy
OjA5OjAzUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IEZpeCB0aGlzIGJ5IGNy
ZWF0aW5nIGEgcHJpbmt0X3NhZmVfdXAoKSB3aGljaCBjYWxscyB3YWtlX3VwX3Byb2Nlc3MKPiA+
ID4gb3V0c2lkZSBvZiB0aGUgc3BpbmxvY2suIFRoaXMgaXNuJ3QgY29ycmVjdCBpbiBmdWxsIGdl
bmVyYWxpdHksIGJ1dAo+ID4gPiBnb29kIGVub3VnaCBmb3IgY29uc29sZV9sb2NrOgo+ID4gPgo+
ID4gPiAtIGNvbnNvbGVfbG9jayBkb2Vzbid0IHVzZSBpbnRlcnJ1cHRpYmxlIG9yIGtpbGxhYmxl
IG9yIHRpbWVvdXQgZG93bigpCj4gPiA+ICAgY2FsbHMsIGhlbmNlIGFuIHVwKCkgaXMgdGhlIG9u
bHkgdGhpbmcgdGhhdCBjYW4gd2FrZSB1cCBhIHByb2Nlc3MuCj4gPgo+ID4gV3JvbmcgOi8gQW55
IHRhc2sgY2FuIGJlIHdva2VuIGF0IGFueSByYW5kb20gdGltZS4gV2UgbXVzdCwgYXQgYWxsCj4g
PiB0aW1lcywgYXNzdW1lIHNwdXJpb3VzIHdha2V1cHMgd2lsbCBoYXBwZW4uCj4gCj4gT3V0IG9m
IGN1cmlvc2l0eSwgd2hlcmUgZG8gdGhlc2UgY29tZSBmcm9tPyBJIGtub3cgYWJvdXQgdGhlIHJh
Y2VzCj4gd2hlcmUgeW91IG5lZWQgdG8gcmVjaGVjayBvbiB0aGUgd2FpdGVyIHNpZGUgdG8gYXZv
aWQgZ2V0dGluZyBzdHVjaywKPiBidXQgZGlkbid0IGtub3cgYWJvdXQgdGhpcy4gQXJlIHRoZXNl
IGVhcmxpZXIgKHBvc3NpYmx5IHNwdXJpb3VzKQo+IHdha2V1cHMgdGhhdCBnb3QgaGVsZCB1cCBh
bmQgZGVsYXllZCBmb3IgYSB3aGlsZSwgdGhlbiBoaXQgdGhlIHRhc2sKPiBtdWNoIGxhdGVyIHdo
ZW4gaXQncyBhbHJlYWR5IGNvbnRpbnVlZCBkb2luZyBzb21ldGhpbmcgZWxzZT8KClllcywgdGhp
cy4gU28gdGhleSBhbGwgbW9yZSBvciBsZXNzIGhhdmUgdGhlIGZvcm06CgpDUFUwCQlDUFUxCgoJ
CWVucXVldWVfd2FpdGVyKCkKZG9uZSA9IHRydWU7CmlmICh3YWl0ZXJzKQoJCWZvciAoOzspIHsK
CQkgIGlmIChkb25lKQoJCSAgICBicmVhazsKCgkJICAuLi4KCQl9CgoJCWRlcXVldWVfd2FpdGVy
KCkKCgkJZG8gc29tZXRoaW5nIGVsc2UgYWdhaW4KCiAgd2FrZV91cF90YXNrCgkJPGdldHMgd2Fr
ZXVwPgoKClRoZSB3YWtlX3EgdGhpbmcgbWFkZSB0aGUgYWJvdmUgbXVjaCBtb3JlIGNvbW1vbiwg
YnV0IHdlJ3ZlIGhhZCBpdApmb3JldmVyLgoKPiBPciBldmVuCj4gbW9yZSByYW5kb20sIGFuZCBl
dmVuIGlmIEkgbmV2ZXIgcHV0IGEgdGFzayBvbiBhIHdhaXQgbGlzdCBvciBhbnl0aGluZwo+IGVs
c2UsIGV2ZXIsIGl0IGNhbiBnZXQgd29rZW4gc3B1cmlvdXNseT8KCkkgaGFkIHBhdGNoZXMgdGhh
dCBkaWQgdGhhdCBvbiBwdXJwb3NlLCBidXQgbm8uCgo+ID4gU29tZXRoaW5nIGxpa2UgdGhlIGJl
bG93IG1pZ2h0IHdvcmsuCj4gCj4gWWVhaCB0aGF0IGxvb2tzIGxpa2UgdGhlIHByb3BlciBmaXgu
IEkgZ3Vlc3Mgc2VtYXBob3JlcyBhcmUgdW5jcml0aWNhbAo+IGVub3VnaCB0aGF0IHdlIGNhbiBy
b2xsIHRoaXMgb3V0IGZvciBldmVyeW9uZS4gVGhhbmtzIGZvciB0aGUgaGludC4KCkl0J3MgYWN0
dWFsbHkgYW4gb3B0aW1pemF0aW9uIHRoYXQgd2UgbmV2ZXIgZGlkIGJlY2F1c2Ugc2VtYXBob3Jl
cyBhcmUKc28gdW5jcml0aWNhbCA6LSkKClRoZSB0aGluZyBpcywgYnkgZGVsYXlpbmcgdGhlIHdh
a3VwIHVudGlsIGFmdGVyIHdlJ3ZlIHJlbGVhc2VkIHRoZQpzcGlubG9jaywgdGhlIHdhaXRlciB3
aWxsIG5vdCBjb250ZW5kIG9uIHRoZSBzcGlubG9jayB0aGUgbW9tZW50IGl0Cndha2VzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
