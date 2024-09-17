Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAFF97B0EB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 15:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D2E10E0FF;
	Tue, 17 Sep 2024 13:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eReiwT/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A0810E0F1;
 Tue, 17 Sep 2024 13:44:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F22F5C54D1;
 Tue, 17 Sep 2024 13:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D00C4CEC5;
 Tue, 17 Sep 2024 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726580691;
 bh=NrDaq5JA3mzdTYXCw/EFz7LBBcGcWuIObz7V+lBi06Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eReiwT/Vl+VoZ+vbVwFViNf2IDd1z73PSixNyyNYYnD/y9fjEEntcgvQT9Dy+3UcS
 nNp/2uuuUXMx/3qdcF6L4ImQ5Gb3/TWWdoQqLaGLnZsfCf7PcUNMQosfejfOpF8YM0
 6F0A0rJxHQ7FFUbPZ6hT/Kti/1oR5pLGBORBWQ4fKnCnVJvBGQDtWWx2YUec6BuQZQ
 8aHhyhfTk9efeAp6xGnFarlOzgeNDehv5K2pTG39ccFRcoEp6t+rVoo+s3IQL1+QS3
 E/VCU0Vmcj7FZg/Jz+xtipI6bpNjZ5Su+n+LynxEIWsvTW0TY0OmaobEmOPOwTqkvg
 pwbSI+pIIGAaA==
Message-ID: <c7d18bce-cabc-4edc-b1b9-085653110528@kernel.org>
Date: Tue, 17 Sep 2024 15:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
 quic_vproddut@quicinc.com
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-6-quic_mukhopad@quicinc.com>
 <ZuH3WqMwn7fl3nhh@hu-bjorande-lv.qualcomm.com>
 <a44a6f08-1f4a-4e5c-a4e4-30ab65c467f7@quicinc.com>
 <ZuStkRFvwJT7re6D@hu-bjorande-lv.qualcomm.com>
 <b2d94fa5-6924-46f6-95cf-bde315ccbdbd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <b2d94fa5-6924-46f6-95cf-bde315ccbdbd@quicinc.com>
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

On 17.09.2024 10:12 AM, Soutrik Mukhopadhyay wrote:
> 
> On 9/14/2024 2:54 AM, Bjorn Andersson wrote:
>> On Thu, Sep 12, 2024 at 03:34:05PM +0530, Soutrik Mukhopadhyay wrote:
>>> On 9/12/2024 1:32 AM, Bjorn Andersson wrote:
>>>> On Wed, Sep 11, 2024 at 03:38:13PM +0530, Soutrik Mukhopadhyay wrote:
>>>>> The Qualcomm SA8775P platform comes with a DisplayPort controller
>>>>> with a different base offset than the previous SoCs,
>>>>> add support for this in the DisplayPort driver.
>> Please check the line wrapping of this as well; the lines here should be
>> wrapped at 75 columns.

[...]

> 
> 
> We cross-checked the mdss architecture and found that there are only 2 dp controllers for each mdss.
> 
> We will add all 4 and mention in the commit message that "Only MDSS0 DPTX0 and DPTX1 have been validated".

Looking at some docs, it seems like 2x 2 controllers is indeed the
correct config after all

Konrad
