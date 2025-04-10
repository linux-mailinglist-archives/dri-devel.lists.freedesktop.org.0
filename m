Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C23A84099
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 12:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B3710E90A;
	Thu, 10 Apr 2025 10:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OJZSN3kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19A710E90A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744280841;
 bh=zXXMNPMlBd5Xr1/R5eNjns/e1Lpmk3psqxYqnNZU36g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OJZSN3klTVfp3rPCfNWlYOfnomjqGGJfP0ESifLxmcSR/eUlPUhsFOhxTZ/Lcxi6d
 FizJmUxSe4LvSjXaMVZyz6nGJelCGM9gfuw2tVGozqhwM5MUAJWS24Ct3rRdY5EnwF
 J9SBPGF2qEgUWE3tnbTZe5wBk6EAnbRnjYUZVucYakg5+oljulU1UKASAawewhSHQA
 x2fpT9hFsLM4V4izD6nAVVnvsGjUKbEyzGW5knQNQrWtABv5UMyXpIX5+olkKGWBmr
 IcWj167NKd7EaEw7rq4VdQccnSlsNoLtD5I0/eBbnPlOJbZSV4klon9Ae+k4cIEuvZ
 AOD4rDBD0455Q==
Received: from [192.168.1.90] (unknown [82.79.138.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5037017E001F;
 Thu, 10 Apr 2025 12:27:21 +0200 (CEST)
Message-ID: <e54840a9-d699-4ffd-b4a0-77dcf344c233@collabora.com>
Date: Thu, 10 Apr 2025 13:27:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] drm/tests: hdmi: Replace open coded EDID setup
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-10-294d3ebbb4b2@collabora.com>
 <20250409-spectral-persimmon-gorilla-4827ad@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250409-spectral-persimmon-gorilla-4827ad@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/9/25 6:15 PM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:19:59PM +0200, Cristian Ciocaltea wrote:
>> Make use of the recently introduced macros to reduce boilerplate code
>> around EDID setup. This also helps dropping the redundant calls to
>> set_connector_edid().
>>
>> No functional changes intended.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 220 ++++++++-------------
>>  1 file changed, 78 insertions(+), 142 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 284bd9b1418a454d05c4a38263519eb8ae450090..7b2aaee5009ce58e6edf2649e2182c43ba834523 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -751,19 +751,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>>  	struct drm_crtc *crtc;
>>  	int ret;
>>  
>> -	priv = drm_kunit_helper_connector_hdmi_init(test,
>> -						    BIT(HDMI_COLORSPACE_RGB),
>> -						    10);
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB),
>> +				10,
>> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
>>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>>  
>>  	drm = &priv->drm;
>>  	crtc = priv->crtc;
>>  	conn = &priv->connector;
>> -	ret = set_connector_edid(test, conn,
>> -				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>> -	KUNIT_ASSERT_GT(test, ret, 0);
>> -
> 
> Yeah, ok, nvm what I said on the previous patch, it's needed.
> 
>>  	preferred = find_preferred_mode(conn);
>>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>>  
>> @@ -830,19 +826,15 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
>>  	struct drm_crtc *crtc;
>>  	int ret;
>>  
>> -	priv = drm_kunit_helper_connector_hdmi_init(test,
>> -						    BIT(HDMI_COLORSPACE_RGB),
>> -						    10);
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB),
>> +				10,
>> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
> 
> Alignment is off.

Yeah, that's a compromise to get rid of a bunch of checkpatch complaints:

  WARNING: line length of ... exceeds 100 columns

So we ended up with the following instead:

  CHECK: Alignment should match open parenthesis

But at least it's not a warning anymore.

Alternatively, we could maybe come up with a (very) short name for
drm_kunit_helper_connector_hdmi_init_with_edid(), though I'm not what
would that be :-(
