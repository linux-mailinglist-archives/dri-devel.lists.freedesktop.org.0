Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79591E42ED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 07:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A19D6E892;
	Fri, 25 Oct 2019 05:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B0C6E892
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 05:34:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-yaDFLyyKNpWbrsE9iqeSzw-1; Fri, 25 Oct 2019 01:34:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEF61800E01;
 Fri, 25 Oct 2019 05:34:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59A3C60BE0;
 Fri, 25 Oct 2019 05:34:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A1DE11AAA; Fri, 25 Oct 2019 07:34:07 +0200 (CEST)
Date: Fri, 25 Oct 2019 07:34:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191025053407.aufzf7wqkcjxd3f2@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191024191859.31700-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yaDFLyyKNpWbrsE9iqeSzw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571981654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wI4w5yG7dijS6xlkSe9wGabZKCvCFiNxrWRnVec3sg4=;
 b=NCOJZRwFBAAcQ2ljsXfFTsgT80et60EoQCu0AOSCw/ghZIXagjKvia1rXx9+N5As/WFnSV
 +AfRhzOBEZZ511Mqi31ZgoJrA/DPti/9HY+/kkTPSq8FYJYetLPETOzo0OYzv/DQvqWtvH
 ZQcqGA5YeyIhuOvLLOOzt2wzez6SS2s=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDI6MTg6NTlQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gQ29tbWl0IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29i
amVjdF9mdW5jcyIpCj4gaW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2gg
aXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhlCj4gZmFrZSBvZmZzZXQgZnJvbSB2bV9wZ29mZi4g
SG93ZXZlciwgZm9yIG1tYXAoKSBvbiBkbWFidWZzLCB0aGVyZSBpcyBub3QKPiBhIGZha2Ugb2Zm
c2V0Lgo+IAo+IFRvIGZpeCB0aGlzLCBsZXQncyBhbHdheXMgY2FsbCBtbWFwKCkgb2JqZWN0IGNh
bGxiYWNrIHdpdGggYW4gb2Zmc2V0IG9mIDAsCj4gYW5kIGxlYXZlIGl0IHVwIHRvIGRybV9nZW1f
bW1hcF9vYmooKSB0byByZW1vdmUgdGhlIGZha2Ugb2Zmc2V0Lgo+IAo+IFRUTSBzdGlsbCBuZWVk
cyB0aGUgZmFrZSBvZmZzZXQsIHNvIHdlIGhhdmUgdG8gYWRkIGl0IGJhY2sgdW50aWwgdGhhdCdz
Cj4gZml4ZWQuCgpGaXhpbmcgdHRtIGxvb2tzIGVhc3ksIHRoZXJlIGFyZSBub3QgbWFueSBjYWxs
cyB0byBkcm1fdm1hX25vZGVfc3RhcnQoKQp0aGUgdHRtIGNvZGUuICBDYW4gbG9vayBpbnRvIHRo
aXMgd2hlbiBJJ20gYmFjayBmcm9tIGt2bSBmb3J1bSBAIGx5b24uCgo+ICBpbnQgdHRtX2JvX21t
YXBfb2JqKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKQo+ICB7Cj4gIAl0dG1fYm9fZ2V0KGJvKTsKPiArCj4gKwkvKgo+ICsJICogRklYTUU6
ICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwIGlzIGNhbGxlZCB3aXRoIHRoZSBmYWtlIG9mZnNl
dAo+ICsJICogcmVtb3ZlZC4gQWRkIGl0IGJhY2sgaGVyZSB1bnRpbCB0aGUgcmVzdCBvZiBUVE0g
d29ya3Mgd2l0aG91dCBpdC4KPiArCSAqLwo+ICsJdm1hLT52bV9wZ29mZiArPSBkcm1fdm1hX25v
ZGVfc3RhcnQoJmJvLT5iYXNlLnZtYV9ub2RlKTsKPiArCj4gIAl0dG1fYm9fbW1hcF92bWFfc2V0
dXAoYm8sIHZtYSk7Cj4gIAlyZXR1cm4gMDsKPiAgfQoKWWVzLCB0aGF0IHNob3VsZCBrZWVwIHR0
bSBoYXBweSBmb3Igbm93LiAgU3Vydml2ZWQgYSBxdWljayBzbW9rZSB0ZXN0CndpdGggcWVtdSBh
bmQgYm9jaHMuCgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cgpj
aGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
