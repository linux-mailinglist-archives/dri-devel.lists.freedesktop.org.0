Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F20DAC45
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EAB6EA65;
	Thu, 17 Oct 2019 12:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455696EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:30:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCDAE308FFB1;
 Thu, 17 Oct 2019 12:30:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6356E1001DF0;
 Thu, 17 Oct 2019 12:30:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 74FB316E2D; Thu, 17 Oct 2019 14:30:19 +0200 (CEST)
Date: Thu, 17 Oct 2019 14:30:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Message-ID: <20191017123019.ovnexoryrziwkj7d@sirius.home.kraxel.org>
References: <20191016115203.20095-1-kraxel@redhat.com>
 <20191016115203.20095-7-kraxel@redhat.com>
 <c08921f8-8ae9-55aa-c472-6b660b96576b@amd.com>
 <398f5818-296d-67cc-2447-d3075187bf0c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <398f5818-296d-67cc-2447-d3075187bf0c@amd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 17 Oct 2019 12:30:20 +0000 (UTC)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTE6MDY6MzNBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMTYuMTAuMTkgdW0gMTQ6MTggc2NocmllYiBDaHJpc3RpYW4gS8O2bmln
Ogo+ID4gQW0gMTYuMTAuMTkgdW0gMTM6NTEgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+ID4+IEZh
Y3RvciBvdXQgdHRtIHZtYSBzZXR1cCB0byBhIG5ldyBmdW5jdGlvbi4KPiA+PiBSZWR1Y2VzIGNv
ZGUgZHVwbGljYXRpb24gYSBiaXQuCj4gPj4KPiA+PiB2MjogZG9uJ3QgY2hhbmdlIHZtX2ZsYWdz
IChtb3ZlZCB0byBzZXBhcmF0ZSBwYXRjaCkuCj4gPj4gdjQ6IG1ha2UgdHRtX2JvX21tYXBfdm1h
X3NldHVwIHN0YXRpYy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgo+ID4KPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGlzIG9uZSAKPiA+IGFuZCAjNyBpbiB0aGUg
c2VyaWVzLgo+IAo+IEFueSBvYmplY3Rpb25zIHRoYXQgSSBhZGQgdGhlc2UgdHdvIHRvIG15IGRy
bS10dG0tbmV4dCBwdWxsIHJlcXVlc3Qgb3IgCj4gZGlkIHlvdSB3YW50ZWQgdG8gbWVyZ2UgdGhh
dCB0aHJvdWdoIHNvbWUgb3RoZXIgdHJlZT8KClB1c2hlZCBzZXJpZXMgdG8gZHJtLW1pc2MtbmV4
dCBhIGZldyBtaW51dGVzIGFnbyAoYmVmb3JlIEkgc2F3IHlvdXIgbWFpbCkuCgpjaGVlcnMsCiAg
R2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
