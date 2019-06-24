Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D550CE9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47789B45;
	Mon, 24 Jun 2019 13:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8424289B45;
 Mon, 24 Jun 2019 13:58:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so14002358wre.12;
 Mon, 24 Jun 2019 06:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=P+OTC5ZBFyvwnsnPqjRN2AFbpWeXrlcVzFTz0CRv03Y=;
 b=PNH/P95MNuJUcIXPKknIk4fKnfTKuSYGtCXeQerX1sJc00sNT0X14sBCXrvOVL728t
 8TUAJIkl0o32Ycc7pNIOVpF8DWIAZoUdtMcOTQ5EklyYZrGtn0MTpZZDeBbYcipHNQdx
 Yh6hfOsn/xhp9zB65l6iI48117pNeytsT4+BUwVMTQFUsrEgQ+tjl7mU8D/peB2oG4Me
 Gsr1LvWmqjiG28LDan6GecMWFGISR50D5hN5VZWAj5SPrW/BO9OfTET4umeGQJbYgnAp
 QvwIr8RbZRPqGJj37DULZCpMS7T1QqxGey9fCc0cz3tKWIlrLFXjxc2LTNFvXK/gWscd
 VnaA==
X-Gm-Message-State: APjAAAX+bYYnoxIPIEIJXeWAK3HtXCWqS8z7IxkXoq8KJ8BmdpDT2hDY
 ZHznIvUi+yziN4NxMOLb5jYMOlOA
X-Google-Smtp-Source: APXvYqwxvBbVU0w9Jo18FMuXFJEyQBXGltF1t7H/5q9mWFLEmca/Fh4XF3wzyqR17ujUgYQ0yxWTrQ==
X-Received: by 2002:adf:ce8f:: with SMTP id r15mr99013084wrn.122.1561384682106; 
 Mon, 24 Jun 2019 06:58:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p13sm8201772wrt.67.2019.06.24.06.58.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:58:01 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v10
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190618115455.1253-1-christian.koenig@amd.com>
 <20190621092022.GB12905@phenom.ffwll.local>
 <46bc08a3-1b84-c819-dbb5-882e95ab23e5@gmail.com>
 <CAKMK7uE6NUujY0ubOYkux-StOxMT-hYhBdAnQJkDsgEkuDjH9g@mail.gmail.com>
 <78db8951-2e62-2a9d-3d87-3b458fbba880@gmail.com>
 <20190621162753.GI12905@phenom.ffwll.local>
 <4d868c4c-cc00-bfa9-b6f5-969b76497cab@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1d4f3779-8dc8-14ad-4d20-f7ccee7cea53@gmail.com>
Date: Mon, 24 Jun 2019 15:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4d868c4c-cc00-bfa9-b6f5-969b76497cab@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=P+OTC5ZBFyvwnsnPqjRN2AFbpWeXrlcVzFTz0CRv03Y=;
 b=MRgE8wAff0+Qg8FX8ZwIhCrU5afaINkuB8cCjBI24VUCFfWEQ5liPhUj9DzIFEteYf
 dgwBsDge0mMhs8jPu5qP3OKdkBR2ucR4vnEGPlZMYc6EEqpIjE6HAl6acxYwHQPZgHs3
 BABRSnhMhTtb5P60MoH8G2bBUHDOFhS9ysMVJ5QJwh+gBfJsV6qm4FzXavZN1hBOP2XE
 9mvcs1vPP+FdulaM6wLDkyZVNX6qpzPnvvmrqynPser4bgUVso/MsGCNvRffGns7sp0I
 9czoKnsc8mCaOGaxldpSo4YhnKsYb2CWftpo/uTks+gd6D7rFs38qiq8Q2AhoQj3W8gV
 5cNg==
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
Reply-To: christian.koenig@amd.com
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDYuMTkgdW0gMTM6MjMgc2NocmllYiBLb2VuaWcsIENocmlzdGlhbjoKPiBBbSAyMS4w
Ni4xOSB1bSAxODoyNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4KPj4gU28gSSBwb25kZXJlZCBh
IGZldyBpZGVhcyB3aGlsZSB3b3JraW5nIG91dDoKPj4KPj4gMSkgV2UgZHJvcCB0aGlzIGZpbHRl
cmluZy4gSW1wb3J0ZXIgbmVlZHMgdG8ga2VlcCB0cmFjayBvZiBhbGwgaXRzCj4+IG1hcHBpbmdz
IGFuZCBmaWx0ZXIgb3V0IGludmFsaWRhdGVzIHRoYXQgYXJlbid0IGZvciB0aGF0IHNwZWNpZmlj
IGltcG9ydGVyCj4+IChlaXRoZXIgYmVjYXVzZSBhbHJlYWR5IGludmFsaWRhdGVkLCBvciBub3Qg
eWV0IG1hcHBlZCwgb3Igd2hhdGV2ZXIpLgo+PiBGZWVscyBmcmFnaWxlLgo+Pgo+PiBbU05JUF0K
PiBbU05JUF0KPgo+IEkgd2lsbCB0YWtlIGEgbW9tZW50IGFuZCBsb29rIGludG8gIzEgYXMgd2Vs
bCwgYnV0IEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZQo+IG5lZWQgdG8gY2hhbmdlIGFueXRoaW5nLgoK
VGhhdCB0dXJuZWQgb3V0IG11Y2ggY2xlYW5lciB0aGFuIEkgdGhvdWdodCBpdCB3b3VsZCBiZS4g
RXNzZW50aWFsbHkgaXQgCmlzIG9ubHkgYSBzaW5nbGUgZXh0cmEgbGluZSBvZiBjb2RlIGluIGFt
ZGdwdS4KCkdvaW5nIHRvIHNlbmQgdGhhdCBvdXQgYXMgYSBwYXRjaCBzZXQgaW4gYSBtaW51dGUu
CgpDaHJpc3RpYW4uCgo+Cj4gQ2hyaXN0aWFuLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
