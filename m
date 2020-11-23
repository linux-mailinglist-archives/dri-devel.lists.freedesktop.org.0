Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418472C1F9C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4F6E202;
	Tue, 24 Nov 2020 08:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2283C89BE8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:14:23 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j205so23398694lfj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 04:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRhGjbX+VEiprJASwNsMJBN6MmSp2/p8ffbHFNLLsjE=;
 b=K4daee2wLSFX05MC4H13VqAmjxeWpMxobi3uR5PHfIWNbdrgwBaSFlnfYL1dH55R/k
 Q4OGdyP5r6mHHk5nagnfvdyFpW347yr4CP77sOfL/q+fYsSjxR07X3LDfEz3yTdD3ATS
 MQTwsYFRCNSfgwQP00E/IHq1SDs0popuUroi2NUnsQssoGcJ3eOF2BJjOCE9zwZVn7sR
 XutkFZyFixsUwRX7R/iV86VV4fMQPUn1lOkBeSGlP+lUgQmwtCyWceLG9Kws2FZcONzi
 TAmvLk+APEduPsVRXNZCpkMlzp51XoyRIQTTaom1cvbRfM4+TzmPyNdSOkhFG8GgSFU2
 MK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRhGjbX+VEiprJASwNsMJBN6MmSp2/p8ffbHFNLLsjE=;
 b=DUEnzmmy/MrWjbZZT3HKoCsT4cGbGjoV9vSG78bwaFJRQKFSvq6EiP+mkzkCDiQAr1
 9yh7gvzkWXnaJw947pDosfQ2HL5CWZ8Ck4cDL9ZbHcVZSm0DTyqCuBrZp7f3jPZDYJoX
 3Uus/eeCE5ohi0WH7zZQgfp3Mm1rRWXHs1tqX7wrx/8PGwMshhJDSZw9lnzO49JzDMZZ
 xw8RgX0NOPnaK68Ddvp94gPFIFFf1WjP5V0Svu15NNphiHZwv4DgySK+F/dHqaXWvopI
 q9s7NrdtAjb53Io7d174Eu7Vnb5UzoCkBL5sEvkxoBLkl/0ow4uyi+qLSqEaP0HemWjn
 2A2Q==
X-Gm-Message-State: AOAM533WDnsa57J0efTHDoac/VXjn+FEBTayPFRh5wih5yjgLAADl37n
 rnGRCITwebH8aoxx1z650PPlzk0uVg0=
X-Google-Smtp-Source: ABdhPJyeUKDBnMC5w2mRg2QuoMaH6BuqaSjVArPe4axgNT1C/Ngvvfi2S1/Hfsx7UiIAQiajE51y0Q==
X-Received: by 2002:a19:c94:: with SMTP id 142mr12360394lfm.284.1606133661420; 
 Mon, 23 Nov 2020 04:14:21 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id q26sm1371522lfa.104.2020.11.23.04.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:14:20 -0800 (PST)
Subject: Re: [PATCH v10 09/19] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <CGME20201123003325epcas1p1b90c7b94507a3d58053949f5395c885a@epcas1p1.samsung.com>
 <20201123002723.28463-10-digetx@gmail.com>
 <f8f0b254-b5d6-7951-7576-846d8f58cb13@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cb9ba2fd-c450-b35d-9a72-846f33e0c427@gmail.com>
Date: Mon, 23 Nov 2020 15:14:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <f8f0b254-b5d6-7951-7576-846d8f58cb13@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMTEuMjAyMCAxMDowMiwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIDExLzIzLzIwIDk6MjcgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gVGhpcyBw
YXRjaCBtb3ZlcyBBQ1RNT04gZHJpdmVyIGF3YXkgZnJvbSBnZW5lcmF0aW5nIE9QUCB0YWJsZSBi
eSBpdHNlbGYsCj4+IHRyYW5zaXRpb25pbmcgaXQgdG8gdXNlIHRoZSB0YWJsZSB3aGljaCBjb21l
cyBmcm9tIGRldmljZS10cmVlLiBUaGlzCj4+IGNoYW5nZSBicmVha3MgY29tcGF0aWJpbGl0eSB3
aXRoIG9sZGVyIGRldmljZS10cmVlcyBhbmQgYnJpbmdzIHN1cHBvcnQKPj4gZm9yIHRoZSBpbnRl
cmNvbm5lY3QgZnJhbWV3b3JrIHRvIHRoZSBkcml2ZXIuIFRoaXMgaXMgYSBtYW5kYXRvcnkgY2hh
bmdlCj4+IHdoaWNoIG5lZWRzIHRvIGJlIGRvbmUgaW4gb3JkZXIgdG8gaW1wbGVtZW50IGludGVy
Y29ubmVjdC1iYXNlZCBtZW1vcnkKPj4gRFZGUywgaS5lLiBkZXZpY2UtdHJlZXMgbmVlZCB0byBi
ZSB1cGRhdGVkLiBOb3cgQUNUTU9OIGlzc3VlcyBhIG1lbW9yeQo+PiBiYW5kd2lkdGggcmVxdWVz
dHMgdXNpbmcgZGV2X3BtX29wcF9zZXRfYncoKSBpbnN0ZWFkIG9mIGRyaXZpbmcgRU1DIGNsb2Nr
Cj4+IHJhdGUgZGlyZWN0bHkuCj4+Cj4+IFRlc3RlZC1ieTogUGV0ZXIgR2VpcyA8cGd3aXBlb3V0
QGdtYWlsLmNvbT4KPj4gVGVzdGVkLWJ5OiBOaWNvbGFzIENoYXV2ZXQgPGt3aXphcnRAZ21haWwu
Y29tPgo+PiBBY2tlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgfCA3OSArKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwg
NDIgZGVsZXRpb25zKC0pCj4+Cj4gCj4gKHNuaXApCgpIZWxsbyBDaGFud29vLAoKPiBXaGVuIHRo
ZSBwYXRjaGVzIHJlbGF0ZWQgdG8gaWNjIGFyZSBtZXJnZWQsIEknbGwgbWVyZ2UgcGF0Y2g5LzEw
Lgo+IFRoYW5rcyBmb3IgeW91ciB3b3JrLgo+IAoKQWxyaWdodCwgdGhhbmsgeW91IQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
