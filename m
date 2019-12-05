Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646C114020
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079546E056;
	Thu,  5 Dec 2019 11:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD286E056
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 11:29:27 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-1TElJQ6KNz6HmezMgYUGdg-1; Thu, 05 Dec 2019 06:29:24 -0500
Received: by mail-wr1-f70.google.com with SMTP id o6so1400956wrp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 03:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lbaSGfutZwhZA116gvr95IAUlIVoaJxPvvW+eFCW8zI=;
 b=R3btPqgAeU7CSHeSnrcY/YIrfqenXU1e0X37Amyb9z7J7lrfsMsLTV6r8vsAZMNb8W
 55gZ0GMJtCypERFFLwQl/zM3XORb49Tt+GMlzNTbAvEUMXPvlSP/KbYI0mI4zdWVkmAq
 75RrG4r1J0Rao1bUE8SjhJG9tbrOcbSKiRLjVU16oqpIT3cPFxxPe1MTN2HHtdtJXzyh
 NUSXk5GWDNJOET552R2CXCCmqIttaIeS8FzL81UwirkOpXyumKnE0CtIWfayUtwdJSR0
 9i/AIJbR7kWjLoPcxa9y37tmFHL0KqtVT++jBXXaqjVasuGGgeubmME5ja/MtRpO1q2Z
 WCUw==
X-Gm-Message-State: APjAAAV9rMWEvRcKs64quYlHBhRsPWmng1hnWd7SXrYIR12N5MAxU1XW
 r0MrVprNfHW5uv3CNJSPgKiTBkdRjBSVKN371tx3mEzklkRfQgD9pCQzAxqdjqUW73vx6+G41mI
 a9pr/dW9BN69u90GJ/BJdmoft5pBs
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr4900394wmd.46.1575545363049; 
 Thu, 05 Dec 2019 03:29:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9Xt8ZW3hE0/KfrEcZYT8qrPPraxHN0nr72IWYS5MoUhQN15mYYzXu7Q6Ai0EaHlN2GKcQ5w==
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr4900356wmd.46.1575545362806; 
 Thu, 05 Dec 2019 03:29:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:541f:a977:4b60:6802?
 ([2001:b07:6468:f312:541f:a977:4b60:6802])
 by smtp.gmail.com with ESMTPSA id e18sm11632611wrr.95.2019.12.05.03.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 03:29:22 -0800 (PST)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: Dmitry Vyukov <dvyukov@google.com>
References: <0000000000003e640e0598e7abc3@google.com>
 <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
 <CACT4Y+bCHOCLYF+TW062n8+tqfK9vizaRvyjUXNPdneciq0Ahg@mail.gmail.com>
 <f4db22f2-53a3-68ed-0f85-9f4541530f5d@redhat.com>
 <CACT4Y+ZHCmTu4tdfP+iCswU3r6+_NBM9M-pAZEypVSZ9DEq3TQ@mail.gmail.com>
 <e03140c6-8ff5-9abb-1af6-17a5f68d1829@redhat.com>
 <CACT4Y+YopHoCFDRHCE6brnWfHb5YUsTJS1Mc+58GgO8CDEcgHQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bf93410c-7e59-a679-c00d-5333a9879128@redhat.com>
Date: Thu, 5 Dec 2019 12:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YopHoCFDRHCE6brnWfHb5YUsTJS1Mc+58GgO8CDEcgHQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 1TElJQ6KNz6HmezMgYUGdg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575545366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbaSGfutZwhZA116gvr95IAUlIVoaJxPvvW+eFCW8zI=;
 b=CfZ3QxOilJHUg/9hUsTlI2UEA2OJ14sZ4AHTCMbsR9n6zTUlhYJg12AVuv2lS9BFqV1B7E
 nds0HuRQFoVPwXIV70y6YZH7WknvDk7093+9iM5p8kqVwJcywaikN7AlYt0DQJvzx4JBmw
 UCsG1rOqeEoJ/JiAvdHkT1+O4bY8z8U=
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

T24gMDUvMTIvMTkgMTI6MjcsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4gT2gsIHlvdSBtZWFuIHRo
ZSBmaW5hbCBiaXNlY3Rpb24gY3Jhc2guIEluZGVlZCBpdCBjb250YWlucyBhIGt2bSBmcmFtZQo+
IGFuZCBpdCB0dXJucyBvdXQgdG8gYmUgYSBidWcgaW4gc3l6a2FsbGVyIGNvZGUgdGhhdCBpbmRl
ZWQKPiBtaXNhdHRyaWJ1dGVkIGl0IHRvIGt2bSBpbnN0ZWFkIG9mIG5ldGZpbHRlci4KPiBTaG91
bGQgYmUgZml4ZWQgbm93LCB5b3UgbWF5IHJlYWQgdGhlIGNvbW1pdCBtZXNzYWdlIGZvciBkZXRh
aWxzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVyL2NvbW1pdC80ZmI3NDQ3
NGNmMGFmMjEyNmJlM2E4OTg5ZDc3MGMzOTQ3YWU5NDc4Cj4gCj4gT3ZlcmFsbCB0aGlzICJtYWtp
bmcgc2Vuc2Ugb3V0IG9mIGtlcm5lbCBvdXRwdXQiIHRhc2sgaXMgdGhlIHVsdGltYXRlCj4gaW5z
YW5pdHksIHlvdSBtYXkgc2tpbSB0aHJvdWdoIHRoaXMgZmlsZSB0byBnZXQgYSB0YXN0ZSBvZiBh
bW91bnQgb2YKPiBoYXJkY29kaW5nIGFuZCBzcGVjaWFsIGNvcm5lciBjYXNlcyB0aGF0IG5lZWQg
dG8gYmUgaGFuZGxlZDoKPiBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxlci9ibG9i
L21hc3Rlci9wa2cvcmVwb3J0L2xpbnV4LmdvCj4gQW5kIHRoaXMgaXMgbmV2ZXIgZG9uZSwgc3Vj
aCAiZXhjZXB0aW9uIGZyb20gZXhjZXB0aW9uIGNvcm5lciBjYXNlIgo+IHRoaW5ncyBwb3AgdXAg
ZXZlcnkgd2Vlay4gVGhlcmUgaXMgYWx3YXlzIHNvbWV0aGluZyB0byBzaHVmZmxlIGFuZAo+IHR1
bmUuIEl0IG9ubHkga2VlcHMgZnVuY3Rpb25pbmcgZHVlIHRvIDUwMCsgdGVzdCBjYXNlcyBmb3Ig
YWxsCj4gcG9zc2libGUgaW5zYW5lIGtlcm5lbCBvdXRwdXRzOgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9nb29nbGUvc3l6a2FsbGVyL3RyZWUvbWFzdGVyL3BrZy9yZXBvcnQvdGVzdGRhdGEvbGludXgv
cmVwb3J0Cj4gaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvdHJlZS9tYXN0ZXIv
cGtnL3JlcG9ydC90ZXN0ZGF0YS9saW51eC9ndWlsdHkKPiAKPiBTbyB0aGFua3MgZm9yIHBlcnNp
c3RpbmcgYW5kIHF1ZXN0aW9uaW5nISBXZSBhcmUgZ2V0dGluZyBiZXR0ZXIgd2l0aAo+IGVhY2gg
bmV3IHRlc3QuCgpUaGFua3MgdG8geW91ISAgSSAiY29tcGxhaW4iIGJlY2F1c2UgSSBrbm93IHlv
dSdyZSBzbyByZXNwb25zaXZlLiA6KQoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
