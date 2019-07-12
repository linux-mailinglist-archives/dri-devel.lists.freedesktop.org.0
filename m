Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1367A7C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5036D6E3E4;
	Sat, 13 Jul 2019 14:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2DA6E301
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:30:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m8so8497682lji.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 01:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F10no2HO30FOZ+nye/7YyMgOcOyHDq4Smw1AGcr+NuE=;
 b=EF7jMFyTLVBdSqNBgXxlkVJq+qkGKFzUcQ84G4jC22PZu/2mogZumdl5fMVlSIZtbZ
 EEH12uGmfOmFAn1dHNXSOmRFoe7tDFUk/joerwyDuOBJDQ5IJyVWtJdgyBoFuk71Lr29
 z86VQWMNoyAhD3LVGP/f4ni7sYcGMqfdyLuAA/C/BzGqoakZMeaaae70jhB/6mwalawC
 hbny2Bs3baSJbv1mCVIMPwkRqXVYk0hphqqB+Xg/ca4eIz9RmWIlk1+IlDENS9SYDCpA
 09xsxR4hB5+RNnDAgGv4kr8afgncFiKaIyCC6JRA6Bk+ZKcAKtveiCFCH/ingcv/Ys2L
 pOHg==
X-Gm-Message-State: APjAAAVJXzaPgY40EiuaEnWTFzLb2sDrmGUBMIyf8oHoIKFjudOAbkTv
 QkRU6prlI9fqdIHJsGuPs9A=
X-Google-Smtp-Source: APXvYqyTvMHU3DVGX9m5tM1UF/mI2SFuTMllRS1g+dw37MyuFprMMPHVM+CFp2fLB6+vC/OinBEyag==
X-Received: by 2002:a2e:898b:: with SMTP id c11mr5338649lji.241.1562920202772; 
 Fri, 12 Jul 2019 01:30:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id w1sm1540417ljm.81.2019.07.12.01.30.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 01:30:02 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
 <20190711090327.keuxt2ztfqecdbef@flea>
 <de21fe78-87a6-741f-caf7-2771f6468739@gmail.com>
 <20190712081027.arybdoxr6nzrmkxt@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <686a20ce-e09a-037c-a5db-bd1309790c3e@gmail.com>
Date: Fri, 12 Jul 2019 11:30:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712081027.arybdoxr6nzrmkxt@flea>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F10no2HO30FOZ+nye/7YyMgOcOyHDq4Smw1AGcr+NuE=;
 b=FUFhlv2fuv2V88WkQK0agSQNWYZOCsSrQ8Q8vhkMtDBewdtdwWu8UWg0seEGVfXgox
 cLYoreLpSloGGBaTJa842HVIvlnvrnvmxxNnv+wte05OVULZS7zNF8kKY5qFcs+IxI/1
 K5Jsx8kRAOaAy2RdC6gvFHXCqQSC3PJZ+SMDZUl9u2PEsJuc1grSqLvjfD4V10TACqvl
 6xrdQ5BsSB86Y1IdogOHa+2B2Q1gX3v/qynMz9skjDIT5ocYGTD4e2GfuMW3HOZT84zH
 k8pZ/YKrdmGxqnYQ0N7PLm/1UC/SG1VA6w5HEzb0JWztQUiUC3pVCWhN2bsd04a4bFc8
 0Acw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDcuMjAxOSAxMToxMCwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFRodSwgSnVs
