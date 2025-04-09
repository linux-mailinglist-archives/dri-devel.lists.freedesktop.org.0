Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C743A81FEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8F910E80D;
	Wed,  9 Apr 2025 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MoG/UPJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E1D10E810
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:30:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so31713255e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744187420; x=1744792220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9NSePx0FSzul4z64RbYTcrnqX/8oJkOBY/MIB1WwBFY=;
 b=MoG/UPJH6SWE7oYroS+k61wfwPK/Aqqz3FAIoYa3i1m7Ksvo9e2WZzKIg+0KoIPKr/
 jPDW77YKtrstSOWiAE5l2avrgUCkuHNRIiG35/wVh4/bPfk+0GbZmxC0JDgwN4ZvQanN
 PwW78vxuFOhINzKQhSrnD3AuNOvRWK0zORT1G9T37A70pFCta2Fsy53poGR29RlzPAmx
 ReFfL4b/Hg9biE7ddD8wurUn+3z/qj6YETP+bOwkZC6ErC8S2MUrk8RGAzRg/LxE43f8
 tfAteOZnlCTHvyEPJeo7XjF6Z3AM3tXBiS2VPO+1BUHcM8hcyWqV4+fwJgEsn8VZP6N0
 juTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744187420; x=1744792220;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9NSePx0FSzul4z64RbYTcrnqX/8oJkOBY/MIB1WwBFY=;
 b=NSJgBeLC6soR+b7gPeMLBWB1nyBpuHMQZfixyX5PT03+d/r/5m/G7uShViFI7SKWiS
 trNtvqqY/vDk9Tqwkr+0RBJEL685M1avLq6ORo3BpAaF4hVTyp/YGTxJM3TZlxZgiPD+
 Zz6NrVpVFs5R/pMLVnkB5ozfXzRiLAVHT+bS5v8wKRUpUzrw4GX4Iwncwvk/+B5NUdTu
 DCQKYGblpcyQhDc64Gygf+Dn+WpYFrIAj9XveKTuaKHs3WFJmVsk3bKH9lC9r5wLG7T0
 D4XLEaChbsyfvR5HhSp36CABLNmkkOM3rdadiYkz6y4VsGrggX+OVPwwvsjgxdhT1ItT
 ObKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeUt68R9V30QUYsQiJpnnboKM3vnStnFG0AiY525QFHzxCkSTJPICY08hcvQSLWU+spDuFKTF99f4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytNOaeQXqkP2/2IPgVGSIA2qfkTmjq8EZ9E7mb//LIVwG3Hnt1
 EivkGq5CQjOeHlquQqj3sYFJ9qd/T0pxMnMD+A1JR1RUhYbHG99bHUZIgFq+pg4=
X-Gm-Gg: ASbGnctl8lb3au0Fv4SIKGvl0uDfOHClN/cOXTzj10hgjNdhjFwH/2ZM8CTtgUgu1y+
 ZnuqEo4OHOlM7UAmXqq+oAvA/83I9M1fm8Tcqxsxg55+CDoCfPfIjAwQv9ZijGLhZ8aDRNJTcz6
 0wHyUGIY3JaSo6WIaDLbIrS1uoaZUU0qbHHHbXzEfrqq3tYH9MIZfxm0IO19Wfj791pwXdN6i2b
 vC9WW96HxhaznveAnZYKjVTalxOlilnKYnSv6x+LkRVFwUvqWKGQ9jzfphb9pq3HvXCixCfqgGM
 airf+2N+8BItEkTPecfRCxob9YaoPWEaNUvCsjm4SBS7oJTfE487s2EgyV91WyAyeZGWozOHaco
 mJJefbcnnqRuppszHhA==
X-Google-Smtp-Source: AGHT+IFySxe0z8NxaNGGcfgDc0MjfyPIqBjFQlVyDAxqi0mPDxdzLAVrQhkB5ZyAMLLHhx4GCwjrDA==
X-Received: by 2002:a05:6000:40c9:b0:39a:c467:a095 with SMTP id
 ffacd0b85a97d-39d8852e91emr1424483f8f.24.1744187420186; 
 Wed, 09 Apr 2025 01:30:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65?
 ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0a11sm917127f8f.73.2025.04.09.01.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 01:30:19 -0700 (PDT)
