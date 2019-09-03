Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632CA7C70
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6BE89247;
	Wed,  4 Sep 2019 07:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000A4886F0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 19:25:04 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id y26so21428296qto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 12:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iURzHVoug+BVQzE3aiboRTiHJ/pTQSTgpyIAuJN95Lw=;
 b=DSZeuPF35BiKj8VQ2ImZutluleG5Qrsb7HKxQszd3//A0hkI0y5JIs9TBETEAxbtAk
 otGAyr4PhWcfAV4bRHhs+Ne0APBDKKW3FMFgIIqvVwP9jI6T86Qt0s+Qd07En5/JDFaG
 CIM/u1RxGrYigWR7W0wCdYHxv5RGSiklSGkJIDvsWEI0SrZmMHebV6zrf0PNPTQzNk5q
 tu91lmsUvxnyLDYJqm5PrnD00fpydi91sX/fVFVlInMFX5GSsxFwp6MJwn1gR9QVcr4A
 dtXbWhXIhXyECznHRou1pQkKNVXAfBWBR8KM46HuHqvY2TA48bH50DcdJNnZxaozNtSn
 SVGQ==
X-Gm-Message-State: APjAAAXFaH0FobQ5MdtA4WUfyiMUwopclBFfto33wd9i6jrq+JQrU5hj
 NmhyJdBArub+6QUMo6Xeq6hbTmvhh1w=
