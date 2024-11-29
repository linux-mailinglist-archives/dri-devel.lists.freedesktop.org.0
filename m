Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB759DBEB7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 03:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795D310E29F;
	Fri, 29 Nov 2024 02:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dalB5mR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3C310E293
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 02:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFvfAAV4fVMqLiORBB2Y3JmCGi3y/kQZu8GWMIeHpyHUQtW7yVsqxqdh9BIOmu2FAcQFdVa9Euht4FEV8eyQAI6uKdWBb0/E0ZPd41pWrW6CcQBBOaBf5wW7TtV8i38tUqYVhzPIT64yzYm59fqtn/+Nh0ukganEMfbjOhJ9EQF3MEb4qBEIRni7FOTAumRVTprEqz2MxG41yonNPdAnt1te73FZfragvgQzLdJXGQPCDbXDPm01lUDW80fK2NerohriiSwrm+QRuEZwjf7ElUCb4EjhbWIF3btU5pnJ6IzIyXKtGeuFwL1yq6Y9tNLS2weiL/MSKrS+9TEJDOBghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfTd7i+cO4E51tx8OJKC/HTn9xVcdbha2RoseeLtvOk=;
 b=MMZNxyply2m5QH1LUffOys7prUp9Lq4GBl8zwCIfnBVC6+6uqEhx9ZX1vc0YLDJqdljlXCYpIV5/9lvK6xgPxrHSC/Q4/EiJviYP+Dg5cxKqgg5umQf9M0wbWopANA3quS8hhW2x6KNgS4yLmhurq4ck7hOq70MTX7iuOzdA7/QiD62CZe1Bjge6WPShEtA7YjC4uwR7fQnl62HXWvrTxHfE3g6XlhOEZ1R0E4mAMdqQ+hlGxfYkaPLX7lmx4xyNUwSuhNLV9QBidcXmGCU6QZ4k4ADYWBVNcuFdmFAKL/8ZdIJbPTQSBl8X/NlmwFPsaT3Zknwau2u88Rzi4BDKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfTd7i+cO4E51tx8OJKC/HTn9xVcdbha2RoseeLtvOk=;
 b=dalB5mR6ZUCX8kNNmxY95kQKtsacZDYmhHTQaHbsu+wV56VEMeBJg4ltgdj7rOBW+47/2IgUP1s+EhX06UnrcqmERuKm5NP+qJRVNVkdKPDTA+fMbpeH6yywmAS/aNuzclhVJpqzTHD7a++FQtCVe+DJagnlAxuPFW0GJGfdWASLnCpdgD0BuCXBAaOcxodbd3HICEEJ0VxddSXOONvHykmIOZi9mTVPtHMfDlyXph/sNKWw9e0HrmOdpOjqAYC3/SANROPI2C9k5PqOPLPxWlyG9S5b0MWAvvsmOc49BB9JLN1Web1aK6qs7qZLWuhqzIjIyjJUmLJ7KBHLpRoYYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10281.eurprd04.prod.outlook.com (2603:10a6:102:467::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 02:30:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 02:30:24 +0000
Message-ID: <0cf75072-389e-412d-a4de-759ec558ee7c@nxp.com>
Date: Fri, 29 Nov 2024 10:30:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,09/19] drm/imx: Add i.MX8qxp Display Controller display engine
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-10-victor.liu@nxp.com>
 <70094b6a-55da-4492-8980-3c2524427a7e@linux.dev>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <70094b6a-55da-4492-8980-3c2524427a7e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10281:EE_
