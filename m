Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5FE2FD729
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493E6E0CD;
	Wed, 20 Jan 2021 17:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29106E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:38:15 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id e70so8702430ote.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MNhh3DZneZFVWfjxYIARFu1yzUnEDm7HphLodqo3DQk=;
 b=b3rRh/jJExyI8+DPE2UALXm6/mFfCwwF0E489at7YF/FdDDs0G59cic92B9HOqPYkn
 i6Ke9a/H8crN4utU/49/HEC+QiHzShWj0IbERe//iYPc/9zNyUUpHrEorXkfeSdsJ1j+
 ioxRKAxIg8/yTdUpMKiCa5gZBnHCO8HcDx4+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MNhh3DZneZFVWfjxYIARFu1yzUnEDm7HphLodqo3DQk=;
 b=npMKvBo1ZtZQnQcve2IviAwo6LlnEC2RHXnxdKE6gfm6APVnZLVlwGIFKGq6sM+kSG
 naG4t6CPceNKfLa0ZJlOjCZWjGlIouAfzXg9KmWali9Yh2GzEdpH+sWLm11veihY1Oia
 /YkdTiyqOvF9o6tngVhqfjdpwdObEsqF9wzKCdWQ9eqIYtjMQMhmg5jVUPZ/kcJVlXBs
 i8lvgMm0IoYrJNokFd6to+4DT68gI6m5D11tvMXU9jJ2/M+7dRBXHNEH505M5Sqs75Ii
 0yt2o7VgCQVJvE+i/J51sSi+d8weFd6dfRFcS8ilOa6Tfxu0Qo1iR6zVnbIS1PxPwwD7
 p4Dg==
X-Gm-Message-State: AOAM532ZkcAyWzOo+1Rhu3iig6S6BIQb4sw42gbHOiKR8kZMVb7GlfZs
 XEuYx8/BIY3BKG5QIMD0RZwnA6wWEoV8wkM6mXjvWQ==
X-Google-Smtp-Source: ABdhPJxv43HxmTetCKsV75E7UstyzxmA3kKBQo3KsMDk26idvuSiiEtoQRKDJaZO3thYnbrqW0w9yXakr98YoMiThxM=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr7621513otb.303.1611164294761; 
 Wed, 20 Jan 2021 09:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-2-paul@crapouillou.net>
 <CAKMK7uGGDe8bZpeTnyCkF7g_2gC1nixOzWe4FWYXPRWi-q5y7A@mail.gmail.com>
 <4YQ8NQ.HNQ7IMBKVEBV2@crapouillou.net>
