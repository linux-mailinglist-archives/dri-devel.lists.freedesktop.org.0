Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB126D5BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CD16EB7D;
	Thu, 17 Sep 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503686EADA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 19:44:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d15so8208444lfq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g3sBpzZu6K+jifaS1Lrpgfa3Jk6KBn8m95+sY2b5kwo=;
 b=PHGo4B8eQ/E36usx/N56TzzH3/dRslZVVoPI8eiWi83BQ4C6G8REZwYUCEnv5LzzoD
 lWynAdJc8y8Ar1BjNn5YA7Hl2ETVOf8Az2Q6zDbwKnsfhCMTyGBH9hxUG/NPZdT0rj4n
 YDwXVj73JaPVaVBcgHwidcEVlgI3zRq3v5R73x7QCEXGTCs7dpAoJ48BLN1cnEkAodtj
 XMDwPmkVAWQaT03O7sTQnB4sIvaiHuJGO8UN2nFRrfYCC6gEy3Gq3DsQ5ONlMNCA6YGl
 b/njynsAPf58ucDFNf05TwoZWAD9gxirftYoEDlv2Brfe0giEKIuGECs9SedD9OXxy/+
 ggSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g3sBpzZu6K+jifaS1Lrpgfa3Jk6KBn8m95+sY2b5kwo=;
 b=azOJBYhEoN0jQFBn4hyHiUWdVoGB+bbIc150+HeqGmATqQjAQ2MJmwCmd4wzsePjel
 +Jv9gZg7CICzXbEKCNV3q4eHwzIpYTT2VLSDCAKr2dGc8U85M/kPNwVKivudW+ezBzs6
 ztZMGJ5lSx2SBNWb7YmO1jvt/+90/MpupcK4EsduaKMWbS2NN8LC1krPygn1AM68940i
 YOgEKSSkWFDUjLhpUlbjHnTg7bASH5LAw3XfOJLG5glJcXxRO2dEVVwqqrjUlvVjvHd7
 kLs5hubQFexlojTrvNQeCoAZ78wdwd7bovmuOu9fHo96zRi2WTNKpCYwZhx8TwTy61qH
 JlIQ==
X-Gm-Message-State: AOAM530dNFuWpJAZTbx9WHAdnWCeI9HhtJbwtJDa0SopwnZrBhRfdrAD
 sKBk27vm8DCGTJ0+kaPUFZc=
X-Google-Smtp-Source: ABdhPJy+lkFBznrdw/aFstdA6S7xNlwsTkpbPXhmlMBDC9IluODOQXEFnnOizB9lsnUEmKLmf7N3JQ==
X-Received: by 2002:a19:8345:: with SMTP id f66mr7197660lfd.506.1600285464671; 
 Wed, 16 Sep 2020 12:44:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id c1sm4768583lfh.190.2020.09.16.12.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 12:44:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
Date: Wed, 16 Sep 2020 22:44:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-14-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gV2l0aCBqb2Ig
cmVjb3ZlcnkgYmVjb21pbmcgb3B0aW9uYWwsIHN5bmNwb2ludHMgbWF5IGhhdmUgYSBtaXNtYXRj
aAo+IGJldHdlZW4gdGhlaXIgdmFsdWUgYW5kIG1heCB2YWx1ZSB3aGVuIGZyZWVkLiBBcyBzdWNo
LCB3aGVuIGZyZWVpbmcsCj4gc2V0IHRoZSBtYXggdmFsdWUgdG8gdGhlIGN1cnJlbnQgdmFsdWUg
b2YgdGhlIHN5bmNwb2ludCBzbyB0aGF0IGl0Cj4gaXMgaW4gYSBzYW5lIHN0YXRlIGZvciB0aGUg
bmV4dCB1c2VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5l
bkBudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9ob3N0MXgvc3luY3B0LmMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2hvc3QxeC9zeW5jcHQuYyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9zeW5jcHQuYwo+IGlu
ZGV4IDJmYWQ4YjJhNTVjYy4uODJlY2I0YWMzODdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2hvc3QxeC9zeW5jcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9zeW5jcHQuYwo+IEBA
IC0zODUsNiArMzg1LDcgQEAgc3RhdGljIHZvaWQgc3luY3B0X3JlbGVhc2Uoc3RydWN0IGtyZWYg
KnJlZikKPiAgewo+ICAJc3RydWN0IGhvc3QxeF9zeW5jcHQgKnNwID0gY29udGFpbmVyX29mKHJl
Ziwgc3RydWN0IGhvc3QxeF9zeW5jcHQsIHJlZik7Cj4gIAo+ICsJYXRvbWljX3NldCgmc3AtPm1h
eF92YWwsIGhvc3QxeF9zeW5jcHRfcmVhZF9taW4oc3ApKTsKPiAgCXNwLT5sb2NrZWQgPSBmYWxz
ZTsKPiAgCj4gIAltdXRleF9sb2NrKCZzcC0+aG9zdC0+c3luY3B0X211dGV4KTsKPiAKClBsZWFz
ZSBub3RlIHRoYXQgdGhlIHN5bmMgcG9pbnQgc3RhdGUgYWN0dWFsbHkgbmVlZHMgdG8gYmUgY29t
cGxldGVseQpyZXNldCBhdCB0aGUgc3luYyBwb2ludCByZXF1ZXN0LXRpbWUgYmVjYXVzZSBib3Ro
IGRvd25zdHJlYW0gZmFzdGJvb3QKYW5kIHVwc3RyZWFtIHUtYm9vdCBbMV0gYXJlIG5lZWRsZXNz
bHkgZW5hYmxpbmcgZGlzcGxheSBWQkxBTksgaW50ZXJydXB0CnRoYXQgY29udGludW91c2x5IGlu
Y3JlbWVudHMgc3luYyBwb2ludCAjMjYgZHVyaW5nIG9mIGtlcm5lbCBib290IHVudGlsCmRpc3Bs
YXkgY29udHJvbGxlciBpcyByZXNldC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vdS1ib290L3Ut
Ym9vdC9ibG9iL21hc3Rlci9kcml2ZXJzL3ZpZGVvL3RlZ3JhLmMjTDE1NQoKSGVuY2Ugb25jZSBz
eW5jIHBvaW50ICMyNiBpcyByZXF1ZXN0ZWQsIGl0IHdpbGwgaGF2ZSBhIGRpcnR5IHN0YXRlLiBT
bwpmYXIgdGhpcyBkb2Vzbid0IGhhdmUgYW55IHZpc2libGUgZWZmZWN0IGJlY2F1c2Ugc3luYyBw
b2ludHMgYXJlbid0IHVzZWQKbXVjaC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
