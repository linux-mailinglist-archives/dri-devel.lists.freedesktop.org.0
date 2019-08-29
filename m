Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA8A2A73
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 01:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285B76E0EA;
	Thu, 29 Aug 2019 23:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292E6E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 23:01:30 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D2D220828;
 Thu, 29 Aug 2019 23:01:29 +0000 (UTC)
Date: Thu, 29 Aug 2019 19:01:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.19.y 1/3] drm/bridge: tfp410: fix memleak in
 get_modes()
Message-ID: <20190829230128.GP5281@sasha-vm>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
 <20190829200001.17092-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829200001.17092-2-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567119689;
 bh=W9b8uz0feEaW6eZCGVA4xllacD7howC1goKBJQjIsP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSJ6EehHO0cOzJSIr27S1Lja+mZUxP500FnEZtxxAgXtdPYX6f/m17eD5+lda6brA
 YPZdc70TZBBcV2AmJtoXO5/c/Ds6ILtQM+spB9LQXswf+yQTXxIL3t7auVDhf7WLdA
 tSelT+jtK3910rMvMUNQ02HQ6j9R79g+fxFCiYJY=
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, stable@vger.kernel.org,
 vinholikatti@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDE6NTk6NTlQTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVy
IHdyb3RlOgo+RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+
Y29tbWl0IGMwOGY5OWMzOTA4M2FiNTVhOWM5M2IzZTkzY2VmNDg3MTEyOTRkYWQgdXBzdHJlYW0K
Pgo+V2UgZG9uJ3QgZnJlZSB0aGUgZWRpZCBibG9iIGFsbG9jYXRlZCBieSB0aGUgY2FsbCB0byBk
cm1fZ2V0X2VkaWQoKSwKPmNhdXNpbmcgYSBtZW1sZWFrLiBGaXggdGhpcyBieSBjYWxsaW5nIGtm
cmVlKGVkaWQpIGF0IHRoZSBlbmQgb2YgdGhlCj5nZXRfbW9kZXMoKS4KPgo+U2lnbmVkLW9mZi1i
eTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPlNpZ25lZC1vZmYtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj5MaW5rOiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTAxMzU3MzkuNjA3Ny0xLXRv
bWkudmFsa2VpbmVuQHRpLmNvbQo+U2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRo
aWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KCkkndmUgcXVldWVkIHRoaXMgb25lIGZvciA0LjE0LTUu
MiwgdGhhbmtzIQoKLS0KVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
