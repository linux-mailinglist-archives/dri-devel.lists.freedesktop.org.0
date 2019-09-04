Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C05A8141
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687BF896E5;
	Wed,  4 Sep 2019 11:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2BB896E5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:44:08 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t24so15528707oij.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 04:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+j6qs7WQfu4dAUrdhez3m/4Ue+xLmyXGa3x2aGEysyw=;
 b=HXumA027SrW1x3rj3sz/LqkUrjmWvfovBQWcZhWMa+BOcssw9SZlTqDSqjfZ5Gdxp7
 QorLaMTBYgVyZE4WzGFdsh4RO/n1N9hhTwNxgiluyXRyzN+eQB0Ts4P9eVWbxrPih7Fo
 Bvb7yeAw3VslGoFTksaHYgiE7LeGCVH6AaM8ipRNnx18+Zu2stILCRrN+fDCdp14PF53
 q13FGLnjrQYrRaDqcnHl5cwF5+qbhJ7CiyVJgbf8mbtL0+5RDEeTfY8CMlS3bzUKe8fa
 k0eVePlgvMODhhxHO6yFwGSp4G0Ls71hobWTfhPpMaDnPeL9X3EccdSZWqHX9774Mi32
 3OFg==
X-Gm-Message-State: APjAAAWWU0NtYkcVwYLJEVnF3sWDc0FMBALGCqdzjDPv8MAxJxtEToiP
 RXubzLgzz/lTOGHkZARf1+sTtlOy2LMEif1w+5whTA==
X-Google-Smtp-Source: APXvYqx2jqlv3dUQJsCCVgaOhAfgDv9rgsHFd3fDcbcS6XpqczhHB6lDb16xvUPJbP1/L4REmqwCaUtBgJqYnidviGY=
X-Received: by 2002:aca:e182:: with SMTP id y124mr2872478oig.132.1567597447659; 
 Wed, 04 Sep 2019 04:44:07 -0700 (PDT)
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
 <CAKMK7uH0jxaWJLxfXfGLyN-Rb=0ZKUFTkrEPdFCuGCh4ORCv9w@mail.gmail.com>
 <0fd10438-5da4-fb69-f40c-c9b4beea1977@shipmail.org>
In-Reply-To: <0fd10438-5da4-fb69-f40c-c9b4beea1977@shipmail.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 13:43:56 +0200
Message-ID: <CAKMK7uGPWj8pU0FCV_2aR6sDQgw9VAimkG3hnGcQJsxE1-2_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+j6qs7WQfu4dAUrdhez3m/4Ue+xLmyXGa3x2aGEysyw=;
 b=cOrLS8VV/hmB7qdaVJRgYtWT5lCOR/hUsT57DW7q6z6LIS5TBoOE4yPL2XvAxV9t7B
 OuVwOo0aQJVX5uzcIMcroh0aWTvvrk02+fOJB8SB75FOYuuXDVdVD9YWjT5yn4CyIQmp
 qBNA9TyjJvMfKwF17RDqtObPuToCbHTcvTFNE=
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

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMjozOCBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBPbiA5LzQvMTkgOTo1MyBBTSwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDQsIDIwMTkgYXQgODo0OSBBTSBU
aG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+ID4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdy
b3RlOgo+ID4+IE9uIDkvNC8xOSAxOjE1IEFNLCBBbmR5IEx1dG9taXJza2kgd3JvdGU6Cj4gPj4+
IEJ1dCwgcmVhZGluZyB0aGlzLCBJIGhhdmUgbW9yZSBxdWVzdGlvbnM6Cj4gPj4+Cj4gPj4+IENh
buKAmXQgeW91IGdldCByaWQgb2YgY3ZtYSBieSB1c2luZyB2bWZfaW5zZXJ0X3Bmbl9wcm90KCk/
Cj4gPj4gSXQgbG9va3MgbGlrZSB0aGF0LCBhbHRob3VnaCB0aGVyZSBhcmUgY29tbWVudHMgaW4g
dGhlIGNvZGUgYWJvdXQKPiA+PiBzZXJpb3VzIHBlcmZvcm1hbmNlIHByb2JsZW1zIHVzaW5nIFZN
X1BGTk1BUCAvIHZtZl9pbnNlcnRfcGZuKCkgd2l0aAo+ID4+IHdyaXRlLWNvbWJpbmluZyBhbmQg
UEFULCBzbyB0aGF0IHdvdWxkIHJlcXVpcmUgc29tZSBzZXJpb3VzIHRlc3Rpbmcgd2l0aAo+ID4+
IGhhcmR3YXJlIEkgZG9uJ3QgaGF2ZS4gQnV0IEkgZ3Vlc3MgdGhlcmUgaXMgZGVmaW5pdGVseSBy
b29tIGZvcgo+ID4+IGltcHJvdmVtZW50IGhlcmUuIElkZWFsbHkgd2UnZCBsaWtlIHRvIGJlIGFi
bGUgdG8gY2hhbmdlIHRoZQo+ID4+IHZtYS0+dm1fcGFnZV9wcm90IHdpdGhpbiBmYXVsdCgpLiBC
dXQgd2UgY2FuCj4gPiBKdXN0IGEgcXVpY2sgY29tbWVudCBvbiB0aGlzOiBJdCdzIHRoZSByZXBl
YXRlZCAocGVyLXBmbi9wdGUpIGxvb2t1cAo+ID4gb2YgdGhlIFBBVCB0YWJsZXMsIHdoaWNoIGFy
ZSBkZWFkIHNsb3cuIElmIHlvdSBoYXZlIGEgc3RydWN0Cj4gPiBpb19tYXBwaW5nIHRoZW4gdGhh
dCBjYW4gYmUgZG9uZSBvbmNlLCBhbmQgdGhlbiBqdXN0IGJsaW5kbHkgaW5zZXJ0ZWQuCj4gPiBT
ZWUgcmVtYXBfaW9fbWFwcGluZyBpbiBpOTE1Lgo+ID4gLURhbmllbAo+Cj4gVGhhbmtzLCBEYW5p
ZWwuCj4KPiBJbmRlZWQgbG9va3MgYSBsb3QgbGlrZSByZW1hcF9wZm5fcmFuZ2UoKSwgYnV0IHVz
YWJsZSBhdCBmYXVsdCB0aW1lPwoKWWVhaCB3ZSBjYWxsIGl0IGZyb20gb3VyIGZhdWx0IGhhbmRs
ZXIuIEl0J3MgZXNzZW50aWFsbHkgdm1faW5zZXJ0X3BmbgpleGNlcHQgdGhlIHBhdCB0cmFjayBp
c24ndCB0aGVyZSwgYnV0IGluc3RlYWQgcmVsaWVzIG9uIHRoZSBwYXQKdHJhY2tpbmcgaW9fbWFw
cGluZyBoYXMgZG9uZSBhbHJlYWR5LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
