Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D599022D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8604310E29F;
	Fri,  4 Oct 2024 11:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qun/wafA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43910E29F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 11:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiWZVby7Pfg7CVrCjxaZbOA9Go/BoTJuXzplkYuGnstWOXIINCOhhj1ilS8jirTmmSEifINSmeo2NLqynl6Run63A1f5HZpqbS51TIo8iLHXwngm2HCGZ0Wx0mURw+c4SAgpAbkkeOyp0TKB7mhSrs0AsxeJkp83C0HD1jNmOv721ttLy8QRg+JAd3WVe8rpvJynGFqKIFqG8J0ZIip/ZEeG1T3dffFnaA9Le3b9057YwGC45/AIKnudmBwKH+bTO+8MP83CWyxOn9dN7pl18XKw7vUE/k1AZAOn5FU/40kDRn6mFzcJ6nzsF4X6+BRqpR84ga1sCtEaJs5wX993iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kukQn1o1n6Yw1Kkx/8gyHmyGW/aDx5fLv/QEV7H92ec=;
 b=j8RVpu911hqGGAR50cOEonwfOh9dGXeeHX1TI9W3mWnglBBbOI6Q2e+ubnAcHIKd4RlnYi7UloANNUTUfBPfq+2uvtbJA+8oUT6zTul8h1a7sMB69fVQvWs4I/J5fnusKG3vGZwn/cdzwru0pbhk+sp9vxJSM0OMZcwOISwuyF0ZpYEbjXHaWtzZCV68wbpBGZeFoEclmiJKYNqDIQy9is3T2EXDaab59QjgOoxt8Dt40h5oTJKpT/BN/Xy1wGnyMdswByUerZ3hJStSNPaMTdSpcemywnNgIAnbDth0YLL1b0HcK9omNyhHmg45b3KSYmGZYc0zgxWRJHLkujLq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kukQn1o1n6Yw1Kkx/8gyHmyGW/aDx5fLv/QEV7H92ec=;
 b=qun/wafAwnQa1J5EEciSGje8jUdd/uiFdC4hdUdYwMrdI87HCLd07Ys+uC6g6tJkjajZzymNby0FbJ1DUBDxfUIlex0bqzXmYJSOrLy8t3oR+CiFs6C71vo6n+Td/7lh/cnv/QIFMGoahf3tX6Zr0seC5wD3su7H8ARB71qKTnAmh9xRODj/ll6UpjnAhuJQRFyzBYUEjcFeK/EftxiNNJuqb1xjFcVvNbgHXrwKZVykMxL0rBmUUEZwkedlyDlxFmRwF1omhvwqg2PPWbusTlpJy9vrkMP12eXwcNHr5nDaqewO4fTgYHYFlmyDJzdDbGy/8RQLMgxzQoEbZ5vshw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 11:39:32 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 11:39:32 +0000
