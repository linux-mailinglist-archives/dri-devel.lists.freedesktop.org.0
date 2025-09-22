Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4853B9055F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E0010E425;
	Mon, 22 Sep 2025 11:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fAu4GSj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034AA10E424;
 Mon, 22 Sep 2025 11:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvtQOg4jT/vdg1LTqc3RN+lp+oHELTK1CJ8XEHiBnMs7YT8RzJ0NYSjzVtFbZT6dwWqx+ps0OfRc7A5OhfpsGZzEN+AMiZWgYTLpcokGFpURCAJHmjz9ntBEKyH9ZyXZnax5caGwHJI+3V4w5nUea+izB33RcWX09+ymQyl+imr2EbqN02hbr4mJcbm9SY6F6NWLnHe7sUaFhX/2AvYEECrvDXkJnG7qnh8Y2E05OPmN6fWocbVbhwE6zyultQw9DFRHxNaP1QIZQb/RQZexhgaTYHMqZbI+1yfm/s/M8HCDfDLoFusQ9izj3EN7T50o3NTZVvJfTmcodYhdExa8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvVLV2yfj/5pR39Cs3wkgnt3sAVT2gzLG1m/v8M0YPM=;
 b=kJYTVP0HX7MGFazjvOdZbvzHvV6wGNyvvPvz6CF9TmZRWActaNCYgBeUCqklKffatwc6E8m82d66t9gyT7ozqUdrQ1m28RB40TSGeOQWo11QMuZ2XdW9H6UJNXSonXC0lPMj+SzcTgKOI9b97PlBR0d0GUxiFDgZW96P6+4M3amfBomDUQnhIoeo6IVUFWPSSo4VonS9Nvz9XxUG/5LxMjsjeYZJGOj3+9e2wjSgOU0Y+wrp9Lwv/3C5X3FvAw6oBbURhSmJ6x/X5pk0fiY8Uue/JgglT/4zOVFFpwvTZMSCym3sZq5yFzrEboGasnDrtr0w1JItsyhd1AYFbD2DQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvVLV2yfj/5pR39Cs3wkgnt3sAVT2gzLG1m/v8M0YPM=;
 b=fAu4GSj110rpI1Anf+/q0zkP8u//a3uulxHeULMPFjkSalnBLsgbgdlN9C1d4W17zDfw6eHMV3UlK3fKOwtje2jkLv/R7jsB3p0G6VIg+4NUhDzcfW/DqfO9EVWXtNNhH14rbzCpuDN80pd5M3tZUrT/8oKuvzoE7b6nF1M9iYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 11:22:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:22:54 +0000
