Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB23408C0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 16:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78816E861;
	Thu, 18 Mar 2021 15:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7B36E861
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 15:26:14 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id l132so2346197qke.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2CkTFBzHKevHP9jTEvTMOipcoESSuPtL1rt1uZKeTnM=;
 b=GGjXFyXP8+XnjdrhC7xocwwUlvsbuOrKSkWECzPERHDynPjN2b4lhpQvW9Gem05AK7
 5jKWNu2mHc4M+D99v77U75vH5S3D8yRBi63qZBeiKgi+ZEoZ4aHrcIJSFCExKaFzOEjT
 ElrIRiA0dRZ40elhW0kk7dhdCVDrcj0uz7vk8gaALL33Ustgcoa/+uICfRo2QrA0CyYM
 dklPbpYT+TTu0eHT4I7bcGMZrwmSUK9s4yJcgnK697OZRSnWAWGo5IJ3QbZQZU2yGlqy
 Wm16v6QSOaq92uM6XCyxH/AyIgJm1hN1vQJrbK8Fwb/F8FPbMCkRauIyDNtDdf9RNGeh
 BWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2CkTFBzHKevHP9jTEvTMOipcoESSuPtL1rt1uZKeTnM=;
 b=JeCLYk/Z1MOyX/kZ71++sy2cJ6/Hf213Uu7OD7Map03P/vg/VyD6kU+J799bw+u+AD
 9k0I6BA8eLuF7Lq8WNI7mF7FPLzgIqeWbsGyWnWmWYO4qQkimA0L0bJUXxVLAqHXX8Bq
 ivaa+s57XVZVDprEWVYeSHLlFv0U5uaqQjvATfZquwEqgMRQNG4KHHsWX1bG7jLspZw6
 dZ2lAFYqH7cQClEGgYuTaRNltCII/k+vLLMf1EZ7lT/nn0VHa6eWKI223wRQOEe9CSrr
 HT97XaW/y0C6Yqtzb0Arbn9hNcQA9W24j9U048V3WIZ0XAj3ErkSE7yBp2ObRjc10ss9
 haSg==
X-Gm-Message-State: AOAM5303vhGcqRKVnaLLEbrx2O7JthfRvbd78f9uxjcxpX09GxHBpNw2
 zRDDCWbA02FNfcvNqMxL2h0=
X-Google-Smtp-Source: ABdhPJxS1KDsJhsu/EHIapL+GMyWJdfWtE1j2OEdPHRvg5xU0vNd481B5g6w+JT79LR+arPDip3jIg==
X-Received: by 2002:a37:7c8:: with SMTP id 191mr4831127qkh.53.1616081173782;
 Thu, 18 Mar 2021 08:26:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1858:f1e8:95dd:606c?
 ([2a02:908:1252:fb60:1858:f1e8:95dd:606c])
 by smtp.gmail.com with ESMTPSA id l5sm1599418qtj.21.2021.03.18.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:26:13 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/ttm: move swapout logic around v2
To: Nirmoy <nirmodas@amd.com>, dri-devel@lists.freedesktop.org
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <21b8c51d-a237-060d-438a-cd5709c28348@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dcbdef7a-d18d-c729-0e8a-bfe562b64695@gmail.com>
Date: Thu, 18 Mar 2021 16:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <21b8c51d-a237-060d-438a-cd5709c28348@amd.com>
Content-Language: en-US
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
Cc: ray.huang@amd.com, matthew.william.auld@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDMuMjEgdW0gMTU6NDMgc2NocmllYiBOaXJtb3k6Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4g
T24gMy8xOC8yMSAxOjQ3IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IDxzbmlwPgo+PiDC
oCAvKioKPj4gwqDCoCAqIHR0bV9ib191c2VzX2VtYmVkZGVkX2dlbV9vYmplY3QgLSBjaGVjayBp
ZiB0aGUgZ2l2ZW4gYm8gdXNlcyB0aGUKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90
dG1fZGV2aWNlLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4+IGluZGV4IDAzNWJi
YzA0NGEzYi4uNmEwYjI2N2Q0ZmU2IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRt
X2RldmljZS5oCj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPj4gQEAgLTI5
Nyw2ICsyOTcsOCBAQCBzdHJ1Y3QgdHRtX2RldmljZSB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRl
bGF5ZWRfd29yayB3cTsKPj4gwqAgfTsKPj4gwqAgK2xvbmcgdHRtX2dsb2JhbF9zd2Fwb3V0KHN0
cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBnZnBfdCAKPj4gZ2ZwX2ZsYWdzKTsKPgo+Cj4g
VGhlcmUgaXMgYSB0eXBvIGhlcmUsIGxvbmcgLT4gaW50LgoKQWgsIHllcy4gSSBtaXNzZWQgdG8g
YWRkIHRoZSBjaGFuZ2UgdG8gdGhlIGhlYWRlciBmaWxlLgoKVGhhbmtzIGZvciBwb2ludGluZyB0
aGF0IG91dCwKQ2hyaXN0aWFuLgoKPgo+Cj4gVGhhbmtzLAo+Cj4gTmlybW95Cj4KPgo+PiArCj4+
IMKgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICoKPj4gwqAgdHRt
X21hbmFnZXJfdHlwZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwgaW50IG1lbV90eXBlKQo+PiDC
oCB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
