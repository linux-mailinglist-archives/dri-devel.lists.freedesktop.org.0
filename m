Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4D9117B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF196EA34;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCD6E9E2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 15:10:30 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s14so2147300qkm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xzO7Mshohtsh0MjNCwtfvdaSBmY8e4joFkYT0O9y2JI=;
 b=UaZF08JAb62HN0pnPN21ax9NI5LoZmhkxseouPir3zeu6vULIMi3rGI6BVU1nqb2Kk
 vCZNiJ40liLEbbvMw+xilH6HBKL1JMzotGaRVDQ/CkUJ7lKIovKP4rl5lCHGVNpuEI00
 6AaAHKMT9p/PvktWPSz3ZB9ccqb3zzEeXJZjteorr/4zwYF5/BRKoOdTv869y8/t5SeY
 VAYmO9bP+VnIxV3HplM6PAGw+gjhcS9MQ3IMyXgiktpdsWCyWTOfGchzx4Xs0YvyVrUE
 5kUKxAKHZckCHrD8AU+dDw7yr6CxIBPrpdOBk23YfW/5khpWvbyY63D6JwYJj/Zouv6L
 js+A==
X-Gm-Message-State: APjAAAXAELmo7sW4xojv77CPoiK0Ft5u8eeBX5yjpv2qam8e81u3L0TA
 UVBupsi0zWWU1ddAIFt3jePQUw==
X-Google-Smtp-Source: APXvYqwzfXMAsx+TimK2Wq4Er/PrNLigk2R/e9axAwMI+6uwPMqruXjP4qCNTiLEsTwOHrOMXcfSYA==
X-Received: by 2002:a37:aa88:: with SMTP id t130mr4635639qke.12.1565881829208; 
 Thu, 15 Aug 2019 08:10:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i62sm1568446qke.52.2019.08.15.08.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 08:10:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyHOW-0005WZ-AT; Thu, 15 Aug 2019 12:10:28 -0300
Date: Thu, 15 Aug 2019 12:10:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815151028.GJ21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xzO7Mshohtsh0MjNCwtfvdaSBmY8e4joFkYT0O9y2JI=;
 b=lI3y7R44OI9cE4EW3AD4mdCTJlQwdhtFMnFulkuEqvQdz88hWBkf/Luz9A97zWh1WM
 6VlnHYIeU9yHzN5gLW2s6pZtC53ZcoK+QYnLyrm71HqORWm7eDtaZclaBxKxBqoBfR6a
 wQh2bKmRFu8C01tUVSEPeeZYrB6Zf+XdIvZRedLH4G7bY1xFFrYAoyZPI6cM+2j3i+UD
 ekO1QrzYXDSKJKdF9J3udmvIveoENdrM4omYutvyVHhrkIapI79MBHNcmw35rsWFNK76
 65B13pG5zrwaNbu2GbqZZmb2GB6hh98QSz3unRjRNSzvxzUILwBIuF3oriB53wVaSEzR
 S8UA==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6NDM6MzhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gWW91IGhhdmUgdG8gd2FpdCBmb3IgdGhlIGdwdSB0byBmaW5uaXNoIGN1cnJlbnQg
