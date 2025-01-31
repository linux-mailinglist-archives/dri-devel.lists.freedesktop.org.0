Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8542FA23F6B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B902410EADD;
	Fri, 31 Jan 2025 15:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AXylRz7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5B810EAE1;
 Fri, 31 Jan 2025 15:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjhoXTc/sLL4hbo/q8A4cuC8dSr0epfbdBfqmE28ACSNaOn8fUNWT1D2/J/PTkfz0BMnOLjHazdbpfjLYvLtV4m4C8JCIMOyuVDFv9CkFAtuGD8QhCfebxpKdOJR4vzbrF1s394En7bbAr3eBn/CCzeZnAaP0Ip920gidOvwoXq/6t4/yp1LWCHXpPJAW5R9oFNTGt7rjonhaTC06kfntGdvPukkJEXXddEqtj9rpeGHhg+DIp8rguNneZZevZq7UqPIH87Zl7yCpiKON+CSDsZc/mtQeMLzJP6pIE5r3v60JvAIFl1aB+e7murCr3BvOu2wcz44NRfJk3oXSP6Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxTLBaa/fqvmx7cEa/0TUZTWiRLB47Jtj0RfW+q11EI=;
 b=iAst3vUaZOJZv7HH/fbaHlvg4j5EJ8cfYEM7gpHLCHcxwy2PVegmljMzrCi19sFQskhJhiGQ1lSPzvdq3o/f/yss6ppS4dqb260lrnYe4VVgytkbgmIEr0q1X3Y9LAS008gJlqzKcOi3kGnUjtNjMymgXOUt4vgyGSTxZioIUTEFfNMHWQBh29M6QvBWbOZbAnGzcQZfH4+POUql9l7UjbNhzTkwGwt5A4zDlHHpNGmGoqaRwHHvejZZXv/XM0oXIW4NuW2nZv9rAXju40RSN1wf1ad1GvT0X3ZE5BvAuj62wBev4UUvCCvMkhp2KJJSWFMRWd1kNlNZxCVl1OA4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxTLBaa/fqvmx7cEa/0TUZTWiRLB47Jtj0RfW+q11EI=;
 b=AXylRz7g8PWkKgu/9qKr35KgUpM5LwXHiGjpKbPIFqkcsZOJzqwjwlhiyqQb2hDGytFWybuRW2VKhzMORwjCEzmEScCpx+/oN5f5ODh/j38xR202+jrPqCaQbBcKuEW6mACyuxXoCZcLjqodnD6PCTHVCkFkb8hey4jbs1wcyDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:06:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 15:06:36 +0000
