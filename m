Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7948228236
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368286E503;
	Tue, 21 Jul 2020 14:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F8D6E503
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:30:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so21426210wrv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=o8uRNmz/eHg4peoKo7yv4JQq4D/miJWrCR4OrDWNB6w=;
 b=OQFtLk+PFS9Wa8dvKztl8JFUdpIlhETypmlaCeQctXZlDsWBhQRnUowAbcWDxtDoSV
 DqnbzkFFGsGQ8ovNZKnOKUjFtsP2JlV4eCL8OhTEuOXfvN1qe7SvrMcg4ulaHlNWtchx
 WWKyxarbYLPsi1rhuf5dzXf3anm8DJjkgjvbOcWFlyJe7WOIw3/MtsETVLq24mgbVkfB
 Tjcj8+iERBRN0uv3/9GUN7uerWWYnRcV/mlFIPMCb0paOWxf4Jx/1UA6U2eRlSnOVlfR
 +iEQ5DDYoji+B0Yrwl0mL/02sQtN3b0t0Sfv04iGh6MWHCSZoc3ErBaCwfn9a5X+Y62p
 P33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=o8uRNmz/eHg4peoKo7yv4JQq4D/miJWrCR4OrDWNB6w=;
 b=cxxMzNLS4DNaBdgdRHOkcvkcNlIJ1FxmiU3uSKBOD43toFRP1zlyjuw6wbWIwrPauK
 ZLJf/B87QTX8E9zn8easg3SGcsVtQ4WI2rffasV0ld5I57ozatNsnLLsWVv+AhOVT1Zp
 r451SQ2/XM+0rySpNw6dTxbnLNzMpakFYTzIqnIM60DFiz1kICtbCluYlckupdqYoyOm
 nGI8Gm3KDefkGeoendm7VVhW/4GucYWDpJPJLcBOmicY8OONznUrEI3SbDlmolW2gtXs
 ZEXP8E4UYgQWQVfrcKRPzApcJz7q/pq+Z4rtlDYVea2d+e+2i6qHp6uTakkPAY1kGsxj
 W7YQ==
X-Gm-Message-State: AOAM531I61/IZOoZwbvTiRjzNZcJq0nXZE4hFdKm+rR1U+qpCakO7fUw
 t3BpIVZMo1Jr+Rqkd+UGUQM=
X-Google-Smtp-Source: ABdhPJxzMsS0Pdg2mvI4BxfuGgWGzMe6f7N4fyYr9jDXZ0gpJZxd7fKSCZjuIpFFhkrfIfTiZGQqhA==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr18322118wrn.120.1595341827300; 
 Tue, 21 Jul 2020 07:30:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d201sm3656022wmd.34.2020.07.21.07.30.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 07:30:26 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: daniel@ffwll.ch
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-8-christian.koenig@amd.com>
 <20200721092809.GG6419@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <317ec5ad-5877-ea49-0cd9-ced69df82544@gmail.com>
