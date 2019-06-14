Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71417461E9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF83689308;
	Fri, 14 Jun 2019 15:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3383189308
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:00:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so3914664edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NbFRe8iz8+YgXTd9+j/Su+erCoaDy3fGkGP7auiuNUA=;
 b=ckTa96L2lwRnjxvnc5isfO0gY5MVXEYvsKLvC4cABeGJ2yZZFvk2gh2WxCHISzhFkH
 mDk+rk4vfqCCk92m/T12g0+Ft8U4Ma0+wRUMEoQT7ghrF7Z9kqN9TJ+2CyObU3+u6jWK
 mbfyffQ7rznY4CmTHLcu7sa3z0Q5Pz0GQ93+ZkUBZ/pO9DjEHKkHfE6kKoAI124j2PkL
 uXmyCBiNovEg/8VFaRjg/OcXGcbjYneDqs9DzwkZSIzg/ejV2zgMYPD34f5oobXsSmW6
 DzRu9r0rp+bO5Bjo7DIt9TuH5M8sKElgqyXETtz7rRhhNdDDQzFOS4oG91T5SOxqEcvq
 byPw==
X-Gm-Message-State: APjAAAVekof92T+oiQ9JJi7zsU5m35FWv8tWR344b8lEyzpjL/IhU8Cq
 bvH4rOpV8V589H7pET8Qlozlzw==
X-Google-Smtp-Source: APXvYqzbUincpkS9VRFPqctb2mtBCQ81/I0YaGNHD6rsk2qXjiGZJEqf/FLbTjm8dLd6boMGMh27sg==
X-Received: by 2002:a17:906:4e57:: with SMTP id
 g23mr10186023ejw.52.1560524444771; 
 Fri, 14 Jun 2019 08:00:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 17sm962988edu.21.2019.06.14.08.00.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 08:00:43 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:00:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Young Xiao <92siuyang@gmail.com>
Subject: Re: [PATCH] drm/amd: fix hotplug race at startup
Message-ID: <20190614150041.GA23020@phenom.ffwll.local>
Mail-Followup-To: Young Xiao <92siuyang@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1560511763-2140-1-git-send-email-92siuyang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560511763-2140-1-git-send-email-92siuyang@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NbFRe8iz8+YgXTd9+j/Su+erCoaDy3fGkGP7auiuNUA=;
 b=bMvCQCY1CEGJuCCTGphkCQCQDXbBiiOzKD2MHOjDq+l9sETlfAVva1PsQHnRf2oUGN
 M5o0BI9D4sRZY9xNMHZwuhH8HqA0pR3KYSUbrT4aFt/AOsxxvjk9BZkDeqOL6uUKUt/2
 lfg6y+DC2kF7XSnWHwQW2J1I6e61GDiKl3nik=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDc6Mjk6MjNQTSArMDgwMCwgWW91bmcgWGlhbyB3cm90
ZToKPiBXZSBzaG91bGQgY2hlY2sgbW9kZV9jb25maWdfaW5pdGlhbGl6ZWQgZmxhZyBpbiBhbWRn
cHVfaG90cGx1Z193b3JrX2Z1bmMuCj4gCj4gU2VlIGNvbW1pdCA3Zjk4Y2E0NTRhZDMgKCJkcm0v
cmFkZW9uOiBmaXggaG90cGx1ZyByYWNlIGF0IHN0YXJ0dXAiKSBmb3IgZGV0YWlscy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBZb3VuZyBYaWFvIDw5MnNpdXlhbmdAZ21haWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgfCAzICsrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pcnEuYwo+IGluZGV4IGFmNGMzYjEuLjEzMTg2ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gQEAgLTg1LDYgKzg1LDkgQEAgc3RhdGljIHZvaWQg
YW1kZ3B1X2hvdHBsdWdfd29ya19mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCXN0
cnVjdCBkcm1fbW9kZV9jb25maWcgKm1vZGVfY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7Cj4g
IAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICAKPiArCWlmICghYWRldi0+bW9k
ZV9pbmZvLm1vZGVfY29uZmlnX2luaXRpYWxpemVkKQo+ICsJCXJldHVybjsKCkkgdGhpbmsgeW91
IHdhbnQgdG8gZGVsYXkgeW91ciBob3RwbHVnIGluaXRpYWxpemF0aW9uIHVudGlsIHlvdSdyZSBy
ZWFkeQp0byBzZXJ2ZSBob3RwbHVnIGV2ZW50cywgdGhpcyBoZXJlIGlzIGZhaXJseSByYWN5IC4u
LgotRGFuaWVsCgo+ICsKPiAgCW11dGV4X2xvY2soJm1vZGVfY29uZmlnLT5tdXRleCk7Cj4gIAls
aXN0X2Zvcl9lYWNoX2VudHJ5KGNvbm5lY3RvciwgJm1vZGVfY29uZmlnLT5jb25uZWN0b3JfbGlz
dCwgaGVhZCkKPiAgCQlhbWRncHVfY29ubmVjdG9yX2hvdHBsdWcoY29ubmVjdG9yKTsKPiAtLSAK
PiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
