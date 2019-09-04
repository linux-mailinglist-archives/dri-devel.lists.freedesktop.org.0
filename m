Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0FAA7D17
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE9F89A7A;
	Wed,  4 Sep 2019 07:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC097898CC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 07:54:05 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c7so19730586otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 00:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nsL2dG0Jkv/yBtdq643XdQgXacAtlmVt/WZU7C9r86Q=;
 b=qqDTn4vGVgP+n+26Qm8p5FVZ0sHWu1mtB1RzulJNzsJ8I+kKiEY57DBidLFJqVslt+
 mrYvWWiGlaCvNigzxnV07ykDChc7unpgt22hMQJPOr0feT9Wt28HiarO21UuYsPl5uUl
 weYjpzX0C2ZP9b7vqVXLLEW4JLBduT4jqj9LXHshiguMhr+6l/r6J/u2RXjNsHazs7gs
 M3Ttt7zkIDtxdhUwLOA1PMU/TVgml7wMae+jLmjLfvy0yjAEyT2rSr8vMwKYuToiLLJE
 Co4xxfZTSj6GiOPV6pGgAbFmahFvs/dP+DqnashwYMNQkleFmBt4QqWgQbRq/ip73Eb4
 G1qg==
X-Gm-Message-State: APjAAAX1h15LyL3TLePR09nhA4vWGyYF+Fro0bD9Q6Cq7Vitrn1Mb/QW
 h4oBXIoqDy1cM9PNtLzEMGT+Zy/OMgyZDJ4F7rJYQA==
X-Google-Smtp-Source: APXvYqxIAUAvfPNM73tpeSvNr//yloLprQQu73fJhL+XKHcnaBcmH7124BD4NPk5vIXaT6rUNf8CFt+b+b0Z/W6osOs=
X-Received: by 2002:a05:6830:10d8:: with SMTP id
 z24mr11461873oto.281.1567583645124; 
 Wed, 04 Sep 2019 00:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
 <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
 <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
 <B3C5DD1B-A33C-417F-BDDC-73120A035EA5@amacapital.net>
 <3393108b-c7e3-c9be-b65b-5860c15ca228@shipmail.org>
In-Reply-To: <3393108b-c7e3-c9be-b65b-5860c15ca228@shipmail.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 09:53:53 +0200
Message-ID: <CAKMK7uH0jxaWJLxfXfGLyN-Rb=0ZKUFTkrEPdFCuGCh4ORCv9w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nsL2dG0Jkv/yBtdq643XdQgXacAtlmVt/WZU7C9r86Q=;
 b=Fpfim0KLgJ+FNUELGd/cGbfkJVwz26hJlETB2SD4TW1Yi+H4dORrDsb+7WOsgUCfCa
 wvIESBCC6aMyklaV4lbBJAoUZOpTVEfCpEgrnDEPYSaTF5HzRKGBzIWCpRMC+wTI2Kse
 X2iSsZIejDC/X+uhwFkMzF8Ia0FiRe8aLWGxI=
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>, Dave Hansen <dave.hansen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCA4OjQ5IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPiBPbiA5LzQvMTkgMToxNSBBTSwgQW5k
eSBMdXRvbWlyc2tpIHdyb3RlOgo+ID4gQnV0LCByZWFkaW5nIHRoaXMsIEkgaGF2ZSBtb3JlIHF1
ZXN0aW9uczoKPiA+Cj4gPiBDYW7igJl0IHlvdSBnZXQgcmlkIG9mIGN2bWEgYnkgdXNpbmcgdm1m
X2luc2VydF9wZm5fcHJvdCgpPwo+Cj4gSXQgbG9va3MgbGlrZSB0aGF0LCBhbHRob3VnaCB0aGVy
ZSBhcmUgY29tbWVudHMgaW4gdGhlIGNvZGUgYWJvdXQKPiBzZXJpb3VzIHBlcmZvcm1hbmNlIHBy
b2JsZW1zIHVzaW5nIFZNX1BGTk1BUCAvIHZtZl9pbnNlcnRfcGZuKCkgd2l0aAo+IHdyaXRlLWNv
bWJpbmluZyBhbmQgUEFULCBzbyB0aGF0IHdvdWxkIHJlcXVpcmUgc29tZSBzZXJpb3VzIHRlc3Rp
bmcgd2l0aAo+IGhhcmR3YXJlIEkgZG9uJ3QgaGF2ZS4gQnV0IEkgZ3Vlc3MgdGhlcmUgaXMgZGVm
aW5pdGVseSByb29tIGZvcgo+IGltcHJvdmVtZW50IGhlcmUuIElkZWFsbHkgd2UnZCBsaWtlIHRv
IGJlIGFibGUgdG8gY2hhbmdlIHRoZQo+IHZtYS0+dm1fcGFnZV9wcm90IHdpdGhpbiBmYXVsdCgp
LiBCdXQgd2UgY2FuCgpKdXN0IGEgcXVpY2sgY29tbWVudCBvbiB0aGlzOiBJdCdzIHRoZSByZXBl
YXRlZCAocGVyLXBmbi9wdGUpIGxvb2t1cApvZiB0aGUgUEFUIHRhYmxlcywgd2hpY2ggYXJlIGRl
YWQgc2xvdy4gSWYgeW91IGhhdmUgYSBzdHJ1Y3QKaW9fbWFwcGluZyB0aGVuIHRoYXQgY2FuIGJl
IGRvbmUgb25jZSwgYW5kIHRoZW4ganVzdCBibGluZGx5IGluc2VydGVkLgpTZWUgcmVtYXBfaW9f
bWFwcGluZyBpbiBpOTE1LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
