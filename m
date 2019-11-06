Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E490F1531
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 12:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3313F6E1BA;
	Wed,  6 Nov 2019 11:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37AD6E1BA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 11:34:36 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t5so25701916ljk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 03:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nosK7tI40Rgvjrai39ricqlcuCuUJP5n8FyKQ7roxg=;
 b=W8uq/TwfrT1RSMr+hqZzJnd+DUNCMUedxHEviA+FGfumsWZ+bHD7RFj2SzJLN8LE+H
 KS6/Fcom+MqE+zS2R65scpOVyCyrrwb0dSp2VihKTL7+Ka4OHCOdf2uuHVZZ9CW7UKzE
 9izAGjUYjdJ42ksl0e5Oczt/vNIMEV2KKlQyM3fGuW2CIP4bZ1H4V4i4NuHHXhJdNHkI
 Kv3766o3Zf3n1mQcMLOjRMbEQBBZ4Ve6UtNqf/D40yEcARRkMf2oLfHBKVswXqxnwjqs
 0Z/T5Vc2TzxHBXm2A97GotVsiTg3DDcZ3YOazNcKBw8yuldDi7hdkplhyoChG+Psevb/
 1BbQ==
X-Gm-Message-State: APjAAAXBlKQoVU86VYByRXLeIVF/StX0akeTHV4V/1mwF5PrMXd1B7EZ
 0VlVnxI4ql4mHSvua2D3cLaMR69GK7NWQlag8Zs0ttru
X-Google-Smtp-Source: APXvYqxFczEUtFCkZYF41koKk4Vi1YbuD6j8fBM1WXGyzw5A6qeu9m/tEzFIbX3oiCPLwFQCAGY9QsNdQrm4pK6gb20=
X-Received: by 2002:a2e:990b:: with SMTP id v11mr1522006lji.151.1573040074779; 
 Wed, 06 Nov 2019 03:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
 <CAPM=9tzxUj7zHHJgj_PCJ9pOavO2rz6YVPFbJfWBGgMnb9ykKg@mail.gmail.com>
In-Reply-To: <CAPM=9tzxUj7zHHJgj_PCJ9pOavO2rz6YVPFbJfWBGgMnb9ykKg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 6 Nov 2019 11:34:12 +0000
Message-ID: <CAPj87rMfehv9xjYuDPWSrX03J6==TqKpGsFCuO12pi+pNf5QMA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/nosK7tI40Rgvjrai39ricqlcuCuUJP5n8FyKQ7roxg=;
 b=SrzRimmVrM6aG4Ih/o055Cl97OVJpeB9XfSRdqgfrhV4wmcdeykqOn3wKxfUxfLKi/
 oqKA/Jpj6xiDVOGczMTeZkekzEkEbuUsKeImgAKWjjtVbQR05eSOKrntP9e6axpQ9z9x
 a6jlXO1PC3PL9OQP/2nT4ePxGv64mc+xY+XRxhNnDcGM1WVUDo/HshB4FXEq9uZLjGrq
 v2RtAhAYNzuXb/Vp423WvVy2/WQIAr5nC6Syzsz5pPQ7aHvFW86ll4w5hyhZ7fjvzJ9F
 BUyQD4Lq0FnxKzsDZUH9xwfNempIJ7/akozffeLuo2YYjjkqBWBxOlK4bDH/uy/ST2hj
 GLQw==
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIDYgTm92IDIwMTkgYXQgMDI6NDcsIERhdmUgQWlybGllIDxhaXJsaWVkQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gT3RoZXJ3aXNlIEkgdGhpbmsgdGhpcyBzZWVtcyBmaW5lLCB0aG91
Z2ggaXQgZG9lcyBiZWcgdGhlIHF1ZXN0aW9uIGluCj4gbXkgbWluZCBvZiB3aGF0IGhhcHBlbnMg
aWYgSSBnZXQgMiA4SyBtb25pdG9ycywgYW5kIHBsdWcgdGhlIGZpcnN0Cj4gdGlsZSBvZiBvbmUg
aW4sIGFuZCB0aGUgc2Vjb25kIHRpbGUgb2YgdGhlIG90aGVyIGluLgoKSG9uZXN0bHkgaW4gdGhh
dCBjYXNlIEkgdGhpbmsgJ3lvdSBnZXQgdG8gbGl0ZXJhbGx5IGtlZXAgYm90aCBwaWVjZXMnCmlz
IGEgcmVhc29uYWJsZSBhbnN3ZXIuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
