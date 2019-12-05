Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6D114D74
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D0489129;
	Fri,  6 Dec 2019 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0F6E060
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 11:35:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z22so3201863qto.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 03:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFj7/o8CY27u2EP/Ii6IWyV6V/qKCHo8NGPo9OoyP2o=;
 b=XGZNiYHvcS7TqMalOozB04dnI/KNzCnH047TDpIQ1qKDWWN4wP76LQIzahMDUboz9f
 Qc9qgtB4nsVCzf/2V/tRfwYlS4lpVkk/Kezv8Jeff0pDAOcYiLGUPtp539/K+ujfsH88
 /nynqOE6lFnboWB9RUowzOdsfeIL20N6RLuGk/gzNnsvvfS3OhBz0zrfF27C4BqnqK13
 u1M4jT+GJrO4+RudeY6WuRMFrv1Vkg56RtaORLdH9V9+RYMh3v2OESE91w3epjVFjNHa
 /dPGrW6XpmJNqBAKi4BQC8ulnzMKh+vDoy1CCzPb/kGkD6OwP1vkJndr1C8ALVyEF+AS
 oZPQ==
X-Gm-Message-State: APjAAAXrOYgiNanu/AGG/NVhOQlhbZ4w3nkEy6ZJZL/vC2oEgF8cGvND
 bhIavD9/XWskgcFtkyiIidAfml73f3voTYiPHGLc4A==
X-Google-Smtp-Source: APXvYqywdNT7YtUlcyhBayK1c5G6KgoYnokHv4gbK83yKRI9KmJz2M3nmPsIV9emnEuu9bBpOrULeU5+4XFCmFaRuPs=
X-Received: by 2002:ac8:2489:: with SMTP id s9mr7043538qts.257.1575545729972; 
 Thu, 05 Dec 2019 03:35:29 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
 <397ad276-ee2b-3883-9ed4-b5b1a2f8cf67@i-love.sakura.ne.jp>
In-Reply-To: <397ad276-ee2b-3883-9ed4-b5b1a2f8cf67@i-love.sakura.ne.jp>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 12:35:18 +0100
Message-ID: <CACT4Y+YqNtRdUo4pDX8HeNubOJYWNfsqcQs_XueRNLPozw=g-Q@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XFj7/o8CY27u2EP/Ii6IWyV6V/qKCHo8NGPo9OoyP2o=;
 b=VLVyGXFmunojbceinV2tb/wrcOELq58HBQBO3PG1yIVJE9cJvQrEbuqEZfs1I80KNB
 NpsR6uAqwQ1je6sENpKTPDm/ZPRPYiyWVyhKhz0Gkvv7qxp0qEVtFkBBxA6A80T2TXsl
 X7m1sn9D0K3nhXLdO1yN+hrVDQu5/hiurh8lYBgW2BPj5Yycs6wAmQwzKT1tL8kEMsPy
 K0NR8MTeoPaHhZSlq8XJVOGWI8DaOELPIF19c03IuvUui/HejI8FD0EVyWCqT64GrbmK
 +X5RQyE6wCiiWL0oRAogajCglCRovqnXNNoySkGhPdL0ztR8wC2vD0Gl8PA4lCPMJHcV
 sd3A==
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
ZW50cyBmb3IgYmlzZWN0IG9wZXJhdGlvbi4KCldoYXQgaXMgdGhlIGNyaXRlcmlhIGZvciBmaWxl
IG5hbWUgZXh0cmFjdGlvbj8gV2hhdCB3aWxsIGJpc2VjdApvcGVyYXRpb24gZG8gd2l0aCB0aGUg
c2V0IG9mIGZpbGVzPwpJZiB5b3UgaGF2ZSBhIGZlYXR1cmUvaW1wcm92ZW1lbnQgcmVxdWVzdCwg
cGxlYXNlIGZpbGUgaXQgYXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyL2lz
c3Vlcy9uZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
