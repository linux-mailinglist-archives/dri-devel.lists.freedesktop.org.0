Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDF605C0C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 12:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB7A10E04A;
	Thu, 20 Oct 2022 10:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FB3B10E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 10:17:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E650ED1;
 Thu, 20 Oct 2022 03:17:17 -0700 (PDT)
Received: from [10.1.33.24] (e122027.cambridge.arm.com [10.1.33.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02FE33F792;
 Thu, 20 Oct 2022 03:17:09 -0700 (PDT)
Message-ID: <d26a03e4-801e-11b3-93df-566f6f0887a9@arm.com>
Date: Thu, 20 Oct 2022 11:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/2] drm/panfrost: Fix UAPI for C++/BSD compatibility
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20221017104602.142992-1-steven.price@arm.com>
 <Y014Vh1hGahjqUlB@maud>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <Y014Vh1hGahjqUlB@maud>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Adri??n Larumbe <adrian.larumbe@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/10/2022 16:44, Alyssa Rosenzweig wrote:
> Series is
> 
> 	Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Thank you for this, please push to the appropriate trees so we can fix
> the Mesa build.

Thanks! I've pushed the patches to drm-misc-fixes.

Steve

> On Mon, Oct 17, 2022 at 11:46:00AM +0100, Steven Price wrote:
>> The Panfrost DRM interface to user space is uesd in Mesa for targets
>> other than C/Linux. Specifically the header file needs to compile in C++
>> code and for FreeBSD which shares the same UABI.
>>
>> The first patch fixes the C++ compilation issue by removing the
>> (unnecessary) type name from internal structs which is invalid in C++.
>>
>> The second patch technically changes the UABI by changing the header
>> values in the dump format to be native endian rather than fixed
>> little-endian. Since (a) there are no known big-endian Mali systems, and
>> (b) this has only appeared in -rc1, this shouldn't break user space.
>> Tools can use the 'magic' field to identify the endianness of the dump
>> if they want to support big-endian.
>>
>> This is effectively a 'v2' of Adri??n's series here [1].
>>
>> [1] https://lore.kernel.org/r/20220920211545.1017355-1-adrian.larumbe%40collabora.com
>>
>> Steven Price (2):
>>   drm/panfrost: Remove type name from internal structs
>>   drm/panfrost: replace endian-specific types with native ones
>>
>>  drivers/gpu/drm/panfrost/panfrost_dump.c | 36 ++++++++++++------------
>>  include/uapi/drm/panfrost_drm.h          | 36 +++++++++++++-----------
>>  2 files changed, 38 insertions(+), 34 deletions(-)
>>
>> -- 
>> 2.34.1
>>

