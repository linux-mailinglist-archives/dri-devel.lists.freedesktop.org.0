Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552614F2E49
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792610E1ED;
	Tue,  5 Apr 2022 11:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4EF10E1ED
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 11:59:49 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CB5FE83AF6;
 Tue,  5 Apr 2022 13:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649159982;
 bh=cE6DflhCT7hMWHSb4xaingmjoUIuyG+/mg6khThf/hM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VU4EB6x8RfV/JvGSiycgYRGzG4iFFUQvdOa5nybUTK+KsHKZSGlM5gfFYI+rEBhsX
 P3P2AtNRmEyAQ0cWSRSUPcqrxdtn2/pjcEP5H9mLaTSStQhTHq9AuOHjBkQrJ0HJsO
 VJM/P+6jAEZ/j30I/ZO3C05Otr1N3aSN6ckgjqeXpHRNXfDNKVZit0RItE312ZJ5NV
 jt3TLcdI62RvadB5Ae9+YCx7V9kfnU6IOHbBdMpxtHdTjV5vBwh/ggvNeEin27g9HW
 R0VS2FnslCKtAIHkyHoDT7HZup7fA5QuDDZuNHSWeQ5X4eHc8eNDtLqPBZNTKXeAls
 C+1mHqPrXhB8g==
Message-ID: <ed5f4796-aeec-c360-0ccd-1982b4d85a32@denx.de>
Date: Tue, 5 Apr 2022 13:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/22 13:42, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
>> In rare cases, the bridge may not start up correctly, which usually
>> leads to no display output. In case this happens, warn about it in
>> the kernel log.
> 
> Do you know what this is caused by ? It's a bit annoying to add a 10+ms
> delay at start time just to be notified of rare cases.

Could be anything, broken DSI bridge driver, misconfigured DSI link, 
etc. This at least informs the user that the bridge failed to come up, 
before this patch, there was no information about such failure.
