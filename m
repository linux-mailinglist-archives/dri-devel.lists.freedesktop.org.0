Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278CBD735E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 05:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569B10E129;
	Tue, 14 Oct 2025 03:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hBTb01cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011014.outbound.protection.outlook.com
 [40.107.130.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA1D10E129
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 03:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGt4uSfXCrThrOt5KDqmJ/CTVN5kPLd9JvQK7du2H2MvFKiSXQbyqiAB1KuANHocjroSObVdB5JuZ9VxgDIXye793rQ7pS9nEXPB+P3F8Sbf+U6hJzU9QB8GieBpOoRQRyKoFlX7d9pXcSCns7bwuYakvZYZ6cVNNhl4nmiVyUJwh/6aZqOhfzYxG55MC4kU2/mGBuanYDjhIgeALr98tmWhrqEKwivUQdPXhKPqgePQwXXwMFt0zhGLqqL6MOsbVvLRbCpepuzdxosXHaKyqayOSsq3Cz0SVnQFF+FCo+iAA478XBkGMvEo/+h68GVHo+xM8VhAtZU67p4ZPyR/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85w3OvvTFE8wa2dpTDYlqbebjbN1qOt3fEFsjt7sGa4=;
 b=eyggfoGLKe3gzhfL2aIQ04318qQZzIWB7wpKXsGLJz1yZdzPKGk/Abts+wCebxMP2WqDnrVgn98AhIj5jAMe0+XPSt+NNRay5rKJIG6B/FLPdKWQllGqUE/Ku7m2YZXdqwUY19H04Ao5mIDGUMlh3Ad0Jca6ZTcGYvyOL5GAkxP4aUyQbqNxIaqV9HYY3YuLTEsw60EF9bbKcAiqRy0hWSbpbZCG6gIL79zRtpWgrruBAcHh28ooh8p1IkpnNG1IVtbzA5Qvk12mBXkdP13tZSkehPfkqhGjXUgCb+/5buDNi4u/7HBkg3Jw7JSxW3XJg46v/AK0S9WJ+q3g6SwSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85w3OvvTFE8wa2dpTDYlqbebjbN1qOt3fEFsjt7sGa4=;
 b=hBTb01cvbuVdbsxV9o3wtxZQnDb34QLZV0IMAUjvW+YDUoWMyc05kc+WA6IUCSJ/GLFeWesrhn4C1j4Tniotwn0Azkz4jl5Jl3QrOr2Y8fPF/l3GOjT6KFiCwCEFt8H/mZsliTTg0XyCwounKwl53UYMfsF5uSY34ZXG61tPLTAyigRORKfZajeIP4U11YQx9SSR/caOUqfg2VkMuGgBEroMhLREnYTLkTh87aFVYXo51vSsd4BBAJnYcZ9qw7Wl+0IjRAGgWmvEN+O+o6DVTx9/sx6nC7UUih9KEtJx5HmpuG/CVt+gAWkIRQygLbvF10Up7LPSPdKT1K7vVaZWkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11867.eurprd04.prod.outlook.com (2603:10a6:800:31e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 03:55:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:55:37 +0000
Message-ID: <239e8b99-0416-4708-9548-043d56ac88d2@nxp.com>
Date: Tue, 14 Oct 2025 11:55:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
To: Fabio Estevam <festevam@gmail.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
 <20251013205155.1187947-2-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251013205155.1187947-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11867:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b40c93-411d-40b4-f172-08de0ad588b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZrNFJNM3dleFVjeGkvUnBIZ0xMK2xFOGJKUUg2QS9Od2tqVlB3bi9qc1Vj?=
 =?utf-8?B?bUlSckNZUnA0Q0xaS1BaQ29pdlFnSTRUUU5VZnBsRDQyaXBEdUptZlhmblY0?=
 =?utf-8?B?WG1YU3hqY0c2ak9hU2lFN0RGbDM2ZVVCanNDZDdmMXh0T3VlYzRXVzF0cEFL?=
 =?utf-8?B?YzkyK2RvYWdOZlZDc21ENGdZMjM2dmRuajVkNnl0YXlwY1AvNHNySnVpYmFy?=
 =?utf-8?B?MDdTN2hBd29EWE1ENlgxNk1JN0hFS29veG5pZVIxdU1pMnRFbHFrbVVJMy8r?=
 =?utf-8?B?NkJhQlFhR0FpUUtteHZLVC9pNUdiaGJlZlRaN0gxejdIazdRTldCdWJQREk1?=
 =?utf-8?B?NHYxVmR1N0hTS0NyZlpBV1cvQ3VoSDk5V1ExNFl1bE5YM0ZrWGdoSi91cTJJ?=
 =?utf-8?B?MEt5eTlHenBWN3NKeFJFZTNxRGdUa1p4RWZSdUNyMUp3OUNraTRrUWtzbEsw?=
 =?utf-8?B?MlJvMWxwdW1CRCtJTVNNdCtNL3dYa0tVV0FsQzVENlk0OW5iUENyQ2ZRZVlz?=
 =?utf-8?B?aXNwbTV0ajlPVzR3akpHVDNWZnhyWkMxRDdMWk9rMTBvU2I5b3o3SmMrbG5P?=
 =?utf-8?B?OWxYeTdiby81NWYzUDBqckNDV0dKMHhOYTdzS0RmUlBkL29HeThJcjdkTThq?=
 =?utf-8?B?ekJhWXBZYXlYc3c0b0hHUlp0WTgyWTAxTmNma1l3dWtTRUdRMThOL25acXE0?=
 =?utf-8?B?aHBRMktVa0ZQd2FtT0ptT0pzZGwxbHZsOWxwMlUxRG0rcHRoTDEzZ0ZldkdB?=
 =?utf-8?B?ZXZNNjd2ZVV5aXJYYXBtSkJxZG5kakVDVG96VzZEV3JNUGZwSHlMNHRiWDd4?=
 =?utf-8?B?R0wxLy82UlVmZDFtb1dMUVhjYWpWVk5Ndm1SUVU4cndwSmlXdzA5K25Eb0hY?=
 =?utf-8?B?YUtvM0RRTW0zZTUxSmNnM3VSMzVGa2I5cWsxd2VSNXRJMkdNbXBOMnU4eFZU?=
 =?utf-8?B?UHpLd2Z6MitiaUlQWGg3dG9iUGgrWFJXTTdZME5xbW5KdVBNeGwwdDhJbENs?=
 =?utf-8?B?RmtBY3EyTEFnLzhvcGw0Vkp2NXZEQlhHcEdnQUhZaHFKY2k0Q3lOSkh5SFE3?=
 =?utf-8?B?alZnQUkyeVNDa21CSEVBWkRXNnFMYkNQWWg4clpQd3htYTNBYmNwQU1zekg4?=
 =?utf-8?B?WnNqaWVINmliaWJnWmNTOHBLaTZKRDZ2N2dkSGNKVUlrWnZkNHRqVkorR0tF?=
 =?utf-8?B?V2hIKzlUU2RGUVZrakNIZDE2YktCQmUvanJlVW41TjRGSkhNU1FJN0FOVmcx?=
 =?utf-8?B?dG5QMEY0aS9XMFczMkMreWJ2SjRPZmVQUXFoeVNTY1dta1FvK3hYWTZRMTNL?=
 =?utf-8?B?dldhYm1XdTc5RkN5OEV0d2hsTklxczMwNis4c3g3TWlleEVvUzhPa3dKTVdP?=
 =?utf-8?B?U0JnQzBtckhreTN0bFBkbEVEUG4vVkRVWHkyT204Mk5TK010RFVxTVlqK3Z3?=
 =?utf-8?B?U3ZTbnpwOXlUNVc0K1NTTzhlOEVreHpoVFZPYXFPRGJGRHduT2NNbDU5ZUcw?=
 =?utf-8?B?cVozQmcvYXB5MHhEUWV4S2d0KzNvSU92Mnp3YnlLY1lHZmdEWnE4T2EvNXRF?=
 =?utf-8?B?MUR2aDVCeE8yUDFvbGRVUmEzQUlOSVBPSVFEaFl0dHRrdmlCeXVqbktFWmFL?=
 =?utf-8?B?b3d4bVd5UUIvNTh1d2Y2V1BITE9JNTk0QkhUazIrZ2w2QVBIdWVyWExtTVRP?=
 =?utf-8?B?WmgrQlVDQkt2UEtLc0wxczJWeDhjNHpwYmovRiswdTVaVHpuS2VsRDFDNWVj?=
 =?utf-8?B?RkthY1ppcVJtdlgrTzA4NnFKUyt5RVd2M0dsVHNlcXhGSjNQcDlJZ3BDZUlQ?=
 =?utf-8?B?RVVSdTJBWXpHRHJ2VEJnajl4NmJqU2s3NkQrR0c1QXJxTVJMcmRrMFVGT1Q5?=
 =?utf-8?B?RnQyMFNnSnp4QXJrRzNEVEt5YjBkMkc0Y2ZYNERHeTN2RkJJaHRUVzFURmJr?=
 =?utf-8?Q?S8sYWLpemoyuJ5KXafZ/2funPxxDhMDr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi9hZkxxNVN4V0ZrL09GR3Q1bDZDRVRxS2lMclVBbVdUY3l6L3B5NENUd3RW?=
 =?utf-8?B?cER6eVhTME5mSnNmZG5ucklKTFVjM0JwS2liOW5mM0dqVWtEblFhdDJYQnpF?=
 =?utf-8?B?V1ozNm94dUV6T3M0bVBoM2VuaHdNc2V2RnZGaUdKOGZvZSszL1dhVHdBZnhx?=
 =?utf-8?B?ZnQ0aFprUzVsTENUS1JrS3N6bTMxNG41bHptZElmZEg4T3hyQit4cjZQMk5H?=
 =?utf-8?B?WlVMN0pxQWkweWpYa08yVHlsUHNpeFhpZ2NmcmlyOUdsYTE2NFhMZDFYRzJO?=
 =?utf-8?B?eTZkR0k0YnN5VmwyMDFiZFhZZjJ1T3FsR2N1NFhMd3cxZU15enJTa1dKdDhl?=
 =?utf-8?B?OUhQdHp1dFRRejd6ckgzN295ajlvUlhYVDMrTDZmTGxWYUYvRkhlN0tYMnZ0?=
 =?utf-8?B?MU40bkVNeTRlelAzcU1yTEdQZ0w2STNka0FqSDkreVJaTTdmQmozSUN6RHFD?=
 =?utf-8?B?eWZtYmF5cjFBUW5XdkoycGc4eVNQblhBb3pwcXB6U2IrVmFJR0k5eEk3TkFu?=
 =?utf-8?B?eVZyVEhMazlwbjdBdUp0Y0N4eDlTbm9vd1RaMGMzMVVTemVJM3pSbXVFaDBt?=
 =?utf-8?B?UHcvRWwyZFJqWnRUcDVLNndOZk45NnlSODNBZ0dadUlRUkNPeTFiQy9OWi9v?=
 =?utf-8?B?aU5IbmZab2tpVmNlMm9LaFVNVHJWUmx6eTVoRDk2NVpjUmQ4S1JwamZHUURD?=
 =?utf-8?B?eFRDeDJZV2Z2anBuMkU1bTd5MXJPWk92RmpRUUNtSm9mNURKRE90T24waGRz?=
 =?utf-8?B?RTZLTFA3TGZoNkxFZzFwWjVyem5mUjlRczN6K1c3TmdhVGtET1I3RWE0VVpC?=
 =?utf-8?B?OTFxVHU5NHM2R0VJNHdPMENBWi80STc0VUpzS1pUT0Z5c2dRZWVvR2lSQngy?=
 =?utf-8?B?TDRYdjZOcUtyVzVraWc3LzlyQUprWkZyTytoU1MrcE5UNnFRRzlnalFNMEtW?=
 =?utf-8?B?elpJK0k2K3d2UXNwNUlreDcyQUwxQVFmdzFHcG0rSkFpandjVHNnYW9QQ0R3?=
 =?utf-8?B?SWpwRmhoY3VBcVZhTjJXRXhJZjJaaEY1VWc5dldhT2xYd1ZIQkhEZjcxWHZa?=
 =?utf-8?B?NFJ2R1hWeWxBVVZidzUrOGt4ZXdGc1RlRi9DOWVFdFdmc2VoRlB4YklmVVJW?=
 =?utf-8?B?c291cFNvaTdpbTBUUmpWRzFuSThYNDlJc3laOVhzcnFYWmV4bVFUOUh4MFlw?=
 =?utf-8?B?NUNrVTlvRVNqZDdYV28xVjJiSERoVmdXeXp1eU95NjVldllOUHBXUmdhMHNG?=
 =?utf-8?B?OWJVQVRqK2k4NDd4cHQ3eENLbEhQWlBRNkJYcU00cjNhNzNCbmpRZlA4cHIw?=
 =?utf-8?B?TUhwampnT0w1enFlMmJuQUlpeUxPd3JaWVhEdHhxUHJjemdXM21LbGIrWlg0?=
 =?utf-8?B?a0JCVzJ1eWdnb2wyU0JWTFlhY0dwRUdWdnB5emNEOEV1RWtlQVJYNldnZmtt?=
 =?utf-8?B?Q1Zvb0x4aUg1a3Fuc2FVbzBQUmhteFdzK0kzNGMyV0RoUVJOQ0d4L3RBNHZ0?=
 =?utf-8?B?SWJaNmdnSjI3SnROZzBPM3I0czNER0RrRXlYTTlRVjZ4c3lsK0tIRk51U0c2?=
 =?utf-8?B?QmhHeUwvcUlEZ3htRmZJQ0s1NUZNeGZGV2RLTnJoallDWGQ4L2g2OXVsc3lD?=
 =?utf-8?B?U3poT09Fd3BQd29UZGdnc3FKSzZYR1lWN0RObDdZS3h5U2hibjc2aEcyaUlo?=
 =?utf-8?B?Y3NDRUs4VEtobnJtVjR3SmlqQmt5ZHpNV2JoR0xIS1pRaXhaMVdRbnVGbHlt?=
 =?utf-8?B?eFlXaTBSWjlGS2dwYkpHQWdOWS9Gc3hWaDVzY1ppZVQ3QWJ6cHNrODVnbkZT?=
 =?utf-8?B?ZitpSlJrMHVoMXJSdUhVWk5iV09BeDBzd1dzYnlxcW1tWU55WkE1N3N3TWNw?=
 =?utf-8?B?NWI4dy9uQXE3ZzhzRzhFbklXdmoxR2R6OW9FWlpjUVd4YmRtQ0d4bXRQZnc5?=
 =?utf-8?B?TXdDMzRWQmxheDZHUE1hWHhZc1g5azc0WG5xd1NMb0RBMVltZmoxRkJQRzFZ?=
 =?utf-8?B?aWswUTVXd29YK1NwUzFsZ1kwSWhLci80ajhBd3E5Rlp3S2hCNWJzMEJIdDlX?=
 =?utf-8?B?dzRHR3lwZmJXR3laTTJsY1V4QXVYRDA4YSs3ZC9NaE9Fb3F2djQ2dmhEeE9l?=
 =?utf-8?Q?TcyGQz2/ZiFJ5IndtiQI716ho?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b40c93-411d-40b4-f172-08de0ad588b9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 03:55:37.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1/PIIwFxGG3xG04vTdcc64VV8cKN5eh+hPpGnPepzonxILOPaJ4kazPBBoNsP11GKavYgAFohuI/b+GW1jaLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11867
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

On 10/13/2025, Fabio Estevam wrote:
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.

Sorry for the late comment, but the LCDIF chapter in i.MX28 TRM contains
the CRC register too, though I agree that i.MX6SX LCDIF supports overlay
plane while i.MX28 LCDIF doesn't.

> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

Looking at i.MX6SL TRM, I don't find any register to control overlay plane
in LCDIF chapter, so I don't think i.MX6SL LCDIF supports overlay plane
like i.MX6SX LCDIF does.  So, why not make the DT binding allow
"compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";" instead?

I'm assuming i.MX6SL LCDIF and i.MX6SLL LCDIF are exactly the same.

> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index ce31b873fb95..d665f3241e97 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -23,14 +23,18 @@ properties:
>            - fsl,imx93-lcdif
>        - items:
>            - enum:
> -              - fsl,imx6sl-lcdif
> -              - fsl,imx6sll-lcdif
>                - fsl,imx6ul-lcdif
>                - fsl,imx7d-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
>        - items:
>            - enum:
>                - fsl,imx6sx-lcdif


-- 
Regards,
Liu Ying
