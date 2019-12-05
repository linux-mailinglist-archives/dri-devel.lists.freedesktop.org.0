Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A056B114D5A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94946EB13;
	Fri,  6 Dec 2019 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE26F5FF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:34:14 +0000 (UTC)
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xB5AUvCo044363;
 Thu, 5 Dec 2019 19:30:57 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Thu, 05 Dec 2019 19:30:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.9] (softbank126040062084.bbtec.net [126.40.62.84])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id xB5AUqmd044301
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Thu, 5 Dec 2019 19:30:57 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Dmitry Vyukov <dvyukov@google.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <811afcac-ec6e-3ff0-1a4e-c83b98540f0d@i-love.sakura.ne.jp>
Date: Thu, 5 Dec 2019 19:30:53 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:33 +0000
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

T24gMjAxOS8xMi8wNSAxOToxNiwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBUaHUsIERlYyA1
LCAyMDE5IGF0IDExOjEzIEFNIFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAwNC8xMi8xOSAyMjo0MSwgc3l6Ym90IHdyb3RlOgo+Pj4gc3l6Ym90IGhh
cyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPj4+Cj4+PiBjb21taXQgMmRlNTBlOTY3NGZjNGNhM2M2
MTc0YjA0NDc3ZjY5ZWIyNmI0ZWUzMQo+Pj4gQXV0aG9yOiBSdXNzZWxsIEN1cnJleSA8cnVzY3Vy
QHJ1c3NlbGwuY2M+Cj4+PiBEYXRlOiAgIE1vbiBGZWIgOCAwNDowODoyMCAyMDE2ICswMDAwCj4+
Pgo+Pj4gICAgIHBvd2VycGMvcG93ZXJudjogUmVtb3ZlIHN1cHBvcnQgZm9yIHA1aW9jMgo+Pj4K
Pj4+IGJpc2VjdGlvbiBsb2c6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2Vj
dC50eHQ/eD0xMjdhMDQyYWUwMDAwMAo+Pj4gc3RhcnQgY29tbWl0OiAgIDc2YmI4YjA1IE1lcmdl
IHRhZyAna2J1aWxkLXY1LjUnIG9mCj4+PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wLi4KPj4+IGdp
dCB0cmVlOiAgICAgICB1cHN0cmVhbQo+Pj4gZmluYWwgY3Jhc2g6ICAgIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTExN2EwNDJhZTAwMDAwCj4+PiBjb25zb2xl
IG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTY3YTA0
MmFlMDAwMDAKPj4+IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94Ly5jb25maWc/eD1kZDIyNjY1MWNiMGYzNjRiCj4+PiBkYXNoYm9hcmQgbGluazoKPj4+IGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD00NDU1Y2EzYjMyOTFkZTg5MWFi
Ywo+Pj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVw
cm8uc3l6P3g9MTExODFlZGFlMDAwMDAKPj4+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS94L3JlcHJvLmM/eD0xMDVjYmI3YWUwMDAwMAo+Pj4KPj4+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrNDQ1NWNhM2IzMjkxZGU4OTFhYmNAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbQo+Pj4gRml4ZXM6IDJkZTUwZTk2NzRmYyAoInBvd2VycGMvcG93ZXJudjogUmVtb3ZlIHN1
cHBvcnQgZm9yIHA1aW9jMiIpCj4+Pgo+Pj4gRm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlv
biBwcm9jZXNzIHNlZToKPj4+IGh0dHBzOi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KPj4+Cj4+
Cj4+IFdoeSBpcyBldmVyeWJvZHkgYmVpbmcgQ0MnZCwgZXZlbiBpZiB0aGUgYnVnIGhhcyBub3Ro
aW5nIHRvIGRvIHdpdGggdGhlCj4+IHBlcnNvbidzIHN1YnN5c3RlbT8KPiAKPiBUaGUgVG8gbGlz
dCBzaG91bGQgYmUgaW50ZXJzZWN0aW9uIG9mIDIgZ3JvdXBzIG9mIGVtYWlsczogcmVzdWx0IG9m
Cj4gZ2V0X21haW50YWluZXJzLnBsIG9uIHRoZSBmaWxlIGlkZW50aWZpZWQgYXMgY3VscHJpdCBp
biB0aGUgY3Jhc2gKPiBtZXNzYWdlICsgZW1haWxzIGV4dHJhY3RlZCBmcm9tIHRoZSBiaXNlY3Rl
ZCB0byBjb21taXQuCj4gCgpUaGVyZSBpcyAiI3N5eiB1bmNjIiBjb21tYW5kIGJ1dCBpdCBpcyB0
b28gaGFyZCB0byB1dGlsaXplPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
