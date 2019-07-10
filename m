Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C465277
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11D6E139;
	Thu, 11 Jul 2019 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0E89856
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 14:03:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so2546701qtq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GPFpTiWfd8hx/L3TEHsm8trnZwkg18NUyiQIdlDfIM=;
 b=i1sOuQRiREDLlomFbOvbs6hOom6azwJUYpOjqgEsQD8xH2ILnQ32eVwwpLpPkat/Nu
 egx8NTjve0OLVP2XA3nhLKa1BA+cQg5FVCKN/jGjrM5ELdNP+E9pj0aNJWXckg2sqP7R
 ZTv6DM0Jy8fPL/XtsNPIx2/wscSSSRI+bHDe83Z2QHVhIVxhMXMWdteLJWTGgg+u5H8+
 mZa2yHtkcabXWnS+6tcje+OkxCXPNBZ73yvesHilLMYvbbe4bJjsEg48YIq2df70H/NC
 7J8BhS7xo/x2N832OjLZxroFOWawqF0W/qv0A0kxvgEaISXS1DwjXCU3R71cnJmLASDS
 14ug==
X-Gm-Message-State: APjAAAUhacqKShdhSTj+Ad3mj6TizKGLrzECMsHPuU4JVBAlMI2koEjU
 Q52nI7Z7Uaw58agyJfAKV1wM7RIo
X-Google-Smtp-Source: APXvYqzQpC4aLZcNmB7+pS57opovJp3kbrJxRuZRG2f9CISfAxiwIvf/tjLtNszRZUKk/r9pfawpvA==
X-Received: by 2002:ac8:25e7:: with SMTP id f36mr24084696qtf.139.1562767409534; 
 Wed, 10 Jul 2019 07:03:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id r4sm1772193qta.93.2019.07.10.07.03.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 07:03:27 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710100000.GZ5942@intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <73d5dcd7-adef-8844-4e13-a68a0a5db98a@gmail.com>
Date: Wed, 10 Jul 2019 17:03:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710100000.GZ5942@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2GPFpTiWfd8hx/L3TEHsm8trnZwkg18NUyiQIdlDfIM=;
 b=E+U8F6c7toIoLMK8dCSQ5NefkMuteVs7bE2v2Gxnz6xPcO/Nvtg9p7Yn1vytOTyal7
 Ax/o+vjgetf+EQlNX4U/QjKFNcBec2CVHPANsyN9Udply1mNbKSAOZuJ6S7r08tkJxT+
 FBEccbsgIz0tKkZTokXv0THhpVlHQdXViepthEHBzuLyW94YsJudoBlVEpXC8uXbCRLz
 Cnq+fu7EYI+RlF7+mqT0oykNRisIMDm2FpkeKErVrNdsfB435ArTw+Slnj5jZNLsnDI6
 iOUVRAGmF2IryPYBMu3vcyiW1iUEQ2/pkbgYZur9CH+LDrx3PhMmqANx86ntSQ9inepI
 YlvQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDcuMjAxOSAxMzowMCwgVmlsbGUgU3lyasOkbMOkINC/0LjRiNC10YI6Cj4gT24gVHVlLCBK
