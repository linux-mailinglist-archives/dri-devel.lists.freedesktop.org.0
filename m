Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B31B9DA
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 17:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBB489FE8;
	Mon, 13 May 2019 15:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D6A89FE8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 15:23:50 +0000 (UTC)
Received: from [179.179.44.200] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCnd-0003iy-SA; Mon, 13 May 2019 15:23:34 +0000
Date: Mon, 13 May 2019 12:23:27 -0300
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/20] drm: Split out the formats API and move it to a
 common place
Message-ID: <20190513122327.57f9c6ea@coco.lan>
In-Reply-To: <20190513145719.GS17751@phenom.ffwll.local>
References: <20190417154121.GJ13337@phenom.ffwll.local>
 <20190418062229.eyog4i62eg4pr6uf@flea>
 <CAKMK7uHwSjqXwWGt+wQ6oMFWoPqmBxYHL7r+vTOXdYt9KMCYLQ@mail.gmail.com>
 <20190418090221.e57dogn4yx5nwdni@flea>
 <CAKMK7uHN6QfYyzx4DjRT+7VLRi6N9DorQtw2GoDiNGTgie=DXA@mail.gmail.com>
 <20190420225904.GZ4964@pendragon.ideasonboard.com>
 <20190423072554.GW13337@phenom.ffwll.local>
 <20190423154527.GH16111@pendragon.ideasonboard.com>
 <CAKMK7uEFco0LcmbZaSddcpSHwY8tSMhif5rKmqwANnt2zhtzpg@mail.gmail.com>
 <20190511192632.GN13043@pendragon.ideasonboard.com>
 <20190513145719.GS17751@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XecE39z5Wdv1UUdpgjNY8jEJraT3bchBosqiDVEwKac=; b=H0nmENQFZDrtsb3WGjL+nJ69KT
 +fXIpU+tp4CIRwnV+GiOf2ZuYb/PjDqW+bH34swATcxiDuZnoXt0NgCWwwjUvKVVSV+4LSGTEDkxt
 EgaBGgeQXLx3OmLBYd93SgbZClb1EJduca7Wg514zub9bi1EJbXXXPCqTyK2I0c5oZSObRWrlKlA8
 Yy73fDr+lUmikIR3nYOUtTmYEXCm57xPb5KR/uYq4cNV6Flmow0OzvrHf0inaLH9aCMVeDwZh/iMp
 OxxIfEOkSOZCIbnn6mxObPb4uof0Z1j+riFiG3a7d2eBftDChxE55rtGPvKR8IyyPgkKlMP78iBvH
 REqmF3PA==;
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hans.verkuil@cisco.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, "open list:DMA BUFFER
 SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gTW9uLCAxMyBNYXkgMjAxOSAxNjo1NzoxOSArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IGVzY3JldmV1OgoKPiA+ID4gSSB0aGluayBzbWFsbCBib3V0aXF1ZSB0cmVlcyBh
