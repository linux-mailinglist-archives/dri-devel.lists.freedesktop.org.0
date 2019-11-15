Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ECFFD96D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E06E2D8;
	Fri, 15 Nov 2019 09:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8566E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:37:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7EFnXuuVM3i1zQ6NWMA7SQ-1; Fri, 15 Nov 2019 04:37:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 701C818B9FC1;
 Fri, 15 Nov 2019 09:37:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2CC60556;
 Fri, 15 Nov 2019 09:37:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3BF7B17536; Fri, 15 Nov 2019 10:37:38 +0100 (CET)
Date: Fri, 15 Nov 2019 10:37:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
References: <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191113162729.GQ23790@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7EFnXuuVM3i1zQ6NWMA7SQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573810666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIWc9OzO/qP8Rb5GkefyiCx628aMuEsa2+9temrWR8k=;
 b=XIe69IMWch6e3oPmweOIoOpV+EPm7FOxNL2bh+U7qn/LrpWsG0EEAkEheQNxlvU+Pmo/Up
 1rNlN1vJtTf2QB1V4HlOfvMILcUz46D3WOQ8HqPoiF88woSok0WnJgZnkblyyVkeD5tScQ
 0MLQa2eHlECfPDofApLne9odKKw8KQI=
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

PiBZb3UgbmVlZCBtZW1vcnkgcHJlc3N1cmUsIHRvIGZvcmNlIHR0bSB0byB1bm1hcCB0aGUgYm8s
IG5vdCB1c2Vyc3BhY2UuIFNvCj4gcm91Z2hseQo+IDEuIGNyZWF0ZSBibwo+IDIuIG1tYXAgaXQg
dGhyb3VnaCBkcm0gZmQsIHdyaXRlIHNvbWUgc3R1ZmYKPiAzLiBleHBvcnQgdG8gZG1hLWJ1Ziwg
bW1hcCBpdCwgdmVyaWZ5IHN0dWZmIGlzIHRoZXJlCj4gNC4gY3JlYXRlIGEgcGlsZSBtb3JlIGJv
LCBtbWFwIHRoZW0gd3JpdGUgdG8gdGhlbQo+IDUuIG9uY2UgeW91J3ZlIHRocmFzaGVkIGFsbCBv
ZiB2cmFtIGVub3VnaCwgcmVjaGVjayB5b3VyIG9yaWdpbmFsIGJvLiBJZgo+IEknbSByaWdodCB5
b3Ugc2hvdWxkIGdldCB0aGUgZm9sbG93aW5nOgo+ICAgIC0gZHJtIGZkIG1tYXAgc3RpbGwgc2hv
dyByaWdodCBjb250ZW50Cj4gICAgLSBkbWEtYnVmIGZkIG1tYXAgc2hvd3MgcmFuZG9tIGNyYXAg
dGhhdCB5b3UndmUgd3JpdHRlbiBpbnRvIG90aGVyCj4gICAgICBidWZmZXJzCj4gCj4gT2ZjIHlv
dSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGFuIG1tYXAgYWN0dWFsbHkgZm9yY2VzIHRoZSBidWZm
ZXIgaW50bwo+IHZyYW0uIFNvIG1pZ2h0IG5lZWQgYSBjb21ibyBvZiBtb2Rlc2V0K21tYXAsIHRv
IG1ha2UgdGhhdCBoYXBwZW4uIFBsYWluCj4gbW1hcCBtaWdodCBqdXN0IGdpdmUgeW91IHB0ZXMg
dGhhdCBwb2ludCBpbnRvIHN5c3RlbSBtZW1vcnksIHdoaWNoIGlzIG5vdAo+IG1hbmFnZWQgYnkg
dHRtIGxpa2UgdnJhbS4KCklzIGFueSBtb3ZlIGJ1ZmZlciBnb29kIGVub3VnaCB0byB0cmlnZ2Vy
IHRoaXMsIGkuZS4gd2lsbCBTWVNURU0gLT4gVlJBTQp3b3JrIHRvbz8gIFRoYXQnbGwgYmUgZWFz
aWVyIGJlY2F1c2UgYWxsIEkgbmVlZCB0byBkbyBpcyBtYXAgdGhlIGJ1ZmZlcgp0byBhIGNydGMg
dG8gZm9yY2UgcGlubmluZyB0byB2cmFtLCB0aGVuIGNoZWNrIGlmIHRoZSBtYXBwaW5ncyBhcmUK
aW50YWN0IHN0aWxsIC4uLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
