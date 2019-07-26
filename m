Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DA7861F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D227C89CB8;
	Mon, 29 Jul 2019 07:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D956ED94
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:46:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h10so51749066ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ngavBtIxx1ZHHLm1jYRPvkhoDxTlTbQTiXBro1aKL/s=;
 b=X/VIzzzt17hLNxnKQkTZrn66A88+gPXoLNColpgf84EaLV0VuvKQQ6Rw4jcwe0gx0A
 6mbwgisjQuLikjqFiwNDArvBxTixTYGbFs1IqFsQ26v9Kmyz4D6CwV4bm+qDVOFPJZmQ
 UJWsawthZKPTvTlONeNNvfe44Z/ILp4xmu3fqYPS5g/0MkUScyh6AG4papLLpfOJdN4V
 drg9WBb1ukfh3Yudyw7GuedRDcITcpDia04V8yC8en+EANWIk/A+5VmDogAG5GCUfBOZ
 bR4AhiwPELlzEHP1vHfcZkBFF34lET34tOoiORNt14HwVe7T0la+H+Okn9wD9e0Ndxul
 4Wtw==
X-Gm-Message-State: APjAAAVZygVHZGHsT1Ji074Js8EjtM0yxoH4ogVx07YYUDfeQTPd9UNZ
 zYuYDKLlgq2UMAIyMrbA940=
X-Google-Smtp-Source: APXvYqxEAMHAtYXYoiYX0iqT9+JIeGKN9tzZGsYw27N7E++ru7XERerKKxfyYKK/DkJSuJojP+2vCQ==
X-Received: by 2002:a05:651c:95:: with SMTP id
 21mr50209286ljq.128.1564152377358; 
 Fri, 26 Jul 2019 07:46:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id h10sm8515352lfp.33.2019.07.26.07.46.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:46:16 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
To: Stefan Agner <stefan@agner.ch>, thierry.reding@gmail.com
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
 <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
Date: Fri, 26 Jul 2019 17:46:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ngavBtIxx1ZHHLm1jYRPvkhoDxTlTbQTiXBro1aKL/s=;
 b=PxfsFPU8+IUqWCWe+i72ZKO9kQh18DVzKU2MLFKKOUpu5zex1eZBUZVZ+AhQ61nVY4
 SK/9FEv8qOzyrSKLURXLa4fZn5XC84S4KSZn59mfqvGCTaTfzEc0knttSfT8VuoL4pT1
 nklzDsJ0jGn+ZdIn3FLHFxswbaaWyxaM3LgrREUYhhHUhqyRBuolf6eNYIGKYOGbIyO0
 EnxIoiToxgUEjTG7UkwOXT7MKntPT4NLWiXfxzsxBDxLLICGnwKApbyvYBCXZV93F6KT
 WSy7yWZBIML9Y9AhYqW7VG19j8Hvv7uIg1uNS/Mjnvx60aZcdxY+cM9RbUTD8bMH+d5g
 HoGg==
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
Cc: airlied@linux.ie, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDcuMjAxOSAxNzoyMywgU3RlZmFuIEFnbmVyINC/0LjRiNC10YI6Cj4gSGkgVGhpZXJyeSwg
SGkgRGF2ZSwKPiAKPiBPbiAyMDE4LTA5LTA3IDAxOjMxLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+
IE9uIDI2LjA3LjIwMTggMDY6MzYsIFN0ZWZhbiBBZ25lciB3cm90ZToKPj4+IElmIHRoZSBHUElP
IHN1YnN5c3RlbSBpcyBub3QgcmVhZHkgbWFrZSBzdXJlIHRvIHJldHVybiAtRVBST0JFX0RFRkVS
Cj4+PiBpbnN0ZWFkIG9mIHNpbGVudGx5IGNvbnRpbnVpbmcgd2l0aG91dCBIUEQuCj4+Pgo+Pj4g
UmVwb3J0ZWQtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29t
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4+Cj4+
IEkgdGhpbmsgdGhpcyBkaWQgbm90IGdldCBtZXJnZWQgeWV0LCBhbnkgY2hhbmNlIHRvIGdldCBp
dCBpbj8KPiAKPiBBbnkgY2hhbmNlIHRvIGdldCB0aGlzIGluIGluIHRoZSBuZXh0IG1lcmdlIHdp
bmRvdz8KClRoZSBwYXRjaCBpc24ndCByZWxldmFudCBhbnltb3JlIChzaW5jZSB2NS4zKSBiZWNh
dXNlIHRoZSBjb2RlIHdhcwpjaGFuZ2VkIGFuZCBub3cgcHJvcGFnYXRlcyB0aGUgcHJvcGVyIGVy
cm9yIGNvZGUgaW4gYSBjYXNlIG9mIGVycm9yLApwbGVhc2Ugc2VlIFsxXS4KClsxXQpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvY29tbWl0Lz9oPXY1LjMtcmMxJmlkPWJiYWQ2NDA3MDlmZDQzZmY3N2I4ODM4YzQwOWM5Nzdj
MGIyODQzMGMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
