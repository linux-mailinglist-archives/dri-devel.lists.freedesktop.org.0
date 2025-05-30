Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42BAC8642
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D1010E0CF;
	Fri, 30 May 2025 02:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YFq6AEYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464A910E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm26RWX2enZ/P3sd3jOLbz0rhGlzB53mX097ogBlNUshqiflOCkgiq9m71hUIiNMsGezq7w5lO2CIda6Wk2VC3yrHhDk1EyjS5Io04GqZgvK07ugtWqdo3bcg3Ef+rGCT2+H8npJvCwQBAcNqF99Q6jex29v5idh/pZQLL1PSGBdBz80Hb0n6aHpjyn8fqBy728E9nzfmwvwoHOdiey+fb+Zp1BPY/NLwYgKOvK6kAKn1zd74tKRiOsT36O6St4uWXeGUmwhKG+SUopJY+eHCin83iTVvGWA0dvz1JX7TGFwR8Qraci607HcpuCV1HwBCdL5zzKwZoH5wSjMrgvYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd/W109WMcrTL+X1vodXjlMQ5r8F8h5ajDn5RsAhdw4=;
 b=msnqo5vr3sQNK8rr6XyYoJXXenJTJjxyuEGbqxoyVmGe2iFGvtjh05kT3da0CLMWLIzwv5lkydaY1UIJC1LOOEqfHGEJUnqB/A5t2c3kf2i7PrJbBxXCJmYpV7U+qkHPu2EXeD9SIZP62PK/SEf/t2qxFrqyx6zyr2GWhrD/5UHXKEk+Ypar1JtXftMEMtzCmHBqoIg83zu6DtQ3co/0kztE79j4fTisaXjCKATJE9cilzlrcjE34BoBV3KsXorCV4XkxLsyPmLO3ds+M4FA64VvjcvqtrpcdDuXVdbjaw4kUilFDR9vljnlNBiJagKqM/9y+SdS5GbzJTzqw1sz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd/W109WMcrTL+X1vodXjlMQ5r8F8h5ajDn5RsAhdw4=;
 b=YFq6AEYkW4h3Hinm+DsXCUayZMdSwe3vy5eT0SQphP54ib0fJUji7sSuDTzpOFrMimaWLdYe5LFMLustzOvge69imMHxDwB1cttsQsgoSiTqV4ifKLnF4ep6QfVycP5IRxsgi+vIr4JcDS6KoOXwSqonu2XtTj816ELvD9YOEKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by MW4PR12MB6997.namprd12.prod.outlook.com (2603:10b6:303:20a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 02:29:39 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8769.022; Fri, 30 May 2025
 02:29:39 +0000
Message-ID: <79872224-4e81-446b-a451-28260f449ea9@amd.com>
Date: Fri, 30 May 2025 12:29:30 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com> <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com> <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
 <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYCPR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:31::13) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|MW4PR12MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f086cb7-80f9-4aea-df88-08dd9f21d3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3ZxUU5aVmdtaEFlWXdBVTB3eWdRbWdyQmZnWEEzaitHVVllY2lRY1NndUlD?=
 =?utf-8?B?bEhXajBQdCtvK2UwaE5kZDZtUlg5b242Mkg5Z2VxUWt2SWFhV2ZGSi96Q3Nn?=
 =?utf-8?B?R0Y0dVZZK2YwN1Y5cUNWZDZSdVR3QnBrTlNxV0J2TkNHNzNFR05xZUlOMk9s?=
 =?utf-8?B?aXlkMFRHYkZTaHM4dmJsTXBIRlBmRC8wdnBEWngvWXFyRkNXaGI1S2o2bkd0?=
 =?utf-8?B?cHdxZUxPTmd0TnJ0WW9zc1dJbUZRbXEvVVRhcnFtTm5xbGFnWmNPbzFsakM2?=
 =?utf-8?B?TUpwRWJTN3hqTHdwM0JMK2kreWVFenZCWjVBQm1pWHdXK3gvY0xIVnp4NXBI?=
 =?utf-8?B?Yk03MzNYT0RYMWJWZmkzbGpra3JmN3c2T1ZwenhNQlVMUFFLaDBDK1BEWXph?=
 =?utf-8?B?eEpuenJnZ0ZzUnd1WHYza3lTMHhFVFNURXlMKzlIVEcvKzI2SHlaNUNVK3ZE?=
 =?utf-8?B?TytmcU41SUlBVlI0ejV1L1N4SkkzM0sycWVMOXpBMDloNWJ1YVVWakpyVjBR?=
 =?utf-8?B?SkcxQ1hPbHMycHMxTk1GbjFwYURrV2FKNzdzSTdOZTlOcWZWaHFQYXpSMHVN?=
 =?utf-8?B?LzBBZ2tUOGpSUGtBSFhkR2crRU5PN2J4dlYxSE8rNUJYVUFaTmhXZEVzT3ZT?=
 =?utf-8?B?NklyaUt2azNBZjBFWko2dHJPVGpVU2xiVENRWWVocEQxUjAzaWF4RFo4K2lt?=
 =?utf-8?B?ME0yQk1WMHdWS1NMU1BtNVB5N2ZweldMSmYyL3o1K0tPOG1DNTRjNnJsMjBi?=
 =?utf-8?B?NEtQSHpuRmFrZ2FGdG85YjF1V3pNNjhmc1N3Vmx4MEtpMkhYcGdVNmhXUUpw?=
 =?utf-8?B?WmlTVlVvZDNxczY5WDhEZTltdnBQU3A5K0ltRytleUp0MUwySlNlbFpIK0JD?=
 =?utf-8?B?ZkphaEIrMDBNUjJJQVc1WlVhWkxWS0c5UkQwMjJTWlY3MW1WTWlNOXFmVXZr?=
 =?utf-8?B?akM0UTBWNGx3dXlPdGh0RjJhcTRkZTBFQ0VKTGY2Mm56YjZiOWZwWm1PZFll?=
 =?utf-8?B?ODZvcGlWbCtCeG1wK0pKZCtFMkpYYlpPaW9OWjBSNTRqQmY5VjZsVDdLZFNt?=
 =?utf-8?B?WVRrVTFsMlN6eWR3WTkrZFpacWFtMXdTbzVuZDhkd3VaakFDNTMvdHNrMGdP?=
 =?utf-8?B?cHBBaE5YY2lTR0Q5M2t6NEVwNlJrWVc3Y3JDcDBTWldGeXFIc3RaeXZrS3RS?=
 =?utf-8?B?anE5MERvY3laN2FCNktwZ25ZTzNRLzdYNk03MGs4cnBXMFRRZHhtbTByeHBM?=
 =?utf-8?B?OWpQU2RMVnJEMmdWZDBZQnBRYzQraUJHWTVQVHNWWkxzVUlBV3VldmZ5V0hR?=
 =?utf-8?B?T1hnRldhQzk1bXhlTmVSUkg2YW1wR2JqY2J6ckpMd3JtT1U1UHQwZDZmaDha?=
 =?utf-8?B?OUE4dTZBbWdsaUhLMGdDQzJNS0x2MlJuZGNrQURpWVVlYUo5bjd1K0FVbURr?=
 =?utf-8?B?TVZRZXA1Y1gwTmRGS3Z1anlONGpaOURIbXRqam9peHIxaUFUZU1jcXhuWElO?=
 =?utf-8?B?TEw5ZGk3dTJqNllDckJESnQxUDdhdFk1Mk16dG9kUXpTamIycWlsck1wTHov?=
 =?utf-8?B?WjlCU3orQ09pTjRoUWlSNnBLUUVYMWExVEh5ZGZ0MFhPemJ2K1FRdG9CUWdE?=
 =?utf-8?B?UDZTajdxemcvTTEvL2NZSkNYTXBYSGxlRkd4ZXQxNXlHS3F6TEw2SXcvbExa?=
 =?utf-8?B?Z2JNelhzcGpCTVhBYjlLaTdHZmZNQzRPenI3RTJKYU5GMGVvMGJ0OGkxa2Vk?=
 =?utf-8?B?c21aWVljMXo2KzZLQkRTYjBibUlQQWloS3VNcVpkRmJZRjZha1FiOWdFVGQw?=
 =?utf-8?B?ZGtMelJxTTRTYnRlWXkzTlRTTXF3UTVUS0YzWWxjY2FGNXp6cjhYcWoyWmZN?=
 =?utf-8?B?aDJ6cVFHdmx1VmhnbDVwNDNOaURDdmN4anIzVGtjNXU1eFgxckRiOU12Y283?=
 =?utf-8?Q?r4tjz/6tpQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG9HSlFwWEJadHBFQWQ2aCt0Z0hGbVZrNE40dDFjdlBKbUN1YzVhdHVFb0pi?=
 =?utf-8?B?NWFRYWN5RFJGWkNHWUpudHcyalRXZUFZUTMzaWF0UlY4VDkwN3JTS0NHUmU5?=
 =?utf-8?B?eDVyWTYvNTZsaHQwQ0xrZ3F4aVRhMGQzMFZSS01xYnZIOEdCK3pyZXUyN04x?=
 =?utf-8?B?RS9NMUVSWDRnaTg4VmlBbTVsSU8rb2hWdmM1TlRZK3IyTVpKNWpDK3dEajdi?=
 =?utf-8?B?N2VhSUdIN3BXMmdha0JCNzd6QjF0M2g1V1VDMUlCSTBZTUR2VUx5ZHZCT0xn?=
 =?utf-8?B?c0s1eUVkVGdqbHByYkl6bnNCam1lWkZmQWRvOW1WMWk2SFlDMVhvZUFka2xU?=
 =?utf-8?B?aWVybUdhdGdLdEV3NEdzZUppYTRNVjJORWZiK2NRRHo2Yjh2OXhIRnk0Y1U2?=
 =?utf-8?B?eHB3NE5tYUE3RUo2enlzbTBzYkVJallKb3ZLWk5FQ3BvSTNQVUkvbzRpc2sy?=
 =?utf-8?B?TDVtN2NUQ1NNNWNHd0FESmIyaHpVaHZ5MWlrOUJ3RDNVSkVnSC9YeCtwZ1Zt?=
 =?utf-8?B?cCt5UjNwRVM5c0ZxaXhrdUg3TWtLQ25nbHlKK1FVTGJ4ZHl3Umk2VThDNFU1?=
 =?utf-8?B?NXRSaFIyZUpQeFRlN0tZWm5oMHFRQjFsVzIxT2NVRVNIcHc1UzFMd3ZmeUpY?=
 =?utf-8?B?akt6amlBakxQcnhpSGVlK1hxU1g2aUNZRWV4ZzJxZUJINGFsSTZwZ1ZwVy95?=
 =?utf-8?B?WmNUWnU3OElVRTQ0NGlBMmpJaVFxN2JmVHp6VUozMk5MVjlUYUtQeEVpa3NK?=
 =?utf-8?B?OGwyTXN3eDRhNlBiaFBnTjZvNjRTanRNLzhJTTZzN2lCaWh5Qnp2QkVrOTV1?=
 =?utf-8?B?dG1KdFUrK0xqYUY5K0NuYWN3NmhlVUE2cldnRHM0Z250MUt0MFl2aHpYSlZi?=
 =?utf-8?B?UkNEdXdLR256ekZpU25yRkZyeVdEQXJQOUE1NlBHU3pDbmswTVlxM0ZBUmxq?=
 =?utf-8?B?aGpkaTk5czFpeEhFMkdYa1pKMEhjSjQwOTh3dXNYdExEcUtMODZnaTAyb2I3?=
 =?utf-8?B?R2JOK3RsUXhOa0U1YnhZS3dzRnVLTDhtemNTb0FSRlorODFJR2pkcWtBdzZh?=
 =?utf-8?B?N01UUU40WnorOWcxY01NOXJUK0N6MDVINC9qOXVqeDIyWlg1b1VObnBBbjBl?=
 =?utf-8?B?VXRLcW1aRm11UlV4SmpFRUoyTXZUYitCdU9hRUlRdmVOKzJ1bDdUT3o4WEVR?=
 =?utf-8?B?dnFjWFFUSUFBeWh6MmkxODhxNXpIcktFelFzUnhmZHJuNXBjbGpGUTVEQmxz?=
 =?utf-8?B?UWpYZE8ydWk4a2RlSHJMM01jUEE3elcvSlY3ck9hMDZ6aUtkdnNOZUF1NTRi?=
 =?utf-8?B?Mis4NXJzdGxDYk1rdUVVU3NJZHVyZzNMUldFNENvUFVKWXFaTklmVjVidisz?=
 =?utf-8?B?TEExTkNwa2lvM092ZCs4YUtyanRPTGZYQU1XdzMzK0tPQWltaFFSbHVaUnpH?=
 =?utf-8?B?SVUzZXpWcmNJVkQ2M25jbklWYUc3SzZISmsxd2tOL1JzMFpTMDU4Ylh3czdI?=
 =?utf-8?B?N1VLRGRRbFBYRURwWjZmNzlOL2ZjZzdNUDdhRmoxdFJiMU9ocnk0alVkS0dn?=
 =?utf-8?B?azJWQWprUUVWejdEa3lNbk5lcDZNVmdXNEFJOFc5VGpuTmxXcXh3VHBmVHRs?=
 =?utf-8?B?bmw4Y29YNVdsYU9lTUdMTlJYTHV3T3QwN3M3SG5MSUgreml3cmVIZHJhTUhp?=
 =?utf-8?B?RU9ZUS81WDZEemlSY0tscjRxZVJQWndIK3JKejFhTVF3Y1p2ZE9TUFozVGpC?=
 =?utf-8?B?WmhnSXZNcTFrMUtiL2Z4NFBwNHVQdTRnOGlRdm1zQitBcG9XVEc2bElpVHZK?=
 =?utf-8?B?R0tXakZLS28rNWdtWVJ0ZU5vUnNQa3BDS2EvZEtnVzcrQjhsVzdGa3M1Q0FU?=
 =?utf-8?B?V1o1bzJmdG5BNmg1L0w1OFVjcDNzSTB0VkE4VTRhcE52Z2loVWMwUlo4Nm9j?=
 =?utf-8?B?Vmp3YklmS2pQUDhCUHRzRXk4dCtneXJwT292cHBXYnNkK3VJc0VaelFhZjB1?=
 =?utf-8?B?V0JEbDg5UmZua0twN2VLbWdPYU1uL3ZjODhPd2E0cjFrTEdPclBsaWt2b3dB?=
 =?utf-8?B?YnNKMk12cVRURlE3NnZXbjQ4Tzd6eXRyS296RUliaTNkelBNUlRWZzd5ZGFt?=
 =?utf-8?Q?91jeLs8oQqnoHwSR9MHBB9RO1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f086cb7-80f9-4aea-df88-08dd9f21d3b3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 02:29:39.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpFYMl69TXSTmEJXlp5fIgvvC7Owu48r8ez5LzWzypUZFz4Mq+igkDIR9xVRa+kf20+k9brbSq5OQrMLuOrAfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6997
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



