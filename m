Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980382E2AD9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2E89B9A;
	Fri, 25 Dec 2020 09:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABE689A4B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:28:30 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id r4so838217pls.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 22:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EjusjKqe1uD5qVIhtNFzzFr/40x6TzvZ/Sd3W/PBS+U=;
 b=fkgyFFom2uaI6UYerCixgJyMGXGGZzyzPl2pC34SDHHWr//SHmo19YSii8QHZaSaa0
 uZC2skGBke5PtP9vslEZombfKjKIAYRw9D3l2M5uGrJ+VkC9bDxNBcQDONWQUC2dmGxG
 6UJpFpuY87irp1H90rXExkNF0g2y+4HLV3Ep3/gdgJBqsszg3FbKmgil0GqbQ6dTgEnh
 DrDRzMipJyOMadGCFG5+H9D0UVs6y0l4FAVZ+I0/J5ZdR5hXHDE2454h+0iAD/EAVgA3
 IDDlN9SUV6QyhslIyk38zgEDS9uC1vEdXUB6uhGhlyh9+PUCifXrT875haF9d9ipr3qB
 NnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EjusjKqe1uD5qVIhtNFzzFr/40x6TzvZ/Sd3W/PBS+U=;
 b=UPvKyg++QUUW22OvdO4c88ED/JERJT/tWFuPkPL0gz8pWLpFQsSn4wl6VWpyXk7hE4
 yuWapqqnUrc2IpCOUStCZYBUPhKm7cmqs/mBfYQtiRM9465HY0HrOMNMd4eva/Er8VDN
 tszdiGubgmaI24Y44GxAWq59kdVEpmGEFJNu92VsU51wJ4jbfMHTcej4/o6Yye0knmpa
 PL2aYIukK1l4QovrLPYdJMUPsV+rkQBnzSUcTA1A6biukNujuYO5tLBARkUf8YWo6+AZ
 VqxAXda1p6U0w7yc210Lu1BQ4A+QM2q6WBCjk658OepZOD5NifNiGFJBxQU7L9HnGcqX
 Gttw==
X-Gm-Message-State: AOAM530Z3JML+Opo0RPGkzlACLt51FAU17keiaNHRT3XysJm28ZZGXU6
 VXKbb4EZw0ey5goCkUGPKkKiPg==
X-Google-Smtp-Source: ABdhPJwZjLbo7aGBJ7sNLaIhWcs4xnkHkI7BDfYQrcbWA55ODln8fkpMZgsIP8pDydfAZ37ygqOZVA==
X-Received: by 2002:a17:90a:380c:: with SMTP id
 w12mr2982286pjb.117.1608791310121; 
 Wed, 23 Dec 2020 22:28:30 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id t18sm25653088pfl.138.2020.12.23.22.28.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 22:28:29 -0800 (PST)
Date: Thu, 24 Dec 2020 11:58:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
Message-ID: <20201224062826.frppxddfinjomfui@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
 <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
 <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

T24gMjMtMTItMjAsIDIzOjM2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMTIuMjAyMCAw
NzozNCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAyMi0xMi0yMCwgMjI6MTksIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiAyMi4xMi4yMDIwIDEyOjEyLCBWaXJlc2ggS3VtYXIg
0L/QuNGI0LXRgjoKPiA+Pj4gcmF0ZSB3aWxsIGJlIDAgZm9yIGJvdGggdGhlIE9QUHMgaGVyZSBp
ZiByYXRlX25vdF9hdmFpbGFibGUgaXMgdHJ1ZSBhbmQgc28gdGhpcwo+ID4+PiBjaGFuZ2Ugc2hv
dWxkbid0IGJlIHJlcXVpcmVkLgo+ID4+Cj4gPj4gVGhlIHJhdGVfbm90X2F2YWlsYWJsZSBpcyBu
ZWdhdGVkIGluIHRoZSBjb25kaXRpb24uIFRoaXMgY2hhbmdlIGlzCj4gPj4gcmVxdWlyZWQgYmVj
YXVzZSBib3RoIHJhdGVzIGFyZSAwIGFuZCB0aGVuIHdlIHNob3VsZCBwcm9jZWVkIHRvIHRoZQo+
ID4+IGxldmVscyBjb21wYXJpc29uLgo+ID4gCj4gPiBXb24ndCB0aGF0IGhhcHBlbiB3aXRob3V0
IHRoaXMgcGF0Y2ggPwo+IAo+IE5vCgpUaGlzIGlzIGhvdyB0aGUgY29kZSBsb29rcyBsaWtlIGN1
cnJlbnRseToKCmludCBfb3BwX2NvbXBhcmVfa2V5KHN0cnVjdCBkZXZfcG1fb3BwICpvcHAxLCBz
dHJ1Y3QgZGV2X3BtX29wcCAqb3BwMikKewoJaWYgKG9wcDEtPnJhdGUgIT0gb3BwMi0+cmF0ZSkK
CQlyZXR1cm4gb3BwMS0+cmF0ZSA8IG9wcDItPnJhdGUgPyAtMSA6IDE7CglpZiAob3BwMS0+YmFu
ZHdpZHRoICYmIG9wcDItPmJhbmR3aWR0aCAmJgoJICAgIG9wcDEtPmJhbmR3aWR0aFswXS5wZWFr
ICE9IG9wcDItPmJhbmR3aWR0aFswXS5wZWFrKQoJCXJldHVybiBvcHAxLT5iYW5kd2lkdGhbMF0u
cGVhayA8IG9wcDItPmJhbmR3aWR0aFswXS5wZWFrID8gLTEgOiAxOwoJaWYgKG9wcDEtPmxldmVs
ICE9IG9wcDItPmxldmVsKQoJCXJldHVybiBvcHAxLT5sZXZlbCA8IG9wcDItPmxldmVsID8gLTEg
OiAxOwoJcmV0dXJuIDA7Cn0KCkxldHMgY29uc2lkZXIgdGhlIGNhc2UgeW91IGFyZSBmb2N1c3Np
bmcgb24sIHdoZXJlIHJhdGUgaXMgMCBmb3IgYm90aCB0aGUgT1BQcywKYmFuZHdpZHRoIGlzbid0
IHRoZXJlIGFuZCB3ZSB3YW50IHRvIHJ1biB0aGUgbGV2ZWwgY29tcGFyaXNvbiBoZXJlLgoKU2lu
Y2UgYm90aCB0aGUgcmF0ZXMgYXJlIDAsIChvcHAxLT5yYXRlICE9IG9wcDItPnJhdGUpIHdpbGwg
ZmFpbCBhbmQgc28gd2Ugd2lsbAptb3ZlIHRvIGJhbmR3aWR0aCBjaGVjayB3aGljaCB3aWxsIGZh
aWwgdG9vLiBBbmQgc28gd2Ugd2lsbCBnZXQgdG8gdGhlIGxldmVsCmNvbXBhcmlzb24uCgpXaGF0
IGFtIEkgbWlzc2luZyBoZXJlID8gSSBhbSBzdXJlIHRoZXJlIGlzIHNvbWV0aGluZyBmb3Igc3Vy
ZSBhcyB5b3Ugd29uJ3QgaGF2ZQptaXNzZWQgdGhpcy4uCgotLSAKdmlyZXNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
