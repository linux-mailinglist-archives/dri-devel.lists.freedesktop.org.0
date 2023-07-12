Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB674FF93
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855E10E494;
	Wed, 12 Jul 2023 06:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B2E910E494
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:44:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4493E2F4;
 Tue, 11 Jul 2023 23:45:23 -0700 (PDT)
Received: from [10.163.48.19] (unknown [10.163.48.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 748583F67D;
 Tue, 11 Jul 2023 23:44:39 -0700 (PDT)
Message-ID: <a6f6731b-9478-b91d-f4ce-aa018fb44d7b@arm.com>
Date: Wed, 12 Jul 2023 12:14:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/arm/komeda: Remove component framework and add a
 simple encoder
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20230704163454.5138-1-faiz.abbas@arm.com>
 <ZKWk3YkM7jI304uv@e110455-lin.cambridge.arm.com>
From: Mohammad Faiz Abbas Rizvi <faiz.abbas@arm.com>
In-Reply-To: <ZKWk3YkM7jI304uv@e110455-lin.cambridge.arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu,

On 7/5/2023 10:44 PM, Liviu Dudau wrote:
> Hi Faiz,
> 
> On Tue, Jul 04, 2023 at 10:04:54PM +0530, Faiz Abbas wrote:
>> The Komeda driver always expects the remote connector node to initialize
>> an encoder. It uses the component aggregator framework which consists
>> of component->bind() calls used to initialize the remote encoder and attach
>> it to the crtc. This makes it incompatible with connector drivers which
>> implement drm_bridge APIs.
>>
>> Remove all component framework calls from the komeda driver and declare and
>> attach an encoder inside komeda_crtc_add().
>>
>> The remote connector driver has to implement the DRM bridge APIs which
>> can be used to glue the encoder to the remote connector. Since we
>> usually pair this with a component encoder that also implements a
>> drm_bridge, dropping support is not expected to affect users of this
>> driver.
> 
> Thanks for updating the commit description, I think it shows the intent better.
> 
> When I'm trying to apply your patch to drm-misc next (or any branch that matters)
> it fails because ...
> 
>>
>> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
>> ---
>>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 23 +++++++-
>>  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 57 ++-----------------
>>  .../gpu/drm/arm/display/komeda/komeda_kms.c   | 10 +---
>>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +
>>  4 files changed, 32 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> index 4cc07d6bb9d82..e5a8a80b173f4 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> @@ -13,6 +13,8 @@
>>  #include <drm/drm_crtc_helper.h>
> 
> ... this line is different in my tree. It looks like your tree is missing
> commit e3b63718827880 ("drm/arm/komeda: Remove unnecessary include
> statements for drm_crtc_helper.h"), which has been applied in early January.
> 


Right. Let me rebase to drm-misc-next and send another version.

Thanks,
Faiz