cHJvY2Vzc2luZyBpbgo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIE90aGVyd2lzZSB0aGVyZSdz
IG5vIHBvaW50IHRvIGFueSBvZiB0aGlzCj4gcmVhbGx5LiBTbyB0aGUgd2FpdF9ldmVudC9kbWFf
ZmVuY2Vfd2FpdCBhcmUgdW5hdm9pZGFibGUgcmVhbGx5LgoKSSBkb24ndCBlbnZ5IHlvdXIgdGFz
ayA6fAoKQnV0LCB3aGF0IHlvdSBkZXNjcmliZSBzdXJlIHNvdW5kcyBsaWtlIGEgJ3JlZ2lzdHJh
dGlvbiBjYWNoZScgbW9kZWwsCm5vdCB0aGUgJ3NoYWRvdyBwdGUnIG1vZGVsIG9mIGNvaGVyZW5j
eS4KClRoZSBrZXkgZGlmZmVyZW5jZSBpcyB0aGF0IGEgcmVnaXJzdGF0aW9uY2FjaGUgaXMgYWxs
b3dlZCB0byBiZWNvbWUKaW5jb2hlcmVudCB3aXRoIHRoZSBWTUEncyBiZWNhdXNlIGl0IGhvbGRz
IHBhZ2UgcGlucy4gSXQgaXMgYQpwcm9ncmFtbWluZyBidWcgaW4gdXNlcnNwYWNlIHRvIGNoYW5n
ZSBWQSBtYXBwaW5ncyB2aWEgbW1hcC9tdW5tYXAvZXRjCndoaWxlIHRoZSBkZXZpY2UgaXMgd29y
a2luZyBvbiB0aGF0IFZBLCBidXQgaXQgZG9lcyBub3QgaGFybSBzeXN0ZW0KaW50ZWdyaXR5IGJl
Y2F1c2Ugb2YgdGhlIHBhZ2UgcGluLgoKVGhlIGNhY2hlIGVuc3VyZXMgdGhhdCBlYWNoIGluaXRp
YXRlZCBvcGVyYXRpb24gc2VlcyBhIERNQSBzZXR1cCB0aGF0Cm1hdGNoZXMgdGhlIGN1cnJlbnQg
VkEgbWFwIHdoZW4gdGhlIG9wZXJhdGlvbiBpcyBpbml0aWF0ZWQgYW5kIGFsbG93cwpleHBlbnNp
dmUgZGV2aWNlIERNQSBzZXR1cHMgdG8gYmUgcmUtdXNlZC4KCkEgJ3NoYWRvdyBwdGUnIG1vZGVs
IChpZSBobW0pICpyZWFsbHkqIG5lZWRzIGRldmljZSBzdXBwb3J0IHRvCmRpcmVjdGx5IGJsb2Nr
IERNQSBhY2Nlc3MgLSBpZSB0cmlnZ2VyICdkZXZpY2UgcGFnZSBmYXVsdCcuIGllIHRoZQppbnZh
bGlkYXRlX3N0YXJ0IHNob3VsZCBpbmZvcm0gdGhlIGRldmljZSB0byBlbnRlciBhIGZhdWx0IG1v
ZGUgYW5kCnRoYXQgaXMgaXQuICBJZiB0aGUgZGV2aWNlIGNhbid0IGRvIHRoYXQsIHRoZW4gdGhl
IGRyaXZlciBwcm9iYWJseQpzaG91bGRuJ3QgcGVyc3VlIHRoaXMgbGV2ZWwgb2YgY29oZXJlbmN5
LiBUaGUgZHJpdmVyIHdvdWxkIHF1aWNrbHkgZ2V0CmludG8gdGhlIG1lc3N5IGxvY2tpbmcgcHJv
YmxlbXMgbGlrZSBkbWFfZmVuY2Vfd2FpdCBmcm9tIGEgbm90aWZpZXIuCgpJdCBpcyBpbXBvcnRh
bnQgdG8gaWRlbnRpZnkgd2hhdCBtb2RlbCB5b3UgYXJlIGdvaW5nIGZvciBhcyBkZWZpbmluZyBh
CidyZWdpc3RyYXRpb24gY2FjaGUnIGNvaGVyZW5jZSBleHBlY3RhdGlvbiBhbGxvd3MgdGhlIGRy
aXZlciB0byBza2lwCmJsb2NraW5nIGluIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIEFsbCBpdCBk
b2VzIGlzIGludmFsaWRhdGUgdGhlCmNhY2hlIHNvIHRoYXQgZnV0dXJlIG9wZXJhdGlvbnMgcGlj
ayB1cCB0aGUgbmV3IFZBIG1hcHBpbmcuCgpJbnRlbCdzIEhGSSBSRE1BIGRyaXZlciB1c2VzIHRo
aXMgbW9kZWwgZXh0ZW5zaXZlbHksIGFuZCBJIHRoaW5rIGl0IGlzCndlbGwgcHJvdmVuLCB3aXRo
aW4gc29tZSBsaW1pdGF0aW9ucyBvZiBjb3Vyc2UuCgpBdCBsZWFzdCwgJ3JlZ2lzdHJhdGlvbiBj
YWNoZScgaXMgdGhlIG9ubHkgdXNlIG1vZGVsIEkga25vdyBvZiB3aGVyZQppdCBpcyBhY2NlcHRh
YmxlIHRvIHNraXAgaW52YWxpZGF0ZV9yYW5nZV9lbmQuCgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
