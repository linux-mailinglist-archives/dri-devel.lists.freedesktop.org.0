Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6D113F44
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 11:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B126F64B;
	Thu,  5 Dec 2019 10:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA666F64B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:22:28 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-gzdPwmEkOGys-5O3MNsxxQ-1; Thu, 05 Dec 2019 05:22:25 -0500
Received: by mail-wr1-f71.google.com with SMTP id y7so545486wrm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 02:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaIFegi+0Clb4nOD0Kmjt0kKgC/aYqjcyu4Ow354nhs=;
 b=r9bgwyFz8kpqRMEfuFtcoEODENjuQ95v5Nu4TfzLLuCNo2wOhdcwVIQhrhgKwuecNZ
 UKVEmxoNpz745DVLwuHP2W4tHb6EjpfJ8jIT/+Ga4ahuVrQ2CWmmafGNYHp+SSTMru0X
 ZPn4MKbUL0MmHB0ZD3H3QpR5AQmFq+37KXWF/x94Kq72ZPa3j2gf53qpMfdnZjCAAdkG
 QTiKq2WTFXC50pSw5C59AKRLX1JXrbFsqScz/XgQ5+GIvQhW9koylgBagRONezuNQHeP
 r1o2PLzCXrjpNgOsOoCXdQyPtm1BVBk8u2afe9gLJNdJ2nzPKx1xI5oH7ryIHTe07kmu
 wUxQ==
X-Gm-Message-State: APjAAAWkHSG3VNbgh/xJw9xNAXrVGPI7jNNcdh8VKI84JClwPDbZ5elT
 C1Q0CcqKkyBgd/N5PdcZLUbYi8Cf9pCE7QuFtNSy9FAUpc4DDOcqZO+fCzaEEGxYb9mpuUvsDxz
 v6fRtEZuExho/xoZvOFyqcH9cnzWI
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr3706988wmm.145.1575541344293; 
 Thu, 05 Dec 2019 02:22:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIBQBRqyvopjnTZJ1NeKsKZIwQ0OV7bU/UZtQCKNf5+J4JDf0f71xe1rLVBcdblu3GRJ9yUA==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr3706957wmm.145.1575541344042; 
 Thu, 05 Dec 2019 02:22:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:541f:a977:4b60:6802?
 ([2001:b07:6468:f312:541f:a977:4b60:6802])
 by smtp.gmail.com with ESMTPSA id c1sm11635129wrs.24.2019.12.05.02.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 02:22:23 -0800 (PST)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Dmitry Vyukov <dvyukov@google.com>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
Date: Thu, 5 Dec 2019 11:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: gzdPwmEkOGys-5O3MNsxxQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575541347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaIFegi+0Clb4nOD0Kmjt0kKgC/aYqjcyu4Ow354nhs=;
 b=AlTrzQir4JWInpL9EkmZTHlUljf8NACOfC1zqZygvX8ygbD9zFnHbvMWZqbShensWFZ9Sk
 5hNOQHmHAoSpMLecCb13w1T93iS6Eh2Wlqt/J4G87H48NnXgw9qK8Iloj68djUpobF13Ur
 mlEKJ70LNKjZE0oiueHOBBQFFNk0bb0=
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

