Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A22CBAA7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244326EB69;
	Fri,  4 Oct 2019 12:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7986EB68;
 Fri,  4 Oct 2019 12:39:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l3so6991275wru.7;
 Fri, 04 Oct 2019 05:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+pseJbkmmDayD6+Jn87ClcbkQZcbbnaCL4Buh3G3qjM=;
 b=pXWdqsKaZaeKsLTW8M5Bn8BXUETaaRFaxxt/tbAn7KODuAgKlG7emorTekavpIYiSr
 6YpesEKc1o+pDeglRxs2qS1oekQbH5Pne3Ra/txmGDFgoSivQI99zzrBYIzi+3/+tYaR
 iWTKGv8k2akQhO0jtGIMk7jmYAYkxqoR4078CjSXO4TTXQOaN/Wh0zm6Yla2uEFzzP9y
 WfeW2cprsByWYmgxgKWMrGffOJqsY0MpRPD0POSV6R+E2+6XIZgnbtZZ3trijmayRtZa
 ycuj/SdOhbEltj0BcM3Ye7HGTEmt+PTaD3nghAiEUagLWMglBG6mUihESICpD5nPE3+B
 WUOw==
X-Gm-Message-State: APjAAAUvBkN1elBl2WmwIHx1w+eSROjovnl/JyDkN4aqq5hvY2dYsRTM
 q7ISwOhOVKS8O4KNx2GrB8M=
X-Google-Smtp-Source: APXvYqxS6UQ2bnKgNuObVtiLOcssLnA6+jvl5KiXC3jViySnaZ7X43QXzYkaXntWj7e4NjMxK9d0eQ==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr12081882wrn.308.1570192783261; 
 Fri, 04 Oct 2019 05:39:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a2sm2607667wrt.45.2019.10.04.05.39.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Oct 2019 05:39:42 -0700 (PDT)
Subject: Re: [PATCH 03/11] drm/amdgpu: convert amdgpu_vm_it to half closed
 intervals
To: Michel Lespinasse <walken@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-4-dave@stgolabs.net>
 <dc9cc8c4-7275-43be-5bed-91384e3246ae@amd.com>
 <20191004113628.GA260828@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <232710bd-dc54-9d77-6f0f-24a91a28cbf6@gmail.com>
