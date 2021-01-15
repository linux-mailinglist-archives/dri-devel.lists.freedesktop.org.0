Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3A2F7AA8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 13:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C126E3D6;
	Fri, 15 Jan 2021 12:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1306E3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610715283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8usNbms/6yvFXztdtKkGTYfpg+tMNJ8ZfJVsukj6CE=;
 b=FspRXBR3cGpiAoocDY7jitV6xq0O6aZK0M53V0F+W0/dIFb5xGaRJllES5fnMj3pyKiN97
 OlCtCvB0zRfTuU3fHWcC7XTJrsTXV9f3WIMJcCsRHZJHjVF4okYTf00KlMPkCmf0DkKxH5
 78Sq+/0WZ+krDa43hCy+YSXG6z2xgyM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-wLSFfsF6PPCd222tbBDrXQ-1; Fri, 15 Jan 2021 07:54:42 -0500
X-MC-Unique: wLSFfsF6PPCd222tbBDrXQ-1
Received: by mail-ed1-f70.google.com with SMTP id 32so1647185edy.22
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 04:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w8usNbms/6yvFXztdtKkGTYfpg+tMNJ8ZfJVsukj6CE=;
 b=PCXHJZTYBjNZ3ij/cAr2AI9RvzRJbKt2kR0lkyhpNlcze7YMcfR82tXKMS23pLwLsV
 GpgTPX4Jbkj3ori5isa87mzxnB9t63/JHC+yBNV4WQ6ztMM5r+GLX0KIYCkI9pT6LAsD
 5bKtyw1EMYI7ldx4cEJrorNLwgHgKXrBilrdq0oenVLX3fnpuvcVX6mWyCbz/Mu6/LOA
 O4+p5zuvcvvUe+B0l0a2DLZoBQqM9nTqiWVhb+KNEED9hszb2USRs9qG2nIV1V6aC63C
 a7y7byTY0fJ2QL7/RjmmwkQcvI9keFCPsycqAU070it49hdxgHJaCH3oMjFSh4er4RGD
 f2xA==
X-Gm-Message-State: AOAM5318Lko3c7UmrljLA3O9lBabLZNyKWvQqsKdIj0vEZmc+XP+rhMa
 HGerh7T+QpVDbCqD4NQPKraWrb73tswYAtxDFYiyjmy7zlqWL8zZr/qyKmK5/uYobccjPLDCSGr
 GUgSLjARyTQpGuzGThoeHuciAwVgaHmvaUfAc+HyccaCuq0UKKhMu4mkA5nN76eyH02TSnfCidI
 h1d7uF
X-Received: by 2002:a50:c209:: with SMTP id n9mr9512863edf.123.1610715280775; 
 Fri, 15 Jan 2021 04:54:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo8Wn+g15kng4IshE8ZH1HzTEeDzWGXx07b1nTtKRZSo2bzkxlEEpiznzZh0We9Z2j7AX3Rg==
X-Received: by 2002:a50:c209:: with SMTP id n9mr9512849edf.123.1610715280576; 
 Fri, 15 Jan 2021 04:54:40 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id n20sm3318745ejo.83.2021.01.15.04.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 04:54:40 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ray.huang@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20210113131325.223511-1-christian.koenig@amd.com>
 <75cd4fa9-b359-dd32-c50d-d291687066a5@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ccb4a69b-6180-44cd-5645-f22817a5f5f4@redhat.com>
Date: Fri, 15 Jan 2021 13:54:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <75cd4fa9-b359-dd32-c50d-d291687066a5@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxLzE1LzIxIDE6MTQgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gSGFucyBk
byB5b3UgaGF2ZSBhbnkgbW9yZSBjb21tZW50cyBvciBhIHRlc3RlZC1ieT8KClNvcnJ5LCBJJ3Zl
IGJlZW4gYnVzeSBjaGFzaW5nIGFmdGVyIGFub3RoZXIgNS4xMSByZWdyZXNzaW9uLApubyBjb21t
ZW50cywgYWxzbyBubyB0ZXN0ZWQtYnksIGJ1dCBJIGRvIGZ1bGx5IGV4cGVjdCB0aGlzIHRvIHNv
bHZlCnRoZSBpc3N1ZS4KIAo+IE90aGVyd2lzZSBJIHB1c2ggaXQgdG8gZHJtLW1pc2MtZml4ZXMg
dG9kYXkuCgpUaGF0IHNvdW5kcyBnb29kIHRvIG1lLgoKUmVnYXJkcywKCkhhbnMKCgoKCj4gCj4g
VGhhbmtzLAo+IENocmlzdGlhbi4KPiAKPiBBbSAxMy4wMS4yMSB1bSAxNDoxMyBzY2hyaWViIENo
cmlzdGlhbiBLw7ZuaWc6Cj4+IFRoZSBvbmx5IGZsYWcgd2UgcmVhbGx5IG5lZWQgaXMgX19HRlBf
Tk9NRU1BTExPQywgaGlnaG1lbSBkZXBlbmRzIG9uCj4+IGRtYTMyIGFuZCBtb3ZlYWJsZS9jb21w
b3VuZCBzaG91bGQgbmV2ZXIgYmUgc2V0IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAt
LS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMTEgKysrKysrLS0tLS0K
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+PiBpbmRleCA4Y2Q3NzZhZGM1OTIuLjExZTAzMTNkYjBl
YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+PiBAQCAtNzksMTIgKzc5LDEzIEBAIHN0
YXRpYyBzdHJ1Y3QgcGFnZSAqdHRtX3Bvb2xfYWxsb2NfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBv
b2wsIGdmcF90IGdmcF9mbGFncywKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqcDsKPj4gwqDC
oMKgwqDCoCB2b2lkICp2YWRkcjsKPj4gwqAgLcKgwqDCoCBpZiAob3JkZXIpIHsKPj4gLcKgwqDC
oMKgwqDCoMKgIGdmcF9mbGFncyB8PSBHRlBfVFJBTlNIVUdFX0xJR0hUIHwgX19HRlBfTk9SRVRS
WSB8Cj4+ICvCoMKgwqAgLyogRG9uJ3Qgc2V0IHRoZSBfX0dGUF9DT01QIGZsYWcgZm9yIGhpZ2hl
ciBvcmRlciBhbGxvY2F0aW9ucy4KPj4gK8KgwqDCoMKgICogTWFwcGluZyBwYWdlcyBkaXJlY3Rs
eSBpbnRvIGFuIHVzZXJzcGFjZSBwcm9jZXNzIGFuZCBjYWxsaW5nCj4+ICvCoMKgwqDCoCAqIHB1
dF9wYWdlKCkgb24gYSBUVE0gYWxsb2NhdGVkIHBhZ2UgaXMgaWxsZWdhbC4KPj4gK8KgwqDCoMKg
ICovCj4+ICvCoMKgwqAgaWYgKG9yZGVyKQo+PiArwqDCoMKgwqDCoMKgwqAgZ2ZwX2ZsYWdzIHw9
IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgX19HRlBfS1NXQVBEX1JFQ0xBSU07Cj4+IC3CoMKgwqDCoMKgwqDCoCBnZnBfZmxh
Z3MgJj0gfl9fR0ZQX01PVkFCTEU7Cj4+IC3CoMKgwqDCoMKgwqDCoCBnZnBfZmxhZ3MgJj0gfl9f
R0ZQX0NPTVA7Cj4+IC3CoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIGlmICghcG9vbC0+dXNlX2Rt
YV9hbGxvYykgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9IGFsbG9jX3BhZ2VzKGdmcF9mbGFn
cywgb3JkZXIpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
