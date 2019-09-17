Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891CB4DDA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DF66EC33;
	Tue, 17 Sep 2019 12:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BE46EC36;
 Tue, 17 Sep 2019 12:32:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i18so2919738wru.11;
 Tue, 17 Sep 2019 05:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XIJSysNlvx4lB2C+QWOSQFkpZ/vA967E/7zPmqCFNH0=;
 b=B0iW43w4bnjvW0KGdE6UZ6GW9JwcHv62K6dlC+vWzx5gvGPm4zWPyEg0fyyFKp1vdm
 sQbUnK2juHUEEqnFcIQJDy10x07GganXUuQKDHsfuTOhkuCtt4lB1IOTXg5Za7LphQBe
 W6e383MczPmKEAx8b9lc2EqZiVGYryIwjvKC1Im9QFaf9TCRVsfXyR/YNKzJiXsGw3ER
 szTASIAPCWVpGwxUL9Qgn5GyRS+L5Y96lXk9LVD1rbJgZM2+/vqbNVJhJHzAYkuWWK6x
 tAj6+PTVp8vNilIPV2TZMLzwG/c64E7ZCYMvT/Px7xO0BQWpjN/x92iIfyeB2hH+s6Ea
 SXbg==
X-Gm-Message-State: APjAAAVVgvdVYbTnc9JK631EgmQ9kerqHB6EIKnXFPufNeh9iTrn/8+i
 JLWZQwhXq+jSMifVpfJJQ3Yo20enuuZfY3rzZV4=
X-Google-Smtp-Source: APXvYqwb7RLesNvB8SdDalTsDttczeMsHIhMlAGPlZuyAJ6ipirh590VYQVix7b4O8BmviIoaUljgm5PcIRYSd183HE=
X-Received: by 2002:a5d:5185:: with SMTP id k5mr2118421wrv.341.1568723556626; 
 Tue, 17 Sep 2019 05:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190902083342.27393-1-kai.heng.feng@canonical.com>
In-Reply-To: <20190902083342.27393-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2019 08:32:23 -0400
Message-ID: <CADnq5_NtPXA-87MU-nmnT4t4+cjgJfR7VbyRxYCpSH9YXE4RUA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Restore backlight brightness after
 system resume
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XIJSysNlvx4lB2C+QWOSQFkpZ/vA967E/7zPmqCFNH0=;
 b=AJXg3jTVlPRSxCmfbKgU0PaGOMOWE944KTCDf6D8DO7FCemXrPrI7sB6vgtZFNBrkR
 sCp0zkm7y/oF9053v/PEFEG5S2EFa6vQC+0ug17oopmvLOVTpVkdim9JSTjAUDMgLrTE
 snM7+fWjTbpxYRplNKzbYov2rb9lcCj0XcDqQIH5Gh3ZsVtlKnfZQpFpIBq80EvuG9/s
 bZxDR9XN99JhGRq3ebg0/UW+olqKFyYYwszHiYC1g6PWIcBMSbyNvfGUxa7XFC4oFBB8
 RypuRNN6eae1FXSV6naFz3V9Eu3sDwZPRMkvpdQMP1EyFg3S2MjF3k7kNrdsT3hbE/ox
 zWTA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 "for 3.8" <stable@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgU2VwIDIsIDIwMTkgYXQgNDoxNiBQTSBL
YWktSGVuZyBGZW5nCjxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gTGFw
dG9wcyB3aXRoIEFNRCBBUFUgZG9lc24ndCByZXN0b3JlIGRpc3BsYXkgYmFja2xpZ2h0IGJyaWdo
dG5lc3MgYWZ0ZXIKPiBzeXN0ZW0gcmVzdW1lLgo+Cj4gVGhpcyBpc3N1ZSBzdGFydGVkIHdoZW4g
REMgd2FzIGludHJvZHVjZWQuCj4KPiBMZXQncyB1c2UgQkxfQ09SRV9TVVNQRU5EUkVTVU1FIHNv
IHRoZSBiYWNrbGlnaHQgY29yZSBjYWxscwo+IHVwZGF0ZV9zdGF0dXMgY2FsbGJhY2sgYWZ0ZXIg
c3lzdGVtIHJlc3VtZSB0byByZXN0b3JlIHRoZSBiYWNrbGlnaHQKPiBsZXZlbC4KPgo+IFRlc3Rl
ZCBvbiBEZWxsIEluc3Bpcm9uIDMxODAgKFN0b25leSBSaWRnZSkgYW5kIERlbGwgTGF0aXR1ZGUg
NTQ5NQo+IChSYXZlbiBSaWRnZSkuCj4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXgg
MWIwOTQ5ZGQ3ODA4Li4xODNlZjE4YWM2ZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtMjExMSw2ICsyMTExLDcg
QEAgc3RhdGljIGludCBhbWRncHVfZG1fYmFja2xpZ2h0X2dldF9icmlnaHRuZXNzKHN0cnVjdCBi
YWNrbGlnaHRfZGV2aWNlICpiZCkKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xp
Z2h0X29wcyBhbWRncHVfZG1fYmFja2xpZ2h0X29wcyA9IHsKPiArICAgICAgIC5vcHRpb25zID0g
QkxfQ09SRV9TVVNQRU5EUkVTVU1FLAo+ICAgICAgICAgLmdldF9icmlnaHRuZXNzID0gYW1kZ3B1
X2RtX2JhY2tsaWdodF9nZXRfYnJpZ2h0bmVzcywKPiAgICAgICAgIC51cGRhdGVfc3RhdHVzICA9
IGFtZGdwdV9kbV9iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cywKPiAgfTsKPiAtLQo+IDIuMTcuMQo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
