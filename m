Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23E48D0F4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208E310EBCC;
	Thu, 13 Jan 2022 03:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2106.outbound.protection.outlook.com [40.107.212.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0E10EBC5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DItYRCNxIaw/RQDHLet5VdqsIL2XSaJz72/woyp0Ww2R08YuC7hngfvnzwHCJJetS3SHHFcF4CdfwuUUAlWHn//xUxQ/JHDVfGmOnWyKktqUzv6UaT59Xh7DuC0qrgF5TDLF8zL5XHFUWa6BGwCKtz2tHPXZhrVgVG+H05CKXm808xim6s9Ymz/D+6uRasApJSttqO4464DkJkcNl27B8vzazG8r4VVmAPjNinyJXzTW+r+xsVUGzQksCmOkDL6sDZV6LzmjQC3PoE5ExRMRxYEvrALBhR2GRZFqI7sc2ReKem8yp/rtBZNooJmCtjiVhpkAMW3wut/La97LbRuy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhxJeY6kK1OKO71nD7EKG4pg2Rs/rUW0TsF41KuUodQ=;
 b=LY3F+rl6vpGymytR8oGOSJhDKmaJyT5tScg1uDNwTjhimMD2W5DfVSzDLxWQ8rmPjfmf87NO9B375ZW+GNHG7Eh+JvPJCuqE5kcDkdY/qeoasCpjPjNcGvJpx9iW/Ehzsz64e9y22H8HSrttBPQz6XGianRd3C4sxt63dfLhVzlv9TK8qOn9YNC6yuJF0p/+BYwhoILAgkkDWU1mv404DU/aXTbjIlIglmACEv63I5MzXR8NoToLoKv0hsF3AkYb3YUxouZQMA9PWTv64wlLvdHOAonW9UVu8TU2miuWr0SV0mngbHMFLhLXRa9HoRp0DDqARhhvZ7klZRCW/rSH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhxJeY6kK1OKO71nD7EKG4pg2Rs/rUW0TsF41KuUodQ=;
 b=mwEIUPNLwThjP1mtDsfarDCShpzPPXehSTUMW5HxXakCr/HcafJYp8rpy2kRomPNuC8eyKUwqASkhclYtVt+0Ya08mnT/oxBhz/YxAODQe3cE8ekT6NAjtS0yaQxsyCoMgDsMWFJYFBkriXMSagne1k9ThhcdRmY12MrHFdPlUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from DM6PR04MB6748.namprd04.prod.outlook.com (2603:10b6:5:247::8) by
 DM6PR04MB5929.namprd04.prod.outlook.com (2603:10b6:5:170::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.7; Thu, 13 Jan 2022 03:30:41 +0000
Received: from DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9]) by DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 03:30:41 +0000
Date: Thu, 13 Jan 2022 11:30:33 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
Message-ID: <20220113033033.GA2478030@anxtwsw-Precision-3640-Tower>
References: <20220111112701.1064458-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111112701.1064458-1-hsinyi@chromium.org>
X-ClientProxiedBy: HK0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::28) To DM6PR04MB6748.namprd04.prod.outlook.com
 (2603:10b6:5:247::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7045058-d1d0-4476-f84b-08d9d64512e2
X-MS-TrafficTypeDiagnostic: DM6PR04MB5929:EE_
X-Microsoft-Antispam-PRVS: <DM6PR04MB59298612F62ABBF1566452EBC7539@DM6PR04MB5929.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3KWR9hFoat28PjLcLgX/0EM5L3MQ9WMpAO6GsDQ41BNR1ZDgHsiC80YoTr7n5DdwqtgipmkdEwjlyxppIVlOtbz46408SzqRxsKi9wATZPIG/u806EVxAZlsHG1+xwjkmaTedN2pHDgyD5cW/zZkCEIIgbbqwVLMVHDe8oWxq/ofsV/BHFlz6BDLymHiNGAJUT9K9ycZGilpOrol+JOJGabgbpRqidUSWCxA219e7h124WD7RUIBtB+LRxZVSx9i/Rm4z5ddUZ/+8nqRwCKB4ONz7d4ISolDhp0QGcFsGRyFbUQpGCUPW1yemkNJYGVmv2W1oNpMDJusSf6AgW2wXsYFfRzkkD4n5RQrOkCnivZu6jjL72YalApnbwwEdwi7huOE7wNMcei93RvHjcGOeUq1nbfG471YXgKoRL8Pa/zV6OoX/2z1sKCBFaZpCFkwxEnCPgQPOH640g5z2Hh7X1+iVYiyTrxfCxwEpFAi/jJczDVbkVz+2eIh5wzVnJmRDUkVkoWbDVwKpZpi7kGduTtOBik5bHHq6fTCtRrBjOZPYi03TwGylxr27w5H/IQ4w7EsJFiY8TpFA5SDIYumYpGIwi5+R1YWXNynex4LuWgseLnEmvTKO8BME4G8z9seEQgbzkekWbmQP5LSK+XWOsuDvVE1ajTN09eTfaiR5E1wgwng5SF463z08MHkMFxfriPGeF456XIGXBU/xF0DIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6748.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(508600001)(86362001)(83380400001)(6506007)(316002)(6666004)(1076003)(54906003)(66476007)(52116002)(66556008)(7416002)(6486002)(33716001)(8676002)(38350700002)(110136005)(8936002)(5660300002)(2906002)(66946007)(38100700002)(55236004)(26005)(186003)(9686003)(33656002)(4326008)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kDGMC9ftihudA+ZLNsAf/PTd7Es2/7DmVB5RQq45aqV5XVC/f4wbMXP5hTx5?=
 =?us-ascii?Q?X0+yavIWEIZVlEYznyFEStl0n8AxQWmIlwy/BhyCKPG1BrnqQwbz6+pUgSVo?=
 =?us-ascii?Q?/oeFvcWvjiIDCuC3DgRYzz44RlGQAzr8h84Ssixs4ioXU4ypEPipYCPv4SeN?=
 =?us-ascii?Q?aeRvS+JhJUQ9k3WyVyasbm0cUut/8Dayk0WkMFuLFXWP51x7KkEZ7V1fRkn7?=
 =?us-ascii?Q?s/i9sfqQUpCSRvGBYXlp3B9efFYKdbwuTj9G4eHppjHNW46ThAwV1IcFfoWO?=
 =?us-ascii?Q?450xNS8IizFUPSGQUGsIXY5uyB7tvIZ/t7U4kcjtmRtU5N+EJT5UUNLemmKY?=
 =?us-ascii?Q?X69lm3MvQbsb+fqzXLyum7RuumGlMw9FAvf6EFRHTfmzzEBNCVloP48kdUWR?=
 =?us-ascii?Q?O8p3B6EWuRLseJS8iBmajKo/wy4SdDyxVe7rukSet66OrclSJ37EgdZM1lg2?=
 =?us-ascii?Q?wP9WSL31MrFVbnIvkFSMTmJei+EOfEIFN2lhGmp6tqOZEbjoKRqHidA8Rh6Z?=
 =?us-ascii?Q?WQkWWAXYvy0BGkFoOVFbhSHNNPNZzrlxf12MH/ekn7lYU9B8jGdfkJ7DXSKG?=
 =?us-ascii?Q?TwpM0JNOPPEEru4zQc3aRKbz3UTM0SV9Ybzyv8LHmJloRJSCyjmWrhADCnVb?=
 =?us-ascii?Q?hMvMEtSgU6ycvYTVzYRyDM7UY6cDHnptXP0UeEeWoNCqawsjUDI9KmovtkF/?=
 =?us-ascii?Q?coeqRx4FhBb/+enDVR0WsbciIM8zTBM8lx4/TcYbyEPhmMX/svJy9lA3arO6?=
 =?us-ascii?Q?3DFjWpxLtEuFj/N9IxKCjBNN0VNX80Q4WV5ePbt2Dp+GGCNpHaNV8MqEVrPU?=
 =?us-ascii?Q?O9Y3mStkACwD+vPYPt8cAZW144qgbVGpCbw/im+IlJlfbhkmZ3BJCALWogvF?=
 =?us-ascii?Q?rIdl7SoG0f3KbnQR+BmH4O6p2qWFeOksVncAWwDDChhMYXRgNRSqRcxxpAEo?=
 =?us-ascii?Q?9o/uNhzk1E4ptdvevQl5DoYkORftvQS+ioMc9Sz719bW90X1amoQJfeIwTjC?=
 =?us-ascii?Q?DVH5t+IzyzziL29/sdxTfa8XXem2gSpN3kEvdsDCqP5NCzh2no68BtrubO8s?=
 =?us-ascii?Q?onNJPqd15kXg1F0/j6zFq9WUN5jnEkpHaIfjjpjSOGB833R46K+N5GqQfqra?=
 =?us-ascii?Q?nJ8zk7zcOwUsNOOGHet0J4/t4SoIrA58RmksJpmxCVR3tayPrJNNzjVWj8NK?=
 =?us-ascii?Q?BJW+rEMcxlSEeXF274YY6alzXi3vusK4Em45zAE5UKlKkniJooBdB779nIBO?=
 =?us-ascii?Q?r3OghJB0Ft6Rv/Aj9CLPSvuNZ61PX3aasHA+1SBYvX5G6ZehK426lYryVObD?=
 =?us-ascii?Q?hKmeR5TmExmsnMQIEjsdkXa1nQQQVN4Ayl8yXSJSYPH1CqTEJ31v6nQehJP0?=
 =?us-ascii?Q?UlFlUfBJHzlvIl75ISLslTePJw7WbXG5khdxYUDKW8+n1ToJpC4rh6z1Ulwr?=
 =?us-ascii?Q?dExnk85G5iegxN07RxBVuzA6KZQs8nAV6CMTI0X1wUW06yBYkJ14PMfWorMn?=
 =?us-ascii?Q?/uE5WyxiMDJvPe/wrbBzAZC0EG3DaS84Oa9I8fy/293SNUvTrewV7iwK6+2j?=
 =?us-ascii?Q?U8PX/UDVbtZhiXEI/KqI8MS3eFsu2xGwvioasTpaubvjcYTdhWzEg7TorKpQ?=
 =?us-ascii?Q?95yDz2SEmM3QmUful3hhLqk=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7045058-d1d0-4476-f84b-08d9d64512e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6748.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 03:30:40.9775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WloXKueyxLeSvemOdGAuzaq8ln+tphBa5raz9Bm6QQ7aa6nGkD6Q86k6dezrKqnmC0ztd/4U5PXQhvj+pvj7ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5929
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi, thanks for the patch!
Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin

On Tue, Jan 11, 2022 at 07:26:59PM +0800, Hsin-Yi Wang wrote:
> Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> handled by driver detach.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 0b858c78abe8b6..dbe708eb3bcf11 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>  
> -	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> +	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
>  	if (!platform) {
>  		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
>  		return -ENOMEM;
> @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (ret) {
>  		if (ret != -EPROBE_DEFER)
>  			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -		goto free_platform;
> +		return ret;
>  	}
>  
>  	platform->client = client;
> @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (!platform->hdcp_workqueue) {
>  		dev_err(dev, "fail to create work queue\n");
>  		ret = -ENOMEM;
> -		goto free_platform;
> +		return ret;
>  	}
>  
>  	platform->pdata.intp_irq = client->irq;
> @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (platform->hdcp_workqueue)
>  		destroy_workqueue(platform->hdcp_workqueue);
>  
> -free_platform:
> -	kfree(platform);
> -
>  	return ret;
>  }
>  
> -- 
> 2.34.1.575.g55b058a8bb-goog
