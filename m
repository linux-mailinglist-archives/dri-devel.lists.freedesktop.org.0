Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1587FB92
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 11:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E4E10F969;
	Tue, 19 Mar 2024 10:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hC38Sz3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD4810F969
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710843228; x=1742379228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0W+nJi3yYCfN5hkAfYD99hxt6TpEuQU2BMPMHMXuEbI=;
 b=hC38Sz3Bwj3Cp2afd/aaLmGSIF+88/VSGZX9EHspyaNAY0uODkVL3Qu7
 yYBtzjR0Vb3eD30Cdktcdk5wCkwxGnLDGdcjGywb7uT7EPXkyepeF5Bvg
 IFnDOFcb4GMgEkgVl7DQkMwNfxeY0s97YPNmHqTdEcLtyDU2cuccW9nPJ
 FK6KJPGdUJ4L+DksuiEXiC4QVQHM0jc4/uPiGZ6gu+/wLkDaS6zxMZazq
 y9M0ey/um5Ybn2QM/YNMGRZBcaQ5NMUmwuSj5fLs4h/gS/RyOONDfxvT8
 L2KJwO4XhbOiWyTJP/oqdXGNb6vynCKZ6BhcrrFcn3Xl/UX9ZNhQCtVod g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5878656"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5878656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 03:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="44707250"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 03:13:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 12/12] drm/ast: Implement polling for VGA and SIL164
 connectors
In-Reply-To: <87le6eo7p2.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240319081430.10165-1-tzimmermann@suse.de>
 <20240319081430.10165-13-tzimmermann@suse.de>
 <20240319-pragmatic-wonderful-ferret-63e7ad@houat>
 <5198707e-d2b8-49b9-a59f-4df866b5ca2b@suse.de> <87le6eo7p2.fsf@intel.com>
Date: Tue, 19 Mar 2024 12:13:41 +0200
Message-ID: <87il1io7fu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 19 Mar 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 19 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 19.03.24 um 10:37 schrieb Maxime Ripard:
>>> Hi,
>>>
>>> On Tue, Mar 19, 2024 at 09:00:32AM +0100, Thomas Zimmermann wrote:
>>>> Implement polling for VGA and SIL164 connectors. Set the flag
>>>> DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
>>>> monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
>>>> for each type of connector by testing for EDID data. The code for
>>>> both types of connectors is identical for now. Maybe this can later
>>>> become a common helper function for various drivers.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>   drivers/gpu/drm/ast/ast_mode.c | 36 ++++++++++++++++++++++++++++++++--
>>>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>>>> index 71cc681d6188f..f740b8706a38b 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -1344,8 +1344,24 @@ static int ast_crtc_init(struct drm_device *dev)
>>>>    * VGA Connector
>>>>    */
>>>>   
>>>> +static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
>>>> +					       struct drm_modeset_acquire_ctx *ctx,
>>>> +					       bool force)
>>>> +{
>>>> +	enum drm_connector_status status = connector_status_disconnected;
>>>> +	const struct drm_edid *edid;
>>>> +
>>>> +	edid = drm_edid_read(connector);
>>>> +	if (edid)
>>>> +		status = connector_status_connected;
>>>> +	drm_edid_free(edid);
>>>> +
>>>> +	return status;
>>>> +}
>>>> +
>>> Yeah, I think it would be worth turning it into a helper. We have a
>>> number of drivers using some variation of that already
>>> (display-connector, loongson).
>>>
>>> It's probably better to use drm_probe_ddc here too instead of parsing
>>> and updating the EDID property each time we call detect.
>>
>> I see. I'll update the patch accordingly. drm_probe_ddc() doesn't update 
>> the property, which is probably better anyway.
>
> The struct drm_edid based drm_edid_read() and friends do *not* parse the
> EDID (apart from what's necessary to read the EDID) nor update the EDID
> property. You need to call drm_edid_connector_update() separately for
> that. This is by design.
>
> The struct edid based drm_get_edid() does parse and update the property,
> and I think adding that was a mistake that a lot of drivers later
> depended on, and couldn't be removed.
>
> As a design consideration, IMO it's also a fine approach to read and
> cache the EDID and update the property at ->detect, and then use
> drm_edid_connector_add_modes() in ->get_modes to avoid re-reading the
> EDID at that time. It's not uncommon to need stuff from the EDID between
> those hooks.

But if drm_probe_ddc() at ->detect and drm_connector_helper_get_modes()
for ->get_modes are sufficient, nothing wrong with that either.

BR,
Jani.

>
>
> BR,
> Jani.

-- 
Jani Nikula, Intel
