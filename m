Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD621C241A
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCFA6EDB9;
	Sat,  2 May 2020 08:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88A6ED25
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:20:50 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s30so8619899qth.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDjIEM+eSzMwryve6HfF6tWEHpQ1YVsnKklV3y9mbGo=;
 b=nEPB/kPUVu64ALDJjlHG9rMKTiO65lpugPdBC30Nczov+tgzGXPn6wpmV85NOyxRh5
 3llmUpX+zBdGg9ao+A8Dyp3OnqDyGBYB6vqDjCxOxw5mjJPKQo6DB/cC07qH7cSXDWlk
 xT4JrOhmLTygWIPY4TatqdbFhJhSZImrg17m9LM8AKb8xkfmkMFcSYAOisggYpw2tOSK
 s3vV/30613M9nsClks7/z1Whk4BcpdM8wHMSt0GTIsR5+hRulh2NImOiBoJFW/rg1wOH
 inAEReWsuS05YfwJRAyPScaLj42vxYgfD6RLvZrbk1XcHFRCd2h2j5a1KLt7/kD3PyeZ
 vl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDjIEM+eSzMwryve6HfF6tWEHpQ1YVsnKklV3y9mbGo=;
 b=ca/eADNmvlZvd9fqrayhsl88oPhq4jgpJeNbOaGHf8SZRJ7kqZqaWq8lqpuKpCmX/d
 X5PYCZf/6VOJhRTpP+kpJej50Le8szMl5Xm84+RvH2VLCLN+zelZUltKr09UaAtf4zYi
 MECNCGP19lVRLFmR2leBqMCPuf21hiWXj22Qp6R0UVQYiYt9Ch88wpcRrB3x3+oM8UvJ
 vqcZbfQdCPuqXUvxm+Tui985Xl8ijhAKTBbxXjrg3/jatMokUhm2rUOw7/FB/y8GZbMY
 SF1f4ao3FyKXvvQtSyrOERMPXrYtAJ7LFfymo3HZtPZ/CqBGnf02Et+QSgbIhqP8/JIc
 A77w==
X-Gm-Message-State: AGi0PuZZ+/7IkALYNUZnO1wUgxlF19evwmK6Zj/zCvgKSwoO04j3IM1t
 ifGlDA7C+gTkmCCmdPQxSf6SQQ==
X-Google-Smtp-Source: APiQypLnto+0lS8NZSLIiaARckcdYZmXp5cRSri5MnUXK85RufiSt8ijYevAzNOi5g9Dq58iHtdy2g==
X-Received: by 2002:ac8:3254:: with SMTP id y20mr5176017qta.67.1588357249676; 
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n92sm3048968qtd.68.2020.05.01.11.20.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jUaHI-0006oH-Ci; Fri, 01 May 2020 15:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH hmm v2 0/5] Adjust hmm_range_fault() API
Date: Fri,  1 May 2020 15:20:43 -0300
Message-Id: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIEFQSSBpcyBhIGJp
dCBjb21wbGljYXRlZCBmb3IgdGhlIHVzZXMgd2UgYWN0dWFsbHkgaGF2ZSwgYW5kCmRpc3Vjc3Np
b25zIGZvciBzaW1wbGlmeWluZyBoYXZlIGNvbWUgdXAgYSBudW1iZXIgb2YgdGltZXMuCgpUaGlz
IHNtYWxsIHNlcmllcyByZW1vdmVzIHRoZSBjdXN0b21pemFibGUgcGZuIGZvcm1hdCBhbmQgc2lt
cGxpZmllcyB0aGUKcmV0dXJuIGNvZGUgb2YgaG1tX3JhbmdlX2ZhdWx0KCkKCkFsbCB0aGUgZHJp
dmVycyBhcmUgYWRqdXN0ZWQgdG8gcHJvY2VzcyBpbiB0aGUgc2ltcGxpZmllZCBmb3JtYXQuCkkg
d291bGQgYXBwcmVjaWF0ZWQgdGVzdGVkLWJ5J3MgZm9yIHRoZSB0d28gZHJpdmVycywgdGhhbmtz
IQoKdjI6CiAtIE1vdmUgY2FsbCBjaGFpbiB0byBjb21taXQgbWVzc2FnZQogLSBGaXggdHlwbyBv
ZiBITU1fUEZOX1JFUV9GQVVMVAogLSBNb3ZlIG5vdXZlYXVfaG1tX2NvbnZlcnRfcGZuKCkgdG8g
bm91dmVhdV9zdm0uYwogLSBBZGQgYWNrcyBhbmQgdGVzdGVkLWJ5cwp2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8wLXYxLTRlYjcyNjg2ZGUzYys1MDYyLWhtbV9ub19mbGFnc19qZ2dAbWVs
bGFub3guY29tCgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VA
cmVkaGF0LmNvbT4KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KVG86IFJhbHBo
IENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6ICJLdWVobGluZywgRmVsaXgiIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8
RGF2aWQxLlpob3VAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCkNjOiAiWWFuZywgUGhpbGlwIiA8UGhpbGlwLllhbmdAYW1kLmNvbT4KVG86IGxp
bnV4LW1tQGt2YWNrLm9yZwoKSmFzb24gR3VudGhvcnBlICg1KToKICBtbS9obW06IG1ha2UgQ09O
RklHX0RFVklDRV9QUklWQVRFIGludG8gYSBzZWxlY3QKICBtbS9obW06IG1ha2UgaG1tX3Jhbmdl
X2ZhdWx0IHJldHVybiAwIG9yIC0xCiAgZHJtL2FtZGdwdTogcmVtb3ZlIGRlYWQgY29kZSBhZnRl
ciBobW1fcmFuZ2VfZmF1bHQoKQogIG1tL2htbTogcmVtb3ZlIEhNTV9QRk5fU1BFQ0lBTAogIG1t
L2htbTogcmVtb3ZlIHRoZSBjdXN0b21pemFibGUgcGZuIGZvcm1hdCBmcm9tIGhtbV9yYW5nZV9m
YXVsdAoKIERvY3VtZW50YXRpb24vdm0vaG1tLnJzdCAgICAgICAgICAgICAgICB8ICAyOCArKy0t
CiBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8ICA1NiArKystLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jICB8ICAyNyArLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uaCAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMgICB8ICA5NCArKysrKysrKy0tLS0KIGluY2x1ZGUvbGludXgvaG1tLmggICAg
ICAgICAgICAgICAgICAgICB8IDEwOSArKysrKy0tLS0tLS0tLQogbW0vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCiBtbS9obW0uYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxODUgKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxMCBmaWxlcyBj
aGFuZ2VkLCAyMTcgaW5zZXJ0aW9ucygrKSwgMjk2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
