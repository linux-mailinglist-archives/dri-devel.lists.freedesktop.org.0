Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D8A114D6D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0556F97B;
	Fri,  6 Dec 2019 08:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4466E060
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 11:37:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 38so3162289qtb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 03:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfYIZA1x1hWCQA6g7oQ19DH7tEX6ualy3pbm/P3Lk+A=;
 b=DDPpfDAurAO/j5d/qFLIvpzQGgaWJxmB2cXfizWT/2l2X8vDgIKvYrDzz2NJLoXzqR
 gXpLEQwstObvScujDtuzF8nrJqqY+GVJSP4VqYbacNOSP/YijVbvbcntIQSeCYNoqBaY
 AI/nm/55mTE/g/OVBVPexWKQTieqr7X4MfCjKi1IhwPLCitA21gBwQyBRoLLcQE6F9rj
 7xsqCqTL/1BCJ7Gjkrt2T1ReagFlWdqGOuB9+7aV60C/BGlAn39bCPUO0ebel6rjgWRB
 CB91hvDk+tRU+0xFcNwbL+our2Bs1dYIFhZyKclyr12Y0vYfgIDwHHsLGtX8eDUwi6bY
 OwSw==
X-Gm-Message-State: APjAAAUyCCqpg6kYj5F2jCenFc4l7S7e9sCqX9UO4oC3KX/wAetLX0Ya
 BoJd9e/XWxPsCRo9Z4ch7VFOjzmgIdCbmrGDYtlMwQ==
X-Google-Smtp-Source: APXvYqzfgZJ9l6UJOOMZ2Qo7SFoVkzP/jw5YHvEyX7L/cw3KsXRUm/icBbPq7v443TCg8aD8BOA0xHa3BtNpRac5BEo=
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr7086616qti.380.1575545828141; 
 Thu, 05 Dec 2019 03:37:08 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
 <397ad276-ee2b-3883-9ed4-b5b1a2f8cf67@i-love.sakura.ne.jp>
In-Reply-To: <397ad276-ee2b-3883-9ed4-b5b1a2f8cf67@i-love.sakura.ne.jp>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 12:36:56 +0100
Message-ID: <CACT4Y+bUkzJAezH9Pk=c1amtzO0-r1Hcn3WmDuS+Drn-R3GAQA@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TfYIZA1x1hWCQA6g7oQ19DH7tEX6ualy3pbm/P3Lk+A=;
 b=FjAqSfZWtL5kJIRnjAfh3psbkl8pAdn9kqdwrkrc6B4f8S1BQX57V7yNhGnG0BgwL4
 z15JyoonOBeE0tT3TytWPHa3CYQzBD9Tx1POq43C8+CKKbYgMmPV0L4s8BZLCisZW0Pm
 f5LkYEtNxM7sPloRggdzD8iVN6W49sZsR+I/jfJbS6KjWa+Z1FJ1NvmgxtfYC2CLp305
 w4/Zdw6lu3ne6ZYwhPkYooh4vLuzcrPNHP7Rj3jkgz7jaVzaahUIH1/iG1bVjXkBegYp
 /DU83BC87lTZAbNf8X47Bpt+FqvVbEZvFIVSsSmXIuUebjxYpvSkwl+OHCAaL0gmPODj
 tlXQ==
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
 KVM list <kvm@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell Currey <ruscur@russell.cc>, DRI <dri-devel@lists.freedesktop.org>,
 ghalat@redhat.com, "H. Peter Anvin" <hpa@zytor.com>,
 Sam Ravnborg <sam@ravnborg.org>,
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
 linux-security-module <linux-security-module@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMTo0MSBBTSBUZXRzdW8gSGFuZGEKPHBlbmd1aW4ta2Vy
bmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+Cj4gT24gMjAxOS8xMi8wNSAxOToyMiwg
UGFvbG8gQm9uemluaSB3cm90ZToKPiA+IEFoLCBhbmQgYmVjYXVzZSB0aGUgbWFjaGluZSBpcyBh
IEtWTSBndWVzdCwga3ZtX3dhaXQgYXBwZWFycyBpbiBhIGxvdCBvZgo+ID4gYmFja3RyYWNlIGFu
ZCBJIGdldCB0byBzaGFyZSBzeXprYWxsZXIncyBqb3kgZXZlcnkgdGltZS4gOikKPiA+Cj4gPiBU
aGlzIGJpc2VjdCByZXN1bHQgaXMgYm9ndXMsIHRob3VnaCBUZXRzdW8gZm91bmQgdGhlIGJ1ZyBh
bnl3YXkuCj4gPiBQZXJoYXBzIHlvdSBjYW4gZXhjbHVkZSBjb21taXRzIHRoYXQgb25seSB0b3Vj
aCBhcmNoaXRlY3R1cmVzIG90aGVyIHRoYW4KPiA+IHg4Nj8KPiA+Cj4KPiBJdCB3b3VsZCBiZSBu
aWNlIGlmIGNvdmVyYWdlIGZ1bmN0aW9uYWxpdHkgY2FuIGV4dHJhY3QgZmlsZW5hbWVzIGluIHRo
ZSBzb3VyY2UKPiBjb2RlIGFuZCBzdXBwbHkgdGhlIGxpc3Qgb2YgZmlsZW5hbWVzIGFzIGFyZ3Vt
ZW50cyBmb3IgYmlzZWN0IG9wZXJhdGlvbi4KPgo+IEFsc28sICh1bnJlbGF0ZWQgYnV0KSBpdCB3
b3VsZCBiZSBuaWNlIGlmIHdlIGNhbiBoYXZlICJtYWtlIHllczJtb2Rjb25maWciCj4gdGFyZ2V0
IHdoaWNoIGNvbnZlcnRzIENPTkZJR19GT089eSB0byBDT05GSUdfRk9PPW0gaWYgRk9PIGlzIHRy
aXN0YXRlLgo+IHN5emJvdCBpcyB0ZXN0aW5nIGtlcm5lbCBjb25maWdzIGNsb3NlIHRvICJtYWtl
IGFsbHllc2NvbmZpZyIgYnV0IEkgd2FudCB0bwo+IHNhdmUga2VybmVsIHJlYnVpbGQgdGltZSBi
eSBkaXNhYmxpbmcgdW5yZWxhdGVkIGZ1bmN0aW9uYWxpdHkgd2hlbiBtYW51YWxseQo+ICJkZWJ1
ZyBwcmludGsoKWluZyIga2VybmVscy4KCkkgdGhvdWdodCB0aGF0IG1heWJlIHNlZCAicyM9eSM9
bSNnIiAmJiBtYWtlIG9sZGRlZmNvbmZpZyB3aWxsIGRvLCBidXQKdW5mb3J0dW5hdGVseSwgaXQg
dHVybnMgb2ZmIG5vbi10cmlzdGF0ZSBjb25maWdzLi4uCgokIGVncmVwICJDT05GSUdfTUVNT1JZ
X0hPVFBMVUd8Q09ORklHX1RDUF9DT05HX0RDVENQIiAuY29uZmlnCkNPTkZJR19NRU1PUllfSE9U
UExVRz15CkNPTkZJR19UQ1BfQ09OR19EQ1RDUD15CiMgc2VkIC1pICJzL0NPTkZJR19NRU1PUllf
SE9UUExVRz15L0NPTkZJR19NRU1PUllfSE9UUExVRz1tL2ciIC5jb25maWcKIyBzZWQgLWkgInMv
Q09ORklHX1RDUF9DT05HX0RDVENQPXkvQ09ORklHX1RDUF9DT05HX0RDVENQPW0vZyIgLmNvbmZp
ZwojIGVncmVwICJDT05GSUdfTUVNT1JZX0hPVFBMVUd8Q09ORklHX1RDUF9DT05HX0RDVENQIiAu
Y29uZmlnCkNPTkZJR19NRU1PUllfSE9UUExVRz1tCkNPTkZJR19UQ1BfQ09OR19EQ1RDUD1tCiMg
bWFrZSBvbGRkZWZjb25maWcKIyBlZ3JlcCAiQ09ORklHX01FTU9SWV9IT1RQTFVHfENPTkZJR19U
Q1BfQ09OR19EQ1RDUCIgLmNvbmZpZwojIENPTkZJR19NRU1PUllfSE9UUExVRyBpcyBub3Qgc2V0
CkNPTkZJR19UQ1BfQ09OR19EQ1RDUD1tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
