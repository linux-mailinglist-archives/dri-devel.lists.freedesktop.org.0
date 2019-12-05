Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27037114D67
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10FF6F954;
	Fri,  6 Dec 2019 08:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E826E064
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:31:39 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id b18so1073322qvo.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 02:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AIwfFBjY5pjo/AwQlYLo1XDjqkJbAe8kAMyvBg+3yAM=;
 b=Z93abw8KTqaeDgmMDmD8X6R+065hhX+yYwuuX47nKEmu1A76HZ8P7XrRPk7cFZs68p
 9ttLhiY0DIfSBTDagG/rRlKQI0A8QSTs6cLP5DssKjtFyM/1kbVxJcfxg5I1G0JojNU3
 MSuhrL+XlrABxQf7b759sa78cwxJcSW09Jp939JuPnoKJD4UqGcIgVmLGVQNiA+6d9zx
 WL/J0S2BVJYIeKjS0QohDmMmajWegXnnkaAZB76dpzqu9iAeBj3Gu9blNkYJchqwcAcS
 Y9GyXLzmCNzIP2O+OTo8JxyhEC9pnGpV0WMywWkHkCbieTz6RmZQozeRy9B96fxBD6r5
 HjjQ==
X-Gm-Message-State: APjAAAX8VbQlgyq/tp6ED7h55raLv6LrN0Czh29IqqP1RB18R//VwKX5
 AuhDkPjeu4rP5Lq2Zy9rI7uT/c9+OQUG8ELCcG1OGg==
X-Google-Smtp-Source: APXvYqzUwvRfklGx7jn2Qx5E8Ckootk5Q7YtZLTMNHA7rrZOeakEoQMPUMd3z45mweABnO/Dvphg9v6UIqE2DS3Vf+k=
X-Received: by 2002:a0c:f8d1:: with SMTP id h17mr6889518qvo.80.1575541898628; 
 Thu, 05 Dec 2019 02:31:38 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
In-Reply-To: <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 11:31:27 +0100
Message-ID: <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AIwfFBjY5pjo/AwQlYLo1XDjqkJbAe8kAMyvBg+3yAM=;
 b=eYZMat2HE3FLjyOA43FqB/w1GkyQ6frF+j0XPKrIc1es0ljwtwwex1ueuRIGRIMTBZ
 uD+v4Pu8j72Kr9PWzQSPmIJG+vAutrUoXY/DlvJLqYzq5Mb/MQS4MLbL7d8bKQHe1CLm
 /obGnlsvGr3IPK2Vijtfo13yPAeYuZFUYqQkYHaAeMoqlrCkVVKjcDjzVsYKs3oi/E8k
 b+AnNdv8b+VIdUWVko0227dY1YSR3tuiDGqWP2ttdlmRuhCA6DLLr4suNNTt1QEYRlE9
 nBUheeQUAyU8L/9eU7qRmuCPsDRs7GTa8MiaTjkR0yLps1RW1cvnWRVFxTxEORtDL2EI
 xkcQ==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "H. Peter Anvin" <hpa@zytor.com>,
 DRI <dri-devel@lists.freedesktop.org>, ghalat@redhat.com,
 Russell Currey <ruscur@russell.cc>, Sam Ravnborg <sam@ravnborg.org>,
 syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, stewart@linux.vnet.ibm.com,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, James Morris <jmorris@namei.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Ingo Molnar <mingo@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gleb Natapov <gleb@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, gwshan@linux.vnet.ibm.com,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMToyMiBBTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDA1LzEyLzE5IDExOjE2LCBEbWl0cnkgVnl1a292IHdy
