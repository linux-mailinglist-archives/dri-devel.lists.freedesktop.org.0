Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AB2AB2C6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618C289650;
	Mon,  9 Nov 2020 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9678944A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:53:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z3so7063048pfb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=I4CHDtUGbNIJQpM023wPiaWJqW6VgcrXTJggEv8wwSw=;
 b=qCNPstD8wk3f6WVndWAivRv5cGLOIzilHxs0sV7MkBI8GDXwzWkbmt+V1Ae9lrpsMJ
 B4t28mlabIok8WTUpK4tOZJhv14XX6QPx9rUN/5/7PjDOEIOF07vmO2pAN+fOFSCVQFs
 N9tTa3VjUXqiHFZpYHNhvX9c+lshFtkGG4kTSo9LVtvbWKYZTAF10/IyRus+uU55LRBE
 4k68uNqq+fkS72Id3gBgsPo8GFhIcdXrrqMldXmeqgNgvMOl+qXZJXb1YbEiT/aa1Etq
 o30FSX7jLjx5MVrVA99VofHiE5IMFfg3o0pRw5sTKSTM5XBTSZbKnADSmkIOStFM24ld
 zguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=I4CHDtUGbNIJQpM023wPiaWJqW6VgcrXTJggEv8wwSw=;
 b=gKwm/mGpj23/GmX6AhrkIyXy3VHGIiD92WYLkYUT38m604+2KDaqxBA4eFGZ2lobsF
 I2R7t4AKaYVf1sWPjx0Dk4PDPrXoT96oNLaWSzQEEBGPB7AxCO4J0j99kKhBbX6AYKGn
 sSix6OZpp2TUJ5UrwaVpUrsfOb7lnoUiVl5ww35J9hEfpAAEtPkRoRCX2PDR255atNSX
 48UmTK4gRwyft5TBk0qr/eytKMVt58OxN/XRjmDSHeugVKckHJB0wn7xrf+Zixs6XKVv
 uMm+j6qbxNTKi4iUpptHbUEiwAYjWjr9FD5FFTMCbw+oX8KFIrtfQmAlV1TEgTzrobZV
 SlJQ==
X-Gm-Message-State: AOAM5324b061GIgXahoSNBEGH7Tlif325r+Q3HvU1+xyW53navSNlupP
 cPd1ESGCUBwMPK0yOPE9EYLsyw==
X-Google-Smtp-Source: ABdhPJwcV7Uyws0t/xTffHxasXM2N+eWSdO5J/LaZj2Wqdrek/AXYoDsM1gv08im58tWUSJ8zIbVUg==
X-Received: by 2002:a17:90a:e110:: with SMTP id
 c16mr11572525pjz.84.1604901203964; 
 Sun, 08 Nov 2020 21:53:23 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id 12sm3592369pjn.19.2020.11.08.21.53.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:53:22 -0800 (PST)
Date: Mon, 9 Nov 2020 11:23:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
Message-ID: <20201109055320.5y5gf2whwast2mi4@vireshk-i7>
References: <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
 <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
 <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
 <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
 <33a7ad95-a8cf-7b88-0f78-09086c1a4adf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33a7ad95-a8cf-7b88-0f78-09086c1a4adf@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Frank Lee <tiny.windzz@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDktMTEtMjAsIDA4OjQ0LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDkuMTEuMjAyMCAw
ODozNSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAwOS0xMS0yMCwgMDg6MTksIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGFua3MsIEkgbWFkZSBpdCBpbiBhIGRpZmZlcmVu
dCB3YXkgYnkgc2ltcGx5IGFkZGluZyBoZWxwZXJzIHRvIHRoZQo+ID4+IHBtX29wcC5oIHdoaWNo
IHVzZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKS4gVGhpcyBkb2Vzbid0IHJlcXVpcmUgdG8K
PiA+PiBhZGQgbmV3IGtlcm5lbCBzeW1ib2xzLgo+ID4gCj4gPiBJIHdpbGwgcHJlZmVyIHRvIGFk
ZCBpdCBpbiBjb3JlLmMgaXRzZWxmLCBhbmQgeWVzCj4gPiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVz
ZXQoKSBsb29rcyBiZXR0ZXIuIEJ1dCBJIGFtIHN0aWxsIG5vdCBzdXJlIGZvcgo+ID4gd2hpY2gg
aGVscGVycyBkbyB3ZSBuZWVkIHRoZSBkZXZtXyooKSB2YXJpYW50cywgYXMgdGhpcyBpcyBvbmx5
IHVzZWZ1bAo+ID4gZm9yIG5vbi1DUFUgZGV2aWNlcy4gQnV0IGlmIHdlIGhhdmUgdXNlcnMgdGhh
dCB3ZSBjYW4gYWRkIHJpZ2h0IG5vdywKPiA+IHdoeSBub3QuCj4gCj4gQWxsIGN1cnJlbnQgbm9u
LUNQVSBkcml2ZXJzIChkZXZmcmVxLCBtbWMsIG1lbW9yeSwgZXRjKSBjYW4gYmVuZWZpdCBmcm9t
IGl0Lgo+IAo+IEZvciBUZWdyYSBkcml2ZXJzIHdlIG5lZWQgdGhlc2UgdmFyaWFudHM6Cj4gCj4g
ZGV2bV9wbV9vcHBfc2V0X3N1cHBvcnRlZF9odygpCj4gZGV2bV9wbV9vcHBfc2V0X3JlZ3VsYXRv
cnMoKSBbaWYgd2Ugd29uJ3QgdXNlIEdFTlBEXQo+IGRldm1fcG1fb3BwX3NldF9jbGtuYW1lKCkK
PiBkZXZtX3BtX29wcF9vZl9hZGRfdGFibGUoKQoKSSB0cmllZCB0byBsb29rIGVhcmxpZXIgZm9y
IHRoZSBzdHVmZiBhbHJlYWR5IG1lcmdlZCBpbiBhbmQgZGlkbid0CmZpbmQgYSBsb3Qgb2Ygc3R1
ZmYgd2hlcmUgdGhlIGRldm1fKiBjb3VsZCBiZSB1c2VkLCBtYXliZSBJIG1pc3NlZApzb21lIG9m
IGl0LgoKRnJhbmssIHdvdWxkIHlvdSBsaWtlIHRvIHJlZnJlc2ggeW91ciBzZXJpZXMgYmFzZWQg
b24gc3VnZ2VzdGlvbnMgZnJvbQpEbWl0cnkgYW5kIG1ha2Ugb3RoZXIgZHJpdmVycyBhZGFwdCB0
byB0aGUgbmV3IEFQSXMgPwoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
