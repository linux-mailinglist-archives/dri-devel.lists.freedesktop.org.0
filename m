Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24458ECBB4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2F6F893;
	Fri,  1 Nov 2019 22:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E0C6E2E8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:44:16 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q1so12130283ion.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 12:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axzshPELM7/h/f56rh7I6+q9RKvy3Fkbh152ongAIZo=;
 b=i6r8kkC1OslxOLZeEqB7z6zeU0r21AoD2/0IgZRpZs/oCCFUnQCTptPyzCNlPDYcLx
 cCb+JFK4BTHhLLW3Uqcfr+XPAJld4Sv9kumVH/B8JiXIKyUonHUdHgC33xdJsetAEu6P
 6UqcMkDrFAf2aySfFHdsK78c/fQeV4saQo38z/jzL5Og/zKo65It74Ru4OQ+zD7DJufU
 kLy/IAVFOcrQgx7YmCAhJXE6oL2i0YobFteFdN0VlpyEb0LMNuEsSKtUbeFRtX3DiaVu
 sWUJMHFkDJjtKeqhMf2qaYEp+tjOY0/KsXVLr1/4YQUw+RmyGNpTvvRMvwqZRMVLRstm
 01YQ==
X-Gm-Message-State: APjAAAXvqAwmTXsWGd9/8oaPqmGtlhJUrDS3vsEKOt/aDfzF4P57GJkZ
 rHlkmBcZHQWo7hLBPwx648quDxPofAU3r/oD1lCeIg==
X-Google-Smtp-Source: APXvYqwn8/+qOnCQ0SanGF+GlIb02HFEC57QcBSoEAxDl2XuN/Lo8hASlLzc7oaZ3XOazsRShxybaTd0EtPsyM+YbY0=
X-Received: by 2002:a5d:9053:: with SMTP id v19mr11719168ioq.244.1572637455610; 
 Fri, 01 Nov 2019 12:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
 <ec3c1d7b-231a-862f-ce12-8ac4c9616ca5@linux.intel.com>
In-Reply-To: <ec3c1d7b-231a-862f-ce12-8ac4c9616ca5@linux.intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Fri, 1 Nov 2019 12:44:04 -0700
Message-ID: <CAJs_Fx6ErP9ap=veqJSrN-coKm_VV78wxqYLj_QF+-Gutk5AZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=axzshPELM7/h/f56rh7I6+q9RKvy3Fkbh152ongAIZo=;
 b=LWzaFQtV8lpRJL4zRxgdrqJXFvoWyXicqfLJbq4fqq9D4a5jegOQkkt6TItBaijwyF
 UiSLZdvb4KbyvXkIug/VziNjxWrWpxIfOe1cq+3vyMhbfZwv5tRFafD7MKI1RQ/dZGCR
 h6K9PPGKZwLD955fa25U/L1m2f7Kf1k1h3pUU=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMSwgMjAxOSBhdCAxMTozMyBBTSBNYWFydGVuIExhbmtob3JzdAo8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9wIDAxLTExLTIwMTkgb20g
MTk6MDcgc2NocmVlZiBSb2IgQ2xhcms6Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bj
aHJvbWl1bS5vcmc+Cj4gPgo+ID4gVGhlIG5ldyBzdGF0ZSBzaG91bGQgbm90IGJlIGFjY2Vzc2Vk
IGFmdGVyIHRoaXMgcG9pbnQuICBDbGVhciB0aGUKPiA+IHBvaW50ZXJzIHRvIG1ha2UgdGhhdCBl
eHBsaWNpdC4KPiA+Cj4gPiBUaGlzIG1ha2VzIHRoZSBlcnJvciBjb3JyZWN0ZWQgaW4gdGhlIHBy
ZXZpb3VzIHBhdGNoIG1vcmUgb2J2aW91cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4KPiBXb3VsZCBiZSBuaWNlIGlmIHlvdSBjb3Vs
ZCBjYyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIG5leHQgdGltZSwgc28gSSBrbm93
IG91ciBDSSBpbmZyYXN0cnVjdHVyZSBpcyBoYXBweTsKPgo+IEl0IHdvdWxkbid0IHN1cnByaXNl
IG1lIGlmIGl0IGNhdGNoZXMgMSBvciAyIGFidXNlcyBpbiBpOTE1Lgo+Cj4gT3RoZXJ3aXNlIFJl
dmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+Cj4gUGVyaGFwcyB5b3UgY291bGQgbWFpbCB0aGlzIHRvIHZlcnNpb24gdG8gaW50
ZWwtZ2Z4LXRyeWJvdEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgdXNpbmcgZ2l0LXNlbmQtZW1haWwg
c28gd2UgYXQgbGVhc3QgZ2V0IGk5MTUgcmVzdWx0cz8KCm9rLCBJIHNlbnQgYm90aCBwYXRjaGVz
IHRvIHRyeWJvdCwgaG9wZWZ1bGx5IGl0IHRyaWVzIHRoZW0gdG9nZXRoZXIsCmFzIHRoaXMgcGF0
Y2ggd2l0aG91dCB0aGUgc2VsZi1yZWZyZXNoIGZpeCB3aWxsIGRlZmluaXRlbHkgZmFsbCBvdmVy
CgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
