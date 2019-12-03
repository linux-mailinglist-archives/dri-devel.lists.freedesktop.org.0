Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731CC110667
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 22:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AF76F409;
	Tue,  3 Dec 2019 21:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56776E09E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 21:20:26 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 59so4291921otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 13:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ut3M6g1Hl116dncuKVz3l+JYWUbNUeJt2TTVnZ9Vnc4=;
 b=ApT73VK1jb9OPRhNGOt86BKBnI/n4oVWh8jBv20usYD6CyQFF1zAv+LZ+SWgUPv7k3
 s+hVZvQcYoI1KgzOQWmGiUAK8bwtCBsx9QMUOootP93VJRF7wlCT28Tc6FC2kR5h7+Ir
 Vk+rUdJGzyYx76m6D6n778TcAigdhnxNL7sYl8pzjb43c6rkh01+CFqVsc/Tw76WpFgr
 /zF52Hpg8GNIl02Jn8t1RFnWJhm+KNsJDIIYOPNJQbghJi5Pi7bGZ76quwvz4k+j2HTb
 664eQD2XQR9mqqzsm4eKdtn3FvZmei8ZpAy8u0oyZYIpZVS9i7QUKz/hmJnZtuFZ9Zfy
 mZ1w==
X-Gm-Message-State: APjAAAU6asBqeihHPJVTz/ZQBYEzOxkqQHbSRarniumiQmkSQyRyVFoq
 lRyfRSWY5y1tlH67VlhT3qsYVqobkbFdGkx9gPaI1g==
X-Google-Smtp-Source: APXvYqzx7+wtBC/D9lJrpVzrgkh7bjqjYQSFnPtxlPHFbzpataKw/zCTPSwbHtnTgeoU47C1Yhbc1eX4oSfu8QRyQXU=
X-Received: by 2002:a9d:6196:: with SMTP id g22mr5066855otk.204.1575408025826; 
 Tue, 03 Dec 2019 13:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay> <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
 <20191017102216.20f98533@eldfell.localdomain>
 <20191203191054.GA162979@art_vandelay>
In-Reply-To: <20191203191054.GA162979@art_vandelay>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 3 Dec 2019 22:20:14 +0100
Message-ID: <CAKMK7uF4F7WTHTvWmdrM+BBaPbvFtwVG0G7rSLx97NH5aEq+2w@mail.gmail.com>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ut3M6g1Hl116dncuKVz3l+JYWUbNUeJt2TTVnZ9Vnc4=;
 b=Eyz3pm2l/Coeu8Nci0VLPg3w7fAyBQuG/i5BMB2ZM9ubQ0MFym2khbPAXW21nXAm1R
 z6zv1fSchQMMkqzgoOipMSE+DPNhdYVYX4ZEWC2xmBnQ47nAa+SacO1OlTsCCQ0OjAa3
 5BvgojM3lA4i8/v2Ln58pqD/7xQAZeeny4mNQ=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCA4OjEwIFBNIFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
PiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEwOjIyOjE2QU0gKzAzMDAsIFBl
a2thIFBhYWxhbmVuIHdyb3RlOgo+ID4gT24gV2VkLCAxNiBPY3QgMjAxOSAxNToyMzo0NSArMDIw
MAo+ID4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4K
PiA+ID4gSGkKPiA+ID4KPiA+ID4gQW0gMTYuMTAuMTkgdW0gMTU6MDUgc2NocmllYiBQZWtrYSBQ
YWFsYW5lbjoKPiA+Cj4gPiA+ID4gc3BlY2lmaWNhbGx5IGJlIGF2YWlsYWJsZSBpbiBwcm9kdWN0
aW9uLiBTbyBhIG5ldyBmaWxlIGluIHNvbWUgZnMKPiA+ID4gPiBzb21ld2hlcmUgaXQgc2hvdWxk
IGJlLCBhbmQgdXNlcnNwYWNlIGluIHByb2R1Y3Rpb24gY2FuIHJlYWQgaXQgYXQgd2lsbAo+ID4g
PiA+IHRvIGF0dGFjaCB0byBhIGJ1ZyByZXBvcnQuCj4gPiA+ID4KPiA+ID4gPiBUaG9zZSBzZW1h
bnRpY3MsICJvbmx5IHVzZSB0aGlzIGNvbnRlbnQgZm9yIGF0dGFjaGluZyBpbnRvIGEgYnVnCj4g
PiA+ID4gcmVwb3J0IiBzaG91bGQgYmUgbWFkZSB2ZXJ5IGNsZWFyIGluIHRoZSBVQVBJLgo+ID4g
Pgo+ID4gPiBIYXMgdGhpcyBldmVyIHdvcmtlZD8gQXMgc29vbiBhcyBhIHVzZXJzcGFjZSBwcm9n
cmFtIHN0YXJ0cyBkZXBlbmRpbmcgb24KPiA+ID4gdGhlIGNvbnRlbnQgb2YgdGhpcyBmaWxlLCBp
dCBiZWNvbWVzIGthYmkuIEZyb20gdGhlIGluY2lkZW50cyBJIGtub3csCj4gPiA+IExpbnVzIGhh
cyBhbHdheXMgYmVlbiBxdWl0ZSBzdHJpY3QgYWJvdXQgdGhpcy4gRXZlbiBmb3IgYnJva2VuIGlu
dGVyZmFjZXMuCj4gPgo+ID4gVGhlIGtlcm5lbCBsb2cgY29udGVudCBpcyBub3Qga2FiaSwgaXMg
aXQ/IEkndmUgc2VlbiBpdCBjaGFuZ2UgcGxlbnR5Cj4gPiBkdXJpbmcgdGhlIHllYXJzLiBUaGlz
IHdvdWxkIGJlIGp1c3QgYW5vdGhlciBzaW1pbGFyIGxvZyB3aXRoIGZyZWUtZm9ybQo+ID4gdGV4
dC4KPiA+Cj4KPiBPaywgc28gZ2l2ZW4gdGhlIG1vcmUgc3RydWN0dXJlZCB2ZXJzaW9uIG9mIHRo
aXMgc2V0IFsxXSB3YXMgbm90IHdlbGwgcmVjZWl2ZWQsCj4gYXJlIHdlIGFsbCBjb21mb3J0YWJs
ZSBnb2luZyB3aXRoIHRoZSBmcmVlZm9ybSBhcHByb2FjaCBpbiB0aGlzIHZlcnNpb24/CgpJbW8g
eWVzLiBJdCdzIHN0aWxsIHVhYmksIHNvIHNvbWVvbmUgd2lsbCBoYXZlIHJlZ3JldHMgYWJvdXQg
aXQuIEJ1dApnaXZlbiB0aGF0IGRtZXNnIGhhcyBiZWVuIGFyb3VuZCBmb3JldmVyLCBhbmQgY2F1
c2VzIHJhdGhlciBsaXR0bGUKYnJlYWthZ2UsIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGZhaXJseSBv
ay4KCkkgc3RpbGwgdGhpbmsgdGhhdCBmaWd1cmluZyBvdXQgdGhlIGRybV9kZXYgbG9nZ2luZyBi
aWtlc2hlZCBtaWdodCBiZQpnb29kLCB3aGlsZSB3ZSBub29kbGUgYXJvdW5kIGluIGhlcmUuCi1E
YW5pZWwKCj4KPiBTZWFuCj4KPiBbMV0tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2Fy
Y2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVyLzI0MzIzMC5odG1sCj4KPiA+Cj4gPiBUaGFu
a3MsCj4gPiBwcQo+Cj4KPgo+IC0tCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
