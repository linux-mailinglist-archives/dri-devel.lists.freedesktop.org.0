Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B730C970DE5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 08:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98710E2CE;
	Mon,  9 Sep 2024 06:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="mEI4n5ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2040.outbound.protection.outlook.com [40.107.255.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3299510E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJbJ3UYCwQQH6ul5uouSFG2r84/TbuQuxZJIVFFSxm33saQKcl4/BPRQKW9cj3rwYy5YSip7O3/99Zr8ipuCtCrj9nLm6OpxUiiTkr9KfzxP86nnS8J3dijHF9lbe1e6bfKQtwlyIiQiaCE172Bio7koodqFRj4qqcbdNg9yLcOD8G+HeGqSnf3GrJukG9PMXibZ/SESdxF89Wt+R81yHb/jpS/gxVIyy5miWERFeP0VHwTP/mwuG22hSA+cY2ggFErX0bdGGSS/ThfPmnsZ5ncqvFTXIXP+2IP4TNlKsHrqgBvAGHLg9VY678R+O9IV26ndS2GDDCOTE7Vw7Wd/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igDsuP4N2fz4ic4AcBGpSic3BENLoAczWJb/VRDtrIw=;
 b=xcnaA/Y9YEDcxLDLCt/pcYYfTIFO91u1+bffInAolABYurP0DZTcXA21CeAAENOLC+ai0bsN2H9fZNNZ0eWHZ3jtWt7X62WEXbRVrpMhhLP+4Rg15OkD2QMgH8R4TRVX14jc1cPOSUlYbkKg48v7n9UHcNnp/LpbKZOs+xLiL5BjDUUOLPck5nC8dQM2K51eOChWl6AdcdX+Y7cCa+CwwJCsDWFp7ePDx/2CHJmWWnmkfXqiYFjAOK126BWIJlGMbHGZWexZSaeQycFuPTysdbJQEDHfTST52NLKPNAxv1UZilCgW1uiBkij7MxTRmll8m1h4lkA66tN/33l+G+yrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igDsuP4N2fz4ic4AcBGpSic3BENLoAczWJb/VRDtrIw=;
 b=mEI4n5apTaHUCktUbaOBkuD8cm2Chk0Emi8/Fx5SzDnhbfaXV+60SBYBm3NyKbQ1v+dJW2yp7ybiXstWXjSQLklbbZJfF7g7DoQNz6G3h7lzTeMvytMLo8Bhdr9dzdPcc2OAdq0wci0Lfwp3BPcNHCCliiZGPLkd4FP17tGp62ExeA9XdazLfuqpvwqPAfkX041EiFBSI6dHrzsVl5RpY/C9xDM/92iUiCYlkzARQ+kACO30jqdWLh4iyZSOzjKLpWX3kRLjqLlElJ3JbM2200y/6AZ0KA5c+d18rULCi7xhnKiPCuk3YJaiXqTG9NVpKgi/c2bH4q8u/ZG7H3TOng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by PUZPR06MB5954.apcprd06.prod.outlook.com (2603:1096:301:119::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 06:31:21 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 06:31:21 +0000
Message-ID: <005ca835-2768-4a7a-a76f-5ea0e318b9e4@vivo.com>
Date: Mon, 9 Sep 2024 14:31:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-5-link@vivo.com>
 <IA0PR11MB7185AA974CF7207048178187F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <d213c597-ec2a-4685-9048-5b477f64853f@vivo.com>
 <CH3PR11MB7177760ADAF50756F886989CF8992@CH3PR11MB7177.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <CH3PR11MB7177760ADAF50756F886989CF8992@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|PUZPR06MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: de6d4fa4-97ea-45ef-fd0d-08dcd09904f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0g1cGFUcEpNMGNrdEVNRnRsM1BEcDFLRitTaGRZS0crSlJZNFlnYldaQ0xL?=
 =?utf-8?B?emZGaSs2QVNvc1gzSU5ZcWFtNC9VemJzRnNkZjM5VFc0RFhhUzZaSUtFcnVm?=
 =?utf-8?B?TnRYTWhpNnlmZVIyNVBrTFBBd04rQlZKMXYyZ1dxdklldUNoTGxPQkxkRERJ?=
 =?utf-8?B?UmovYUh1RFVzWVVYV0F1VXowc0NyK2NFSVZKbWRpSDJOME5yc3R2ZTBuY2dI?=
 =?utf-8?B?R1A0ai9xbEdzazhUa3VBOHdaU0Mzak85Mm95TWhHeDhZUlNrOEtZcThjdm94?=
 =?utf-8?B?dmlKSkdqZGhoallTK3dnNGRsZE9KU0FYRCs5b1Z0Z0tFMGdyZ2xhT3RFT3BO?=
 =?utf-8?B?R0c1L1A2YlZ3NzVGbkgrVDBHbzFsN0JSaDhxNitVOXZENkNaQmxoN0V6NVRh?=
 =?utf-8?B?WXFPOGd0SndaYjNXODluemFOQzJtNU1remxtTGswUXVOaS9YdTA2K0RLUzNk?=
 =?utf-8?B?VTA2TExOV0swTDMxUmVCVUNYOFczemZRK0RFcWxaUHRyMDR5bWs0QUlCMkFZ?=
 =?utf-8?B?a2JTRXNFTW85d0tqZDZMOUpQTUJFaTFhMUhPZU1PYjdReUVGbjlsOTRmNEZi?=
 =?utf-8?B?UkZRWTN5eisvYUdiVjQvM3VVQkYrdUlpbFZrWXV4MGdpeFZxUFlDaENTa2hp?=
 =?utf-8?B?ZjBua0RpbGw4aWdiSU1OVHpRd24zVGNySThsZWRUMWRVQkZ5Qy91dnEyemF6?=
 =?utf-8?B?WTZPaTdML1IwdlpVUWtPanRkbEdzRjg1MXFyZ2FwdHUxWVRyczdTT0ExWlpm?=
 =?utf-8?B?bkc5R01YNFEwYXlLTERWNFZNMXd0TFZIdFQvWCtzdlUrcldPRDJiRHBLdVJv?=
 =?utf-8?B?MUpMM2orVDgvV0lCbStFQzR6UWFUK3NNNHhWZkVRYzE2T1JUYlp1OTFqa2s1?=
 =?utf-8?B?MFBOdXJkenRFbExjeFhHdFEvL2U1cDFma2ZFL0ozRk91YSt3UGlyTGlJOTFY?=
 =?utf-8?B?RCtuMnIrM0NaVkpMRWl2K21nQ2ExbVlObHBKRTYxNHFoZ3pZVHE4R1I3UHJB?=
 =?utf-8?B?aWxSckdUdU1qWkczOTBwaWxBYXRpMjI3ems5SU54NVdvQzVRWVRCWk41bGcy?=
 =?utf-8?B?UGsxVGtBVExpSVpWMlNCaWRIL3hyTkxpRDFQd2RKakdGQWlISVB0aWN1Q1Fu?=
 =?utf-8?B?UGQxS2NpV0NZdXdFRWZ3K1pncEpvSTZTVW01dGNhV2M4SmpQZHM4RkxOazZD?=
 =?utf-8?B?djRqRE9WSjcya3pPTjVhOVZuMkliOHc2czdZNzIyMkdrSDlWaVEwNmJCZVBh?=
 =?utf-8?B?WCtBMkpqdm5qV2xGVkhORkNaaUV1MGJIbHEvM01nOUFnOW1OdTcrckJ2bnpW?=
 =?utf-8?B?d25XR1hNcUpkUnMrVDlrT3AyMUl5ZThmaU5WbEVWRnZoS1FORERKbG1zbkZ2?=
 =?utf-8?B?b1ZIL1MvYk10dGtibXdwQzNvaWJSQkl4Z2lNUkpOSWlKSlZPVEovOG93QWFk?=
 =?utf-8?B?cUE5Rk5rN2VlOCtQcE5MdG02REVUTFZRZzBCOWdiY1NrQlBMWlE5T2NtOVRz?=
 =?utf-8?B?QW1KRnFjY21UU0tUNnhCQjZkMExJSFJIdWx6TXV0aFNDUUpoT01Vd050bDln?=
 =?utf-8?B?bDQxcmZyM2NxcWYyU2QrcFFFczFqNStwWGIzVWZ4ZUZwTk1RUWJOT0dGVkFo?=
 =?utf-8?B?d1ZnM2p5S1U2UmJrWlJMMXk2enNsYVhHVzdqR0QzMEJUa3hyelFpeWJkMmNt?=
 =?utf-8?B?WWpUV1M5VzRhV0g1WFNlOUx0dVJzTmN6bzQ5eFM1T1I5REI5Ui9mbTdDcWd4?=
 =?utf-8?B?QXJONHJrbFlJckIyVVdQK0swSTN6K3Z0d0twblpiWnA1dFdLVXlubTR6dWdQ?=
 =?utf-8?B?NDRiV2Y2Z1UyVjRCRGpkQnhwVmJpZzNRaGZuV1FJelhMSEtyZlcxZno1OFJl?=
 =?utf-8?B?aGVCOWdjaFJzK2dEazBJV2lpNERvNVFuUEplRE1OZUUvbHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzJUelhlYktSdHp1cU5Nc3VjYVFkM0ZiSjRPaDRUVU1vRFpzWkdGbVJTVHdO?=
 =?utf-8?B?SnpzUUErMllDOUMyYzlXSnFVUWtxWkxhYWViVytqclJmZmVoNFNHdWYxVE0y?=
 =?utf-8?B?M3VxMUZ0Nk83a3NlaU1RVGZQdmwrTVNaNzFiQnMrREsrNXZibmNPeWdxL3dC?=
 =?utf-8?B?d1BRSTQ4NnhQekxRZGdwb3NlMkwzU2hvR050SFJRc2ZzcEF1NlNsL3d5bzQz?=
 =?utf-8?B?TDgrRnUray9HWU9peFhBaUZUVHZNc290VnRwRkYxRExTNnhRNzNDOGRLRnlv?=
 =?utf-8?B?eTZIZlllNmVUK2RrL1ZhbktEUktqb09YTXVqWTRlZUtRc0F5SWtuOUhrYW14?=
 =?utf-8?B?TCtYV0lPRlJoWVcyZnp3Z3ZSWERvRzBuU3ZYdkxmRmowQ2gvMlRuVW5qbFRR?=
 =?utf-8?B?Sk9UYi9RRGloQk8yMEdpMTN0RmFXejZDbjJNak40T2tTUDd1TkFmOTdxVkZ5?=
 =?utf-8?B?cHA4S0dGMmVjZjBsNEZiQzgzOW9jdHJjMFJGS3hSWk01TzgzR1ZwTXg0US9l?=
 =?utf-8?B?czE3U09yTE04N0Q5NDg5Z01nSy9FZG90Q2tkeWkvRFZKMEFxY3BBNDFGaFh5?=
 =?utf-8?B?V09sTER0N3d4MlhqVHYxbDloaDQ5QTR0L2Q0NEllMnhNYWRDb052TDBIUW9p?=
 =?utf-8?B?cHBzVThIbUZwRjcrSHBuTjAzWVF3bkxQT2VVanVCdnB3aitvSUxPcnA2NlJW?=
 =?utf-8?B?bW4xRWxRcTN1emtyWW9CMEtvdlBkbzNycnJrRzdaZnh2NlAyVjVkME9Td2Z2?=
 =?utf-8?B?S0lkZTdTVVNOUTBvdzc1ZGVnYWpyYXM1a0ZDT2tlTVRNMXZOaVl3QTRZcGRK?=
 =?utf-8?B?eUhKRzNnT2t1NnE1UERNczVzOEN1MzU0ZEk1ZXNlMlVhczBnenVpR2lhV0tu?=
 =?utf-8?B?bmtwVzFXSFZEMzBEdUhCUzRESDVjSThXMUNPUWFZeXZ2THVzblVhV2s4bFRJ?=
 =?utf-8?B?WnF5KzhyZHdsbTF3RnlNZEdCR1o1cnpLSitRRmJzVWhHQkMzMzU4WUVoZWk5?=
 =?utf-8?B?bFdWSVhLaWhLOEdxeW9qeDBGcXRwNjFCQXVIT0U0VUl5LzNldDhyZzVIak1m?=
 =?utf-8?B?M2tTajg2US9KNkJTbzZqNjhIL3JvUUpkRzRPZnkzTVJnWGl3QWtid1BLcDZO?=
 =?utf-8?B?WnhUVllsOUQ5SHlQUFNkWnNJbWdkSzFjR2l6MTdKV2xwUVk5YUNBRlVrUDhQ?=
 =?utf-8?B?WUszQSs0WGRJckxtb216KzN2RDBmSStaS052NkhBZE9vRVppbnk5ZW0vR0JM?=
 =?utf-8?B?d0crMzZLRVI0N3AvRDQ5eUh2UUtOaEZWZld0SkZnV2Jxd0R3NHNYYkszMUlJ?=
 =?utf-8?B?WWtjVU1mWVhSQ2x0bE0rc3NvSFlqMlo3ZUlQUXpGVmdRNlhWejhHL0Y2aFNp?=
 =?utf-8?B?V0M4RlZ2elpoak1lOFBJRWpQNjRNSm5GaG5oUWNuS3hxZ1VxU0dkSkJ6R0hj?=
 =?utf-8?B?RkVoRGxqaGFKZDBvditITnlNdlYzVFNlYzlGbmpvUnpVeUJYeisxaEkwUTNz?=
 =?utf-8?B?Y0R2VTl4bjIwaHgwcGVWOHBuMExYdTVDNG5aa1VYdWl1K1YzUkVmK0g2cXdr?=
 =?utf-8?B?dThpbHZiVDRFTXhXMFYrUUNNcjBlVjFVeVcwMEZMS1ArYUpyTzhxWCt2eUtm?=
 =?utf-8?B?WlQ3SUJFcHFxR1FNRUFpVXpocXV3SUtYVTY1R1QzOHliNFRNbzQxemtjQUw3?=
 =?utf-8?B?eDlRRUhLd2RqalliNmNrbjBqTVRGQnFsU015SzlaV2NpL3lpcHplTUZUZW1W?=
 =?utf-8?B?TTd0L2JRWHhHbTd0MDZXNndKb2JIV0FSc080Y2J4WHFSdHFIMDZVNXZ1dFN5?=
 =?utf-8?B?L0VtODVCNTducVEwckhYRVk5ZXJYemx4TW1QNmRpc0lZR29VQ21PM3ZBd0lR?=
 =?utf-8?B?cGlDTEpmeGJlYU9xWE53dTUyZmw4a0V0SmFyNjNhcWI5QTlkbUl3blp3amgz?=
 =?utf-8?B?WGFHWkwrZ05ZcWl2NU5PcW9SRWlwZ1poMGt0aDI1QTdob0VxM09Hc2g4L1FN?=
 =?utf-8?B?MmUvSUUzNWd6T2NrSjJLeTJyRkl0ck9TZUl1K1NJZFFVekU2S0VqNnRmdkhM?=
 =?utf-8?B?TWZqT3VnN2pYOHIwRnR6MVdMS1Q1Z0E2amJJLzlJaHpJVCs0SEJCWENvbEhp?=
 =?utf-8?Q?YNftmTtSUlMbBPxHRYq57XLY8?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6d4fa4-97ea-45ef-fd0d-08dcd09904f2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 06:31:21.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLS8F2PTgfWu+2UH6u3xaUBqAEN/FaZJ9XLeM19fFRcQWQB4fukhdtEkCBVvu06vtxB+xpBYQuMfwacyG4irvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5954
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


在 2024/9/9 13:03, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: Re: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
>> cleanup
>>
>>
>> 在 2024/9/6 16:17, Kasireddy, Vivek 写道:
>>> Hi Huan,
>>>
>>>> Subject: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
>>>> cleanup
>>>>
>>>> This patch split pin folios into single function: udmabuf_pin_folios.
>>>>
>>>> When record folio and offset into udmabuf_folio and offsets, the outer
>>>> loop of this patch iterates through folios, while the inner loop correctly
>>>> sets the folio and corresponding offset into the udmabuf starting from
>>>> the offset. if reach to pgcnt or nr_folios, end of loop.
>>>>
>>>> By this, more readable.
>>>>
>>>> Signed-off-by: Huan Yang <link@vivo.com>
>>>> ---
>>>>    drivers/dma-buf/udmabuf.c | 132 ++++++++++++++++++++------------------
>>>>    1 file changed, 71 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>>> index 456db58446e1..ca2b21c5c57f 100644
>>>> --- a/drivers/dma-buf/udmabuf.c
>>>> +++ b/drivers/dma-buf/udmabuf.c
>>>> @@ -330,17 +330,67 @@ static int export_udmabuf(struct udmabuf
>> *ubuf,
>>>>    	return dma_buf_fd(buf, flags);
>>>>    }
>>>>
>>>> +static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>>>> +			      loff_t start, loff_t size)
>>>> +{
>>>> +	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
>>>> +	u32 cur_folio, cur_pgcnt;
>>>> +	struct folio **folios = NULL;
>>>> +	long nr_folios;
>>>> +	loff_t end;
>>>> +	int ret = 0;
>>> Change ret's type and this function's return type to long for consistency.
>>>
>>>> +
>>>> +	pgcnt = size >> PAGE_SHIFT;
>>>> +	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>>>> +	if (!folios)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	end = start + (pgcnt << PAGE_SHIFT) - 1;
>>>> +	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt,
>>>> &pgoff);
>>>> +	if (nr_folios <= 0) {
>>>> +		ret = nr_folios ? nr_folios : -EINVAL;
>>>> +		goto err;
>>>> +	}
>>>> +
>>>> +	cur_pgcnt = 0;
>>>> +	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>>>> +		pgoff_t subpgoff = pgoff;
>>>> +		size_t fsize = folio_size(folios[cur_folio]);
>>>> +
>>>> +		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>>>> +		if (ret < 0)
>>>> +			goto err;
>>>> +
>>>> +		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>>>> +			ubuf->folios[upgcnt] = folios[cur_folio];
>>>> +			ubuf->offsets[upgcnt] = subpgoff;
>>>> +			++upgcnt;
>>>> +
>>>> +			if (++cur_pgcnt >= pgcnt)
>>>> +				goto end;
>>>> +		}
>>>> +
>>>> +		/**
>>>> +		 * The term range may start with offset, so the first folio
>>>> +		 * need take care of it. And the remain folio start from 0.
>>> The comments above are not very meaningful. Please rewrite them as:
>>> * In a given range, only the first subpage of the first folio has an offset, that
>>> * is returned by memfd_pin_folios(). The first subpages of other folios (in
>> the
>>> * range) have an offset of 0.
>>>
>>>> +		 */
>>>> +		pgoff = 0;
>>>> +	}
>>>> +end:
>>>> +err:
>>> No need to have two labels here. Keep end and get rid of err?
>>>
>>>> +	ubuf->pagecount = upgcnt;
>>>> +	kvfree(folios);
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    static long udmabuf_create(struct miscdevice *device,
>>>>    			   struct udmabuf_create_list *head,
>>>>    			   struct udmabuf_create_item *list)
>>>>    {
>>>> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>>>> -	long nr_folios, ret = -EINVAL;
>>>> -	struct file *memfd = NULL;
>>>> -	struct folio **folios;
>>>> +	pgoff_t pgcnt = 0, pglimit;
>>>> +	long ret = -EINVAL;
>>>>    	struct udmabuf *ubuf;
>>>> -	u32 i, j, k, flags;
>>>> -	loff_t end;
>>>> +	u32 i, flags;
>>>>
>>>>    	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>>>>    	if (!ubuf)
>>>> @@ -349,81 +399,43 @@ static long udmabuf_create(struct miscdevice
>>>> *device,
>>>>    	INIT_LIST_HEAD(&ubuf->unpin_list);
>>>>    	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>>>    	for (i = 0; i < head->count; i++) {
>>>> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>>>> +		if (!PAGE_ALIGNED(list[i].offset))
>>>>    			goto err;
>>>> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>>>> +		if (!PAGE_ALIGNED(list[i].size))
>>>>    			goto err;
>>>> -		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
>>>> -		if (ubuf->pagecount > pglimit)
>>>> +
>>>> +		pgcnt += list[i].size >> PAGE_SHIFT;
>>>> +		if (pgcnt > pglimit)
>>>>    			goto err;
>>>>    	}
>>>>
>>>> -	if (!ubuf->pagecount)
>>>> +	if (!pgcnt)
>>>>    		goto err;
>>>>
>>>> -	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>>>> folios),
>>>> -				      GFP_KERNEL);
>>>> +	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>>>> GFP_KERNEL);
>>>>    	if (!ubuf->folios) {
>>>>    		ret = -ENOMEM;
>>>>    		goto err;
>>>>    	}
>>>> -	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>>>> -				 GFP_KERNEL);
>>>> +
>>>> +	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>>>>    	if (!ubuf->offsets) {
>>>>    		ret = -ENOMEM;
>>>>    		goto err;
>>>>    	}
>>>>
>>>> -	pgbuf = 0;
>>>>    	for (i = 0; i < head->count; i++) {
>>>> -		memfd = fget(list[i].memfd);
>>>> +		struct file *memfd = fget(list[i].memfd);
>>>> +
>>>>    		ret = check_memfd_seals(memfd);
>>>>    		if (ret < 0)
>>>>    			goto err;
>>>>
>>>> -		pgcnt = list[i].size >> PAGE_SHIFT;
>>>> -		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>>>> -		if (!folios) {
>>>> -			ret = -ENOMEM;
>>>> -			goto err;
>>>> -		}
>>>> -
>>>> -		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>>>> -		ret = memfd_pin_folios(memfd, list[i].offset, end,
>>>> -				       folios, pgcnt, &pgoff);
>>>> -		if (ret <= 0) {
>>>> -			kvfree(folios);
>>>> -			if (!ret)
>>>> -				ret = -EINVAL;
>>>> -			goto err;
>>>> -		}
>>>> -
>>>> -		nr_folios = ret;
>>>> -		pgoff >>= PAGE_SHIFT;
>>>> -		for (j = 0, k = 0; j < pgcnt; j++) {
>>>> -			ubuf->folios[pgbuf] = folios[k];
>>>> -			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>>>> -
>>>> -			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>>>> -				ret = add_to_unpin_list(&ubuf->unpin_list,
>>>> -							folios[k]);
>>>> -				if (ret < 0) {
>>>> -					kfree(folios);
>>>> -					goto err;
>>>> -				}
>>>> -			}
>>>> -
>>>> -			pgbuf++;
>>>> -			if (++pgoff == folio_nr_pages(folios[k])) {
>>>> -				pgoff = 0;
>>>> -				if (++k == nr_folios)
>>>> -					break;
>>>> -			}
>>>> -		}
>>>> -
>>>> -		kvfree(folios);
>>>> +		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>>>> +					 list[i].size);
>>>>    		fput(memfd);
>>>> -		memfd = NULL;
>>>> +		if (ret)
>>>> +			goto err;
>>>>    	}
>>>>
>>>>    	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>>>> @@ -434,8 +446,6 @@ static long udmabuf_create(struct miscdevice
>>>> *device,
>>>>    	return ret;
>>>>
>>>>    err:
>>>> -	if (memfd)
>>>> -		fput(memfd);
>>> I think this needs to stay because if the seals check fails, then we would not
>> be
>>> doing fput(memfd).
>> Yes, there a mistake, but I'd like set it into here:
>>
>>    		ret = check_memfd_seals(memfd);
>>    		if (ret < 0) {
> You still need an if (memfd) check here because check_memfd_seals() might do:
>          if (!memfd)
>                  return -EBADFD;

Yes, fput do not check if pointer is NULL.

Thanks.

>
> Thanks,
> Vivek
>
>> 			fput(memfd);
>>    			goto err;
>> 		}
>> due to only in inner look, memfd can get. and memfd change into loop var.
>> Thanks
>>
>>> Thanks,
>>> Vivek
>>>
>>>>    	unpin_all_folios(&ubuf->unpin_list);
>>>>    	kvfree(ubuf->offsets);
>>>>    	kvfree(ubuf->folios);
>>>> --
>>>> 2.45.2
