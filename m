Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86B886828
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 09:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184768920E;
	Fri, 22 Mar 2024 08:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="xZjofxik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694DC8920E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 08:23:13 +0000 (UTC)
Message-ID: <c72dc505-b4a5-497a-a552-478a85802740@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711095787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ui2IPNZsX4CSRNzI/OLf3IH5LIxi4EBGIXn9KUJ55bM=;
 b=xZjofxik9DBX5SChh8fIV/pAzUO0DNnXK1AsUbDae9mRzs17FaXlIecP7OYEbObixZWgdo
 5KWBSyT1aU+iANlThm6Z0Ahk3zZYplCA8t5yDnZRY7um0AW0GyPBvxp8DkQTLqy1fvW1uR
 PBX9gLs9+5IFHNxj2rWSmqrrzc30t1s=
Date: Fri, 22 Mar 2024 16:22:56 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20240320093738.6341-1-tzimmermann@suse.de>
 <20240320093738.6341-13-tzimmermann@suse.de>
 <20240321-elated-optimal-lion-7ae26a@houat>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240321-elated-optimal-lion-7ae26a@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/21 22:09, Maxime Ripard wrote:
> Hi,
>
> On Wed, Mar 20, 2024 at 10:34:17AM +0100, Thomas Zimmermann wrote:
>> +/**
>> + * drm_connector_helper_detect_ctx - Read EDID and detect connector status.
>> + * @connector: The connector
>> + * @ctx: Acquire context
>> + * @force: Perform screen-destructive operations, if necessary
>> + *
>> + * Detects the connector status by reading the EDID using drm_probe_ddc(),
>> + * which requires connector->ddc to be set. Returns connector_status_connected
>> + * on success or connector_status_disconnected on failure.
>> + *
>> + * Returns:
>> + * The connector status as defined by enum drm_connector_status.
>> + */
>> +int drm_connector_helper_detect_ctx(struct drm_connector *connector,
>> +				    struct drm_modeset_acquire_ctx *ctx,
>> +				    bool force)
>> +{
>> +	struct i2c_adapter *ddc = connector->ddc;
>> +
>> +	if (!ddc)
>> +		return connector_status_unknown;
>> +
>> +	if (drm_probe_ddc(ddc))
>> +		return connector_status_connected;
>> +
>> +	return connector_status_disconnected;
>> +}
>> +EXPORT_SYMBOL(drm_connector_helper_detect_ctx);
> I think it would be better to make it more obvious that we rely on DDC
> to detect and we shouldn't consider it a generic helper that would work
> in all cases.
>
> drm_connector_helper_detect_probe_ddc maybe?

Yeah, the function name(drm_connector_helper_detect_ctx) is a little bit of casual.
So a better name is preferred.


> Maxime

-- 
Best regards,
Sui

