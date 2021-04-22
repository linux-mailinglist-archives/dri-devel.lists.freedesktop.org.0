Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891133680B0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 14:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E22E6EA77;
	Thu, 22 Apr 2021 12:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9E6EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 12:39:44 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g17so52580012edm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/XBYAjJLx1qVHA3b0najgPrFujghsrg3OuSpsfyHHP4=;
 b=ub6UevUX5WIjnc5xfmQaq6vLdQiQM/jYy6A76PwpHy8hflFs+jpEW34SwnK5IPGjEl
 GT6Zxqdo5wVr3wdBkbIqyUqOwXW0tbBkz/usFLV4dWHp70M2MK9drZAaZhCQp2jmNZso
 UKHhTJQ4ikTKayOMK58FXliLx9GjvX4MNsesAVYsZDoXkSR3Co2pSvrD6kaoo616v5CI
 dX0rNxvf0SC6eKZMk+XncgG1k+e5mTwF2sWuD+VXlWxEvVyscxOYdQLoRK7IhZz7cxik
 VzsBt8wLVezeNkwXAErl276mdIh0mxxSJSFIoXnC0sVmHJFwy6mjEkhpYLmxxL2Ua4Ig
 JMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/XBYAjJLx1qVHA3b0najgPrFujghsrg3OuSpsfyHHP4=;
 b=OX1gUzm9PCo3rSLBeONH3YC2SaG7dLFIhD70OXC/IpPc9MYgV442NkGMXnT9NZBYxU
 sob2+9B9DgXWzmPfXW6LRVEqDDF1Ag04qjTP+MNeLuYh+wsglft0fSQm8Auw5XRKNthB
 uPtJsqK/KANduGNOfEug7GmMY3GSzdcbA45oJ9in9gk9lyLIo2ISB0qmrtUn15fbe4w0
 ANlkz3HaYCMb8iyYzjZtSBbx4v77x+HUBkZbp8NLkHoOONKeffR+2zVbwd636d5mwaNH
 TBnweNlRWNRwscfYv+29ml/oJf7h9ROID9CT2d4g4br+ohlftd6WJWR+bk03r9uhwICu
 9Wlg==
X-Gm-Message-State: AOAM5324OBdqupFV1xMfM8fcNNsJAgBAxXPl4oL2o5xwoUEoB525opQx
 aflMFa0Zx3QDGFJ2FRTbDiQ=
X-Google-Smtp-Source: ABdhPJy0h2vBDFNtlTtJgHLJi2WJNAffXH4MoyYF2CIWypEpyOry+ISfMoFLwQeXV2HEScdFraYybQ==
X-Received: by 2002:aa7:db9a:: with SMTP id u26mr3546514edt.292.1619095183258; 
 Thu, 22 Apr 2021 05:39:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:2fbd:d2a4:da7e:4526?
 ([2a02:908:1252:fb60:2fbd:d2a4:da7e:4526])
 by smtp.gmail.com with ESMTPSA id bw26sm1757735ejb.119.2021.04.22.05.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 05:39:42 -0700 (PDT)
Subject: Re: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error
 path
To: Jan Harkes <jaharkes@cs.cmu.edu>, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210421132012.82354-1-christian.koenig@amd.com>
 <91292A4A-5F97-4FF8-ABAD-42392A0756B5@cs.cmu.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f603f59b-ec52-7ad7-475a-fcf95902e145@gmail.com>
