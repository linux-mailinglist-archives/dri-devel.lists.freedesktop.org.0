Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61E7B95DD5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 14:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7DD10E11E;
	Tue, 23 Sep 2025 12:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t8YtKf2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864F110E011;
 Tue, 23 Sep 2025 12:45:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0CZTvVDrMxG8geC+/nL5TTx17/PeeAOblchtE6KPUhJ34xkyRFlyZl3VNp2F7qvmd2q2D/q0NIKg7KXJn1uR8YLpYJhrXniQZ247hMqTvW739UlcVMh3sBKtHsDej1NsWCilw97S4UZSid9iitzhjKSYTv6TeisNf/zFVtXPb0a2sfmpprcIXgIxFsSBNjEkaRWUgczf5n9EAZjPMyC8rNX6pJnAsmPZ2ZBjqEhM3aXyv2Y4VSsjrsVNkcQxvlTTFW54jBnx3/4F18J7CQlW9AmTKG53Dm3cKCGw0Mzvy6eh40bup768Iw5TCu43wq2QEQa5sAUfqC9SAlW33bLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loJ8eFnru7Z+p0gz9mVJYD9OonC5X86F0Tu1HqFr+EU=;
 b=xO4+uE7dJEhx8a7kwie9ur/JuDCD5BP23P0CqgLCPS8tGMqKy1Axb9FLf0pN6jJ6f04Ig7LhkpU9u9khqHbSfuOGGoRdMByFlwS5tD7Z3mubtg7AgOIiXHpcCZk0RmVxflBSn5DfyJdNnET8gEmzvc00it5557H6MqHwjBmAjC3589dmxkynLthhRdDrNESpYqkwUOacNrJOp/fM1KVnj35T9sClBqtWJ7rnpTBUHFGJDRpgaSLSAmrQ1oXxi1ZIU+8rmmKY/IPUdrh2zRLJ1qOG3ot6tmrgnkcJuyGLcXAif0vg4J4IvzvdlEQ0uhZuJxg3nZMuM2EDQQ+K1gl0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loJ8eFnru7Z+p0gz9mVJYD9OonC5X86F0Tu1HqFr+EU=;
 b=t8YtKf2jI9mv6jRbjiJmmlzljf6/peiIpqWqApmpDUAB7lT4f1ddOXa6oohI+F0+AnCXCxtFiYZHrCjiZCfLxk/DnaOcOdLF2Ieb0Da/3gjOsOLdzNhPv6jGCLJSGYHHlgTd35M/O+L1f57L+aHPphidwzu8SdAkrrSapul0EcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 12:45:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 12:45:16 +0000
