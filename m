Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41F506224
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 04:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1777010E048;
	Tue, 19 Apr 2022 02:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463A10E048
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 02:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no381V2+rvEvax4YNAyr/XVteTwHzYPErIod9nBRAJ6PNW4qs/q1MDuFXBdEaC/nPxo6KGw0Xocz2xd7uS2WL+YIy6jcdpYXQpqVMKtE6ElHHdnXij0rsvFQFs9rZWrglrTecwZ8i/yLIcAQxSYP3YDs6f9yez1Y5/MTj7Tey6DLjw9pHUsZ87an4Gj7u45UBs/JFe8oVcyzFWbfJB9jDccm/DGLfdHr1FKl79x7Td0y4sm6dX0oZ2ETpYi2D1mzs4MVRICALrHo1hraJWkRExpOIuneYXTKOwIsDdHwXIkqMsWN1dn+LI6Kq4Gv6mSO8S8kBwttA8fbPf/jmT2uXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc+Zj0l90rxrWHuWqUCpymP5ydXp2rJHMH2DYeU2WBA=;
 b=IvFAIwOgS6DHpoM/03wxCAruNl1QObd6x4o1q1yws8xtKfhaUtzptGC/4WUuGtn2/pcyIKUa9S892kuoAsz0a8FMsIlDu5wV1aALYclHY2WAVWHe9WA+lTt8v9cK7Xc3yAa/38Bo+P5jfCYPsN6eqSbFU6h+VZ6mYbJyqwINXvnyBRxGq6szjqNDj9HnHNjvVj99HWU9k8TRcnO/3wFoDoKlXlMkpsryYROTbVRhUCWFJ9oNGhPF6r7VDJngorMT3Jr7pEF3L6pPswnzssvMAMWpywaNfJ0R823dLzbvNQIpk7vhIMwc0osug4FJWMGNf1ufBmP6Gon9olr/71DG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wc+Zj0l90rxrWHuWqUCpymP5ydXp2rJHMH2DYeU2WBA=;
 b=sjSwf8bjaBrA6M7xFijIzqhTUWuHo653OPWgwFey2wjI/adM7hzjNJp2LQllBEJRpMsAYnuGKso7SJum4yiqLJlXcUb+r0d8lFz3O0NlGJJ5aIOyzZe1h87PTfZLBJofGm9r5QpinQOg4dZHnbIjw5L+RnPkVOTk2ecxuOr4vns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SN6PR04MB5198.namprd04.prod.outlook.com (2603:10b6:805:f7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 02:29:41 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 02:29:41 +0000
Date: Tue, 19 Apr 2022 10:29:32 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Fill in empty ELD when no connector
Message-ID: <20220419022932.GA629745@anxtwsw-Precision-3640-Tower>
References: <20220414090003.1806535-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414090003.1806535-1-hsinyi@chromium.org>
X-ClientProxiedBy: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4e6d90-12f0-4818-ebc6-08da21ac752a
X-MS-TrafficTypeDiagnostic: SN6PR04MB5198:EE_
X-Microsoft-Antispam-PRVS: <SN6PR04MB51982E411430006216CA5454C7F29@SN6PR04MB5198.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ggcwma0IiwM6Kp3kqtGjjorV63cd2OR6MIaNU6HAyTLgQtvvYU2EtfjBWXwE3vIaK6u9zHFiuigmNDSSKSWe4rLo900FNgNrHNz9STxJ2DwrVqSwqanjMNO2rQpZBrqsgVQXBYl7y9Qy3qmbG1LNtc58FuIb/i/obn1FyKdhnRf/3cvlERgNLkjTrjXfZJ2w/CpzdxsjLBvzxiz0vodxewcxXFo4RhqytV9qiSIGxKJJZO/1ti+1slu2hnqyTOldmh3oyeJQlKughcZJV318vd/u8xshSypsGZ9IjkuDxDkBNGe1C6kh7alO0pHIap8JG1jqvBLWxFJfr7GuWP3CTksjtHb52BB6LeNjcmPL07SQiOwgy1txV5zK/diPHFLF4F+WaX90905VYYfspWS+AEqo9VjcA56l3ycmGZ3S12vST9isCZKIpQFHKcFD6n+M/buKiSpvULlInJKgvtiicv21eNJ1CiM+PN3qVtXqnW6RLAwLePkm+9qBUCm8ru2hpf2ebyeE52Of0dEOA+lTLLXKca84DDTevGJOHinFFC0iekZuu40jWIgDwgOZZzm9GLXUiHoo77ZNA0VxabU2K1SDevC7mFnVmnjknhqJHiedmschbR7l9LvA0R1X756VXA02Mlzp2EHAvjJSMY7pHDRr41td1WT+KYlY1fB9j9QCuqWvwnAVRzjpqcWmuWXGPpUCrrKGaK3hAQ1lJdCcjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33716001)(8676002)(4326008)(5660300002)(52116002)(9686003)(2906002)(26005)(38350700002)(86362001)(38100700002)(6512007)(6506007)(6666004)(55236004)(66946007)(66556008)(66476007)(508600001)(33656002)(1076003)(6916009)(83380400001)(316002)(186003)(54906003)(6486002)(8936002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exvY9+BnNtSciqfN2o06tsEa9KxCThbGfbOzYesGpvuOOf40LZ6IWZHM1YXy?=
 =?us-ascii?Q?Cv3MCIi6351F+mltHiyi92Kv83G9hHaj+xKgFSjNcdnZn1jKzcUWK8vMawzc?=
 =?us-ascii?Q?cXIZr4tg162wib0FpXBMpUVLnayqDi5CBGVW/iGJ7+8swzP1hhuHJ4YqgQVa?=
 =?us-ascii?Q?3HlrTe6teekGeUUssFPfZknRYbpasB+c3kQgVWbtZ8coqh5Nv8b0hPRbGccF?=
 =?us-ascii?Q?CV3B1sRVI9RjPUztKWT35IS3nMKFTsjB+o9X5PS97D8TQ4GYPRDSHZMno5AM?=
 =?us-ascii?Q?xT4DBCI3W/Lkj7SEM+zSJA/8Pvv80sUVdTfMPUzc1GkIMynMA5NqR0mQWFH5?=
 =?us-ascii?Q?Mo69Y1yFU5jEQIn4UBXKRya7bJ7IK2QavnuDs09+hXZYcqH6Rrp54jQ1qkeu?=
 =?us-ascii?Q?p0vN7mWphEGPF4qQqMuJ6FbxfLmWES2UQqpPSRaIFN0PgVAm3pTGMwYmVlvz?=
 =?us-ascii?Q?O9DRW3c/RoZc8fKLwZbz+5Ix1YeCpnIMgnpZloCKngl8shPQa+NuRJJmGDT4?=
 =?us-ascii?Q?41Hn2iy7lFD33qaXJXNjyNASQNNJMwuyBbnBmHQZl19JXcmaTYBy9Mdv4nXn?=
 =?us-ascii?Q?Ib8zLDcv9T0I32YU+AY2H6Qo6iKnEYq4y7Ibl22rtml8DvcKLuogiQsPhv0C?=
 =?us-ascii?Q?JyHexGo0+hua4Ma8A0PmODiBRuwyLsHNnOQNWdj0dKmK7PV1LJ1rkNYApQYL?=
 =?us-ascii?Q?hKXLS4csbrwH1rvZfr19DR1em49rbBAcskipJUrFmNwMzSj+ZXn0exbFGMDy?=
 =?us-ascii?Q?t7UQkkcRji/wZbY/FF40tJYd3AHn9QJyfq+p7JCP0zng1yqaJviNbFWxIndk?=
 =?us-ascii?Q?qZ0/n2tT6v19pXz5p53wg3z67xr719aYG2HtMEU2eYgAxaKbVH6o5/DYYZII?=
 =?us-ascii?Q?pUyaQ39mejHT3nEsBzL0nhlhrtDZqtL/mdO1d8rNDHYkQGuY9ABLbg1pEtt4?=
 =?us-ascii?Q?8B4xbc8wf7CVX0KQUtnGzgxWV0Rm7gfZBMkH2JwwuBXg3gb/8kEDzk2IeIML?=
 =?us-ascii?Q?idBwCG4Qlb1Kvcjb9iq4fem0XYXUlsOoUNmeRnTYQUlgpERT7gJUbyymKE0+?=
 =?us-ascii?Q?zUmPOBJeCeSRH7vbs/c2OY5QfxDK/oMF5nPR9K+tVYvgCNKJhxaVHEte7qnj?=
 =?us-ascii?Q?HwFpgzK2RUscAfbdKKyYNjBhiBbOMv9G2toAYm3qYIlwgMHT3rrYrUgrTrmO?=
 =?us-ascii?Q?HUGZn45f891BW1X+fwHuDH/f18iAp4Fk+vfLPjQcLza0BVru8564lbAZpMiI?=
 =?us-ascii?Q?dJ7A7v8zSASjHJaNpwFatx0pF10KB+0wROHfaTGWUv4e+H2oRJMPboHXb5bb?=
 =?us-ascii?Q?ngcnKElMFLmX+b/MGIYfPsbkMAuvH5Lr6Wk2fP1S78UI90Wpdlp6ZS6Inw/E?=
 =?us-ascii?Q?18VS9fb8HgwZhEf3Iqk60yxmjy9ecgqGRSf6otwH4ZX1UDGqzv8fE5HIOUu5?=
 =?us-ascii?Q?mvEwGfMevaPobJA1EjdL+zOQa8tlcFl61iR7CLGyuBL+eOa9QfOc7pvmIbCi?=
 =?us-ascii?Q?f7KHLAqQ0ZdTZT3YnMhq/eo0zHRrNRFQXE2jwnuc1oCIPMbwFeWpvT36mqEI?=
 =?us-ascii?Q?Hoqil0uVJMRpqIMir1JE+cpVFZexr4BrrkSa+Guz0zmnOZ9NwsT+D5CQi96X?=
 =?us-ascii?Q?3PAgbF3oisWx8EqCZqjBu80Ah9Yz+U1qyx6GHSR5MZKvJebi6KFTfEYPueKG?=
 =?us-ascii?Q?TkRBaBn2BV+vv7NsSlSd8BmXiWK3ROxkZ2Pg0ygN2IVpsPWSFdDl/nJN0nyd?=
 =?us-ascii?Q?AlEh3T3hYg=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4e6d90-12f0-4818-ebc6-08da21ac752a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 02:29:41.3934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62Yzxnnfr+NW2/uiQR/ExsC8a1RBhYxmtaE/E0GL2qiRyrYu+3Jy2MAqeulIfOmfeJK/UJVDlZgqqYFN8mO1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5198
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 05:00:04PM +0800, Hsin-Yi Wang wrote:
> Speaker may share I2S with DP and .get_eld callback will be called when
> speaker is playing. When HDMI wans't connected, the connector will be
> null. Instead of return an error, fill in empty ELD.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 6516f9570b86..f2bc30c98c77 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1932,14 +1932,14 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
>  	struct anx7625_data *ctx = dev_get_drvdata(dev);
>  
>  	if (!ctx->connector) {
> -		dev_err(dev, "connector not initial\n");
> -		return -EINVAL;
> +		/* Pass en empty ELD if connector not available */
> +		memset(buf, 0, len);
> +	} else {
> +		dev_dbg(dev, "audio copy eld\n");
> +		memcpy(buf, ctx->connector->eld,
> +		       min(sizeof(ctx->connector->eld), len));
>  	}
>  
> -	dev_dbg(dev, "audio copy eld\n");
> -	memcpy(buf, ctx->connector->eld,
> -	       min(sizeof(ctx->connector->eld), len));
> -
>  	return 0;
Hi Hsin-Yi, it's OK for me.
Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin
>  }
>  
> -- 
> 2.35.1.1178.g4f1659d476-goog
