Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D1E455D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056896E907;
	Fri, 25 Oct 2019 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83CE6E584
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 17:15:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c4so10754296lja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 10:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2u8s7gx7FtUmA2/ewnUbC7NCE9E4zM8QCdEvaltKG0=;
 b=fc3igN7sPtTw8ioNezNZyCj/tjO0nQRuaxPAxRuB4q+CFZaPWadBTWUHgfdNEAPxwK
 5o/oS675w5wh2s4YAUTPW6rj/ydEKEwoDTsDC9NF5dG7giebHGHd3gTsxE89CEYfwDQ/
 8TmzDPgHSFgISQquXyyPfsPPlOGEVW9Trnsg+eK4djjhO6HY9AoIVfOGG3I0rR9yy66S
 Uf4rAT5qGTPw2ZknZktq0zTSGZdYu94dLng/oH+4IVBrM36HPUdZ4siHN6y3JSetMSkN
 JoaIfMukk7REAJ5keFqkOrDk3Yni8RoxL4iJGDejWry4u4irvHY2+eZLzIMxrf7O0yCs
 aaLQ==
X-Gm-Message-State: APjAAAW6gH0PAmCA9GPlQAH9hCZaKr20r4GhqiTiV7qT9AGjKO3LqMGU
 ZW8b6AAvANIkr1g8ZNj/PLRBOF24
X-Google-Smtp-Source: APXvYqw1RGIy1mL/CQkGrBGWGbJQNaMlq3LWK78yQ79zaSv2ZJhXCfvGJ9O9KDdEymqgGFfuRXFBiA==
X-Received: by 2002:a2e:9799:: with SMTP id y25mr10627721lji.228.1571937309166; 
 Thu, 24 Oct 2019 10:15:09 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id p3sm10948363ljn.78.2019.10.24.10.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 10:15:08 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
 <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
 <20191024134756.GC2924027@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7d3b1e99-4c57-d6db-36dd-d0a840ead440@gmail.com>
Date: Thu, 24 Oct 2019 20:15:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024134756.GC2924027@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B2u8s7gx7FtUmA2/ewnUbC7NCE9E4zM8QCdEvaltKG0=;
 b=ujgYMcpcefyHEvPBjnG91nrFx1r96PE3NLBm2gv2VhmxVY9I0K6PXG1lTx6pIG6JRg
 /RqVkcWokAR7Bfi4OkJ23KDI94at36+22bTxGko2LGvkyU2FpWiznLBh1KGkqh/AZSOq
 f8qu4lyQTSdlU35N7g5G+qFSQAQfXkggUj4RYC+LsqJURhgS1n41UHU3Gb3yLOAIk3tu
 JbD/QFOYbkDiiB5puMT1MS8+9GhQ5dk8YbaVnQEeGZB+jG69pRFMI1shocDZUkgWYRwX
 cKSUnHhcridXgLQJEqTwOmzaFyYq88uaK2Chnoyx0im+Pkul1qUNjazuo2tvMzhsonBn
 lh4w==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTAuMjAxOSAxNjo0NywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIE9j
