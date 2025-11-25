Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCEC86F6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185E110E03B;
	Tue, 25 Nov 2025 20:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lrPAHpiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA6F10E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:13:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dGDQV3nJqz9tSw;
 Tue, 25 Nov 2025 21:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764101586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsVOLzBSeKtoAQQQH0qiBRV/hPqVXnOfBSVioSqYRf4=;
 b=lrPAHpiFnx9xOq019X6ifzEa8ROVfvrQYX+VhwpRI20YreNVIsWtNMbWwOsSavDBX0ysyG
 /zwpYQGWqoQCYzkePZgsg8/LHAirvSh1+HG+7lw8uXfS4NWJGrVMd+2CsVIaIwXIOdOhZR
 op2zRGFgpdmiaUqZOkcYburIj6L6oj5ZAjwFx/rwryleB13NTnOkraGIe4NtkPzOYiR5HJ
 64ofJibih44ENRlI3mTQN4gT5EDR7GB5xXi1LpBd6nf1iPi1BflB42FciK2wpRVrE77Jax
 vzOTgTDT18bLxVTA1tpGIcF+b8fwq9KhUUbd2vnYylHiVStSNwmPm9pituwsCA==
Message-ID: <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
Date: Tue, 25 Nov 2025 21:13:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
 <20251107232329.GI5558@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251107232329.GI5558@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ts8k8bwp1efza9rj18i4ba15i8a3zj56
X-MBO-RS-ID: e53d64192f6dd2becd5
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

On 11/8/25 12:23 AM, Laurent Pinchart wrote:
> On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.
> 
> Could you please explain what broke ?

Consider mode->flags, V-ones for simplicity:

Before 94fe479fae96 :

DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW

After 94fe479fae96 :

DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke

The "Neither" case behavior is different. I did not realize that:

DRM_MODE_FLAG_N[HV]SYNC is not equivalent !DRM_MODE_FLAG_P[HV]SYNC

They really are not equivalent .

[...]

>>   	/* Configuration for Video Parameters, input is always RGB888 */
>>   	vprmset0r = TXVMVPRMSET0R_BPP_24;
>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
>> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>   		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> 
> I don't think this restores the previous behaviour. You would need to
> write
> 
> 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
This patch covers both the N[HV]SYNC and !P[HV]SYNC , so that should 
restore the behavior to "Before" and explicitly be clear that N[HV]SYNC 
and !P[HV]SYNC are not the same thing.
