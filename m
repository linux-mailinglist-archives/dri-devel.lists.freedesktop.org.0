Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5E93F4F2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C80C10E177;
	Mon, 29 Jul 2024 12:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SVQY8JZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7924610E177;
 Mon, 29 Jul 2024 12:13:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3920617FE;
 Mon, 29 Jul 2024 12:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C0FC32786;
 Mon, 29 Jul 2024 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722255203;
 bh=bmKyeNJ8spozwo0XX+T9shKICyNJDGinEDD400P3wjk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=SVQY8JZUx3BiTcOuDCkpsqvnzYYDrax1Tb2+N1qiaJtgcE855KPcaia8wMFkEdKiw
 E9M6rNuCnTQ4RZcBLZ6I/d8agamn9yTMsmNc7lSlp/nyRB2c0UQvbnAv7tVk36DoPf
 CxfLpSClORNG+LOIvtRzJxioAdqHLMRD8zybUrBWLNezIthOL8aCbKUasg7VfkAnqe
 0QmUls2CfO+UBeOkjT/1mtZcslKc10jHTZ79cpEeYgcur+L/DCH+VJvPivuPsiih1Z
 eXrbV3yot1eyw4lSxW4izBNkbErRI23vSVyEitcpbI/nXT7Y/8V0rcbduiDCHHox9z
 n1JRASoFnmmAQ==
Message-ID: <87607d2c-a4b1-4923-ba9f-9cfc56a0aa38@kernel.org>
Date: Mon, 29 Jul 2024 14:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
From: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
 <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCgAgAhsMFiEEU24if9oC
 L2zdAAQVR4cBcg5dfFgFAmWigk4ACgkQR4cBcg5dfFiMSxAAwHXp251cSKCUGkGBwQ5Ch9fe
 7S5AZCdIg0xAs+AwVTVll7htF0Fyc+8YC2Y5H+uNJXpSA5WmCU4sjpkkP7duJ0UNq9WvuAmR
 e3DPpmwlJwyDhK/mq23OT4hKz+oiXTrPviAUJVhI6uSqYCWH1ZXuZ1ISJm7uEFLEvh+05vm2
 wOBkYqJySZinmSpdyQG15mjtkI/T1gf3RZs0TUA2xVJP4rXsqnrFqYI2BF2YSfcUKCP3hZT8
 Ohzek5q8mAYe438BR6OIRRmhdIkzSmXtG8TXT7quoELQ/H5BgErk/FC2YZPMhVLC/bTKyK1Q
 skBQspTs2xlkXjawX0vP5wR4pR3OdtKuBytPiX9V4UbVXnvIvj9YtNcSZaeOJFNYQCBdH3cB
 tv9IbgMZjuVmk9JdodWjg20YCmTKpDsudxLLmDDqn8XHaV5FlYu09jQNsPviYLVs4oSFviCc
 yMDJW8SKennA/hAGfCufu8DE9hjAvLGOujRoegwwEp1kNX+U5P9kE7jSbXJw0r05UEpvtbFS
 O+1ZmYMJ800AC9jeB1oe5LUhfogn7Sc8pLFE+jKTQtcaNSQDP7AqwAu29jUMoA0E4TrWJ1ui
 qajelJNdsTntz3edHstcacqWT78JrW4mED69uwzgAqxlhljgukR1GURagRxH76TXzRvV4GoU
 JDZelR9Xqh8=
In-Reply-To: <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.07.2024 1:56 PM, Konrad Dybcio wrote:
> On 15.07.2024 10:04 PM, Akhil P Oommen wrote:
>> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>
>>> Add support for SMEM-based speed binning, which includes getting
>>> "feature code" and "product code" from said source and parsing them
>>> to form something that lets us match OPPs against.
>>>
>>> Due to the product code being ignored in the context of Adreno on
>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> 
> [...]
> 
>>>  
>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>  		speedbin = 0xffff;
>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>> +	adreno_gpu->speedbin = speedbin;
>>
>> There are some chipsets which uses both Speedbin and Socinfo data for
>> SKU detection [1].
> 
> 0_0
> 
> 
>> We don't need to worry about that logic for now. But
>> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
>> It will be difficult when we have to expose both to userspace.
>>
>> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
>> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
>> so I think we can use the rest of the 16 bits for SKU_ID. And within that
>> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
>> reserved for future PCODE.
> 
> Right, sounds reasonable. Hopefully nothing overflows..

+CC Elliot

Would you know whether these sizes ^ are going to be sufficient for
the foreseeable future?

Konrad
