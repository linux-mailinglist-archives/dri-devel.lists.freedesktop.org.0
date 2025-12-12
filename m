Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81FFCB7FE8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 07:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACC410E32E;
	Fri, 12 Dec 2025 06:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="asoeCfeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C910E32E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 06:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg7kUNoytkEpc7rYeBTWP/JQswGrUtRHvKKha/NoWO/uU+cWLVwWIZF1Oc/+R6Fgr0VtpXU4Mx0IHWqFKDS5bLp+rRHK+54Bjlo4s+J3GtuVJuqYClsfcM/2AePSa2uzhLM3algBAFLxoHRtAG4mI3X9Jgd2Iloy4BdzuvjWWD9UzGUNKIpDaAjgtcCOPCEleEFQPRVrzOtRE1wI1jN/lvPXYKg8hN30cg0mSIcpQXRvlTF1u+vLLJG8zcw9R8iiuXVNVmFJqfcktQcI4eKDmMwyhnGzGRwB/djo84rmc2K84p3YqvXfBxdSUUfgI3XyRxPNnBsBjj/db+2Zq4BOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu5frvd74PyqmdLck1t+0WZAVuoYaWvfTj9rQCTrg6I=;
 b=m2/KpWSYUqeY3AZITo0qgktxfwkaNadfzoS8fFtqS4FymXXspDbSn2Uhrcg1Xlqj04rYt+DnADip7WexVPBC7lJ/aInTiCQeZ317PAt7+zmjfCnJzGjNG289jA4xbuOmTXdF+7VpzkN/Qd57AB6lyBwKVrmbQx2PlO/ePmpKrClgtu/Uk8QlCGvqYbMjyiboeoyRkon2r76hlyvwBDKPgyGwSd2rtocuv6O/XpVG6ZqX4kcAlqEYaLjAjbZbkD+ht+zfMo/3Uch58PMkpO2M09oDIF/He6sNafGNjK4IjTdVbiLVCt8nJyt/QzAsxURuVU4lg0ELaz3dIZJJiYZgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu5frvd74PyqmdLck1t+0WZAVuoYaWvfTj9rQCTrg6I=;
 b=asoeCfeGyO74TNqGdqhnc6S0n7G5MElVqBsUg48lKhIQNe0fforTAkgLauJ3jKA4KITPBsCeVnuwLvI41ZZQe26r5ar+Vwco8moINgmA4FiV1VNePYFGxLpG/CggZrkwLjEfaNFo5HAwBprkc8SJwgPmtXpn4xR1gdVqkJ5DCcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 06:00:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 06:00:36 +0000
