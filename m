Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18777482B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A486E689;
	Thu, 25 Jul 2019 07:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDB86E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:08:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r6so34477965qkc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZLdMBcqFGKnya02V6xTsnoJZW3Z9hdAyMDyBEEBYZwk=;
 b=Zdgm2bEnOdb3zw4yOFqx/5Y8r1gVfOtOVThpHLuOePd0qxa1ngeAsb6erTHAZCuWX6
 HZO3WsLUcJTynUz3roM5shfX41wYXmISUq9LWAv4Ifqaf1QOxEgdBJdtYNm6DQAH5cG2
 78QhFovunkUHt0+73HZL02LCClqTClCc5k4pH/A//74TEmen+9kNzqFq4YueJrFuy1vU
 lYUV2rHWKS6RSUMFbzKygN9bFR6zdGloksqH1PNXmr8Y9f8LeRZKfA4pUkEuCSdLocz9
 b43YHpVPgpqyrtvHOW2e+hRZYV/ZB+MWxeegKcQ+GruI68DPyCxaxUWRLX+hrmR8gZAr
 rSJg==
X-Gm-Message-State: APjAAAVk23F3eapuLAHiEtl4QOwLIcuRMa3XrfhvuvBQ1WE7kg6ENNri
 RhtK83WeRC8w983TkDgyvRDwcw==
X-Google-Smtp-Source: APXvYqyUhibTemqaI03gwtS61w99gAgQQ5F/eG0mK+lhyla7PrZjk1HOKK+XfNVnKzTJUkkmUlG2cg==
X-Received: by 2002:a37:f511:: with SMTP id l17mr50579291qkk.99.1563991718206; 
 Wed, 24 Jul 2019 11:08:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s25sm20315125qkm.130.2019.07.24.11.08.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 11:08:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqLgr-0003X8-9P; Wed, 24 Jul 2019 15:08:37 -0300
Date: Wed, 24 Jul 2019 15:08:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724180837.GF28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724175858.GC6410@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZLdMBcqFGKnya02V6xTsnoJZW3Z9hdAyMDyBEEBYZwk=;
 b=S7rUKC1hP1+ZhH3UP11jol99wjJrkdHFHWPmbPAsoHGA2OkbYAPGgChi4JgYRiKTlA
 ivkNkOjRFM1AWz0SOCeFg5IZu82LX7zT++0UHabmT6tlcapyF4hoi2yEd0kJkX0Zlhuy
 G5oemA8Fh1PR4M52mRNWhYmvibd37x0ivsWhY4xHbfKNpzeW6GAUBSsZmYlfnypzgdEv
 ff4NbVY5PS4zXE2RFmZUCL7xJBpQvmsMEiwwnmerSY+eEnHKSvxQQLgDJjkdMEzRg93N
 trKhYFepum43PWTaenbut+z5hDtDVd/KJNIZMG3RMka+hN7laWuvWymC+OG9kplFGJNI
 o0eA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDc6NTg6NThQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFdlZCAyNC0wNy0xOSAxMjoyODo1OCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDk6MDU6NTNBTSArMDIwMCwgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiA+IExvb2tzIGdvb2Q6Cj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiA+IAo+ID4gPiBPbmUgY29tbWVudCBv
