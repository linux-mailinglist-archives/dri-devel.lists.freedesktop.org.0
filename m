Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD10E4609
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A56D6E91A;
	Fri, 25 Oct 2019 08:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735116E918;
 Fri, 25 Oct 2019 08:44:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p21so1150105wmg.2;
 Fri, 25 Oct 2019 01:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=SPkqCvMTeU8rD/SpAWFzGJ7d9eWafDdj6oMO7h5cj94=;
 b=KkXE0ecFKKFAdXPYkDxELCX9b3+92Rg6gGBzpmrYVgIin+nP31T4nX3SqmVd+hASEV
 slRfKuLz0DCjglwYY3rZXKH2EpUOP9TWTP394O/8PDQPWGAB6HTtBmFakmczEL5iDtk2
 u4ZsOOuX/pYjfzvK7c2RKloBi0eX0Fem7DkEIE2I0SWd34Elo9x/Mp5jIK9IrqbpToUx
 +tnXkwnZVBMGQQIaMF5tAPh86SP2hOofjqLMon7ILN0d41Rm63z2QJ4tln9m9BvjSTW9
 gUyJHT1OFmBA0ZrcibK8TS/4xkot2pujYSLVh12d6IpjwAbt2bFad+VKU/of0Q5FrzYq
 e8Tw==
X-Gm-Message-State: APjAAAUkXBUqxchTuDAZKJLDIZnf9sMeZ54t5X97FTJMmNIs+6Vc0l2H
 c9lLNC8AoZymmwVScqq9zSTNh9v2
X-Google-Smtp-Source: APXvYqwhImuPMcIKl6RuQWTrK6kbdtii6/SWq8eBqBxTMg2NCiMMrGfZ+WlzZ48zFgS+54w8DFDeYg==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr2266563wmb.108.1571993074943; 
 Fri, 25 Oct 2019 01:44:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w7sm1379700wmd.22.2019.10.25.01.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Oct 2019 01:44:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
