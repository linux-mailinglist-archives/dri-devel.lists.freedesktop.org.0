Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66C8B515E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 08:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD4112ADE;
	Mon, 29 Apr 2024 06:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ADyRSW2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B63112ADE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1714371883; x=1714976683; i=markus.elfring@web.de;
 bh=Vk3HT11dsQJBG0qes20Skl5rvhJPwT7CLw5IwZVPPIo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ADyRSW2jovDcN47KF529Z37V8VkUMRpaaCUK4gd+Je6Dq8TPiqqd3Lxqsm1M9Sq1
 2f4BafesjTMVX0I45HLI3A8aXC/VwahN6pjm1WRea/zq/TkCAH1AKT2nvETIXOw9J
 xPHcKZZjXIr7+DRzYtSdKaj9dMMAtEIhXpMf1Wo/7bEiy3kV+JHsw2e9p0XI2+YDk
 AJ/9k8qrepBaIsCuzrqTf7alkF2erwBQ43BfmyDfeF4wqur3zG74PmsBoclBW1ayn
 bQypAonA3+SAkHEE1FOCPY9Z5i29xblMHkW8BByydNkh0ldKhGomAq4wS4KJJowCR
 z8vNHTum2qA8fgagow==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MElZP-1rtqS03SrD-003T55; Mon, 29
 Apr 2024 08:24:43 +0200
Message-ID: <ae0bb605-38dd-4f0b-8100-51ad910f6d13@web.de>
Date: Mon, 29 Apr 2024 08:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weishi Li <liweishi@kylinos.cn>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, kernel-janitors@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240402093922.268368-1-liweishi@kylinos.cn>
Subject: Re: [PATCH] drm/virtio: fix memory leak of vbuf
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240402093922.268368-1-liweishi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uZirKThhywvNbW5IfnrENAaJ8KZiCv2IZVH7GAXIXACHWRatvWJ
 yFVAIi2ubK91+Hx+oBRfmkC5+zu5ST5Xx5RfXZ1iDWV4id8mhtmN53tiC8BmLj7CANU3/ai
 phrv83UtH/+Kdv4TrwuBY6FU7S0TLw4tlnuVHa3XmdNAaoU56plIT3h8YGXI8CpwgaCUVuK
 XT+6lHSLgL2N1vVVOVxTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tHpQdTEll/0=;UvcfWdViFkDpE1bsJSpUd9EWf1R
 fBRWADUQpQncmAkqyzeNaTORNfMU/jNMG3w9o/q9OwayGwXJecLHIvVUOaX7PA6Wq+b7FIicC
 hoAShDWZYwYNfE6TsmBXf2nYT0x/HW5aZcF4aiM2Ziaq+2s1y8WzDSLZtykXRQnYSxFZxVemP
 bZ5VP2GK++dZHsyMQflzPuMoiQQKBfPHzPLP5On2V92avwguBdnz+m8WKEPcTHkLZ1wflCly2
 NgutE8XxcW9oobmS4Q0LCKxJh3aw+jAaXFnEpGvFi5q5VIG94Yz0jswCsTb6GuoalPPm531Y7
 Kb32OkT+rLQzbpAjy9qIeGAMu91MetIPXEnS++QJxmMfiI+vq4y6FBlnn5v721950OK1o2CCV
 mWt3iLs7i9sktsW4PYL3kVQjvXQXqKMGES33VpWXsN3Kgts7QwMjBZFaN0qH3i/IP8jyZ4Qv3
 wpNz4FMrLxQZqF9IjJb3JDy5riYBTk/obz7Bucs+GWoD/ybhkPxgYTYkN5MQI0MOqsQhjT85C
 NDoN9zJhXSDoQ1UPSdadOWZx9inLM92i8/sRI/HUOx6Hlxl3S5eGcAWEgqzq+LsBBGUGNUiD3
 0y4AQ+h3n3FjfiDXwZzRiRsEAKsqmVheRWCa8dLfPxQqiVDui2nM/KQVxldvjLQzi/xezSXO+
 LX4bp8qRQ7kD5rvApoNMNELsqKZVRpZeCRRrcIyVTE9nrdSY4xGidm19CoGquunJpWOQlgcOK
 NV8YUVhDfufi6jdxIY3VZTNGat0uOPdqg6vnM9HEVU6jtdS3Jk+NH+rOShrWY52ZjohvE2hfU
 vi1li9EFpG8r/gBSQs+ZbD3Ikd8ZOLnKCuvxAen6hj2/w=
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

=E2=80=A6
> Therefore, when upload fails=EF=BC=8Cvbuf needs to be free directly.

Please choose a corresponding imperative wording for an improved change de=
scription.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc5#n94

Regards,
Markus
