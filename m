Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE81C4E9F
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3426E520;
	Tue,  5 May 2020 06:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA4A89736
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 21:43:45 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a32so63239pje.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
 b=Xvklki9IQXKduwRuB61lYr5L7UeuVOeXXXrkX5wDjDsAsfcntdW37APtcUDnKjKhJQ
 WmOMHiPHAqFkCBadXH9VpgorfXKBgRC0zQZmDQwWEf5jjAq+8sw35TJd4O56nuC0k703
 NTgDizKysiTachoo/YlCwUkehsDeXiXfNjF4M7lF3SMYeAXACAwwZDDZQDSolHZ/7d6O
 79oHEf56eWYXRDOiQhteVbDsYiVu/7aMBQ8d1xe0YvOF9JKSUHXk+CT5dtJBcWQwdHPB
 Q+P888yZAB+7VPuN5NfWeILJtWbjJy9OZJSYmM80DQXMbQz1NklywNzhP6xiAxtWL0l/
 5ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
 b=RME1S3SSKemJQEfwVzkowSSDclM2FmPn+ILZU+j8nbPDXcw4upiHMpIPwKK2tj6k2+
 vjXJOshshMLWcFHH+2EJ13C8B8Kg0+QilPK5A5BSnUtEpc01pClPjS0HT0IKl4pI8MCz
 EEdqqE/hVAi8c0RDYvfblyFLDbgJiTP5ipUMf4m8g8+b+JcjUVKbv+JTe5cEYmn88OS+
 ZtFBBrHJJAULeEjes6IZj4QP5eDi/I06VeJGgGp7GjWXE6r0BLFmmCNO+0nCu30fQ14J
 UzwTthGOUV7npb1VEfukaCIrG6bi20cI+1KZ5bvCELGsaT7GNw98t4/2jRqzYC5dmFKP
 rFvQ==
X-Gm-Message-State: AGi0PuYANzI56IiUDfzdO1hiRaVXFCl0pmytVM46zJIjTtFksn7LP0ov
 9E5FFTyrq8NmbQVtnztVsIs=
X-Google-Smtp-Source: APiQypKUaF4qPe5cgKCYcrALmmsDKqYrLA0zZqfhO29Z84bE+BLxFpXhzF6qsCG3ZfRxgDI0iuEyrw==
X-Received: by 2002:a17:90a:2b46:: with SMTP id
 y6mr207238pjc.154.1588628625309; 
 Mon, 04 May 2020 14:43:45 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a142sm52764pfa.6.2020.05.04.14.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 14:43:44 -0700 (PDT)
Subject: Re: [PATCH] nand: brcmnand: correctly verify erased pages
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200504092943.2739784-1-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2fea8057-8b84-790e-60ba-b6848a186e18@gmail.com>
Date: Mon, 4 May 2020 14:43:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504092943.2739784-1-noltari@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

CgpPbiA1LzQvMjAyMCAyOjI5IEFNLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3JvdGU6Cj4g
VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
Lgo+IFRoaXMgaXMgYSBwcm9ibGVtIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB0
byB0aGUgT09CLCBzaW5jZSBpdCB3aWxsCj4gZmFpbCBkdWUgdG8gdGhlIHVzYWJsZSBPT0IgYnl0
ZXMgbm90IGJlaW5nIDB4ZmYuCj4gQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCB0
aGUgRUNDIGFyZW4ndCAweGZmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRl
eiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+CgpDYW4geW91IHByb3ZpZGUgYSBGaXhlczogdGFn
IGZvciB0aGlzIGNoYW5nZT8KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IGU0ZTNjZWVhYzM4Zi4uNTQ2ZjA4MDdiODg3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTIw
MTgsNiArMjAxOCw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmVhZF9ieV9waW8oc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIHN0YXRpYyBpbnQgYnJjbXN0
Yl9uYW5kX3ZlcmlmeV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiAgCQkgIHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHZvaWQgKmJ1ZiwgdTY0IGFkZHIpCj4gIHsKPiArCXN0cnVj
dCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7Cj4gIAlpbnQgaSwgc2FzOwo+ICAJdm9pZCAqb29iID0g
Y2hpcC0+b29iX3BvaTsKPiAgCWludCBiaXRmbGlwcyA9IDA7Cj4gQEAgLTIwMzUsMTEgKzIwMzYs
MjQgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCWZvciAo
aSA9IDA7IGkgPCBjaGlwLT5lY2Muc3RlcHM7IGkrKywgb29iICs9IHNhcykgewo+ICsJZm9yIChp
ID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7Cj4gIAkJZWNjX2NodW5rID0gYnVmICsg
Y2hpcC0+ZWNjLnNpemUgKiBpOwo+IC0JCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVu
ayhlY2NfY2h1bmssCj4gLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCj4gLQkJCQkJCSAgb29iLCBz
YXMsIE5VTEwsIDAsCj4gKwo+ICsJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhl
Y2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAo+ICsJCQkJCQkgIE5VTEwsIDAsIE5VTEwsIDAsCj4g
KwkJCQkJCSAgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJcmV0
dXJuIHJldDsKPiArCj4gKwkJYml0ZmxpcHMgPSBtYXgoYml0ZmxpcHMsIHJldCk7Cj4gKwl9Cj4g
Kwo+ICsJZm9yIChpID0gMDsgbXRkLT5vb2JsYXlvdXQtPmVjYyhtdGQsIGksICZvb2JlY2MpICE9
IC1FUkFOR0U7IGkrKykKPiArCXsKPiArCQlyZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1
bmsoTlVMTCwgMCwKPiArCQkJCQkJICBvb2IgKyBvb2JlY2Mub2Zmc2V0LAo+ICsJCQkJCQkgIG9v
YmVjYy5sZW5ndGgsCj4gKwkJCQkJCSAgTlVMTCwgMCwKPiAgCQkJCQkJICBjaGlwLT5lY2Muc3Ry
ZW5ndGgpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0Owo+IAoKLS0gCkZsb3Jp
YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
