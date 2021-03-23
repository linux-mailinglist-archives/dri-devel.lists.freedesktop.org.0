Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44934686E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B5D6E160;
	Tue, 23 Mar 2021 19:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C614A6E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:05:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w37so28229031lfu.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fd4nuYgAaVbYEZoND2eJf184kvi4RgKD7hJ3TDmQcPM=;
 b=hT1Ejjq6A2J0XCUZAk3Vabu44kQWxgId5jai2ZyA9cbXbZksfeRkcetzaZSIP2/4NZ
 3j6E0e4CCOdS7N6sMrbtzUCaGMBxuj7JK4RwEeMTDGmCKLLUsA5prVWI2Pf153idiLOI
 9aaZkfC5nN0wJgERtnEJ3wNVFfKVoUihb0L6vqizTE7IvIw8PW4MykMTRb3eTqONQqC6
 dSdTKkUzH5X7q4GkL+eatDKSSKT2gaAKQ8+SMHDPBPJbYrQu8o/io2SHELKj5AUFGiJY
 Jz9m+MZIiCEv1wrxbtYyLwREg7/pWARPedceVEOZxR4QEWUhW07btMwVAPDvrK57LXxj
 rM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fd4nuYgAaVbYEZoND2eJf184kvi4RgKD7hJ3TDmQcPM=;
 b=XXLGOGIVh+Loe9EogOu4Wxk2l1KvX9kA0oXHkx3nmy4tZ3yZNdv1IPqB6utMfV2X8B
 N3/cVRM/oaZbT3HlOEVOY39Q7iD9GR2zveqaRXxNh28Ysr7IPY73eiVIHa049LFdp7w4
 yfKbnO0/dR0yf8v+eXJ1aEj3IGLf+Y9rd3cwOpycMhWIke+FCAZAfAzfUDeypTfyhByT
 quyZI8PcIE9KZMzv41ZaRlywieRPV0Yn0qmZYyBO3ll0Vr37TZtqH9HrKpLUx3RZxQsp
 Tk1RXtChJL74tn9n1ArShEj6HUBoQVolKr5Q2p2SWHHHb7C52K5QBraIVcWxGmYA8LBA
 MrAA==
X-Gm-Message-State: AOAM533hI+tjKPMMsTcWjJvAyNoKCKSS65rv3Gv/b7s6IEI///u9f5iS
 sUAUpjW13UtU851nwe3mFNA=
X-Google-Smtp-Source: ABdhPJylnQ3Sr2QV0cFqAMxby2zDHSlfGcoSMVDpk7QUeSXnBsj2ad98sNodXW8Xi6iQrFqJYHHQtg==
X-Received: by 2002:a05:6512:3d20:: with SMTP id
 d32mr3511758lfv.9.1616526324273; 
 Tue, 23 Mar 2021 12:05:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id y23sm2451175ljm.53.2021.03.23.12.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:05:23 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
 <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
 <YFoyc5mdYe/5/Cjn@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <487b94d0-a52b-824b-c29d-f88b4605b117@gmail.com>
Date: Tue, 23 Mar 2021 22:05:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFoyc5mdYe/5/Cjn@orome.fritz.box>
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAyMToyNCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIE1h
ciAyMywgMjAyMSBhdCAwODo1Nzo0MlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDIzLjAzLjIwMjEgMTg6NTQsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBAQCAtOTIw
LDE1ICs5MzQsNDIgQEAgc3RhdGljIHZvaWQgdGVncmFfY3Vyc29yX2F0b21pY191cGRhdGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsCj4+PiAgCXZhbHVlID0gdGVncmFfZGNfcmVhZGwoZGMsIERD
X0RJU1BfQkxFTkRfQ1VSU09SX0NPTlRST0wpOwo+Pj4gIAl2YWx1ZSAmPSB+Q1VSU09SX0RTVF9C
TEVORF9NQVNLOwo+Pj4gIAl2YWx1ZSAmPSB+Q1VSU09SX1NSQ19CTEVORF9NQVNLOwo+Pj4gLQl2
YWx1ZSB8PSBDVVJTT1JfTU9ERV9OT1JNQUw7Cj4+PiArCj4+PiArCWlmIChkYy0+c29jLT5oYXNf
bnZkaXNwbGF5KQo+Pj4gKwkJdmFsdWUgJj0gfkNVUlNPUl9DT01QT1NJVElPTl9NT0RFX1hPUjsK
Pj4+ICsJZWxzZQo+Pj4gKwkJdmFsdWUgfD0gQ1VSU09SX01PREVfTk9STUFMOwo+Pj4gKwo+Pj4g
IAl2YWx1ZSB8PSBDVVJTT1JfRFNUX0JMRU5EX05FR19LMV9USU1FU19TUkM7Cj4+PiAgCXZhbHVl
IHw9IENVUlNPUl9TUkNfQkxFTkRfSzFfVElNRVNfU1JDOwo+Pj4gIAl2YWx1ZSB8PSBDVVJTT1Jf
QUxQSEE7Cj4+PiAgCXRlZ3JhX2RjX3dyaXRlbChkYywgdmFsdWUsIERDX0RJU1BfQkxFTkRfQ1VS
U09SX0NPTlRST0wpOwo+Pj4gIAo+Pj4gKwkvKiBudmRpc3BsYXkgcmVsaWVzIG9uIHNvZnR3YXJl
IGZvciBjbGlwcGluZyAqLwo+Pj4gKwlpZiAoZGMtPnNvYy0+aGFzX252ZGlzcGxheSkgewo+Pgo+
PiBCdXQgY29vcmRpbmF0ZXMgYWxyZWFkeSBzaG91bGQgYmUgY2xpcHBlZCBieQo+PiBkcm1fYXRv
bWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpLgo+IAo+IFllcywgYW5kIHRoZSBkcml2ZXIg
Z29lcyBvbiB0byB1c2UgdGhlIGNsaXBwZWQgY29vcmRpbmF0ZXMgbGF0ZXIgb24gaW4KPiB0aGlz
IGZ1bmN0aW9uLgoKSSBzZWUgbm93IHdoYXQgaXQgZG9lcywgbG9va3Mgb2theS4KCk1pbm9yIG5p
dDogdGhlIGkvaiBhcmVuJ3QgdmVyeSBleHByZXNzaXZlIG5hbWVzLCBzb21ldGhpbmcgbGlrZSBz
eC9zeQpzdy9zaCBzaG91bGQgYmUgYSBiaXQgbW9yZSBhcHByb3ByaWF0ZSBuYW1pbmcuCgpZb3Ug
Y291bGQgYWxzbyBtYWtlIHVzZSBvZiBkcm1fcmVjdF93aWR0aC9oZWlnaHQgaGVscGVycy4KCkJ1
dCB0aGlzIGRvZXNuJ3QgZGVzZXJ2ZSBhIHYyIGlmIHRoZXJlIGlzIG5vdGhpbmcgbW9yZSBpbXBv
cnRhbnQgdG8gaW1wcm92ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