Message-ID: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
Date: Mon, 22 Sep 2025 13:22:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: b27a8bff-4463-4eac-8081-08ddf9ca5f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUxvTjhyS0V4QjNCT3dyMUFTeHhMTm1LaytxMld5OTZreFVVZ1FqbDdIb1Ru?=
 =?utf-8?B?R3FESTVhdUZWeStia0R6ZVJnQXV5eXlpY3VyZzhWQXJaS3BWbzFSZ01BdGVH?=
 =?utf-8?B?WHF6U2psWWtKVHFNZFlqNHBaR3FpSDNubjVyVjVobmFvazBKeVZ1M1pQQ2hh?=
 =?utf-8?B?bU9MUXk2WGRSMVNtMk1NcUNqaVBnbkJtVm02K29lN2hGNjBjTzROWkszbVl6?=
 =?utf-8?B?azRLYVdnQU1GaE5FU2lHMlpjVlJZTTRtcnZOcm5qRGxlVEN6enNRQmw5eStP?=
 =?utf-8?B?S1hDRFAvNC9xYTJyZWdDeENaL1VKaXRQWEEwT0hwUHNvMlVwdSt6NjVzSVdJ?=
 =?utf-8?B?ZFFzQktjSFVmMGNCei9za1JKZWZmV1psaHZLbDU5TUZ3OWZHSEkrQjYwZDVx?=
 =?utf-8?B?VXllTWVQTnA1WGFDeEZkNnExdk5lWUNjekxoSDFrMjRZbXphSngxdEtwOXJZ?=
 =?utf-8?B?YWlpdmRicVo1VWdkelArSWRwbFErK2doTkE3WEp0eFRZQVMyTmFmN3YrL0k0?=
 =?utf-8?B?dU9SRkk1OTZId3l2QytBOE9Tam5jV0tRSU9HTmVWTDVnSUF6b3FMSmVyZHJY?=
 =?utf-8?B?bnNPTEVhaG42Nmd6WmNjTHVWYTluWGlIdVRwU0ZkUG55OWtPYm9aeDlBL3Fq?=
 =?utf-8?B?QkgwSmlZdTFRVXFRb3kzcllDNnFPeHU2Z3R5WGUxOVQreXlQeWhUSVRHSlpt?=
 =?utf-8?B?UDU3YXloMXFhT2I4bDZMUUFibDh1MU15YzhINWNsMktKcURvaU4xU2FFcTQr?=
 =?utf-8?B?NGNjdDAvV2MxNERiVEQvK1o5Smt3UytWVmg3dVIvYU01ZWdZcHEwaVhPVE4x?=
 =?utf-8?B?QTdsZVJmYnd1U1RMZWRUb0VvTDlHQmJQcVVhUWFBbi9MZUt5aGVQZEwrem5v?=
 =?utf-8?B?VGJ5QWh3NGZ2b1c1VmVWOUg4Rk9hUkhUaytvY25HTERjZE9KUzFVUmhDTSts?=
 =?utf-8?B?Z3BZZlhTcFNuK2wvRXJ6S0hGbUMwdGZPUXN5NHplV2twYUk2dGk1OThlMVFT?=
 =?utf-8?B?V2EvZ1l2MnJzaWtGeHZkcHhVamJUWCtyQlBCRGxyTUxEaXBDSGI4RUM0cXBE?=
 =?utf-8?B?d3ZKTnhqUXlrN09HOWV1WCtYWWVZYzdJOVA1OVhPdXJvNjB3SEZiYWV0dmUv?=
 =?utf-8?B?a3pMZk5lRWJwRVN6R1ZzY1pUY1lZSlBmKzNMOEluQnk0VG1PcmhyRDZ4Z0x6?=
 =?utf-8?B?S0FCMW5WNmpRbUcxVVZ2TzcvMVluRStremo2SUwrTXNNK1NiUTZtc093Z29l?=
 =?utf-8?B?dnRiUnhRN0dxY0dHeXFOcmxXWWYvOStJTkVoNFdTSTZ0b1g3Z3RhZHBzeFB0?=
 =?utf-8?B?K0dmeEdWU0M5VC93ZmZta01ISE9MaWZJbnZlUHNZY2xQR1FuUFVjMzVvWVFi?=
 =?utf-8?B?ZDNwYit1L3UyVmZsbURPTjkyRGpra2lDTWZ2RVM5aENlalVMR2lndGozYzQv?=
 =?utf-8?B?SXBiTVNXOHBFYjRra3cvdlpBSEtYN1ZBa1JzbjVpNGNSSlduRXI3TzF0OUZV?=
 =?utf-8?B?RjNoTEo4YWV0MFdDbmNXQlpSYmRTVW5DL2lKYlNaQmtNSW1XSDducVBpUElM?=
 =?utf-8?B?QnorV1VVNmNFNTRjTjhMUjhnbjVLS0I5Q3RoSW90SXU5NGxobk1Pb1k5dHNC?=
 =?utf-8?B?ckdGNjNSaWFKN1ZVd2RybWpJREdBQnRMMzhRam1RLzc2NXMvVzE1VUFtMmE4?=
 =?utf-8?B?UUpyMnM5R3hxeDF4M1JNS3BJYlJKYzRNVUErUWlyNE0xY2RWMVY2aUFtSGla?=
 =?utf-8?B?YjJadFM0T3ZIM2dJTmtGdmJKU3pZRklxNTVaZzlOalFoSzREd3FxZlhnOHJo?=
 =?utf-8?B?d0J3NDJ5ZU5SWURUVnVzbWhzZGJhM0xWMHllUzBveUwwRUFHdTlMVmpPNkRG?=
 =?utf-8?B?Undmc2EzQkphSG01WEw5OUp1NCtvdFpOV2Nlc2tuRXd0N3hjcHdFODZBb3dM?=
 =?utf-8?Q?I9J9X4Dq6g0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdmUUtWSVNpaWl5OWZESjhCUDNmK0lHZndNRUFjdnl2b0gxcTRXRmYwOWlU?=
 =?utf-8?B?RmhpUHdud3NJK2xoN1lHNWY5T3dRem1mVFF5SnQ3L3VsZjBVdWprU0Q3ZUNV?=
 =?utf-8?B?UXZ5eVlVN200a0VsNTM5QU1KUnZhVjcrL3FsR1FQQmxLWllkMFNvclpzelp4?=
 =?utf-8?B?bGRWeEwyTWFVS1VKbUxwMHdCNTBsRDkrL0IzeUFQNFg4T0hJaFpkdFc5NHFZ?=
 =?utf-8?B?WlY5dDJycTJURVdueHY1N0FORWxWQXlXRWYydFZOaGtJL0VuNHFCWE9oNFZ5?=
 =?utf-8?B?WmkvUVNNYzdqNk11TnE3cHRBMDhIRCtqMUJRWHQzcUR4V2s3Q0IzRWJhZXd2?=
 =?utf-8?B?WmVGR1U2NEt2Sk9hUUZXUzB3Zjl4YWhMVFpONGVMV3JCWWx4TWFVOTVXcGtk?=
 =?utf-8?B?eEFZdWEyOXAyV3NzYTd3djg4N2hyaFFxZFc4YWRSUDhCeUF2VXFQOHF1L3NU?=
 =?utf-8?B?ZWFwVnZiRGR3MGFMOFZtVEtSN3JqUFFtc0g4Z2V0UDVxMUhaeUo1MDc4Y210?=
 =?utf-8?B?OWRKdm9qVXJVR1VwSDg3YitRMit2QTJzblRaTmcydCt5QUdlT0dicGp5NHZ4?=
 =?utf-8?B?VVdnTld3UHR4UjNxZm11WTAyNUkySE4wOWV6SkswTzlhNkpCTVY0b3BaQld5?=
 =?utf-8?B?cC8zTWk3UHRtVzR6MWpEZkhDdzFJTkVWcGcwRy9MQTRxdjM4OVp2Z0IyQTYx?=
 =?utf-8?B?YnlIM3hLWmRGMXRYa09jQXVGTy9NdVZ1dzdXOU5NdFVFQ2FCaVZXdDh6cjZG?=
 =?utf-8?B?K01SKzZEZ2VKM1UzS0Z4aGVOa3g5NFdZSnAzT1c4NmtnVjN5aVUvcHM5b2Rw?=
 =?utf-8?B?anZZMFBrY255bUY0ZW9mRkwvM2pxTi9PS1lzdmFlOG1mc3FHM2cyZkQ4QUFW?=
 =?utf-8?B?cEpaWm9LbUlaQjJwNmg0NTA0MENwMGEzUUFMSDNTZWRBN20wR0d4aXJlMm4w?=
 =?utf-8?B?TUc0YzVBZng5YVBaZUFMUVNzWmZtSkovQ0p3czN2THo4SjFUc0ZxNGVWWHBs?=
 =?utf-8?B?WHI1aG91ZjQxT1hnYXR5cEk4d3IxRTBrV20vcDdFSklHSHVTcUdvU0pkTE9a?=
 =?utf-8?B?eFY5Z1BKeEZTMFZFd0xkVFhDY3RRS1U2Z1V6STAweGphek9kd3RuRmZVbkZY?=
 =?utf-8?B?NUZJb0JFUWlkSEJJWnRsVE94MnNUVEgzUjlZWU5MbVJMZGM0M05WKzY4dEg0?=
 =?utf-8?B?NkpIUnlxSThIcUhoSHB5OS9LdDNGMTkyVitLSlpBZkdRNlZmK3ZJK2luRmFV?=
 =?utf-8?B?ZWJtUmxwMGhKWklXOUxuNllzeFpwQUlvOWkyZmllSU8waE4xcE85L0s1RHFi?=
 =?utf-8?B?YjNpcWNMN1RUSW1UUlk1VG1yV1FrL0x6SmlOUEh0cktaV3hxbTlmeGVNOFBI?=
 =?utf-8?B?eE5rU1VSaDJtUmp5OUtaMG5UUHVPbnpVUjgxR1V5RUNObEVRWEtobkEyZC9K?=
 =?utf-8?B?QzQyTmlCY2wxRTJ6VHpxdTBuYlRSSHlrdC94WkQyMEVJQWdSM2FPVzNXVENV?=
 =?utf-8?B?QnNMUzdMMFcvMFdadFhTQnNjcktNdDRpSDI3ZHJ2aTY5OC8yZnZUT2VnSTYx?=
 =?utf-8?B?WDUxc3YybnJMNEFuVmFlZjNTTzh5NlY1SFpvc3JncGZlZTI3YXVNS1ZNY0s4?=
 =?utf-8?B?NkcwMUgxb3gwNWQySE5XbUlma2dpa2liVnArS2xPTFJOaXNSQjF4UmkrRG1V?=
 =?utf-8?B?UVloeWVqUHBWdWh0ZjdoMFg5bW00SDBGdzdEMUxQUkJ2WFQwS0llTmgxcGNX?=
 =?utf-8?B?bTNGN3ZEKzdSamRlbEU1M3JFUS9EelVYdXdGdS9EVHNpcVFRRkRJdWw4a05V?=
 =?utf-8?B?cWZXaGxsYW4wcUZiUUFWSXZyZHN3d0dYM1ZnZTNJNjdPU2thNXR4UngrbUNE?=
 =?utf-8?B?d3pSbmZjU01OUmtWUlNuTFMxNXovY3NGS0JRanhJK1Q4Vmc3SlNsNUFaZUVN?=
 =?utf-8?B?RC9BNE9lUjNydkFYdW9YUnI4bzNsRVpMT2x6ZlVldHZDbGVpRElZS2lzQjl5?=
 =?utf-8?B?VVI0R2s2Z3BXY2NLdGJrZWVCQzlHZWZIcU9vNnVDdmdqbFJrRWc0UUdzWHIw?=
 =?utf-8?B?Q1VzUDAyUXJ1SWZSTGlvd3kwbndUR21ZWTQyd1UwRWVHOENFcHZMVXlIMWpK?=
 =?utf-8?Q?wOFQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27a8bff-4463-4eac-8081-08ddf9ca5f7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:22:54.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mi1yMsiX1QYXMhNuYtSYgbLhpo9dMqMLVOpM6NMInGWa4v4cxIqxXRBvY9tGmFHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8131
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

