Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F86F9B2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 08:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3689AC6;
	Mon, 22 Jul 2019 06:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E08B89A74;
 Mon, 22 Jul 2019 06:51:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x4so38066399wrt.6;
 Sun, 21 Jul 2019 23:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YaZ2A8DE5OwkEiTUYNRrfqKt9i4ZoD/O6+Gq8bu7WRU=;
 b=TN+zNpz9ItOadsDhBmzUsTWoWoIWZXeO67sXV3CDs13dst63gkoxhRi30aEWWFwzvG
 E7DdUl3Eoacv7xOMK+JOIbr6a8hJXT2KZ+T7Ungvkd2RCga+S2ZeP3DnpRweCGgCWnDh
 kPd2msNiXw8SUAeeL3i4pj6ndBl84ioJbDvHkx3FYVJcMdHini6tDtkSgKlnPBMZjZKj
 5YzHeL9PhKoT0ZKVYytmb4Rvn1HEl5aj01+8VIAay8iIscAJti51Kz4aEfIDAZBCv8aC
 laWkqZzy3yzoudGPwWbcQGoQTLRrBj5pNORT+vmEFcuYi6DHLSMWMrOjWapRgV1iwfon
 dDaw==
X-Gm-Message-State: APjAAAVxr8Xywk8CVZ5nH1LoTOfqKR6wsMKEdCRzLDP8Kn6v92JJazt1
 RVX3P8oxVsZKzKJi2rgZgndFUWv7
X-Google-Smtp-Source: APXvYqzx05PgDg6grvAV9kAS8e6GgNxsJ5cM9znIL1FKlgqtz/rNmsUeTK17gXy4TBJftfaAeY3BUg==
X-Received: by 2002:adf:e691:: with SMTP id r17mr37815608wrm.67.1563778299785; 
 Sun, 21 Jul 2019 23:51:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b2sm49351906wrp.72.2019.07.21.23.51.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Jul 2019 23:51:39 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/amdgpu: Add flag to wipe VRAM on release
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190719220140.18968-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b1a17391-4a35-809b-beb9-b12ebce1a3e1@gmail.com>
Date: Mon, 22 Jul 2019 08:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719220140.18968-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YaZ2A8DE5OwkEiTUYNRrfqKt9i4ZoD/O6+Gq8bu7WRU=;
 b=PL4CZEKfTb0qLOlO8WLGz/wVSOWt2dfA6+EunGzyIIb3TZG2z6EQGOHxaYk8wanisa
 Nw3PCkwfxotInr7qpkikrZdJ9CvR7q1WiD0PV2tvpQJiJ6/rckH3RqYthJ4p4mu0faIM
 4PxvvY7m5efmJYo+WzW6MuPMPYWtWvK3QEbNItfxqsEH+ftTgm9wjJGqkOsZILLP75Xl
 ntwfI7sXiNtbz2GgoPVI9SqTDNNR097/I4BwEIGtLyDN5uP1JQw1CBR/gye9lR3/cRPB
 M/dV7l2S4+MmUNk8CnVTy3bW8pYgEV5sgU2T2LTgvEj49rKvuuKZzM+b78MUoFkb2g5y
 XdKg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDcuMTkgdW0gMDA6MDIgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gVGhpcyBtZW1v
cnkgYWxsb2NhdGlvbiBmbGFnIHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3MgY29udGFpbmlu
Zwo+IHNlbnNpdGl2ZSBkYXRhIHRoYXQgc2hvdWxkIG5vdCBiZSBsZWFrZWQgdG8gb3RoZXIgcHJv
Y2Vzc2VzLgoKSnVzdCBhIG5pdCBwaWNrLCBidXQgSSB3b3VsZCByZW9yZGVyIHRoZSBzZXJpZXMg
YW5kIG1ha2UgcGF0Y2ggIzMgdGhlIApmaXJzdCBhbmQgIzIgdGhlIGxhc3Qgb25lLgoKSnVzdCB0
byBoYXZlIGEgY2xlYW4gb3JkZXIgYmV0d2VlbiBhZGRpbmcgdGhlIGNhbGxiYWNrIHRvIHRoZSBU
VE0gY29kZSwgCmltcGxlbWVudGluZyB0aGUgbmV3IGZsYWcgYW5kIHVzaW5nIGl0IGFzIGxhc3Qg
c3RlcC4KCkFwYXJ0IGZyb20gdGhhdCB0aGUgc2VyaWVzIGlzIFJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KClJlZ2FyZHMsCkNocmlzdGlh
bi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgNCArKysrCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+
IGluZGV4IGQ0OTU3MWRhYjJhMS4uY2E5N2I2ODAyMjc1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
dWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJt
LmgKPiBAQCAtMTMxLDYgKzEzMSwxMCBAQCBleHRlcm4gIkMiIHsKPiAgICAqIGZvciB0aGUgc2Vj
b25kIHBhZ2Ugb253YXJkIHNob3VsZCBiZSBzZXQgdG8gTkMuCj4gICAgKi8KPiAgICNkZWZpbmUg
QU1ER1BVX0dFTV9DUkVBVEVfTVFEX0dGWDkJCSgxIDw8IDgpCj4gKy8qIEZsYWcgdGhhdCBCTyBt
YXkgY29udGFpbiBzZW5zaXRpdmUgZGF0YSB0aGF0IG11c3QgYmUgd2lwZWQgYmVmb3JlCj4gKyAq
IHJlbGVhc2luZyB0aGUgbWVtb3J5Cj4gKyAqLwo+ICsjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRF
X1ZSQU1fV0lQRV9PTl9SRUxFQVNFCSgxIDw8IDkpCj4gICAKPiAgIHN0cnVjdCBkcm1fYW1kZ3B1
X2dlbV9jcmVhdGVfaW4gIHsKPiAgIAkvKiogdGhlIHJlcXVlc3RlZCBtZW1vcnkgc2l6ZSAqLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
