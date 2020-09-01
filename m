Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D8325991D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17216E44F;
	Tue,  1 Sep 2020 16:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA46E44B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598972861;
 bh=cFpuigKeib+1orQ+3elXb5Tw6uZCrPRSAVOvY02MAqw=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=oefXrJerMImm600hHezD/iVfihcBQmw1QXQBDtll0nCNKXEc/kKmi0V1qyBpp+Zbg
 3wj5RBf1HbskeTDJ1Wlrxzw34Odc1vxpjfSP1lgkE0MbwD6PtakeTRZJux6SIjG+/C
 H7tGD1HvfkoIjLnxF9pQesYVjOJR3fBM6DeoBL54=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.94.126]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrPV-1jzb6U06HT-00N3xI; Tue, 01
 Sep 2020 17:07:41 +0200
To: Doug Horn <doughorn@google.com>, dri-devel@lists.freedesktop.org,
 kernel-team@android.com, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] Fix use after free in get_capset_info callback
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cba25211-9244-70e2-403a-db6738a90164@web.de>
Date: Tue, 1 Sep 2020 17:07:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Evc102NVuiglDj9XAmYnQpO03SZUh4AeVlbHw2h6XGHkLSHfxoO
 NPYTHOt47ALSum8utZ6t6zYUb7OFTLizk81ODNQMKwh2yJScxDjV1toUgiyG5wHH/DNKVQx
 JdmcNGMCa8Sq7rx0iuhi3lBUcmktS3sUeSBOTQpVTt/6p35Wjw6qcNitl0ybCUsVdXacR4S
 vHNtUoDID1FgCQt8KuhFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hJLLYVGJt7E=:BBHkDuydQ2+QyKmB0hFPlV
 BLgF+GcC1Rv2HBI61zNGE6Zp+zk0kcb9D38KN4bgnnhxBxcTwkozNnGv4mqrFUhkRu6LAlUUd
 nRCON10Bm3q7wONHHCgmqSVpxgDM4vKpKC6Dp+xXrRKfSmSZQJHcQEUrw+ODtrXeeHtcjgwdq
 X/5kv1NBz5XGrGsY7+fI3F1t/0EY5L0yuIfNe7pfQn7bZqHIyT0wKmlBU6zX8JL7DdBGrnCY1
 VyGupI7l8BWMotuN+CbzgIYB83GYR2SQb6N132pFqbzoC3E1dcWQLCqORHJ96G0wLBNvLKeAa
 13ssbvb7IdR19nj1TOYhIL0LEhWS6XG5BfiOUM5o5pf+ISSIRAAu5UGtpN/qJf0supQMGQI8J
 WYfJikwX8yAVOvjSHsBqp98/+a8f/g5V+SrZHtzkPgWef6MibVmsyWbv7g7GzLcRxbzk1WMWE
 R0af7PCj7ggqDd6LZ0bil0AXL3NXQuP8iw4KuhTKVQLLgLAephESb+y+PWbTyai4Me4nlcGSV
 /3SKo9o9IAxxQ72Kaf7jhZYkc6UOCnDqJREoIKm/tMx8UAMGObT9ncDekzvUidjwaoZugtnCV
 E2BI3nSttb488hed5FF54+/qUJoVUnaxoB/go30qa/AWKgwD8DnmnWJZ/xkaV+SGSHVMD4qFI
 5uz8YkWCiexZonihkntLnl4Y3126PaW4M76AU7eoje2CHX5i5v1/2CUfW8afUE46rum+mH9N4
 x4moxRdrGw4sa1h4utaBlm7g4qqhjk9CNAS2W8FzvYLKIQcE6+vslkPV6g5ZiojhyqN+PjIms
 t6TdTKYC9FRP5ttRe17FoDETpvILeIF25AKCvvRSD0xCpJd9owR40g83vGaOYq5zM4XKbohSL
 QCJiZ6mrIrg7a8r+q/kosDOuoXMZeiEu+4abztyp2aUFsPPes66DyLfeaIhowvEGwq36Cq1uZ
 hjd4PT8vPj4uYYANGzQDu6R5wEECVfLzYoFaNoWMGLE7xsfbs0CWcm4xT+pY69RM5ZbP+U+ly
 4YpeYPNrG80S2epry5G1p/40alv6VJt6AqISD8xvQK/NXj339VSujzoGQ0S8WvUrSZfM27Mzj
 KO9K0I+tgjB/WnPEpvKStVVPJLxeTPcwC+yXy9RbTRnKM9JLgIMnBCZ+gzRt4Zlprv+0mKjPu
 nvkoWAWX5siQ4k41plPB09/we8uDScMkBRZAA6B8sFW/SL7xpZisHYtJBfCgw7VbBkIDZTV3b
 Az7f+V1cbEr5p3+l+ebe4dY2vn7W5Jo2DykTVWQ==
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJZiBhIHJlc3BvbnNlIHRvIHZpcnRpb19ncHVfY21kX2dldF9jYXBzZXRfaW5mbyB0YWtlcyBs
b25nZXIgdGhhbgo+IGZpdmUgc2Vjb25kcyB0byByZXR1cm4sIHRoZSBjYWxsYmFjayB3aWxsIGFj
Y2VzcyBmcmVlZCBrZXJuZWwgbWVtb3J5Cj4gaW4gdmctPmNhcHNldHMuCgoqIENhbiBhbm90aGVy
IGltcGVyYXRpdmUgd29yZGluZyBiZWNvbWUgaGVscGZ1bCBmb3IgdGhlIGNoYW5nZSBkZXNjcmlw
dGlvbj8KCiogSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBtZW50aW9uIHRoZSBwcm9wb3NlZCBh
ZGRpdGlvbiBvZiBhIHNwaW4gbG9jawogIGFuZCBhIG51bGwgcG9pbnRlciBjaGVjaz8KCiogV291
bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNz
YWdlPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