Date: Fri, 4 Oct 2019 14:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004113628.GA260828@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+pseJbkmmDayD6+Jn87ClcbkQZcbbnaCL4Buh3G3qjM=;
 b=Tlq12npjJdGVRcZaaPRBmG1UulkC6ZNwLepKNYSEfIo0Qh6MeOhT7tRWrZBPNSPw5M
 aaeSYYvt6/iEBMJIPNczjKEeCdPcMIsW4dfZQoAPmURw4qMo15KUa/UFTxT9eNhZH0J8
 XJnZ/hiTVceeN4eKrbpjrNYAnoNJTOGbC+J4YjyHn+2wjS+ufM0jhrncj29Z6uNcDKNd
 M5fdcy8iq3vHGNhQ2TkpQ8eLxTztVtSMW6kqpDFFWfSwaREahz5/237RIOOM2bGFe9fU
 R0IA9BPZjnxxXj9y3hDHCF03ZfA0zB8RDKUzTmznMeJYwSXBbVJ7VJmjyVm93RAJZwKn
 M1nA==
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGVsLAoKQW0gMDQuMTAuMTkgdW0gMTM6MzYgc2NocmllYiBNaWNoZWwgTGVzcGluYXNz
ZToKPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwNjo1NDo1NEFNICswMDAwLCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPj4gQW0gMDMuMTAuMTkgdW0gMjI6MTggc2NocmllYiBEYXZpZGxvaHIg
QnVlc286Cj4+PiBUaGUgYW1kZ3B1X3ZtIGludGVydmFsIHRyZWUgcmVhbGx5IHdhbnRzIFthLCBi
KSBpbnRlcnZhbHMsCj4+IE5BSywgd2UgZXhwbGljaXRseSBkbyBuZWVkIGFuIFthLCBiWyBpbnRl
cnZhbCBoZXJlLgo+IEhpIENocmlzdGlhbiwKPgo+IEp1c3Qgd2FudGVkIHRvIGNvbmZpcm0gd2hl
cmUgeW91IHN0YW5kIG9uIHRoaXMgcGF0Y2gsIHNpbmNlIEkgdGhpbmsKPiB5b3UgcmVjb25zaWRl
cmVkIHlvdXIgaW5pdGlhbCBwb3NpdGlvbiBhZnRlciBmaXJzdCBsb29raW5nIGF0IDkvMTEKPiBm
cm9tIHRoaXMgc2VyaWVzLgo+Cj4gSSBkbyBub3Qga25vdyB0aGUgYW1kZ3B1IGNvZGUgd2VsbCwg
YnV0IEkgdGhpbmsgdGhlIGNoYW5nZXMgc2hvdWxkIGJlCj4gZmluZSAtIGluIHN0cnVjdCBhbWRn
cHVfYm9fdmFfbWFwcGluZywgdGhlICJlbmQiIGZpZWxkIHdpbGwgaG9sZCB3aGF0Cj4gd2FzIHBy
ZXZpb3VzbHkgc3RvcmVkIGluIHRoZSAibGFzdCIgZmllbGQsIHBsdXMgb25lLiBUaGUgZXhwZWN0
YXRpb24KPiBpcyB0aGF0IG92ZXJmbG93cyBzaG91bGQgbm90IGJlIGFuIGlzc3VlIHRoZXJlLCBh
cyAiZW5kIiBpcyBleHBsaWNpdGx5Cj4gZGVjbGFyZWQgYXMgYW4gdWludDY0LCBhbmQgYXMgdGhl
IGNvZGUgd2FzIHByZXZpb3VzbHkgY29tcHV0aW5nCj4gImxhc3QgKyAxIiBpbiBtYW55IHBsYWNl
cy4KPgo+IERvZXMgdGhhdCBzZWVtIHdvcmthYmxlIHRvIHlvdSA/CgpObywgd2UgY29tcHV0ZWQg
bGFzdCArIDEgaW4gYSBjb3VwbGUgb2YgZGVidWcgcGxhY2VzIHdlcmUgaXQgZG9lc24ndCAKaHVy
dCB1cyBhbmQgSUlSQyB3ZSBjdXJyZW50bHkgY2hlYXQgYSBiaXQgYmVjYXVzZSB3ZSB1c2UgcGZu
IGluc3RlYWQgb2YgCmFkZHJlc3NlcyBvbiBzb21lIG90aGVyIHBsYWNlcy4KCkJ1dCB0aGF0IGlz
IG9ubHkgYSBsZWZ0b3ZlciBmcm9tIHJhZGVvbiBhbmQgd2UgbmVlZCB0byBmaXggdGhhdCBzb29u
ZXIgCm9yIGxhdGVyLCBjYXVzZSBlc3NlbnRpYWxseSB0aGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFj
ZSBvZiB0aGUgZGV2aWNlIGlzIApyZWFsbHkgZnVsbCA2NGJpdHMsIGUuZy4gMHgwLTB4ZmZmZmZm
ZmZmZmZmZmZmZi4KClNvIHRoYXQgb25seSBmaXRzIGludG8gYSA2NGJpdCBpbnQgd2hlbiB3ZSB1
c2UgaGFsZiBvcGVuL2Nsb3NlZCAKaW50ZXJ2YWxzLCBidXQgd291bGQgd3JhcCBhcm91bmQgdG8g
emVybyBpZiB3ZSB1c2UgYSBjbG9zZWQgaW50ZXJ2YWwuCgpJIGluaXRpYWxseSB0aG91Z2h0IHRo
YXQgdGhlIHNldCB3YXMgY2hhbmdpbmcgdGhlIGludGVydmFsIHRyZWUgaW50byAKYWx3YXlzIHVz
aW5nIGEgY2xvc2VkIGludGVydmFsLCBidXQgdGhhdCBzZWVtcyB0byBoYXZlIGJlZW4gYSAKbWlz
dW5kZXJzdGFuZGluZy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBUaGFua3MsCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