Message-ID: <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
Date: Tue, 23 Sep 2025 14:45:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250923121528.GH1391379@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d6dab3-ecfd-4122-82ce-08ddfa9f0b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlNFVGJCWjFheDRnMVZtK0diS2p5TzRKbUxHVk5lcDRiSEFKellxLzV6eFNP?=
 =?utf-8?B?c29lN3pTUmtyZUw1bmx1U3lPSGl1WGJieUlReFUrQVJVN2xNSlFvOGlwS1M3?=
 =?utf-8?B?UFRMWGlpam4zTVR4REZHSTN1ektzdHI2cXZtcUkzTVhPalN3emRjQ1lOSy8x?=
 =?utf-8?B?T1QxT3BqcXpwb05PRWFMOVM5SkFyUVVjZzNtekQ4UEQ0a2Z1RVFTUlB6LzlQ?=
 =?utf-8?B?VURoMEVtdnZlK0Y0WnoxdEZPTWJiT0JabytnbXBTd3FwVS9LL2ZSdXduSjRu?=
 =?utf-8?B?QzRVeS95WS83aWlNSHlwRzFBNms5OS9ad0RxcnhJZ0p4NEkzZlljWEg3d3VD?=
 =?utf-8?B?RkdPRUEyTjFyNWVsWGsvZFllVUZDNDVnMG1udi9FSzVuWWQrMkxDWlVTUmk3?=
 =?utf-8?B?NjZBem5RNVZJamFLcjNTbHREblJyV2wvd0NuUlJYYUdWZTdzcDA2dzl4UG93?=
 =?utf-8?B?QWZiMldyT3RqelAybXd5WDFjTHZuNWZlTkhmdDNkcWNsOWc1ZVNXMzRQYUdv?=
 =?utf-8?B?MVU2RWFuYjZScVRQaDRPRlh1UlBONmN0ZHJYTkZ3bFMvcy9HSUdrUDk4Y1ds?=
 =?utf-8?B?VXl3aG5GSmZDYWFicEhDcFBsa3ZkNGNKNTNHb1N5Yms3QTFHanlFdXYrR1M0?=
 =?utf-8?B?ZFVyajduMnRsemZMa09XSEpHN3FrVVdTM1d1dkwrZzdNTG9zUWxkclpmU0dE?=
 =?utf-8?B?ek93N0NsVUVpSENSMUkrdm01dk1vVDlzNnFoZTJSRS9USDhsVEN0UkZWVTBO?=
 =?utf-8?B?bUNaeXE4T0ZpV1VPZ3Bmek4ya2I0M2NKNU5xVmszYWZOYWlNMXhCZEpCTzJJ?=
 =?utf-8?B?TXhUUlRBWDY0OWEycm9SVWNSc1lBVmMyKzlCSUhkN28xRDZzdDRaVlg1K2lT?=
 =?utf-8?B?R3BPNk5DTzJ1SzUzN0gxNWVkSUNLdDdaTWEvaXE1Y3RVdlBPMDZaenJhck9y?=
 =?utf-8?B?UTlsVHhiQVVqb0RNMHROQTFYR2lHckRPTzlLVlBFcEtFYWUxZXk4cTFwR2ZT?=
 =?utf-8?B?OG0vaWI4aEdQK3FsdGw2TlkxUmxiTytWMFgvd3lFaTA3T1NTQUh4dGhjWDdS?=
 =?utf-8?B?U1B5clVyUTZ1NVVHTzF0TW1YTm1uczJPRU5XYjRDRXE0dElyMkN0aUd5T0d4?=
 =?utf-8?B?cFpKb0pubGEwRTJPc0Q5VDU2U0t2eUtzS0NTZ0NQeVNCYXVUSDF0ZFVFYlIx?=
 =?utf-8?B?QSttaHhrRUowY1pnQUJkZ2IrSXcyKzlRODFiNHVXT1BwTERhMWYvdFpFY0hy?=
 =?utf-8?B?UExJbnMzQzJUc0RtTVVqY09UWThydVNHWHQ4bHFXZmgwdTY5bXJyT1VBVVRG?=
 =?utf-8?B?bm0vRG9RMmpTZ1ZjOUhzclBGMlhEWk9xRXM5M3ZYZ2xQbzNHYSswclc0TU5K?=
 =?utf-8?B?NjFmQm5VY3ZyYWhYQ1IyM1RwclZhUVR4cTl2QXRYZm5zcWN0Z1NrbGkwTFBj?=
 =?utf-8?B?UWlMSXltMXl2emFpZVBKZkJCOEpqZjYrMzZTRFNpZ24valp6RWlmbTFxdHBw?=
 =?utf-8?B?Nm1YNFdWUExnRm0yeHFhcUZFNEl1aEQ2a1U2RStVZjJFd3NmYkRyZUx5bjZV?=
 =?utf-8?B?dnFmU3BOM0h0MnZNbVZIVWJCcEVEL2VvTjBxR3RDZmdlY1JsUktQejFZOVpl?=
 =?utf-8?B?cHk1cm51Q29XTmt3M2RZQ0FCVnRNVHlCQ0lFM1RHYml2UGRrcFBvWGNndzNS?=
 =?utf-8?B?UGhrdmhMdUdVL2ZqMFM5QnpuaVZKRmVXYmswUnNveTBXTnJxRXRaMjVmd1gy?=
 =?utf-8?B?cnNjNFJvU1UxVXBOUDBlWi8wLzVZWG9nSlM5ZE5rcTlCTFJvUGQySHNCbnEv?=
 =?utf-8?B?bllQT3hIdXc0cUgxeTdqMC8rTEtnakdzdlRKSkhJUzVPcFdjOTdVTVNQUHRx?=
 =?utf-8?B?TWI1dzNZcW4wVnBuMFJjQmdvTnVyT3BucjlRMGViQ05HR3VLOUtSUDJWMVg5?=
 =?utf-8?Q?PXPP1n4Fwkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akw4a2lBVGNoZjVnbnd1aFpTSWlFVkwvSk5nNUphRzYvMlRRQzVXbDg3ZnYx?=
 =?utf-8?B?eUxTeEFMVXhPQWpVNFVkSGt1ZWFRZEZoMTVJb3kzdnJra3g4Q21tY25tc3lZ?=
 =?utf-8?B?aUc4R2YwRFVPbWNRRGVmM1JWMVZlK1M4SThFcnVXaEt1dCsyRmk0Nng2c1px?=
 =?utf-8?B?RTV6YTFWdHNjZVhZZVdOWFhveTBjZzNHdjUxanFpZC8rVWNIems2TkxqYW9C?=
 =?utf-8?B?OVE5ejNzNkVaN1Z0blN5UFFsVlVLY1grVUx5ZkRSUEl5cng1OU10NjlPTjBa?=
 =?utf-8?B?b2dlVmFManNZYnN1bXpwYXp0SUtuM3lBMXFLeTY4OCtCOGtJeUYySXhzVmFI?=
 =?utf-8?B?SXFQQWZMNDJnYkVZay9YYlhMVHVEVHVmYUVYSzVySmlPRXFyYWtHa0E4ZXov?=
 =?utf-8?B?clgzaWNFTUplSWp5b09SODR0Njd2V0hMc1V2cldzb204RjRrNE4xOGVEMG84?=
 =?utf-8?B?dEw2REZjVW9qeTFVZmdOQVZabllmZG1nUlRJTFlzWTU3MmJjQ1FRdTZTQWpP?=
 =?utf-8?B?SU4zV2VXd2FucVRlRE9sNlQ0ZElDN3Z1SG5qQ1F3aHRwa3RJd0gzbDNTWnJK?=
 =?utf-8?B?aGEvVWVzclJwdlIvd05NVE9kdWdxTzY5S1l5N1lPMTVJby9lb1hCK2RkS1R2?=
 =?utf-8?B?UDRvZkxwRFFZZWtuWmtKUHNibmpEaUVKbmNvUFJabFR5aDRpREIvdjdpQ1VK?=
 =?utf-8?B?MHg2MGcxZ3YzL0NIN2tyVEtTOVpQWnhaZWUyb0RzdHpjSXJ4aHF5Z2lpa0Mv?=
 =?utf-8?B?MDZhVVBHUlliWWdielBncXBDWU5mamNlbFNTWlgrYi9wYWE2bmk0dHJJM29D?=
 =?utf-8?B?Zk01aFg5NFdYZ0xZSkg0ZE1VcnVhVnNaL1JEWUorY0tKRlhDODBXWGdrOG9j?=
 =?utf-8?B?RFpjaXZkZ2Q4amZIYzBZOExoOXZrSVlrdkFWUDN3d2JxWVFOZVdOc3NHcWxq?=
 =?utf-8?B?ZU5URDRmNXdzUHRJeHJHT0Y3YjVhQWIrUmFnK0kyS2RwV0VON2ZHaTRtL1VT?=
 =?utf-8?B?K2UyVWJadnI3TnlUcnFoV1o0VmVKVEdmSDdYQnIvLzFzVWpNSS9xZmxvMVc3?=
 =?utf-8?B?aVR3SjNvZFdZS2RUVi81REt1djN1VFNhbCtMdjc1eUlYaXByQkRuQUtVditG?=
 =?utf-8?B?SEpyeTl5SDB6MkF5ZGxFSVova1ZlbThYNno2Um5UT25NY1NWYU1ncWUrMUhw?=
 =?utf-8?B?cmN5ZGdJbjZCQkh5NnU5TmhVVmpEeE5WN1pDaktJMlc5bTg4ejFVR3R0SGZj?=
 =?utf-8?B?RlB0TGh2VUZHK1RoMExRa3MrZnFCeGY3M0kwTjdiSjF0QkFmTUZjTFVvV1M2?=
 =?utf-8?B?MHNsMTVvVTJYbmo0Wlg4bVNLS0d4WXVmWk1yYis3UDdwMm9jSjR5NzZXbSsy?=
 =?utf-8?B?azFYdENPM2NOYTV2VWJyWG15eWZVYjQzdjRBVUVjZzhBUDRiRzdtbVJndjVl?=
 =?utf-8?B?d3c5OXJ0c2Z0RUZEd0Nha3EvemJlUkZVRm9jNVFOdFF6QVFSZVp5cnBOSzkr?=
 =?utf-8?B?RzNWV2ExVHZpMlBTOURHQ0h3N0xPSUlGaVJUU21UYmZoN2E4c1NqUkxjdHRm?=
 =?utf-8?B?dE4rUmNPSUhFS3dPTTBTbnFFbTM2NWFmRlVyWFNZNkZFWGlYVmNiaE5ZM0pj?=
 =?utf-8?B?eTVXbERqdCtCejQrNFAyQzZiZzM2ckkyVjFYQWJrcWY5YjhocEdZbTQ4UVZ3?=
 =?utf-8?B?ZlJ4UGlvOHlTQUhicURPcVU3KzZqaTBNd3c3NWw5Z01SYU9xMmRFV2N4LzBw?=
 =?utf-8?B?K3ZGN0ZGcUJLU3dnY3RMSm5pU2xJZlI5TVY0YXJhbDdlc21PRmRBaGNoY3h2?=
 =?utf-8?B?dHdYUjNJWUlKSk5mU1hGcmkrN0ZYZDM0eVhvRmhFSDVSaXJxSTRrWFlPOXFI?=
 =?utf-8?B?NmdXT2lCOEdBNkErVzRDaUdpTUtQNG81dURlV1RRL1RlTXJ0TXBhUHNlQWla?=
 =?utf-8?B?M0hRV3drRmd5RXRWSEozOWFWK0tZNkZzUGxSdmF4ZFQzN0YxUjlPcyt5ckpC?=
 =?utf-8?B?T2Rab1daV2c1Snl1S0QxeVVvK1JZRzhkT2xjWEJGdzA4ZW4zMDRhVEwrS1JX?=
 =?utf-8?B?N2FSQmNPNG9IVm1uWjBQb0JSaFE2Y3RaOHY1TmxuekxaOGJXMmw4eUNEckRq?=
 =?utf-8?Q?JTFtmGguj3Z3+gr0t6Srq1vSs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d6dab3-ecfd-4122-82ce-08ddfa9f0b95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:45:15.9165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxI/HHIvDRo1jkWOXGYQXYaE9L3mMBHyrEiRt5stNipbenPY5n1Kl+PxavySh8Qa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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

