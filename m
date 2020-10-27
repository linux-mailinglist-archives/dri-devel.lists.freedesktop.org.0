Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8129CEC6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CDC6EC9D;
	Wed, 28 Oct 2020 08:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978E36EC43
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:26:19 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 126so4000339lfi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4zirdglvRKElBhw1oHaKvJRIsORyh5R1+dsaAdlhLCs=;
 b=Afy4UATbiLcRJ6mibHq/8mDeJ03DWWHqsG+y0nIeJTOrw7fDiP64+33bMCToTKEvja
 xdFOthRZHqmnPIhGj5ZfKnR43BhyllTOKmU529IGQ81mPWs7B6LzYbzjZm0m0p2w9V/s
 OXf1jshGMJ7NvufDXleu+jo0icuXTQP3gbZ0XFpfqw1tfsr2lhM2htiAk91NrNQHmx0z
 goMHZioTJ1x5uocbN4WtGpSYhdYpgrAn23R1bCiQ2akaXIMpbCgikGZ7OhVnlLlyLo3r
 n/D+jkdH2lUm5BcglFOmF7MexwtT1D+REZp5CJ/zawPbsDx4vF5mz6NmZFZFrUJyTwlT
 3XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4zirdglvRKElBhw1oHaKvJRIsORyh5R1+dsaAdlhLCs=;
 b=FsQlcwgFbgDse2nkXMfd1hs4nyqaeWmcgSH/cdhawKVRwfeYDIM4PjGL25XHnQN4Bn
 YyltKMHcxfhyEnVZaLaaV3WrToKouU8EKVtrTtvt+zdoEQwK3o0voE5IZMCrHqkmCXJ6
 8oIgKonFnm404Y30WGcC6qszs9y4CaII3TU61JXXtvBfgmwqpHZsf8fQoOP3yf6hO9Mk
 tcntimAcaNKKvOETtCP7BO04wuXm92tjh92RWD5wHaqrJQ1FsKtiDw8uHFyzNuoakYqZ
 Uuoh3SnahXFiq2aLhFvaQawTwiB2ZP8syRAIKyaAVOAseg5rp74veDgw917MtoTQfKS7
 Ihlw==
X-Gm-Message-State: AOAM533rxuntB8/T1fdVtZD0H5M14Lf6nn7nONhcFT37yxwv95kWn5DS
 tyisvKN1NGg/l+SpeLXMg+0=
X-Google-Smtp-Source: ABdhPJycQ9/ABotDTtJ/6fjLHoGmXYUNWeaWgm/69zF9L+kp2N7BWN//ZPWGWmM3YEiQjlV15T1SvA==
X-Received: by 2002:a19:9d5:: with SMTP id 204mr1361256lfj.583.1603830378059; 
 Tue, 27 Oct 2020 13:26:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id t10sm283304lfc.258.2020.10.27.13.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:26:17 -0700 (PDT)
Subject: Re: [PATCH v6 46/52] opp: Put interconnect paths outside of
 opp_table_lock
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-47-digetx@gmail.com>
 <20201027051013.5gr4s3wuuwxsd7ax@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44169d24-4afc-5388-788f-d1e8263fc627@gmail.com>
Date: Tue, 27 Oct 2020 23:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027051013.5gr4s3wuuwxsd7ax@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAwODoxMCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjYtMTAtMjAs
IDAxOjE3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggZml4ZXMgbG9ja3Vw
IHdoaWNoIGhhcHBlbnMgd2hlbiBPUFAgdGFibGUgaXMgcmVsZWFzZWQgaWYKPj4gaW50ZXJjb25u
ZWN0IHByb3ZpZGVyIHVzZXMgT1BQIGluIHRoZSBpY2NfcHJvdmlkZXItPnNldCgpIGNhbGxiYWNr
Cj4+IGFuZCBiYW5kd2lkdGggb2YgdGhlIElDQyBwYXRoIGlzIHNldCB0byAwIGJ5IHRoZSBJQ0Mg
Y29yZSB3aGVuIHBhdGgKPj4gaXMgcmVsZWFzZWQuIFRoZSBpY2NfcHV0KCkgZG9lc24ndCBuZWVk
IHRoZSBvcHBfdGFibGVfbG9jayBwcm90ZWN0aW9uLAo+PiBoZW5jZSBsZXQncyBtb3ZlIGl0IG91
dHNpZGUgb2YgdGhlIGxvY2sgaW4gb3JkZXIgdG8gcmVzb2x2ZSB0aGUgcHJvYmxlbS4KPj4KPj4g
SW4gcGFydGljdWxhciB0aGlzIGZpeGVzIHRlZ3JhLWRldmZyZXEgZHJpdmVyIGxvY2t1cCBvbiB0
cnlpbmcgdG8gdW5sb2FkCj4+IHRoZSBkcml2ZXIgbW9kdWxlLiBUaGUgZGV2ZnJlcSBkcml2ZXIg
dXNlcyBPUFAtYmFuZHdpZHRoIEFQSSBhbmQgaXRzIElDQwo+PiBwcm92aWRlciBhbHNvIHVzZXMg
T1BQIGZvciBEVkZTLCBoZW5jZSB0aGV5IGJvdGggdGFrZSBzYW1lIG9wcF90YWJsZV9sb2NrCj4+
IHdoZW4gT1BQIHRhYmxlIG9mIHRoZSBkZXZmcmVxIGlzIHJlbGVhc2VkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQouLi4KPiAK
PiBOZXZlciBtYWtlIHN1Y2ggX2ZpeGVzXyBwYXJ0IG9mIHN1Y2ggYSBiaWcgcGF0Y2hzZXQuIEFs
d2F5cyBzZW5kIHRoZW0KPiBzZXBhcmF0ZWx5LgoKUGVyaGFwcyBpdCdzIG5vdCBvYnZpb3VzIGZy
b20gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiB0aGF0IHRoaXMgcGF0Y2gKZG9lc24ndCBmaXggYW55
IGtub3duIHByb2JsZW1zIG9mIHRoZSBjdXJyZW50IG1haW5saW5lIGtlcm5lbCBhbmQgaXQncwpu
ZWVkZWQgb25seSBmb3IgdGhlIG5ldyBwYXRjaGVzLgoKPiBIYXZpbmcgc2FpZCB0aGF0LCBJIGFs
cmVhZHkgaGF2ZSBhIHBhdGNoIHdpdGggbWUgd2hpY2ggc2hhbGwgZml4IGl0IGZvciB5b3UgYXMK
PiB3ZWxsOgoKSSBzZWUgdGhhdCB5b3VycyBmaXggaXMgYWxyZWFkeSBhcHBsaWVkLCB0aGFua3Mh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
