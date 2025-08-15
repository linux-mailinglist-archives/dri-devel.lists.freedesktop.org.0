Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3CB27D55
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 11:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FE510E91D;
	Fri, 15 Aug 2025 09:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v5lYIwtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0775410E900
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 09:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE4jplk5Qr+qNJot5EivIzZukBUU2SU6eA6gSclXoesZTf4jDN57FahrNf7uA4gQK0UCG+PjkICAiFBsuP96mWPE/64ZQT5LLiSddFqCAXSf2g++51SCyEb2zfYAhFIDlDnhydDyMZ1CeVsBpyXwHTFZPHKXP7c6e4HPSMzmy3kOp4XwCtNK4c8ZkwUYH//cJaGUiAkbAD+1VhNJ7puoBZvmA9mkbx9831ScMtJjrEieB34Ey49HvOywLfXnvpz+ElGQRicnMvJkswR0ML3aHLpK8f3s//iR3RNt/50CB+AczWfa3QHkxYYn9/jRzK9h442NG9YMphT2OtFMMZceeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rqbVsKPamDtry5QTNDvqP9qgysC+pTr/eUEJ/qd9pg=;
 b=MqIdVNMeZAYqnH2NOxemjB+kCR3F+UvrhMwss+K7+YMx8AaxiGhunr484WFekJF2wp4FvbSyKi0qsudEbAGQA/w83GpkV1UKtpE3STwA46RIMbkl/pU/CT+UpU3E6LAc0aZweO5//5+bQhyaAHx0m+e+AN/XtUoJxJ1tEJdkUnz+G1vM5bkbnYJzm9b+/J3Ddi8rYVQ9WejdvOwAQpT9qxzVhyAgCwu+JvH1/+YMKHbw6Mz9X9RZdA8IiUGwUbIxZQsEexYTsnySD00LTg/54H6JHbh1tmRIWzX2TlXOR5VyYNDHB+MnewQ/Y2shXe0f9XFsWtqO1lbofJRbMEGlLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rqbVsKPamDtry5QTNDvqP9qgysC+pTr/eUEJ/qd9pg=;
 b=v5lYIwtxlhOMKY5iGpnkXCjo0p83ynGGcoOj7obIjx1oB569Z2zt9xvEyDyI0ebq1HCRMYe022bL15Owq61j3BUqxGDpYKdoB4R4RdjAbw4/3VLyzd+5sdSI1aXzBRPyXFl6D/Ql6WpHrVVgojztNVMdkVVwBqG+CwBGhguaZGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 09:41:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:41:22 +0000