Message-ID: <b3ed5b11-c0cb-46c5-a498-95e6ba6f4e01@amd.com>
Date: Fri, 12 Dec 2025 11:30:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lizhi Hou <lizhi.hou@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 LKML <linux-kernel@vger.kernel.org>, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, VinitKumar.Shukla@amd.com,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-2-lizhi.hou@amd.com>
 <5217a9b3-8489-fd18-051a-46a497ff56bd@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5217a9b3-8489-fd18-051a-46a497ff56bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 00eaa7c0-2499-46d6-ea67-08de3943c4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStZaDZPZUQ2a3ZiNXJwcG83MTVMVzhISzh4KzFnRDJhV1c5MHpvTUNSZ2VS?=
 =?utf-8?B?ZEZ6Q1QwMzJpZW9ydHNBcjJDSFlhWm1UajhETFYzTHQycWZKeER6U0oxelBo?=
 =?utf-8?B?a0E2Slc2S3l4TSsyOTcyNk1JMkszanpHV3BobGpKZFJPQ1RNYVphNUExSmRt?=
 =?utf-8?B?NVpZclhqaW0rN3VYSTZQVld6Rmd5cjVpeDh3M3RJa0FKWFJ5MjFsVHpXU0FS?=
 =?utf-8?B?OVZ2T0MyRE1JV3BiS2pWS0VleHB5aEs1QnJwOUhSeW8wQjdLMTJyZmU2d0FS?=
 =?utf-8?B?VFJUVEJlQTV5V2dyTkZ4QkNPZDFMOStSZXNJL1c3alN0Z3c0ZjMwaFliRStx?=
 =?utf-8?B?UkJibEZTTDJLMTEyd25IY0Irb3lnR2FJUXNKNkRCUkExdUpDcmo3L0ZwbTA0?=
 =?utf-8?B?MVBzeTlkVWpGenNuTzErS2hYemNwSWhmWHNlbE1BZkVTdkQwbFRGei9ySm1k?=
 =?utf-8?B?S2tEN3NxaHF1S2NIcFdEWGxIZHAzd0F1Z3Nkd1I4ejBaUmlFcmVwRS9BeTRV?=
 =?utf-8?B?aVk2M293bGFucnpVVWtEMG5haS9xNnc3WjhwY0lhK0J1Z1g0OHZjUUwrK21N?=
 =?utf-8?B?T1NkUHRia1RQVHI4a0J0YVlYUjVjaHM5VE9iQURTOXFsaXhjUGxxNnZBVEY3?=
 =?utf-8?B?ZzNoV3RMaWx2Z0JFWGlkOXVOZ01tdXh4RWI5b3VwZzRNdzBHZVRyTlJZbG5Q?=
 =?utf-8?B?d0VnbE5TZ3k4SWpERHorN1lZOSs3K2MvOUJNMkpmTnd0bUljWE0yck91MUpo?=
 =?utf-8?B?WkhPYkd5TzBZZHN3TEcrWExUd2tKbDFaZkxJaTB5VVZRTFdua2gvbitRb3I1?=
 =?utf-8?B?Q1l1N3Y4amp6UEV0aDk2allJYlFFS2k1N0FkMXRaTzZuMEdCa2tQN1Z6WUN2?=
 =?utf-8?B?L1Bzd0lSZVBSSWJTbmRrVU11Qzd4M3RlcHVyRnFhVmlBNXFtZlBoc2FOaitY?=
 =?utf-8?B?UDBlcnZRWEJqS1dXaUEvT3FKSlJXSGIrK2xpbit0aUVyQnFqMUEyby9IT0F0?=
 =?utf-8?B?dnBGMEJWbCt6U2RhRklwOEtJVXFMbUNPVkU4YmZmQjVtR0tXTitkSjQvZElK?=
 =?utf-8?B?TzYrZVhGZHRid25hc084WnhxbmhKOE80VFBNT0IyaEZTdEtNb3YxOW1FRVVQ?=
 =?utf-8?B?aCtYNkYybEhiWXQzUUFmQ1NnWmZLNnVRZ0pmZFlnWnV6TVhiT20yMlF0b2VX?=
 =?utf-8?B?bEtxYzQvZVdQUkdvaU15US9vQkM2SDRtNVUrdGwyK0VlQkN1NTNJakl3ajBT?=
 =?utf-8?B?V1dNNXlqSVBrQzdvaThpWXJkUHFGRHJmVXQydk9aT3F1MDBzem1tS3B6Y2ZM?=
 =?utf-8?B?VkxHR3kycm05RWt3QXAxazNvWnZlY1F0YzVwdU9yMGRMMFRwZXFnTmNGQ0ts?=
 =?utf-8?B?cXZneHEvWlZXTWQ2bVpneVJ6cmFIRm5lejZYTHBVYmc3aC9KbEM5LzlSVy9F?=
 =?utf-8?B?aC90RktCOVdlWjVLSllNZFp0bkIzMndieDVscTBFTHE4S1VtUDNhWWRxV1Z5?=
 =?utf-8?B?TkoxTExTaFMrVzhXcUFHcGFjTXQrZHVjV2NOYXh0U0krQTBOV2NvT2k5cHRy?=
 =?utf-8?B?WUF4K2xha1pqS1ZOemd1TlNJZUtTRDJySXpQN2UrMXNIUXdENFNWWTFBNGgw?=
 =?utf-8?B?UFBTM0JDM3hLMk5KYWl1c1dEU3c2U1ZLSTB1emlyMjcyOXowemZYV0s2a09y?=
 =?utf-8?B?QlZrbUsvdmkxVkhwQkNyakNZUC9NOFh4TzJJbG9uNW9FT01nS1RDNGNNcExs?=
 =?utf-8?B?eEVHcW40MmtTMk13a3RiUWFMQjZWMGhHRjlFckRZUVRXbzBrV3d4VmZWMm5W?=
 =?utf-8?B?aFRTdm1SUDFiZkdrWVVSUzFRSHNqRURQZU9lMzlsZnVXSTRUVlJRVkJBY0dJ?=
 =?utf-8?B?VzlGNGw5dkNWSFJhaWU0UWN0Mm1xdUZSazRwd2hDR2lJSFF5cWRNZUk3ajUr?=
 =?utf-8?B?cFYrTWJ4ZlRXZm82MzIvSjBFbDFRNDhPZS9hU0RrYW9ONmlWVEVFcCtXMnpR?=
 =?utf-8?B?TW5LeDhSa2pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitWeGo5Z3FSWElXaVh4U2JNbmYzaytuTlNjUWRJTmZnMGNVS254VkNmMnc2?=
 =?utf-8?B?VHpmMVhjT2NwYllvdS96Sllzem1sVllyaHVZVFdYMUc5K0ZmZzU2anMyNERo?=
 =?utf-8?B?VjJvK2JVTG5wbWdUMW42TnNMQyt0OTJUOGpWckM3OEZoR2NNR3owQlVGbFBl?=
 =?utf-8?B?b1R3aVFyVnpyK0QwQVF4ZzJxcU1nYTZaaHlaY0JZTWZYbll3SmpRSU42d3o4?=
 =?utf-8?B?cWVOaDliL0Z3UkNUbnU1WkVVNFhKT0IxYlFNdWFzREpWR3ljVFhlZlJpM1V5?=
 =?utf-8?B?YUZkTU1XV3RNSlVFanRwdHZqTEpVd1NRdHg2ZHo3TmFTRS8yZkVwdTFHbEJ6?=
 =?utf-8?B?Q2NPNnpMajUvc0RFdGRxYlhsSjdyWEgzRW04Q0JVR0JBRnM5TGtHempadllw?=
 =?utf-8?B?MFhRT2UyNm1pQnkyRXd3Znd4eWJqdjNRb3BoUmhZUm1mT01yUkI1WkdoczlS?=
 =?utf-8?B?SGtocit5eUlHdkxOVy9NemhKUmpOTW1tTmJHQkwyOXhZWXcrd3VkV21MUExM?=
 =?utf-8?B?ZUk5ZjdVdnZKL3FGOWlhYTZpZE1MMHhZYzVINy8xT3JXRWErU1pUa2xaL3A0?=
 =?utf-8?B?MEsvNDVscmhqbkdzK1ozZmdsM2NnMlZxWW1nRzdvUVc3cjgzVWVvbk5ERFZK?=
 =?utf-8?B?RTYraEN3Ym5OWXExR0xUYmR6OElkaURHMDJmZFkrU1Uza3VDK2c4UXlnY0xP?=
 =?utf-8?B?dytRZjlGdm9zTnVlOHB0cjVyTk9DanBpV2lsU09XMEhFZ1dYSXp5U0FQU1Uz?=
 =?utf-8?B?SGNUV2ZQV2FaM1BXbno1M3NxSzlqOFNzWXBwWDB4R25wSTRNOVZXa1U4ZGp2?=
 =?utf-8?B?QWlCcEFzZ2RuQWJ1Yk9SNkpOa1lXd1NWZVBSKzRBQlp2bmpwVHdWU0VFdkRr?=
 =?utf-8?B?Wlg1bms1VUUwRll3Ykd4ejV3Q3gwYWpJcklPUjFHandjb0xreHB1QUxFRUk5?=
 =?utf-8?B?SDF6WjZkOGp6NXFUQ1VITnlxaytDSnN0NGc5dlBOUXpudEtoU1ZJSnJreVVY?=
 =?utf-8?B?TlQ0bTh4b1ZzLy9mWGhFWWFob0F2dXpLNW5qMzIwTGY4d1d6M1ZmaldXL2Ux?=
 =?utf-8?B?TTliUGptYjZhL1JkY25KeGRBYjEvUU9SNEFCalZ3UjR0U2RVb3FNSkMwYmUx?=
 =?utf-8?B?S1dBVUNCUk9uc1ZCZGN1d3hNVVVmSVArZnduUDJia1RTNVdFSThiL2lKc250?=
 =?utf-8?B?dTBoUFo5N2hUZExwNXE2bUQ0NGlRZVZjTXhhc29oajh1L1VjdkpORmhtVDgv?=
 =?utf-8?B?dDRDaEduN0xrY25STWQ3TFNZRnNnL2xwN0ZINzhhNGUvMUcrMWljSW4yVDlT?=
 =?utf-8?B?Q1UxZmJsRHl0aCtPcGowMytHTjA0R0NPWi8vT2xmNDM2czNGVGVFaEZjWEdQ?=
 =?utf-8?B?RG1BaWVndWRBTFFGcGpKZFVyYzRSMEpRWWM5N3VlenZ6dTdlU0FaWWo0RmRt?=
 =?utf-8?B?OUlXQ0VpQVltNUNuOVYxeE5VN2Q3VVNjMDR4U0JXZnNrcFU5MUpjb0o1VFpD?=
 =?utf-8?B?QXJLU0doTE4rN1hqM0RJT0F2NXY2bU1qZ2FkN0lHczlTZytrM1g3cjBoekpN?=
 =?utf-8?B?VnIra0NpODJjQWtzZVN1VWNyc2c0aVJIU3ZVK2RuS3ppMXVxOGtEZ1plL2R6?=
 =?utf-8?B?cnBickxHYTJJZXNpQ2RyNFFsMXZXanZ0b3o5dCt0ZXZnNWJ4YXhNczdIMWY4?=
 =?utf-8?B?MkdYY05OQ0F4S2R5aG5Fd0pVTVFFYWpIS0cySlJydVc1VXRmd2pVSHBvVmYz?=
 =?utf-8?B?dHNBa01vdFhIOHU1S2x4YjdGSWx3VjJkbzQ0K2FYcW9DelZMT3A1RVFObjRs?=
 =?utf-8?B?QitsS0JJeW1QcXA1clU1RW5NaEZFbStTV2ozQ3lTZzQ2N1M2dWhiSjgxUklS?=
 =?utf-8?B?UUVGU2cwRktHeU5kYmxvRWFINE4vaXM0WGNrSmgyVmNST2hwOGZsdzI0REVM?=
 =?utf-8?B?U0hUdXEycGZoTnRFYVdjNktMendvWlcyZ3JCdGNKY005bXplaHdGcGVkUUpr?=
 =?utf-8?B?VmlYejNsaEwzdy9pOFBvY1czeXd2TlJyc2NnWldSRm5kVndPdmdXaUJvT0JB?=
 =?utf-8?B?V1NrTm5JdFJuYkZVaUJFdmpXbEdDUERNaUtjN0NKUnZBR081dVExMkpwRTJI?=
 =?utf-8?Q?TcRkEi2o47xBPMIyj1e5yS9A6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00eaa7c0-2499-46d6-ea67-08de3943c4e3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 06:00:36.5568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ7vTidbnvMAVuy3Gx3k8sx2mSVxG8lIGn/42MQZgcZCIgfNP9cXHK+vcf5AsaVSi2pfqK5mzXbx1wmDJvGuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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



