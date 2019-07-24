Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE972901
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 09:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D81B6E460;
	Wed, 24 Jul 2019 07:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2426E460
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 07:29:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p17so45709667wrf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 00:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCmdtnUP7aJRqucr3vaspkGGjkcYN7cm9GbUeSOpXg4=;
 b=gq9UhitWAlPkR7tbf5f9Dmcu3QeTfkj8ITnnW4pVKe5QfEA7kvoEHsrGTy+AiCI4BW
 Q12g96G7MgpM3Fj4rxijd4Lg07A6cwM19l9JuNy+2e/dEvDJYTcNO2fkRfAHIptaY/a8
 4Zwl1aLxXb/HnooFbMitHIkU1SZRX67eyQ8DgYT0i7c6qVAGKHrrBZ4meqIWYNNo0v8a
 x/OMiy9EUfgRBm2ZMlJYIb1MdqnoJPL41lceJ7E2VmgNjKUNQEG3PF2vEHpE7FWeV/cm
 E/WMeW8k1W/W/p85PY5rDc9y9CVhHlUSDRfJBwScgwfPuUNuvUpUSlFO/+VTvt+EsUFt
 RkQA==
X-Gm-Message-State: APjAAAWomtGo4TMkPdj0X7CGhUOsBdSUyPx0/JZOGtkefCQL5DsQIM59
 CLa4YMYYeincZT5T+p+OOeAiczCNtuZ2qzcwSso=
X-Google-Smtp-Source: APXvYqzvZJmXGo8K7zyPAWumLL81AOZ5k2RFLEJ80iQmYUwi0sTJbgdZuIX9S087bLR8+VNHitysCdfq+J8rfAU7zb4=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr59437897wrc.95.1563953350570; 
 Wed, 24 Jul 2019 00:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jul 2019 09:28:58 +0200
Message-ID: <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMzozOCBBTSBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+IFRoZSBSLUNhciBMVkRTIGVuY29k
ZXIgdW5pdHMgc3VwcG9ydCBkdWFsLWxpbmsgb3BlcmF0aW9ucyBieSBzcGxpdHRpbmcKPiB0aGUg
cGl4ZWwgb3V0cHV0IGJldHdlZW4gdGhlIHByaW1hcnkgZW5jb2RlciBhbmQgdGhlIGNvbXBhbmlv
biBvbmUuCj4KPiBJbiBvcmRlciBmb3IgdGhlIHByaW1hcnkgZW5jb2RlciB0byBzdWNjZXNmdWxs
eSBjb250cm9sIHRoZSBjb21wYW5pb24ncwo+IG9wZXJhdGlvbnMgdGhpcyBzaG91bGQgbm90IGZh
aWwgYXQgcHJvYmUgdGltZSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGl0cwo+IGFzc29jaWF0ZWQgZHJt
IGJyaWRnZSBzbyB0aGF0IHRoZSBwcmltYXJ5IG9uZSBjYW4gZmluZCBpdC4KPgo+IEN1cnJlbnRs
eSB0aGUgY29tcGFuaW9uIGVuY29kZXIgZmFpbHMgYXQgcHJvYmUgdGltZSwgY2F1c2luZyB0aGUK
PiByZWdpc3RyYXRpb24gb2YgdGhlIHByaW1hcnkgdG8gZmFpbCBwcmV2ZW50aW5nIHRoZSB3aG9s
ZSBEVSB1bml0IHRvIGJlCj4gcmVnaXN0ZXJlZCBjb3JyZWN0bHkuCj4KPiBGaXhlczogZmE0NDBk
ODcwMzU4ICgiZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgc3VwcG9ydCBmb3IgZHVhbC1saW5rIG1v
ZGUiKQo+IFJlcG9ydGVkLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2Fz
QGptb25kaS5vcmc+Cj4KPiAtLS0KPiBUaGUgIkZpeGVzIiB0YWcgcmVmZXJzIHRvIGEgcGF0Y2gg
Y3VycmVudGx5IHBhcnQgb2YgdGhlCj4gcmVuZXNhcy1kcml2ZXJzLTIwMTktMDctMDktdjUuMiBi
cmFuY2ggb2YgR2VlcnQncyByZW5lc2FzLWRyaXZlcnMgdHJlZS4KClRoZSBicm9rZW4gY29tbWl0
IGlzIGFsc28gcHJlc2VudCBpbiB2NS4zLXJjMS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
