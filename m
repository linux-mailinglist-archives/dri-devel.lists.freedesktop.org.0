Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89B963BFE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490410E49B;
	Thu, 29 Aug 2024 06:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="T8iA4kck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2064.outbound.protection.outlook.com [40.107.215.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C1D10E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:51:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzeZMnMv4iTFXNU10E3K2a/AbVzvq0dMAf8oQa559KOssHWpUYnKWoDl6mskQk1+OUujqXcRNO+dEmSK8cRV2QBtR1l9jfJK1xuJRYmAf+qII1CDt88u8XuryAIn+ipm/koWo509XF5Cc5b5Yc00yMUwzAYf0AC7+k9l9FCYcSMmzN8ItfoAdqEGNR7GU+EeNrcBtux01a7z+uHBf7Cv7kEhA6q5MydbDMmYfNk40jQAi8nQJiNwxE5iBtc+RLGWgBhd/e8jwO94k8tXpQNCm1OrAY+4iHErnT/6fMXwxbiBdfqziQpCT8gPZFTmd8kAXgekmE1pXj81sXDPnc+Lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K900wjfYADUqbSP0ObOdQCMIwvuwQ4GD8lTiabQSyA=;
 b=narTg/j3MMH9d+XtG+i1wrsdXDS/xX/A3avmjLfH5qb8UIJGc5X1/prDulIdI6HwQ/4IEyuBUuxuSbqV+j3R2PDwPCyOQ82UgyUpSMBmfSxH/zUrj7swDPAqu1UHmfgpg2hj6cPbQuYi2D7HuncD6SRJWITrjigJTnz5KSAjv96hyccnqoCG0FA9aHzkO5lONAZql6JkN8+CXWFGxZWfWVIt/ElOJ+u/KfOzJWY8mAO4ywVZ/nq1vO+0ARS1Ua3nVZkMOHQJW8upcP/+lVeFrPbeJGMqENcLYvNfYj6S0A1fuHigBRcPQd3HO/W1FomRFoDKEgEwwlwaTN2hzHGAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K900wjfYADUqbSP0ObOdQCMIwvuwQ4GD8lTiabQSyA=;
 b=T8iA4kckjOQn2sn6+wV8svsnS+gyOwSWTWO91UHfH7hGW94McbMUb+YactKOTxvfvVPU2MUb6mhJBWDX0wkvbUMLXjBKlT50ZSWvMLnd6F952J4SBHhj1k0+PPLhP8kVJ5uBdn9dCCCxqaeZifzQHU2X2vgVMaA4WEtxg1GaxUiNcLfBOpRKIRhjmlDOkN/F6TiUiFyDVUOTO5HklK86FhwA4+siOz1f/oMlKwvKCKN6kpatg3086aIAn7wlqbhar4aJMxj8D/Vg9enDeMTUPoOoyDAZ4Wj0oFzqpq9W/LeSd+lKB9puIASj5Ej7/aRvxqplwwti3rz29Pmue9UBSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5035.apcprd06.prod.outlook.com (2603:1096:4:1c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:51:51 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 06:51:51 +0000
Message-ID: <ca717bae-e9d2-40af-9426-63c91670554c@vivo.com>
Date: Thu, 29 Aug 2024 14:51:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-5-link@vivo.com>
 <IA0PR11MB7185DF242D3F61BFE8429F35F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185DF242D3F61BFE8429F35F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5e00f9-962a-48dd-7a17-08dcc7f70fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW9SU2dpUXFHTWFrckFnTVZidmlBMjNEV1dnZ25aSG1YK3FpSTJtd3RMTHdi?=
 =?utf-8?B?bnNFQnZ3N0hBSDVSbXdTL2txSC84UkdWbTBlYlZvVklRSFJPeWtUUnk0WE5s?=
 =?utf-8?B?YXVPaTBBMXdFWVB3RTdpZXdrMmdtbGVUMWRCaWVpdDdySXlQL1NzajJ4SU9j?=
 =?utf-8?B?aDFUbkM3LzRXbjJkcGovZWVyWVpJRHM4eG1zWFZkWGw0NmlqUHNWdVppSUxB?=
 =?utf-8?B?T20zOHNWL1pCNHRIQnM0YTRzOEpHOERleW1tYTNudEVDbmFxVXZjT2lMUTFY?=
 =?utf-8?B?QlFEWURpRkY0M2FLWHE0Rm9VWG9ucWJaVE1ZZFMxREtEMW1MNDB4eDlQZ2Qy?=
 =?utf-8?B?MFdrMWVVY1JEL0x0NW8ydVZ1dUJUaXFiV0RVTCt4elVPcTdaVTNTR3pmVWRK?=
 =?utf-8?B?dnBtcEIyRmZFT09uVzVSQlZpMzJ0WmpCd2JlbHBwaVJBZ1VZa0hVdEJ5OTNn?=
 =?utf-8?B?SUswdTkyam9xSmxqZjdoMlk4U2RZRkhLS1gzR25FOHkzck1Eck93blI4Y2pX?=
 =?utf-8?B?d0FsM2Z5U0hGWHRIeHFER0x3VzZWQWkvT01lM0tTOGUxZHI3VE1jOFpDNzIr?=
 =?utf-8?B?M1E3RW10aTN4RzZkSjBIZmxQVmNUN0lJUUVFdWZmN3ErSE5XZTZlN1psYnQy?=
 =?utf-8?B?UVRadkhPeHdYVUdLdHNjN0NuZHVKQkIxdVR6aXZNbjhHdXBCSEZ3WkNRZE1H?=
 =?utf-8?B?Nmt0K3VubGQwU3dMZ1FydWFRa1ZFZFF4YVFRcWxuL25sd2JRa284UjhQNVFU?=
 =?utf-8?B?WEEyanlUK0EzN0xUMHFkbU41MEw5TVRab1hRRUh6UXJuWXBsSW1xcC9DejFG?=
 =?utf-8?B?NThxL3hGdmtFMWpOOHp2MGozOFdMWVBGbXJRa1AwNEZWT3UwNWgwRFNmWng0?=
 =?utf-8?B?THlUSGsya2swdlJacE5QcjF3NS9DUDVzSTkvMGhXZDFkcUJlcHVBZk81eVJ1?=
 =?utf-8?B?QVh1R0RTbUUrU2grbFRNT3JoeGxYR3Yza1JnVi82bVNoWFc4WUFaV0QvQVpt?=
 =?utf-8?B?STZvR28vcjhBNXd5TWhCd3BYcG9WWTh4eVRvU1NwYVJUeHd3ckw3VWxyR01I?=
 =?utf-8?B?ci9nTUdrNjNiSXdkeFBmbVlOZEZTV0U4ZVMxRHlhVEY5TmNuY3I5MW0xTm4x?=
 =?utf-8?B?K0ltS0IvMHlPMThGaXZrMUdKd0FsY292WnZjbFJaRkIrZm44WFU2eEQ3c0Y2?=
 =?utf-8?B?WlhoKzNvWVU3Tm1HTTJBc04zaXBwZ1FFT05zblhLUEw4by9Kb0tvV3BhaTU0?=
 =?utf-8?B?RVJqdTVKSCtSdGZFR0RJNnk4WXdIdEwySFJWMysyVytkaW1ZSi8vMjlwM0Uv?=
 =?utf-8?B?YjNGYVBqT0NITFJKc0dVQlpVTU1FcTJsaHdKbkxXdE5VanRKUmd4SzNlbTZz?=
 =?utf-8?B?WjJYcWRxNkFOUHFsVmFLUkxPUkVpeVNDUVIySEdKTXdlekFraGFQMUpvaUdu?=
 =?utf-8?B?VXlWNnh4YjBpd0xMTThjS3dEKytuNlVyMDA1VnIwYS9iMUw3VW10bUp1WEZC?=
 =?utf-8?B?QnFmRDFSdE1HYlUwTW4wenpiYzZwbEJFNEVDbUhCNEd3enVTZU9GdG9NNUtF?=
 =?utf-8?B?cG56UDA2bTNKckJObGxsc0laTmJldWU1blk0ckhZRXhUSGh4QWl2eDJqUXJP?=
 =?utf-8?B?QmxlajN4dHdLWFU4WVN2VmNwazd0cEgveGo0dUVHMlByZTB5T25pSkFPWkhS?=
 =?utf-8?B?VkFZMFdjTTZhVkgxZHZiNlpYWG5xcHVtcUNLakhBWGFOR2dZMi9ndnVXU0M4?=
 =?utf-8?B?dGI2STh4OEtyVk5TVSsvSDEyWm1vQ3VSODhlUXJFTXlQTmJHSkgrWUVwVUdu?=
 =?utf-8?B?WEZBc3NRZnA2allyTlZnSEpoTEZrVHpBYWVlQ09DOWhlR09RZm9jUnlScUF1?=
 =?utf-8?B?am42M3Zpc2ltMWlXcWljWThwZXRuNmprSWVDZ21lMnNhL1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1ZZFhOSTQyT2NONmF5OGtzeFhjaXAxejJRVXRNZWp1azlDdzJRUGpGUXdy?=
 =?utf-8?B?aitKTEtXTmJzNFZrb0txdVdsWSt0VEo0T2ZHYW5JYWw2a2pNRjNNL0tZRmls?=
 =?utf-8?B?OFFNbkxGM0htRDIrdElkY0d4bHpnRVlFWWVuYU1XZUc3Unp2Z2hMR0NORTlL?=
 =?utf-8?B?eW84ZlNJNjJRKzFXam9kTERTMUF4dWNVUVlNam9tTFhGczhLNkJnTTFUZ0s0?=
 =?utf-8?B?SHE1Zk54K1phdkNzcm95KzlrekdKck1RejlkUEkyakg0dDEvNVQ2b3BEQnM5?=
 =?utf-8?B?RzQ4V0xDY0JiK3F5MEp4OHV0RURnMDMyd3N0bDViS1dra3A1RXMwU3ordDFk?=
 =?utf-8?B?MGs1TE85QXlyT2VoQ3RkaEZYanRoak92YnZWZUxicjlCSlNsZk5jSExrbmhG?=
 =?utf-8?B?ZUJXMEN2NjNmbnBsQmhhVGhpZDc0a3pWRGRtL09UbEt6Ly9tbm9BQWE0QVEr?=
 =?utf-8?B?UnZpZnNXQTQwaFRlZkd5eHpEWENQNGlPRVlUdGsrNThnNlZKZFNhNE1sZDk5?=
 =?utf-8?B?OTBYSzh5Mmc4dDNVK0ZESmtQZ25scEF4UjAxZHJUNlBsWWdmY2cwejZMSjVW?=
 =?utf-8?B?SlJxMU1UczE4MU5zZGV6c3BING96YVlWU2NjSFA1Sms1TnJ2V0JwWjFOMDVT?=
 =?utf-8?B?NkRhTGp3Rk4yN1NicWxYWHZhNGUwZ2ZJY3B2MkFzVCtuT2ZyYWtidFE3REJV?=
 =?utf-8?B?WUthelRkeG9tSTVuSE5CNFEzcU9NU3Ywc1l5WkViVG9tMlh4YlNibFMvK0Fp?=
 =?utf-8?B?MzVBYkdrYnB3amZmWUsvSjd5MEtWNWhwaHk4aE1rcFptT0hxdGpNUnh4b2lE?=
 =?utf-8?B?ZFpSZ1dudEFKUmhDSHFZcUR1WHFxM3AvWGFEWmgrM3c3SE1ibE5wZkplUXBa?=
 =?utf-8?B?OE5yT1U1bHFQR3VscUh2NjA1QkIySUZnR3ZUeG1Wdy93cDJYSndwRkVQbXhj?=
 =?utf-8?B?OEcvTmlrMDZoRmUzbjFyRDFXbDZDRllycGNzNWhraHZ6LytPaUZXQ3djci9E?=
 =?utf-8?B?bHpZejNhZUM1WHp2NzlCbjJ4ZHNkbkZIZ1QvYjVNREJLd0huY0piZW51ME54?=
 =?utf-8?B?c0VsYWZrZTc4TEhUSVlEdUtuNU83SlZQanh3RWtWYVFlYkRkZExyUC8rR3RW?=
 =?utf-8?B?ZWdxUE1vQzI4WjgvcERsRjNDUVlnZ0p2T1JGTGppQXFnUlcwa3dRd3JVMnR4?=
 =?utf-8?B?K3pMZHllRDVzcktYb1RTVytnWG5sRyt3NkZOVVI1SUt1eXlYRFNnSUJXNVBq?=
 =?utf-8?B?OXlXMVNrTmZVVW5qdnBIbUxKaXp3bk9MWWJNa2lXTlZpeExZOWZuZkNkTHQz?=
 =?utf-8?B?NFZRZUhlTVJPZUx0Unh3UHVQV002L1Rlc2cwSDk3MnhueG10WVJET2NjeDZx?=
 =?utf-8?B?NUhUbmF0SzJkOUx3djRzWUY4MDc2NGUzVC8wQndtd3UvdmJSY09hdUdlZDAx?=
 =?utf-8?B?OFdmWUg4QlFxTjUzc21UREZIdXI1VGZ4N3lzUWFIaUxIUXJRREVHQTRodXdV?=
 =?utf-8?B?Z3QwcldmTG43VkpScEJKZ1BHbXF6SllxK0h2VS92RzU3TmwxR1MwaTNnaElZ?=
 =?utf-8?B?a2dCcUt0Rmg5NEpUTlZkNldpSGd4Vlp5bHhXVzU1NWh2dXp6UkQ2SUFIaCtE?=
 =?utf-8?B?dWMvcjI3ejhmd3ZQTzhRRWdab0pvK0Z1V1IxTjBlNGJHOFBob25zZGhQaDZC?=
 =?utf-8?B?ekdNSjdPVzJqMmNzcE82cXo1b0ZGamgxNU04ZUhsMUpzWTJEK2U3MUdzaWo4?=
 =?utf-8?B?MVVEN2pRdjIwb1I4NjdNTkhXNWU3Nml2OTNzdVRpbHlzTzQ3Y0NKekV5dG1T?=
 =?utf-8?B?SURLNFFWVGZGL0d2ZW15L2dwU0FJTk1lVnBkMmdVMUdXRmR1cWtFU3U2YitH?=
 =?utf-8?B?ekRRMWhLYWhyMVJpL0dmSGQ5cHRRYW5vNmpsamxDRE5Hd2k1eFY5ODZETXZ2?=
 =?utf-8?B?MXQ0MjRQYVllbTN4UkNseUhvWjB5d0VMMFg2eGRjZ1c1TGJrMzdUaFNROUYx?=
 =?utf-8?B?TnErVGtBZXNkMmZRVDFYVW9pTjBrYUp1dm1pSnpocC9wbis5YVV3akNYeGxs?=
 =?utf-8?B?blNxem5vRVgxQXAxL1FNY21MR09wOTk4L085YTZKSWxpQnd6SjJ5VEF3WGJq?=
 =?utf-8?Q?tiWyR5syQyIkIazayJCe5DjPS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5e00f9-962a-48dd-7a17-08dcc7f70fb4
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:51:51.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ehsMroip8TL9hc0ow8Qm0ccfIPloQF5KQZvzUr7umkHz/H6NaFPQMD98d4A6L02VnjSztzx1YJRcm/bxMHubA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5035
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


在 2024/8/29 14:39, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
>>
>> There are some variables in udmabuf_create that are only used inside the
>> loop. Therefore, there is no need to declare them outside the scope.
>> This patch moved it into loop.
>>
>> It is difficult to understand the loop condition of the code that adds
>> folio to the unpin_list.
>>
>> This patch move item folio pin and record into a single function, when
>> pinned success, the outer loop of this patch iterates through folios,
>> while the inner loop correctly sets the folio and corresponding offset
>> into the udmabuf starting from the offset. if reach to pgcnt or nr_folios,
>> end of loop.
>>
>> If item size is huge, folios may use vmalloc to get memory, which can't
>> cache but return into pcp(or buddy) when vfree. So, each pin may waste
>> some time in folios array alloc.
>> This patch also reuse of folios when iter create head, just use max size
>> of item.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 165 +++++++++++++++++++++++---------------
>>   1 file changed, 101 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 0bbc9df36c0a..eb55bb4a5fcc 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -321,17 +321,87 @@ static int export_udmabuf(struct udmabuf *ubuf,
>>   	return dma_buf_fd(buf, flags);
>>   }
>>
>> +static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
> I think the name udmabuf_pin_folios() for this function would be simple and apt.
>
>> +				     struct udmabuf *ubuf,
>> +				     struct folio **folios)
>> +{
>> +	struct file *memfd = NULL;
>> +	pgoff_t pgoff, ipgcnt, upgcnt = ubuf->pagecount;
>> +	u32 cur_folio, cur_pgcnt;
>> +	struct folio **ubuf_folios;
>> +	pgoff_t *ubuf_offsets;
>> +	long nr_folios;
>> +	loff_t end, start;
>> +	int ret;
>> +
>> +	memfd = fget(item->memfd);
>> +	ret = check_memfd_seals(memfd);
>> +	if (ret < 0)
>> +		goto err;
> Please move the above hunk to udmabuf_create(). Lets just have pinning and
> processing of folios in this function.
>
>> +
>> +	start = item->offset;
>> +	ipgcnt = item->size >> PAGE_SHIFT;
> I think it would be a bit more clear to have udmabuf_create() pass start and size
> values directly to this function instead of item. And rename ipgcnt to something
> like subpgcnt or nr_subpgs.
>
>> +	end = start + (ipgcnt << PAGE_SHIFT) - 1;
>> +
>> +	nr_folios = memfd_pin_folios(memfd, start, end, folios, ipgcnt,
>> &pgoff);
>> +	if (nr_folios <= 0) {
>> +		kvfree(folios);
> Please free folios in udmabuf_create() which is where it was allocated.
>
>> +		ret = nr_folios ? nr_folios : -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	cur_pgcnt = 0;
>> +	ubuf_folios = ubuf->folios;
>> +	ubuf_offsets = ubuf->offsets;
> Please initialize these temp variables at declaration time above. No strong
> opinion but I am not sure if they are really helpful here. Something like
> upgcnt would be OK as it definitely improves readability.
>
>> +
>> +	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>> +		pgoff_t subpgoff = pgoff;
>> +		long fsize = folio_size(folios[cur_folio]);
> The return type for folio_size() is size_t. Please use that for consistency.
>
>> +
>> +		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>> +		if (ret < 0) {
>> +			kfree(folios);
>> +			goto err;
>> +		}
>> +
>> +		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>> +			ubuf->folios[upgcnt] = folios[cur_folio];
>> +			ubuf->offsets[upgcnt] = subpgoff;
>> +			++upgcnt;
>> +
>> +			if (++cur_pgcnt >= ipgcnt)
>> +				goto end;
>> +		}
>> +
>> +		/**
>> +		 * Only first folio in item may start from offset,
> I prefer to use the term range instead of item, in this context.
All above I'll rework.
>
>> +		 * so remain folio start from 0.
>> +		 */
>> +		pgoff = 0;
>> +	}
>> +end:
>> +	ubuf->pagecount = upgcnt;
>> +	fput(memfd);
>> +
>> +	return 0;
>> +
>> +err:
>> +	ubuf->pagecount = upgcnt;
>> +	if (memfd)
>> +		fput(memfd);
>> +
>> +	return ret;
>> +}
>> +
>>   static long udmabuf_create(struct miscdevice *device,
>>   			   struct udmabuf_create_list *head,
>>   			   struct udmabuf_create_item *list)
>>   {
>> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>> -	long nr_folios, ret = -EINVAL;
>> -	struct file *memfd = NULL;
>> -	struct folio **folios;
>> +	pgoff_t pgcnt = 0, pglimit, max_ipgcnt = 0;
>> +	long ret = -EINVAL;
>>   	struct udmabuf *ubuf;
>> -	u32 i, j, k, flags;
>> -	loff_t end;
>> +	struct folio **folios = NULL;
>> +	u32 i, flags;
>>
>>   	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>>   	if (!ubuf)
>> @@ -340,82 +410,50 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>> +		pgoff_t itempgcnt;
>> +
>> +		if (!PAGE_ALIGNED(list[i].offset))
>>   			goto err;
>> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>> +		if (!PAGE_ALIGNED(list[i].size))
>>   			goto err;
>> -		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
>> -		if (ubuf->pagecount > pglimit)
>> +
>> +		itempgcnt = list[i].size >> PAGE_SHIFT;
>> +		pgcnt += itempgcnt;
>> +
>> +		if (pgcnt > pglimit)
>>   			goto err;
>> +
>> +		max_ipgcnt = max_t(unsigned long, itempgcnt, max_ipgcnt);
> Is this optimization really necessary given that, in practice, the userspace provides
> only a few ranges? It can stay but please pull these changes into a separate patch.

OK, I'll separate it.

If few ranges, folios can alloc from kmalloc, if low, from slub is fast. 
If low than PCP order, also fast.

But if trigger vmalloc, I think it's slow more. Consider 3GB udmabuf 
create(even if currently not used)

page array will cost 6MB, from vmalloc will iter alloc 4K page upon to 
1536 time.

So, a little help if only reuse the max size folio.

Thanks for your suggestions.

>
> Thanks,
> Vivek
>
>>   	}
>>
>> -	if (!ubuf->pagecount)
>> +	if (!pgcnt)
>>   		goto err;
>>
>> -	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> folios),
>> +	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>>   				      GFP_KERNEL);
>>   	if (!ubuf->folios) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>> -	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> -				 GFP_KERNEL);
>> +
>> +	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>>   	if (!ubuf->offsets) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>>
>> -	pgbuf = 0;
>> -	for (i = 0; i < head->count; i++) {
>> -		memfd = fget(list[i].memfd);
>> -		ret = check_memfd_seals(memfd);
>> -		if (ret < 0)
>> -			goto err;
>> -
>> -		pgcnt = list[i].size >> PAGE_SHIFT;
>> -		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> -		if (!folios) {
>> -			ret = -ENOMEM;
>> -			goto err;
>> -		}
>> +	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
>> +	if (!folios) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>>
>> -		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>> -		ret = memfd_pin_folios(memfd, list[i].offset, end,
>> -				       folios, pgcnt, &pgoff);
>> -		if (ret <= 0) {
>> -			kvfree(folios);
>> -			if (!ret)
>> -				ret = -EINVAL;
>> +	for (i = 0; i < head->count; i++) {
>> +		ret = __udmabuf_pin_list_folios(&list[i], ubuf, folios);
>> +		if (ret)
>>   			goto err;
>> -		}
>> -
>> -		nr_folios = ret;
>> -		pgoff >>= PAGE_SHIFT;
>> -		for (j = 0, k = 0; j < pgcnt; j++) {
>> -			ubuf->folios[pgbuf] = folios[k];
>> -			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>> -
>> -			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>> -				ret = add_to_unpin_list(&ubuf->unpin_list,
>> -							folios[k]);
>> -				if (ret < 0) {
>> -					kfree(folios);
>> -					goto err;
>> -				}
>> -			}
>> -
>> -			pgbuf++;
>> -			if (++pgoff == folio_nr_pages(folios[k])) {
>> -				pgoff = 0;
>> -				if (++k == nr_folios)
>> -					break;
>> -			}
>> -		}
>> -
>> -		kvfree(folios);
>> -		fput(memfd);
>> -		memfd = NULL;
>>   	}
>> +	kvfree(folios);
>>
>>   	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>>   	ret = export_udmabuf(ubuf, device, flags);
>> @@ -425,9 +463,8 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	return ret;
>>
>>   err:
>> -	if (memfd)
>> -		fput(memfd);
>>   	unpin_all_folios(&ubuf->unpin_list);
>> +	kvfree(folios);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   	kfree(ubuf);
>> --
>> 2.45.2