Date: Thu, 22 Apr 2021 14:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <91292A4A-5F97-4FF8-ABAD-42392A0756B5@cs.cmu.edu>
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
Cc: jgg@ziepe.ca, coda@cs.cmu.edu, akpm@linux-foundation.org, miklos@szeredi.hu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuLAoKQW0gMjIuMDQuMjEgdW0gMTQ6Mjcgc2NocmllYiBKYW4gSGFya2VzOgo+IExvb2tz
IGdvb2QgdG8gbWUuCj4KPiBJJ20gYWxzbyBtYWludGFpbmluZyBhbiBvdXQgb2YgdHJlZSBjb2Rh
IG1vZHVsZSBidWlsZCB0aGF0IHBlb3BsZSBzb21ldGltZXMgdXNlLCB3aGljaCBoYXMgd29ya2Fy
b3VuZHMgZm9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHZhcmlvdXMga2VybmVsIHZlcnNpb25z
Lgo+Cj4gRG8geW91IGhhdmUgYSByZWZlcmVuY2UgdG8gdGhlIGNvcnJlc3BvbmRpbmcgbW1hcF9y
ZWdpb24gY2hhbmdlPyBJZiBpdCBpcyBtZXJnZWQgYWxyZWFkeSBJJ2xsIHByb2JhYmx5IGJlIGFi
bGUgdG8gZmluZCBpdC4gSXMgdGhpcyBtbWFwX3JlZ2lvbiBjaGFuZ2UgZXhwZWN0ZWQgdG8gYmUg
YmFja3BvcnRlZCB0byBhbnkgbHRzIGtlcm5lbHM/CgpUaGF0IGlzIHRoZSBmb2xsb3dpbmcgdXBz
dHJlYW0gY29tbWl0IGluIExpbnVzIHRyZWU6Cgpjb21taXQgMTUyN2Y5MjZmZDA0NDkwZjY0OGM0
MmY0MmI0NTIxOGEwNDc1NGY4NwpBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KRGF0ZTrCoMKgIEZyaSBPY3QgOSAxNTowODo1NSAyMDIwICswMjAwCgog
wqDCoMKgIG1tOiBtbWFwOiBmaXggZnB1dCBpbiBlcnJvciBwYXRoIHYyCgpCdXQgSSBkb24ndCB0
aGluayB3ZSBzaG91bGQgYmFja3BvcnQgdGhhdC4KCkFuZCBzb3JyeSBmb3IgdGhlIG5vaXNlLiBX
ZSBoYWQgc28gbWFueSBwbGFjZXMgd2hpY2ggZXhwZWN0ZWQgZGlmZmVyZW50IApiZWhhdmlvciB0
aGF0IEkgZGlkbid0IG5vdGljZWQgdGhhdCB0d28gb2NjYXNpb25zIGluIHRoZSBmcyBjb2RlIAph
Y3R1YWxseSByZWx5IG9uIHRoZSBjdXJyZW50IGJlaGF2aW9yLgoKRm9yIHlvdXIgb3V0IG9mIHRy
ZWUgbW9kdWxlIHlvdSBjb3VsZCBtYWtlIHRoZSBjb2RlIHZlcnNpb24gaW5kZXBlbmRlbnQgCmJ5
IHNldHRpbmcgdGhlIHZtYSBiYWNrIHRvIHRoZSBvcmlnaW5hbCBmaWxlIGluIGNhc2Ugb2YgYW4g
ZXJyb3IuIFRoYXQgCnNob3VsZCB3b3JrIHdpdGggYm90aCBiZWhhdmlvcnMgaW4gbW1hcF9yZWdp
b24uCgpUaGFua3MsCkNocmlzdGlhbi4KCj4KPiBKYW4KPgo+IE9uIEFwcmlsIDIxLCAyMDIxIDk6
MjA6MTEgQU0gRURULCAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5A
Z21haWwuY29tPiB3cm90ZToKPj4gbW1hcF9yZWdpb24oKSBub3cgY2FsbHMgZnB1dCgpIG9uIHRo
ZSB2bWEtPnZtX2ZpbGUuCj4+Cj4+IFNvIHdlIG5lZWQgdG8gZHJvcCB0aGUgZXh0cmEgcmVmZXJl
bmNlIG9uIHRoZSBjb2RhIGZpbGUgaW5zdGVhZCBvZiB0aGUKPj4gaG9zdCBmaWxlLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4+IEZpeGVzOiAxNTI3ZjkyNmZkMDQgKCJtbTogbW1hcDogZml4IGZwdXQgaW4gZXJyb3IgcGF0
aCB2MiIpCj4+IENDOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNS4xMSsKPj4gLS0tCj4+IGZz
L2NvZGEvZmlsZS5jIHwgNiArKystLS0KPj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2NvZGEvZmlsZS5jIGIvZnMv
Y29kYS9maWxlLmMKPj4gaW5kZXggMTI4ZDYzZGY1YmZiLi5lZjVjYTIyYmZiM2UgMTAwNjQ0Cj4+
IC0tLSBhL2ZzL2NvZGEvZmlsZS5jCj4+ICsrKyBiL2ZzL2NvZGEvZmlsZS5jCj4+IEBAIC0xNzUs
MTAgKzE3NSwxMCBAQCBjb2RhX2ZpbGVfbW1hcChzdHJ1Y3QgZmlsZSAqY29kYV9maWxlLCBzdHJ1
Y3QKPj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4gCXJldCA9IGNhbGxfbW1hcCh2bWEtPnZtX2Zp
bGUsIHZtYSk7Cj4+Cj4+IAlpZiAocmV0KSB7Cj4+IC0JCS8qIGlmIGNhbGxfbW1hcCBmYWlscywg
b3VyIGNhbGxlciB3aWxsIHB1dCBjb2RhX2ZpbGUgc28gd2UKPj4gLQkJICogc2hvdWxkIGRyb3Ag
dGhlIHJlZmVyZW5jZSB0byB0aGUgaG9zdF9maWxlIHRoYXQgd2UgZ290Lgo+PiArCQkvKiBpZiBj
YWxsX21tYXAgZmFpbHMsIG91ciBjYWxsZXIgd2lsbCBwdXQgaG9zdF9maWxlIHNvIHdlCj4+ICsJ
CSAqIHNob3VsZCBkcm9wIHRoZSByZWZlcmVuY2UgdG8gdGhlIGNvZGFfZmlsZSB0aGF0IHdlIGdv
dC4KPj4gCQkgKi8KPj4gLQkJZnB1dChob3N0X2ZpbGUpOwo+PiArCQlmcHV0KGNvZGFfZmlsZSk7
Cj4+IAkJa2ZyZWUoY3ZtX29wcyk7Cj4+IAl9IGVsc2Ugewo+PiAJCS8qIGhlcmUgd2UgYWRkIHJl
ZGlyZWN0cyBmb3IgdGhlIG9wZW4vY2xvc2Ugdm1fb3BlcmF0aW9ucyAqLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
