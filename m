Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B52EFF35
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D356E928;
	Sat,  9 Jan 2021 11:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C63089B3B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 13:39:57 +0000 (UTC)
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 252EA3F611;
 Fri,  8 Jan 2021 14:39:52 +0100 (CET)
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, robdclark@gmail.com
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
Date: Fri, 8 Jan 2021 14:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: sean@poorly.run, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 martin.botka@somainline.org, akhilpo@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 marijn.suijten@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, airlied@redhat.com,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Konrad, can you please test this below change without your change?

This brings no difference, a BUG still happens. We're still calling to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330 into an A640..

Also, relying on disabling LLCC in the config is out of question as it makes the arm32 kernel not compile with DRM/MSM and it just removes the functionality on devices with a6xx.. (unless somebody removes the dependency on it, which in my opinion is even worse and will cause more problems for developers!).

The bigger question is how and why did that piece of code ever make it to adreno_gpu.c and not a6xx_gpu.c?

To solve it in a cleaner way I propose to move it to an a6xx-specific file, or if it's going to be used with next-gen GPUs, perhaps manage calling of this code via an adreno quirk/feature in adreno_device.c. Now that I think about it, A5xx GPMU en/disable could probably managed like that, instead of using tons of if-statements for each GPU model that has it..

While we're at it, do ALL (and I truly do mean ALL, including the low-end ones, this will be important later on) A6xx GPUs make use of that feature?

Konrad

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
