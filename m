Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD023E7E3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D5B6E97C;
	Fri,  7 Aug 2020 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EEB6E03C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 03:00:24 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t23so616310ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 20:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wTsG01+FAeINX7tJPCyhTMiFIIvHpHWzQDxM2xhAlu0=;
 b=Gm31v+4cDz5MOdOXgxbVeFLOkDmj2PWmhCK9B44JcVcB9EGVqb2EHJ0glPrQdedeoE
 +dPxtK2Xc4SGtVJ0QTwcIjnwhBQLRJ6/jUNKjdOiYs3niZ53XsOdbdI5ttB999I6uP+H
 iWK3PQQX3DLEjizrqFQvsKsZmACpiG1RLlyK+tME069oyyEudHRoRjWP8AHYf4ryErIi
 35fufUI9RK1j7dKbgGkydHUIbns0c81ybZVZ9dmrf+hcULwDmTTdzQCxgNcwlUDuMqrn
 BFJUbsGedZMnaLb7fdruesQNZV88xD2p2V5MlqR6ObkfvHqhb7BvgMQ1rGKCa4veKuCZ
 W4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wTsG01+FAeINX7tJPCyhTMiFIIvHpHWzQDxM2xhAlu0=;
 b=eErMsIxJWuVfFiv/13vg7OubFl0cZfYXB8tNJ2tJD/IYt4uwQKQK5skNSLfDJdKVLW
 jFo0w2ABZWM1UpHXarhSTqmdKlJmjZ57Cr/bw7QqJiA1wwKDkHV967JLYxna54mpNtva
 15W1Z1LCupFSn+AjDXnpHC2zBM3quFsRWT68xqPUL9N9YrBoAnQoNeO2qPgC3FpkGHDe
 /v5xobAwfOgBB/gWpeoZEkyMDWEtXvU/fDJ+INbfFOekI9r1JTjcKaK6Hnv6RrZLmf3q
 5jDwROHhiTSaBCJxNlrl77h+m6vrOz3etw+ZD8ItKT76ifI4tvg6KDNN5z7YW/sP4bw2
 W4sw==
X-Gm-Message-State: AOAM533v78Kpqq8WkPnoJ4jZJ1y27E9cMW3fH5MvTXrB4gUQjzeCgksd
 VyVAT28NHmCJ7JXeWdNRQ5y6CIBUw7AibMISDaK1LA==
X-Google-Smtp-Source: ABdhPJyksl15UPkEtHxTCd6XOj4wYFTTaeSdOFSPR45CICDOdBMwsjVD+2gtHPnL9heaHDSkTdbmmnz6Q2VSG4Gis7Q=
X-Received: by 2002:a2e:87c4:: with SMTP id v4mr5180563ljj.8.1596769222640;
 Thu, 06 Aug 2020 20:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200721101647.42653-1-hexin.op@bytedance.com>
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
From: =?UTF-8?B?5L2V6ZGr?= <hexin.op@bytedance.com>
Date: Fri, 7 Aug 2020 11:00:11 +0800
Message-ID: <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
To: Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, kraxel@redhat.com, 
 Sumit Semwal <sumit.semwal@linaro.org>
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Muchun Song <songmuchun@bytedance.com>, linux-media@vger.kernel.org,
 Qi Liu <liuqi.16@bytedance.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WGluIEhlIDxoZXhpbi5vcEBieXRlZGFuY2UuY29tPiDkuo4yMDIw5bm0N+aciDIx5pel5ZGo5LqM
IOS4i+WNiDY6MTflhpnpgZPvvJoKPgo+IEZyb206IFFpIExpdSA8bGl1cWkuMTZAYnl0ZWRhbmNl
LmNvbT4KPgo+IFdlIHNob3VsZCBwdXQgdGhlIHJlZmVyZW5jZSBjb3VudCBvZiB0aGUgZmVuY2Ug
YWZ0ZXIgY2FsbGluZwo+IHZpcnRpb19ncHVfY21kX3N1Ym1pdCgpLiBTbyBhZGQgdGhlIG1pc3Np
bmcgZG1hX2ZlbmNlX3B1dCgpLgo+Cj4gRml4ZXM6IDJjZDdiNmYwOGJjNCAoImRybS92aXJ0aW86
IGFkZCBpbi9vdXQgZmVuY2Ugc3VwcG9ydCBmb3IgZXhwbGljaXQgc3luY2hyb25pemF0aW9uIikK
PiBDby1kZXZlbG9wZWQtYnk6IFhpbiBIZSA8aGV4aW4ub3BAYnl0ZWRhbmNlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBYaW4gSGUgPGhleGluLm9wQGJ5dGVkYW5jZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogUWkgTGl1IDxsaXVxaS4xNkBieXRlZGFuY2UuY29tPgo+IFJldmlld2VkLWJ5OiBNdWNodW4g
U29uZyA8c29uZ211Y2h1bkBieXRlZGFuY2UuY29tPgo+IC0tLQo+Cj4gY2hhbmdlbG9nIGluIHYz
Ogo+IDEpIENoYW5nZSB0aGUgc3ViamVjdCBmcm9tICJkcm0vdmlydGlvOiBmaXhlZCBtZW1vcnkg
bGVhayBpbiB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwoKSIgdG8KPiAgICAiZHJtL3ZpcnRp
bzogZml4IG1pc3NpbmcgZG1hX2ZlbmNlX3B1dCgpIGluIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9p
b2N0bCgpIgo+IDIpIFJld29yayB0aGUgY29tbWl0IGxvZwo+Cj4gY2hhbmdlbG9nIGluIHYyOgo+
IDEpIEFkZCBhIGNoYW5nZSBkZXNjcmlwdGlvbgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9pb2N0bC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiBpbmRleCA1ZGY3MjIwNzJi
YTAuLjE5YzViYzAxZWI3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0
bC5jCj4gQEAgLTE3OSw2ICsxNzksNyBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfZXhlY2J1ZmZl
cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+Cj4gICAgICAgICB2
aXJ0aW9fZ3B1X2NtZF9zdWJtaXQodmdkZXYsIGJ1ZiwgZXhidWYtPnNpemUsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmZwcml2LT5jdHhfaWQsIGJ1Zmxpc3QsIG91dF9mZW5jZSk7
Cj4gKyAgICAgICBkbWFfZmVuY2VfcHV0KCZvdXRfZmVuY2UtPmYpOwo+ICAgICAgICAgdmlydGlv
X2dwdV9ub3RpZnkodmdkZXYpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtLQo+IDIuMjEuMSAo
QXBwbGUgR2l0LTEyMi4zKQo+CgpjYyBHcmVnCgotLQpYaW4gSGUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
