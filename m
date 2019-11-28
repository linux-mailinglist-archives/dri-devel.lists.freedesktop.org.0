Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760F610C814
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 12:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845246E7D2;
	Thu, 28 Nov 2019 11:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03B36E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 11:39:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-JkfH9-oZNDChP8mZlQBhKw-1; Thu, 28 Nov 2019 06:39:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E29E107ACC7;
 Thu, 28 Nov 2019 11:39:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 526BE5D9E1;
 Thu, 28 Nov 2019 11:39:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56292A1E0; Thu, 28 Nov 2019 12:39:30 +0100 (CET)
Date: Thu, 28 Nov 2019 12:39:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm: call drm_gem_object_funcs.mmap with fake
 offset
Message-ID: <20191128113930.yhckvneecpvfhlls@sirius.home.kraxel.org>
References: <20191127092523.5620-1-kraxel@redhat.com>
 <20191127092523.5620-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191127092523.5620-2-kraxel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JkfH9-oZNDChP8mZlQBhKw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574941181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/jeELqhj5P3A7DPG/PC1XpTw6obMUxkE54tKkidDrQ=;
 b=g4pwOX2rQhNfvIEUgpoCchPqBRTXF9WlB5YAMdLdK1DapGKS0RWhYXqhWd3U4Dd1YNHcLh
 l6jYp036zIve75CJA663lxajKgV5eyVa7mFTN4U9SZahTclEpsHJ/af7BKwbBq9FurOZRY
 JWPuQuHxRIz0kSEboLyVXdAJwcSIJG0=
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
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MjU6MjJBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBUaGUgZmFrZSBvZmZzZXQgaXMgZ29pbmcgdG8gc3RheSwgc28gY2hhbmdlIHRoZSBj
YWxsaW5nIGNvbnZlbnRpb24gZm9yCj4gZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCB0byBpbmNs
dWRlIHRoZSBmYWtlIG9mZnNldC4gIFVwZGF0ZSBhbGwgdXNlcnMKPiBhY2NvcmRpbmdseS4KPiAK
PiBOb3RlIHRoYXQgdGhpcyByZXZlcnRzIDgzYjhhNmYyNDJlYSAoImRybS9nZW06IEZpeCBtbWFw
IGZha2Ugb2Zmc2V0Cj4gaGFuZGxpbmcgZm9yIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAiKSBh
bmQgb24gdG9wIHRoZW4gYWRkcyB0aGUgZmFrZQo+IG9mZnNldCB0byAgZHJtX2dlbV9wcmltZV9t
bWFwIHRvIG1ha2Ugc3VyZSBhbGwgcGF0aHMgbGVhZGluZyB0bwo+IG9iai0+ZnVuY3MtPm1tYXAg
YXJlIGNvbnNpc3RlbnQuCj4gCj4gdjM6IG1vdmUgZmFrZS1vZmZzZXQgdHdlYWsgaW4gZHJtX2dl
bV9wcmltZV9tbWFwKCkgc28gd2UgaGF2ZSB0aGlzIGNvZGUKPiAgICAgb25seSBvbmNlIGluIHRo
ZSBmdW5jdGlvbiAoUm9iIEhlcnJpbmcpLgoKTm93IHRoaXMgc2VyaWVzIGZhaWxzIGluIEludGVs
IENJLiAgQ2FuJ3Qgc2VlIHdoeSB0aG91Z2guICBUaGUKZGlmZmVyZW5jZSBiZXR3ZWVuIHYyIGFu
ZCB2MyBpcyBqdXN0IHRoZSBwbGFjZSB3aGVyZSB2bWEtPnZtX3Bnb2ZmIGdldHMKdXBkYXRlZCwg
YW5kIG5vIGNvZGUgYmV0d2VlbiB0aGUgdjIgYW5kIHYzIGxvY2F0aW9uIHRvdWNoZXMgdm1hIC4u
LgoKY29uZnVzZWQsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
