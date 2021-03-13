Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBD339FD9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 19:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84DB6E16F;
	Sat, 13 Mar 2021 18:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6956E16F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 18:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 366CE3F96D;
 Sat, 13 Mar 2021 19:29:47 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="pOdaTqkl";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9d5UiFMOqnQ; Sat, 13 Mar 2021 19:29:46 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B0DA23F377;
 Sat, 13 Mar 2021 19:29:45 +0100 (CET)
Received: from [10.249.254.121] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F2BE2362626;
 Sat, 13 Mar 2021 19:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615660185; bh=ijUrR93Uwbe1BdTJny2m/7Q1UDGaCUegw131kUz0YM4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=pOdaTqklipWvHUrDLn2nHkoiFW/AG4YaKfg042aowOoLTM6K6T4PSZpT28hPDHtnF
 y675HBn3VULv6RypnAcaodSfe02JW8dHkJJDcXqpaILOWHzRIs6bLJ/b9NlpepnVQV
 OvpHD8801RwFKkX9y0WOqNYtm66IF2/S6K+EnUIU=
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
Date: Sat, 13 Mar 2021 19:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312093810.2202-1-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbgoKT24gMy8xMi8yMSAxMDozOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBXZSBzZWVtIHRvIGhhdmUgc29tZSBtb3JlIGRyaXZlciBidWdzIHRoYW4gdGhvdWdodC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggfCA2ICsrKystLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaAo+IGluZGV4IDRmYjUyM2RmYWIzMi4uZGY5ZmU1OTZlN2M1IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiArKysgYi9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2FwaS5oCj4gQEAgLTYwMyw5ICs2MDMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lk
IHR0bV9ib19waW4oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIHN0YXRpYyBpbmxp
bmUgdm9pZCB0dG1fYm9fdW5waW4oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIHsK
PiAgIAlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKPiAtCVdBUk5fT05fT05D
RSghYm8tPnBpbl9jb3VudCk7Cj4gICAJV0FSTl9PTl9PTkNFKCFrcmVmX3JlYWQoJmJvLT5rcmVm
KSk7Cj4gLQktLWJvLT5waW5fY291bnQ7Cj4gKwlpZiAoYm8tPnBpbl9jb3VudCkKPiArCQktLWJv
LT5waW5fY291bnQ7Cj4gKwllbHNlCj4gKwkJV0FSTl9PTl9PTkNFKHRydWUpOwo+ICAgfQo+ICAg
Cj4gICBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKClNp
bmNlIEkgbm93IGhhdmUgYmVlbiBzdGFyaW5nIGZvciBoYWxmIGEgeWVhciBhdCB0aGUgY29kZSBv
ZiB0aGUgZHJpdmVyIAp0aGF0IG1hZGUgcGlubmluZyBhbiBhcnQsIEkgaGF2ZSBhIGNvdXBsZSBv
ZiBzdWdnZXN0aW9ucyBoZXJlLCBDb3VsZCB3ZSAKdXNlIGFuIGF0b21pYyBmb3IgcGluX2NvdW50
LCBhbGxvd2luZyB1bmxvY2tlZCB1bnBpbm5pbmcgYnV0IHJlcXVpcmUgdGhlIApsb2NrIG9ubHkg
Zm9yIHBpbl9jb3VudCB0cmFuc2l0aW9uIDAtPjEsIChidXQgdW5sb2NrZWQgZm9yIApwaW5faWZf
YWxyZWFkeV9waW5uZWQpLiBJbiBwYXJ0aWN1bGFyIEkgdGhpbmsgdm13Z2Z4IHdvdWxkIGJlbmVm
aXQgZnJvbSAKdW5sb2NrZWQgdW5waW5zLiBBbHNvIGlmIHRoZSBhdG9taWMgd2VyZSBhIHJlZmNv
dW50X3QsIHRoYXQgd291bGQgCnByb2JhYmx5IGdpdmUgeW91IHRoZSBhYm92ZSBiZWhhdmlvdXI/
CgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
