Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A065C253D5
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C60892B8;
	Tue, 21 May 2019 15:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C96892B8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 15:24:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20EC0217F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 15:24:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id a17so21000928qth.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:24:39 -0700 (PDT)
X-Gm-Message-State: APjAAAUepFSVrRLYe3/TvETArJnSXACXyS0OizjdkEX+qf7Ze8WZW6F0
 Wp3D/pesl0fYO48PN+I4Hv2rRxqN1D9/tsmSlA==
X-Google-Smtp-Source: APXvYqx7ecHrwSaLHLxRfIlKwMp8vokNKf7qL+p2ez/pqvv0/4ymV0sti7tGH0UYRigUbO5fscKqTyvWWtiJIezz0a4=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr69172161qta.136.1558452278328; 
 Tue, 21 May 2019 08:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092306.27633-1-steven.price@arm.com>
 <20190520092306.27633-3-steven.price@arm.com>
In-Reply-To: <20190520092306.27633-3-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 May 2019 10:24:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
Message-ID: <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panfrost: Use drm_gem_shmem_map_offset()
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558452279;
 bh=UMWfqlN2YiVoKAZO91st6BVGhLPMGLbKOwMtKk9gVW0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lkIWUKNOOqae+PNKcqlj5A7XfX+R5WtRBHLluCTEAfb09PyNhuQ/Cv83PXE5KaJq5
 lI/oLB59Z0OhiAI/Rj8Shsq/bETKDQKAKG71M50xbXDrAO9bWX30Zd+2m90x/NOfbb
 xffA37pE2DH3yAKZOsUa+sYMxAN+OTrH/gxttSk8=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNDoyMyBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgoKWW91IGZvcmdvdCB0byB1cGRhdGUgdGhlIHN1YmplY3QuIEkg
Y2FuIGZpeHVwIHdoZW4gYXBwbHlpbmcsIGJ1dCBJJ2QKbGlrZSBhbiBhY2sgZnJvbSBDaHJpcyBv
biBwYXRjaCAxLgoKPiBwYW5mcm9zdF9pb2N0bF9tbWFwX2JvKCkgY29udGFpbnMgYSByZWltcGxl
bWVudGF0aW9uIG9mCj4gZHJtX2dlbV9tYXBfb2Zmc2V0KCkgYnV0IHdpdGggYSBidWcgLSBpdCBh
bGxvd3MgbWFwcGluZyBpbXBvcnRlZCBvYmplY3RzCj4gKHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0
aGUgZXhwb3J0ZXIpLiBGaXggdGhpcyBieSBzd2l0Y2hpbmcgdG8gdXNlIHRoZQo+IG5ld2x5IHJl
bmFtZWQgZHJtX2dlbV9tYXBfb2Zmc2V0KCkgZnVuY3Rpb24gaW5zdGVhZCB3aGljaCBoYXMgdGhl
IGJvbnVzCj4gb2Ygc2ltcGxpZnlpbmcgdGhlIGNvZGUuCj4KPiBDQzogQWx5c3NhIFJvc2Vuendl
aWcgPGFseXNzYUByb3Nlbnp3ZWlnLmlvPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxh
bHlzc2FAcm9zZW56d2VpZy5pbz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
