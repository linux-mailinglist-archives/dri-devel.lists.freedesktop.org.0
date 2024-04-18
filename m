Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECB8A96C2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 11:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E110EDD4;
	Thu, 18 Apr 2024 09:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eS25vYET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCA710FB8C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 09:53:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a55323f2ef9so70528766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713434015; x=1714038815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VLkgZOZ90U32RSTtgOrkaBwhPTaXy2bpzcFJ6tojey4=;
 b=eS25vYET25LdlS5sBTT8B6oSv+hjxOVozTn2kRc+Qe/AYDStZyYdVUSz1W2zKSdjiD
 9UzKZEMyRlFziBBcw7xmgoVIvvKHdRsH2SvV8O0cpYPy1eVbDrVcSPl/a4Z0D5i/hnFi
 VU7QX7KibC/NWyMm8tJgzJyykaobHoGbJDQIJcrWBMK6MxSaoNlgDRIiR96XgawaWl6G
 naDeMmEwlZEkYPUlNyDaqiNiPlTEAwEOHUJ1usdUDEetVHgeXZ/Er22TDyyZSGlzNGeB
 RLBbUZILS2OLUBM/Y9cXYbc9Y0hZ3QRqIZkN9PQcRma+l6giOCyx7U57dsDytmvaAdwl
 1v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713434015; x=1714038815;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLkgZOZ90U32RSTtgOrkaBwhPTaXy2bpzcFJ6tojey4=;
 b=YgEj1CAK33n+6vZ19kG5nE6FE2rWRCtlyjYVqSKHWFxj/tY7sZalWgoomJGuQuaClo
 QmFy1k7vaia4jz7wujbV/aBHfkfFegD59C5J1Tw/2T5W3zK1u2GVXHnBJRcPAekWMg6A
 ANnVDQSWO2272HVWQoA4Q+6JK6KmOSv8lOeGLF0wnRp6XRRUdJsWCfCBBgDkEP2ggGsh
 6Z1LI/TLzhwmxJjumSc0+vkylYat5ZB4NHHMgvgR+hxXtgQvzU/vZTNNqrZDXiMbMTYy
 eFiLNcABl9wXyKsr2dOrIxKX3zRsD2WTBKBldIwDwOH0YIFJ7nRufDxSmjbOuCLhkfad
 oI3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfb9hszRjqYdtBJrXs416wzitJISwI4w3J7Ar4b2x5JPoHRQAtSnbGKYBU6A1bWp7cJCgEHjQX/vNHxBz+eXAeqVgB+XGJ05SCPVX08cjF
X-Gm-Message-State: AOJu0Yx03VWF/qLTJ9P0IUMOTk89kLIGXP/PtHGVHxy7eoM+AraAUbzp
 HMy1DeQf3w2smg88/OHVgd2g2r/ARSHSa++Qn72R2kUmteiuzKwTsdvNoVW98wc=
X-Google-Smtp-Source: AGHT+IGqguX6zc1dY53s7tQdvvJIHYrELOBLXEo4pkndtUrRrRSjHC6R2HouIgqmWsQT+z+tey7clw==
X-Received: by 2002:a17:906:851:b0:a55:6606:bbf7 with SMTP id
 f17-20020a170906085100b00a556606bbf7mr1276700ejd.35.1713434015231; 
 Thu, 18 Apr 2024 02:53:35 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 j18-20020a170906051200b00a51ba0be887sm662128eja.192.2024.04.18.02.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:53:33 -0700 (PDT)
Message-ID: <89eccb1f-c527-4820-a084-7fc4ad3f0ab4@linaro.org>
Date: Thu, 18 Apr 2024 11:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
 <mg6ojmzl3snj3k6fuyi6opkbdovs7xna6sn65pjh52ii4yy7u6@ny2spvjjbfpu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
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
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <mg6ojmzl3snj3k6fuyi6opkbdovs7xna6sn65pjh52ii4yy7u6@ny2spvjjbfpu>
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

On 18.04.2024 1:39 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 17, 2024 at 10:02:54PM +0200, Konrad Dybcio wrote:
>> Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
>> identifying the specific SKU and the precise speed bin (in the general
>> meaning of this word, anyway): a pair of values called Product Code
>> and Feature Code.
>>
>> Based on this information, we can deduce the available frequencies for
>> things such as Adreno. In the case of Adreno specifically, Pcode is
>> useless for non-prototype SoCs.
>>
>> Introduce a getter for the feature code and export it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +/* Internal feature codes */
>> +/* Valid values: 0 <= n <= 0xf */
>> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
>> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)
> 
> This is 0x101 rather than 0x100 or 0xff. Is that expected?

Yes, this is "the first invalid one", similar to ENUMNAME_NUM

> 
>> +
>> +/* Product codes */
>> +#define SOCINFO_PC_UNKNOWN		0
>> +#define SOCINFO_PCn(n)			(n + 1)
>> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> 
> This patch works on fcodes, why do we have PCode defines here?

I decided they're useful to keep.. Didn't want to split them to a separate
patch for no reason.

Konrad
