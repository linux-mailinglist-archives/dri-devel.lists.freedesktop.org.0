Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D1262A32
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1086EAB9;
	Wed,  9 Sep 2020 08:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B536EAB9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIHAnXoUy/PJ1p9DTW2kJPOZMvOAWmV/AwrDFdak/jM=; b=ZpuQY2Lk4WpS3vw9u0d+lx9J4t
 RqKT/qEEFsaikcGpqsFK9Z9o4Mv6cIZPX79OJ3dN1cPKCpbKoKUKmg8yMzwzM3SrVgLC516y6VYY1
 br08kAuH1px/ZFHO7ekp3Dnt3wGehB/7xVNMuWxxj7TtMVQF8V0RXgkkfyHaLq4/auWJlTnUuLPWx
 3eL+bTn5UYmj8x7z+ulabLavOtGnCUp9iIHRmB+GQvam9a/4cAVBJlbNqQS597uiuq/2ryax1DWvC
 O7jMy0j9slrmIc4BDZMEUIt2dkEiezgMtDy2okUEar7OikYT/SpUCpUb5n6dXPfrlsur2c4c0XaGF
 Ueih4Myw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvQk-0001mq-NS; Wed, 09 Sep 2020 11:26:14 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
 <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
Date: Wed, 9 Sep 2020 11:26:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS85LzIwIDQ6MjQgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwOS4wOS4yMDIwIDA0
OjEzLCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPiAuLi4KPj4gSG93IG1hbnkgc3luYyBw
b2ludHMgd291bGQgdXNlIGFuIGF2ZXJhZ2Ugam9iPyBNYXliZSBpdCBzaG91bGQgYmUgYmV0dGVy
Cj4+IHRvIGhhdmUgdGhlIHByZWRlZmluZWQgYXJyYXkgb2Ygc3luYyBwb2ludHMgd2l0aGluIHRo
ZSBzdHJ1Y3QKPj4gZHJtX3RlZ3JhX2NoYW5uZWxfc3VibWl0Pwo+Pgo+IAo+IFRoZSBzYW1lIHF1
ZXN0aW9uIHJlZ2FyZGluZyB0aGUgY29tbWFuZHMuCj4gCj4gV291bGRuJ3QgaXQgYmUgYSBnb29k
IGlkZWEgdG8gbWFrZSBib3RoIHVzcnB0ciBhcnJheXMgb2Ygc3luYyBwb2ludHMgYW5kCj4gY29t
bWFuZHMgb3B0aW9uYWwgYnkgaGF2aW5nIGEgc21hbGwgZml4ZWQtc2l6ZSBidWZmZXJzIHdpdGhp
bgo+IGRybV90ZWdyYV9jaGFubmVsX3N1Ym1pdD8gVGhlbiBhIG1ham9yaXR5IG9mIGpvYnMgd291
bGQgb25seSBuZWVkIHRvCj4gY29weSB0aGUgZ2F0aGVyIGRhdGEgZnJvbSB1c2Vyc3BhY2UuCj4g
CgpTdXJlLCBJJ2xsIGxvb2sgaW50byBpdC4gRm9yIHN5bmNwb2ludHMsIGl0IHdvdWxkIGJlIHVz
dWFsbHkgMSBidXQgCnNvbWV0aW1lcyAyLCBzbyBtYXliZSBtYWtlIGl0IDIuIEZvciBjb21tYW5k
cywgYXQgbGVhc3QgZm9yIGRvd25zdHJlYW0gCml0IHdvdWxkIHR5cGljYWxseSBiZSAyIChvbmUg
d2FpdCBhbmQgb25lIGdhdGhlcikuIEFueSBvcGluaW9uIGZyb20gCmdyYXRlLWRyaXZlcidzIHBv
aW50IG9mIHZpZXc/IE5vdCBzdXJlIGlmIHRoZXJlIGlzIGFueSByZWNvbW1lbmRhdGlvbiAKcmVn
YXJkaW5nIHRoZSBtYXggc2l6ZSBvZiBJT0NUTCBkYXRhLgoKTWlra28KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
