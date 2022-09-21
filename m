Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8C5BF9AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49B710E836;
	Wed, 21 Sep 2022 08:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D4A910E836
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:48:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BC9523A;
 Wed, 21 Sep 2022 01:48:44 -0700 (PDT)
Received: from [10.57.50.65] (unknown [10.57.50.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3CA13F73D;
 Wed, 21 Sep 2022 01:48:36 -0700 (PDT)
Message-ID: <4e907f5a-0691-214f-d6a2-1bc3a8bd462e@arm.com>
Date: Wed, 21 Sep 2022 09:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm/panfrost: replace endian-specific types with
 generic ones
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Adri??n Larumbe <adrian.larumbe@collabora.com>
References: <YynVAAaQPIPhuN55@maud>
 <20220920211545.1017355-1-adrian.larumbe@collabora.com>
 <20220920211545.1017355-2-adrian.larumbe@collabora.com>
 <Yyo7A1eolIBssv/i@maud>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <Yyo7A1eolIBssv/i@maud>
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2022 23:13, Alyssa Rosenzweig wrote:
> Tentative r-b, but we *do* need to make a decision on how we want to
> handle endianness. I don't have strong feelings but the results of that
> discussion should go in the commit message.

Linux currently treats the dump objects specially - the headers are
little endian. All the other (Panfrost) DRM structures are native endian
(although I doubt anyone has tested it so I expect bugs). I've no
particularly strong views on this, but since the dump objects are likely
to be saved to disk and transferred between computers it makes sense to
fix the endianness for those. The __le types currently mean sparse can
warn if we screw up in the kernel, so it would be a shame to lose that
type checking.

Another option would be to extend the list of typedefs in
include/uapi/drm/drm.h to include the __le types. We'd need wider buy-in
for that change though.

Finally etnaviv 'solves' the issue by not including the dump structures
in the UABI header...

Or of course we could just actually use native endian and detect from
the magic which endian is in use. That would require ripping out the
cpu_to_lexx() calls in Linux and making the user space tool more
intelligent. I'm happy with that, but it's pushing the complexity onto Mesa.

Steve

> On Tue, Sep 20, 2022 at 10:15:45PM +0100, Adri??n Larumbe wrote:
>> __le32 and __l64 endian-specific types aren't portable and not available on
>> FreeBSD, for which there's a uAPI compatible reimplementation of Panfrost.
>>
>> Replace these specific types with more generic unsigned ones, to prevent
>> FreeBSD Mesa build errors.
>>
>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7252
>> Fixes: 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
>> Signed-off-by: Adri??n Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  include/uapi/drm/panfrost_drm.h | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
>> index bd77254be121..c1a10a9366a9 100644
>> --- a/include/uapi/drm/panfrost_drm.h
>> +++ b/include/uapi/drm/panfrost_drm.h
>> @@ -236,24 +236,24 @@ struct drm_panfrost_madvise {
>>  #define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
>>  
>>  struct panfrost_dump_object_header {
>> -	__le32 magic;
>> -	__le32 type;
>> -	__le32 file_size;
>> -	__le32 file_offset;
>> +	__u32 magic;
>> +	__u32 type;
>> +	__u32 file_size;
>> +	__u32 file_offset;
>>  
>>  	union {
>>  		struct {
>> -			__le64 jc;
>> -			__le32 gpu_id;
>> -			__le32 major;
>> -			__le32 minor;
>> -			__le64 nbos;
>> +			__u64 jc;
>> +			__u32 gpu_id;
>> +			__u32 major;
>> +			__u32 minor;
>> +			__u64 nbos;
>>  		} reghdr;
>>  
>>  		struct {
>> -			__le32 valid;
>> -			__le64 iova;
>> -			__le32 data[2];
>> +			__u32 valid;
>> +			__u64 iova;
>> +			__u32 data[2];
>>  		} bomap;
>>  
>>  		/*
>> @@ -261,14 +261,14 @@ struct panfrost_dump_object_header {
>>  		 * with new fields and also keep it 512-byte aligned
>>  		 */
>>  
>> -		__le32 sizer[496];
>> +		__u32 sizer[496];
>>  	};
>>  };
>>  
>>  /* Registers object, an array of these */
>>  struct panfrost_dump_registers {
>> -	__le32 reg;
>> -	__le32 value;
>> +	__u32 reg;
>> +	__u32 value;
>>  };
>>  
>>  #if defined(__cplusplus)
>> -- 
>> 2.37.0
>>