X-MS-Office365-Filtering-Correlation-Id: bd27ed16-1e3a-40f9-7139-08dd101dc734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlxZ0JJcm5TdDUyWFlvWDJlVEpYNWMrZFYwcHU2L0tKLzRVK1NkV2dXUHRa?=
 =?utf-8?B?NVdCVHlOSlZFWVBlWTRJbjZGQ0dJSnhaRGlCVXdaTzFicjZHM2Y1bUlYVS9K?=
 =?utf-8?B?dW1KZVo4YzhxaUpXSDJmQlhiYUJlSnZRZkMzb2VMVGRjbWRjb1VHend4MC9x?=
 =?utf-8?B?ZVZzNUVTREYrR01maXVCNFd2ZDUxU295dnBRTVY4UGkxVitzT1FpTW1IMmhP?=
 =?utf-8?B?YUVONTRoaXdRS3dUSzFmYWJRM2hOUHlabWpZK0hiQ2IxUll4SmFTSG50OW53?=
 =?utf-8?B?L3hJS1NESDY3OFZCMDRRd1RodjMxWTFmN2pPM0YvN3lmM0JJbDI2ZTVNdXUx?=
 =?utf-8?B?M3dKMDBHS1l1ampXdHp4OER2NGI2WUFEdHRyZm1rNEhxd2ljNzZrdzhnd0FN?=
 =?utf-8?B?cXBZY3pTVUtvVWljYVdZV1ROR2hwbHJBL3NwbXNnejc0WFNOL1N4RkU3NUND?=
 =?utf-8?B?SGFWRE1jQXVDWWdKOHUycHU5S09pOCtJQ3Z5Uk1hNUF0UTJUemZWRGxzclhD?=
 =?utf-8?B?VlIvVWF3VlI1bEZmYWxQYU9OekUyNVc3bFdwTTA3cUcyR1R1a1p0Uk9jSjc0?=
 =?utf-8?B?Qm43Y0RiQ3BjWVpTTnhHNU1GV3hyUVBUUzRKcGczQnd1T21NMW1ONXd3Wnpw?=
 =?utf-8?B?N1pFVjRhN2NBYTRIcmt2UDNIYldwL0YzNWdwZ2o2bHg0dW9CZGhic1hpZzk3?=
 =?utf-8?B?MGhRSVNHOHFnWGo1Sldtc0g1NmFKZ2VPdUpqMzdabzNPTjZlc1liVk84c3JO?=
 =?utf-8?B?OUxzbXh4cEQwQWpaUS9Sc2ZFcC9MT1hVM053bnZLWDRWQzAzZW9NdjRYNXEx?=
 =?utf-8?B?N2tEZjRSWWEvckVwTDEzdnVVS2F1dTJPYm0rckV2bXRNVE1talIxQmZqYnkv?=
 =?utf-8?B?ajduWTlWSmdTaE0zUVFzQU8xd2MzaDNjZU1jUDIrMldTUk0wd1dFKzc0SUc5?=
 =?utf-8?B?YitoRTE5ZnJ3c3VLcjlKaVd1QlkrZmtCdmJFbExnRVhaMm5BSnppa2grSGt2?=
 =?utf-8?B?TlJWQ1hMQm55bjF1eElUcFJhOFVrMVZTZzdaVlhjUlNWTGNQdHBJbkhqNlhU?=
 =?utf-8?B?UXpWYytFR2lJeDhjSmZoaFdSTTV2WTRob0tycHpaa1RzR0FNa2piWUJJaUQr?=
 =?utf-8?B?dGpKbWttQ2w2RGFBd2o1elRBMHl5SEdhWEdTb2k4ZXQ5ajR0TWRqdHhLUE4v?=
 =?utf-8?B?aXlvQ2ZWQ0hLQTQxV3h2azNjc0xFajFucUdWY0xsNG5LOFN6VUIwMUVwQUlF?=
 =?utf-8?B?NjFlbE9CaHpyK0Jja3E0a1JlbDRPV0VIL2JMYUxydlhhUEFaSloyalZSaWY4?=
 =?utf-8?B?aldBVmMxb3RnS0tPYmdIR1c1eWMvSHlNUlorenR2ZWM3OWI1MXM5ajNjUUdm?=
 =?utf-8?B?R1U3T0lpTWdpd2ZEZzdyOG81OUxlMTF3MDM1YU9PbGlmQ2h1K3crWWU1NHpB?=
 =?utf-8?B?NmtWWTdGb0M5VGg4b3dLNGRhSlA2TmRSTzRaREFiaG9ZNlZFWklxZlYxdUpV?=
 =?utf-8?B?VjlMaFBBT0kxV0JUaVRpVlA1c1JOV21xdWV0MFFFSlRxb0M2RWdkOFVoYjRw?=
 =?utf-8?B?MHJ5dXViSFNtbk4zcWxXSHhPRHd0MHhaY2cvLzA5Uk0wNW9sVW5hb0RmTTl5?=
 =?utf-8?B?eHNzQXlFR2d1VFQvQkFFdlFuUzB3RGJhaDBnaW5BM1ZWaDI3djZtRjV3NG1n?=
 =?utf-8?B?Y1pROVdnM2k5aUlUQ3QxZmRQbmFmdWtGdzR1N3FqT0o5TWFveGdkU0JJNFNT?=
 =?utf-8?B?Q2NQNVZMelBQRkVxOHBLaThFdlRSNGFNV3FTQlJIc28zS28zYmdlUTh5UFU3?=
 =?utf-8?B?RkJiSFI3ckJJemRkRGpRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJUNG9Rc0xJUm1BUkRKbGh0OUsvSUhJN0lpNFV5VjhFZU1nOHB0ZW1ZTGla?=
 =?utf-8?B?MHBTRnFJRHJ3cjltQnVWV3pFcUg2alJQNEhYNWJXVURLT3lXeDVZQmN1d0dt?=
 =?utf-8?B?TmFEaTd6bisvS2FPMlF2RjN3RUpGY1kyN1BYSWJqR2UwSzRxYS85R0RTTnVz?=
 =?utf-8?B?RWhxZVJSVGR5emM2NThxL3Q3T2E3VWJVbnRRQkszWlR6YituSXM4bUNrQVll?=
 =?utf-8?B?ejRJRzNvak5yRWt2bzZ3UTVKN1lsTnUzcnh2UVFidnB0b2JYMTd6OVlQUEwy?=
 =?utf-8?B?a1NVVnE2T1hPanRIbVNLRkozT05Mb1ZnL1FZYjZoQlRmM3gxMmg5YTRqYUFl?=
 =?utf-8?B?MzhGUjBkcUZ2Yml3TUhsd3hEVGNTSHBBRGEyVTE2V1RaMmVtVlU1VXZGc0Vu?=
 =?utf-8?B?ZTlDUEhVQmhheHVVREhGcUtyZVhaaHVpRFZ2T09keG1zYVFYaGJBVmZwQ3lr?=
 =?utf-8?B?MTVGODFDTkJtOFpnMXZ4T2JJeStjSnY3WDk1anhOVDE3cUliOWcwWWNYQ1ZP?=
 =?utf-8?B?VzRJQXllVmVubnNkWGZTNVNXSHdBNTQ5S29ycEF1aTVnN2E4MUlsUFI0SStv?=
 =?utf-8?B?OVcxT1dFWkNWdERLYUF0emFnVGpPNndqWVZBejJUNXZwSkJmaGhXcEx6b2dH?=
 =?utf-8?B?UmUwTy90MzMwZU85ck9rbllYKzhLTWdPbW4wM0J4UjlnbEp1QjhMbUt6WDA0?=
 =?utf-8?B?My9NWWFrTWF1UjFSemptRmtpY01tM3BDVVV6NXovYU5sN3ZINWRraHZSNHAv?=
 =?utf-8?B?WUtmZ0ZJdG9LQ2ZaSVdEVi9NYWc1M0JieVo3WXFPSHdMU1FiZTFpays5WXpY?=
 =?utf-8?B?cHZLNDFoNGI3L2o5dDZraDdSbU9aZ2hGVCt4S1VaNUQrZHh2dXBZcFZSQmxn?=
 =?utf-8?B?S3BieC9wNjlVYmlOcjJvRWJXSzhlNW05UlFBSkx5MkFqb3VrMHpLbkNwazQ1?=
 =?utf-8?B?c3FGUVJ2NXU3SkJ4cjBvVlNqa21CZzl5dDBSY3BGSFppeVRSUHI1K2ZOVy94?=
 =?utf-8?B?dWtIMmI3dGFEVElMMDdadDJybXdiVFBRWFBFaWo3dFh6M055MDV3NGVST1hO?=
 =?utf-8?B?aDV5Tit6NU0vUHhsWU9Cd2o1VHd5RUFHRkNod0JxQVdJREhjQkZ4QkkrSXQr?=
 =?utf-8?B?NlhHSFc4UHd3WUd0TTNsZlY0VUVOWHRjTzdoN0tRRndSSHZiQ1pUcU5TcjRD?=
 =?utf-8?B?U3dnZHg5T2FkWG1SRkY4VzVnNy9WeXNMenljOE5FREUwdGFRNThPTWNTLzR3?=
 =?utf-8?B?TmVnNnh0QTNKSDEwaFhUbFpYQnptRCtDdmRhTG95aGpRaWZWTVN4YkhEY0di?=
 =?utf-8?B?eU9aTm9wYlduRzkvUE9FTUNLQ0Z4UDdqTUlWa1c4aEQ3dElMbysvVXpNelQ5?=
 =?utf-8?B?UHhkOGlpMThNS2Z0ODBCSG1nZ3ExbnFlV3crUFJFVWR2Tzgwc0dqTHF2Rm1X?=
 =?utf-8?B?dENsaDJmdDgwU2F0TUpyODlHV1hoNTcrWHhrdkZxME5ta0o1R2xvTmhHMEZn?=
 =?utf-8?B?NVd6Z0JhS1FaTXA3c0FIYXplQ1VFUFZHSDN1TWE5S2NpdDNPK0ZjUmZJVlBh?=
 =?utf-8?B?R2tDTC9taTJBeVRXbVRldk1MaFJHd3NLRWw0MStNUGo5Z0dxZ2ZrdlNJYnVM?=
 =?utf-8?B?cXhlYTRQVDBOcUNKTUUvMUU2VGQ0ODJaNFhyRzZXb0lXRjdiZjZSY084cDMy?=
 =?utf-8?B?M3NIT1JGTnVqT0VuVE5JM3V4b2x0M09nZHJuT3gxczYraVZwcEVRc0c1QlEz?=
 =?utf-8?B?MFlaeFRoL3hZM1dnY3cwcEp3MUNlRUxPc2ZaT3pndFkza3N0T1JtSEwzOGFM?=
 =?utf-8?B?WTZWRUZHQ2M5MUhSQXJaZWNkOUFjclQwVlZtU3U0cTEyall0MWVTb1JGRVAz?=
 =?utf-8?B?SStXSkV2M1hQMU5obUN5NStSWmRXM2dveVZxaWt3Rk9Da01nK09mYUZJcnBH?=
 =?utf-8?B?azRtZmcyb0tKbmpMMVlZS0xLZlU2RldUWGdaQ0JVSEY1aWVnc2J0Rm5jNmhv?=
 =?utf-8?B?ZlgybFpCb1NZNUlpVEhPNldTV3lIdTVoSHRCRnlwS3B2UU1jcHRiR1pSN1Y4?=
 =?utf-8?B?QmNCVCt3aHRLdFIyUFg0a09Bci8vL2QwZzR5TU9XUVlEU1hMWFo0a3ZUakp1?=
 =?utf-8?Q?Wm4AFElUSTIoBW9iMi74VthYq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd27ed16-1e3a-40f9-7139-08dd101dc734
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 02:30:24.1849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tQ6ruB/fD82lczm3n4Ss10QYiGBNDcF0IKZO2WdUAXksIgiB/U2j+RMoqZ2GN/9N0GcUIcens5Rr5R5LMDk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10281
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