X-Google-Smtp-Source: APXvYqx9WwL5QwaaWQdjo7nzyN8DdJhexUd7JI+Qh2Ee+c+x2FZT4mvaeCCtJzZoLeJeCRBIFceRSQ==
X-Received: by 2002:ad4:5364:: with SMTP id e4mr20606689qvv.27.1567538703681; 
 Tue, 03 Sep 2019 12:25:03 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id u24sm3799440qkj.71.2019.09.03.12.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2019 12:25:03 -0700 (PDT)
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Rob Clark <robdclark@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
Date: Tue, 3 Sep 2019 15:26:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iURzHVoug+BVQzE3aiboRTiHJ/pTQSTgpyIAuJN95Lw=;
 b=W+9XILR6EPv5ilyi1q9wSlU93ZZeQ46/hj0A19bRID1cNrnt1h58NvcfujDbIhD1XW
 bHZBcL23lzK+t/xRp2Kr4fULFY8k1xDoJx/9Iga2H9T60Z1Z1Mb/3y0YZ8+Ti0BKx3iP
 ttARas8Y8vk6NCdWMKOuXYu3ftvCgy4gPcifr275BhoiKPwb3RiUbc6JoQfT2JO0Lw5E
 gCYR+tD1wnx0OH9R3YMuaBPtKU5GCQxG8O4Y2YayRbpVEsOhWkxOnub+QzFo91kwDusG
 vuJjZG19qgFOovEdc7Xm/+wg3cjyfCuVqm1ndwI8DfJansC4KKiPFLEQlc5F5weY0gSZ
 sdMA==
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJIHRyaWVkIHRoaXMgYW5kIGl0IHdvcmtzIHdpdGggcGF0Y2hlcyA0KzUgZnJvbSBSb2In
cyBzZXJpZXMgYW5kIApjaGFuZ2luZyBncHVtbXUgdG8gdXNlIHNnX3BoeXMoc2cpIGluc3RlYWQg
b2Ygc2ctPmRtYV9hZGRyZXNzIAooZG1hX2FkZHJlc3MgaXNuJ3Qgc2V0IG5vdyB0aGF0IGRtYV9t
YXBfc2cgaXNuJ3QgdXNlZCkuCgpKb25hdGhhbgoKT24gOS8zLzE5IDExOjIyIEFNLCBSb2IgQ2xh
cmsgd3JvdGU6Cj4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMTowMyBBTSBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBSb2JpbiwKPj4KPj4gT24gTW9u
LCBTZXAgMiwgMjAxOSBhdCAxMTo0NSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPiB3cm90ZToKPj4KPj4+IFRyeSAwMDM2YmM3M2NjYmUgLSB0aGF0IGxvb2tzIGxpa2Ugc29t
ZXRoaW5nIHRoYXQgQ09ORklHX0RNQV9BUElfREVCVUcKPj4+IHNob3VsZCBoYXZlIGJlZW4gc2Ny
ZWFtaW5nIGFib3V0IGFueXdheS4KPj4KPj4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uCj4+
Cj4+IEkgY2FuIHN1Y2Nlc3NmdWxseSBib290IGFmdGVyIHJldmVydGluZyB0aGUgZm9sbG93aW5n
IGNvbW1pdHM6Cj4+Cj4+IGNvbW1pdCAxNDFkYjU3MDNjODg3ZjQ2OTU3NjE1Y2Q2NjE2Y2EyOGZl
NDY5MWUwIChIRUFEKQo+PiBBdXRob3I6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNv
bT4KPj4gRGF0ZTogICBNb24gU2VwIDIgMTQ6NTg6MTggMjAxOSAtMDMwMAo+Pgo+PiAgICAgIFJl
dmVydCAiZHJtL21zbTogc3RvcCBhYnVzaW5nIGRtYV9tYXAvdW5tYXAgZm9yIGNhY2hlIgo+Pgo+
PiAgICAgIFRoaXMgcmV2ZXJ0cyBjb21taXQgMDAzNmJjNzNjY2JlN2U2MDBhMzQ2OGJmOGU4ODc5
YjEyMjI1MjI3NC4KPj4KPj4gY29tbWl0IGZhNWIxZjYyMGYyOTg0YzI1NDg3N2Q2MDQ5MjE0YzM5
YzI0YzgyMDcKPj4gQXV0aG9yOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4+
IERhdGU6ICAgTW9uIFNlcCAyIDE0OjU2OjAxIDIwMTkgLTAzMDAKPj4KPj4gICAgICBSZXZlcnQg
ImRybS9tc206IFVzZSB0aGUgY29ycmVjdCBkbWFfc3luYyBjYWxscyBpbiBtc21fZ2VtIgo+Pgo+
PiAgICAgIFRoaXMgcmV2ZXJ0cyBjb21taXQgM2RlNDMzYzViMzhhZjQ5YTVmYzc2MDI3MjFlMmFi
NWQzOWYxZTY5Yy4KPj4KPj4gUm9iLAo+Pgo+PiBXaGF0IHdvdWxkIGJlIHRoZSByZWNvbW1lbmRl
ZCBhcHByb2FjaCBmb3IgZml4aW5nIHRoaXM/Cj4+Cj4gCj4gV2UgbmVlZCBhIGRpcmVjdCB3YXkg
dG8gaGFuZGxlIGNhY2hlLCBzbyB3ZSBjYW4gc3RvcCB0cnlpbmcgdG8gdHJpY2sKPiBETUEgQVBJ
IGludG8gZG9pbmcgd2hhdCB3ZSB3YW50Lgo+IAo+IFNvbWV0aGluZyBsaWtlIHRoaXMgaXMgd2hh
dCBJIGhhZCBpbiBtaW5kOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvNjUyMTEvCj4gCj4gSSBndWVzcyBJIGNvdWxkIHJlc3BpbiB0aGF0LiAgSSdtIG5vdCBy
ZWFsbHkgc3VyZSBvZiBhbnkgb3RoZXIgd2F5IHRvCj4gaGF2ZSB0aGluZ3Mgd29ya2luZyBvbiB0
aGUgZGlmZmVyZW50IGNvbWJpbmF0aW9ucyBvZiBhcmNocyBhbmQgZG1hX29wcwo+IHRoYXQgd2Ug
aGF2ZS4gIExhdGVseSBmaXhpbmcgb25lIGhhcyBiZWVuIGJyZWFraW5nIGFub3RoZXIuCj4gCj4g
QlIsCj4gLVIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
