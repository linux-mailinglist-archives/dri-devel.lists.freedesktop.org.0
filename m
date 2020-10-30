Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F502A050A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 13:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B356EDA2;
	Fri, 30 Oct 2020 12:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105E86EDA2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:09:02 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 32so5345706otm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aA3nsqHQfxB7ZYAv8v3Yunzhxdfru1tEdm8Aflpbocs=;
 b=hCzgYhe+vSRq5Pg+rTmx3X8XwLIbUHIiYG+lV/eqln50OL6DsL35iN7dBQiygq6R9d
 +aEhRoT+wyNu7mrTsVG5pzDJ5ZJT3jYDWpSbjHUf1UFJD4A4iGdXBpJpYG5JDdLcfswr
 SA6bnh5v8i2G9+N9GIS4/r6dsiuvRe1H/CwKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aA3nsqHQfxB7ZYAv8v3Yunzhxdfru1tEdm8Aflpbocs=;
 b=WSH3GeesPqoyHaYaUzBS9emFKcu2ONrOmZbg/oi+0/WnkzAJi664ijtzRg7FKzbIdJ
 qr0cxu2jIq8EG/OLXFiVscCiUkBTcUojAptlw5uRQsrFT5A6ogzElWZbMplMFPUcyjMM
 0FBuKGn4Bq61qITQG7OkjRRGGYlB8be6CUlDwhhcVS9TtnAw5Mt8Q5ZB+E1SH7dDUFvQ
 fZyy894D+zSVC8iUg3O7Bv0g9O9PnMNByQpKV9MVGY644/yOW8b34WxEBbAzJKzg8H5u
 1Hg4vbmFQ5iC/OwwKEbXQ6TgqMC8KekfVVuscLHIW7nX5GoPXF0/IpE72m9qimx1s/Ea
 ZHyA==
X-Gm-Message-State: AOAM530jNnrXo/KEVXS8x/EiFHC1oUhw3SXVR9IhH3d2ErBELc3N6otO
 eFn9YUrLRFhT4A/kqS3+g/F8MQZwS7/Ogkv9sgKPnw==
X-Google-Smtp-Source: ABdhPJy6t5n33u7DF36OepUtDTZTIbDERwuSrlJz6W9nU7xvj4Bub92Bxj1XxWzfLlzfh9dLZvk2Uo+JWGgyxw4M3QI=
X-Received: by 2002:a05:6830:15d9:: with SMTP id
 j25mr883388otr.188.1604059741424; 
 Fri, 30 Oct 2020 05:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201030111301.13458-1-christian.koenig@amd.com>
In-Reply-To: <20201030111301.13458-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Oct 2020 13:08:50 +0100
Message-ID: <CAKMK7uFXKksw1F4cKRgKFfsNbVWo4VNt0-+-nu7+cv9OPD14Yg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveu: fix swiotlb include
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMTI6MTMgUE0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGNoZWNrIGZvciBzd2lv
dGxiIGhhcyBtb3ZlZCB0byBub3V2ZXVfdHRtLmMsIGJ1dCB3ZSBmb3Jnb3QgdG8gbW92ZQo+IHRo
ZSBpbmNsdWRlIGFzIHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpIbSBkcm0tbWlzYy1uZXh0IGNvbXBpbGVzIGZpbmUg
d2l0aCBzd2lvdGxiIGVuYWJsZWQgaW4gY29uZmlnLiBBbSBJCmJsaW5kIG9yIGlzIHRoaXMgYSBt
ZXJnZSBwcm9ibGVtIHdpdGggLXJjMT8gSWYgdGhlIGxhdHRlciBuZWVkIHRvIGdpdmUKVGhvbWFz
IGEgaGVhZHMtdXAgYWJvdXQgdGhhdCBmb3IgdGhlIGJhY2ttZXJnZSBvZiAtcmMyLgotRGFuaWVs
CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICB8IDEgLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIHwgMyArKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCA3NDZjMDZlZDE5NWIuLjgxMzMzNzdkODY1ZCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtMjgsNyArMjgsNiBA
QAo+ICAgKi8KPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiAtI2luY2x1ZGUg
PGxpbnV4L3N3aW90bGIuaD4KPgo+ICAjaW5jbHVkZSAibm91dmVhdV9kcnYuaCIKPiAgI2luY2x1
ZGUgIm5vdXZlYXVfY2hhbi5oIgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+
IGluZGV4IGQ2OTZkODgyYzllYi4uMmJmMzYyMjlkZDU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3R0bS5jCj4gQEAgLTIyLDYgKzIyLDkgQEAKPiAgICogT1RIRVJXSVNFLCBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9S
IFRIRQo+ICAgKiBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICAgKi8K
PiArCj4gKyNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4gKwo+ICAjaW5jbHVkZSAibm91dmVh
dV9kcnYuaCIKPiAgI2luY2x1ZGUgIm5vdXZlYXVfZ2VtLmgiCj4gICNpbmNsdWRlICJub3V2ZWF1
X21lbS5oIgo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0KRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