cmUgYSBwcm9ibGVtIHRoZW1zZWx2ZXMsIG5vdCBhIHNvbHV0aW9uLgo+ID4gPiBTbyBpZiB5b3Un
cmUgY3JlYXRpbmcgYSBuZXcgc21hbGwgYm91dGlxdWUgdHJlZSB0byBmaXggYSBwcm9ibGVtLCB5
b3UKPiA+ID4gdGhlbiBoYXZlIDIuIFllcywgYXNzdW1pbmcgc3VmZmljaWVudCBleHBlbmRpdHVy
ZSBvZiBlbmVyZ3kgaXQgY2FuIGJlCj4gPiA+IG1hZGUgdG8gd29yaywgYnV0IEknZCBwcmVmZXIg
dG8gbWFrZSBteSBvd24gbGlmZSBhcyBlYXN5IGFuZCBsYXp5IGFzCj4gPiA+IHBvc3NpYmxlIDot
KSBBbmQgSSB0aGluayBJJ3ZlIGJlZW4gZmFpcmx5IHN1Y2Nlc3NmdWwgYXQgdGhhdCB3aXRoaW4K
PiA+ID4gZHJpdmVycy9ncHUgYXQgbGVhc3QuCj4gPiA+IAo+ID4gPiBJbW8gdGhlIHByb3BlciBm
aXggaXMgdG8gbWVyZ2UgdjRsIGFuZCBkcm0sIGF0IGEgcHJvY2Vzcy9tYWludGFpbmVyCj4gPiA+
IGxldmVsLiBUaGF0IHdvdWxkIHNvbHZlIGJvdGggdGhlIG9yaWdpbmFsIGlzc3VlIGFuZCB0aGUg
Mm5kYXJ5IG9uZSBvZgo+ID4gPiB0aGUgcGVybWFuZW50IHRvcGljIGJyYW5jaC4gIAo+ID4gCj4g
PiBQcm9wb3NhbHMgYXJlIHdlbGNvbWUgOy0pICAKPiAKPiBJJ20gYWxyZWFkeSBzb21ld2hhdCB1
bnBvcHVsYXIgYXQgTFBDL2xrbWwva2VybmVsLWF0LWxhcmdlLCBJIGRvbid0IHdhbnQKPiB0byBt
YWtlIHRoaXMgd29yc2UuICBUaGF0J3Mgd2h5IEkgZG9uJ3Qgd2FudCB0byBvZmZpY2lhbGx5IHB1
c2ggZm9yCj4gYW55dGhpbmcgaGVyZSBteXNlbGYsIG5vciBiZSBpbiBhbnkgb3RoZXIgd2F5IGlu
dm9sdmVkIGluIGFuIGVmZm9ydCB0bwo+IGZpZ3VyZSBvdXQgdjRsIGdvdmVybmFuY2UgYW5kIG1h
aW50YWluZXJzaGlwIHJ1bGVzLgo+IAo+IFdoYXQgSSB0aGluayBpcyByZXF1aXJlZCBmb3IgZWZm
aWNpZW50IGNvbGxhYm9yYXRpb24gd2l0aCBkcm0gKG5vIG1hdHRlcgo+IGhvdyB3ZSBpbXBsZW1l
bnQgdGhhdCBpbiB0aGUgZGV0YWlscyBvbmNlIHdlJ3JlIHJlYWR5IGZvciB0aGF0IHN0ZXApIGlz
Cj4gc29tZSBraW5kIG9mIGdyb3VwIG1haW50YWluZXJzaGlwIG1vZGVsLiBEb2Vzbid0IG5lZWQg
dG8gYmUgYXMgZXh0cmVtZSBhcwo+IGRybS1taXNjLCBidXQgSSB0aGluayBhdCBsZWFzdCBzb21l
dGhpbmcgbGlrZSB0aGUgc29jIHRyZWUgKHdoaWxlIGl0IHdhcwo+IHN0aWxsIGEgYml0IG1vcmUg
bGltaXRlZCBhcyBhcm0tc29jKS4gT3RoZXJ3aXNlIHRoZSBpbXBlbmRlbmNlIG1pc21hdGNoCj4g
YmV0d2VlbiBob3cgZHJtIHJvbGxzIGFuZCBob3cgdjRsIHJvbGxzIGlzIHByb2JhYmx5IHdheSB0
b28gbXVjaC4gRnJvbSBteQo+IHVuZGVyc3RhbmRpbmcgdjRsIGlzIHdvcmtpbmcgZGlmZmVyZW50
bHkuCj4gCj4gQWxzbywgdGhyb3VnaCBzaGVlciBpbmVydGlhIG9mIHNpemUsIEkgZG9uJ3QgdGhp
bmsgaXQnbGwgYmUgZWFzaWVyIHRvCj4gYWxpZ24gZHJtIHdpdGggdGhlIHY0bCBtb2RlbC4gU28g
dGhhdCBvcHRpb24gaXMgbm90IHJlYWxpc3RpYy4KCkkgZG9uJ3QgdGhpbmsgaXQgaXMgcmVhbGlz
dGljIHRyeWluZyB0byBhbGlnbiBWNEwyIG1vZGVsIHRvIGV2ZXJ5IHNpbmdsZSAKb3RoZXIgc3Vi
c3lzdGVtcyB3ZSB1c2UuIFdlIGhhdmUgYSBsb3Qgb2YgYWxpZ25tZW50IHdpdGggYWxzYSwgd2l0
aCBldmVuCmluY3JlYXNlZCBkdXJpbmcgdGhpcyBtZXJnZSB3aW5kb3cgZHVlIHRvIHNvbWUgZHJp
dmVycyBvbiBtZWRpYSBzaGFyaW5nIAptZWRpYSBjb250cm9sbGVyIHJlc291cmNlcyB3aXRoIHVz
Yi1hdWRpby4gV2UgYWxzbyBoYXZlIGxvdHMgb2YgYWxpZ25tZW50CndpdGggaTJjLCBhcyB3ZSB1
c2UgYSBsb3Qgb2Ygc3R1ZmYgdGhlcmUsIGFuZCBmcm9tIHRpbWUgdG8gdGltZSB0aGV5Cm5lZWQg
dG8gYWRkIG5ldyBmZWF0dXJlcyBkdWUgdG8gb3VyIG5lZWRzLiBUaGUgc2FtZSBpcyB0cnVlIGFs
c28gZm9yCmlucHV0IGFuZCBmb3Igb3RoZXIgc3Vic3lzdGVtcyBhbmQgYXJjaC9zdWItYXJjaCB0
cmVlcy4KClRoYXQgZG9lc24ndCBtZWFuIGF0IGFsbCB0aGF0IGV2ZXJ5Ym9keSBzaG91bGQgdXNl
IHRoZSBzYW1lIG1haW50YWluZXJzaGlwCm1vZGVsLiBFYWNoIHN1YnN5c3RlbSBzaG91bGQgdXNl
IHdoYXRldmVyIHN1aXRzIGJlc3QuCgpUaGF0J3Mgc2FpZCwgYWZ0ZXIgZm9sbG93aW5nIHRoaXMg
dGhyZWFkIGZvciBhIHdoaWxlLCBJJ20gc3RhcnRpbmcgdG8KY29udmluY2UgdGhhdCBpdCB3b3Vs
ZG4ndCBldmVuIGJlIHJlYWxpc3RpYyB0byBoYXZlIGEgY29tbW9uIGZvdXJjYyAKQVBJIGZvciBi
b3RoIHN1YnN5c3RlbXMuIFRoZSBpbnRlcm5hbCByZXF1aXJlbWVudHMgZnJvbSBlYWNoIHN1YnN5
c3RlbQphcmUgZGlmZmVyZW50LCBhbmQsIGFzIGl0IHdhcyBhbHJlYWR5IHBvaW50ZWQgaW4gdGhp
cyB0aHJlYWQsIHRoYXQncwpiYXNpY2FsbHkgd2h5IERSTSBlbmRlZCBieSBoYXZpbmcgdGhlaXIg
b3duIHdheSBvZiBkb2luZyB0aGF0LgoKWWV0LCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGhhdmUg
YXQgbGVhc3QgYSBzaW5nbGUgbm9tZW5jbGF0dXJlIGZvcgpib3RoIHN5c3RlbXMgdG8gdXNlLCBi
dXQgaXQgY291bGQgYmUgYSBzaW1wbGUgYXMgd2hhdCB3ZSBhbHJlYWR5IGRvCndpdGggb3RoZXIg
Y29tbW9uIHJlc291cmNlcywgbGlrZToKCglEb2N1bWVudGF0aW9uL2lvY3RsL2lvY3RsLW51bWJl
ci50eHQKCklmIHdlIGtlZXAgdGhlIGZvdXJjYyBjb2RlcyB0aGVyZSBzb3J0ZWQsIGlmIG9uZSBz
dWJzeXN0ZW0gd291bGQKYWRkIGEgY29uZmxpY3RpbmcgY29kZSwgaXQgd291bGQgYmUgZWFzeSB0
byBub3RpY2UgYXQgbGludXgtbmV4dC4KClRoYW5rcywKTWF1cm8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
