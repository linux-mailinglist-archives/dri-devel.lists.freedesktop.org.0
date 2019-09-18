Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E1B7445
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794896FA4D;
	Thu, 19 Sep 2019 07:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318D16FC66;
 Wed, 18 Sep 2019 19:45:44 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k9so668650oib.7;
 Wed, 18 Sep 2019 12:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFRuQuV9XjCqqduSCnKp7lM1BpDzx2ulePxOFHhxylY=;
 b=UM898jiD73Nm9+vh2Uvur731jM9VC40m55Fxz6OZMvKSFpLz+CtpkOJhJGK03TmUmF
 FPUl69zLVIOdQClfAgdy8OkCJyzAhEoiJc9VFZ6Pec1J9+n8D5KfOml41pQaXoLRluzQ
 anruIYq9PGb2CCOyP1F85Gx2Ihc/OYbWS3ed0XucDROk0i8Hw6En1IC/JbyJNIxnZBXn
 bvahKVf+LskykUFl9Sb7o+8QJmZ6KReM7kwVB1Xp4yOBPvAU19k+WiJd57BOrOCUduem
 JoBZ+EISX7o0pqwXpQ8E/9WqFawyPa+DWfpJiWqQSGAp0INcOtsjsucLTnL4mig5Qp+6
 mM4g==
X-Gm-Message-State: APjAAAX0nW2Iujgcl2TkaWZhQ6WOqIw4PrfUDXDv+yyS4CFiqHsZ+sai
 3LK1WqPYsUU4pFJ0vBuBKnInPLtooLyUIinPVC4=
X-Google-Smtp-Source: APXvYqxWS0XYUX1CSpnY3gTX28OO3/FQnJB5A3pp7NjvWrHVFfXoTCc7kD/+pUTCbd/ehw2A6/9H1eO/dtXJVnFDswM=
X-Received: by 2002:aca:3bc2:: with SMTP id i185mr3637318oia.77.1568835943095; 
 Wed, 18 Sep 2019 12:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
 <20190918190529.17298-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190918190529.17298-1-navid.emamdoost@gmail.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 18 Sep 2019 15:45:32 -0400
Message-ID: <CAGngYiUJYUGN9CA1smKvy3GF=HWEXtaSdCZHEK64A_63edqF6A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
To: Navid Emamdoost <navid.emamdoost@gmail.com>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gFRuQuV9XjCqqduSCnKp7lM1BpDzx2ulePxOFHhxylY=;
 b=vV8oMvOLZnR1Wz2UcWF5lk/DQOyFhdBBIgYV3sjsEq6s/bSlOfU21/Jc9BsD0xtuqQ
 U5R/RflBDY3JWtRhe4C3seGlY1sGIBFYT82y3oXXWSu0goL+yus2MucrrO8whMtfHoqP
 J1i3dkGqBZau5j3fbxnW7x9URktaqvP9XA0bv24JgXlGONsK+bgu2vtnRRVP8sd6ouRa
 WLhKZi4uo/PxDytqa95O0gf8W975W7nHZeDLuM/4OvqkAhxxIsy1/ORInMPizexzzIE4
 Kwx+GYqBYFvMNZrVtrfID+iN+ejO/wqIXxkxQ7Z5orwBC/Xx/JZrHyjKO0rv8ueIyi29
 apRQ==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 kjlu@umn.edu, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, smccaman@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMzowOSBQTSBOYXZpZCBFbWFtZG9vc3QKPG5hdmlkLmVt
YW1kb29zdEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gICAgICAgICBpMnNfcGRhdGEgPSBrY2FsbG9j
KDMsIHNpemVvZihzdHJ1Y3QgaTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsKPiAgICAg
ICAgIGlmIChpMnNfcGRhdGEgPT0gTlVMTCkgewo+IC0gICAgICAgICAgICAgICBrZnJlZShhZGV2
LT5hY3AuYWNwX3Jlcyk7Cj4gLSAgICAgICAgICAgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3BfY2Vs
bCk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsgICAgICAgICAgICAgICBy
ZXQgPSAtRU5PTUVNOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDM7Cj4gICAgICAgICB9CgpJ
IGRvbid0IHNlZSBhIGNvcnJlc3BvbmRpbmcga2ZyZWUoKSBmb3IgaTJzX3BkYXRhIGluIGFjcF9o
d19maW5pKCkuCkNvdWxkIHRoaXMgYmUgYSBtZW1vcnkgbGVhaz8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
