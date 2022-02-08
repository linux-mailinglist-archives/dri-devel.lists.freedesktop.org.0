Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED74AD406
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFF410E131;
	Tue,  8 Feb 2022 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4710E131
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:52:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187FPYI029207;
 Tue, 8 Feb 2022 09:52:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v3Nw6M+6Dsi+fs1JPP1dSSIm9lpFQHB7g75gslpbKeY=;
 b=Mgq5P9NB3nwoHZdVJ6tMjysBImyErUzr19msvPqqz/FQ5su4diuk4I96fqnfOhnwlDhv
 lB7cKCACz3Sc6atiQ8xnt6n52YdWoAJh2M+QrQqiCwt9NoCNku+bZwbyjSulSmTUWgxR
 i1KICRpFL5346yegj5hlh6oEk9gNN2NWdxRAETo4tqc+QUE0ejJARTpaCkMkNGlgqGNM
 49v0iGD21x+9DC1dQ9KuskABfbYRzmuWZUmR37xtkwCz4/u/9P0VldiHLtEXU/htZ3Q1
 WnZ4MJliElInn3GE4UIJge/z8id89T9piEoLjrMVCEJkxSREAs1fUx/VSKF7cXwDFMT+ xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e3kyhgmje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:52:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7C1A10002A;
 Tue,  8 Feb 2022 09:52:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A885E211F3D;
 Tue,  8 Feb 2022 09:52:33 +0100 (CET)
Received: from [10.129.7.145] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 8 Feb
 2022 09:52:33 +0100
Message-ID: <4f666fe5-080e-6c82-5bef-c0b52cb57207@foss.st.com>
Date: Tue, 8 Feb 2022 09:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
References: <20220207165304.1046867-1-nathan@kernel.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Nathan,


On 2/7/22 17:53, Nathan Chancellor wrote:
> Clang warns:
>
>   drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>           val |= LxPCR_YCEN;
>           ^~~
>   drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>           u32 val;
>                  ^
>                   = 0
>   1 warning generated.
>
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)


Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Thanks,

Raphaël

