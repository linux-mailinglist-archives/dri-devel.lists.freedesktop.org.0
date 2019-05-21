Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337C24CD4
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605408921B;
	Tue, 21 May 2019 10:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E158921B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:35:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74491F74A3;
 Tue, 21 May 2019 10:35:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 601EB27CAD;
 Tue, 21 May 2019 10:35:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 62D0111AB8; Tue, 21 May 2019 12:35:46 +0200 (CEST)
Date: Tue, 21 May 2019 12:35:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
 convert mgag200
Message-ID: <20190521103546.ehrrboraeoe2e6fh@sirius.home.kraxel.org>
References: <20190516162746.11636-1-tzimmermann@suse.de>
 <20190516162746.11636-2-tzimmermann@suse.de>
 <20190520161900.GB21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520161900.GB21222@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 21 May 2019 10:35:52 +0000 (UTC)
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, zourongrong@gmail.com,
 sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSSB0aGluayB3b3VsZCBiZSBnb29kIHRvIGhhdmUgYSBsb2NrZGVwX2Fzc2VydF9o
ZWxkIGhlcmUgZm9yIHRoZSB3d19tdXRleC4KPiAKPiBBbHNvIGdlbmVyYWwgdGhpbmc6IF9yZXNl
cnZlZCBpcyBraW5kYSB0dG0gbGluZ28sIGZvciBkbWEtYnVmIHJlc2VydmF0aW9ucwo+IHdlIGNh
bGwgdGhlIHN0cnVjdHVyZSB0cmFja2luZyB0aGUgZmVuY2VzK2xvY2sgdGhlICJyZXNlcnZhdGlv
biIsIGJ1dCB0aGUKPiBuYW1pbmcgc2NoZW1lIHVzZWQgaXMgX2xvY2svX3VubG9jay4KPiAKPiBJ
IHRoaW5rIHdvdWxkIGJlIGdvb2QgdG8gYmUgY29uc2lzdGVudCB3aXRoIHRoYXQsIGFuZCB1c2Ug
X2xvY2tlZCBoZXJlLgo+IEVzcGVjaWFsbHkgZm9yIGEgdmVyeSBzaW1wbGlmaWVkIHZyYW0gaGVs
cGVyIGxpa2UgdGhpcyBvbmUgSSBleHBlY3QgdGhhdCdzCj4gZ29pbmcgdG8gbGVhZCB0byBsZXNz
IHd0ZiBtb21lbnRzIGJ5IGRyaXZlciB3cml0ZXJzIDotKQo+IAo+IE1heWJlIHdlIHNob3VsZCBh
bHNvIGRvIGEgbGFyZ2Utc2NhbGUgcy9yZXNlcnZlL2xvY2svIHdpdGhpbiB0dG0sIHRvIGFsaWdu
Cj4gbW9yZSB3aXRoIHdoYXQgd2Ugbm93IGhhdmUgaW4gZG1hLWJ1Zi4KCkdpdmVuIHRoYXQgbWdh
ZzIwMCBpcyB0aGUgb25seSB1c2VyIEkgdGhpbmsgdGhlIGJlc3Qgd2F5IGZvcndhcmQgaXMgdG8K
aW1wcm92ZSB0aGUgbWdhZzIwMCBjdXJzb3IgaGFuZGxpbmcgc28gd2UgY2FuIGp1c3QgZHJvcCB0
aGUgX3Jlc2VydmVkCnZhcmlhbnRzIC4uLgoKV2hlbiBsb29raW5nIGF0IG1nYV9jcnRjX2N1cnNv
cl9zZXQoKSBJIHN1c3BlY3QgdGhlIGVhc2llcnN0IHdheSB0byBkbwp0aGF0IHdvdWxkIGJlIHRv
IHNpbXBseSBwaW4gdGhlIGN1cnNvciBibydzIGF0IGRyaXZlcl9sb2FkIHRpbWUsIHRoZW4gd2UK
ZG9uJ3QgaGF2ZSB0byBib3RoZXIgd2l0aCBwaW5uaW5nIGluIG1nYV9jcnRjX2N1cnNvcl9zZXQo
KSBhdCBhbGwuCgpUaG9tYXMsIGFzIHlvdSBoYXZlIHRlc3QgaGFyZHdhcmUsIGNhbiB5b3UgbG9v
ayBpbnRvIHRoaXM/Cgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
