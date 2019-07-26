Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7D78613
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8289C96;
	Mon, 29 Jul 2019 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3D6ED9F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:00:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y17so27211793ljk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UzwsdEpQP2Y4hgncO9eMUg7V4ByKsDvR7x0L9gt2XHw=;
 b=Opia6JCnCFoDAO1KwPizbjnR6g/zOjMAE9duPzyIUSWJBOV7/DxkMq8E9kA2ECdiPT
 CzBnh+becASFLe6QCPRBKS1qG2UgkZTSmnGL/1vMLaQGTu/MbJjUnW3+yN80SOJuqA7Y
 5cyeMz2WCB+uYDb+68twUvL8RTQDyEXtWRQsdEct4auwK8fYFxkeZzRbk5H94kDgCXAK
 A5XQv7ilR7mk9Va3k81NorLB+S//57+OZ0v3GYNcL+eBeiNmOMvpOOHPKAcpeyjuSZnu
 ioKeOLUI1dGJDlXnLJrM9YH5iss6+c0A3mBAfCESrOk4nCSC1C1hSKLb2UIAMkbDj1O3
 PSUA==
X-Gm-Message-State: APjAAAWlwt3Xstt5NJhtsB/hdSy8lERvNDA1lfO5LUXwLp/9IQhf6P+j
 kCT++36mx4diZ1IS9bS0FpY=
X-Google-Smtp-Source: APXvYqyfDuR/ORC/0Vvf/aBh3VaaWLhNE8k0fG7DJsoreWWXGTys1LvcDswSlr21DcxALfS0U6j/Uw==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr47509855ljg.197.1564153249440; 
 Fri, 26 Jul 2019 08:00:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id m4sm10128649ljc.56.2019.07.26.08.00.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 08:00:48 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
To: Stefan Agner <stefan@agner.ch>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
 <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
 <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
 <d02d9605797d784dc941c9d98769bf5d@agner.ch>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72141479-4ee8-d151-90dc-168e5c9a79c2@gmail.com>
Date: Fri, 26 Jul 2019 18:00:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d02d9605797d784dc941c9d98769bf5d@agner.ch>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UzwsdEpQP2Y4hgncO9eMUg7V4ByKsDvR7x0L9gt2XHw=;
 b=ay33YbtJZ+OTKtoUZC8QPAj1U+YbwlUXIutsts+q0e3pxzFOzhdh8xZ1RG066hSNPR
 iL2LEndafJqpl0VFzh7wCBadhUi7tGmgZuzawYuxjN6mugE2DQmvf/amL8dBPkkGhSve
 XgsCGXvmA72ISx3do72TtxQZ1BEWZhbOQb9zvWoMouiExBpJaH0XCTgelU13UOJT0X5z
 XLMqqQ8oQLwGi1HoXDy3tkW/FgslFxEJlcZoGgfAIDPYj1OBr+SUyDXxPod70MPjVlSJ
 F6MkEVpg9dmtVSPoVUIqFhMQCxWSHRWqYgwP4nt3TTcTytwBJMwAfsS0afBcaFBMDsPU
 LG7g==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDcuMjAxOSAxNzo1NywgU3RlZmFuIEFnbmVyINC/0LjRiNC10YI6Cj4gT24gMjAxOS0wNy0y
NiAxNjo0NiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyNi4wNy4yMDE5IDE3OjIzLCBTdGVm
YW4gQWduZXIg0L/QuNGI0LXRgjoKPj4+IEhpIFRoaWVycnksIEhpIERhdmUsCj4+Pgo+Pj4gT24g
MjAxOC0wOS0wNyAwMTozMSwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+Pj4+IE9uIDI2LjA3LjIwMTgg
MDY6MzYsIFN0ZWZhbiBBZ25lciB3cm90ZToKPj4+Pj4gSWYgdGhlIEdQSU8gc3Vic3lzdGVtIGlz
IG5vdCByZWFkeSBtYWtlIHN1cmUgdG8gcmV0dXJuIC1FUFJPQkVfREVGRVIKPj4+Pj4gaW5zdGVh
ZCBvZiBzaWxlbnRseSBjb250aW51aW5nIHdpdGhvdXQgSFBELgo+Pj4+Pgo+Pj4+PiBSZXBvcnRl
ZC1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+Cj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+Pj4+Cj4+Pj4g
SSB0aGluayB0aGlzIGRpZCBub3QgZ2V0IG1lcmdlZCB5ZXQsIGFueSBjaGFuY2UgdG8gZ2V0IGl0
IGluPwo+Pj4KPj4+IEFueSBjaGFuY2UgdG8gZ2V0IHRoaXMgaW4gaW4gdGhlIG5leHQgbWVyZ2Ug
d2luZG93Pwo+Pgo+PiBUaGUgcGF0Y2ggaXNuJ3QgcmVsZXZhbnQgYW55bW9yZSAoc2luY2UgdjUu
MykgYmVjYXVzZSB0aGUgY29kZSB3YXMKPj4gY2hhbmdlZCBhbmQgbm93IHByb3BhZ2F0ZXMgdGhl
IHByb3BlciBlcnJvciBjb2RlIGluIGEgY2FzZSBvZiBlcnJvciwKPj4gcGxlYXNlIHNlZSBbMV0u
Cj4+Cj4+IFsxXQo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPXY1LjMtcmMxJmlkPWJiYWQ2NDA3MDlm
ZDQzZmY3N2I4ODM4YzQwOWM5NzdjMGIyODQzMGMKPiAKPiBPaCBJIHNlZSwgSSBhY2NpZGVudGFs
bHkgY2hlY2tlZCBpbiBMaW51eCA1LjIuIFNvcnJ5IGZvciB0aGUgbm9pc2UgYW5kCj4gdGhhbmtz
IGZvciB0aGUgbGluayEKCk5vIHByb2JsZW1zLCB5b3UncmUgd2VsY29tZS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
