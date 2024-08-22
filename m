Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F595B1F7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A4F10E036;
	Thu, 22 Aug 2024 09:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RKcipQyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414F910E036;
 Thu, 22 Aug 2024 09:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db0+kPbY7o/B0j/oIEOjZZ9owKFta1vLKR2LsCkMFH+nUIFOlhlZplW59GD70rAicmIsZdThKvszeER6qrwiirOEzOnvmslbaYCSMk7u0uXVZZj/Lw+3KRBNGgO7f8lfJ/jFeZXH+bUmwrs6HKPISld5OzW2h3sXeNBNddnNw+InyGrHSvxkRPUAzeNOnINtaEcFy4KNgNQlrqhFafccqrqJ65KhqYCbBSazIgPDDr1eQbWyUFuVSV9fhLZPctj4R/PG0CtuxfTrVNXoIue1PH+QyCxop3tJMh45LmRByWisVx84Dxc28hPQvv5LCdoi4Y50VymFX7VNIIlqrBKNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol22zU7P6/Akq0tLOMf9aUhcdK9bNfAbArHSqEqHdrE=;
 b=tjKRvr2VzUFfC+djUAmzqsRTePygVTd9Jo4D1klUby2DvBVsxfDv5951MBErJNUg8jIKcwHGLGq7uQMr776sfuHJVsjPSntxx89WzFa2679wzTnMUvfNw293nivH8QSDEfDw5rscgJwQCLHssdz+T4puUe3ccjAkgGRXC83FCmP223WfgsEO3TQEJ2Z+b8rn0xlYDifkOKjiZ+pM5O+b31lm44JYliUC+Dcbn616mq/f63qErdkJFSUhx755FxkR9HVQNwy4Sni5uVAcRpxmOYCh4KrL+oGC+cDLTMGmNNi1hS+wa4eQW+SSkLyfJ7Ll/KRRbiNbHwQqLpyxyK6f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol22zU7P6/Akq0tLOMf9aUhcdK9bNfAbArHSqEqHdrE=;
 b=RKcipQyrT4fDXrb87KxoqPNp5HnWIgBWQF73NnJI2t0psGF8pGOHh2WSy2pWX5erx1WRWVitmQanDgTeqM+i1EYN0jbclVB7Xm3YgoXog75TOB1A9NyVLRpEX4B67HgZ6rs/ValE42FWtGSTKbRnN4pqsJa+tdpUbSB2OC8k0iI60JmHrU/BDJYF4XdA+V1ZMSD8aTZ9gM84sGjM1MauyZs2k0niQv18KTQW9sWrOOB2DgWNSIuWtJMo1xC+idAQabhrQ8HFMrBOKEhGfOQzj8LMsJqBamDXGi4d+CJwqJ5X69a0jvqO5ix7+be/AnhWDVUSk4XmmljAtZuz3jJM8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by TYZPR06MB5122.apcprd06.prod.outlook.com (2603:1096:400:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 09:42:25 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:42:25 +0000
Message-ID: <cf308060-3098-4200-8e02-1ee725ae5ff8@vivo.com>
Date: Thu, 22 Aug 2024 17:42:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers:smumgr:Use min macro
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240822065746.1336545-1-11162571@vivo.com>
From: Yang Ruibin <11162571@vivo.com>
In-Reply-To: <20240822065746.1336545-1-11162571@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|TYZPR06MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: faa6d6b4-acde-4f60-532f-08dcc28eba65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|81742002; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3ljTDdsdkhUT28vRHk1U3IvZmY5K25LeWI4LzBscUNvTkdYZUdMZloxdk1O?=
 =?utf-8?B?bnFUWElwMmtsb1g3Wkp4WGljN0VRWWVPZjF0bnZYRzA1VXFNL2VWZmdhN2JF?=
 =?utf-8?B?SWNrajhMendZeEo2U3VJb3NyVUpaQ3VRNVQyOGtUekpsOEhUVEdwZVBXc2Fa?=
 =?utf-8?B?YlVYbkVtcTh3aEs4SmcrZWVCR3ppT0t3eHl0K3N1OHhva2dXKytPK1VLb2Mr?=
 =?utf-8?B?MUlGd2IrWUNQdWNtbkd3cW45NVZIN2puM0lTMzNIbDI1TURJdEtMTjYxcTJa?=
 =?utf-8?B?d2s4dEpwVVphQTNUYzN1Sy9PaTc4dGFrbHdMTktuUUd3Vys0SHVvL2g4enFJ?=
 =?utf-8?B?REV4Zk1PcFBaQ3B4cnhPa0JvdFdYL01ySVNEUFdrd3UwaHFHbkEzUkpHSmxB?=
 =?utf-8?B?MnJEUkVmMGdPOEdrTDczWFA1UXlGU0VrdWFNVWdFMHlUSVJxQlBJcjcrS3ZP?=
 =?utf-8?B?SEdib2RlKyt6SHl0VUl2RHh0Nm9wYjdlSGFDQVQyZEdvU0hjVGY4OU4xdWJT?=
 =?utf-8?B?cFBZdnVqaGgwS1NTZ2ZodkhvMXBJWThWN0R3bk9pNXpsRWFpOTk0NnhaalNZ?=
 =?utf-8?B?bUo0MlNOSTZsL1N0TzhTeVhHQ29McEJwYWw5QzYxeHZHUmNrakR2UHBxZ2tj?=
 =?utf-8?B?RkxSV2g2Qnc1cVNjNWVOQXlmRjc0Sjc5MkZmdm9SdERDTUZyMmU3Znk0TVRm?=
 =?utf-8?B?bHRRRDJTclBYMzhXNnRwa1dsNWw4ZVVpRDJuczk3SnFuZFI2cG1PcVExRnNm?=
 =?utf-8?B?YTdOY0xNWVFyd0pYNXZ0MEVZdEVOWmE5VE9QcCtWVk9nME9vZ2V6R1Y1UnNO?=
 =?utf-8?B?dGFCQVZwN2tUYUppSVVza2JpK0lKV2xNTG93WmR6UFJWc0Y2bTQ4V2lvSjJQ?=
 =?utf-8?B?OGVIMEFiSVJ0V0F3Z29KcGNUZWpEN1F6MHd6WjFnY2pjckVrZXZIZ29TNTl2?=
 =?utf-8?B?enUzUm5hQmlrSXc2UzFsaGwvVyswbWJnSjJOaVYvTmRlQ29relRGNkVVZUZB?=
 =?utf-8?B?R0RtRXVxczFLdWs4c2x6R25nbVlVY2JBajFlR0F5cy9ERDZzNitidnF6ci9h?=
 =?utf-8?B?SlBrVVgxWGVxTWJzSUhkRjZnUmQ4T3dySmhvMVlRKzZrb1pIaEhOT3d5RFFN?=
 =?utf-8?B?UGtsTTdqaE9kR3puVmJtTVdBZ1lNS2UwemUrNGtLeFVkYlVpTkg5cXR1NGNB?=
 =?utf-8?B?SHJ6VHo2dHJ1SUtFSlphcFB1UnN3UlNPM3g1QWRVSEJhOThWajdoVFVJMzQ4?=
 =?utf-8?B?MS8yTXplU3VYRWRRNmVBVnJrVFRMdUladXZBalE0NEp1c1NhZGRaOWZVMEZO?=
 =?utf-8?B?enJnd0RJY3FGSEVRZmNuaHVzeEtpZmluVWRCMjRUeHkvQ0lpOEJROFRiSHdP?=
 =?utf-8?B?aU5GQldXTGh0UG5OekNuUTk0SXZnUHBuMXo1V1RSdW1jR05Ib2ZVb2hkYVhX?=
 =?utf-8?B?cjJMYzFqVEhhK29lZ3JKby9YSWhBcVBrR0FxVFBjUjRGMlpjSDlIMndIcnF3?=
 =?utf-8?B?WkFrRnRuRjdhdWxEa0F3YjVMcUYydWdiL25pZ2tFUDJiT3dqWHE4SHZCdmtR?=
 =?utf-8?B?UGJiZmE3dEZZcVI0TWtaYzlRRG5SbmUvVFR1Wkt1K2dOTFMvSkRjMVNtT295?=
 =?utf-8?B?RWVTTUlrZDhqWVgyUXB4aThkQkNJeUZRYk14MjZ3TlBFNXdhM2U2MW85QjZW?=
 =?utf-8?B?NlZVVDMwUE5qQk9IbEY1OHQ1VFdoNy8yWndDbmJzaEdocFg2SWpKWXhEZDFl?=
 =?utf-8?B?NVIxS1BsWEhBSTU0dXpPZDF2ejB1alFKQ3YxSEdsTC9SMU0zV3h6MnpHZnd1?=
 =?utf-8?B?Vk9DaGdVWDhYaXhON05JY3gxK1hpbkdKbGlnWEcxTUNNZDB2eXlSZkJla0tD?=
 =?utf-8?B?KzJURW5nUzl4U0xEUCtCMUY0TFBmVTI5cE81Zm53d3gwb2R6a2NEOXU0WXB0?=
 =?utf-8?Q?F80tF2KTRsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6263.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(81742002); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE9rQnpKc2tLY0tKSkx1SUc1VHhkSDZVcG5KYlQyZU95MnN5QXV4TzBhNzF3?=
 =?utf-8?B?NUlZVFEvdDVuQitCMUsrc2NKUVlOcXZYM1hoQ1dkdEdNNStNcWhTUit4VCs4?=
 =?utf-8?B?eDZSS1NIRXlST1Y5ZXhqR0dhd2VMbW9ndjFoYWIvY3VEb2JtUWU5SUxtWHFU?=
 =?utf-8?B?MlB0NDRtU1ljV1h1NWQ3NURlcmtpcGdaMDNidHZlTEpXN0ZsWjkrd0FJUGY5?=
 =?utf-8?B?cU9QeDR6WFU2NHA5SGRYT1dTaERTZEQzaHNzUXJPT3lTdXFXeXdhb1ZoY0RF?=
 =?utf-8?B?Zy8yRnJwSG02bHAyU2FUS1ZQMDN4WjNUUnFNcGlIRlBjVWVuZUhadW1sM2Jz?=
 =?utf-8?B?Q1BhL0Zmb2I1V2JQU2RjQ1daMnNoVlBMdWNNUitERHRZY01pMkwzRkZWZmRj?=
 =?utf-8?B?UUVFVEdxMHVNME9YaTFJMllUSDExNzdBNk1RQTFYQzVJNlZJYks1U2VjT2Q3?=
 =?utf-8?B?K3JjNHgzVFpPUFlMRW1SckdaTmtHK3hnWEw2NFRoczhzQVVXY2swWE1XRFVs?=
 =?utf-8?B?cXVLeVFUOWs5QnVhc25BakZQTGhRK0doSXl6OVNJcU1JS2Y0cmhtSERLaXp5?=
 =?utf-8?B?ZDFwZk1jaGs1ZzhITzdOV1dIVFljL3FHZkFCR0N2Q3VDVDU4a3JuaGh6Tkcy?=
 =?utf-8?B?cjE0OTQwVCtlbmlyMW9JeGkxbGN3V2xlL0owaGZvTkpxdTUyVHpnT3k1Z0Yr?=
 =?utf-8?B?T2l2am9IN0FKbjV6YjJSelBUd0h6Tkx6NTJNTWVrOE81eHBYVW5OS3JyVXFm?=
 =?utf-8?B?Q1BTeTB2UEpLNmYzVnBnL2JiVzFJVlJ4cUhibWhjZG9sdFBYMUJ5ak5KcS91?=
 =?utf-8?B?NmpoM0dHRGdaS1dqd2YxWStwM09CK1dqdFRxMDlVL0ZaU3FoTis3VmJ3VHcr?=
 =?utf-8?B?UkxLM2hhVEpWcWxtRkl4Si9wYjZZdlVua1JWajBIUzN4TG9OMXE4by9RV0JN?=
 =?utf-8?B?dlhYSjNIeXVBRTNWWW1oREdQdHd5c3NDSHlRTkZYRVd0c2wrcElHbUN0Sjk5?=
 =?utf-8?B?d1FJeXRKajhYemZPQkR6NUw3YVljbGd0c1BoVjJoWE9Uazc5akd2YkdvSGwx?=
 =?utf-8?B?UWFJOWovR2V4T1ROTFRhSW5OYWdVUmZPeHU0eFFNUzJCdk5zZExLVVg5MWVP?=
 =?utf-8?B?d3ByejQzT1ZsVE5HelFHMEF1YnhNemowRFJML0EwdGNHLzk2dWxid1dBLzJC?=
 =?utf-8?B?QUJoTFJ6R093YzhLd2M1QktKaHgrZFM1ZHZ0WjVod0llT0EzSW8vcFFVWjlh?=
 =?utf-8?B?U2hja21kUmV6R2ZVQ2hIYm9QbGNWUWNGaTUraDdCcmxIeDBwUS9EdXhKaVhw?=
 =?utf-8?B?MlNNNTc2ZjdvL01UUThvZ04vcnltK2l5WTZFQ3QxU2VVeXBNbG1oTjQ2WFdS?=
 =?utf-8?B?bU5nU20rVStTY2xHSDFpWTBNSUFkbnhjUnRMVGh6aUR5R3NONi9WVGRWNXBa?=
 =?utf-8?B?eHA0eGh0Yk54bVRHazJVTzJjNGxiTzdrM21BM1R5RTcrazN0TU5RalYyYVFX?=
 =?utf-8?B?aUJyVmFEa1VlRmhmVFBmZjFhTjUrcXZuWkR0dmxFL3F5NlNoaTZCVUJKRWNt?=
 =?utf-8?B?MUNRSjRJSkNZaXZNek1KK01hdjJ0RElJWElkVjFDelZPUjBlczhibVRmZWdz?=
 =?utf-8?B?bEhuOXVualJpSWVUT3FmRS9RQ3RUYWVnNlZVeWUyVFI4ZFRsUmRORFdmeSsv?=
 =?utf-8?B?ckVaYUdLZHMyY1NkcDFiREdLeTZZQi9QeEsxMWlmU2lYME1LZ0tnVVRqZGYw?=
 =?utf-8?B?Uk1WOW9CcHk5R0VlM0QvcGFodUVadU4rZHI3ZEhLNjhJSlhoMnZYUngyZ2kz?=
 =?utf-8?B?TWRNd3MwTjVra3Faay90aFh6R0Q2ektkcU12MHpHR0xUdXFWc0pkR0NyZ214?=
 =?utf-8?B?Zmk4Yno5TFp2cGtzZTVMOTlMRERYYjZuWGN0dnMxS0dzM3Q3VW1OcmRCeEZV?=
 =?utf-8?B?VUNKemY0bDQrZk1GT1ZLT0dVempqbDI3SEMrMEVLT1AxeXhmREJ2ZnN2RGJE?=
 =?utf-8?B?SzlwNXh3NDMvSmluWndUQmxtMTVTd2dhNXBZS0tEdDk1UXd5UjQzSVRLeU95?=
 =?utf-8?B?VWJQMG5Ud3hmM2YrV0hwWmIzUTkvbVZFTEZDVjRhUllYT3ZKMHd2cDBTTTkv?=
 =?utf-8?Q?ZvczWEL5RTak9DjgxfEMFATlV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa6d6b4-acde-4f60-532f-08dcc28eba65
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:42:25.0152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YBzWjdCnKd42GG2AglWjsbFsgXfN4ekYlYIEVam/qSQ/SMafcsMxTuziCI1lLAXSxZzhl07U1hXa+GlToZqsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5122
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
Reply-To: 11162571@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, please ignore this patch.
Because the corresponding header file is not included, there may be 
compilation errors.

在 2024/8/22 14:57, Yang Ruibin 写道:
> Instead of using the min() implementation of
> the ternary operator, use real macros.
>
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>   drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c      | 5 +----
>   drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 7 ++-----
>   drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c     | 5 +----
>   3 files changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2..8bf80f65f 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1067,10 +1067,7 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
> -		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> -						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> +		mid_pcie_level_enabled = min(lowest_pcie_level_enabled + 1 + count,
> +						hightest_pcie_level_enabled);
>
>   		/* set pcieDpmLevel to hightest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index ff6b563ec..62d9156ef 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -1127,11 +1127,8 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
> -		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> -						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> -
> +		mid_pcie_level_enabled = min(lowest_pcie_level_enabled + 1 + count,
> +						hightest_pcie_level_enabled);
>
>   		/* set pcieDpmLevel to hightest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
>   			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 34c9f59b8..4616c3261 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -938,10 +938,7 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
>   						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
>   			count++;
>   
> -		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
> -				hightest_pcie_level_enabled ?
> -						(lowest_pcie_level_enabled + 1 + count) :
> -						hightest_pcie_level_enabled;
> +		mid_pcie_level_enabled = min(lowest_pcie_level_enabled + 1 + count,
> +						hightest_pcie_level_enabled);
>
>   		/* set pcieDpmLevel to hightest_pcie_level_enabled */
>   		for (i = 2; i < dpm_table->sclk_table.count; i++)
