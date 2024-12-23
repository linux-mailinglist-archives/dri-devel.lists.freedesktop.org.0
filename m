Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D69FAC30
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 10:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3507389A94;
	Mon, 23 Dec 2024 09:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VeZfXWrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009A889A94
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 09:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcFhWLHbz8Yo8KlECzEqdOOgPy+DRpPkdhZGiQ91vf15I2WRCq1Xoua2dHfXhTh7eAE2UQa+yPlVJhwRcly68vcyI0F8nFM2Neq4P2EWAdc7InkpbeIjQOgPRC5qAjLNtOkX8sF478t2ZwEPzm1WSRgxuOwzKjdJbt5GEtO12FLB4vdrogSOgRRmdoAJ5d0YFaGsVjEsjBZjJ8BbTRgsPJu+H7wyyIwAYOs9sGajB+233KZYiVcFWWop933pexMlqP7YzCMqrTxad7wA42wLl8XN2EpDtZzNKZremRlpmyK1wqwdPArTvLl6Ua9fNFzV6Y20xP5KbDi87g0nPtWmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+50sykejJR2/QI1Pdt/GIavQIxXWYoyIU66UBXj3II=;
 b=pTsp5eTgukr0flaN4i+v76PTz8LdaDCm/AazyZ/WkaHZI9b02u6cZijFAhWW6OgXXdEcZY9RmyEQc6yJcSTEOfrE7LIKJARZ6TC7cVxNr50pJdsZKHwnV9RNBjSasgeeeE7LUl6zEkr0Hv7oWXCO82JcdpVfOHNmUVC9a+gUnK8kz8RrlAsWL5KIkEFzMXhcQaJnhxzCsqk6Fcg2f0YyFFHE0u6SiSZZuqnJQpmKQepD9/x3OFjQ0jSjpb/DMVZuaiJhv6xE/u4/NTV+njhLKzC7fsmZZe13CbxbQRisMm20IlUDZIU8kId34RK3sf11lUMsaB5RRcLpHpiistg4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+50sykejJR2/QI1Pdt/GIavQIxXWYoyIU66UBXj3II=;
 b=VeZfXWrFOznvpy0u4KK42bfHHV5JGCPQeuJhUJ+BEn1xCCjBQCFjQwKsYiWE1S+zGdT1/v4pCBBkzx8S4PZ+oKpP6lPSqQesY5MV8gK6AR1YlydDoEdX7EYXrx7ApNqyE2+8gkbyH5PkjB6TlmuHdfN4dIWNREbrg6TbyxxnWumXOv4QwjY2aB3fQVEUMbnhkZTbKGcPkGy3zNvKqwcZzdxRRcHy+w/Jakm9f/dqQ3R7SncuhmFet/ciis5WeZchZEscoQeKizkeCApK/5BJ+ZicwfgSwNUvNaKzspN5Ti1Z4eAt1GEEShEl0pKjT8JQEJGTWP2pb81jWFLaHm2EOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 09:43:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 09:43:43 +0000
