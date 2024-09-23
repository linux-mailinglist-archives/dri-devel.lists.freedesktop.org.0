Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1597E482
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 03:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BA210E02A;
	Mon, 23 Sep 2024 01:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="TAqm7cds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2065.outbound.protection.outlook.com [40.107.117.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075FE10E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 01:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXUzYyC6JrCDUZV6TEtUFAVRgiYnyndQNWFB5jYqPJaa/yChTgjuyPNecsvLW1zD0Fbt46WaA645BG5EKRcJqxLD8MyawoBFf2mz53bkIGzEw8Y+bjMp/RcnLOOmxdtDf3iH5cqERBaZbtaaT7uOBvy5nnKAHtRrWwHmoUV2WD1fIZ4vubw5u8voaN5oy8pxJRXCAj/thAPYD8MNm/n5GVZdQnFeL5stuN7X6JzmE57M0XmLpinV9UXRptXAIbLl3Qw8iPJ1m0wC7+zXwB0Ub6J/sKHuzUjauQk0mp9wP5E0wRaKFt0jpVcp2hifjqlFIGrdgPvwHlXiA7Zk7xPjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tk6CTG8IRYkiuqbVFPVeaVTqF8YaXdksxaZM8rk5h2Y=;
 b=EIYIzoqckZIOiIuCfCjgK2eVR8Cu6NZ1JvaIRPzsY1Z9ZOg98eab1RPFHUKVEhYxnqsMveRxx0frB+ZwiiCFxaSFsvOyRdhrFeECQDkAIIkI20Kd2ZrMbu6KcFN2i0shomgWtGQhtB900XxCnsoUiu5HxH0bIErTKzThhXFXQ87r6JRWxWM6q3LGEtc1d7S7UjN9hiQ0qLJ1B+0/yWWBYMqW/9q1DZRPtVGtau7j21OTwPlMegxYxH+nKwm1gy4JuMSy2jT0v+KKcI9YPGpCVwknFp+Mc9e8F/Y8BZ8YOfJ3iaQyEUzv+nDGWGDDPbCneOUcXAgF+cmTKDr19wKQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk6CTG8IRYkiuqbVFPVeaVTqF8YaXdksxaZM8rk5h2Y=;
 b=TAqm7cdsBoKQ2f3oFB0sYw4p2S8DAG0mFOKBe/m22XOqalmqxiP7r/cc403hpT111pkHy91GWm+hnSa2CbPUfnOfPxXRWjVN13M5+X7wu/XqlRQ1ZH5a8NTpl8TeLkYmJGcHXJQaBAV9EgAapBLaSIXM0t2f6n45dggOo0HhfQvQo/iuyM0suO4GslliU+/cqHPjh2SgZWkvxQADTBHxGBoUNB/PhER2NoT9DX8afvRcC+CRFkHAPKtgNVdGFfZa4XViaoOcyqkeh//kruETyvA1CvARITtjqJ+FSo+DSqCTCF8R3lRbuG6oA2bby+zFjldjN+f8UMHHom4CGfyCDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5066.apcprd06.prod.outlook.com (2603:1096:4:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Mon, 23 Sep
 2024 01:11:07 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 01:11:06 +0000
