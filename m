Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE189BB43D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6810E3EF;
	Mon,  4 Nov 2024 12:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tqW7UsaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2045.outbound.protection.outlook.com [40.107.241.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9AA10E3E0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jS3pXBtKD6RqZMTv/ObS5toNgnVXtsu9EnjTts6Lt/oSAsGPVIHFlN2Hbs+UwGgvrGBFxE9+ADRLWEYONV+1swxemDeDY/aIc/MaUZ2nrUiNcTBbRpZPRtCZ6wKBX+xYvTi5XS7WhnIEcr1gOV+Dkrds3zbyxCoM92NJTkC5CB2xd6aMluOxCSZxdiv9yWwZQkoiEvg+ih9wR5vNGXJBVI2/tD6UFSwSznbt/2WchW9ZQE8aDMLdkG/yXfEaccqGAMMOPiBeBEprlEvJaUtI5yPtsBT8dtfdKuWTfV/F2wY+ttDkdxCpvpDNNwq0gNFAug1QJ42yUvyGoHbRPi+4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBoSFTFHbq+PPwnoQaPppvukuVM/x02WLtcD7n9GH1A=;
 b=FWiF8Tw0Y6nH5NV5hRm0RpJ91xhNar4AxNyvn3YSkl8+q53jLJ4ghrqyn/uja2BVeRvjky8BPlg/ErX3BfJiqstrUZt89DbyyFtMKljYqAv3YpMad1l2h57WYk5Ijh/q1Vj7vCGkwhUP1ZfdONv2xbXfVaZ1qjurWzWHx3vP0IIot7ea1qzZeW6PgApYm79qTvDzxxfU9ctX8e5nxJFEwqb57111lKGZqWh7E/7vm5Vy04RouzTj8yC4X2uqvipEw0172Uf1EAdXnWwxiyqgHyC0zu72k5XooMWzfYNWLnRVwnlrLZ/B+wG2490y4boruknfc6dTV7Z8FCe0VcsLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBoSFTFHbq+PPwnoQaPppvukuVM/x02WLtcD7n9GH1A=;
 b=tqW7UsaQ0NsWV1rLIIlZ2D47iNp1/Qa7fsIZFpBEbBc+j3IY67Y4URT1gyqGrNev2SJijvOERwptUL2Y7R2WPkMCrf1AqgshY3tNmp0E56fOpwlFTIpdFJnUBz++x0c5EBw8fKd+FTsuQsbeUTG799cP1i6+8GKgu7kPRo3bAPjbKWSM45/UYLUs1Q6JXzftaU5XBr/qOrBgvZMHRG0ZD8YUWOMq7hGzNAe6Afhmf4zoeQ8f+jk9JpjR6iNNv42IATsUlt4d/ZLYhA5hXv5Yz9F2AMNB6JykLsRxgDPUa4jOgraoSkMTT07iiRNKZTuvu8NRLG6Xx7FMwLRHXO7UqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AM7PR04MB7029.eurprd04.prod.outlook.com (2603:10a6:20b:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:10:59 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:10:59 +0000
Date: Mon, 4 Nov 2024 14:10:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Message-ID: <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
References: <20241028163527.2425783-1-arnd@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028163527.2425783-1-arnd@kernel.org>
X-ClientProxiedBy: AS4PR09CA0007.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::8) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AM7PR04MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fc6a74-d73d-4986-2c7a-08dcfcc9be55
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZbBm/yMoxZbW617hCPxsYl/O/VmwVVYtsuox5Qg+I09FmNpIHLCIoZtC2tt4?=
 =?us-ascii?Q?TWyWhKAiS42dKgPFe9jH02y3dLjtG0VFxmHPCsLt7Qs97GCzYZ97083zQ+vy?=
 =?us-ascii?Q?0gpBD8XZIgJkwEQrFMoC78pI4lGzUaISKTP/I9ksmJHvb/aEfsXnmK+kVNR8?=
 =?us-ascii?Q?x/mI4PxqrHBdLkV/3tXaSqMntkxXL7rZRsYSBJgaQLN5m20yLAtJmllU6rqW?=
 =?us-ascii?Q?XB++kyYK3qtVxZjta/Brv3Of8bATy0ma4p39+it03HRM5PHIX0IBSYBXpUYu?=
 =?us-ascii?Q?AhoecwiWfaJeLWZKrVAzwzWjaTBoaxj2p5nc3MYIB+kzqvk5oxGFH3xMFMFR?=
 =?us-ascii?Q?UgAc55QDOMQFu+WKE9Lh9OrHPXuNhY3hkaPoT7MnsOKEuQwh9SgzTBlvjRbi?=
 =?us-ascii?Q?M9CC2dCNkK8eEBuLN6DBNHedCKo241TQQMslcH0gA/LXlnhG9tp+g1+tYoao?=
 =?us-ascii?Q?gquU7HgWgzL6w1hAiCmjxfx1/zkv3kUmicw6Zfm/4ppVDLMs3xpx1EHZiKiQ?=
 =?us-ascii?Q?I2YgXLLW/4u6QpRvce9H0BPyjUCzuO9jOAfFzD22xhwcfoDPsUtxqtG9HnDV?=
 =?us-ascii?Q?NZtLkLi9uGB/nBSNGOhLoDr9dpkHwqQFP8Xf4vALZ/ri2jalNVTLhqmhC9WW?=
 =?us-ascii?Q?9vOn+GRTHtFe/zBtodtW7E4iltz8bBvNSN7zNPa7Pg0jHnMonnSONBX2319T?=
 =?us-ascii?Q?+mhjIzEjUGY9gKv3AwIBAMtyz8C7Ct1HaAkxLZZhA4NaFellBFcS5HuRU/9W?=
 =?us-ascii?Q?V889Nza53dQcwifuRhhavncLYjxd1h6ZOoAObEeNRybXuab1gnqmJLAbyDOF?=
 =?us-ascii?Q?ptBL3cwbc447V4NS5B4Lwl1r/8DAE8McTzMoY0Hr9en3gv/aT3jMwZx5UUax?=
 =?us-ascii?Q?/dukOQEaOD59EpBT2TXn348o5S68loylWAHr0zmYwaRSH2XfKpZA2S6QAIw7?=
 =?us-ascii?Q?azc8PXncPaHvXghQCYtlbp6U85CgSKNNAvpEp2eADci9IH+TvqFJ/C146x/3?=
 =?us-ascii?Q?NKVMRfcL4Z4AzVlL+wlG2avkswQCU4UEP8oJNUVyyqOoKEXVWUTJHkGrol22?=
 =?us-ascii?Q?WUcceFEgsQlFAx1wyGznLHq3ubSswlwnW2JzgcvsgMVpEc5i7B4rgW5YOBLn?=
 =?us-ascii?Q?0D8GXArJu05JQEEEuPSO05uiA2HElRCBb2Fh9GQFQtsSKuw0MezPsJwon1OA?=
 =?us-ascii?Q?UCamuxRdTL4EF0w49IQQ+a99DpfHniPv+xEVZ7k0uZfSfADPcYsOk1tfN2Gi?=
 =?us-ascii?Q?UKjnYIRp8YnY9YX87AfhTONixPzRVN+OFDhQ/XoYxtUT24fr5mZCn6/LLU2a?=
 =?us-ascii?Q?OnWnVvharJB82mSLs5yGs9f2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jjKNkcTRLnXTF/dC31WrImMur7KEB/yNJ8x9sPma42RecmVNwoR1DcFHY3GP?=
 =?us-ascii?Q?UPRo8lmyFDiDzqSF8jazUK4SiE2tVOtB27vIRiKUCcRurwZVIx3ngWLGii5o?=
 =?us-ascii?Q?iq+UiAX46e5D7rcMPp5H1a0Q/77pzVzYrSg26usGFCS7qz/VqtVZrrzCoKIh?=
 =?us-ascii?Q?bJRRqBy9Gg2ZnvS+J9qRMOO7T+QklHnA2tmbypGDW0ugZSwr1Ux1R1iuUps3?=
 =?us-ascii?Q?3PxsvmCgxHrR5ICm7DBAXSfI6JtseT0DvSW+iJufeUV1aVVmxvJxlHv3xH47?=
 =?us-ascii?Q?KGBgOjNXFovnBrFAEwdqo9Dgog884mit+cSlQMBofGmukB+c4nnbmzglfM7X?=
 =?us-ascii?Q?YKqIlwQNDhnrHWLpd3+RW6eV86PtGBytMRQ7lEc20fDG/eGauDzAz6cCE3/a?=
 =?us-ascii?Q?tTI7ib4VedoCdDiWjGtbsa5LowYnp/MPJUAXRbeWWv7jt59v/rnuzdue+5kj?=
 =?us-ascii?Q?YZ4cpkNiXHrmsBx4BONvZQ7ac+4EysimWssKat6ad3kZigMBqP09v5KAvZwM?=
 =?us-ascii?Q?Vo523G5LDK2WqBuyWfVTE6p4Ul7i2hx62/boagyJxbpAxKr+aGtcQbUWlBZi?=
 =?us-ascii?Q?X6+F6XR1APMuu4aLjTNUVxfDaSATO872fm0tW5DS4hkp3s50Ln/3ylxiZzTC?=
 =?us-ascii?Q?YtDvdRX12/ewI0yrceXJa0qqxXvxC65gM3lFgl6cYSluTZbnQ/x0CDK0D5vH?=
 =?us-ascii?Q?hvtgu2AVxFDZq/Hw90pCm8tX5TYrDN7yRNaUDLyitqcKaucp+4hJuKyEvfNg?=
 =?us-ascii?Q?Xi2FTRjVff2Jao+uXSyqXFkZ5JpeKolZhvVJpC9dWZh2SgB5OLwJKpjh9fYx?=
 =?us-ascii?Q?BnO7WdQ2argUkpm0zc+fswP2Feirr8mZARwpe8JbXcCS7x7iYqRpM2whU3NH?=
 =?us-ascii?Q?EQeTSgC+SmS7dtsIp03lVDnHFOnHiWYYeIGt8HKmh29cDguzfBSIOvmekVsw?=
 =?us-ascii?Q?2kjo9E1vOqKZucgtgb4sl51Zjo3TrzyrVdKBwHA7xNNEqQGyKuEZa6F7iwsE?=
 =?us-ascii?Q?cuEQeLticKU+S5gtUIph/5x6ar95b8YEXAa/3mN1lCwgkV/+dkLALrSEQ6Pt?=
 =?us-ascii?Q?ar2aJ5rJoxkRtsyddc4KmBFAyNFSyU6ipQWjVuWc3inmKR8ozebx6K/BGqyo?=
 =?us-ascii?Q?ENhRZG17sm/+QIi2bMYd9t50tzNCDDoLzU1rYzxpoiX3T2697CYDDO3ZW6mL?=
 =?us-ascii?Q?ONAFgXjhO5tb2g+Pgyt+PLau2MyjQbpEkyOjsqUH0Tl6rXjX1sRCNRYaMwAP?=
 =?us-ascii?Q?31LpKV1zT/oypSnVk19JiDEWV/ntR8VzyqUd4V3T5+k+iF74pqn6/OGsADov?=
 =?us-ascii?Q?aiStTcatn2IRo/xVZnnIzXZWC4r0Eqs7W+xJ4KM0vaBXvsw9oy7gWcmRkKBo?=
 =?us-ascii?Q?G58uYq9gfomFEvRm4vvu1fkYupXKbyEFjIn8ZGt6kje+AhA0xzwipdFHm270?=
 =?us-ascii?Q?lEe769Do34F6MRpPsGq1s782ZSqZQ9x20cWa6yB8zqltYJTAPlmQVQZPLRMt?=
 =?us-ascii?Q?blCwAPyRTvN8ir/8TUJGOLA6vNbWkdSVcm19ofj8ByeTOhw9KHC0Lnv8kfN2?=
 =?us-ascii?Q?hYyWpEViXDkoKAh363tsHr+OM6qymJS6XyqE0FuIj4cQT1cZ0R/95H6V1YI6?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fc6a74-d73d-4986-2c7a-08dcfcc9be55
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:10:59.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQyLp+qwyfNs04b+kd/RvDtLiNv46bOVam3Q+LjJEOz81LkNeeEFCbMwBJc47xs2ihxIfTJWXI6zczmt1mA7Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7029
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

Hi Arnd,

On Mon, Oct 28, 2024 at 04:35:07PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing random configurations leads to failures in
> dcss-kms.c from a missing declaration:
> 
> drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
>    95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
>       |               ^
> drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
>    96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>       |                                 ^
> 
> Include the header directly.
> 
> Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Unfortunately, it appears I lost drm-misc push rights. Maxime, Thomas or
Ville, can you help push this?

Thanks,
Laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 3ec721afc30c..63a335c62296 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
> -- 
> 2.39.5
> 
