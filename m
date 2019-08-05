Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992382437
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 19:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306B6E11B;
	Mon,  5 Aug 2019 17:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2687D6E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 17:47:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so79568803edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 10:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9S8AlMekyEUqIxhioWRibaejvxmTMMHBEjS3mzZRPM=;
 b=WSK2HDJ2MpsC3rdRMRy84jlphCtO+IuqDD8GUKokddmE23aTQSgqywx5XyPmOF0JWl
 w41/ZFGF/nTUKpetxPFqErfoFsIruXz8hbwUe6yqlAz2NAbfskUYwI7p2pIsFTLZc15k
 1Dkw/3CAFe0NRhKKocPPM4MHlZGDDv21MrMi+gV1BuyU3RFozba8dOHINWN/J/SOmPKk
 wyOcM1Mo22riaoMatyv9aRfsi8D6wPoGDhiGijCzmSOE8+BRtVkyGQVF3HPjXWFp667o
 V/pK1qzSYjiP5giGcbcLXikbgLxtGz9gbsUifRF5RTQxwrIjft+qb7pgYICmtgu95KPR
 0QlQ==
X-Gm-Message-State: APjAAAV94Ew7PPecnm5N0KgwkSXdxSHKil/wS4t9REkqS9MBohB05Q/g
 M4FLyaMCawi2CXmoWi9ukQ/2XphXforwaJs0nHk=
X-Google-Smtp-Source: APXvYqz704vU/EmmUdJBQe0lh6+sMROBwFIGysXrFoIeQD0wNh7ezV6E0x1IRGZpYeCy3YpzPE/wT+Z131wtRMA0kd0=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr120977033ejj.192.1565027246645; 
 Mon, 05 Aug 2019 10:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190805143358.21245-1-robh@kernel.org>
 <20190805163526.GV7444@phenom.ffwll.local>
In-Reply-To: <20190805163526.GV7444@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Aug 2019 10:47:14 -0700
Message-ID: <CAF6AEGtKS4V_CHiYwdUB+USw772n7GVb_sHOoVQ2dDHRxyaU+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: Add madvise state and purge helpers
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=O9S8AlMekyEUqIxhioWRibaejvxmTMMHBEjS3mzZRPM=;
 b=YSYHpfgGoUM9SvtnlG2b6wOOjpiRc+BDnedM9CYGoUaDchhFW0BZ4WJjkYddqgWVpP
 LMkDm1GPMoF85yfhK4In4RRochoWVV2Nw8ErwdTIyjCUdGtuY+VyEfGRYt/IE5knVxBr
 DIaik2luDvxAbq5/htHBTb3Y55luZ0ZtlGe3qlRO65zWyjKJkgVueJMJ23Bl2Rpb8Yl4
 +0mo7goQEj4ejDtb10iXmuHdrY7HlHWyTckmt2HXLdlc5kldzVvCMWgrh6bC98dSXgC5
 vmXr+cp2/l/87Z78Jskg7wtaSht2/pJY2rksci6tQId9zW75QaKEhSQbJb+7arDNfMWB
 2eXg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCA5OjM1IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwODozMzo1N0FNIC0wNjAw
LCBSb2IgSGVycmluZyB3cm90ZToKPiA+IEFkZCBzdXBwb3J0IHRvIHRoZSBzaG1lbSBHRU0gaGVs
cGVycyBmb3IgdHJhY2tpbmcgbWFkdmlzZSBzdGF0ZSBhbmQKPiA+IHB1cmdpbmcgcGFnZXMuIFRo
aXMgaXMgYmFzZWQgb24gdGhlIG1zbSBpbXBsZW1lbnRhdGlvbi4KPiA+Cj4gPiBUaGUgQk8gcHJv
dmlkZXMgYSBsaXN0X2hlYWQsIGJ1dCB0aGUgbGlzdCBtYW5hZ2VtZW50IGlzIGhhbmRsZWQgb3V0
c2lkZQo+ID4gb2YgdGhlIHNobWVtIGhlbHBlcnMgYXMgdGhlcmUgYXJlIGRpZmZlcmVudCBsb2Nr
aW5nIHJlcXVpcmVtZW50cy4KPiA+Cj4gPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29A
Y29sbGFib3JhLmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
Ym9vdGxpbi5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+ID4g
U2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgNTcgKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oICAg
ICB8IDE1ICsrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4gaW5kZXggMmY2NDY2
N2FjODA1Li40YjQ0MjU3NmRlMWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMKPiA+IEBAIC03NSw2ICs3NSw3IEBAIHN0cnVjdCBkcm1fZ2VtX3NobWVtX29i
amVjdCAqZHJtX2dlbV9zaG1lbV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90
Cj4gPiAgICAgICBzaG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7Cj4gPiAgICAgICBt
dXRleF9pbml0KCZzaG1lbS0+cGFnZXNfbG9jayk7Cj4gPiAgICAgICBtdXRleF9pbml0KCZzaG1l
bS0+dm1hcF9sb2NrKTsKPgo+IE1heWJlIGEgYml0IGxhdGUsIGJ1dCBmb3IgcmVhc29ucyAoaW50
ZXJvcCB3aXRoIHR0bSwgd2hpY2ggd2lsbCBiZSBtb3JlCj4gaW1wb3J0YW50IG9uY2Ugd2UgaGF2
ZSBkeW5hbWljIGRtYS1idWYpIGl0IHdvdWxkIGJlIHJlYWwgbmljZSB0byB1c2UgdGhlCj4gcmVz
ZXJ2YXRpb25fb2JqIGxvY2sgZm9yIGFsbCB0aGlzIHN0dWZmLiBtc20sIGJlaW5nIHN0cnVjdF9t
dXRleCBiYXNlZCwKPiBpc24ndCBhIGdyZWF0IGV4YW1wbGUgaGVyZS4gVGhlIGRvd25zaWRlIGlz
IHRoYXQgaXQgd2lsbCBiZSBhIGxvdCBoYXJkZXIKPiB0byBnZXQgIG1zbSB0byB1c2UgdGhlc2Ug
dGhlbiwgYnV0IG11Y2ggYmV0dGVyIHRvIG5vdCBzcHJlYWQgc3RydWN0X211dGV4Cj4gaW5zcGly
ZWQgbG9ja2luZyB0b28gZmFyLgo+CgpidXQgc29tZXdoZXJlIHlvdSBuZWVkIHRvIHByb3RlY3Qg
YWNjZXNzIHRvIGxpc3Qgb2YgYm8ncyB0aGF0IGFyZQphdmFpbGFibGUgdG8gc2hyaW5rLi4gaWly
YyB0aGF0IGlzIHRoZSBvbmx5IHRoaW5nIHdlIHNob3VsZCBuZWVkCnN0cnVjdF9tdXRleCBmb3Ig
bm93IGluIHNocmlua2VyIHBhdGggaW4gZHJtL21zbS4gIFRoZSBwZXItYm8gc3RhdGUgaXMKcHJv
dGVjdGVkIGJ5IGEgcGVyLWJvIGxvY2suCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
