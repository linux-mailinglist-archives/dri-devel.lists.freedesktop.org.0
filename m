Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5A35A05
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606D18979E;
	Wed,  5 Jun 2019 09:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753768979E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE58985546;
 Wed,  5 Jun 2019 09:58:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC4A19749;
 Wed,  5 Jun 2019 09:58:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D9A117523; Wed,  5 Jun 2019 11:58:17 +0200 (CEST)
Date: Wed, 5 Jun 2019 11:58:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
Message-ID: <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604154201.14460-7-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 05 Jun 2019 09:58:25 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDU6NDE6NTlQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGN1cnNvciBoYW5kbGluZyBpbiBtZ2FnMjAwIGlzIGNvbXBsaWNhdGVk
IHRvIHVuZGVyc3RhbmQuIEl0IHRvdWNoZXMgYQo+IG51bWJlciBvZiBkaWZmZXJlbnQgQk9zLCBi
dXQgZG9lc24ndCByZWFsbHkgdXNlIGFsbCBvZiB0aGVtLgo+IAo+IFJld3JpdGluZyB0aGUgY3Vy
c29yIHVwZGF0ZSByZWR1Y2VzIHRoZSBhbW91bnQgb2YgY3Vyc29yIHN0YXRlLiBUaGVyZSBhcmUK
PiB0d28gQk9zIGZvciBkb3VibGUtYnVmZmVyZWQgSFcgdXBkYXRlcy4gVGhlIHNvdXJjZSBCTyB1
cGRhdGVzIHRoZSBvbmUgdGhhdAo+IGlzIGN1cnJlbnRseSBub3QgZGlzcGxheWVkIGFuZCB0aGVu
IHN3aXRjaGVzIGJ1ZmZlcnMuIEV4cGxpY2l0IEJPIGxvY2tpbmcKPiBoYXMgYmVlbiByZW1vdmVk
IGZyb20gdGhlIGNvZGUuIEJPcyBhcmUgc2ltcGx5IHBpbm5lZCBhbmQgdW5waW5uZWQgaW4gdmlk
ZW8KPiBSQU0uCgpDdXJzb3JzIGFyZSBub3QgdGhhdCBiaWcgYWZ0ZXIgYWxsLCBzbyBtYXliZSBw
aW4gdGhlIHR3byBCT3MgZm9yCmRvdWJsZS1idWZmZXJpbmcgcGVybWFuZW50bHkgaW4gdnJhbSB0
byBzaW1wbGlmeSB0aGluZ3MgZnVydGhlcj8KCkFsc28gZmFjdG9yaW5nIG91dCB0aGUgY29kZSB3
aGljaCB1cGRhdGVzIHRoZSB0d28gQk9zIHRvIGEgc2VwYXJhdGUKZnVuY3Rpb24gc2hvdWxkIGhl
bHAgbWFraW5nIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUuCgpCdXQgZXZlbiBhcy1pcyB0aGUgcGF0
Y2ggaXMgYSBzdGVwIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbi4KCkFja2VkLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
