Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECCE33C81E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 22:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522716E1A2;
	Mon, 15 Mar 2021 21:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010856E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 21:05:00 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id n10so21206226pgl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0KQwkIrKscoVwwx+us9L2o+rKON2YJch7CTyZitEcY=;
 b=uEtP/1tB/eS1dgqBTNXdjGJSVljDZwea2otpdj83EN20UudWNqucbkNrqv21zv2d67
 gb8IziWjdbKl6lSXmmuPOnXFqqggE4RQhrxS6hwFPsyPQsZmdCUk6TIV4KEWbSa/C+UE
 SxAd2Lk08CC1E8Ol6SrVMVbHA6VOBq4OgJpJ2YBy4kZJgIYr2/bJoLyh3rWtUIaZF7M8
 SR1JWXTe7nM/mj1Fq2cCG9/QIgyJ43PYxiEeG1nX5Qz2dVUAxJ/fOiHDN4UKV2YHIU2R
 3pmJhmUIKq1mKrUi9A7r/M4FO9z9CdLEn/H0YsWCgO47ZWQ9J1eIjh/nePunHa7tOGyc
 CyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0KQwkIrKscoVwwx+us9L2o+rKON2YJch7CTyZitEcY=;
 b=lhWq6qEnXra3C/KafglDxETwm+0ZWZhjYhd5PAo7Fo0bnpeAfe1vj+lvZXHT+SYogL
 UfwvatuIVl5ccY1SDTRP5XyM1GBaywHU3/3YroG1yn/aIkoh2u25ZstX3a+7+iyYCp2z
 gi0Q5H5KBp5NIzb+dgUZomoN/Q6kjpPD00Mbsx8vez2ddthjZxWVQnL0ERjAyN5Ywfqr
 N0ZHT0en57sw8dapyXKI+gAp1Tkhhppko+NH9azFdyFHVjsECCjkP+LhBJK7blzAoIoa
 lFNa7ysGmu/lr3wm6ok+57Vuo4S48ND4q6JNIJ6a1PPQvmWXLP4mC8LcgcmEzySNQJ0b
 I+KA==
X-Gm-Message-State: AOAM5335aEI2mte+ftJLpBeRqsbhuwJQhis+JPa4erH8Cwlk2Dwl0GeV
 yEasxyZzWgxG+RQ4nbqW0IIOkBgYRNihog==
X-Google-Smtp-Source: ABdhPJyuKdlnSoHEDzVFj/cg5qtmsGDUBvPPYUVFZzcRDoRjhQSf5y9bo4yn8TkS1Bw41OmW4oA8JA==
X-Received: by 2002:a63:d618:: with SMTP id q24mr809737pgg.283.1615842300048; 
 Mon, 15 Mar 2021 14:05:00 -0700 (PDT)
