Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F04CB531
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8826EAB9;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA06E174;
 Wed,  2 Oct 2019 18:28:10 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 23so3829090pgk.3;
 Wed, 02 Oct 2019 11:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=izcdKMTlTPXdg1rZpK9PkNPTeAL5ACc5p0aT6ECn+3o=;
 b=ICHJ+u+Ilq5ur1hOdWLm+vR4QBXGdBq4tyW8dewJku9mwugmgGZyZDb0pGcLGTMgGb
 uGQgHl1glQAhxd9/O5DxIVShnQstqfFwyawoosZI6oE24rryZFjOvLBmim8rUvhBmird
 ItCu+zJUSfBo5WYDDKoIVk9Nhm9kIcF9016F3UfV4rodeUgdgBecksrn2jNfvs+uw9mR
 q3o0ElOPpBPUpLp9dnUMka352pEsUOJckTN+moxj17eEI/1e3fyhcSCdMQvARatmwMyF
 z4twReDroC9QSp/6rATYiN0V8p/aw/j92yCn4J+C2J/eyTDuImHLxg+4cS+lRcpoTjVl
 lEeQ==
X-Gm-Message-State: APjAAAVgAJ6vWOkHvY2IwwKKM12OrstkT+WLoClNVDtoJ1yYSCT7d6Oc
 hgwsnLFOKZZA6Lh1poB1ywY=
X-Google-Smtp-Source: APXvYqwrs3FB89RH0+kgXBF3ejwmYPZLTgHaLNuUiXE1AjcShSZR76+3xPYW28RCBcE0p63294782w==
X-Received: by 2002:a17:90a:c214:: with SMTP id
 e20mr5758828pjt.81.1570040889544; 
 Wed, 02 Oct 2019 11:28:09 -0700 (PDT)
Received: from [10.69.78.41] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b14sm162486pfi.95.2019.10.02.11.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 11:28:08 -0700 (PDT)
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
To: Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Rob Herring <robh+dt@kernel.org>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
 <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
 <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fbae48ca-fbd4-e32b-e874-92b5bba5df4d@gmail.com>
