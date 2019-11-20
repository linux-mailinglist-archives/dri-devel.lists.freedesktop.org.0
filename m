Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB52103A1F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC766E504;
	Wed, 20 Nov 2019 12:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166F76E504
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:35:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m193so22352657oig.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 04:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8T1wUTMreSR3p0lCpUVOu4m3vpc6neaYIi2PMIhsO4=;
 b=eJg4QLv2oOpk4wMuaekyOFRIFIntVvcoa+RENhOSPLDLxQ1i0mRI/mM4KNxC9r714G
 eja6c5Iy0QcS+/jOxEnOXA8CLSZUMrZOhXTNSHRFdAWsRexi24LUsiLQPxvFkyZKlPV8
 b44IgRIx6Maet6bNYY5p7tj0zHE2KrYmIdAhOCOrQa5YBONm3XW9b30WRbgTuOcbPnK1
 9DL5gg0SVZGSxwhkYYOoj2xerpLYpUtYfM6zY7u3tKV7T6yfG4FMkr27bcufxMhbpKyI
 lIr0X8NO7hCcfCvTuQ9N1PR5DMzLbnceKTc7h1dpaEYvNXJ+yMoMcPAvV5VFtsb5mWbd
 y8RQ==
X-Gm-Message-State: APjAAAUtt9Rx5j6gq5/kFagNzBfaMMB7yG9j2/6z3GDA2AYjvWF6Wt4b
 TBmFDqSE8QDGyUh2mU8sRbPipdXIhAlrHn+ic8ZtFg==
X-Google-Smtp-Source: APXvYqwJ6yLgUlLWBtZeRZ2KgZYCRhUMjkbDfjA5mskVQxcl5h/HhJuMnzStasqX+9eJK52Oz7iAeKC8pPjfYSUbG34=
X-Received: by 2002:aca:3889:: with SMTP id f131mr2627417oia.14.1574253307363; 
 Wed, 20 Nov 2019 04:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
 <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
In-Reply-To: <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Nov 2019 13:34:56 +0100
Message-ID: <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=p8T1wUTMreSR3p0lCpUVOu4m3vpc6neaYIi2PMIhsO4=;
 b=khCcECWwHmkAk0bg3v9kMPWJoRgq0kwAm/taT0k8npRMkhRmxLTKy7CE/vetq/R1k9
 5l5PQGiDGOwansyVrNblQBEzkqphsrl0QtUxFgiYBgFFC86MdkWqfpuZr3VJBGs7o/iF
 GANx87sAfLBhZuDjbogzUj2VURSFxddlb4xac=
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMToxOCBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gSSB0aGluayBmb3IgdHRtIGp1c3Qg
Y29uc2lzdGVudGx5IHVzaW5nIHRoZSBvbmUgcGVyLWRldmljZSBtYXBwaW5nIGZvcgo+ID4gPiA+
IGV2ZXJ5dGhpbmcsIHdpdGggYWxsIHRoZSBmYWtlIG9mZnNldHMsIGlzIHByb2JhYmx5IHRoZSBx
dWlja2VzdCByb3V0ZS4KPiA+ID4KPiA+ID4gSG1tLCBub3QgY2xlYXIgaG93IHRvIGZpdCBkbWFi
dWZzIGludG8gdGhpcy4gIGRtYWJ1ZnMgYWxyZWFkeSBoYXZlIHRoZWlyCj4gPiA+IG93biBmaWxl
LCBpbm9kZSBhbmQgYWRkcmVzcyBzcGFjZS4gIEknbSBub3Qgc3VyZSB5b3UgY2FuIHN3aXRjaCB0
aGF0Cj4gPiA+IG92ZXIgdG8gdGhlIHBlci1kZXZpY2UgbWFwcGluZyBpbiB0aGUgZmlyc3QgcGxh
Y2UsIGFuZCBldmVuIGlmIHlvdSBjYW4gSQo+ID4gPiBoYXZlIG15IGRvdWJ0cyB0aGlzIGlzIGEg
Z29vZCBpZGVhIGZyb20gYSBzZWN1cml0eSBwb2ludCBvZiB2aWV3IC4uLgo+ID4KPiA+IFlvdSBj
YW4gKHBsZW50eSBkcml2ZXJzIGRvIHRoYXQgYWxyZWFkeSksCj4KPiBIYXZlIHBvaW50ZXIocykg
dG8gY29kZT8KCmRtYV9idWZfbW1hcCgpIGRvZXMgdGhlIHNhbWUgdHJpY2ssIGJ1dCB0aGUgb3Ro
ZXIgd2F5IHJvdW5kOiBJdApjb252ZXJ0cyBmcm9tIGdlbSBtYXBwaW5nIGFuZCBmYWtlIG9mZnNl
dCB0byBkbWEtYnVmIG1hcHBpbmcgYW5kIDAKb2Zmc2V0LiBJIHRoaW5rIHdlJ2Qgc2ltcGx5IG5l
ZWQgdGhlIGludmVyc2UuCgo+ID4gYW5kIG5vdCBzdXJlIGhvdyB0aGF0IGJyZWFrcwo+ID4gc2Vj
dXJpdHk/Cj4KPiBHbyB0cnkgbW1hcChmYWtlLW9mZnNldCkgb24gdGhlIGRtYS1idWYgZmlsZSBo
YW5kbGUgdG8gYWNjZXNzIG90aGVyCj4gYnVmZmVycyBvZiB0aGUgZHJtIGRldmljZT8gIEhtbSwg
dGhpbmtpbmcgYWdhaW4sIEkgZ3Vlc3MgdGhlCj4gdmVyaWZ5LWFjY2VzcyByZXN0cmljdGlvbnMg
c2hvdWxkIHByZXZlbnQgdGhhdC4KCkFoLCB3ZSdyZSBub3QgZ29pbmcgdG8gcmVwbGFjZSB0aGUg
bWFwcGluZyBvbiB0aGUgZG1hLWJ1ZiBmaWxlLiBPbmx5CnRoZSBmaWxlIG9mIHRoZSB2bWEgc3Ry
dWN0dXJlLiBEb2luZyB0aGUgZm9ybWVyIHdvdWxkIGluZGVlZCBiZSBwcmV0dHkKYmFkIGZyb20g
YSBzZWN1cml0eSBwb3YuIFNvIGRvbid0IGRvIHdoYXQgYW1kZ3B1X2dlbV9wcmltZV9leHBvcnQK
ZG9lcywgdGhhdCdzIHRoZSBiYWQgc3R1ZmYgOi0pCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