On 23.09.25 14:15, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 09:52:04AM +0200, Christian König wrote:
>> For example the ISP driver part of amdgpu provides the V4L2
>> interface and when we interchange a DMA-buf with it we recognize that
>> it is actually the same device we work with.
> 
> One of the issues here is the mis-use of dma_map_resource() to create
> dma_addr_t for PCI devices. This was never correct.

That is not a mis-use at all but rather exactly what dma_map_resource() was created for.

If dma_map_resource() is not ACS aware than we should add that.

> VFIO is using a new correct ACS aware DMA mapping API that I would
> expect all the DMABUF world to slowly migrate to. This API prevents
> mappings in cases that don't work in HW.
> 
> So a design where you have to DMA map something then throw away the
> DMA map after doing some "shortcut" check isn't going to work.
> 
> We need some way for the importer/exporter to negotiate what kind of
> address they want to exchange without forcing a dma mapping.

That is already in place. We don't DMA map anything in those use cases.

>>>> I've read through this thread—Jason, correct me if I'm wrong—but I
>>>> believe what you're suggesting is that instead of using PCIe P2P
>>>> (dma_map_resource) to communicate the VF's VRAM offset to the PF, we
>>>> should teach dma-buf to natively understand a VF's VRAM offset. I don't
>>>> think this is currently built into dma-buf, but it probably should be,
>>>> as it could benefit other use cases as well (e.g., UALink, NVLink,
>>>> etc.).
>>>>
>>>> In both examples above, the PCIe P2P fabric is used for communication,
>>>> whereas in the VF→PF case, it's only using the PCIe P2P address to
>>>> extract the VF's VRAM offset, rather than serving as a communication
>>>> path. I believe that's Jason's objection. Again, Jason, correct me if
>>>> I'm misunderstanding here.
> 
> Yes, this is my point.
> 
> We have many cases now where a dma_addr_t is not the appropriate way
> to exchange addressing information from importer/exporter and we need
> more flexibility.
> 
> I also consider the KVM and iommufd use cases that must have a
> phys_addr_t in this statement.

