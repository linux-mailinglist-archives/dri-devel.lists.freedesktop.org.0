Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EF1C6509
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 02:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1F6E25B;
	Wed,  6 May 2020 00:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2276E25B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 00:25:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33B5B206B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588724734;
 bh=tORyrd16/TrBcFAcvt++PIww61jrCTRTKoyNEMmWqg8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QZrZbD5+TiJ84mh5Tfs9AExzUQvVWmKfqXCAr1AHKEFtyVpJMDwCunFSsQOuF/v0y
 7EYhS4vEkA90GUykWHL0IBdveWs5kpchdA4oFVRb8OCIJvA5c/KOFvYwkmMe8RpSU5
 R2XK52qLs7kJQlbrJVX0c6YmpGpSal/eLZdqMWxE=
Received: by mail-ej1-f51.google.com with SMTP id nv1so408305ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 17:25:34 -0700 (PDT)
X-Gm-Message-State: AGi0PubTmRoBh1jEPl4H4lnoZnKvwnctue3bdZbSjEHuat8SY5T4FByx
 j+7fxd4F5t+EzNCwg1llnKbI/dWriDHkaGi65Q==
X-Google-Smtp-Source: APiQypKp/oeTS/9+RxLaRA+6gt87+Uwim/SeYewoJTMOqc4ThsPCt9mPOYtbLOruUFSBdnzWiU9WTdpRVNurfELuWgE=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr5292368eje.324.1588724732602; 
 Tue, 05 May 2020 17:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
In-Reply-To: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 08:25:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
Message-ID: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Anand K. Mistry" <amistry@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFuYW5kLAoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NOaciDI55pelIOmAseS4iSDkuIrljYgxMjozN+Wvq+mBk++8mgo+Cj4gSGksIEFuYW5k
LAo+Cj4gQW5hbmQgSy4gTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ0
5pyIMjjml6Ug6YCx5LqMIOS4iuWNiDk6NTTlr6vpgZPvvJoKPiA+Cj4gPiBPbiBTdW4sIDI2IEFw
ciAyMDIwIGF0IDE4OjA0LCBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLCBBbmFuZDoKPiA+ID4KPiA+ID4gQW5hbmQgSyBNaXN0cnkg
PGFtaXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2I
MjowOeWvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gSWYgZG1hX21hcF9zZygpIG1lcmdlcyBwYWdl
cyB3aGVuIGNyZWF0aW5nIHRoZSBtYXBwaW5nLCBvbmx5IHRoZSBmaXJzdAo+ID4gPiA+IGVudHJp
ZXMgd2lsbCBoYXZlIGEgdmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBm
b2xsb3dlZCBieQo+ID4gPiA+IGVudHJpZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPiA+ID4g
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5j
b20+CgpBdXRob3Igc2hvdWxkIHNpZ24gb2ZmIHRoaXMgcGF0Y2gsIHBsZWFzZSBnaXZlIGEgc2ln
biBvZmYgdGFnIGJ5IGF1dGhvci4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4gPiA+IC0tLQo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDMgKysrCj4g
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gaW5kZXggYjA0YTNjMmIx
MTFlMDkuLmY4ZmQ4Yjk4YzMwZTNkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+ID4gPiBAQCAtMjI0LDYgKzIyNCw5IEBAIHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqbXRrX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFfYWRk
cmVzcyhzZy0+c2dsKTsKPiA+ID4gPiAgICAgICAgIGZvcl9lYWNoX3NnKHNnLT5zZ2wsIHMsIHNn
LT5uZW50cywgaSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNnX2RtYV9sZW4ocykp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+Cj4gPiA+IEkgdGhp
bmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+ID4KPiA+IHNjYXR0ZXJsaXN0LmggaGFzIHRo
ZSBjb21tZW50Ogo+ID4gLyoKPiA+ICAqIFRoZXNlIG1hY3JvcyBzaG91bGQgYmUgdXNlZCBhZnRl
ciBhIGRtYV9tYXBfc2cgY2FsbCBoYXMgYmVlbiBkb25lCj4gPiAgKiB0byBnZXQgYnVzIGFkZHJl
c3NlcyBvZiBlYWNoIG9mIHRoZSBTRyBlbnRyaWVzIGFuZCB0aGVpciBsZW5ndGhzLgo+ID4gICog
WW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0aGUgbnVtYmVyIG9mIHNnIGVudHJpZXMgZG1hX21h
cF9zZwo+ID4gICogcmV0dXJucywgb3IgYWx0ZXJuYXRpdmVseSBzdG9wIG9uIHRoZSBmaXJzdCBz
Z19kbWFfbGVuKHNnKSB3aGljaAo+ID4gICogaXMgMC4KPiA+ICAqLwo+ID4KPiA+IFNvIGJyZWFr
aW5nIG9uIHRoZSBmaXJzdCBzZ19kbWFfbGVuKHNnKSA9PSAwIGFwcGVhcnMgdG8gYmUgKG9uZSBv
ZikKPiA+IHRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgo+ID4KPgo+IE9rYXksIHlvdSdyZSByaWdo
dC4gU28KPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4KPgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4g
PiA+ICsKPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNzKHMpICE9IGV4
cGVjdGVkKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJzZ190
YWJsZSBpcyBub3QgY29udGlndW91cyIpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IC1FSU5WQUw7Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjI2LjEuMzAxLmc1NWJjM2ViN2Ni
OS1nb29nCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
