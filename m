Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611B42828F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 19:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6EB6E158;
	Sun, 10 Oct 2021 17:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A816E158
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 17:13:23 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3D5F883178;
 Sun, 10 Oct 2021 19:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633886001;
 bh=5Am5rOg7SYwiveNiCoMyN3gBy9QWs2EVxIfbOv7dGHE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0HQACaQwh0BG8/V1Acm2LtfGVk2dOPoPfSR1zQorI8hujZpTWHvSHDxQ2jgtx0j8h
 jHZt5cI20XnDEw03sRNRrs6xmied89+GCSh4SGvsAhj2QAUsszj1xofGwT1phuZxrF
 tkJEpTVwjSbvA36Whga7lyUDqyQqd9F30PrzMt2fRmksHGtvuusJqnIHefFNVcj3ar
 BssAfFD/FG565MmJOZ3gLVYAj8LxNx7Ae5kQVcE6fKRgXaR+a818n0nlv1+aUPv/Po
 xbNkiKttEBGyHVhOA8clMD+7Gh9bdSYaX5suvRBSeds5GKcuweRLe++8qXyiHV5oED
 uYzEQ8yMZv1jg==
Subject: Re: [PATCH v6 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211010144919.38392-1-marex@denx.de>
 <20211010144919.38392-2-marex@denx.de> <YWMOpG91v/KxluVj@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <4ea09815-d5db-cb41-8aed-b0bfc9157360@denx.de>
Date: Sun, 10 Oct 2021 19:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWMOpG91v/KxluVj@ravnborg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/21 6:02 PM, Sam Ravnborg wrote:
> Hi Marek,
> On Sun, Oct 10, 2021 at 04:49:19PM +0200, Marek Vasut wrote:
>> Decoder input LVDS format is a property of the decoder chip or even
>> its strapping. Handle data-mapping the same way lvds-panel does. In
>> case data-mapping is not present, do nothing, since there are still
>> legacy bindings which do not specify this property.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> To: dri-devel@lists.freedesktop.org
>> ---
>> V2: - Move the data-mapping to endpoint
>> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>>      - Use .atomic_get_input_bus_fmts for the decoder, separate funcs for encoder
>> V4: - No change
>> V5: - Move the data-mapping property to port@0 , decoder LVDS input
>>      - Add RB from Laurent
>> V6: - Turn missing data-mapping into warning, since the driver does
>>        continue in legacy probing mode without it.
> 
> I assume you will apply the patches.

I can't, I'm still waiting for my drm-misc access.
