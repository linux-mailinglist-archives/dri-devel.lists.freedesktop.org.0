Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D32AEA9C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF326E02C;
	Wed, 11 Nov 2020 07:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1360B89381
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:23:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a25so195803lfb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3y2+cM5+FqYhQiui9sx/NyVq3rbzN6lwK3hqYhLaV8=;
 b=MW7uaSPUscsvLgXHTARFkRHWLwcumbFgh/LvDj5UKi+RX8auOx189mq2TdUmSsRTNi
 XRn4kbwyuLHjtSYaHwe+spIMfuNWREoRSQl6/bBzCt2bgTA+kpefEAHIuAZonduQ4l+g
 boLidEBfR0POZlIShVqthNjwQRWsm8yKic8lAIVEbN1P1xWEDJvlT8mHP1yNXcudhsTQ
 NwLdoSYLmCTwy8iOSWENTf2hnQlDzEZVLZ0k3G26fETZVVs3Gtz6DL86Q9wj+mQAUQYw
 dZ5ZkUU0jA7OLM1kL0DCUAatZ5ABr+OPjrZDaTqVyRlDanl6LP0kTq90IsKr6kgrNGY/
 G3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3y2+cM5+FqYhQiui9sx/NyVq3rbzN6lwK3hqYhLaV8=;
 b=ovVldhjfJ5omWL6uCcdFqcFqxTW4QbyjExGW1/KaOQFIDLhoNSWhkc9i9k8/IJDvWn
 gW1mBPpxmSkjO8AfbU2PTlN35b3LwURGltfg7k/CEHJ5EiSkNg91ffufkIrPy2zjzlU9
 AHN2MyWU95XnlSBxo+QuAoP88pfPHdfY5cnR6ZqGgVCwtDqLxb/Q0C9GYFuTDKfkGjwO
 L68fS0r8XRWgFdDApqZe5tFK16uXKOR7PPSn4lnOAC2lsU1RiteA2cb4dXiilne1kXpy
 YjBHqPGRPli8c5qofqQwc+kHU+xXLnfkSkP6/LMsqVRdP2MXC/DB2MIrIufJ2EZrrOL/
 jzGg==
X-Gm-Message-State: AOAM532JuGfzFbjwRulmxlo3VZ7RsycCUebHy6HNn5ccIPavg4vWnYmG
 V4odEfWxkle4FEyeHuJ3sKo=
X-Google-Smtp-Source: ABdhPJxu+BBnt3e7PE9coUJuXY67nqcK2aWRMSusUxlgbN4K8B9Bg3GI+cjuRM7DUdJ8ilqOcn0l0Q==
X-Received: by 2002:ac2:46f3:: with SMTP id q19mr872398lfo.76.1605043423538;
 Tue, 10 Nov 2020 13:23:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id b25sm6087lfa.32.2020.11.10.13.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 13:23:42 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com> <20201110202945.GF2375022@ulmo>
 <20201110203257.GC5957@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
