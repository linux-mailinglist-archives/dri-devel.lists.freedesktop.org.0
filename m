Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEEA4ED6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 07:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A037989B60;
	Mon,  2 Sep 2019 05:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101C89B60
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 05:28:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F00BF307CDE7;
 Mon,  2 Sep 2019 05:28:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 579F55D6B7;
 Mon,  2 Sep 2019 05:28:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E46B16E08; Mon,  2 Sep 2019 07:28:52 +0200 (CEST)
Date: Mon, 2 Sep 2019 07:28:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
 <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
 <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
 <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 02 Sep 2019 05:28:54 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMTA6NDk6MjVBTSAtMDcwMCwgRGF2aWQgUmlsZXkgd3Jv
dGU6Cj4gSGkgR2VyZCwKPiAKPiBPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCA0OjE2IEFNIEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiAgIEhpLAo+ID4KPiA+
ID4gPiA+IC0gICAgIGtmcmVlKHZidWYtPmRhdGFfYnVmKTsKPiA+ID4gPiA+ICsgICAgIGt2ZnJl
ZSh2YnVmLT5kYXRhX2J1Zik7Cj4gPiA+ID4KPiA+ID4gPiBpZiAoaXNfdm1hbGxvY19hZGRyKHZi
dWYtPmRhdGFfYnVmKSkgLi4uCj4gPiA+ID4KPiA+ID4gPiBuZWVkZWQgaGVyZSBJIGd1ZXM/Cj4g
PiA+ID4KPiA+ID4KPiA+ID4ga3ZmcmVlKCkgaGFuZGxlcyB2bWFsbG9jL2ttYWxsb2Mva3ZtYWxs
b2MgaW50ZXJuYWxseSBieSBkb2luZyB0aGF0IGNoZWNrLgo+ID4KPiA+IE9rLgo+ID4KPiA+ID4g
LSB2aWRlb2J1Zl92bWFsbG9jX3RvX3NnIGluIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVv
YnVmLWRtYS1zZy5jLAo+ID4gPiBhc3N1bWVzIGNvbnRpZ3VvdXMgYXJyYXkgb2Ygc2NhdHRlcmxp
c3QgYW5kIHRoYXQgdGhlIGJ1ZmZlciBiZWluZyBjb252ZXJ0ZWQKPiA+ID4gaXMgcGFnZSBhbGln
bmVkCj4gPgo+ID4gV2VsbCwgdm1hbGxvYyBtZW1vcnkgX2lzXyBwYWdlIGFsaWduZWQuCj4gCj4g
VHJ1ZSwgYnV0IHRoaXMgZnVuY3Rpb24gZ2V0cyBjYWxsZWQgZm9yIGFsbCBwb3RlbnRpYWwgZW5x
dWV1aW5ncyAoZWcKPiByZXNvdXJjZV9jcmVhdGVfM2QsIHJlc291cmNlX2F0dGFjaF9iYWNraW5n
KSBhbmQgSSB3YXMgY29uY2VybmVkIHRoYXQKPiBzb21lIG90aGVyIHVzYWdlIGluIHRoZSBmdXR1
cmUgbWlnaHQgbm90IGhhdmUgdGhhdCBndWFyYW50ZWUuCgpUaGUgdm1hbGxvY190b19zZyBjYWxs
IGlzIHdyYXBwZWQgaW50byAiaWYgKGlzX3ZtYWxsb2MoKSkiLCBzbyB0aGlzCnNob3VsZCBub3Qg
YmUgYSBwcm9ibGVtLgoKPiA+IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoKSBkb2VzIGFsb3Qg
b2Ygd2hhdCB5b3UgbmVlZCwgeW91IGp1c3QgbmVlZCBhCj4gPiBzbWFsbCBsb29wIGFyb3VuZCB2
bWFsbG9jX3RvX3BhZ2UoKSBjcmVhdGUgYSBzdHJ1Y3QgcGFnZSBhcnJheQo+ID4gYmVmb3JlaGFu
ZC4KPiAKPiBUaGF0IGZlZWxzIGxpa2UgYW4gZXh0cmEgYWxsb2NhdGlvbiB3aGVuIHVuZGVyIG1l
bW9yeSBwcmVzc3VyZSBhbmQKPiBtb3JlIHdvcmssIHRvIG5vdCBnYWluIG11Y2ggLS0gdGhlcmUg
c3RpbGwgbmVlZHMgdG8gYmUgYSBmdW5jdGlvbiB0aGF0Cj4gaXRlcmF0ZXMgdGhyb3VnaCBhbGwg
dGhlIHBhZ2VzLiAgQnV0IEkgZG9uJ3QgZmVlbCBzdXBlciBzdHJvbmdseSBhYm91dAo+IGl0IGFu
ZCBjYW4gY2hhbmdlIGl0IGlmIHlvdSB0aGluayB0aGF0IGl0IHdpbGwgYmUgbGVzcyBtYWludGVu
YW5jZQo+IG92ZXJoZWFkLgoKTGV0cyBzZWUgaG93IHZtYWxsb2NfdG9fc2cgbG9va3MgbGlrZSB3
aGVuIGl0IGFzc3VtZXMgcGFnZS1hbGlnbmVkCm1lbW9yeS4gIEl0J3MgcHJvYmFibHkgbm90aWNl
YWJsZSBzaG9ydGVyIHRoZW4uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
