Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35587D42B5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 00:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FE710E28B;
	Mon, 23 Oct 2023 22:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5416410E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 22:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1698100592;
 bh=wM+xQTdMWTyO4bxesxODcq1HkQ/m5t1W25dETDzkkEA=;
 b=vGL0t4lg7LO1B56eQ/jhH2gU0QtuWbHUge5pRcy88wRYxF+Rgkc90x8GB3rVN82SI1Mar8CSy
 Q4ZlDqT2q7QL1Y+EGwdssNu15AuD7Ss5awxZLgaWZXOamC0tvyMcElN3O5vQQnK+MVMDc4rtRdL
 MKOhIpInbCgzl47YDFSyNjzDoP4pbPeCpkr3Ma1YnMEAjiKNI+Wl3g1gEabZIrwHAvOuPnV6hht
 yf7zlzGOTeejHE2YsxDLyYzu/kZWDdW7gfkGEZsKwOJfeenPjzgoQLBpk7ytl8Bseh8YAVes8g7
 jh6KjD4hPJhUakn+q/WsrgCV05MHe+dik4J36rC4zxZw==
Message-ID: <2e3f27a4-48b7-41ae-a686-930ac3deffee@kwiboo.se>
Date: Tue, 24 Oct 2023 00:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
Content-Language: en-US
To: Christopher Obbard <chris.obbard@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231023173718.188102-1-jonas@kwiboo.se>
 <f28f34b1c58a41856eed020b5d02dc3abf1a8e94.camel@collabora.com>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <f28f34b1c58a41856eed020b5d02dc3abf1a8e94.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6536f570a54e5ddc6f4f4641
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
Cc: linux-rockchip@lists.infradead.org, kernel <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

On 2023-10-23 19:52, Christopher Obbard wrote:
> Hi Jonas,
> 
> On Mon, 2023-10-23 at 17:37 +0000, Jonas Karlman wrote:
>> This series add support for displaying 10-bit 4:2:0 and 4:2:2 formats
>> produced
>> by the Rockchip Video Decoder on RK322X, RK3288, RK3328, RK3368 and RK3399.
>> Also include 10-bit 4:4:4 support since VOP can support that also.
>>
>> First patch adds new fourcc 10-bit YUV formats with 4:2:2/4:4:4 sub-
>> sampling.
>> Second patch adds support for displaying the new fourcc formats.
>>
>> These patches have been in use by LibreELEC and other distros for the
>> past 3+ years, hoping they can be merged this time around.
>>
>> A rough libdrm/modetest patch [2] have been used to validate use of
>> NV15, NV20 and NV30 formats on RK3288, RK3328 and RK3399 boards.
>>
>>   modetest -s <connector_id>@<crtc_id>:<mode>-<vrefresh>@<format>
>>
>> Tinker Board R2.0 (rk3288w):
>>   modetest -s 50:1920x1080-60@NV15
>>
>> Rock Pi 4 (rk3399):
>>   modetest -s 52@44:1920x1080-60@NV15
>>
>> Rock64 (rk3328):
>>   modetest -s 42:1920x1080-60@NV15
>>
>> Changes in v5:
>> - Use drm_format_info_min_pitch() for correct bpp
>> - Add missing NV21, NV61 and NV42 formats
>>
>> Changes in v4:
>> - Rework RK3328/RK3399 win0/1 data to not affect RK3368
>>
>> Changes in v3:
>> - No changes, rebased on next-20230616
>> - R-B tags was collected
>>
>> Changes in v2:
>> - Add NV30 format
>> - R-B tags was not collected due to NV30 changes
>>
>> This series is also available at [1] and libdrm/modetest patch at [2].
>>
>> [1] https://github.com/Kwiboo/linux-rockchip/commits/v6.6-rc7-vop-nv15
>> [2] https://github.com/Kwiboo/libdrm/commits/nv15
> 
> Could you open a draft merge request for libdrm upstream at
> https://gitlab.freedesktop.org/mesa/drm pointing to this series? If there are
> subsequent revisions of this series, it'd be great to link that merge request
> in the cover letter.

Have created a draft merge reguest for libdrm/modetest changes now.
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/329

The pattern code could really need some improvements/refactoring, in
current form it should at least be enough to create a test pattern to
help test/validate this series :-)

Regards,
Jonas

> 
> 
> Cheers!
> 
> Chris
> 
>>
>> Jonas Karlman (2):
>>   drm/fourcc: Add NV20 and NV30 YUV formats
>>   drm/rockchip: vop: Add NV15, NV20 and NV30 support
>>
>>  drivers/gpu/drm/drm_fourcc.c                |  8 +++
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 36 ++++++++---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
>>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 66 +++++++++++++++++----
>>  include/uapi/drm/drm_fourcc.h               |  2 +
>>  5 files changed, 96 insertions(+), 17 deletions(-)
>>

