Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B77C34BCD
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 10:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEDA10E3AF;
	Wed,  5 Nov 2025 09:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iK0fYayv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4310E3AF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 09:18:41 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F5307E0;
 Wed,  5 Nov 2025 10:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762334205;
 bh=awFhXZzE2IGL8BlXadL+botqVoI6oRQSQbqUNatq/7Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iK0fYayvEOCeiDYBCBeSzVLXgSK31DP/jfxsCcXVDbh4q0y/8US45ZLTRnqQU240s
 VuGnTryI6D1+RntqAL/d3D0GMJBuBSyQQyWOKps7hgNA++JR2F84noF6AdeoYBuDZa
 jlqCEybyrh3kWdVMevLsGt5u9YA4lwYhmKw+6riE=
Message-ID: <123e92ad-fa24-4f08-a1f3-3ed2fd726bcb@ideasonboard.com>
Date: Wed, 5 Nov 2025 11:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, alok.a.tiwari@oracle.com,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 magnus.damm@gmail.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, alok.a.tiwarilinux@gmail.com
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
 <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
 <20251104115729.GB27255@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251104115729.GB27255@pendragon.ideasonboard.com>
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

Hi,

On 04/11/2025 13:57, Laurent Pinchart wrote:
> On Mon, Oct 20, 2025 at 06:06:44PM +0100, Kieran Bingham wrote:
>> Quoting Alok Tiwari (2025-10-17 20:16:21)
>>> The rcar_du_crtc_cleanup() function has a void return type, but
>>> incorrectly uses a return statement with a call to drm_crtc_cleanup(),
> 
> I don't know if it's incorrect as such, but it makes the code more
> readable.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 

Thanks, pushing to drm-misc.

 Tomi

>>> which also returns void.
>>>
>>> Remove the return statement to ensure proper function semantics.
>>> No functional change intended.
>>>
>>> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>>> ---
>>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> index 7e175dbfd892..22bcd7db4195 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
>>
>> This cleanup is called through .destroy which is:
>> 	void (*destroy)(struct drm_crtc *crtc);
>>
>>>         rcar_du_crtc_crc_cleanup(rcrtc);
>>>  
>>> -       return drm_crtc_cleanup(crtc);
>>> +       drm_crtc_cleanup(crtc);
>>
>> and drm_crtc_cleanup is:
>> 	void drm_crtc_cleanup(struct drm_crtc *crtc)
>>
>> So it certainly can't return anything:
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>>  }
>>>  
>>>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
> 

