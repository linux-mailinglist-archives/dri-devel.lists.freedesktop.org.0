Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3C46F34
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 11:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF4A892A6;
	Sat, 15 Jun 2019 09:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A05892A6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 09:12:00 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52545
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hc4j8-00063R-5e; Sat, 15 Jun 2019 11:11:58 +0200
Subject: Re: [PATCH v4 05/12] drm/modes: Rewrite the command line parser
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <0797f942f8c79a3825974fe9584e810e515ab8e0.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f333d42a-96bb-05a3-18f8-c8ebdcfec51d@tronnes.org>
Date: Sat, 15 Jun 2019 11:11:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0797f942f8c79a3825974fe9584e810e515ab8e0.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=e/kZhpg6kkfRn25npvfInWEOHg2V7w40nfvL+KiiOtY=; 
 b=CAnZf3SLCQOho+SRb2fgzfagkMvGD07X9i+qPrDUXy6cXpqqgvaW0h9rzbOb/dGlU5+NNuu8GOODFOkny+s5FZ5M9yE63NaBhxnrE9mQo1SrV22XQo6lDptc9XoPOwCOq4ThkxI99H7sjX/hwHSeBdkR5v2ZUTSPVzqIZFZhIBhJIhGKzFhk+jYTL6gjqrg9U4tpmnO2uS0FUM1PCPIAinW3n6gYvQ18G6pMiI7pLV7IfRrwUsP0jL/xfVDs/Jsa8pBtrj/SzisYvPyP856WBUIEOkf/sn1j9KieDoSQam5uzXPTrThPvv17trr+x/De/gD4o/BdCE2XjdMNHg/IPw==;
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDYuMjAxOSAxNC4xMywgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBGcm9tOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAKPiBSZXdyaXRl
IHRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIGluIG9yZGVyIHRvIGdldCBhd2F5IGZyb20gdGhlIHN0
YXRlIG1hY2hpbmUKPiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+IAo+IEhvcGVmdWxs
eSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2lseSB0byBzdXBwb3J0IG5h
bWVkIG1vZGVzCj4gYW5kIC8gb3IgcHJvcGVydGllcyBzZXQgZGlyZWN0bHkgb24gdGhlIGNvbW1h
bmQgbGluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
