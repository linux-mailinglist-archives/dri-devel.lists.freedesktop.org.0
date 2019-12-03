Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D951102BB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754B26E85C;
	Tue,  3 Dec 2019 16:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562526EA11
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:43:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b11so3630856wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ypQTwA0L6LPLLvxpgxN083V3FK7vaDKzP5Y3YK8dqA4=;
 b=E/rF9INFCs1zE5mcNt6PnxyA6FqzAIzuaSHWNPxU/R+Kb2a/4EgriY/3oV0cfo954R
 ewemnxtR6T6dA8Bxe4XBMI8YJhw3E94e5dGg4Noz+23x0/tC0gefslrbJ4WqcHMEQNuz
 nqYIF/jovPXATGTW5gXb5e6RzBaUXw/UYagdbx5A9WXZ/h4quaZovKcYJj+zXdzMc04Y
 0BdyxDeVO/XNlC/Plr4EsaXk2ONZQd5JRvsPuiGzLgKj4kgalmCa+fb41q8edo+0YWIA
 y5a70hpj7ijc40PB15ffwqrtMI6CAR0xRJhL5zkC0ZJB7Bm133ZpMdeyU+Df+3tWUHKn
 jq3w==
X-Gm-Message-State: APjAAAXGUcSM9S3gu39iaWAIQJJsZ2m+g5R6yAkvd6W2hhOaXnL9Mdd6
 AkYA/pbPbRhzCG7hpOvKlOjCVhV58rg=
X-Google-Smtp-Source: APXvYqyculTL+PvRcAtcjH6vdALQLGsc+9LqZfLDVX9lSknzq+eYAAORAlHVywyaHpwqeKE3LPd6ng==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr14171767wma.160.1575391434705; 
 Tue, 03 Dec 2019 08:43:54 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o4sm4235097wrw.97.2019.12.03.08.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:43:54 -0800 (PST)
Date: Tue, 3 Dec 2019 17:43:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] consistently use dma_resv locking wrappers
Message-ID: <20191203164352.GD624164@phenom.ffwll.local>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ypQTwA0L6LPLLvxpgxN083V3FK7vaDKzP5Y3YK8dqA4=;
 b=ckewl/jEZkcV0m4SukeA6KcywMGYHKf/nI3o8a7nytMzQ0zyTwhBXKcpQC+I5FMDu0
 T6VYLN8fNdCVZtrwxHoMbZHl6dg0umJwAlJL1lbHV2dkTUssZWZOAI8dc9YXOWvV47T5
 7qi2f4JJWuomi7s8Tf1tn0yw42LBka00b8790=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTA6NDM6NTJBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBhbGwsCj4gCj4gVGhpcyBpcyBwcmVwIHdvcmsgZm9yIHNvbWUgZG1hX3Jlc3Yg
c2VyaWVzIEknbSB0aW5rZXJpbmcgd2l0aCwgYnV0IEkKPiBmaWd1cmVkIGdvb2QgdG8gc3BsaXQg
dGhpcyBvdXQgc2luY2UgZ29vZCBpZGVhIHRvIGxhbmQgdGhpcyBubyBtYXR0ZXIgd2hhdAo+IGV4
YWN0bHkgSSdsbCBlbmQgdXAgY3JlYXRpbmcgaW4gZG1hX3Jlc3YuIFdpdGggdGhlc2UgZXZlcnl0
aGluZyBpbgo+IGRyaXZlcnMvZ3B1IG5pY2VseSBnb2VzIHRocm91Z2ggZWl0aGVyIHRoZSBkbWFf
cmVzdiBvciBkcm1fbW9kZXNldF9sb2NrCj4gd3JhcHBlcnMsIGFuZCBkb2Vzbid0IGNhbGwgd3df
bXV0ZXggZGlyZWN0bHkuCj4gCj4gUmV2aWV3LCBjb21tZW50cywgYWNrcyBhbGwgdmVyeSBtdWNo
IHdlbGNvbWUsIGFzIHVzdWFsLgo+IAo+IENoZWVycywgRGFuaWVsCj4gCj4gRGFuaWVsIFZldHRl
ciAoNCk6Cj4gICBkcm0vZXRuYXZpdjogVXNlIGRtYV9yZXN2IGxvY2tpbmcgd3JhcHBlcnMKPiAg
IGRybS9pOTE1OiBVc2UgZG1hX3Jlc3YgbG9ja2luZyB3cmFwcGVycwo+ICAgZHJtL21zbTogVXNl
IGRtYV9yZXN2IGxvY2tpbmcgd3JhcHBlcnMKPiAgIGRybS92YzQ6IFVzZSBkbWFfcmVzdiBsb2Nr
aW5nIHdyYXBwZXJzCgpQaW5nIGZvciBzb21lIHJldmlldy9hY2tzIG9uIHRoaXMgc2VyaWVzIC4u
LgotRGFuaWVsCgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJt
aXQuYyAgIHwgIDggKysrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2V4ZWNidWZmZXIuYyB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1f
c3VibWl0LmMgICAgICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9nZW0uYyAgICAgICAgICAgICAgICAgIHwgMTEgKysrKystLS0tLS0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjI0
LjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
