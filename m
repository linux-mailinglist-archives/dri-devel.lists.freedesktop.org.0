Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE31B8029
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4E6EB92;
	Fri, 24 Apr 2020 20:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46D6E451
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:43:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v4so9675310wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dnKniRRBm6KLmX43VEEOIzRt6LvZaDlvdGMTuziUADI=;
 b=piLvENvWl4DmoeSXfPxu8cdGgMrHv2thfba7D+KeyKcqRq/kNFVVmKom7MLokxYEuw
 879epAZEr1e2PpWgseR+b75NAsekCVl6NCQoM153pJJCSpIeP+6b3oEHRZLWZiNP58hl
 P9DroLVXk/DWSoF5KHOurjOqNB4LOM7EUPV4Gi6X5heKiiaM55ttbsdUycg2GLZQcxul
 gF90xjqqxT8NIuixcLqed8aWxMKSXoOgeufFHqDlxj/esFD8joBr4w3NLmBGoxdujOlc
 OLzS4B4TB0qg1ReZnFkVVNfYELkuLqzE0zceluUvZmW1Yd7rSGF0/vctUFq9hZkFtRje
 8wZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnKniRRBm6KLmX43VEEOIzRt6LvZaDlvdGMTuziUADI=;
 b=PFCaQL4eEMiVqcEzy2y/iZcNiv/r4xKD+1yRL2MIShpHCMm6RiDaWxrtBRagKRCOBA
 acngKDukly1YetSqL9nH/xRuYhAUyEHwKUvAkUQYD7qry5hg7c4vyk3aOgflbsT4nFSs
 THaEw3Vp+YwnmhjsvV76wp9XumN4+DSvTzbtK7Lp+Ord93eHcTRZg44tInhi4dr62gzI
 hoM4jjnbUcOSU1b3byU6VGOhaixy5qQWiiPIZGnRsCW2EqD35DifYk7VHdMN7CrjE2Ay
 DbNKWUazpww1pXCC38FlImtMagbQ7Rk5F+IEwehBouvrVFX360GUkiMPzaYhaaTJILlf
 LOsg==
X-Gm-Message-State: AGi0PuaG150QHhE1klgqOI07MtUWKBH8ZrkDxq3eLJxUTFI0b//goPG8
 0EmJNtvslKYGjlSAxm+G4SS0vw==
X-Google-Smtp-Source: APiQypI2Afy4s5XfsjxxMEU/3JcXJfiG2GDyNW0Ogfm/BVtwSxQPPPiy1JiCL97MEDi+IXKQD3oz7Q==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr9189810wmi.173.1587725005656; 
 Fri, 24 Apr 2020 03:43:25 -0700 (PDT)
Received: from [192.168.43.23] ([37.166.159.243])
 by smtp.googlemail.com with ESMTPSA id t2sm2341981wmt.15.2020.04.24.03.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 03:43:24 -0700 (PDT)
Subject: Re: [PATCH v6 09/10] thermal: devfreq_cooling: Refactor code and
 switch to use Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-10-lukasz.luba@arm.com>
 <20200423175708.GG65632@linaro.org>
 <b93226ac-a1f1-c1d0-fc25-0bd0f336252a@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <73fb5d45-d8ac-534f-fd38-619739130160@linaro.org>
Date: Fri, 24 Apr 2020 12:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b93226ac-a1f1-c1d0-fc25-0bd0f336252a@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQvMDQvMjAyMCAxMjowMiwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+
IE9uIDQvMjMvMjAgNjo1NyBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIEZyaSwgQXBy
IDEwLCAyMDIwIGF0IDA5OjQyOjA5QU0gKzAxMDAsIEx1a2FzeiBMdWJhIHdyb3RlOgo+Pj4gVGhl
IG92ZXJoYXVsZWQgRW5lcmd5IE1vZGVsIChFTSkgZnJhbWV3b3JrIHN1cHBvcnQgYWxzbyBkZXZm
cmVxIGRldmljZXMuCj4+PiBUaGUgdW5pZmllZCBBUEkgaW50ZXJmYWNlIG9mIHRoZSBFTSBjYW4g
YmUgdXNlZCBpbiB0aGUgdGhlcm1hbAo+Pj4gc3Vic3lzdGVtIHRvCj4+PiBub3QgZHVwbGljYXRl
IGNvZGUuIFRoZSBwb3dlciB0YWJsZSBub3cgaXMgdGFrZW4gZnJvbSBFTSBzdHJ1Y3R1cmUgYW5k
Cj4+PiB0aGVyZSBpcyBubyBuZWVkIHRvIG1haW50YWluIGNhbGN1bGF0aW9uIGZvciBpdCBsb2Nh
bGx5LiBJbiBjYXNlIHdoZW4KPj4+IHRoZQo+Pj4gRU0gaXMgbm90IHByb3ZpZGVkIGJ5IHRoZSBk
ZXZpY2UgYSBzaW1wbGUgaW50ZXJmYWNlIGZvciBjb29saW5nCj4+PiBkZXZpY2UgaXMKPj4+IHVz
ZWQuCj4+Pgo+Pj4gW2xrcDogUmVwb3J0ZWQgdGhlIGJ1aWxkIHdhcm5pbmddCj4+PiBSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+PiBSZXZpZXdlZC1ieTog
U3RldmVuIFJvc3RlZHQgKFZNd2FyZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+ICMgZm9yCj4+PiB0
cmFjaW5nIGNvZGUKPj4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBh
cm0uY29tPgo+Pgo+PiBJcyBpdCBwb3NzaWJsZSB0byBzcGxpdCB0aGlzIHBhdGNoIGludG8gc21h
bGxlciBwYXJ0cz8gSXQgaXMgaGFyZCB0bwo+PiB1bmRlcnN0YW5kCj4+IHdoYXQgaXMgcmVsYXRl
ZCB0byB0aGUgZW0gY29udmVyc2lvbiBhbmQgb3RoZXIgY2hhbmdlcyB3aGljaCBsb29rIG5vdAo+
PiByZWxhdGVkCj4+IHNvIGZhci4KPj4KPiAKPiBObyBwcm9ibGVtLCBJIHdpbGwgZG8gdGhlIHNw
bGl0IChpdCB3aWxsIGJlIGluIHRoZSB2NykuCgpUaGFua3MgTHVrYXN6CgoKLS0gCjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMv
TGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0
dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
