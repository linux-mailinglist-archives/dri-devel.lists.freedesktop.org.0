Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0396F8C0A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754AB6EAD5;
	Tue, 12 Nov 2019 09:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31906EAD5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:40:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z26so2297605wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 01:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=ejx/kqQy3kcUiiFlaD/FPSSHJrxrW00iUrEoU2xAx90=;
 b=av/IkhnHlEdHBXy2rVka+yeX5LY7EGj0GhG+jCUI408blFP7pROuqARx4FK7yTi/ac
 lM5vMVvpSHIzv1YaS0IDbpQXdfatAfPdO0OtG1IiFq5/OrD/yilvWnXGCE8dpjbm6ISH
 1zdE5h2gs+hVT6rVsEf9zCHzK2nb3qoJ4R15dTZheQIynevlTCFca4rKIk1qZ4RnxMtE
 WygiQfK/9TT9OHwPUbkzowx9FIdAw6koYjfOazQqagsKB/BXTAQu2eHZQU6VxfBllHgI
 KwOJObTZMIyf/pA/tdqcfiy1RQSZFtZ7CMjTjg2262GdJ866aS5a1D/FTjMavVVaaopS
 JazA==
X-Gm-Message-State: APjAAAVpRJHs2A5/caZiE4e22bXTZZjVLR7HlHtCtOblYC8oas88zzQB
 87z3Gz9fAi48U5//wf3ycPJhug==
X-Google-Smtp-Source: APXvYqwrO8bU+BJYM7oebMXYjkT49Im67i7AQuC63Zqgak8bgNrt+yEN/H6dPBWSj91L92X3BD5VAw==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr2985572wmf.162.1573551633503; 
 Tue, 12 Nov 2019 01:40:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 62sm26900378wre.38.2019.11.12.01.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 01:40:32 -0800 (PST)
Date: Tue, 12 Nov 2019 10:40:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] drm/virtgpu: fix double unregistration
Message-ID: <20191112094031.GF23790@phenom.ffwll.local>
Mail-Followup-To: Chuhong Yuan <hslester96@gmail.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20191109075417.29808-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109075417.29808-1-hslester96@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ejx/kqQy3kcUiiFlaD/FPSSHJrxrW00iUrEoU2xAx90=;
 b=lWbjKPSh3T/bDqJI/OHcdLlHvZS5ZQztXcO2OXBpY5i56aD1VdfCigUlZJ3ECo8PkX
 c5BD6/OUUkowHGZ0krgx5x2QCrVgAaZYg8lbDU4ZKdFofGst8i6HqOXyIbBwSmdeZoYl
 d1iLL7m24zo7aI/7PXf4CBZRYc/omP54nwyD8=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMDksIDIwMTkgYXQgMDM6NTQ6MTdQTSArMDgwMCwgQ2h1aG9uZyBZdWFuIHdy
b3RlOgo+IGRybV9wdXRfZGV2IGFsc28gY2FsbHMgZHJtX2Rldl91bnJlZ2lzdGVyLCBzbyBkZXYg
d2lsbCBiZSB1bnJlZ2lzdGVyZWQKPiB0d2ljZS4KPiBSZXBsYWNlIGl0IHdpdGggZHJtX2Rldl9w
dXQgdG8gZml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5
NkBnbWFpbC5jb20+CgpOaWNlIGNhdGNoLCBJJ2xsIGFwcGx5LgoKU2luY2UgdGhpcyBpcyBzbyBj
b25mdXNpbmcsIHdlIGFjdHVhbGx5IGhhdmUgYSB0b2RvIHRvIHJlbW92ZSBkcm1fcHV0X2Rldgpj
b21wbGV0ZWx5IGZyb20gdGhlIGNvZGViYXNlIChhbmQgb3Blbi1jb2RlIGl0IHdpdGggZXhwbGlj
aXQKdW5yZWdpc3RlcitwdXQpLiBXYW50IHRvIGRvIHRoYXQgbGl0dGxlIHBhdGNoIHNlcmllcyB0
byB1cGRhdGUgdGhlCnJlbWFpbmluZyBmZXcgZHJpdmVycyBhbmQgdGhlbiByZW1vdmUgZHJtX3B1
dF9kZXYgZnJvbSBjb3JlIGNvZGU/CgpUaGFua3MsIERhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5jCj4gaW5kZXggMGZjMzJmYTBiM2MwLi5mY2NjMjRlMjFhZjggMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCj4gQEAgLTEzOCw3ICsxMzgsNyBAQCBzdGF0aWMgdm9p
ZCB2aXJ0aW9fZ3B1X3JlbW92ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgCj4gIAlk
cm1fZGV2X3VucmVnaXN0ZXIoZGV2KTsKPiAgCXZpcnRpb19ncHVfZGVpbml0KGRldik7Cj4gLQlk
cm1fcHV0X2RldihkZXYpOwo+ICsJZHJtX2Rldl9wdXQoZGV2KTsKPiAgfQo+ICAKPiAgc3RhdGlj
IHZvaWQgdmlydGlvX2dwdV9jb25maWdfY2hhbmdlZChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRl
dikKPiAtLSAKPiAyLjIzLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
