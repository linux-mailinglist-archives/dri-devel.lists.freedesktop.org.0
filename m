Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC62F4630
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDF76E111;
	Wed, 13 Jan 2021 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59AB89893
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 22:07:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o10so5637089lfl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HbMIN0aiVbYBLJRZm7poztAbwQ7fEt7uXkvRYAH+Q4E=;
 b=pYsD9mwkI1AiuSqOs76AfqLZ0ur+C6ghnk0JO30q206dd7bSXjprXUDi0AmGreQ738
 N3JZ2WfpqVQNY+nB2/RPysZxaja0WWFMN/V9ZBod5K/YF1ywI8mNbT3CCUHFFJtl16uI
 vSXyP60NpWF0/AmTnewU6ZWPj7QGPhceq4wxLVP3CodK6EL1GIvysBIQGV/mmG/N3hz0
 PmbS/pcPCHIEv1E2ocIV8Pcqjt0z72mkrkpFFbK5JRX2wTWqYB6738AAY+CumBktfqFI
 nOF9/yR7J6alKp8eHDN8zZBVQ9VZf64Aux9iDzn8EkNeKVwJgfrLwaX86yQb2ZvxwKNy
 2fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HbMIN0aiVbYBLJRZm7poztAbwQ7fEt7uXkvRYAH+Q4E=;
 b=kc5M9DPVoD0qeXIAftpg/ca3vItz2cw+VUZ0Flhh6Gghu6q/6rFiuUggPmw3Ql8Ne1
 td+NtykhQWB1dnOD60NrY75Rmukbu9jaJmD1RqI6utiQhr58QqYTdSYFqfsDxX+Dlc1r
 h9maM9KAbPDnmpulJmA0wQlHvxMmso4xFhE8vtvWHy+lk4vrP7EP2SN7zkQkGQpvbOVc
 gvh/+WC3HT6a427y3iyQV3JNB3KuJDvpRo+W0YiPHth/2Jyn1LTAmevidZio6wxQqp4U
 YV/Skt2nBwSmqza5DHKTgWCRa1sxdKz0j9aRU8TWs/r3YbGKxcKtF115KJhihXz5ELvR
 AhBQ==
X-Gm-Message-State: AOAM530glLqlFvcfg9DRxPjhTLAXaWqEQ1ZLznjtEc5alENOFa0GLCmw
 LX+U36jSlJN1PycZww5WGA8=
X-Google-Smtp-Source: ABdhPJwCVUf3gXP6dL642xFpV//ZourQlvFx41nTt8T3BZPRIRHf81Lf1Au81rvwtWvHgU0kjycpiQ==
X-Received: by 2002:ac2:446c:: with SMTP id y12mr386576lfl.373.1610489264305; 
 Tue, 12 Jan 2021 14:07:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id w13sm498190ljw.28.2021.01.12.14.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:07:43 -0800 (PST)
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
Date: Wed, 13 Jan 2021 01:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-5-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

MTEuMDEuMjAyMSAxNjowMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gLXZvaWQgaG9z
dDF4X2ludHJfcHV0X3JlZihzdHJ1Y3QgaG9zdDF4ICpob3N0LCB1bnNpZ25lZCBpbnQgaWQsIHZv
aWQgKnJlZikKPiArdm9pZCBob3N0MXhfaW50cl9wdXRfcmVmKHN0cnVjdCBob3N0MXggKmhvc3Qs
IHVuc2lnbmVkIGludCBpZCwgdm9pZCAqcmVmLAo+ICsJCQkgYm9vbCBmbHVzaCkKPiAgewo+ICAJ
c3RydWN0IGhvc3QxeF93YWl0bGlzdCAqd2FpdGVyID0gcmVmOwo+ICAJc3RydWN0IGhvc3QxeF9z
eW5jcHQgKnN5bmNwdDsKPiAgCj4gLQl3aGlsZSAoYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3Rh
dGUsIFdMU19QRU5ESU5HLCBXTFNfQ0FOQ0VMTEVEKSA9PQo+IC0JICAgICAgIFdMU19SRU1PVkVE
KQo+IC0JCXNjaGVkdWxlKCk7Cj4gKwlhdG9taWNfY21weGNoZygmd2FpdGVyLT5zdGF0ZSwgV0xT
X1BFTkRJTkcsIFdMU19DQU5DRUxMRUQpOwo+ICAKPiAgCXN5bmNwdCA9IGhvc3QtPnN5bmNwdCAr
IGlkOwo+IC0JKHZvaWQpcHJvY2Vzc193YWl0X2xpc3QoaG9zdCwgc3luY3B0LAo+IC0JCQkJaG9z
dDF4X3N5bmNwdF9sb2FkKGhvc3QtPnN5bmNwdCArIGlkKSk7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZz
eW5jcHQtPmludHIubG9jayk7Cj4gKwlpZiAoYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUs
IFdMU19DQU5DRUxMRUQsIFdMU19IQU5ETEVEKSA9PQo+ICsJICAgIFdMU19DQU5DRUxMRUQpIHsK
PiArCQlsaXN0X2RlbCgmd2FpdGVyLT5saXN0KTsKPiArCQlrcmVmX3B1dCgmd2FpdGVyLT5yZWZj
b3VudCwgd2FpdGVyX3JlbGVhc2UpOwo+ICsJfQo+ICsJc3Bpbl91bmxvY2soJnN5bmNwdC0+aW50
ci5sb2NrKTsKPiArCj4gKwlpZiAoZmx1c2gpIHsKPiArCQkvKiBXYWl0IHVudGlsIGFueSBjb25j
dXJyZW50bHkgZXhlY3V0aW5nIGhhbmRsZXIgaGFzIGZpbmlzaGVkLiAqLwo+ICsJCXdoaWxlIChh
dG9taWNfcmVhZCgmd2FpdGVyLT5zdGF0ZSkgIT0gV0xTX0hBTkRMRUQpCj4gKwkJCWNwdV9yZWxh
eCgpOwo+ICsJfQoKQSBidXN5LWxvb3Agc2hvdWxkbid0IGJlIHVzZWQgaW4ga2VybmVsIHVubGVz
cyB0aGVyZSBpcyBhIHZlcnkgZ29vZApyZWFzb24uIFRoZSB3YWl0X2V2ZW50KCkgc2hvdWxkIGJl
IHVzZWQgaW5zdGVhZC4KCkJ1dCBwbGVhc2UgZG9uJ3QgaHVycnkgdG8gdXBkYXRlIHRoaXMgcGF0
Y2gsIHdlIG1heSBuZWVkIG9yIHdhbnQgdG8KcmV0aXJlIHRoZSBob3N0MXgtd2FpdGVyIGFuZCB0
aGVuIHRoZXNlIGFsbCB3YWl0ZXItcmVsYXRlZCBwYXRjaGVzIHdvbid0CmJlIG5lZWRlZC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
