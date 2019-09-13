Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F50B21F8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 16:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071436F3CF;
	Fri, 13 Sep 2019 14:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64436F3CF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 14:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E72E63F919;
 Fri, 13 Sep 2019 16:34:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vw_hi0fk4Ref; Fri, 13 Sep 2019 16:34:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8EF763F8F3;
 Fri, 13 Sep 2019 16:34:03 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B5C68360195;
 Fri, 13 Sep 2019 16:34:02 +0200 (CEST)
Subject: Re: [RFC PATCH 3/7] drm/ttm: TTM fault handler helpers
To: Hillf Danton <hdanton@sina.com>, Thomas Hellstrom <thellstrom@vmware.com>
References: <20190913093213.27254-1-thomas_os@shipmail.org>
 <20190913134039.3164-1-hdanton@sina.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <f26f6096-8d11-82e4-390c-d110af8fdc49@shipmail.org>
Date: Fri, 13 Sep 2019 16:34:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190913134039.3164-1-hdanton@sina.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568385242; bh=BvEPU9tGdG9Bhovi4Q0bbdW07y3/r6iPP1tQbS5B3Dg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C2N6Tpw8BPIFywM28iULu9uVwEykXdq683K3MIwLno68ImFSJZcnvmXSvgNcJIYdy
 fs4C//xIQbV9rfjigSnkNMrqRAk1fZNIyu8n47xwzegCFDax40hgZFLFcTfQR1uDnD
 U7ABEyDM6piI7eeUK+RBjldeM/OcAfSWfj7G4gTg=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=C2N6Tpw8; 
 dkim-atps=neutral
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
Cc: jglisse@redhat.com, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, linux-graphics-maintainer@vmware.com,
 Matthew Wilcox <willy@infradead.org>, Huang Ying <ying.huang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMy8xOSAzOjQwIFBNLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4gT24gRnJpLCAxMyBTZXAg
MjAxOSAxMTozMjowOSArMDIwMAo+PiAgIAllcnIgPSB0dG1fbWVtX2lvX2xvY2sobWFuLCB0cnVl
KTsKPj4gLQlpZiAodW5saWtlbHkoZXJyICE9IDApKSB7Cj4+IC0JCXJldCA9IFZNX0ZBVUxUX05P
UEFHRTsKPj4gLQkJZ290byBvdXRfdW5sb2NrOwo+PiAtCX0KPj4gKwlpZiAodW5saWtlbHkoZXJy
ICE9IDApKQo+PiArCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwo+PiAgIAllcnIgPSB0dG1fbWVt
X2lvX3Jlc2VydmVfdm0oYm8pOwo+PiAtCWlmICh1bmxpa2VseShlcnIgIT0gMCkpIHsKPj4gLQkJ
cmV0ID0gVk1fRkFVTFRfU0lHQlVTOwo+PiAtCQlnb3RvIG91dF9pb191bmxvY2s7Cj4+IC0JfQo+
PiArCWlmICh1bmxpa2VseShlcnIgIT0gMCkpCj4+ICsJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7
Cj4+Cj4gSGVoZSwgbm8gaHVycnkuCgpDb3VsZCB5b3UgYmUgYSBiaXQgbW9yZSBzcGVjaWZpYz8K
ClRoYW5rcywKClRob21hcwoKCgo+Cj4+IEBAIC0yOTUsOCArMzA3LDI4IEBAIHN0YXRpYyB2bV9m
YXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPj4gICAJcmV0ID0g
Vk1fRkFVTFRfTk9QQUdFOwo+PiAgIG91dF9pb191bmxvY2s6Cj4+ICAgCXR0bV9tZW1faW9fdW5s
b2NrKG1hbik7Cj4+IC1vdXRfdW5sb2NrOgo+PiArCXJldHVybiByZXQ7Cj4+ICt9Cj4+ICtFWFBP
UlRfU1lNQk9MKHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCk7CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
