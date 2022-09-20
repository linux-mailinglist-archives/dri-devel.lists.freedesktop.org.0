Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4225BE703
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1EA10E6C3;
	Tue, 20 Sep 2022 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2110E6C3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:26:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 169B81042;
 Tue, 20 Sep 2022 06:27:02 -0700 (PDT)
Received: from [10.1.30.43] (e122027.cambridge.arm.com [10.1.30.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB543F73D;
 Tue, 20 Sep 2022 06:26:54 -0700 (PDT)
Message-ID: <4dad1be9-fd0c-a745-a3a5-91f12c1d97d2@arm.com>
Date: Tue, 20 Sep 2022 14:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
 <5898d7a6-14c2-8e20-abc3-5971a4bcfd85@arm.com>
 <20220919064411.lmco2cyb4lpb5etu@sobremesa>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220919064411.lmco2cyb4lpb5etu@sobremesa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2022 07:44, Adrián Larumbe wrote:
> Hi Steven,
> 
> On 13.09.2022 09:45, Steven Price wrote:
>> On 12/09/2022 17:44, Adrián Larumbe wrote:
>>> Building Mesa's Perfetto requires including the panfrost drm uAPI header in
>>> C++ code, but the C++ compiler requires anonymous unions to have only
>>> public non-static data members.
>>>
>>> Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
>>> introduces one such union, breaking the Mesa build.
>>>
>>> Give it a name, and also rename pan_reg_hdr structure because it will
>>> always be prefixed by the union name.
>>>
>>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
>> Ouch! It's frustrating how C++ isn't quite a superset of C. However I
>> think we can solve this with a simpler patch, I'd appreciate testing
>> that this does indeed fix the build issues with Mesa with all supported
>> compilers (I'm not so familiar with C++):
> 
> I just tested your changes on Mesa and they do fix the build.

Thanks Adrián!

Alyssa: Could you give your R-b if you're happy with this change? It
would be good to get this fixed before it hits -rc1.

Thanks,

Steve

> 
>> ----8<----
>>From 492714a7dff0710ac5b8b457bcfe9ae52b458565 Mon Sep 17 00:00:00 2001
>> From: Steven Price <steven.price@arm.com>
>> Date: Tue, 13 Sep 2022 09:37:55 +0100
>> Subject: [PATCH] drm/panfrost: Remove type name from internal structs
>>
>> The two structs internal to struct panfrost_dump_object_header were
>> named, but sadly that is incompatible with C++, causing an error: "an
>> anonymous union may only have public non-static data members".
>>
>> However nothing refers to struct pan_reg_hdr and struct pan_bomap_hdr
>> and there's no need to export these definitions, so lets drop them. This
>> fixes the C++ build error with the minimum change in userspace API.
>>
>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
>> Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> include/uapi/drm/panfrost_drm.h | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/drm/panfrost_drm.h
>> b/include/uapi/drm/panfrost_drm.h
>> index eac87310b348..bd77254be121 100644
>> --- a/include/uapi/drm/panfrost_drm.h
>> +++ b/include/uapi/drm/panfrost_drm.h
>> @@ -242,7 +242,7 @@ struct panfrost_dump_object_header {
>> 	__le32 file_offset;
>>
>> 	union {
>> -		struct pan_reg_hdr {
>> +		struct {
>> 			__le64 jc;
>> 			__le32 gpu_id;
>> 			__le32 major;
>> @@ -250,7 +250,7 @@ struct panfrost_dump_object_header {
>> 			__le64 nbos;
>> 		} reghdr;
>>
>> -		struct pan_bomap_hdr {
>> +		struct {
>> 			__le32 valid;
>> 			__le64 iova;
>> 			__le32 data[2];
>> -- 
>> 2.34.1