b3RlOgo+ID4gT24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMToxMyBBTSBQYW9sbyBCb256aW5pIDxw
Ym9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDA0LzEyLzE5IDIyOjQxLCBz
eXpib3Qgd3JvdGU6Cj4gPj4+IHN5emJvdCBoYXMgYmlzZWN0ZWQgdGhpcyBidWcgdG86Cj4gPj4+
Cj4gPj4+IGNvbW1pdCAyZGU1MGU5Njc0ZmM0Y2EzYzYxNzRiMDQ0NzdmNjllYjI2YjRlZTMxCj4g
Pj4+IEF1dGhvcjogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPgo+ID4+PiBEYXRl
OiAgIE1vbiBGZWIgOCAwNDowODoyMCAyMDE2ICswMDAwCj4gPj4+Cj4gPj4+ICAgICBwb3dlcnBj
L3Bvd2VybnY6IFJlbW92ZSBzdXBwb3J0IGZvciBwNWlvYzIKPiA+Pj4KPiA+Pj4gYmlzZWN0aW9u
IGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTEyN2Ew
NDJhZTAwMDAwCj4gPj4+IHN0YXJ0IGNvbW1pdDogICA3NmJiOGIwNSBNZXJnZSB0YWcgJ2tidWls
ZC12NS41JyBvZgo+ID4+PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wLi4KPiA+Pj4gZ2l0IHRyZWU6
ICAgICAgIHVwc3RyZWFtCj4gPj4+IGZpbmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xMTdhMDQyYWUwMDAwMAo+ID4+PiBjb25zb2xlIG91
dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTY3YTA0MmFl
MDAwMDAKPiA+Pj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvLmNvbmZpZz94PWRkMjI2NjUxY2IwZjM2NGIKPiA+Pj4gZGFzaGJvYXJkIGxpbms6Cj4gPj4+
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD00NDU1Y2EzYjMyOTFkZTg5
MWFiYwo+ID4+PiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
eC9yZXByby5zeXo/eD0xMTE4MWVkYWUwMDAwMAo+ID4+PiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTA1Y2JiN2FlMDAwMDAKPiA+Pj4K
PiA+Pj4gUmVwb3J0ZWQtYnk6IHN5emJvdCs0NDU1Y2EzYjMyOTFkZTg5MWFiY0BzeXprYWxsZXIu
YXBwc3BvdG1haWwuY29tCj4gPj4+IEZpeGVzOiAyZGU1MGU5Njc0ZmMgKCJwb3dlcnBjL3Bvd2Vy
bnY6IFJlbW92ZSBzdXBwb3J0IGZvciBwNWlvYzIiKQo+ID4+Pgo+ID4+PiBGb3IgaW5mb3JtYXRp
b24gYWJvdXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOgo+ID4+PiBodHRwczovL2dvby5nbC90cHNt
RUojYmlzZWN0aW9uCj4gPj4+Cj4gPj4KPiA+PiBXaHkgaXMgZXZlcnlib2R5IGJlaW5nIENDJ2Qs
IGV2ZW4gaWYgdGhlIGJ1ZyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZQo+ID4+IHBlcnNvbidz
IHN1YnN5c3RlbT8KPiA+Cj4gPiBUaGUgVG8gbGlzdCBzaG91bGQgYmUgaW50ZXJzZWN0aW9uIG9m
IDIgZ3JvdXBzIG9mIGVtYWlsczogcmVzdWx0IG9mCj4gPiBnZXRfbWFpbnRhaW5lcnMucGwgb24g
dGhlIGZpbGUgaWRlbnRpZmllZCBhcyBjdWxwcml0IGluIHRoZSBjcmFzaAo+ID4gbWVzc2FnZSAr
IGVtYWlscyBleHRyYWN0ZWQgZnJvbSB0aGUgYmlzZWN0ZWQgdG8gY29tbWl0Lgo+Cj4gQWgsIGFu
ZCBiZWNhdXNlIHRoZSBtYWNoaW5lIGlzIGEgS1ZNIGd1ZXN0LCBrdm1fd2FpdCBhcHBlYXJzIGlu
IGEgbG90IG9mCj4gYmFja3RyYWNlIGFuZCBJIGdldCB0byBzaGFyZSBzeXprYWxsZXIncyBqb3kg
ZXZlcnkgdGltZS4gOikKCkkgZG9uJ3Qgc2VlIGFueSBtZW50aW9uIG9mICJrdm0iIGluIHRoZSBj
cmFzaCByZXBvcnQuIEFuZCBpdCdzIG9ubHkgMQpmaWxlLCBub3QgYWxsIG9mIHRoZW0sIGluIHRo
aXMgY2FzZSBJIHdvdWxkIGV4cGVjdCBpdCB0byBiZQpkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYy4gU28gaXQgc2hvdWxkIGJlIHNvbWV0aGluZyBkaWZmZXJlbnQuCgo+IFRoaXMgYmlz
ZWN0IHJlc3VsdCBpcyBib2d1cywgdGhvdWdoIFRldHN1byBmb3VuZCB0aGUgYnVnIGFueXdheS4K
PiBQZXJoYXBzIHlvdSBjYW4gZXhjbHVkZSBjb21taXRzIHRoYXQgb25seSB0b3VjaCBhcmNoaXRl
Y3R1cmVzIG90aGVyIHRoYW4KPiB4ODY/CgpXZSBkbyB0aGlzLiBJdCB3b3JrIHNvbWV0aW1lcy4g
QnV0IHNvbWV0aW1lcyBpdCBoaXRzIG5vbi1kZXRlcm1pbmlzdGljCmtlcm5lbCBidWlsZCBidWdz
OgpodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxlci9pc3N1ZXMvMTI3MSNpc3N1ZWNv
bW1lbnQtNTU5MDkzMDE4CkFuZCBpbiB0aGlzIGNhc2UgaXQgaGl0IHNvbWUgZ2l0IGJpc2VjdCB3
ZWlyZG5lc3Mgd2hpY2ggSSBjYW4ndCBleHBsYWluIHlldDoKaHR0cHM6Ly9naXRodWIuY29tL2dv
b2dsZS9zeXprYWxsZXIvaXNzdWVzLzE1MjcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
