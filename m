Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED534869A4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3522C10E783;
	Thu,  6 Jan 2022 18:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1627 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jan 2022 13:18:55 UTC
Received: from wizzup.org (mail.wizzup.org [95.217.97.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BBC10F067
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org; 
 s=mail;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nxhH/ukA9KWfY1p+zkFD+7VrSnCLJzCz3XNlG4Obn3w=; b=IvmV79CkASz7lYETsk4Z/zNT3g
 +/xWGuiHSS9+cmLLkodm18hu5EMb3afWn5eZGkdOC0AliZQdFBTyv+S8r8VjJ7zJ2U2zH3keizYpF
 FuxjokRZWtSRq7MzAJndfpwSfedgi9ojTfiitiwNySC8BWlkChl+wvstWdYaJtVy9SDW0bW8t6zPx
 mr4mBP7L7548WHnXdrsnIXcUMwcjuYc3D4BGcjPCG1HWOPCDMJ1iAx0lONQBnDMfQwKwvOIY1Eu/j
 p3PEriurY3/8Ep3pG7LlHvEYCR8DXA/29WmcKjUAZzXxBMkdGXHRRESqmADXnFHvyCOzsiP44vjFz
 W86gE3/w==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
 by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.94.2) (envelope-from <merlijn@wizzup.org>)
 id 1n5SF2-00046Q-S3; Thu, 06 Jan 2022 12:51:40 +0000
Subject: Re: [Openpvrsgx-devgroup] [PATCH] drm: omapdrm: Fix implicit dma_buf
 fencing
To: Tony Lindgren <tony@atomide.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <Yda6VhRLHw06yVst@atomide.com>
From: Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <7edd09bf-7f2c-3ffd-b3ee-c0daaf0d6e37@wizzup.org>
Date: Thu, 6 Jan 2022 13:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Yda6VhRLHw06yVst@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 06 Jan 2022 18:20:20 +0000
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
Cc: philipp@uvos.xyz, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/01/2022 10:45, Tony Lindgren wrote:
> * Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [220105 15:38]:
>> Fix that by initializing dma_buf resv to the resv of the gem object being
>> exported.
> 
> Nice find! This also fixes my wlroots test case with termite running on
> sway where termite would only partially update when switching between
> desktops, so:
> 
> Tested-by: Tony Lindgren <tony@atomide.com>

You can also add my:

Tested-by: Merlijn Wajer <merlijn@wizzup.org>

Cheers,
Merlijn
