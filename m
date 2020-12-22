Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1F2E1B1D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9BC6E8EA;
	Wed, 23 Dec 2020 10:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23BF6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:19:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m12so34537470lfo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulrdoVbGsjwhkH0t5gig0hbyBd9UYXc8gP96903YDxw=;
 b=TfyVQnVt/DSKdLojw95WJ4Y3kr9B3JreJXSNeZLBEluhzjCcPf6K2C/ui4C3A+RAcn
 NzqrO2ZQ73TaLD5uGBoTA4sttmca1xpwHqU863FtGcUC88cxmEAsuxQikrmwuidA4uCP
 nm3AAm9TZcl214JdJVxmbY480arDu40d/ZRO/LMZqIPpdTU56ZnmabVMuRGGAvhILYBZ
 Lo8a4O4xH2G8xK6eSxS2dJykl50tEw6QNTNuUIOxtAh5QuaHw5oC9C+9K8KQXGYHYHDU
 yCrcC+UxT5hZUbtUNDzWRin0i+Cl3uko4BCCxLbueXyFERpjQkeXnBMSkzUwEXUzI6/8
 3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulrdoVbGsjwhkH0t5gig0hbyBd9UYXc8gP96903YDxw=;
 b=JNnssSRzWhVwO1t1XOqa3D4rfUL40dV3xhJmdw0QZE2fP/WFFYahOqYIM0914eXZJw
 en9+uiGavrtIkOMfJthyo90TlHMJDTm9l8DV+gvf6f2th4skwkdlv/xIS2FouqhPAdIE
 Zfm8Oibxd5Qt0unHnyfQwZaOIPyssjZS4bQEcTpQPs8+PKPgJ2fJsfB3LSbqF/t/xN6v
 Ibm0Q7Z48yDpo9xw3oHWO4if736/w13dxJ1W3oapKyxepRfs9qg7RORjx90gCeT3cW6d
 CkmwnLTG/sLjEIPTdVQB9XCmuAJeRX8QFbh2QqaX7M7Yc0doxoM72gDTjitZG5RagIym
 Nh7w==
X-Gm-Message-State: AOAM532NoLTLH739egLeTMQ/0pDiQ6+C3jbHL/cyc8LPkuAbDVZwqVwj
 i6xUGESnpuGxz1SfUC7T7oQ=
