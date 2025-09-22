Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7BB918CD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AF610E1B9;
	Mon, 22 Sep 2025 14:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ftZWN0yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012024.outbound.protection.outlook.com
 [40.93.195.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CD389B12;
 Mon, 22 Sep 2025 14:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eoeikjf3H0b4/NVrZaeKpMx7hKgX/lHfaYco6mlCnazF0MIYd+KbIVr7KWQ1vFEdLQNKuL5xNqfu0B98FmTQVWTkhgwfAEAeA5ZS8B6jYIS1MAExUR965WAEW1esDWvIWylCgRJtyBin9VLX4zwYDfq0U+YI2qBxgCXP043f59TaOezbNwJ/aWOytHBYjRx3Vyluh+E1z/UJCr0zUKhEARE/viJo7G5zDPlX2C/lGR+6eB227M3S9D3mDhTygA2WhWxSJuHeLpYDebUaiIgdbwDBunZzaOaD9ymSlUj5fLK0Nxf/GVZi4CcNiPTWSOCe9qLEH8GSlpXkUcHookNLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzXB+xZiNWCmRtVgbtaoq3+RQxpc9Rkvgoq4yvsA/ws=;
 b=iBvAuy7N7m9qdEC9CW8aCVxXVeW1wNl8ImfhqDjedO/pkrTslH7RFIXyRMOYg4uf5Y6xH4lrw5wXAT3IzPbg3ZQDlhrIL+z0okTxOj4zI6/vEdKsDLCrGHJ0SfFmuxWuwtYSqkfLONSQD/ATkzDXJyXnBdvXdCdS/59GGTa6Tb7UkZ1vi+8GVcHynf6IohXj4IYLYp2EFacwGOblEhOO+YrOAExIJMdEYcLn5WAk3UsP13wzKIZh1FgAw+lxsHDJ6XQufaTk/qC0WC3vw9dOmwTc6pL7EUJis0AWFnu3EAGiEkw5f6NNEuA6mZjtsYJC9y2TIfzn/JAGElxBmbm7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzXB+xZiNWCmRtVgbtaoq3+RQxpc9Rkvgoq4yvsA/ws=;
 b=ftZWN0yfgjBla2mJH1PCjRS6eJbgrhPFhd3fTpwGS7EBT2McP8w2UtczJ9+cZfHtcqTDgMlUEAvCIAc9hTVkEyewvZ73ku3U/2WXRaGWa8zi/zzYwz7ONl/SF4UqdaWY7SBMASJcCoqDr3fa4DrFs8DdzEdEogWBtuiZ6WnSEGaWlVKlnJ+2VA45RXbryGqZpILrR1ND18ixgBE4MpSRYRbb8YOCCBe8hLEqkiFDY1gb7Ct4fVGVIzFhtdv4VnIHVGh4CSbLO06A0qj8YegoKs+84NeyEf/WK2Qi2apFdit8FFBr+CxE3syozZB5dotbrPT+p6imkYVhUemQcmtz9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 14:00:26 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 14:00:26 +0000
Date: Mon, 22 Sep 2025 11:00:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250922140024.GZ1391379@nvidia.com>
References: <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
 <20250922132720.GY1391379@nvidia.com>
 <42f45fa2-6ea3-44c7-870a-dc1973894a87@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42f45fa2-6ea3-44c7-870a-dc1973894a87@amd.com>
X-ClientProxiedBy: MN2PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:208:23a::14) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 540daa7d-b905-4132-85cd-08ddf9e06190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGZ2WjlLR0JsQjlPbHEzdDdOTk1CSDMzS2VNcGpPeTZzQVFmT0R1TCtlMlBi?=
 =?utf-8?B?bStJajR2QytrY3ZtbDZhNDM4UWozMDVuVGtPR2Eya0dndURnaEFhdkRETDBq?=
 =?utf-8?B?dVN6RzZuYTVoRG5lbkp3QW95d1Evd1BXMGVRRE9UTzQ5RVdCM1VwaFUyUFJQ?=
 =?utf-8?B?bUVEeDh4OC9waHhvM1hCSjY5MEdLNHNvdTNMK0JTVGhJRVZBUjc3TmFSRkoz?=
 =?utf-8?B?NkpGWlQxeERadFM0K0hYMFlrcW1CVFE4a05xUGlWVkVpOWVlbXNMMmR2SHpr?=
 =?utf-8?B?Szd2aTlWSzRxVlc5ZkkvVGJFdlljMVZFbW8rZGhGNkg0a3FrZkpDaC90ZlUr?=
 =?utf-8?B?bTZDMHNBSFlUSithSWlmc2llODJjOU5DcmNiUzA4ZlBRT3orNGMzL1M5R2ls?=
 =?utf-8?B?N2tyMi9QTFZtUXFRSzJ6U0dxRzBKdmp1d3FFSmJHQVhSZ1VBVEl0dk5ZbURJ?=
 =?utf-8?B?ejAvczE5TjFROHFGVnBtOUU2YmhmanFFR2ZGOFplemRxQU1GWGJubVFxMHZx?=
 =?utf-8?B?cnNmdXRvZmdiSVRrSEV2eVkwdmpRTFQwVlZpQjVocjZKMHA0WDJSbkE1bHNU?=
 =?utf-8?B?Mnc3WGgwaHozSkZiWVZkSE9IeGZCRkk4UGNneVM0Z25qbHBGdmQ0SHZETGVR?=
 =?utf-8?B?Y1V3NWUzNkw2MHp1VWIwMHNldmNXTXdQMHVsUFBmMEdaQ0dqYUdUVE5RRm1h?=
 =?utf-8?B?NC93djF2ZDZGT0NEdzUwSTRwTUk5NUgzT3hUcmIvOU0wSGNuVHVCT2g3WDdF?=
 =?utf-8?B?ek1YYjNoandmcTQyaGtoWUJPanpybWZkZlFCYkhoZVd5VnM1bWR2MDMwYXMw?=
 =?utf-8?B?Qks1a1lJWXN6QlEzbzRRSnFublNvZENVMG5wekltYVBJQzFuTDRzME1ibXg2?=
 =?utf-8?B?b0xlRDVvbllyZkdpS3hJNU5LRHF4R0RHUDFMaDJXOU9UaFdodHlGN3AvZ1Zj?=
 =?utf-8?B?RXlWcnZvRSt2OEsxRWpWMFR1M2dHbzAyVnl6TFh2a3lVUFdNVHZrVEl5WWVn?=
 =?utf-8?B?YStGcy9KUDY0WmozQkphMUtQellIc0REZ0RuTFM5Q0tJTWxFT1VUeVBpYmJt?=
 =?utf-8?B?RmE2T05PK3ZPbVkrcHIxanVRSzJyREJQMUlCR3g0cHZEN2psYWlLVlJYWm5s?=
 =?utf-8?B?YUM2ZVhwYXVTU21oUnpyblllSmZpWEVLUUQzNHBNa0ZPMktMbFhydjFmYmhj?=
 =?utf-8?B?ZXRlTVo1bmw5VzhPcjRZUGJXZVpKTHJxOEs1OEplNGJRbGRUbUFwNEk2UzRa?=
 =?utf-8?B?TE50ZmdjdEVMRDAvUjN0L2ExakpDQU4wYzBTOTV5YW9EQkxtZnhmQVp0TjNa?=
 =?utf-8?B?UXRPRXErZ0tXeEl4MVc2clVrT2xIMFlpdnJabjVUK00wcS9FeHhycHhJZjdG?=
 =?utf-8?B?RjFramJ5VmZPQUdxTFVhWi9GbXhKZHNJQ1lrZkh4OENwYlA4L3FSSk9hTFV3?=
 =?utf-8?B?eUZFVTRkY1BDMlRpM0VWTmFPYitxVzdwZXRmYVZieU9NNEhqWlVmNkhqdUc5?=
 =?utf-8?B?eTBXVDc0SGZNQ0lqU1BzYWVkR1hmcks2WmpMU3hCNCs4VzZmMnI5S2c2elVG?=
 =?utf-8?B?dlgxdmQxME9EMlRIQm5yQ0hFSEpnd0QwZzFvd3VTekU4L3I3NklxbHlUOEMw?=
 =?utf-8?B?bU1MTUlkeXJIblpIZzlKaThkZkxNejZ3aS94NGZQY2JtSmN2SWtaVmhsbTc0?=
 =?utf-8?B?eDQ4V21EaEx4USt3UGJWdXBMa1ljMkRzb0ZHbEhsQjVuWlNJNzZ4eTJVRzFP?=
 =?utf-8?B?SWxVUUxiVStDMXA5R3NlUzZqWE9PWGFYMTRpL1Examl6aVhub2ZFRlhVKzRO?=
 =?utf-8?B?MlN1K0NWdjZHZ0NiRTFmdUxQSVZWMGQxN0FsMmszMzhXb3E3ci85bGJQejM5?=
 =?utf-8?B?ekpCRWk0T3FKdG9ubisxem5meW9BUVBIVkdweTZPZ1l3ZFVoSDNRM0dNeGxZ?=
 =?utf-8?Q?Fe9+dGIpq18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhjckk1OHYxbWFFR1ZXRmRqV3RibnV6cTZVK2c2aFlCWlRlcmh3dUJIdVM4?=
 =?utf-8?B?eCtPcTlUemFrdzh1dmtYdG4rU0hSbjFZRWtUWVppZmJBb0F5YVIyWnZZK0Fz?=
 =?utf-8?B?cWE5VjhEOWI2V2R0RmdRNWNUeXZPODFZQW16Y1JzU2t4YVVsdmlERGl4cndU?=
 =?utf-8?B?VXV5T2ZJU3hET3VCNjJVR01sa2pxY0N2ZDRROGxIeGJ2d3FLTm9rQjFqRzRY?=
 =?utf-8?B?RmUyOGRLYXZjYkZkUjdPZ0Vxc3VzRVlObDgxRWh4ejE1bzMzV0Z1RHJPZWlh?=
 =?utf-8?B?UTl4R2JRN3RhdFYyOXBnclV0dnl0RVNSYWdCSVExdlg4UnAwU0UvY0hGWEdG?=
 =?utf-8?B?cGF6Snl1aDhXUSsvclg3ZDhjalB6TUFJLzg2d2ZRVEE4ZGdjekxHV3IrZW1l?=
 =?utf-8?B?VXlYUnNTaU9Mc2VGNHF0ZG9yUkl1UGM5Z25uREFxbXZobVEzUlNtcVM0T0ly?=
 =?utf-8?B?YXlSeDBEdVB0ekJ1L3d5dnBXeDRDSGRYT20zR3FhdktqM2FNczVMenNpOWVM?=
 =?utf-8?B?VTMwdEJ1NlJTNWI4TlFTVW9uajhUZVQ0ck5lYzBDQWNZN1FEaWtVaXkvbFBz?=
 =?utf-8?B?b0REN1B5ZHNkQ2tnekp6b1lwK2lGN2dYT1MyWFppVDRkSjRzNzQzdExLWUdJ?=
 =?utf-8?B?VHROc3BrekE5MVlmVlNCbTVjWTdjRWR5cERGZWJiYnBZWFFwRjNlbGNRQ0Zh?=
 =?utf-8?B?cDVZQkthZVI4STFIOXpaaW5YeVREeXFCa3VLTnRiS2l3aUdjSHhFVzhjUHlY?=
 =?utf-8?B?UkxpTXhTU1FjeTNRYXM4b3pqelZVMk1sMjltVFE4RXNnNEVzVUlYNk55Wmtr?=
 =?utf-8?B?ZEtzM01jczJPblJEbFhUa2s1d01OTzNYUUhUR09KdUdDWG1MaytaVHZieks4?=
 =?utf-8?B?cFQ1WlV4cnV4Ykg0cExkbkpZTGdpRUFId0N6VjRRamIrWFptUS9zd2F0UENu?=
 =?utf-8?B?ejdmTTNldWxXSE00V1BFYkVpOEM5bjFxbWVtZ2RBa3lBWWxXYkNtdFN1VDFk?=
 =?utf-8?B?RlREZTh4azZ0S3AyVnVDZkVCdTgzaUE5MHJlalhyTkdla05wemdvYjlTYkhS?=
 =?utf-8?B?OTZ6NUllQjlPUm1QRDBja214aXhLVGNsR2JKeHNQOVN0c1BINUF0SlhjN3VG?=
 =?utf-8?B?UlpTMWtTeGIybndsOHlIcFVTcWJQU0lQc04yT1k3SVYyalRkUlRLMzJhaHVI?=
 =?utf-8?B?QjRoWncwcFRPNXdScWVUMThPNklVQTdxQXQ1SkZJc0owTW1Mc1VKWlFXVE9z?=
 =?utf-8?B?emNuSm83c3RVRlZOMUs4ZEFkeGt1Ky9mdDVKanQzNGpaZW56UnF5Z2ZnTVdw?=
 =?utf-8?B?VXVPOFl2d3l1THI3THNnTlZtQ1RKZis4dHdUb21DdlFLVS9WWDNUWXRMek81?=
 =?utf-8?B?Mzl1emE5NSswUk1SRm9CdEF6ZzhaTnZ4TlplcGRyZWJRak1MRE1VRFdLKytF?=
 =?utf-8?B?MjAzL0UvWlJuVDFXZWordStXSkdNM0RwU1ZSeDBLeEIvUm12elFUYmN0WGtM?=
 =?utf-8?B?TWY2Sk9UNmRVQ1BsaWpUSFg2YUptcnZuSXFrbDBjN3g0RVRlampxYkZlbjdS?=
 =?utf-8?B?MXNmT1JlblIvazAyZmpjTWN0MXNFeTVPUWh6OFMxTTVqb09zWUFvT0NhK3Nr?=
 =?utf-8?B?QjlGOGNqKzZPODc0MEpBWmg1NzBHeGNZajhOUkNDSy95ODhicWl6M0t6aW5J?=
 =?utf-8?B?a2p4MTVWK2VzcHc2eVA0T1JIMTdFdkxqN2VVMklnYXdpaGRCZmVpejltRlB6?=
 =?utf-8?B?ODZkM1pSb2ZRREM0M0ZySUFOQ3FYT0Z6cTgrRDFzY1FyY0M4Z0oycHhIOG41?=
 =?utf-8?B?SzRpVzhVRmxKa2lZd0svRUJBUG81RENNU0lmRXhJZVNQWDhXcnIrbDdydWpZ?=
 =?utf-8?B?OHA3MXZqaHJLS1FZOUpKRy9Qb0YzNU5TWUdmcElJL0R4M1QrV2hZcXpIRlJa?=
 =?utf-8?B?Qjc1Mm9UelYvQ2h5dWFqdkhNcXowR0VFbTI5ZlBjMitoRVpuN3pOZGtYS1BY?=
 =?utf-8?B?SmdWcms1ekllVEg2U1VDVHJhMVl0eC9tYzFFZE5xOU1TTGw1RHZpK3U2R1pn?=
 =?utf-8?B?RldOdzM2MHJTRGN1T0RtRFVMNHNiRll0Z3Z1dktxSWhxdFlrNjJDanpSSlk4?=
 =?utf-8?Q?tTd7t1t11T6VA2Ds2eq5Td7ed?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540daa7d-b905-4132-85cd-08ddf9e06190
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:00:26.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7/i7EcZLfqWN9uYTQpqzM88oLSZxEDOMVUQ3KuEc9oXCZK6x5mxPfPHTPauql4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
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

On Mon, Sep 22, 2025 at 03:57:02PM +0200, Christian König wrote:

> Is that for postmortem crash analysis? Providing some kind of
> service to the guest? Something completely different?

From the cover letter:

 With this patch series applied, it would become possible to display
 (via Qemu GTK UI) Guest VM compositor's framebuffer (created in its
 LMEM) on the Host without having to make any copies of it or a
 costly roundtrip to System RAM. And, weston-simple-egl can now
 achieve ~59 FPS while running with Gnome Wayland in the Guest VM.
 
Jason
