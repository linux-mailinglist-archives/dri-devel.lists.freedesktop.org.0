Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E974AAEB9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 10:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4F910EA76;
	Sun,  6 Feb 2022 09:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E350B10EA76
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 09:59:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46F3983678;
 Sun,  6 Feb 2022 10:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644141553;
 bh=dJCr6qD4kHfY///u0isMNghXwz96q+hhH4ZkW4pAB2s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pogWGWi1aGoYxd0C1F1V6BSKqu2JPC9tooKmKhj71L9Lj+Idgf3aVsszMRZD+EP7J
 CNDwjyr2im6bq/8ikI6MdUBwiHY3I8FElg1Y1i6WgPCvOnmMeQ6hllLjGXOeGqbecZ
 dNxMfEtgq0uph790QhvA0CU/9ha/VxdqrubLLhV63H2pCZFwoMP2+GAQ10l6DVpKMF
 /kU6zFDDPevL/QLCySwo/4E83iijX6vN9uw65pYi06Jq14F/LIfxoDgLtTK4C66vX0
 KgXCvEKO1EenF9jJv+dS7cCBStOof6E1BjA0iv1ugFZaKIXljGEl+PdfjWHEVBZkGL
 5t+aXWKUj0SQg==
Message-ID: <2919d5e6-e520-ac34-371d-1c4473ec97fa@denx.de>
Date: Sun, 6 Feb 2022 10:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/panel: simple: Assign data from panel_dpi_probe()
 correctly
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
References: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
 <Yf2aGFBHuWr6tyXy@ravnborg.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Yf2aGFBHuWr6tyXy@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/22 22:26, Sam Ravnborg wrote:
> On Tue, Feb 01, 2022 at 12:01:53PM +0100, Christoph Niedermaier wrote:
>> In the function panel_simple_probe() the pointer panel->desc is
>> assigned to the passed pointer desc. If function panel_dpi_probe()
>> is called panel->desc will be updated, but further on only desc
>> will be evaluated. So update the desc pointer to be able to use
>> the data from the function panel_dpi_probe().
>>
>> Fixes: 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
>>
>> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> To: dri-devel@lists.freedesktop.org
> 
> Thanks for fixing this
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Applied to drm-misc/drm-misc-fixes , thanks.
