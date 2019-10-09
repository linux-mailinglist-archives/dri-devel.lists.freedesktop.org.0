Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66971D11F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051076E9D0;
	Wed,  9 Oct 2019 15:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6B46E9D0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 15:02:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a15so2334038edt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=yyvcYwcZMjLvzOg82pdsNDaaC7kmo5LxgAiQA0bNidE=;
 b=K/nmcNi56TfiZXJQL/8npsPkIrcdelFlEG2qrdx/BnaKD2TZnQtmkki1kG7lrvB5Go
 Djf9Lqp3xWaQmKmk+128EYyYmpLsM3i6QvUvd2skQ+K+f0dDZBoLn6UTYrUwMf3CV7Lk
 MW3ZtjIpNrZlzB3BPzrhilTKYB4z2urYYGFYpfW/KM4tdxAi/zdtdKPcqUdwe8ByadxC
 hP+rmi9jLaXaJwWUFONggikFo0EqpSN7mr+sb3UyFVxjvQ44YY1zPc/gZNjfaTN3ypDM
 tyr8lLUpG51qHg/LdXZaYcEKw+dCE9uFxpBWNVzJuRiRPM9BVoRbVU9JjOqBbD8gjmsz
 mv2g==
X-Gm-Message-State: APjAAAUiM1OVrt5oQnPU8ssRe3du77kZfMzySmugrUHv6uCv8UHrPfQ6
 qyK7LYyMkiKm7JkDTqfNq/7QCw==
X-Google-Smtp-Source: APXvYqzkvG0y4CciW6y1869o9q6BjLYLBuhrjR2c8HeHPYa3utK2/23Gs+BF00yuGt+GrnN38hw7bQ==
X-Received: by 2002:a05:6402:3c5:: with SMTP id
 t5mr3299252edw.125.1570633320982; 
 Wed, 09 Oct 2019 08:02:00 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id fx25sm279855ejb.19.2019.10.09.08.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 08:01:59 -0700 (PDT)
Date: Wed, 9 Oct 2019 17:01:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 5/6] drm/amdgpu/dm/mst: Report possible_crtcs
 incorrectly, for now
Message-ID: <20191009150155.GD16989@phenom.ffwll.local>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Francis <David.Francis@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-6-lyude@redhat.com>
 <20190927152741.GU218215@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927152741.GU218215@art_vandelay>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=yyvcYwcZMjLvzOg82pdsNDaaC7kmo5LxgAiQA0bNidE=;
 b=gYe64hQiSH9s0AJCdM7d1Bpyt8JKFCNdMMrjjOcAJi8DHx8XJgIrh57L+Ua+aOEDF3
 tDEDdsqQtlX72bjr6UtMaozSyJBPTTbaEmX2NDhel45HJY+/8NLQeeGyBEW28ALnz25W
 IzDdms1jqdIXYegTRSGBxksi1VQ7WtffxRg+8=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6Mjc6NDFBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDA2OjUxOjA3UE0gLTA0MDAsIEx5dWRlIFBhdWwg
d3JvdGU6Cj4gPiBUaGlzIGNvbW1pdCBpcyBzZXBlcmF0ZSBmcm9tIHRoZSBwcmV2aW91cyBvbmUg
dG8gbWFrZSBpdCBlYXNpZXIgdG8KPiA+IHJldmVydCBpbiB0aGUgZnV0dXJlLiBCYXNpY2FsbHks
IHRoZXJlJ3MgbXVsdGlwbGUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucwo+ID4gdGhhdCBpbnRlcnBy
ZXQgcG9zc2libGVfY3J0Y3MgdmVyeSB3cm9uZzoKPiA+IAo+ID4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzcKPiA+IGh0dHBzOi8v
Z2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvaXNzdWVzLzc1OQo+ID4gCj4gPiBXaGlsZSB3
b3JrIGlzIG9uZ29pbmcgdG8gZml4IHRoZXNlIGlzc3VlcyBpbiB1c2Vyc3BhY2UsIHdlIG5lZWQg
dG8KPiA+IHJlcG9ydCAtPnBvc3NpYmxlX2NydGNzIGluY29ycmVjdGx5IGZvciBub3cgaW4gb3Jk
ZXIgdG8gYXZvaWQKPiA+IGludHJvZHVjaW5nIGEgcmVncmVzc2lvbiBpbiBpbiB1c2Vyc3BhY2Uu
IE9uY2UgdGhlc2UgaXNzdWVzIGdldCBmaXhlZCwKPiA+IHRoaXMgY29tbWl0IHNob3VsZCBiZSBy
ZXZlcnRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDExICsrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCj4gPiBpbmRleCBiNDA0ZjFhZTZkZjcuLmZlOGFjODAxZDdhNSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKPiA+IEBAIC00ODA3LDYgKzQ4MDcsMTcgQEAgc3RhdGljIGludCBhbWRncHVf
ZG1fY3J0Y19pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPiA+ICAJaWYg
KCFhY3J0Yy0+bXN0X2VuY29kZXIpCj4gPiAgCQlnb3RvIGZhaWw7Cj4gPiAgCj4gPiArCS8qCj4g
PiArCSAqIEZJWE1FOiBUaGlzIGlzIGEgaGFjayB0byB3b3JrYXJvdW5kIHRoZSBmb2xsb3dpbmcg
aXNzdWVzOgo+ID4gKwkgKgo+ID4gKwkgKiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUv
bXV0dGVyL2lzc3Vlcy83NTkKPiA+ICsJICogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzcKPiA+ICsJICoKPiA+ICsJICogT25lIHRo
ZXNlIGlzc3VlcyBhcmUgY2xvc2VkLCB0aGlzIHNob3VsZCBiZSByZW1vdmVkCj4gCj4gRXZlbiB3
aGVuIHRoZXNlIGlzc3VlcyBhcmUgY2xvc2VkLCB3ZSdsbCBzdGlsbCBiZSBpbnRyb2R1Y2luZyBh
IHJlZ3Jlc3Npb24gaWYgd2UKPiByZXZlcnQgdGhpcyBjaGFuZ2UuIFRpbWUgZm9yIGFjdHVhbGx5
X3Bvc3NpYmxlX2NydGNzPyA6KQo+IAo+IFlvdSBhbHNvIG1pZ2h0IHdhbnQgdG8gYnJpZWZseSBl
eHBsYWluIHRoZSB1L3MgYnVnIGluIGNhc2UgdGhlIGxpbmtzIGdvIHNvdXIuCj4gCj4gPiArCSAq
Lwo+ID4gKwlhY3J0Yy0+bXN0X2VuY29kZXItPmJhc2UucG9zc2libGVfY3J0Y3MgPQo+ID4gKwkJ
YW1kZ3B1X2RtX2dldF9lbmNvZGVyX2NydGNfbWFzayhkbS0+YWRldik7Cj4gCj4gV2h5IGRvbid0
IHdlIHB1dCB0aGlzIGhhY2sgaW4gYW1kZ3B1X2RtX2RwX2NyZWF0ZV9mYWtlX21zdF9lbmNvZGVy
KCk/CgpJZiB3ZSBkb24ndCBoYXZlIHRoZSBzYW1lIGhhY2sgZm9yIGk5MTUgbXN0IEkgdGhpbmsg
d2Ugc2hvdWxkbid0IG1lcmdlCnRoaXMgLi4uIGJyb2tlbiB1c2Vyc3BhY2UgaXMgYnJva2VuLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
