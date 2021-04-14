Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2F35EC44
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 07:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3DD6E0CB;
	Wed, 14 Apr 2021 05:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363A26E0CB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 05:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 4B0574240B;
 Wed, 14 Apr 2021 07:36:16 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ICcGx9H5; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yOstcpOwOTW; Wed, 14 Apr 2021 07:36:15 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A2C504240A;
 Wed, 14 Apr 2021 07:36:13 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C5865361DD8;
 Wed, 14 Apr 2021 07:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1618378573; bh=YRLxunl8NSLOM3T+5KlP0Fp96RhEjfVnDr/qcGR1FMc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ICcGx9H5JyS9D6FR/DCcrMvNiazv7jqvV+HdC10894OpkgfUl4OeL6ygONiN1F6yj
 0ZuPVH4/3T+3GZe9jKitsEvXsA3Cx7xT3AjKE7ttza6HQBpQx42FP7xz1P/6rNXe6v
 0iVgt6A4+obbeO5uloS35v3srAVnZWXqr3eYCRpQ=
Subject: Re: [PATCH v3] drm/vmwgfx: Make sure bo's are unpinned before putting
 them back
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210413205938.788366-1-zackr@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <541dbdc0-74a8-34ba-e082-2d0c3939a9c9@shipmail.org>
Date: Wed, 14 Apr 2021 07:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413205938.788366-1-zackr@vmware.com>
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFphY2ssCgpPbiA0LzEzLzIxIDEwOjU5IFBNLCBaYWNrIFJ1c2luIHdyb3RlOgo+IER1cmlu
ZyBjb3RhYmxlIHJlc2l6ZSB3ZSBwaW4gdGhlIGJhY2t1cCBidWZmZXIgdG8gbWFrZSBzdXJlIHRo
ZQo+IHRyeWxvY2sgZG9lc24ndCBmYWlsLiBXZSB3ZXJlIG5ldmVyIHVucGlubmluZyB0aGUgYmFj
a3VwIGJ1ZmZlcgo+IHJlc3VsdGluZyBpbiBldmVyeSBzdWJzZXF1ZW50IGNvdGFibGUgcmVzaXpl
IHRyeWluZyB0byByZWxlYXNlIGEKPiBwaW5uZWQgYm8uIEFmdGVyIHdlIGNvcHkgdGhlIG9sZCBi
YWNrdXAgdG8gdGhlIG5ldyB3ZSBjYW4gcmVsZWFzZQo+IHRoZSBwaW4uCj4gTW9iJ3MgYXJlIGFs
d2F5cyBwaW5uZWQgc28gd2UganVzdCBoYXZlIHRvIG1ha2Ugc3VyZSB3ZSB1bnBpbgo+IHRoZW0g
YmVmb3JlIHJlbGVhc2luZyB0aGVtLgo+Cj4gQ2M6IE1hcnRpbiBLcmFzdGV2IDxrcmFzdGV2bUB2
bXdhcmUuY29tPgo+IENjOiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4K
PiBGaXhlczogZDFhNzNjNjQxYWZkICgiZHJtL3Ztd2dmeDogTWFrZSBzdXJlIHdlIHVucGluIG5v
IGxvbmdlciBuZWVkZWQgYnVmZmVycyIpCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgoKTEdU
TSwKClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hp
cG1haWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
