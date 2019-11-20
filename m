Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAB1038DB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839516E317;
	Wed, 20 Nov 2019 11:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F66E317
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:40:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-KNrA7grYN0KjYeNnx9Ytng-1; Wed, 20 Nov 2019 06:40:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43A018B5FA0;
 Wed, 20 Nov 2019 11:40:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59CCD1036C84;
 Wed, 20 Nov 2019 11:40:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 585F016E08; Wed, 20 Nov 2019 12:40:38 +0100 (CET)
Date: Wed, 20 Nov 2019 12:40:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
References: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191120103913.GH30416@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: KNrA7grYN0KjYeNnx9Ytng-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574250043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jnlBgMXh45PXyZXUhJiTCQDPFS7eEpEECBOd65FtBM=;
 b=Kg7Nb4ovnMX0M6smDgbCF7v1GOA1ifIWA2mpfOSptNrp+N2y41ZdsALsNtMYTPCU5VT1O7
 9d/SqKpu+GaaQ2LOnN92XZvDKUEH5dFN8YYfz7kUzSa3EJtuxRJ2SseXY8Q/k2FAtCJ4qM
 jg4MJACjE/ctN18CBNAki2Uns9lV9Qk=
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

ICBIaSwKCj4gPiBBbnl0aGluZyBidWlsZGluZyBvbiBzaG1lbSBoZWxwZXJzIHNob3VsZCBiZSBh
YmxlIHRvIHVzZQo+ID4gb2JqLT5maWxwLT5mX21hcHBpbmcsIHJpZ2h0PyAgU28gYWxsb2NhdGlu
ZyBhbiBpbm9kZSB1bmNvbmRpdGlvbmFsbHkKPiA+IGRvZXNuJ3QgbG9vayBsaWtlIGEgZ29vZCBw
bGFuLgo+IAo+IE5vdCBzdXJlIHRoZSBzaG1lbSBoZWxwZXJzIGZvcndhcmQgdGhlIG1tYXAgdG8g
dGhlIHVuZGVybHlpbmcgc2htZW0gZmlsZSwKPiBzbyBub3Qgc3VyZSB0aGlzIGlzIHRoZSBncmVh
dGVzdCB3YXkgZWl0aGVyLgoKSSB0aGluayBzbywgc2htZW0gaGVscGVycyBhbHJlYWR5IHphcCB0
aGUgZmFrZSBvZmZzZXQsIGFuZCB0aGlzIHdvdWxkCm5vdCB3b3JrIHdpdGhvdXQgcGVyLW9iamVj
dCBhZGRyZXNzIHNwYWNlIEkgdGhpbmsuCgo+ID4gR3Vlc3MgSSdsbCBnbyBsb29rIGF0IHR0bS1s
b2NhbCBjaGFuZ2VzIGZvciBzdGFydGVycyBhbmQgc2VlIGhvdyBpdAo+ID4gZ29lcy4KPiAKPiBJ
IHRoaW5rIGZvciB0dG0ganVzdCBjb25zaXN0ZW50bHkgdXNpbmcgdGhlIG9uZSBwZXItZGV2aWNl
IG1hcHBpbmcgZm9yCj4gZXZlcnl0aGluZywgd2l0aCBhbGwgdGhlIGZha2Ugb2Zmc2V0cywgaXMg
cHJvYmFibHkgdGhlIHF1aWNrZXN0IHJvdXRlLgoKSG1tLCBub3QgY2xlYXIgaG93IHRvIGZpdCBk
bWFidWZzIGludG8gdGhpcy4gIGRtYWJ1ZnMgYWxyZWFkeSBoYXZlIHRoZWlyCm93biBmaWxlLCBp
bm9kZSBhbmQgYWRkcmVzcyBzcGFjZS4gIEknbSBub3Qgc3VyZSB5b3UgY2FuIHN3aXRjaCB0aGF0
Cm92ZXIgdG8gdGhlIHBlci1kZXZpY2UgbWFwcGluZyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCBl
dmVuIGlmIHlvdSBjYW4gSQpoYXZlIG15IGRvdWJ0cyB0aGlzIGlzIGEgZ29vZCBpZGVhIGZyb20g
YSBzZWN1cml0eSBwb2ludCBvZiB2aWV3IC4uLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
