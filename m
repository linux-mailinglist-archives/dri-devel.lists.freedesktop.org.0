Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD542D947B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 10:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950F46E10B;
	Mon, 14 Dec 2020 09:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C926E10A;
 Mon, 14 Dec 2020 09:00:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id d17so21472149ejy.9;
 Mon, 14 Dec 2020 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J2wd42sWEMbHfLz3ylDLDEIin5h2oG/2ylueu8/Lm5A=;
 b=flCYuRCGpCix73pX7P0eGGIZ0R4bzM13FoVx50mWzEq9YGU+HtmSMv9UuhKnCdelfI
 UzcUJxgGL2z6T/VV3PHENzsYe3xmpMtJqDljX1zkcpy729osNOJ2nCSsIfPi19GoIOh4
 ah6Xl7R8O/7lgDY6fZeLcu7ITK8J11rQ5IeC+lal3DAfP6QyqWki6NawTcKMKc5y/Uet
 +lB6pdshbGbIgzs5GmyE7uOmAyUJaMJgzfeRLSWupnjWfB6czYBafg2CS6IV4EDtk3YQ
 QNkr9FDN63SpcaJu6DZTnYRLfjRdFg63YMKrJI6iKmux4tUtJDhqAIwhHOTM7QtGmHLX
 XsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=J2wd42sWEMbHfLz3ylDLDEIin5h2oG/2ylueu8/Lm5A=;
 b=UMtM9nxZ7BM8GR9E8ZIcHJForbGUVmiDgiPoEjd4YX4I7iWNorEM3klN3XLIgmEEnx
 DIo9QHdyO/YLDbPfl2feBjUqosY0VK7A/mmcH3FPTklwDC9BW0FMqF6G4UC4GTE2K3cQ
 2QwgwsafTX5Slav+Dndzo90flJR/62mPIRrcJBJ6hcMaki4Qr80+z63b2gEolE88ogPk
 5rpPUkbbXYwlkmzTd06nW6TueQqX/W1a7JXGJIZWRnM7g82uWeqOCnFZ1YNRwaQT5d5n
 Z1VaLys76gWAKA/LEINggsQWY4o1yzT3XlzAFawWTavboEoDlLw6AuSam1IFUC8HjQGt
 O5bg==
X-Gm-Message-State: AOAM532ZIMpJCKrOVOKZiX9sW3ZVMWtQWOF+At2LpOjzs+UiqJTm3Z0S
 tenhq+iDsizVkWarg2zpifA=
X-Google-Smtp-Source: ABdhPJxcpceNiw8h8H08kR78MlSN4BCp+VqYiiywi8/dzLx5H6UihZjeUnzQMZa9zPoECMt2sgXjRg==
X-Received: by 2002:a17:906:af49:: with SMTP id
 ly9mr21091065ejb.38.1607936433128; 
 Mon, 14 Dec 2020 01:00:33 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h15sm13960641ejq.29.2020.12.14.01.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 01:00:32 -0800 (PST)
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v2)
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20201210021438.9190-1-luben.tuikov@amd.com>
 <20201210021438.9190-2-luben.tuikov@amd.com>
 <39a74cea2b6f3bfcc7b86de7a7a1dbcc93e21a7f.camel@pengutronix.de>
 <b42284c3-b774-41dc-d4fa-1a61d9d25df4@amd.com>
 <2c1533c3-aa93-60a4-90b2-bcd1fc105bf9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d6febb3e-6fec-28ea-1a71-998be5b30dc8@gmail.com>
