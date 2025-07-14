Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52EB034C8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 05:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1BC10E1DE;
	Mon, 14 Jul 2025 03:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MzFbWsUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC4C10E1DC;
 Mon, 14 Jul 2025 03:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZ9pXCRpQBxaO/q4YWPZW73fW0mamLLO0yFzp2vnyFt8BKiYqkGTZG+4gC8TSXhREQ8viOcSMkV+aXBtN1FVY3jHqRg85BkN9dnM4ZQir7MFjNZcHCXOceTkOrRxj4oP/gajp5/4GXE4YVO95ay0QM/tmHRWcv7h96PR/Et4t2CMukH3F2dC+CN5f46yDKmdJg5x3JQgNRAMbfPhJHRKrQYOa1jHPaoiy+WSfh6E6K95yvvYf/3fasl/xlJVSzm5foipUHwRsPhd12SGHzlN1q6PKkZDDY2mzRavJoKRh7b/CleYUEkLEfhmUwHSAKvV4dq8d5FiLdKTJYViWlMKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Pckh8ZVlatqzqfd7xXVVOtOHCwmL0snbOJ2D+9B884=;
 b=dUOTgClGNTXeIJg4CNdvso+bj+YnqOpDDfeZNobaRcNRYZLhrze0liEekrh249Yf7RNcEV+hmJp9V9U5qqj4NJaan5efywUHJiSYiPJoDW7a+eexJGH9OURZ32o9pPV92HdHEiK1o2VcjAueGJOMy713SlKMT44UrnmzcvnyYWqz5qK5aGPgS+LedvrZSb8P0irBhlerO16Pr53Vc9EBlCWcmdSlCgK6+lplntblWgFpmXeQLT/zrCXAdENoOpdPlOqBmqq3+aWvlN4eX2X8s4DZs22d8Gdm/Ur+ZU5FKSCoctzK74hWvaFUq7tgRzJq8j9XoPPKzqEX2Hv85O7x5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pckh8ZVlatqzqfd7xXVVOtOHCwmL0snbOJ2D+9B884=;
 b=MzFbWsUimGzcFzlPgAK8n6F489cbR46VgE5pJfrybgxELI31QiY9N49UrszJpgSqASlvErdXdaMMdYgdBma6c1gpLC4xE2gr32OhvyDNH/iCJC9SOMbqtQ2B6oUsefraXrekF03H9FCjvTNZTe5mlDLInQodf3Tl1dOagboP0M6OneGTLjD4OZSXchq0jai6aEDko6xSve6XDYqxwmzzzmM/Aq/rk1SF9T1RHNzkrfIj3qXfsnT0OnycT/ccdrSPSXQALFJQzPoJaHHaev+EE3TH8JdeLMbm4cvmpj7L+zhkFLmSXBYmVyfRgAUgexguAwCmU5qzaYjjLz30+eO3Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Mon, 14 Jul
 2025 03:08:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 14 Jul 2025
 03:08:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 12:06:47 +0900