Message-ID: <64500889-3206-4a50-b508-5e57fda5f786@amd.com>
Date: Fri, 31 Jan 2025 16:06:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/7] drm/ttm: Provide a shmem backup implementation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250130101325.3068-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 90761796-a8b4-4f10-3c0d-08dd4208db31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01aQ1FVT29jQ2FkSS9uWGpPem5OalMwemRjZVZZRjVDQUk4Z2xUeTJscFNE?=
 =?utf-8?B?WjgrTXpvRWsraWJwTFFGc1o2ak95a3dmcFdRQlYzSk9HMHE5S01MeDRDTE9x?=
 =?utf-8?B?TjZjaDVSNTJNRGhQTTVIeXF3dDZxdU00RkZHK2hMUU93eDZ0aXE5eTZzM1Mr?=
 =?utf-8?B?L2oyZWNWdlBGbnJxN0t5dUN4VHRmcUFncnlQWmkwOURiY0sxeFRYU2c2M09Y?=
 =?utf-8?B?SE9KNWFGME9TTi9tKzRnRkhRdEErQWM5WG1EOW5NTUdYMDZsRkNkYWlZaE9n?=
 =?utf-8?B?M0dqSDV5d1EzRWFGNTJBOXlKeXF2c0w0WGRMWGp6MW1OUjh6TmloelFPc0cy?=
 =?utf-8?B?bWVKaUlGbXNQeE9EK1IweGxDZS9HUHM2TjF4ME9nNnUwcEt5amdMbUJuSTRD?=
 =?utf-8?B?alNlQjVHcG9yUXAxMGdzN2I2eTFJa2FTMDRkcm0wNXN6L3l0MU55REs1eVEw?=
 =?utf-8?B?bWdnMFpISEhhR29Yc3lqaUwwVXVjaC8xMFkrYzV4NkM2Z1ZHaWRwZ2g4ZUZQ?=
 =?utf-8?B?TW1uVDRteVU1ZC96dzBhakwzekR4RFYvWjJYTzJuL1J5WmZOYks0NVBRYlVR?=
 =?utf-8?B?QXFJM1lHR0dybGRpcUc5QUo5Si9HQTFlbG43SFlKeW8xbUJOTWNSN1pZaW53?=
 =?utf-8?B?UU9uakFMZzBBc01ZN3J3RWVkNmcxV1FSNEdvekJiSVNsRXI1TDljdk9iZ3RG?=
 =?utf-8?B?akVmOThxS0lBUkRiQ3BIWUE2N2E5eTlCaUF5VlFnZ01XU3BxS0U5YUtPUEZT?=
 =?utf-8?B?ZVZ3Q1NNOE4vS2JTYkZOOUZOaVc0ZmxHZkZJNDNaMlFrdEhjTVA0OVpGL0Zx?=
 =?utf-8?B?OHpNT0RIaXBEblNGYUozamV0ekVWUEVNN3ZRZFRjNHVIWTdnZS9VZmsyNDhT?=
 =?utf-8?B?RjNPL1N2L0VocFZRa3pSVXBUV0dRNFliTDF6U1JJUTZ4UmZvdHR0TWxCZmtE?=
 =?utf-8?B?UEFYUTJFYzhKWVFRU1pXL1RmZDRpSmN5bDZtWXpzN3ZsdDRrMVdWbTVwQnhn?=
 =?utf-8?B?a3hMZnpZSG5uRzVyaFFuSWtzTFJ5RkNObkh6eDRyTENycFRmdEhBVnhqOVBn?=
 =?utf-8?B?S3hFZlBzNStoRDk2RURNMDFMWm1tUG5KVUlWVmJibVBWRm5MUkJuWTVEODQ3?=
 =?utf-8?B?Y1RsWkxVYTJKcHc5TElwdkpoQWlQVENnS3BUU3JkVm5TNHdwcjhDd3BaUWhF?=
 =?utf-8?B?ZFFpblJjR3JKN3hPcVo1eHMwTm1YY2NkcmxKQ2twZldSdFU4R0hjMk1zWVBu?=
 =?utf-8?B?ZnorZ3BIWkNTVUhIdWJkUjZDQWpVMzVkVzVDZzNCN0Ixd1pKYVhsU0M3UlNa?=
 =?utf-8?B?bWhldkkrL0pYbUU2SUJlcjg4Tmx3aHRGQnkyemxpYkg1RzVIQURlUU12N2Zz?=
 =?utf-8?B?MkNLY2pRVU90ZVZqYjdudWduUjVsNEJMZC95SmtPS1gySkZaakRPVXA0bVdF?=
 =?utf-8?B?bC96YjUwNmxNaVh3aDVybG00M2VMUEZOUlZDWG41YUhoN016ZUxGQThnU1Nl?=
 =?utf-8?B?VVRNcmMyT3pmclBtSzlJWmU0ZlJIcFkwK2tjakYrSjhjQ0Izc2p2Q1dWQ3VK?=
 =?utf-8?B?L2gyNmpZQk9qN2JsOHBoOEJIS2s4bktFRG0vQTd5SnFCWUxUR29LcjhwY0xD?=
 =?utf-8?B?bU0rK0ZualBsbmxhVjhsQ1N6aWJNS3J1MGlQMEpoVzZBTnFxM3V5UDFsQ0h3?=
 =?utf-8?B?R1hHTGM3RU9lR3NVZUtxWDlWL3BuVTVsaDhWS2RTNkFwc1luaVVjOEpzeHc0?=
 =?utf-8?B?Mml2bWozTHFzSElXd21KSlI4V3lmV3cydmlEeW4rcklVbmhzaFY4VUJrSU9R?=
 =?utf-8?B?VWRyYnd5WXA3MXBNdWlpRlE5SlhseW5LSWFBR2pETS9Va1F1VmpmM294TGl2?=
 =?utf-8?Q?sXvcsaB4sOKe+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWZ1RjdxM001MGgrZXl6VXpmMnlPTWZwcW90akxyMWU5TTVGbHc3QzlaUDJH?=
 =?utf-8?B?RWVwZjBGcytkd0tycy95a3ZTeE1yK2VmcTFmdVE5eHVJV2s5QTJ4K0tlWTVV?=
 =?utf-8?B?VVREdGxxeTZoOWhjNlFENG81YlBRU250SFpnaFNUbEE0UEVIREg1MCtaWmRS?=
 =?utf-8?B?UWp5elBBNjVucE4vNWYrRVlQajdQSUpLVHhrWisvUGs3eWxWNURQSHdoREhr?=
 =?utf-8?B?dG9TeS84OEJIUnBRRWdZVVJrWlh4UFpINmxwUHdZb043RDRhNDM5OSt3UTZ4?=
 =?utf-8?B?SDJJNldFbzNUdFZUMmIzZkxCdzUrN3lOSFlDWlovK0tLcHVRSGJock92RitX?=
 =?utf-8?B?QlB4Yk43cXdBVHZ4TnB3bjJOanFJbXhOdUg1enN4VGZFSzd3TmVxMnFvT1ZP?=
 =?utf-8?B?S3UvSXVtNU9PRUpWems1MGNYdmdHSnM0anFkZlVDNm1EcjB3L3I2Q05CdW1S?=
 =?utf-8?B?UUxSS0xCTUFDYm8wTm84b0pFem1TaWlCZmpVM212cHFyN2pPNlFkaTdHSFlN?=
 =?utf-8?B?NXdpTDdmbDEydmpTQ0JmVG9XcWZZRHNTclRVZ09uaE04dmxaT3ZaS0FGK1pG?=
 =?utf-8?B?L2ozc0JHY0pwOENCQjIrVTRobGRjcFJld2djTHNvOUkwdVFjQ2FaZllhMXJp?=
 =?utf-8?B?MTNXVVE4RjRnU0thSlhJTU1nN0RNais5Q25MN1FPZUluanJuTk1UaVJ1bTM2?=
 =?utf-8?B?N204MVlSU3hlaWNRSTVYMHN4cm56MmVlM0trTWlVWGExcVZOV252czZIdmV6?=
 =?utf-8?B?SkhhUk1vMGVaK21Fa0tvMWR6ZExxU2ozY0Foc3pwZWFJQ3FlZGllVS93ekJZ?=
 =?utf-8?B?NzFvYjF5K2VjQWt2N2I1VjBiNkJZRkdybkRMYzZKZHdpeE9KZEIrZElTTE5s?=
 =?utf-8?B?Tkc5N1Nxd2Q1NUJxU2NrUEFXanhnaFc0MHMvclVxWnljL2hvRzJiTys0NXFX?=
 =?utf-8?B?alhvZWhwczVKSjZGMTJmOTgyUXFHUFUvTXF6d1JHa2FXUDNFbE8za2NvWHRU?=
 =?utf-8?B?WXdnbjN5UEQwaFE3aEQ4ZXVmWmQ3YkgvZjRNQmxFVDVFang0UnZmSThza3Fh?=
 =?utf-8?B?eFZwS1lMTEM5SnZlMGdEZ1htZFJrbHU3N01mNE9sSTZyby9vSHpMS240UkJ4?=
 =?utf-8?B?S3hlY3Y5OHdHbmkrOE5UWHVkTzV3RXNheEk5VEh4ZU5ocmVYOFpUUTM0cDJj?=
 =?utf-8?B?Uy9zN250UkNSLzhjbnhqSTZ5N211YkdsL25taFptVEJ3M1h6Z1JQNnllR2RH?=
 =?utf-8?B?UWJNSjdHZjg0YWxGZXJVeTNyVm9OellQQUdYNEtha1FWOWc3RDRBTU1LZ3d0?=
 =?utf-8?B?MXN0cCtEanIxM0gvdTF2YVFhMzZKRlVyTXpwazdPdlZSWmZ5TVRsVFRsMlJF?=
 =?utf-8?B?aTN4QXNEME1lVTEvM3hoTEhoeWxMbFdCYVNmenMrdlhENG55czF5OWlkcFV0?=
 =?utf-8?B?VGg0dE01Skw5WWprbzMyYTNIQStoS1ZURjRJRFUxS0ZQU3p5bkUvWTNSZHFM?=
 =?utf-8?B?ZUxCeFg5L1pDa3BwRXZZazhmRDRqZWtZeVN3RnVaOStjVlhKZkdmMjB2MjYx?=
 =?utf-8?B?MktpWmxxNytIbGQyTEhlSkFEckdHRUVCMEtYYUZtM3BvVWtybCtQUUxwWU5F?=
 =?utf-8?B?R2dtaDdOZHkvRVBSTmxuMUNYQnM0MFZtTWRjcS94TEkxVFArNjR5d20xN2ZG?=
 =?utf-8?B?WUpCQ0tNczNYYnRyZ2FqR2UvU1JjZTRmVlloamQ5T3hKVmY2MG85WU5sYXkv?=
 =?utf-8?B?cmtmM21WMFY4bFBHQm9FL0lIMmFESWdMMzhTWXgxeXZSSHVkS204SGgwTnlt?=
 =?utf-8?B?MDBGRVhPWERENWlhVWwzcDZXYjZ2dURrNlo0dXJmcnFkQzNmSHR4cUpEM3lr?=
 =?utf-8?B?QnRjeU1VQUk0VDR5d3BPM2dneDRKWUNBNTh0Y2o5Q2hSVTF4Y3MyYWg2RlVM?=
 =?utf-8?B?OGt0VHFrZ00wSUVLMFg1T09lNnVsSGFoNjZtTDYwQzhLR25BeFd0d2NOMDUr?=
 =?utf-8?B?cEJGdko2Qmp5V2lubXNyV25UTFAzVnhpWVp1dlJFN3VTL0RNT0FBb3hnOXUw?=
 =?utf-8?B?ZjRpd1pSbU5aMmRndk41aENqaWRjREQvYTRhY0xFMGY0aGpSRWt4cjkrNWxi?=
 =?utf-8?Q?esVB+CqyNGKTi7bcZoKP/rJEy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90761796-a8b4-4f10-3c0d-08dd4208db31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:06:36.3735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZK5EB+GpKNlchPeJMQ2ylMyD/CeIuS308a7tgvpQcrFap8VqQ/8MNzkYwzsnDKbO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917
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

