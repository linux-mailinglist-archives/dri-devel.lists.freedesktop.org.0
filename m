Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31065F930
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 15:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D536E347;
	Thu,  4 Jul 2019 13:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD3A6E345
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 13:33:19 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 2so1962843vso.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 06:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQVVIWl//6cOx7PlPgCwTmODIiDI0iixaOn3E5xX89k=;
 b=Vw+c4fFacFXF1tz+BEOQlKSdJwSrk3XQ0j7no2xtk00l4btraVTqZ19SXfxM5jEUqW
 eIbjzYkkxzvoNKvxdmC9I7PleSu3HlCE8FF6Z6t4fEVcCNhf5xg/YIHZNUugjdU2u2H8
 b8weQS82o7rmcp6ApkmnAw+lFr2xpZTDeUN5fZuhsaumz4dTl9oLVEJpaG/tuE4Cj3s4
 9+ir0SlNgSXswHuE6EEPPi1xUTKTfLlCWocBXaNbYRsFLmAqQdrfWdAXUo/35uO2MdM0
 VYTUqdDxTk+s9N/DrBcGRFcTOV2zsy7cGsiYvTXUTCMsiyKUwfP3PXCjaTdmi6OptZrI
 QfZQ==
X-Gm-Message-State: APjAAAVIqd1NkkpWa/O+F07/CkvhKeikavKMYDiICgJg+nwO/v8FBoYb
 2ynumyS2g8ZNdrxLNTD1rS1Q0S5rFsvV5DIZIiXKYgH0
X-Google-Smtp-Source: APXvYqzNxMrL7Y1CtJokOFwqwShcUzdoU0/yTDHqrQLqguDdVULNGiPTFyjwU9y4H4PtuVAxlBXZEwnPTTITZkfD8P4=
X-Received: by 2002:a67:eb87:: with SMTP id e7mr22016486vso.118.1562247198710; 
 Thu, 04 Jul 2019 06:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-12-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-12-kraxel@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 14:33:26 +0100
Message-ID: <CACvgo53tSNa9=3LvmEdZvSp8g4oQF=cuue4UyTMjBtSKsfR0Ew@mail.gmail.com>
Subject: Re: [PATCH v6 11/18] drm/virtio: switch from ttm to gem shmem helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oQVVIWl//6cOx7PlPgCwTmODIiDI0iixaOn3E5xX89k=;
 b=tf6GWRf+C/ZB5a/aNf2dgNIGQoefiebM+pWSkWYd6g5+42Vw8BY/Hflfy5rgyEqBIY
 AkjG1Lt06tXP0NTdnFXu5ozD0KVkkrgkobAiW0vi8cmliCBscS6yh3+rxtN0U4p6uJ1z
 aVGTXdw3d22F94J0hDEqd2hbwmDI8dNRta+U40O/xSj2f4N45oZNN1B7UxmNU3DCVt1L
 ifcQG3k+n8CZpalpAnKd4AWSexGUm5ZQI7LujqCoWgxTB1SArwstn8/mpG9coVpqX89g
 hgEkx/ETJi9fEYCLRKBtXjcBZbCUhY4ioUU7UcJQHHhhKqifAkrjSzFIjCDZ77D4IX4B
 Tfuw==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKCk9uIFR1ZSwgMiBKdWwgMjAxOSBhdCAxNToxOSwgR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+ICAgICAgICAgLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUgPSB2aXJ0Z3B1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCgpJIHRoaW5rIHRoYXQgeW91
IGNhbiBkcm9wIHRoaXMgZW50cnktcG9pbnQuIEFGQUlDVCBpdCdzIG9ubHkgcHVycG9zZQppcyB0
byByZXR1cm4gYW4gZXJyb3IgLSBzb21ldGhpbmcgYWxyZWFkeSBoYW5kbGVkIGJ5IGNvcmUgRFJN
IHdoZW4gdGhlCmZ1bmN0aW9uIHBvaW50ZXIgaXMgTlVMTC4KSXQncyBub3Qgc3RyaWN0bHkgcmVs
YXRlZCB0byB0aGlzIHNlcmllcywgc28gZmVlbCBmcmVlIHRvIGtlZXAgaXMgYQpzZXBhcmF0ZSBz
dGFuZGFsb25lIHBhdGNoLgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