Message-ID: <fd9ac8f1-94ad-460f-8ca7-e56724416fcf@linaro.org>
Date: Wed, 9 Apr 2025 10:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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

On 28/03/2025 03:47, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
> 
> Note: This patch series focuses on QTEE objects and userspace services.
> 
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
> 
>    - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>    - TEE_IOC_OBJECT_INVOKE
> 
> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
> 
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
> 
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
> 
> You can run basic tests with following steps:
> git clone https://github.com/quic/quic-teec.git
> cd quic-teec
> mkdir build
> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> 
> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
> needed to build the above.
> 
> This series has been tested for basic QTEE object invocations and
> callback requests, including loading a TA and requesting services form
> the TA.
> 
> Tested platforms: sm8650-mtp

Does it requires any DT changes to be tested on other SM8650 devices ?

Thanks,
Neil

> 
> [1] https://www.kernel.org/doc/Documentation/tee.txt
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Changes in v3:
> - Export shm_bridge create/delete APIs.
> - Enable support for QTEE memory objects.
> - Update the memory management code to use the TEE subsystem for all
>    allocations using the pool.
> - Move all driver states into the driver's main service struct.
> - Add more documentations.
> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
> 
> Changes in v2:
> - Clean up commit messages and comments.
> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>    instead of QCOM_TEE, or names that are more consistent with other
>    TEE-backend drivers such as qcomtee_context_data instead of
>    qcom_tee_context.
> - Drop the DTS patch and instantiate the device from the scm driver.
> - Use a single structure for all driver's internal states.
> - Drop srcu primitives and use the existing mutex for synchronization
>    between the supplicant and QTEE.
> - Directly use tee_context to track the lifetime of qcomtee_context_data.
> - Add close_context() to be called when the user closes the tee_context.
> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
> 
> Changes in v1:
> - It is a complete rewrite to utilize the TEE subsystem.
> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
> 
> ---
> Amirreza Zarrabi (11):
>        tee: allow a driver to allocate a tee_device without a pool
>        tee: add close_context to TEE driver operation
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>        firmware: qcom: scm: add support for object invocation
>        firmware: qcom: scm: remove unused arguments to the shm_brige
>        firmware: qcom: tzmem: export shm_bridge create/delete
>        tee: add Qualcomm TEE driver
>        qcomtee: add primordial object
>        qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
>        Documentation: tee: Add Qualcomm TEE driver
> 
>   Documentation/tee/index.rst              |   1 +
>   Documentation/tee/qtee.rst               | 150 ++++++
>   drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
>   drivers/firmware/qcom/qcom_scm.h         |   7 +
>   drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
>   drivers/tee/Kconfig                      |   1 +
>   drivers/tee/Makefile                     |   1 +
>   drivers/tee/qcomtee/Kconfig              |  10 +
>   drivers/tee/qcomtee/Makefile             |  11 +
>   drivers/tee/qcomtee/async.c              | 160 ++++++
>   drivers/tee/qcomtee/call.c               | 759 +++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/core.c               | 810 +++++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
>   drivers/tee/qcomtee/primordial_obj.c     | 116 +++++
>   drivers/tee/qcomtee/qcom_scm.c           |  38 ++
>   drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
>   drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
>   drivers/tee/qcomtee/release.c            |  48 ++
>   drivers/tee/qcomtee/shm.c                | 146 ++++++
>   drivers/tee/qcomtee/user_obj.c           | 710 +++++++++++++++++++++++++++
>   drivers/tee/tee_core.c                   | 159 +++++-
>   drivers/tee/tee_private.h                |   6 -
>   include/linux/firmware/qcom/qcom_scm.h   |  31 +-
>   include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
>   include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>   include/linux/tee_core.h                 |  15 +-
>   include/linux/tee_drv.h                  |  52 ++
>   include/uapi/linux/tee.h                 |  54 ++-
>   28 files changed, 4434 insertions(+), 32 deletions(-)
> ---
> base-commit: db8da9da41bced445077925f8a886c776a47440c
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> 
> Best regards,

