Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8E65FAE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 20:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6106E26D;
	Thu, 11 Jul 2019 18:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F896E26D;
 Thu, 11 Jul 2019 18:46:33 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3F37C60E57; Thu, 11 Jul 2019 18:46:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D127C60E40;
 Thu, 11 Jul 2019 18:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D127C60E40
Date: Thu, 11 Jul 2019 12:46:30 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/3] drm/msm: don't open-code governor name
Message-ID: <20190711184629.GB26247@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
References: <20190630131445.25712-1-robdclark@gmail.com>
 <20190630131445.25712-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630131445.25712-2-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870793;
 bh=EI1jgjG1YbcgyKV2IhlRjah8r6n6987BfEr7/Z60RmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eH2KfA7r5C37gX8OFVL3fxYX5YC6+AQ0ZwZ9pIUgSX4ttp08S94unKocEes4/ZBE4
 UDv7to+xLtAr/idZo5Torz+KV3kil2gVKF/UzLeM6BaTmCy+byqSylSFtAzbtlRUeF
 GLY2sD6YkfSITqugaPyQX6MCUxnDjlh69KZZmelA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870792;
 bh=EI1jgjG1YbcgyKV2IhlRjah8r6n6987BfEr7/Z60RmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjoLyXsNlzpxotdgrYjsR//97d+kvvvs+UcjswWxQMQqnttEhPHK1vTSMAAlTfRHA
 5LSgqhaOmInCX0eeFcpyF5iHKpLea65MhHt+t/1v/nHZ6Zkp2vbl4NS9IwiRO7PnXb
 CbTYjQsSFqMNIER6gT6g7WfankxsdeuUBB225vP4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDY6MTQ6NDFBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KClJldmlld2VkLWJ5
OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKPiBTaWduZWQtb2ZmLWJ5
OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2dwdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYwo+IGluZGV4IDBhNGM3N2Zi
M2Q5NC4uZTMyMzI1OWExNmQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dwdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKPiBAQCAtMTA2LDcg
KzEwNiw3IEBAIHN0YXRpYyB2b2lkIG1zbV9kZXZmcmVxX2luaXQoc3RydWN0IG1zbV9ncHUgKmdw
dSkKPiAgCSAqLwo+ICAKPiAgCWdwdS0+ZGV2ZnJlcS5kZXZmcmVxID0gZGV2bV9kZXZmcmVxX2Fk
ZF9kZXZpY2UoJmdwdS0+cGRldi0+ZGV2LAo+IC0JCQkmbXNtX2RldmZyZXFfcHJvZmlsZSwgInNp
bXBsZV9vbmRlbWFuZCIsIE5VTEwpOwo+ICsJCQkmbXNtX2RldmZyZXFfcHJvZmlsZSwgREVWRlJF
UV9HT1ZfU0lNUExFX09OREVNQU5ELCBOVUxMKTsKPiAgCj4gIAlpZiAoSVNfRVJSKGdwdS0+ZGV2
ZnJlcS5kZXZmcmVxKSkgewo+ICAJCURSTV9ERVZfRVJST1IoJmdwdS0+cGRldi0+ZGV2LCAiQ291
bGRuJ3QgaW5pdGlhbGl6ZSBHUFUgZGV2ZnJlcVxuIik7Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKVGhl
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVy
b3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
