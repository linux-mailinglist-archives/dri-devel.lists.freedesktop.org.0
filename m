Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E64B308DD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 00:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6510EA18;
	Thu, 21 Aug 2025 22:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="JA7/0yvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E9C10EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 22:02:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250821220257euoutp0299eede77bbf64638090b13573e5b59aa~d51QGAPhP1174411744euoutp02B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 22:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250821220257euoutp0299eede77bbf64638090b13573e5b59aa~d51QGAPhP1174411744euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755813777;
 bh=FhMuLkPlqfOoY3HIjX51+kKhFnIWCP0l9JSXpliABCM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=JA7/0yvQ9bCoZF7Gao2nrxDRcUPghZ/NnCzteaYJ3z8KWW17iOhcIqkflQLcbCGke
 JoSwhBZpTny62tt11p3bJesDP5T7I8CrHVkS9lnGecvQVVA1hEn14jVVuMhdXmZRhm
 XzkOGQNI4ARvYpm/Vo/b+NXer98BSONe8U6Ucw6w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250821220256eucas1p2c4854f72c98d23d6b8a6247712430482~d51OvRzKh0715107151eucas1p2U;
 Thu, 21 Aug 2025 22:02:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250821220255eusmtip12f604debb503f4c26d3d8ae003a6c9a1~d51Nw2j0p2648126481eusmtip1c;
 Thu, 21 Aug 2025 22:02:55 +0000 (GMT)
Message-ID: <1b7b1e78-e94c-4d5b-a023-61852d2f7951@samsung.com>
Date: Fri, 22 Aug 2025 00:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] drm/imagination: Use pwrseq for TH1520 GPU
 power management
To: Matt Coster <Matt.Coster@imgtec.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250821220256eucas1p2c4854f72c98d23d6b8a6247712430482
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906
X-EPHeader: CA
X-CMS-RootMailID: 20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906
References: <CGME20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <20250820-apr_14_for_sending-v12-1-4213ccefbd05@samsung.com>
 <CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>
 <27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
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



On 8/21/25 11:02, Matt Coster wrote:
> On 20/08/2025 18:08, Ulf Hansson wrote:
>> On Wed, 20 Aug 2025 at 10:56, Michal Wilczynski
>>> +#endif /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
>>
>> Yeah, this looks really messy to me.
>>
>> If there is something missing in the pwrseq interface to make this
>> simpler, let's add that instead of having to keep this if/def hacks
>> around.
> 
> Agreed (now that I've actually done my homework), I see no reason to
> keep the IS_ENABLED(...) checks around.
> 
> Cheers,
> Matt

Thank you both for the feedback, I haven't noticed that there are stubs
already. Will re-roll the patchset.

> 
>>
>> [...]
>>
>> Other than the if/def hacks, I think this looks good to me!
>>
>> Kind regards
>> Uffe
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
