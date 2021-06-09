Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5F3A15F4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337676E3F9;
	Wed,  9 Jun 2021 13:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4376E3D3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 13:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+fk3mv9ffvCqAu4Aewr2SlJtqBKj6DnprNXAVOj855w=; b=zjandDfYHqshA7iQHT9Fql8buv
 a3IbpUXDMy0SFjosB2lKVD0NffpbFgfSGaFC1p1cHp620iis+R/zW3zTaiRVBAs/89xH3L/sR1ied
 /oN4jf1rLBq+hsWc3p6iCdo4YXvBtmKO91h/oIyz/mX8NLbFFW1AOFqXxFyaWbqCB/OqEo6yd1J7N
 x3aCnnbfAtr7hBINDKw5KAXSKgeIuDVWrMjR6g7Dum/m72icrQ+tM8jznnS+gSaV+RVSaqmo/1aG2
 gjHs62MSQ9QQGsfB7wLExY98Rqm4MvzWPlH91PVV5ZFDfIEsrUrBdl4BU7s3QFYW5p6GG1C5lGDt9
 qK8blIiA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lqyY0-0002vZ-TE; Wed, 09 Jun 2021 16:47:08 +0300
To: christian.koenig@amd.com
From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Trouble with TTM patches w/nouveau in linux-next
Message-ID: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
Date: Wed, 9 Jun 2021 16:47:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
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
Cc: linux-tegra <linux-tegra@vger.kernel.org>, nouveau@lists.freedesktop.org,
 ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm observing nouveau not initializing recently on linux-next on my 
Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is 
failing when initializing the sync subsystem:

[   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync 
subsystem, -28

I have been bisecting and I have found two patches that affect this. 
Firstly, things first break on

d02117f8efaa drm/ttm: remove special handling for non GEM drivers

starting to return error code -12. Then, at

d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2

the error code changes to the above -28.

If I checkout one commit prior to d79025c7f5e3 and revert d02117f8efaa, 
things work again. There are a bunch of other TTM commits between this 
and HEAD, so reverting these on top of HEAD doesn't work. However, I 
checked that both yesterday's and today's nexts are also broken.

Thank you,
Mikko

