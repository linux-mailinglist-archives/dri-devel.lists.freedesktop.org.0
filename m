Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DC255B0
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 18:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A6D894FF;
	Tue, 21 May 2019 16:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396A5894EB;
 Tue, 21 May 2019 16:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0D9CD5947D;
 Tue, 21 May 2019 16:32:30 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0CEB1001E6C;
 Tue, 21 May 2019 16:32:26 +0000 (UTC)
Date: Tue, 21 May 2019 12:32:24 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/4] mm, notifier: Add a lockdep map for
 invalidate_range_start
Message-ID: <20190521163224.GE3836@redhat.com>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190520213945.17046-4-daniel.vetter@ffwll.ch>
 <20190521154059.GC3836@redhat.com>
 <CAKMK7uEaKJiT__=dt=ROUP4Kkq1NgwScLJFQcMuBs2GYjMWOLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEaKJiT__=dt=ROUP4Kkq1NgwScLJFQcMuBs2GYjMWOLw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 21 May 2019 16:32:37 +0000 (UTC)
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDY6MDA6MzZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCA1OjQxIFBNIEplcm9tZSBHbGlzc2UgPGpn
bGlzc2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQg
MTE6Mzk6NDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gVGhpcyBpcyBhIHNp
bWlsYXIgaWRlYSB0byB0aGUgZnNfcmVjbGFpbSBmYWtlIGxvY2tkZXAgbG9jay4gSXQncwo+ID4g
PiBmYWlybHkgZWFzeSB0byBwcm92b2tlIGEgc3BlY2lmaWMgbm90aWZpZXIgdG8gYmUgcnVuIG9u
IGEgc3BlY2lmaWMKPiA+ID4gcmFuZ2U6IEp1c3QgcHJlcCBpdCwgYW5kIHRoZW4gbXVubWFwKCkg
aXQuCj4gPiA+Cj4gPiA+IEEgYml0IGhhcmRlciwgYnV0IHN0aWxsIGRvYWJsZSwgaXMgdG8gcHJv
dm9rZSB0aGUgbW11IG5vdGlmaWVycyBmb3IKPiA+ID4gYWxsIHRoZSB2YXJpb3VzIGNhbGxjaGFp
bnMgdGhhdCBtaWdodCBsZWFkIHRvIHRoZW0uIEJ1dCBib3RoIGF0IHRoZQo+ID4gPiBzYW1lIHRp
bWUgaXMgcmVhbGx5IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBlc3BlY2lhbGx5IHdoZW4geW91IHdh
bnQgdG8KPiA+ID4gZXhlcmNpc2UgcGF0aHMgbGlrZSBkaXJlY3QgcmVjbGFpbSBvciBjb21wYWN0
aW9uLCB3aGVyZSBpdCdzIG5vdAo+ID4gPiBlYXN5IHRvIGNvbnRyb2wgd2hhdCBleGFjdGx5IHdp
bGwgYmUgdW5tYXBwZWQuCj4gPiA+Cj4gPiA+IEJ5IGludHJvZHVjaW5nIGEgbG9ja2RlcCBtYXAg
dG8gdGllIHRoZW0gYWxsIHRvZ2V0aGVyIHdlIGFsbG93IGxvY2tkZXAKPiA+ID4gdG8gc2VlIGEg
bG90IG1vcmUgZGVwZW5kZW5jaWVzLCB3aXRob3V0IGhhdmluZyB0byBhY3R1YWxseSBoaXQgdGhl
bQo+ID4gPiBpbiBhIHNpbmdsZSBjaGFsbGNoYWluIHdoaWxlIHRlc3RpbmcuCj4gPiA+Cj4gPiA+
IEFzaWRlOiBTaW5jZSBJIHR5cGVkIHRoaXMgdG8gdGVzdCBpOTE1IG1tdSBub3RpZmllcnMgSSd2
ZSBvbmx5IHJvbGxlZAo+ID4gPiB0aGlzIG91dCBmb3IgdGhlIGludmFsaWF0ZV9yYW5nZV9zdGFy
dCBjYWxsYmFjay4gSWYgdGhlcmUncwo+ID4gPiBpbnRlcmVzdCwgd2Ugc2hvdWxkIHByb2JhYmx5
IHJvbGwgdGhpcyBvdXQgdG8gYWxsIG9mIHRoZW0uIEJ1dCBteQo+ID4gPiB1bmRlc3RhbmRpbmcg
b2YgY29yZSBtbSBpcyBzZXJpb3VzbHkgbGFja2luZywgYW5kIEknbSBub3QgY2xlYXIgb24KPiA+
ID4gd2hldGhlciB3ZSBuZWVkIGEgbG9ja2RlcCBtYXAgZm9yIGVhY2ggY2FsbGJhY2ssIG9yIHdo
ZXRoZXIgc29tZSBjYW4KPiA+ID4gYmUgc2hhcmVkLgo+ID4KPiA+IEkgbmVlZCB0byByZWFkIG1v
cmUgb24gbG9ja2RlcCBidXQgaXQgaXMgbGVnYWwgdG8gaGF2ZSBtbXUgbm90aWZpZXIKPiA+IGlu
dmFsaWRhdGlvbiB3aXRoaW4gZWFjaCBvdGhlci4gRm9yIGluc3RhbmNlIHdoZW4geW91IG11bm1h
cCB5b3UKPiA+IG1pZ2h0IHNwbGl0IGEgaHVnZSBwbWQgYW5kIGl0IHdpbGwgdHJpZ2dlciBhIHNl
Y29uZCBpbnZhbGlkYXRlIHJhbmdlCj4gPiB3aGlsZSB0aGUgbXVubWFwIG9uZSBpcyBub3QgZG9u
ZSB5ZXQuIFdvdWxkIHRoYXQgdHJpZ2dlciB0aGUgbG9ja2RlcAo+ID4gaGVyZSA/Cj4gCj4gRGVw
ZW5kcyBob3cgaXQncyBuZXN0aW5nLiBJJ20gd3JhcHBpbmcgdGhlIGFubm90YXRpb24gb25seSBq
dXN0IGFyb3VuZAo+IHRoZSBpbmRpdmlkdWFsIG1tdSBub3RpZmllciBjYWxsYmFjaywgc28gaWYg
dGhlIG5lc3RpbmcgaXMganVzdAo+IC0gbXVubWFwIHN0YXJ0cwo+IC0gaW52YWxpZGF0ZV9yYW5n
ZV9zdGFydCAjMQo+IC0gd2Ugbm90aWNlZCB0aGF0IHRoZXJlJ3MgYSBodWdlIHBtZCB3ZSBuZWVk
IHRvIHNwbGl0Cj4gLSBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0ICMyCj4gLSBpbnZhbGlkYXRlX3Jl
YW5nZV9lbmQgIzIKPiAtIGludmFsaWRhdGVfcmFuZ2VfZW5kICMxCj4gLSBtdW5tYXAgaXMgZG9u
ZQoKWWVhaCB0aGlzIGlzIGhvdyBpdCBsb29rcy4gQWxsIHRoZSBjYWxsYmFjayBmcm9tIHJhbmdl
X3N0YXJ0ICMxIHdvdWxkCmhhcHBlbnMgYmVmb3JlIHJhbmdlX3N0YXJ0ICMyIGhhcHBlbnMgc28g
d2Ugc2hvdWxkIGJlIGZpbmUuCgo+IAo+IEJ1dCBpZiBvdG9oIGl0J3Mgb2sgdG8gdHJpZ2dlciB0
aGUgMm5kIGludmFsaWRhdGUgcmFuZ2UgZnJvbSB3aXRoaW4gYW4KPiBtbXVfbm90aWZpZXItPmlu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnQgY2FsbGJhY2ssIHRoZW4gbG9ja2RlcCB3aWxsIGJlCj4gcGlz
c2VkIGFib3V0IHRoYXQuCgpObyB0aGF0IHdvdWxkIGJlIGlsbGVnYWwgZm9yIGEgY2FsbGJhY2sg
dG8gZG8gdGhhdC4gVGhlcmUgaXMgbm8gZXhpc3RpbmcKY2FsbGJhY2sgdGhhdCB3b3VsZCBkbyB0
aGF0IGF0IGxlYXN0IEFGQUlLLiBTbyB3ZSBjYW4ganVzdCBzYXkgdGhhdCBpdAppcyBpbGxlZ2Fs
LiBJIHdvdWxkIG5vdCBzZWUgdGhlIHBvaW50LgoKPiAKPiA+IFdvcnN0IGNhc2UgaSBjYW4gdGhp
bmsgb2YgaXMgMiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGNoYWluIG9uZSBhZnRlcgo+ID4gdGhl
IG90aGVyLiBJIGRvbid0IHRoaW5rIHlvdSBjYW4gdHJpZ2dlcnMgYSAzIGxldmVscyBuZXN0aW5n
IGJ1dCBtYXliZS4KPiAKPiBMb2NrZGVwIGhhcyBzcGVjaWFsIG5lc3RpbmcgYW5ub3RhdGlvbnMu
IEkgdGhpbmsgaXQnZCBiZSBtb3JlIGFuIGlzc3VlCj4gb2YgZ2V0dGluZyB0aG9zZSBmdW5uZWxl
ZCB0aHJvdWdoIHRoZSBlbnRpcmUgY2FsbCBjaGFpbiwgYXNzdW1pbmcgd2UKPiByZWFsbHkgbmVl
ZCB0aGF0LgoKSSB0aGluayB3ZSBhcmUgZmluZS4gU28gdGhpcyBwYXRjaCBsb29rcyBnb29kLgoK
UmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