biBhIHJlbGF0ZWQgY2xlYW51cDoKPiA+ID4gCj4gPiA+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5
KG1pcnJvciwgJmhtbS0+bWlycm9ycywgbGlzdCkgewo+ID4gPiA+ICAJCWludCByYzsKPiA+ID4g
PiAgCj4gPiA+ID4gLQkJcmMgPSBtaXJyb3ItPm9wcy0+c3luY19jcHVfZGV2aWNlX3BhZ2V0YWJs
ZXMobWlycm9yLCAmdXBkYXRlKTsKPiA+ID4gPiArCQlyYyA9IG1pcnJvci0+b3BzLT5zeW5jX2Nw
dV9kZXZpY2VfcGFnZXRhYmxlcyhtaXJyb3IsIG5yYW5nZSk7Cj4gPiA+ID4gIAkJaWYgKHJjKSB7
Cj4gPiA+ID4gLQkJCWlmIChXQVJOX09OKHVwZGF0ZS5ibG9ja2FibGUgfHwgcmMgIT0gLUVBR0FJ
TikpCj4gPiA+ID4gKwkJCWlmIChXQVJOX09OKG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUo
bnJhbmdlKSB8fAo+ID4gPiA+ICsJCQkgICAgcmMgIT0gLUVBR0FJTikpCj4gPiA+ID4gIAkJCQlj
b250aW51ZTsKPiA+ID4gPiAgCQkJcmV0ID0gLUVBR0FJTjsKPiA+ID4gPiAgCQkJYnJlYWs7Cj4g
PiA+IAo+ID4gPiBUaGlzIG1hZ2ljIGhhbmRsaW5nIG9mIGVycm9yIHNlZW1zIG9kZC4gIEkgdGhp
bmsgd2Ugc2hvdWxkIG1lcmdlIHJjIGFuZAo+ID4gPiByZXQgaW50byBvbmUgdmFyaWFibGUgYW5k
IGp1c3QgYnJlYWsgb3V0IGlmIGFueSBlcnJvciBoYXBwZW5zIGluc3RlYWQKPiA+ID4gb3IgY2xh
aW1pbmcgaW4gdGhlIGNvbW1lbnRzIC1FQUdBSU4gaXMgdGhlIG9ubHkgdmFsaWQgZXJyb3IgYW5k
IHRoZW4KPiA+ID4gaWdub3JpbmcgYWxsIG90aGVycyBoZXJlLgo+ID4gCj4gPiBUaGUgV0FSTl9P
TiBpcyBlbmZvcmNpbmcgdGhlIHJ1bGVzIGFscmVhZHkgY29tbWVudGVkIG5lYXIKPiA+IG1tdXVf
bm90aWZpZXJfb3BzLmludmFsaWRhdGVfc3RhcnQgLSB3ZSBjb3VsZCBicmVhayBvciBjb250aW51
ZSwgaXQKPiA+IGRvZXNuJ3QgbXVjaCBtYXR0ZXIgaG93IHRvIHJlY292ZXIgZnJvbSBhIGJyb2tl
biBkcml2ZXIsIGJ1dCBzaW5jZSB3ZQo+ID4gZGlkIHRoZSBXQVJOX09OIHRoaXMgc2hvdWxkIHNh
bml0aXplIHRoZSByZXQgdG8gRUFHQUlOIG9yIDAKPiA+IAo+ID4gSHVtbS4gQWN0dWFsbHkgaGF2
aW5nIGxvb2tlZCB0aGlzIHNvbWUgbW9yZSwgSSB3b25kZXIgaWYgdGhpcyBpcyBhCj4gPiBwcm9i
bGVtOgo+ID4gCj4gPiBJIHNlZSBpbiBfX29vbV9yZWFwX3Rhc2tfbW0oKToKPiA+IAo+ID4gCQkJ
aWYgKG1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X25vbmJsb2NrKCZyYW5nZSkp
IHsKPiA+IAkJCQl0bGJfZmluaXNoX21tdSgmdGxiLCByYW5nZS5zdGFydCwgcmFuZ2UuZW5kKTsK
PiA+IAkJCQlyZXQgPSBmYWxzZTsKPiA+IAkJCQljb250aW51ZTsKPiA+IAkJCX0KPiA+IAkJCXVu
bWFwX3BhZ2VfcmFuZ2UoJnRsYiwgdm1hLCByYW5nZS5zdGFydCwgcmFuZ2UuZW5kLCBOVUxMKTsK
PiA+IAkJCW1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX2VuZCgmcmFuZ2UpOwo+ID4gCj4g
PiBXaGljaCBsb29rcyBsaWtlIGl0IGNyZWF0ZXMgYW4gdW5iYWxhbmNlZCBzdGFydC9lbmQgcGFp
cmluZyBpZiBhbnkKPiA+IHN0YXJ0IHJldHVybnMgRUFHQUlOPwo+ID4gCj4gPiBUaGlzIGRvZXMg
bm90IHNlZW0gT0suLiBNYW55IHVzZXJzIHJlcXVpcmUgc3RhcnQvZW5kIHRvIGJlIHBhaXJlZCB0
bwo+ID4ga2VlcCB0cmFjayBvZiB0aGVpciBpbnRlcm5hbCBsb2NraW5nLiBJZSBmb3IgaW5zdGFu
Y2UgaG1tIGJyZWFrcwo+ID4gYmVjYXVzZSB0aGUgaG1tLT5ub3RpZmllcnMgY291bnRlciBiZWNv
bWVzIHVuYWJsZSB0byBnZXQgdG8gMC4KPiA+IAo+ID4gQmVsb3cgaXMgdGhlIGJlc3QgaWRlYSBJ
J3ZlIGhhZCBzbyBmYXIuLgo+ID4gCj4gPiBNaWNoYWwsIHdoYXQgZG8geW91IHRoaW5rPwo+IAo+
IElJUkMgd2UgaGF2ZSBkaXNjdXNzZWQgdGhpcyB3aXRoIEplcm9tZSBiYWNrIHRoZW4gd2hlbiBJ
J3ZlIGludHJvZHVjZWQKPiB0aGlzIGNvZGUgYW5kIHVubGVzcyBJIG1pc3JlbWVtYmVyIGhlIHNh
aWQgdGhlIGN1cnJlbnQgY29kZSB3YXMgT0suCgpOb3BlLCBpdCBoYXMgYWx3YXlzIGJlZW4gYnJv
a2VuLgoKPiBNYXliZSBuZXcgdXNlcnMgaGF2ZSBzdGFydGVkIHJlbHlpbmcgb24gYSBuZXcgc2Vt
YW50aWMgaW4gdGhlIG1lYW50aW1lLAo+IGJhY2sgdGhlbiwgbm9uZSBvZiB0aGUgbm90aWZpZXIg
aGFzIGV2ZW4gc3RhcnRlZCBhbnkgYWN0aW9uIGluIGJsb2NraW5nCj4gbW9kZSBvbiBhIEVBR0FJ
TiBiYWlsb3V0LiBNb3N0IG9mIHRoZW0gc2ltcGx5IGRpZCB0cnlsb2NrIGVhcmx5IGluIHRoZQo+
IHByb2Nlc3MgYW5kIGJhaWxlZCBvdXQgc28gdGhlcmUgd2FzIG5vdGhpbmcgdG8gZG8gZm9yIHRo
ZSByYW5nZV9lbmQKPiBjYWxsYmFjay4KClNpbmdsZSBub3RpZmllcnMgYXJlIG5vdCB0aGUgcHJv
YmxlbS4gSSB0cmllZCB0byBtYWtlIHRoaXMgY2xlYXIgaW4KdGhlIGNvbW1pdCBtZXNzYWdlLCBi
dXQgbGV0cyBiZSBtb3JlIGV4cGxpY2l0LgoKV2UgaGF2ZSAqdHdvKiBub3RpZmllcnMgcmVnaXN0
ZXJlZCB0byB0aGUgbW0sIEEgYW5kIEI6CgpBIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQ6IChoYXMg
bm8gYmxvY2tpbmcpCiAgICBzcGluX2xvY2soKQogICAgY291bnRlcisrCiAgICBzcGluX3VubG9j
aygpCgpBIGludmFsaWRhdGVfcmFuZ2VfZW5kOgogICAgc3Bpbl9sb2NrKCkKICAgIGNvdW50ZXIt
LQogICAgc3Bpbl91bmxvY2soKQoKQW5kIHRoaXMgb25lOgoKQiBpbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0OiAoaGFzIGJsb2NraW5nKQogICAgaWYgKCF0cnlfbXV0ZXhfbG9jaygpKQogICAgICAgIHJl
dHVybiAtRUFHQUlOOwogICAgY291bnRlcisrCiAgICBtdXRleF91bmxvY2soKQoKQiBpbnZhbGlk
YXRlX3JhbmdlX2VuZDoKICAgIHNwaW5fbG9jaygpCiAgICBjb3VudGVyLS0KICAgIHNwaW5fdW5s
b2NrKCkKClNvIG5vdyB0aGUgb29tIHBhdGggZG9lczoKCmludmFsaWRhdGVfcmFuZ2Vfc3RhcnRf
bm9uX2Jsb2NraW5nOgogZm9yIGVhY2ggbW46CiAgIGEtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQK
ICAgYi0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydAogICByYyA9IEVBR0FJTgoKTm93IHdlIFNLSVAg
QSdzIGludmFsaWRhdGVfcmFuZ2VfZW5kIGV2ZW4gdGhvdWdoIEEgaGFkIG5vIGlkZWEgdGhpcwp3
b3VsZCBoYXBwZW4gaGFzIHN0YXRlIHRoYXQgbmVlZHMgdG8gYmUgdW53b3VuZC4gQSBpcyBicm9r
ZW4uCgpCIHN1cnZpdmVkIGp1c3QgZmluZS4KCkEgYW5kIEIgKmFsb25lKiB3b3JrIGZpbmUsIGNv
bWJpbmVkIHRoZXkgZmFpbC4KCldoZW4gdGhlIGNvbW1pdCB3YXMgbGFuZGVkIHlvdSBjYW4gdXNl
IEtWTSBhcyBhbiBleGFtcGxlIG9mIEEgYW5kIFJETUEKT0RQIGFzIGFuIGV4YW1wbGUgb2YgQgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
