Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F7A980B9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C003010E646;
	Wed, 23 Apr 2025 07:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kssS31ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C419210E649
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:26:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so44702375e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745393218; x=1745998018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kn/kdeC0hIJ6fPjKrtocu5NnRgujubxfAbJ5Urbgh9w=;
 b=kssS31ieiyZTsU1jrF3mCn8qpB+wi8pK8fu7CmhWgYq26/LavY+hWnSugeI029BUhS
 3/C0skM7L1z+hJNtQb/TW+tSePMiv9kzbxvDeRMwfQKV2Tnyccd3QTcwbE1+SnAOUSgU
 UECbushxu1SVRY2UYI2cYZhDHazpq5SlmrwSKepHRyXVRJcO/oJgv9Ci9s2WvV/HHX7Y
 zIhq86p13gua2OUtamI/X22pXiLAzmyz3WDdlgjBT37JF8RvEJLMtVvB7AEY0BPLHNLF
 Q0PX2VZefE5e1Ly9pSnuOrbIkFr3/nyvhCAx7SbAjwyemiOpcYzw0WQOgzZvBooYDkCT
 15NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745393218; x=1745998018;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kn/kdeC0hIJ6fPjKrtocu5NnRgujubxfAbJ5Urbgh9w=;
 b=Y/NNYykzevaDRLUV1cXk7Er78Knu9E0z5GkSmTGQ5lvuU7d6sfuPaIVZ+mTYY9hylR
 BFyTqfXG5PqBZJyRdVo9zy1pAZgdFaHIJcXxnGGnW8rMRIyluCjf8ntiitGAy8p6udHz
 wVFcnMK2TWujA/7KPmqSeBtKREarIl7H0JEm2DcrK4vYlVDPKgUMaGtX9MLKpgs6LXMx
 UetZ32mokmvzXKdcy1Sq2LSQjCg15F3P32QJZ+n8uv3Os5hOMI8HPJQZSDYTPYwKh7Gn
 LRilKizdVjIa6qHzztRp25gKMjtcyxX+9vH68PbPxgLrK5j1TWIYm4Np+ZkZC5lY1UJ6
 Sm+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGrOmfIexN+L8/UI/d5XzuCqXOxPHSyOYYHUN6mfej8paSukrWMpCUIrMZXsyne4goj04KnOlAmys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPentRejiRNZgllk87dXf7dI7S3oZS3xj0MoZWMX7cnnKQRiEn
 FT1HsT5WJG+o2MiLZbvRM/GlgLi1ggwV1nIDOk8opCzb8A7Kvi7te+Z7ml5aSlw=
X-Gm-Gg: ASbGncvON/eeHD5xzNFoB7oiptjXSgKf20v/6MT32hcVUaoZZGBne376476fKNDOl11
 ZeTNzOWWfAuBgzmNv4CVnqgTc2byKSCe9zARq/d19yZDuDh8tTi+JPMwNQr7sgVz2Ju8c6yOE37
 RijR0EC/I1Nm5nv8NfC+wl5Zoe6d0hkN7N2THa3rFbHHvRvw6jOUeyruY2HDl1qTywu0vw6BLzO
 zvoptLENTB8ETqTX1jy91ulBWeRROVILUlLd3uIn8k66lUzp6Yr4uWgLgjkFuxW1HGhN1L/gQpl
 0ILSVTpbpgRs7kL3Gnh6tCtZ9DU8/8gi0TYx4e1xjzoYA6ZGgF0as8c7WvLmrpX1bWf64b4LBWP
 GTFmeyNe0tgxSxqXT6A==
X-Google-Smtp-Source: AGHT+IGQjZAyp9xHW8ASlQKrR9fCiGMeMbCakgAb3SkKNca/+Rt6CnnTlRW63K73V1hHmlOCRLIMvA==
X-Received: by 2002:a05:600c:1c8f:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-4406abffc5emr134620725e9.23.1745393218300; 
 Wed, 23 Apr 2025 00:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd?
 ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092db2bd5sm15015645e9.26.2025.04.23.00.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 00:26:57 -0700 (PDT)
Message-ID: <283096ad-ae1b-42b8-8312-b192f735fc80@linaro.org>
Date: Wed, 23 Apr 2025 09:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and
 Google Pixel 4a
To: Jens Reidel <adrian@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Connor Mitchell <c.dog29@hotmail.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
 <2ca2b774-fd7f-4612-b38d-f60e32ff6f9a@mainlining.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <2ca2b774-fd7f-4612-b38d-f60e32ff6f9a@mainlining.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/04/2025 00:07, Jens Reidel wrote:
> Hi everyone,
> 
> apologies for the mess this created. Danila's mail provider ratelimited him halfway through sending the series and the attempt to re-try sending the second half an hour later ended up with a new message ID (I think due to not using --in-reply-to).
> He asked me to let you know that this will be resolved later and the whole series will be re-sent once the problems are resolved.

The b4 web submission is a great alternative when the mail provider is rate limited:
https://b4.docs.kernel.org/en/latest/contributor/send.html#web-endpoint

Neil

> 
> Best regards,
> Jens

