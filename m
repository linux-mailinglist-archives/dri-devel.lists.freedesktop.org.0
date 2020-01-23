Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BA146538
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 10:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5B6FB95;
	Thu, 23 Jan 2020 09:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jan 2020 09:58:16 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A76FB95
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 09:58:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9mC5Q013055; Thu, 23 Jan 2020 10:50:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VwFgZA3ENkr4wIyA31Obvdi/AAKtkni3+KY4rJlzHMs=;
 b=LVsT6ioG6OWPssN+/S4MezG3RsJ7evvEmpBY5yKBRmoyWM1WPp0X6TcfK9zov3b3S3lA
 SOLxChz8C4O/SGFFan4wZwx+LtdyBjvec4V1/j134J2UIDyK54ri6A+LuTJZ+xWQiTYM
 6R8sCHbiNbJHJjvc+kFtMKjyoY7w2TP0jwEfCT81TZA6Aq1R5OHUDz4akunIjVKu/xEO
 q5vO3vDpdZmRusqK9a/Evp81qCKpDEigTEBEpyCpqBt8o5nWLQHIzXr9AEkQIPH/Qey/
 8cgRFs/b7BFSZxPFlvirB6IHS6oHR0iVn3BxEmkjb+AnaIVOaLPrhu7YAhzq5gpjGguA ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1e9hdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:50:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E174C10002A;
 Thu, 23 Jan 2020 10:50:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFF1E210F62;
 Thu, 23 Jan 2020 10:50:15 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 10:50:15 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:50:15 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: ltdc: check crtc state before enabling LIE
Thread-Topic: [PATCH] drm/stm: ltdc: check crtc state before enabling LIE
Thread-Index: AQHV0EOHho8B9v26AUyqZ6ivXPGugqf387oA
Date: Thu, 23 Jan 2020 09:50:15 +0000
Message-ID: <f925ddf5-3265-638b-14b9-71b549b5a9ad@st.com>
References: <1579601650-7055-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579601650-7055-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <82F3CF1E33F8AD498EA79D13D2A5A156@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Yannick,
Thank you for your patch,

Acked-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)

On 1/21/20 11:14 AM, Yannick Fertre wrote:
> Following investigations of a hardware bug, the LIE interrupt
> can occur while the display controller is not activated.
> LIE interrupt (vblank) don't have to be set if the CRTC is not
> enabled.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index c2815e8..ea654c7 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -648,9 +648,14 @@ static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
>   static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> +	struct drm_crtc_state *state = crtc->state;
>   
>   	DRM_DEBUG_DRIVER("\n");
> -	reg_set(ldev->regs, LTDC_IER, IER_LIE);
> +
> +	if (state->enable)
> +		reg_set(ldev->regs, LTDC_IER, IER_LIE);
> +	else
> +		return -EPERM;
>   
>   	return 0;
>   }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
