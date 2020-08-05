Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283C23D777
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA9F6E874;
	Thu,  6 Aug 2020 07:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7E26E578
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 12:29:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x9so47485254ljc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m/HjrwgANJ8PQYoygV3h9t78fC88XwgOTu6N21/7jsU=;
 b=wJESEINa50YXFAOvvT+ZjoFcwfezYCjc+aFZwKvaqZgKzJkvDJ3dDvDHgb3d+YlpiV
 Zu/xKxVk8HXXbc6bqS+9Xsi9wdRtSo3zfueJOQxOu2zJDRI8ov8UCP1NOYhlSllRZbxK
 uAZprp4t2CmB87pxUcIjU0Tw+SIoG4ekrPels87nZiMVu70rlMszzl3etxDyL4fjSR5G
 H/63ayB5Cfr1wqSu8BTvktM8UNczdcnydn7WGwiqLp4JKcheq3r+mIt0SSVw6aBtCf0p
 2Ov0/7UIjc4+H5QI5bHF9zVVu5Sp4UTrjs/HZJgS2Ch/lzcEn3mPZZts37p41CgdXNn8
 m3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m/HjrwgANJ8PQYoygV3h9t78fC88XwgOTu6N21/7jsU=;
 b=Wp/mqL/aAGau0AqRflexq1iZjPOSLtBuGirYkr0MfuE+Zk4P/xZihZJJZv5aCDQwQC
 Clf/U5s5iUkbuaxeIspfOjbNezYfJCv/ZnalK+5lm4Sksbxx4qD3v2k1HtQKWafwQn2l
 ZFk9WZJavHqtTQ41nAOyUP0LyYhsXarWO5aMpVWPAohgvH5fA0QGEXu9Wg9MnNFCeeOq
 CMsRBHQu7NFcKfQ4I2YZ6XoosAqpKtbSqZ/1COdbBdorN5zYb1aa8AwLETQMIosMi4Wy
 kE6jUxs1MEpliqXKRrHJ+pW4YljqvMKg8cHtroIPeXhGY1jvLwIknGbXkpeoMAx/elTJ
 IN9g==
X-Gm-Message-State: AOAM530jejxp3hnWGisq06lw5KGQfL0QLLDop+DhvF+Gh5etrTrLHHO8
 oDONX6MjAiCPRqX6x5AIrKtLPD7n/uGX5pNEUKvFLw==
X-Google-Smtp-Source: ABdhPJyOjEZP47sZuldKNYJEYhNasYStQC+Fa3ES/mPukklZJ0Ni87yn1PSduKSm1D8JMHN41/q6VU9WiSOspSt7ifk=
X-Received: by 2002:a2e:844a:: with SMTP id u10mr1402186ljh.213.1596630579936; 
 Wed, 05 Aug 2020 05:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200722051851.72662-1-hexin.op@bytedance.com>
In-Reply-To: <20200722051851.72662-1-hexin.op@bytedance.com>
From: =?UTF-8?B?5L2V6ZGr?= <hexin.op@bytedance.com>
Date: Wed, 5 Aug 2020 20:29:29 +0800
Message-ID: <CACKzwjntROYA0WjdVewmozrXnzb=YX2dvqHgEpj4POOy0-QXOw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix memory leak in virtio_gpu_cleanup_object()
To: airlied@linux.ie, kraxel@redhat.com, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Qi Liu <liuqi.16@bytedance.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WGluIEhlIDxoZXhpbi5vcEBieXRlZGFuY2UuY29tPiDkuo4yMDIw5bm0N+aciDIy5pel5ZGo5LiJ
IOS4i+WNiDE6MTnlhpnpgZPvvJoKPgo+IEJlZm9yZSBzZXR0aW5nIHNobWVtLT5wYWdlcyB0byBO
VUxMLCBrZnJlZSgpIHNob3VsZAo+IGJlIGNhbGxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpbiBI
ZSA8aGV4aW4ub3BAYnl0ZWRhbmNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUWkgTGl1IDxsaXVxaS4x
NkBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
b2JqZWN0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gaW5kZXggNmNjYmQwMWNkODg4Li43
MDNiNWNkNTE3NTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X29iamVjdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5j
Cj4gQEAgLTc5LDYgKzc5LDcgQEAgdm9pZCB2aXJ0aW9fZ3B1X2NsZWFudXBfb2JqZWN0KHN0cnVj
dCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgc2dfZnJlZV90YWJsZShzaG1lbS0+cGFnZXMpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKHNobWVtLT5wYWdlcyk7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgc2htZW0tPnBhZ2VzID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkcm1fZ2VtX3NobWVtX3VucGluKCZiby0+YmFzZS5iYXNlKTsKPiAgICAgICAgICAgICAgICAg
fQo+IC0tCj4gMi4yMS4xIChBcHBsZSBHaXQtMTIyLjMpCj4KClBpbmcgZ3V5cy4gQW55IGNvbW1l
bnRzIG9yIHN1Z2dlc3Rpb25z77yfCgotLQpYaW4gSGUKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
