Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CE10390A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC24E6E2F8;
	Wed, 20 Nov 2019 11:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B6D6E2F8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:47:54 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id l14so20902909oti.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 03:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mkB6zy3dD8OHSTYTazO8NWIIhC8tS/AJYj4H2NKC0xI=;
 b=TlbfadF1wKg115GsO+3tfTQACJ2JF2WSEAWnCITNrRkFNSXa0kKmdN1Ro/Z6kv7jBH
 flUwQfHInG1KRwyVbCQAAKtvskhcxyiFgofblGNPi6HfqROj9QPN5tJ5XIZ7WOoqfOhm
 0uuRtz4KGiLhgAHoUPZ2isrKOG8dTe53JPljfu7GQSYZ/7GAy9Yyv79WuwR8Omko439r
 cliGy1rWcPaYFfPfK6Imq91wlXBufTxRHzY56bDHJS6qk+R2hR9xJVxCqlFfAsC60KHT
 8ydRh30shIk82RAwEZPYagA43KNgO4TBj7vzRiHc7vACSa33kd1RoeJNWjt+NwW2Eaky
 iHNA==
X-Gm-Message-State: APjAAAVsDVS5hcAHNnRVRerFqlac8LB2+Pi+0T0PE1tfcfGm+v2vXbcs
 wVrjdJ1AOBjlBeIQB3MhnMc6iw8LoF6zkwUwh64ct/y9
X-Google-Smtp-Source: APXvYqzokDBBuQCP70k/ejnrESCAfIXWH0nqSUiA6HZjHkmRMbn1vl1xNPezIgLCk4Oj0g1Wdqwg6kpz5A/CoEwNAgE=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr1738827otc.188.1574250473526; 
 Wed, 20 Nov 2019 03:47:53 -0800 (PST)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Nov 2019 12:47:42 +0100
Message-ID: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
Subject: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=mkB6zy3dD8OHSTYTazO8NWIIhC8tS/AJYj4H2NKC0xI=;
 b=HV6jky/oncktoGhQgwvi8kuUBMKsOwxR9fKnJgkmRjZ0WawVJg33h3AhuzfefhdZoQ
 F2w1qz88fjKuPHYSSehU5ji/8qBg7JFpFV2TGtXpHWVocXJ2rwD7uWJ0rSm7ieUmLEyh
 Nmtpz57h4aWAlzs7GJMM33UavVcTkfOntWYbg=
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

SGkgYWxsLAoKSSd2ZSBiZWVuIGxvb2tpbmcgYXQgZG1hX2J1Zl92KHVuKW1hcCwgd2l0aCBhIGdv
YWwgdG8gc3RhbmRhcmRpemUKbG9ja2luZyBmb3IgYXQgbGVhc3QgZHluYW1pYyBkbWEtYnVmIGV4
cG9ydGVycy9pbXBvcnRlcnMsIG1vc3QgbGlrZWx5CmJ5IHJlcXVpcmluZyBkbWFfcmVzdl9sb2Nr
LiBBbmQgSSBnb3QgcXVlc3Rpb25zIGFyb3VuZCBob3cgdGhpcyBpcwpzdXBwb3NlZCB0byB3b3Jr
LCBzaW5jZSBhIGJpZyBjaHVuayBvZiBkcml2ZXJzIHNlZW0gdG8gZW50aXJlbHkgbGFjawpsb2Nr
aW5nIGFyb3VuZCB0dG1fYm9fa21hcC4gVHdvIGJpZyBvbmVzOgoKLSB0dG1fYm9fa21hcCBsb29r
cyBhdCBiby0+bWVtIHRvIGZpZ3VyZSBvdXQgd2hhdC93aGVyZSB0byBrbWFwIHRvIGdldAphdCB0
aGF0IGJ1ZmZlci4gYm8tPm1lbSBpcyBzdXBwb3NlZCB0byBiZSBwcm90ZWN0ZWQgd2l0aApkbWFf
cmVzdl9sb2NrLCBidXQgYXQgbGVhc3QgYW1ncHUvbm91dmVhdS9yYWRlb24vcXhsIGRvbid0IGdy
YWIgdGhhdAppbiB0aGVpciBwcmltZSB2bWFwIGZ1bmN0aW9uLgoKLSBiZXR3ZWVuIHRoZSB2bWFw
IGFuZCB2dW5tYXAgc29tZXRoaW5nIG5lZWRzIHRvIG1ha2Ugc3VyZSB0aGUgYmFja2luZwpzdG9y
YWdlIGRvZXNuJ3QgbW92ZSBhcm91bmQuIEkgZGlkbid0IGZpbmQgdGhhdCBlaXRoZXIgYW55d2hl
cmUsCnR0bV9ib19rbWFwIHNpbXBseSBzZWVtcyB0byBzZXQgdXAgdGhlIG1hcHBpbmcsIGxlYXZp
bmcgbG9ja2luZyBhbmQKcmVmY291bnRpbmcgdG8gY2FsbGVycy4KCi0gdnJhbSBoZWxwZXJzIGhh
dmUgYXQgbGVhc3QgbG9ja2luZywgYnV0IEknbSBzdGlsbCBtaXNzaW5nIHRoZQpyZWZjb3VudGlu
Zy4gdm13Z2Z4IGRvZXNuJ3QgYm90aGVyIHdpdGggdm1hcC4KCldoYXQgYW0gSSBtaXNzaW5nPwoK
VGhhbmtzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
