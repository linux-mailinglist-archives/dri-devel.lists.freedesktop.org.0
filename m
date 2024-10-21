Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F79A58A0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 03:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA1710E134;
	Mon, 21 Oct 2024 01:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gdDouCa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2059.outbound.protection.outlook.com [40.107.103.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB25010E134
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 01:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxmGiCJTh2+ha4ahx45TjiNiaLMbLBlCy6JCFntebIFpvoP2joxhlSE8HEJDiCg/csJYkiQ2mJHbLzofrSCSx+a/W4sJqdbo6SO+urETeoFIZ0SvXiscs67QzmHxhKOjZw3p73tkDHBcrf1uyhYVev9W/Yx88yqE4UKgX3GY4WCX1pPV88P5zPas/HY2lbeqf4fpkHuXSsNjdWct+EyHFWQ+pENn4MS2bCpLSlDmJWMSWXEy4bPVaS/kq6pbQH2S6VvLSy1FFooOvMr1hAem5qknTt8dbPXepRZ0CfIqI+Tutg4cU1EL1aAU9BEhzXEFQx8DrbqhRXWivv23oH1laA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KZFNVZXT3w+EyGCtcfZIcawBCk25eS01/hSW+MKm6k=;
 b=skRhZ7CX9Iu9WFFbMkke8NAN3uldKpRREXJFMupJSKrERC1SZhodF271YRV9pfEx2BxTiMLnIvNXILikGA7cAMPpEtgCKYpW6uNwRUCHFAnTfgujE7Dcb6xL7003ByP5uHFBDX9owHATQXDXrQrukLXlxHhLntj0mGFVZkDNw4ckPkeDld2AUCdn4rAbBBs4Mjh6iwxiJlAopDjGh1LioXbgrJ8pH6tUSF8T+MOPEZFsu8pLCg+6T2qurORCiedFquhhH6EFK12l/d3LlNDpUsqWE4R1Oq2rOK8IzjLRhUTFBSe/A+LupCnEw+erSR6LPxS6+fQnUht6z2U+XivLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KZFNVZXT3w+EyGCtcfZIcawBCk25eS01/hSW+MKm6k=;
 b=gdDouCa8ZKfs684qGTryBEAwRyewNuryuYCySO4wblgtczCTokNaOM8TDWiQt8t+d1eS92dwkVz/TmJalWfX1VJmeZ7RT0mH7PY0j9pODkpauNZfQPoPPzHLvhEk0fEj673UjyKIHZpUs0I3YmqtY17QHpNHpDrrAQ3yVwkz39FsaSjR3l7TaxK5i4KkMMEEg4RSffr65OLqlKwBGRLxhhBgKU1Hu5UhMr5hbiy2fWp8HIcryAnTBa4QESrNL5PLE/A/8HYm3huYpoK0Y61Cp8hfA+DM6JJxB7kujCZwys2/r6LDILjgsVCqn3JO5w2nNlUks97kv5QP63105l2UvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 01:50:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 01:50:11 +0000
Message-ID: <fcb38baa-fda9-408e-9494-e30263a7344e@nxp.com>
Date: Mon, 21 Oct 2024 09:50:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-5-victor.liu@nxp.com>
 <vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebe54f6-850a-42f4-556f-08dcf172b311
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODFVSFk0T1ZRMFVZMmxUY2VVVWJTcStkd25FejNpcFBsOHFZOFAzZFd3cTNI?=
 =?utf-8?B?dTVmUjhKN0t6aUdNZlNjK2t1cTYyZFRxNlpCSU50dWtxMDNEM0gyQmhPdVEy?=
 =?utf-8?B?WVNudXRseEl1VG5jZkZ6S09xY2xnMC9pQWp1c1h5cm9VOVFzRm1VaG03ZjA2?=
 =?utf-8?B?cHV5cnJaNElYYWNRS0V6dGtscDFhM2pKWGplSzZVeUxsNS9xejJzRTN6M0d4?=
 =?utf-8?B?WmwxaFB3dVcvekhoUDRybkJJbEljWVZPQkRlTVlLOExsWjZWKzFtZnlEcTZH?=
 =?utf-8?B?TUwvSFY3OFZQRkh0SW1ucHh0Vk9kRlJnd0JZMXM1ajlKMVpOdTN0TEhmSUJ1?=
 =?utf-8?B?S2NaMk1UT1Uvakpia1JzUFMxaFFKaDZwMGdNdElFZ1p0ZmFvd0IzNG5ldk5t?=
 =?utf-8?B?T2hqRTMveXIyRWYyQ3NQLzJPazhPUmVqa0ZkVEZGelljanZhazJyMXZadVY2?=
 =?utf-8?B?QmVSMkZQR3g1dGdzUmtGNmVZMExqK2taRHVKRDdNOHV1Mm9tWmpQZ1RlMjVX?=
 =?utf-8?B?VVE1WVVnUUpNYmdUMEtRb01aa29NaVFKOE8zNXZmRlBvU1kvUDcwYW1oRHNN?=
 =?utf-8?B?dlhJU3JseWx2SWdpM0ZSYWpaZG9vVlUwQWl5RVAvdWdnMjQ0TkdXNkZaM0hn?=
 =?utf-8?B?dENIclRaR2NYQWRqdDg5cWt3TDljUlRZQVllYTNLazNReE55OHNJREFkTUVy?=
 =?utf-8?B?enhrdDE2dVVGQ2xVWnVXL002Z3UyTGJ5b0VRUE4yTmRRcGVqL0dIVXkvK2RQ?=
 =?utf-8?B?YTM3ODNmSmNHcXF6V0ZFaU1McXRoTnVoUXBQcWJQTmpvektCTFMwaExNSG1D?=
 =?utf-8?B?MUkvMHU5RVlrelAyWWdQZnhPY3BlREZOMVRvSE9LMlhLNm9uczFXSDNvK0Mw?=
 =?utf-8?B?Y1FaYW02cDRjT1V3RzNEUjUwUEFVMTQ3NjVTVHBVQ0s2TG9PdW9ybmthSjdM?=
 =?utf-8?B?R292bmp4R3FJRW9MNHJDSXpGNWt3NWVnTStyR0RpeGR5WHZYZTJlZDFvc0hB?=
 =?utf-8?B?cDRWOVlSaU5zSE8xU2tSeGFDSFZqSndZcWxFTGE4bk5QWCtqeTFTenhSbHN3?=
 =?utf-8?B?aU12K1pqYWRpMVpwSndLdGFGWnJtaVJESHpRL0dQb3pKSmFpclN5RERZTnE3?=
 =?utf-8?B?WDhwb2tId3BLUUE5ZkxsRThMRThRQjZLNXZWc3lvMGZBeGw1elF2eE9LYjZi?=
 =?utf-8?B?M3hZV2VSaHBJZDVWMnNFNVE0clVHWUVzSWkzdWYyNmVFS1hRQzdwek1FYlV4?=
 =?utf-8?B?Mlg1b3huY0J6cHQ2dGVDMUZhL2ZWRklGbFAyVDJIczBOdkk1MHJsRTRKbHVI?=
 =?utf-8?B?ZVJOYUhGalRmNGR6WTVDVUtvSWJiTytOTFdMUitybmhiRURvSnFTRWNNajNy?=
 =?utf-8?B?SmRrQmhZbExnQUZqRmtIWmZnVlVmbWF3OEJud28vZCtEaHhxRSs5V2lQdjJ5?=
 =?utf-8?B?aHB4QWkzNnkvTzJ1cHEvMUZyaHJsWUo2b1ovV1JXYjU3MnlGR1ZkTDdWdXZn?=
 =?utf-8?B?NXQrS3E4d2pzdnh3azFEbWhWTkpmRndDN0g5aE8rcFpWb213UXgrSkluWGlW?=
 =?utf-8?B?NG01UXBheXhWT2RCWnRoYmJHcFVlcEY0VFBic1k2a2VBR3R4TDNGQXVKOWVE?=
 =?utf-8?B?aVkyVVpVNVJ2SkpsSk9PMkMyTE9uWmc3c0tZYXVQTks1djVPZjhTeDh1Z21r?=
 =?utf-8?B?U3RmYUp3Mk1nL1lmSDU3ZXNvbTFTUitKb3RFekNJci9RTDJsOUMxVXdUQ1BR?=
 =?utf-8?Q?zcu/G3g3sbKoK3OyYa0cFfruNneBcn/2gTszwq4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjZpMHFTdEdWRHI3YlJNMTcwRFQvWVJCU3hkVWRveWV0VFRCdk1lejZldVNl?=
 =?utf-8?B?eDM2RFEwVVhzVWlRSDM0TDIvQUpUTHhIaTlqVVRYazlUR00ybjh5S0VHY2p2?=
 =?utf-8?B?Q2MxNVgyYWpjOUFjdHNFZ2c1ZUpzQVJUVWhBZVRmSFZyRXNjR1RPcTBNcGxN?=
 =?utf-8?B?UjlyZVk5ZXMvcGx5elVNVHhlVmlRRENDTTE5a2w4U1o1NGVmblpuWkZlOUEw?=
 =?utf-8?B?WUJNZ1Z0OTJGM2x0aDZSNWhSdG9YZklqNGU3YjRlS2UrVVZWME8reUVpTHd0?=
 =?utf-8?B?b1NyUWhDeC9OWlk4NFRHT0VHOXVhOEVNNE02MEFYL3pZVStuclhIdkdjMDlv?=
 =?utf-8?B?TkwxSHYrdDFNWlNnZTlTRk1BYis4aHczcktRc3I1cmRiWHVySUNZbXZZSkVh?=
 =?utf-8?B?c0tsVVhJenVTcndGVzZlV1d1Z1VjYUJzaGtyQmd1aVlSVDczNnBvTFpoeitV?=
 =?utf-8?B?NFJqUER4aU9CQWtYN1FwQjRQRE9HYkFMVGNjeVNQTGVFR0p4T0V4cDJKS2wz?=
 =?utf-8?B?cUJCOHlKN2pHcEhybkIvamxkQ1pxb0lsbk1hVXl2aW5nNVBvWmZYV0kybEpo?=
 =?utf-8?B?TTRVYVJQUVNkODVqcEtLNWVzaTZxbmw0NzA3cWsrNmRPSEVjYTZRMmlnQVVN?=
 =?utf-8?B?ZUUwaEF0RWNzcVNvenZxdlNKR0FFd1ZMWjB4VlhXOVV2aVFqZzFTOEFMY0xR?=
 =?utf-8?B?dkV0YmZqSlRkVFlkS1NVcStqaWYweXh1dDFNNjg2OHlzYTdWTERvZ245cEJB?=
 =?utf-8?B?VjJERUVQdlVNUStSQ1RJcXFYK2J1WDhyZHc5cmlGWDk0Ky8xWUttd0NPM2lT?=
 =?utf-8?B?WVF4eTJpVzRLRGNycDR6bldpQTZiNGZML3dsSms1dzdtUEIvVEhCNTNKR2RN?=
 =?utf-8?B?Uk1VVUxHMzkzTWN1VnNCNDFXYldOc0ZQLzdmWkhvbno5Z3g0ZTdzN1RFNVpy?=
 =?utf-8?B?VjNGS2p1am0vK2RyRkJkbDlDV0YwZTRrMHgvbHFRUzE0aU5FYW9GRUV4czMy?=
 =?utf-8?B?U1JyNm8xZm1EOXdlcmt0RVcySXhIdmNQTWpNVG1PeHJVR0QzWGVRK09FZGlx?=
 =?utf-8?B?TGRKdUoxd3NBUER5NCthWnJwRFdaeXBjbkpVdVFzbit5MzIyeVN0YnVHakY3?=
 =?utf-8?B?Mm9vU3MzMW1GTnhKNDlMeW91dmE4a05JNDJUVVBmSnJzVjk5MVlBay9UM2ZX?=
 =?utf-8?B?ZWpYc2tPRjc0NFdYVENIeGduYklPTEgrTHh6Nm53eXVjUXFvTnRFYnRvTFhV?=
 =?utf-8?B?MDhmMGRmUmZYQ0xqdFlrbHQxME02eTZvZ1RVbDNoekJEeE9wa2lLMlE1Szln?=
 =?utf-8?B?N2lCYjF1VGw1bmFlanJ1SUpyR0tvUkxNRFVpelpsYUZyV29wZVk2bkNIbElx?=
 =?utf-8?B?eVFDTVg0dStXQng5ZUh0aGl6NkEvSDhoWVlPanlXN3FJMURPdHNLZDIydTFk?=
 =?utf-8?B?WjhlMWw4S2hDODZaV3JTZlpnb2xYZmo5ZjFPQStialJZU1hkUGZRaFBiTmg3?=
 =?utf-8?B?elo3Wk5zNUZFNE5ubThEamtHeDFCZ0xZdEZjR1VTTU1qc2ljQ2oyVEpXUnVZ?=
 =?utf-8?B?WXkvV2xibWRJdlRkdllUMS91MmM1eXZEUUwyVUM4V0IzWWk0RjZSNXNIQ2pJ?=
 =?utf-8?B?SjljWEp3aUtMYzFzWDlpNG9uZ01xMnhjaW5USHNvdVhxUUduUU1lTitpakF1?=
 =?utf-8?B?VWZiUFlXSGo4b3pza0gvaFZONDRjRjkvdFczUDNSTytURTd3Z3dIdDd5eVZ0?=
 =?utf-8?B?dTVTRExjMmVDWWNrMzlCajd3OFg3elZ6MmM3cDNCQm84am5vbm1kcGlXM3FR?=
 =?utf-8?B?SUhiUVExZ1pPYTE0WWtIaWx3UHFuSzB0YmJ3c212MDNNY2tJbXRxU2VqSHRv?=
 =?utf-8?B?eU5idk9ORmlIais0N1liUkJlZ2VJME9ab2dFMVluSFN5UXRwVUNRR0FIWE11?=
 =?utf-8?B?N09tWkhpUnkvci9GaU94RWdTUG9QUFhPL1d5R3VJRG5FWFNTRDQ1c2V2Nk1l?=
 =?utf-8?B?STZvQjF6TCtEY2FKOXJpTUhvSXN6SSswdTdEdldlOEQ2K1FYL0pZbTBlREVz?=
 =?utf-8?B?MzZ3aGVRb0gzNmxqSzFBWEJ3MmVkM2ExdjJ3N04vUVc4b21JaVJYYWRmNEQw?=
 =?utf-8?Q?SSx+SUDh0Rs/G7bdctYWcFFlO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebe54f6-850a-42f4-556f-08dcf172b311
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 01:50:11.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4xaDuMDr3d3NxnkESHl+k7qNZo/wf0Hh8oSHtzcsF+UviyTZVvJkmbGvq9ZtmwfyqXa/PebW088ZqkHuRplNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456
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

On 10/18/2024, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 02:48:12PM +0800, Liu Ying wrote:
>> Set DW HDMI platform data's output_port to 1 in imx8mp_dw_hdmi_probe()
>> so that dw_hdmi_probe() called by imx8mp_dw_hdmi_probe() can tell the
>> DW HDMI bridge core driver about the output port we are using, hence
>> the next bridge can be found in dw_hdmi_parse_dt() according to the port
>> index, and furthermore the next bridge can be attached to bridge chain in
>> dw_hdmi_bridge_attach() when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
>> set.  The output_port value aligns to the value used by devicetree.
>> This is a preparation for making the i.MX8MP LCDIF driver use
>> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> flag.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> index 8fcc6d18f4ab..54a53f96929a 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> @@ -96,6 +96,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
>>  				     "Unable to get pixel clock\n");
>>  
>> +	plat_data->output_port = 1;
> 
> This will break compatibility with older DT files, which don't have
> output port. I think you need to add output_port_optional flag to
> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> is set, but there is no remote node.
> 
> Last, but not least, this changes behaviour of the connector.
> dw_hdmi_connector_create() implements CEC support, handles
> ycbcr_420_allowed, HDR metadata, etc.
> 
> We are slowly moving towards the supporting all of this in bridge
> connector via the HDMI Connector framework, but this is not
> implemented for now.

Then, it looks like this patch series needs to wait until this is
implemented.

> 
>>  	plat_data->mode_valid = imx8mp_hdmi_mode_valid;
>>  	plat_data->phy_ops = &imx8mp_hdmi_phy_ops;
>>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

