Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922B33FAE5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 23:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5B86E041;
	Wed, 17 Mar 2021 22:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46056E041
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 22:19:46 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso2068861pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NDkHjCWXg6V4YZ+2xwF9Emly1Ewc7c9IYUoCVHlDI0o=;
 b=gmI0y16wo9UmzFqqGn1ajeYkmMxwmI2eXye5g/9JojTjCySUQaAqxFmyPI26cT4LI/
 JmhweS2O3YOGCqCy2xGV6DS2OArqwNqT30ZhZXZfrqCfEprcsE22CClREJxlleJnXnPC
 PMbQ30Jdf7lLa7YI1HL09yDzI+iOKKJFJF4zTWSQilwb2csoyR0HMMFQIIV/Glxd3aOR
 LcPaYXv0V1/AynxsOaR72JSNDo+RkFImzYASJXaYWxVyJiV5Qce5gJx0AJy6d2QJnNGL
 cOzMpT35euUeTYRJn3ceC3GevXE+ZeDltbMBILjdunBc69QHuu/mrZyUi7aSxazwyJBS
 O8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDkHjCWXg6V4YZ+2xwF9Emly1Ewc7c9IYUoCVHlDI0o=;
 b=M0Vusto8UNaTcnyRfucIEdIzNQuj0rj+0CJkTuDPFW3ikJpjPK0qPB2BU0bCXw7pU6
 4cpRf3+O4p75c5K814HRd9sbO1atv4PqSJcT1zitE6wph5LHf54Q8Zy6IAz7OYii+RvF
 vo7mtYnacant0x63QXoFgJZRPNrzFsEvrfR5qRtFjEU3wLnflZmtcbh45bwic5dSF0n7
 Hrl4atnVJYn2TG48Gy/DXphhxATUbacIgxgx75JUrF35OIEq+HT4PMoxmIYpCKkwj1SU
 L8Wk1JO/WbX7l2BQhsY4huChIifIcCclq2vhMC7qmN+WRp9tFDplAVqBteAYUSQ4vZ/0
 BEMQ==
X-Gm-Message-State: AOAM531cf5SZ0kte4cJ5TEKwduvwNHLnb+tIwouj6YW/SxAsE4UYqooI
 jPbJ5Fd7auVAvb3qR9l3ugFVmvMxxdPwPw==
X-Google-Smtp-Source: ABdhPJxUmP9NDMN+2eDA9j26505eq9yPbGI/OQ34dBPYDN5sI1T5fZD3s8aW1SjqIQnFPcqI+PMyVQ==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr1039898pjb.2.1616019585926; 
 Wed, 17 Mar 2021 15:19:45 -0700 (PDT)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id l19sm117708pjt.16.2021.03.17.15.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 15:19:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] dma-buf: Add an API for exporting sync files (v8)
Date: Wed, 17 Mar 2021 17:19:37 -0500
Message-Id: <20210317221940.2146688-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316045322.2020294-1-jason@jlekstrand.net>
References: <20210316045322.2020294-1-jason@jlekstrand.net>
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
Lm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80MDM3CklHVCB0ZXN0czogaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvaWd0LWRldi8yMDIxLU1hcmNoLzAyOTgyNS5o
dG1sCgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
TWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KQ2M6IERhdmUgQWlybGllIDxhaXJs
aWVkQHJlZGhhdC5jb20+CkNjOiBCYXMgTmlldXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6
ZW4ubmw+CkNjOiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3JhLmNvbT4KCkNocmlzdGlh
biBLw7ZuaWcgKDIpOgogIGRtYS1idWY6IGFkZCBkbWFfZmVuY2VfYXJyYXlfZm9yX2VhY2ggKHYy
KQogIGRtYS1idWY6IGFkZCBkbWFfcmVzdl9nZXRfc2luZ2xldG9uICh2MikKCkphc29uIEVrc3Ry
YW5kICgxKToKICBkbWEtYnVmOiBBZGQgYW4gQVBJIGZvciBleHBvcnRpbmcgc3luYyBmaWxlcyAo
djgpCgogZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyAgICAgICAgIHwgIDU1ICsrKysrKysrKysr
KysrCiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMgfCAgMjcgKysrKysrKwogZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgICAgICAgIHwgMTE4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCAgIHwgIDE3ICsrKysr
CiBpbmNsdWRlL2xpbnV4L2RtYS1yZXN2LmggICAgICAgICAgfCAgIDMgKwogaW5jbHVkZS91YXBp
L2xpbnV4L2RtYS1idWYuaCAgICAgIHwgICA2ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDIyNiBpbnNl
cnRpb25zKCspCgotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
