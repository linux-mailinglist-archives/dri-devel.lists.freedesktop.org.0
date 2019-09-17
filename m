Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0DB4991
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C666EB60;
	Tue, 17 Sep 2019 08:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B34D6EB60
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 08:34:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE30A8980E0;
 Tue, 17 Sep 2019 08:34:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2571001281;
 Tue, 17 Sep 2019 08:34:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B01B17444; Tue, 17 Sep 2019 10:34:25 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:34:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
Message-ID: <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
 <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 17 Sep 2019 08:34:27 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDM6MDU6MzRQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cgo+ID4gK3ZvaWQgdHRtX2JvX21tYXBfdm1hX3NldHVwKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4gK3sKPiA+ICsJ
dm1hLT52bV9vcHMgPSAmdHRtX2JvX3ZtX29wczsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogTm90
ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyByZWZlcmVuY2UgdG8KPiA+ICsJICogdm1hLT52
bV9wcml2YXRlX2RhdGEgaGVyZS4KPiA+ICsJICovCj4gPiArCj4gPiArCXZtYS0+dm1fcHJpdmF0
ZV9kYXRhID0gYm87Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIFdlJ2QgbGlrZSB0byB1c2UgVk1f
UEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5ncywgd2hlcmUKPiA+ICsJICogKHZtYS0+dm1fZmxhZ3Mg
JiBWTV9TSEFSRUQpICE9IDAsIGZvciBwZXJmb3JtYW5jZSByZWFzb25zLAo+ID4gKwkgKiBidXQg
Zm9yIHNvbWUgcmVhc29uIFZNX1BGTk1BUCArIHg4NiBQQVQgKyB3cml0ZS1jb21iaW5lIGlzIHZl
cnkKPiA+ICsJICogYmFkIGZvciBwZXJmb3JtYW5jZS4gVW50aWwgdGhhdCBoYXMgYmVlbiBzb3J0
ZWQgb3V0LCB1c2UKPiA+ICsJICogVk1fTUlYRURNQVAgb24gYWxsIG1hcHBpbmdzLiBTZWUgZnJl
ZWRlc2t0b3Aub3JnIGJ1ZyAjNzU3MTkKPiA+ICsJICovCj4gPiArCXZtYS0+dm1fZmxhZ3MgfD0g
Vk1fTUlYRURNQVA7Cj4gPiArCXZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9ET05URVhQQU5E
IHwgVk1fRE9OVERVTVA7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0wodHRtX2JvX21tYXBfdm1h
X3NldHVwKTsKPiAKPiBUbyBtZSwgdGhpcyBmdW5jdGlvbiBsb29rcyBsaWtlIGFuIGludGVybmFs
IGhlbHBlciB0aGF0IHNob3VsZCByYXRoZXIKPiByZW1haW4gaW50ZXJuYWwuCgpXZWxsLCBJJ20g
bW92aW5nIHRoYXQgdG8gYSBoZWxwZXIgZXhhY3RseSB0byBhdm9pZCBkcm0gZ2VtIHR0bSBoZWxw
ZXJzCm1lc3Npbmcgd2l0aCB0dG0gaW50ZXJuYWxzLiAgVG8gbm90IHRoZW0gaW5pdGlhbGl6ZSB2
bV9mbGFncyBmb3IKZXhhbXBsZSwgYW5kIHRvIGF2b2lkIGV4cG9ydGluZyB0dG1fYm9fdm1fb3Bz
LiAgQWxzbyB0byBtYWtlIHN1cmUgdHRtIGJvCnZtYSdzIGFyZSBpbml0aWFsaXplZCB0aGUgc2Ft
ZSB3YXkgbm8gbWF0dGVyIHdoaWNoIGNvZGUgcGF0aCB3YXMgdGFrZW4KdG8gbW1hcCB0aGUgb2Jq
ZWN0LgoKPiBBcyBtZW50aW9uZWQgaW4gbXkgcmVwbHkgdG8gcGF0Y2ggNSwgbWF5YmUgcmUtdXNp
bmcKPiB0dG1fZmJkZXZfbW1hcCgpIGNvdWxkIGhlbHAuCgpObywgdGhlIGNoZWNrIGluIHRoYXQg
ZnVuY3Rpb24gcHJldmVudHMgdGhhdCBmcm9tIHdvcmtpbmcuCgpjaGVlcnMsCiAgR2VyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
