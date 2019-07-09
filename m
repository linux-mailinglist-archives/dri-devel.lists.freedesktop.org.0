Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888A642CB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8241D89EA9;
	Wed, 10 Jul 2019 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4C89EA9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 21:04:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s22so200103qkj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 14:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aEogp/cBvpbqRpq9HNPTDGBPzInEZSXBFxGFWaMG1AM=;
 b=SUp4usf7+6V0Lmy2IvLRQin2/3SgyZnFK+X97e2DlN/xvWbtDNZrCiJQlUtwwiR9rw
 BV7sVMBJpamo5NN83/auLXaBTBB9tUxi012TiQf+nse3TjjUZzceBDUw4zcziw1/n7Jo
 fJrefYWYM2uaf+uD3jN7igZU7BrtZr+ddR8bCF/mk8ztmpD3IVP2qpnYEZAZGpc6N80F
 S/xH3y1Aab0MuKJgmV9gfITWAUXAMNTIoBvFeYk1hML7k8Pq6LfBYnv49H3wKHp130+e
 TRzljwa+iio2tLO/Y9xpiGXYjkfnaHQHk2FM6WjwCTb8vbsAeIlRMhPrtDAoVA9SOHxQ
 jcfw==
X-Gm-Message-State: APjAAAXPdqVF4NZRMOR2nH5nMlL+m/uYqmoiFasrpadHEfUPBF2aVApA
 RSNNQI0U+7lrEPk8agALVzE=
X-Google-Smtp-Source: APXvYqxsnTsrAhygBiAvta/IeP+a0jcZA//lyzZOvNaMpkQT/ZUsA60EkzdlG2QjXDOIKCdE3A/sGw==
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr20551083qkn.414.1562706258071; 
 Tue, 09 Jul 2019 14:04:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id z1sm98720qkg.103.2019.07.09.14.04.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 14:04:17 -0700 (PDT)
Subject: Re: [PATCH v1] drm/tegra: Fix gpiod_get_from_of_node() regression
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20190705151139.19032-1-digetx@gmail.com>
 <9425f0e8-36ec-76cb-b177-fa486fcafc19@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a4c63f8-9ea7-a017-57f9-1dec0f178a79@gmail.com>
Date: Wed, 10 Jul 2019 00:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9425f0e8-36ec-76cb-b177-fa486fcafc19@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aEogp/cBvpbqRpq9HNPTDGBPzInEZSXBFxGFWaMG1AM=;
 b=jLgwzCz9+zRNaNgqU1yTRHMOC0sD/PbzqlpKe1j+xds1BV0y9Eg4wutDD5/kICyDkV
 iIRECLZ0QEtHw+LQc+XPmegDwYs2L3AakvdIHCkQ5oyYscCs7rOcQOLSuMH24DLC3vxR
 v5z9Rxh4CKZpbZ6KstYNFO3BtYNZuJWL9lNLKD8floP78nSvqhHWBt3CupBCnNpgxA+8
 JOHIKNWma5iW+ZKBFulpzZ1JrsA6sD8gU5hjwpBqw3pn4EWN9eyULn4IjR4IYz7KpA07
 fLTPeduBPFNd0DERNjVoaDEPf6tKiPFO0Z/1r1BImMvH2zVoOFcP/l9I1PYr/tsf4Go4
 q9pQ==
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

MDkuMDcuMjAxOSAxOToyNywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDA1LzA3LzIw
MTkgMTY6MTEsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gVGhhdCBmdW5jdGlvbiBub3cgcmV0
dXJucyBFUlJfUFRSIGluc3RlYWQgb2YgTlVMTCBpZiAiaHBkLWdwaW8iIGlzIG5vdAo+PiBwcmVz
ZW50IGluIGRldmljZS10cmVlLiBUaGUgb2ZmZW5kaW5nIHBhdGNoIG1pc3NlZCB0byBhZGFwdCB0
aGUgVGVncmEncwo+PiBEUk0gZHJpdmVyIGZvciB0aGUgQVBJIGNoYW5nZS4KPj4KPj4gRml4ZXM6
IDAyNWJmMzc3MjVmMSAoImdwaW86IEZpeCByZXR1cm4gdmFsdWUgbWlzbWF0Y2ggb2YgZnVuY3Rp
b24gZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZSgpIikKPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9vdXRwdXQuYyB8IDggKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvb3V0cHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPj4gaW5kZXggMjc0
Y2I5NTVlMmUxLi40NzFkMzM4MDljZDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9vdXRwdXQuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPj4g
QEAgLTEyNiw4ICsxMjYsMTIgQEAgaW50IHRlZ3JhX291dHB1dF9wcm9iZShzdHJ1Y3QgdGVncmFf
b3V0cHV0ICpvdXRwdXQpCj4+ICAJCQkJCQkgICAgICAgIm52aWRpYSxocGQtZ3BpbyIsIDAsCj4+
ICAJCQkJCQkgICAgICAgR1BJT0RfSU4sCj4+ICAJCQkJCQkgICAgICAgIkhETUkgaG90cGx1ZyBk
ZXRlY3QiKTsKPj4gLQlpZiAoSVNfRVJSKG91dHB1dC0+aHBkX2dwaW8pKQo+PiAtCQlyZXR1cm4g
UFRSX0VSUihvdXRwdXQtPmhwZF9ncGlvKTsKPj4gKwlpZiAoSVNfRVJSKG91dHB1dC0+aHBkX2dw
aW8pKSB7Cj4+ICsJCWlmIChQVFJfRVJSKG91dHB1dC0+aHBkX2dwaW8pID09IC1FTk9FTlQpCj4+
ICsJCQlvdXRwdXQtPmhwZF9ncGlvID0gTlVMTDsKPj4gKwkJZWxzZQo+PiArCQkJcmV0dXJuIFBU
Ul9FUlIob3V0cHV0LT5ocGRfZ3Bpbyk7Cj4+ICsJfQo+PiAgCj4+ICAJaWYgKG91dHB1dC0+aHBk
X2dwaW8pIHsKPj4gIAkJZXJyID0gZ3Bpb2RfdG9faXJxKG91dHB1dC0+aHBkX2dwaW8pOwo+Pgo+
IAo+IEFja2VkLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KClRoYW5rcyEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
