Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DC5630B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D666E2A4;
	Wed, 26 Jun 2019 07:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5636E2A4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:17:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s3so910620wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 00:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ICpIxiLs9uo356xFFio1VkXKiOKcWs8HrA2Tct954Ig=;
 b=ceMBYaSRd4KhD1y8vd+ysprTaN2QcCKRcCDxMZOb0mfuCfU6LsvmPiyyDfBlEvwl4N
 JwpwU3Syc9oxuc3tz4cLd1HzBM3f/L7mFpAY5/yjuZaufmWeEAoK7Jl4urB2chbKnYE6
 xJ6mR09DXsZE6P0VEGTFxadiykiHKoNvBIYPc0g/NEV37SIEDZZJ3FFbVCdgP8l9Hu67
 p3pyQpE5yo6FbGrDwRl6p8Jeci91Swfbbi5hMcZ80362p5t4uu/SrXkBUQiFbcSoIVma
 9GgK/RK6p9HPmTzem0qZU0ZvrNxCAf8cck3XOWyIg8BsPikJt5HmB/BdD78/NL5Lhi9C
 2Qqw==
X-Gm-Message-State: APjAAAVnzDst4UUV6LLkzsk6AFTI5n9/CHcQa/BGTEgSQaIgYM23OWV4
 4OPS+wqWU2nofM/s45keqgmYLROZ
X-Google-Smtp-Source: APXvYqxyy03bYHH8JDrtcpRJMZeAOGOk2zTH+aZ51POj7+HnvNkGV+KEDGau6IKGcA/I1rwcDPmDkA==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr1605988wme.51.1561533476145; 
 Wed, 26 Jun 2019 00:17:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f2sm22531505wrq.48.2019.06.26.00.17.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 00:17:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Hellstrom <thomas@shipmail.org>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
 <20190621155737.GH12905@phenom.ffwll.local>
 <a34afbbb-e2d0-299b-872f-e322f05c7ac3@shipmail.org>
 <CAKMK7uHpmddF8Bg7q1jyQt7MKrrBR=Fxi+rm6K-dgYDjfekLSA@mail.gmail.com>
 <7c156174-30ee-84c8-6252-70207df4c4fe@shipmail.org>
 <20190624063249.x6q5wxq2lrqfoyuw@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9beb9916-35cf-045a-4946-ce314cf1d3da@gmail.com>
Date: Wed, 26 Jun 2019 09:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624063249.x6q5wxq2lrqfoyuw@sirius.home.kraxel.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ICpIxiLs9uo356xFFio1VkXKiOKcWs8HrA2Tct954Ig=;
 b=ZeDc3H+GaVOZh0+2qV1e3Dla8YBHrfng2lk5Gc/bXI2bqgiBQE9QAJmiMxztZzE3x3
 PNzsmtVeZNlSxbJV3sjW4cuA2yvo+pP1ec1JLixCqS8ggY1qElcGNOaMJbN0uCoLd6pB
 cP5KiCbxHIOsdK1f/cZWMTEr3ExR0DLIiXT0u7CR+llqJ5R7RgnXd0ZchXptTdWKgihV
 pX1zYNcWZ5mfHRNgTgDMPt5VoXwLJy2742TQ/H0BLKcCu7SHC+gqe1ct8lwbnCeRyfRW
 tZzpS5AY64RCg0dzX0m79EeISqCQ+GylmR4ed5LvX/LgsA3E/Vf63AP9s/XaV4rBZgtx
 yW3g==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDYuMTkgdW0gMDg6MzIgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+ICAgIEhpLAo+Cj4+
