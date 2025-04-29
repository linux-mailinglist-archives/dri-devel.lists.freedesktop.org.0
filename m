Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB921AA07DE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79410E300;
	Tue, 29 Apr 2025 09:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WAHjDIQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DA10E300
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745920734;
 bh=YPTPXj7GXADEHXOMx1Z4O90ixxizjLkgmi0Dh6J7BJs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WAHjDIQwAJc3o5uxAknbJm5ETVG6FNj2CmTb9v3QxDNUMLgfs1h/Pt/ma+auHcAv0
 YKkl3a3Uv4AGD21pLRgKMt0JBb4bGixVubdE9T2Ycme2PiS274+JonPQGDfi3NBbOX
 EuCg7RdpbeuJgUTYYoylSZnxBFlduZhF42jBYCNMii+f6+3DVzLC1e6EWew/NjbF25
 QglkBRm4moWj4DM0Xxea2dWm2+GPYna1uB516wz/iAUSDcutWRo7LOMjBTe1fDczAP
 8WeBbgbtpBYFM10q3faLrDz100X6epUwmulqFqC3ZnvFnr5cYILcSgwIOHtLrmpaWw
 cM4E50wBKGCrQ==
Received: from [192.168.1.90] (unknown [84.232.140.122])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EA34E17E1073;
 Tue, 29 Apr 2025 11:58:53 +0200 (CEST)
Message-ID: <e54a7f29-c0a0-406a-b907-bb612d80e612@collabora.com>
Date: Tue, 29 Apr 2025 12:58:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID setup
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
 <87cycwy5n4.fsf@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <87cycwy5n4.fsf@intel.com>
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

Hi Jani,

On 4/28/25 12:52 PM, Jani Nikula wrote:
> On Fri, 25 Apr 2025, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>> Factor out the HDMI connector initialization from
>> drm_kunit_helper_connector_hdmi_init_funcs() into a common
>> __connector_hdmi_init() function, while extending its functionality to
>> allow setting custom (i.e. non-default) EDID data.
>>
>> Introduce a macro as a wrapper over the new helper to allow dropping the
>> open coded EDID setup from all test cases.
>>
>> The actual conversion will be handled separately; for now just apply it
>> to drm_kunit_helper_connector_hdmi_init() helper.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
>>  1 file changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..36734639d19a3f279abc4631eb19d5c2b20ca315 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>>  
>>  static
>>  struct drm_atomic_helper_connector_hdmi_priv *
>> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>> -					   unsigned int formats,
>> -					   unsigned int max_bpc,
>> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
>> +__connector_hdmi_init(struct kunit *test,
>> +		      unsigned int formats,
>> +		      unsigned int max_bpc,
>> +		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
>> +		      const char *edid_data, size_t edid_len)
> 
> char* is weird for EDID data, but it's a pre-existing thing, and
> actually making it unsigned char or u8 isn't much better.
> 
> A follow-up could switch edid_data to just const void *, and ditto for
> set_connector_edid() and current_edid member in struct
> drm_atomic_helper_connector_hdmi_priv.

Noted for next revision (if required), otherwise I'll handle it separately.

Thanks,
Cristian
