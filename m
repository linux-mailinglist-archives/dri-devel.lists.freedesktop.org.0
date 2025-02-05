Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20AA2859B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2ED10E756;
	Wed,  5 Feb 2025 08:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TfJCF4IL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDD10E751
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:33:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+Df1E5BC6nopL6IhMjRBAuKuYIobkYQKoaTUYji4V6es8s130HWGwTuBlf8CasJNyIvDNyExvbgd3FCgC9JnhuNJf6bhx3Y8HuhML9FuSHAVlyCGtqvqtTJErrx/o4YxjU8otvxDmxsbwGhFDc5NzqODeTasysEBh7C+GLu9yu3Wg976u8p9zNXDoJOM8eAp4Fcpe/zf4cznHRnVwzd0ZloAzlLZNOJfeH2Wj8uos22VnOzh793phB4otY8Q3s4eXSMaAyugecj+H244lWWhFjb0g1H56jebf8WI62zXaPqIvDs5YsYrzr8c3M4Uey3nt44LD6jnNEe8/shtcnB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfs7ZDZ/lPSXDGpz2oOv9362Lywrd8isiULGHL49VYI=;
 b=D5Q3rbgZl4VhjNwRYsig6DNY13cJ1oD72brHzJVR2VAiGTuYe7tMDUxmvzvOj0N2kcfP88fpcTYcp54JnxuBi7R6r1W4hhad/yVCEa90lFBoBWjVmu7n+bTQ5y2fSzVxTfEJ9tP7m51BTCn7fw6U94kqQ7KD34bMg+NAU9E3GevQXYfF7YSA0/T1UX2g/sb3zDybggVRIS2mc0astq/ArSspmwioXpZdZ1TtYm7RqHPmcC4S0XUyil5fy57GMGrDvv6xCv67qjzmekEJIhJ0EnsPYMgfUCMv9LC4mbrQC6UcK0CqnhMuPoJQ1qbLmRls+z7tdx9PGe7LUePpidyWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfs7ZDZ/lPSXDGpz2oOv9362Lywrd8isiULGHL49VYI=;
 b=TfJCF4ILejY4wKlNlMIR/JhdXSewUc3/NH3ueVwKKbr9FoPfIE+xtC53yGdMorED3ky96gsP4EamWibpI1u69hYh28Cv8nPXS5CFYK2TsbbqepdfSCKEn+q3PMAtPBsT383S2WSQ3hV99MbvOvnAsVLI4ExaexXbUPwNfJ4Q9ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 08:33:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 08:33:03 +0000
