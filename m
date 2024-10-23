Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB779AC222
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667E10E141;
	Wed, 23 Oct 2024 08:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDk3Cda1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BAF10E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oitc0BSNN8bzG48kv16+0p7H1L/3ysbn1cYCr1QVhPyuNiSzSWP85+HnWbIMyF7UYw6psL1hZOrkeosHS9yI08scNJRmBcJzJaXordPq3o6YZRI+SlSwcoC+ytv6HIVu0Gc27ZuArrvLhh6t3bEeDsKgyY9fNkTTBILF2N1I8wZs9hjmyIQZLsKryPt638A0bm/LeCDyTGKgscwVvHhOSvI+1x3+UsQugbDauMowZoei65NUqhI8eFrHx3O3K3Hr8mF4Lw+GBLsniUkO0ZR0E+HRXwNgzwuFX92FsZz1Xu88vdEUvsbEJiZcwIrUGIcpJ6WE/bWrTG0CCFENdjz3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb8tFWXOH1saxC5JVFFc0OhtDLgbKYijs70puhtj6qQ=;
 b=H7QSvEvngJXtY/u2oHF02yh7x4LSrPtQNElAweiNxvul9KuAV9a4/ZxzpeIN0fK80Q/I/+dnytKMx88UnQubQN52cNeibE51uGTIDWNHfQ6+3tG/F1Cx8J6EpAdHJLUkb6/2q6xeW1XRZ+YDa4bVohiNyK5Y68KRqV9biboOzadnvwO96a9B/6+T61mFYF60t3T+cGmgGB0E/MkVMq6SC8ARmCAXpbhAF2eBW5dAFHQNWndxYeKEjPMknBnqkpT3dXD1ozD1BxvgehLBZgJCeJiliykRElxw4QUcMbvHbyuQ1eWZLkF9HpQb6pzkRFXYAeOPPVS4yjqifqpR4NlgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb8tFWXOH1saxC5JVFFc0OhtDLgbKYijs70puhtj6qQ=;
 b=tDk3Cda1OMV3qsxtojbi3h8uKcl/OW9QcTfKTCRhJjJRqbeg/1OY1TH3yAn+N+2UD96HZGvM9B2l3afvXCf22Tnyt8ioQOG3YLuyPtN9xJ+1TcEE/BWMtaLaZE1zsOnUlbDy9+1iOjBo7GOX56qC3as9KWTNwlfDQwve01JbMMZw/R/36o+AdMyOfvPu1JtWUlaEaQj21orM2ORFaHj/79GQwXH+Ar8N/F0DBzASQiJTztmqVfbBE1HPQyNKPI5rqTsUmmuSEy9iAKdrHfgH6B7dgarIFYSOJSTtE/ub2nHpNg9ANjxrvQPC7LpzfeDBnvBmAfW4bzixyEgI5LNwHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 08:49:16 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 08:49:16 +0000
Message-ID: <5df7e3f8-246f-469c-bbc0-4f7f78461ead@nvidia.com>
Date: Wed, 23 Oct 2024 09:49:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/43] drm/fbdev-generic: Convert to fbdev-ttm
From: Jon Hunter <jonathanh@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-43-tzimmermann@suse.de>
 <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
 <279c7b9b-9973-4eab-8321-a3bc23c97550@suse.de>
 <8b1059d8-7f28-4f97-9fb6-1d3c66cc3713@nvidia.com>
 <c33af9e5-35c0-43f3-8967-3e5a8505653b@suse.de>
 <f62e1271-926c-458f-84a0-35ebb530f731@nvidia.com>