Message-ID: <99f7d24a-a465-4082-829b-1978d012ee2a@oss.nxp.com>
Date: Mon, 23 Dec 2024 17:44:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com, miquel.raynal@bootlin.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <000b34cdd1591c82265ce1f9848828d1@vosn.de>
 <2c950130-84b4-4a81-84a2-b5e08af43616@oss.nxp.com>
 <204150e1b99053f97a1a3e042d5e7cf9@vosn.de>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <204150e1b99053f97a1a3e042d5e7cf9@vosn.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 03543f1c-e0b0-479a-ca2d-08dd2336499e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVVMVTJqV3AzN3pCKzNQV1FNd2xvd1YrKzEzYmpuaGkvaHR5ZDRNVVBzbE40?=
 =?utf-8?B?YXNueTEycVNCZkhzSnp6emRlZlFwU3ZRZEZFbVh1VzQ2dmlPL3ZxTkd0NGp6?=
 =?utf-8?B?eXBMeE5FUFNHYjlURnVWMDFTVDVNOU5scjNKa1Yxei83UzdSYm15eHV2N0Jr?=
 =?utf-8?B?SFNpSnNtbEdtYjRLSUlzelJDVGxIdlBSTU5EcUcyTXMyNkJ1a0ttNGIwYUNY?=
 =?utf-8?B?TEZFelhjdDMxRDBkVTFPVXZYbVliSnhjSHNqM0Q4N3ZkdVdOY3RiOStmbHM1?=
 =?utf-8?B?UXh3eE56cjFjdHdIc2VGZWJnQng4OCtJQVRxcytnQkVXWHk2d0ZOZ2phQU9S?=
 =?utf-8?B?UTZkK1NZMVpiTm5HdkRvM3hTdkhIZjNpd2x3b3hYUzhzSnRaVVF6OTR0OFZC?=
 =?utf-8?B?YnRhdUJwUHZmY2JMTWJ0N1hHemRJbmNDaXpIQm1SdkRDUjE5eVVoTmFOV1Rs?=
 =?utf-8?B?c1VaMkZtYVRzcTdLWHp2eUc2akN2KzhxM1hSbVRRWC9CQkdXMFMrV2VKaFpG?=
 =?utf-8?B?citxdHhuM05kaHI0ekxQNzBPUlhmRUgzT25Fd2RqbGFYdmlWejdnTlQ0QTZ1?=
 =?utf-8?B?anNTZXZGTDFsSEVJNk44d25wZXZQelVjZWM2WVU4NWRmNmVKRWtlTWdINHph?=
 =?utf-8?B?NzhHV0Q1NVJzQ3dySmRjaUxoanJGdVRWMDM4bVpINnMzQTRtM0hmT1J3YnpG?=
 =?utf-8?B?aVI5dWFtR3NvUzFEd01nTFZQbVBoVGVvN3J6cDFNL3FoZE0rOC93T1RRTzI5?=
 =?utf-8?B?YlZWTDQxVHAzZXBNMk84amFFQVR3cXlnallEMmF4SlczMmZBVlVIY0xMRmd1?=
 =?utf-8?B?cGtjZDc1RmRIaFJiZXM1TWVFSk5waHFyV3BiWGEyNlkyS1pyQVp5ejk1ZEhC?=
 =?utf-8?B?M2h5RTIvQzFSR3A3WDl3Z0xhZkZ5aXF6eWdtM3E3TkozYnBPYURkZ1QreXhP?=
 =?utf-8?B?SFFsbm5XT0VLcGlaQWwxd0Q2MnF3VjZ3MHhsMFR1VFJTVVVPNlk4WHRxNGU2?=
 =?utf-8?B?UFpxMkNvSi9pU29JbThqK2Y2WStmWC9NelFGZS9qMmk5bVZVOUZGaEpNMmF3?=
 =?utf-8?B?ZWhEQm84bTdpekhqZCtKVHd4d0dyWEZIS0RlcW5VMG5mRUxWcHZWNHVuKzND?=
 =?utf-8?B?ZktaMlQ5YldyQU4xLzI3NnVGZ2h0SUdLeC9XYVFCVEVIV0FEc2NyNVV1cDFH?=
 =?utf-8?B?QVBRU3p4WXdoelUzUFlrWDVaclNkUHhValF0ODY4UU82M0JCTWVsQXZQQmI1?=
 =?utf-8?B?RDdZRFRqaUtqcE92K0ZGMmVMYzZ3cCtpVHRmc0cwTXNsNVNYMDVTREdkV2VO?=
 =?utf-8?B?MWNTaFYrZWtjdWdUWEZzTURkSHRwcXppQWtPYzJjNGt5V0JVcHJOaUdCMFUy?=
 =?utf-8?B?RGxHOXpVZnRGeFNoYTQ0cFdvTXpOMjB4ZktmRnZjdTNUTEhPOVNXL00rN3FR?=
 =?utf-8?B?dzNQTTN3RXloWVMrZHBLRUx1ZGhsQ2pnSk9Ta1hmd3BXMmdHZnZCNmNRVU9T?=
 =?utf-8?B?bDNxQUdhRHdwbXVaNDU0OHQ3YXZ2d3NsdUtPLzl6NWdHcXpjYnArd0V4RFJW?=
 =?utf-8?B?NUpuSU43SEdRS295R3ljb1g0UkNDdnVHRmU3VXAwd2pIdE94ZWw2UUJRK3Vj?=
 =?utf-8?B?ekQ0TU92d0NEV0xJaVFrV08xQ3UwRFFxM2NoR2s0V214aExVZjlYSVBtM1h2?=
 =?utf-8?B?M0NnK3A4QWYzb05vWXVNSURIWE5vWnlGM1poY202R05TcFhxYjU1ZWxSWDJy?=
 =?utf-8?B?MG5QUEZZQ1hDSnR3dVV4cWxaUHN4TnpOd2w4ci84RFR2eFRhaTlzV3paYjFF?=
 =?utf-8?B?dGtFSnZTTFEzc2lqRExIbERpTVhaSjg2TkZoRmhDOXBIQ3YrblBmMS9KOTFF?=
 =?utf-8?Q?u0b9AsVxk2COV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29mRDFmdVBxRHFCWTF2d3ArMEI5ZTlJVGlueFlQV3p4OHV1MXNKVGlvQStk?=
 =?utf-8?B?NzRxSWthYWRiWDI0b0tFVlRoKzY1V1FTck9KT093YTB4NUZTeFdiL3FiU1d0?=
 =?utf-8?B?d3Zrd1JhelVCb3FGK1hSZkxMUGtIK3pSV3NCRkxmbTlkL25nL3NmWC9URGhs?=
 =?utf-8?B?VFpMUGU1OTdmOVluUzROVWpnVWt0eWtuMGdoeXpQZ3lQdkw0ZURrYVlKTWNG?=
 =?utf-8?B?cXpFMk5UQWFyaTFTNTdwUXFjYXN3R3hmRXpBQTVUZEV6bHAyYjJMS1hncVlw?=
 =?utf-8?B?S3pWSGg0aVc2eXF3N0hWVHpmdFprRnI5UGlYK1VBcWdtaEV3WGVXZzc0bCtx?=
 =?utf-8?B?SmpJT2d5M0NJMnp0WFQxSlNUQkFMckpEcmo2OTAvUC8wWnREVzVmSUdldlJx?=
 =?utf-8?B?M2dHWXFNbUIvQWp5WEd3V1h4S0h3cGg3UjZzdk9ZeWcvbUxtWmtPM0xIb2pn?=
 =?utf-8?B?YzlSZmt3OUY3aDFaU2haQncxbnpmdXVpdzA4OEV5MEE4dFBXU2FUVnVWb0Q2?=
 =?utf-8?B?Zk5zM3ViODZoR2c0OFAyTndpNWMwdzVxRU9tenFLTnhCdDY5cEJObkIvZy9z?=
 =?utf-8?B?SmQ5V0pleHlrdnIyYThWN0t6STVVc0UwWi9RWW8xYkxwSmJZRXlTb1pPcXMw?=
 =?utf-8?B?YVhKK3h3NndXa0dmaGVMaXgwSVgxdUFWckszVWt0QStkc21EZ2dndlpXV1pS?=
 =?utf-8?B?T1lLUzJMaG03cjNta2I3a2tDRHZSdWl5MERPTHpGakwwWFRZTGsvWUZ3SGJU?=
 =?utf-8?B?Nks3Tlc2M1JEbk5iZHB6ZldpNis3MEFnMEt3ZURNZmVHQTZGbTRmR0NMdVFC?=
 =?utf-8?B?QWZqRktYSHFTeUxZUjdVdEgzZ1NBUW4xenpSMUdpQ05nVGplMnlNc1NmejdR?=
 =?utf-8?B?MU44WklvOTVZUjdJWVoxREh1VEg2S0FxUk9UclJBRGVJL3hoUURiSGNkd015?=
 =?utf-8?B?RFNqWEJNY3FiZWlDbVdyTTMzcWhOZTdHRFZ0cmxhajVyblR1bHFSUDNDa3Uw?=
 =?utf-8?B?U0J3bFlCZms5NE5Qb240N2VJbTVSOFd6TFVFazE0bmtBRXJTZjFRbkVDVUtD?=
 =?utf-8?B?YUxvbkZmUzZ2UzdidmV5OUs2aGRBQ1NQTUZ1Y3orRW5QNjFJMjBNRVYwT01I?=
 =?utf-8?B?L29iRWpCc3VydkpaVkxTelBTWncwazNMM2xORHZ1U3FTdktnU1JFZE42K3lS?=
 =?utf-8?B?MDk2cVZ2SVNTbzdHQ213RFl1VUV6Z3VnTjM3S2gxcDVXYWd5T1RXcU41NVd6?=
 =?utf-8?B?am9OSWVlR2VVak9FMkU3WU1hcVFqZ0xsNFl6bkt3cmFmM2xibFpDK2FrNDZT?=
 =?utf-8?B?cEdMNFpQSkFWSnhpU2Y4cXlZVU9BUDFsalBlaFVubXdsZ0h1K0lKajl2bStW?=
 =?utf-8?B?MC9aeEtDM09Ob2x3ZEtobXRid0NiaFMrUzMxQnpwK1dLT0xYODB4OEtLUGZt?=
 =?utf-8?B?RGlrRXZVaVh1OXh5bGF5RXRibkl2QitaNWx2VnRsZUlvRGZIZHYzZjZFc013?=
 =?utf-8?B?NW9IYXJKOFh1N1VtcTJBbjFZT29TNExJZk5ySUE1R2tvNGgvcUVGKy9ibmli?=
 =?utf-8?B?QXl3cFpMOUJ3cmkwcjB6SzZBSVB5a25GREkxeWI1L3crY0JBK003cTZFWHFR?=
 =?utf-8?B?cEx2RUpjNHFKandVZXdaRDdkVWN6c3hPcHF4SGN0OGFReUNIeWhValRTaUZB?=
 =?utf-8?B?K3V1RGw0MW9SaWtsSTNWcHBEOEtvSStwNE1nQTF5MVlmN1d1cEIwU3ZZK09z?=
 =?utf-8?B?SStteTduWGRFQ2h1S2Q0Y0VRYi9jaW04TzJ6eFhzbUp1WmZzelA4bTZqV2hW?=
 =?utf-8?B?ZlY2cms5WEFqRlBiNUdjbkJWRklDR2xPKzlLRXRHSGdrNUhpQ3lnUjJDQ3V3?=
 =?utf-8?B?RVpnYkRmZVNWeDF4djFEWlp5MC9DdzJLdGNsQlVYNFFVWGNnMjgxOFd1NzNQ?=
 =?utf-8?B?MVV3MkhHQ1pGc1hSU0R5RWs5a3EzcFpxVkc1dEpiTXV2QXMxVkdOdVloSlhH?=
 =?utf-8?B?dlJJc2M4dEtpQUtuNFYrM0hnK2plNWFycVNNZ3F4WGt0TG5SWkg1TlVTeGdn?=
 =?utf-8?B?UThtQUNGNWFzK3dFM0YzazM4RjNINVZqUHNEZytFbHNVazNUcXdLRWllODlQ?=
 =?utf-8?Q?C8FKQYH3pbQIOgOTBnzt6YDB0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03543f1c-e0b0-479a-ca2d-08dd2336499e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 09:43:43.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiqMQ1IMp3NFR44kbJK9T1Y2GEVjCvxQF6MppwG6M85Kxe9uLfN61X89UrUJGDzIC+yPsUSmrvddjePten4O4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119
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

