Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F187B98F773
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF27910E0EE;
	Thu,  3 Oct 2024 20:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jaew3NXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CFD10E08E;
 Thu,  3 Oct 2024 20:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjtUvvyKwMkSHD4Pw0VWvUk5IiU67438d9onkCN8/FjkvC2HSBu02GPb71YAY4Ql1B8Trq+6AEHSUWJ5UMTjnaS3XDVQJIcbVWzPhKP+9XyZ46ATz2/edVGNzbN9FSjyKXUkWTsVZpZ6X7eyNObKjs3rbNxXyB+Zv6S+5AGehzgGWBcrMWASJFWJEQbWga6++6ZG5wQgEJLjEdqmMeNYQAvAQHJasGtQB0ieYjUcKRymvjYEUWXYXifoaJ3MHSUU32ZbjBaKJa8pysblEjEfAPpPxBibfS6Bh6RpmTZAn8agkQwzUKBXNQz0PCSJCAV+r5dKxOdsqWfI1I9rlwZ6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg60mxi7AVcamPor5jHu7+AkVNXJ3QLpSx9AEJRRjes=;
 b=T1EMhZE+pUgYToZGobmaKedJe/Ph4s6Mq8W7j1oxpR8iAWzz+/oHnv8GiuXmHZ+zh9N+sqbWWBhc9yThHlQY7rsCLNU/m19OOubXzgmC+8S68Q0izBinS12SoAZkNrYGwW+NvqMU8z0JBqGfY35ZZfTtTX5TWLx9n/ImEpOv6FqB5oOIR5BmfVoGGxgH6fBqc8T5cL4BmMQwKxmgiRWJFaHLpfiEsLPAcXN6FyiY84bTHqlOeXML1e5BzaAoBUXvSHOLzZMrI1TJ0+sXfVJonpkC/QKu8TPrnxUowliIz6KEs0ikWc8ahjg8SsjUoPIbWpKvgFX6l8aWcT566NuQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg60mxi7AVcamPor5jHu7+AkVNXJ3QLpSx9AEJRRjes=;
 b=Jaew3NXV8poGGCSgeUTCmPCLUSLFbmwjDSyj+5yeDq8OLHHYZ69/Ba7Ccu2KS77eQotZAQluSHwl59niSx9XnO23AqY8haaZf3SacM23kTGWVBdQqhpeRQcH0TNfnE1iBqVoDN4RP1ZLwKprZhzu0VcwD8JZjofeCdXibxiDhO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Thu, 3 Oct 2024 20:00:48 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:00:48 +0000
