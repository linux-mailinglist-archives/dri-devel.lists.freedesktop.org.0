Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62121104E54
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36E6EBB5;
	Thu, 21 Nov 2019 08:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509E6EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:49:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z19so2713055wmk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 00:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ygT0P7bSNN3eRBoofkgWyTnP+RqpT5M81G4ZaKOyNws=;
 b=LXsfmCj7ZIl/3i4lw06qxZggVsiJLIYstn/p3r4yZwD8E4YyAF6i0UdshNP64zE9yE
 dkWUeoWv0IfXv1LGuWaLdKthcRCm6xa9VrbDHLhg6VeUa5UYE7+VZQ+Weru2a+ZVDA8K
 L7BXPKxZxs4Tg1WKexpwB7mtGzo8k0A7wgeS7vA509CWlm6y/qHAuaeKQIKL03sHNCJO
 G2zRbYBxG3wDILeXKwoipxsFWXAr0rurDe9dTB4pYu6Zrnn5Ym6G0Gvss+5HxofEAVR+
 ef7CY8WSoHPEjDV1RHjp7ITuK1RuQe+hoLDfa3BLLL0I4WL0YG1XPx4KEFuNhc7tvzRE
 VFIQ==
X-Gm-Message-State: APjAAAV1eKZbxZd+kRHfLQtIDplSPd1DHzH2mIjjblZTWvUJ/1EBHOJH
 Ja6arHsjH2We4prpZkq+MbUH+A==
X-Google-Smtp-Source: APXvYqwA1xS4hGB5xlFLKy9XZjS3QBht1yqP+A1T0QdDbN9nRTOeDD3S0Y2hgfUtXsD1eb11SXQVjg==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr6518291wmj.94.1574326196820; 
 Thu, 21 Nov 2019 00:49:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z9sm2417929wrv.35.2019.11.21.00.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 00:49:55 -0800 (PST)