On 12/11/2025 23:58, Ilpo Järvinen wrote:
> On Thu, 11 Dec 2025, Lizhi Hou wrote:
> 
>> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
>> interface to make NPU metrics accessible to other drivers like AMDXDNA
>> driver, which can access and utilize this information as needed.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c | 75 +++++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>>  include/linux/amd-pmf-io.h          | 21 ++++++++
>>  3 files changed, 98 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index a6a5d416edf9..8e4ce91b3527 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -8,12 +8,15 @@
>>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>   */
>>  
>> +#include <linux/array_size.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/debugfs.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/power_supply.h>
>> +#include <linux/string.h>
>>  #include <asm/amd/node.h>
>>  #include "pmf.h"
>>  
>> @@ -53,6 +56,8 @@ static bool force_load;
>>  module_param(force_load, bool, 0444);
>>  MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>>  
>> +static struct device *pmf_device;
>> +
>>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>>  {
>>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
>> @@ -314,6 +319,70 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>  	return 0;
>>  }
>>  
>> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>> +{
>> +	switch (pdev->cpu_id) {
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
>> +{
>> +	int ret, i;
>> +
>> +	guard(mutex)(&dev->metrics_mutex);
>> +
>> +	if (is_npu_metrics_supported(dev))
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = amd_pmf_set_dram_addr(dev, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memset(dev->buf, 0, dev->mtable_size);
>> +
>> +	/* Send SMU command to get NPU metrics */
>> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
>> +	if (ret) {
>> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>> +
>> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>> +	data->npu_power = dev->m_table_v2.npu_power;
>> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>> +	data->npu_reads = dev->m_table_v2.npu_reads;
>> +	data->npu_writes = dev->m_table_v2.npu_writes;
>> +
>> +	return 0;
>> +}
>> +
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>> +{
>> +	struct amd_pmf_dev *pdev;
>> +
>> +	if (!info)
>> +		return -EINVAL;
>> +
>> +	if (!pmf_device)
>> +		return -ENODEV;
>> +
>> +	pdev = dev_get_drvdata(pmf_device);
>> +	if (!pdev)
>> +		return -ENODEV;
>> +
>> +	return amd_pmf_get_smu_metrics(pdev, info);
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
>> +
>>  static int amd_pmf_suspend_handler(struct device *dev)
>>  {
>>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> @@ -469,6 +538,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	mutex_init(&dev->update_mutex);
>>  	mutex_init(&dev->cb_mutex);
>>  
>> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
>> +	if (err)
>> +		return err;
>> +
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>>  	amd_pmf_dbgfs_register(dev);
>> @@ -477,6 +550,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>>  
>> +	pmf_device = dev->dev;
>> +
>>  	dev_info(dev->dev, "registered PMF device successfully\n");
>>  
>>  	return 0;
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index f07e9f4c660a..0354cc5dc79e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,6 +12,7 @@
>>  #define PMF_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/amd-pmf-io.h>
>>  #include <linux/input.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>> @@ -412,6 +413,7 @@ struct amd_pmf_dev {
>>  	struct apmf_sbios_req_v1 req1;
>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct mutex metrics_mutex;
> 
> This files seems to lack include for struct mutex (despite using them 
> already so please add it finally there :-)).

This is already taken care in one of the patch already in queue.

https://patchwork.kernel.org/project/platform-driver-x86/patch/20251202042219.245173-1-Shyam-sundar.S-k@amd.com/

Thanks,
Shyam

