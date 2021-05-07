Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4682376B2D
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 22:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A46C6E573;
	Fri,  7 May 2021 20:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ABA6E570;
 Fri,  7 May 2021 20:33:08 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 1621FC800A2;
 Fri,  7 May 2021 22:33:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OmTbmMgJ_Wnx; Fri,  7 May 2021 22:33:06 +0200 (CEST)
Received: from [IPv6:2003:e3:7f12:f200:d51b:e97d:b8e4:23b2]
 (p200300E37f12F200d51be97dB8e423B2.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f12:f200:d51b:e97d:b8e4:23b2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 53E38C800A1;
 Fri,  7 May 2021 22:33:06 +0200 (CEST)
Subject: Re: [PATCH v6 1/3] drm/i915/display: New function to avoid duplicate
 code in upcomming commits
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
 <20210507084903.28877-2-wse@tuxedocomputers.com> <YJV9HA5IuQW+KWOf@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <d3e95927-1b6e-d508-9677-fbf213921b49@tuxedocomputers.com>
Date: Fri, 7 May 2021 22:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJV9HA5IuQW+KWOf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.05.21 um 19:47 schrieb Ville Syrjälä:

> On Fri, May 07, 2021 at 10:49:01AM +0200, Werner Sembach wrote:
>> Moves some checks that later will be performed 2 times to an own function.
>> This avoids duplicate code later on.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdmi.c | 41 ++++++++++++++---------
>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 46de56af33db..576d3d910d06 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -1861,6 +1861,31 @@ static int intel_hdmi_port_clock(int clock, int bpc)
>>  	return clock * bpc / 8;
>>  }
>>  
>> +static enum drm_mode_status
>> +intel_hdmi_mode_clock_valid(struct intel_hdmi *hdmi, int clock, bool has_hdmi_sink)
>> +{
>> +	struct drm_device *dev = intel_hdmi_to_dev(hdmi);
>> +	struct drm_i915_private *dev_priv = to_i915(dev);
>> +	enum drm_mode_status status;
>> +
>> +	/* check if we can do 8bpc */
>> +	status = hdmi_port_clock_valid(hdmi, clock, true, has_hdmi_sink);
>> +
>> +	if (has_hdmi_sink) {
>> +		/* if we can't do 8bpc we may still be able to do 12bpc */
>> +		if (status != MODE_OK && !HAS_GMCH(dev_priv))
>> +			status = hdmi_port_clock_valid(hdmi, clock * 3 / 2,
> Seems we've lost intel_hdmi_port_clock() here somehow.

Yes, I think it happened when I rebased from torvalds/master to drm-tip/drm-tip.

Thanks for pointing it out. Fixed.

>
>> +						       true, has_hdmi_sink);
>> +
>> +		/* if we can't do 8,12bpc we may still be able to do 10bpc */
>> +		if (status != MODE_OK && INTEL_GEN(dev_priv) >= 11)
>> +			status = hdmi_port_clock_valid(hdmi, clock * 5 / 4,
> Also here.
>
>> +						       true, has_hdmi_sink);
>> +	}
>> +
>> +	return status;
>> +}
>> +
>>  static enum drm_mode_status
>>  intel_hdmi_mode_valid(struct drm_connector *connector,
>>  		      struct drm_display_mode *mode)
>> @@ -1891,21 +1916,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
>>  	if (drm_mode_is_420_only(&connector->display_info, mode))
>>  		clock /= 2;
>>  
>> -	/* check if we can do 8bpc */
>> -	status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 8),
>> -				       true, has_hdmi_sink);
>> -
>> -	if (has_hdmi_sink) {
>> -		/* if we can't do 8bpc we may still be able to do 12bpc */
>> -		if (status != MODE_OK && !HAS_GMCH(dev_priv))
>> -			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 12),
>> -						       true, has_hdmi_sink);
>> -
>> -		/* if we can't do 8,12bpc we may still be able to do 10bpc */
>> -		if (status != MODE_OK && DISPLAY_VER(dev_priv) >= 11)
>> -			status = hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 10),
>> -						       true, has_hdmi_sink);
>> -	}
>> +	status = intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
>>  	if (status != MODE_OK)
>>  		return status;
>>  
>> -- 
>> 2.25.1
