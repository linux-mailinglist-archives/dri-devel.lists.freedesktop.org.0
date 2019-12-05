Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5D114D6F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215F6F983;
	Fri,  6 Dec 2019 08:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7C46F881
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:42:10 +0000 (UTC)
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xB5AfI4B052654;
 Thu, 5 Dec 2019 19:41:18 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Thu, 05 Dec 2019 19:41:18 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (softbank126040062084.bbtec.net [126.40.62.84])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id xB5AfHTe052651
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Thu, 5 Dec 2019 19:41:18 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Paolo Bonzini <pbonzini@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <397ad276-ee2b-3883-9ed4-b5b1a2f8cf67@i-love.sakura.ne.jp>
Date: Thu, 5 Dec 2019 19:41:18 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
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
 "H. Peter Anvin" <hpa@zytor.com>, DRI <dri-devel@lists.freedesktop.org>,
 ghalat@redhat.com, Russell Currey <ruscur@russell.cc>,
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
 linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8xMi8wNSAxOToyMiwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBBaCwgYW5kIGJlY2F1
c2UgdGhlIG1hY2hpbmUgaXMgYSBLVk0gZ3Vlc3QsIGt2bV93YWl0IGFwcGVhcnMgaW4gYSBsb3Qg
b2YKPiBiYWNrdHJhY2UgYW5kIEkgZ2V0IHRvIHNoYXJlIHN5emthbGxlcidzIGpveSBldmVyeSB0
aW1lLiA6KQo+IAo+IFRoaXMgYmlzZWN0IHJlc3VsdCBpcyBib2d1cywgdGhvdWdoIFRldHN1byBm
b3VuZCB0aGUgYnVnIGFueXdheS4KPiBQZXJoYXBzIHlvdSBjYW4gZXhjbHVkZSBjb21taXRzIHRo
YXQgb25seSB0b3VjaCBhcmNoaXRlY3R1cmVzIG90aGVyIHRoYW4KPiB4ODY/Cj4gCgpJdCB3b3Vs
ZCBiZSBuaWNlIGlmIGNvdmVyYWdlIGZ1bmN0aW9uYWxpdHkgY2FuIGV4dHJhY3QgZmlsZW5hbWVz
IGluIHRoZSBzb3VyY2UKY29kZSBhbmQgc3VwcGx5IHRoZSBsaXN0IG9mIGZpbGVuYW1lcyBhcyBh
cmd1bWVudHMgZm9yIGJpc2VjdCBvcGVyYXRpb24uCgpBbHNvLCAodW5yZWxhdGVkIGJ1dCkgaXQg
d291bGQgYmUgbmljZSBpZiB3ZSBjYW4gaGF2ZSAibWFrZSB5ZXMybW9kY29uZmlnIgp0YXJnZXQg
d2hpY2ggY29udmVydHMgQ09ORklHX0ZPTz15IHRvIENPTkZJR19GT089bSBpZiBGT08gaXMgdHJp
c3RhdGUuCnN5emJvdCBpcyB0ZXN0aW5nIGtlcm5lbCBjb25maWdzIGNsb3NlIHRvICJtYWtlIGFs
bHllc2NvbmZpZyIgYnV0IEkgd2FudCB0bwpzYXZlIGtlcm5lbCByZWJ1aWxkIHRpbWUgYnkgZGlz
YWJsaW5nIHVucmVsYXRlZCBmdW5jdGlvbmFsaXR5IHdoZW4gbWFudWFsbHkKImRlYnVnIHByaW50
aygpaW5nIiBrZXJuZWxzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