Received: from omlet.com (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id t19sm13923609pgj.8.2021.03.15.14.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 14:04:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] dma-buf: Add an API for exporting sync files (v6)
Date: Mon, 15 Mar 2021 16:04:50 -0500
Message-Id: <20210315210453.1667925-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20200317212115.419358-1-jason@jlekstrand.net>
References: <20200317212115.419358-1-jason@jlekstrand.net>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9kZXJuIHVzZXJzcGFjZSBBUElzIGxpa2UgVnVsa2FuIGFyZSBidWlsdCBvbiBhbiBleHBsaWNp
dApzeW5jaHJvbml6YXRpb24gbW9kZWwuICBUaGlzIGRvZXNuJ3QgYWx3YXlzIHBsYXkgbmljZWx5
IHdpdGggdGhlCmltcGxpY2l0IHN5bmNocm9uaXphdGlvbiB1c2VkIGluIHRoZSBrZXJuZWwgYW5k
IGFzc3VtZWQgYnkgWDExIGFuZApXYXlsYW5kLiAgVGhlIGNsaWVudCAtPiBjb21wb3NpdG9yIGhh
bGYgb2YgdGhlIHN5bmNocm9uaXphdGlvbiBpc24ndCB0b28KYmFkLCBhdCBsZWFzdCBvbiBpbnRl
bCwgYmVjYXVzZSB3ZSBjYW4gY29udHJvbCB3aGV0aGVyIG9yIG5vdCBpOTE1CnN5bmNocm9uaXpl
cyBvbiB0aGUgYnVmZmVyIGFuZCB3aGV0aGVyIG9yIG5vdCBpdCdzIGNvbnNpZGVyZWQgd3JpdHRl
bi4KClRoZSBoYXJkZXIgcGFydCBpcyB0aGUgY29tcG9zaXRvciAtPiBjbGllbnQgc3luY2hyb25p
emF0aW9uIHdoZW4gd2UgZ2V0CnRoZSBidWZmZXIgYmFjayBmcm9tIHRoZSBjb21wb3NpdG9yLiAg
V2UncmUgcmVxdWlyZWQgdG8gYmUgYWJsZSB0bwpwcm92aWRlIHRoZSBjbGllbnQgd2l0aCBhIFZr
U2VtYXBob3JlIGFuZCBWa0ZlbmNlIHJlcHJlc2VudGluZyB0aGUgcG9pbnQKaW4gdGltZSB3aGVy
ZSB0aGUgd2luZG93IHN5c3RlbSAoY29tcG9zaXRvciBhbmQvb3IgZGlzcGxheSkgZmluaXNoZWQK
dXNpbmcgdGhlIGJ1ZmZlci4gIFdpdGggY3VycmVudCBBUElzLCBpdCdzIHZlcnkgaGFyZCB0byBk
byB0aGlzIGluIHN1Y2gKYSB3YXkgdGhhdCB3ZSBkb24ndCBnZXQgY29uZnVzZWQgYnkgdGhlIFZ1
bGthbiBkcml2ZXIncyBhY2Nlc3Mgb2YgdGhlCmJ1ZmZlci4gIEluIHBhcnRpY3VsYXIsIG9uY2Ug
d2UgdGVsbCB0aGUga2VybmVsIHRoYXQgd2UncmUgcmVuZGVyaW5nIHRvCnRoZSBidWZmZXIgYWdh
aW4sIGFueSBDUFUgd2FpdHMgb24gdGhlIGJ1ZmZlciBvciBHUFUgZGVwZW5kZW5jaWVzIHdpbGwK
d2FpdCBvbiBzb21lIG9mIHRoZSBjbGllbnQgcmVuZGVyaW5nIGFuZCBub3QganVzdCB0aGUgY29t
cG9zaXRvci4KClRoaXMgbmV3IElPQ1RMIHNvbHZlcyB0aGlzIHByb2JsZW0gYnkgYWxsb3dpbmcg
dXMgdG8gZ2V0IGEgc25hcHNob3Qgb2YKdGhlIGltcGxpY2l0IHN5bmNocm9uaXphdGlvbiBzdGF0
ZSBvZiBhIGdpdmVuIGRtYS1idWYgaW4gdGhlIGZvcm0gb2YgYQpzeW5jIGZpbGUuICBJdCdzIGVm
ZmVjdGl2ZWx5IHRoZSBzYW1lIGFzIGEgcG9sbCgpIG9yIEk5MTVfR0VNX1dBSVQgb25seSwKaW5z
dGVhZCBvZiBDUFUgd2FpdGluZyBkaXJlY3RseSwgaXQgZW5jYXBzdWxhdGVzIHRoZSB3YWl0IG9w
ZXJhdGlvbiwgYXQKdGhlIGN1cnJlbnQgbW9tZW50IGluIHRpbWUsIGluIGEgc3luY19maWxlIHNv
IHdlIGNhbiBjaGVjay93YWl0IG9uIGl0CmxhdGVyLiAgQXMgbG9uZyBhcyB0aGUgVnVsa2FuIGRy
aXZlciBkb2VzIHRoZSBzeW5jX2ZpbGUgZXhwb3J0IGZyb20gdGhlCmRtYS1idWYgYmVmb3JlIHdl
IHJlLWludHJvZHVjZSBpdCBmb3IgcmVuZGVyaW5nLCBpdCB3aWxsIG9ubHkgY29udGFpbgpmZW5j
ZXMgZnJvbSB0aGUgY29tcG9zaXRvciBvciBkaXNwbGF5LiAgVGhpcyBhbGxvd3MgdG8gYWNjdXJh
dGVseSB0dXJuCml0IGludG8gYSBWa0ZlbmNlIG9yIFZrU2VtYXBob3JlIHdpdGhvdXQgYW55IG92
ZXItIHN5bmNocm9uaXphdGlvbi4KCk1lc2EgTVI6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80MDM3CgpDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBCYXMg
TmlldXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+CkNjOiBEYW5pZWwgU3RvbmUg
PGRhbmllbHNAY29sbGFib3JhLmNvbT4KCkNocmlzdGlhbiBLw7ZuaWcgKDIpOgogIGRtYS1idWY6
IGFkZCBkbWFfZmVuY2VfYXJyYXlfZm9yX2VhY2ggKHYyKQogIGRtYS1idWY6IGFkZCBkbWFfcmVz
dl9nZXRfc2luZ2xldG9uICh2MikKCkphc29uIEVrc3RyYW5kICgxKToKICBkbWEtYnVmOiBBZGQg
YW4gQVBJIGZvciBleHBvcnRpbmcgc3luYyBmaWxlcyAodjYpCgogZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYyAgICAgICAgIHwgIDU1ICsrKysrKysrKysrKysrCiBkcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWFycmF5LmMgfCAgMjcgKysrKysrKwogZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMg
ICAgICAgIHwgMTE4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51
eC9kbWEtZmVuY2UtYXJyYXkuaCAgIHwgIDE3ICsrKysrCiBpbmNsdWRlL2xpbnV4L2RtYS1yZXN2
LmggICAgICAgICAgfCAgIDMgKwogaW5jbHVkZS91YXBpL2xpbnV4L2RtYS1idWYuaCAgICAgIHwg
ICA2ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDIyNiBpbnNlcnRpb25zKCspCgotLSAKMi4yOS4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
