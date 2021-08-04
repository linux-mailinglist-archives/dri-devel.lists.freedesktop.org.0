Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA03E02E8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1C76EA6A;
	Wed,  4 Aug 2021 14:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 526 seconds by postgrey-1.36 at gabe;
 Wed, 04 Aug 2021 14:18:31 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CB66EA6A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:18:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210804140942euoutp0155b728ad4dda5161436fcfb12a81db47~YH8HTNqwO1217112171euoutp01M
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:09:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210804140942euoutp0155b728ad4dda5161436fcfb12a81db47~YH8HTNqwO1217112171euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1628086182;
 bh=m5cyyo60a8j1iH/dVWQLYkbI/ZFi/aG+i1z6H4Obo1g=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=lm8Utu4hLUZNguwrjCQbDacZSNRMWvVj/YshPr//xzraDSDfnG2YuhCe1xZX6y11A
 f2g5lILsXTkan0sezukf+FmAFS3tWpcsfw2J91hkI/2qtAxrAXaGRKwimwkMaYPLz4
 X8JA4DzWQAiFx6BN8PxIiiOWs59YK6I1y+eQ/5S4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210804140942eucas1p2a22adcabc3c207f3cb2b512fc69c0789~YH8G3abOR2902329023eucas1p2R;
 Wed,  4 Aug 2021 14:09:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E6.5E.56448.5AF9A016; Wed,  4
 Aug 2021 15:09:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea~YH8GCdgqR2900629006eucas1p2Q;
 Wed,  4 Aug 2021 14:09:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210804140941eusmtrp2870860b802248745446daabbb22d7d96~YH8GBdQCp1266512665eusmtrp2j;
 Wed,  4 Aug 2021 14:09:41 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-b4-610a9fa56c7b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E5.45.31287.5AF9A016; Wed,  4
 Aug 2021 15:09:41 +0100 (BST)
Received: from [192.168.0.14] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210804140939eusmtip131e5008e60b206fa2a8cf3eef6e9f59e~YH8ESoAh92281322813eusmtip1x;
 Wed,  4 Aug 2021 14:09:39 +0000 (GMT)
From: "a.hajda" <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/8] drm/bridge: Make panel and bridge probe order
 consistent
To: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Robert
 Foss <robert.foss@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <cc638e20-aa7c-7014-f70b-1bb68e629d87@samsung.com>
