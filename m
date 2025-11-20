Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF71C7254E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 07:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DBE10E6E3;
	Thu, 20 Nov 2025 06:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11022107.outbound.protection.outlook.com [52.101.126.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92FA10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1LDPHuisOQwfUlKEJgXuEAxIg4SKtDOczK68sW526LYJStnBdE47D0lrSouyjlle8iJ9rVCEEcNb5+ur2OWyTDa8SlR7HgtPrc4eaDMg5XkhbHK1aZUo9DfEdnMk3TVJhw2reio9W0Q8HML21ROZMkifvoqCf7/WB84MwOHFMElzpGQcxDaxQwtaOYLvNYwnOPey3cnCYaMalzklxfBDhrpq7/T0dZmccHkU2luw47I/6BXqOCgb+0Q5YXjNF/DbECUKQjFtkCWzBAFNdUdKeMGlP6VPvvRmLydYJOJSxdcLba5KcAgRU9xZI6siKRm6unFhLwdzTahvx81Om7odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA5WMccklP4Oq1396jW28CPeYFxHGqB433IHOa9uf18=;
 b=eujFLaMeeBSyWVjX88T+gcoC/1g+ZTbMeHaRPYBJG4qYUaH6UluJTca0Xb7yA6m+wNSpvKgIVFfzdoAI9ANI/Q/UpRNy2yLQ/VyT04mmSym0IjshVyDIEJ3/LQHfg8QYrTgq/+AFeYEhGJkrpyxgxPFf9XhvrIkNhslZ/P68AajpSjjYH/mBs/mos/h02hy1hakqDRtUIq1Y3S9ZevNSoFBeCBl4Tn4Chs9AL3FwmlUAIlnEKJRv23bMwqHSJNOMo2kWa/Ya48CgnvOJCX7pVY98k08zqzbfLc6NScsjZB70eIl3V9baj0tE/Ve/SP1INEgGOExfp2CSwdAQ/e4+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by TYZPR06MB7256.apcprd06.prod.outlook.com (2603:1096:405:ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Thu, 20 Nov
 2025 06:25:00 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:25:00 +0000
Message-ID: <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
Date: Thu, 20 Nov 2025 07:24:53 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::23) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|TYZPR06MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 71232807-e726-4898-3b9d-08de27fd887d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REtrMks2dDA3UEIvVzZZVTI2QlNEMGZHRlg5Y2ZIcjdEM2htdTBNbytkNWdh?=
 =?utf-8?B?NDE3RkFBNWovWWlqUTRXenFiRkpreHFqMEZvOHk1TWdCWG9RSHNTL1NJT3Iz?=
 =?utf-8?B?cVN0TE96VEdpSittL2o0V2lXQytYc29Xb2NPYTRTa2VoNGZUNS9zMmxxT0wx?=
 =?utf-8?B?eENuUUZjTHBGNHM4cjBsZzRDNVZ6anp2SFJWZ0IwVXFYdXVJMG5xMWI5SGxF?=
 =?utf-8?B?QU8xVzA4UFpiMlJMdEVOcTY5Wm50eHJZSk5JR3cxajMxcWdrUVF4aU1LZU1M?=
 =?utf-8?B?VndUc1VucHlUckJrc3lTZU83cHNZeHc2dUo0cnBmWUZEdFZhTmtQSXE1OUtt?=
 =?utf-8?B?UGhPVDlZTXFYL05rTU5yNEREdnVqWm1UcHZWRWdOSm9nWC9YVzk2MTFvcVpH?=
 =?utf-8?B?MFpyNUJKN0ZuV29jRCtEVG5kWlgzQVZzd1h3QW1KMEZuaC9PTWJmZ0s0NkZJ?=
 =?utf-8?B?UVlpN3BaQ2IxZjR3QWp2VUkwckJPVXEyV1lsTTMzUTIwRHNlcCtpWlpTQVAz?=
 =?utf-8?B?T3gyWVBLYnVqZUFHeWR6emJNQmpCcnpScXVUcTZoL0pueHhtSURtMWROd28z?=
 =?utf-8?B?QWRSVElpWkd3Z0N2QmtDV3BvODkxcEV2TDFTekZGOEgvR0xxOFFBbjFLSzIy?=
 =?utf-8?B?cUpNdFozM3FuZXZYMG1uaFJBSnBNNEdOa093SWxPM1Z4ZXhsV1RTR0NmRk1M?=
 =?utf-8?B?bjh0dUpwSEd6VTlMMWY4VDVKK1NxOWo3M1FxZFpyTjcwd0ROYkw1bUYzZHVX?=
 =?utf-8?B?WmNQSXlHdWFGdFkwOFdXRlF4bXU1TnFrQWgyWFpueDRFWVBRRjJpY3JJNmU0?=
 =?utf-8?B?VzJLU2xwMEhRdE9RQllTa0Z2TmVWaC9KVlQ4K0hnb3BQS3JmSGEyQm1RNjNW?=
 =?utf-8?B?UFdzbTZMdEs0VjYzekYyV1BsVWt6b05iaWo4VHdzVVMybmJZY2FTMlZkbG5O?=
 =?utf-8?B?Q1N2Y2JjSVhFZmhGTUNXTFZMY0o5aHAyZHNGZlBCRnlleGkvNkJPV2dUam5y?=
 =?utf-8?B?Z2NtdGlrc085dmdGblNJeSsvSW91ZnlJdkhsUkVLcUtDNVJuZFJoN2NqU1o1?=
 =?utf-8?B?R0RMNzNVdFMzVDRZenlQQUF0U0UzSGNmZnlrU1dUZURVcjRXNlUySFNtSHZM?=
 =?utf-8?B?cStSR2kyeSs0dUFPNWFQeERHTEZyYkpydWgzSzBxWk5hR04zVVdwYkFxR0Fa?=
 =?utf-8?B?TlFZUWlSMXE2UHJHQWM4Q0Q0NjMyeGV5ZzFWOFZIdis0Z0VnNWlRREdhNkZH?=
 =?utf-8?B?Q25JWjJ4TTZpcDYxQXZvc3ZGVFR0eGJyaUdwOEpVaUt1WEpwVU9XYzhDSUVT?=
 =?utf-8?B?Z01ZOURhVXltVlpHbTRhSFFldGhyREx5TE5sU2ZYajA3RDJoRTdGam9IdnVi?=
 =?utf-8?B?eXZoenhwZnB2VDlkM1Y1TE8rdStxOFlna2FVbTV2MjVSRVJ6V3FRVDk5TXNR?=
 =?utf-8?B?d2V5SHRHM3FJUWczcDQyNkRUMjY3ZStjb2NQcWJYY0EvMXd5aXkvOUhQYVR6?=
 =?utf-8?B?SlEzNS9yWUZhQnhSaG1yUE03dHQ3OElCWWs2Y3UxY21pLzEyeWhYRi94T2d0?=
 =?utf-8?B?SE5lNlMyYW9MMnFEVFgvaW5tVy9sVzNmcGhZdUZ2aTVTTHRQLzNVUE1RWis0?=
 =?utf-8?B?NlF0WUJyay9FU3pndDV2WDVFQWM3TGw5c1F1N1V6QUpESWhVSlhyNG93WWZY?=
 =?utf-8?B?K3dYY1RPZTNVQVBzVVM3SkpCQllJOGFMYUJaK1ZuVTcwVzhmRzBXeFkzcks1?=
 =?utf-8?B?TDFoZWhjb0JrZldkQ1JDS2ZFS2dHM0pYWlRiRzNuU3VJM0xHV3BIRm9TQnN4?=
 =?utf-8?B?dm5Jd2lsOExnSngraVJDYWczdUV1TStvU2MzaldvUVAraFlSOXBrTng3dVlD?=
 =?utf-8?B?dDdCVnNUOVJSdk12WUd2YlhlemxWYlZTdnZudm45OWdZK291Z28wR0QxTkdG?=
 =?utf-8?B?MFV2ZVVlaUtmQzE5S3lvank3N2NLbEt6ZllYVXQ3K2dicE9QdjFOaTdrTWM5?=
 =?utf-8?Q?n0wR0FQKZJONLO/ZkrQXcBXj1C9Ur4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVTbEdKQXhFeTJ0RkNYTTF3WHlxZW02TGxhUmNtdDFWOE5rNWhCK0Z6ZHAw?=
 =?utf-8?B?eHlpb0FxVEpzTVduOFJIM0dmb1pRdzlBbHo5V1IwdTMvMWVjK2EyclcxWmtL?=
 =?utf-8?B?dWFKS3drK1A1YUJLSURBRW5DWWtSL0dXbExBSDN1MzE4OEhkWmVIam94dG1O?=
 =?utf-8?B?VUdDTWpldnJSL0dsWmdQWmMzTEV3QytDTU1CZ0orS0FGdkhzRGhCQU03OFZO?=
 =?utf-8?B?aDFqbStWTk0wZjNkeFJ6bUxMYi92VE93RE9VbGcwT0J3RXUrVXZSU1laR2ly?=
 =?utf-8?B?YytjMWhBTmh6b1BpWjQ3OEtuM1VtUFFwMjUwZFF3aWlWME16VzBiUjRLcCt5?=
 =?utf-8?B?Z1dNSUdyTUwzWC93Sjg2RzlIMmprWmZ2OVgyWS9Kem5lQzRZVGFKbFFJZWZC?=
 =?utf-8?B?b1pscTgyR0pqOVhTZWJTVXhvZlhYSWxTZEtrYWJWaDlrb2czTjIxNFJPRkpM?=
 =?utf-8?B?SDVjMUo3VSszbXZhU3pwc2JTZUdxNk04VmdhcU9xZE8zdysrRStLQWFzM242?=
 =?utf-8?B?Z0trT1ZOeE5HZjVsNnlBRk1nRGM4czRtdWdXdmNodVZNa0dzaS9aMzJ0N3BP?=
 =?utf-8?B?Z0E3a3hkbGFBUzRneWNCOFBUSXFlWnRoYmZvVmZ5dXQ2Qmp2UjJZTHZhZmV5?=
 =?utf-8?B?cFJwK2hEejBTa0Z6b2g1aHM5ZmYxeWM2TTVwMWlUb05jc3BTRVI2RHNqY0ZQ?=
 =?utf-8?B?M2JSdWJXbFJHUVZkTkRzR0l3dndOZDVNdEs4aVNpYWlNZW03UHRYc29vajVl?=
 =?utf-8?B?MHVZa0F4UzJKZm81ZXFPUTJqOWc4OFZCWTgzdDNySVFVeUNoMXVzWjlBNG9B?=
 =?utf-8?B?OVZMMEJyaC9NdnFyOWtaclZOWnJSZkErOGdBUzIyZmU5UjBNQWduUVZpUHZa?=
 =?utf-8?B?Mk5kbGQwYW9wcUJ6TEV6bmM1QjBybnQyUldmN0ZWbUd4NXFtZ2lLNnEzblla?=
 =?utf-8?B?bWFUSFV2MkpIdlZHd0pPY3R5QjFEOUlmR200em16a2llRDMvUm4zQnpWdE1W?=
 =?utf-8?B?UU1qS01uNjc0VDZFRGYvdUtNUWZtZkZCTzRuSkFGZExraXZUQ0xTSFh3R1pR?=
 =?utf-8?B?MkxGaWVtMHJ0eFVaNk1Yay9ZNkZpNjB6enNSSzZrQjBKVThneG9qSFFqNzA0?=
 =?utf-8?B?Nmx4VWlzRVRia1d4eVRRM0JsUDFOUit0czZGT01obmYvN2Y1ZFphZkdDK3hX?=
 =?utf-8?B?alJFbmxpc3l2b3R5VnNxQlg0Wk5FLy9GM0IxQ211SFFkSmZoUmlPUFQyOHNp?=
 =?utf-8?B?NDl2UHduTUhDczF6STR6VjJiWkJoZ1F5QnBVcDNWQjY5aUwyc1lEMCs5b0dZ?=
 =?utf-8?B?RmZuMGRFR29iS0VyczZzQjJxNkZ5bkRBZnQ1NCs5d2xIa3JxSURrMXF5bmJn?=
 =?utf-8?B?RDI4SXhpZ2FHTjV5UkNYMW0vK0djWm9nOXRjUFhDVDE4djNDdS9sd0FiUGtX?=
 =?utf-8?B?QzY3ZXNBdjZsd0IxRmp1QUVSL0ltTnZ1YTN4WnhjTklaVE9xYko4Qk5QUGEw?=
 =?utf-8?B?b0ZYSG1JY253VllWSkd1emhOMi82WlVuY2ZBTy9OeElDM3JkcDg1K2R3M3I3?=
 =?utf-8?B?Q1RJZnFjUkZYZUMvbVpJZkNHUXNPeGl0N3Y1MEdiMHNKakVFM0NqMlNRaUkv?=
 =?utf-8?B?SUkzcS9Ua2ovNVVsV2xialNPeFV6TU8yQUw1VUJ4WFBwekpOVzExU1F0MEZz?=
 =?utf-8?B?b3Z3ZEM4eFZQRVVxNFdZUGtMZnlyU3oxaVM0VjFuN3hlOFRrSGxqQnNBZVox?=
 =?utf-8?B?VjgvelpLOTVROGd3M2VlUWN5UkRlai9kYnRWVGQ1OXpJTXlCeHZKNDltWGcx?=
 =?utf-8?B?V0l3cTgzME9CQVZXVmRoWlI1WnFKMVYyMTd4SE1QWkZlU3JCWmVueExXSUxU?=
 =?utf-8?B?cTdNQzEvS1JFazY5Sk5scERCNWNMOEUwa3puR1lFRDBFS0pBUENYd3EyT1lz?=
 =?utf-8?B?aFBSKytoMnRVNlFyYlI0MHJMdDI3QnhmVm1SVGp1TDNKR0dTVUpUYmY5QUhH?=
 =?utf-8?B?ekY3YjB1eS90WlRNVlFuN0tWWENDdFpoMFYvZ0xSMmRMYmpibmo4SE43NmVM?=
 =?utf-8?B?bVl0UVp0S0t3NkFOOVdtMjdBVWtJNVc4SU9Nb25LRHJQZEJnMXh0WnVVODFK?=
 =?utf-8?B?WFJCcWcwemYxaDlFWFZMaUdBY1dNWHk2a25vQVcxQklEalBFdUtrdVo4Nml5?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71232807-e726-4898-3b9d-08de27fd887d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:25:00.6557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SswwvN4CwjBVrd+FIH/za239jEeZmg43AHobNLG3xNwo8T1bM3gyAdujajjC+z0LNerSYJElB/R2pdX2p7Xgnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7256
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

Dear Kuba,

Thanks for your efforts.

On 11/16/25 2:47 PM, Kuba Szczodrzyński wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0.
> 
> In this mode, the DSI peripheral is not used and the PHY is not
> configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
> enable LVDS operation.
> 
> Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.
> 
> Also change the SUN50I_COMBO_PHY_REG1 macro names to reflect the correct
> register name.
> 
> Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
> ---
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 70 ++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 2 deletions(-)

I tried integrating your changes in A133 display pipeline and I couldn't get the LVDS working.
Am still narrowing down what is missing in your patch. Driver registration is success and I
can see /dev/fb0 as well. But nothing on the display itself.

But with below changes from my patch,

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab95271b2..d164b2ea5dfd 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -314,13 +314,11 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
        /* Disable sigma-delta modulation. */
        regmap_write(dphy->regs, SUN50I_DPHY_PLL_REG2, 0);
 
-       regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
-                          SUN6I_DPHY_ANA4_REG_EN_MIPI,
-                          SUN6I_DPHY_ANA4_REG_EN_MIPI);
-
        regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+                          SUN50I_COMBO_PHY_REG0_EN_LVDS |
                           SUN50I_COMBO_PHY_REG0_EN_MIPI |
                           SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
+                          SUN50I_COMBO_PHY_REG0_EN_LVDS |
                           SUN50I_COMBO_PHY_REG0_EN_MIPI |
                           SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
 
@@ -528,6 +526,22 @@ static int sun6i_dphy_exit(struct phy *phy)
        return 0;
 }

LVDS works fine.

Could you please share the diff of your dts / dtsi?

Thanks,
Parthiban