Message-ID: <9db7851b-d860-47ea-8226-f5b5a1111c21@amd.com>
Date: Wed, 5 Feb 2025 09:32:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250204224136.3183710-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 678859bc-c4f3-4f1f-cf96-08dd45bfb4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjZqS3FMYld5OVBvUS9TTnpCd2tsd09OcHJLZWVxZmZVRmFWMk1WR0h3N2dX?=
 =?utf-8?B?aysyaUsyaUNSRmNSVXo5V1d2VDRnREtMMXN1L1BuNlhEUjc2RXVzVHZCU3NJ?=
 =?utf-8?B?cjJZQ0UxL08vM3VXM2ZUMGp6Y0tsWDFlVUE3TENMaEVFUVdUNWlWcTRUUmRJ?=
 =?utf-8?B?ZTNXTVZSaUNuMXhQSE5WQzN0U0VTUk9peXBpS29hY1V2THVwbVlZaW8wK1Vm?=
 =?utf-8?B?LzRESHBaZ05MdGp4SzhNL2tCNnJpNFpuZDZsSWNJR3ZsR2EzSmxmVDNadGRR?=
 =?utf-8?B?MG9qeDBVZDdONW43TFJCc3VzcXJzOGMvVGhNblBlTFN3dUo5VXhjTjNiN0Ja?=
 =?utf-8?B?YnFZMHBURTFZWDBxR2VmVG5XYzR6QXIzMG94blYreDdQRXlJOTFITFBEajFR?=
 =?utf-8?B?UFUrOGlMSWQ1VDNZZU9wMFZaQ1VjN2VQQ20ySS9tWUtEaWhWM09nS0krY0k0?=
 =?utf-8?B?ZWo1Y3ZES2RFN0sxemxyeVFoYmdjSyt0N3VVc2ozRXJDVUtOUUtORWg1bUpn?=
 =?utf-8?B?N21qcGVVbXZINGM5UlZDUjFlNGtDZ2dFR1B4ZFVUVmRSWm8rc2RYcUJGQ0ND?=
 =?utf-8?B?R2dzdVZMSWRUc0todmJWVVROaWR1dkRtajNsOURST1A5aTNlTFRpYWNPbkFI?=
 =?utf-8?B?dFNWSXVjSEVBYy9DdWJ4VVJ5ck52MS8wRnpjc3JKREk3REhpWDlRUTh5S1l3?=
 =?utf-8?B?WlNBNXVzNVZ2WldWM1AyRmpnT0pDYm80RkhTN0Y0dVJhbmpuemRVeFJPV1pi?=
 =?utf-8?B?dHhhRnh5UHJDRmdZdUhvRUVKa1VJWXpxdnVFeHYyUTJqY2VITmt4VExzK2dp?=
 =?utf-8?B?dWRsMlJmWENJVk9TZ0F5V0VzQjlZY1UxTHZvYm9IdUFCVDU1QWgxZUQ1NGVz?=
 =?utf-8?B?dzhyL2JjMEE3V1Jha0pXZG45Ti8zV2N2a09kWXI1Y25DWEVQbDZBbEZMRnRH?=
 =?utf-8?B?S2FjSVVvSlFWNG9Zbm05Yk16VWIxUWtzZlZHVng4emRNdU9NdjduU0pxNDEr?=
 =?utf-8?B?OU1CYUxySWZGZjBPdGQ2bmV5Q25YejJTUS8vYVMrUFhLZWYveG1zMW9vdjZu?=
 =?utf-8?B?Y3pxNFdXQm9OdEVCQUt3dkJGV0Q5MWc4cUFmV0hweHFlVWNqTHBBNzVTSXpZ?=
 =?utf-8?B?aktSMjQ5eHlzaU9zTmh0SmVXQmVERHU1UE41ZlFRL1o4VFFwSnkzM1BKa0Nw?=
 =?utf-8?B?M0llNHIzN3U2QVcrcndGc2VEd0pqWlp5bWVJdEZhVHlHWG1wS1p5THVKRXoz?=
 =?utf-8?B?YnNXaHpIUlI3TGZQMmo1b0d0UU12eDlWOGFuc1VqV3RMbEU4ZTB4K1dKK0ht?=
 =?utf-8?B?SmdrVms5ZWlKVDVtbzIxajFodXlGRUxmTVhCa0lKQXFGaUVKdzk3ZWJXbnRD?=
 =?utf-8?B?OTBPZTFVWitiYS96QUt4RDZXUkl6TGMyamp1VDh2eTJXSVc3SUcrVUJxb3Fw?=
 =?utf-8?B?YUZZSFpnWjVudmNTbmFiVXVxYnpxclRCdm4vdnJZUGFKMXdHUWo3elEwK0JC?=
 =?utf-8?B?WUxoZTF3T1NYUzE2MWVwOFpxSHhjMDQ3SHVNaEZKMG5qVTBFc2NLRWE5bXZX?=
 =?utf-8?B?T0VoWFhIZCswOVZpVzBVTSttNW5nTlhKQk9kZTZsMGlLWElXMndjM3ZvNEI3?=
 =?utf-8?B?dTgyRUhYZVRhQytnSmlnNlhyOW5ZU1Q0L3hKVEhuRVJzUWl4bFdseFZJbitB?=
 =?utf-8?B?K3RhRTgzNm12OVlNSEowajF4M2NjK1Q0UGNUN0o1WmlES2paM1NsVlkwZ0ZK?=
 =?utf-8?B?b3hiN0E5R3JUWFIvUFB5VW9MalRzYnlXbkhQWnMvNkhmU212NGw2T1dXMUU4?=
 =?utf-8?B?UUt6eS8yNmZZQlJjTTE4a2NMNGZiZjROLzJSSFpDR1ozSzVPbGphTS9zZWpR?=
 =?utf-8?Q?cUP58AkmM3Lax?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlUOGVEWFVmSnk3V2NBTk5HdTFPZmkyTDQ4d2lDR05CRkEvSE42UW1YaEsy?=
 =?utf-8?B?RlRNSGpXL0NWTW9LZkVkNWVWWWkxTEVDWFNYQWpCdXdNcDVQemxma2JhZ3Ry?=
 =?utf-8?B?d2JBa1hWdDRLOEZlb1NKRmU1cWZJZ2RCTXRRdkI3S05VSjJHVWN1ZTlsOFlT?=
 =?utf-8?B?bWhCVzJIbkNtNmNLSzlqQ0FxdXM4bDFDbncxYW5kZ3RMYnJLazVTK1F2a2kw?=
 =?utf-8?B?Zk55SjFTT2RLUWJmRDJGRFQ3RUVzRStvWlJMZ3lNNEt1Njg3OUtXSkR4bmVi?=
 =?utf-8?B?MGN4NjJFMDEwTFptUDlYS0NlUmRnZ05YK1RkR3ViTHVMRFg1SW5MdkJCNXZH?=
 =?utf-8?B?Q3lZU0Q0R21DdmhOQ3cyQ3c5d3hYWGJvRjE4SCtFbGh1UkQ2SUNOTmc4Vnpy?=
 =?utf-8?B?ZnhXblZGSVFWZXNkTzZKN1FWa1I4K1N3WDdCZFdnbjN4bkRNZWRpSE14b3Vl?=
 =?utf-8?B?eFJ0WDQ1QzBLYW1BS2NLUjZuUUxJMHEybXdGbiszNGxCeEJBM0hLMVlnSU1j?=
 =?utf-8?B?a3V1d29pWmlzNW9Oa1d6Q0NkbTd6STRJcWx5YU1tZVpJYTBNTUpVVytRZmxo?=
 =?utf-8?B?U21tejRmN2grUEZtRHhlUHJ1ai9CdG4wb2Irak5adkE1NjhBeDNPaGpKZkRZ?=
 =?utf-8?B?bFdRMXdzYzcvRzlQdC9KZlJkOVU4TStRM0QwRiszellvNHV1TWp1bFFLZlA1?=
 =?utf-8?B?L0RSQTk0SFZIOWxHNDRBZjRtZzkwTWEzRkxSRkhjKzZwVlJHd1lZeTZpYTR1?=
 =?utf-8?B?ejFjVEgxV25uRVVOV1lIRDdtVWdMcklFQzg3M0labStEY0J0aG1uQWxQNTRh?=
 =?utf-8?B?TXRvY2dSaVRESGlxbzlzMGtYSVg5anhKMklLUloxRmRNWFJZS29WdUFSb2Vq?=
 =?utf-8?B?bVdCd0w1Zno4dVhMT29QeXF6ME9jczU4U2xobEduK2RKR3cwcmc0VUlnaG1m?=
 =?utf-8?B?YnZzR01oK1NaZFhQQlNsNlpMY1dnYlVBVmVZNXQrR1IwL2l4VXg3a2lsSlND?=
 =?utf-8?B?a1FGK0pUZmhMdUxHTjhNUUZUcTBudHpvRC9JNVhwRTVPcGlEZ2QvR09SaTAv?=
 =?utf-8?B?bkI2UDFEWWhXeGZ5YnVjazZuRVZHckNrcENCV3lWTDMxeDNCMEhBVnV5emhT?=
 =?utf-8?B?SzZ0YzhQUDN1VGk1ZGsybFF5dEQ1aDltNDh6Vi9qbWlESVM4VXhtdmk0aDhy?=
 =?utf-8?B?ZFpla2QzWjBSWXoreFRHN2pTVXVUNXlZMHg2OUZzaVhKanVTVzMxaC9yZzY2?=
 =?utf-8?B?SUtHK1NDblNtdzIwWGVyaXNiTFZrayswMzRkaWh6cmlqbmZxNnA3T0xNRGt2?=
 =?utf-8?B?RCtEQ0NJbWdhMW92VUZubjdQR2RFYStKWjhRYUowamtlb0Z0K0hoam1UWTBy?=
 =?utf-8?B?WVJ2eCtSbTF0TlhKQ0YzajNFc285RkZHbEkvQWdUMUdESzZUMGxDamRZeGJW?=
 =?utf-8?B?cGY1cWNmWDVGQndLNEtqbEZqK3VPZDdtV2F0NkF6V1FudnZrTFBacjNSRGZG?=
 =?utf-8?B?MHdCZGN3enVLWFgzZHZIejlPTXA5S091NzZZSzJNZkRpR1BtNmlUZG5HaDJl?=
 =?utf-8?B?MFR6RnJyU0xPYjgrbHJtSW9oV2tmTnphOXBEVWFSdGJXOVFhUzZRaEt2VGd6?=
 =?utf-8?B?NjFaRTVNN2FsaHpNaUhXdG1UcWRxbm1iV2ozUmEzVHQ5TTNXNUthaFNOUHVq?=
 =?utf-8?B?K3ZBbEhjVER4ckd2ZGVBQWNkamhvM0tSNU9FdnpyaGxHb3hqekR6SDZSdm5j?=
 =?utf-8?B?R2ZPckFoZ3lzSURMWUE3bnQ2bTQ4V3BScWJISk1iTTNrQWVkWXViVndBZmEz?=
 =?utf-8?B?U0pCaWprbnFCYm8zeU1wMENxaG94VFk1SGN4OVZ0a0tkV2xmSm95TDE1MDZj?=
 =?utf-8?B?TmtsQU9zZXN1MUlGdjVIdSsrSGFBUVNFemoxcllVT0ozUHZzMGNFNW9BNS9M?=
 =?utf-8?B?d3plbzUxbFF0TmJHbnVnQUxVTkdsWGhvNkVnOUVqdjdaVTlRaEROZVJBQXR2?=
 =?utf-8?B?U1pwVGZobEp3SE1mNThzbGJrSlBrSERnSjhNLzVCNzRRUlRvbDB3dGhpM2lC?=
 =?utf-8?B?SnJ3ajF2T3BRa2FUYWl4eEVSMFN5cjV4Q3d1bEhHY0FWbTgwYlpMRFFXU1pH?=
 =?utf-8?Q?VQm0ThpqY3o3b3ig84thUK1Ln?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678859bc-c4f3-4f1f-cf96-08dd45bfb4d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 08:33:03.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MX5URfDDIsRYdePcTbLaLI2LSuCc3uqPn/es9mGBfqbHi8P9iYddHc2MxxMtj4b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559
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

