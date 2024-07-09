Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FF92B49A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0424010E4DC;
	Tue,  9 Jul 2024 10:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P8YBVK3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D68010E4DC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:01:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52e9f788e7bso5186980e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720519305; x=1721124105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pjGwGtF2xRizI+srPedcBC0b7P2ztI7j/rQTVNi0iHA=;
 b=P8YBVK3HxL1c3G3wBgO4gS9RmlmviWlZ/vEtEQg7+/MC7htYGMD/TYI6LdqVsjtZ+r
 qZvhdklmlJJsxdgELFURHj4wqjl6tXn/LP9D7VXRkkB2uB7xqgAwweU3VJuQ5qeulxb9
 Me/JP3CR4QmhpEf9c4jNVttpoPdhvK6SqJY5SvVwW46wJN/Cc85DDBOZMHcjKJE5WYfJ
 74kHu2Cd90u837XchsdQWGIg5rhytYZ7/sbJvKD8SvtxGgEtB12Lua09KohWmGuwDgWe
 GYfEAjadRf56bi4+z8VLVOHkNfEEpYAgWAmjSmdnLkIzhbkBaisSm/brgqocBt1yeJTm
 pbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720519305; x=1721124105;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjGwGtF2xRizI+srPedcBC0b7P2ztI7j/rQTVNi0iHA=;
 b=a4yvYoLfgyt5G3uN8fK2SuNKLaM4UvU2JuX0OFGHog4kEMvwpu7/3MdS/RY2NZ/xjJ
 OMpZxlfsuPmMiLybH6vGkd9O7Wz9cTmq8TG1/yvISRXBZN5nuFhXvwfNAMHqVO1O3mO3
 pP9CTxJA/NIMB3hAY+ztSBNvYksODMTU7iwp9PxA4fWTg9ZviyOPCMdZvED2DlPOkG7Q
 mTwQNjOY8hD6/3ki4/dnWPQTJvVt24sWX5JJIJ0jQPB+GRID49Zp2ezIpGY4F0QA/KaS
 Dbk/mSZ0pWtJXOF7NX4UqMhRl/Ci2mWtSkaOyl0vP6rVFxMc2Z0SmhN+owh1O02GXQeC
 anTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvPak4iQEEX9pTdBX6wFqlYPXS7aLeKfYhLezg1FADCvA8mXWoZMqC7Kwgu0bJAa4qjMdvyc44WA+0zKMtgSOg/SoWhn53sc0jdGhqslu5
X-Gm-Message-State: AOJu0YwvEFRwuDx0R7ltYq9Q2b8XwhbhFWejg8+c9kV6H1t7/2OHjdY5
 sBW33Ipi3BPBamVVGNH1B2DsHlbArlViReVCU1M+9lAALj8oxtwYxzs8P3L3gCI=
X-Google-Smtp-Source: AGHT+IFLXhBeqSztq8eF7bnR+mC6OL8ZEmPYgOhofCzxDKWUbMbIUlDUTp0ODWISoYGSEKWBNj89Dg==
X-Received: by 2002:a05:6512:3e09:b0:52e:9a4f:204c with SMTP id
 2adb3069b0e04-52eb998e696mr1580790e87.10.1720519305159; 
 Tue, 09 Jul 2024 03:01:45 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda308d7sm860432a12.91.2024.07.09.03.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 03:01:44 -0700 (PDT)
Message-ID: <5139c105-a474-4097-a59c-da158ee1145b@linaro.org>
Date: Tue, 9 Jul 2024 12:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
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

On 3.07.2024 7:57 AM, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> the secure world. Access to these resources is provided using MinkIPC.
> MinkIPC is a capability-based synchronous message passing facility. It
> allows code executing in one domain to invoke objects running in other
> domains. When a process holds a reference to an object that lives in
> another domain, that object reference is a capability. Capabilities
> allow us to separate implementation of policies from implementation of
> the transport.
> 
> As part of the upstreaming of the object invoke driver (called SMC-Invoke
> driver), we need to provide a reasonable kernel API and UAPI. The clear
> option is to use TEE subsystem and write a back-end driver, however the
> TEE subsystem doesn't fit with the design of Qualcomm TEE.

I guess a very important question is: how do we test this patchset?

Are there any open-source consumers of this IOCTL?

Konrad