T24gMDUvMTIvMTkgMTE6MTYsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4gT24gVGh1LCBEZWMgNSwg
MjAxOSBhdCAxMToxMyBBTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90
ZToKPj4KPj4gT24gMDQvMTIvMTkgMjI6NDEsIHN5emJvdCB3cm90ZToKPj4+IHN5emJvdCBoYXMg
YmlzZWN0ZWQgdGhpcyBidWcgdG86Cj4+Pgo+Pj4gY29tbWl0IDJkZTUwZTk2NzRmYzRjYTNjNjE3
NGIwNDQ3N2Y2OWViMjZiNGVlMzEKPj4+IEF1dGhvcjogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBy
dXNzZWxsLmNjPgo+Pj4gRGF0ZTogICBNb24gRmViIDggMDQ6MDg6MjAgMjAxNiArMDAwMAo+Pj4K
Pj4+ICAgICBwb3dlcnBjL3Bvd2VybnY6IFJlbW92ZSBzdXBwb3J0IGZvciBwNWlvYzIKPj4+Cj4+
PiBiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3Qu
dHh0P3g9MTI3YTA0MmFlMDAwMDAKPj4+IHN0YXJ0IGNvbW1pdDogICA3NmJiOGIwNSBNZXJnZSB0
YWcgJ2tidWlsZC12NS41JyBvZgo+Pj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcC4uCj4+PiBnaXQg
dHJlZTogICAgICAgdXBzdHJlYW0KPj4+IGZpbmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xMTdhMDQyYWUwMDAwMAo+Pj4gY29uc29sZSBv
dXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE2N2EwNDJh
ZTAwMDAwCj4+PiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
eC8uY29uZmlnP3g9ZGQyMjY2NTFjYjBmMzY0Ygo+Pj4gZGFzaGJvYXJkIGxpbms6Cj4+PiBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NDQ1NWNhM2IzMjkxZGU4OTFhYmMK
Pj4+IHN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJv
LnN5ej94PTExMTgxZWRhZTAwMDAwCj4+PiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTA1Y2JiN2FlMDAwMDAKPj4+Cj4+PiBSZXBvcnRl
ZC1ieTogc3l6Ym90KzQ0NTVjYTNiMzI5MWRlODkxYWJjQHN5emthbGxlci5hcHBzcG90bWFpbC5j
b20KPj4+IEZpeGVzOiAyZGU1MGU5Njc0ZmMgKCJwb3dlcnBjL3Bvd2VybnY6IFJlbW92ZSBzdXBw
b3J0IGZvciBwNWlvYzIiKQo+Pj4KPj4+IEZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24g
cHJvY2VzcyBzZWU6Cj4+PiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCj4+Pgo+Pgo+
PiBXaHkgaXMgZXZlcnlib2R5IGJlaW5nIENDJ2QsIGV2ZW4gaWYgdGhlIGJ1ZyBoYXMgbm90aGlu
ZyB0byBkbyB3aXRoIHRoZQo+PiBwZXJzb24ncyBzdWJzeXN0ZW0/Cj4gCj4gVGhlIFRvIGxpc3Qg
c2hvdWxkIGJlIGludGVyc2VjdGlvbiBvZiAyIGdyb3VwcyBvZiBlbWFpbHM6IHJlc3VsdCBvZgo+
IGdldF9tYWludGFpbmVycy5wbCBvbiB0aGUgZmlsZSBpZGVudGlmaWVkIGFzIGN1bHByaXQgaW4g
dGhlIGNyYXNoCj4gbWVzc2FnZSArIGVtYWlscyBleHRyYWN0ZWQgZnJvbSB0aGUgYmlzZWN0ZWQg
dG8gY29tbWl0LgoKQWgsIGFuZCBiZWNhdXNlIHRoZSBtYWNoaW5lIGlzIGEgS1ZNIGd1ZXN0LCBr
dm1fd2FpdCBhcHBlYXJzIGluIGEgbG90IG9mCmJhY2t0cmFjZSBhbmQgSSBnZXQgdG8gc2hhcmUg
c3l6a2FsbGVyJ3Mgam95IGV2ZXJ5IHRpbWUuIDopCgpUaGlzIGJpc2VjdCByZXN1bHQgaXMgYm9n
dXMsIHRob3VnaCBUZXRzdW8gZm91bmQgdGhlIGJ1ZyBhbnl3YXkuClBlcmhhcHMgeW91IGNhbiBl
eGNsdWRlIGNvbW1pdHMgdGhhdCBvbmx5IHRvdWNoIGFyY2hpdGVjdHVyZXMgb3RoZXIgdGhhbgp4
ODY/CgpQYW9sbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
