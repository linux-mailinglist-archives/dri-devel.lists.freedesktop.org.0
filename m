Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B399F1A211D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CC989DC9;
	Wed,  8 Apr 2020 12:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09489DC9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0AE723F51A;
 Wed,  8 Apr 2020 14:01:44 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=gpAcmKuO; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lggwzlOmZHFD; Wed,  8 Apr 2020 14:01:43 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D73673F4B0;
 Wed,  8 Apr 2020 14:01:42 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DA78A360153;
 Wed,  8 Apr 2020 14:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586347301; bh=iYXBddQRieutZJtwqJOa8w/8Jay2zYs2qvwKvN4GbvM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gpAcmKuOKQDRSCi+T8HzzA0H/CjesM7QQvvNf8l2TBO6+LpJ5LgL8rluxBOwuiofF
 PhoWFFVt9rVC701Wz83VUyb8oR3twZqFPBfoPsWbKSpjEUuKurSlyIZFUae5mnPLhQ
 yYMzul82TYQpMGOXnOYvCwSBWUwyxFfY1TtsmJ2I=
Subject: Re: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
To: dri-devel@lists.freedesktop.org
References: <20200408115331.5529-1-thomas_os@shipmail.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <f7408653-39a1-e234-c45d-7a786e043b8f@shipmail.org>
Date: Wed, 8 Apr 2020 14:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200408115331.5529-1-thomas_os@shipmail.org>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbiwKCk9uIDQvOC8yMCAxOjUzIFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13
YXJlKSB3cm90ZToKPiBGcm9tOiAiVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSIgPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+Cj4KPiBXaXRoIGFtZGdwdSBhbmQgQ09ORklHX1RSQU5TUEFSRU5UX0hV
R0VQQUdFX0FMV0FZUz15LCB0aGVyZSBhcmUKPiBlcnJvcnMgbGlrZToKPiBCVUc6IG5vbi16ZXJv
IHBndGFibGVzX2J5dGVzIG9uIGZyZWVpbmcgbW0KPiBhbmQ6Cj4gQlVHOiBCYWQgcnNzLWNvdW50
ZXIgc3RhdGUKPiB3aXRoIFRUTSB0cmFuc3BhcmVudCBodWdlLXBhZ2VzLgo+IFVudGlsIHdlJ3Zl
IGZpZ3VyZWQgb3V0IHdoYXQgb3RoZXIgVFRNIGRyaXZlcnMgZG8gZGlmZmVyZW50bHkgY29tcGFy
ZWQgdG8KPiB2bXdnZngsIGRpc2FibGUgdGhlIGh1Z2VfZmF1bHQoKSBjYWxsYmFjaywgZWxpbWlu
YXRpbmcgdHJhbnNodWdlCj4gcGFnZS10YWJsZSBlbnRyaWVzLgo+Cj4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
SGVsbHN0cm9tIChWTXdhcmUpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+IFJlcG9ydGVkLWJ5
OiBBbGV4IFh1IChIZWxsbzcxKSA8YWxleF95X3h1QHlhaG9vLmNhPgo+IFRlc3RlZC1ieTogQWxl
eCBYdSAoSGVsbG83MSkgPGFsZXhfeV94dUB5YWhvby5jYT4KPiAtLS0KCldpdGhvdXQgYmVpbmcg
YWJsZSB0byB0ZXN0IGFuZCB0cmFjayB0aGlzIGRvd24gb24gYW1kZ3B1IHRoZXJlJ3MgbGl0dGxl
IAptb3JlIHRoYW4gdGhpcyBJIGNhbiBkbyBhdCB0aGUgbW9tZW50LiBIb3BlZnVsbHkgSSdsbCBi
ZSBhYmxlIHRvIHRlc3Qgb24gCm5vdXZlYXUvdHRtIGFmdGVyIGdldHRpbmcgYmFjayBmcm9tIHZh
Y2F0aW9uIHRvIHNlZSBpZiBJIGNhbiByZXByb2R1Y2UuCgpJdCBsb29rcyBsaWtlIHNvbWUgcGFy
dCBvZiB0aGUga2VybmVsIG1pc3Rha2VzIGEgaHVnZSBwYWdlLXRhYmxlIGVudHJ5IApmb3IgYSBw
YWdlIGRpcmVjdG9yeSwgYW5kIHRoYXQgd291bGQgYmUgYSBwYXRoIHRoYXQgaXMgbm90IGhpdCB3
aXRoIHZtd2dmeC4KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