In-Reply-To: <4YQ8NQ.HNQ7IMBKVEBV2@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 18:38:03 +0100
Message-ID: <CAKMK7uFHYPvJm46f-LXBO=nERGBBO3i_=YXZyAUi0ZXJFLmXVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: bridge/panel: Cleanup connector on bridge
 detach
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjAsIDIwMjEgYXQgNjoxMiBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBv
dWlsbG91Lm5ldD4gd3JvdGU6Cj4KPgo+Cj4gTGUgbWVyLiAyMCBqYW52LiAyMDIxIMOgIDE3OjAz
LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IGEKPiDDqWNyaXQgOgo+ID4gT24gV2Vk
LCBKYW4gMjAsIDIwMjEgYXQgMTozNSBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91
Lm5ldD4KPiA+IHdyb3RlOgo+ID4+Cj4gPj4gIElmIHdlIGRvbid0IGNhbGwgZHJtX2Nvbm5lY3Rv
cl9jbGVhbnVwKCkgbWFudWFsbHkgaW4KPiA+PiAgcGFuZWxfYnJpZGdlX2RldGFjaCgpLCB0aGUg
Y29ubmVjdG9yIHdpbGwgYmUgY2xlYW5lZCB1cCB3aXRoIHRoZQo+ID4+IG90aGVyCj4gPj4gIERS
TSBvYmplY3RzIGluIHRoZSBjYWxsIHRvIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkuIEhvd2V2
ZXIsCj4gPj4gc2luY2Ugb3VyCj4gPj4gIGRybV9jb25uZWN0b3IgaXMgZGV2bS1hbGxvY2F0ZWQs
IGJ5IHRoZSB0aW1lCj4gPj4gZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKQo+ID4+ICB3aWxsIGJl
IGNhbGxlZCwgb3VyIGNvbm5lY3RvciB3aWxsIGJlIGxvbmcgZ29uZS4gVGhlcmVmb3JlLCB0aGUK
PiA+PiAgY29ubmVjdG9yIG11c3QgYmUgY2xlYW5lZCB1cCB3aGVuIHRoZSBicmlkZ2UgaXMgZGV0
YWNoZWQgdG8gYXZvaWQKPiA+PiAgdXNlLWFmdGVyLWZyZWUgY29uZGl0aW9ucy4KPiA+Cj4gPiBG
b3IgLWZpeGVzIHRoaXMgc291bmRzIG9rLCBidXQgZm9yIC1uZXh0IEkgdGhpbmsgc3dpdGNoaW5n
IHRvIGRybW1fCj4gPiB3b3VsZCBiZSBtdWNoIGJldHRlci4KPgo+IFRoZSBBUEkgd291bGQgbmVl
ZCB0byBjaGFuZ2UgdG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIGRybV9kZXZpY2Ugc3RydWN0LAo+IHRo
b3VnaC4gVGhhdCB3b3VsZCBiZSBxdWl0ZSBhIGJpZyBwYXRjaCwgdGhlcmUgYXJlIGEgZmV3IGRv
emVucyBzb3VyY2UKPiBmaWxlcyB0aGF0IHVzZSB0aGlzIEFQSSBhbHJlYWR5LgoKSG0gcmlnaHQg
cHVyZSBkcm1tXyBkb2Vzbid0IHdvcmsgZm9yIHBhbmVsIG9yIGJyaWRnZSBzaW5jZSBpdCdzCnVz
dWFsbHkgYSBzZXBhcmF0ZSBkcml2ZXIuIEJ1dCBkZXZtXyBhbHNvIGRvZXNuJ3Qgd29yay4gSSB0
aGluayB3aGF0CndlIG5lZWQgaGVyZSBpcyB0d28tc3RhZ2U6IGZpcnN0IGttYWxsb2MgdGhlIHBh
bmVsIChvciBicmlkZ2UsIGl0J3MKcmVhbGx5IHRoZSBzYW1lKSBpbiB0aGUgcGFuZWwvYnJpZGdl
IGRyaXZlciBsb2FkLiBUaGVuIHdoZW4gd2UgYmluZCBpdAp0byB0aGUgZHJtX2RldmljZSB3ZSBj
YW4gdGllIGl0IGludG8gdGhlIG1hbmFnZWQgcmVzb3VyY2VzIHdpdGgKZHJtbV9hZGRfYWN0aW9u
X29yX3Jlc2V0LiBQYXNzaW5nIHRoZSBkcm1fZGV2aWNlIHRvIHRoZSBwb2ludCB3aGVyZSB3ZQph
bGxvY2F0ZSB0aGUgcGFuZWwvYnJpZGdlIGRvZXNuJ3Qgd29yayBmb3IgdGhlc2UuCgpJIHRoaW5r
IG1pbmltYWxseSB3ZSBuZWVkIGEgRklYTUUgaGVyZSBhbmQgYWNrIGZyb20gTGF1cmVudCBvbiBo
b3cKdGhpcyBzaG91bGQgYmUgc29sdmVkIGF0IGxlYXN0LCBzaW5jZSBwYW5lbCBicmlkZ2UgaXMg
dXNlZCByYXRoZXIKd2lkZWx5LgotRGFuaWVsCgo+Cj4gQ2hlZXJzLAo+IC1QYXVsCj4KPiA+Cj4g
Pj4gIHYyOiBDbGVhbnVwIGNvbm5lY3RvciBvbmx5IGlmIGl0IHdhcyBjcmVhdGVkCj4gPj4KPiA+
PiAgRml4ZXM6IDEzZGZjMDU0MGE1NyAoImRybS9icmlkZ2U6IFJlZmFjdG9yIG91dCB0aGUgcGFu
ZWwgd3JhcHBlcgo+ID4+IGZyb20gdGhlIGx2ZHMtZW5jb2RlciBicmlkZ2UuIikKPiA+PiAgQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDQuMTIrCj4gPj4gIENjOiBBbmRyemVqIEhhamRh
IDxhLmhhamRhQHNhbXN1bmcuY29tPgo+ID4+ICBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPgo+ID4+ICBDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4+ICBDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPgo+ID4+ICBDYzogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0
Pgo+ID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4KPiA+PiAgLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgfCA2ICsr
KysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gIGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiA+PiBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+ID4+ICBpbmRleCAwZGRjMzc1NTExOTQuLmRmODZiMGVl
MDU0OSAxMDA2NDQKPiA+PiAgLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCj4g
Pj4gICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+ID4+ICBAQCAtODcsNiAr
ODcsMTIgQEAgc3RhdGljIGludCBwYW5lbF9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdl
Cj4gPj4gKmJyaWRnZSwKPiA+Pgo+ID4+ICAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX2RldGFj
aChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4+ICAgewo+ID4+ICArICAgICAgIHN0cnVj
dCBwYW5lbF9icmlkZ2UgKnBhbmVsX2JyaWRnZSA9Cj4gPj4gZHJtX2JyaWRnZV90b19wYW5lbF9i
cmlkZ2UoYnJpZGdlKTsKPiA+PiAgKyAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yID0gJnBhbmVsX2JyaWRnZS0+Y29ubmVjdG9yOwo+ID4+ICArCj4gPj4gICsgICAgICAgLyog
Q2xlYW51cCB0aGUgY29ubmVjdG9yIGlmIHdlIGtub3cgaXQgd2FzIGluaXRpYWxpemVkICovCj4g
Pj4gICsgICAgICAgaWYgKCEhcGFuZWxfYnJpZGdlLT5jb25uZWN0b3IuZGV2KQo+ID4+ICArICAg
ICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKGNvbm5lY3Rvcik7Cj4gPj4gICB9Cj4g
Pj4KPiA+PiAgIHN0YXRpYyB2b2lkIHBhbmVsX2JyaWRnZV9wcmVfZW5hYmxlKHN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2UpCj4gPj4gIC0tCj4gPj4gIDIuMjkuMgo+ID4+Cj4gPgo+ID4KPiA+IC0t
Cj4gPiBEYW5pZWwgVmV0dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4KPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
