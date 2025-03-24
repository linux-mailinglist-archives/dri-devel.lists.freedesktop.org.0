Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E00A6DB75
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C86810E307;
	Mon, 24 Mar 2025 13:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tJhDamlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEEE10E307
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 13:29:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so751165166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742822972; x=1743427772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTTdxiEXTLI0RB3J4azgwISZcRhYfAuhdc+KevBi5vw=;
 b=tJhDamlDBAHWARKsAiw/DfblnOr7HqK/GbU9LJVVAfQgcKYKJSeGc3Awp3n7FpEpmy
 CWVjo9chW4XxKe8dA+3OYFceliPXw/svceDVCSK7EaJb2cJSeqdpQkq/JKmZ9S754KLq
 OWe9rSeal//piEzibh5FUboEo/jK2IFobFPUQ1Nv6q1wv4ItKLcOG65341K/ZrGY/dTY
 dUsmgZai0qIiNInhY+ymwGc75Apb+E/ow5EHVenc87Zxo5KSTJROGZ8Gcs9mfdtumd4W
 YlY3mNiFVNUtBRu9ODyv50a2uEcRRI6SVn6d7WbswGWtMScuWs2EBlzkLXaWcL4LN99m
 BSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742822972; x=1743427772;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTTdxiEXTLI0RB3J4azgwISZcRhYfAuhdc+KevBi5vw=;
 b=vrzrVN94ccsxF1Htu9J5YLFgNnd5lh4RSPysOqZcCc6EATVfmxDPN77zOWrvQatM36
 J1JaTE+h4yWgTrug8ebrVum1G5iiIYFhjslOlUdEQlb7Ft0fkRK9OP1Ef7ClXRkZSpFY
 Zz27gFswrG37fxvm5YkLwede/uFAAcKhJAbdoPGRSg39qjSBo6Ez6Qabs0Rh1UY9qF3m
 zcCYCifAXXnQPbMpsE+NblByVoSseGfx1hTYbrnniR4oXoWvYPeBoCTyEbrLm9ORDxOw
 023E+Ny/Ivz0fGTU08pbALYqB8hECLzDiVhOHgucMlQx1qePPtcW8LfvBEkB/vIgYsZC
 ziaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4/lHQjJJieTuEjrl7gB9JJCzh9x7ONWWAka/UmkDaHmz2P8AoeR7tTtFg3TJQ6pAt3iaYK3Gc0lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7LF6o8U0I15NtD/Ck3DpT+6XdhuD8s8WC3z9BhDISNJp2zt9x
 09P63EH2aCGWRRJ2tt6b3egrWyASRu3xPXU1O4VV6AA8CISYYlTElTGpmLMLIh4=
X-Gm-Gg: ASbGncsxMFAj54fo72MxHJGHqpxDVur+QWBqnfx0JSjWW56bkFxXj1SKiBIthfjG5vo
 8QT4mAlf8ZL9pc8s6J/0pXJQqa7OTNmDgZ5UFCJlHa55G95tMoPdlt1ysS2QU1Tf3c8AL+Kum2c
 3Ku+3/WMnlMiH5XqQM78JU1pQd+9QLbQsuBOD0KrHgyQKSFpDi08qw+TE65CrGk6kwng5cWirUb
 AtxPx8eIAj1j2vnn8V4TfhGLY5oL4s9wahGzuhZ9cp8ySq3vcxh728UMrREWcpAVDYo/BzRVAMU
 nQkn0bFHxoQa9CU2eKimpzojrUAQ2izf8HRFOgzRkkQwZgrmuBAIVa8O9YWsfQI=
X-Google-Smtp-Source: AGHT+IH+XEdLXnQX6nhvXQgyxnwEG52GJc4c2uceRNSxMxazFeWfoa7SI9NnS80gXy0yOwDc7i3hHg==
X-Received: by 2002:a17:907:9482:b0:ac3:10e3:7fa5 with SMTP id
 a640c23a62f3a-ac3f20f51cbmr1074443466b.21.1742822971571; 
 Mon, 24 Mar 2025 06:29:31 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ac3efbdc78esm682685766b.134.2025.03.24.06.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:29:31 -0700 (PDT)
