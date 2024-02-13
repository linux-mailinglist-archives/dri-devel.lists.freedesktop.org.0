Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A34B852D38
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 10:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7580110E25D;
	Tue, 13 Feb 2024 09:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u9tCx31Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED57710E25D;
 Tue, 13 Feb 2024 09:58:03 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi
 [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9077483F;
 Tue, 13 Feb 2024 10:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707818280;
 bh=ouU1j20z/DfnqBG1Em7H9dgwI4BCmGk+z++d4OjXHp8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u9tCx31ZXCFfMqP6b3Gs/BxmSZqZITtXjB+joWze2vCyyunePuw0czpSUr4Eo1G+E
 W8hU5bg54q0ZfFA214nxgbsnf8t7/LluA886tLmrajr02rOAGThYwLOCeAvDu0w0/j
 4emXSYZVJJ6T2fHQalqCuLIvvxxATrINegGD1nM4=
Message-ID: <bb8089cd-2a57-4ed0-a8bd-2140a89b0887@ideasonboard.com>
Date: Tue, 13 Feb 2024 11:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/tidss: Fix initial plane zpos values
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Randolph Sapp <rs@ti.com>
References: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
 <20240213-tidss-fixes-v1-1-d709e8dfa505@ideasonboard.com>
 <20240213110440.13af335a@eldfell>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240213110440.13af335a@eldfell>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 13/02/2024 11:04, Pekka Paalanen wrote:
> On Tue, 13 Feb 2024 10:16:36 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> When the driver sets up the zpos property it sets the default zpos value
>> to the HW id of the plane. That is fine as such, but as on many DSS
>> versions the driver arranges the DRM planes in a different order than
>> the HW planes (to keep the non-scalable planes first), this leads to odd
>> initial zpos values. An example is J721e, where the initial zpos values
>> for DRM planes are 1, 3, 0, 2.
>>
>> In theory the userspace should configure the zpos values properly when
>> using multiple planes, and in that sense the initial zpos values
>> shouldn't matter, but there's really no reason not to fix this and help
>> the userspace apps which don't handle zpos perfectly. In particular,
>> Weston seems to have issues dealing with the planes with the current
>> default zpos values.
>>
>> So let's change the zpos values for the DRM planes to 0, 1, 2, 3.
>>
>> Another option would be to configure the planes marked as primary planes
>> to zpos 0. On a two display system this would give us plane zpos values
>> of 0, 0, 1, 2. The end result and behavior would be very similar in this
>> option, and I'm not aware that this would actually help us in any way.
>> So, to keep the code simple, I opted for the 0, 1, 2, 3 values.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> 
> Hi Tomi,
> 
> have you reported this to Weston? What exactly is the problem?

I haven't. I'm quite unfamiliar with Weston, and Randolph from TI (cc'd) 
has been working on the Weston side of things. I also don't know if 
there's something TI specific here, as the use case is with non-mainline 
GPU drivers and non-mainline Mesa. I should have been a bit clearer in 
the patch description, as I didn't mean that upstream Weston has a bug 
(maybe it has, maybe it has not).

The issue seen is that when Weston decides to use DRM planes for 
composition, the plane zpositions are not configured correctly (or at 
all?). Afaics, this leads to e.g. weston showing a window with a DRM 
"overlay" plane that is behind the "primary" root plane, so the window 
is not visible. And as Weston thinks that the area supposedly covered by 
the overlay plane does not need to be rendered on the root plane, there 
are also artifacts on that area.

Also, the Weston I used is a bit older one (10.0.1), as I needed to go 
back in my buildroot versions to get all that non-mainline GPU stuff 
compiled and working. A more recent Weston may behave differently.

> It doesn't seem like a good idea to work around userspace bugs
> (non-regression, I presume?) with kernel changes.

Presuming this is not related to any TI specific code, I guess it's a 
regression in the sense that at some point Weston added the support to 
use planes for composition, so previously with only a single plane per 
display there was no issue.

I agree with you, this patch shouldn't be merged to "fix" issues with 
tidss + Weston. However, the current default zpos values really don't 
make sense, so I think this patch can stand on its own, and should be 
merged just to make the tidss behavior a bit saner.

But even if this patch merged, the issue with Weston should be looked at 
(*poke* Randolph =).

  Tomi

> 
> 
> Thanks,
> pq
> 
>> ---
>>   drivers/gpu/drm/tidss/tidss_plane.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
>> index e1c0ef0c3894..68fed531f6a7 100644
>> --- a/drivers/gpu/drm/tidss/tidss_plane.c
>> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
>> @@ -213,7 +213,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
>>   
>>   	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
>>   
>> -	drm_plane_create_zpos_property(&tplane->plane, hw_plane_id, 0,
>> +	drm_plane_create_zpos_property(&tplane->plane, tidss->num_planes, 0,
>>   				       num_planes - 1);
>>   
>>   	ret = drm_plane_create_color_properties(&tplane->plane,
>>
> 

