Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C977BCD01
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C6F6EA7F;
	Tue, 24 Sep 2019 16:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22156EA65;
 Tue, 24 Sep 2019 16:44:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE38021783;
 Tue, 24 Sep 2019 16:44:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 61/87] drm/amd/display: fix MPO HUBP underflow
 with Scatter Gather
Date: Tue, 24 Sep 2019 12:41:17 -0400
Message-Id: <20190924164144.25591-61-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343474;
 bh=102bwutzRxcs2V9RTN9Y+pSZKhS2+svPGHXK6ShtJ24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/7m8EZEtFbWuYmzCMUVeRczGfpvLNnf09G6OB/Mqmd0yhXbMXsd+i63NzJ40AWtF
 QiI0Pa4e+Z4MjCG95iEgEq8dTFFEJu3m4O+gtGRnpKHiRgIIQXihhzlxAlhVSDauHD
 ru6lBHIEAROjkuedK2vS7Hmm3C2ogCR2IBYQHO0I=
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
Cc: Sasha Levin <sashal@kernel.org>, Tony Cheng <Tony.Cheng@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zi Yu Liao <ziyu.liao@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCA4
OWNiNTYxNDczNmI5YjVkM2I4MzNjYTIyMzdkMTBkYTZiNGIwMzk1IF0KClt3aHldCldpdGggU2Nh
dHRlciBHYXRoZXIgZW5hYmxlZCwgSFVCUCB1bmRlcmZsb3dzIGR1cmluZyBNUE8gZW5hYmxlZCB2
aWRlbwpwbGF5YmFjay4gaHVicF9pbml0IGhhcyBhIHJlZ2lzdGVyIHdyaXRlIHRoYXQgZml4ZXMg
dGhpcyBwcm9ibGVtLCBidXQKdGhlIHJlZ2lzdGVyIGlzIGNsZWFyZWQgd2hlbiBIVUJQIGdldHMg
cG93ZXIgZ2F0ZWQuCgpbaG93XQpNYWtlIGEgY2FsbCB0byBodWJwX2luaXQgZHVyaW5nIGVuYWJs
ZV9wbGFuZSwgc28gdGhhdCB0aGUgZml4IGNhbgpiZSBhcHBsaWVkIGFmdGVyIEhVQlAgcG93ZXJz
IGJhY2sgb24gYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBaaSBZdSBMaWFvIDx6aXl1LmxpYW9AYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCBmOGFiZTk4YTU3NmJlLi44ZmRiNTNhNDRi
ZmIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuYwpAQCAtMTExMCw2ICsxMTEwLDkgQEAgdm9pZCBkY24yMF9lbmFibGVfcGxhbmUo
CiAJLyogZW5hYmxlIERDRkNMSyBjdXJyZW50IERDSFVCICovCiAJcGlwZV9jdHgtPnBsYW5lX3Jl
cy5odWJwLT5mdW5jcy0+aHVicF9jbGtfY250bChwaXBlX2N0eC0+cGxhbmVfcmVzLmh1YnAsIHRy
dWUpOwogCisJLyogaW5pdGlhbGl6ZSBIVUJQIG9uIHBvd2VyIHVwICovCisJcGlwZV9jdHgtPnBs
YW5lX3Jlcy5odWJwLT5mdW5jcy0+aHVicF9pbml0KHBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicCk7
CisKIAkvKiBtYWtlIHN1cmUgT1BQX1BJUEVfQ0xPQ0tfRU4gPSAxICovCiAJcGlwZV9jdHgtPnN0
cmVhbV9yZXMub3BwLT5mdW5jcy0+b3BwX3BpcGVfY2xvY2tfY29udHJvbCgKIAkJCXBpcGVfY3R4
LT5zdHJlYW1fcmVzLm9wcCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
