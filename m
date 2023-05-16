Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483070542E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 18:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5E10E040;
	Tue, 16 May 2023 16:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B896510E040;
 Tue, 16 May 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684255229; i=markus.elfring@web.de;
 bh=ugGZ0+AcIOuo/HAtpRBpxao7uXTu538oDGUS9TwKnp4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=mzYFy4ygsqmQ1+L78eMdev+pH3UCStf+7Q4aTNzILqloE0HP2XCf30FsbQ7YokQrz
 zUebobHTuGHM9SVr3E2kP3Gh3MDQ3mbedVpdgI+cpkA62ZpxH/XcwGkSFe1MtAkKth
 dq6CFLimjwUmrGgMm3upxbLA5HyFlSt6WlZs25L/XU6Ne2zvzoSj5zi55O7eWC8Cqi
 ZbqSmcXrC/EJplNbYq0QM4REhl+XKbab815LECfqDRNSc6rLHUADnqVevP6MSbtJK8
 lU0mtpZQE2D8N4e9F8508qtQxOMq/03il3/qBep/kLL5DKA4WyTJzDvSQbwzw+ZI4P
 9f0LZgWwy532Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1phQq43FGy-00Hzei; Tue, 16
 May 2023 18:40:28 +0200
Message-ID: <591e4d84-ab96-a8db-09fb-968a630d606e@web.de>
Date: Tue, 16 May 2023 18:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] drm/amd/display: Move three variable assignments
 behind condition checks in trigger_hotplug()
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
 <89048a5f-2dbb-012c-41f5-7c300e8415f5@web.de>
 <edf173d9-8b59-ecab-99d0-1063b51574a9@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <edf173d9-8b59-ecab-99d0-1063b51574a9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EHvyR9sPQDdoSI8E24MjTjBHNE34IrFkXfakpw4cbttBrv/0NAc
 yMDhr+DbA/ZVFn0IZ7Lo4HeGvVILE+ExYeuzr25ctpzJQv1g+8EZVSsMvSF8kG7RQ/m8LgU
 fCYJwcbtQKSQUIr73PDMT/XE+kBc32CfSV0i+ig/doCjxTHUE8Tnux9ZNXdFLwhv6WcP9o9
 roETPDsP0WDGglxMRkqaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Zvzo7aMxB44=;7I9lorAPtcorqLfbaixEFqdnXOE
 alQy5LjJqBLLH6IPFEyZf7O6NjWoIkFTgALzBSWtSEb1SWXIsXvg257F26LV9QibgkCcWh+3f
 s+xYoOYTc0M4MCP9MzBur8wviENNM9IpGpORwQso/HMU3ZcdWtJbYosDmbGalsaunrp+19RoJ
 lKdrlwU920vOp7cb2A54kmj48rGr48fDbtOwyl1ijf8GwYylIWtk/iG7kzlYgvF+rbJBCN1Tf
 ZLParTtg+OaoU6gCiU1cWYCs0B5zP0ZyDH7SCWvVSw2KCApZtCkktPqALrsWqtkljGszM3jgg
 xl9BwDwX+enDYA4YDNGv1CA1ngWiDpJy9BouQcMf98VD84Q7bpwHsb28itOLcc4tAHZLtlEGc
 Vym54VSHHaZfs4q3/IhHrXyuy1pnoJMKeQduhF+ylStH5g8VoyX36Y4USzeud01TB9kI08mhz
 RCRrb+wlo5araoOSCd9El2NDrH6gSJYj6iw9b3GZZ54o3lVUru05N8xYVxHEUhOU9qK9NqXsq
 3sHgSGl1wq6/3ZnOro83wp7Ix2At49nMXRBuF3BT6yM1Snu7V6CWIRZlVDyXAAfXGIiiSRRsf
 4T+bwx55aN4Rfjo6LEhBL/9CK/KvrT5qm4qQpj39gIOtrtMDuj1n1To8tGxlFIjvh7pp5iaVw
 QIUyPv+lHrbxh0j412Qg5IEV3ebNttbOIMDfpt9PlUpp1LZAjucbB8T7/brZIxwioUV7bMOtd
 dxFi+CMM6stf6Z3Spg0LsPcfKyol3O2swCn5ephfuTDGHLE9mHdWVquRgR+HxSJJFuHL+9bUr
 Uj3pmotM+ZE3JG+pPx09fh/W9c1dc3/Xp36JLzmoWjzQui6pG2icwremJEpoCSG1rp74gmxk9
 4/a7ruL5i1lScPGZhIUkpEnbCLr9qA3gtZOFvjxa8UE55tEdgEsyRY7U/BDZmrIu5xvofPdXU
 bB7afA==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Ctrigger_hotplug=E2=80=9D.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for three local variables behind some condition checks.
>
> It might be that the NULL check doesn't make sense in the first place, b=
ut since I'm not an expert for this code I can't fully judge.

Will the source code and patch review evolve any more?


> On the other hand the patches clearly look like nice cleanups to me, so =
feel free to add an Acked-by: Christian K=C3=B6nig <christian.koenig@amd.c=
om> to the series.

Will such a positive feedback trigger any further collateral evolution?

Regards,
Markus
