Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B96930FE0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513A10E2F2;
	Mon, 15 Jul 2024 08:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="SagcaH2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9934B10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:34:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F7qhhC029356;
 Mon, 15 Jul 2024 10:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JW1v9I2QQq6tb8htzQlK+uUAsMhkhshbWkdi6NH34IU=; b=SagcaH2C4xzMgF4c
 c+Ga/kBrOnnKUsu2zRE7GEw8U5aWpvcVCLf9wq356oesQ+SNw/88kxPaD2ApXpnp
 TRfutITol0CmXQp+n63b4/IYUXT9vHrcfESb/TYdkBR4cp3rBrD/ZBZ1dms0OpdP
 x7YoEi3JrrQnlf9TgPORH8JpT07O5PSZMZ74QOAc3UnSKN/ahTkFJk7U/biHSDBN
 /Vn+XKXVr29RoKPsMdNJsdZkql3Up6hd/ciM0zSNI9Y91mSsF58y4sb2HxcPYdxa
 cuQNy8JyBXoGkWVvTUfAIyN2n3VjUOdb6iuiwOeH880mS3AHOQngboI7Wu4+J//q
 mbcvGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40bgwx5sj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2024 10:34:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B799940045;
 Mon, 15 Jul 2024 10:34:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447DE20E037;
 Mon, 15 Jul 2024 10:33:57 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Jul
 2024 10:33:54 +0200
Message-ID: <ddc81a62-08d5-4f23-b86c-10754fb3e717@foss.st.com>
Date: Mon, 15 Jul 2024 10:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: ltdc: check memory returned by devm_kzalloc()
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 <yannick.fertre@foss.st.com>, <philippe.cornu@foss.st.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230531072854.142629-1-claudiu.beznea@microchip.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230531072854.142629-1-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
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


On 5/31/23 09:28, Claudiu Beznea wrote:
> devm_kzalloc() can fail and return NULL pointer. Check its return status.
> Identified with Coccinelle (kmerr.cocci script).
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>
> Hi,
>
> This has been addressed using kmerr.cocci script proposed for update
> at [1].
>
> Thank you,
> Claudiu Beznea
>
> [1] https://lore.kernel.org/all/20230530074044.1603426-1-claudiu.beznea@microchip.com/
>
Hi Claudiu,

After some delay: applied on drm-misc-next.

Thank,
Raphaël