Content-Language: en-US
In-Reply-To: <f62e1271-926c-458f-84a0-35ebb530f731@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0213.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BY5PR12MB4163:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f54c52c-08ce-48c8-f43f-08dcf33f932a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGRDaVdwVWZHTzA2anVwam03cFNGMHYzYjh1ZHZJRHBBeEpUS25ScWc3MW1k?=
 =?utf-8?B?Y2t3RCtKNnZkc3RJaHEyMnF2WG5ENWIyU0R4SFdVNWVpZlBMVU9ydWtrZEdT?=
 =?utf-8?B?dUlyZHE1ekFkOHNpZTIrNjhya1RWRkZEcVU5ODlUaU5YbDd4TVgveVc5d0N6?=
 =?utf-8?B?YytBd3J1ZFkveU9BYm5iY09oNG5TZWNTQzhWcGNuWXl1NVp4UGRqRmRXaDZz?=
 =?utf-8?B?OE4yMUVOOGEyOFFKT3ljNDZuaEV3UFNRbnN5eCs5eGwrZ3l0aWlqdGowSVA3?=
 =?utf-8?B?ZlBxUzVHZzRidnlZWWFodmFDWEpjMWxVdXdWalloKzlVb3pIQzNrUGRiTXlZ?=
 =?utf-8?B?UFZKamkra2NvSHVDN1RYSFZ5R3ZlK0laam9mOGNIRk15VXZGVUhhUnUxZmlC?=
 =?utf-8?B?ZGtPM20xL1pFZUhUSDhlWFFyTGZKQnR2NzU0VHFHSElNWGFFZVQ3akRIUFVG?=
 =?utf-8?B?V25La2E3cC9EVlUvL1c4TzBRQWJYTEpVc3k4bWZnTWduQVRoSk9Rc2xyWmFr?=
 =?utf-8?B?a3p4Y21yR04reW9mMUNXV29YNUh3UWNCRVhobG1USHFoL2RDR25xQVIyeXVt?=
 =?utf-8?B?bXZFYUMvZCtqZjdQUEdoektNRFJQSHc1ZmpBalErUzVMVjJ4TnhPcFU0SjdN?=
 =?utf-8?B?V2NjZDlwU3FYYTRvSHZPOFlMSFRuZWN1cU1pZ0IzZkNLVGNFNHlVSWhBZlFo?=
 =?utf-8?B?VVhSTnBQU25MTGpDQWlabmVuOFJGS093QWtHaEF0WkJGSE5lb2Z5NGVVRHNx?=
 =?utf-8?B?YzRkZ1JXRE5Gd0h4SzVRWGQ0SEtVT2hwa3A0MVJiV0RRNlhzOXBEWTk1RmhS?=
 =?utf-8?B?Mk4zVldNdkR3clFBekhWTEJWaHlBYUVKWjBVVHp5QVJ0WXhSZUpMdFhLSW1S?=
 =?utf-8?B?YzlMVjltVE9NMGFaVVFKeFZDak5YSVlOUFpRRGRYcWphUllLcXE4cE11ME1X?=
 =?utf-8?B?RTM4Qk0rZ3ZiWXlGVFNzcGEvMEpvV1FySXMrZFNMRkhYZWRjL3hXMXhVWFNS?=
 =?utf-8?B?UU9JSjk1Tmt1YjBZbVhzcGYxQjk5dnhncDV4SFpRMmlmL2I5SWpad0dBYUNX?=
 =?utf-8?B?T0tERTdoTmxydkpBZXdReE9HbTRFbThCUWxLUjVBT1VWaXE3bVp1eStNYzl1?=
 =?utf-8?B?RnpremtYejVQN1doMy96T1R4THhjekt2akkwaTNWQjNrejZaWFJiODBZSDlM?=
 =?utf-8?B?L3QxdHBrbFNRUDhUK3c4Uks5REowdUIvZ09wOThENFBkQmNGYTJxQXBON2hK?=
 =?utf-8?B?K0FlTnc5NXczMTREZW5ab1VvTk81MTBCWmZ4a0Q5RHhlaHJmOXIyR2o5ZWRU?=
 =?utf-8?B?RGhVeW9MNXFSZnNKMGlWdERKNGppdXAzdzF4NnJpdGJ0S0tmZlpFV0VncW5l?=
 =?utf-8?B?MjEwcGk0STBvY1NtRFpBMVJCODVYNzBwUVBiTlFDY3BBcHhELzJnc1NHL3NZ?=
 =?utf-8?B?VmJiYVdIUURQM0hiSTZIcUdpWm1BeVlpYkpZOEJ1MTNpL2hhMHVZL3d4QmZq?=
 =?utf-8?B?MS9yN3U1WU0vY0p6czlDc0M3bTNqcXZkQ0VXMFVOV3pRTEtWMGp6T1dzbXZS?=
 =?utf-8?B?TEduMjBOR2hKTDR2VTZlOFF1V05zTGtJL3dyUnEvRnFrdWwvRnkydnlDOE10?=
 =?utf-8?B?QnR3Qk9yQ1JFVWFDR0dUbUxoSGNUTXVSN21zM2ltMWFKM2JiR3lwTGhqd0NN?=
 =?utf-8?B?TElmR1ByTTRYZ3UvZE5tdWhtTWhhSE9yQXF3QnNzRjk4cHB1TEw1Uitld3hZ?=
 =?utf-8?Q?pmc+gcY4amORHbOlMblVdwl4yqR+qWf7OaNkfOD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUluYS9jY29aYUNybTRhbnFlK1Y2OGUyRUVwS2lERVNKMkZBbXhmRTBjaDdU?=
 =?utf-8?B?RWxvenM2dFAxbVIwTFdyYk9PaEx6aWhZWU1TUlVzeVptK3p0VlplSG9kcFdK?=
 =?utf-8?B?SWNIQytLbGh4UjhkS2pMbU1wWXhESUdMSFV5cGZIKzF3YjdyOUxRckhzcm5B?=
 =?utf-8?B?T2JYN2hSS0t6UkJuZWMybHg2QzdFUjZwQmU1bWRwdmJWbmhQa2Mrem9IYS96?=
 =?utf-8?B?OUx4enh3M1lZUUFIdzlCanZkT3lUWmN2cGtJQ3NCSVFJTTFPU2xZV3FicXNy?=
 =?utf-8?B?TVJOdlVqWkFLVUFrUEkxT0hoWnBNR0VVSHl5QzQycTM3ZTFrTGtCVVBMNlc2?=
 =?utf-8?B?R0t3alV6cU1lL2M2M0EweDdVUDFWazBzdS8wK2RhWFV0aVhvTjRHdkxMU3Q2?=
 =?utf-8?B?MlBHMjBtNHRaRHhsNlFBSktJckRGQldYQThWVmhlcmFaTjFvNjlxL0NoSDQz?=
 =?utf-8?B?a1BicitvYnMweWFOYWJMWEhORi9EVmU3QWljNmRZa2hjMGNHKzdlWHU4NTd6?=
 =?utf-8?B?MlkzVXU1RlU2eGFiT2FidWx1RDRBUnA0S2Qyc2VsTXJkRXlhOUk1a2NrM05U?=
 =?utf-8?B?cXBKdE1STUg3RnEwVUNmMGJiYXVLdk9sc0pVWllYdGJXYVFjZzhzN1JzVWRY?=
 =?utf-8?B?cFJweFhFUEkvL0VqdkxHaUNidU1qZHl4SjE3dXpJZTZ1T2EvTi9nUTk5QzJa?=
 =?utf-8?B?OHI4TnRzVTFLWElXaWt6cURUMmd5UHMySjcrNE42VnIvR3JXSU9FaEV2dUJ1?=
 =?utf-8?B?NG42YzZTSlg5dmRxNVJnenFjZW5BNlZTYk13WFJQWmhFMkxnT3lMK29uK0ZD?=
 =?utf-8?B?M0lDK3ZYLzRzQkhENHhwVUF6RnZvcGhTeEZGbUdIeTNVZnZXeFdZQ2x0UVFI?=
 =?utf-8?B?VzQwNDFvN1lWbXBJbEpNTzV0VUFyWDNLTVNQV3ZwRkF4MXc5MjUrZVBwcTZM?=
 =?utf-8?B?L3o0TzZTN2dXRUc5NDhMdUhFMk80Qi96cndrMEV2Z1RpdklqbmlNNjAxbHc5?=
 =?utf-8?B?eE1KY0ErM1c4YnYzM1psYVBCWTNKN1hGbXhkRVFOMDFzNlNMeGdlR2tTL01D?=
 =?utf-8?B?eFhqdC9ENHRFUFFWaFRYVlJXQ1FyZFAzQ2MxSEdOd29FS0hZQ3BkMVBCSnNh?=
 =?utf-8?B?TloyVUcxRW9iU0NLU0oyRTltdzVSTVhldXpNazUyUVZleWdqOFFGOVpUM0Vl?=
 =?utf-8?B?Y0hNMHZTNG9PVDVnWDhmdndRL0NXVGhkcysxYTAwRWJSb1VpNWUrdzExSUxN?=
 =?utf-8?B?a1hGSFE5RVNBNStMM2lRSEMzaWZpWWtsQlh4U1JzVG5iSWVKN1ZrZWhaWUFP?=
 =?utf-8?B?TmM5TGRCbFN6SnBDRTIwZWJzb29qVXpudlZQb1BRblRZZHpsVW1ETWFUemdj?=
 =?utf-8?B?NXJCQkJ1cjJHR0ZlZlI2Z2dUdlhFUnJFWGYvUXRVWkhya3FMUFVZOW9HbUpI?=
 =?utf-8?B?QU9WMVB2NjJLeitmM3REOU4wT0hnSEdNSjFKbjZJSlNmVXI3SW1RZlgzQVhE?=
 =?utf-8?B?TG1CSXQzR25QZ1pEcDVaUVBKeU8xZitIVmJQaktPUVpEY1JTc0d3TXU0bUg0?=
 =?utf-8?B?RzdDWnMyWGkrSzB3Q0ZEcWgrYWd3SGJDMS9ZMWxWTUkvRWJwVnR2dkRJSTJM?=
 =?utf-8?B?VVVUMTR5R29xWVIwYWlzOXBhOTZGMzcwRXluZktWT3EzTHhOQW9HdUFya1Vt?=
 =?utf-8?B?Vmd6Y1hUbE82RDZ1NTRYODE5YmhScU85aWtQdm1maVZqb3ZqYzhJMWdUWVMv?=
 =?utf-8?B?VmhTNG5VOUVNbTM1TmhzNExKb2d4Wm5POGtnemZBeHVXZFVDRWQ4RTRIOS94?=
 =?utf-8?B?YU1HZUF2bWlYRDNLaExoNDM0S0tNNXV3a0thaGNKYUtqMnJuSThYaW5id0N5?=
 =?utf-8?B?Qm1uMXluUy9nN3lkZHZWS2hkZGNmVCtLaXdJQzlsU1huMDcvRVREYzVoTXVW?=
 =?utf-8?B?dUxMQitxamYvZVBxT3NaWlZTbnBJSjJJSWtMQ0JreDltVVl2c0RNK0N4YXVK?=
 =?utf-8?B?dUIwRjkzSXJGMG41YXRRcERudWtBWkFLcjJqYzBVaUJUNkhCZW9FcnZtOERK?=
 =?utf-8?B?M3RWTlp4YmtqN1pmQU02QzBVaHhjdFgreDdHK3BiZThkRWJVemFha0FyOXZY?=
 =?utf-8?B?SmczUE5pN0xISUhkazJzQ21YSlBTbVdHNFdrdXhPcDFVWFY2QkVYRHdLdzFT?=
 =?utf-8?Q?qpQ8UQe+ek33O40QkoHflLHlGfZqmI/WcF52y6NEyVom?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f54c52c-08ce-48c8-f43f-08dcf33f932a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:49:15.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mma5NULWyrHYikqQ5QyYJGyXCu1dIn+7/rsXG9YPKZl3Sz3Bu/cQGbOn3MucgMd3dsGGLcQ13ysbh2cga7hqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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


