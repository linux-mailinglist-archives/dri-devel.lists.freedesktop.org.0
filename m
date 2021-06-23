Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2AE3B176B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4876E0A8;
	Wed, 23 Jun 2021 09:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839456E0A8;
 Wed, 23 Jun 2021 09:58:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id EE319C8009D;
 Wed, 23 Jun 2021 11:58:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 5EkzRVUYpOD1; Wed, 23 Jun 2021 11:58:50 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:3156:839d:aed8:6ea6]
 (p200300e37f3949003156839daED86Ea6.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:3156:839d:aed8:6ea6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 6935BC80099;
 Wed, 23 Jun 2021 11:58:50 +0200 (CEST)
Subject: Re: [PATCH v4 17/17] drm/amd/display: Add handling for new "Broadcast
 RGB" property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-18-wse@tuxedocomputers.com>
 <20210622102955.1e0488b1@eldfell>
 <ded3d448-4837-f38d-9878-f5d764712db7@tuxedocomputers.com>
 <20210623110156.4791505e@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <ef491826-6aaa-754d-cc89-9190974d8767@tuxedocomputers.com>
Date: Wed, 23 Jun 2021 11:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623110156.4791505e@eldfell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.21 um 10:01 schrieb Pekka Paalanen:
> On Tue, 22 Jun 2021 11:28:57 +0200
> Werner Sembach <wse@tuxedocomputers.com> wrote:
>
>> Am 22.06.21 um 09:29 schrieb Pekka Paalanen:
>>> On Fri, 18 Jun 2021 11:11:16 +0200
>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
>>>  
>>>> This commit implements the "Broadcast RGB" drm property for the AMD GPU
>>>> driver.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 ++++++++++++++-----
>>>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 ++++
>>>>  2 files changed, 21 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 9ffd2f9d3d75..c5dbf948a47a 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -5252,7 +5252,8 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
>>>>  }
>>>>  
>>>>  static enum dc_color_space
>>>> -get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
>>>> +get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>>>> +		       enum drm_mode_color_range preferred_color_range)
>>>>  {
>>>>  	enum dc_color_space color_space = COLOR_SPACE_SRGB;
>>>>  
>>>> @@ -5267,13 +5268,17 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
>>>>  		 * respectively
>>>>  		 */
>>>>  		if (dc_crtc_timing->pix_clk_100hz > 270300) {
>>>> -			if (dc_crtc_timing->flags.Y_ONLY)
>>>> +			if (dc_crtc_timing->flags.Y_ONLY
>>>> +					|| preferred_color_range ==
>>>> +						DRM_MODE_COLOR_RANGE_LIMITED_16_235)
>>>>  				color_space =
>>>>  					COLOR_SPACE_YCBCR709_LIMITED;
>>>>  			else
>>>>  				color_space = COLOR_SPACE_YCBCR709;  
>>> Hi,
>>>
>>> does this mean that amdgpu would be using a property named "Broadcast
>>> RGB" to control the range of YCbCr too?  
>> Yes, because I avoided creating a new property, but I'm not really happy with it either.
>>
>> Possibility 1: Use "Broadcast RGB" for Y'CbCr too and clarify in documentation
>>     - still confusing name
>>     - limited does not mean something a little bit different for Y'CbCr and not strictly 16-235:
>> https://www.kernel.org/doc/html/v5.12/userspace-api/media/v4l/colorspaces-defs.html#c.V4L.v4l2_quantization , but name
>> of option is given by preexisting property
>>
>> Possibility 2: Deprecate "Broadcast RGB" and a a more neutral sounding "preferred color range", with the more neutral
>> sounding "limited" option instead of "Limited 16:235"
>>     - What's the relation between the 2? pq mentioned on the amdgpu
>> gitlab that there is a posibility for userspace to have only the new
>> or the old one shown
> It's just an idea that we could decide to expose only one or the other
> property. It would need to be engineered in code, go through the UAPI
> validation with userspace etc. I'm not aware of this being done before
> exactly like this, but DRM client caps exist.
>
>>     - Alternatively ignore "Broadcast RGB" when "preferred color range" is set and have them coexist?
> Determining "is set" means we would need "unset" value for "preferred
> color range". But there is no notion of who set it. If some KMS client
> decides to set it, then it will likely remain set, even if you next
> start another KMS client who does not use this property - it would just
> confuse users when "Broadcast RGB" silently stopped working while it
> still exists.
Unset would be the "auto" option. But i think this problem exists already e.g. a KMS client is unaware of the new
"preferred color format" property and sets "Broadcast RGB" on intel which does nothing in the case of Y'CbCr.

Since the properties affecting each other, having only one not at default, potentially breaks KMS clients unaware of
them regardless.
>
> So I don't think this is a good solution.
>
> When considering a new property, what I wrote just earlier fit here:
> https://lists.freedesktop.org/archives/dri-devel/2021-June/312248.html
>
> There are more questions that just what does the limited range actually
> mean.
>
>>> That is surprising. If this is truly wanted, then the documentation of
>>> "Broadcast RGB" must say that it applies to YCbCr too.
>>>
>>> Does amdgpu do the same as intel wrt. to the question about whose
>>> responsibility it is to make the pixels at the connector to match the
>>> set range?  
>> I guess the kernel driver does the conversion, but i have to check
>> for both.
>>
>> For Intel I did not change the behavior of Boradcast RGB, but i think
>> it's not clearly specified in the docs where the conversion happens.
> Right, at the very least the current behaviour needs to be documented
> before enrolling this property to any more drivers, so that those
> drivers can then be reviewed to work the same way.
>
> You notice I didn't actually answer your question 1 or 2. I don't know.
> Going with 1 is easy compared to 2, even if the names are awkward but
> it technically shouldn't cause any problems. 2 may or may not be
> better, and until we have answers to which design is better, it's maybe
> best to leave option 2 alone?
OK, I will try to validate the behavior of the Intel driver and be detailed in the documentation, but keep the
implementation like this now (unless the intel driver does something different then I thought ofc).
>
>
> Thanks,
> pq