On 12/03/2024, Nikolaus Voss wrote:
> On 03.12.2024 03:22, Liu Ying wrote:
>> On 12/02/2024, Nikolaus Voss wrote:
>>> [You don't often get email from nv@vosn.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Hi Liu,
>>
>> Hi,
>>
>>>
>>> On 02.12.2024 07:32, Liu Ying wrote:
>>>> On 11/27/2024, Nikolaus Voss wrote:
>>>>> LDB clock has to be a fixed multiple of the pixel clock.
>>>>> As LDB and pixel clock are derived from different clock sources
>>>>> (at least on imx8mp), this constraint cannot be satisfied for
>>>>> any pixel clock, which leads to flickering and incomplete
>>>>> lines on the attached display.
>>>>>
>>>>> To overcome this, check this condition in mode_fixup() and
>>>>> adapt the pixel clock accordingly.
>>>>>
>>>>> Cc: <stable@vger.kernel.org>
>>>>
>>>> It looks like stable is not effectively Cc'ed.
>>>> Need a Fixes tag?
>>>
>>> I will include
>>> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale
>>> i.MX8MP LDB bridge")
>>> in v2.
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Nikolaus Voss <nv@vosn.de>
>>>>> ---
>>>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 40
>>>>> ++++++++++++++++++++++++++++----
>>>>>  1 file changed, 36 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>> b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>> index 0e4bac7dd04ff..e341341b8c600 100644
>>>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>> @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct
>>>>> drm_bridge *bridge)
>>>>>      return container_of(bridge, struct fsl_ldb, bridge);
>>>>>  }
>>>>>
>>>>> +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb
>>>>> *fsl_ldb)
>>>>> +{
>>>>> +    return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
>>>>> +}
>>>>> +
>>>>>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb,
>>>>> int clock)
>>>>>  {
>>>>> -    if (fsl_ldb_is_dual(fsl_ldb))
>>>>> -            return clock * 3500;
>>>>> -    else
>>>>> -            return clock * 7000;
>>>>> +    return clock * fsl_ldb_link_freq_factor(fsl_ldb);
>>>>>  }
>>>>>
>>>>>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>>>>> @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge
>>>>> *bridge,
>>>>>                               bridge, flags);
>>>>>  }
>>>>>
>>>>> +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
>>>>> +                            const struct drm_display_mode *mode,
>>>>> +                            struct drm_display_mode *adjusted_mode)
>>>>> +{
>>>>> +    const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>>>
>>>> Why const?
>>>> If no const, then ...
>>>>
>>>>> +    unsigned long requested_link_freq =
>>>>> +            mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
>>>>
>>>> ... this could be
>>>>         unsigned long requested_link_freq =
>>>>
>>>>                                 fsl_ldb_link_frequency(fsl_ldb,
>>>> mode->clock);
>>>
>>> I used fsl_ldb_link_freq_factor(fsl_ldb) to point out the symmetry to
>>> recalculate
>>> pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb) below:
>>
>> I would prefer to avoid this open coding of using
>> fsl_ldb_link_freq_factor() than achieve some sort of symmetry.
>>
>>>
>>>>> +    unsigned long freq = clk_round_rate(fsl_ldb->clk,
>>>>> requested_link_freq);
>>>>> +
>>>>> +    if (freq != requested_link_freq) {
>>>>> +            /*
>>>>> +             * this will lead to flicker and incomplete lines on
>>>>> +             * the attached display, adjust the CRTC clock
>>>>> +             * accordingly.
>>>>> +             */
>>>>> +            int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
>>>>
>>>> I doubt that pixel clock tree cannot find appropriate division ratios
>>>> for some pixel clock rates, especially for dual-link LVDS on i.MX8MP
>>>> and i.MX93 platforms, because PLL clock rate should be 7x faster than
>>>> pixel clock rate and 2x faster than "ldb" clock rate so that the 3.5
>>>> folder between "ldb" clock and pixel clock can be met. That means the
>>>> PLL clock rate needs to be explicitly set first for this case.
>>>>
>>>> Can you assign the PLL clock rate in DT to satisfy the "ldb" and pixel
>>>> clock rates like the below commit does, if you use a LVDS panel?
>>>>
>>>> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>>>> frequency to 506.8 MHz")
>>>
>>> I probably could. The point of my patch is you don't have to know in
>>> advance which LVDS panel is connected, and you don't have to calculate
>>> the base PLL clock by hand and store it in the device tree.
>>>
>>> In my test system, I have three different LVDS panels with EDID EEPROM,
>>> none of which worked with the stock driver, but all work with this
>>> patch.
>>> With slightly adapted pixel clocks though.
>>
>> If each of the three LVDS panels has only one display mode, you may
>> assign the PLL clock rates in DT overlays for the panels.
> 
> Yes, but I would have to calculate the PLL clock by hand with knowledge
> of the internal signal flow (at least the clock ratio ;-)).