IDExLCAyMDE5IGF0IDA2OjU1OjAzUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
MTEuMDcuMjAxOSAxMjowMywgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4gT24gV2VkLCBK
dWwgMTAsIDIwMTkgYXQgMDY6MDU6MThQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
Pj4+IDEwLjA3LjIwMTkgMTc6MDUsIE1heGltZSBSaXBhcmQg0L/QuNGI0LXRgjoKPj4+Pj4gT24g
V2VkLCBKdWwgMTAsIDIwMTkgYXQgMDQ6Mjk6MTlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdy
b3RlOgo+Pj4+Pj4gVGhpcyB3b3JrczoKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnRfbW9kZXNldC5jCj4+Pj4+PiBpbmRleCA1NmQzNjc3OWQyMTMuLmU1YTJmOWM4ZjQwNCAxMDA2
NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+Pj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4+Pj4+PiBAQCAt
MTgyLDYgKzE4Miw4IEBAIGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4+Pj4+ICAgICAgICAgbW9kZSA9IGRybV9tb2RlX2Ny
ZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZShjb25uZWN0b3ItPmRldiwgY21kbGluZV9tb2RlKTsKPj4+
Pj4+ICAgICAgICAgaWYgKG1vZGUpCj4+Pj4+PiAgICAgICAgICAgICAgICAgbGlzdF9hZGQoJm1v
ZGUtPmhlYWQsICZjb25uZWN0b3ItPm1vZGVzKTsKPj4+Pj4+ICsgICAgICAgZWxzZQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgIGNtZGxpbmVfbW9kZS0+c3BlY2lmaWVkID0gZmFsc2U7Cj4+Pj4+Cj4+
Pj4+IEhtbW0sIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGF0IHdvdWxkbid0IGJlIHRoZSBj
YXNlLgo+Pj4+Pgo+Pj4+PiBJZiB3ZSBjb21lIGJhY2sgdG8gdGhlIGJlZ2lubmluZyBvZiB0aGF0
IGZ1bmN0aW9uLCB3ZSByZXRyaWV2ZSB0aGUKPj4+Pj4gY21kbGluZV9tb2RlIGJ1ZmZlciBmcm9t
IHRoZSBjb25uZWN0b3IgcG9pbnRlciwgdGhhdCB3aWxsIHByb2JhYmx5Cj4+Pj4+IGhhdmUgYmVl
biBwYXJzZWQgYSBmaXJzdCB0aW1lIHVzaW5nIGRybV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVf
bW9kZQo+Pj4+PiBpbiBkcm1faGVscGVyX3Byb2JlX2FkZF9jbWRsaW5lX21vZGUuCj4+Pj4+Cj4+
Pj4+IE5vdywgSSdtIGd1ZXNzaW5nIHRoYXQgdGhlIGlzc3VlIGlzIHRoYXQgaW4KPj4+Pj4gZHJt
X21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IsIGlmIHdlIGhhdmUgYSBuYW1l
ZCBtb2RlLCB3ZQo+Pj4+PiBqdXN0IGNvcHkgdGhlIG1vZGUgb3ZlciBhbmQgc2V0IG1vZGUtPnNw
ZWNpZmllZC4KPj4+Pj4KPj4+Pj4gQW5kIHdlIHRoZW4gbW92ZSBvdmVyIHRvIGRvIG90aGVyIGNo
ZWNrcywgYW5kIHRoYXQncyBwcm9iYWJseSB3aGF0Cj4+Pj4+IGZhaWxzIGFuZCByZXR1cm5zLCBi
dXQgb3VyIGRybV9jbWRsaW5lX21vZGUgd2lsbCBoYXZlIGJlZW4gbW9kaWZpZWQuCj4+Pj4+Cj4+
Pj4+IEknbSBub3QgZW50aXJlbHkgc3VyZSBob3cgdG8gZGVhbCB3aXRoIHRoYXQgdGhvdWdoLgo+
Pj4+Pgo+Pj4+PiBJIGd1ZXNzIHdlIGNvdWxkIGFsbG9jYXRlIGEgZHJtX2NtZGxpbmVfbW9kZSBz
dHJ1Y3R1cmUgb24gdGhlIHN0YWNrLAo+Pj4+PiBmaWxsIHRoYXQsIGFuZCBpZiBzdWNjZXNzZnVs
IGNvcHkgb3ZlciBpdHMgY29udGVudCB0byB0aGUgb25lIGluCj4+Pj4+IGRybV9jb25uZWN0b3Iu
IFRoYXQgd291bGQgYWxsb3cgdXMgdG8gb25seSBjaGFuZ2UgdGhlIGNvbnRlbnQgb24KPj4+Pj4g
c3VjY2Vzcywgd2hpY2ggaXMgd2hhdCBJIHdvdWxkIGV4cGVjdCBmcm9tIHN1Y2ggYSBmdW5jdGlv
bj8KPj4+Pj4KPj4+Pj4gSG93IGRvZXMgdGhhdCBzb3VuZD8KPj4+Pgo+Pj4+IEkgbm93IHNlZSB0
aGF0IHRoZXJlIGlzIERSTV9NT0RFX1RZUEVfVVNFUkRFRiBmbGFnIHRoYXQgaXMgYXNzaWduZWQg
b25seQo+Pj4+IGZvciB0aGUgImNtZGxpbmUiIG1vZGUgYW5kIGRybV9jbGllbnRfcm90YXRpb24o
KSBpcyB0aGUgb25seSBwbGFjZSBpbgo+Pj4+IERSTSBjb2RlIHRoYXQgY2FyZXMgYWJvdXQgd2hl
dGhlciBtb2RlIGlzIGZyb20gY21kbGluZSwgaGVuY2UgbG9va3MgbGlrZQo+Pj4+IGl0IHdpbGwg
YmUgbW9yZSBjb3JyZWN0IHRvIGRvIHRoZSBmb2xsb3dpbmc6Cj4+Pgo+Pj4gSSdtIHN0aWxsIHVu
ZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgd2UncmUgZGVhbGluZyB3aXRoIHdvcmthcm91bmRzIG9m
Cj4+PiBhIG1vcmUgY2VudHJhbCBpc3N1ZSwgd2hpY2ggaXMgdGhhdCB3ZSBzaG91bGRuJ3QgcmV0
dXJuIGEgcGFydGlhbGx5Cj4+PiBtb2RpZmllZCBkcm1fY21kbGluZV9tb2RlLgo+Pj4KPj4+IFlv
dSBzYWlkIGl0IHlvdXJzZWxmLCB0aGUgYnJlYWthZ2UgaXMgaW4gdGhlIGNvbW1pdCBjaGFuZ2lu
ZyB0aGUKPj4+IGNvbW1hbmQgbGluZSBwYXJzaW5nIGxvZ2ljLCB3aGlsZSB5b3UncmUgZml4aW5n
IGhlcmUgc29tZSBjb2RlIHRoYXQKPj4+IHdhcyBpbnRyb2R1Y2VkIGxhdGVyIG9uLgo+Pgo+PiBU
aGUgcHJvYmxlbSBzdGVtcyBmcm9tIGFzc3VtcHRpb24gdGhhdCAqYW55KiBuYW1lZCBtb2RlIGlz
IHZhbGlkLiBJdAo+PiBsb29rcyB0byBtZSB0aGF0IHRoZSB1bHRpbWF0ZSBzb2x1dGlvbiB3b3Vs
ZCBiZSB0byBtb3ZlIHRoZSBtb2RlJ3MgbmFtZQo+PiBjb21wYXJpc29uIGludG8gdGhlIFsxXSwg
aWYgdGhhdCdzIHBvc3NpYmxlLgo+Pgo+PiBbMV0gZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5l
X2Zvcl9jb25uZWN0b3IoKQo+IAo+IFdlbGwsIG9uZSBjb3VsZCBhcmd1ZSB0aGF0IHZpZGVvPXRl
Z3JhZmIgaXMgaW52YWxpZCBhbmQgc2hvdWxkIGJlCj4gcmVqZWN0ZWQgYXMgd2VsbCwgYnV0IHdl
IGhhdmVuJ3QgY2xlYXJlZCB0aGF0IHVwLgoKVGhlIHZpZGVvPXRlZ3JhZmIgaXMgaW52YWxpZCBt
b2RlLCB0aGVyZSBpcyBub3RoaW5nIHRvIGFyZ3VlIGhlcmUuIEFuZAp0aGUgcHJvYmxlbSBpcyB0
aGF0IGludmFsaWQgbW9kZXMgYW5kIG5vdCByZWplY3RlZCBmb3IgdGhlIHZlcnkgYmVnaW5uaW5n
LgoKPj4+IENhbiB5b3UgdHJ5IHRoZSBmb2xsb3dpbnRnIHBhdGNoPwo+Pj4gaHR0cDovL2NvZGUu
YnVsaXgub3JnLzhjd2s0Yy03OTQ1NjU/cmF3Cj4+Cj4+IFRoaXMgZG9lc24ndCBoZWxwIGJlY2F1
c2UgdGhlIHByb2JsZW0gd2l0aCB0aGUgcm90YXRpb25fcmVmbGVjdGlvbiBpcwo+PiB0aGF0IGl0
J3MgMCBpZiAicm90YXRpb24iIG5vdCBwcmVzZW50IGluIHRoZSBjbWRsaW5lIGFuZCB0aGVuIGls
b2cyKDApCj4+IHJldHVybnMgLTEuIFNvIHRoZSBwYXRjaCAiZHJtL21vZGVzOiBEb24ndCBhcHBs
eSBjbWRsaW5lJ3Mgcm90YXRpb24gaWYKPj4gaXQgd2Fzbid0IHNwZWNpZmllZCIgc2hvdWxkIGJl
IGNvcnJlY3QgaW4gYW55IGNhc2UuCj4gCj4gU28gd2Ugd291bGQgaGF2ZSB0aGUgc2FtZSBpc3N1
ZSB3aXRoIHJvdGF0ZT0wIHRoZW4/CgpObywgd2Ugd29uJ3QuIFJvdGF0aW9uIG1vZGUgaXMgcGFy
c2VkIGludG8gdGhlIERSTV9NT0RFIGJpdG1hc2sgYW5kCnJvdGF0ZT0wIGNvcnJlc3BvbmRzIHRv
IERSTV9NT0RFX1JPVEFURV8wLCB3aGljaCBpcyBCSVQoMCkgYXMgeW91IG1heQpub3RpY2UuIEhl
bmNlIHJvdGF0aW9uX3JlZmxlY3Rpb249MCBpcyBhbHdheXMgYW4gaW52YWxpZCB2YWx1ZSwgbWVh
bmluZwp0aGF0ICJyb3RhdGUiIG9wdGlvbiBkb2VzIG5vdCBwcmVzZW50IGluIHRoZSBjbWRsaW5l
LiBQbGVhc2UgY29uc3VsdCB0aGUKY29kZSwgaW4gcGFydGljdWxhciBzZWUgZHJtX21vZGVfcGFy
c2VfY21kbGluZV9vcHRpb25zKCkgd2hpY2ggd2FzCndyaXR0ZW4gYnkgeW91cnNlbGYgOykKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
