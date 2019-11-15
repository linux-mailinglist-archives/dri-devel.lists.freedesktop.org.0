Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D3FDB19
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D23F6E3B5;
	Fri, 15 Nov 2019 10:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8D6E3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 10:18:40 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r24so7574061otk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 02:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xt9PTV2+0NtCY5liQdP+iM6k7LiWhChZb5VQ7/lD/s8=;
 b=H7Cw9B305pHJlzvQSLaQGwUN6j8SrFT+QXnYyl55Uu84swi6j/O0OybyRbuxrI7fPN
 jNpo5V1iwgBDzjmMHhlQtxMETRcmfIZIhGzNtW8ZPWcj9wb7jYZwg6z1vs+ohiMIUGWs
 MwTglh7dihNmJOWkxau42bWOvNu9EuW94hQ3XFS+lhDQn02/0rwqb2v4Lh1k3GzZhBQl
 Yp86/s6v1Ek+CYxZ7OkEw+JlUSp0UyHA2UL80/GHMcW57mzIEWxvmpNLvBwaf4GesBoC
 a5dKFfCrYZhhnrE4bpnLvREOBRerc30CajBtTwOXwYiaR8ZW/JM6RKDolKwpWCGrDb5Y
 wGew==
X-Gm-Message-State: APjAAAUzI30uYaRJlaOBI9vXxWJB9JXNz41LPSfP42Cy/QqfCiPhnDq4
 +NJB/80B9CvPD8hGSFh4Ldu3HDPWRPxj/MOqcHyVMA==
X-Google-Smtp-Source: APXvYqxYzFCXrz8a1khWBGAqpy54Q4T8CNbTk5EQbF3sBamdT6mhkEFxVYII+eSS4EDUY6RlZ/UMQp54DE4hgAgGtfA=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr11378530otc.188.1573813120125; 
 Fri, 15 Nov 2019 02:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
In-Reply-To: <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Nov 2019 11:18:28 +0100
Message-ID: <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Xt9PTV2+0NtCY5liQdP+iM6k7LiWhChZb5VQ7/lD/s8=;
 b=VcEFiqFKgYepQmYrVW4EvBXmKEX3KryxchOn6stu6riEENCvx/kAAYcZOQXsmvOcbz
 mbMZwcoVUCi3JwnyXgmrj/GzXeEyhqISIuVkEXQTP6F0yVouFQkT948900xFVgUtXz+e
 ws7U3BI3Vc62wVTv1ZPVJDbNgVkbf+cUJAFJE=
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

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MzcgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gPiBZb3UgbmVlZCBtZW1vcnkgcHJlc3N1cmUsIHRvIGZvcmNl
IHR0bSB0byB1bm1hcCB0aGUgYm8sIG5vdCB1c2Vyc3BhY2UuIFNvCj4gPiByb3VnaGx5Cj4gPiAx
LiBjcmVhdGUgYm8KPiA+IDIuIG1tYXAgaXQgdGhyb3VnaCBkcm0gZmQsIHdyaXRlIHNvbWUgc3R1
ZmYKPiA+IDMuIGV4cG9ydCB0byBkbWEtYnVmLCBtbWFwIGl0LCB2ZXJpZnkgc3R1ZmYgaXMgdGhl
cmUKPiA+IDQuIGNyZWF0ZSBhIHBpbGUgbW9yZSBibywgbW1hcCB0aGVtIHdyaXRlIHRvIHRoZW0K
PiA+IDUuIG9uY2UgeW91J3ZlIHRocmFzaGVkIGFsbCBvZiB2cmFtIGVub3VnaCwgcmVjaGVjayB5
b3VyIG9yaWdpbmFsIGJvLiBJZgo+ID4gSSdtIHJpZ2h0IHlvdSBzaG91bGQgZ2V0IHRoZSBmb2xs
b3dpbmc6Cj4gPiAgICAtIGRybSBmZCBtbWFwIHN0aWxsIHNob3cgcmlnaHQgY29udGVudAo+ID4g
ICAgLSBkbWEtYnVmIGZkIG1tYXAgc2hvd3MgcmFuZG9tIGNyYXAgdGhhdCB5b3UndmUgd3JpdHRl
biBpbnRvIG90aGVyCj4gPiAgICAgIGJ1ZmZlcnMKPiA+Cj4gPiBPZmMgeW91IG5lZWQgdG8gbWFr
ZSBzdXJlIHRoYXQgYW4gbW1hcCBhY3R1YWxseSBmb3JjZXMgdGhlIGJ1ZmZlciBpbnRvCj4gPiB2
cmFtLiBTbyBtaWdodCBuZWVkIGEgY29tYm8gb2YgbW9kZXNldCttbWFwLCB0byBtYWtlIHRoYXQg
aGFwcGVuLiBQbGFpbgo+ID4gbW1hcCBtaWdodCBqdXN0IGdpdmUgeW91IHB0ZXMgdGhhdCBwb2lu
dCBpbnRvIHN5c3RlbSBtZW1vcnksIHdoaWNoIGlzIG5vdAo+ID4gbWFuYWdlZCBieSB0dG0gbGlr
ZSB2cmFtLgo+Cj4gSXMgYW55IG1vdmUgYnVmZmVyIGdvb2QgZW5vdWdoIHRvIHRyaWdnZXIgdGhp
cywgaS5lLiB3aWxsIFNZU1RFTSAtPiBWUkFNCj4gd29yayB0b28/ICBUaGF0J2xsIGJlIGVhc2ll
ciBiZWNhdXNlIGFsbCBJIG5lZWQgdG8gZG8gaXMgbWFwIHRoZSBidWZmZXIKPiB0byBhIGNydGMg
dG8gZm9yY2UgcGlubmluZyB0byB2cmFtLCB0aGVuIGNoZWNrIGlmIHRoZSBtYXBwaW5ncyBhcmUK
PiBpbnRhY3Qgc3RpbGwgLi4uCgpJIHRoaW5rIHRoYXQgc2hvdWxkIHdvcmsgdG9vLiBKdXN0IG1h
a2Ugc3VyZSB5b3UgYWN0dWFsbHkgd3JpdGUKdGhyb3VnaCBTWVNURU0gZmlyc3QgKG1heWJlIHdp
dGggc29tZSBwcmludGsgb3Igd2hhdGV2ZXIpLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAt
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