To support a shared PLL between LVDS display pipeline and MIPI DSI display
pipeline with i.MX8MP + separate PLLs, I'm afraid you have to assign the
PLL clock rate(s) in DT with knowledge of the clock ratios. See my patch
series for details.

https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/

> 
>>
>>>
>>> The driver already warns if LDB and PCLK don't match, because this is a
>>> hardware constraint and violating this will lead to no image or image
>>> distortion. With the patch the driver tries to fix that.
>>>
>>> I don't know if it works for all or at least most panels, but for my
>>
>> This patch is supposed to work for all panels and LVDS display bridges,
>> but I don't think it does due to the problematic pixel clock rates I
>> mentioned before.
> 
> To my understanding, the current driver works for nearly no panel, unless
> you explicitly code the correct PLL freq into the device tree. The basic
> problem is, that the driver does not _enforce_ the correct clock ratio
> although the hardware strictly _requires_ it.

My above reply applies here, too.

> 
> There are two options in enforcing the correct ratio: forcing the ldb clock
> to the right rate, down to the clock source; this is Miquel's approach.
> Or getting the nearest possible ldb clock with the current PLL freq and
> modify the pixel clock accordingly, that's my approach.

With the PLL clock rate(s) assigned in DT, the pixel clock and LDB clock
are kind of deterministic.

