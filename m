Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50608114D68
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A16F974;
	Fri,  6 Dec 2019 08:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F276E056
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 11:27:48 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id t7so1135861qve.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 03:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RN4UxK4XX/wD+FOSD/QSslR64zPY0NoSPi7sfqEDTcg=;
 b=tmsdWJ1K6lqN937Nq18LP+xTwd3N0pCdcJ5C/7CA65rIqDoMMaiaa6uG2Rbk6ux0yf
 CYDRTXqWbzVXT5ARbrpMxlVvS2fers5qnY5M8fxOqGHZGDtTMybCaeHNry9wOU8nKkZ1
 qBuqtjO50W+c2JFZwB85xrC1VRrrIcC1prZgnJKMcLuoBi4R8VVP1n9PWNXKwd4COlOe
 q/taS/o4aPyYCtroP2nkYxN7JqZUiEgDfNJ1jObGwU2OZvwmDYknCu7JKt2Rsk+oogJ6
 NahJOxSlRclCirWCX4PoHqhkDLWYFrWWlrTCQa9mbB5r4g7Wbgm/x5dOWyVh2FHg55MA
 ebdQ==
X-Gm-Message-State: APjAAAWvb0DpFHFBsRFoaefkpHurO1JTJaUODRxD1S29FkgVZbRGmMOj
 wPaclnnwnbscHVfdmqOlLnkY1dpFwYmNfDxM9MiGNQ==
X-Google-Smtp-Source: APXvYqxH9YNJe5L8BxMqoB1aZ+mLyrbeKewaHX+sfn84IGKLFUtHvCbxNr7Nz7Mt9VNZMqmAAHeTZG/lcpsKaNbOTFE=
X-Received: by 2002:a0c:f8d1:: with SMTP id h17mr7099085qvo.80.1575545267533; 
 Thu, 05 Dec 2019 03:27:47 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
 <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
 <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
In-Reply-To: <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 12:27:35 +0100
Message-ID: <CACT4Y+YopHoCFDRHCE6brnWfHb5YUsTJS1Mc+58GgO8CDEcgHQ@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RN4UxK4XX/wD+FOSD/QSslR64zPY0NoSPi7sfqEDTcg=;
 b=HcygGCX60Afhxpnw9ZYlpuKkkt5wdM44SN/KOzDuDxVXQAJYVla5vHk6t3E4umUT94
 WY3Uy/DUPWgjn0jDpNuvlQTfbRf6E7c08Qp9KQdy8d9VELeRNDHm65ZdVHDB3uZSyxM7
 eHufFLkzIjwZBrX6+UXDf4ik+qPNtMwBIdCqJDm4sA2uNoBYHBhVnpbaMdg/VJS1UEn8
 AM0jTK3oFUhIZANAHf2pmaFrBnf0iz7jtAqeryjk6H+rOQm8s1DrQnC4hXGmy2QVdwbA
 KebmWYKIj3F0ms5Jw0G2v2v3JX7QX7bocZ4OdEkrQzuV2CoGugRaRRbvp9/fH59JF56p
 S+Zw==
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

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMTo1MyBBTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDA1LzEyLzE5IDExOjMxLCBEbWl0cnkgVnl1a292IHdy
b3RlOgo+ID4+IEFoLCBhbmQgYmVjYXVzZSB0aGUgbWFjaGluZSBpcyBhIEtWTSBndWVzdCwga3Zt
X3dhaXQgYXBwZWFycyBpbiBhIGxvdCBvZgo+ID4+IGJhY2t0cmFjZSBhbmQgSSBnZXQgdG8gc2hh
cmUgc3l6a2FsbGVyJ3Mgam95IGV2ZXJ5IHRpbWUuIDopCj4gPiBJIGRvbid0IHNlZSBhbnkgbWVu
dGlvbiBvZiAia3ZtIiBpbiB0aGUgY3Jhc2ggcmVwb3J0Lgo+Cj4gSXQncyB0aGVyZSBpbiB0aGUg
c3RhY2sgdHJhY2UsIG5vdCBzdXJlIGlmIHRoaXMgaXMgd2hhdCB0cmlnZ2VyZWQgbXkgQ2M6Cj4K
PiAgWzxmZmZmZmZmZjgxMGM3YzNhPl0ga3ZtX3dhaXQrMHhjYS8weGUwIGFyY2gveDg2L2tlcm5l
bC9rdm0uYzo2MTIKPgo+IFBhb2xvCgoKT2gsIHlvdSBtZWFuIHRoZSBmaW5hbCBiaXNlY3Rpb24g
Y3Jhc2guIEluZGVlZCBpdCBjb250YWlucyBhIGt2bSBmcmFtZQphbmQgaXQgdHVybnMgb3V0IHRv
IGJlIGEgYnVnIGluIHN5emthbGxlciBjb2RlIHRoYXQgaW5kZWVkCm1pc2F0dHJpYnV0ZWQgaXQg
dG8ga3ZtIGluc3RlYWQgb2YgbmV0ZmlsdGVyLgpTaG91bGQgYmUgZml4ZWQgbm93LCB5b3UgbWF5
IHJlYWQgdGhlIGNvbW1pdCBtZXNzYWdlIGZvciBkZXRhaWxzOgpodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3N5emthbGxlci9jb21taXQvNGZiNzQ0NzRjZjBhZjIxMjZiZTNhODk4OWQ3NzBjMzk0
N2FlOTQ3OAoKT3ZlcmFsbCB0aGlzICJtYWtpbmcgc2Vuc2Ugb3V0IG9mIGtlcm5lbCBvdXRwdXQi
IHRhc2sgaXMgdGhlIHVsdGltYXRlCmluc2FuaXR5LCB5b3UgbWF5IHNraW0gdGhyb3VnaCB0aGlz
IGZpbGUgdG8gZ2V0IGEgdGFzdGUgb2YgYW1vdW50IG9mCmhhcmRjb2RpbmcgYW5kIHNwZWNpYWwg
Y29ybmVyIGNhc2VzIHRoYXQgbmVlZCB0byBiZSBoYW5kbGVkOgpodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3N5emthbGxlci9ibG9iL21hc3Rlci9wa2cvcmVwb3J0L2xpbnV4LmdvCkFuZCB0aGlz
IGlzIG5ldmVyIGRvbmUsIHN1Y2ggImV4Y2VwdGlvbiBmcm9tIGV4Y2VwdGlvbiBjb3JuZXIgY2Fz
ZSIKdGhpbmdzIHBvcCB1cCBldmVyeSB3ZWVrLiBUaGVyZSBpcyBhbHdheXMgc29tZXRoaW5nIHRv
IHNodWZmbGUgYW5kCnR1bmUuIEl0IG9ubHkga2VlcHMgZnVuY3Rpb25pbmcgZHVlIHRvIDUwMCsg
dGVzdCBjYXNlcyBmb3IgYWxsCnBvc3NpYmxlIGluc2FuZSBrZXJuZWwgb3V0cHV0czoKaHR0cHM6
Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvdHJlZS9tYXN0ZXIvcGtnL3JlcG9ydC90ZXN0
ZGF0YS9saW51eC9yZXBvcnQKaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvdHJl
ZS9tYXN0ZXIvcGtnL3JlcG9ydC90ZXN0ZGF0YS9saW51eC9ndWlsdHkKClNvIHRoYW5rcyBmb3Ig
cGVyc2lzdGluZyBhbmQgcXVlc3Rpb25pbmchIFdlIGFyZSBnZXR0aW5nIGJldHRlciB3aXRoCmVh
Y2ggbmV3IHRlc3QuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
