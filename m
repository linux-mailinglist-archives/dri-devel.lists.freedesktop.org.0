Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC1A10CB9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56310E3EE;
	Tue, 14 Jan 2025 16:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bk80hWTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ba])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2210E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:53:00 +0000 (UTC)
Message-ID: <c257c80e-c449-4750-b822-94f1d1bd8a57@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736873578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VyXoQKxUrpax9SvM9G5/PJBAbAgUuAfOj1RuNdblDc=;
 b=bk80hWTsnBMcwcqztokimJkzKlxkuPB0BeAD6meFt6cODXl66+iG98JL8Ot5iL+g+jDh4b
 IZtBsj7p4I7gQdJuYJpMGLo9sWFY110zc6O0r6YtKgYpH3TpSwsm3kiRKEWUYDk6qIpGPK
 IVrE1pDEW5JuzUE2WORGB8II1ojkSPs=
Date: Tue, 14 Jan 2025 22:22:51 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
 <4518320e-4699-4026-adbe-b28514bde544@ideasonboard.com>
 <4d2bf1a9-37d8-4f9e-b855-b372179258f2@linux.dev>
 <20250114-hypersonic-amiable-seagull-2d9f8d@houat>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250114-hypersonic-amiable-seagull-2d9f8d@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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



On 1/14/25 22:13, Maxime Ripard wrote:
> On Tue, Jan 14, 2025 at 10:05:56PM +0530, Aradhya Bhatia wrote:
>>
>>
>> On 1/14/25 18:34, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 14/01/2025 13:24, Dmitry Baryshkov wrote:
>>>> On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
>>>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>>>> post_disable call after the crtc disable.
>>>>>
>>>>> The sequence of enable after this patch will look like:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_pre_enable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_pre_enable
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0crtc_enable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0encoder_enable
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_enable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_enable
>>>>>
>>>>> And, the disable sequence for the display pipeline will look like:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_disable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_disable
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0encoder_disable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0crtc_disable
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_post_disable
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_post_disable
>>>>>
>>>>> The definition of bridge pre_enable hook says that,
>>>>> "The display pipe (i.e. clocks and timing signals) feeding this bri=
dge
>>>>> will not yet be running when this callback is called".
>>>>>
>>>>> Since CRTC is also a source feeding the bridge, it should not be en=
abled
>>>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>>>> re-ordering the sequence of bridge pre_enable and bridge post_disab=
le.
>>>>
>>>> The patch contains both refactoring of the corresponding functions a=
nd
>>>> changing of the order. Please split it into two separate commits.
>>>>
>>>>>
>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>>>> ---
>>>>> =C2=A0 drivers/gpu/drm/drm_atomic_helper.c | 300 +++++++++++++++++-=
----------
>>>>> =C2=A0 1 file changed, 181 insertions(+), 119 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> index 5186d2114a50..ad6290a4a528 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> @@ -74,6 +74,12 @@
>>>>> =C2=A0=C2=A0 * also shares the &struct drm_plane_helper_funcs funct=
ion table
>>>>> with the plane
>>>>> =C2=A0=C2=A0 * helpers.
>>>>> =C2=A0=C2=A0 */
>>>>> +
>>>>> +enum bridge_chain_operation_type {
>>>>> +=C2=A0=C2=A0=C2=A0 DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE,
>>>>> +=C2=A0=C2=A0=C2=A0 DRM_BRIDGE_ENABLE_OR_DISABLE,
>>>>> +};
>>>>> +
>>>>
>>>> I have mixed feelings towards this approach. I doubt that it actuall=
y
>>>> helps. Would you mind replacing it with just 'bool pre_enable' / 'bo=
ol
>>>> post_disable' arguments?
>>>
>>> If my memory serves, I suggested the enum. I don't like it too much
>>> either. But neither do I like the boolean that much, as this is not a=

>>> yes/no, on/off case... Then again, maybe boolean is fine here, as the=

>>> "off" case is the "normal/default" case so it's still ok-ish.
>>>
>>> But this doesn't matter much, I think. It's internal, and can be
>>> trivially adjusted later.
>>>
>>
>> Alright! I will drop the enum reference entirely, and just use the
>> booleans.
>=20
> Whatever you do, I think that we're at a point where the bridge chain
> traversal is complicated enough that we'll want to have tests for all
> cases.
>

I don't think I follow. Which all cases are you referring to?


Regards
Aradhya