On 11/28/2024, Sui Jingfeng wrote:
> Hi,

Hi,

> 
> On 2024/11/25 17:33, Liu Ying wrote:
>> i.MX8qxp Display Controller display engine consists of all processing
>> units that operate in a display clock domain.  Add minimal feature
>> support with FrameGen and TCon so that the engine can output display
>> timings.
> 
> The Frame Generator is used to generate video timings and constant
> video color images, traditionally this is sub-module of CRTC. CRTC
> itself is a minimal HW unit, shouldn't be divided further.

I think we've kind of agreed that all i.MX8qxp Display Controller
internal processing units are separated devices, including the units
in pixel engine and display engine.  This is reflected by the DT
bindings added by patch 1-8. 

> 
> IP blocks resides in the one display pipe ares ready to be drive
> once display subsystems of i.MX8qxp is identified. We won't suffer
> from the defer probe problems here.

I don't see any probe deferral problem.

> 
> So, please consider to *squash* those three drivers into one, the

The drivers follow the device-oriented programming model, i.e.,
each device documented with DT bindings has it's own driver.
Squashing them into one defeats this programming model.

> split would cause too much fragmentation which will become constraints
> for you introduce support for variants.

The drivers use the component helper(component.c) to be aggregated
by the master registered in dc-drv.c.  I don't see any obvious problem
or constraints if we use the components to support potential variants.

