Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98965262
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920EE6E119;
	Thu, 11 Jul 2019 07:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE46E109
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:45:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so1917008lfh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ijWEMieickbwE2heNBe0wh4Edj/aRy5NBiPlW7DdE8=;
 b=cewnfy2h3z0wF4vKbfyciim0e72ZX2ziliinwsY61u7Ac5RuaPHGY0Bdqvpxd0sooX
 zLxfk0QHrqzClNo27y6h7YrCGCwhMUJzbpqlOabgIsuqwUrnz8nn/SOZpoGlQS83lgF1
 TZKO+oEGiZOL9jFPXZ6R6+1UymgODyW0psZAkA39asrj/Azut5ri7cYswn4zYDUDO5Hl
 pmA4wOh53j0ZVzqX06Dko4j5lURDqfjqXbgS+R8ij1V6slnp8jw6MZTQXgR/H3v4t4me
 jZl3sHfFe/QSGl3ilxay1zIc+2n8gHge10GjIedTxLkP7B6sLYi1WwY/5JyfW+xSMJ/w
 NXiw==
X-Gm-Message-State: APjAAAV8WJFuDX7rPqg3mfDRW3rQZocsNPAeR0tFz8OIKB67MWbjwwvp
 SSmr9n8OrYFVZ+hZDUhdw0c=
X-Google-Smtp-Source: APXvYqzmm512H5Ed2bqoqtMYLfKJknyJmwMBxi/u6B4GjvWTshAYn5DfkI0715CESbvDggccNSVnZA==
X-Received: by 2002:a19:c503:: with SMTP id w3mr13722696lfe.139.1562773549675; 
 Wed, 10 Jul 2019 08:45:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id b25sm407956lfq.11.2019.07.10.08.45.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 08:45:48 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
From: Dmitry Osipenko <digetx@gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
Message-ID: <2b17baa6-0d16-acac-f626-51799f0d3293@gmail.com>
Date: Wed, 10 Jul 2019 18:45:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ijWEMieickbwE2heNBe0wh4Edj/aRy5NBiPlW7DdE8=;
 b=N9sodbYNbD/pvLup9mnY2ExXB7r7hPtkClYGLHD+V9hAYmqDLqJw1lGCCKcNaCuONk
 HJO7g5/4ZPdqE7PO6kT1lU+lD72ZT+3bft4FvWk0+cMFxGr3PU8rzxHUoc/XJLK17IQJ
 C0rx27dyrezih/YKUACfr7Cx1vT1BvoP7athrUSCNUw27PmXICNgD3qFTk5y8dvAHq4N
 1AVGlly2xO00yUMYQNT6UZUVJRD/CY6srlA+x6ddGZmyJ3VpO8Oc+QrPdBzDAK8r7dhz
 oZl1nBYbgHZsnm7VsuAp5sqdIQqhE5tfNwMSBaMZbKECDTfAt4l7boAme0Xss3+Z6pOk
 o+xQ==
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

MTAuMDcuMjAxOSAxODowNSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTAuMDcuMjAx
OSAxNzowNSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+PiBPbiBXZWQsIEp1bCAxMCwgMjAx
OSBhdCAwNDoyOToxOVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+PiBUaGlzIHdv
cmtzOgo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rl
c2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKPj4+IGluZGV4IDU2
ZDM2Nzc5ZDIxMy4uZTVhMmY5YzhmNDA0IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnRfbW9kZXNldC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dF9tb2Rlc2V0LmMKPj4+IEBAIC0xODIsNiArMTgyLDggQEAgZHJtX2Nvbm5lY3Rvcl9waWNrX2Nt
ZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+Pj4gICAgICAgICBt
b2RlID0gZHJtX21vZGVfY3JlYXRlX2Zyb21fY21kbGluZV9tb2RlKGNvbm5lY3Rvci0+ZGV2LCBj
bWRsaW5lX21vZGUpOwo+Pj4gICAgICAgICBpZiAobW9kZSkKPj4+ICAgICAgICAgICAgICAgICBs
aXN0X2FkZCgmbW9kZS0+aGVhZCwgJmNvbm5lY3Rvci0+bW9kZXMpOwo+Pj4gKyAgICAgICBlbHNl
Cj4+PiArICAgICAgICAgICAgICAgY21kbGluZV9tb2RlLT5zcGVjaWZpZWQgPSBmYWxzZTsKPj4K
Pj4gSG1tbSwgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoYXQgd291bGRuJ3QgYmUgdGhlIGNh
c2UuCj4+Cj4+IElmIHdlIGNvbWUgYmFjayB0byB0aGUgYmVnaW5uaW5nIG9mIHRoYXQgZnVuY3Rp
b24sIHdlIHJldHJpZXZlIHRoZQo+PiBjbWRsaW5lX21vZGUgYnVmZmVyIGZyb20gdGhlIGNvbm5l
Y3RvciBwb2ludGVyLCB0aGF0IHdpbGwgcHJvYmFibHkKPj4gaGF2ZSBiZWVuIHBhcnNlZCBhIGZp
cnN0IHRpbWUgdXNpbmcgZHJtX21vZGVfY3JlYXRlX2Zyb21fY21kbGluZV9tb2RlCj4+IGluIGRy
bV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxpbmVfbW9kZS4KPj4KPj4gTm93LCBJJ20gZ3Vlc3Npbmcg
dGhhdCB0aGUgaXNzdWUgaXMgdGhhdCBpbgo+PiBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVf
Zm9yX2Nvbm5lY3RvciwgaWYgd2UgaGF2ZSBhIG5hbWVkIG1vZGUsIHdlCj4+IGp1c3QgY29weSB0
aGUgbW9kZSBvdmVyIGFuZCBzZXQgbW9kZS0+c3BlY2lmaWVkLgo+Pgo+PiBBbmQgd2UgdGhlbiBt
b3ZlIG92ZXIgdG8gZG8gb3RoZXIgY2hlY2tzLCBhbmQgdGhhdCdzIHByb2JhYmx5IHdoYXQKPj4g
ZmFpbHMgYW5kIHJldHVybnMsIGJ1dCBvdXIgZHJtX2NtZGxpbmVfbW9kZSB3aWxsIGhhdmUgYmVl
biBtb2RpZmllZC4KPj4KPj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGhvdyB0byBkZWFsIHdpdGgg
dGhhdCB0aG91Z2guCj4+Cj4+IEkgZ3Vlc3Mgd2UgY291bGQgYWxsb2NhdGUgYSBkcm1fY21kbGlu
ZV9tb2RlIHN0cnVjdHVyZSBvbiB0aGUgc3RhY2ssCj4+IGZpbGwgdGhhdCwgYW5kIGlmIHN1Y2Nl
c3NmdWwgY29weSBvdmVyIGl0cyBjb250ZW50IHRvIHRoZSBvbmUgaW4KPj4gZHJtX2Nvbm5lY3Rv
ci4gVGhhdCB3b3VsZCBhbGxvdyB1cyB0byBvbmx5IGNoYW5nZSB0aGUgY29udGVudCBvbgo+PiBz
dWNjZXNzLCB3aGljaCBpcyB3aGF0IEkgd291bGQgZXhwZWN0IGZyb20gc3VjaCBhIGZ1bmN0aW9u
Pwo+Pgo+PiBIb3cgZG9lcyB0aGF0IHNvdW5kPwo+IAo+IEkgbm93IHNlZSB0aGF0IHRoZXJlIGlz
IERSTV9NT0RFX1RZUEVfVVNFUkRFRiBmbGFnIHRoYXQgaXMgYXNzaWduZWQgb25seQo+IGZvciB0
aGUgImNtZGxpbmUiIG1vZGUgYW5kIGRybV9jbGllbnRfcm90YXRpb24oKSBpcyB0aGUgb25seSBw
bGFjZSBpbgo+IERSTSBjb2RlIHRoYXQgY2FyZXMgYWJvdXQgd2hldGhlciBtb2RlIGlzIGZyb20g
Y21kbGluZSwgaGVuY2UgbG9va3MgbGlrZQo+IGl0IHdpbGwgYmUgbW9yZSBjb3JyZWN0IHRvIGRv
IHRoZSBmb2xsb3dpbmc6Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xp
ZW50X21vZGVzZXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4g
aW5kZXggNTZkMzY3NzlkMjEzLi5lNWIzYmU5ZWQ2ODkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jCj4gQEAgLTgyNSw2ICs4MjUsNyBAQCBib29sIGRybV9jbGllbnRfcm90
YXRpb24oc3RydWN0IGRybV9tb2RlX3NldAo+ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0
aW9uKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gbW9k
ZXNldC0+Y29ubmVjdG9yc1swXTsKPiAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0g
bW9kZXNldC0+Y3J0Yy0+cHJpbWFyeTsKPiArICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlID0gbW9kZXNldC0+bW9kZTsKPiAgICAgICAgIHN0cnVjdCBkcm1fY21kbGluZV9tb2Rl
ICpjbWRsaW5lOwo+ICAgICAgICAgdTY0IHZhbGlkX21hc2sgPSAwOwo+ICAgICAgICAgdW5zaWdu
ZWQgaW50IGk7Cj4gQEAgLTg1OSw3ICs4NjAsNyBAQCBib29sIGRybV9jbGllbnRfcm90YXRpb24o
c3RydWN0IGRybV9tb2RlX3NldAo+ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0aW9uKQo+
ICAgICAgICAgICogc2ltcGxlIFhPUiBiZXR3ZWVuIHRoZSB0d28gaGFuZGxlIHRoZSBhZGRpdGlv
biBuaWNlbHkuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGNtZGxpbmUgPSAmY29ubmVjdG9yLT5j
bWRsaW5lX21vZGU7Cj4gLSAgICAgICBpZiAoY21kbGluZS0+c3BlY2lmaWVkKSB7Cj4gKyAgICAg
ICBpZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9UWVBFX1VTRVJERUYpIHsKPiAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGNtZGxpbmVfcmVzdCwgcGFuZWxfcmVzdDsKPiAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGNtZGxpbmVfcm90LCBwYW5lbF9yb3Q7Cj4gICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBzdW1fcm90LCBzdW1fcmVzdDsKPiAKCkFsdGhvdWdoLCB0aGVuIHJv
dGF0aW9uIHdvbid0IGJlIGFwcGxpZWQgdG8gdGhlIG5hbWVkIG1vZGUgaW4gdGhhdCBjYXNlLgoK
U2VlbXMgdGhlIGZpeCBjb3VsZCBiZSBldmVuIHNpbXBsZXI6CgpAQCAtODU5LDcgKzg1OSw3IEBA
IGJvb2wgZHJtX2NsaWVudF9yb3RhdGlvbihzdHJ1Y3QgZHJtX21vZGVfc2V0Ciptb2Rlc2V0LCB1
bnNpZ25lZCBpbnQgKnJvdGF0aW9uKQogICAgICAgICAqIHNpbXBsZSBYT1IgYmV0d2VlbiB0aGUg
dHdvIGhhbmRsZSB0aGUgYWRkaXRpb24gbmljZWx5LgogICAgICAgICAqLwogICAgICAgIGNtZGxp
bmUgPSAmY29ubmVjdG9yLT5jbWRsaW5lX21vZGU7Ci0gICAgICAgaWYgKGNtZGxpbmUtPnNwZWNp
ZmllZCkgeworICAgICAgIGlmIChjbWRsaW5lLT5zcGVjaWZpZWQgJiYgY21kbGluZS0+cm90YXRp
b25fcmVmbGVjdGlvbikgewogICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNtZGxpbmVfcmVz
dCwgcGFuZWxfcmVzdDsKICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjbWRsaW5lX3JvdCwg
cGFuZWxfcm90OwogICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN1bV9yb3QsIHN1bV9yZXN0
OwoKQW5kIGxvb2tzIGxpa2UgdGhlcmUgaXMgYW5vdGhlciBwcm9ibGVtIGhlcmUuLiB0aGUgY21k
bGluZSdzIHJvdGF0aW9uCm92ZXJyaWRlcyAqYWxsKiBtb2RlcyB3aGlsZSB0aGUgZG9jL2ZiL21v
ZGVkYi5yc3QgY2xhaW1zIHRoYXQgcm90YXRpb24KaXMgYXBwbGllZCBvbmx5IHRvIHRoZSAqaW5p
dGlhbCogbW9kZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