Date: Mon, 14 Dec 2020 10:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c1533c3-aa93-60a4-90b2-bcd1fc105bf9@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMjE6NDQgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gT24gMjAyMC0xMi0x
MCA0OjQxIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDEwLjEyLjIwIHVtIDEw
OjMxIHNjaHJpZWIgTHVjYXMgU3RhY2g6Cj4+PiBIaSBMdWJlbiwKPj4+Cj4+PiBBbSBNaXR0d29j
aCwgZGVuIDA5LjEyLjIwMjAsIDIxOjE0IC0wNTAwIHNjaHJpZWIgTHViZW4gVHVpa292Ogo+Pj4+
IFtTTklQXQo+Pj4+IC1zdGF0aWMgdm9pZCBldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+Pj4+ICtzdGF0aWMgZW51bSBkcm1fdGFza19z
dGF0dXMgZXRuYXZpdl9zY2hlZF90aW1lZG91dF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IKPj4+
PiArCQkJCQkJICAgICAgICpzY2hlZF9qb2IpCj4+Pj4gICDCoHsKPj4+PiAgIMKgCXN0cnVjdCBl
dG5hdml2X2dlbV9zdWJtaXQgKnN1Ym1pdCA9IHRvX2V0bmF2aXZfc3VibWl0KHNjaGVkX2pvYik7
Cj4+Pj4gICDCoAlzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSA9IHN1Ym1pdC0+Z3B1Owo+Pj4+IEBA
IC0xMjAsOSArMTIxLDE2IEBAIHN0YXRpYyB2b2lkIGV0bmF2aXZfc2NoZWRfdGltZWRvdXRfam9i
KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4+Pj4gICAgCj4+Pj4gICDCoAlkcm1f
c2NoZWRfcmVzdWJtaXRfam9icygmZ3B1LT5zY2hlZCk7Cj4+Pj4gICAgCj4+Pj4gKwkvKiBUZWxs
IHRoZSBEUk0gc2NoZWR1bGVyIHRoYXQgdGhpcyB0YXNrIG5lZWRzCj4+Pj4gKwkgKiBtb3JlIHRp
bWUuCj4+Pj4gKwkgKi8KPj4+IFRoaXMgY29tbWVudCBkb2Vzbid0IG1hdGNoIHRoZSBrZXJuZWwg
Y29kaW5nIHN0eWxlLCBidXQgaXQncyBhbHNvIG1vb3QKPj4+IGFzIHRoZSB3aG9sZSBhZGRlZCBj
b2RlIGJsb2NrIGlzbid0IG5lZWRlZC4gVGhlIGNvZGUganVzdCBiZWxvdyBpcwo+Pj4gaWRlbnRp
Y2FsLCBzbyBsZXR0aW5nIGV4ZWN1dGlvbiBjb250aW51ZSBoZXJlIGluc3RlYWQgb2YgcmV0dXJu
aW5nCj4+PiB3b3VsZCBiZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8sIGJ1dCBtYXliZSB5b3UgbWVh
biB0byByZXR1cm4KPj4+IERSTV9UQVNLX1NUQVRVU19DT01QTEVURT8gSXQncyBhIGJpdCBjb25m
dXNpbmcgdGhhdCBhYm9ydGVkIGFuZCBqb2IKPj4+IHN1Y2Nlc3NmdWxseSBmaW5pc2hlZCBzaG91
bGQgYmUgc2lnbmFsZWQgd2l0aCB0aGUgc2FtZSByZXR1cm4gY29kZS4KPj4gWWVzIGFuZCBuby4g
QXMgSSB0cmllZCB0byBkZXNjcmliZSBpbiBteSBwcmV2aW91cyBtYWlsIHRoZSBuYW1pbmcgb2Yg
dGhlCj4+IGVudW0gdmFsdWVzIGlzIGFsc28gbm90IHZlcnkgZ29vZC4KPiBJIHRyaWVkIHRvIG1h
a2UgdGhlIG5hbWluZyBhcyBtaW5pbWFsIGFzIHBvc3NpYmxlOgo+IENPTVBMRVRFOiB0aGUgdGFz
ayBpcyBvdXQgb2YgdGhlIGhhcmR3YXJlLgo+IEFMSVZFOiB0aGUgdGFzayBpcyBpbiB0aGUgaGFy
ZHdhcmUuCgpZZWFoIGluIGdlbmVyYWwgdGhhdCBpcyBhIGdvb2QgaWRlYSwgYnV0IGluIHRoaXMg
c3BlY2lhbCBjYXNlIHRoYXQgCmluZm9ybWF0aW9uIGlzIG5vdCB1c2VmdWwgdG8gdGhlIHNjaGVk
dWxlciBzaW5jZSBpdCBuZWVkcyB0byByZXN0YXJ0IHRoZSAKdGltZXIgYW55d2F5LgoKPj4gU2Vl
IGV2ZW4gd2hlbiB0aGUgam9iIGhhcyBjb21wbGV0ZWQgd2UgbmVlZCB0byByZXN0YXJ0IHRoZSB0
aW1lciBmb3IgdGhlCj4+IHBvdGVudGlhbCBuZXh0IGpvYi4KPiBTdXJlLCB5ZXMuIEJ1dCB0aGlz
IGlzIHNvbWV0aGluZyB3aGljaCB0aGUgRFJNIGRlY2lkZXMtLXdoeSBzaG91bGQKPiBkcml2ZXJz
IGtub3cgb2YgdGhlIGludGVybmFscyBvZiB0aGUgRFJNPyAoaS5lLiB0aGF0IGl0IHJlc3RhcnRz
Cj4gdGhlIHRpbWVyIG9yIHRoYXQgdGhlcmUgaXMgYSB0aW1lciwgZXRjLikgUmV0dXJuIG1pbmlt
YWwKPiB2YWx1ZSBhbmQgbGV0IHRoZSBEUk0gZGVjaWRlIHdoYXQgdG8gZG8gbmV4dC4KClRoYXQn
cyBjb3JyZWN0LCBidXQgdGhlIGRyaXZlciBzaG91bGQgYWxzbyBub3QgcHJvdmlkZSB1c2VsZXNz
IAppbmZvcm1hdGlvbiB0byB0aGUgc2NoZWR1bGVyLgoKPgo+PiBPbmx5IHdoZW4gdGhlIGRldmlj
ZSBpcyBjb21wbGV0ZWx5IGdvbmUgYW5kIHVucmVjb3ZlcmFibGUgd2Ugc2hvdWxkIG5vdAo+PiBy
ZXN0YXJ0IHRoZSB0aW1lci4KPiBZZXMsIGFncmVlZC4KPgo+PiBJIHN1Z2dlc3QgdG8gZWl0aGVy
IG1ha2UgdGhpcyBhbiBpbnQgYW5kIHJldHVybiAtRU5PREVWIHdoZW4gdGhhdAo+PiBoYXBwZW5z
IG9yIHJlbmFtZSB0aGUgZW51bSB0byBzb21ldGhpbmcgbGlrZSBEUk1fU0NIRURfTk9ERVYuCj4g
SXQgd2FzIGFuIGludCwgYnV0IHlvdSBzdWdnZXN0ZWQgdGhhdCBpdCdkIGJlIGEgbWFjcm8sIHNv
IEkgbWFkZQo+IGl0IGFuIGVudW0gc28gdGhhdCB0aGUgY29tcGxpZXIgY2FuIGNoZWNrIHRoZSB2
YWx1ZXMgYWdhaW5zdCB0aGUgbWFjcm9zCj4gcmV0dXJuZWQuCgpXZWxsIHdoYXQgSSBzdWdnZXN0
ZWQgd2FzIHRvIHVzZSBzb21ldGhpbmcgYmV0dGVyIHRoYW4gMC8xIGFzIHJldHVybiB2YWx1ZS4K
CkFuZCB0aGF0IHdhcyBhIGdvb2QgaWRlYSBzaW5jZSBJIGRpZG4ndCBub3RpY2VkIGJlZm9yZSB0
aGF0IHlvdSB3YW50IHRvIApyZXR1cm4gdGhlIGpvYiBzdGF0dXMgaGVyZSwgd2hpY2ggaW4gdHVy
biBpcyBub3QgbmVjZXNzYXJ5IGEgZ29vZCBpZGVhLgoKPiBJIHN1Z2dlc3RlZCwgRFJNX1RBU0tf
U0NIRURfRU5PREVWLCBidXQgbGV0IEFuZHJleSBhZGQgaXQKPiB3aGVuIGhlIGFkZHMgaGlzIHBh
dGNoZXMgb24gdG9wIG9mIG15IHBhdGNoIGhlcmUsIGJlY2F1c2UgaGlzCj4gd29yayBhZGRzIGhv
dHBsdWcvdW5wbHVnIHN1cHBvcnQuCj4KPiBBbHNvLCBub3RlIHRoYXQgaWYgdGhlIHBlbmRpbmcg
bGlzdCBpcyBmcmVlZCwgd2hpbGUgdGhlIERSTQo+IGhhZCBiZWVuIGJsb2NrZWQsIGkuZS4gbm90
aWZpZWQgdGhhdCB0aGUgZGV2aWNlIGlzIGdvbmUsCj4gdGhlbiByZXR1cm5pbmcgRFJNX1RBU0tf
U0NIRURfRU5PREVWIHdvdWxkIGJlIG1vb3QsIGFzIHRoZXJlCj4gYXJlIG5vIHRhc2tzIGluIHRo
ZSBwZW5kaW5nIGxpc3QuCj4KPiBUaGlzIHBhdGNoIGhlcmUgaXMgZ29vZCBhcyBpdCBpcywgc2lu
Y2UgaXQgaXMgbWluaW1hbCBhbmQgZG9lc24ndCBtYWtlCj4gYXNzdW1wdGlvbnMgb24gRFJNIGJl
aGF2aW91ci4KClRoZSBwcm9ibGVtIHdpdGggdGhpcyBwYXRjaCBpcyB0aGF0IGl0J3MgYWRkaW5n
IGEgZnVuY3Rpb25hbGl0eSB3aGljaCB3ZSAKZG9uJ3QgaW1tZWRpYXRlbHkgdXNlIGFuZCBhcyBm
YXIgYXMgSSBjYW4gc2VlIHdvbid0IHVzZSBpbiB0aGUgZnV0dXJlIAplaXRoZXIuCgpSZWdhcmRz
LApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBMdWJlbgo+Cj4+IFJlZ2FyZHMsCj4+IENocmlz
dGlhbi4KPj4KPj4+PiArCWRybV9zY2hlZF9zdGFydCgmZ3B1LT5zY2hlZCwgdHJ1ZSk7Cj4+Pj4g
KwlyZXR1cm4gRFJNX1RBU0tfU1RBVFVTX0FMSVZFOwo+Pj4+ICsKPj4+PiAgIMKgb3V0X25vX3Rp
bWVvdXQ6Cj4+Pj4gICDCoAkvKiByZXN0YXJ0IHNjaGVkdWxlciBhZnRlciBHUFUgaXMgdXNhYmxl
IGFnYWluICovCj4+Pj4gICDCoAlkcm1fc2NoZWRfc3RhcnQoJmdwdS0+c2NoZWQsIHRydWUpOwo+
Pj4+ICsJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKPj4+PiAgIMKgfQo+Pj4gUmVnYXJk
cywKPj4+IEx1Y2FzCj4+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
