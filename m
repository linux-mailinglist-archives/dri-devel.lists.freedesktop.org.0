Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091CB33CCD2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 06:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C86E128;
	Tue, 16 Mar 2021 05:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4A06E128
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 05:01:33 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id x7so7998297pfi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 22:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sqqz+JuGB78iICP5cqTrqQ+fp82gQW2JceA6wp0uaTg=;
 b=PSs8V08LQvqKP3YrY1dbIDCaunzh1n+vaDzl2fYCAnA8vrNH1ATCRSRvriUBMjHmVD
 iOdNCudCxdH811rBC3c4kBtj9NzFAPcGbUB0OILCqcnCOfWjimWujZf2CF6RSyIXB5In
 bZVKfJM/mmFIgwzy4aa3IXyat9Rn++eC25fz5UbqguzMAKmS+HzurMIeB4b+1GuRxfFF
 q/9lEz5XMmt79bgLlHEeCjRCJzwHLb/a+hTwOaovgjDRpCaLGS0RlHT0L1kL7rHP3dCA
 cTn5Xkv73IeJ9YhNxnQgohavtLFp7bvvhGgB8VjhsXG4yuxVGh6Y/cMUa0HLMckHFFv+
 4ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sqqz+JuGB78iICP5cqTrqQ+fp82gQW2JceA6wp0uaTg=;
 b=sNeSjWV0m7D/ZKYS2vm3xb9/Rnu4Pyc4hsMEH+mwcOSw4Pu7C191gNVG5Dfsze7986
 TkT9UZXy/I/rA9kWjy9/sergZnOfp9Z9IK+pw581UKns2sAtpF05B7QSf7jGE1XF689d
 V1K8LlNo0eEwNE/wbv3fneGFcQcxnJ0WcW9ZldDkuw0LbR9OfJlFox8SAfhayIK6FmWT
 Q+Y7gQf4s8ZlqQSQsWLbnDoBQeWTzaPqWzStRS/gvRW8p6dn18PKJvvYqcSWERYI3jqP
 umTVYrTTRXIZdIy3BaW+j38i22/remoaLPgoZZC1Eg/MISsSQe7VS9gPVAiMTW7hnEN4
 qVgA==
X-Gm-Message-State: AOAM530TjVWbNHq6/DWcjEoc1Uiqa2v4himsKAUEGXC7/6450I4d9Bey
 SeJsRHHgrdzv1irsp7V36juHYUugnYnY7A==
X-Google-Smtp-Source: ABdhPJzs9G6poOib8dqwHeGc6VF3eZ+AwHMP14H212nfjSPK0Q/hTp9uFxmzgZ5XCZ2Ed+jatcBOjg==
X-Received: by 2002:a63:ef53:: with SMTP id c19mr2281265pgk.78.1615870408308; 
 Mon, 15 Mar 2021 21:53:28 -0700 (PDT)
Received: from omlet.com (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id w128sm15147785pfw.86.2021.03.15.21.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 21:53:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] dma-buf: Add an API for exporting sync files (v7)
Date: Mon, 15 Mar 2021 23:53:19 -0500
Message-Id: <20210316045322.2020294-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315210453.1667925-1-jason@jlekstrand.net>
References: <20210315210453.1667925-1-jason@jlekstrand.net>
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
ZXItIHN5bmNocm9uaXphdGlvbi4KClRoZSBvbmx5IHJlbWFpbmluZyBUT0RPIGl0ZW0gYXMgZmFy
IGFzIEkga25vdyBpcyB0aGF0IHNvbWUga2VybmVsIENJIHN5c3RlbQppcyBzZW5kaW5nIG1lIG5h
c3R5Z3JhbXMgYWJvdXQgYnVpbGQgc3lzdGVtIHByb2JsZW1zLiAgV2l0aCB0aGlzIGNoYW5nZSwK
ZG1hLWZlbmNlIG5vdyBoYXMgYSBkZXBlbmRlbmN5IG9uIHN5bmNfZmlsZSBhbmQgSSByZWFsbHkg
ZG9uJ3Qga25vdyBob3cKYmVzdCB0byBzb2x2ZSBpdC4gIFNob3VsZCB3ZSBtYWtlIHN5bmNfZmls
ZSBubyBsb25nZXIgb3B0aW9uYWw/ICBTaG91bGQgSQpoaWRlIHRoZSBuZXcgaW9jdGwgYmVoaW5k
IGEgI2RlZmluZT8gIElmIHNvLCB3aGF0ICNkZWZpbmU/ICBJJ20gYSBiaXQgbG9zdAp3aGVuIGl0
IGNvbWVzIHRvIEtDb25maWcsIEknbSBhZnJhaWQuCgpNZXNhIE1SOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvNDAzNwpJR1QgdGVzdHM6
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2lndC1kZXYvMjAyMS1NYXJj
aC8wMjk4MjUuaHRtbAoKQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+CkNjOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNu
aWV1d2VuaHVpemVuLm5sPgpDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+
CgpDaHJpc3RpYW4gS8O2bmlnICgyKToKICBkbWEtYnVmOiBhZGQgZG1hX2ZlbmNlX2FycmF5X2Zv
cl9lYWNoICh2MikKICBkbWEtYnVmOiBhZGQgZG1hX3Jlc3ZfZ2V0X3NpbmdsZXRvbiAodjIpCgpK
YXNvbiBFa3N0cmFuZCAoMSk6CiAgZG1hLWJ1ZjogQWRkIGFuIEFQSSBmb3IgZXhwb3J0aW5nIHN5
bmMgZmlsZXMgKHY2KQoKIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgICAgICAgICB8ICA1NSAr
KysrKysrKysrKysrKwogZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jIHwgIDI3ICsr
KysrKysKIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jICAgICAgICB8IDExOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmggICB8
ICAxNyArKysrKwogaW5jbHVkZS9saW51eC9kbWEtcmVzdi5oICAgICAgICAgIHwgICAzICsKIGlu
Y2x1ZGUvdWFwaS9saW51eC9kbWEtYnVmLmggICAgICB8ICAgNiArKwogNiBmaWxlcyBjaGFuZ2Vk
LCAyMjYgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
