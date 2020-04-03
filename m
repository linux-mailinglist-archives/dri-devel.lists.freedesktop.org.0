Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A690019DBDF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 18:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3726EC23;
	Fri,  3 Apr 2020 16:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57276EC23
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 16:40:56 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id k5so6615841oiw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QMFojYHgYc5POEgG1gKWUrcpFWbGEJtOr0VoqZadidI=;
 b=d6psg1bTquQQVi9TVxdni9J4LWC+r0xrZwD7m56IbxE90zgYyTRvSQOsKSVoEJvHTW
 7XaL4rJSPLX+EyMXBRDhFco0W4u+HLznKrJ3DZQR3CCKe5qLUOxoPehp+CdVEmr22Lfx
 cOZTzX2shA7S8aP9RziGbcUlrhEsPwfB3HQDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QMFojYHgYc5POEgG1gKWUrcpFWbGEJtOr0VoqZadidI=;
 b=IWJvgWx4j3DLBpn0qQtorwJVJUKHic4QUy0zSXWf24RW6hEeBcJMD37SkrJ7wIP7Ve
 FPxlx53ciMwr/OXnBMyVXKvmZAaHiAfoeAKyoijEaxJrkepv4gzcB0WJCyDlO591FOBH
 Tn3CBgLmNhl7ZxRzuDn18yZWMsBSD0sfWvErtP+grJpogvKpMzuF0qgT47jWeAizqZzN
 YUVxQALUHgRjRpnJflvgwgZVMCpJabE1zcQsIK/VS+H2kYyGGe4ASSh97Yy8JxmzrrNm
 +l+rOh6Rttv5xmA0ESWz+ak30fUxp3b+sy37SlP7NTlddk5u9oARrRU73+4NOPWbIbKn
 j25A==
X-Gm-Message-State: AGi0PuYYSohHoqtrncWWBkdgmlqJ7MEoCeV/lYm423Hwvvyn11aFQcOq
 z6p6w8zp2ZXOB3Snglz1cdZpdM5M57RkVOShBGlIvUXH
X-Google-Smtp-Source: APiQypINQXFYvlqsO8o3OWTfxbeytpK6SLfKl/L44/YPToO5hGmem9Mvy0jnKVSHlYtBrjjZ/oXyyoVbMLGno43slck=
X-Received: by 2002:a54:4189:: with SMTP id 9mr3812860oiy.128.1585932056141;
 Fri, 03 Apr 2020 09:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <9bef42f5-2f6e-a102-917d-7c55f2bf83d4@daenzer.net>
 <CAKMK7uHxtvd4=POpBEPNfimjpz6Q7AO4P_XWsgd0fiLN8G1bUA@mail.gmail.com>
In-Reply-To: <CAKMK7uHxtvd4=POpBEPNfimjpz6Q7AO4P_XWsgd0fiLN8G1bUA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 18:40:44 +0200
Message-ID: <CAKMK7uGL88uEFGzQgogk4vqRDcmmBb3AR+sCqK=SWtJ4p6UCxA@mail.gmail.com>
Subject: Re: amdgpu dropping load callback triggers WARN_ON in
 __drm_mode_object_add
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NSBzZWNvbmRzIG9uIGlyYyBhbmQgSSd2ZSBmb3VuZCB0aGUgc3BsYXQgLi4uCgpkcm1fcHJvcGVy
dGllcyBuZWVkIHRvIGJlIGNyZWF0ZWQgYXQgZHJpdmVyIGxvYWQgdGltZSwgdXBmcm9udC4gWW91
CmNhbiBhdHRhY2ggdGhlbSB0byBob3RwbHVnZ2FibGUgZHJtX2Nvbm5lY3RvciBvYmplY3RzIGxh
dGVyIG9uLCBidXQKb25seSBiZWZvcmUgY2FsbGluZyBkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKCku
CgpUaGUgd2FybmluZyBleGlzdHMgYmVjYXVzZSBpOTE1IGhhZCB0aGUgc2FtZSBidWcgOi0pCi1E
YW5pZWwKCk9uIEZyaSwgQXByIDMsIDIwMjAgYXQgNjozOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjMwIFBNIE1p
Y2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IHdyb3RlOgo+ID4KPiA+Cj4gPiBJJ20g
Z2V0dGluZyB0aGUgYXR0YWNoZWQgV0FSTklORyBzcGxhdHMgc2luY2UgYW1kZ3B1IGRyb3BwZWQg
aXRzIGxvYWQKPiA+IGNhbGxiYWNrLiBUaGV5J3JlIGZyb20KPiA+Cj4gPiAgICAgICAgIFdBUk5f
T04oIWRldi0+ZHJpdmVyLT5sb2FkICYmIGRldi0+cmVnaXN0ZXJlZCAmJiAhb2JqX2ZyZWVfY2Ip
Owo+ID4KPiA+IGluIF9fZHJtX21vZGVfb2JqZWN0X2FkZC4KPiA+Cj4gPiBJJ20gbm90IHN1cmUg
aG93IHRvIGFkZHJlc3MgdGhpcywgc2luY2Ugb2JqX2ZyZWVfY2IgaXMgYWx3YXlzIE5VTEwgaGVy
ZSwKPiA+IGFuZCBJIGRvbid0IHRoaW5rIE1TVCBjb25uZWN0b3JzIGdldHRpbmcgYWRkZWQgYWZ0
ZXIgZGV2LT5yZWdpc3RlcmVkIGlzCj4gPiBzZXQgY2FuIGJlIGF2b2lkZWQ/Cj4KPiBJIG5lZWQg
dGhlIGZ1bGwgc3BsYXQsIG90aGVyd2lzZSBjYW4ndCB0ZWxsIHlvdSB3aGF0J3MgZ29pbmcgd3Jv
bmcuCj4gVGhlcmUncyAyIGNhc2VzOgo+Cj4gLSBob3RwbHVnZ2FibGUgc3R1ZmYsIHdoaWNoIGhh
cyB0aGUgb2JqX2ZyZWVfY2Igc2V0LiBFc3NlbnRpYWxseSBNU1QgY29ubmVjdG9ycy4KPgo+IC0g
bm90LWhvdHBsdWdnYWJsZSBzdHVmZiwgd2hpY2ggaXMgZXZlcnl0aGluZyBlbHNlLiBUaGV5IGRv
bid0IGhhdmUKPiBvYmpfZnJlZV9jYiBzZXQuIEl0J3MgYSBkcml2ZXIgYnVnIHRvIHJlZ2lzdGVy
IHRob3NlIGFmdGVyIHRoZSBvdmVyYWxsCj4gZHJtX2RldmljZSBoYXMgYWxyZWFkeSBiZWVuIHJl
Z2lzdGVyZWQgYW5kIHB1Ymxpc2hlZCB0byB1c2Vyc3BhY2UuCj4gLURhbmllbAo+IC0tCj4gRGFu
aWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
