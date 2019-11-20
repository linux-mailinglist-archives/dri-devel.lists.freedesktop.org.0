Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5301039E3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2A46E4DD;
	Wed, 20 Nov 2019 12:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48D06E4DD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:18:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-LP1OPudWN4WFfxZv-PvSIw-1; Wed, 20 Nov 2019 07:18:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E442B107ACE3;
 Wed, 20 Nov 2019 12:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A905E7DE;
 Wed, 20 Nov 2019 12:18:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B2D9E16E05; Wed, 20 Nov 2019 13:18:48 +0100 (CET)
Date: Wed, 20 Nov 2019 13:18:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
References: <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LP1OPudWN4WFfxZv-PvSIw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574252334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izGwJ7dT/wVZPUqpIoQobxiN8Ik3ovyz7sR168htnY4=;
 b=K9rvhgK2S/CmRPNpEXmuX5w9U8bKNKBYu0FwipBU4YqecEqeHTeFEizmScPdZ7fLDqkbK9
 9jZsvKqa5MXgJLVY4vIQkDTG48SZnekZy6qanq2ofPr3T2fB4+J4WQAxbLCftsAPNblNGo
 U03+vc92pFSTi4DJgonU0jymtK+vLRk=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+IEkgdGhpbmsgZm9yIHR0bSBqdXN0IGNvbnNpc3RlbnRseSB1c2luZyB0aGUg
b25lIHBlci1kZXZpY2UgbWFwcGluZyBmb3IKPiA+ID4gZXZlcnl0aGluZywgd2l0aCBhbGwgdGhl
IGZha2Ugb2Zmc2V0cywgaXMgcHJvYmFibHkgdGhlIHF1aWNrZXN0IHJvdXRlLgo+ID4KPiA+IEht
bSwgbm90IGNsZWFyIGhvdyB0byBmaXQgZG1hYnVmcyBpbnRvIHRoaXMuICBkbWFidWZzIGFscmVh
ZHkgaGF2ZSB0aGVpcgo+ID4gb3duIGZpbGUsIGlub2RlIGFuZCBhZGRyZXNzIHNwYWNlLiAgSSdt
IG5vdCBzdXJlIHlvdSBjYW4gc3dpdGNoIHRoYXQKPiA+IG92ZXIgdG8gdGhlIHBlci1kZXZpY2Ug
bWFwcGluZyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCBldmVuIGlmIHlvdSBjYW4gSQo+ID4gaGF2
ZSBteSBkb3VidHMgdGhpcyBpcyBhIGdvb2QgaWRlYSBmcm9tIGEgc2VjdXJpdHkgcG9pbnQgb2Yg
dmlldyAuLi4KPiAKPiBZb3UgY2FuIChwbGVudHkgZHJpdmVycyBkbyB0aGF0IGFscmVhZHkpLAoK
SGF2ZSBwb2ludGVyKHMpIHRvIGNvZGU/Cgo+IGFuZCBub3Qgc3VyZSBob3cgdGhhdCBicmVha3MK
PiBzZWN1cml0eT8KCkdvIHRyeSBtbWFwKGZha2Utb2Zmc2V0KSBvbiB0aGUgZG1hLWJ1ZiBmaWxl
IGhhbmRsZSB0byBhY2Nlc3Mgb3RoZXIKYnVmZmVycyBvZiB0aGUgZHJtIGRldmljZT8gIEhtbSwg
dGhpbmtpbmcgYWdhaW4sIEkgZ3Vlc3MgdGhlCnZlcmlmeS1hY2Nlc3MgcmVzdHJpY3Rpb25zIHNo
b3VsZCBwcmV2ZW50IHRoYXQuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
