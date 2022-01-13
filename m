Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F448D531
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927731123C4;
	Thu, 13 Jan 2022 09:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319A41123C1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:57:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D7k9qV024293;
 Thu, 13 Jan 2022 10:57:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yHEJ9y2I9Ge5c7kYI6alfueclq+ZM0p0Ht8YLzDrn0M=;
 b=pLdBVar0Hw3Z/4fZL8Y1kSvbfC4vbNDiHuiefH3CI4XWhL37Wy3ncIT4A3UVEPdEMFU3
 mWIgk2vCjrkIe1lmTGXveeTeQpgrrwFWzG1VIz9Tolk0sKGDQj8Ugg3kYFJWhC174s/t
 rPFiRIDPcc45M9AeP6++cUMtquZVKhdMf+d6fpiE9bQe7L8Q1LX0/DeIQkfh5Fr50+DX
 Z4mlgy/YRDGJZZnOiLHQBQRNyHJxxxwcU3sEbFpsPA5pY+NjbfSqsjk4+8O3MjqnVA4k
 TzWuXJbOSrGR+K0Pjw9aN94bBtMxuPfL3tijt57z1piYLzyTEqfWB5CYaeduCYKb2vKS Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djfywrt4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 10:57:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6873810003A;
 Thu, 13 Jan 2022 10:57:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6137620C0F4;
 Thu, 13 Jan 2022 10:57:03 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 10:57:02 +0100
Subject: Re: [PATCH 2/5] drm/stm: ltdc: add YCbCr 422 output support
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214750.20105-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <71eb2c1d-e2d6-7c4a-e66d-3f43c296eac7@foss.st.com>
Date: Thu, 13 Jan 2022 10:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214750.20105-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-13_01,2021-12-02_01
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


On 12/15/21 10:47 PM, Yannick Fertre wrote:
> LTDC 40100 hw version supports the YCbCr 422 output,
> reducing the output pins from 24 to 16. This feature
> is useful for some external devices like HDMI bridges.
>
> Both ITU-R BT.601 & ITU-R BT.709 are supported.
>
> It is also possible to choose the chrominance order between
> * Cb is output first (Y0Cb, then Y1Cr, Y2Cb and so on).
> * Cr is output first (Y0Cr, then Y1Cb, Y2Cr and so on).
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 44 +++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/stm/ltdc.h |  1 +
>  2 files changed, 44 insertions(+), 1 deletion(-)


Hello Yannick,


Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks,

Raphaël

