Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DA29CE97
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BA589EA9;
	Wed, 28 Oct 2020 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027956E03E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 04:03:23 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 10so2159034pfp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=q3HZdrGNxCI/rwL2bJs+sG1c4DmY7gX64VUv8zPGJp0=;
 b=w3iZHgADd5v9U6zAOB8D+M8MEqnphniRW2Jy/fJCVN1kcqPClAO4LvMLqXOn07ZoLx
 ghyYw4tbLkd4ZLpFJ5yYzeB2FBTJQOSqLMu+eu0MDJFJ1PQQMIkmn0b06suSVU6pNGV6
 uV39iGdCd3/RgcBjaecMILewDPwDqHInv8BvhYSJukEtH5w8pUdZPPy3QYGUUlq8TXYX
 hViJ47ZuJPB3vTAc/INXSEvHVjOHsgy8am405mFyVp6YQXoavgdc2s31XtRWYPbONypI
 78PXWgfQYCOgG1JQeffggPKb8W+MjeWpY6LcpiSzsV3ffNOzQEzvrZzoRDJygvKe4ngM
 kzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=q3HZdrGNxCI/rwL2bJs+sG1c4DmY7gX64VUv8zPGJp0=;
 b=j207olx1nq5ko1JnzfaSjLf/0IGXfFVbUpUAXEo3iMuXVr0HDKeh8nAks6LzWN+OPH
 6iQ5A6tdI8A9u9KJECegO4X6C6mweic0eqL2huEfU+8XkXMbJpkq4/+gsG9gwGEoK6VV
 F2KkK2OqcmV3lQDHV6abIioQhqGd1pin3bFzdiBlwckC0z78cBuhykx6YBnkgw3PkVMv
 PuSsvuvbINmVwpetbNxPsCYo0e29Npa/BagYfdeFc1M4+XWaGdacsH1vuCqXbaSH2E+c
 EufawZL0yAY3bdkDAfylntZ4Lve3tZaQvzyGQ3acDH/h7ME2wyeaf5peUUEr+ZTIhc3Z
 NooA==
X-Gm-Message-State: AOAM532bnkH5CMXLVyT7YpuQlUKTxg2Tnm0X/9K97oZrIWbk/3MG9fIf
 7qh/ly22/nSYXoAAi1oYNryVag==
X-Google-Smtp-Source: ABdhPJx3bloTJFrm0fb9VkDA3VdvEPdnyGyj3MWhkAqG7wE90ovxnS/KcE9dbBFeor/v06ApPv/DnQ==
X-Received: by 2002:a05:6a00:2cf:b029:160:c0c:a95c with SMTP id
 b15-20020a056a0002cfb02901600c0ca95cmr5587882pft.76.1603857803605; 
 Tue, 27 Oct 2020 21:03:23 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id kk14sm3187829pjb.47.2020.10.27.21.03.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 21:03:22 -0700 (PDT)
Date: Wed, 28 Oct 2020 09:33:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 46/52] opp: Put interconnect paths outside of
 opp_table_lock
Message-ID: <20201028040320.4nobxzudy3fuwmms@vireshk-i7>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-47-digetx@gmail.com>
 <20201027051013.5gr4s3wuuwxsd7ax@vireshk-i7>
 <44169d24-4afc-5388-788f-d1e8263fc627@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44169d24-4afc-5388-788f-d1e8263fc627@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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

