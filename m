Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5FA9B31CD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB6710E4AD;
	Mon, 28 Oct 2024 13:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ZeIpOcl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51CD10E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:36:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 05B858857C;
 Mon, 28 Oct 2024 14:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730122600;
 bh=VwBscVaP+Tl0PUd7Qv9uXhxuPpHLh55BjcCxcLFQHg8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZeIpOcl9Gj39DAbSx6IR/hhGF4J7TZ8wyFCZE9GixsVFJ/17a/wcF/+38wWc+n5qU
 ZrLYKu8uzDWX2yGaQSmJR8MbAK5sgrySV+aPMj669CCsp9ys8D/JQ9afmXIJgO3H1/
 7HfFWuLWOSabbmwgIRAHRjw3j3VDYKJCeLBNijZObwkuhisvueCe1ojuDQWrfiPmEF
 NcHz0EbXLdaVL14iCMDRdKLa8o/N8qN41lQMVIfqIaK4ycs4a9Y8ad1eVmjN41jYmV
 y73/0P4v0YVLydHHwcmauZZ0OZ9kEMXn4BKaEzi91QkcwUPisuZ4VTZfuVb/PpqVl3
 Qy4Kzvr1Tnuxw==
Message-ID: <0b1ffd41-f8e8-4e75-af35-0f410a34b3ae@denx.de>
Date: Mon, 28 Oct 2024 13:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241026041019.247606-1-marex@denx.de>
 <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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

On 10/28/24 10:25 AM, Maxime Ripard wrote:
> On Sat, Oct 26, 2024 at 06:10:01AM +0200, Marek Vasut wrote:
>> Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
>> bitfields description state "These bits must be multiple of even
>> pixel". It is not possible to simply align every bitfield to the
>> nearest even pixel, because that would unalign the line width and
>> cause visible distortion. Instead, attempt to re-align the timings
>> such that the hardware requirement is fulfilled without changing
>> the line width if at all possible.
>>
>> Warn the user in case a panel with odd active pixel width or full
>> line width is used, this is not possible to support with this one
>> bridge.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/tc358767.c | 63 +++++++++++++++++++++++++++++--
>>   1 file changed, 60 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index 0a6894498267e..7968183510e63 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct tc_data *tc,
>>   	int vsync_len = mode->vsync_end - mode->vsync_start;
>>   	int ret;
>>   
>> +	/*
>> +	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
>> +	 * bitfields description state "These bits must be multiple of even
>> +	 * pixel". It is not possible to simply align every bitfield to the
>> +	 * nearest even pixel, because that would unalign the line width.
>> +	 * Instead, attempt to re-align the timings.
>> +	 */
>> +
>> +	/* Panels with odd active pixel count are not supported by the bridge */
>> +	if (mode->hdisplay & 1)
>> +		dev_warn(tc->dev, "Panels with odd pixel count per active line are not supported.\n");
>> +
>> +	/* HPW is odd */
>> +	if (hsync_len & 1) {
>> +		/* Make sure there is some margin left */
>> +		if (left_margin >= 2) {
>> +			/* Align HPW up */
>> +			hsync_len++;
>> +			left_margin--;
>> +		} else if (right_margin >= 2) {
>> +			/* Align HPW up */
>> +			hsync_len++;
>> +			right_margin--;
>> +		} else if (hsync_len > 2) {
>> +			/* Align HPW down as last-resort option */
>> +			hsync_len--;
>> +			left_margin++;
>> +		} else {
>> +			dev_warn(tc->dev, "HPW is odd, not enough margins to compensate.\n");
>> +		}
>> +	}
>> +
>> +	/* HBP is odd (HPW is surely even now) */
>> +	if (left_margin & 1) {
>> +		/* Make sure there is some margin left */
>> +		if (right_margin >= 2) {
>> +			/* Align HBP up */
>> +			left_margin++;
>> +			right_margin--;
>> +		} else if (hsync_len > 2) {
>> +			/* HPW is surely even and > 2, which means at least 4 */
>> +			hsync_len -= 2;
>> +			/*
>> +			 * Subtract 2 from sync pulse and distribute it between
>> +			 * margins. This aligns HBP and keeps HPW aligned.
>> +			 */
>> +			left_margin++;
>> +			right_margin++;
>> +		} else {
>> +			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensate.\n");
>> +		}
>> +	}
>> +
>> +	/* HFP is odd (HBP and HPW is surely even now) */
>> +	if (right_margin & 1)
>> +		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per full line are not supported.\n");
>> +
> 
> This should all happen in atomic_check, and reject modes that can't be supported.
No, that would reject panels I need to support and which can be 
supported by this bridge.