Date: Wed, 2 Oct 2019 11:28:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=izcdKMTlTPXdg1rZpK9PkNPTeAL5ACc5p0aT6ECn+3o=;
 b=nr6ZKcXN/729CI5YvKkqVc0Bz2wyp7AqMiNJbnneIbJ2S8a6/RpgT+vQxveooa1g8o
 Tzstjrebdj0ch6CBEQIhLHedt+Meqh8poQODSN2lg0OykjXXZCvv3ItaPXFO7ZImXqcW
 RuKmutNc32nfhTfdTSE+Gn+FP0hyvVehIb12ZNHr5rdWDezRIrhU/4qCY2koq02vv9hS
 0JYsKwzPEkKLeHC0o1yMLr4lNeC7nIidqjJQlgZ17X3hwG7uMGUGlb0FYDKstybAoxSN
 PuzGKEISFL71Mt9LOzHTLH19Bi/ikZqtSvsTTAUBs/9/pSrhf3mQrJw/Bi+Y2mWPIur/
 yzHQ==
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzI2LzIwMTkgNDoyMCBBTSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMTktMDkt
MjYgMTE6NDQgYW0sIE5pY29sYXMgU2FlbnogSnVsaWVubmUgd3JvdGU6Cj4+Pj4+PiBSb2Jpbiwg
aGF2ZSB5b3UgbG9va2VkIGludG8gc3VwcG9ydGluZyBtdWx0aXBsZSBkbWEtcmFuZ2VzPyBJdCdz
IHRoZQo+Pj4+Pj4gbmV4dCB0aGluZwo+Pj4+Pj4gd2UgbmVlZCBmb3IgQkNNIFNUQidzIFBDSWUu
IEknbGwgaGF2ZSBhIGdvIGF0IGl0IG15c2VsZiBpZiBub3RoaW5nCj4+Pj4+PiBpcyBpbgo+Pj4+
Pj4gdGhlCj4+Pj4+PiB3b3JrcyBhbHJlYWR5Lgo+Pj4+Pgo+Pj4+PiBNdWx0aXBsZSBkbWEtcmFu
Z2VzIGFzIGZhciBhcyBjb25maWd1cmluZyBpbmJvdW5kIHdpbmRvd3Mgc2hvdWxkIHdvcmsKPj4+
Pj4gYWxyZWFkeSBvdGhlciB0aGFuIHRoZSBidWcgd2hlbiB0aGVyZSdzIGFueSBwYXJlbnQgdHJh
bnNsYXRpb24uIEJ1dCBpZgo+Pj4+PiB5b3UgbWVhbiBzdXBwb3J0aW5nIG11bHRpcGxlIERNQSBv
ZmZzZXRzIGFuZCBtYXNrcyBwZXIgZGV2aWNlIGluIHRoZQo+Pj4+PiBETUEgQVBJLCB0aGVyZSdz
IG5vdGhpbmcgaW4gdGhlIHdvcmtzIHlldC4KPj4KPj4gU29ycnksIEkgbWVhbnQgc3VwcG9ydGlu
ZyBtdWx0aXBsZSBETUEgb2Zmc2V0c1sxXS4gSSB0aGluayBJIGNvdWxkCj4+IHN0aWxsIG1ha2UK
Pj4gaXQgd2l0aCBhIHNpbmdsZSBETUEgbWFzayB0aG91Z2guCj4gCj4gVGhlIG1haW4gcHJvYmxl
bSBmb3Igc3VwcG9ydGluZyB0aGF0IGNhc2UgaW4gZ2VuZXJhbCBpcyB0aGUgZGlzZ3VzdGluZwo+
IGNhcnZpbmcgdXAgb2YgdGhlIHBoeXNpY2FsIG1lbW9yeSBtYXAgeW91IG1heSBoYXZlIHRvIGRv
IHRvIGd1YXJhbnRlZQo+IHRoYXQgYSBzaW5nbGUgYnVmZmVyIGFsbG9jYXRpb24gY2Fubm90IGV2
ZXIgc3BhbiB0d28gd2luZG93cyB3aXRoCj4gZGlmZmVyZW50IG9mZnNldHMuIEkgZG9uJ3QgdGhp
bmsgd2UgZXZlciByZWFjaGVkIGEgY29uY2x1c2lvbiBvbiB3aGV0aGVyCj4gdGhhdCB3YXMgZXZl
biBhY2hpZXZhYmxlIGluIHByYWN0aWNlLgoKSXQgaXMgd2l0aCB0aGUgQnJvYWRjb20gU1RCIFNv
Q3Mgd2hpY2ggaGF2ZSBiZXR3ZWVuIDEgYW5kIDMgbWVtb3J5CmNvbnRyb2xsZXJzIGRlcGVuZGlu
ZyBvbiB0aGUgU29DLCBhbmQgbXVsdGlwbGUgZG1hLXJhbmdlcyBjZWxscyBmb3IgUENJZQphcyBh
IGNvbnNlcXVlbmNlLgoKRWFjaCBtZW1vcnkgY29udHJvbGxlciBoYXMgYSBkaWZmZXJlbnQgcGh5
c2ljYWwgYWRkcmVzcyBhcGVydHVyZSBpbiB0aGUKQ1BVJ3MgcGh5c2ljYWwgYWRkcmVzcyBtYXAg
KGUuZy46IE1FTUMwIGlzIDB4MCAtIDB4M2ZmZl9mZmZmLCBNRU1DMQoweDQwMDBfMDAwMCAtIDB4
N2ZmZmZfZmZmZiBhbmQgTUVNQzIgMHg4MDAwXzAwMDAgLSAweGJmZmZfZmZmZiwgbm90CmNvdW50
aW5nIHRoZSBleHRlbnNpb24gcmVnaW9ucyBhYm92ZSA0R0IpLCBhbmQgd2hpbGUgdGhlIENQVSBp
cwpzY2hlZHVsZWQgYW5kIGFyYml0cmF0ZWQgdGhlIHNhbWUgd2F5IGFjcm9zcyBhbGwgbWVtb3J5
IGNvbnRyb2xsZXJzCih0aHVzIG1ha2luZyBpdCB2aXJ0dWFsbHkgVU1BLCBhbG1vc3QpIGhhdmlu
ZyBhIGJ1ZmZlciBzcGFuIHR3byBtZW1vcnkKY29udHJvbGxlcnMgd291bGQgYmUgcHJvYmxlbWF0
aWMgYmVjYXVzZSB0aGUgbWVtb3J5IGNvbnRyb2xsZXJzIGRvIG5vdAprbm93IGhvdyB0byBndWFy
YW50ZWUgdGhlIHRyYW5zYWN0aW9uIG9yZGVyaW5nIGFuZCBidWZmZXIgZGF0YQpjb25zaXN0ZW5j
eSBpbiBib3RoIERSQU0gaXRzZWxmIGFuZCBmb3Igb3RoZXIgbWVtb3J5IGNvbnRyb2xsZXIgY2xp
ZW50cywKbGlrZSBQQ0llLgoKV2UgaGlzdG9yaWNhbGx5IGhhZCB0byByZXNlcnZlIHRoZSBsYXN0
IDRLQiBvZiBlYWNoIG1lbW9yeSBjb250cm9sbGVyIHRvCmF2b2lkIHByb2JsZW1hdGljIGNvbnRy
b2xsZXJzIGxpa2UgRUhDSSB0byBwcmVmZXRjaCBiZXlvbmQgdGhlIGVuZCBvZiBhCm1lbW9yeSBj
b250cm9sbGVyJ3MgcG9wdWxhdGVkIG1lbW9yeSBhbmQgdGhhdCBhbHNvIGluY2lkZW50YWxseSB0
YWtlcwpjYXJlIG9mIG5ldmVyIGhhdmluZyBhIGJ1ZmZlciBjcm9zcyBhIGNvbnRyb2xsZXIgYm91
bmRhcnkuIEVpdGhlciB5b3UKY2FuIGFsbG9jYXRlIHRoZSBlbnRpcmUgYnVmZmVyIG9uIGEgZ2l2
ZW4gbWVtb3J5IGNvbnRyb2xsZXIsIG9yIHlvdQpjYW5ub3QgYWxsb2NhdGUgbWVtb3J5IGF0IGFs
bCBvbiB0aGF0IHpvbmUvcmVnaW9uIGFuZCBhbm90aGVyIG9uZSBtdXN0CmJlIGZvdW5kIChvciB0
aGVyZSBpcyBubyBtb3JlIG1lbW9yeSBhbmQgdGhlcmUgaXMgYSBnZW51aW5lIE9PTSkuCgpUaGUg
d2F5IHdlIHJlc2VydmUgbWVtb3J5IHJpZ2h0IG5vdyBpcyBiYXNlZCBvbiB0aGUgZmlyc3QgcGF0
Y2gKc3VibWl0dGVkIGJ5IEppbToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC85ODg0NjkvCgp3aGVyZWJ5IHdlIHJlYWQgdGhlIG1lbW9yeSBub2RlJ3MgInJlZyIgcHJv
cGVydHkgYW5kIHdlIG1hcCB0aGUgcGh5c2ljYWwKYWRkcmVzc2VzIHRvIHRoZSBtZW1vcnkgY29u
dHJvbGxlciBjb25maWd1cmF0aW9uIHJlYWQgZnJvbSB0aGUgc3BlY2lmaWMKcmVnaXN0ZXJzIGlu
IHRoZSBDUFUncyBCdXMgSW50ZXJmYWNlIFVuaXQgKHdoZXJlIHRoZSBtZW1vcnkgY29udHJvbGxl
cgphcGVydHVyZXMgYXJlIGFyY2hpdGVjdHVyYWxseSBkZWZpbmVkKSBhbmQgdGhlbiB3ZSB1c2Ug
dGhhdCB0byBjYWxsCm1lbWJsb2NrX3Jlc2VydmUoKSAobm90IHBhcnQgb2YgdGhhdCBwYXRjaCwg
aXQgc2hvdWxkIGJlIHRob3VnaCkuCi0tIApGbG9yaWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