Message-ID: <d9ead55d-1399-4d1f-a9da-25315052083c@vivo.com>
Date: Mon, 23 Sep 2024 09:11:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] udmabuf bug fix and some improvements
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
 <IA0PR11MB7185E6C790F112FE898921CBF86D2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185E6C790F112FE898921CBF86D2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI2PR06MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 43927981-0589-4476-850d-08dcdb6c99c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0JtVUhtMnlTemp1SHd0UWJDMXZyTWYwY0pyZ3phdGRLYVJVMjd2SGtQa1VJ?=
 =?utf-8?B?b2xONkhzMG9YUVZqNUkwaW1uWEZNS0hZZlI2dEJBU3d1bTVhekZOTTlVSlF3?=
 =?utf-8?B?Z0hteE5EMEZHanpUR1IxbDNnb0FwUnFiQUw0T2tLZjgwQ085aCt0K2V5STdN?=
 =?utf-8?B?R2RqSHM1V3V2YzdIVWVPZ0ZDWnJYSFh4M1RZRDJhdlA2aXNYY3NrUHg4ZUVn?=
 =?utf-8?B?eVhjdjZQOGdlTWxCQml3MlFEd1RKaHVQd3J5THhDTVJFbG5WZ0x2TWFSQnZE?=
 =?utf-8?B?cW1DZG9uQldXWnVwZ2ZzNjZIQkZVS0duTDlFVDBRRWF5RkxZUzlURmdOamts?=
 =?utf-8?B?L0E3ZGtoZ3VTbDBXOUhWdXkySUtFTndsNU1mOWx0QUs4UnJRT012aDNndzl3?=
 =?utf-8?B?d2YwZ3N2V3luRjFDb0t3K3pYR1VTZEJWNHFBaExZRXI5TkwzbTdtYjlZWlJL?=
 =?utf-8?B?OWs1RmVJc0N5RlpjQk9iWGxUQWtSeUlrQm1YeUJJc21rMHFORHVibTh1TmNl?=
 =?utf-8?B?UWlQSUE5UXNmUTZyRjhuenFjcldDMjFoMzdsaGZYSmx4a1RNdDNMVVNkdTdp?=
 =?utf-8?B?TkpyZ3hvcUl4VVFseDVFMkFqUStpVjloaTJmYjlya2tqdDdLUjhyYXdXTzhz?=
 =?utf-8?B?aVJZZE0yUFNqY3dpRUl0c25aNldlWEZPTmRWcTljYUhheDJ1Mjd0cVdER0Fs?=
 =?utf-8?B?VjA4TnpMazluK3BJNVpqMTEycmVUa0Q3RFFvc3Z5SVpQb3lMY1N0bHBuc1c2?=
 =?utf-8?B?SmpFZEZZWHNrYXRMR3dwOWRoV3EwVlI3S3lwdjg2V2ZNRWcydDdvZDhvUG93?=
 =?utf-8?B?WVBVS3FSMW9aNmtCWmdrU2t1bVhsT2dpMWtQNWZ5YU9ic3pzTTBleitMRlph?=
 =?utf-8?B?cmNuQndKcTgzSWhabHRZWW84UDNQUU1WQjJZNFBnMVhQeEVCUGdRVXpBcFZJ?=
 =?utf-8?B?MVNLa2Q5c0pJSjJjQnkxelVUNlhheTNKd3p6ZVBMd2lsMUhyZTMvMllRditF?=
 =?utf-8?B?SFpYNjF3NGVNNnF4Sk4vVzlvSUV5cEdybUxjcjVWcXZrTncwaU41MzZVUUti?=
 =?utf-8?B?K0lKOHdaeCtvU1lGUC9lQWVlWDRjUHNvSko5N04yTTREc3ptQVA3ZXBRVW9m?=
 =?utf-8?B?cUYzdUZ4NVVYKzNyTWJxNzl1aEVxankxTjlaVHJXNVJRVG12N0Q5S0ZFYTRt?=
 =?utf-8?B?WGxPVXVTWnJrYjR1aDA5MUhJTGZUWGRGV2daT2hnKy9IY2I2c3BRdVpyM1hU?=
 =?utf-8?B?cTR4WlEzRW9KZWZPUUNZQlVXMUVWNUNnUTNpWjlZRGlpRW9CS0llYnlaWXBV?=
 =?utf-8?B?TktnTmpzVk1NSTU0T3FCSkFjSnJmd0J1N1JtT0x2LytqdGhoZ0RxaW1zUnJZ?=
 =?utf-8?B?OENDUlRmbFZtYXI2dC8xZ09NUG40M21IQmxrdWJLVnhveDN3Z25qWm40Mkhs?=
 =?utf-8?B?L0kwbCtGcFlBOWN4ZmFSWUo4R05kcC9uRlY0bkEvK01KYXpqUzk4eG1DTTYx?=
 =?utf-8?B?S3cwaGMwaWtXejZ0MG91RFh2UU9uNXFMaWdoS0dMdlJmMklScjdTbnhWRXNL?=
 =?utf-8?B?SnNZVUZVV0JoNktYalo2a2xrK3E3VnhpcXAyTWo4dnI4YkN5ZFZaT3puakFM?=
 =?utf-8?B?ODZBYU5OZXk5RlZlSnBVRHBYWUJyRGc5U3Y2UVU4VWhydy8vMkJsNS9CT3FF?=
 =?utf-8?B?UGRZME9lRmR0K2pubTlMclVrNElIWExaY0h4UHEvZVh5emRQZ0xla2h2YWlQ?=
 =?utf-8?B?YkhUTm5qTkVueGRxUmNKNUVFcjZ1UjRrclp2ZDUzVW9kUXE4ejdlOWlpR0dL?=
 =?utf-8?B?c3kxOFlxaWZwbWNybDlzRFFtNk1BbTJJTThDcGthVXNLSzVDbHl3bHFaMk1q?=
 =?utf-8?B?TTc2OVhuRTUvS0tjeElBdkpuazU0bkxyVFBYVEdpcmx3d1B6ZmFhVjdQM0U3?=
 =?utf-8?Q?PnCEdCWXSy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTlWN2xhRTdyTmNwNUtKMjVWWEluN0h1NmREaHBmN0pXNGo2M1V2RGtwUS92?=
 =?utf-8?B?U1FXb01SSDRBL2ZFQnR5QXU1VjJqSFhLRERmZ3I0REU0Q2dqTThvTXJmbE5u?=
 =?utf-8?B?cUpQamxGMWJOV2VhSlJVRFlqZjNWSzdTeHNEZHFhMEdXTWZJSW5YSnpWUVpJ?=
 =?utf-8?B?VmhPTmRpQ3lON2hJTlM2UFU1cEpKcjZIMENQOTZZbmhVVzZ2c1VFZmM2dENF?=
 =?utf-8?B?NFhobTM4S0pFVWZuK2tZSTFVbHlhbVZSa3dPbjhkelJvNTB0a3JCU25wSzZF?=
 =?utf-8?B?VGtFMjNFdUlvSHhSQlNYMWh6VlJreklRZVpPYTQ5SmtHV1d0REM1L0ZCRWJW?=
 =?utf-8?B?RjEwY0VUOVZOTjR1aDBYanA4VzZqeTlGQzVZVHJTTC9NcnZlTlVmeU8yeXQ0?=
 =?utf-8?B?RUJQY1Vwa1dxRnVpYTNLTzdiRGVUY0NhazNPalR6YWhOQkZMMFVETXhYYXVi?=
 =?utf-8?B?eGNMaTJQWVduYmFwNGE2L093TzdMUnQ3Nm54cmZVc0NhSnJvZXBCYkxDUGZH?=
 =?utf-8?B?RWZkU2ZVakQ1Qk1qUFdSa0piRVhGVkRNRzQ4eXkrclViOUhnY1ljTS80enRq?=
 =?utf-8?B?SWRSL0pLRzlaSSszS0NyUENIQmZmSGhzMDNyRnFCWm1QOEUvUFdvQ1VwWmQx?=
 =?utf-8?B?Mm1QcFo5dkhMcGRjbFE3eUJmdkFacW9Wand1Vm9lZHBUMDZtVlpwanV0SGdy?=
 =?utf-8?B?ZGVEUDRwL2pJaHJ1clBBaG9nYXpTbmFaUlI4VzI0MDRjVVFyNy9hWWU0Z3BT?=
 =?utf-8?B?MkwrTiszNE1XaFY3eDNIVHpqeCtid0ZZdnMyZGplNTYxQTdTSXBEWTVZS0xX?=
 =?utf-8?B?ZDFkenlnRGN4UkZhZi9Lc1pwcnRickZEQ2JoNTcrcldrV3ZJYlVnTlBTcVhF?=
 =?utf-8?B?U0RsQUc2VTFsUUJXc0Vjbnl6TW5ZLzhoUnE5RVE0UWYyNFY4YXlGTnJvY0Fa?=
 =?utf-8?B?STJkU0NUY3pUVW1INVpWSjdwZ2c5emN3b1pZWWZmY0dkRkdMZldSWW1IMmll?=
 =?utf-8?B?SzBLcVhyUGFRUzhLSjd2Z21yUHcrUS9mT0hDVFZveFMxd0VKS0tJYUREaDVw?=
 =?utf-8?B?YVhoRVpCZkorQVBOQ21mWTFZdVUyQ1JEWFdjcHoxWVJYc2hscTNzS0crYnBt?=
 =?utf-8?B?R0dFcEZ5L0VkMXBWVTRMUkc2M1ZQbnA2Z2hJTCtuTUtxRlg5ZmNlS0dnZzdF?=
 =?utf-8?B?WmZ5WlcyeTZVY3pJZXZaUWJibTYvQ3lBV1VSU0dLakxSbnNYMzB0NWdLRkw3?=
 =?utf-8?B?U2Rxa2F0ellQYXR1ZnZFaGVlUmNyS1ZGUkNvQ0ZQT3pmZFgzejE4aHZWS0Zz?=
 =?utf-8?B?WEIySzU4SDJmSzhtbHFhQlZhOWh2VmdZd3RGR2lnc2MyaUEzQzU4ZnV6MVVG?=
 =?utf-8?B?Y20wUDkzREViQUFQdnhha2p3YVRVMTVFcVU3WHZ3Z2U4a2ZtUXVGem1XbGM2?=
 =?utf-8?B?dUlKd3FGUjArc1IrM2R1SDdUT0Q3cDFFVlNsK3M3WnVkb3NqZ2hjdjZwM29E?=
 =?utf-8?B?a0gyQ1VWRXgxNVduTEs4Vys4NmxJVHJxMEN5emVaK0U3S2RCb1JDYVNzckNX?=
 =?utf-8?B?L01Rb3FjVWhGa0N2RVRGZ0p5WVMyd2JPN2lSaTd5QmdhenozL0tPQXdYU2dl?=
 =?utf-8?B?ZlpQa2ZqcUlONU5HWXRLRXd2L05BMjNGNkxRdHpONG1HRVVGM0tXNE02MzhV?=
 =?utf-8?B?b29qWWlIa2FuUXk0ZDdzVFE4S3NjVjYwOE0wYmowN1JBYWJhcFVUTG84dmRB?=
 =?utf-8?B?ZlVMcFZHRHdPQ3VSb2NmeFZIZU9tekJabVRkSHd5MW5sZHJmejZPT3c0cVNP?=
 =?utf-8?B?blJkQUNLeENFTW9Na09mUFNLRURQQnJ1Uzd3YzV0M2dPTXJwNm5CeUJOeEl2?=
 =?utf-8?B?dEFwZEd3NUlFM1NnV1c4THEyWk9DSkVlRzBKTDFPVXBZaWtnaSs4U2x5OFg1?=
 =?utf-8?B?TWF5VzluekNEditMNHNFeWF1TXVTUEwzRTJVUVBxak9uSmw1UzJSZW9HYkFv?=
 =?utf-8?B?S3hpRWpuWnJnYzFubEcwRUpjY3plWjdKNUJWT2N1OXo4K0RxNk5hNHdOcVhn?=
 =?utf-8?B?RHUxUXFJQlNybk93Vy9XRk4wUzJOUTF1VURENjZjZFkvS01KT2tPS0s4clVs?=
 =?utf-8?Q?yANbn6flHypus3UvmPbBGgO0p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43927981-0589-4476-850d-08dcdb6c99c3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 01:11:06.5536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBs9sHVUyomRm9E/GjCG9BZCt5+WE/9rcspti8FJ173sq+JlcTM0CmnIvE/oSOUGJfF+7y9kbKn9Qx3TUPVA8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5066
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


