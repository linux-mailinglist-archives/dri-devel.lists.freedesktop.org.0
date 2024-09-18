Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DE97B6E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00310E519;
	Wed, 18 Sep 2024 02:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qu3JB8+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2064.outbound.protection.outlook.com [40.107.215.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B426210E515
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGEM/L0/RWhtqKuRZsLPCn8v+bQCSAcpr6dsNLTmGn38nQW7dekz2guprbG3f+qepL99lUsZO29L9nioPwPBpzyD5AbM/W4+3E4yCY8MXoxPZtjHm/j0/RUn+FyXp6+YByk5L10GQEdgF3q4zzyiVYzf9Xu1jlAqHuXG/p2B2RhxrQtT9734/fC+RjfdmWIo/SozC2izsNaeNsPdtIDVUGSe/vA914Gop2Ti/qppy9f+XCW0APHDg4w1AZXSva92MEWG42WI5QtUKKsDFQfv1uMtVpWtxDoz/boUiM8F28RHceZxGfCeqrrIig9C3sEURfwDxRBy9AvuQz6kirWdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMzgGgj3NgwLdKXnhpYPZxgFQlER0fazfsN7tOlr61Q=;
 b=wt4yr2YWaZ4LTh56Mk1W3wInpTHU9tH/JI4wnVIDZMJlLWwfGm30RQFcx7tikdo9JOmQaGFEHE1NhDvxKoWIjJMMt5yEFulYO3cWeW+Ws7ule8YDs3nc01/sDS/7k7A9VB5qbLSAVWdAYDuMoceqV90TGaE0I2HCluG8g83faPa8GomibRnlrueQIN61Un9YwRLZZvTbqAjDm0Bzg4gi+6jOK42+UhaZUGEkDq5JsPfcAnCnE3Erl+ZIMD5j5Kw735dzkRpudmA9xQCu0iOtFTXFBoNR+aVQpaB1tUr9tzvoswsDihwg7yEY9bfdr8at2LFnflZp2WCrxF4zlemJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMzgGgj3NgwLdKXnhpYPZxgFQlER0fazfsN7tOlr61Q=;
 b=qu3JB8+IOB8nsKkO4hrL7UIh2beXxefLGOu7tGm7jhCpA9Vu4eVb+5B5zUrr4ZSby8CnSsDFpedgu0DdW5i2e+D8pTGuZYHb9FTtHfuSZS6OcOnuulYxfchDmsEU3mkoRdYO+HbgQ3kmIVkFVVJLEmA9U88/cJb7L0INaorK5CIIvzrq7LwQHnwstrdaHS5kr3IJAYy5ROej0tG6UtpVZgR9yoJDv4QoeZ7U/omRyooB23vT7/LcVfUJqnIllPBApvuSXs5sxRXEVvbJPVBC/5fuIW5zi9f/zXHu8RQD/XP8mgPoL1t+NYcgXr9uFyFmOLabdN6EHPiQSFGnO8gzeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:52:55 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:52:55 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 2/7] udmabuf: change folios array from kmalloc to kvmalloc
