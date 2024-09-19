Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17F97CE79
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 22:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C6310E296;
	Thu, 19 Sep 2024 20:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="m707pfNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193DE10E296
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1726778091;
 bh=zz0FhRzCqVonO5BnvIqXHA8hVDwCov/EtnoRwJVPDww=;
 b=m707pfNklfj/F8bhdreoIYRnK6174Bsmox46pbvtGF+gFGVjCH6xcUJuOyK/ZIVso23Z+1X+m
 W8TlEP0LE067dPNfiu0Bj5gLqO8RSDmILIRlW03DNqnDwb5Hmcs1YvrPwINgO6gnrNfgcZ0OHMQ
 nW94IXG8eoC3CKG2KIXK9FZCEWhMU0PRkWN58ZCBK+jzKQ5k1qsBe9PoaumAZNPiHSeWcD/+VPU
 U8+gYLkvGGJawYU7CdRrzeAaGwZK9PSEzO6w9a6O7YL2/TIHkLMTGcl7Y15VRBuq6wai0bcn5Bf
 4eFpFaMXqEho5m61UR1zNR3QVvCRf4QjEsqzGUEKHaqQ==
Message-ID: <0dcb03be-dae1-4dcb-84d8-6ec204eab6ba@kwiboo.se>
Date: Thu, 19 Sep 2024 22:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] drm: bridge: dw_hdmi: Update EDID during hotplug
 processing
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-10-jonas@kwiboo.se>
 <4bc6a5e6-f2cf-43ab-8555-4f8aaf9f2cd0@linaro.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <4bc6a5e6-f2cf-43ab-8555-4f8aaf9f2cd0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ec8ae664435c8d6510ab67
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

Hi Neil,

On 2024-09-13 10:02, Neil Armstrong wrote:
> On 08/09/2024 15:28, Jonas Karlman wrote:
>> Update successfully read EDID during hotplug processing to ensure the
>> connector diplay_info is always up-to-date.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> v2: No change
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index c19307120909..7bd9f895f03f 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2457,6 +2457,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>>   
>>   	status = dw_hdmi_detect(hdmi);
>>   
>> +	/* Update EDID during hotplug processing (force=false) */
>> +	if (status == connector_status_connected && !force) {
>> +		const struct drm_edid *drm_edid;
>> +
>> +		drm_edid = dw_hdmi_edid_read(hdmi, connector);
>> +		if (drm_edid)
>> +			drm_edid_connector_update(connector, drm_edid);
>> +		cec_notifier_set_phys_addr(hdmi->cec_notifier,
>> +			connector->display_info.source_physical_address);
>> +		drm_edid_free(drm_edid);
>> +	}
>> +
>>   	if (status == connector_status_disconnected)
>>   		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>>   
> 
> I wonder why we should read edid at each dw_hdmi_connector_detect() call,
> AFAIK it should only be when we have HPD pulses

That is what this change intends to help do.

As stated in the short comment EDID is only updated at HPD processing,
i.e. when force=false. To be on the safe side EDID is also only updated
here when connected and EDID could be read.

drm_helper_probe_detect() is called with force=true in the
fill_modes/get_modes call path that is triggered by userspace
or the kernel kms client.

After a HPD interrupt the call to drm_helper_hpd_irq_event() will call
check_connector_changed() that in turn calls drm_helper_probe_detect()
with force=false to check/detect if connector status has changed. It is
in this call chain the EDID may be read and updated in this detect ops.

Reading EDID here at HPD processing may not be fully needed, however it
help kernel keep the internal EDID state in better sync with sink when
userspace does not act on the HOTPLUG=1 uevent.

Regards,
Jonas

> 
> Neil