Date: Wed, 4 Aug 2021 16:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCKsWRmVeSWpSXmKPExsWy7djPc7pL53MlGmxbaGPRe+4kk8XyM+uY
 La58fc9m8Xz+OkaLk2+uslh0TlzCbnF51xw2i4Uft7JYzPjxj9HiUF+0xadZD5ktVvzcymjx
 c9c8FostbyayOvB5vL/Ryu5x59x5No+ds+6ye8zumMnqsXjPSyaPExMuMXncubaHzWP7twes
 HvNOBnrc7z7O5LFk2lU2j82nqz0+b5IL4I3isklJzcksSy3St0vgyvi5dwtbwTuBijcLFzM3
 MJ7g7WLk5JAQMJFYsesCcxcjF4eQwApGid07lrBAOF8YJV5/7IDKfGaU2HF2P2MXIwdYy+2l
 whDx5YwSsx9sYIdw3jJK3Dr5CqyITUBVYvEZN5AVwgJhEjMWrAKrERH4zSzR0P2PDSTBLOAo
 cXPqMVYQm1fATmLBvffMIL0sAioSM9ZFgIRFBSIlzu9ewAJRIihxcuYTMJtTwFLi6qMGFogx
 4hK3nsxngrDlJba/nQN2tITAKU6JV88XMEP86SLx5P8OdghbWOLV8S1QtozE/50QzRIC9RL3
 V7RANXcwSmzdsBOq2VrizrlfbCDHMQtoSqzfpQ8RdpR403aZCRIofBI33gpC3MAnMWnbdGaI
 MK9ER5sQRLWixP2zW6EGikssvfCVbQKj0iwkn81C8s0sJN/MQti7gJFlFaN4amlxbnpqsXFe
 arlecWJucWleul5yfu4mRmBCPP3v+NcdjCtefdQ7xMjEwXiIUYKDWUmEN/QGR6IQb0piZVVq
 UX58UWlOavEhRmkOFiVx3l1b18QLCaQnlqRmp6YWpBbBZJk4OKUamBpmdT3PWJp270PN3Qmz
 xForSv49vdHrc0ZUIOxB/MQAjudns3h5jhvkzg1Y8f8Aa/kG1aOJxzb+FtZ0y1i43l2ZedcW
 96mPj0/OXetjLj4vsaVfb8cqO3Z/vh6fv56eF844s99cnqf68fgS751pjCc3TtVisPHy7nzR
 dPGi+8cfXI1ykVoZAkeaLbuUXigFF8ntqtHRUXNkFV+r6HQuqm+LGvP5vOA98+c+KVlidGnG
 /NxPuT/cohRcLkQdtQrosY/vM4m6OOnT5VdMX48ElEpLXko8WpEcplzbqbWbL2G+efzfpnWH
 tBq2CLvbp/5s+Dep6nudsIG+gNiGX1U7Ije4lb5eM4nDX0et4d0SJZbijERDLeai4kQAEymL
 9vcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xu7pL53MlGhzZzGnRe+4kk8XyM+uY
 La58fc9m8Xz+OkaLk2+uslh0TlzCbnF51xw2i4Uft7JYzPjxj9HiUF+0xadZD5ktVvzcymjx
 c9c8FostbyayOvB5vL/Ryu5x59x5No+ds+6ye8zumMnqsXjPSyaPExMuMXncubaHzWP7twes
 HvNOBnrc7z7O5LFk2lU2j82nqz0+b5IL4I3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQy/i5dwtbwTuBijcLFzM3MJ7g7WLk4JAQMJG4vVS4i5GL
 Q0hgKaNEf9815i5GTqC4uMTu+W+hbGGJP9e62CCKXjNKrD53hA2kmU1AVWLxGTeQGmGBMIkZ
 C1axg9giAn+ZJSa81gWxmQUcJW5OPcYKYgsJWEhc2LENzOYVsJNYcO89M8gYFgEViRnrIkDC
 ogKREp8XvIIqEZQ4OfMJC4jNKWApcfVRAwvESDOJeZsfMkPY4hK3nsxngrDlJba/ncM8gVFo
 FpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA+N927OfmHYzzXn3U
 O8TIxMF4iFGCg1lJhDf0BkeiEG9KYmVValF+fFFpTmrxIUZToHcmMkuJJucDE1BeSbyhmYGp
 oYmZpYGppZmxkjjv1rlr4oUE0hNLUrNTUwtSi2D6mDg4pRqYKq+famZ9Ex2ia+KWJiD9Skdx
 6V3NbYt2v086sX1tyxLG7Ad+7//Ny25W/GF94tyM9ddDNlivz/9wy9RdXb8vTqnIkCFneVnl
 Tvu9Vts2d65s7ZewO3Kr6ETx4cLo/rUfFRsmPmt4sv/oUpVqrjj3/qxMHj2XKdKnk7mfF0TH
 /km9fMGtZqHBd759m0pTmHazSO5e1PNjntMC2dwJZ6LlvhVc/chUmDGrQSH94n7xr6vmT7Gq
 9W5X4hb7Pf/dT/7pjypLz4aWB55ZIb5Kou/TR4c7MX6adT2fBCoFLczPJpc/ZygVfmE3wanP
 1/Bh4OO2kmWMLjv9V20rtbyp7KAQr/JYwSGzgvGVZb5S4AYlluKMREMt5qLiRADxOvneiAMA
 AA==
X-CMS-MailID: 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210804140941eucas1p2d4d4ec491074530c714797523aec05ea
References: <20210728133229.2247965-1-maxime@cerno.tech>
 <CGME20210804140941eucas1p2d4d4ec491074530c714797523aec05ea@eucas1p2.samsung.com>
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

Hi Maxime,

I have been busy with other tasks, and I did not follow the list last 
time, so sorry for my late response.

On 28.07.2021 15:32, Maxime Ripard wrote:
> Hi,
> 
> We've encountered an issue with the RaspberryPi DSI panel that prevented the
> whole display driver from probing.
> 
> The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:
> Only register our component once a DSI device is attached"), but the basic idea
> is that since the panel is probed through i2c, there's no synchronization
> between its probe and the registration of the MIPI-DSI host it's attached to.
> 
> We initially moved the component framework registration to the MIPI-DSI Host
> attach hook to make sure we register our component only when we have a DSI
> device attached to our MIPI-DSI host, and then use lookup our DSI device in our
> bind hook.
> 
> However, all the DSI bridges controlled through i2c are only registering their
> associated DSI device in their bridge attach hook, meaning with our change


I guess this is incorrect. I have promoted several times the pattern 
that device driver shouldn't expose its interfaces (for example 
component_add, drm_panel_add, drm_bridge_add) until it gathers all 
required dependencies. In this particular case bridges should defer 
probe until DSI bus becomes available. I guess this way the patch you 
reverts would work.

I advised few times this pattern in case of DSI hosts, apparently I 
didn't notice the similar issue can appear in case of bridges. Or there 
is something I have missed???

Anyway there are already eleven(?) bridge drivers using this pattern. I 
wonder if fixing it would be difficult, or if it expose other issues???
The patches should be quite straightforward - move 
of_find_mipi_dsi_host_by_node and mipi_dsi_device_register_full to probe 
time.

Finally I think that if we will not fix these bridge drivers we will 
encounter another set of issues with new platforms connecting "DSI host 
drivers assuming this pattern" and "i2c/dsi device drivers assuming 
pattern already present in the bridges".

Regards
Andrzej
