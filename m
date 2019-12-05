Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733D114D5D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FC06EB40;
	Fri,  6 Dec 2019 08:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2926F63D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:16:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p5so2969318qtq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 02:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5K3iSfguK9BgLZmuNv+P78rfwEAvYBwmmPVubK0s/pU=;
 b=KMguBnJrKBBqvuwnHg8T0rux5y0jBMDaqKOxRm2quYrY6xMz3oofoA7a+UrD+81KQ9
 Rxc2yS07Xc+n4Qz//vvtdmOykTKmp/axrCIlLmCs7FI3zKWWe6TBnq/zizIpP6xTHaKr
 JIN4bkZ5OX/xeWbDSlyhzOKytAydckLF45mPYy33S+bO5hGHgnCf8DVnZuHNavv2WcHu
 KLXwipvdmoxLSKMhyXm2GuNSiDekFf/NLABxu/JtZoJOjyJ44zF1UcYy+yp4tU4u/g3/
 Deh5zzQCWq1I3nonjSbvbJPrOVbXNm6dni2LZsOMEXJbX+cyBRb1HjE6Ezf2ZBwGCfhw
 LnpA==
X-Gm-Message-State: APjAAAVRQDL89786DrRYTGhzW/M4fftwDQ8ghABjc3gRK1795UJ/WGWM
 zupiHV5xiYa1ru6s5Gig8Vnu2fd5tCHz0Rryg9161Q==
X-Google-Smtp-Source: APXvYqzKqDCCc0kbBiNwk/8CDZ3khjRTfsJD5k2PvUhdgdLt8YCzmfSIZLXTyRfa9Tebhhcml+smc9OpBFFXQlE1Yqk=
X-Received: by 2002:ac8:2489:: with SMTP id s9mr6779647qts.257.1575540979068; 
 Thu, 05 Dec 2019 02:16:19 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
In-Reply-To: <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 11:16:08 +0100
Message-ID: <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5K3iSfguK9BgLZmuNv+P78rfwEAvYBwmmPVubK0s/pU=;
 b=lCZ22bHzgt5kpBC9O6jPqAKgkhjGIQobnqGoJRzGTE90z5sZbBQhcrTLXtFcemHhB2
 Rg6cHalQvuAg0CIGToyD3T1xZXTb8k08Xh/1ZXrZfMLT6UwzJTzrWHYUV3cRRsMl9xPd
 e2lg4dNPpTTrEainmBfCe3YWqbVqS2qeYG0Nik6vGzaNGrFbe12HLZZYeSLDGc8yczVq
 K2LGYznvnziZpgOoBDpITggU3BXGsdLpk9EFF28TtBghesL8yDOXMt+EAiYCuONfcNpA
 hNkCtewjlvVS5UvMzp8S1YY2cKnjX69xWEx0oGyaM3qO8U9AuNswgHen3fj/MgNdK9d4
 7GcA==
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

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAxMToxMyBBTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDA0LzEyLzE5IDIyOjQxLCBzeXpib3Qgd3JvdGU6Cj4g
PiBzeXpib3QgaGFzIGJpc2VjdGVkIHRoaXMgYnVnIHRvOgo+ID4KPiA+IGNvbW1pdCAyZGU1MGU5
Njc0ZmM0Y2EzYzYxNzRiMDQ0NzdmNjllYjI2YjRlZTMxCj4gPiBBdXRob3I6IFJ1c3NlbGwgQ3Vy
cmV5IDxydXNjdXJAcnVzc2VsbC5jYz4KPiA+IERhdGU6ICAgTW9uIEZlYiA4IDA0OjA4OjIwIDIw
MTYgKzAwMDAKPiA+Cj4gPiAgICAgcG93ZXJwYy9wb3dlcm52OiBSZW1vdmUgc3VwcG9ydCBmb3Ig
cDVpb2MyCj4gPgo+ID4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL3gvYmlzZWN0LnR4dD94PTEyN2EwNDJhZTAwMDAwCj4gPiBzdGFydCBjb21taXQ6ICAgNzZi
YjhiMDUgTWVyZ2UgdGFnICdrYnVpbGQtdjUuNScgb2YKPiA+IGdpdDovL2dpdC5rZXJuZWwub3Jn
L3AuLgo+ID4gZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCj4gPiBmaW5hbCBjcmFzaDogICAgaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBvcnQudHh0P3g9MTE3YTA0MmFlMDAwMDAK
PiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50
eHQ/eD0xNjdhMDQyYWUwMDAwMAo+ID4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWRkMjI2NjUxY2IwZjM2NGIKPiA+IGRhc2hib2FyZCBs
aW5rOgo+ID4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTQ0NTVjYTNi
MzI5MWRlODkxYWJjCj4gPiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC9yZXByby5zeXo/eD0xMTE4MWVkYWUwMDAwMAo+ID4gQyByZXByb2R1Y2VyOiAgIGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uYz94PTEwNWNiYjdhZTAwMDAwCj4g
Pgo+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCs0NDU1Y2EzYjMyOTFkZTg5MWFiY0BzeXprYWxsZXIu
YXBwc3BvdG1haWwuY29tCj4gPiBGaXhlczogMmRlNTBlOTY3NGZjICgicG93ZXJwYy9wb3dlcm52
OiBSZW1vdmUgc3VwcG9ydCBmb3IgcDVpb2MyIikKPiA+Cj4gPiBGb3IgaW5mb3JtYXRpb24gYWJv
dXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOgo+ID4gaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2Vj
dGlvbgo+ID4KPgo+IFdoeSBpcyBldmVyeWJvZHkgYmVpbmcgQ0MnZCwgZXZlbiBpZiB0aGUgYnVn
IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlCj4gcGVyc29uJ3Mgc3Vic3lzdGVtPwoKVGhlIFRv
IGxpc3Qgc2hvdWxkIGJlIGludGVyc2VjdGlvbiBvZiAyIGdyb3VwcyBvZiBlbWFpbHM6IHJlc3Vs
dCBvZgpnZXRfbWFpbnRhaW5lcnMucGwgb24gdGhlIGZpbGUgaWRlbnRpZmllZCBhcyBjdWxwcml0
IGluIHRoZSBjcmFzaAptZXNzYWdlICsgZW1haWxzIGV4dHJhY3RlZCBmcm9tIHRoZSBiaXNlY3Rl
ZCB0byBjb21taXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