Abusing phys_addr_t is also the completely wrong approach in that moment.

When you want to communicate addresses in a device specific address space you need a device specific type for that and not abuse phys_addr_t.

>> What you can do is to either export the DMA-buf from the driver who
>> feels responsible for the PF directly (that's what we do in amdgpu
>> because the VRAM is actually not fully accessible through the BAR).
> 
> Again, considering security somehow as there should not be uAPI to
> just give uncontrolled access to VRAM.
> 
> From a security side having the VF create the DMABUF is better as you
> get that security proof that it is permitted to access the VRAM.

Well the VF is basically just a window into the HW of the PF.

The real question is where does the VFIO gets the necessary information which parts of the BAR to expose?

> From this thread I think if VFIO had the negotiated option to export a
> CPU phys_addr_t then the Xe PF driver can reliably convert that to a
> VRAM offset.
> 
> We need to add a CPU phys_addr_t option for VFIO to iommufd and KVM
> anyhow, those cases can't use dma_addr_t.

Clear NAK to using CPU phys_addr_t. This is just a horrible idea.

Regards,
Christian.

> 
>>>> I'd prefer to leave the provisioning data to the PF if possible. I
>>>> haven't fully wrapped my head around the flow yet, but it should be
>>>> feasible for the VF → VFIO → PF path to pass along the initial VF
>>>> scatter-gather (SG) list in the dma-buf, which includes VF-specific
>>>> PFNs. The PF can then use this, along with its provisioning information,
>>>> to resolve the physical address.
>>
>> Well don't put that into the sg_table but rather into an xarray or
>> similar, but in general that's the correct idea.
> 
> Yes, please lets move away from re-using dma_addr_t to represent
> things that are not created by the DMA API.
> 
> Jason