X-Google-Smtp-Source: ABdhPJyniuH4JIVLYX09aJTJXG2DPOZ3u4RjQh1NfGfdwzaSui65HwnwuqSmtJhso1bwXfgrrij1mg==
X-Received: by 2002:ac2:46e4:: with SMTP id q4mr8665320lfo.413.1608664768348; 
 Tue, 22 Dec 2020 11:19:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id w6sm3032131lji.74.2020.12.22.11.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:19:27 -0800 (PST)
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
Date: Tue, 22 Dec 2020 22:19:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091255.wentz5hyt726qezg@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAxMjoxMiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEZpeCBhZGRpbmcgT1BQIGVudHJpZXMg
aW4gYSB3cm9uZyAob3Bwb3NpdGUpIG9yZGVyIGlmIE9QUCByYXRlIGlzCj4+IHVuYXZhaWxhYmxl
LiBUaGUgT1BQIGNvbXBhcmlzb24gaXMgZXJyb25lb3VzbHkgc2tpcHBlZCBpZiBPUFAgcmF0ZSBp
cwo+PiBtaXNzaW5nLCB0aHVzIE9QUHMgYXJlIGxlZnQgdW5zb3J0ZWQuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2
ZXJzL29wcC9jb3JlLmMgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQo+PiAgZHJpdmVycy9v
cHAvb3BwLmggIHwgIDIgKy0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29wcC9jb3JlLmMgYi9k
cml2ZXJzL29wcC9jb3JlLmMKPj4gaW5kZXggMzRmN2U1MzBkOTQxLi41YzdmMTMwYThkZTIgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvb3BwL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL29wcC9jb3Jl
LmMKPj4gQEAgLTE1MzEsOSArMTUzMSwxMCBAQCBzdGF0aWMgYm9vbCBfb3BwX3N1cHBvcnRlZF9i
eV9yZWd1bGF0b3JzKHN0cnVjdCBkZXZfcG1fb3BwICpvcHAsCj4+ICAJcmV0dXJuIHRydWU7Cj4+
ICB9Cj4+ICAKPj4gLWludCBfb3BwX2NvbXBhcmVfa2V5KHN0cnVjdCBkZXZfcG1fb3BwICpvcHAx
LCBzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwMikKPj4gK2ludCBfb3BwX2NvbXBhcmVfa2V5KHN0cnVj
dCBkZXZfcG1fb3BwICpvcHAxLCBzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwMiwKPj4gKwkJICAgICBi
b29sIHJhdGVfbm90X2F2YWlsYWJsZSkKPj4gIHsKPj4gLQlpZiAob3BwMS0+cmF0ZSAhPSBvcHAy
LT5yYXRlKQo+PiArCWlmICghcmF0ZV9ub3RfYXZhaWxhYmxlICYmIG9wcDEtPnJhdGUgIT0gb3Bw
Mi0+cmF0ZSkKPiAKPiByYXRlIHdpbGwgYmUgMCBmb3IgYm90aCB0aGUgT1BQcyBoZXJlIGlmIHJh
dGVfbm90X2F2YWlsYWJsZSBpcyB0cnVlIGFuZCBzbyB0aGlzCj4gY2hhbmdlIHNob3VsZG4ndCBi
ZSByZXF1aXJlZC4KClRoZSByYXRlX25vdF9hdmFpbGFibGUgaXMgbmVnYXRlZCBpbiB0aGUgY29u
ZGl0aW9uLiBUaGlzIGNoYW5nZSBpcwpyZXF1aXJlZCBiZWNhdXNlIGJvdGggcmF0ZXMgYXJlIDAg
YW5kIHRoZW4gd2Ugc2hvdWxkIHByb2NlZWQgdG8gdGhlCmxldmVscyBjb21wYXJpc29uLgoKSSBn
dWVzcyBpdCdzIG5vdCBjbGVhciBieSBsb29raW5nIGF0IHRoaXMgcGF0Y2gsIHBsZWFzZSBzZWUg
YSBmdWxsCnZlcnNpb24gb2YgdGhlIGZ1bmN0aW9uOgoKaW50IF9vcHBfY29tcGFyZV9rZXkoc3Ry
dWN0IGRldl9wbV9vcHAgKm9wcDEsIHN0cnVjdCBkZXZfcG1fb3BwICpvcHAyLAogICAgICAgICBi
b29sIHJhdGVfbm90X2F2YWlsYWJsZSkKewogIGlmICghcmF0ZV9ub3RfYXZhaWxhYmxlICYmIG9w
cDEtPnJhdGUgIT0gb3BwMi0+cmF0ZSkKICAgIHJldHVybiBvcHAxLT5yYXRlIDwgb3BwMi0+cmF0
ZSA/IC0xIDogMTsKICBpZiAob3BwMS0+YmFuZHdpZHRoICYmIG9wcDItPmJhbmR3aWR0aCAmJgog
ICAgICBvcHAxLT5iYW5kd2lkdGhbMF0ucGVhayAhPSBvcHAyLT5iYW5kd2lkdGhbMF0ucGVhaykK
ICAgIHJldHVybiBvcHAxLT5iYW5kd2lkdGhbMF0ucGVhayA8IG9wcDItPmJhbmR3aWR0aFswXS5w
ZWFrID8gLTEgOiAxOwogIGlmIChvcHAxLT5sZXZlbCAhPSBvcHAyLT5sZXZlbCkKICAgIHJldHVy
biBvcHAxLT5sZXZlbCA8IG9wcDItPmxldmVsID8gLTEgOiAxOwogIHJldHVybiAwOwp9CgpQZXJo
YXBzIHdlIGNvdWxkIGNoZWNrIHdoZXRoZXIgb3BwMS0+cmF0ZT0wLCBsaWtlIGl0J3MgZG9uZSBm
b3IgdGhlCm9wcDEtPmJhbmR3aWR0aC4gSSdsbCBjb25zaWRlciB0aGlzIHZhcmlhbnQgZm9yIHYz
LCB0aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
