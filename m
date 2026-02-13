Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFDpDDcFj2ltHQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 12:04:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E30135671
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 12:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D7810E7D6;
	Fri, 13 Feb 2026 11:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="plpyxtUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9001E10E7D6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770980657;
 bh=4nZFI6B+4DaZ1xwgKXUjqRowetvZjkztwjYyqHMz+xc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=plpyxtUIxFe/gOImlgAHoJUSgVdLvn0eJMXXj/FJyqzIalCK1zIypr0FQ1HGJ1pAY
 3jUR1T9E4is+Xl8N6JbB/VRPv7MsKU5+j0vmn2JyNglpCU2cE5iS1l3xTAuhuIWZdr
 zTUxqpABXVdGZDyZWcLcwXosI8VcXrm0GDQWJvxB9pNXEBYLgXrWIvoeFy+QblZR61
 pJFzBWwLlgs70SJ6t/5WgXMN0faGiFqECbVfofSI9U4Xxtfter8u3iERgGxBCt+Kq2
 l6SxBhdXnys+wtZtINxvexBOgSd/WW9dk1ljzueIJh0+RXPUc0ogy0bjladzq17/aO
 FAnQ+k1oNXTOA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B4A217E1406;
 Fri, 13 Feb 2026 12:04:16 +0100 (CET)
Message-ID: <f73fe751-5812-4f27-b4ad-19f214c6e49a@collabora.com>
Date: Fri, 13 Feb 2026 13:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
 <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
 <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
 <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andyshrk@163.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 94E30135671
X-Rspamd-Action: no action

Hi Andy,

On 2/13/26 9:07 AM, Andy Yan wrote:
> Hello Cristian，
> 
> At 2026-01-16 23:22:11, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> On 1/10/26 11:58 AM, Cristian Ciocaltea wrote:
>>> Hi Andy,
>>>
>>> On 1/10/26 6:00 AM, Andy Yan wrote:
>>>>
>>>>
>>>> Hello Cristian,
>>>> At 2025-12-20 05:47:01, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>>>>> The Rockchip VOP2 display controller allows configuring the background
>>>>> color of each video output port.
>>>>>
>>>>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>>>>> which defaults to solid black, make use of it when programming the
>>>>> hardware.
>>>>>
>>>>> Note the maximum precision allowed by the display controller is 10bpc,
>>>>> while the alpha component is not supported, hence ignored.
>>>>>
>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>> ---
>>>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>>>> 2 files changed, 16 insertions(+), 1 deletion(-)

[...]

>>>>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0); +	/* Background color is
>>>>> programmed with 10 bits of precision */ +	val =
>>>>> FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6); +
>>>>> val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor)
>>>>> >> 6);
>>>>
>>>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
>>>>> DRM_ARGB64_GETB(bgcolor) >> 6);
>>>>
>>>>
>>>> the bit31 of  RK3568_VP_DSP_BG  is bg_display_en， that means when we set a
>>>> background color, we should set this bg_display_en bit.
>>
>> I performed several tests on my ROCK 3A (RK3568), ROCK 4D (RK3576) and ROCK
>> 5B (RK3588) boards and noticed that by setting bg_display_en bit to 1 or 0
>> doesn't have any influence on RK3568 and RK3576, the background color is
>> always active and cannot be disabled.
>>
>> However, flipping the bit to 1 on RK3588 has the unexpected effect of
>> covering the whole screen with the configured color, even when there's an
>> active plane displayed on top. Switching back to 0 makes it work as expected.
>>
>> Therefore I think we should keep this patch as is, unless there's something
>> else we're missing here.
>>
>>>> The default value of this bit is 1, which explains why the patch currently
>>>> works properly even though it doesn't set bit31.
>>>
>>> For some reason, the RK3588 TRM indicates 0x0 for the reset value.  I assume
>>> that's a mistake, as RK3576 TRM shows 0x1.
>>
>> Considering the observation above, it kinda makes sense now for RK3588 to
>> default to 0.
> 
>    I further confirmed with our IC team: for RK3588, RK3528, and RK3562, if
>    the display_enbit is set, the background color will indeed cover all
>    layers. For other chips, this bit has no effect. So ACK

Thanks for clarifying!  

This patch is the only one in the series missing a review, hence could you
please provide your R-b (or A-b) tag on the last revision [1]? 

Regards,
Cristian

[1] https://lore.kernel.org/all/20260204-rk3588-bgcolor-v7-4-78d1d01c5ca1@collabora.com/