Message-Id: <DBBG2S0ZQAMI.2KK26Z7U58DI8@nvidia.com>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check in
 PmuLookupTableEntry::new
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713025108.9364-2-krakow20@gmail.com>
In-Reply-To: <20250713025108.9364-2-krakow20@gmail.com>
X-ClientProxiedBy: TY2PR06CA0036.apcprd06.prod.outlook.com
 (2603:1096:404:2e::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 353a1950-3a17-4796-fe69-08ddc283a478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWw3emYrQ2dGam1SQkxFa1Z6ZW12TngvWHJLVlJ6am9KNzZpaWMrNlk1TGdS?=
 =?utf-8?B?VzBFR3VIMlVteS9mYm9oOEJLVlZaMlVvU3ZBeWNBeGVQVURIak4rajFLVGFu?=
 =?utf-8?B?SEJ2aE14VGZ4azUxRmhHZ091eHBCaEJJT2dhYkFzVWpoTzFDNzYwd1NEd1Z0?=
 =?utf-8?B?Vkp4cXBYb3RaanBZalNmcnRQamFKenRtcmo2ZUxtWkhXZXU5OFR4NWJTaVNC?=
 =?utf-8?B?bmU5MXJoa2dweXZ1ZmdpZzAyWTNjMGZMOTFMazIxY1FQYjlxZzVlenJUVlpq?=
 =?utf-8?B?cUxjZlk1RDZ4YzJzT2JtdHA0SXg2Q1BxWEF5VGN4cWJIaTZjVzBKNCtkWlgr?=
 =?utf-8?B?Ny9IZzYrVTNRZUN2TzVMQ082aTZnd1dDU2FKMzYwdmZmellabzRKZ0ZDbUJP?=
 =?utf-8?B?R0ttZ0w0a1pkaFhYbEYxUURySERDVnpJYmVwTlIvWnNYWjFvcUwvSjdqdWJO?=
 =?utf-8?B?UzJOd1cwZDZOdGFtbFdPMkcxV0srcXFjSCt3cG1kMFdtUzJaWmVsVzlBTnVp?=
 =?utf-8?B?SWRJNkhFNnowbndzVFJGbHowOEdYVS9QUmdFVlJUditKa0c5aFczZjVhdzJq?=
 =?utf-8?B?YmVndWRjQzJ2UHBNMmpKUVdFbW84SzVsbS83VDVmS1JOSkdzaVFpZGVEU3VZ?=
 =?utf-8?B?S3EycVplNHJnYWFRV3I4VkVSNkRvQ0tJOW1UcVBGaUdiWkZwR2Q0Zk9Cczc3?=
 =?utf-8?B?R1o2dzlHNkxpWTRmRS9pbE9wTVJ5RTg0WmR5L3ExTFBjeWFWMkppZnEzbXFW?=
 =?utf-8?B?NUpEUGFUb3JNM2UrZnB1Nmt1bjlQZDBmSFREcFBwUTZVWlVlTFp6V2tBTUN2?=
 =?utf-8?B?cXE3NmR2L2lzK0VWT05QQWtIYis3K3JvK1BFNlRjT0Fwbit0QmRDUDR0ZkV4?=
 =?utf-8?B?bWlnMUlITHFFQmU4eWt2UEdaMWIrWXlaVDg2YzcyVFdjR2lxZ3RWS1M1VG1C?=
 =?utf-8?B?cUMxMGtCTU5CZkZDMXB1NW41WTB3L2ZBL2ZkTW4yZndud1ZpbVpmVllEQUFN?=
 =?utf-8?B?ZjRPemg4bzFkVDludkVHZjFYdzE4eDhtdHpXNWk0SDNwMzNuMkthalg5WTl1?=
 =?utf-8?B?azgwMWtTWVRHanZwS0p5a2NTcDU2eGhDcFBZd1FaNFhjT1hjaks1U2p5dWlN?=
 =?utf-8?B?VkkvS3BOc3REZVptejVvNEw5OFFWUTNtd1BiUHp0ajdPV3ZlRjJveGlXbGlp?=
 =?utf-8?B?MkZpQnV3WjgxOEh1ZDUyMGJDN0k1eXhMTWltVjVDY3dQREEvTHo5cW9jSTNK?=
 =?utf-8?B?T0JDaUsrZTFXZjZoaUNneS9jV2dUZFZ3RTVmY1k4UW5iNWpQdk9Kbi9xUHpW?=
 =?utf-8?B?NkxKS1dOK2RjVHRnODlvaTd4WHVBcDJHdHJHdGR4Y0plazMyc05NaTRHb0JN?=
 =?utf-8?B?aXJmSlpWTUtEam5DOXdQdmtnbTFMT2NLMVBBUmhtS2gyNGQwalI4emFqeGk2?=
 =?utf-8?B?ekNRa3hnL3A2dUdJZFNDZFhFRXRURHh2Qk5NNGRsbi81bS9LUk5hbXh0OHBF?=
 =?utf-8?B?NDVLQllGR2dpQTVsWUR6OWZOUitrOXBob214eFR6dW5iYkltL3Z3VXZlSytZ?=
 =?utf-8?B?MlRvY2kvZDg4OHBUTTdXdU5TUmMxVjdrQUM0NnpjM0JBUGVZQTliVVJmc2dY?=
 =?utf-8?B?Y3hDVktYQXJKZDVYSnlLeDZKK3czMFF5ZE9SWmh6RlBXYktaSW9OMlN4RzJk?=
 =?utf-8?B?NHVpWUZpano0ZFQwMWZNTUpxNnNzQ2V0S0NJbzh2N0lCeHRIeENNN1JGOVBX?=
 =?utf-8?B?V2tHQlhURXVRM2NXS3VtMm5wUzhtYW1LZ21WM1ZuQ2lma2xpODhGVjQrNCt6?=
 =?utf-8?B?WGhjQ3JpR001aVR3bTNuck11NWRNV2RsYkR1OXVlWUxyUFEzWmFyYi9ZVTdG?=
 =?utf-8?B?c1dGUzk1NmZzTTBzWWUzT1dQUVhubll2SlR1eTRWM1o2MVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xsVjg5SURWT1E2L0FwUmp6NFBZQlV5eGtxZnpxM0pxMnpGeWNpV0thWmc1?=
 =?utf-8?B?RkZabEpzVExwK0NkQ2RCRVozS09OWkx4K3FRVmZodmlZT3RPb3psMkxGdXE3?=
 =?utf-8?B?YnMrSzZwQ1lWRzhoNjJ1cTVpdDZVVmlodi9ONlBQeTVHTDlpQThxT0tXOFcz?=
 =?utf-8?B?WDNaRFJVajhoWE1HbjAwSTFQd1FyTHR5TmpJR0NKU0FRNGtKcUlBVXEwaDk4?=
 =?utf-8?B?Zm9pV04zTDhhVjNnZlRmUUZIc2UzbjMyOU8rcTNsRFNSTlBVRUJiZEkybDA3?=
 =?utf-8?B?M2pobnR5QmE3Y09ocGMxQ3UxOU5wcDVjcml2VGsvbGpOMXYzK01PTTNhSzd0?=
 =?utf-8?B?Y2hEVytqbmRZcmFpUFF6Q0ZiQlZTWnh5UVFqMk12K0d0Wm1KV0o1a3VWTEFw?=
 =?utf-8?B?Vy9xZnFFcFBMTWJwQnFFek16UTJXcGR3Tm4rRnlJMzNRSVNYMDQvNGsyRVA4?=
 =?utf-8?B?UE1rbHg2NkM5Uk1FOUhxZEw5bVdkZ2dlMFRlV0I3TVl3bjJJWW9iRDhnblJ3?=
 =?utf-8?B?ZzRQUkFURk1tdlFtcHBmL1hTMGlsZytZZXlBby9UaXAySEFFai9WQjVYenNM?=
 =?utf-8?B?QmZoQTFQajR5MHBDaWM3bVhIUE5oYVlxd2Y4dXFoc1FLTWFKbC9LNWNIbHA3?=
 =?utf-8?B?NG9qZW5QSlhteWpVbWt5NDh6aWN2cWZ6S3hIMmgvN0xuZkV3UHk1TkU3MHQz?=
 =?utf-8?B?ZmxiMDBhSm1QSFkxclVjb1lsWEpJT1B2VEoxMTNBOTdFYzhkb04yL2FoMkRM?=
 =?utf-8?B?SU81QTJMUnA2dzRrQnV1UGZpeG02aEM2aHlRcmg5ZUJHV0JUSlQ0M1Iybm5x?=
 =?utf-8?B?ZTVBSXJ1WjFFQ0p5M2FBdlRzQlZnRmxuODM5S3dDVDdqS21tZnVWTXFMZFhI?=
 =?utf-8?B?NVF0Q2IwYXFYbTVDSUlRdnB5MWtOd2VPd09jd2VsZnJMTnBwbEw5SUd0MnNY?=
 =?utf-8?B?TE5LZ2FraXF0WmRuRzVmbVorOC9TaGczKzJhdkQ2OFhkdXFWd0FFK2lGV1RW?=
 =?utf-8?B?MElOSlN5UWYvTGhxSy9PcUdBNlAzb2tKYTN6aGZzZk1ZYUJwQ1JVc0NrWE5S?=
 =?utf-8?B?c0Y5QWlwK1dYd2hrQWp2T2l0MmZZTVBNNk1OZkk1Y2UyQ1g2alJtMVpzeStF?=
 =?utf-8?B?UVZyR2ZuZFNwRWZYeG1IT3lQVURVcTFtZDFweXorMWdRbkNUWUIrcmVJa1Zx?=
 =?utf-8?B?Zk1PVmZUODl3bEF3RzlTUk1uaytyMHo2aEFycStaQ1lhZHFQU3VNSnRSMWRy?=
 =?utf-8?B?cVpHWncxTDY2cE5lc3h2ZkkvemJtVkJwRm90WmFKN3l0MzhVRzEwU2tKUWw3?=
 =?utf-8?B?OGJGOG96YWFXT1pIbEZSQW83OFkzb3EzWGRFNzhTQW5mRmVxWUJ2RjJYMEEx?=
 =?utf-8?B?SFZiTHZ1blp6MHdSekptZW96WlRrWS9pRWVHS3VIbURWdmxML3lEa3RQdWda?=
 =?utf-8?B?MU9Jc3V3ZHFNTkozdDFwcUpGUE13ZzhKaExGM2dmK0xWcy8zZjRoZ2NNeVJS?=
 =?utf-8?B?U3VQbGFFMzZNSU9oWWY4MGJpM2p6OTJ3OCtYdG5YSFNlMUNRVzQrR1ExQnlp?=
 =?utf-8?B?RlE2TEM5NGNnamZ6cHZSWmJKRUgwMk05SDd6VHVLN1hVVVYzNDJHTlQxS3Vn?=
 =?utf-8?B?a3dldW5DWVJPN0phS2FpbGd2M0c0WnJxV2tvWUppUldYejJPOGU4WlM4elZa?=
 =?utf-8?B?RzBCSUpPVFZQd252dXh1Uk50N1Q0R000elBzNzA1THQ3NFd1ZVZ0cloxdXVG?=
 =?utf-8?B?SW8ya2IxMXNmd2ZzQWhkVkNPU0t1b2pqNHpkL3JscS9tUG9mbDJqRVFwOVJM?=
 =?utf-8?B?SC9zdjNCSjl6L24rTE02L0ZuUStsNWlpWHYrZDhCUWU3OVJUdjAySEtpUDVC?=
 =?utf-8?B?QzhvVXRHK2JLQjAxVU4wVjdSQ0ppa1RTU0hvQ0M2azZDNFV1N0VDN2M1VHl5?=
 =?utf-8?B?NzJSa2xicitlaGM5Mk53UEtBY3ZQUEVwQi9rSUlaQjhYdjdJU3pkNXpSNldF?=
 =?utf-8?B?U0pxS29uaitWVm14S2Z5M21yZTB6UHR1WXBta1JXQ251SUowVVRETVhpcXRn?=
 =?utf-8?B?Rk9LYUdiNzlhSWV4dkwzbWN1U1FMcW1POTM0am9jYk9ZSEdhQzNXMVZ3QmRo?=
 =?utf-8?B?WFU1MmZUTEpiaCs5NWRXckhBOXd4UkRJeEw5SVB3NXVZcEpJYS9XUW92dnNX?=
 =?utf-8?Q?kDqb3448jvH/YpZqY9D9Nr0EOTRL2Hus+S/NYUTtw939?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353a1950-3a17-4796-fe69-08ddc283a478
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 03:08:01.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WrHFsgCBFFLO80YaINadp7JVCXV13CTl1AjfOXsbKk+LMcI84IUKg2QK6zE9Zk/ZOaE9oh1B885ziem1Y5iCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642
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

On Sun Jul 13, 2025 at 11:51 AM JST, Rhys Lloyd wrote:
> data is sliced from 2..6, but the bounds check data.len() < 5
> does not satisfy those bounds.
>
> Fixes: 47c4846e4319 ("gpu: nova-core: vbios: Add support for FWSEC ucode =
extraction")
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
> Changes in v2:

Since this is a v2, the message subject should have read "[PATCH v2]".
You can achieve this by passing `-v 2` to git format-patch.

No need to resend, just pointing it out for next time. :)

For the fix in itself,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

