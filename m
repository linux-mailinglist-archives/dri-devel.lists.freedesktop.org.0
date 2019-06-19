Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6414C0B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 20:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEB96E44E;
	Wed, 19 Jun 2019 18:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292F76E44D;
 Wed, 19 Jun 2019 18:21:54 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0CEAD60A63; Wed, 19 Jun 2019 18:21:53 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DB4446019D;
 Wed, 19 Jun 2019 18:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB4446019D
Date: Wed, 19 Jun 2019 12:21:50 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
 david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup
 functions
Message-ID: <20190619182149.GD17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
 david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560968514;
 bh=ZVW7rMnSzf5tgpVqQWif1NMUXOC0s7ohk9A350pigjQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=O6dgRUsjCJRtoWbxywsl0jTz5cbqgwukxfuEroxRxMDj+DWNGWXY8ECwi20d3Kasa
 bNfTeZemL7yDf1qvcVds6efN9HIbm1pwq9WGj/9ilxl0tX6JvK2S2M5/MWpbZRDzGT
 AHFK0W+iOiMhYcTIruJLMcNpW1qBjkE56IhyOTuA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560968513;
 bh=ZVW7rMnSzf5tgpVqQWif1NMUXOC0s7ohk9A350pigjQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JM2dl7TzVPPe6ioGsZSuYsPfSg370cRaYcWa6PiMhi1S4nLFzU0BXt8aY+t3yE1Pp
 8dSCB0hwBAWf9OGjGCDxJLE7I8FT1M0CgBNj7ut5gyrjFZCqsG3jwOAMlLc7dEBIDV
 7SY//+eypfsd6xRkbMjRPEMJQRvLCXAAKF7lt6t4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MTU6MjZQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAwOToyOTozMEFNIC0wNDAwLCBCcmlhbiBN
YXNuZXkgd3JvdGU6Cj4gPiBUaGUgZmlsZXMgYTN4eF9ncHUuYyBhbmQgYTR4eF9ncHUuYyBoYXZl
IGlmZGVmcyBmb3IgdGhlIE9DTUVNIHN1cHBvcnQKPiA+IHRoYXQgd2FzIG1pc3NpbmcgdXBzdHJl
YW0uIEFkZCB0d28gbmV3IGZ1bmN0aW9ucyAoYWRyZW5vX2dwdV9vY21lbV9pbml0Cj4gPiBhbmQg
YWRyZW5vX2dwdV9vY21lbV9jbGVhbnVwKSB0aGF0IHJlbW92ZXMgc29tZSBkdXBsaWNhdGVkIGNv
ZGUuIFdlIGFsc28KPiA+IG5lZWQgdG8gY2hhbmdlIHRoZSBpZmRlZiBjaGVjayBmb3IgQ09ORklH
X01TTV9PQ01FTSB0byBDT05GSUdfUUNPTV9PQ01FTQo+ID4gbm93IHRoYXQgT0NNRU0gc3VwcG9y
dCBpcyB1cHN0cmVhbS4KClNvcnJ5IGZvciByZXZpZXdpbmcgdjEgd2hlbiB0aGVyZSB3YXMgYSB2
MiBpbiBmbGlnaHQuIFRoYXQgd2lsbCB0ZWFjaCBtZSB0byBub3QKa2VlcCB1cCBvbiBteSBlbWFp
bC4gSSB0aGluayB5b3UgY2F1Z2h0IG1vc3Qgb2YgdGhpcywgYnV0IGEgZmV3IHRoaW5ncyBJIHN0
aWxsCnNhdy4KCjxzbmlwPgoKSm9yZGFuCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5k
YXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
