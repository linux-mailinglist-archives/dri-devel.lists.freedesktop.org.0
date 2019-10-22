Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF12E00DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77CD6E478;
	Tue, 22 Oct 2019 09:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5F6E478
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:36:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w18so16688238wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=/YqXqHk50UmDNEMYXTSHPPhm4w8EIzR88JCsr5CRoHs=;
 b=qf0F8dav+dkwFN0ymZre//2mhYSLmrmxsMmpqYQ5+nIXh2gqds9rJ1LM/OqnzeohGL
 MnvB8t2OZsx7p/RxNZ099gV8DSqMnl6n1P9YJnxigdTpLSkV+sYav8o3FyhucJgxSJ4A
 6o+HtCpAh7yeOeAWx2gdhhQmTeXJn3B4i1fn05X/x6nvmNR5mb24/MKL/gwJ3ur2Uonk
 qmicnnbSREGK5oFdwj0AuoMhJkhnzu1SDREfuQpIG6wYDda/Uqph1P90P0GTyiOWf54U
 yNIxYawlci6rHN3g+4OCVzqvt+tcCGUuahybBCW+LG6gc79NBi55LuVKAAiIcuffuX6b
 f6HQ==
X-Gm-Message-State: APjAAAXiiTe2mTh3ogJO397FmE6q2mUdxHiMfQ1uAZ8Kz8Xyh3fq9BgP
 lqSkX51i3WSow3BghH+2I59yOA==
X-Google-Smtp-Source: APXvYqx+JFyqVszkw5BCqDalJWIVq/o7Yqx3WGohJsD0fVYT2Ap02/oIbKtgTtyZt/Vvwhfl85iaeA==
X-Received: by 2002:adf:92e7:: with SMTP id 94mr2748992wrn.199.1571737016806; 
 Tue, 22 Oct 2019 02:36:56 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u26sm18652968wrd.87.2019.10.22.02.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:36:55 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:36:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Message-ID: <20191022093654.GF11828@phenom.ffwll.local>
Mail-Followup-To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021185250.26130-1-navid.emamdoost@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/YqXqHk50UmDNEMYXTSHPPhm4w8EIzR88JCsr5CRoHs=;
 b=aGVHsYgnTUvSzWqxkgDanmOAat4LYpbPxLmx2ADBlcbzp7QiYvVsQnpy8U4e9sdlqk
 r4T+Mtq7tgm0lj8K12o6lyV6AithxP6WkNF/WaL4ZRc7hWiQiKGVft9Y5ktPWjQD7bBm
 zP/z3wGQr4utEDtjRQmJ3PwIsly2omlqgMho4=
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emamd001@umn.edu, smccaman@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDE6NTI6NDlQTSAtMDUwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IEluIHRoZSBpbXBlbGVtZW50YXRpb24gb2YgdjNkX3N1Ym1pdF9jbF9pb2N0bCgp
IHRoZXJlIGFyZSB0d28gbWVtb3J5Cj4gbGVha3MuIE9uZSBpcyB3aGVuIGFsbG9jYXRpb24gZm9y
IGJpbiBmYWlscywgYW5kIHRoZSBvdGhlciBpcyB3aGVuIGJpbgo+IGluaXRpYWxpemF0aW9uIGZh
aWxzLiBJZiBrY2FsbG9jIGZhaWxzIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgYmluIHRoZW4KPiBy
ZW5kZXItPmJhc2Ugc2hvdWxkIGJlIHB1dC4gQWxzbywgaWYgdjNkX2pvYl9pbml0KCkgZmFpbHMg
dG8gaW5pdGlhbGl6ZQo+IGJpbi0+YmFzZSB0aGVuIGFsbG9jYXRlZCBtZW1vcnkgZm9yIGJpbiBz
aG91bGQgYmUgcmVsZWFzZWQuCj4gCj4gRml4ZXM6IGE3ODNhMDllZTc2ZCAoImRybS92M2Q6IFJl
ZmFjdG9yIGpvYiBtYW5hZ2VtZW50LiIpCj4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0
IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdjNk
L3YzZF9nZW0uYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCj4gaW5kZXggNWQ4MDUwN2I1Mzli
Li4xOWMwOTJkNzUyNjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2Vt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+IEBAIC01NTcsMTMgKzU1
NywxNiBAQCB2M2Rfc3VibWl0X2NsX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4gIAo+ICAJaWYgKGFyZ3MtPmJjbF9zdGFydCAhPSBhcmdzLT5iY2xfZW5kKSB7Cj4g
IAkJYmluID0ga2NhbGxvYygxLCBzaXplb2YoKmJpbiksIEdGUF9LRVJORUwpOwo+IC0JCWlmICgh
YmluKQo+ICsJCWlmICghYmluKSB7Cj4gKwkJCXYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOwoK
VGhlIGpvYiBpc24ndCBpbml0aWFsaXplZCB5ZXQsIHRoaXMgZG9lc24ndCB3b3JrLgoKPiAgCQkJ
cmV0dXJuIC1FTk9NRU07Cj4gKwkJfQo+ICAKPiAgCQlyZXQgPSB2M2Rfam9iX2luaXQodjNkLCBm
aWxlX3ByaXYsICZiaW4tPmJhc2UsCj4gIAkJCQkgICB2M2Rfam9iX2ZyZWUsIGFyZ3MtPmluX3N5
bmNfYmNsKTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCXYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2Up
OwoKdjNkX2pvYl9wdXQgd2lsbCBjYWxsIGtmcmVlLCBpZiB5b3UgY2hhc2UgdGhlIGNhbGxjaGFp
biBsb25nIGVub3VnaCAoaW4KdjNkX2pvYl9mcmVlKS4gU28gbm8gYnVnIGhlcmUsIHRoaXMgd291
bGQgbGVhZCB0byBhIGRvdWJsZSBrZnJlZSBhbmQKY3Jhc2guCi1EYW5pZWwKCj4gKwkJCWtmcmVl
KGJpbik7Cj4gIAkJCXJldHVybiByZXQ7Cj4gIAkJfQo+ICAKPiAtLSAKPiAyLjE3LjEKPiAKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
