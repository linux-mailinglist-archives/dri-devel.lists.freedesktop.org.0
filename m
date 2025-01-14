Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D0A10C60
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BF910E3ED;
	Tue, 14 Jan 2025 16:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="FRErAOO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9B410E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:36:08 +0000 (UTC)
Message-ID: <4d2bf1a9-37d8-4f9e-b855-b372179258f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736872566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WK/2Pg2t+qxTEB0vGf5T50Gledo/oPMXj73rdxBooow=;
 b=FRErAOO/f8CRafOfq+9JlUil0BEiGMlXrcS9X6h7mJlus+gaoAPm2PLxPs21IOHheKlZhk
 IQl9bUdZ5r/az+OqwscgFt12/sujxERh59LubUEmtQDU4OHoUGlAvsuLwiGP1aDD1NkINs
 vEAuYr8LSOzPOLZzuBS/ojSX2rSsKas=
Date: Tue, 14 Jan 2025 22:05:56 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
 <4518320e-4699-4026-adbe-b28514bde544@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <4518320e-4699-4026-adbe-b28514bde544@ideasonboard.com>
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



On 1/14/25 18:34, Tomi Valkeinen wrote:
> Hi,
>=20
> On 14/01/2025 13:24, Dmitry Baryshkov wrote:
>> On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>> post_disable call after the crtc disable.
>>>
>>> The sequence of enable after this patch will look like:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_pre_enable
>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_pre_enable
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0crtc_enable
>>> =C2=A0=C2=A0=C2=A0=C2=A0encoder_enable
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_enable
>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_enable
>>>
>>> And, the disable sequence for the display pipeline will look like:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_disable
>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_disable
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0encoder_disable
>>> =C2=A0=C2=A0=C2=A0=C2=A0crtc_disable
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[1]_post_disable
>>> =C2=A0=C2=A0=C2=A0=C2=A0...
>>> =C2=A0=C2=A0=C2=A0=C2=A0bridge[n]_post_disable
>>>
>>> The definition of bridge pre_enable hook says that,
>>> "The display pipe (i.e. clocks and timing signals) feeding this bridg=
e
>>> will not yet be running when this callback is called".
>>>
>>> Since CRTC is also a source feeding the bridge, it should not be enab=
led
>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>> re-ordering the sequence of bridge pre_enable and bridge post_disable=
=2E
>>
>> The patch contains both refactoring of the corresponding functions and=

>> changing of the order. Please split it into two separate commits.
>>
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>> ---
>>> =C2=A0 drivers/gpu/drm/drm_atomic_helper.c | 300 +++++++++++++++++---=
--------
>>> =C2=A0 1 file changed, 181 insertions(+), 119 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 5186d2114a50..ad6290a4a528 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -74,6 +74,12 @@
>>> =C2=A0=C2=A0 * also shares the &struct drm_plane_helper_funcs functio=
n table
>>> with the plane
>>> =C2=A0=C2=A0 * helpers.
>>> =C2=A0=C2=A0 */
>>> +
>>> +enum bridge_chain_operation_type {
>>> +=C2=A0=C2=A0=C2=A0 DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE,
>>> +=C2=A0=C2=A0=C2=A0 DRM_BRIDGE_ENABLE_OR_DISABLE,
>>> +};
>>> +
>>
>> I have mixed feelings towards this approach. I doubt that it actually
>> helps. Would you mind replacing it with just 'bool pre_enable' / 'bool=

>> post_disable' arguments?
>=20
> If my memory serves, I suggested the enum. I don't like it too much
> either. But neither do I like the boolean that much, as this is not a
> yes/no, on/off case... Then again, maybe boolean is fine here, as the
> "off" case is the "normal/default" case so it's still ok-ish.
>=20
> But this doesn't matter much, I think. It's internal, and can be
> trivially adjusted later.
>=20

Alright! I will drop the enum reference entirely, and just use the
booleans.

Regards
Aradhya