Date: Fri, 4 Oct 2024 14:39:29 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 06/10] drm/imx/dcss: Fix 64bit divisions
Message-ID: <vrggcmiszditljaqnzwld3qbqvbunswvu65zqsx66o6tfwt2gu@xpvtg7zwhzci>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003111851.10453-7-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 384cccfa-eaaa-4910-002b-08dce46936cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5eQevzdJr33vm8aBbxKYO5uKxLtkRyZy9/Ngl2koRRicUqBCFhA7TEB2y4?=
 =?iso-8859-1?Q?M/soR3mvF+zXCzyckgD/DADDMbWBm+kVbs7O8vVIYEu/K9HzD7uwDCe9eO?=
 =?iso-8859-1?Q?AadUkFVqJgQAtMcQEF5dzqVN75wXrEGA+vQODOW1C2aU7KcqghoD978JtN?=
 =?iso-8859-1?Q?gI63Sdy62IY0K9aiKrTPOl41FIxrdI+JMmPanIuati/YSji/AF1xpP56r2?=
 =?iso-8859-1?Q?O54lGCNyayEoI1xUdtT4IRt6UBCq+qBhqNyQ+fu6UEJHipLmDr6QEv3IWp?=
 =?iso-8859-1?Q?n2QxxM4JufEDZbhdNiefIx6JCfYLQMDVI1CNgKvPQQG75KwmR5nOjVVo0N?=
 =?iso-8859-1?Q?F/fScBX294W7+K0I+1x2J0EBBv5tia5ja4c8WlxhYXXiIFjN/tyiq+sKTE?=
 =?iso-8859-1?Q?tOGcbqORmcpVFaPvIpY1izYYzQqy9KfJoRUf6alDcp8D12lRgblcHod9Kv?=
 =?iso-8859-1?Q?Vx7TrlG6D9KqnbDH0GhrmKYRY6rFxIXDQxJZTxgk43OQ5cUnb7d4Rxev+Z?=
 =?iso-8859-1?Q?7nwN5Fxkg86PUQnGAMu0Wfs23HZkHt7Xo8EHZAlQemD4dY6vk3YKsVVMIP?=
 =?iso-8859-1?Q?Gp7iZq9RuiaTo070AcrxtZJUJV5zL/xBkwOaQ1F92aE94pz2/XIzu0UMpL?=
 =?iso-8859-1?Q?9xuDI4unf7CAY2hQW3HczaKN7ehljpX6gwR+B0KeRIzZp53SpauiqW0X1i?=
 =?iso-8859-1?Q?Oq4WMRdQGuRYy6JF9iZPv5YFjpDKgeB3M92i6VJJXwdN7Z/ngqJW87bp7L?=
 =?iso-8859-1?Q?kIZ/UFftKtJVkvfACdX491jUNbjeZoqSx5WjrlORgoSe0majou+Py5J9+H?=
 =?iso-8859-1?Q?EuhstCsVQZFyWkV+MeKZ2NnfVEoePLip9DZdL6GH1ZOG7GSULUTqAekz0M?=
 =?iso-8859-1?Q?UWzLPsxoU07lZ9/lagyrUnrKyvVLq6WTz2DOQnf/wgbIlvU47LXgXZ7vEP?=
 =?iso-8859-1?Q?slweDvi6W7LfOodIoTTRgDp2R7LFE4xp+l/ctxdHvCwocX9YL/a5KPalBi?=
 =?iso-8859-1?Q?oSKr8qh6IB4Ss+hFr5QU1yksP/alxo4orkmEtg9AeVikuxBWskskyYj+gd?=
 =?iso-8859-1?Q?KtGBi+L25zKM8YgzFV+6hgJdcyhpNz/Tm8fuFiqUO78FpkKWjnItiLWjJ7?=
 =?iso-8859-1?Q?ZFWYw2LrP2QBGICD5t6ovSOoQ8OV7nqa548xOFCmA+JwrN+m9xXIdmvyL3?=
 =?iso-8859-1?Q?JXOsTL97mikdCoQjSMEKSwY2BqMaftEad8WitGEsvRKWAUit0R9zy63/7I?=
 =?iso-8859-1?Q?8MEKfC1ssdNrrCrravqb7DZX8w2X/dTFbA727BfDFP+gKz6vmEd3IHTdhi?=
 =?iso-8859-1?Q?CtyeztoIpyq9gRDFCOEk448kwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0IAqS5Z+sL+bKWUxTsgy7CVzQuWjfdWdHPuEOA7Z/SRFj+gAfsyOv6QyYB?=
 =?iso-8859-1?Q?5b4KsxKde0fRW0amfJCsJ9KjUyRLNZclUYTOS8WUzWRK/+EBx4UaXd6M8p?=
 =?iso-8859-1?Q?Xukj7yb0hlLEQB5qiWFEOvmL6ZvSupuGEurg3xtzUfhlnsyyuufgSbIrr/?=
 =?iso-8859-1?Q?NEdy0rtmlaMT+w4eFVKEJ9Sc6RP1+xMIkvUIpu2hH4sBoFqMatrxZZiq+n?=
 =?iso-8859-1?Q?F8RBjEyey8L1asK9rdnkeL7MD4iq/bdP5BQ4IB/d8bKU0vQTK5qnFQT4Fc?=
 =?iso-8859-1?Q?cXCVbCFFnZ4+A85M34FJypWK77HPJo8IbXvs2gdbJd8oMW5FDzjVu/lv1V?=
 =?iso-8859-1?Q?DACcFjMHTKAQaRUXdVVAAKr8y5Ag4dM7nv65n8WhC2pkNr7JkTe3AO0DOq?=
 =?iso-8859-1?Q?5zCNwUDmApYQtPTOOuEtalkqbMcA6i7iYI+5lz/2KtxUQ+qYdfk919L6JO?=
 =?iso-8859-1?Q?WcnB6kD6U0YowG9Ud5hm94aToAZy/MmtL64f3hYSR3RjtBztv2F9nmXEDe?=
 =?iso-8859-1?Q?fWrdSyYfQ2H0nIyqNxZn/72LMQfwqxWmgDpkXc/PH8FkaFcYS8p8IDFIS0?=
 =?iso-8859-1?Q?Z92VJjA+IC2HcjAbCPWKXqRQKgqNLy6mU5clzNpI0KGHSQ2soemM71wAZc?=
 =?iso-8859-1?Q?/EF6yWOt8t9iVXykDRsNkCiVZJRDw30gN8cQTG4FiA2AlAm6ui/mEsaBBC?=
 =?iso-8859-1?Q?yMuK0T0fqPHfk1PAKEhUJTl6WwKmYsgkk9uPdz3W5Ts3XOOG1MfNMTchM3?=
 =?iso-8859-1?Q?GHvqH3VW9Ac+/qhhihA4GdAj7LDvb3VdKA0SgJWPnZ6BzFKGHATM/+IUTE?=
 =?iso-8859-1?Q?wbK8qW33ccrhq5e15ZEsY8NQVwEpHHSgmwYz3JxFg5ZG7aDo7qM/DNfPBZ?=
 =?iso-8859-1?Q?EKKsERfqzO5NjTZNeshTg1s79qF7o4Vv5OaSMPo/cWylZf8lSafTg8HZuJ?=
 =?iso-8859-1?Q?gKDHBiB/Vgwl/9ZW91HeV5ZDNTvLXKf1xw4KXyrcQ1g60F82Qu8/k1LWVE?=
 =?iso-8859-1?Q?ND25nCMGkrlJVicnL66dYa8tceQb4a/oqZ44ElJvfhnt/vojLHmM6SdePu?=
 =?iso-8859-1?Q?vEY0DiXDlLP+rogliTAK9V7GkIUL7YbTSJwaH8VW6HSj2iF5PyKDJvh28r?=
 =?iso-8859-1?Q?kfFNlQnplQyq7gAna8lSbBksV8ftFfBzRO7GHw/exQjF3tB9HN5fNLoe6b?=
 =?iso-8859-1?Q?bNFLBpQMilW3niR2O1KNIyY5Jhcpf0Zj0uJLUkr18Pahc1sqXW72IjK1aQ?=
 =?iso-8859-1?Q?PHR0hm6K3F+pN3IsdrmbUB2bHFeKEqWWYPYJrZ+FJndO6vn6mSkXqE9w7r?=
 =?iso-8859-1?Q?uEIzH+gsS6Wai2pdSBRiEFUOzhp3/cgC9Ssw4ZbSDgYnQIG/bnuq0TshS9?=
 =?iso-8859-1?Q?myehtAEjAIzdxa8eAV3K2TvqVAolAbDd9lJObgaBotrtAcktASoLraMxJG?=
 =?iso-8859-1?Q?6HsDTMumEO4z2rXDifKbB06nbHMhQOlOJIBWpalHwKZXpOpiooSRMZOYVv?=
 =?iso-8859-1?Q?A5YWa6qxxeN/rPahcpXuLXZOcUtwtiVXzJtqzvlRDqFzWk6BXMNZvXud3V?=
 =?iso-8859-1?Q?GQS0QryPiTyELaQ0iRFr826WEV3mMapMBrAzEczXWz8lxzk0rRJhVIGY3c?=
 =?iso-8859-1?Q?v4ALQ87qmfNbiwP+zYH2Frejcq43oPmDeFM/OiQnqZfzA/UuUFyIr8cA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384cccfa-eaaa-4910-002b-08dce46936cd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 11:39:32.4668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENZIvREjzXC6U+E5ZfixiTx/jbT8fO5o8hdV1Vo26XBwAeD9xP3abud++EbY/8TqhtqtTQ0fGsbydpA5iLp/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655
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

Hi,

On Thu, Oct 03, 2024 at 02:18:47PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use the appropriate 64bit division helpers to make the code
> build on 32bit architectures.
> 
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> index 825728c356ff..32c3f46b21da 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> @@ -136,7 +136,7 @@ static int div_q(int A, int B)
>  	else
>  		temp -= B / 2;
>  
> -	result = (int)(temp / B);
> +	result = div_s64(temp, B);
>  	return result;
>  }
>  
> @@ -239,7 +239,7 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
>  			ll_temp = coef[phase][i];
>  			ll_temp <<= PSC_COEFF_PRECISION;
>  			ll_temp += sum >> 1;
> -			ll_temp /= sum;
> +			ll_temp = div_s64(ll_temp, sum);
>  			coef[phase][i] = (int)ll_temp;
>  		}
>  	}
> -- 
> 2.45.2
> 