Date: Tue, 21 Jul 2020 16:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200721092809.GG6419@phenom.ffwll.local>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDcuMjAgdW0gMTE6Mjggc2NocmllYiBkYW5pZWxAZmZ3bGwuY2g6Cj4gT24gVHVlLCBK
dWwgMjEsIDIwMjAgYXQgMDk6MzI6NDJBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gVGhlIGRyaXZlciBkb2VzIHN1cHBvcnQgc29tZSBub3QtbWFwYWJsZSByZXNvdXJjZXMsIGJ1
dAo+PiB0aG9zZSBhcmUgYWxyZWFkeSBoYW5kbGVkIGNvcnJlY3RseSBpbiB0aGUgc3dpdGNoL2Nh
c2UKPj4gc3RhdGVtZW50IGluIHRoZSBjb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDExICsrKystLS0tLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBpbmRleCA0NGZhOGJjNDlkMTguLjBk
ZDVlODAyMDkxZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+PiBAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbml0X21lbV90eXBlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+PiAgIAlzd2l0Y2ggKHR5
cGUpIHsKPj4gICAJY2FzZSBUVE1fUExfU1lTVEVNOgo+PiAgIAkJLyogU3lzdGVtIG1lbW9yeSAq
Lwo+PiAtCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPj4gKwkJbWFu
LT5mbGFncyA9IDA7Cj4+ICAgCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tf
Q0FDSElORzsKPj4gICAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVE
Owo+PiAgIAkJYnJlYWs7Cj4+IEBAIC05MywxMyArOTMsMTIgQEAgc3RhdGljIGludCBhbWRncHVf
aW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwK
Pj4gICAJCW1hbi0+ZnVuYyA9ICZhbWRncHVfZ3R0X21ncl9mdW5jOwo+PiAgIAkJbWFuLT5hdmFp
bGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7Cj4+ICAgCQltYW4tPmRlZmF1bHRf
Y2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPj4gLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1U
WVBFX0ZMQUdfTUFQUEFCTEU7Cj4+ICsJCW1hbi0+ZmxhZ3MgPSAwOwo+PiAgIAkJYnJlYWs7Cj4+
ICAgCWNhc2UgVFRNX1BMX1ZSQU06Cj4+ICAgCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCj4+
ICAgCQltYW4tPmZ1bmMgPSAmYW1kZ3B1X3ZyYW1fbWdyX2Z1bmM7Cj4+IC0JCW1hbi0+ZmxhZ3Mg
PSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwKPj4gLQkJCSAgICAgVFRNX01FTVRZUEVfRkxBR19N
QVBQQUJMRTsKPj4gKwkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7Cj4+ICAg
CQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfCBUVE1fUExf
RkxBR19XQzsKPj4gICAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7Cj4+
ICAgCQlicmVhazsKPj4gQEAgLTc5Niw3ICs3OTUsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19t
b3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4+ICAgICovCj4+
ICAgc3RhdGljIGludCBhbWRncHVfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPj4gICB7Cj4+IC0Jc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5cGVdOwo+PiAg
IAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiZGV2KTsKPj4g
ICAJc3RydWN0IGRybV9tbV9ub2RlICptbV9ub2RlID0gbWVtLT5tbV9ub2RlOwo+PiAgIAo+PiBA
QCAtODA1LDggKzgwMyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV9pb19tZW1fcmVzZXJ2ZShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fCj4+ICAgCW1lbS0+YnVz
LnNpemUgPSBtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwo+PiAgIAltZW0tPmJ1cy5iYXNl
ID0gMDsKPj4gICAJbWVtLT5idXMuaXNfaW9tZW0gPSBmYWxzZTsKPj4gLQlpZiAoIShtYW4tPmZs
YWdzICYgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSkpCj4+IC0JCXJldHVybiAtRUlOVkFMOwo+
IFRoaXMgY2hlY2sgY2F0Y2hlcyB0aGUgdmFyaW91cyBzcGVjaWFsIG9uLWJvYXJkIG1lbW9yaWVz
LCBvciBhdCBsZWFzdCBJCj4gY291bGRudCcgZmluZCB3aGVyZSBtbWFwIGZvciB0aGVzZSBpcyBk
aXNhbGxvd2VkLgoKU2VlIHRoZSBzd2l0Y2ggKG1lbS0+bWVtX3R5cGUpIGp1c3QgYmVsb3csIHRo
YXQgcmV0dXJuIC1FSU5WQUwgYXMgd2VsbCAKZm9yIHRob3NlLgoKVGhlcmUgaXMgZXhhY3RseSB6
ZXJvIGZ1bmN0aW9uYWxpdHkgY2hhbmdlIGhlcmUgOikKCkNocmlzdGlhbi4KCj4gLURhbmllbAo+
Cj4+ICsKPj4gICAJc3dpdGNoIChtZW0tPm1lbV90eXBlKSB7Cj4+ICAgCWNhc2UgVFRNX1BMX1NZ
U1RFTToKPj4gICAJCS8qIHN5c3RlbSBtZW1vcnkgKi8KPj4gLS0gCj4+IDIuMTcuMQo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
