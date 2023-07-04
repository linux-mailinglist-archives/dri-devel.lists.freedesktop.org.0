Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EF747728
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32DF10E2FD;
	Tue,  4 Jul 2023 16:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6810E2FD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688489140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjYqkhVNVMR4fCflFHOYJ1Y+6qB9JV4s4xx2SvhGU4E=;
 b=XlBLrakl8us0FYf77TGD9m42Mle3pEe0/CDf/0S3nyp6OHnMzmznOJ1wa9YF5hox/yTgLw
 iN1J0lIoRB4gRjxXU09QfQmaLENEhta88ese8JGkh/4V1Xwhw4OCfXPSAwOikHFJEfWpfZ
 tGsKIkSls3uquHbLWDp1szE2LHt3qAM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-7m2okY1KM-GTC2g7wPHKAA-1; Tue, 04 Jul 2023 12:45:36 -0400
X-MC-Unique: 7m2okY1KM-GTC2g7wPHKAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbb0c01e71so33901945e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688489135; x=1691081135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QjYqkhVNVMR4fCflFHOYJ1Y+6qB9JV4s4xx2SvhGU4E=;
 b=SLvzRo0lmWBXz/pKwB/YkVFRGqxQnGNeoWig2440PLNBmPFG4V8ENNBNZtTPDL/cWy
 YYvTqipt5Xca8oUzTxAGO5fv6S00NyliggPNunQtUHRyfis5DL6Uh5bTe0jIcbtIRd59
 iOY4MpKyo9QB5qPVDTCtu/RscMOL7Q9rRgbNIEZVi1BVXHv1wkvPGPOPOD5UaIp/5PUh
 PhbTkdTEe8eLm1RXeIlSDaWdlsQB1X6VOKe4T8gj8brHCUlV7yxyrEagHO/AThTDnEQm
 05VTDJI2L0PbVfa162/WQz6KbzkVwvwWuVq6k4Wg5yxxqFEm8VaEF/JX3qJBAqPB2PsQ
 VeYA==
X-Gm-Message-State: ABy/qLYzotxYiAK3UNVDw2G6FPkxa4/iX6IJlOozutkobXSAG/ureoxL
 HFXaHXFj8qkvONXwgtPunAuqGf4XlzHpu2dKWrcZB/YI6xSZ8XkM6kiA1OqW8CD5EDRfAHQ6pCg
 yNvmJ1Yc7asyZflfDmzV9FmPTKOgf
X-Received: by 2002:a05:600c:2041:b0:3fb:e189:3535 with SMTP id
 p1-20020a05600c204100b003fbe1893535mr2057241wmg.27.1688489135830; 
 Tue, 04 Jul 2023 09:45:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFxt2PUUj0Oo2Fvwi3mT8y1TtP3eCK8ewARbXLZdjxeCGXuHER7IfgzTH6oSLrVSeSktR4vgw==
X-Received: by 2002:a05:600c:2041:b0:3fb:e189:3535 with SMTP id
 p1-20020a05600c204100b003fbe1893535mr2057235wmg.27.1688489135543; 
 Tue, 04 Jul 2023 09:45:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003fa74bff02asm30345726wmb.26.2023.07.04.09.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 09:45:35 -0700 (PDT)
Message-ID: <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
Date: Tue, 4 Jul 2023 18:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jani Nikula <jani.nikula@linux.intel.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <878rbv20dp.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2023 16:54, Jani Nikula wrote:
> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>   EDID on DP")
>> The default resolution is now 640x480 when no monitor is connected.
>> But Aspeed graphics is mostly used in servers, where no monitor
>> is attached. This also affects the "remote" resolution to 640x480, which is
>> inconvenient, and breaks the anaconda installer.
>> So when no EDID is present, set 1024x768 as preferred resolution.
> 
> This conflates "monitor connected" and "EDID present", which are not
> necessarily the same thing.
> 
> The fallback in drm_helper_probe_single_connector_modes() is for no
> modes, but connector status is connected or unknown.

When debugging the issue, I found it surprising that the status is 
"connected" when nothing is plugged in the DP port.
> 
> You could add a connector ->detect callback that returns disconnected
> when there's no display, and the problem should go away. If there's no
> ->detect callback, it'll default to connected.

ok, I'll try that. I don't know how the hardware detect something is 
connected, but looking at the dp code, maybe checking 
"AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.

> 
>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>> index 36374828f6c8..8f7b7cc021c7 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1589,9 +1589,31 @@ static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs
>>   	.get_modes = ast_dp501_connector_helper_get_modes,
>>   };
>>   
>> +static int ast_dp_probe_single_connector_modes(struct drm_connector *connector,
>> +					       uint32_t maxX, uint32_t maxY)
>> +{
>> +	int ret;
>> +	struct drm_display_mode *mode;
>> +
>> +	ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
>> +	/*
>> +	 * When no monitor are detected, DP now default to 640x480
>> +	 * As aspeed is mostly used in remote server, and DP monitors are
>> +	 * rarely attached, it's better to default to 1024x768
>> +	 */
>> +	if (!connector->edid_blob_ptr) {
> 
> Please try not to use connector->edid_blob_ptr for anything in
> drivers. The logic is complicated enough as it is, with the firmware and
> override EDIDs and everything, and makes future refactoring of EDID
> handling harder.

Ok, I will try your other suggestion, and remove this.

Thanks a lot for your comments.

-- 

Jocelyn
> 
> 
> BR,
> Jani.
> 
>> +		list_for_each_entry(mode, &connector->modes, head) {
>> +			if (mode->hdisplay == 1024 && mode->vdisplay == 768)
>> +				mode->type |= DRM_MODE_TYPE_PREFERRED;
>> +			drm_mode_sort(&connector->modes);
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>>   static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>>   	.reset = drm_atomic_helper_connector_reset,
>> -	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.fill_modes = ast_dp_probe_single_connector_modes,
>>   	.destroy = drm_connector_cleanup,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> @@ -1678,7 +1700,7 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
>>   
>>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
>>   	.reset = drm_atomic_helper_connector_reset,
>> -	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.fill_modes = ast_dp_probe_single_connector_modes,
>>   	.destroy = drm_connector_cleanup,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>
>> base-commit: 0adec22702d497385dbdc52abb165f379a00efba
> 