Am 30.01.25 um 11:13 schrieb Thomas Hellström:
> Provide a standalone shmem backup implementation.
> Given the ttm_backup interface, this could
> later on be extended to providing other backup
> implementation than shmem, with one use-case being
> GPU swapout to a user-provided fd.
>
> v5:
> - Fix a UAF. (kernel test robot, Dan Carptenter)
> v6:
> - Rename ttm_backup_shmem_copy_page() function argument
>    (Matthew Brost)
> - Add some missing documentation
> v8:
> - Use folio_file_page to get to the page we want to writeback
>    instead of using the first page of the folio.
> v13:
> - Remove the base class abstraction (Christian König)
> - Include ttm_backup_bytes_avail().
> v14:
> - Fix kerneldoc for ttm_backup_bytes_avail() (0-day)
> - Work around casting of __randomize_layout struct pointer (0-day)
> v15:
> - Return negative error code from ttm_backup_backup_page()
>    (Christian König)
> - Doc fixes. (Christian König).
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v13

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/Makefile     |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup.c | 207 +++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_backup.h     |  74 +++++++++++
>   3 files changed, 282 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
>   create mode 100644 include/drm/ttm/ttm_backup.h
>
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..40d07a35293a 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -4,7 +4,7 @@
>   
>   ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>   	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_device.o ttm_sys_manager.o ttm_backup.o
>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>   
>   obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> new file mode 100644
> index 000000000000..93c007f18855
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <linux/page-flags.h>
> +#include <linux/swap.h>
> +
> +/*
> + * Casting from randomized struct file * to struct ttm_backup * is fine since
> + * struct ttm_backup is never defined nor dereferenced.
> + */
> +static struct file *ttm_backup_to_file(struct ttm_backup *backup)
> +{
> +	return (void *)backup;
> +}
> +
> +static struct ttm_backup *ttm_file_to_backup(struct file *file)
> +{
> +	return (void *)file;
> +}
> +
> +/*
> + * Need to map shmem indices to handle since a handle value
> + * of 0 means error, following the swp_entry_t convention.
> + */
> +static unsigned long ttm_backup_shmem_idx_to_handle(pgoff_t idx)
> +{
> +	return (unsigned long)idx + 1;
> +}
> +
> +static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
> +{
> +	return handle - 1;
> +}
> +
> +/**
> + * ttm_backup_drop() - release memory associated with a handle
> + * @backup: The struct backup pointer used to obtain the handle
> + * @handle: The handle obtained from the @backup_page function.
> + */
> +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
> +{
> +	loff_t start = ttm_backup_handle_to_shmem_idx(handle);
> +
> +	start <<= PAGE_SHIFT;
> +	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)), start,
> +			     start + PAGE_SIZE - 1);
> +}
> +
> +/**
> + * ttm_backup_copy_page() - Copy the contents of a previously backed
> + * up page
> + * @backup: The struct backup pointer used to back up the page.
> + * @dst: The struct page to copy into.
> + * @handle: The handle returned when the page was backed up.
> + * @intr: Try to perform waits interruptable or at least killable.
> + *
> + * Return: 0 on success, Negative error code on failure, notably
> + * -EINTR if @intr was set to true and a signal is pending.
> + */
> +int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
> +			 pgoff_t handle, bool intr)
> +{
> +	struct file *filp = ttm_backup_to_file(backup);
> +	struct address_space *mapping = filp->f_mapping;
> +	struct folio *from_folio;
> +	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
> +
> +	from_folio = shmem_read_folio(mapping, idx);
> +	if (IS_ERR(from_folio))
> +		return PTR_ERR(from_folio);
> +
> +	copy_highpage(dst, folio_file_page(from_folio, idx));
> +	folio_put(from_folio);
> +
> +	return 0;
> +}
> +
> +/**
> + * ttm_backup_backup_page() - Backup a page
> + * @backup: The struct backup pointer to use.
> + * @page: The page to back up.
> + * @writeback: Whether to perform immediate writeback of the page.
> + * This may have performance implications.
> + * @idx: A unique integer for each page and each struct backup.
> + * This allows the backup implementation to avoid managing
> + * its address space separately.
> + * @page_gfp: The gfp value used when the page was allocated.
> + * This is used for accounting purposes.
> + * @alloc_gfp: The gfp to be used when allocating memory.
> + *
> + * Context: If called from reclaim context, the caller needs to
> + * assert that the shrinker gfp has __GFP_FS set, to avoid
> + * deadlocking on lock_page(). If @writeback is set to true and
> + * called from reclaim context, the caller also needs to assert
> + * that the shrinker gfp has __GFP_IO set, since without it,
> + * we're not allowed to start backup IO.
> + *
> + * Return: A handle on success. Negative error code on failure.
> + *
> + * Note: This function could be extended to back up a folio and
> + * implementations would then split the folio internally if needed.
> + * Drawback is that the caller would then have to keep track of
> + * the folio size- and usage.
> + */
> +s64
> +ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
> +		       bool writeback, pgoff_t idx, gfp_t page_gfp,
> +		       gfp_t alloc_gfp)
> +{
> +	struct file *filp = ttm_backup_to_file(backup);
> +	struct address_space *mapping = filp->f_mapping;
> +	unsigned long handle = 0;
> +	struct folio *to_folio;
> +	int ret;
> +
> +	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
> +	if (IS_ERR(to_folio))
> +		return PTR_ERR(to_folio);
> +
> +	folio_mark_accessed(to_folio);
> +	folio_lock(to_folio);
> +	folio_mark_dirty(to_folio);
> +	copy_highpage(folio_file_page(to_folio, idx), page);
> +	handle = ttm_backup_shmem_idx_to_handle(idx);
> +
> +	if (writeback && !folio_mapped(to_folio) &&
> +	    folio_clear_dirty_for_io(to_folio)) {
> +		struct writeback_control wbc = {
> +			.sync_mode = WB_SYNC_NONE,
> +			.nr_to_write = SWAP_CLUSTER_MAX,
> +			.range_start = 0,
> +			.range_end = LLONG_MAX,
> +			.for_reclaim = 1,
> +		};
> +		folio_set_reclaim(to_folio);
> +		ret = mapping->a_ops->writepage(folio_file_page(to_folio, idx), &wbc);
> +		if (!folio_test_writeback(to_folio))
> +			folio_clear_reclaim(to_folio);
> +		/*
> +		 * If writepage succeeds, it unlocks the folio.
> +		 * writepage() errors are otherwise dropped, since writepage()
> +		 * is only best effort here.
> +		 */
> +		if (ret)
> +			folio_unlock(to_folio);
> +	} else {
> +		folio_unlock(to_folio);
> +	}
> +
> +	folio_put(to_folio);
> +
> +	return handle;
> +}
> +
> +/**
> + * ttm_backup_fini() - Free the struct backup resources after last use.
> + * @backup: Pointer to the struct backup whose resources to free.
> + *
> + * After a call to this function, it's illegal to use the @backup pointer.
> + */
> +void ttm_backup_fini(struct ttm_backup *backup)
> +{
> +	fput(ttm_backup_to_file(backup));
> +}
> +
> +/**
> + * ttm_backup_bytes_avail() - Report the approximate number of bytes of backup space
> + * left for backup.
> + *
> + * This function is intended also for driver use to indicate whether a
> + * backup attempt is meaningful.
> + *
> + * Return: An approximate size of backup space available.
> + */
> +u64 ttm_backup_bytes_avail(void)
> +{
> +	/*
> +	 * The idea behind backing up to shmem is that shmem objects may
> +	 * eventually be swapped out. So no point swapping out if there
> +	 * is no or low swap-space available. But the accuracy of this
> +	 * number also depends on shmem actually swapping out backed-up
> +	 * shmem objects without too much buffering.
> +	 */
> +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +{
> +	struct file *filp;
> +
> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
> +
> +	return ttm_file_to_backup(filp);
> +}
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> new file mode 100644
> index 000000000000..24ad120b8827
> --- /dev/null
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TTM_BACKUP_H_
> +#define _TTM_BACKUP_H_
> +
> +#include <linux/mm_types.h>
> +#include <linux/shmem_fs.h>
> +
> +struct ttm_backup;
> +
> +/**
> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
> + * @handle: The handle to convert.
> + *
> + * Converts an opaque handle received from the
> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * struct page pointer suitable for a struct page array.
> + *
> + * Return: An (invalid) struct page pointer.
> + */
> +static inline struct page *
> +ttm_backup_handle_to_page_ptr(unsigned long handle)
> +{
> +	return (struct page *)(handle << 1 | 1);
> +}
> +
> +/**
> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
> + * @page: The struct page pointer to check.
> + *
> + * Return: true if the struct page pointer is a handld returned from
> + * ttm_backup_handle_to_page_ptr(). False otherwise.
> + */
> +static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
> +{
> +	return (unsigned long)page & 1;
> +}
> +
> +/**
> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
> + * @page: The struct page pointer to convert
> + *
> + * Return: The handle that was previously used in
> + * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> + * for use as argument in the struct ttm_backup_ops drop() or
> + * copy_backed_up_page() functions.
> + */
> +static inline unsigned long
> +ttm_backup_page_ptr_to_handle(const struct page *page)
> +{
> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> +	return (unsigned long)page >> 1;
> +}
> +
> +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
> +
> +int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
> +			 pgoff_t handle, bool intr);
> +
> +s64
> +ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
> +		       bool writeback, pgoff_t idx, gfp_t page_gfp,
> +		       gfp_t alloc_gfp);
> +
> +void ttm_backup_fini(struct ttm_backup *backup);
> +
> +u64 ttm_backup_bytes_avail(void);
> +
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +
> +#endif

