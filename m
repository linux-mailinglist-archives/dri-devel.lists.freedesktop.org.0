Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D4114760
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 19:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC25D6E15A;
	Thu,  5 Dec 2019 18:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD076E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 18:58:01 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id x123so3191918vsc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 10:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySurgiLPA/iBZA3Usvb4s+YC+CC71meOhpyGKDWlJag=;
 b=hbpKPyDhlOsiUYZpz6XbFP9Nda6X9zt+I8bXjsnTLr9MQXjHr/slNs3hPcXnhpxt2J
 PE0ViSSF2koGtzWu6NR1locOfRWEqBQNfh7FOESOvYuFyOaqn+Q09CRUS4vrLT4X5KsE
 BvaclDu6BOK/aB1bJJuXIspwEkGO/2M+YAOecO9GvTwqsAF7vLfr7+oFNTOh0MMK+1tF
 zYaMhP7fbXHAi+wEsCHbw9D4S2AEfp671X/xBSbTgNTCYZlbXkIrx0VxdFZe5km4NGxZ
 jodQSebZNrYbpJPJXzmHOcn5i56l3p61tPCKERhwTLurp+gqp2YnloZUoRBffNXV8KbA
 KaKw==
X-Gm-Message-State: APjAAAVcwt89/iIMhyY5s2PpdLNFAP9xnJUDXejIvuAjpsw838cEguTb
 h6mRPDsS7BWO3iETHGUMGOTX2Wki8AbXl7wX3To=
X-Google-Smtp-Source: APXvYqwbpmreMqJ9zAIUjvhHeEQ+rRAIqWIdo6z27M2shRY8YniZd/1Zs8u2TEA6Xz/vVJR3SFWFWeqPkSbQ0Q/H5Tc=
X-Received: by 2002:a67:d592:: with SMTP id m18mr6779569vsj.85.1575572280972; 
 Thu, 05 Dec 2019 10:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20191205160142.3588-1-tzimmermann@suse.de>
 <20191205160142.3588-4-tzimmermann@suse.de>
 <20191205172515.GA24782@ravnborg.org>
 <70c025d1-4797-a33a-3acb-43f5b55230c0@suse.de>
In-Reply-To: <70c025d1-4797-a33a-3acb-43f5b55230c0@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 5 Dec 2019 18:56:55 +0000
Message-ID: <CACvgo50+NXVTfmv9Anpd6_porFU2KTd9tHbLuQN234NPV=NzBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/mgag200: Add vblank support
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ySurgiLPA/iBZA3Usvb4s+YC+CC71meOhpyGKDWlJag=;
 b=J5NVqyLDcJ0bl/+oRLmlVHe/ktQwgGF/cLILX47e396OXaX9n8hKaY5T2z4FSE5fYO
 DOdUNnUNgPUBba5iS1lgDSxSpmg1zQ25SszRP1ipPBLpT5u/3LAD4+daxxRzjyJJ6Jy9
 VNr/SxCOjv2Q3/yVoiiuDmHJ3ogfUnlUwdkiGmUt9jeVIUjzWS4svzIZwJ+qGhxVY+IY
 bKgf9y3KEmDpCDYAb37OU+pVxFr43Xmz/PCEyaX28mi9KHq+PmGTC4+w6UrzZoBEMJY3
 Y5bq16jOUz9i0V/v6O50cwdid03nCzYSMXQpzM/3+vp9e9s8sKnsiaK8pFiF88FbN80X
 6o3A==
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
Cc: rong.a.chen@intel.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, ying.huang@intel.com,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA1IERlYyAyMDE5IGF0IDE4OjI4LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cgo+ID4+ICsvKiBJbnRlcnJ1cHQgZmllbGRzICovCj4gPj4gKyNk
ZWZpbmUgTUdBX1ZMSU5FUEVOICAgICAgICAgICAgICAgICgweDAxIDw8IDUpCj4gPj4gKyNkZWZp
bmUgTUdBX1ZMSU5FQ0xSICAgICAgICAgICAgICAgICgweDAxIDw8IDUpCj4gPj4gKyNkZWZpbmUg
TUdBX1ZMSU5FSUVOICAgICAgICAgICAgICAgICgweDAxIDw8IDUpCj4gPiBVc2UgQklUKDUpPwo+
ID4gVGhlIGJpdGZpZWxkIG5hbWUgY291bGQgYmUgbW9yZSByZWFkYWJsZSBpZiB0aGV5IGluY2x1
ZGVkIHRoZSByZWdpc3Rlcgo+ID4gbmFtZS4KPiA+IEV4YW1wbGU6Cj4gPiAjZGVmaW5lIE1HQV9T
VEFUVVNfVkxJTkVQRU4gICBCSVQoNSkKPiA+ICNkZWZpbmUgTUdBX0lDTEVBUl9WTElORUNMUiAg
IEJJVCg1KQo+ID4gI2RlZmluZSBNR0FfSUVOX1ZMSU5FSUVOICAgICAgQklUKDUpCj4KPiBPaCwg
Z29vZCBwb2ludC4gSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcyBtYWNyby4KPgpXaGlsZSBhdCBpdCwg
cGxlYXNlIGtlZXAgYml0ZmllbGRzIGNsb3NlIHRvIHRoZSByZXNwZWN0aXZlIHJlZ2lzdGVycy4K
CkRvbid0IGtub3cgbXVjaCBhYm91dCB0aGUgZHJpdmVyIHRvIHJldmlldyB0aGlzLCBmb3IgMSYy
ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoK
SSdsbCBsb29rIGF0IDQvNCBmaXJzdCB0aGluZyB0b21vcnJvdy4KClRoYW5rcwoKRW1pbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
