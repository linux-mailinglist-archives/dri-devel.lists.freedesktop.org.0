Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8210397A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60A86E3DB;
	Wed, 20 Nov 2019 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C59A6E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:04:49 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c19so20943233otr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 04:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfzltuCMioiMhsJan+pFF7hMv0Mujg7DZocI0D+ls7o=;
 b=qSp2adYUod6NGBvYVi1z6u/BhNYXMxxlBF+gWKUyLYiSaXEaf6k3H75iMBtqWXr16/
 M0IUTRGnwOmbiVQ4zmahSWpGnyqwR7RGr6EwEikHQprdbcJuprbhByRY4XH1PWyRRsli
 YAblEsru3tR1fwez40kaBZnl/hiPPzEbx550o9TYmqD40KuD6dmtQ29+qGJpiSjYd6mj
 lCNEtrvk/bk11jUJbnb9fH/SFdrWAhzCKrBwvduaFMKha6kFhZtnmvBay5iGTYMcbM4Y
 8O3aoDGSo8+s1zAR7haafIWhevSDemM+JYr6c+hrGKd4vZbZm9T1wCRIfQxCg9UpQ+i2
 pHAg==
X-Gm-Message-State: APjAAAUmNvZZNSVrAf07Vh7/wc0B0lwSfjNDLughXziy/S3upDi7h2b/
 vG0oVhwR5Erlw2cMZnPshdqu5+mX7YuIhQ+I6/3xGQ==
X-Google-Smtp-Source: APXvYqwZZLuPMlRSpvHPHJ5ujOuA+RNnHUnEkwMXacTeDGPfVvlLiHyVPuASCqbaoRKxz1k+VeQiaB8fYoIzgqgTdmo=
X-Received: by 2002:a9d:6649:: with SMTP id q9mr1676026otm.106.1574251488306; 
 Wed, 20 Nov 2019 04:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
In-Reply-To: <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Nov 2019 13:04:37 +0100
Message-ID: <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RfzltuCMioiMhsJan+pFF7hMv0Mujg7DZocI0D+ls7o=;
 b=STv1dBMOUs+hjgiMBMN43ijXW0coG5K613PkCFqoUFS0qnzFqVMZ0gc9oFtp9BubsW
 +Z/W8cbYGEvLhS5wHKNLZ8FTEagqrBdc4MQvqvBr249AERCwt9I2EIF5cWg176QrIZa4
 8lpKFDvcVvmzheixG3qYpLjahCgWsxKGv5OpE=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NDAgUE0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gICBIaSwKPgo+ID4gPiBBbnl0aGluZyBidWlsZGluZyBvbiBz
aG1lbSBoZWxwZXJzIHNob3VsZCBiZSBhYmxlIHRvIHVzZQo+ID4gPiBvYmotPmZpbHAtPmZfbWFw
cGluZywgcmlnaHQ/ICBTbyBhbGxvY2F0aW5nIGFuIGlub2RlIHVuY29uZGl0aW9uYWxseQo+ID4g
PiBkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QgcGxhbi4KPiA+Cj4gPiBOb3Qgc3VyZSB0aGUgc2ht
ZW0gaGVscGVycyBmb3J3YXJkIHRoZSBtbWFwIHRvIHRoZSB1bmRlcmx5aW5nIHNobWVtIGZpbGUs
Cj4gPiBzbyBub3Qgc3VyZSB0aGlzIGlzIHRoZSBncmVhdGVzdCB3YXkgZWl0aGVyLgo+Cj4gSSB0
aGluayBzbywgc2htZW0gaGVscGVycyBhbHJlYWR5IHphcCB0aGUgZmFrZSBvZmZzZXQsIGFuZCB0
aGlzIHdvdWxkCj4gbm90IHdvcmsgd2l0aG91dCBwZXItb2JqZWN0IGFkZHJlc3Mgc3BhY2UgSSB0
aGluay4KClRoYXQncyB3aHkgSSB0aGluayBzaG1lbSBoZWxwZXJzIGhhdmUgYSBwcm9ibGVtIHJp
Z2h0IG5vdywgYW5kIHdoeQppdCdzIHByb2JhYmx5IGJlc3QgdG8gZ28gYmFjayB0byB0aGUgZmFr
ZSBvZmZzZXQgZm9yIGV2ZXJ5dGhpbmcuIEJ1dAp3ZSBzZWVtIHRvIGhhdmUgbG9zdCBSb2IgSGVy
cmluZyBpbiBhbGwgdGhpcyB0aHJlYWQsIHNvIHJlYWRkaW5nIGhpbS4KCj4gPiA+IEd1ZXNzIEkn
bGwgZ28gbG9vayBhdCB0dG0tbG9jYWwgY2hhbmdlcyBmb3Igc3RhcnRlcnMgYW5kIHNlZSBob3cg
aXQKPiA+ID4gZ29lcy4KPiA+Cj4gPiBJIHRoaW5rIGZvciB0dG0ganVzdCBjb25zaXN0ZW50bHkg
dXNpbmcgdGhlIG9uZSBwZXItZGV2aWNlIG1hcHBpbmcgZm9yCj4gPiBldmVyeXRoaW5nLCB3aXRo
IGFsbCB0aGUgZmFrZSBvZmZzZXRzLCBpcyBwcm9iYWJseSB0aGUgcXVpY2tlc3Qgcm91dGUuCj4K
PiBIbW0sIG5vdCBjbGVhciBob3cgdG8gZml0IGRtYWJ1ZnMgaW50byB0aGlzLiAgZG1hYnVmcyBh
bHJlYWR5IGhhdmUgdGhlaXIKPiBvd24gZmlsZSwgaW5vZGUgYW5kIGFkZHJlc3Mgc3BhY2UuICBJ
J20gbm90IHN1cmUgeW91IGNhbiBzd2l0Y2ggdGhhdAo+IG92ZXIgdG8gdGhlIHBlci1kZXZpY2Ug
bWFwcGluZyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCBldmVuIGlmIHlvdSBjYW4gSQo+IGhhdmUg
bXkgZG91YnRzIHRoaXMgaXMgYSBnb29kIGlkZWEgZnJvbSBhIHNlY3VyaXR5IHBvaW50IG9mIHZp
ZXcgLi4uCgpZb3UgY2FuIChwbGVudHkgZHJpdmVycyBkbyB0aGF0IGFscmVhZHkpLCBhbmQgbm90
IHN1cmUgaG93IHRoYXQgYnJlYWtzCnNlY3VyaXR5PyBJbW8gaXQncyBtb3JlIGNvbnNpc3RlbnQs
IHNpbmNlIGV2ZXJ5dGhpbmcgZW5kcyB1cCBwb2ludGluZwp0byB0aGUgc2FtZSB1bmRlcmx5aW5n
IHJlc291cmNlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