dCAyNCwgMjAxOSBhdCAwNDozNToxM1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDI0LjEwLjIwMTkgMTQ6NTAsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBTdW4s
IEp1biAyMywgMjAxOSBhdCAwODozNzo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4gT24gQVJNMzIgd2UgZG9uJ3Qgd2FudCBhbnkgb2YgdGhlIGNsaWVudHMgZGV2aWNlIHRv
IGJlIGJhY2tlZCBieSB0aGUKPj4+PiBpbXBsaWNpdCBkb21haW4sIHNpbXBseSBiZWNhdXNlIHdl
IGNhbid0IGFmZm9yZCBzdWNoIGEgd2FzdGUgb24gb2xkZXIKPj4+PiBUZWdyYSBTb0NzIHRoYXQg
aGF2ZSB2ZXJ5IGZldyBkb21haW5zIGF2YWlsYWJsZSBpbiB0b3RhbC4gVGhlIHJlY2VudCBJT01N
VQo+Pj4+IHN1cHBvcnQgYWRkaXRpb24gZm9yIHRoZSBWaWRlbyBEZWNvZGVyIGhhcmR3YXJlIHVu
Y292ZXJlZCB0aGUgcHJvYmxlbQo+Pj4+IHRoYXQgYW4gdW5mb3J0dW5hdGUgZHJpdmVycyBwcm9i
ZSBvcmRlciByZXN1bHRzIGluIHRoZSBEUk0gZHJpdmVyIHByb2JlCj4+Pj4gZmFpbHVyZSBpZiBD
T05GSUdfQVJNX0RNQV9VU0VfSU9NTVU9eSBkdWUgdG8gYSBzaG9ydGFnZSBvZiBJT01NVSBkb21h
aW5zCj4+Pj4gY2F1c2VkIGJ5IHRoZSBpbXBsaWNpdCBiYWNraW5nLiBUaGUgaG9zdDF4X2NsaWVu
dF9yZWdpc3RlcigpIGlzIGEgY29tbW9uCj4+Pj4gZnVuY3Rpb24gdGhhdCBpcyBpbnZva2VkIGJ5
IGFsbCBvZiB0aGUgcmVsZXZhbnQgRFJNIGRyaXZlcnMgZHVyaW5nIHRoZWlycwo+Pj4+IHByb2Jl
IGFuZCBoZW5jZSBpdCBpcyBjb252ZW5pZW50IHRvIHJlbW92ZSB0aGUgaW1wbGljaXQgYmFja2lu
ZyB0aGVyZSwKPj4+PiByZXNvbHZpbmcgdGhlIHByb2JsZW0uCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRy
aXZlcnMvZ3B1L2hvc3QxeC9idXMuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPj4+Cj4+PiBJIGRvbid0IHJlYWxseSB3YW50
IHRvIGRvIHRoaXMgaW4gYSBjZW50cmFsIHBsYWNlIGxpa2UgdGhpcy4gSWYgd2UKPj4+IHJlYWxs
eSBkbyBuZWVkIHRoaXMsIHdoeSBjYW4ndCB3ZSBkbyBpdCBpbiB0aGUgaW5kaXZpZHVhbCBkcml2
ZXJzPwo+Pgo+PiBXaHkgZG8geW91IHdhbnQgdG8gZHVwbGljYXRlIHRoZSBzYW1lIGFjdGlvbiBm
b3IgZWFjaCBkcml2ZXIgaW5zdGVhZCBvZgo+PiBkb2luZyBpdCBpbiBhIHNpbmdsZSBjb21tb24g
cGxhY2U/Cj4gCj4gSSBkb24ndCBtaW5kIGRvaW5nIGl0IGluIGEgY29tbW9uIHBsYWNlIGluIHBh
cnRpY3VsYXIsIEkganVzdCBkb24ndCB3YW50Cj4gdG8gZG8gdGhpcyB3aXRoaW4gdGhlIGhvc3Qx
eCBidXMgaW5mcmFzdHJ1Y3R1cmUuIFRoaXMgaXMgcmVhbGx5IGEgcG9saWN5Cj4gZGVjaXNpb24g
dGhhdCBzaG91bGQgYmUgdXAgdG8gZHJpdmVycy4gQ29uc2lkZXIgdGhlIGNhc2Ugd2hlcmUgd2Ug
aGFkIGEKPiBkaWZmZXJlbnQgaG9zdDF4IGRyaXZlciAoZm9yIFY0TDIgZm9yIGV4YW1wbGUpIHRo
YXQgd291bGQgYWN0dWFsbHkgd2FudAo+IHRvIHVzZSB0aGUgRE1BIEFQSS4gSW4gdGhhdCBjYXNl
IHdlIG1heSB3YW50IHRvIGRldGFjaCBpbiB0aGUgRFJNIGRyaXZlcgo+IGJ1dCBub3QgdGhlIFY0
TDIgZHJpdmVyLgoKT2theS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
