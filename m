Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5A113FB9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 11:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354AD6E98F;
	Thu,  5 Dec 2019 10:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08286E98F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:53:13 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-qRXaY83pOj-JeYHqudeC4A-1; Thu, 05 Dec 2019 05:53:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id u18so1354113wrn.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 02:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZ3pcvbIa/5GjW3TrOtnvfQxM6Nrqq/Ve/xoy67596c=;
 b=mRtx/a2hPoTtzMIQzAMyW3JiJsAlAYS3x5JEPd2zFO98VZZYH70Mqahj+FDPFl4PGI
 Dj8VyiMSw2qDT/SyyZJb5UzNR3R3ClS45J8AQYhJirNY9RgxU9IENJAnNTguaAriJhsG
 jlKjf0laNdNTsQOMOTZMzz73Xd0swZ6nAf4WqXT7D4XTwypgmn2Q+Heg57L/eUA+sPND
 v0XRXlKAY0en0BXVRC1cGk+7EECHapBXAnM7InudCFegJCuwBxyY6SVtW9q6L/2U7Hr/
 KphtokPkSokhyS3w7MbBzoz4RlDwI74CRhKbGIHzwdvs/xd1a6XKDd5Esn9lJUJu0tir
 0gTQ==
X-Gm-Message-State: APjAAAWOro+CYqSqYN82KPlY2zQMr3J8uqv1ATP/O8bIkcUQ+xi+OjKj
 Jhp8/bOMQSiMdBWVd1ez67oSLiB9h+4qTxjigfOsfjVodx56SMYyIMOVzdyHza+7nOWQ5JHLyCj
 zOVmDii8ItHVcN2OdHXAPWBd1v00/
X-Received: by 2002:adf:c446:: with SMTP id a6mr9047823wrg.218.1575543184810; 
 Thu, 05 Dec 2019 02:53:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwx9CUNwWlq1RaO/psV1pKv4CxKZxc0hZLR/nlLtAxIYf4QbMkgK8PoODzgoTEjMUq7CbXTeA==
X-Received: by 2002:adf:c446:: with SMTP id a6mr9047792wrg.218.1575543184607; 
 Thu, 05 Dec 2019 02:53:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:541f:a977:4b60:6802?
 ([2001:b07:6468:f312:541f:a977:4b60:6802])
 by smtp.gmail.com with ESMTPSA id f1sm11989134wro.85.2019.12.05.02.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 02:53:04 -0800 (PST)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Dmitry Vyukov <dvyukov@google.com>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
 <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
Date: Thu, 5 Dec 2019 11:53:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: qRXaY83pOj-JeYHqudeC4A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575543192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZ3pcvbIa/5GjW3TrOtnvfQxM6Nrqq/Ve/xoy67596c=;
 b=gIvceokudmczFVqdxaZctrpeywVuFEOsS72HvCM/x0Fo/lOLZB4ykABFW35IshhzIVjMmm
 AmRbBW37G8O55wkImpEanm62kPsA60gQ2GlFKduMe2WGj3gTftSFU+D0Yncn6Ug5k+A0sR
 OvPvg5wGu9PLriJ9u3odla/tTzxE6W0=
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

T24gMDUvMTIvMTkgMTE6MzEsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+IEFoLCBhbmQgYmVjYXVz
ZSB0aGUgbWFjaGluZSBpcyBhIEtWTSBndWVzdCwga3ZtX3dhaXQgYXBwZWFycyBpbiBhIGxvdCBv
Zgo+PiBiYWNrdHJhY2UgYW5kIEkgZ2V0IHRvIHNoYXJlIHN5emthbGxlcidzIGpveSBldmVyeSB0
aW1lLiA6KQo+IEkgZG9uJ3Qgc2VlIGFueSBtZW50aW9uIG9mICJrdm0iIGluIHRoZSBjcmFzaCBy
ZXBvcnQuCgpJdCdzIHRoZXJlIGluIHRoZSBzdGFjayB0cmFjZSwgbm90IHN1cmUgaWYgdGhpcyBp
cyB3aGF0IHRyaWdnZXJlZCBteSBDYzoKCiBbPGZmZmZmZmZmODEwYzdjM2E+XSBrdm1fd2FpdCsw
eGNhLzB4ZTAgYXJjaC94ODYva2VybmVsL2t2bS5jOjYxMgoKUGFvbG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
