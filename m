Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7867389ED
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11610E4CC;
	Wed, 21 Jun 2023 15:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C9710E4CC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=8+jSZYNVSR48321s/oSCWt0Vx0TuZhHVNXzSvj6Jubw=;
 b=ZMJbFTe/D3Y3fpJsgbD+xG8inBdcqgJJm4S+6tintXoPTGXQ7Y2APOwTQPySoEH+AEvV
 lnahvLL3hgEmCak2r7ltJIJvut9FCvRUr3rgV4bYtQKbAJiYR3BAphQ7077tyUaYdlyPUB
 caU5+aRl66KAgrYL1AUlXXnXjdcIFWJGZXgVs+ZdROmPzZd3X7MDiv0PPYHa19a0MVj1Un
 CM1gKbzCGYVWqei89WIEzlBE1x0wM/2yV66HHD1cKsTcwfZtKTxRmAj+oL4oX6S8pq+LDp
 syffKEZiJiNM9h1K06nMqnOTRvCXYcz3m9vMmagvRPqygV1hjResjDCdLVodnWPg==
Received: by filterdrecv-77869f68cc-4lhvt with SMTP id
 filterdrecv-77869f68cc-4lhvt-1-64931A39-63
 2023-06-21 15:41:45.772147988 +0000 UTC m=+3600334.020172255
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id 1CQkqm0ERMy9gnj9PBUTmw Wed, 21 Jun 2023 15:41:45.457 +0000 (UTC)
Message-ID: <1f20a832-6339-0feb-3647-cea7598e60be@kwiboo.se>
Date: Wed, 21 Jun 2023 15:41:45 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] drm/rockchip: vop2: Add missing call to crtc reset
 helper
References: <20230620064732.1525594-1-jonas@kwiboo.se>
 <20230620064732.1525594-5-jonas@kwiboo.se>
 <20230621081151.GY18491@pengutronix.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230621081151.GY18491@pengutronix.de>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h7SRAqrjZghh+BUwH?=
 =?us-ascii?Q?PaDHTn0zfJUkykOFCOQaqgs9WhKZwljx1UFMUli?=
 =?us-ascii?Q?64cy78z0MEgFsiULaIXkYPjkvJPN0lJyDlXgI0H?=
 =?us-ascii?Q?Po71S8lrYhQ5w6D2VRea9vCBm5r08lGJaZJ0EIW?=
 =?us-ascii?Q?8pthUU+tZa=2FvhZ07jVVd42yFLE36R2GSxlPESoH?=
 =?us-ascii?Q?goZ=2FUOR4vTjM1+O+ctFHw=3D=3D?=
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Type: text/plain; charset=us-ascii
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-21 10:11, Sascha Hauer wrote:
> On Tue, Jun 20, 2023 at 06:47:39AM +0000, Jonas Karlman wrote:
>> Add missing call to crtc reset helper to properly vblank reset.
>>
>> Also move vop2_crtc_reset and call vop2_crtc_destroy_state to simplify
>> and remove duplicated code.
>>
>> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 28 ++++++++------------
>>  1 file changed, 11 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index f725487d02ef..1be84fe0208f 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -2080,23 +2080,6 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
>>  	.atomic_disable = vop2_crtc_atomic_disable,
>>  };
>>  
>> -static void vop2_crtc_reset(struct drm_crtc *crtc)
>> -{
>> -	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
>> -
>> -	if (crtc->state) {
>> -		__drm_atomic_helper_crtc_destroy_state(crtc->state);
>> -		kfree(vcstate);
>> -	}
>> -
>> -	vcstate = kzalloc(sizeof(*vcstate), GFP_KERNEL);
>> -	if (!vcstate)
>> -		return;
>> -
>> -	crtc->state = &vcstate->base;
>> -	crtc->state->crtc = crtc;
>> -}
>> -
>>  static struct drm_crtc_state *vop2_crtc_duplicate_state(struct drm_crtc *crtc)
>>  {
>>  	struct rockchip_crtc_state *vcstate;
>> @@ -2123,6 +2106,17 @@ static void vop2_crtc_destroy_state(struct drm_crtc *crtc,
>>  	kfree(vcstate);
>>  }
>>  
>> +static void vop2_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +	struct rockchip_crtc_state *vcstate =
>> +		kzalloc(sizeof(*vcstate), GFP_KERNEL);
>> +
>> +	if (crtc->state)
>> +		vop2_crtc_destroy_state(crtc, crtc->state);
>> +
>> +	__drm_atomic_helper_crtc_reset(crtc, &vcstate->base);
>> +}
> 
> You missed to check for allocation failures before using vcstate.

Good catch, I will fix for both vop and vop2 driver in v2.

Regards,
Jonas

> 
> Sascha
> 

