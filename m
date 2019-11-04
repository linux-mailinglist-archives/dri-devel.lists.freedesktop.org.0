Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC8EDBFC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 10:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FEA6E25B;
	Mon,  4 Nov 2019 09:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EB06E25B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 09:58:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so16242596wrf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 01:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=A8BaA51G7E0NuLYNihqbtlcJ9Y7+alqjRVepHAHLBmg=;
 b=j2hqZgYp1vlvNcE7BvIa7NLtteHPckZrvTuPnR10Y7vKP/EsK6qgVU/KVvq5csrNe4
 yNws0mCixCUCVm77uWhD6ncSUHAXGSHh16p3QslgbBfin8aBJ7EGn+STI+5DvYbYjrKZ
 HR8dPE7nWVgZ084wNJYy1lSj03c28h+C3KH4gMdKdjnLMrw1/Z1ShUJi/nM0KsOQKmdD
 iY16RYbdDzlVb50dKHuWAuWBaIM6Zsg9SjTnbHAo/8ctnZFk/m+6PXQ+YGJEnk2uO+RM
 P1wWBILRwEutRG6vN1ykTkzPG2YTuVc16bS43pjm0r4X8B5V7FLh4t1DRIvcja4YB7r7
 u2rQ==
X-Gm-Message-State: APjAAAXtSOb38hxXtout3k0qCxduNs4YIhNDaP50Eb9P3T6FekO5uKKr
 k9hXwFXvGlz8ANlZDsvMfSGcoTYRzHo=
X-Google-Smtp-Source: APXvYqx9gMlx/nBYQFJiLnGM9utCwN2hlK4THSUfl6NdFdMdlr5+BJ1KBbr5s2fd9PdJySs05lgvLw==
X-Received: by 2002:a5d:5587:: with SMTP id i7mr22853426wrv.289.1572861506141; 
 Mon, 04 Nov 2019 01:58:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f8sm15010707wmb.37.2019.11.04.01.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 01:58:25 -0800 (PST)
Date: Mon, 4 Nov 2019 10:58:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
Message-ID: <20191104095823.GD10326@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sandeep Patil <sspatil@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025234834.28214-1-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=A8BaA51G7E0NuLYNihqbtlcJ9Y7+alqjRVepHAHLBmg=;
 b=BrDaV6e5i5vscg0RZjArHGnp85vXI7HBidGVQU4XfDed1jBLLwtq23rl+r4djHdbmw
 gZN2uH9rjlKhnmL5BpM01A3Qno/GirFRekFQv++FCnS1HIiPBKCmAbhs5VCkpY5cpZVN
 4txXYq7R/2TyJy5kVThviy6eA+MRQyCmeiqkQ=
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzJQTSArMDAwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gTm93IHRoYXQgdGhlIERNQSBCVUYgaGVhcHMgY29yZSBjb2RlIGhhcyBiZWVuIHF1ZXVl
ZCwgSSB3YW50ZWQKPiB0byBzZW5kIG91dCBzb21lIG9mIHRoZSBwZW5kaW5nIGNoYW5nZXMgdGhh
dCBJJ3ZlIGJlZW4gd29ya2luZwo+IG9uLgo+IAo+IEZvciB1c2Ugd2l0aCBBbmRyb2lkIGFuZCB0
aGVpciBHS0kgZWZmb3J0LCBpdCBpcyBkZXNpcmVkIHRoYXQKPiBETUEgQlVGIGhlYXBzIGFyZSBh
YmxlIHRvIGJlIGxvYWRlZCBhcyBtb2R1bGVzLiBUaGlzIGlzIHJlcXVpcmVkCj4gZm9yIG1pZ3Jh
dGluZyB2ZW5kb3JzIG9mZiBvZiBJT04gd2hpY2ggd2FzIGFsc28gcmVjZW50bHkgY2hhbmdlZAo+
IHRvIHN1cHBvcnQgbW9kdWxlcy4KPiAKPiBTbyB0aGlzIHBhdGNoIHNlcmllcyBzaW1wbHkgcHJv
dmlkZXMgdGhlIG5lY2Vzc2FyeSBleHBvcnRlZAo+IHN5bWJvbHMgYW5kIGFsbG93cyB0aGUgc3lz
dGVtIGFuZCBDTUEgZHJpdmVycyB0byBiZSBidWlsdAo+IGFzIG1vZHVsZXMuCj4gCj4gRHVlIHRv
IHRoZSBmYWN0IHRoYXQgZG1hYnVmJ3MgYWxsb2NhdGVkIGZyb20gYSBoZWFwIG1heQo+IGJlIGlu
IHVzZSBmb3IgcXVpdGUgc29tZSB0aW1lLCB0aGVyZSBpc24ndCBhIHdheSB0byBzYWZlbHkKPiB1
bmxvYWQgdGhlIGRyaXZlciBvbmNlIGl0IGhhcyBiZWVuIGxvYWRlZC4gVGh1cyB0aGVzZQo+IGRy
aXZlcnMgZG8gbm8gaW1wbGVtZW50IG1vZHVsZV9leGl0KCkgZnVuY3Rpb25zIGFuZCB3aWxsCj4g
c2hvdyB1cCBpbiBsc21vZCBhcyAiW3Blcm1hbmVudF0iCj4gCj4gRmVlZGJhY2sgYW5kIHRob3Vn
aHRzIG9uIHRoaXMgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKCkRvIHdlIGFjdHVhbGx5
IHdhbnQgdGhpcz8KCkkgZmlndXJlZCBpZiB3ZSBqdXN0IHN0YXRlIHRoYXQgdmVuZG9ycyBzaG91
bGQgc2V0IHVwIGFsbCB0aGUgcmlnaHQKZG1hLWJ1ZiBoZWFwcyBpbiBkdCwgaXMgdGhhdCBub3Qg
ZW5vdWdoPwoKRXhwb3J0aW5nIHN5bWJvbHMgZm9yIG5vIHJlYWwgaW4tdHJlZSB1c2VycyBmZWVs
cyBmaXNoeS4KLURhbmllbAoKPiAKPiB0aGFua3MKPiAtam9obgo+IAo+IENjOiBMYXVyYSBBYmJv
dHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWlu
LmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFBy
YXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8
QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+IENjOiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+
Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IFl1
ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Cj4gQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXgu
aWJtLmNvbT4KPiBDYzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+Cj4gQ2M6IEFsaXN0
YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KPiBDYzogU2FuZGVlcCBQYXRpbCA8
c3NwYXRpbEBnb29nbGUuY29tPgo+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xl
LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IAo+IEpvaG4gU3R1
bHR6ICgxKToKPiAgIGRtYS1idWY6IGhlYXBzOiBBbGxvdyBzeXN0ZW0gJiBjbWEgaGVhcHMgdG8g
YmUgY29uZmlndXJlZCBhcyBhIG1vZHVsZXMKPiAKPiBTYW5kZWVwIFBhdGlsICgxKToKPiAgIG1t
OiBjbWE6IEV4cG9ydCBjbWEgc3ltYm9scyBmb3IgY21hIGhlYXAgYXMgYSBtb2R1bGUKPiAKPiAg
ZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMgICAgICAgICAgIHwgMiArKwo+ICBkcml2ZXJzL2Rt
YS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICAgfCA0ICsrLS0KPiAgZHJpdmVycy9kbWEtYnVmL2hl
YXBzL2hlYXAtaGVscGVycy5jIHwgMiArKwo+ICBrZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYyAgICAg
ICAgICAgICAgfCAxICsKPiAgbW0vY21hLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
NSArKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gLS0gCj4gMi4xNy4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
