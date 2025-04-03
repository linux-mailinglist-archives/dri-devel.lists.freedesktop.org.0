Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C3A7A449
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D845510E9E1;
	Thu,  3 Apr 2025 13:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U5ovn5D2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFED10EA07
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 13:49:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso5197865e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 06:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743688172; x=1744292972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
 b=U5ovn5D2L4h+B9BP6bexZqxFEJxMKWPhQm28AGep5mMhiljvOrerZnXL9XAsF/2Nzw
 X8kxUyVZ16jUVydzBpvPa0q8XFGpGWov/stQFoABISH+NPc529RfgsL6sY1KFkIcFnYP
 KZwpkpNxbbu2+dM+EkgcMcFzj+safSKKlB1Fhqf5ho8HBZZzrzCSfp3XDwzVWe33Wycx
 JrwFkUwDE+MYrIIy7qx406+jZo2+oR+jom0HEGJTxmD5tlHAOeQ7kf4KDdVWvKaUAr1r
 3MDYeONkjjbMfZMlolIUaOT8GvMsQEYqOzAobYVxX5edWyyOv9DdKfCewY6s34pGHrBH
 yMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743688172; x=1744292972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
 b=PgpEpz4ke/3x3wweBnw7qpvqXbY047a+2TsZfIvWcI1NJQIQGLfEyaR4fz/xoily9Z
 UIpILV9XVvo8JGgAsvU+5PBq3zh3fYixX+yCtUJRbZ9yIV5Qz8mxb+GuqQlp04b7SeTy
 3aiYSvrRw61Ji+lppp17qclPem5o0uXhVwqSy+ERXKWmJrYySQTmlO3RvvQ3N2Ta9W6K
 Da1Tprpd3oBs0zLO/+fLtUoWsgC7dEDu2sj3noCMraXJ6O+PTgqvEE9f3jQVPOf8Hb6w
 B3JWzkfdJ5uPprCwKmj35llsFNPwB1q4ldFqtc2shIGInGey1XVL7Eth8SaOUyb3yh03
 4e4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBb7MpuoWe0s6jxJwJRzE6j5YZcVOLTtpr04wLKGXUpsiz3BgB6BNSotVUohd7o8GKCQax26Gwdtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ+Fa0avDP0VCZLd2TScKKV5Qdyy94yNUPrU2Q4Lrw5y9DQEEf
 6MDYjWz1ZvcwYKpvHf4XBMRHcisRJ3qT3+i/atsKHwmixLKQikdJzRSLok+6Uu4=
X-Gm-Gg: ASbGncuUBYSoE8etinaUelwC5Xg4Y7pmwkJ5ywdglB8uXaaAHT7tTQvEAzEwaqHN0KJ
 w0yncI51MBzR17R12FOlN6tsupoNrDSaC7PTXL7PYL94xwqaDG8GJObbSDKAnVcoF2mEgiReLeQ
 7G0b9Wk+TZTpy5rPtZM5u64jzB4MvkOg3cEiza+mEixlVGmTZe9F66qSOHju5brp7N1+n4MiKHp
 5+2BlksfPZXZ9uZPFba8T+S+mG5AnEQJBZ//jcYdvQc3an/X4lPPagYf9XM290WxN444JgXFJZ4
 m2bbP473uASi2hdhGeiAm7gUwWMB0pT8BmWAWJE3T7jtn8dMh97D+xYkIG+eOwOg/WMDF3lU6w=
 =
X-Google-Smtp-Source: AGHT+IE9rPmpD+lql1OOhXGIwaIr3nFGx77QjAL7GITh3M6FkiFPLNOqADUYHdezax8BrNQwiF0+bA==
X-Received: by 2002:a05:600c:4589:b0:43d:300f:fa51 with SMTP id
 5b1f17b1804b1-43eb5c187e8mr59872065e9.9.1743688172289; 
 Thu, 03 Apr 2025 06:49:32 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43ec1692ba4sm22202575e9.16.2025.04.03.06.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 06:49:31 -0700 (PDT)
Message-ID: <fe188552-3f1c-49f3-96ef-6e5aca6896ca@linaro.org>
Date: Thu, 3 Apr 2025 14:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
 <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
 <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
 <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/04/2025 05:44, Ekansh Gupta wrote:
> 
> On 4/2/2025 2:12 PM, Dmitry Baryshkov wrote:
>> On 02/04/2025 11:38, Ekansh Gupta wrote:
>>>
>>> On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>>>>
>>>> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>>>>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>>>>
>>>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>>>> GPDSP remoteprocs.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> Signed-off-by: Ling Xu<quic_lxu5@quicinc.com>
>>>>>>> ---
>>>>>>>      drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>>>      1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>>>> --- a/drivers/misc/fastrpc.c
>>>>>>> +++ b/drivers/misc/fastrpc.c
>>>>>>> @@ -28,7 +28,9 @@
>>>>>>>      #define SDSP_DOMAIN_ID (2)
>>>>>>>      #define CDSP_DOMAIN_ID (3)
>>>>>>>      #define CDSP1_DOMAIN_ID (4)
>>>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>>> We have already made the driver look silly here, Lets not add domain ids for
>>>>>> each instance, which is not a scalable.
>>>>>>
>>>>>> Domain ids are strictly for a domain not each instance.
>>>>> Then CDSP1 should also be gone, correct?
>>>> Its already gone as part of the patch that I shared in this discussion.
>>>>
>>>> I will send a proper patch to list once Ling/Ekansh has agree with it.
>>>>
>>> Thanks, Srini, for sharing this clean-up patch. It looks proper to
>>> me, but I was thinking if we could remove the domain_id dependency
>>> from the fastrpc driver. The addition of any new DSP will frequently
>>> require changes in the driver. Currently, its usage is for creating
>>> different types of device nodes and transferring memory ownership to
>>> SLPI when a memory region is added.
>>>
>>> The actual intention behind different types of device nodes can be
>>> defined as follows:
>>>
>>> fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
>>> fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.
>>>
>>> The reason for this constraint is to prevent any untrusted process
>>> from communicating with any privileged PD on DSP, which poses a security risk.
>>> The access to different device nodes can be provided/restricted based on UID/GID
>>> (still need to check more on this; on Android-like systems, this is controlled by
>>> SELinux).
>>>
>>> There is already a qcom,non-secure-domain device tree property[1] which doesn't
>>> have a proper definition as of today. The actual way to differentiate between
>>> secure and non-secure DSP should be based on its ability to support unsigned PD.
>>>
>>> One way to remove the domain_id dependency that I can think of is to use this
>>> property to create different types of device nodes. Essentially, if unsigned PD
>>> is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
>>> both types of device nodes based on this. Otherwise, only the secure device node
>>> is created.
>> This sounds like breaking backwards compatibility on the userspace side. You can not do that.
> Okay, I thought if the property is added for all older platforms, that will ensure backward
> compatibility is maintained for old built applications.
> 
>  From userspace, the expected device open sequence is to try with the secure device node and
> fallback to the default/non-secure node if the secure node is not available/accessible.
> I understand the ABI cannot be broken, and this expectation should be added for new
> applications/platforms.
> 
> This is still a security issue that needs to be fixed in some way. I'll try to find out if any other
> approach can address this.
In the past I have suggested you to update the dt-bindings so that any 
new platforms that get added will not use the qcom,non-secure-domain 
flag. The usage of this flag is still confusing for any new users, as 
per the dt bindings its open to be used.

As we can not break the backwards compatibility, why not just restrict 
that to those platforms for now, and enforce new platforms to use not 
use it for for domains like adsp.

--srini


