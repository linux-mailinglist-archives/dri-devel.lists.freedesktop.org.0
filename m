Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76266B271B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 23:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDDC6F46A;
	Fri, 13 Sep 2019 21:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1E86F46A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 21:16:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a11so23603513wrx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 14:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJhIFxH6vrpAUB+C/AyT6D1yMvNlweQDODYmOOY6pEw=;
 b=WArtZMtAjY8+oLncwbz3uGT26X59/03fb5FZ6lqsczWtH/Vj3gSvEUITubziCONTbv
 SIz2vQgExq4Bq/66mSeIpVdgI+oMmTi7sFluBAIehWOfYrFAKJ98IqwEB8KKP2AfNWnt
 PRqKhM1+tR7etHt6OhwOp8M27JaNHZRX5O/wSotqDi8IMeRRs4VQExmbQBwE2fOp81JZ
 HgafG+ZKx4Slag3N4KOn07UoXLw0RPUp2We8QedhafGkoZggR6rkPUirqB0p3sOnmXlu
 LQJYF0QyLfGRlum2n1SpO7HEBidzJN4sli0oa3ts9Tv3lh6fbztC0G5VEt7fHghcp4dy
 NEww==
X-Gm-Message-State: APjAAAWggpluDjq6MSynWukwkqFy/N6rbkCnXsg/mUZbzJQiuhRZjGY3
 LWFulTHj33EsDFefl+86sdPhr5fVhzoQCn7a3+7SNg==
X-Google-Smtp-Source: APXvYqyNx1WaqtIEvH84GEzWZOMCWQkQcW/qRPqnwOXsPpUp/b/p9VxWb+XXAd9JoBd5xkiwcS0cTMahfrcQ+xgu0M8=
X-Received: by 2002:a5d:6951:: with SMTP id r17mr11403852wrw.208.1568409363968; 
 Fri, 13 Sep 2019 14:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
 <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
 <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
 <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
 <16c9066b-091f-6d0e-23f1-2c1f83a7da1b@samsung.com>
 <00e4f553-a02c-6d98-a0e8-28c0183a3c8c@thinci.com>
 <084ab580-8ba8-b018-bc7a-bd705027f200@samsung.com>