> 
> Of course, never modifying the required pixel clock and still setting the
> correct clock ratio is the golden solution. But in most cases, this is not
> necessary as panels usually accept deviations from the ideal pixel clock
> without any problems. What doesn't work is pixel and ldb clock not having
> the correct ratio. And this is what the patch is about.

As I said before, this patch is supposed to work for all panels and LVDS
display bridges, but I don't think it does.  You may try to change your
single-link LVDS panels to virtual dual-link LVDS panels in DT by adding
the second LVDS link.  I don't think the pixel clock rate and/or LDB clock
rate after fixup would work for the virtual panels.

Looking into your patch more carefully, it blindly fixes the pixel clock
rate up, which means the PLL clock rate might be changed when LCDIF driver
sets the fixed-up pixel clock rate because the pixel clock
(IMX8MP_CLK_MEDIA_DISP2_PIX and IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT) has
the CLK_SET_RATE_PARENT flag set.  That means the previous rounded LDB
clock rate gotten from clk_round_rate() function call against fsl_ldb->clk
might works no more.

Note that the mode_fixup/atomic_check callbacks should validate every
atomic commit correctly.  Once the commit passes the check successfully,
the commit should just work.  But, it looks like your patch might fail to
filter out invalid atomic commits due to the clock constraints.

> 
>>
>>> panels
>>> it does. And if the clocks match, by chance or by refconfiguring the PLL
>>> base
>>> clock, the patch does nothing.
>>>
>>>>
>>>>> +
>>>>> +            if (adjusted_mode->clock != pclk) {
>>>>> +                    dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d
>>>>> kHz -> %d kHz)!\n",
>>>>> +                             adjusted_mode->clock, pclk);
>>>>> +
>>>>> +                    adjusted_mode->clock = pclk;
>>>>> +                    adjusted_mode->crtc_clock = pclk;
>>>>> +            }
>>>>> +    }
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>>>>                                struct drm_bridge_state *old_bridge_state)
>>>>>  {
>>>>> @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>>>
>>>>>  static const struct drm_bridge_funcs funcs = {
>>>>>      .attach = fsl_ldb_attach,
>>>>> +    .mode_fixup = fsl_ldb_mode_fixup,
>>>>>      .atomic_enable = fsl_ldb_atomic_enable,
>>>>>      .atomic_disable = fsl_ldb_atomic_disable,
>>>>>      .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 

-- 
Regards,
Liu Ying
