Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E321DA0B671
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533D10E661;
	Mon, 13 Jan 2025 12:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nuLdq5Nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF410E657
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736770391;
 bh=7mSkffdXqq8EFA8EUzl/xt+T6ken0cn5qrMnTzg2iwk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nuLdq5NmG2wvmFUUfKToOYvQH4Yy3j8ErnHZB3oyIFXBrLeqRF4NAxDpq69HADsXk
 dItFVsaKZ//uPjw0gK+A+jGSf3zLRXZMP5PDYSQKv+mTiPAo0owESJ6xQfw2wRVjbR
 Wfh4ubDTo5tG1dtHWYvz7MPnblCoiXN7tX8OMKcw1RZbmhCXtCKLIib56DYOYAybUO
 TRrCvd5Ip+2rGaQGn/TMtkEJyHP2xtk/+BNBJd4U9OK1bYBPdv420sDaQPowFbdAEX
 FrnB18ncmVvDEbXqU1SGelu2ZPtuBONL4yP+IXnhYZfO5mud+/3hlzAfgtvyZPiK+Z
 5zGKwERULdvLg==
Received: from [192.168.1.90] (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A37C617E0D9D;
 Mon, 13 Jan 2025 13:13:10 +0100 (CET)
Message-ID: <78046727-0d2a-4ada-b75c-ec2e80e1f560@collabora.com>
Date: Mon, 13 Jan 2025 14:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
 <20250113-piquant-lizard-of-strength-ee5760@houat>
 <aed7387e-196a-4819-b24e-788c925e1dee@collabora.com>
 <CAA8EJpqzGZx0PdPKZMEwf3iv9pfb+Cr6Mrjt+p21rUwN-RiNvQ@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpqzGZx0PdPKZMEwf3iv9pfb+Cr6Mrjt+p21rUwN-RiNvQ@mail.gmail.com>
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

On 1/13/25 2:06 PM, Dmitry Baryshkov wrote:
> On Mon, 13 Jan 2025 at 14:00, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Hi Maxime,
>>
>> On 1/13/25 11:35 AM, Maxime Ripard wrote:
>>> On Sat, Jan 11, 2025 at 12:04:09AM +0200, Cristian Ciocaltea wrote:
>>>> The recently introduced hotplug event handler in the HDMI Connector
>>>> framework attempts to unconditionally read the EDID data, leading to a
>>>> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
>>>> reported.
>>>>
>>>> Ensure the operation is performed only for connectors having the status
>>>> connected or unknown.
>>>>
>>>> Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d56db3221a00085b0 100644
>>>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> @@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>>>>      const struct drm_edid *drm_edid;
>>>>
>>>>      if (status == connector_status_disconnected) {
>>>> +            drm_edid_connector_update(connector, NULL);
>>>
>>> Why is this needed? It's not mentionned in your commit log.
>>
>> The original implementation has it after reading the EDID, but I'm not
>> sure if we need the explicit reset in this case.
>>
>> I was going to submit a new revision switching the order, as Dmitry
>> suggested, or should we simply drop it?
> 
> If the EDID is not available, it needs to be reset.

Thanks for the confirmation - I will mention this in the commit description.

Regards,
Cristian