Date: Thu, 21 Nov 2019 09:49:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191121084953.GB6236@phenom.ffwll.local>
References: <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191121080259.7szddrq2bkecif7b@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121080259.7szddrq2bkecif7b@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ygT0P7bSNN3eRBoofkgWyTnP+RqpT5M81G4ZaKOyNws=;
 b=DgFcJY+ZaAuR8SBkeHlyZZIOhG4c9bhhTBM6V22anh7AX50YUPBDTp9wK2xx5wDSNM
 xO4l59LF8kBvmhQwAkLgUYLxvTMRm2z/ygkNJNo7xvkV0ho3tYhMne5RI8LJu9kIzYiE
 PYwbUHpoRlXKIOHBGe9Spk/sgRdRGPtEBQmH0=
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6MDI6NTlBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiB1cGRhdGUtb2JqZWN0LWFmdGVyLW1vdmUgd29ya3MgZmlu
ZS4KPiA+ID4gCj4gPiA+IHRyeSB6YXAgbWFwcGluZ3Mgd2l0aCBtYWR2aXNlKGRvbnRuZWVkKSBo
YXMgbm8gYmFkIGVmZmVjdHMgKGFmdGVyIHZyYW0KPiA+ID4gbW92ZSwgdHJ5aW5nIHRvIGZvcmNl
IHJlLWNyZWF0aW5nIHRoZSBwdGVzKS4KPiA+IAo+ID4gV2VsbCBpZiBpdCdzIGJyb2tlbiB0aGUg
emFwcGluZyB3b3VsZG4ndCB3b3JrIDotKQo+ID4gCj4gPiA+IGRpZG4ndCB0cnkgdGhlIG1lbW9y
eSBwcmVzc3VyZSB0aGluZyB5ZXQuCj4gPiAKPiA+IEknbSBzdXJwcmlzZWQgLi4uIGFuZCBJIGhh
dmUgbm8gaWRlYSBob3cvd2h5IGl0IGtlZXBzIHdvcmtpbmcuCj4gPiAKPiA+IEZvciBteSBwYXJh
bm9pYSwgY2FuIHlvdSBpbnN0cnVtZW50IHRoZSB0dG0gcGFnZSBmYXVsdCBoYW5kbGVyLCBhbmQg
ZG91YmxlCj4gPiBjaGVjayB0aGF0IHdlIGdldCBuZXcgZmF1bHRzIGFmdGVyIHRoZSBtb3ZlLCBh
bmQgc2V0IHVwIG5ldyBwdGVzIGZvciB0aGUKPiA+IHNhbWUgb2xkIG1hcHBpbmcsIGJ1dCBub3cg
cG9pbnRpbmcgYXQgdGhlIG5ldyBwbGFjZSBpbiB2cmFtPwo+IAo+IEhtbSwgb25seSB0aGUgZHJt
IGRldmljZSBtYXBwaW5nIGlzIGZhdWx0ZWQgaW4gYWZ0ZXIgbW92aW5nIGl0LAo+IHRoZSBkbWEt
YnVmIG1hcHBpbmcgaXMgbm90LiAgRml4ZWQgYnk6CgpBaCB5ZXMsIHRoYXQncyBtb3JlIHdoYXQg
SSdkIGV4cGVjdCB0byBoYXBwZW4sIGFuZCB0aGUgYmVsb3cgaXMgd2hhdCBJJ2QKZXhwZWN0IHRv
IGZpeCB0aGluZ3MgdXAuIEkgdGhpbmsgd2Ugc2hvdWxkIG1vdmUgaXQgdXAgYWhlYWQgb2YgdGhl
IGRldmljZQpjYWxsYmFjayAoc28gdGhhdCBkcml2ZXJzIGNhbiBvdmVyd3JpdGUpIGFuZCB0aGVu
IHB1c2ggYXMgYSBmaXguIFNlcGFyYXRlCmZyb20gYSBwb3NzaWJsZSBwYXRjaCB0byB1bmRvIHRo
ZSBmYWtlIG9mZnNldCByZW1vdmFsLgotRGFuaWVsCgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tIGN1dCBoZXJlIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEZyb20gM2E3ZjZjNmRi
ZjNiMWU0YjQxMmMyYjI4M2IyZWE0ZWRmZjlmMzNiNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
PiBGcm9tOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBEYXRlOiBUaHUsIDIx
IE5vdiAyMDE5IDA4OjM5OjE3ICswMTAwCj4gU3ViamVjdDogW1BBVENIXSBkcm06IHNoYXJlIGFk
ZHJlc3Mgc3BhY2UgZm9yIGRtYSBidWZzCj4gCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+IGluZGV4IDA4MTQyMTFiMGYzZi4uMDdjODhk
MmFlZGVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+IEBAIC0yNDAsNiArMjQwLDcgQEAgdm9pZCBk
cm1fcHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoc3RydWN0IGRybV9wcmltZV9maWxlX3ByaXZh
dGUgKnByaW1lX2Zwcml2KQo+ICBzdHJ1Y3QgZG1hX2J1ZiAqZHJtX2dlbV9kbWFidWZfZXhwb3J0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCQkgICAgICBzdHJ1Y3QgZG1hX2J1Zl9leHBv
cnRfaW5mbyAqZXhwX2luZm8pCj4gIHsKPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0g
ZXhwX2luZm8tPnByaXY7Cj4gIAlzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZjsKPiAgCj4gIAlkbWFf
YnVmID0gZG1hX2J1Zl9leHBvcnQoZXhwX2luZm8pOwo+IEBAIC0yNDcsNyArMjQ4LDggQEAgc3Ry
dWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ICAJCXJldHVybiBkbWFfYnVmOwo+ICAKPiAgCWRybV9kZXZfZ2V0KGRldik7Cj4gLQlkcm1f
Z2VtX29iamVjdF9nZXQoZXhwX2luZm8tPnByaXYpOwo+ICsJZHJtX2dlbV9vYmplY3RfZ2V0KG9i
aik7Cj4gKwlkbWFfYnVmLT5maWxlLT5mX21hcHBpbmcgPSBvYmotPmRldi0+YW5vbl9pbm9kZS0+
aV9tYXBwaW5nOwo+ICAKPiAgCXJldHVybiBkbWFfYnVmOwo+ICB9Cj4gLS0gCj4gMi4xOC4xCj4g
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gY3V0IGhlcmUgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gCj4gZ2l0IGJyYW5jaDogaHR0cHM6Ly9naXQua3JheGVsLm9yZy9jZ2l0L2xpbnV4
L2xvZy8/aD1kcm0tbW1hcC1kZWJ1Zwo+IAo+IGNoZWVycywKPiAgIEdlcmQKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