Message-ID: <0b963b02-dec0-4bf5-aea9-dbe3050716ee@amd.com>
Date: Fri, 15 Aug 2025 11:41:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] udmabuf: Sync to attached devices
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Cercueil
 <paul@crapouillou.net>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250814161049.678672-1-afd@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250814161049.678672-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 2805e898-e5ec-4740-b3e3-08dddbdfe4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGVrd3MraGZ0UGJMSzR4OTdjVjRCNnJsRW1qREdoTk1xUGVneFBSYjhRcUpi?=
 =?utf-8?B?VzBsNDN2QmZFV1RGb2huZU52d1B5RWhlNkRobGQ4UkN3YjNOOS94eDBscDdC?=
 =?utf-8?B?elEzaEgxcDZTT2RGZzBtb3k1V1hEQTdmaHZxU293eHhxZmpSVDZ4WXJQV2wz?=
 =?utf-8?B?YXBRMnA2QWs0WVBCL2UyZUsxbmFJMzFYZnBPWnNnOFM3NGZmL0RIaUg0U1Ni?=
 =?utf-8?B?TlJBTk9Uc2tScjJ4NTMxTkZwS3RGdWxNRFhyc1ZmcE1xaUp2N25RS2pMWlVq?=
 =?utf-8?B?Ty9wUEdiZWdHY2p3Y0ZNNS9RWjBiWVVMQkFjU3k3UnRXNzVUQm9qYjZRb0JY?=
 =?utf-8?B?L2tITUJsTVZLN1FLenA2QVgwMXZBc2p4cWJQMm1Qd0owMWhKMVRvNXYwTkVH?=
 =?utf-8?B?NUpjTTBoblBNRFBVNW9ucU94WTVFVWZ5Z050NnVNQWNtWUlrTmxnVHcrMGFJ?=
 =?utf-8?B?L3plUGt5c0NYUEVwa1k1Ujh5cmMwblRaYlYzN3I1akgvK09STWF0YVBUc0lG?=
 =?utf-8?B?K2o2SllMclV0dCtkZTZWd20vZTVML3l2M0J0SCtMNzIvSlJGcy83L2dVSzZ1?=
 =?utf-8?B?SDY5UitJUWJrbTJqWHFUbkRjTGJ1cHFDY09hbW9Dd0JBL3Z4OEd0Uk82c3Rs?=
 =?utf-8?B?Q2FiVmRSb1hNbTdOVmI3K1pXajdQbzJ3WFFROFJjdkREeVJqeTVxaERVdUJR?=
 =?utf-8?B?NFhha3N2UnBTVElSQXpqR3N6WkFNV0dQWlo3eFNsRG9reUE4NmFscW4wcjB5?=
 =?utf-8?B?UURabWV1ci84R0drYXhIU044R2J4M2hpeHgwZzZmTXZYdWg5ejNNNk5LbkZF?=
 =?utf-8?B?VjI1MmVWQmJjVzdOaTlzdEdnelk5RzE0K1l6WkI0QUErejRLUmRveHJLSkkz?=
 =?utf-8?B?OXNTbFdwREtLNTdVL0c1NEFJY0x6UGZmOHZHVi9sVUIvcVo0WlJXWWZuSC9k?=
 =?utf-8?B?bkxndyt2aS9GVkhGd2ZqVjFQQy9QT2dOdHFJdkxkU1ZydDBpRFJkN1RTNDVo?=
 =?utf-8?B?ZkdXYWRKMXgyd0VsTlBwV04zK2xaVUhEYy9OQnpFSW9ET3V1cXBlUjBTNFBa?=
 =?utf-8?B?WWFQS2xqK05menROZXRtNUZHcE9tM3FwZ3FUdlM1a0xndzZ5SlpHL2RMUm1V?=
 =?utf-8?B?MStTeUZDcFdHN0gzbDZoUjAxRXh3K0tnakpBcm5wMnc3K084RDY5anB1U3li?=
 =?utf-8?B?OUs0YllNMVFWYmdNOWZzY2dnQ1hESUVtKzd2cVpueEh5MnlJTUNvSU5vNWVw?=
 =?utf-8?B?aEN4Ylp5YjJLcVQyUDVjV2xwTms4MEFUM095aXJRQjBtang1ZENMY2cvUk90?=
 =?utf-8?B?Rmp2S0l3TGZLMFJRZzNxbUtxQVRYV0NCOE83bDZCOURUMC9NT3NiclZ0OFZZ?=
 =?utf-8?B?RUlwUDQreFdhV3BpMVBuUGt3WU8yemJBVlEzOGg5YThIMDVaMW52WXQ2NHdi?=
 =?utf-8?B?Zi9Tc1ZGNmVma3AwcE1LRDBTUVNXQXgwbzU1MnA4MUFHVUNVSzZjM0tGdEVR?=
 =?utf-8?B?VWR4VnFxaU5LbjYvNzFKOGMxTXpsek9nazNTNDF0WFBNa2hITnpoL1FqcUk5?=
 =?utf-8?B?K2hFNXpEOTJJY0p4UVN0VXVNNU5CeUxUM3kwckU1cVlwbVQxMHNEbkM1TkhB?=
 =?utf-8?B?dTlDd0pZcXd4UVoyUTErOVlDY1kzZGRCOUc1N3hWV0FUYTJrOUQ4bDZuQ2dW?=
 =?utf-8?B?U2dVbGwvK3ZxeUFXa2VQUDlDRXJnYy9xallBalN1KytTMGNKcHlFZjE2L3BZ?=
 =?utf-8?B?L0FVTDJ5S1FYa2lvRk5vNTdSRHZZWXlIRStIQkR5VktNNStpL2I1K0pDMmFF?=
 =?utf-8?B?M05hTnV5UGcxOUwvYjVVTXd2cG4vaGdCaEdCZXQ1L3BLNkQ1S25tc05JK01y?=
 =?utf-8?B?TnQ4b3ZDNlVrNmJVbmsrMTlLcHlNN3Zoa213SE5ObzREUGdvL3NzWU5PSzlP?=
 =?utf-8?Q?axWaXDd+2AU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FHYWpjUURyN3hscXM4SUlyMGNTYTh4NXdWdCtQWkhPVVN5QmsxOEYyOVhX?=
 =?utf-8?B?Sm5ZcTlTalVrTVZ3YnVVTFAvUEhQSFExY2IrR0N5ODlNNFl0RkNiRTAwbHVT?=
 =?utf-8?B?ZzNra09YaGZMc1haQW9aUU5abUtZNkRBSDZIT3RLWCtFYU1neTc0emtOaW5U?=
 =?utf-8?B?bkd2Z2ZXSnVZRm9RQTZJMmtkdFBVNEtOUEdVN0ladXlwdDBZMWx4VitwTFFU?=
 =?utf-8?B?TkpsdXVtYTEvbmRNTUJBYzhxVmpFa3RCa0VObmg5MU1UNHJMaWxWMUZHT0lV?=
 =?utf-8?B?cWxCYzBoNUJjdy92UDFtUnNKUEx2UlF2ZzkyRjNGNjczRk9aWWlUMVJicENZ?=
 =?utf-8?B?MGVTL25jUnFDbkd4cjhlck5kSWhJMU8yY0dLb1NFY1ZWVitHOGtIbDc4Q08x?=
 =?utf-8?B?OTZyaGF2akNQZU5aY0hJTlphbWFTSUl2b1ZMYUwxc3AreVBWdmFGM2lOSDZu?=
 =?utf-8?B?SkI1NUlsVEVnRXJ2QTZjbmZSYm9PUUsvbGxSZ1ZRSU5mRTBOblc5TkVZczVw?=
 =?utf-8?B?YW1QNktZckJybm5jd01HY1FQS25DbkZCMDVONnJ4NWIrcXpGZG1pV3BBaWhn?=
 =?utf-8?B?THVwMkw4WGRsUE5tQVFkTnN5WGdzM1JKWjZmbC9wQVJyRVJHRks2eCswUTlP?=
 =?utf-8?B?azFPb1o2a284Tm1VVUIzanhSQ0JGdmM3OGpZOEpoTE1hTSt5VER4dmtMeWRX?=
 =?utf-8?B?TVZpaE1odHg3eUZ5Y1JBcVBCV1U0UlVEaEpZU2xrMkpxNkQ0R29CeWZoamtw?=
 =?utf-8?B?MCswK05zU1lMUDlBTVBlUDFibzFUYyt1TGkrNFRnRS9MK2Q4WDVicVhSQ1lX?=
 =?utf-8?B?YjFLazFrRWVCSlVxby9qdmdvTjJzNkQveGI2UHFMTFZCZDFBM0FydkNDS09K?=
 =?utf-8?B?MkE5eGZucksvZExqdkhyOERHUG9waVpGdWswK1c4M2tuck9yZnJVUmg1SFlW?=
 =?utf-8?B?UldaUERNYU1aQVlwb29EWVZvd2V3WmxtQXYyVXVKaUhpZU56OTFVVlBMMnlw?=
 =?utf-8?B?SWRDcmdVSTdZL1o0cXdVUHRQVzBJT0xzTEtDZTd6eUZCYkpRMjJ6UmVEOWF1?=
 =?utf-8?B?Q1F4YnZaT0w1ZXI3dkdncmlsQ0tpYTZoeHFMalJYTHF5RTZXNVhtSmVvdEIw?=
 =?utf-8?B?T1BYNi9xalZibENiRkdMeXRiNk1EdVdCYVkxNmE5S2phUnY1MEpTM1oxL3Jw?=
 =?utf-8?B?akJNd21iMGhzZjcxSUp2enI3MlQ1UDNSNjRBMUVaRzZhUWErVHdjd05oV2lR?=
 =?utf-8?B?cFdOV2lHakc0Tys2dzYxWEFRMyt2cXEvSFRIeHdDNzMrNCt5QitKZmQ3bVdS?=
 =?utf-8?B?VklIbXhndjgvR0haMGpIcmkvdHplZURib0ZIdGliV2tiZlhpRGt5STZQSXds?=
 =?utf-8?B?akxBUkxBWFkrSFd6dm1RdWRzSDJUTEdBV1I0eEhQQXQvMUx0WVRJd3NyakRG?=
 =?utf-8?B?ZXBPZXE1S1FNOU84Z2J5b0pXRTlEVU4wTURUVVNuNWkyRWYwK3drc0I1NmRL?=
 =?utf-8?B?UFczRTVTWllnMUx6QXNNTGVvMXFCR0ZQZk1vV1dRNG5OMkMyNy80SHdDVUJq?=
 =?utf-8?B?UFo4amsza2ZaSmJ5NThBMU94cWZ0b3RKNTlLYk1KUHR2SG5SUDdyZDhSUnAr?=
 =?utf-8?B?U1g3MjZMK1lXZWREOG83bFhjN25JOW1Yd3Y2N1hRVnZZbHNhdXpoeEdUVFFP?=
 =?utf-8?B?Q3JpVkxoZkFMZzEvczZ2T2o4ZWJOeGJFWW1uTkQ5OFZFMldhQ1ozVjF0elFD?=
 =?utf-8?B?cVdMQlZrZ2dhUWlUZVU1SndtMTQ0N0xuVzFvNEVrN2xFWGhmRW5yWE14dXVC?=
 =?utf-8?B?b0lMeVVYRlhKOERENHEzdy9JU1h3V3ZmUXgrM3VyNXlaTWh4UlBEcmNIQUVx?=
 =?utf-8?B?Ulg1UjdPdGJMdllKYVlLL0cwUnNpZW1zSDUvMkRQU1BRcWwwVGt2Zk5RU21m?=
 =?utf-8?B?VVA3U2kzRzkrMVY3NVM1OFhId3J0NS9zSWtnN3JKK2lCU0RSaVZBT1g0SXJF?=
 =?utf-8?B?WXplTzFqeDVidHJKUWdsTEQ3T3NkaWFYSE9TbDRiU0E0Vzk5N2cyUTVaZldk?=
 =?utf-8?B?YWNiTERMbkRuc01Nb1IvcmswZ05OT3FIbWZYNUNBU1Y3T0FibmNvYjc4S0I3?=
 =?utf-8?Q?rBufG3G/9nG1NPvD+tgRQ+iSv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2805e898-e5ec-4740-b3e3-08dddbdfe4bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:41:21.9685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80+k9/jsT6cv0w9eEI7PYI8mJgWxDEStSWU9IJaMGsZf+U/q6Ygpw+Iv51yCU98U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
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

