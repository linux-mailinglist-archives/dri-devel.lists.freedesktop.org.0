Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEED91CD51
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B2E10E113;
	Sat, 29 Jun 2024 13:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G8RzVivN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F17210E113
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 13:42:31 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a72517e6225so180605066b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719668550; x=1720273350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=89hU81MffUVomnG27nax1DyzxTndt9qlamfVFczEjJY=;
 b=G8RzVivNo/nXE/fmYcLXn/gZozDnt9qh9w7QiokbkvkQC/H3Mdvm0T2pWfDVRsORk1
 K7aBxwMpE/FFCuAouyE6n9xXMxGEDV6Flnjc/Z9nGRZBu3ppU6c+l1fW4BSiK+qj6ha9
 4w3OcbT6HZ9BfeZPxo+LzVKBaUkgs7/XoG9+5cu/LM9tIkRqOSULvvnO2+Pg+SntpqDS
 aGw9uzJGe+0o2ZUrJoFbFEVRaL3FKdEFpQcQZRi1cbAnULgnkV0VG0R4gs/2yl8TRU/6
 nQQS45Emtq8o3oGTymmT3kOfD6BzKfGt3EJoHz9Lvq5qMQ5MbauRS319Lca+3fyv/Fvb
 ywIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719668550; x=1720273350;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89hU81MffUVomnG27nax1DyzxTndt9qlamfVFczEjJY=;
 b=QGkuTHnGcnPb17CjqKDrsj3C0eNZMYvmDWXgqh1+fHUT+M3Kq7AKZM3OqYaWHl+Zm/
 +XoDFj3ARACzwAMiUXKAfzUXbAzCPd21D6LRXybxJGAEnHxP3OKe9WwRRLDU6qTWwjzr
 0KHHK84cxQn/NFXd7+4T+8+S80i1Oz4N3kB3M5fNh6Mc1CiiFUQw1PzT839/MjwwZiuG
 924Pnw5tJwAGe/IoEdoiBSgfcBGEykKL2BhhTmP4gQYYzV2AiUdN+7CWDATBGjOkOi8C
 GaoXLK10mZcKjoLuAiOsXXPE4sCXiSPHSTw5AYyI4MFQtr7K9lxBoXUMAcQOYmJBZr0i
 X7iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzo0qcNoHVsiR/U0YJiYq6tm468+rntHI+A5v6GKEFDpam25wK1AtpJxXJIyF/eGgALZPzkv+Z4XnO8ibd/5h0WM88YMy/npqI+cBA7ncG
X-Gm-Message-State: AOJu0Yx+evTkGYP8LX8p4mE/FGopx1uPnLtYlVy4OT+kDz2xhBeikGTw
 7ADgNmR31C1EuKJMMC4VE6YB6lOjtubMCiXFLE/mBkTkIr9nMAbZ0glYEDKI7p8=
X-Google-Smtp-Source: AGHT+IGkI4CdDPFLm5hkOo2eXhclVzqaDP/BK686i7v6/fhp22g57DOv+8mTR622ezzn20kugpZ60g==
X-Received: by 2002:a17:906:c0c7:b0:a5a:6bde:c3fb with SMTP id
 a640c23a62f3a-a751441e94amr70454766b.28.1719668549740; 
 Sat, 29 Jun 2024 06:42:29 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab065187sm165453966b.139.2024.06.29.06.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jun 2024 06:42:29 -0700 (PDT)
Message-ID: <a392f063-3914-4fff-969f-1b9f6de71241@linaro.org>
Date: Sat, 29 Jun 2024 15:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
 <20240628101549127-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240628102726231-0700.eberman@hu-eberman-lv.qualcomm.com>
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
In-Reply-To: <20240628102726231-0700.eberman@hu-eberman-lv.qualcomm.com>
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

On 28.06.2024 7:31 PM, Elliot Berman wrote:
> On Fri, Jun 28, 2024 at 10:24:52AM -0700, Elliot Berman wrote:
>> On Tue, Jun 25, 2024 at 08:28:06PM +0200, Konrad Dybcio wrote:
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

[...]

>>> +	ret = qcom_smem_get_feature_code(&fcode);
>>> +	if (!ret)
>>> +		*fuse = ADRENO_SKU_ID(fcode);
>>> +	else if (ret != -EOPNOTSUPP)
>>> +		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
>>
>> Probably want to update a6xx_set_supported_hw() error handling to ignore
>> -EOPNOTSUPP or do:
>>
>> 	else /* ret == -EOPNOTSUPP */
>> 		return -ENOENT;
>>
>>
>>
>>> +#endif
>>> +
>>> +	return 0;
>>
>> I noticed that if SMEM isn't enabled and nvmem returns -ENOENT, we still
>> return 0. That could lead to uninitialized access of speedbin in both
>> users of adreno_read_speedbin(). Maybe:
>>
>> 	return ret;
>>
> 
> Ah, I see patch 4 in the series now, but I wonder if we can do something
> better so that this patch works without relying on later patch in
> series?

Looks like rebase mess on my side :/

Rob already picked this up for next.. Guess we could ask really nicely for
a forcepush there?

Konrad
