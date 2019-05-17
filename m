Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0533265DC
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A4389AC6;
	Wed, 22 May 2019 14:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C92899BC;
 Fri, 17 May 2019 19:35:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h21so7247738ljk.13;
 Fri, 17 May 2019 12:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oA+g6BjOeWDCDPaNtw4l+EEHRWIb351/xuNrro8zEY4=;
 b=TmgGiUVzZLjBfHLdwbLsaWKDCXHpI5mRMvLpiIsMCgTQUaoceTaIvDc/jgoaxgWHL9
 da/jacTFm6vPdJUy9+Xp0EYTac2/1rdOV6cYB3sMrAUzqQFxV8Qspedcf2LGWl60BSCe
 M4AFb3rWVhceiO1P21mewlgA4BJ33TcPUIPDJH9E5pu3XhGVvbWTvqB+UkF8oS0g9DuM
 zJwGYm/mIpJ0V4A3mS/4yKkU1iUGUvyQ/VQIAO/XyWa1YaMUP2ClBI9pXJwTF2fyDm/D
 uusZ8ovzUN02ArDdfN0VNJ9YyauBB7X3NZ1OBnwkK3hW8PfHDjVnSEgdC3oCgUWraM/X
 GFKw==
X-Gm-Message-State: APjAAAXGhnX2Z9ky1RzBy6uaeKPRODgbXHzI8iN8PTPu4W/KmvIGw8Ei
 elPXp2nxZlLWVjvI6g/+qocw1w6466Jn23ilvug=
X-Google-Smtp-Source: APXvYqw3Ndar2K70iE6FCSdoN38/6Ha+qJWzFd9scroe1DcWMbv022D9uKRtitsvQqL8vxaXnRdjtaOIBqiq0t3j1wI=
X-Received: by 2002:a2e:121d:: with SMTP id t29mr19510880lje.29.1558121722303; 
 Fri, 17 May 2019 12:35:22 -0700 (PDT)
MIME-Version: 1.0
From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 17 May 2019 21:35:11 +0200
Message-ID: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
Subject: lima_bo memory leak after drm_sched job destruction rework
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Eric Anholt <eric@anholt.net>, Rex Zhu <Rex.Zhu@amd.com>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Emily Deng <Emily.Deng@amd.com>, Nayan Deshmukh <nayan26deshmukh@gmail.com>, 
 Sharat Masetty <smasetty@codeaurora.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oA+g6BjOeWDCDPaNtw4l+EEHRWIb351/xuNrro8zEY4=;
 b=KcjVo8r2smeq2n0rIIygRresX5eo6PDN7zwMhTIkNdyJ2wfFybhqgtBRoAwSbxD/mR
 9Vy+7/bZEQbZTuzBH4HkrFlEvjLSsOqQL92AWjzdeZZFi79zdh7n8+FF1toxjiIkovZm
 v3tQfoyFj6hX9jsrxl70iXXb+9E0Or2REaorilm8HNuXVxgaOZvm3gpbCrnq/4w+kImP
 mq/IHRtwa7lk9Lhv5UizbBlJ08FKO3LAx3BE4WNfLSbq10WRGPTfcf1M2muTfEUglf/X
 kWBOj7Yz1cicyegE/H5Eq4vZxKJ5BWl8vZwmBmsBpqinljIlhPgC/Z2eTqNzYkrvOpfp
 3kFQ==
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

SGVsbG8sCgpJIGhhdmUgcmVjZW50bHkgb2JzZXJ2ZWQgYSBtZW1vcnkgbGVhayBpc3N1ZSB3aXRo
IGxpbWEgdXNpbmcKZHJtLW1pc2MtbmV4dCwgd2hpY2ggSSBpbml0aWFsbHkgcmVwb3J0ZWQgaGVy
ZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpbWEvbGludXgvaXNzdWVzLzI0Ckl0
IGlzIGFuIGVhc2lseSByZXByb2R1Y2VhYmxlIG1lbW9yeSBsZWFrIHdoaWNoIEkgd2FzIGFibGUg
dG8gYmlzZWN0IHRvIGNvbW1pdDoKCjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsg
am9iIGRlc3RydWN0aW9uCgpBZnRlciBzb21lIGludmVzdGlnYXRpb24sIGl0IHNlZW1zIHRoYXQg
YWZ0ZXIgdGhlIHJlZmFjdG9yLApzY2hlZC0+b3BzLT5mcmVlX2pvYiAoaW4gbGltYTogbGltYV9z
Y2hlZF9mcmVlX2pvYikgaXMgbm8gbG9uZ2VyCmNhbGxlZC4KV2l0aCBzb21lIG1vcmUgZGVidWdn
aW5nIEkgZm91bmQgdGhhdCBpdCBpcyBub3QgYmVpbmcgY2FsbGVkIGJlY2F1c2UKdGhlIGpvYiBm
cmVlaW5nIGlzIG5vdyBpbiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzLCB3aGljaCBmb3IgbGltYQph
bHdheXMgYWJvcnRzIGluIHRoZSBpbml0aWFsICJEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhl
IHRpbWVvdXQKd29ya2VyIGlzIHJ1bm5pbmciIGNvbmRpdGlvbi4KCkxpbWEgY3VycmVudGx5IGRl
ZmF1bHRzIHRvIGFuICJpbmZpbml0ZSIgdGltZW91dC4gU2V0dGluZyBhIDUwMG1zCmRlZmF1bHQg
dGltZW91dCBsaWtlIG1vc3Qgb3RoZXIgZHJtX3NjaGVkIHVzZXJzIGRvIGZpeGVkIHRoZSBsZWFr
IGZvcgptZS4KCkkgY2FuIHNlbmQgYSBwYXRjaCB0byBzZXQgYSA1MDBtcyB0aW1lb3V0IGFuZCBo
YXZlIGl0IHByb2JhYmx5IHdvcmtpbmcKYWdhaW4sIGJ1dCBJIGFtIHdvbmRlcmluZyBub3cgaWYg
dGhpcyBpcyBleHBlY3RlZCBiZWhhdmlvdXIgZm9yCmRybV9zY2hlZCBhZnRlciB0aGUgcmVmYWN0
b3IuCkluIHBhcnRpY3VsYXIgSSBhbHNvIG5vdGljZWQgdGhhdCBkcm1fc2NoZWRfc3VzcGVuZF90
aW1lb3V0IGlzIG5vdApjYWxsZWQgYW55d2hlcmUuIElzIGl0IGV4cGVjdGVkIHRoYXQgd2Ugbm93
IHJlbHkgb24gYSB0aW1lb3V0CnBhcmFtZXRlciB0byBjbGVhbnVwIGpvYnMgdGhhdCByYW4gc3Vj
Y2Vzc2Z1bGx5PwoKRXJpY28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
