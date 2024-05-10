Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8C8C25E3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3810E0D4;
	Fri, 10 May 2024 13:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3vGeAgym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAF10E0D4;
 Fri, 10 May 2024 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715348294;
 bh=9M5UJc9C+G9SRyQypj1LM3e6cRMeJPZKj6icey2JQWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3vGeAgymeAMzcAxMN7rZ7VcywZLqyxJ6HqBcuVZVw3pbZP0IOZ/s3qNwfD9spdzp+
 AxnO6a2ks5YDDmiQKQGdGE587JsToH2SuMyGVjOtD8lcAWLG1X+qLJWu6/Fv9v8V2O
 rVzZkTu2r22ZlxAwMQoQkjuJ9RCm6PKDUHuFXwoCCuxrJ4Kc48hbFKN2G0NOQE7XSg
 dESKN/ZcsAi/8Y5/WsmqkZ99MtznQGh3C7gFTL+55B8H812a2tW9jozA+Nsg6YfguN
 a5U2By8JSfkz0ZbpKkW58PnSJHhzi5oqLjqgJtYmdiOa/dAbF4SC62IxSy0jThXdHr
 9KuZqUEzuFeVA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A1873781183;
 Fri, 10 May 2024 13:38:09 +0000 (UTC)
Message-ID: <4fcb2d0c-14f6-423a-998f-0965a139eae3@collabora.com>
Date: Fri, 10 May 2024 10:38:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/gen_header: allow skipping the validation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <CAA8EJppDNYR1D4NacrurY2e_xf5ycrtFBAAWaB2QVRBgSMESnQ@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJppDNYR1D4NacrurY2e_xf5ycrtFBAAWaB2QVRBgSMESnQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/05/2024 17:23, Dmitry Baryshkov wrote:
> On Fri, 3 May 2024 at 21:15, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> In order to remove pointless messages regarding missing lxml, skip
>> validation of MSM register files against the schema. Only the driver
>> developers really care and/or can fix the files.
>>
>> Keep the validation enabled during one of DRM CI stages, so that we
>> still catch errors, introduced by mistake.
> 
> Helen, could you please ack merging the second patch through drm/msm tree?

Done.

> 
>> ---
>> Dmitry Baryshkov (2):
>>        drm/msm/gen_header: allow skipping the validation
>>        drm/ci: validate drm/msm XML register files against schema
> 
