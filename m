Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BA971BE8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A1410E5AA;
	Mon,  9 Sep 2024 13:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50C1D10E59F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:58:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 683F1FEC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:59:20 -0700 (PDT)
Received: from [192.168.99.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 795543F64C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:58:51 -0700 (PDT)
Message-ID: <44518d07-c313-494a-a4f6-8d27af14a150@foss.arm.com>
Date: Mon, 9 Sep 2024 14:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Display FW version information
To: dri-devel@lists.freedesktop.org
References: <20240905155144.75416-1-steven.price@arm.com>
 <20240905184528.2e9219ce@collabora.com>
 <Ztod0sr-4Xl-X6Kx@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <Ztod0sr-4Xl-X6Kx@e110455-lin.cambridge.arm.com>
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



On 9/5/24 10:08 PM, Liviu Dudau wrote:
> On Thu, Sep 05, 2024 at 06:45:28PM +0200, Boris Brezillon wrote:
>> On Thu,  5 Sep 2024 16:51:44 +0100
>> Steven Price <steven.price@arm.com> wrote:
>>
>>> The firmware binary has a git SHA embedded into it which can be used to
>>> identify which firmware binary is being loaded. Output this as a
>>> drm_info() so that it's obvious from a dmesg log which firmware binary
>>> is being used.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
>> Just one formatting issue mentioned below, looks good otherwise.
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
>>
>>> ---
>>>   drivers/gpu/drm/panthor/panthor_fw.c | 55 ++++++++++++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>>> index 857f3f11258a..ef007287575c 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>>> @@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
>>>   
>>>   	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
>>>   	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
>>> +
>>> +	/**
>>> +	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
>>> +	 * the FW binary was built.
>>> +	 */
>>> +	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
>>>   };
>>>   
>>>   #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
>>> @@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
>>>   	} data;
>>>   };
>>>   
>>> +struct panthor_fw_build_info_hdr {
>>> +	/** @meta_start: Offset of the build info data in the FW binary */
>>> +	u32 meta_start;
>>> +	/** @meta_size: Size of the build info data in the FW binary */
>>> +	u32 meta_size;
>>> +};
>>> +
>>>   /**
>>>    * struct panthor_fw_binary_iter - Firmware binary iterator
>>>    *
>>> @@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>>   	return 0;
>>>   }
>>>   
>>> +static int panthor_fw_read_build_info(struct panthor_device *ptdev,
>>> +				      const struct firmware *fw,
>>> +				      struct panthor_fw_binary_iter *iter,
>>> +				      u32 ehdr)
>>> +{
>>> +	struct panthor_fw_build_info_hdr hdr;
>>> +	char header[9];
>>> +	const char git_sha_header[sizeof(header)] = "git_sha: ";
>>> +	int ret;
>>> +
>>> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (hdr.meta_start > fw->size ||
>>> +	    hdr.meta_start + hdr.meta_size > fw->size) {
>>> +		drm_err(&ptdev->base, "Firmware build info corrupt\n");
>>> +		/* We don't need the build info, so continue */
>>> +		return 0;
>>> +	}
>>> +
>>> +	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
>>> +	    sizeof(git_sha_header))) {
>>
>> Indentation seems broken here:
>>
>> 	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
>> 		   sizeof(git_sha_header))) {
>>
>>> +		/* Not the expected header, this isn't metadata we understand */
>>> +		return 0;
>>> +	}
>>> +
>>> +	/* Check that the git SHA is NULL terminated as expected */
>>> +	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
>>> +		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
>>> +		/* Don't treat as fatal */
>>> +		return 0;
>>> +	}
>>> +
>>> +	drm_info(&ptdev->base, "Firmware git sha: %s\n",
>>> +		 fw->data + hdr.meta_start + sizeof(git_sha_header));
>>
>> Maybe we should also change the "FW vX.Y.Z" message into "FW interface
>> vX.Y.Z" to clarify things.
> 
> Or something like "FW using interface vX.Y.Z"

+1. I like the idea. It's a bit confusing otherwise.

> Best regards,
> Liviu
> 
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static void
>>>   panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>>>   {
>>> @@ -672,6 +725,8 @@ static int panthor_fw_load_entry(struct panthor_device *ptdev,
>>>   	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
>>>   	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
>>>   		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
>>> +	case CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA:
>>> +		return panthor_fw_read_build_info(ptdev, fw, &eiter, ehdr);
>>>   
>>>   	/* FIXME: handle those entry types? */
>>>   	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
>>
> 