On 30/5/25 00:41, Xu Yilun wrote:
>>>>>
>>>>> FLR to a bound device is absolutely fine, just break the CC state.
>>>>> Sometimes it is exactly what host need to stop CC immediately.
>>>>> The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
>>>>> PCI core.
>>>>
>>>> What is a problem here exactly?
>>>> FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
>>>
>>> It is about TDX Connect.
>>>
>>> According to the dmabuf patchset, the dmabuf needs to be revoked before
>>> FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
>>> That is forbidden by TDX Module and will crash KVM.
>>
>>
>> FLR is something you tell the device to do, how/why would TDX know about it?
> 
> I'm talking about FLR in VFIO driver. The VFIO driver would zap bar
> before FLR. The zapping would trigger KVM unmap MMIOs. See
> vfio_pci_zap_bars() for legacy case, and see [1] for dmabuf case.

oh I did not know that we do this zapping, thanks for the pointer. 
> [1] https://lore.kernel.org/kvm/20250307052248.405803-4-vivek.kasireddy@intel.com/
> 
> A pure FLR without zapping bar is absolutely OK.
> 
>> Or it check the TDI state on every map/unmap (unlikely)?
> 
> Yeah, TDX Module would check TDI state on every unmapping.

_every_? Reading the state from DOE mailbox is not cheap enough (imho) to do on every unmap.

>>
>>> So the safer way is
>>> to unbind the TDI first, then revoke MMIOs, then do FLR.
>>>
>>> I'm not sure when p2p dma is involved AMD will have the same issue.
>>
>> On AMD, the host can "revoke" at any time, at worst it'll see RMP events from IOMMU. Thanks,
> 
> Is the RMP event firstly detected by host or guest? If by host,

Host.

> host could fool guest by just suppress the event. Guest thought the
> DMA writting is successful but it is not and may cause security issue.

An RMP event on the host is an indication that RMP check has failed and DMA to the guest did not complete so the guest won't see new data. Same as other PCI errors really. RMP acts like a firewall, things behind it do not need to know if something was dropped. Thanks,

> 
> Thanks,
> Yilun

-- 
Alexey

