Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF7D20211
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4441410E273;
	Wed, 14 Jan 2026 16:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="C5BSC+GX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azolkn19011069.outbound.protection.outlook.com [52.103.23.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066CB10E585
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiKQrpbsJRvvcqpWaZVIbInS/TsTX5soGPtnFOKTluAJ7UcFYlMoPNCxvXvsac54uCRixW+6WnKp6hKCeRI+voTczvGnsTzQRHauzsUk5D8jVVocv/eSRNg4t2eSD8NRLX2OkAkBQvvfl5OdF89LMDqXa3/RiF1YIIA4S2sYHGtnEc99onwe3+abYiukZJl7EWntXoSgul75f1RER/IKV+hSRow8h+eSx76yjpU1sDzkQeY8VKiMcBpmmYZWZFjWM9WJfAuikVkoXf9JNOEOQgwE1IXfqH85P8WNSJEy4yDKjpfqlMRdD38+7zwDTn98FkI9P3x1LxLCcu9Tm1uvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqLLPrQJARBCtf9IpQ2+zX7BzGKVvWxE9LNXzj1MnLU=;
 b=l5s5EZQmZNeCWLFCcz4d5Ox+uryOsu10cq/c0+8Uc0PXqR5GGM4E6WBop6AGGwOxODlz1yWcTYo4ZNEyEyRHXuwb4bANE55bKv2CeDMVyTibMzs3rxP+hVjQg9iosoY7Lo8rL2eYBcr3jBscaSTgrAHG+jqqO909I2pLZUHoMfHehuXGfmOmn2ebFjDVEtYs23dFc8gUp+lfVtbeMhdWgmZiHITuyj39VpWMbEU+44Y5CYmTmfd9KRZPDRKnpbEoELGtKTVcwaSKSEs3LhfsbLUkEJg0PZPsKVSkKZbg+Y5DnXbEDUSeWczWkdqPCc6TQJLl9nnIIjckSBfrAcPA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqLLPrQJARBCtf9IpQ2+zX7BzGKVvWxE9LNXzj1MnLU=;
 b=C5BSC+GX08ZpeIqtzW8vsjfrZYBbowARX+vtQk4DfeCBPpoRmRmQWBYXmxm8jvQBMX/j/zS23FZuVzdWn+vR+V060bLXxeetdjrlZTZZ8B94thps9amkhdkrVtKekrRQJB8dVisqAf5yHHwGfuulOfAOF3u/jKUkYC/k5toubCYxT3wr8Bl/Tz8tPI3BwAn7imOc5xIkI7eEQe5/iWjoVglQ8LW+ExWd1jwUZnUCJoRMJIMq7FVlOUIYGgAn/Gem5kFNA6oZmXM+woyVuLdfKqvMi5z7xFHsKZNJEmFDG7rBRkzlI8qDxN36DXGOEXBHQTqhJMdFGbpIFmqHpwNyAw==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by IA1PR19MB7229.namprd19.prod.outlook.com (2603:10b6:208:42e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 16:16:28 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::57b1:b92:26fc:c937]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::57b1:b92:26fc:c937%3]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 16:16:28 +0000
