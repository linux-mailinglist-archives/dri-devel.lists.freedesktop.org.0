Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E67D89B7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 22:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18610E8A2;
	Thu, 26 Oct 2023 20:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006B10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1698352404;
 bh=j3tk+oe4LZw1thVxrSHhxg7YiJq4jgOvzV867gqOGjc=;
 b=CqAJyFeIsT6eSLAibN2Oypjza3vA6nY0sMI24lhSgB1RTkaIzK+Tc0rVANje6uUD4fF+UgpmZ
 xMRQb9xbJHO1aePuqQ0GDNQ9wtV6tOuUpcBv3rW/Gvp8fkrBGBMAGhAUhddM7sZe8+zX7LPSymk
 EkAez8fREIeZ0IXRM/oqVQ/02iFJ1fm+2nYbNBTQvj81VaQu3yDP3INoxF4Fsne1UL9GJEcTyEI
 nY/PXyaWZjBB2v9MC2Ji/rJEMI36+P1vs0rH0rYHg8YAe9GeYNYYWCkiZA/D2TqoTJJ5nom8rms
 7Mllq9nGkKJslxE0EPCXUqKvoBheG95kJBpu88ZrKlDQ==
Message-ID: <2307c147-fe6f-4e80-874c-0f306bc6ea81@kwiboo.se>
Date: Thu, 26 Oct 2023 22:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: vop: Fix color for RGB888/BGR888 format
 on VOP full
Content-Language: en-US
To: Christopher Obbard <chris.obbard@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Tomasz Figa
 <tfiga@chromium.org>
References: <20231026191500.2994225-1-jonas@kwiboo.se>
 <ea5a78a59e983e08d02c89718c5c7315e923f170.camel@collabora.com>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <ea5a78a59e983e08d02c89718c5c7315e923f170.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 653acd145956f7edd77b4fc4
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
Cc: Andy Yan <andy.yan@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

On 2023-10-26 22:02, Christopher Obbard wrote:
> Hi Jonas,
> 
> On Thu, 2023-10-26 at 19:14 +0000, Jonas Karlman wrote:
>> Use of DRM_FORMAT_RGB888 and DRM_FORMAT_BGR888 on e.g. RK3288, RK3328
>> and RK3399 result in wrong colors being displayed.
>>
>> The issue can be observed using modetest:
>>
>>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@RG24
>>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@BG24
>>
>> Vendor 4.4 kernel apply an inverted rb swap for these formats on VOP
>> full framework (IP version 3.x) compared to VOP little framework (2.x).
>>
>> Fix colors by applying different rb swap for VOP full framework (3.x)
>> and VOP little framework (2.x) similar to vendor 4.4 kernel.
>>
>> Fixes: 85a359f25388 ("drm/rockchip: Add BGR formats to VOP")
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> 
> Since you missed adding my *-by tags in v2.
> 

Thanks, and sorry about that ;-)

Regards,
Jonas