Date: Fri, 25 Oct 2019 10:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SPkqCvMTeU8rD/SpAWFzGJ7d9eWafDdj6oMO7h5cj94=;
 b=EAiJkP9ySfYvgC1okdxbJ9ooLQ8vx4kCuBh5mluLVthWR20aQAoRFWyizDBM1dawWP
 aOejpBnoTap28dc9FncOmqSKrzz8xjdHtJCJRK6nrvJcetk6DkDC4Up6ekyJMoClmCp1
 lf0l8N4TegmLrX1BvbDL6oHNOyNYmoObIn3aluG7hCzm0zKLYYE9Cd9F7wQJN4aMU/Bs
 GbPTQ3x4y4GPccNAi9DerrGgue9EpnyBh+8AmhyUHsIYMOGH4wB0FiE9lUEr1VWZkLKV
 s3rWTKpe/ahHMrRz41qAc1pjKrClcymKsL5UfhXJ8tTwutYFd4bMVwoCVvkv9WkP29GJ
 AhiA==
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
Cc: Shirish.S@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMTAuMTkgdW0gMjE6NTcgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBQcm9ibGVt
Ogo+IFdoZW4gcnVuX2pvYiBmYWlscyBhbmQgSFcgZmVuY2UgcmV0dXJuZWQgaXMgTlVMTCB3ZSBz
dGlsbCBzaWduYWwKPiB0aGUgc19mZW5jZSB0byBhdm9pZCBoYW5ncyBidXQgdGhlIHVzZXIgaGFz
IG5vIHdheSBvZiBrbm93aW5nIGlmCj4gdGhlIGFjdHVhbCBIVyBqb2Igd2FzIHJhbiBhbmQgZmlu
aXNoZWQuCj4KPiBGaXg6Cj4gQWxsb3cgLnJ1bl9qb2IgaW1wbGVtZW50YXRpb25zIHRvIHJldHVy
biBFUlJfUFRSIGluIHRoZSBmZW5jZSBwb2ludGVyCj4gcmV0dXJuZWQgYW5kIHRoZW4gc2V0IHRo
aXMgZXJyb3IgZm9yIHNfZmVuY2UtPmZpbmlzaGVkIGZlbmNlIHNvIHdob2V2ZXIKPiB3YWl0IG9u
IHRoaXMgZmVuY2UgY2FuIGluc3BlY3QgdGhlIHNpZ25hbGVkIGZlbmNlIGZvciBhbiBlcnJvci4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMg
fCAxOSArKysrKysrKysrKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4gaW5kZXggOWEwZWU3NC4uZjM5Yjk3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTQ3OSw2ICs0NzksNyBAQCB2b2lkIGRybV9zY2hlZF9yZXN1
Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4gICAJc3RydWN0IGRy
bV9zY2hlZF9qb2IgKnNfam9iLCAqdG1wOwo+ICAgCXVpbnQ2NF90IGd1aWx0eV9jb250ZXh0Owo+
ICAgCWJvb2wgZm91bmRfZ3VpbHR5ID0gZmFsc2U7Cj4gKwlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5j
ZTsKPiAgIAo+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzX2pvYiwgdG1wLCAmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QsIG5vZGUpIHsKPiAgIAkJc3RydWN0IGRybV9zY2hlZF9mZW5jZSAq
c19mZW5jZSA9IHNfam9iLT5zX2ZlbmNlOwo+IEBAIC00OTIsNyArNDkzLDE2IEBAIHZvaWQgZHJt
X3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiAg
IAkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCAtRUNBTkNFTEVEKTsK
PiAgIAo+ICAgCQlkbWFfZmVuY2VfcHV0KHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQpOwo+IC0JCXNf
am9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKPiArCQlm
ZW5jZSA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc19qb2IpOwo+ICsKPiArCQlpZiAoSVNfRVJSX09S
X05VTEwoZmVuY2UpKSB7Cj4gKwkJCXNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBOVUxMOwo+ICsJ
CQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkp
Owo+ICsJCX0gZWxzZSB7Cj4gKwkJCXNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBmZW5jZTsKPiAr
CQl9Cj4gKwo+ICsKCk1heWJlIHRpbWUgZm9yIGEgZHJtX3NjaGVkX3J1bl9qb2IoKSBmdW5jdGlv
biB3aGljaCBkb2VzIHRoYXQgaGFuZGxpbmc/IApBbmQgd2h5IGRvbid0IHdlIG5lZWQgdG8gaW5z
dGFsbCB0aGUgY2FsbGJhY2sgaGVyZT8KCkFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1l
LApDaHJpc3RpYW4uCgo+ICAgCX0KPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3Jl
c3VibWl0X2pvYnMpOwo+IEBAIC03MjAsNyArNzMwLDcgQEAgc3RhdGljIGludCBkcm1fc2NoZWRf
bWFpbih2b2lkICpwYXJhbSkKPiAgIAkJZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNjaGVk
X2pvYik7Cj4gICAJCWRybV9zY2hlZF9mZW5jZV9zY2hlZHVsZWQoc19mZW5jZSk7Cj4gICAKPiAt
CQlpZiAoZmVuY2UpIHsKPiArCQlpZiAoIUlTX0VSUl9PUl9OVUxMKGZlbmNlKSkgewo+ICAgCQkJ
c19mZW5jZS0+cGFyZW50ID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7Cj4gICAJCQlyID0gZG1hX2Zl
bmNlX2FkZF9jYWxsYmFjayhmZW5jZSwgJnNjaGVkX2pvYi0+Y2IsCj4gICAJCQkJCQkgICBkcm1f
c2NoZWRfcHJvY2Vzc19qb2IpOwo+IEBAIC03MzAsOCArNzQwLDExIEBAIHN0YXRpYyBpbnQgZHJt
X3NjaGVkX21haW4odm9pZCAqcGFyYW0pCj4gICAJCQkJRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2Fs
bGJhY2sgZmFpbGVkICglZClcbiIsCj4gICAJCQkJCSAgcik7Cj4gICAJCQlkbWFfZmVuY2VfcHV0
KGZlbmNlKTsKPiAtCQl9IGVsc2UKPiArCQl9IGVsc2Ugewo+ICsKPiArCQkJZG1hX2ZlbmNlX3Nl
dF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2UpKTsKPiAgIAkJCWRybV9z
Y2hlZF9wcm9jZXNzX2pvYihOVUxMLCAmc2NoZWRfam9iLT5jYik7Cj4gKwkJfQo+ICAgCj4gICAJ
CXdha2VfdXAoJnNjaGVkLT5qb2Jfc2NoZWR1bGVkKTsKPiAgIAl9CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
