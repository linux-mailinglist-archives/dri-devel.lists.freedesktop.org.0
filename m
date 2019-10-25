Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6DE4C4D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF026EA30;
	Fri, 25 Oct 2019 13:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3546EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:32:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-9_UJ62zDNCCId3CTf8d2Tg-1; Fri, 25 Oct 2019 09:32:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D85580183D;
 Fri, 25 Oct 2019 13:32:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC6A610013A1;
 Fri, 25 Oct 2019 13:32:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1095511AAA; Fri, 25 Oct 2019 15:32:40 +0200 (CEST)
Date: Fri, 25 Oct 2019 15:32:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(),
 vmap(), and vunmap()
Message-ID: <20191025133240.54ignkzxb3qpf76u@sirius.home.kraxel.org>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
 <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
 <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
 <487893a0-1fe8-cc08-d301-d30f34c21ab6@suse.de>
 <9c977a45-8e70-8771-0fdf-8bef85a97021@tronnes.org>
 <58881840-459d-7c04-31fa-383d40a5eb67@suse.de>
MIME-Version: 1.0
In-Reply-To: <58881840-459d-7c04-31fa-383d40a5eb67@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9_UJ62zDNCCId3CTf8d2Tg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572010365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kpmAp+vENiTwMvaSp9l1yusikpysasawmatSFDOlqo=;
 b=DKKcX5OaTh5jCCGGNqUReWRkPKeAC9MFxORJX85xIuBVeQQodkKD7zhOfDgsafX4Er5Nrr
 dLD65AP2hznSzy9vH6jTYvhvPVv0iB0gXfJ/GtT30FxGLjUVgnM/9N2WKOlJ1Z1vG8+o07
 CeEQzqYPcC8edpFEEFz5ILHhI6gtnKw=
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
Cc: Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBJIGhhZCBhIGZsYWcgdG8gc2V0IHRoaXMgaW4gdGhlIGluaXRpYWwgdmVyc2lv
biBvZiB0aGUgc2htZW0gaGVscGVyCj4gPiBtb2RlbGVkIGFmdGVyIHVkbCwgYnV0IFRob21hcyBI
ZWxsc3Ryb20gYnJvdWdodCB1cCBhIHF1ZXN0aW9uIGFuZCBpdCB3YXMKPiA+IGRyb3BwZWQuIFRo
ZSBpc3N1ZSB3YXMgYmV5b25kIG15IHVuZGVyc3RhbmRpbmc6Cj4gPiAKPiA+IFtQQVRDSCB2MyAw
LzJdIGRybTogQWRkIHNobWVtIEdFTSBsaWJyYXJ5Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1TZXB0ZW1iZXIvMTkwMDAxLmh0bWwKPiAK
PiBJZiBJIHVuZGVyc3RhbmQgdGhhdCBkaXNjdXNzaW9uIGNvcnJlY3RseSwgdGhlIGNvbmNlcm4g
d2FzIHRoYXQgd3JpdGUKPiBjb21iaW5pbmcgYW5kIHNoYXJlZCBtZW1vcnkgd291bGQgbm90IHdv
cmsgd2VsbCB0b2dldGhlci4gU28geW91IHdlbnQKPiB3aXRoIGFsd2F5cy1jYWNoZWQ/Cj4gCj4g
SnVzdCByZWNlbnRseSwgR2VyZCBhZGRlZCB1bmNvbmRpdGlvbmFsIHdyaXRlIGNvbWJpbmluZyBp
biByZXYgMGJlODk1ODkzNi4KCldlbGwsIGl0J3Mgbm90IHJlYWxseSBhZGRlZC4gIEl0J3MgdGhl
IHNhbWUgdGhpbmcgZHJtX2dlbV9tbWFwX29iaigpCmRvZXMgZm9yIHlvdSB3aGVuIHlvdSBkb24n
dCBoYXZlIGEgZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCBjYWxsYmFjay4KCkJ1dCwgeWVzLCB0
aGUgcmVhc29uIHRoaXMgaXMgZG9uZSBpbiB0aGUgZHJpdmVyJ3MgbW1hcCgpIGNhbGxiYWNrIHdp
dGgKdGhlIG5ldyBtbWFwIGNvZGUgcGF0aCBpcyB0byBnaXZlIGRyaXZlcnMgdGhlIG9wdGlvbiB0
byBvdmVycmlkZSB0aGlzCmJ5IHN1cHBseWluZyB0aGVpciBvd24gbW1hcCgpIGhhbmRsZXIuICBT
byBnb2luZyB3aXRoIHNobWVtIGhlbHBlcnMgKwpjdXN0b20gbW1hcCBjYWxsYmFjayBpcyBhIHJl
YXNvbmFibGUgYXBwcm9hY2guCgpIVEgsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
