Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50B356C40
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF696E0DF;
	Wed,  7 Apr 2021 12:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755EE6E8F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfwhWOjH60jLi6YwDH7ao7/dOe5VsLA3xyo8l6IhESqWmeFzKa/oxgaV9q+LuCdg14NE5AsSgjSMZu7dhnFKgGbqmgo/+X5KFbgREaUrEWZr05/r9a4ndnL984ASRoNbPgjMzjxxFKwHkaxRAV4fE2z+oZKyVoviHsm4oM8U/l4ADQ+klndMFBLsR4ltdOosUAdsSxD4P362rxKTwwiufD8H0mWUqg3Q+S43rfUtBjbg845X1SMlWsKLgCIzls30XOtZspn7BL7gJrGPaz6ENqzAVcbjQBdZZiaXZhm3X0glrWjiGX2484oaJE8SlHcu18xKfjUnjmtFZECseXqMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlQJij6kfnTgcCvoPJS1PyAamr8Vps8thQILr9sZcTo=;
 b=Pnvv2r0cqK5qqHd6CxxwK6JJexhFf3q6BxUjJ20UyHDNQpQTRb5t8zXxPFO13PCPFF7QkQ0PoDmhCPlLQV/AUSxXkOFqPekhKbgAt/5O+04e5ERfxLZOwxeV80btpfCszofh/ULIfXFkvry+8TiT+bMR3p2VsEl+T1W52zDMOluRLXIVPGtsaADyiSEAmYXX4rbvaXGYiw8sCxp1xBuB+Tk7TupjdcvJY5jCd64Lkz6ZGEz1pNls1m7l1stJ1cnx6SbVYrSQ2sz/uJjzBI7CrZz/XPm6zfi/LXdpX7nk79GwPNW5oOqBVOamTLlF6zrGbueOjL9v04KEjCH/cpm6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlQJij6kfnTgcCvoPJS1PyAamr8Vps8thQILr9sZcTo=;
 b=GqRNGWL7qZgtVHxJCOuipQAZUsTIbtPskwFChaKdWXvQGTlMPEzeEyOTqQiOoU5Kvrvt4vYXNHfLYzki/TP+yHwawj4jJeyvuA4qU7iouD9gR59s2LxJ1zLOTPgYi1FTuqVDyFrH7AYP1WMasb9shWUg2iux7EwXKNSWdWvMZoI=
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by BYAPR02MB4501.namprd02.prod.outlook.com (2603:10b6:a03:5c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 7 Apr
 2021 10:17:53 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::bf) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 10:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=xilinx.com; 
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 10:17:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 03:17:52 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 7 Apr 2021 03:17:52 -0700
Envelope-to: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@linux.ie,
 laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com
Received: from [172.30.17.109] (port=57188)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1lU5Fw-0005YJ-KL; Wed, 07 Apr 2021 03:17:52 -0700
Subject: Re: [PATCH] drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()
To: Dan Carpenter <dan.carpenter@oracle.com>, Hyun Kwon <hyun.kwon@xilinx.com>
References: <YGLwCBMotnrKZu6P@mwanda>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <abae16c0-6d76-f78f-133c-0a0d54bc60a9@xilinx.com>
Date: Wed, 7 Apr 2021 12:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGLwCBMotnrKZu6P@mwanda>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38e29c5a-94ef-4d94-6f96-08d8f9ae67db
X-MS-TrafficTypeDiagnostic: BYAPR02MB4501:
X-Microsoft-Antispam-PRVS: <BYAPR02MB45012477A6B5655239A5036BC6759@BYAPR02MB4501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uRqJO6uZ4k/bjU0DFM0Eb7pFhGU/I46D7F6v0mjrN0JT7HzLCTWH/jXA7M+lhf2lBT3fC1RiT6UNem0N50tN3yAXIZg+9rlwVV/ipiuoKSi3Cc7YM7xBq81P8G7fRmjwXv3QcP7OfbO+j9vzi7IkrR607LEkivQ1VgptIaqTSvy+SVZWZKq2mI0lGw0aMZzakC7Ry8vyI4CWSvzTKN2+kUB+tnREpxLspS1aet+gg0Us1j8spYew+Lr/KgbNUKlXlr6AzNkjGrv0dSGIzheMvjyDlzdgYedMfAsRttzsFwiwWkIvu2t/Y97UQ47w2z9BT/aBlMZr4hUmSzLbeLpnUMm+hV8GfdUXwToY8lfWC3S2y1X68PN2XBSbPJfY1vSRis+chcYYK/43Mxn5y60dNT9wwdJJTtJPt0qHUH7IpJnRjeWgQylJn0ZX34L0nDAXihGmXhHFj0pwB9AVP19X0w+hpvJG0KqOb6pmLDPxth4nEBkGIV80gfbfQrropTMKV5IgUXxY8XzhOxQvK3CtgJ7lG6xw89F30+tPLio2VdE+6YGabCjRjqAX3GhFbpWWN+Ev4DxedSqgh8hyEuIJHAEmR4tyWuAIY+a2KjQpsFxUb4psU3NeBZHnt26d+BFXsHloUyjHwVabic2PGM1w3YodLqfy8QMr3Sh03KIgj0IFT1oi3b4elRPcFq5S6OyuyaYDW2Q/zjE0X3+hTf0tgg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(36840700001)(46966006)(70206006)(8936002)(8676002)(70586007)(9786002)(54906003)(47076005)(82740400003)(356005)(7636003)(110136005)(83380400001)(36756003)(316002)(31686004)(36906005)(53546011)(31696002)(26005)(186003)(6666004)(82310400003)(426003)(36860700001)(478600001)(44832011)(6636002)(2906002)(5660300002)(336012)(2616005)(4326008)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:17:53.4085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e29c5a-94ef-4d94-6f96-08d8f9ae67db
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4501
X-Mailman-Approved-At: Wed, 07 Apr 2021 12:38:30 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/30/21 11:31 AM, Dan Carpenter wrote:
> The dp->train_set[] for this driver is only two characters, not four so
> this memsets too much.  Fortunately, this ends up corrupting a struct
> hole and not anything important.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 99158ee67d02..59d1fb017da0 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -866,7 +866,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
>  		return ret;
>  
>  	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
> -	memset(dp->train_set, 0, 4);
> +	memset(dp->train_set, 0, sizeof(dp->train_set));
>  	ret = zynqmp_dp_link_train_cr(dp);
>  	if (ret)
>  		return ret;
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
