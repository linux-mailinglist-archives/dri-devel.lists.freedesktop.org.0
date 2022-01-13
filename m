Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EA48D45F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480610E253;
	Thu, 13 Jan 2022 09:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A44D10E6DD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:37:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S200016899;
 Thu, 13 Jan 2022 10:37:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Jr0kWY9uB9p4RjnCqgSrRBVIiTgElsIdkCEOg8QxsTA=;
 b=MtKA6cVOr3qfrzr6C1hmoORVpQHAkWONsiJ3xuq331e7FKLP/ccg9L/B2gf26rx8ICYS
 0U83ZDNDblU6skCyt8lOzkH/iC5I4jo3vEP3IKqa4uP5Z/O8oEL/4p03CKLJTzC5RksO
 mSwPTJHDsfsi0tOQ+FCchZeUZAbx1nnc5oax9Fadr93Xhv9Sn5VWTNmBZIdmQrTaxLOb
 LGYRG+AN8KXSfFkuVE37Wv53zX0Xrahwp8nm4DoAyKgy3jBOWMpo6k3KXaIgclrQaxZn
 najDeBfglhcv93hOfSmwt8gICZyN84RXWtaobVmt2VCB85Ohg7I59O60rWFF+i3vLGHD iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkkretb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 10:37:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FF6E100034;
 Thu, 13 Jan 2022 10:37:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5992020BA00;
 Thu, 13 Jan 2022 10:37:29 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 10:37:28 +0100
Subject: Re: [PATCH 1/5] drm/stm: ltdc: switch to regmap
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214738.19946-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <87cd3111-75bd-e66c-5ba8-af3ff76bedad@foss.st.com>
Date: Thu, 13 Jan 2022 10:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214738.19946-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-11_01,2021-12-02_01
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
> Replace the legacy register access by regmap API.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 138 ++++++++++++++++++-------------------
>  drivers/gpu/drm/stm/ltdc.h |   1 +
>  2 files changed, 68 insertions(+), 71 deletions(-)


Hello Yannick,

Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Tested-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks for the patch,

Raphaël

