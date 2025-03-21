Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FBA6BA99
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 13:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B029E10E131;
	Fri, 21 Mar 2025 12:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rj41HK/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9506510E131
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 12:23:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4394a823036so18910675e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742559796; x=1743164596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bCHRcsxe/+pskodsN56Dy1BONWoeHJ0Tuu1dcJXeMMo=;
 b=Rj41HK/eWrI7ZSIzGLFVDLrzxvHzF7qQZ3HLlng1XqosJ76EDfgqHxsQNm2g5Gja9H
 rgSvO7yC8b9xfeZ7E2aZBMsbDlgU2kR3jDRjyeMJYVboLeUF19jRSfHYoH+l09sl4tuK
 ChVCy7Zp+/8zHwL0Yfk1NrVziYymp5pnPEvF913vtVdHyD5hY9MptmCRQEx1RheQOaak
 MoNjq6EP8Ge4dXJVXE3+9Cp4k8/rp7CQa1VQLGk3iqP9+43sg7EfuFJANm1KNDUDSfqg
 sUGXQ3y1xnOXEusYSi+jgkqap0ZJMw1waYZc/csmI9WvyuC0iNd5q0H29Bd+q+kNRBbT
 lqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742559796; x=1743164596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bCHRcsxe/+pskodsN56Dy1BONWoeHJ0Tuu1dcJXeMMo=;
 b=hv3J/y7AgQJhsv6Af8hdKzTm7rM9IUhxR/yu8pQyqmam4woeMRiuBCOp2gXkOq69DA
 J5VVzteHYWkPbmkbwh3ogv7nDRTuZX/YJ7lT+bktzgPJaOpS86DsHwHJgLWo4s00KmkB
 aIFByf9gOJGYu8nvUuHPpdomBQ2Kma3Og8RHIDjBUov+xk7Jfko8kfezqdilU43dQdf+
 gwrh0JUcKEyZMCT3HGB/vaxFpd7cp+lcJTEPE48ja8wsYoxutYFdMzRhPug4b1WOjD1L
 6ppMG+wq94mDXa5cQWiXBCVVa4AoJvsy2PDthQq+cPDpNWSn7opQwzNmykj/56zxF76R
 wDaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW44hvjp51LUKcLo/nUs1JL8kt2xgtm5OSMlSmuBBQHMdyNleJQm03YZTYof9feZaUQNIDVizv57KQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxasgxwKyfq7YGtPcNyBKE0K2rXpwYtZ6bP9YjhwBzyvS0BjzJ8
 u7of7PD1XThfIC64sANVKu52IPQpDLPqi+JeECCdABxt7bcw7rSlQE4VLaFGE4E=
X-Gm-Gg: ASbGncv91362OHf1A8K1ox7uITOINwjgyJcBdg/sotmUqmPsIWwJ41NhSA5QeASOCSs
 D2gL6BXCO+REH8yNuITzavkee/nObxpoMIdJ05jPu/aGJaXDBagC7QvSLkmBw3V4j6GoW6LsuR2
 6UAocpAVvRYOei28LpwBHufikx6umG76OCn9cDfJh90dq0dEDoHdGmaCxJZH632Ic6Fwwy773XM
 2yFMv95tLMHR+AAlWXpW7Nf42aDKibAGIlfSua2nAzFmy4UQBIiOzNaTGl4YyPDyZ8Yek9Mu+gA
 M1P5WMEidbWLYKuPr/KtdV0d6Y+KnwaHrgEyANNQ6NyuO9m0zXU1BsBM0DkA3IQ=
X-Google-Smtp-Source: AGHT+IGyhd0C3UJpzvPZ0bVWbsnLobFeYW2i8lgDV+9JLWekTtRmEt7WWLRk7j4RRBw0Gi70mwVr5A==
X-Received: by 2002:a5d:5f96:0:b0:38f:4d20:4a17 with SMTP id
 ffacd0b85a97d-3997f8fb0f7mr4046481f8f.13.1742559796246; 
 Fri, 21 Mar 2025 05:23:16 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3997f995766sm2221656f8f.1.2025.03.21.05.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 05:23:15 -0700 (PDT)
Message-ID: <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
Date: Fri, 21 Mar 2025 12:23:15 +0000
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
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
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



On 20/03/2025 18:43, Dmitry Baryshkov wrote:
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
> 
> Then CDSP1 should also be gone, correct?
Its already gone as part of the patch that I shared in this discussion.

I will send a proper patch to list once Ling/Ekansh has agree with it.

--srini
> 