在 2024/9/21 8:04, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v7 0/7] udmabuf bug fix and some improvements
>>
>> This patchset attempts to fix some errors in udmabuf and remove the
>> upin_list structure, also try clean up code.
>>
>> By this patchset, udmabuf remove page struct relay, only use
>> pfn and folios.
>>
>> Some of this fix just gather the patches which I upload before.
>>
>> Any patch has passed the udmabuf self-test suite's tests.
>> Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
>> Patch6 modified the unpin function, therefore running the udmabuf
>> self-test program in a loop did not reveal any memory leaks.
>>
>> Notice: Test item 6 maybe requires running the command:
>>    echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
> Thank you for the patches. Series applied to drm-misc-next.
OK, Thanks. :)
>
> Thanks,
> Vivek
>
>> Changelog
>> ===
>>    v6 - > v7:
>>      A little change, update some commit message.
>>      Patch3: add fixes tag.
>>      Patch4: update ack tag, remove the redundant if (!memfd) check from
>>              check_memfd_seals(). update commit message.
>>      Patch6: update commit message to describe how unpin array worked.
>>      Patch7: update commit message to describe why need reuse the folios
>>              array.
>>    v5 -> v6:
>>      Patch1 use Vivek's comments(thank you), fix code style, update ack-tag.
>>      Patch2, 3 no change.
>>      Patch4 fix memfd miss fput, use Vivek's comments(thank you),
>>             fix code style, update suggested-by.
>>      Patch5 update ack-tag, fix error word in commit message.
>>      Patch6 update ack-tag, use xmas style.
>>      Patch7 update ack-tag, remove unused ret variable.
>>
>> ---
>>    v4 -> v5:
>>      Patch1 doc why pre-fault failed not report error.
>>      Patch2 no change
>>      Patch3 update ack tag marked in v4
>>      Patch4 split some change into patch5 and patch7, this only contains
>>             udmabuf pin folio's function
>>      Patch5 add helper init/deini to clean udmabuf struct initialized
>>      Patch6 remove unnecessary code
>>      Patch7 remove reuse folio remove v4 patch4
>>
>> ---
>>    v3 -> v4:
>>      Patch1 fill vma area with pfn only when true access.
>>      Patch2 no change
>>      Patch3 select VMAP_PFN
>>      Patch4 use function pin each item.
>>      Patch5 use pinned folio array instead udmabuf_folio struct.
>>
>> ---
>>    v2 -> v3:
>>      Patch1, avoid use page, instead, use pfn, and use vmf_insert_pfn map
>>      suggested-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
>>
>>      Patch2, update acked-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
>>      And keep the kvcalloc on the same line.
>>
>>      Patch3, avoid use page, instead, use pfn, then use vmap_pfn map
>>
>>      Patch4, split v2 patch4, single update codestyle to keep review
>>      easy.
>>
>>      Patch5, another way to remove udmabuf_folio
>>
>> ---
>>    v1 -> v2:
>>      Patch1, 3 Rectify the improper use of the sg table.
>>      suggested-by Christian König <christian.koenig@amd.com>
>>
>>      Patch2 add acked-by Christian K�nig <christian.koenig@amd.com> which
>>      marked in v1
>>
>>      Patch4
>>      Modify the data structure to restore the use of pages and
>>      correct the misunderstanding of loop conditions such as "pgcnt".
>>      make sure pass self test.
>>
>>      remove v1's patch4
>> v6
>>    https://lore.kernel.org/all/20240909091851.1165742-1-link@vivo.com/
>> v5
>>    https://lore.kernel.org/all/20240903083818.3071759-1-link@vivo.com/
>> v4
>>    https://lore.kernel.org/all/20240822084342.1574914-1-link@vivo.com/
>> v3
>>    https://lore.kernel.org/all/20240813090518.3252469-1-link@vivo.com/
>> v2
>>    https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
>> v1
>>    https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/
>>
>> Huan Yang (7):
>>    udmabuf: pre-fault when first page fault
>>    udmabuf: change folios array from kmalloc to kvmalloc
>>    udmabuf: fix vmap_udmabuf error page set
>>    udmabuf: udmabuf_create pin folio codestyle cleanup
>>    udmabuf: introduce udmabuf init and deinit helper
>>    udmabuf: remove udmabuf_folio
>>    udmabuf: reuse folio array when pin folios
>>
>>   drivers/dma-buf/Kconfig   |   1 +
>>   drivers/dma-buf/udmabuf.c | 275 +++++++++++++++++++++++---------------
>>   2 files changed, 169 insertions(+), 107 deletions(-)
>>
>>
>> base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
>> --
>> 2.45.2
