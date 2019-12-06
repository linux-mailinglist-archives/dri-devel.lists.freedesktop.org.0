Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B035114EF5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 11:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CE86F9BA;
	Fri,  6 Dec 2019 10:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD296F9BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 10:22:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-mG1Qb4gPNYOp7hybu0Rm2g-1; Fri, 06 Dec 2019 05:22:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4726800D5F;
 Fri,  6 Dec 2019 10:22:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5698919C4F;
 Fri,  6 Dec 2019 10:22:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D90516E18; Fri,  6 Dec 2019 11:22:00 +0100 (CET)
Date: Fri, 6 Dec 2019 11:22:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, robh@kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] drm: call drm_gem_object_funcs.mmap with fake
 offset
Message-ID: <20191206102200.6osisct57n424ujn@sirius.home.kraxel.org>
References: <20191127092523.5620-1-kraxel@redhat.com>
 <20191127092523.5620-2-kraxel@redhat.com>
 <20191128113930.yhckvneecpvfhlls@sirius.home.kraxel.org>
 <20191205221523.GN624164@phenom.ffwll.local>
 <20191206100724.ukzdyaym3ltcyfaa@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20191206100724.ukzdyaym3ltcyfaa@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mG1Qb4gPNYOp7hybu0Rm2g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575627727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPXPVF5DYoU7fv7fbWpSb9qOw8HQXQZZ77OFuUMIvww=;
 b=TV+y7iCrC9Nt0v+os9as0jp/kcob5dN6cyj30aEk7bgiSZ5BLrTu8o1Jt7s9VBzM6gwoK1
 KGrW0PdgmVm6/eoDKJHTCVkXPKGNNB2FrqKBCIEtAI8Dz1E3dgt8+ZW6ozLAhrCs7RxLhf
 wrSBPx/qNfy1UBCNYUl4W5Z8yY9OMBU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMDYsIDIwMTkgYXQgMTE6MDc6MjRBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBUaHUsIERlYyAwNSwgMjAxOSBhdCAxMToxNToyM1BNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gTG9va3MgbGlrZSB1bnJlbGF0ZWQgZmx1a2VzLCB0aGlzIGhhcHBl
bnMgb2NjYXNpb25hbGx5LiBJZiB5b3UncmUgcGFyYW5vaWQKPiA+IGhpdCB0aGUgcmV0ZXN0IGJ1
dHRvbiBvbiBwYXRjaHdvcmsgdG8gZG91YmxlLWNoZWNrLgo+ID4gLURhbmllbAo+IAo+IEd1ZXNz
IHlvdSBraWNrZWQgQ0k/ICBKdXN0IGdvdCBDSSBtYWlscywgbm93IHJlcG9ydGluZyBzdWNjZXNz
LCB3aXRob3V0Cj4gZG9pbmcgYW55dGhpbmcuICBTbyBJJ2xsIGdvIHB1c2ggdjMgdG8gbWlzYy1u
ZXh0LgoKT29wcywgc3Bva2UgdG9vIHNvb24uICBOZXh0IG1haWwgYXJyaXZlZC4gIEZpLkNJLkJB
VCB3b3JrcywgYnV0CkZpLkNJLklHVCBzdGlsbCBmYWlscy4KCldoZXJlIGlzIHRoZSAidGVzdCBh
Z2FpbiIgYnV0dG9uPyAgQ2FuIEkgcmUtcnVuIHRoZSB0ZXN0cyBvbiB2Mj8gIFJpZ2h0Cm5vdyBJ
IHRlbmQgdG8gY29tbWl0IHYyIHRvIGhhdmUgYSBmaXggY29tbWl0dGVkLCB0aGVuIGdvIGZpZ3Vy
ZSB3aHkgdjMKZmFpbHMgLi4uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