In-Reply-To: <084ab580-8ba8-b018-bc7a-bd705027f200@samsung.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 13 Sep 2019 14:15:51 -0700
Message-ID: <CALAqxLWv1nepCF_jDE7xZetXxhYnCJnvqEL8oAC+YWwMOR7geQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oJhIFxH6vrpAUB+C/AyT6D1yMvNlweQDODYmOOY6pEw=;
 b=hGUOWQFqBs9ujiqzLhSWn8FmbFzPkwrF4FpGKvEPNfK7BmWSs8oBqsIAWyoXi377WP
 NzbgDjxD3S0uXahrPXCisc86BOZkqlYJBaH2Fov9m0+r52PqsbNJLSjQhC2kWNBT8E4k
 wl43nUXVJzQ2ciDK7FioGXLyhzkqfXQGx6ZbZ1L7pym5rJQPBalIdH1ZMgOjbQkqYsw1
 5vNhHN+z7Wy6Jrbi9FhGiXA/ZiC9IKMMMBrc3VmFY+uVsa75N9Lbrbtz2CRgMGF/Wiq4
 AtgSMOzcHWMURO4orCaTtWUh64nJCAUd73mhEl7lorA+gwTvIsHhohNIPPQSzTYULxcM
 lNXg==
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTo0NyBBTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPiBPbiAxMi4wOS4yMDE5IDE2OjE4LCBNYXR0IFJlZGZlYXJuIHdy
b3RlOgo+ID4gT24gMTIvMDkvMjAxOSAxNDoyMSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiA+PiBP
biAxMi4wOS4yMDE5IDA0OjM4LCBKb2huIFN0dWx0eiB3cm90ZToKPiA+Pj4gU2hvdWxkIEkgcmVz
dWJtaXQgdGhlIGtpcmluIGZpeCBmb3IgdGhlIGFkdjc1MTEgcmVncmVzc2lvbiBoZXJlPwo+ID4+
PiBPciBkbyB3ZSByZXZlcnQgdGhlIGFkdjc1MTEgcGF0Y2g/IEkgYmVsaWV2ZSBkYjQxMGMgc3Rp
bGwgbmVlZHMgYSBmaXguCj4gPj4+Cj4gPj4+IEknZCBqdXN0IGxpa2UgdG8ga2VlcCB0aGUgSGlL
ZXkgYm9hcmQgZnJvbSBicmVha2luZywgc28gbGV0IG1lIGtub3cgc28KPiA+Pj4gSSBjYW4gZ2V0
IHRoZSBmaXggc3VibWl0dGVkIGlmIG5lZWRlZC4KPiA+Pgo+ID4+IFNpbmNlIHRoZXJlIGlzIG5v
IHJlc3BvbnNlIGZyb20gTWF0dCwgd2UgY2FuIHBlcmZvcm0gcmV2ZXJ0LCBzaW5jZSB0aGVyZQo+
ID4+IGFyZSBubyBvdGhlciBpZGVhcy4gSSB3aWxsIGFwcGx5IGl0IHRvbW9ycm93LCBpZiB0aGVy
ZSBhcmUgbm8gb2JqZWN0aW9ucy4KPiA+IEhpLAo+ID4KPiA+IFNvcnJ5IC0geWVhaCBJIHRoaW5r
IHJldmVydGluZyBpcyBwcm9iYWJseSBiZXN0IGF0IHRoaXMgcG9pbnQgdG8gYXZvaWQKPiA+IGJy
ZWFraW5nIGluLXRyZWUgcGxhdGZvcm1zLgo+ID4gSXQncyBhIHNoYW1lIHRob3VnaCB0aGF0IHRo
ZXJlIGlzIGEgYnVpbHQtaW4gaW5jb21wYXRpYmlsaXR5IHdpdGhpbiB0aGUKPiA+IHRyZWUgYmV0
d2VlbiBkcml2ZXJzLgo+Cj4KPiBRdWl0ZSBjb21tb24gaW4gZGV2ZWxvcG1lbnQgLSBzb21lIGlz
c3VlcyBiZWNvbWVzIHZpc2libGUgYWZ0ZXIgc29tZSB0aW1lLgo+Cj4gPiBUaGUgd2F5IHRoYXQg
dGhlIGdlbmVyaWMgU3lub3BzeXMgRFNJIGhvc3QgZHJpdmVyCj4gPiBwcm9iZXMgaXMgY3VycmVu
dGx5IGluY29tcGF0aWJsZSB3aXRoIHRoZSBBRFY3NTMzIChoZW5jZSB0aGUgcGF0Y2gpLAo+ID4g
b3RoZXIgRFNJIGhvc3QgZHJpdmVycyBhcmUgbm93IGNvbXBhdGlibGUgd2l0aCB0aGUgQURWNzUz
MyBidXQgYnJlYWsKPiA+IHdoZW4gd2UgY2hhbmdlIGl0IHRvIHByb2JlIGluIGEgc2ltaWxhciB3
YXkgdG8gcGFuZWwgZHJpdmVycy4KPgo+Cj4gMS4gVGhlIGJlaGF2aW9yIHNob3VsZCBiZSBjb25z
aXN0ZW50IGJldHdlZW4gYWxsIGhvc3RzL2RldmljZSBkcml2ZXJzLgo+CgpZZWEsIEkgd29ycnkg
YWJvdXQgdGhpcyBhcyB3ZWxsLCBhcyBJIGtub3cgdGhlcmUgaXMgYWxzbyB0aGUgbHQ5NjExCmJy
aWRnZSBjaGlwIGRyaXZlciBwZW5kaW5nIGZvciB0aGUgZGI4NDVjIHdoaWNoIHdvcmtzIGFnYWlu
c3QgdGhlCmN1cnJlbnQgbXNtIGRzaSBjb2RlLiBTbyBjaGFuZ2luZyB0aGUgbXNtIGRyaXZlciBm
b3IgdGhlIGFkdjc1MzMgbWF5CmJyZWFrIG90aGVyIGRyaXZlcnMgKGluIHRoZSBjYXNlIG9mIGx0
OTYxMSwgb3V0IG9mIHRyZWUgLSBzbyB3b3VsZG4ndApiZSBhIHJlZ3Jlc3Npb24sIGJ1dCB0aGVy
ZSBtYXkgYmUgb3RoZXJzKSB3cml0dGVuIGFnYWluc3QgdGhlIGN1cnJlbnQKZXhwZWN0YXRpb25z
LgoKCj4gMi4gRFNJIGNvbnRyb2xsZWQgZGV2aWNlcyBjYW4gZXhwb3NlIGRybSBvYmplY3RzIChk
cm1fYnJpZGdlL2RybV9wYW5lbCkKPiBvbmx5IHdoZW4gdGhleSBjYW4gcHJvYmUsIGllIERTSSBi
dXMgdGhleSBzaXQgb24gbXVzdCBiZSBjcmVhdGVkIDFzdC4KPgo+IDEgYW5kIDIgZW5mb3JjZXMg
cG9saWN5IHRoYXQgYWxsIGhvc3QgZHJpdmVycyBzaG91bGQgMXN0IGNyZWF0ZSBjb250cm9sCj4g
YnVzIChEU0kgaW4gdGhpcyBjYXNlKSB0aGVuIGxvb2sgZm9yIGhpZ2hlciBsZXZlbCBvYmplY3Rz
Cj4gKGRybV9icmlkZ2UvZHJtX3BhbmVsKS4KPgo+IEFzIGEgY29uc2VxdWVuY2UgYWxsIGJyaWRn
ZXMgYW5kIHBhbmVscyBzaG91bGQgMXN0IGdhdGhlciB0aGUgcmVzb3VyY2VzCj4gdGhleSBkZXBl
bmRzIG9uLCBhbmQgdGhlbiB0aGV5IGNhbiBleHBvc2UgaGlnaGVyIGxldmVsIG9iamVjdHMuCj4K
Pgo+ID4KPiA+PiBBbmQgZm9yIHRoZSBmdXR1cmU6IEkgZ3Vlc3MgaXQgaXMgbm90IHBvc3NpYmxl
IHRvIG1ha2UgYWR2IHdvcmsgd2l0aCBvbGQKPiA+PiBhbmQgbmV3IGFwcHJvYWNoLCBidXQgc2lt
cGxlIHdvcmthcm91bmQgZm9yIGFkdiBjb3VsZCBiZSBhZGRlZCBsYXRlcjoKPiA+Pgo+ID4+IGlm
IChzb3VyY2UgaXMgbXNtIG9yIGtpcmluKQo+ID4+Cj4gPj4gICAgICBkb190aGVfb2xkX3dheQo+
ID4+Cj4gPj4gZWxzZQo+ID4+Cj4gPj4gICAgICBkb19jb3JyZWN0bHkuCj4gPiBNYXliZSB0aGlz
IHdvdWxkIHdvcmssIGJ1dCBob3cgZG8gd2Uga25vdyB0aGF0IHRoZSBsaXN0ICJtc20gb3Iga2ly
aW4iCj4gPiBpcyBleGhhdXN0aXZlIHRvIGNvcGUgd2l0aCBhbGwgcGxhdGZvcm1zPwo+Cj4KPiBC
eSBjaGVja2luZyBkdHMvY29uZmlnIGZpbGVzLgo+CgpBIHRlbXBvcmFyeSBjbGVhcmx5LW1hcmtl
ZC1kZXByZWNhdGVkIGNvbmZpZyBvcHRpb24gbWlnaHQgYWxzbyBhCnJlYXNvbmFibGUgYXBwcm9h
Y2ggd2hpbGUgd2UgdHJhbnNpdGlvbiBkcml2ZXJzIG92ZXI/Cgo+ID4gSXQgc2VlbXMgdG8gbWUg
dGhlIGJ1aWx0IGluCj4gPiBpbmNvbXBhdGliaWxpdHkgYmV0d2VlbiBEU0kgaG9zdHMgbmVlZHMg
dG8gYmUgcmVzb2x2ZWQgcmVhbGx5IHJhdGhlcgo+ID4gdGhhbiB0cnlpbmcgdG8gd29yayBhcm91
bmQgaXQgaW4gdGhlIEFEVjc1MzMgZHJpdmVyIChhbmQgYW55IG90aGVyIERTSQo+ID4gYnVzIGRl
dmljZSB0aGF0IGZhbGxzIGludG8gdGhpcyB0cmFwKS4KPgo+Cj4gSWYgeW91IGtub3cgaG93LCBw
bGVhc2UgZGVzY3JpYmUuIEF0bSB0aGUgb25seSByZWFsIHNvbHV0aW9uIEkgc2VlIGlzCj4gZXhw
bGljaXQgd29ya2Fyb3VuZCB0byBhbGxvdyBuZXcgYWR2NzUxMSwgdGhlbiBmaXhpbmcgY29udHJv
bGxlcnMsCj4gdG9nZXRoZXIgd2l0aCB3b3JrYXJvdW5kLXJlbW92YWwuCj4KPiBPSywgaXQgY291
bGQgYmUgcG9zc2libGUgdG8gY2hhbmdlIG1zbSwga2lyaW4gYW5kIGFkdiBpbiBvbmUgcGF0Y2gs
Cj4gaG93ZXZlciBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgaXMgdGhlIGJlc3Qgc29sdXRpb24uCgpN
YXR0OiBJJ20gaGFwcHkgdG8gaGVscCB5b3UgdGVzdCBhbmQgdmFsaWRhdGUgdGhpbmdzLiBMZXQg
bWUga25vdyBob3cKSSBjYW4gaGVscCEKCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
