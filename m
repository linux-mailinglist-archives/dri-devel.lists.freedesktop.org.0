Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC1A9E6A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0E389FBC;
	Thu,  5 Sep 2019 09:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212E889FBC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B39673C917;
 Thu,  5 Sep 2019 09:31:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D5519C69;
 Thu,  5 Sep 2019 09:31:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C34031E8D; Thu,  5 Sep 2019 11:31:00 +0200 (CEST)
Date: Thu, 5 Sep 2019 11:31:00 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 7/8] drm/vmwgfx: switch to own vma manager
Message-ID: <20190905093100.unhknpzio74oqkmw@sirius.home.kraxel.org>
References: <20190905070509.22407-1-kraxel@redhat.com>
 <20190905070509.22407-8-kraxel@redhat.com>
 <8bec5487c9d698d35297033fe48f6bbd6ad98466.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8bec5487c9d698d35297033fe48f6bbd6ad98466.camel@vmware.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 05 Sep 2019 09:31:01 +0000 (UTC)
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDg6MzE6MzRBTSArMDAwMCwgVGhvbWFzIEhlbGxzdHJv
bSB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDktMDUgYXQgMDk6MDUgKzAyMDAsIEdlcmQgSG9mZm1h
bm4gd3JvdGU6Cj4gPiBBZGQgc3RydWN0IGRybV92bWFfb2Zmc2V0X21hbmFnZXIgdG8gdm1hX3By
aXZhdGUsIGluaXRpYWxpemUgaXQgYW5kCj4gPiBwYXNzIGl0IHRvIHR0bV9ib19kZXZpY2VfaW5p
dCgpLgo+ID4gCj4gPiBXaXRoIHRoaXMgaW4gcGxhY2UgdGhlIGxhc3QgdXNlciBvZiB0dG0ncyBl
bWJlZGRlZCB2bWEgb2Zmc2V0IG1hbmFnZXIKPiA+IGlzIGdvbmUgYW5kIHdlIGNhbiByZW1vdmUg
aXQgKGluIGEgc2VwYXJhdGUgcGF0Y2gpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5oIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZHJ2LmMgfCA2ICsrKysrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IAo+IAo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IAo+IEkgYXNzdW1lIHRoaXMgd2lsbCBiZSBt
ZXJnZWQgdGhyb3VnaCBkcm0tbWlzYz8KClllcywgdGhhdCBpcyB0aGUgcGxhbiAoYWZ0ZXIgY29s
bGVjdGluZyBhY2tzIGZvciBhbGwgZHJpdmVycykuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
