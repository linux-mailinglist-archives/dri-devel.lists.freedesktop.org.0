Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452E997C6A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3432710E865;
	Thu, 10 Oct 2024 05:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iH4+Ky/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4112110E865
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FV22TJOmfH/9cFmthnd5g8plnTJO8a/xG3G5af86yuHTW05QHlyyt4Lv07MmFG4uNb1x5mfZv9TkohJwcnvjvGxotpKQTf5BNsylQoSNUVomnFVl58KjmGWzLDCi5LH0O2FjwsYcia/wkf98hlcen4GssXSa7ldc3rr7tDMFBOkbqhDyrMj8VBVr5sh59MPsBD36Rdiv9vg4KbxteIKQpETzTyXtPWsEs7VSl6jZ35FG4gQFiyBiVWv6Ue3nF4MeuskpGv6zt2tCykA3yPnsYF1K8S7gwZ+ZtRVZ8UwX4WpwO9YWfFUXPvyr5S+dN4Uj/8uLv7Qpz6NCxtucqHRxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3tpbOYzv+CTaw2txfyPh+RTWTIAS0i+Ganq8MvcYWQ=;
 b=ggMgA3NLJGk4lvdr+Q9GdtacnJ2s6P5exgya/SLzg4OFuZxDMPjxcbBz5eGJP9wc3tpB3nSEjav/S0wSLdHGc3/iGTvNMFoxjA96wpyZ57jUOhz+kNk53iwVWgYB/Ta5Tm77VNc5sVFk4Fy+bLRKj1JFJd2wazLbMIGMlyBFlakVI+Q9JOxZEWay0oIPgRuY2HRlrAfqRlhBzlbV23eDcrv8Bj17M6MzYW2nUKrW3j8bJ/1IXkf9Zy+9/FeKtwgM3Qdqb3QbfhBz3fD0B9gxxhlFuXrnbGFpC3W5vWh19aTXVm/p7XsibfABVCyBB0niYcMlvmEcyjxVKYipPG1kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3tpbOYzv+CTaw2txfyPh+RTWTIAS0i+Ganq8MvcYWQ=;
 b=iH4+Ky/0RtVxhQ+Ok3TdlPTNowEO7jVnkUsudioaaMOqasUpZh/RjT1/MTpXVdPE85Sr7hIZabsjpJPH7wJSt3R/f+WhuyAYIAulLlKJG36mo8JYjKW/jhyQMknrK0I5JkeL0sJ4CNaX897LvXFTMWWY4aRF7bnTf88FjX8XI0T73A6eNA1Z4ErSvIidaGSgJWK7jZIDiVmT0jmC5dBmULnzYZtHVgUhmkDTS/+m9Vc7E2QdRZepnjN4q6J2W/mREULXrBI5yRk6YcSFecqPNBpAa5aMKRtypTAHs4XVPZwfd2Bj/sVj/nVtfvYagnjbVCGUL4nsLpPh5jqplVzgPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9199.eurprd04.prod.outlook.com (2603:10a6:150:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 10 Oct
 2024 05:31:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 05:31:08 +0000
Message-ID: <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
Date: Thu, 10 Oct 2024 13:31:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Marek Vasut <marex@denx.de>, Isaac Scott <isaac.scott@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, kieran.bingham@ideasonboard.com
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w> <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 764bd8dc-3772-4788-e7cf-08dce8ecbe7a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDNqSWduY2N1UlloZnViVC9hU3RwaGdJa1VkQVFrYmhtVzdTRTExNzJxVmJS?=
 =?utf-8?B?L0s5VStCdHgwcW5RVGhPb0g4d0ZJaDJ5NHNOSGUxaGg2NitLc01UY21hQjVh?=
 =?utf-8?B?UW9QZXczZ2ZsWHdQdFZGT1hUTzZDYlNUR0xjQjMrU3IxamwwZUZVY1p3MkNr?=
 =?utf-8?B?alVveklVckVmYmJGenVKcWFldXRIL01naFJUaC9pNmZpYWRIT0ZsTjd1Zmpr?=
 =?utf-8?B?bFVMQm1iOFJCL2I4Uk9Ra2ZLOTZnWWxMbWVWNmxDQUJKNXZLOUVSeWlUSTFm?=
 =?utf-8?B?RzkwMXJCYXVZcGc4ZThpRUxENVhUWUplamQrRloxZkRSQUNSaE14ZkhEclVj?=
 =?utf-8?B?N1RwdVUxejRWTk9xbHBIWDl0K2NYZTI4WU1TeVVvUWpFaXc0VjlXMVl1TnN3?=
 =?utf-8?B?TGh1RmRTUWlzOTlQNVh0cGc4NmJadDFvRTFvd1IrSmNtdjdEQmd1dnpka0Yv?=
 =?utf-8?B?Mk9DOHZDTWxnVm5wKy9RQjZrZ3JTMTJBVUZQc2VnUW1hTFp4akw5T1ZQZGR0?=
 =?utf-8?B?SEZJQ0hYRElmbzM1OUpYZDNhdGRJWnY2aDVETnlzMGxaRDV0a2hXYmFJc1hr?=
 =?utf-8?B?VWxpaEpUb1JqdThVS0dCZGVUdVovYlBxQ1VJZ2JWWHZGUHYvSFdPbFpsZmdJ?=
 =?utf-8?B?MFNoUFpMdlV6VUtBdXkraFBtV0pETHZWU3RSRktXR3VOQmw1ak1FMTVxK3lI?=
 =?utf-8?B?MVhVdmNvVm5Pb1QrVVRXd1pUVnYxdlhkYy9WTU1xaFlodU9odXBQdFN0M1RW?=
 =?utf-8?B?cUdOT1JCQU1kVStpYVEvQmhOSkpxNkV1Q2hBbktGUXhERml2K0tKUnZzNTJ1?=
 =?utf-8?B?aEdTN01GRXJPTlZjbStLc0tVdXZyeE9wN3RObTEvS1F2N01TY3RuY1FqalVi?=
 =?utf-8?B?cTkrbG9SeWZOUDA5eDhqT3BVV09uSm42YzJxVWpqcXpYODVsNzFkK2RxUWN5?=
 =?utf-8?B?S0RHSCtpQ1BQbGhaaVNiVVZmN3RPWHNlTytJV3lHR2NJZFJKZlI1NklkUTht?=
 =?utf-8?B?L081NEd6TURiZG5SNkVoZ3VaNHd2TkpucXl4V04yVEZrODZIcGVKUWlkVDhj?=
 =?utf-8?B?aDVtOEMvVXZsYnB4cGdSMXM3MkRDY1NZRnE3NDZKcmNTWXVaNGk3TUlEbzNU?=
 =?utf-8?B?YS8wVzB4K0pVQnBPZVFUTkVLSVlGMlhkTCtROHBSV0tnWmhpWm9ZV05ROE5z?=
 =?utf-8?B?ZW1HQzU4SXcwL0FDSVdoNlorVng3d0ZrM3l1QTZIMEYwSCtLUS9FckgrRWFz?=
 =?utf-8?B?OGNvYVBtRndtR29jL0VYcWJ0RG1xUFNjVDlsTzdCT3ZidzZtVEVWYW1MRjho?=
 =?utf-8?B?ODltRERpZnFRUm5JeDlJTlVuWFlsYVpJK0ZOUzdwQkVjZnpLbG0rTUc1Nllj?=
 =?utf-8?B?SkF0R2Q3QWp5QkJFRnoxTExGWkEwdi80VzB6SnN1UHl6NG94UDdwck5EV3JO?=
 =?utf-8?B?amVZeFhhbXNYVEd4K0lFc3lJQ1lwRXhUOVZPVWU5aHBQajdDME1ZRlJmWkpj?=
 =?utf-8?B?NHE0T0xQeFNHcytnZmpnS0NnUnh5U2wzdlltZzFjNXRYUEZJTnFmeWFMTnBD?=
 =?utf-8?B?VDNBa2QwbWo1WmFqcUYwaTZZUXp1UCtLTTVxdHUrVmpwb3k5bFVzVzJPSEth?=
 =?utf-8?Q?knm/ok53/SG9NXoMm1f9NJG/ooNnkXP2kv5w9uUzn69Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1nWjVlZGtSQjZFeXdZLzJFVlh6d0FSSHRqSVB6cTJldXEycnQwdU9yYlpJ?=
 =?utf-8?B?UmhnTStwZ0owaGY3QTJ3Y3VkSUVOVE81Yk5FaW1NSFVyS0J0djVhUTd2MFIy?=
 =?utf-8?B?U3Y0ZXMzT0hQc1FxcE1SSG5YZ2gvVnBGNmZsNEw0NDg2eW0xemNnN0taRGoz?=
 =?utf-8?B?YUVCSlNCZkFFek01Q2NXS202MFRnbVpwVkdQb1Q4S2hnOUpNa09oQ0E5ZnhQ?=
 =?utf-8?B?M3N1SS9SMnE2OHZxNE41aUhGQUhhZDZSZmlkUmtmK1k3Y0lkSXVBeUwzYU5k?=
 =?utf-8?B?TmhIUC9TY3BOZDNMZ1plYkdNZi8zd1pTbi8rUzBPNU9DKzlQQ2FOQ2FmYUU1?=
 =?utf-8?B?Y01CWXFvdyszSlJPRVNJdDRONmdBOVkxaFc0N1lxeDZFMmxSZmZMNmFZMGRN?=
 =?utf-8?B?bytOb3dGazNabi9HbWV6OUlpK1Z0YXovenVIV3dLWG42QlJBRE9zcDcrdEtq?=
 =?utf-8?B?NkVrM0c4Qzk3bFN5YmZHQ25vZE5rME44TzRDUk5kVGtDTXZ5S3A3VEtmYnZi?=
 =?utf-8?B?NmlaakdERWh4RlZDQzJ0NzAzejZTOHNJV1RRNmRGSEszSlVmQmpJTkYxaUlO?=
 =?utf-8?B?OXljQ3BjT1dVTDdncVIzbGdDdjdtSndOWG9oVGtPSW80aHkzNkNvdzJ0WEZG?=
 =?utf-8?B?SGJlbVhpZ2tFeTUyZld6cDNqczRzQ0taWDc2ZEFDWTJmU2ZpVlNzaWphMCtP?=
 =?utf-8?B?YXhKd3A5VGZVRmQyTEI3VHJYZ1p4THRQN3FOWENqMitLbW0vS3Q1WCt0Tzlw?=
 =?utf-8?B?WWR2OGNRWHZNbUVTTVpyL1dZMU50RjNENUk3bUErWmYyWVZSWWpVbGxNTDdO?=
 =?utf-8?B?bHVEakp0Yi82MkFUSEF5eE9uUWdwL2VkWEpBUDhvZVB2djltSUthdHlFRW5n?=
 =?utf-8?B?c2h6RVZVZWVGV3dWdGF6SkNHL0hMeHdad1hQbHYzODBHRytXa1R2TDl4dEdL?=
 =?utf-8?B?S293KzNPVVAwSjR2M0oreVo1YkhaVVFrQjVxVmpjRnhOeW1WUElsY0V0UjZW?=
 =?utf-8?B?dlhMVEhpWXZJbnpIQTlneEl3QURjWU82YzlkcE9ocW5YVkRYc2xkelFQdHFH?=
 =?utf-8?B?RVBOdWg2SXJwencvaFdRNzdpdFAvUXN6R1FKZW1DUHJDZEgzbnF0SDd1THpD?=
 =?utf-8?B?VHdERldGTFZwRXJkbDNBK05URnhNaHRMQUZEUFZHazhYcmN3b09SVEZ0YWRD?=
 =?utf-8?B?eE5lanJYR1VqREIxRWJGK0RkQytMSzBtdGFHdFhlN2g4RUxKWCtoY0RmNUpJ?=
 =?utf-8?B?emdUck9CQncrMDRvdmdOeUZ1WklySG5LS0g4U0VMRVRtK3NuSjBGbHdwR0Qx?=
 =?utf-8?B?ek1yenRUQVJMUUlsRktpbk5qeDl6TmRxQ3pRUm8wMUwxQnRVQWlOLzVXUE5z?=
 =?utf-8?B?Nzcxa2kydi82QTNYVVA4VnZHaXRkWlpML2lvOUZvU25YK2RrMmNuanAya0th?=
 =?utf-8?B?c1JjSS9iL2tCV2VPWktmbDgzaU43ZWZ3bkNlaWpHN3l0M0Z5b1pBY2U2aDVn?=
 =?utf-8?B?N3pVTEVLNS9HMGdaczR3ekh3a01ZSVI1eG9zd3U1SVVHeUhRS09jaHhWWEtk?=
 =?utf-8?B?R0RaaEtmOVBTdEFmWS9HSXVOY2xmK0VHTnNOcjRzMk9NWWUwQnVXOGZxV3VY?=
 =?utf-8?B?UWxESlM0QmkxWkR0cDM4ZURFQUFCUy9uSzhIK2o1UEt4VEt3VERZZDNlUlhl?=
 =?utf-8?B?MlErR1N1N1hMQkp4WTlheGIwQkdlQnVKdGdjcWpTbkI3THFqaVQ1WkFOMllO?=
 =?utf-8?B?ZFdzNWF2R2Z2akE5ajJ1TC9GNDNqdyttYmlqZmd6ZHpHNlA5bWNVM3BzUXRo?=
 =?utf-8?B?M2JDQzZxUEc0TlVlRTNjY1JOSkMzWW1ZdUxFRTdUdTczKzhLVHBrcGNrVEpQ?=
 =?utf-8?B?RFNyZUVFYi9IOUJIbWE5YW05MklRQmYvdm9WaWVHRU1UQ3VnZEpGSHdJMksw?=
 =?utf-8?B?VW9ucklYS3JMV3g5RXNvNmw3ZkJyOTJLdUZsTmFMQU5SY3dEaFRBWXFXWEs5?=
 =?utf-8?B?RXZUNmptazkzenZKOGJOMjdEdzdOWmdVT0RKYnpMT01yT1U5TXdUVGdST2FW?=
 =?utf-8?B?TG1CTk9oL29yTDgwMHNYdytscGxuYmE3MitVTFJsM2xjMDdPTmE3TUxiRXRH?=
 =?utf-8?Q?Zh9j+vZSiIXi3gUPz9uhjnmr9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764bd8dc-3772-4788-e7cf-08dce8ecbe7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 05:31:08.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdwwJfmTaLhwaN1pWRcsW8s6xeLFtxoxZ6npW/PNTS1mRMFAyKcemQrlaFSKIu2szwY3WbJ3WzW0yXmtSWhiKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9199
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

On 10/09/2024, Marek Vasut wrote:
> On 10/8/24 12:07 PM, Isaac Scott wrote:
>> On Mon, 2024-10-07 at 20:06 +0200, Marek Vasut wrote:
>>> On 10/7/24 7:01 PM, Isaac Scott wrote:
>>>> Hi Marek,
>>>
>>> Hi,
>>>
>>>> On Sat, 2024-07-06 at 02:16 +0200, Marek Vasut wrote:
>>>>> On 6/24/24 11:19 AM, Alexander Stein wrote:
>>>>>> Am Freitag, 31. Mai 2024, 22:27:21 CEST schrieb Marek Vasut:
>>>>>>> In case an upstream bridge modified the required clock
>>>>>>> frequency
>>>>>>> in its .atomic_check callback by setting adjusted_mode.clock
>>>>>>> ,
>>>>>>> make sure that clock frequency is generated by the LCDIFv3
>>>>>>> block.
>>>>>>>
>>>>>>> This is useful e.g. when LCDIFv3 feeds DSIM which feeds
>>>>>>> TC358767
>>>>>>> with (e)DP output, where the TC358767 expects precise timing
>>>>>>> on
>>>>>>> its input side, the precise timing must be generated by the
>>>>>>> LCDIF.
>>>>>>>
>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>
>>>>>> With the other rc358767 patches in place, this does the trick.
>>>>>> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>
>>>>> I'll pick this up next week if there is no objection.
>>>>
>>>> Unfortunately, this has caused a regression that is present in
>>>> v6.12-
>>>> rc1 on the i.MX8MP PHYTEC Pollux using the
>>>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts. The
>>>> display is the edt,etml1010g3dra panel, as per the upstream dts. We
>>>> bisected to this commit, and reverting this change fixed the
>>>> screen.
>>>>
>>>> We then tried to retest this on top of v6.12-rc2, and found we also
>>>> had
>>>> to revert commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155 ("clk:
>>>> imx:
>>>> clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
>>>> alongside this. Reverting these two commits makes the display work
>>>> again at -rc2.
>>>>
>>>> Do you have any suggestions on anything we might be missing on our
>>>> end?
>>>> Please let me know if there's anything you'd like me to test as I'm
>>>> not
>>>> sure what the underlying fault was here.
>>> I believe what is going on is that the LCDIF cannot configure its
>>> upstream clock because something else is already using those clock
>>> and
>>> it set those clock to a specific frequency. LCDIF is now trying to
>>> configure those clock to match the LVDS panel, and it fails, so it
>>> tries
>>> to set some approximate clock and that is not good enough for the
>>> LVDS
>>> panel.
>>>
>>> Can you share dump of /sys/kernel/debug/clk/clk_summary on failing
>>> and
>>> working system ? You might see the difference around the "video"
>>> clock.
>>>
>>> (I have seen this behavior before, the fix was usually a matter of
>>> moving one of the LCDIFs to another upstream clock like PLL3, so it
>>> can
>>> pick well matching output clock instead of some horrid approximation
>>> which then drives the panel likely out of specification)
>>
>> Hi Marek,
>>
>> Please find attached the clk_summary for v6.12-rc2 before and after the
>> reversion (the one after the reversion is 6.12-rc2_summary_postfix).
> Thank you, this helped greatly.
> 
> I believe I know why it used to kind-of work for you, but I'm afraid this used to work by sheer chance and it does not really work correctly for the panel you use, even if the panel likely does show the correct content. But, there is a way to make it work properly for the panel you use.
> 
> First of all, the pixel clock never really matched the panel-simple.c pixel clock for the edt_etml1010g3dra_timing:
> 
> $ grep '\<media_disp2_pix\>' 6.12-rc2_summary_postfix
>   media_disp2_pix  1  1  0  74250000 ...
>                             ^^^^^^^^
> 
> $ grep -A 1 edt_etml1010g3dra_timing drivers/gpu/drm/panel/panel-simple.c
> static const struct display_timing edt_etml1010g3dra_timing = {
>         .pixelclock = { 66300000, 72400000, 78900000 },
>                                   ^^^^^^^^
> 
> The pixel clock are within tolerance, but there is a discrepancy 74250000 != 72400000 .
> 
> Since commit 94e6197dadc9 ("arm64: dts: imx8mp: Add LCDIF2 & LDB nodes") the IMX8MP_VIDEO_PLL1_OUT is set to a very specific frequency of 1039500000 Hz, which tidily divides by 2 to 519750000 Hz (which is your LVDS serializer frequency) and divides by 7 to 74250000 Hz which is your LCDIF pixel clock.
> 
> This Video PLL1 configuration since moved to &media_blk_ctrl {} , but it is still in the imx8mp.dtsi . Therefore, to make your panel work at the correct desired pixel clock frequency instead of some random one inherited from imx8mp.dtsi, add the following to the pollux DT, I believe that will fix the problem and is the correct fix:
> 
> &media_blk_ctrl {
>    // 506800000 = 72400000 * 7 (for single-link LVDS, this is enough)
>    // there is no need to multiply the clock by * 2
>    assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <500000000>, <506800000>;

This assigns "video_pll1" clock rate to 506.8MHz which is currently not
listed in imx_pll1443x_tbl[].

Does the below patch[1] fix the regression issue? It explicitly sets
the clock frequency of the panel timing to 74.25MHz.

[1] https://patchwork.freedesktop.org/patch/616905/?series=139266&rev=1

> };
> 
> Can you please test whether this works and the pixel clock are accurate in /sys/kernel/debug/clk/clk_summary ?
> 
> Now ... as for the LVDS serializer clock ... that is more complicated.
> 
> The LCDIF driver does its .atomic_enable first , configures the pixel clock (and the Video PLL now) and enables the clock. The LVDS LDB serializer driver does its .atomic_enable second and cannot reconfigure the clock anymore, the Video PLL is stuck at /7 rate set by LCDIF driver and won't budge because the clock are already enabled. I'm currently trying to figure out if this can be improved somehow, but I believe that would be material for next release.
> 

-- 
Regards,
Liu Ying