Message-ID: <90f2bcab-d89f-40c0-9851-7ff25f2c1eda@linaro.org>
Date: Mon, 24 Mar 2025 13:29:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <5r72xrv5rtw6bemh5onygkroyasroviijlta4hvwgm5c5hzvax@3icylchlufu3>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <5r72xrv5rtw6bemh5onygkroyasroviijlta4hvwgm5c5hzvax@3icylchlufu3>
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



On 21/03/2025 14:07, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>
>>
>> On 20/03/2025 09:14, Ling Xu wrote:
>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>> some products which support GPDSP remoteprocs. Add changes to support
>>> GPDSP remoteprocs.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>> ---
>>>    drivers/misc/fastrpc.c | 10 ++++++++--
>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 7b7a22c91fe4..80aa554b3042 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -28,7 +28,9 @@
>>>    #define SDSP_DOMAIN_ID (2)
>>>    #define CDSP_DOMAIN_ID (3)
>>>    #define CDSP1_DOMAIN_ID (4)
>>> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>> +#define GDSP0_DOMAIN_ID (5)
>>> +#define GDSP1_DOMAIN_ID (6)
>>
>> We have already made the driver look silly here, Lets not add domain ids for
>> each instance, which is not a scalable.
>>
>> Domain ids are strictly for a domain not each instance.
>>
>>
>>> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>>>    #define FASTRPC_MAX_SESSIONS	14
>>>    #define FASTRPC_MAX_VMIDS	16
>>>    #define FASTRPC_ALIGN		128
>>> @@ -107,7 +109,9 @@
>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>    static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>> -						"sdsp", "cdsp", "cdsp1" };
>>> +						"sdsp", "cdsp",
>>> +						"cdsp1", "gdsp0",
>>> +						"gdsp1" };
>>>    struct fastrpc_phy_page {
>>>    	u64 addr;		/* physical address */
>>>    	u64 size;		/* size of contiguous region */
>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>    		break;
>>>    	case CDSP_DOMAIN_ID:
>>>    	case CDSP1_DOMAIN_ID:
>>> +	case GDSP0_DOMAIN_ID:
>>> +	case GDSP1_DOMAIN_ID:
>>>    		data->unsigned_support = true;
>>>    		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>    		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>
>>
>> Can you try this patch: only compile tested.
>>
>> ---------------------------------->cut<---------------------------------------
>>  From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Date: Thu, 20 Mar 2025 17:07:05 +0000
>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
>>
>> Currently the domain ids are added for each instance of domain, this is
>> totally not scalable approch.
>>
>> Clean this mess and create domain ids for only domains not its
>> instances.
>> This patch also moves the domain ids to uapi header as this is required
>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>>   include/uapi/misc/fastrpc.h |  7 ++++++
>>   2 files changed, 32 insertions(+), 20 deletions(-)
>>
> 
> 
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index f33d914d8f46..89516abd258f 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>>   	__s32 reserved[5];
>>   };
>>
>> +#define ADSP_DOMAIN_ID (0)
>> +#define MDSP_DOMAIN_ID (1)
>> +#define SDSP_DOMAIN_ID (2)
>> +#define CDSP_DOMAIN_ID (3)
>> +#define GDSP_DOMAIN_ID (4)
> 
> Why are you adding these to uAPI? How are they going to be used by the
> userspace?
> 
>> +
>> +#define FASTRPC_DOMAIN_MAX	4
>>   struct fastrpc_ioctl_capability {
>>   	__u32 domain;

here, in domain value of fastrpc_ioctl_capability.



>>   	__u32 attribute_id;
>> -- 
>> 2.25.1
>>
>>
>> ---------------------------------->cut<---------------------------------------
> 
