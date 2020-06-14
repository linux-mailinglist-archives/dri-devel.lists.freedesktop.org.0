Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22D1F8FA0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07CE6E120;
	Mon, 15 Jun 2020 07:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6EB89E3E;
 Sun, 14 Jun 2020 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592139949;
 bh=twBWjKWwkxqpHDAJyLnk+motZ58+jjTK9fg8hzaK/BM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=AkVdMyZjAQLAIvy9qJ20t6E1XG/33Uri3FU+pir5Lz7Q2Rjp+66I1rZHnxu/dgQQT
 CkhVQa17hiKw9CK8kgICRXsayajLB8OhNR1oxSGU4MRYKdoE/QkS3UsAcJ4NF3PWJ/
 4lK/JoGE2KxGQIpIcXOQHpnIpNPLda3sZWLquZZw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsJOq-1ivWfX0yOA-00tkAx; Sun, 14
 Jun 2020 15:05:49 +0200
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: fix ref count leak in
 amdgpu_display_crtc_set_config
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <241aaf11-d4a0-e5a9-9744-75839006c128@web.de>
Date: Sun, 14 Jun 2020 15:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:jISW+Z2OwzdSP+oBBBHLf/NafH24FJYxgakUacwhi3+VepG1uKU
 WMiRnTTFV/i3rpYkRVT6CSokq3Y1BnhkT8jsNYH5qKecsjMfIrxUk+L+S1M00hxoS+FjuGO
 1gZXQyX68il89HsZuDKwZ3g94irEijpqn7pGPtJeAddqx3cDkAF4CsB+ePRn/gdPABJL3V7
 SFyuSJlTugi3zz6ejehmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v7eTGvr1Xs0=:XPocsuC/DHM9Xn8JheBKVW
 XW/nyoUHPiXrgYDha2KtAgCeX6UTf7J0nchvy8vYbvZvLXqch721rKQEjkNDNIp7guqv5acEe
 At08joOFPl4z2pzel8gdtoTp0MAxO0o+bzC7oLwBZfMOt+wqeGrDb1qFv2pLZc30s9dRG6AnT
 SVPyYhU+Lt+Neqi1c4ask82Z5Cc3Uv8x7dElvgqdUcgjRDcsivpFsUYev4ZAJBLq5NPV1kYrn
 oTgvU9gbqRIqAaD7+TAQUWJWIIISXhayK/Jv5ZQ0f6maA1x4VNKatyM+tlliwRLy0Orc+I20o
 mmtG2FAJVPiftrRm+2hocFJ36naHsyJacW2rjUCOKCxoojU74jNcd6j8w13fSr0uzfvW0mx6k
 7RFgHfLmwct020oEZ+YyGpv0G7zUlLicXQJ+XhDOuD8ykqEQxtwy0nMBq0rbaHtDdW6LqmEYE
 LsWmrW2QfdPceZ6VzJMP6Z0bnBaORjrHhpz8Z9XN4xQ+o0olSsydKS8Y+GiR1/6AT9GwYSk0W
 /ZC5aOa5fES0QmF+k7rQI/Wxpopoc7sDh113mR348P1lqNwzXs/ZA5uXyV5dwrsA94ExY56el
 kOmmlI71j7PzNYnnr4U56CC7LZIg3MHZxcRP7UF8yfIvj4vxBxYKIKBjfzqP8UlpmZtQztDoP
 /zIYwbyxActTbC/J6fyXsGhvZskE6kks0iAqxM4qGh9eHs86DHaTDXUA1OsytuDNd5KzZ74xb
 ifEjcINAsvfcFGTZNW9Dfcbo57xYk1w+EZwHHA6NyRudhHJIEiAB9tjR86b76WNGNMW5P5Ldv
 aVpxzZ8CUMzmzI3KYJq2EmQq9Kv69p82Ykv1lKhAUJtxYz3KxNq67snJFqnXRFzyzd7PT4BYv
 /ANCXPiTHqUDeNiExvJH1OLuTREwk+XVcnsXFhC4BpyR62NcMkLT3XlRqJiHFtYExw223kN0S
 8Gxy5tgR425YkC/lecpEsXxWjtL8eiQA7EMFOn9IvKW8sDEs0MkuQUxEuGTIiMzJc56grxKKd
 r/UbBYBQAg7U8f1YROBUvWYVHZHdEUyZ6BClrHfHaFRxqoLurV6T4+5gFAd3X+L8DoWDPT8Du
 BTP4j5l5Hnw3ZVNkUNxkYxRnEIzlSjEjCZWCb3yRXNHiLbF8jmh6ih67gChwzfjOiGj5Ynd8t
 t4Ip5ZogHoGR6x8F9JtnmY5m9xnXhlHw4FGw12C89+0FYErRg1O76h5lvWfc3BCqTOgc2PiKp
 U3iRys3OxLLBpCwd7
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shirish S <shirish.s@amd.com>,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Alex Deucher <alexander.deucher@amd.com>,
 Yu Kuai <yukuai3@huawei.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBpbiBhbWRncHVfZGlzcGxheV9jcnRjX3NldF9jb25maWcsIOKApgoKKiBDYW4gdGhlIHRlcm0g
4oCccmVmZXJlbmNlIGNvdW504oCdIGJlY29tZSByZWxldmFudCBhbHNvIGZvciB0aGlzIGNvbW1p
dCBtZXNzYWdlCiAgYmVzaWRlcyBvdGhlciBwb3NzaWJsZSBhZGp1c3RtZW50cz8KCiogQ2FuIGl0
IGJlIG5pY2VyIHRvIGNvbWJpbmUgcHJvcG9zZWQgdXBkYXRlcyBmb3IgdGhpcyBzb2Z0d2FyZSBt
b2R1bGUKICBhcyBhIHBhdGNoIHNlcmllcyAod2l0aCBhIGNvdmVyIGxldHRlcik/CgoqIFdvdWxk
IHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdPwoKCuKApgo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMK4oCmCj4gQEAgLTMwNiw2ICsz
MDYsNyBAQCAgaW50IGFtZGdwdV9kaXNwbGF5X2NydGNfc2V0X2NvbmZpZyhzdHJ1Y3QgZHJtX21v
ZGVfc2V0ICpzZXQsCj4gIAkJYWRldi0+aGF2ZV9kaXNwX3Bvd2VyX3JlZiA9IGZhbHNlOwo+ICAJ
fQo+Cj4gK291dDoKPiAgCS8qIGRyb3AgdGhlIHBvd2VyIHJlZmVyZW5jZSB3ZSBnb3QgY29taW5n
IGluIGhlcmUgKi8KPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRldi0+ZGV2KTsKPiAg
CXJldHVybiByZXQ7CgpQZXJoYXBzIHVzZSB0aGUgbGFiZWwg4oCccHV0X3J1bnRpbWXigJ0gaW5z
dGVhZD8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
