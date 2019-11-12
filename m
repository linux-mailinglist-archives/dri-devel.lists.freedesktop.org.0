Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABDFAB6C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A476E591;
	Wed, 13 Nov 2019 07:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA6E6E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:03:17 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a67so14545080edf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 03:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7v/v4nr+zqzk2y/jAd0gNZ9DfjLyLFd4Z21yLnvf0Dw=;
 b=P1LNzrozCLathV5fRd6Gm8QpGuSL3ISoRhcrF0jvy4FWuRWN5k39/5L1aHomzhmPi0
 55rQSfjH1WfjEiTXNZizd1ClJT8u6OF/wENfSCtB5fv8v19biPs3NRtfaKZrht3tRNpo
 W7zemMOG98tQDYD7tG2gIrqulPffvFkSL0hmMO4TbOVvuqiowcFt+Al3WDAU3WbJPkPo
 VtgjYrJxqSFaWL4QLBtGs67K45Un0dFutxxoErpXlYmz/UcPj8uNY4BLV+p1fN6QVBp8
 scH3kB658NU0KLWexgaBnO1CKyxnOAO+ca9TWmrk4z9LA6Mv53GgCGMtt3YgvsaVe/8s
 moyQ==
X-Gm-Message-State: APjAAAWQW576SNlQYDQXQa5wR0Rc/dcypNpP/ZigHIPVE0QKvZAaJIvi
 kIInb2szTrujzO8ZoX2Hse8wqplgUjj84vmb05I=
X-Google-Smtp-Source: APXvYqyF5pycYcqNWugO2851/NH1Ih0TM/Tf5B7Bn9iBKqBF7TP/lwxHh3YlfKn//hB0aWX0AcvVEX/a2g+CgBbh4C8=
X-Received: by 2002:a17:906:f109:: with SMTP id
 gv9mr28018882ejb.196.1573556596349; 
 Tue, 12 Nov 2019 03:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20191109075417.29808-1-hslester96@gmail.com>
 <20191112094031.GF23790@phenom.ffwll.local>
In-Reply-To: <20191112094031.GF23790@phenom.ffwll.local>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 12 Nov 2019 19:03:05 +0800
Message-ID: <CANhBUQ1HRe4FNWo0o18zxV2ZoANRdNd3PaTeeBZ6dG__0quDUA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtgpu: fix double unregistration
To: Chuhong Yuan <hslester96@gmail.com>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux-foundation.org, 
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7v/v4nr+zqzk2y/jAd0gNZ9DfjLyLFd4Z21yLnvf0Dw=;
 b=WGcrxOsczq3GVLUIOlQBv9NqR40pTHNB89f52HlTcJP/airVxcI1SbQma3s/xI/y9b
 3FzS+nvwEDIrjUz2i2JkCwft5P+/PNYXiNcxG6SeQicGHSv4apY9rtF/iOfeKgKERvGi
 49Mh+wxoUpPZaJmxb9Nw6btNQVViXnOh65IYkoGrkBwPGsVMEnTa7lGIUtfNvTF+Gn3V
 Qe6PMS86mVL8zxP5qiu8kymKk6Zx8AH19LR1tOXygo4H+xoYMcZsRW7KYCViZ0cRc+oW
 /MXLGW+zWRzqppdLzFyZg5PVEzdYx8ePWwKKIta0fJ9bjReuWFvvR2ms3JaP8Joey/fo
 0Rkg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNTo0MCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3YgMDksIDIwMTkgYXQgMDM6NTQ6MTdQTSArMDgw
MCwgQ2h1aG9uZyBZdWFuIHdyb3RlOgo+ID4gZHJtX3B1dF9kZXYgYWxzbyBjYWxscyBkcm1fZGV2
X3VucmVnaXN0ZXIsIHNvIGRldiB3aWxsIGJlIHVucmVnaXN0ZXJlZAo+ID4gdHdpY2UuCj4gPiBS
ZXBsYWNlIGl0IHdpdGggZHJtX2Rldl9wdXQgdG8gZml4IGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+Cj4KPiBOaWNlIGNhdGNoLCBJ
J2xsIGFwcGx5Lgo+Cj4gU2luY2UgdGhpcyBpcyBzbyBjb25mdXNpbmcsIHdlIGFjdHVhbGx5IGhh
dmUgYSB0b2RvIHRvIHJlbW92ZSBkcm1fcHV0X2Rldgo+IGNvbXBsZXRlbHkgZnJvbSB0aGUgY29k
ZWJhc2UgKGFuZCBvcGVuLWNvZGUgaXQgd2l0aCBleHBsaWNpdAo+IHVucmVnaXN0ZXIrcHV0KS4g
V2FudCB0byBkbyB0aGF0IGxpdHRsZSBwYXRjaCBzZXJpZXMgdG8gdXBkYXRlIHRoZQo+IHJlbWFp
bmluZyBmZXcgZHJpdmVycyBhbmQgdGhlbiByZW1vdmUgZHJtX3B1dF9kZXYgZnJvbSBjb3JlIGNv
ZGU/Cj4KPiBUaGFua3MsIERhbmllbAo+CgpJIGFtIHNvcnJ5IHRoYXQgSSBoYXZlIHRvIGZvY3Vz
IG9uIG15IGN1cnJlbnQgcHJvamVjdCBpbiByZWNlbnQgZGF5cy4KQnV0IHNpbmNlIHRoaXMgaXMg
YSBwcm9ibGVtLCBJIGhhdmUgd3JpdHRlbiBhIENvY2NpbmVsbGUgc2NyaXB0IGp1c3Qgbm93CnRv
IGZpbmQgZHJtX3B1dF9kZXYgYW5kIG9wZW4tY29kZSBpdC4KSSBob3BlIHRoaXMgaGVscHMuClRo
ZSBzY3JpcHQgaXM6Cgp2aXJ0dWFsIHBhdGNoCgpAIGRybV9wdXRfZGV2IGRlcGVuZHMgb24gcGF0
Y2ggZXhpc3RzIEAKZXhwcmVzc2lvbiBkZXY7CkBACgotIGRybV9wdXRfZGV2KGRldik7CisgZHJt
X2Rldl91bnJlZ2lzdGVyKGRldik7CisgZHJtX2Rldl9wdXQoZGV2KTsKClJlZ2FyZHMsCkNodWhv
bmcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCj4gPiBpbmRleCAwZmMzMmZhMGIz
YzAuLmZjY2MyNGUyMWFmOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5jCj4gPiBAQCAtMTM4LDcgKzEzOCw3IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcmVtb3Zl
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4KPiA+ICAgICAgIGRybV9kZXZfdW5yZWdp
c3RlcihkZXYpOwo+ID4gICAgICAgdmlydGlvX2dwdV9kZWluaXQoZGV2KTsKPiA+IC0gICAgIGRy
bV9wdXRfZGV2KGRldik7Cj4gPiArICAgICBkcm1fZGV2X3B1dChkZXYpOwo+ID4gIH0KPiA+Cj4g
PiAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jb25maWdfY2hhbmdlZChzdHJ1Y3QgdmlydGlvX2Rl
dmljZSAqdmRldikKPiA+IC0tCj4gPiAyLjIzLjAKPiA+Cj4KPiAtLQo+IERhbmllbCBWZXR0ZXIK
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