Date: Wed, 11 Nov 2020 00:23:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110203257.GC5957@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMTEuMjAyMCAyMzozMiwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFR1ZSwgTm92IDEw
LCAyMDIwIGF0IDA5OjI5OjQ1UE0gKzAxMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+PiBPbiBU
aHUsIE5vdiAwNSwgMjAyMCBhdCAwMjo0NDowOEFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3Jv
dGU6Cj4gCj4+PiArCS8qCj4+PiArCSAqIFZvbHRhZ2Ugc2NhbGluZyBpcyBvcHRpb25hbCBhbmQg
dHJ5aW5nIHRvIHNldCB2b2x0YWdlIGZvciBhIGR1bW15Cj4+PiArCSAqIHJlZ3VsYXRvciB3aWxs
IGVycm9yIG91dC4KPj4+ICsJICovCj4+PiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQo
ZGMtPmRldiwgImNvcmUtc3VwcGx5IikpCj4+PiArCQlyZXR1cm47Cj4gCj4+IFRoaXMgaXMgYSBw
b3RlbnRpYWxseSBoZWF2eSBvcGVyYXRpb24sIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGF2b2lkIHRo
YXQKPj4gaGVyZS4gSG93IGFib3V0IHlvdSB1c2UgZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFs
KCkgaW4gLT5wcm9iZSgpPyBUaGF0Cj4+IHJldHVybnMgLUVOT0RFViBpZiBubyByZWd1bGF0b3Ig
d2FzIHNwZWNpZmllZCwgaW4gd2hpY2ggY2FzZSB5b3UgY2FuIHNldAo+PiBkYy0+Y29yZV9yZWcg
PSBOVUxMIGFuZCB1c2UgdGhhdCBhcyB0aGUgY29uZGl0aW9uIGhlcmUuCj4gCj4gT3IgZW51bWVy
YXRlIHRoZSBjb25maWd1cmFibGUgdm9sdGFnZXMgYWZ0ZXIgZ2V0dGluZyB0aGUgcmVndWxhdG9y
IGFuZAo+IGhhbmRsZSB0aGF0IGFwcHJvcHJpYXRlbHkgd2hpY2ggd291bGQgYmUgbW9yZSByb2J1
c3QgaW4gY2FzZSB0aGVyZSdzCj4gbWlzc2luZyBvciB1bnVzdWFsIGNvbnN0cmFpbnRzLgo+IAoK
SSBhbHJlYWR5IGNoYW5nZWQgdGhhdCBjb2RlIHRvIHVzZSByZWd1bGF0b3JfZ2V0X29wdGlvbmFs
KCkgZm9yIHYyLgoKUmVnYXJkaW5nIHRoZSBlbnVtZXJhdGluZyBzdXBwb3J0ZWQgdm9sdGFnZS4u
IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUKZG9uZSBieSB0aGUgT1BQIGNvcmUsIGJ1dCByZWd1bGF0
b3IgY29yZSBkb2Vzbid0IHdvcmsgd2VsbCBpZgpyZWd1bGF0b3JfZ2V0KCkgaXMgaW52b2tlZCBt
b3JlIHRoYW4gb25lIHRpbWUgZm9yIHRoZSBzYW1lIGRldmljZSwgYXQKbGVhc3QgdGhlcmUgaXMg
YSBsb3VkIGRlYnVnZnMgd2FybmluZyBhYm91dCBhbiBhbHJlYWR5IGV4aXN0aW5nCmRpcmVjdG9y
eSBmb3IgYSByZWd1bGF0b3IuIEl0J3MgZWFzeSB0byBjaGVjayB3aGV0aGVyIHRoZSBkZWJ1Zwpk
aXJlY3RvcnkgZXhpc3RzIGJlZm9yZSBjcmVhdGluZyBpdCwgbGlrZSB0aGVybWFsIGZyYW1ld29y
ayBkb2VzIGl0IGZvcgpleGFtcGxlLCBidXQgdGhlbiB0aGVyZSB3ZXJlIHNvbWUgb3RoZXIgbW9y
ZSBkaWZmaWN1bHQgaXNzdWVzLi4gSSBkb24ndApyZWNhbGwgd2hhdCB0aGV5IHdlcmUgcmlnaHQg
bm93LiBQZXJoYXBzIHdpbGwgYmUgZWFzaWVyIHRvIHNpbXBseSBnZXQgYQplcnJvciBmcm9tIHJl
Z3VsYXRvcl9zZXRfdm9sdGFnZSgpIGZvciBub3cgYmVjYXVzZSBpdCBzaG91bGRuJ3QgZXZlcgpo
YXBwZW4gaW4gcHJhY3RpY2UsIHVubGVzcyBkZXZpY2UtdHJlZSBoYXMgd3JvbmcgY29uc3RyYWlu
dHMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