Message-ID: <e9ee5afb-e1e0-409c-9af8-143217370f11@amd.com>
Date: Thu, 3 Oct 2024 16:00:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/44] Color Pipeline API w/ VKMS
To: Alex Goins <agoins@nvidia.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Victoria Brekenfeld <victoria@system76.com>,
 Sima <daniel@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
 <07cfa0ee-9160-4a99-82dd-0a0b11af243f@amd.com>
 <3a6a5a7e-ea86-74b6-788b-b7d76651fd8@nvidia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <3a6a5a7e-ea86-74b6-788b-b7d76651fd8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0356.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::21) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DM6PR12MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 588dd51c-dbf9-4152-d7aa-08dce3e61334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVWQWlBeGdldzhxVFpKZUZDODRPKzg0SURPbm5sYklhZFdsL2VabmkyRGd6?=
 =?utf-8?B?cEFQRUVQbFBGTmJsb2plb1lnT3pmTzFTbG1Kd1JhV0xiUW1WQi9LMy85N0l1?=
 =?utf-8?B?ZUU5YnlzRm5nVWFoTkVoSXBHcGMvWHgrUHVFTzdJamlIV0xMTXZxSGJ2MU8w?=
 =?utf-8?B?Zk9hdk00TnpPTVhXeU1XNVV6akR5eW5lbDlTSVJXSFI0SnBPTjlCclRTaGlv?=
 =?utf-8?B?bG1hQ1hpOGZNZTdQTWs4NUY0akZ1TlZDV3FGY1dPLzJQaEZQNG5yU0FPMlJJ?=
 =?utf-8?B?UHZPd2JGT0FwYWcrZGRDZWhsYXJxd0Vlc3JYV3R4Y0IrN2NRWDE4NjNqTW1p?=
 =?utf-8?B?dU90WFBicGQ0YVpJM3JtUjBIMHByUkNBaVArbnd0VlZBZ0JqNDNZbFdyUzdQ?=
 =?utf-8?B?STJBOVhrRUxrM2lPVmNDVjBmb2pVT1NvTE1FR2tuNThxeXdGQXNpaWZ2L2Zi?=
 =?utf-8?B?VzR2ZlR6Yk5OTitwWk5TY25lQlViK2dxRkp4bzR2ZXdCeG84czBUSVppN3pH?=
 =?utf-8?B?UUhJUHJSWXE2ZitHR29lVWVCZWE0bGpTS3Avb2dhci96V29VZ1JCQkIwQ0tS?=
 =?utf-8?B?a3c0OHozZ3VzM3RpUVJab3hacVMrMVNDVEZpY1dOOUViVFNJcm0reFNFK2lI?=
 =?utf-8?B?VDdjeTYwbW9OTEdyTVBtSFpKekdtMHlPNCtNOUM0UlgvZk9IRkRRd3Foazdi?=
 =?utf-8?B?TlR2MVNsV0dpWEF0MDlUYVEweE5qREdaQUltYlhFQmdzTzJ5aDd0UzFFNFp0?=
 =?utf-8?B?bzNscXNOV1EvbHE0bnJkWlY3Sm9tZ2xtZjZGUGZ2WHFNcFJKMFRsQXFEWW5V?=
 =?utf-8?B?VksrTVJCNHhUMUVzcWhoeE1QSmR3VFlUVXBjQnRqMy9TNVhnMDlZS0NMTlVS?=
 =?utf-8?B?bTZVcXRydWwwK0pFQm5Cd3M1cDByRzJ0R01VbjIzbS9lN2xvdEQ2WUh4aEhs?=
 =?utf-8?B?aEVzTXV5Y2IwbEp6ZlNyM3B2cmE3UWJBeEpYb2Q2MjRlQzB6OFdnM05idUhn?=
 =?utf-8?B?RHZBUlZYNTBIcVRBSk81WVExT3JFYWtjMkprN1h6MkpTUVluaFFTNDkrZEhi?=
 =?utf-8?B?eWhJTk1XNFU2VkxuMnNDWVVPOXhoeUhIQU9EZHBsek96NnZ4TTh1a2pmNWxP?=
 =?utf-8?B?aUFiZkwxNUZkRjJuU2ZDcVgrVFN0cGh3UDMvU01VNnMrRHNPdDVMQjRqQm1T?=
 =?utf-8?B?MTJMTkdrd1hXcExQTXlVY3Jta3JCRmdTWFFXTXE4K3NNTnlSazczN3JXMGVL?=
 =?utf-8?B?cHFmMXMwNGhxenFVK1doUkdCbS9ETUd5dEtlWEtvNC9taTRhNWRxQlFlUEpB?=
 =?utf-8?B?ZXpGblJhOFpxNm9IYVI2cWhRS1N4OForenpVT21KQldkYjFGTGc5bFQxUVpp?=
 =?utf-8?B?TEhSVHdTSlN4Z1VHbnEwRFNxczh2VXMzaFFSWGIyaFVQa2RwdzBzbzFBOUlL?=
 =?utf-8?B?WTI5Uy9ET1JjN1o5eVBRTHZqQnpNNzBzRTJhRVhRS3BCMHdVYmFKZjQxVVIz?=
 =?utf-8?B?WWdabS95OTJocmpyUnlKendBMk5IeUZVdDhMMHdtaDFlQytGR2hXMlc1RFpW?=
 =?utf-8?B?Tm9FYXVhTi9zeXptazE0eVVXRkRFSVZhQzlWNFE1RVRsQ3NldlAySkJTZWNa?=
 =?utf-8?Q?h7cGolzYhOS9DpWXe3zhyUvhfyW/mpPki0GtQe5WWyKo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWI1WjBYcTJlbEJhNDZyalVWUTdtWTMxdTByaDRzMHpzejVxZFYybFgrSWVj?=
 =?utf-8?B?ekJLUUZGaFloRDNXYVB2ZVVqYlgvbTl0YmlDbi9BUlRhNEYxdElBVWFwbWR0?=
 =?utf-8?B?OHJxenZNWkZzTUFuWXAwNk9lOExzNjBMQUxHRTg4NW44WWdSdTN6STRNU3Uw?=
 =?utf-8?B?bTZFR1RVTCt2R1NQZkJ3cmdoZlRTSUVuNHR5NStBOFl6bktSVHozamVUVU1v?=
 =?utf-8?B?K3FUenhycG9sTkRxL1RqQW9Kbk5ObmZCZGxCN2FSdlNEOENCc2ZUTUtLMyth?=
 =?utf-8?B?RXNJQXZhTmN4azByV3RzTWVEVU4rZ0hpRktFTWxNaE5XcXJoUm1oRDNtRFgr?=
 =?utf-8?B?S3lBZ3NHU3Q4OVBwOVVaWmcvbkVmUnYxa0dOelFDMC9WQitJcThpTlVxeFdz?=
 =?utf-8?B?RS95L0ltYnFuSVU3M2REWmczcTg3clhnR2dUUTFMZndmRk9yTVBacFlycnB5?=
 =?utf-8?B?OTlobGFXcHprNnF2RGcrdzBuL2FNcGdCcTROQkZnT095SVdYN051WURxSVVQ?=
 =?utf-8?B?TGNjU21qbVltSlZwbEo1d1FMM0gvM1N2MUJpMjJxQUJrUmJxb0o3Uldjd1Yr?=
 =?utf-8?B?dFZPMDRTcGZFOUVZN1ZxeFBDRDFKVDJQRzE5TnFWcDJ1TTRBN3lBeXVVM3p1?=
 =?utf-8?B?clpLc0NHR1NqR1gzZHV3QWlXT0oyMjZUMUlJdEwwL1ljZCthc2IvU1dvN3ly?=
 =?utf-8?B?bUF2bjdXRW5SbFU3VWNadmNjQU91dUNBK1dIR0tON2RPQWNJVHhTcnJCLzMw?=
 =?utf-8?B?SW5xaGw0T0xwTG1DK0JxR2dOSG95cXZGaGpQMDU2L1dlQWh0VklVVG4wMys0?=
 =?utf-8?B?cFdWd0JUTnl0Q0RkNFh5RWFaYmtnMXZGcitHOHpVRFlmVVZIbWxmRWRmK0xt?=
 =?utf-8?B?OVdoZ1NIVGtXOTVtcURPK1cvUnhpTitVaVQwL2xva1A4VUJWOTdoYlFRcFRE?=
 =?utf-8?B?Y1NXYWZIeVFNL0hOOEJ1K2hhUUc2UVFMcVVwMmhhTVNTODM3Z1dZZ0g4Zmxh?=
 =?utf-8?B?NTZMUXNmb0NvS1I1RXBILzV6eVNsbWx3YldhMTB1eTJvTHlBeXR0NjU1MndZ?=
 =?utf-8?B?aGh5dWJlVGdobmQ4Q1hDclFockZJeGJ6VU8wT3VDbHZPYVphV21ieU10TXRX?=
 =?utf-8?B?eTNuRk9Zekh5WWxMN2k1c25RalVWV0ppQktia09CUGRrcDN3Y08zbndWR1l3?=
 =?utf-8?B?bC9IT2VyU201cVB2Z2JOU2RhU05XVU9yYmFxSElmb3FtSDNJelNzRUM0Vzlq?=
 =?utf-8?B?TDhsa2NSVnI0OU5OcjBrR2xrS3l1emszQzAybW5qSmdCUkpKM2dMbDI5bjdu?=
 =?utf-8?B?UzhOUGFLZEhjaHBlR25LOVB5bkx0SFVEM0hEMm9XNzBTcFJVcWZEV2NKQWYv?=
 =?utf-8?B?SHVDcWxDeStscVBVek1TdGc4T2Nray9td3ZWaVMwNHh0SlZwc2xFbHg4WSt4?=
 =?utf-8?B?b2hkMHE1QnBaSlJNUnBQTExrMlNhOStVL3ZMd0o1UVBORzQ0YUNWM3BiMmZU?=
 =?utf-8?B?eWxhL0VJQXErQkc1RnBCTW05TFdWMCthM2laUTdiSVFRTUR5SUEwRk1oR1hj?=
 =?utf-8?B?cUFySTNkTHFpNEEzRlNRVGJlUitaWWFZNHhQSjlpOXFmcDF5RnBGaWNNWHVZ?=
 =?utf-8?B?YVBBMDU4UFl1eWJVOU5IL0t4OXlqdmxpRm1aeVVHbkpaWlNYUlVLYjFyWENR?=
 =?utf-8?B?alVpWXdFVEVRMFhqdEU1ajJQdTJLM2ZFcjdEdnRyUnJEYVFCNEdWMlRYZDRU?=
 =?utf-8?B?RGhPMmw1MTNOZ05mSWtVZ3h3ek9xQTZrSitvcU0zdFliTnEvdGRudGNNVkNX?=
 =?utf-8?B?MEJNVTJWR1daaXlGc1ZmRlkzYWFYSHdsQUpTWW14V2ZwOGNHeUZMNUUxQ3kw?=
 =?utf-8?B?MEllZUVyZGZadXlrK3NTWWw1RU4vYk1XYUV1UXhMaVlqbnNlT1RRVXE1MVNK?=
 =?utf-8?B?OHBqR0xWWXRhZjRMbUtOd2FDWWg3Y3lxZ2Z6cTJybFU5NDVJdWpJL0NZV1lV?=
 =?utf-8?B?WGd0clh1ZjNRSEcyc3FRTTRLQ0V0N3p4djNZZEVvbWpDVENpRFVxN3pFdEpx?=
 =?utf-8?B?ZzhhczlBU0JQdWtBTXpRaktidUI3TUVwWmpSWVcrcmhpckhCRXZuQndoZlU5?=
 =?utf-8?Q?Ni4NlYn6QUqa4XNDBbaMilYNm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588dd51c-dbf9-4152-d7aa-08dce3e61334
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:00:48.5938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnORwNEtA7/9+aQsPyIzPZFmFsLKVb3wSVOTY1726T90dsYunKBehEKUth0fRdfnle0xOwFjsS2TKPmG/YrXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
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