dWwgMDksIDIwMTkgYXQgMDU6NTE6NTFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
PiBUaGUgbmFtZWQgbW9kZSBjb3VsZCBiZSBpbnZhbGlkIGFuZCB0aGVuIGNtZGxpbmUgcGFyc2Vy
IG1pc3NlcyB0byB2YWxpZGF0ZQo+PiBtb2RlJ3MgZGltZW5zaW9ucywgaGFwcGlseSBhZGRpbmcg
MHgwIG1vZGUgYXMgYSB2YWxpZCBtb2RlLiBPbmUgY2FzZSB3aGVyZQo+PiB0aGlzIGhhcHBlbnMg
aXMgTlZJRElBIFRlZ3JhIGRldmljZXMgdGhhdCBhcmUgdXNpbmcgZG93bnN0cmVhbSBib290bG9h
ZGVyCj4+IHdoaWNoIGFkZHMgInZpZGVvPXRlZ3JhZmIiIHRvIHRoZSBrZXJuZWwncyBjbWRsaW5l
IGFuZCB0aHVzIHVwc3RyZWFtIFRlZ3JhCj4+IERSTSBkcml2ZXIgZmFpbHMgdG8gcHJvYmUgYmVj
YXVzZSBvZiB0aGUgaW52YWxpZCBtb2RlLgo+Pgo+PiBGaXhlczogM2FlZWIxM2Q4OTk2ICgiZHJt
L21vZGVzOiBTdXBwb3J0IG1vZGVzIG5hbWVzIG9uIHRoZSBjb21tYW5kIGxpbmUiKQo+IAo+IElz
IHRoYXQgYWN0dWFsbHkgdHJ1ZT8gVGhpcyBwcm9ibGVtIGhhcyBiZWVuIGluIHRoZSBjb2RlIHNp
bmNlIGZvcmV2ZXIgQUZBSUNTLgoKWWVzLCBpdCdzIGEgcHJvYmxlbSBub3cgYmVjYXVzZSBuYW1l
ZCBtb2RlIGlzIG1hcmtlZCBhcyBzcGVjaWZpZWQgYW5kCmV2ZXJ5dGhpbmcgdGhhdCBkbyBub3Qg
bWF0Y2ggdG8gYSBub24tbmFtZWQgbW9kZSBpcyB0cmVhdGVkIGFzIG5hbWVkLgoKPj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDMgKystCj4+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMgICAgICAgICAgfCA2ICsrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xp
ZW50X21vZGVzZXQuYwo+PiBpbmRleCBlOTVmY2VhYzhmOGIuLjU2ZDM2Nzc5ZDIxMyAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiBAQCAtMTgwLDcgKzE4MCw4IEBA
IGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKPj4gIAo+PiAgY3JlYXRlX21vZGU6Cj4+ICAJbW9kZSA9IGRybV9tb2RlX2NyZWF0
ZV9mcm9tX2NtZGxpbmVfbW9kZShjb25uZWN0b3ItPmRldiwgY21kbGluZV9tb2RlKTsKPj4gLQls
aXN0X2FkZCgmbW9kZS0+aGVhZCwgJmNvbm5lY3Rvci0+bW9kZXMpOwo+PiArCWlmIChtb2RlKQo+
PiArCQlsaXN0X2FkZCgmbW9kZS0+aGVhZCwgJmNvbm5lY3Rvci0+bW9kZXMpOwo+IAo+IFRoYXQn
cyB0aGUgc2FtZSBhcyB3aGF0IEkgZGlkIGhlcmUKPiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMzA5MjIzLz9zZXJpZXM9NjE3ODEmcmV2PTEKPiAKPiBCdXQgSSdkIGhh
dmUgdG8gcmViYXNlIHRoYXQgc28gbGV0J3MganVzdCBnbyB3aXRoIHlvdXIgcGF0Y2guCj4gCj4+
ICAKPj4gIAlyZXR1cm4gbW9kZTsKPj4gIH0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+PiBpbmRleCA5MTA1
NjFkNGYwNzEuLjc0YTU3MzlkZjUwNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+PiBAQCAtMTU4
LDYgKzE1OCw5IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fY3Z0X21vZGUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNwbGF5LAo+PiAgCWludCBpbnRlcmxhY2U7Cj4+ICAJ
dTY0IHRtcDsKPj4gIAo+PiArCWlmICghaGRpc3BsYXkgfHwgIXZkaXNwbGF5KQo+PiArCQlyZXR1
cm4gTlVMTDsKPj4gKwo+PiAgCS8qIGFsbG9jYXRlIHRoZSBkcm1fZGlzcGxheV9tb2RlIHN0cnVj
dHVyZS4gSWYgZmFpbHVyZSwgd2Ugd2lsbAo+PiAgCSAqIHJldHVybiBkaXJlY3RseQo+PiAgCSAq
Lwo+PiBAQCAtMzkyLDYgKzM5NSw5IEBAIGRybV9ndGZfbW9kZV9jb21wbGV4KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIGludCBoZGlzcGxheSwgaW50IHZkaXNwbGF5LAo+PiAgCWludCBoc3luYywg
aGZyb250X3BvcmNoLCB2b2RkX2Zyb250X3BvcmNoX2xpbmVzOwo+PiAgCXVuc2lnbmVkIGludCB0
bXAxLCB0bXAyOwo+PiAgCj4+ICsJaWYgKCFoZGlzcGxheSB8fCAhdmRpc3BsYXkpCj4+ICsJCXJl
dHVybiBOVUxMOwo+PiArCj4gCj4gVGhlc2UgbGd0bQo+IAo+IFBhdGNoIGlzCj4gUmV2aWV3ZWQt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpUaGFu
a3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
