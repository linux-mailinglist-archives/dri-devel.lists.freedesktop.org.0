Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BF1BA468
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129F66E1D3;
	Mon, 27 Apr 2020 13:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F806E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:17:33 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ea6daf40001>; Mon, 27 Apr 2020 06:15:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Apr 2020 06:17:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Apr 2020 06:17:33 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Apr
 2020 13:17:33 +0000
Received: from [10.26.73.54] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Apr
 2020 13:17:21 +0000
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
To: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones
 <lee.jones@linaro.org>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
 <20200224143732.rreev3ypou26hvx3@holly.lan>
 <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
 <20200316090546.5eufi423ahstz6v3@holly.lan>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b57f3ef0-8d14-c0bf-524c-9ec0d6334e0c@nvidia.com>
Date: Mon, 27 Apr 2020 14:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200316090546.5eufi423ahstz6v3@holly.lan>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1587993332; bh=PWx8n+kYRA1n2vodVtlcl5MSgTdEhqLiiBItjXVs/nA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=CkD/p2YTdNlyTddyE4uATk7emVK+mMQlRmf80wOjePk8J8B+ueUTzoMvVB7PLQXuo
 g/QXkFsyAPpDPOV35S7mZ5eMG4M7kgwDwBM4COJeOzO/Cn0np4hQBGWR43y1VwYJNz
 PDuiYuyNsBPd0A93YpPj7xqhM50Dk4MrkMIPrT+5vZL+G8nHzxpu77Um5w9dx29y/m
 NaKV9q0/e4ssVmWBd8u7R8J9jlVNGRmiDPS3c81vZO5fg3N/yQpJFzIt/TGp0NivH1
 bEG8ZC/FdDe6RMspv+7QFzEuOnOS0CoRobI7uP9xj6vQqNbgkramjx7F48lkg0rdmR
 FYgjRnNBKQQnA==
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
Cc: linux-tegra@vger.kernel.org, Milo Kim <milo.kim@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On 16/03/2020 09:05, Daniel Thompson wrote:
> On Fri, Mar 13, 2020 at 02:16:16PM +0000, Jon Hunter wrote:
>> Hi Lee, Daniel,
>>
>> On 24/02/2020 14:37, Daniel Thompson wrote:
>>> On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
>>>> If probing the LP885x backlight fails after the regulators have been
>>>> enabled, then the following warning is seen when releasing the
>>>> regulators ...
>>>>
>>>>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
>>>>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
>>>>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
>>>>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>>>>
>>>>  ...
>>>>
>>>> Fix this by ensuring that the regulators are disabled, if enabled, on
>>>> probe failure.
>>>>
>>>> Finally, ensure that the vddio regulator is disabled in the driver
>>>> remove handler.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>> I received a bounce from Milo's email and so I am not sure that his
>> email address is still valid.
>>
>> Can either of you pick this up?
> 
> Lee generally starts to hoover up patches about this stage in the dev
> cycle so I'd expect this to move fairly soon.

Does not look like this ever got picked up. Please let me know if you
can queue this one. Note it still applies cleanly to -next.

Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
