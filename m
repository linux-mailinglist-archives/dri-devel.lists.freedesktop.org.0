Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269A1120D8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 02:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB186E0A1;
	Wed,  4 Dec 2019 01:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC016E0A1;
 Wed,  4 Dec 2019 01:05:24 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A66C20656;
 Wed,  4 Dec 2019 01:05:24 +0000 (UTC)
Date: Wed, 04 Dec 2019 01:05:23 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Sean Paul <seanpaul@chromium.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
Subject: Re: [PATCH 01/11] drm/i915: Fix sha_text population code
In-Reply-To: <20191203173638.94919-2-sean@poorly.run>
References: <20191203173638.94919-2-sean@poorly.run>
Message-Id: <20191204010524.5A66C20656@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575421524;
 bh=k2dC7aIpYF9V4GO3R75VIvHtMkvHHXxRQSDpTRZ316o=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:References:From;
 b=xX+PS+cT2RFEz9cNDga0CAeq9w7kycEMjDEYJU/kIqAiD4D5XKiBwDoRbld+0eHHk
 T1D11CEpOXcfRJiE5MaSGHwATmc8Pm7aauZVXd5NMCwtkLIypoc5LC0zGOtHliTsuI
 BkDql1QuImquI7rz7Be5c8CnDWClQK+2r17ci/M4=
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
Cc: , Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Ramalingam C <ramalingm.c@intel.com>, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogZWU1ZTVlN2E1ZTBmICgiZHJtL2k5MTU6IEFkZCBIRENQIGZyYW1ld29yayArIGJhc2UgaW1w
bGVtZW50YXRpb24iKS4KClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2
NS40LjEsIHY1LjMuMTQsIHY0LjE5Ljg3LgoKdjUuNC4xOiBCdWlsZCBPSyEKdjUuMy4xNDogQnVp
bGQgT0shCnY0LjE5Ljg3OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoK
ICAgIFVuYWJsZSB0byBjYWxjdWxhdGUKCgpOT1RFOiBUaGUgcGF0Y2ggd2lsbCBub3QgYmUgcXVl
dWVkIHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBpdCBpcyB1cHN0cmVhbS4KCkhvdyBzaG91bGQgd2Ug
cHJvY2VlZCB3aXRoIHRoaXMgcGF0Y2g/CgotLSAKVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
