Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919019F0ED
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596736E2B8;
	Mon,  6 Apr 2020 07:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406976EC4E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:44:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so9576997wrd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3IRCSeovtJ4qPaAlDb+qJfs2WHFPBRzlCPv+uW4BVtM=;
 b=ZhFmw4awlQGDOQvhue1HPhakCr9If5mP4CbsYz9PdBRq10pZB0yNy2sa8oERY6TFsS
 7SQUjqfgUXFtXhOgOgLFEdZsxg8p2FhnXEUsWKXWje8Y6qG9vNLAet+PPlvYxDO3gY+A
 6wN+GZ1AmvYoK3e3gBIWHH/pGKixIOHHFhEdu9LCm+kVUTYkSzJ3J7mKQBZ6j41woqH+
 86DprRHCk1JOfwIONwulVpSVTb4l4U/0/pEwEhMC+MA+gn/BgypE5CtfOaYszbZ2e8Rs
 2xLd/Tq6McgT9qmwf0Bc6vyjHTyOlXV+5OcJVNWMQ85wSN4S7yWIeEEalF6ueNoEo0B+
 vZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3IRCSeovtJ4qPaAlDb+qJfs2WHFPBRzlCPv+uW4BVtM=;
 b=OAcUJRMBVfGYCtyJqjdUxH/6Fjp3isIbjx3a2fx9NsAsyw9wdOKuDglxWdCE/utGNn
 rNB3rpeBeCkaIpNKqM3nwPlA7mBry+L+F9lPdFBUFLp7vuso+o0qyKgn6zh1h1GI+xXV
 y8thqS6kF2sAzCNPsowMZ05aH+m+AU3wuQPlUG/YT2DJlpJ0MGqfuT8PiZHFcrtAH9AC
 /3P76wUSEGxBoe5dShqdqrA/bdhDtzD1NHeKMvvzlMZ31wq5P7QTvJ44I7VOUf4K2brh
 fcddyIlsKDRt5PRxtP4Txw2uLCJWxZZvnnHNPGAMjium08HqB0+lhVo+kQgNCFQavWbL
 ks9A==
X-Gm-Message-State: AGi0Pub2j5zRrsGRqYsZDU9F3Ndn8gdR9jxbAznlR06PYhpZDLCcRRlH
 hv1I7bcKZIhKgafl9aicCDz33w==
X-Google-Smtp-Source: APiQypKhA0CqD87QFeE2Zs/PBK+BqNQHI+er4Gl7MSLIOo72Rqlrikz9gwnP4JJCTz7hxBOOvIKAvw==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr10216145wro.68.1585935865740; 
 Fri, 03 Apr 2020 10:44:25 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cc78:8018:8980:25d8?
 ([2a01:e34:ed2f:f020:cc78:8018:8980:25d8])
 by smtp.googlemail.com with ESMTPSA id m21sm12083413wmc.6.2020.04.03.10.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 10:44:24 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] thermal: devfreq_cooling: Refactor code and switch
 to use Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-5-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f3e9f127-47b1-9f30-2148-3c95a5933a92@linaro.org>
Date: Fri, 3 Apr 2020 19:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318114548.19916-5-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDMvMjAyMCAxMjo0NSwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gVGhlIG92ZXJoYXVsZWQg
RW5lcmd5IE1vZGVsIChFTSkgZnJhbWV3b3JrIHN1cHBvcnQgYWxzbyBkZXZmcmVxIGRldmljZXMu
Cj4gVGhlIHVuaWZpZWQgQVBJIGludGVyZmFjZSBvZiB0aGUgRU0gY2FuIGJlIHVzZWQgaW4gdGhl
IHRoZXJtYWwgc3Vic3lzdGVtIHRvCj4gbm90IGR1cGxpY2F0ZSBjb2RlLiBUaGUgcG93ZXIgdGFi
bGUgbm93IGlzIHRha2VuIGZyb20gRU0gc3RydWN0dXJlIGFuZAo+IHRoZXJlIGlzIG5vIG5lZWQg
dG8gbWFpbnRhaW4gY2FsY3VsYXRpb24gZm9yIGl0IGxvY2FsbHkuIEluIGNhc2Ugd2hlbiB0aGUK
PiBFTSBpcyBub3QgcHJvdmlkZWQgYnkgdGhlIGRldmljZSBhIHNpbXBsZSBpbnRlcmZhY2UgZm9y
IGNvb2xpbmcgZGV2aWNlIGlzCj4gdXNlZC4KPiAKPiBUaGVyZSBpcyBhbHNvIGFuIGltcHJvdmVt
ZW50IGluIGNvZGUgcmVsYXRlZCB0byBlbmFibGluZy9kaXNhYmxpbmcgT1BQcywKPiB3aGljaCBw
cmV2ZW50cyBmcm9tIHJhY2UgY29uZGl0aW9uIHdpdGggZGV2ZnJlcSBnb3Zlcm5vcnMuCj4gCj4g
W2xrcDogUmVwb3J0ZWQgdGhlIGJ1aWxkIHdhcm5pbmddCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBTdGV2ZW4gUm9zdGVkdCAo
Vk13YXJlKSA8cm9zdGVkdEBnb29kbWlzLm9yZz4gIyBmb3IgdHJhY2luZyBjb2RlCj4gU2lnbmVk
LW9mZi1ieTogTHVrYXN6IEx1YmEgPGx1a2Fzei5sdWJhQGFybS5jb20+CgpUaGUgY2hhbmdlcyBh
cmUgdG9vIGJpZywgcGxlYXNlIHNwbGl0IHRoaXMgcGF0Y2ggaW50byBzbWFsbGVyIGNodW5rcy4K
Cj4gLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9kZXZmcmVxX2Nvb2xpbmcuYyB8IDQ3NCArKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9kZXZmcmVxX2Nvb2xpbmcu
aCAgIHwgIDM5ICstLQo+ICBpbmNsdWRlL3RyYWNlL2V2ZW50cy90aGVybWFsLmggICAgfCAgMTkg
Ky0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNzcgaW5zZXJ0aW9ucygrKSwgMjU1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvZGV2ZnJlcV9jb29saW5nLmMgYi9k
cml2ZXJzL3RoZXJtYWwvZGV2ZnJlcV9jb29saW5nLmMKClsgLi4uIF0KCj4gIHN0cnVjdCBkZXZm
cmVxX2Nvb2xpbmdfZGV2aWNlIHsKPiAgCWludCBpZDsKPiAgCXN0cnVjdCB0aGVybWFsX2Nvb2xp
bmdfZGV2aWNlICpjZGV2Owo+ICAJc3RydWN0IGRldmZyZXEgKmRldmZyZXE7Cj4gIAl1bnNpZ25l
ZCBsb25nIGNvb2xpbmdfc3RhdGU7Cj4gLQl1MzIgKnBvd2VyX3RhYmxlOwo+ICAJdTMyICpmcmVx
X3RhYmxlOwo+IC0Jc2l6ZV90IGZyZXFfdGFibGVfc2l6ZTsKPiArCXNpemVfdCBtYXhfbGV2ZWw7
CgpDb3VsZCB5b3UgcmVuYW1lIGl0IHRvICdtYXhfc3RhdGUnID8KCgpbIC4uLiBdCgoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
