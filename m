Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465ED07D39
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8869A10E818;
	Fri,  9 Jan 2026 08:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cmxysUpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF64D10E810
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:31:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso2908751f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767947473; x=1768552273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ScHhY7gthksnfmgH6uljC923NNYDsVbTgY/cHmeyxX0=;
 b=cmxysUpD4e1nzRrqpjjdFSP3TaaKbMwk1Z1ZtbPIIOpvyrMlzDAvcgyh/MOeSn1qTK
 VDEJbn91bMnnLhVoP7b4rA63iqLV3TD1iyrtHLncoQEwTeAHzSNbhrqDAzcOhvxgB6ei
 dI31wxTU+Gm7Oo5xVM3VVfE4majlvD8lYUZ0nKMk9g49OlhGRi6sF/9FdmjLkMo/uvK8
 k9FB276lZ3WFDHLuzH0UD9jG31EQiZAKfd6yvh5D90b0CaUU+GpvS7GNHc9ogpeMImeV
 teXJkBLKn1lbK7IsAX8ZBBltpc39P95vPrTPVuiRHN+sxZz2kcbslSpLhYYfIHYJml5a
 XxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947473; x=1768552273;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScHhY7gthksnfmgH6uljC923NNYDsVbTgY/cHmeyxX0=;
 b=ARQffFXD0oDl7N7I6HhWOPKoCBYuMJcapS6Gtpk7poCAdJPUnQkvaPhBOZLpPsGfZ/
 dKNAbFmLq2RAULq516l8VPNlrAL6iCn6OEPIBI/2GOZwks3x/YJlMJkHC3dC3EnQ0S4p
 0XOpCYUlGMbzpetJtcz84IilTyPAdG3s9F7EeRAxc3Wzd7RGNCAWXrz0DLjfFEM9Iqpg
 /70cjk4oF5XTQ/2J7Y1v0+gVVxeBgzIzFC8WtXfyU31YlbnhNvW2prq0pZQN7GhZdCJr
 Mhv4EOruwzYGV1GWLzuOC3H6Sbd8JBuaoIF2mA2zJRkLzKsdZtXB99FyGrzLcu89w+8I
 h4Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5/cqOp8z6cwjVS8b8m+o2pdI1T2NxbOtlvq9J8bUBSUklHNmFMM6Vs4GGWfVpvbOxgH+OC7Ju/Ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ36fn66xyCVboD4Gh8Hx5d7txs4pYG0gxpjEUcpZ4c4hYPyuc
 n4ffNeS3PhUfkmWxvkFqfvs56tK2efQdauXt+8QKfWzgB+hAhj0tEzuUZpuvl9ces0c=
X-Gm-Gg: AY/fxX6IRuW92zeL1gvLWGae+UCsdwISvGvalmuygPrx1swS+dayDGmBg5VzPGHuEbk
 TXFHLGgtMtfInb8it87QWCK+H/Cz8FV0jZ9eIs0xltLiHgYZI/i7QRMjJTsvqDF9U8Wej4TH53l
 LeB8OsGXPXydqXv697JaHqOdMm7VJbsMBCEZlPznQkpe/6eokxNahpk4V/swdkvNPDPQiXeLn+J
 8r+EjZ8Qmz4N8lQs54mgYGpBmGoIYQ6ongeWZbSkbErPbkRLVnHaOZMvxdlnFEh7SKNZg/ZYgtl
 hcWe2baWlWqmhBluruBC8ZvTxGeK03pYsHTdDueMdlCW8QXdfc+keshkTewziVT3ytbPhkuoym/
 D5XVympuzqWjV4RvpqEeazQbvm0+ExqKWLWfB+zUFjxFimiEQY5CgzP6Zpp0Dibx/vrF4PwfL6A
 X2P0HHsa0KhAfrG5VYuYAj/mB87TevisveTSR8w8ZAJngyP7qy0XXsuinxG873eYU=
X-Google-Smtp-Source: AGHT+IHsXjfVMgqUU883lNdJMdHku+hLNkk+zQ+G0NK84h/s8sm1XXRkmzNxWJiENK0PtpaJaMtafw==
X-Received: by 2002:a05:6000:26ca:b0:430:f5ed:83fc with SMTP id
 ffacd0b85a97d-432c3760facmr12321898f8f.11.1767947473278; 
 Fri, 09 Jan 2026 00:31:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16f4sm21785092f8f.11.2026.01.09.00.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 00:31:13 -0800 (PST)
Message-ID: <34590271-0e34-45cd-ac6f-6f901e833087@linaro.org>
Date: Fri, 9 Jan 2026 09:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/8/26 15:21, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
> 
> Patch 3 should really be merged after 1&2
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> - Handle rare cases of DDRInfo v5 with additional trailing data
> - Rebase/adjust to SSoT UBWC
> - Expose hbb value in debugfs
> - cosmetic changes
> - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com
> 
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>    coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>    branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com
> 
> ---
> Konrad Dybcio (3):
>        soc: qcom: smem: Expose DDR data from SMEM
>        soc: qcom: ubwc: Get HBB from SMEM
>        drm/msm/adreno: Trust the SSoT UBWC config
> 
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
>   drivers/soc/qcom/Makefile               |   3 +-
>   drivers/soc/qcom/smem.c                 |  14 +-
>   drivers/soc/qcom/smem.h                 |   9 +
>   drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/ubwc_config.c          |  69 ++++--
>   include/linux/soc/qcom/smem.h           |   4 +
>   9 files changed, 485 insertions(+), 120 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20250409-topic-smem_dramc-6467187ac865
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/
dram_frequencies  hbb
root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/dram_frequencies
200000000
547200000
768000000
1555200000
1708800000
2092800000
2736000000
3187200000
3686400000
4224000000
root@qemuarm64:~# cat /sys/kernel/debug/qcom_smem/hbb
16

Thanks,
Neil
