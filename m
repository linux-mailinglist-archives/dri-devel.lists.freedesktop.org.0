Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5963C01
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF11F89DD2;
	Tue,  9 Jul 2019 19:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C38289DD2;
 Tue,  9 Jul 2019 19:38:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h21so20666452qtn.13;
 Tue, 09 Jul 2019 12:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgO5fSFnkpRb91YH7i6eymSVmXaxAMQJWlwBQj0Dv40=;
 b=j3LBvHohLlqnh1Mt2If7HYDV9eWFP2ujM+19HHqkitaBNIF91QhaqOh7H7OHNG7BOt
 0SnfP3cgJUzaggYiNnDGtq0GlAJscrkkVS2YyJPHcfeWFw06rLP5GsUU6Qs9OralShsu
 cKJ/Axndv36EMlt+0TT4Dyu9wEkKCTA2De+NxJ4YsBf9QeuqomxXQ6fAAWzbUAXvksm8
 i/NtHcdyWLc9OXF4Vvb0f11Obty2dC690drxbKS8RBJaKiZ9aL6JDTXkSssNEuZbdf2D
 2KyJTgr8dbnc8kTZ+kHBlzxHy7AVsS2VvZN2dcuUNajUaucFaYOG49T3lvcU4Je7RDN9
 OKUQ==
X-Gm-Message-State: APjAAAUKay1O6oWpTeR889P4FirkfZxugN6NFRid7MAOIGDH69qiqWf9
 uBnLME6v3rlpDoJgynkLnaXjIFyuVTCUx40q7L0=
X-Google-Smtp-Source: APXvYqy75RtS1X3Ao5vvsJC+OpR8FANcjcm6rTGH3ZL2vjWjUB2czjyRgpuS62Ljn9y1uzhZ8P3FzW885/0ZtrujVFc=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr19828557qtn.304.1562701091662; 
 Tue, 09 Jul 2019 12:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190708135238.651483-1-arnd@arndb.de>
 <DM6PR12MB320967C48957C4F2F0E92438FEF10@DM6PR12MB3209.namprd12.prod.outlook.com>
 <BN6PR12MB1809956A9C61870CB7F675F5F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809956A9C61870CB7F675F5F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Jul 2019 21:37:54 +0200
Message-ID: <CAK8P3a2GbpkDnpq_MS4iRe7HM0MTxSkx=rB0=OHQZk4TXbvh1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: avoid 64-bit division
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cc: "Park, Chris" <Chris.Park@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>,
 "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Abramov,
 Slava" <Slava.Abramov@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Francis,
 David" <David.Francis@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA2OjQwIFBNIERldWNoZXIsIEFsZXhhbmRlcgo8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT4gd3JvdGU6Cj4KPiBJJ2xsIGp1c3QgYXBwbHkgQXJuZCdzIHBh
dGNoLiAgSWYgdGhlIGRpc3BsYXkgdGVhbSB3YW50cyB0byBhZGp1c3QgaXQgbGF0ZXIgdG8gY2xh
cmlmeSB0aGUKPiBvcGVyYXRpb24sIHRoZXkgc2hvdWxkIGdvIGFoZWFkIGFzIGEgZm9sbG93IHVw
IHBhdGNoLgoKVGhhbmtzIQoKPiBGcm9tOiBBYnJhbW92LCBTbGF2YQo+IFNlbnQ6IFR1ZXNkYXks
IEp1bHkgOSwgMjAxOSAxMjozMSBQTQo+ID4gVGhhbmtzIGZvciBiaXNlY3RpbmcgdGhpcyBpc3N1
ZS4KPiA+Cj4gPiBJIHdvbmRlciB3aGV0aGVyIHlvdSBhcmUgZ29pbmcgdG8gY29tbWl0IHlvdXIg
cGF0Y2ggb3IgcGxhbm5pbmcgdG8gdXBkYXRlIGl0IGFuZCBpdCdzCj4gPiBzdGlsbCBpbiB5b3Vy
IHdvcmsgcXVldWUuICBXZSBoYXZlIG9uZSBvZiBvdXIgMzItYml0IGJ1aWxkcyBmYWlsaW5nIGJl
Y2F1c2Ugb2YgdGhpcwo+ID4gaXNzdWUsIHNvIHRoYXQgSSB3b3VsZCBsaWtlIGVpdGhlciB0byBm
aXggaXQgb3Igd2FpdCB0byB5b3VyIGZpeCBpZiBpdCBoYXMgY2hhbmNlcyB0byBnbwo+ID4gdXBz
dHJlYW0gdG9kYXkuCgpJIHdhcyBnb2luZyB0byB1cGRhdGUgdGhlIHBhdGNoLCBidXQgaGFkIG5v
dCBnb3R0ZW4gdG8gdGhhdCB5ZXQuCgogICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
