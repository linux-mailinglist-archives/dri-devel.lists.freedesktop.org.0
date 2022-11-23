Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF9635240
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6E010E50C;
	Wed, 23 Nov 2022 08:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2300 seconds by postgrey-1.36 at gabe;
 Wed, 23 Nov 2022 07:18:42 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544F10E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 07:18:42 +0000 (UTC)
Received: from pps.filterd (m0047963.ppops.net [127.0.0.1])
 by m0047963.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 2AN67Amg031405
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 01:40:22 -0500
Date: Wed, 23 Nov 2022 08:40:17 +0200
From: Ian Ray <ian.ray@ge.com>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH v2] drm/bridge: megachips: Fix error handling in
 i2c_register_driver()
Message-ID: <20221123064017.GA4408@zoo6.em.health.ge.com>
References: <20221108091226.114524-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108091226.114524-1-yuancan@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ie5pOnMtShkKnJSR_VQ-PmOsw8tt3RIq
X-Proofpoint-GUID: ie5pOnMtShkKnJSR_VQ-PmOsw8tt3RIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211230049
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:21:41 +0000
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
Cc: neil.armstrong@linaro.org, architt@codeaurora.org, jernej.skrabec@gmail.com,
 martyn.welch@collabora.co.uk, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 peter.senna@gmail.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 martin.donnelly@ge.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 09:12:26AM +0000, Yuan Can wrote:
> 
> A problem about insmod megachips-stdpxxxx-ge-b850v3-fw.ko failed is
> triggered with the following log given:
> 
> [ 4497.981497] Error: Driver 'stdp4028-ge-b850v3-fw' is already registered, aborting...
> insmod: ERROR: could not insert module megachips-stdpxxxx-ge-b850v3-fw.ko: Device or resource busy
> 
> The reason is that stdpxxxx_ge_b850v3_init() returns i2c_add_driver()
> directly without checking its return value, if i2c_add_driver() failed,
> it returns without calling i2c_del_driver() on the previous i2c driver,
> resulting the megachips-stdpxxxx-ge-b850v3-fw can never be installed
> later.
> A simple call graph is shown as below:
> 
>  stdpxxxx_ge_b850v3_init()
>    i2c_add_driver(&stdp4028_ge_b850v3_fw_driver)
>    i2c_add_driver(&stdp2690_ge_b850v3_fw_driver)
>      i2c_register_driver()
>        driver_register()
>          bus_add_driver()
>            priv = kzalloc(...) # OOM happened
>    # return without delete stdp4028_ge_b850v3_fw_driver
> 
> Fix by calling i2c_del_driver() on stdp4028_ge_b850v3_fw_driver when
> i2c_add_driver() returns error.
> 

Thank you!

> Fixes: fcfa0ddc18ed ("drm/bridge: Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Tested-by: Ian Ray <ian.ray@ge.com>

> ---
> Changes in v2:
> - Add Andrzej's Reviewed-by
> - Change to the new error return style suggested by Andrzej
> 
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 97359f807bfc..cbfa05a6767b 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -440,7 +440,11 @@ static int __init stdpxxxx_ge_b850v3_init(void)
>  	if (ret)
>  		return ret;
>  
> -	return i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> +	ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> +	if (ret)
> +		i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
> +
> +	return ret;
>  }
>  module_init(stdpxxxx_ge_b850v3_init);
>  
> -- 
> 2.17.1
> 