On 23/10/2024 09:44, Jon Hunter wrote:
> 
> On 23/10/2024 07:43, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.10.24 um 17:36 schrieb Jon Hunter:
>>>
>>>> We'd turn a linker/modpost error into a compiler error. Likely makes 
>>>> no difference. And AFAICT every driver that selects TTM also selects 
>>>> TTM_HELPER. Drivers without TTM should not use this header.
>>>
>>>
>>> Yes I also noted that all the current drivers select TTM_HELPER and 
>>> so we don't run into this. However, it still seems a bit odd that we 
>>> don't expose a proper stub if TTM_HELPER is disabled (especially 
>>> seeing as there is a stub defined).
>>
>> It's not different from other headers AFAICT. For example, the TTM 
>> headers don't guard any of their interfaces or provide stubs. The 
>> guards and stubs only make sense if an interface really is optional 
>> wrt some config token. That's not the case here wrt DRM_TTM_HELPER.
> 
> 
> Just to be clear, there is a stub for this case which was added by this
> patch ...
> 
> #ifdef CONFIG_DRM_FBDEV_EMULATION
> void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int 
> preferred_bpp);
> #else
> static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned 
> int preferred_bpp)
> { }
> #endif
> 
> The point I am trying to make is that this stub is only defined if
> !CONFIG_DRM_FBDEV_EMULATION. However, the problem is that if
> CONFIG_DRM_FBDEV_EMULATION is enabled, but CONFIG_DRM_TTM_HELPER is not
> the stub is not defined, when it should be. Yes as we discussed this
> does not impact any current users and so may be that is fine, but it
> seems it would be better to have no stub at all, rather than one that is
> defined for some configurations but not all cases where the actual
> drm_fbdev_ttm_setup() function is not available. Again this whole thing
> could be moot anyway, because this is going away completely from looking
> at -next.

Unless what you are saying is that this is deliberate to catch any users
that don't enable CONFIG_DRM_TTM_HELPER where they should be?

Jon

-- 
nvpublic
