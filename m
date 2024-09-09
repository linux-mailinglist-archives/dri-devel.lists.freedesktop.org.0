Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004939716E2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB0F10E378;
	Mon,  9 Sep 2024 11:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PQRJuqtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9BC10E377;
 Mon,  9 Sep 2024 11:29:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 71D355C5799;
 Mon,  9 Sep 2024 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C54DC4CEC5;
 Mon,  9 Sep 2024 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725881381;
 bh=hDPtv1dq1B5J7Dly0bAlYZ/v9ujbcaEyi7+PCeXjFjE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PQRJuqtJaxH0Ov2XwoggQGTDsnqh302H1jIH0BYmFQLVxGwIib4VAXcJQwEdUv8vh
 HUhh26+uzeqDcE+mxr9GyiSHaNd1+R7w/h6kOUs7NyD3V/pWI2uuL9ZZktTEcj3mz+
 mXsXZ5q37n+4CGDntjhPkzxTOOVbGIAL17ZHfXuTknVm4lvMiVL9ZKaXvD7RoJ9ZMg
 lHRRNkPM0aSWNEb/18RB+mPCBVQa7FR/G/qMsi7fVfT8bmo0zARQVRWwOcVuIiuNwK
 gbUKMHiQvCbYuNgUyGz9h0ySGztPfW91s2EyNGdu2edHTLdgso+jSr/Q/0kuQXCd6X
 LDul1jtWt4IbA==
Message-ID: <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
Date: Mon, 9 Sep 2024 13:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
 <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
 <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
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

On 9.09.2024 1:25 PM, Dmitry Baryshkov wrote:
> On Mon, 9 Sept 2024 at 13:34, Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
>>> Under some circumstance
>>
>> Under what circumstances?
>>
>> This branch is only taken if there's a .create_private_address_space
>> callback and it only seems to be there on a[67]xx.
> 
> Existing code doesn't. I stumbled upon it while debugging private
> address space translation. And that's why I wrote 'it might be
> required' rather than 'the function returns'.
> So yes, there is no issue with the current code. And at the same time
> not having this in place makes debugging more difficult.

Feel free to submit your debugging code in a way that won't mess
with non-debug paths then.. This is trying to solve a non-existent
issue.

Konrad
