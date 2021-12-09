Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7B46F053
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E6610E1D6;
	Thu,  9 Dec 2021 17:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E367E10E1CD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 17:02:45 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 45AE63F63F;
 Thu,  9 Dec 2021 18:02:41 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
Date: Thu, 9 Dec 2021 18:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.bouchara@somainline.org, martin.botka@somainline.org,
 abhinavk@codeaurora.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, sean@poorly.run,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/10/21 00:33, Dmitry Baryshkov ha scritto:
> On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
>> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
>> checking if the relative CTL is started by waiting for an interrupt
>> to fire: it is fine to do that, but then sometimes we call this
>> function while the CTL is up and has never been put down, but that
>> interrupt gets raised only when the CTL gets a state change from
>> 0 to 1 (disabled to enabled), so we're going to wait for something
>> that will never happen on its own.
>>
>> Solving this while avoiding to restart the CTL is actually possible
>> and can be done by just checking if it is already up and running
>> when the wait_for_commit_done function is called: in this case, so,
>> if the CTL was already running, we can say that the commit is done
>> if the command transmission is complete (in other terms, if the
>> interface has been flushed).
> 
> I've compared this with the MDP5 driver, where we always wait for PP_DONE 
> interrupt. Would it be enough to always wait for it (= always call 
> dpu_encoder_phys_cmd_wait_for_tx_complete())?
> 

This sets my delay record to reply to two months. Great achievement!

Jokes apart, yes it would make sense to do that, it's something that works
at least... but we should verify that such a thing doesn't break new platforms
(like sm8150 and newer).