Date: Wed, 14 Jan 2026 10:16:25 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Message-ID: <SN6PR1901MB465494AAFA4090D8806D7B12A58FA@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <0b28ae6d-295d-4958-9571-190fedd95efe@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b28ae6d-295d-4958-9571-190fedd95efe@collabora.com>
X-ClientProxiedBy: SA0PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:806:d3::17) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aWfBWejGjvumqvZ-@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|IA1PR19MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 96546c94-ed4b-4a54-39f1-08de5388453f
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|461199028|5072599009|39105399006|15080799012|23021999003|8060799015|19110799012|3412199025|440099028|41105399003|40105399003|56899033;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?POtFJ9px6YzoUcstx3V/DBnVxCvpQxuqIwG92HFT9Yf/uUgpx+shO3I2mH3x?=
 =?us-ascii?Q?bt1hqGI8r/5yTZPpT8Kr5mk8AQD/qQEXleYm9ldUqTp4LTxjE4OUPDD9xWRM?=
 =?us-ascii?Q?kLXUdMyJTrJT6T8/xlMcBK25C5UA0D77b2Y799dNGmqYxEjtwMJk0JMoca9q?=
 =?us-ascii?Q?tVHrHBbCzjVyj7ptuBFvX3dVfihKLH2R7hQ7qoqXG99nzFg+SvBD3VJVnEuW?=
 =?us-ascii?Q?AZkgaqkoqZSOzYgNLzXVBP7YVBs4q/kPx0p75RU52WI7UiMTS1MfBoBKWQzx?=
 =?us-ascii?Q?Mlbodd+mR91yj4JT7DyjAcT3vCyHDXH0Tu9q2s6UBj48S3tzju+YN2sFlPVA?=
 =?us-ascii?Q?aonYjFzIq708GhQ/t9aACS8cFHbzQhrjME4klIrmtJ0shKfjWiECMo3cdo8d?=
 =?us-ascii?Q?hTikhyATS/qDcN1uxxA4zJnxiAJjQ1qtroNhi6jHI+zIhkVoRT0rTF15ds58?=
 =?us-ascii?Q?ayQJUisi4Qu1ufg6IBVilQFJ3vBz1t2ogWJ8esrCbM545wEuIq8uHS/SAbak?=
 =?us-ascii?Q?z/trOL9o8dk+ilgZAIaFAdbiXgq0e0MFkh/Vb7kFTAbKX8LvKgeGPfI8Ewcd?=
 =?us-ascii?Q?Xh/MmmRXFOzRf9yAFLlYRtvkD+G0Iw+0CyFf/xSwv0ljazIykyXBV8uFEGT9?=
 =?us-ascii?Q?1srWA8l04NB5JOJzfIz1paje8nw7Pvz/ALkkI0p9C222epW73o/KLxMh1WQu?=
 =?us-ascii?Q?o/RyTIp/r97QfqY8Ml48u7qcRHQGLTjikCZ2QfdSiGYWOTVBEUugGddNuyQs?=
 =?us-ascii?Q?WXpow69fkf7IvRHdujTjpVF9LktkprY/bCAyYkgFbg4pM1S7MWg+xvP4RPXV?=
 =?us-ascii?Q?5vGirIm+xcLAEx5Csu/vCIW+tXFs2MJnSZQdZ3jeDvOEmxcOH5fWUqed73SA?=
 =?us-ascii?Q?kZcbxdw3Mk2owantq8GZIOxhsUO0Pfq7E+EDV6mCWZA0MjD0/8pI+IDcT8PP?=
 =?us-ascii?Q?uzw+ikvr7QU4RuJYFhJvlLED3nc9f+rQRvgx70xPHkpBAoCnCDnLvcPlaPDj?=
 =?us-ascii?Q?AvNE7eAomEo6MxK1ZB7ZWZ4LTCHv0m2bqerRqFajRpQuJ+6Zyh94sn1XmNz8?=
 =?us-ascii?Q?cfBNbCrRgV+7bFKze1JkaBCXGF5AH7AE0W3MeaP7RyYfuL6WSDYVleHwdio+?=
 =?us-ascii?Q?f3+JSa4Oux/KvS52mCO1vEvq7uBPZa5z8STFzrYtf9ZjYRxj7bBNRNeN2Dau?=
 =?us-ascii?Q?eR7F5Id2JBy+GViSbOB2j5XuFfRmoxsiI33JdJuJd9ikylTEvA+NzO91iZk?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xq9bTnpg7TUxkTAeDRsqiKayLjj6l45YGeokbNKPmloP2PqkD8Ar/jJz3JZM?=
 =?us-ascii?Q?jWA5s/HVj2fXqrBWXMIhTYcELnr56RBhE4GJWKb8NUhcbV8dluVcQyDKLcS1?=
 =?us-ascii?Q?RT+Uh7FF0WQcl6qi90I63+b25Out3V4j854XCK5QQJV/wWT8xBJG0u6u2nZA?=
 =?us-ascii?Q?eveto10qzat1GVO8TU1N3hvAjifTVxD5/gyuzcEdh6VDnvcLLaDRkeL7Z4e0?=
 =?us-ascii?Q?3EIGlEWs7zcZ37OdL8nGSoRK6d/5BDhvJE6cKdBPfEn2tJ9ihPvOK2yVZfsk?=
 =?us-ascii?Q?fwpW0Qi+H5SOhg4AOtD+mkQ2z9Xw89vLqu2Of/e2NV/mWLZnyT8z6NlpdFMb?=
 =?us-ascii?Q?Rvg7kzzTNjYErQJuDANLPt3Y8pzEI2YIRcWwsotnJX8aoifxO9VQIWM2p5ev?=
 =?us-ascii?Q?LcNPzkuMSjYO7DOeMx24mSaHR73tNZPJSI6vF3o+c+gmgrWE/rGE7ikURuSw?=
 =?us-ascii?Q?jai3CF14C2lq9oyvbX2JkHj7vKnJX2SokHsFzuvcLY5MQf30fxVnEza1/B0c?=
 =?us-ascii?Q?AKcBAU9DiS73VCNDjijIXjbeTMQgaie/LmxiXPt2ru+bjpU+5mSWJBAZAam+?=
 =?us-ascii?Q?6Dv6rBrlbNPOIS8cYE+8LLO6GddaZp9BzL3y6RJyPkwGG4JehQElPDpfhmoX?=
 =?us-ascii?Q?TqYb4FQujNcA/yntIIVIb4PgX4ym/j3nsZzMmJYSwZRASuxNH9mTCmmYwf55?=
 =?us-ascii?Q?FJ5GibyDzeQ4rSrAV4J6IecQxSBEanlXL2VdwwYrfjxg9xqKW1BANUxhnDSR?=
 =?us-ascii?Q?jTIUe+hHESX/G9oqlsI/oIbsKluBzrJTWO67CBOJWvaKj2StMHOYq8lkntSY?=
 =?us-ascii?Q?aXHhsAPoCbr8HPMd8Oy7fsBqf84sJXka29bmRRyxOd1ccsvSVWzlpBk6B6j/?=
 =?us-ascii?Q?728Cm7vZZkLiB4VLagX9uNa1nNL0Wik4JvEPemt4UbhUbZ68aAXbLGQOfIMs?=
 =?us-ascii?Q?stHe+fY20sdaV4jqratrSUxZt0I27SusIK0bKroR1pYIQBI+vZQLc+kQHhQm?=
 =?us-ascii?Q?4n2Kja08XUCfB2PhSsW6veVToP+tEBuSPbqbfa4ObGpgapFVk6CU3OV10l7B?=
 =?us-ascii?Q?9q6ulQj1Scm2BVA+OixJfsaojvEeh/4IyG8kgCI+ayr2OMih4TAI3nFYspDO?=
 =?us-ascii?Q?G4n00i9LGUrzqJlGh7Q0FSMl/qH9xGHogP2I1wJozZ0D2YFvm1GzBdGqW1ky?=
 =?us-ascii?Q?91p76Lc2lhoHjqt6Xscb1rl3Q0t4HzLW1ya7yM6sf3uZMgMzmkqiir6WQVmJ?=
 =?us-ascii?Q?Aehbu0fNTctvtSKypnAAd57W5BtgYvTO172LW5wF/PvzsOgQyA1SGdDTvXcv?=
 =?us-ascii?Q?UMzHVTj2M3CtgCphGppI0AhiT2lKxb0mhnsBuSIchbgZHb26fBBdU3gt5IjE?=
 =?us-ascii?Q?v/082jjW4Efxuph5+QzHvwTuGErs8MiPnJKEaprkbzK5s700HA=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-6f20a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 96546c94-ed4b-4a54-39f1-08de5388453f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:16:28.3152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7229
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

On Tue, Jan 13, 2026 at 12:40:46AM +0200, Cristian Ciocaltea wrote:
> On 1/13/26 12:26 AM, Cristian Ciocaltea wrote:
> > This patch series provides the missing support for high TMDS clock ratio
> > and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> > display modes on RK3576 & RK3588 SoCs.
> > 
> > In order to allow addressing the SCDC status lost on sink disconnects,
> > it adds an atomic variant of the drm_bridge_funcs.detect callback and a
> > new drm_bridge_detect_ctx() helper, which is further used in
> > drm_bridge_connector to switch to ->detect_ctx hook.
> > 
> > Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
> > platform driver to run the detect cycle on the affected connector only.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > Changes in v2:
> > - Collected Tested-by tags from Diederik and Maud
> > - Rebased onto latest drm-misc-next
> > - Ensured the recently introduced 'no-hpd' support for dealing with
> >   unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
> 
> Chris, could you please confirm no-hpd is still functional with this series on
> your Gameforce Ace board when testing with a HDMI 2.0 display?
> 
> Thanks,
> Cristian
> 

I can confirm no-hpd still works with this series, but I don't have an
HDMI 2.0 monitor to test with.

Thank you,
Chris