On 14.08.25 18:10, Andrew Davis wrote:
> Hello all,
> 
> This series makes it so the udmabuf will sync the backing buffer
> with the set of attached devices as required for DMA-BUFs when
> doing {begin,end}_cpu_access.

Yeah the reason why we didn't do that is that this doesn't even work 100% reliable in theory. So this patchset here might make your use case work but is a bit questionable in general.

udmabuf is about turning a file descriptor created by memfd_create() into a DMA-buf. Mapping that memory can happen through the memfd as well and so it is perfectly valid to skip the DMA-buf begin_access and end_access callbacks.

Additional to that when CONFIG_DMABUF_DEBUG is enabled the DMA-buf code mangles the page addresses in the sg table to prevent importers from abusing it. That makes dma_sync_sgtable_for_cpu() and dma_sync_sgtable_for_device() on the exporter side crash.

That's the reason why DMA-buf heaps uses a copy of the sg table for calling dma_sync_sgtable_for_cpu()/dma_sync_sgtable_for_device().

It's basically a hack and should be removed, but for this we need to change all clients which is tons of work.

Regards,
Christian.

> 
> Thanks
> Andrew
> 
> Changes for v2:
>  - fix attachment table use-after-free
>  - rebased on v6.17-rc1
> 
> Andrew Davis (3):
>   udmabuf: Keep track current device mappings
>   udmabuf: Sync buffer mappings for attached devices
>   udmabuf: Use module_misc_device() to register this device
> 
>  drivers/dma-buf/udmabuf.c | 133 +++++++++++++++++++-------------------
>  1 file changed, 67 insertions(+), 66 deletions(-)
> 