> 
>>   The display engine driver as a master binds FrameGen and
>> TCon drivers as components.  While at it, the display engine driver
>> is a component to be bound with the upcoming DRM driver.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v4:
>> * Use regmap to define register map for all registers. (Dmitry)
>> * Use regmap APIs to access registers. (Dmitry)
>> * Inline some small functions. (Dmitry)
>> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>>    KMS routine to initialization stage. (Dmitry)
>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>> * Drop unnecessary private struct dc_*_priv.
>> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>>    interfaces to bind/unbind the drivers.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Use OF alias id to get instance id.
>> * Add dev member to struct dc_tc.
>>
>>   drivers/gpu/drm/imx/Kconfig     |   1 +
>>   drivers/gpu/drm/imx/Makefile    |   1 +
>>   drivers/gpu/drm/imx/dc/Kconfig  |   5 +
>>   drivers/gpu/drm/imx/dc/Makefile |   5 +
>>   drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>>   drivers/gpu/drm/imx/dc/dc-de.h  |  57 +++++
>>   drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>   drivers/gpu/drm/imx/dc/dc-drv.h |  24 ++
>>   drivers/gpu/drm/imx/dc/dc-fg.c  | 374 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/imx/dc/dc-tc.c  | 138 ++++++++++++
>>   10 files changed, 790 insertions(+)
>>   create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>   create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>   create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
>> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
>> index 03535a15dd8f..3e8c6edbc17c 100644
>> --- a/drivers/gpu/drm/imx/Kconfig
>> +++ b/drivers/gpu/drm/imx/Kconfig
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   +source "drivers/gpu/drm/imx/dc/Kconfig"
>>   source "drivers/gpu/drm/imx/dcss/Kconfig"
>>   source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>>   source "drivers/gpu/drm/imx/lcdc/Kconfig"
>> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
>> index 86f38e7c7422..c7b317640d71 100644
>> --- a/drivers/gpu/drm/imx/Makefile
>> +++ b/drivers/gpu/drm/imx/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   +obj-$(CONFIG_DRM_IMX8_DC) += dc/
>>   obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>>   obj-$(CONFIG_DRM_IMX) += ipuv3/
>>   obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
>> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
>> new file mode 100644
>> index 000000000000..32d7471c49d0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>> @@ -0,0 +1,5 @@
>> +config DRM_IMX8_DC
>> +    tristate "Freescale i.MX8 Display Controller Graphics"
>> +    depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>> +    help
>> +      enable Freescale i.MX8 Display Controller(DC) graphics support
>> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
>> new file mode 100644
>> index 000000000000..56de82d53d4d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
>> +
>> +obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
>> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
>> new file mode 100644
>> index 000000000000..66b8918dc156
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "dc-de.h"
>> +#include "dc-drv.h"
>> +
>> +#define POLARITYCTRL        0xc
>> +#define  POLEN_HIGH        BIT(2)
>> +
>> +static const struct regmap_range dc_de_regmap_ranges[] = {
>> +    regmap_reg_range(POLARITYCTRL, POLARITYCTRL),
>> +};
>> +
>> +static const struct regmap_access_table dc_de_regmap_access_table = {
>> +    .yes_ranges = dc_de_regmap_ranges,
>> +    .n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges),
>> +};
>> +
>> +static const struct regmap_config dc_de_top_regmap_config = {
>> +    .name = "display-engine-top",
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .fast_io = true,
>> +    .wr_table = &dc_de_regmap_access_table,
>> +    .rd_table = &dc_de_regmap_access_table,
>> +};
>> +
>> +static inline void dc_dec_init(struct dc_de *de)
>> +{
>> +    regmap_write_bits(de->reg_top, POLARITYCTRL, POLARITYCTRL, POLEN_HIGH);
>> +}
>> +
>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    struct dc_drm_device *dc_drm = data;
>> +    void __iomem *base_top;
>> +    struct dc_de *de;
>> +    int ret;
>> +
>> +    de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
>> +    if (!de)
>> +        return -ENOMEM;
>> +
>> +    base_top = devm_platform_ioremap_resource_byname(pdev, "top");
>> +    if (IS_ERR(base_top))
>> +        return PTR_ERR(base_top);
>> +
>> +    de->reg_top = devm_regmap_init_mmio(dev, base_top,
>> +                        &dc_de_top_regmap_config);
>> +    if (IS_ERR(de->reg_top))
>> +        return PTR_ERR(de->reg_top);
>> +
>> +    de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
>> +    if (de->irq_shdld < 0)
>> +        return de->irq_shdld;
>> +
>> +    de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
>> +    if (de->irq_framecomplete < 0)
>> +        return de->irq_framecomplete;
>> +
>> +    de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
>> +    if (de->irq_seqcomplete < 0)
>> +        return de->irq_seqcomplete;
>> +
>> +    de->id = of_alias_get_id(dev->of_node, "dc0-display-engine");
>> +    if (de->id < 0) {
>> +        dev_err(dev, "failed to get alias id: %d\n", de->id);
>> +        return de->id;
>> +    }
>> +
>> +    de->dev = dev;
>> +
>> +    dev_set_drvdata(dev, de);
>> +
>> +    ret = devm_pm_runtime_enable(dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    dc_drm->de[de->id] = de;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct component_ops dc_de_ops = {
>> +    .bind = dc_de_bind,
>> +};
>> +
>> +static int dc_de_probe(struct platform_device *pdev)
>> +{
>> +    int ret;
>> +
>> +    ret = devm_of_platform_populate(&pdev->dev);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = component_add(&pdev->dev, &dc_de_ops);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to add component\n");
>> +
>> +    return 0;
>> +}
>> +
>> +static void dc_de_remove(struct platform_device *pdev)
>> +{
>> +    component_del(&pdev->dev, &dc_de_ops);
>> +}
>> +
>> +static int dc_de_runtime_resume(struct device *dev)
>> +{
>> +    struct dc_de *de = dev_get_drvdata(dev);
>> +
>> +    dc_dec_init(de);
>> +    dc_fg_init(de->fg);
>> +    dc_tc_init(de->tc);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops dc_de_pm_ops = {
>> +    RUNTIME_PM_OPS(NULL, dc_de_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id dc_de_dt_ids[] = {
>> +    { .compatible = "fsl,imx8qxp-dc-display-engine", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
>> +
>> +struct platform_driver dc_de_driver = {
>> +    .probe = dc_de_probe,
>> +    .remove_new = dc_de_remove,
>> +    .driver = {
>> +        .name = "imx8-dc-display-engine",
>> +        .suppress_bind_attrs = true,
>> +        .of_match_table = dc_de_dt_ids,
>> +        .pm = pm_sleep_ptr(&dc_de_pm_ops),
>> +    },
>> +};
>> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
>> new file mode 100644
>> index 000000000000..17a44362118e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#ifndef __DC_DISPLAY_ENGINE_H__
>> +#define __DC_DISPLAY_ENGINE_H__
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/regmap.h>
>> +#include <drm/drm_modes.h>
>> +
>> +#define DC_DISPLAYS    2
>> +
>> +struct dc_fg {
>> +    struct device *dev;
>> +    struct regmap *reg;
>> +    struct clk *clk_disp;
>> +};
>> +
>> +struct dc_tc {
>> +    struct device *dev;
>> +    struct regmap *reg;
>> +};
>> +
>> +struct dc_de {
>> +    struct device *dev;
>> +    struct regmap *reg_top;
>> +    struct dc_fg *fg;
>> +    struct dc_tc *tc;
>> +    int irq_shdld;
>> +    int irq_framecomplete;
>> +    int irq_seqcomplete;
>> +    int id;
>> +};
>> +
>> +/* Frame Generator Unit */
>> +void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
>> +void dc_fg_enable(struct dc_fg *fg);
>> +void dc_fg_disable(struct dc_fg *fg);
>> +void dc_fg_shdtokgen(struct dc_fg *fg);
>> +u32 dc_fg_get_frame_index(struct dc_fg *fg);
>> +u32 dc_fg_get_line_index(struct dc_fg *fg);
>> +bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg);
>> +bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg);
>> +void dc_fg_secondary_clear_channel_status(struct dc_fg *fg);
>> +int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg);
>> +void dc_fg_enable_clock(struct dc_fg *fg);
>> +void dc_fg_disable_clock(struct dc_fg *fg);
>> +enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
>> +void dc_fg_init(struct dc_fg *fg);
>> +
>> +/* Timing Controller Unit */
>> +void dc_tc_init(struct dc_tc *tc);
>> +
>> +#endif /* __DC_DISPLAY_ENGINE_H__ */
>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
>> new file mode 100644
>> index 000000000000..e5910a82dd4d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "dc-drv.h"
>> +
>> +static struct platform_driver * const dc_drivers[] = {
>> +    &dc_de_driver,
>> +    &dc_fg_driver,
>> +    &dc_tc_driver,
>> +};
>> +
>> +static int __init dc_drm_init(void)
>> +{
>> +    return platform_register_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
>> +}
>> +
>> +static void __exit dc_drm_exit(void)
>> +{
>> +    platform_unregister_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
>> +}
>> +
>> +module_init(dc_drm_init);
>> +module_exit(dc_drm_exit);
>> +
>> +MODULE_DESCRIPTION("i.MX8 Display Controller DRM Driver");
>> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
>> new file mode 100644
>> index 000000000000..e1290d9a0a99
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#ifndef __DC_DRV_H__
>> +#define __DC_DRV_H__
>> +
>> +#include <linux/platform_device.h>
>> +
>> +#include <drm/drm_device.h>
>> +
>> +#include "dc-de.h"
>> +
>> +struct dc_drm_device {
>> +    struct drm_device base;
>> +    struct dc_de *de[DC_DISPLAYS];
>> +};
>> +
>> +extern struct platform_driver dc_de_driver;
>> +extern struct platform_driver dc_fg_driver;
>> +extern struct platform_driver dc_tc_driver;
>> +
>> +#endif /* __DC_DRV_H__ */
>> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
>> new file mode 100644
>> index 000000000000..eebbafe39d7f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
>> @@ -0,0 +1,374 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/component.h>
>> +#include <linux/device.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/units.h>
>> +
>> +#include <drm/drm_modes.h>
>> +
>> +#include "dc-de.h"
>> +#include "dc-drv.h"
>> +
>> +#define FGSTCTRL        0x8
>> +#define  FGSYNCMODE_MASK    GENMASK(2, 1)
>> +#define  FGSYNCMODE(x)        FIELD_PREP(FGSYNCMODE_MASK, (x))
>> +#define  SHDEN            BIT(0)
>> +
>> +#define HTCFG1            0xc
>> +#define  HTOTAL(x)        FIELD_PREP(GENMASK(29, 16), ((x) - 1))
>> +#define  HACT(x)        FIELD_PREP(GENMASK(13, 0), (x))
>> +
>> +#define HTCFG2            0x10
>> +#define  HSEN            BIT(31)
>> +#define  HSBP(x)        FIELD_PREP(GENMASK(29, 16), ((x) - 1))
>> +#define  HSYNC(x)        FIELD_PREP(GENMASK(13, 0), ((x) - 1))
>> +
>> +#define VTCFG1            0x14
>> +#define  VTOTAL(x)        FIELD_PREP(GENMASK(29, 16), ((x) - 1))
>> +#define  VACT(x)        FIELD_PREP(GENMASK(13, 0), (x))
>> +
>> +#define VTCFG2            0x18
>> +#define  VSEN            BIT(31)
>> +#define  VSBP(x)        FIELD_PREP(GENMASK(29, 16), ((x) - 1))
>> +#define  VSYNC(x)        FIELD_PREP(GENMASK(13, 0), ((x) - 1))
>> +
>> +#define PKICKCONFIG        0x2c
>> +#define SKICKCONFIG        0x30
>> +#define  EN            BIT(31)
>> +#define  ROW(x)            FIELD_PREP(GENMASK(29, 16), (x))
>> +#define  COL(x)            FIELD_PREP(GENMASK(13, 0), (x))
>> +
>> +#define PACFG            0x54
>> +#define SACFG            0x58
>> +#define  STARTY(x)        FIELD_PREP(GENMASK(29, 16), ((x) + 1))
>> +#define  STARTX(x)        FIELD_PREP(GENMASK(13, 0), ((x) + 1))
>> +
>> +#define FGINCTRL        0x5c
>> +#define FGINCTRLPANIC        0x60
>> +#define  FGDM_MASK        GENMASK(2, 0)
>> +#define  ENPRIMALPHA        BIT(3)
>> +#define  ENSECALPHA        BIT(4)
>> +
>> +#define FGCCR            0x64
>> +#define  CCGREEN(x)        FIELD_PREP(GENMASK(19, 10), (x))
>> +
>> +#define FGENABLE        0x68
>> +#define  FGEN            BIT(0)
>> +
>> +#define FGSLR            0x6c
>> +#define  SHDTOKGEN        BIT(0)
>> +
>> +#define FGTIMESTAMP        0x74
>> +#define  FRAMEINDEX(x)        FIELD_GET(GENMASK(31, 14), (x))
>> +#define  LINEINDEX(x)        FIELD_GET(GENMASK(13, 0), (x))
>> +
>> +#define FGCHSTAT        0x78
>> +#define  SECSYNCSTAT        BIT(24)
>> +#define  SFIFOEMPTY        BIT(16)
>> +
>> +#define FGCHSTATCLR        0x7c
>> +#define  CLRSECSTAT        BIT(16)
>> +
>> +enum dc_fg_syncmode {
>> +    FG_SYNCMODE_OFF,    /* No side-by-side synchronization. */
>> +};
>> +
>> +enum dc_fg_dm {
>> +    FG_DM_CONSTCOL = 0x1,    /* Constant Color Background is shown. */
>> +    FG_DM_SEC_ON_TOP = 0x5,    /* Both inputs overlaid with secondary on top. */
>> +};
>> +
>> +static const struct regmap_range dc_fg_regmap_wr_ranges[] = {
>> +    regmap_reg_range(FGSTCTRL, VTCFG2),
>> +    regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
>> +    regmap_reg_range(PACFG, FGSLR),
>> +    regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
>> +};
>> +
>> +static const struct regmap_range dc_fg_regmap_rd_ranges[] = {
>> +    regmap_reg_range(FGSTCTRL, VTCFG2),
>> +    regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
>> +    regmap_reg_range(PACFG, FGSLR),
>> +    regmap_reg_range(FGTIMESTAMP, FGCHSTATCLR),
>> +};
>> +
>> +static const struct regmap_access_table dc_fg_regmap_wr_table = {
>> +    .yes_ranges = dc_fg_regmap_wr_ranges,
>> +    .n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_wr_ranges),
>> +};
>> +
>> +static const struct regmap_access_table dc_fg_regmap_rd_table = {
>> +    .yes_ranges = dc_fg_regmap_rd_ranges,
>> +    .n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_rd_ranges),
>> +};
>> +
>> +static const struct regmap_config dc_fg_regmap_config = {
>> +    .name = "framegen",
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .fast_io = true,
>> +    .wr_table = &dc_fg_regmap_wr_table,
>> +    .rd_table = &dc_fg_regmap_rd_table,
>> +};
>> +
>> +static inline void dc_fg_enable_shden(struct dc_fg *fg)
>> +{
>> +    regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
>> +}
>> +
>> +static inline void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
>> +{
>> +    regmap_write_bits(fg->reg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
>> +}
>> +
>> +void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
>> +{
>> +    u32 hact, htotal, hsync, hsbp;
>> +    u32 vact, vtotal, vsync, vsbp;
>> +    u32 kick_row, kick_col;
>> +    int ret;
>> +
>> +    hact = m->crtc_hdisplay;
>> +    htotal = m->crtc_htotal;
>> +    hsync = m->crtc_hsync_end - m->crtc_hsync_start;
>> +    hsbp = m->crtc_htotal - m->crtc_hsync_start;
>> +
>> +    vact = m->crtc_vdisplay;
>> +    vtotal = m->crtc_vtotal;
>> +    vsync = m->crtc_vsync_end - m->crtc_vsync_start;
>> +    vsbp = m->crtc_vtotal - m->crtc_vsync_start;
>> +
>> +    /* video mode */
>> +    regmap_write(fg->reg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
>> +    regmap_write(fg->reg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
>> +    regmap_write(fg->reg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
>> +    regmap_write(fg->reg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
>> +
>> +    kick_col = hact + 1;
>> +    kick_row = vact;
>> +
>> +    /* pkickconfig */
>> +    regmap_write(fg->reg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
>> +
>> +    /* skikconfig */
>> +    regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
>> +
>> +    /* primary and secondary area position configuration */
>> +    regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
>> +    regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
>> +
>> +    /* alpha */
>> +    regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
>> +    regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
>> +
>> +    /* constant color is green(used in panic mode)  */
>> +    regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
>> +
>> +    ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
>> +    if (ret < 0)
>> +        dev_err(fg->dev, "failed to set display clock rate: %d\n", ret);
>> +}
>> +
>> +static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>> +{
>> +    regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
>> +}
>> +
>> +static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>> +{
>> +    regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
>> +}
>> +
>> +void dc_fg_enable(struct dc_fg *fg)
>> +{
>> +    regmap_write(fg->reg, FGENABLE, FGEN);
>> +}
>> +
>> +void dc_fg_disable(struct dc_fg *fg)
>> +{
>> +    regmap_write(fg->reg, FGENABLE, 0);
>> +}
>> +
>> +void dc_fg_shdtokgen(struct dc_fg *fg)
>> +{
>> +    regmap_write(fg->reg, FGSLR, SHDTOKGEN);
>> +}
>> +
>> +u32 dc_fg_get_frame_index(struct dc_fg *fg)
>> +{
>> +    u32 val;
>> +
>> +    regmap_read(fg->reg, FGTIMESTAMP, &val);
>> +
>> +    return FRAMEINDEX(val);
>> +}
>> +
>> +u32 dc_fg_get_line_index(struct dc_fg *fg)
>> +{
>> +    u32 val;
>> +
>> +    regmap_read(fg->reg, FGTIMESTAMP, &val);
>> +
>> +    return LINEINDEX(val);
>> +}
>> +
>> +bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg)
>> +{
>> +    unsigned long timeout = jiffies + msecs_to_jiffies(100);
>> +    u32 frame_index, last_frame_index;
>> +
>> +    frame_index = dc_fg_get_frame_index(fg);
>> +    do {
>> +        last_frame_index = frame_index;
>> +        frame_index = dc_fg_get_frame_index(fg);
>> +    } while (last_frame_index == frame_index &&
>> +         time_before(jiffies, timeout));
>> +
>> +    return last_frame_index != frame_index;
>> +}
>> +
>> +bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
>> +{
>> +    u32 val;
>> +
>> +    regmap_read(fg->reg, FGCHSTAT, &val);
>> +
>> +    return !!(val & SFIFOEMPTY);
>> +}
>> +
>> +void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
>> +{
>> +    regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
>> +}
>> +
>> +int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
>> +{
>> +    unsigned int val;
>> +
>> +    return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
>> +                    val & SECSYNCSTAT, 5, 100000);
>> +}
>> +
>> +void dc_fg_enable_clock(struct dc_fg *fg)
>> +{
>> +    int ret;
>> +
>> +    ret = clk_prepare_enable(fg->clk_disp);
>> +    if (ret)
>> +        dev_err(fg->dev, "failed to enable display clock: %d\n", ret);
>> +}
>> +
>> +void dc_fg_disable_clock(struct dc_fg *fg)
>> +{
>> +    clk_disable_unprepare(fg->clk_disp);
>> +}
>> +
>> +enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
>> +{
>> +    unsigned long rounded_rate;
>> +
>> +    rounded_rate = clk_round_rate(fg->clk_disp, clk_khz * HZ_PER_KHZ);
>> +
>> +    if (rounded_rate != clk_khz * HZ_PER_KHZ)
>> +        return MODE_NOCLOCK;
>> +
>> +    return MODE_OK;
>> +}
>> +
>> +void dc_fg_init(struct dc_fg *fg)
>> +{
>> +    dc_fg_enable_shden(fg);
>> +    dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
>> +    dc_fg_displaymode(fg, FG_DM_SEC_ON_TOP);
>> +    dc_fg_panic_displaymode(fg, FG_DM_CONSTCOL);
>> +}
>> +
>> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    struct dc_drm_device *dc_drm = data;
>> +    void __iomem *base;
>> +    struct dc_fg *fg;
>> +    struct dc_de *de;
>> +    int id;
>> +
>> +    fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
>> +    if (!fg)
>> +        return -ENOMEM;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(base))
>> +        return PTR_ERR(base);
>> +
>> +    fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
>> +    if (IS_ERR(fg->reg))
>> +        return PTR_ERR(fg->reg);
>> +
>> +    fg->clk_disp = devm_clk_get(dev, NULL);
>> +    if (IS_ERR(fg->clk_disp))
>> +        return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
>> +                     "failed to get display clock\n");
>> +
>> +    id = of_alias_get_id(dev->of_node, "dc0-framegen");
>> +    if (id < 0) {
>> +        dev_err(dev, "failed to get alias id: %d\n", id);
>> +        return id;
>> +    }
>> +
>> +    fg->dev = dev;
>> +
>> +    de = dc_drm->de[id];
>> +    de->fg = fg;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct component_ops dc_fg_ops = {
>> +    .bind = dc_fg_bind,
>> +};
>> +
>> +static int dc_fg_probe(struct platform_device *pdev)
>> +{
>> +    int ret;
>> +
>> +    ret = component_add(&pdev->dev, &dc_fg_ops);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to add component\n");
>> +
>> +    return 0;
>> +}
>> +
>> +static void dc_fg_remove(struct platform_device *pdev)
>> +{
>> +    component_del(&pdev->dev, &dc_fg_ops);
>> +}
>> +
>> +static const struct of_device_id dc_fg_dt_ids[] = {
>> +    { .compatible = "fsl,imx8qxp-dc-framegen", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
>> +
>> +struct platform_driver dc_fg_driver = {
>> +    .probe = dc_fg_probe,
>> +    .remove_new = dc_fg_remove,
>> +    .driver = {
>> +        .name = "imx8-dc-framegen",
>> +        .suppress_bind_attrs = true,
>> +        .of_match_table = dc_fg_dt_ids,
>> +    },
>> +};
>> diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
>> new file mode 100644
>> index 000000000000..05b86f41ae9e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-tc.c
>> @@ -0,0 +1,138 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "dc-drv.h"
>> +#include "dc-de.h"
>> +
>> +#define TCON_CTRL    0x410
>> +#define  CTRL_RST_VAL    0x01401408
>> +
>> +/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
>> +#define MAPBIT3_0    0x418
>> +#define MAPBIT7_4    0x41c
>> +#define MAPBIT11_8    0x420
>> +#define MAPBIT15_12    0x424
>> +#define MAPBIT19_16    0x428
>> +#define MAPBIT23_20    0x42c
>> +#define MAPBIT27_24    0x430
>> +#define MAPBIT31_28    0x434
>> +
>> +static const struct regmap_range dc_tc_regmap_ranges[] = {
>> +    regmap_reg_range(TCON_CTRL, TCON_CTRL),
>> +    regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
>> +};
>> +
>> +static const struct regmap_access_table dc_tc_regmap_access_table = {
>> +    .yes_ranges = dc_tc_regmap_ranges,
>> +    .n_yes_ranges = ARRAY_SIZE(dc_tc_regmap_ranges),
>> +};
>> +
>> +static const struct regmap_config dc_tc_regmap_config = {
>> +    .name = "tcon",
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .fast_io = true,
>> +    .wr_table = &dc_tc_regmap_access_table,
>> +    .rd_table = &dc_tc_regmap_access_table,
>> +};
>> +
>> +/*
>> + * The pixels reach TCON are always in 30-bit BGR format.
>> + * The first bridge always receives pixels in 30-bit RGB format.
>> + * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
>> + */
>> +static const u32 dc_tc_mapbit[] = {
>> +    0x17161514, 0x1b1a1918, 0x0b0a1d1c, 0x0f0e0d0c,
>> +    0x13121110, 0x03020100, 0x07060504, 0x00000908,
>> +};
>> +
>> +void dc_tc_init(struct dc_tc *tc)
>> +{
>> +    /* reset TCON_CTRL to POR default so that TCON works in bypass mode */
>> +    regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
>> +
>> +    /* set format */
>> +    regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,
>> +              ARRAY_SIZE(dc_tc_mapbit));
>> +}
>> +
>> +static int dc_tc_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    struct dc_drm_device *dc_drm = data;
>> +    void __iomem *base;
>> +    struct dc_tc *tc;
>> +    struct dc_de *de;
>> +    int id;
>> +
>> +    tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
>> +    if (!tc)
>> +        return -ENOMEM;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(base))
>> +        return PTR_ERR(base);
>> +
>> +    tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
>> +    if (IS_ERR(tc->reg))
>> +        return PTR_ERR(tc->reg);
>> +
>> +    id = of_alias_get_id(dev->of_node, "dc0-tcon");
>> +    if (id < 0) {
>> +        dev_err(dev, "failed to get alias id: %d\n", id);
>> +        return id;
>> +    }
>> +
>> +    de = dc_drm->de[id];
>> +    de->tc = tc;
>> +    de->tc->dev = dev;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct component_ops dc_tc_ops = {
>> +    .bind = dc_tc_bind,
>> +};
>> +
>> +static int dc_tc_probe(struct platform_device *pdev)
>> +{
>> +    int ret;
>> +
>> +    ret = component_add(&pdev->dev, &dc_tc_ops);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to add component\n");
>> +
>> +    return 0;
>> +}
>> +
>> +static void dc_tc_remove(struct platform_device *pdev)
>> +{
>> +    component_del(&pdev->dev, &dc_tc_ops);
>> +}
>> +
>> +static const struct of_device_id dc_tc_dt_ids[] = {
>> +    { .compatible = "fsl,imx8qxp-dc-tcon", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
>> +
>> +struct platform_driver dc_tc_driver = {
>> +    .probe = dc_tc_probe,
>> +    .remove_new = dc_tc_remove,
>> +    .driver = {
>> +        .name = "imx8-dc-tcon",
>> +        .suppress_bind_attrs = true,
>> +        .of_match_table = dc_tc_dt_ids,
>> +    },
>> +};
> 

-- 
Regards,
Liu Ying

