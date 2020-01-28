Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960114BD8E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 17:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2D76EEB2;
	Tue, 28 Jan 2020 16:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB36EEB3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 16:18:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 59so12504295otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ClKCoonKd7SvNsujEr5t4ecQ8hunfK+U8DDqUMgCUzc=;
 b=jUqHApJZcogIIPQ0bfvYi8RFO/krOov6JPM+ZmWHIwI52C+W4cwsXk8dTxb5mypfJm
 upzFdioTK9riP6CUIoT1C717mBfXl9Nfpg1Vz6quQVfN8KpS4jmLOVFQTGP+hjOmdX+W
 fP7ghXSPiwgQVh4cIKFwb6/ulwVKcHWceHOV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ClKCoonKd7SvNsujEr5t4ecQ8hunfK+U8DDqUMgCUzc=;
 b=DOfv2BRKSN0YXFcdrpLVWnbgg4j0Yp34VK6O3zxRShF6F1Ie+1+F9Rgb5d6ifwJ+zu
 cFGM2SPqK9xmc8Kp+zShaOiUE/M9QW6BooKAw3K8C3BDrghZTyL54mKk5ytPiaW9CEwL
 22GoNAtc4nr7PVfW1Fb67Jfj0OkPsWTOCrj/LBenomKDhQFMhub95T8b2OUh+xlH+tdz
 XqBY2/tN6qzDCZnXlZgw6VfRAcAaMaJ0c3s//0x4xvx2mKqfN0XiaWjztH8TBtPRYZRv
 oQdc0qutaldy1S6ZUlL7aJdcIen4xXYsnyBEY7raWBhGdY4lYVSGbwsZVhhzZDc1ou2m
 4XuA==
X-Gm-Message-State: APjAAAVWnGmqc79oVWXDpTqx0HjF+WW4E6ao/UkT61rB4/NPETzPVV7g
 jMHSpxViD6ckL25ACrjcQOeSoBn+21m+arxW5mtCFg==
X-Google-Smtp-Source: APXvYqw9Y1a6Kw7GhsYwXMiP5HONeoMuUH7AkUVc3XuydI8xh7m++tOlLVR3jvEHIuuuFOmQ0/KwJLx00vOl4+79NSI=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr17797077otl.188.1580228325858; 
 Tue, 28 Jan 2020 08:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200128151758.GI43062@phenom.ffwll.local> <20200128161536.GL13686@intel.com>
In-Reply-To: <20200128161536.GL13686@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 28 Jan 2020 17:18:34 +0100
Message-ID: <CAKMK7uGjtJOU_+Hv=A1LbOoqwO-FSC4iOxbb__r0iN+v5FpgRA@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/edid: Check the number of detailed timing
 descriptors in the CEA ext block
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgNToxNSBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0
IDA0OjE3OjU4UE0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIEphbiAy
NCwgMjAyMCBhdCAxMDowMjoyNFBNICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+ID4gPiBG
cm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4g
Pgo+ID4gPiBDRUEtODYxIHNheXMgOgo+ID4gPiAiZCA9IG9mZnNldCBmb3IgdGhlIGJ5dGUgZm9s
bG93aW5nIHRoZSByZXNlcnZlZCBkYXRhIGJsb2NrLgo+ID4gPiAgSWYgbm8gZGF0YSBpcyBwcm92
aWRlZCBpbiB0aGUgcmVzZXJ2ZWQgZGF0YSBibG9jaywgdGhlbiBkPTQuCj4gPiA+ICBJZiBubyBE
VERzIGFyZSBwcm92aWRlZCwgdGhlbiBkPTAuIgo+ID4gPgo+ID4gPiBTbyBsZXQncyBub3QgbG9v
ayBmb3IgRFREcyB3aGVuIGQ9PTAuIEluIGZhY3QgbGV0J3MganVzdCBtYWtlIHRoYXQKPiA+ID4g
PDQgc2luY2UgdGhvc2UgdmFsdWVzIHdvdWxkIGp1c3QgbWVhbiB0aGF0IGhlIERURHMgb3Zlcmxh
cCB0aGUgYmxvY2sKPiA+ID4gaGVhZGVyLiBBbmQgbGV0J3MgYWxzbyBjaGVjayB0aGF0IGQgaXNu
J3Qgc28gYmlnIGFzIHRvIGRlY2xhcmUKPiA+ID4gdGhlIGRlc2NyaXB0b3JzIHRvIGxpdmUgcGFz
dCB0aGUgYmxvY2sgZW5kLCBhbHRob3VnaCB0aGUgY29kZQo+ID4gPiBkb2VzIGFscmVhZHkgc3Vy
dml2ZSB0aGF0IGNhc2UgYXMgd2UnZCBqdXN0IGVuZCB1cCB3aXRoIGEgbmVnYXRpdmUKPiA+ID4g
bnVtYmVyIG9mIGRlc2NyaXB0b3JzIGFuZCB0aGUgbG9vcCB3b3VsZCBub3QgZG8gYW55dGhpbmcu
Cj4gPiA+Cj4gPiA+IENjOiBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gPgo+ID4gSG0gSSB0aGluayBlZGlkIHBhcnNpbmcgaXMgbGlrZSB0aGUgcGVyZmVj
dCB1c2UtY2FzZSBmb3Igc29tZSBpbi1rZXJuZWwKPiA+IHVuaXQgdGVzdHMgLi4uIEluIGNhc2Ug
YW55b25lIGZlZWxzIG1vdGl2YXRlZD8KPgo+IEFub3RoZXIgaWRlYSBJJ3ZlIGJlZW4gcHV0dGlu
ZyBvZmYgaXMgc2ltcGx5IHNob3ZpbmcgdGhlIHBhcnNlciBpbnRvCj4gdXNlcnNwYWNlLiBLaW5k
YSBsb29rcyBsaWtlIHdpdGggZm9ya191c2VybW9kZV9ibG9iKCkgd2UgY291bGQgZW1iZWQKPiB0
aGUgZXhlY3V0YWJsZSBpbnRvIHRoZSBrZXJuZWwvbW9kdWxlIGFuZCB0aHVzIGF2b2lkIHRoZSBw
cm9ibGVtIG9mCj4gYWN0dWFsbHkgc2hpcHBpbmcgdGhlIGJpbmFyeSBzb21laG93LgoKIkhvdyB0
byBydW4gdW5pdCB0ZXN0cyB3aXRob3V0IGxvc2luZyBoYWlyIiBpcyBlc3NlbnRpYWxseSB3aGF0
IGt1bml0CnRyaWVzIHRvIHNvbHZlLiBJIHRoaW5rIHdlIHNob3VsZCBjdXQgb3ZlciB0byB0aGF0
IChpdCdzIG1lcmdlZCBub3csCnNob3VsZCBiZSBnb29kIGVub3VnaCBmb3IgYXQgbGVhc3QgdGhl
IGVkaWQgcGFyc2VyLCBtb2NraW5nIHN0dWZmCmlzbid0IHRoZXJlIHRoZXJlKSwgYW5kIHRoZW4g
bWFrZSBzdXJlIENJIHJ1bnMgdGhhdCBzdHVmZiBmb3IgdXMuIFRoZW4Kd2UgY291bGQgY29udmVy
dCBvdmVyIGF0IGxlYXN0IHRoZSB1bml0IHRlc3QgbGlrZSBzZWxmdGVzdHMgZXZlbnR1YWxseQp0
b28uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
