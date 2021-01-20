Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBD2FDB45
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3BC6E15C;
	Wed, 20 Jan 2021 21:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF9B6E15C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 21:09:41 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id m6so15320037pfk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4d6auqSX1j/vMOr3TsD18PFRnP6mGB4INh2IgrTTG4=;
 b=GdhLdiHi2LyrCQQMhzh0pvLH3gzKbpQzt27Y+CanmyiE5UaGiBQNAUzsr9Zaj0Zhr4
 KvJdY3Fzc3gckZGSp5QU8M5TxalhTsGKPF+fViwh/lBrax/yFrCK2Xm92/BNDmnnjPeU
 RZJryXRD7bznQNqVbnISwkIGndj8vzzsDJqNtcRJVPE2eUPb+buDtT72alBwOE5CVd1b
 5Zfg0FvQURoty3ptICEh9eSaAUog4x2tJQcdnvQcurrjdvmybFM9BWre3F69jbtW0JpG
 vKVbrvhCnyOPCsn02flcKhrtprB++yiII+28o7PgAqZ8wjCfT+pX98YN993EZcpX9kF6
 FN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4d6auqSX1j/vMOr3TsD18PFRnP6mGB4INh2IgrTTG4=;
 b=C8I/L5e0dOX7LmHKEw9toVoMn17lTz9cgQLUoQXwlfwyw2CRnFYOpz2cpKDL3TyO6h
 6AH5QYU0IC2ClKkZMXthoUf+Cz4IEr1L8RcENMWHTiIuIjacWgYqTaB/5aZAWMZkIaFX
 6tikBh0cQsdQ44pADEmxCrx3vDfKZg7wzKlavo5Kpj8xrHPB8xZ197dNQdR10TX+qjhR
 KwiIPcNqQSU6H2pCiNXT1Ft40zKhq45m0v4FrS/W0kDSvN6IVGrIE0LSukxKoav6JAbS
 BevaSoeRw8WFPg/zJe015b61SHeHfiVUB7Nuv3RTWifBpZTvxL++lhLbVkYRBAIiyvfJ
 ZDVg==
X-Gm-Message-State: AOAM5326UPYT7r+aTHqlJM9P8vTr2uHmHcGmVfibPcJ4iXgej9ny1+5n
 jnz8xWuOeHIcHqIm1BfavbURfg==
X-Google-Smtp-Source: ABdhPJwVPrD98BzRwSDLgSwObG8PYNxIaFpiX8zRhpHlai6xWuIyDqUItiSV/D8Cpv4EqgdSPtOpcg==
X-Received: by 2002:a63:4d59:: with SMTP id n25mr10926215pgl.122.1611176980657; 
 Wed, 20 Jan 2021 13:09:40 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 f15sm3265629pja.24.2021.01.20.13.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 13:09:39 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/3] dmabuf heaps: system uncached and cma uncached heaps
Date: Wed, 20 Jan 2021 21:09:34 +0000
Message-Id: <20210120210937.15069-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Bing Song <bing.song@nxp.com>,
 Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgdGhlIGxhc3Qgcm91bmQgc3VibWl0dGluZyB0aGUgc3lzdGVtLXVuY2FjaGVkIGhlYXAs
