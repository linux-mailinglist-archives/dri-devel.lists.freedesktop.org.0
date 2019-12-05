Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE49113F1F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 11:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A259F6F63A;
	Thu,  5 Dec 2019 10:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714076F63A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:13:26 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-W7bqeEm5MZSK9mK2wh5uCw-1; Thu, 05 Dec 2019 05:13:24 -0500
Received: by mail-wr1-f71.google.com with SMTP id w6so1300650wrm.16
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 02:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K5MgG/FvOKZSKbQY6hPWHA5W+WMbjReooYZ5I81Xsns=;
 b=RTfd0skusNC+Kqt+Qe7XujVxghYNgsziMFREplD+UtXkQmxyA5szOdeNmheSmmAvah
 z0zFqlMaP5vnwZ13qXg14zrTiSVY/LomB8IQ5SkeFxztO8vyVXOO1DZn2fGCgrE92bDp
 w16xCQXC3QGk5gMIDYIs/4hZOXCyhNTbc8aLA2UQit4FEblW6P+cYuvCJ/3wydEdN+em
 NJclCebla11mBgV15c/rKaf3j4Hkofeo6ctdOZW0TY5eoCTMvysnougT/ME3hdVLsR0M
 0T87c+o+blOc+gNmlD+cc8LAycXo2O2OryCJLLW03l4f8dS+X5yHyj/IxGvKWaU3//zv
 aw6A==
X-Gm-Message-State: APjAAAVYk+ZIIxMK5BxxEdq36+8D0TBY8Q3Uzsv+NzYgFOnFeiC8RBAD
 NSAPyIAz2pFkVjmI6trBU9vgJUBgoipp0F+lAXocC8OvaYZRhOxm1CXfzQloO8A78Sv8UdqsnC2
 fZRvkhSlyTQMcl9KbNzs6cjHE4x26
X-Received: by 2002:adf:ee88:: with SMTP id b8mr9668751wro.249.1575540802662; 
 Thu, 05 Dec 2019 02:13:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1I4G0ttOXF/rUkkrOfkbFkbQZCtitZoVCfOg6HbWgiUhViQ9mKyA8AXZI2yuHHuDJRNzr4g==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr9668720wro.249.1575540802410; 
 Thu, 05 Dec 2019 02:13:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:541f:a977:4b60:6802?
 ([2001:b07:6468:f312:541f:a977:4b60:6802])
 by smtp.gmail.com with ESMTPSA id b10sm11809139wrt.90.2019.12.05.02.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 02:13:21 -0800 (PST)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
To: syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>,
 aryabinin@virtuozzo.com, b.zolnierkie@samsung.com,
 daniel.thompson@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, dvyukov@google.com, ghalat@redhat.com,
 gleb@kernel.org, gwshan@linux.vnet.ibm.com, hpa@zytor.com,
 jmorris@namei.org, kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mingo@redhat.com, mpe@ellerman.id.au, penguin-kernel@i-love.sakura.ne.jp,
 ruscur@russell.cc, sam@ravnborg.org, serge@hallyn.com,
 stewart@linux.vnet.ibm.com, syzkaller-bugs@googlegroups.com,
 takedakn@nttdata.co.jp, tglx@linutronix.de, x86@kernel.org
References: <0000000000003e640e0598e7abc3@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <41c082f5-5d22-d398-3bdd-3f4bf69d7ea3@redhat.com>
Date: Thu, 5 Dec 2019 11:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0000000000003e640e0598e7abc3@google.com>
Content-Language: en-US
X-MC-Unique: W7bqeEm5MZSK9mK2wh5uCw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575540805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLjLck9Pm/snpxos2FeKTPLyXDOV4MbjcH5G/gXnZeo=;
 b=UrjqAl0FdTx1DR8II4SItSOlGSaV0zYAIeT3P/cdj/b/s/gfViXXoV2xNJ0RLZmdjU6cu/
 4KkfTSYf+GJf2ciZm6bDahr2A/wf9HqN4Mlt25JTIiiatJD4ES0ba0cBW180jJzJnulzny
 hZ6p2Oxf2aBUKy28i3TAT+CG9DJG3MI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQvMTIvMTkgMjI6NDEsIHN5emJvdCB3cm90ZToKPiBzeXpib3QgaGFzIGJpc2VjdGVkIHRo
aXMgYnVnIHRvOgo+IAo+IGNvbW1pdCAyZGU1MGU5Njc0ZmM0Y2EzYzYxNzRiMDQ0NzdmNjllYjI2
YjRlZTMxCj4gQXV0aG9yOiBSdXNzZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3NlbGwuY2M+Cj4gRGF0
ZTrCoMKgIE1vbiBGZWIgOCAwNDowODoyMCAyMDE2ICswMDAwCj4gCj4gwqDCoMKgIHBvd2VycGMv
cG93ZXJudjogUmVtb3ZlIHN1cHBvcnQgZm9yIHA1aW9jMgo+IAo+IGJpc2VjdGlvbiBsb2c6wqAg
aHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTI3YTA0MmFlMDAw
MDAKPiBzdGFydCBjb21taXQ6wqDCoCA3NmJiOGIwNSBNZXJnZSB0YWcgJ2tidWlsZC12NS41JyBv
Zgo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3AuLgo+IGdpdCB0cmVlOsKgwqDCoMKgwqDCoCB1cHN0
cmVhbQo+IGZpbmFsIGNyYXNoOsKgwqDCoCBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94
L3JlcG9ydC50eHQ/eD0xMTdhMDQyYWUwMDAwMAo+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjdhMDQyYWUwMDAwMAo+IGtlcm5lbCBj
b25maWc6wqAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9ZGQyMjY2
NTFjYjBmMzY0Ygo+IGRhc2hib2FyZCBsaW5rOgo+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL2J1Zz9leHRpZD00NDU1Y2EzYjMyOTFkZTg5MWFiYwo+IHN5eiByZXBybzrCoMKgwqDCoMKg
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9MTExODFlZGFlMDAw
MDAKPiBDIHJlcHJvZHVjZXI6wqDCoCBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3Jl
cHJvLmM/eD0xMDVjYmI3YWUwMDAwMAo+IAo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNDQ1NWNhM2Iz
MjkxZGU4OTFhYmNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiAyZGU1MGU5Njc0
ZmMgKCJwb3dlcnBjL3Bvd2VybnY6IFJlbW92ZSBzdXBwb3J0IGZvciBwNWlvYzIiKQo+IAo+IEZv
ciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6Cj4gaHR0cHM6Ly9nb28u
Z2wvdHBzbUVKI2Jpc2VjdGlvbgo+IAoKV2h5IGlzIGV2ZXJ5Ym9keSBiZWluZyBDQydkLCBldmVu
IGlmIHRoZSBidWcgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUKcGVyc29uJ3Mgc3Vic3lzdGVt
PwoKVGhhbmtzLAoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
