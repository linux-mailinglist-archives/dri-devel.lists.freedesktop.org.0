Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED469E225
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 15:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4A710E179;
	Tue, 21 Feb 2023 14:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D310E179
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 14:18:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D22A61018;
 Tue, 21 Feb 2023 14:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F97C433D2;
 Tue, 21 Feb 2023 14:18:35 +0000 (UTC)
Message-ID: <9d5346bf-526d-d8ec-d055-175aae429638@xs4all.nl>
Date: Tue, 21 Feb 2023 15:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/9] drm/vc4: Switch to container_of_const
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
 <20221207-rpi-hdmi-improvements-v2-1-8ace2d8221ad@cerno.tech>
 <c70e40fe-6834-2382-ec89-28714a67fd1f@xs4all.nl>
 <20230221113834.i3nitxp4soev6cks@houat>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230221113834.i3nitxp4soev6cks@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/23 12:38, Maxime Ripard wrote:
> Hi Hans,
> 
> On Sat, Feb 18, 2023 at 11:45:04AM +0100, Hans Verkuil wrote:
>>> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
>>> index 86d629e45307..d0a00ed42cb0 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_bo.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
>>> @@ -609,7 +609,7 @@ static void vc4_free_object(struct drm_gem_object *gem_bo)
>>>  static void vc4_bo_cache_time_work(struct work_struct *work)
>>>  {
>>>  	struct vc4_dev *vc4 =
>>> -		container_of(work, struct vc4_dev, bo_cache.time_work);
>>> +		container_of_const(work, struct vc4_dev, bo_cache.time_work);
>>
>> ...I think this is misleading. It's definitely not const, so switching to
>> container_of_const suggests that there is some 'constness' involved, which
>> isn't the case. I'd leave this just as 'container_of'. This also reduces the
>> size of the patch, since this is done in quite a few places.
> 
> The name threw me off too, but it's supposed to keep the argument
> pointer constness, not always take and return a const pointer. I still
> believe that it's beneficial since, if the work pointer was ever to
> change constness, we would have that additional check.

If both inner (work) and outer (vc4) pointers are non-const, then there is no sense
in switching to container_of_const. I don't see it used like that elsewhere
in the kernel.

It only makes sense to use it if the inner pointer might be const.

If the work pointer (in this example) would ever become const, then the
regular container_of macro would report a warning, that's something that
was added in commit 7376e561fd2e. So preemptively switching to container_of_const
appears unnecessary to me.

Regards,

	Hans