T24gMjctMTAtMjAsIDIzOjI2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjcuMTAuMjAyMCAw
ODoxMCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAyNi0xMC0yMCwgMDE6MTcsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIGZpeGVzIGxvY2t1cCB3aGljaCBo
YXBwZW5zIHdoZW4gT1BQIHRhYmxlIGlzIHJlbGVhc2VkIGlmCj4gPj4gaW50ZXJjb25uZWN0IHBy
b3ZpZGVyIHVzZXMgT1BQIGluIHRoZSBpY2NfcHJvdmlkZXItPnNldCgpIGNhbGxiYWNrCj4gPj4g
YW5kIGJhbmR3aWR0aCBvZiB0aGUgSUNDIHBhdGggaXMgc2V0IHRvIDAgYnkgdGhlIElDQyBjb3Jl
IHdoZW4gcGF0aAo+ID4+IGlzIHJlbGVhc2VkLiBUaGUgaWNjX3B1dCgpIGRvZXNuJ3QgbmVlZCB0
aGUgb3BwX3RhYmxlX2xvY2sgcHJvdGVjdGlvbiwKPiA+PiBoZW5jZSBsZXQncyBtb3ZlIGl0IG91
dHNpZGUgb2YgdGhlIGxvY2sgaW4gb3JkZXIgdG8gcmVzb2x2ZSB0aGUgcHJvYmxlbS4KPiA+Pgo+
ID4+IEluIHBhcnRpY3VsYXIgdGhpcyBmaXhlcyB0ZWdyYS1kZXZmcmVxIGRyaXZlciBsb2NrdXAg
b24gdHJ5aW5nIHRvIHVubG9hZAo+ID4+IHRoZSBkcml2ZXIgbW9kdWxlLiBUaGUgZGV2ZnJlcSBk
cml2ZXIgdXNlcyBPUFAtYmFuZHdpZHRoIEFQSSBhbmQgaXRzIElDQwo+ID4+IHByb3ZpZGVyIGFs
c28gdXNlcyBPUFAgZm9yIERWRlMsIGhlbmNlIHRoZXkgYm90aCB0YWtlIHNhbWUgb3BwX3RhYmxl
X2xvY2sKPiA+PiB3aGVuIE9QUCB0YWJsZSBvZiB0aGUgZGV2ZnJlcSBpcyByZWxlYXNlZC4KPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
PiA+PiAtLS0KPiAuLi4KPiA+IAo+ID4gTmV2ZXIgbWFrZSBzdWNoIF9maXhlc18gcGFydCBvZiBz
dWNoIGEgYmlnIHBhdGNoc2V0LiBBbHdheXMgc2VuZCB0aGVtCj4gPiBzZXBhcmF0ZWx5Lgo+IAo+
IFBlcmhhcHMgaXQncyBub3Qgb2J2aW91cyBmcm9tIHRoZSBjb21taXQgZGVzY3JpcHRpb24gdGhh
dCB0aGlzIHBhdGNoCj4gZG9lc24ndCBmaXggYW55IGtub3duIHByb2JsZW1zIG9mIHRoZSBjdXJy
ZW50IG1haW5saW5lIGtlcm5lbCBhbmQgaXQncwo+IG5lZWRlZCBvbmx5IGZvciB0aGUgbmV3IHBh
dGNoZXMuCgpObywgSSB1bmRlcnN0b29kIHRoYXQgd2Ugc3RhcnRlZCBnZXR0aW5nIHRoZSB3YXJu
aW5nIG5vdyBvbmx5IGFmdGVyCnNvbWUgb3RoZXIgcGF0Y2hlcyBvZiB5b3Vycy4gTmV2ZXJ0aGVs
ZXNzLCBpdCBzaG91bGQgYmUgY29uc2lkZXJlZCBhcwphIGZpeCBvbmx5IGFzIHRoYXQgZ2VuZXJh
dGVkIGxvY2tkZXAgYmVjYXVzZSBvZiBsb2NraW5nIHBsYWNlbWVudC4gQW5kCnNvIHNlbmRpbmcg
c3VjaCBzdHVmZiBzZXBhcmF0ZWx5IGlzIGJldHRlciBhcyB0aGF0IGFsbG93cyBwZW9wbGUgdG8K
YXBwbHkgaXQgZmFzdC4KCj4gPiBIYXZpbmcgc2FpZCB0aGF0LCBJIGFscmVhZHkgaGF2ZSBhIHBh
dGNoIHdpdGggbWUgd2hpY2ggc2hhbGwgZml4IGl0IGZvciB5b3UgYXMKPiA+IHdlbGw6Cj4gCj4g
SSBzZWUgdGhhdCB5b3VycyBmaXggaXMgYWxyZWFkeSBhcHBsaWVkLCB0aGFua3MhCgpJIGhvcGUg
aXQgd29ya2VkIGZvciB5b3UuIFRoYW5rcy4KCi0tIAp2aXJlc2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