Hi guys,

On 22.09.25 08:59, Kasireddy, Vivek wrote:
> Hi Jason,
> 
>> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
>> functions of Intel GPUs
>>
>> On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:
>>>> In this case messing with ACS is completely wrong. If the intention is
>>>> to convay a some kind of "private" address representing the physical
>>>> VRAM then you need to use a DMABUF mechanism to do that, not
>> deliver a
>>>> P2P address that the other side cannot access.
>>
>>> I think using a PCI BAR Address works just fine in this case because the Xe
>>> driver bound to PF on the Host can easily determine that it belongs to one
>>> of the VFs and translate it into VRAM Address.
>>
>> That isn't how the P2P or ACS mechansim works in Linux, it is about
>> the actual address used for DMA.
> Right, but this is not dealing with P2P DMA access between two random,
> unrelated devices. Instead, this is a special situation involving a GPU PF
> trying to access the VRAM of a VF that it provisioned and holds a reference
> on (note that the backing object for VF's VRAM is pinned by Xe on Host
> as part of resource provisioning). But it gets treated as regular P2P DMA
> because the exporters rely on pci_p2pdma_distance() or
> pci_p2pdma_map_type() to determine P2P compatibility.
> 
> In other words, I am trying to look at this problem differently: how can the
> PF be allowed to access the VF's resource that it provisioned, particularly
> when the VF itself requests the PF to access it and when a hardware path
> (via PCIe fabric) is not required/supported or doesn't exist at all?