Am 04.02.25 um 23:41 schrieb Tomasz Lis:
> This RFC asks for introduction of an interface which allows to shift
> a range managed by drm_mm instance without repeating the node list
> creation.

What do you mean with "shift" here? As far as I can see from the code 
you just modify the start address of each node, e.g. you manipulate the 
offset.

> The long explanation:
>
> Single Root I/O Virtualization is becoming a standard GFX feature
> in server environments. Virtual Machines provided with direct access
> to virtualized GFX hardware, in form of VFs, need to support the
> standard set of features expected by Virtual Machine Managers.
> These standard features include ability to save the VM state, and
> later restore the VM, possibly on another machine with different
> setup. For the restore to succeed, the GFX hardware model must match;
> but for its configuration, some differences are often allowed. Such
> alterations may include a different range of non-virtualized
> resources assigned to the VF, including global address spaces.
>
> If any non-virtualized address space is saved, as part of VM state,
> on one machine and restored on another, it may happen that the target
> range differs from source range. To shift the address space,
> currently creating a new drm_mm object is required, and moving all
> nodes to the new object while adding the shift.
>
> GFX hardware handled by Xe driver contains Global Graphics
> Translation Table, which is an example of such non-virtualized
> resource. Should this interface change be accepted, a series which
> utilizes this interface in Xe driver will be prepared.

Well that sounds exactly like what AMD is doing, but we just add the 
VRAM base to the MM node when calculating the final address in the MC 
address space.

On the other hand AMD hardware has different address spaces, e.g. VRAM 
in page table always starts at address 0 while in the MC address space 
it has a certain offset which differs from device to device.

Regards,
Christian.

>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>
> Tomasz Lis (1):
>    drm_mm: Introduce address space shifting
>
>   drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>   include/drm/drm_mm.h     |  1 +
>   2 files changed, 25 insertions(+)
>

