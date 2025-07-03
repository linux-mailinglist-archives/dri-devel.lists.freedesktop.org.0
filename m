Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0106AF6E80
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 11:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F7310E0C4;
	Thu,  3 Jul 2025 09:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="plTe8ttn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0210E0C4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 09:23:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637OLbU018922;
 Thu, 3 Jul 2025 11:23:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mi/np96huTpzemlSEPT47ivnNTAhi9p9kP4BY7V5Dek=; b=plTe8ttnU3beSTHr
 Oq7OU+9mH5o57+1TikvjDuCxgr+8f1FVkcIWT777l+P3VM4cp8lHkPxMN97FoDWN
 mumYZ3vLNIuCYKoKyPLLg76qriKwwVLUwkI+A46tjtUp5O59pbaHeI8N57ElxEpX
 8o9rkdDBtRsz+hx+jfaloob+i+rhesP5mWMdeIjjiiO9ZbOSBx3E3MuZaSeViRy2
 XD7kze4NlfLXeahkYLkR/+Qp4ZTN3lkkLIAwxgMdgfsXEMKqKx2n1vuFppXsIOaE
 rlkBHxVlTYS5w7dlwoSLudMlie04jdTbTfTfScCtCg3DGxNw6mZoEsdhE3I569ge
 vwrbuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmf6ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 11:23:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27B8440059;
 Thu,  3 Jul 2025 11:22:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92F68AF65C7;
 Thu,  3 Jul 2025 11:21:01 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 11:21:00 +0200
Message-ID: <313d1cc7-eff9-47c7-940f-4ef9e92bccd0@foss.st.com>
Date: Thu, 3 Jul 2025 11:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
To: Andi Shyti <andi.shyti@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, M'boumba Cedric Madianga
 <cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>, "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
 <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
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

Hi Andy,

On 7/2/25 19:15, Andi Shyti wrote:
> Hi Clement,
> 
> On Mon, Jun 30, 2025 at 02:55:15PM +0200, Clément Le Goffic wrote:
>> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.
> 
> same here, I don't understand anything... you could have written
> "do some coding" and it would have been the same :-)

Ok I'll try to be more precise here also.

Best regards,
Clément