IEkgZ290CnNvbWUgZmVlZGJhY2sgdGhhdCBEYW5pZWwgd291bGQgbGlrZSB0byBzZWUgaXQgZGVt
b25zdHJhdGVkIHdpdGgKYSBtZXNhIGJhc2VkIHN5c3RlbS4gSSdtIHN0aWxsIHdvcmtpbmcgb24g
c3VjaCBhIGdyYWxsb2MKaW1wbGVtZW50YXRpb24gKHVzaW5nIHRoZSBkYjg0NWMpLCBidXQgYWxv
bmcgd2l0aCBvdGhlciB3b3JrLCBzbwpJIGRvbid0IHlldCBoYXZlIHNvbWV0aGluZyB0byBzaGFy
ZSB0aGVyZS4gCgpIb3dldmVyLCBCaW5nIFNvbmcgcmVhY2hlZCBvdXQgYW5kIHdhcyBpbnRlcmVz
dGVkIGluIGhhdmluZyBhCnVuY2FjaGVkIHZhcmlhbnQgZm9yIHRoZSBDTUEgaGVhcCBhcyB3ZWxs
LCBhbmQgaGUgc2hhcmVkIHRoaXMKcGF0Y2ggcHJvdmlkaW5nIGFuIGluaXRpYWwgaW1wbGVtZW50
YXRpb24uCgpUaGlzIGdhdmUgbWUgc29tZSBoZXNpdGF0aW9uIHdpdGggcmVnYXJkcyB0byB0aGUg
ZWFybGllcgpkaXNjdXNzaW9uIGFyb3VuZCB3aGF0IHNvcnQgb2YgYXR0cmlidXRlcyB3b3VsZCBi
ZSB1c2VmdWwgZm9yCnRoZSBmbGFncyBmaWVsZCBvZiB0aGUgYWxsb2NhdGlvbiBJT0NUTC4KCklu
IGVhcmxpZXIgZGlzY3Vzc2lvbnMsIGZvbGtzIHNlZW1lZCBoYXBweSB0byBwcm92aWRlIHRoZQp1
bmNhY2hlZCBzeXN0ZW0gaGVhcCBmdW5jdGlvbmFsaXR5IGFzIGl0cyBvd24gaGVhcCBjaGFyZGV2
LCBhcwppdCBzZWVtZWQgdW5jZXJ0YWluIHRoYXQgdGhlIHVuY2FjaGVkIGF0dHJpYnV0ZSB3b3Vs
ZCB0cnVlbHkgYmUKZ2VuZXJpYyBhY3Jvc3MgYWxsIGhlYXBzLiAKCkJ1dCB3aXRoIEJpbmcncyBw
YXRjaCwgaXQgc2VlbXMgbGlrZSBpdCBtYXkgYmUgZ2VuZXJpY2FsbHkgdXNlZnVsLAphbmQgdXRp
bGl6aW5nIGEgZmxhZyBtaWdodCBiZSBhIGJpdCBjbGVhbmVyIHRoZW4gYWRkaW5nIGxvdHMgb2YK
ZHVwbGljYXRpdmUgaGVhcCBuYW1lcyBwb3N0Zml4ZWQgd2l0aCAiLXVuY2FjaGVkIi4KClNvIEkg
d2FudGVkIHRvIHJlLXN1Ym1pdCBib3RoIG9mIHRoZXNlIHRvZ2V0aGVyIHRvIHJlb3BlbiB0aGF0
CmRpc2N1c3Npb24gb24gdGhlIHF1ZXN0aW9uIG9mIGlmIGEgQlVGX0ZMQUdfVU5DQUNIRUQgZmxh
ZyB3b3VsZAptYWtlIHNlbnNlLCBvciBpZiBmb2xrcyBzdGlsbCB0aGluayBzZXBhcmF0ZSBoZWFw
IGNoYXJkZXZzIGlzCnRoZSB3YXkgdG8gZ28uCgp0aGFua3MKLWpvaG4KCkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IExhdXJhIEFi
Ym90dCA8bGFiYm90dEBrZXJuZWwub3JnPgpDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3Rhcmtl
eUBhcm0uY29tPgpDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdvb2dsZS5jb20+CkNjOiBT
dXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpDYzogU2FuZGVlcCBQYXRpbCA8
c3NwYXRpbEBnb29nbGUuY29tPgpDYzogRGFuaWVsIE1lbnR6IDxkYW5pZWxtZW50ekBnb29nbGUu
Y29tPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgpDYzog
w5hyamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4u
bXVycGh5QGFybS5jb20+CkNjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5j
b20+CkNjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+CkNjOiBKYW1lcyBKb25lcyA8
amFqb25lc0BudmlkaWEuY29tPgpDYzogQmluZyBTb25nIDxiaW5nLnNvbmdAbnhwLmNvbT4KQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwoKQmluZyBTb25nICgxKToKICBkbWEtYnVmOiBjbWFfaGVhcDogQWRkIGEgY21hLXVu
Y2FjaGVkIGhlYXAgcmUtdXNpbmcgdGhlIGNtYSBoZWFwCgpKb2huIFN0dWx0eiAoMik6CiAgZG1h
LWJ1ZjogZG1hLWhlYXA6IEtlZXAgdHJhY2sgb2YgdGhlIGhlYXAgZGV2aWNlIHN0cnVjdAogIGRt
YS1idWY6IHN5c3RlbV9oZWFwOiBBZGQgYSBzeXN0ZW0tdW5jYWNoZWQgaGVhcCByZS11c2luZyB0
aGUgc3lzdGVtCiAgICBoZWFwCgogZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMgICAgICAgICAg
fCAgMzMgKysrKysrLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jICAgIHwgMTE5
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0
ZW1faGVhcC5jIHwgMTExICsrKysrKysrKysrKysrKysrKysrKystLS0tCiBpbmNsdWRlL2xpbnV4
L2RtYS1oZWFwLmggICAgICAgICAgICB8ICAgOSArKysKIDQgZmlsZXMgY2hhbmdlZCwgMjM2IGlu
c2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
