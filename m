Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79629103ABF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48DC6E527;
	Wed, 20 Nov 2019 13:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B416E527
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:08:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-V_0Auf7GPISQyOZ671XeTA-1; Wed, 20 Nov 2019 08:08:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C852518B9FC2;
 Wed, 20 Nov 2019 13:08:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76BD851C86;
 Wed, 20 Nov 2019 13:08:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AB5816E05; Wed, 20 Nov 2019 14:08:41 +0100 (CET)
Date: Wed, 20 Nov 2019 14:08:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191120130841.3ajf6pho4zyqqcwg@sirius.home.kraxel.org>
References: <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
 <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
 <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: V_0Auf7GPISQyOZ671XeTA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574255327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9K32SnvriOq2svRIsZvlsnbsCA2Ux6ETq5hdjz9Mloc=;
 b=cEJQdqBZCUds2diOYiMFcp+L1Gnnbj2S54kpbUXz0NALI1crZJwP1vx0MaijY8+kDFViQW
 e9XduTuRCBaPPdWF58Gqe33/IvVTdPVCwbYkHSqa4vBnZ6itZGyX9eJ2R+1y8q8HosmTat
 9jUX09y/EoRR7dbQaVZuZKt2jpmJHyQ=
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

ICBIaSwKCj4gQWgsIHdlJ3JlIG5vdCBnb2luZyB0byByZXBsYWNlIHRoZSBtYXBwaW5nIG9uIHRo
ZSBkbWEtYnVmIGZpbGUuIE9ubHkKPiB0aGUgZmlsZSBvZiB0aGUgdm1hIHN0cnVjdHVyZS4gRG9p
bmcgdGhlIGZvcm1lciB3b3VsZCBpbmRlZWQgYmUgcHJldHR5Cj4gYmFkIGZyb20gYSBzZWN1cml0
eSBwb3YuCgpOb3cgd2hlcmUgZG8gSSBnZXQgYSBmaWxwIGZyb20/ICBDYW4gSSBqdXN0IGNhbGwg
ZHJtX29wZW4/CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