Date: Wed, 18 Sep 2024 10:52:25 +0800
Message-ID: <20240918025238.2957823-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e083001-4293-478e-aff8-08dcd78cff1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWxLdEptdW9Qb3krek1QeGVydzBXSXM4a2ExMWljcUVqaGx2S283WFJMVWVD?=
 =?utf-8?B?MllMV2swelAxWGd0RlZQVTBGK3RueVNtOS96YXpWbG1vUEFiQ09ZZ3lvYmln?=
 =?utf-8?B?WkM2cGtzTEpFdUlXVWFmRzFacXlqOVM5UnZ2RHhFZ3BzUkpYWG5ZZ2xmMExI?=
 =?utf-8?B?YmVUN0tuL2lNL3pnYlM2UW9XYi9XQms2U2QwNC9vRFNNNFBFR0EvQnpiYzVX?=
 =?utf-8?B?K3RSZFpDWEFRTlZ4ajNGcTJMdXIvcnVrOXAva04vY01tUFA0Ymo4bkRKdVNP?=
 =?utf-8?B?bVdFWFZiNjNzQ3J5RFZ3WnZtT29lK1hBU0MrbnNsZkU0dk1pRGRJSW84RGFU?=
 =?utf-8?B?OWVvTXNyRGhvQnh3dVJLaW1RQXpma0pxT2hBKzBOMkhwaGo1Qk5kRjhuQUVl?=
 =?utf-8?B?bjAzZGZpOURGbnA5R2hneWlVL1pJa1k1MWg0Y2FOOWxZdjdNaHNDRlR0VjRo?=
 =?utf-8?B?NStlTVV1ZjRXL2pycUpYOWVlTFhhdkRjSFpQK1ErUnJpcDU1QVdzOUZlanJ2?=
 =?utf-8?B?QXV1dnkyZXd5eXBuSE5XYUhsem5tZzRwOCs4YU1YTE5vZGtCS0Yya1BoV0Zz?=
 =?utf-8?B?VjJTSkRLQXBZcThHOEsvS3dQS2RHSEdMRzIvMzJXeVdaTFBBY09rSE9Wc0Rn?=
 =?utf-8?B?UXhucnJGcmNlNkM5Mk5BM1czL3pXdVNBOFZaT28wbkc2VGJacW1WeDFOaWlT?=
 =?utf-8?B?c2xmOG5Lb1liZjBoMnRkOXZzZ2dUNXBpMHV3SjhRemhBZzBObWxRb2t1dkpz?=
 =?utf-8?B?bitCaEErU2ZCdjNQQXhMQ2ZGZkFGNVJHR3hGcGU2dEY1bVhsRnFickRud092?=
 =?utf-8?B?T0Vlb01Pb3VkNmVUNGs0bVpjdE4rMG52YnM4Mm1kVTkxQTBaRHd3WXdhQ3dK?=
 =?utf-8?B?a3RSc2phZGdRZXFvbW91VVdFMmJMbkJJYWdPL0t0UlBNQUZVOEp6ZjBQZmhn?=
 =?utf-8?B?QUpna0Nnai9UWmNmSmFKTkRYbzVmb0Q1Z2gvUFdyMHBhSmpTZVgybm5paU02?=
 =?utf-8?B?N0pTbXhLaERJVXVFTlRxWlM1RlRKVFQ5RkYvQlY0Q0RaUUxlVnVtVVN4bTNB?=
 =?utf-8?B?QUZtczVyYndNRkl3VnhQZkZZTGRKa2hQU2ExQzRybFUwMm52cWtmeGhzVkdZ?=
 =?utf-8?B?a0xaZExtc0hXVFdPTjI0bVZwSEdtVFdqV3JRS3ZJUUlhU0IxZTJBZnA1KzJv?=
 =?utf-8?B?L0lTMUUrVEd0MVl0V3ZMMGtZb21XQVRmZ3ZvT3pIaWl3RVNVdmYzbjNtTE1K?=
 =?utf-8?B?d3BMVG1saFhlVFJxRndFY0ZFY3BuM2kyV1BoUm9BZHFYTFZMM2JzNi9xOFla?=
 =?utf-8?B?ZXoycVFkV0M1NXNtakRmT0lhYlg2SnMvOXZUQmg4aUh6a3ZUdXBURVNTamtt?=
 =?utf-8?B?OEFUTmovY1FGUVRYbUIyWUY3NE5uNjVxUVl5SkYwZDhob0RUL0t5RzBWSHRO?=
 =?utf-8?B?clVtTlRhNVAxdEo1VVV2eDVSanZWdUNSS3l4dVhiYSsvSHFjZHc2SHQrRVFQ?=
 =?utf-8?B?cWVQZzQ0a0E0Sk82SThqTUlZcWhVcGl1Y1MzZEpDMlNoU0RtdVkzQnFsMUNv?=
 =?utf-8?B?MlpnVGtpY0FDZHpWQ3NSV3JMMGtZeVE4UW1FUXByMGNJTHlSL1E2d2dPWmR0?=
 =?utf-8?B?SXRRNUhZckR0OXE0b1JVZmRQMFBCaEtjV0xJWnlreTdxRWlKVHFyL29TY0lW?=
 =?utf-8?B?ekhZQVhLUkJ3LzFDaEsxYkZMdEt3QlBCWHVrajdxVjBmQ0t4L1l4d05WL1R2?=
 =?utf-8?B?U2xsQ2hXbjV4MGNoTmtPMlN0dG1pWmhxa2pqZ0lpMFBOTSt5ZTRoYXdFZlZj?=
 =?utf-8?B?RGR0SGRvYUtJOW9iQnkrejhEL2tVK1NsRnNHWXc4bXBSNExsVWJ0M0IxcE5s?=
 =?utf-8?B?S3FNRUlsU3p1TmE5LzdGUmZsbUxabzBDeE5jbDFvWUM4WkY4Q1VwSWJuMUs1?=
 =?utf-8?Q?KfkGGQcUPQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJDRWZGdHY5WlFxTGtyUkQ0dllGU0Vvd1luOG5wN2Q4ZDBzU1E0MkgrU3VZ?=
 =?utf-8?B?VGIyTUt0ZzA4ZlFzTGtCbHBuTkZJN3BqSEVhTkpDeGd2WU9sWjdPcW9VUGZ1?=
 =?utf-8?B?NnZLSnhESHRzVWJldnBvR2ZHbzZVdE1JbHFsdmR6SkRJWXg4NTA0Q1N4blor?=
 =?utf-8?B?MDJXbVJ2d3J5MVRsTU9ZM3VpdUJXZ0pHLzBuSUVXazdpT0tIcVk4MkFDU0g0?=
 =?utf-8?B?VUJwUE1WcFF4dXZsemt4Mzg4Y3BETlp5ZXRQbElmZ292MmFLZTZrQ2VGNkVy?=
 =?utf-8?B?RHBHaEowNkNCQkIrSkpBZTM4VS9WdDZQSXpWWnAxbnNPTlA5bDlJcE5vYnYv?=
 =?utf-8?B?VDNnUnN1cVc5cFdsWDNsMEZJOGZSWnpFNU05cCtWemU0eEg1bU5FcWsweVF4?=
 =?utf-8?B?MTcxRkdRQTV4dC9NMHYrdDlyeVcrazduMUpmVUlXdUFvTXdJbnkzd3BTNmEw?=
 =?utf-8?B?YU9BTkVDZmFHTy9UcUJndnlTMVUvOHB5TVpUVlNDc0dLMnBaQ3ExdEtkNkwy?=
 =?utf-8?B?QkN2MktNK1Q5MWZ5ak9zd3UwRUxUcEJiWlpvbW1DWHpwaTFYRUpTVjJDSFE2?=
 =?utf-8?B?eW9OY25UWVAxOGhiSHNSQ0QyRVl0N1R3ZW5xODhUeXl4TWhkZnc4UnBBSWpi?=
 =?utf-8?B?RDdwTG05TXIzYThvUEN1WDRBZ09JS3Nxa2krbG9FWG9CYTR1aDRBamVlMVNV?=
 =?utf-8?B?QU9FWXhib0thVlFSdG5hV0NmVmNWdE9ONVR5c2lNT1VWdVZjSi9MU2NmWmR5?=
 =?utf-8?B?bzVSVkp3QUd1Wmlsem1WeVJ4a0ZoaGZ0RzZISS9tM0phQ2FmN0hiSmNQVk10?=
 =?utf-8?B?UW5wUTF6K08yWEErTlFNdVlBNFQxNWNtcSs3YXV6MFpER005V2cvQVdVQnJq?=
 =?utf-8?B?YzMyZHIvMzVVUVk5aXphSUpzM1F4bXhBMmRTTkw5Qm94Z0MwZTh3ZUkzZ2hB?=
 =?utf-8?B?cHJ3YVZOMm1PaXNJWmtXT0N4VVRsQVU2OE50dlZ5UUFPMzRJU2lOTitUZnVj?=
 =?utf-8?B?L0RhWUF2ZHM2RlJFeVV0Wkp4N1pHY0Z1bEVxS1plR3Z4ZFhIZnZqUGNCankx?=
 =?utf-8?B?OC9hY1lpU3hGT1VETTl6N3AvS1AyV29KeXlKbno1MGJScjYvR3lLOXoxWElh?=
 =?utf-8?B?bnYyaUcwUkRqajNWQzU5bDM2Z1FGdStwTWh3VG5tS2JXNFM1V0Rlc2ZNLzBq?=
 =?utf-8?B?YmVLZ01rems4aEVpWVJQcGxqRFlQcG04VzB2T2l1YVY1S2JudGZCOG9wY09a?=
 =?utf-8?B?L1EvSkV0LzVsOG1oNnAyVU12VE4yZ0FIYjRmeEtXNHdnY0cwZ3ZHQS9nejA4?=
 =?utf-8?B?MS9hZEhhUUZLc09NcjlEZStFb3A3Qk51M2tlUUZHM1JzYmx3Y1dGYURPa0Jp?=
 =?utf-8?B?TUhkdWFjc2k4QkJsenZXcWFYRm9Va1NKTjlUN3BmUFJ4RnorZ2dVV1R0THZj?=
 =?utf-8?B?bWJrRHNvbVU3YTZTSUZVaXRoeXRpbVJYVGNVRXR6SjJjSjc4aTAwcEJjakRj?=
 =?utf-8?B?cDJPMU9LVlBFRERQUW5GbFp5SitUc1hxbXdMNXJxcUpRTTBqdkVyWWNHYW5U?=
 =?utf-8?B?SjRqZS9IWDluNktJZlE5RElORVVSbUMweVE1RUEyUm13ZlNVQXhkcldLNDFP?=
 =?utf-8?B?eVFCWWRRNHgzdkMzemtSdERZUTdUSmtraHZ2TmJrK0RidDRFT0lCdHBJTEVQ?=
 =?utf-8?B?NkVzVjF0OTNlZW5UejZSdFl1amsya2MrRHRVaXl1dFdRQlNBMVpUek9jQytl?=
 =?utf-8?B?dDJleG45dHNRZzdkSk95Y2xOUFV3SUhjMlZCenhjcE1DdmNPRm9RY0xWaUJy?=
 =?utf-8?B?NnJiczhGTGFzY3FmejNsS2NyM0VZNlJaY3JLaGNwbDltU21sbDdrTnRPcHh0?=
 =?utf-8?B?M0djVUNDY0tiV00yQlhLY2VCMmJtNGlIaVR0QVMrQnFNS3p6OTM4cFU5WGpn?=
 =?utf-8?B?WXM5clo5WHBENzB6aGN4dCs0aUZEQU1yTDFod0JXUE0wS1k4dWRkRFBleDIy?=
 =?utf-8?B?VDMyWC9wS3FMMGovWE5UU2x4dGFRMlNzR1EzSjNSOU43MDV0ZEVaYSs0VFdR?=
 =?utf-8?B?eGhTOFg5bXRrTGFRenUzL21sZzk0amRQdmJ5eGt3cFVTMk4zemljZFdNaWpi?=
 =?utf-8?Q?gGOgr/K+qduMqrzSn/rQ0NQIQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e083001-4293-478e-aff8-08dcd78cff1b
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:52:55.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2ifdxKyrXGDYjXMLPVSQ5QQeXMUOnuEayRGmkn6pZlTIVZG2UD4ol9wpfPkwSOatOz+gfD3tjHjToZPZcoCiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 2170d975cc76..ba9dbc7caf71 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,7 +109,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -117,7 +117,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -225,8 +225,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -351,14 +351,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -372,7 +372,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -382,7 +382,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -411,7 +411,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -427,8 +427,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2