On 2024-09-10 16:37, Alex Goins wrote:
> Hi Harry,
>
> Thanks for this. I just want to remind about a few things that would be required
> for NVIDIA hardware, as discussed at the Display Next Hackfest -- fully
> understand that they aren't currently included in this series because they
> aren't required on AMD hardware. Allowing color ops to be non-bypassable is a
> big improvement in this direction.
>

Thanks for your feedback.

> In each of these cases, it should be possible to represent NVIDIA's color
> pipeline using the existing color ops, but it would rely on rejecting invalid
> configurations in atomic check, with no way to communicate the limitations to
> clients.
>
> - Tag IN_FORMATS for a color pipeline (as you have mentioned).
>     + Required to communicate that the first NVIDIA pre-blending LUT is
>       incompatible with FP16 inputs.
>

I have a sketch in a branch [1] but the work was a bit larger than
I anticipated so I parked it for now.

> - Introduce a single-channel 1DLUT color op, or add the ability to flag
>   individual channels of an ordinary 1DLUT as read-only.
>     + Required to handle NVIDIA's 1D tone-mapping LUT designed to operate only
>       on the intensity component of ICtCp.
>

I'm reluctant to add a new single-channel colorop type without having the
ability to test it. Though I guess VKMS could serve as a stand-in but that
would mean an implementation for it in VKMS.

> - Allow marking color ops as read-only and non-bypassable (halfway there)
>   and/or allow marking a color op as requiring a modeset to update.
>     + Required to handle specific LUTs that can't have their entries changed
>       while in use without visible glitches/tearing, yet must be enabled to
>       support tone-mapping and pre-blend scaling.
>     + In lieu of the first option, it may be suitable to just use the existing
>       1D curve colorop with only a single curve supported, marked as
>       non-bypassable. Allowing modesets as in the second option would allow for
>       the possibility of selecting different curves, however.
>

Flags should be easy to add to a colorop because a colorop is just a DRM
object, so we can extend it with new properties. I envision this to be a
FLAGS bitmask property, so the implementation can probably look similar
to the rotation property [2]. And the flags can be REQUIRES_MODESET and
SINGLE_CHANNEL, or something like that.

[1] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v6-in-formats
[2] https://drmdb.emersion.fr/properties/3435973836/rotation

Harry

> Thanks,
> Alex Goins
> NVIDIA
