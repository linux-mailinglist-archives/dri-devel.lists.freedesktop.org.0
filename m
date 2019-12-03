Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FF10FACA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 10:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ECE6E443;
	Tue,  3 Dec 2019 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692926E443
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 09:33:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so2643848wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 01:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=ZaaTzB9B+KCHVUkdR37ZgN+trAYMPzah4PHL0bT6fiA=;
 b=iesRUvPVZaMyykoM/EiqAvA2XEemg0R2oP6c3dAF228bn2j0d6npY2weGia8xR7HxV
 s745ir2rRsCnmhxmia95jFxX4jVhi5ZIdwjxc6oPdxhlCBpYGUFMjtgJoBt42yhs94O7
 VkXqGyXe+hWwRjs/He9ZP7FQ9P8uW5NDHsFW3nCxc/p6QTZTlXuzv+MeJDe5AueIW74a
 FJnkBv8IeXWXyIKD8jNBL2EFdS900aSCmG8b3QzvUlQXOx67TLpF3Nm+xg5uyMCaCX2e
 X8UW6rTKTypqQtR+x2ppRlb25uZHaoqmjyznF2hxqGh0conbiXtBsKnS209FASVwF4w5
 rZQQ==
X-Gm-Message-State: APjAAAVZZxjwgdDmWXtx4DpsaO6utAgpQeHPoxOyIfD9+dwATJp3+wg1
 gnihiXX4qtdMaMgIsxk2OIU/8Q==
X-Google-Smtp-Source: APXvYqz+J633fcXdBMYZwoxzR3wo7HbfzMMPymK979NzaZ2U6MB3HPM+JckPDdwUIGCUS4tLBkdSgQ==
X-Received: by 2002:a1c:8153:: with SMTP id c80mr33780098wmd.58.1575365617059; 
 Tue, 03 Dec 2019 01:33:37 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z13sm2382476wmi.18.2019.12.03.01.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 01:33:36 -0800 (PST)
Date: Tue, 3 Dec 2019 10:33:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Fix build on systems with STACKTRACE_SUPPORT=n
Message-ID: <20191203093334.GB624164@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191202133650.11964-1-linux@roeck-us.net>
 <CAMuHMdUz7gewcFPE=cnVENGdwVp6AZD7U4y1PtwXTAmoGmvGUg@mail.gmail.com>
 <837a221f0fc89b9ef6d3fbd2ceae479a5c98818a.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <837a221f0fc89b9ef6d3fbd2ceae479a5c98818a.camel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZaaTzB9B+KCHVUkdR37ZgN+trAYMPzah4PHL0bT6fiA=;
 b=iVydF1wQ/0vgHkuScgqf254M2NgW1SCwaXfH8upjUBcTDJ+xqoU2DJYQvUB3zHCbA4
 k8D4XT2StG+r/EPuGb7sb2JeoRzvniMPtuFUPZ16EInVXOmfmCC1xSuuWrkKSql6MU6/
 SS231G5wNpT9fEsjpgqWU4f4FxrkcCDYJvkkc=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDE6NDk6NDdQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAKPiBJJ2xs
IGdvIGFoZWFkIGFuZCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzIQoKZHJtLW1p
c2MtbmV4dC1maXhlcyBzaW5jZSBpdCdzIGluIHRoZSBtZXJnZSB3aW5kb3cuIGRybS1taXNjLW5l
eHQgaXMgZm9yCjUuNiBhbHJlYWR5LgotRGFuaWVsCgo+IAo+IE9uIE1vbiwgMjAxOS0xMi0wMiBh
dCAxNjoyMCArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gTW9uLCBEZWMg
MiwgMjAxOSBhdCAyOjQxIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3Jv
dGU6Cj4gPiA+IE9uIHN5c3RlbXMgd2l0aCBTVEFDS1RSQUNFX1NVUFBPUlQ9biwgd2UgZ2V0Ogo+
ID4gPiAKPiA+ID4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBm
b3IgU1RBQ0tUUkFDRQo+ID4gPiAgIERlcGVuZHMgb24gW25dOiBTVEFDS1RSQUNFX1NVUFBPUlQK
PiA+ID4gICBTZWxlY3RlZCBieSBbeV06Cj4gPiA+ICAgLSBTVEFDS0RFUE9UIFs9eV0KPiA+ID4g
Cj4gPiA+IGFuZCBidWlsZCBlcnJvcnMgc3VjaCBhczoKPiA+ID4gCj4gPiA+IG02OGstbGludXgt
bGQ6IGtlcm5lbC9zdGFja3RyYWNlLm86IGluIGZ1bmN0aW9uIGBzdGFja190cmFjZV9zYXZlJzoK
PiA+ID4gKC50ZXh0KzB4MTFjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2F2ZV9zdGFja190
cmFjZScKPiA+ID4gCj4gPiA+IEFkZCB0aGUgbWlzc2luZyBkZWVuZGVuY3kgb24gU1RBQ0tUUkFD
RV9TVVBQT1JULgo+ID4gPiAKPiA+ID4gRml4ZXM6IDEyYTI4MGM3Mjg2OCAoImRybS9kcF9tc3Q6
IEFkZCB0b3BvbG9neSByZWYgaGlzdG9yeSB0cmFja2luZyBmb3IKPiA+ID4gZGVidWdnaW5nIikK
PiA+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiA+IENjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0Pgo+ID4gCj4gPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+IAo+ID4gR3J7b2V0amUsZWV0aW5nfXMsCj4gPiAK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4gPiAKPiAtLSAKPiBDaGVlcnMsCj4g
CUx5dWRlIFBhdWwKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