Well what exactly is happening here? You have a PF assigned to the host and a VF passed through to a guest, correct?

And now the PF (from the host side) wants to access a BAR of the VF?

Regards,
Christian.

> 
> Furthermore, note that on a server system with a whitelisted PCIe upstream
> bridge, this quirk would not be needed at all as pci_p2pdma_map_type()
> would not have failed and this would have been a purely Xe driver specific
> problem to solve that would have required just the translation logic and no
> further changes anywhere. But my goal is to fix it across systems like
> workstations/desktops that do not typically have whitelisted PCIe upstream
> bridges.
> 
>>
>> You can't translate a dma_addr_t to anything in the Xe PF driver
>> anyhow, once it goes through the IOMMU the necessary information is lost.
> Well, I already tested this path (via IOMMU, with your earlier vfio-pci +
> dmabuf patch that used dma_map_resource() and also with Leon's latest
> version) and found that I could still do the translation in the Xe PF driver
> after first calling iommu_iova_to_phys().
> 
>> This is a fundamentally broken design to dma map something and
>> then try to reverse engineer the dma_addr_t back to something with
>> meaning.
> IIUC, I don't think this is a new or radical idea. I think the concept is slightly
> similar to using bounce buffers to address hardware DMA limitations except
> that there are no memory copies and the CPU is not involved. And, I don't see
> any other way to do this because I don't believe the exporter can provide a
> DMA address that the importer can use directly without any translation, which
> seems unavoidable in this case.
> 
>>
>>>> Christian told me dmabuf has such a private address mechanism, so
>>>> please figure out a way to use it..
>>>
>>> Even if such as a mechanism exists, we still need a way to prevent
>>> pci_p2pdma_map_type() from failing when invoked by the exporter (vfio-
>> pci).
>>> Does it make sense to move this quirk into the exporter?
>>
>> When you export a private address through dmabuf the VFIO exporter
>> will not call p2pdma paths when generating it.
> I have cc'd Christian and Simona. Hopefully, they can help explain how
> the dmabuf private address mechanism can be used to address my
> use-case. And, I sincerely hope that it will work, otherwise I don't see
> any viable path forward for what I am trying to do other than using this
> quirk and translation. Note that the main reason why I am doing this
> is because I am seeing at-least ~35% performance gain when running
> light 3D/Gfx workloads.
> 
>>
>>> Also, AFAICS, translating BAR Address to VRAM Address can only be
>>> done by the Xe driver bound to PF because it has access to provisioning
>>> data. In other words, vfio-pci would not be able to share any other
>>> address other than the BAR Address because it wouldn't know how to
>>> translate it to VRAM Address.
>>
>> If you have a vfio varient driver then the VF vfio driver could call
>> the Xe driver to create a suitable dmabuf using the private
>> addressing. This is probably what is required here if this is what you
>> are trying to do.
> Could this not be done via the vendor agnostic vfio-pci (+ dmabuf) driver
> instead of having to use a separate VF/vfio variant driver?
> 
>>
>>>> No, don't, it is completely wrong to mess with ACS flags for the
>>>> problem you are trying to solve.
>>
>>> But I am not messing with any ACS flags here. I am just adding a quirk to
>>> sidestep the ACS enforcement check given that the PF to VF access does
>>> not involve the PCIe fabric in this case.
>>
>> Which is completely wrong. These are all based on fabric capability,
>> not based on code in drivers to wrongly "translate" the dma_addr_t.
> I am not sure why you consider translation to be wrong in this case
> given that it is done by a trusted entity (Xe PF driver) that is bound to
> the GPU PF and provisioned the resource that it is trying to access.
> What limitations do you see with this approach?
> 
> Also, the quirk being added in this patch is indeed meant to address a
> specific case (GPU PF to VF access) to workaround a potential hardware
> limitation (non-existence of a direct PF to VF DMA access path via the
> PCIe fabric). Isn't that one of the main ideas behind using quirks -- to
> address hardware limitations?
> 
> Thanks,
> Vivek
> 
>>
>> Jason

