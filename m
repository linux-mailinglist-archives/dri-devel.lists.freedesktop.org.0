Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9603FAECC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 23:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5441E89BFE;
	Sun, 29 Aug 2021 21:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4977 seconds by postgrey-1.36 at gabe;
 Sun, 29 Aug 2021 21:53:40 UTC
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34F789BFE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 21:53:40 +0000 (UTC)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 392761F954;
 Sun, 29 Aug 2021 23:53:38 +0200 (CEST)
Subject: Re: [PATCH 2/3] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-3-marijn.suijten@somainline.org>
 <CAA8EJppmBvohk3CC87N_P3m+CP=bRLWWknS7esDrYb-xArJFvg@mail.gmail.com>
From: Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <a27b4e74-3856-8c5c-73af-05e976430ea2@somainline.org>
Date: Sun, 29 Aug 2021 23:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJppmBvohk3CC87N_P3m+CP=bRLWWknS7esDrYb-xArJFvg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 8/29/21 10:39 PM, Dmitry Baryshkov wrote:
> Hi,
> 
> On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
>>
>> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
>> global name, most of which don't exist or have been renamed.  These
>> clock drivers seem to function fine without that except the 14nm driver
>> for the sdm6xx [1].
>>
>> At the same time all DTs provide a "ref" clock as per the requirements
>> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
>> that clock to use without relying on a global clock name, so that all
>> dependencies are explicitly defined in DT (the firmware) in the end.
> 
> msm8974 (28nm-hpm) does not define the "ref" clock. So you'd have to:
> 1) add ref clock to the dtsi (should come in a separate patch).


Thanks for double-checking and noticing this!  I've queued up this patch 
for v2.

> 2) add .name = "xo" as a fallback to the 28nm driver (to be compatible
> with older devices)


Are there msm8974 devices out there that might upgrade kernels, but not 
firmware (DT)?  On other boards (sdm630) I'm removing these from various 
drivers as to not have any possibility of relying on global names, in 
favour of having the clock dependencies fully specified in the DT.

> Other than that this looks good to me.


Any r-b/a-b/t-b I can pick up for the next round?

- Marijn