IFllYWgsIG15IHBvaW50IHdhcyBub3QgcmVhbGx5IHN1Z2dlc3RpbmcgdGhhdCB3ZSBkbyB0aGlz
LCBidXQgcmF0aGVyIHRoYXQKPj4gcGVvcGxlIHdvdWxkIHJpZ2h0ZnVsbHkgZ2V0IHVwc2V0IGJl
Y2F1c2UgdGhlIHN0cnVjdCBjb250YWlucyB1bnVzZWQgc3R1ZmYuCj4gV2VsbCwgc3RydWN0IGRy
bV9nZW1fb2JqZWN0IGlzbid0IHRoYXQgYmlnLCBsZXRzIGhhdmUgYSBsb29rOgo+Cj4gMzIwIGJ5
dGVzIGluIHRvdGFsLCBvZiB3aGljaCBhcmU6Cj4gICAgMTg0IGJ5dGVzIHRoZSBlbWJlZGRlZCB2
bWFfbW9kZQo+ICAgICA2NCBieXRlcyB0aGUgZW1iZWRkZWQgX3Jlc3Ygc3RydWN0Cj4gICAgICA4
IGJ5dGVzIHRoZSByZXN2IHBvaW50ZXIuCj4gICAgIDY0IGJ5dGVzIGV2ZXJ5dGhpbmcgZWxzZS4K
Pgo+IFNvLCBhZnRlciBhcHBseWluZyB0aGlzIHNlcmllcyBpdCdzIDY0IGJ5dGVzIG1vcmUgcGVy
IGJvIGZvciB2bXdnZngsCj4gZHVlIHRvIHNvbWUgdW51c2VkIGZpZWxkcyBiZWluZyBhZGRlZC4K
Pgo+IEFuZCBpdCdzIDI1NiBieXRlcyBsZXNzIHBlciBibyBmb3IgYWxsIHR0bStnZW0gZHJpdmVy
cywgYmVjYXVzZSB0aGV5Cj4gZG9uJ3QgaGF2ZSB2bWFfbW9kZSArIHJlc3Ygc3RydWN0ICsgcmVz
diBwb2ludGVyIHR3aWNlIGFueSBtb3JlLgo+Cj4gQW5kIHRoYXQgaXMganVzdCB0aGUgbG93LWhh
bmdpbmcgZnJ1aXQsIHRoZXJlIGlzIHJvb20gZm9yIG1vcmUKPiB0dG1fYnVmZmVyX29iamVjdCBl
bGVtZW50cyBiZWluZyByZW1vdmVkIGJ5IHVzaW5nIHRoZSBkcm1fZ2VtX29iamVjdAo+IHN0cnVj
dCBlbGVtZW50cyBpbnN0ZWFkLiAgbnVtX3BhZ2VzLCBrcmVmLCBtYXliZSBtb3JlLgoKWWVhaCwg
YW5kIHRoYXQgaXMgZXhhY3RseSB0aGUgcmVhc29uIHdoeSBJJ20gc3Ryb25nbHkgaW4gZmF2b3Ig
b2YgdGhpcyAKYXBwcm9hY2guCgpHRU0gaXMgb3VyIGRlLWZhY3RvIHN0YW5kYXJkIGZvciBidWZm
ZXIgVUFQSSBpbiBEUk0uIEFGQUlLIHZtZ2Z4IGlzIG9uZSAKb2YgdGhlIGZldyBkcml2ZXJzIG5v
dCB1c2luZyBpdCBhbmQgYXMgeW91IHdyb3RlIGFzIHdlbGwgaXQgbWlnaHQgCmFjdHVhbGx5IGJl
IGEgZ29vZCBpZGVhIHRvIGNoYW5nZSB0aGF0LgoKVGhlIG9ubHkgdGhpbmcgSSBjYW4gb2YgaGFu
ZCBzZWUgd2hpY2ggaXMgbWlzcGxhY2VkIGluIHRoZSAKZHJtX2dlbV9vYmplY3Qgc3RydWN0dXJl
IGlzICJzdHJ1Y3QgZmlsZSAqZmlscDsiLCBjYXVzZSB0aGF0IGlzIHNwZWNpZmljIAp0byBhIGJh
Y2tlbmQgaW1wbGVtZW50YXRpb24uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4+IEFsc28gYSB0
cmFwIHdlIG1pZ2h0IGVuZCB1cCB3aXRoIGluIHRoZSBmdXR1cmUgaXMgdGhhdCB3aXRoIHRoZSBk
ZXNpZ24KPj4gc3VnZ2VzdGVkIGluIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRoYXQgcGVvcGxlIHN0
YXJ0IGFzc3VtaW5nIHRoYXQgdGhlCj4+IGVtYmVkZGVkIGdlbSBvYmplY3QgaXMgYWN0dWFsbHkg
aW5pdGlhbGl6ZWQgYW5kIHdvcmtpbmcsIHdoaWNoIGNvdWxkIGxlYWQgdG8KPj4gcHJldHR5IHNl
dmVyZSBwcm9ibGVtcyBmb3Igdm13Z2Z4Li4uCj4gSSBndWVzcyBJIHNob3VsZCByZXdvcmQgcGF0
Y2ggIzEgdGhlbiwgbWFraW5nIGNsZWFyIHRoYXQgdGhlCj4gdHRtX2JvX3VzZXNfZW1iZWRkZWRf
Z2VtX29iamVjdCgpIGhlbHBlciBmdW5jdGlvbiBpcyBnb2luZyB0byBzdGF5Lgo+Cj4gV2hhdCBp
cyB0aGUgcmVhc29uIGZvciB2bXdnZnggdG8gbm90IHVzZSBnZW0gYnR3Pwo+Cj4+PiBmb3IgYWxs
IHRoZSB0dG0rZ2VtIGRyaXZlcnMsIG9uZSBwb2ludGVyIHRoZXkgZG9uJ3QgbmVlZCB0d2ljZSku
IFdpdGgKPj4+IHRoZSBzaWRlLWJ5LXNpZGUsIHdoaWNoIGlzIHRoZSBkZXNpZ24gYWxsIGdlbSt0
dG0gZHJpdmVycyB1c2VkIHRoZQo+Pj4gcGFzdCBmZXcgeWVhcnMsIHdlIHN0aWxsIG5lZWQgdGhh
dCBkdXBsaWNhdGlvbi4gU2FtZSBmb3IgdGhlIHZtYSBub2RlCj4+PiB0aGluZywgd2hpY2ggaXMg
YWxzbyBkdXBsaWNhdGVkLgo+PiBUbyBiZW1vcmUgcHJlY2lzZSBJJ2QgcHJvYmFibHkgZGVmaW5l
IGEKPj4KPj4gc3RydWN0IGRybV9ib19jb21tb24gewo+PiAgwqDCoMKgIHN0cnVjdCByZXNlcnZh
dGlvbl9vYmplY3QgcjsKPj4gIMKgwqDCoCBzdHJ1Y3QgZHJtX3ZtYV9ub2RlIHY7Cj4+IH07Cj4+
Cj4+IEVtYmVkIGl0IGluIGEgc3RydWN0IGRybV9nZW1fb2JqZWN0IChhbmQgaW4gYSBzdHJ1Y3Qg
dm13Z2Z4X2J1ZmZlcl9vYmplY3QpCj4+IGFuZCB0aGVuIGhhdmUgYSBwb2ludGVyIHRvIGEgc3Ry
dWN0IGRybV9ib19jb21tb24gaW4gdGhlIHN0cnVjdAo+PiB0dG1fYnVmZmVyX29iamVjdC4KPiBB
IHBvaW50ZXIgZG9lc24ndCBjdXQgaXQuCj4KPiBCZXNpZGUgcmVtb3ZpbmcgdGhlIGR1cGxpY2F0
aW9uIHRoZSBvdGhlciB0aGluZyBJIHdhbnQgaXMgdG8gaGF2ZSBhCj4gc3RhbmRhcmQgd2F5IG9m
IGZpbmRpbmcgdGhlIHR0bV9idWZmZXJfb2JqZWN0IGZvciBhIGdpdmVuIGRybV9nZW1fb2JqZWN0
Cj4gZm9yIGFsbCB0aGUgdHRtK2dlbSBkcml2ZXJzLiAgV2l0aCBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgYmVpbmcgZW1iZWRkZWQKPiB0aGUgdXN1YWwgY29udGFpbnRlcl9vZigpIHdpbGwgd29yay4K
Pgo+IFRoYXQnbGwgYWxsb3cgdG8gY3JlYXRlIGRybV9nZW1fdHRtX2hlbHBlci5jIHdpdGggaGVs
cGVyIGZ1bmN0aW9ucyBmb3IKPiBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MuICBGb3Igc3Rh
cnRlcnMgc29tZSBvZiB0aGUgY3VycmVudCB2cmFtCj4gaGVscGVycyBjYW4gYmVjb21lIGdlbmVy
aWMgdHRtIGhlbHBlcnMgYmVjYXVzZSB0aGV5IGxvb3NlIHRoZSBkZXBlbmRlbmN5Cj4gb24gc3Ry
dWN0IGRybV9nZW1fdnJhbV9vYmplY3QgZm9yIGZpbmRpbmcgdHRtX2J1ZmZlcl9vYmplY3QuCj4K
Pj4+PiBUaGUgdm13Z2Z4IGRyaXZlciBpcyBkb2luZyB3aGF0IGl0IGRvZXMgbW9zdGx5IGJlY2F1
c2UgYWxsIGJ1ZmZlcgo+Pj4+IG9iamVjdHMgZG8gbm90IG5lZWQgdG8gYmUgdXNlci1zcGFjZSB2
aXNpYmxlLCBhbmQgZG8gbm90IG5lZWQgdG8gYmUKPj4+PiBtYXBwZWQgYnkgdXNlci1zcGFjZS4g
QW5kIHRoZXJlIGFyZSBvdGhlciB0eXBlcyBvZiBvYmplY3RzIHRoYXQgRE8gbmVlZAo+Pj4+IHRv
IGJlIHVzZXItc3BhY2UgdmlzaWJsZSwgYW5kIHRoYXQgZG8gbmVlZCB0byBiZSBzaGFyZWQgYnkg
cHJvY2Vzc2VzLgo+Pj4+IEhlbmNlIHVzZXItc3BhY2UgdmlzaWJpbGl0eSBpcyBzb21ldGhpbmcg
dGhhdCBzaG91bGQgYmUgYWJzdHJhY3RlZCBhbmQKPj4+PiBtYWRlIGF2YWlsYWJsZSB0byB0aG9z
ZSBvYmplY3RzLiBOb3QgbHVtcGVkIHRvZ2V0aGVyIHdpdGggYWxsIG90aGVyCj4+Pj4gcG90ZW50
aWFsIGJ1ZmZlciBvYmplY3QgZnVuY3Rpb25hbGl0eS4KPiBXZWxsLCB0dG1fYnVmZmVyX29iamVj
dCBoYXMgYSB2bWFfbm9kZSBlbWJlZGRlZCwgc28gaXQgYWxyZWFkeSBpcwo+ICJsdW1wZWQgdG9n
ZXRoZXIiLiAgVGhpcyBwYXRjaCBzZXJpZXMgb25seSBtb3ZlcyBpdCBhcm91bmQgLi4uCj4KPiBj
aGVlcnMsCj4gICAgR2VyZAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
