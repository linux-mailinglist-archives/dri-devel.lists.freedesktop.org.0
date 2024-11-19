Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3609D2726
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA4210E05C;
	Tue, 19 Nov 2024 13:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ahUlKuwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3710E05C;
 Tue, 19 Nov 2024 13:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im5Nc17617VcfDA5+7Em31JTyngWaKZNUZUN9qBuz9eig34djV+YB6RZqXzNeX8Fnx/6EH/sZU/whOyitxDaWxYVbppOgEfi+IM10VkCw8gvRSAb+YH9cksi5cam7wnMzwFYEcjmWOzxbfIe0gibDX/ZlBGV8burrms5vW9I+Cs+U7F6+ODPXs16ip7tHxP5BfSykhMozuL7ZlInTUDxaqswuR812ddusGB/rUtuU7dAHEofczKar1+349AYLAYoj3lHTkazI20Cd+8AUVq+6FXndqGepaci1jsxEm6MfF76DEeWz4sAx8fy2BOmHE6itytj6EjlBREvim9r8yb0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCke2kv53RJYDEjzwesC9NATR5rhgND9JmJu9dKd25M=;
 b=uSg8ZXM+QBBgmFp7/ch+/3vFR0TAJKbSfasVaIzSABFwba1qUC9Xhp40Oiod4DyyLfqHnPTA9YAtQ7JNkMxvy4smJYqBvDaNWBiMoMxnq27nVUkDCxddwUDX0xhT21oMZELERUxQeTs8gFDNJ3/BhjbNHIahinlOvkQ9qrRDyOcAYDnvAZYLs44tJSfl/BNmDCsjwbulvYBydjPQAQKKuU96vI1MABxxSZ/uxLLJ1b4S4riqgfNaskoT6yQJJR78dqNe7AxKKYXf9tlPJDWfyyMaoKWoeMsjEoQ++k845M2o/TRwr14xLfi+Dmd0phrGUVkF/SOTuYYY/Rmac/BUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCke2kv53RJYDEjzwesC9NATR5rhgND9JmJu9dKd25M=;
 b=ahUlKuwvWJWevr3h6ITaGyF5xxBeopXmiRi69d48fOOnsOwAtDdVBFxgua5VBrn8o5ebPcGZzPXmEcEUNq+KyiRJVfRI5GoG0rrhYfIaDH9PUrJivrYo2dVkP+BINpGvhuNbOGNh3HvOv1eBBGti/8Q4syhBuGtEJ4ii+DeLFAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 13:40:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 13:40:36 +0000
Message-ID: <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
Date: Tue, 19 Nov 2024 14:40:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0344.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d36b4e-fc07-4deb-6459-08dd089fbfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2Z2blVZSUZ4MzNrd3o0K0thYUVVVTEyY2dRTHVoUW54dTNpWkVGbmhPMjVN?=
 =?utf-8?B?MmQxVVJ5ZXZJRkR6SXJrdDN0T2kzZGtqMk5Camx1WFowazd2L2tnUDNZK09s?=
 =?utf-8?B?R05UTmF0QVFYajAwNFJmUUlXYitPQm0wL3BaWnV3cGFURGd5VGZXbnNSWEVx?=
 =?utf-8?B?L2hJZXpPUnJPdkFMK2tMTVpIekttdHNBSFdqa2NHUGdLMW9EU05RYVQ1ZVNC?=
 =?utf-8?B?K3IvU2R1SHVMSEtVZDdCbkplYlp0NXVxdmJMUWNUcDArbFhSYkpkMnVBTTdi?=
 =?utf-8?B?Q3NlSGF1VysvcGpNWjZLT0gvTVFMNXM5NVY0WGlLN0NNNHZwY0VUQUh5a2cw?=
 =?utf-8?B?aUREM1JGajBINk11S0pZWG1vTnRmWXZHbGlFOHFncXVrZ3pZY1VqRWlZbVBJ?=
 =?utf-8?B?ZXZ4azd3ekZnNnlhMkk1SVE0MkJOcXBUR2tiZEg5ZWgrQnVVUlhuUjhIS3BT?=
 =?utf-8?B?ZU9TK0tjSzU3U2RaRGloeS9BcXVXcnN6TElBM3ZINWRrQUxLZWIxMzRZTmty?=
 =?utf-8?B?eDNXRElQTHFUQ0Vpd3JwRXAvTEJNalhDRkEvYm4yNmxROWpvekg3SkRmaDI2?=
 =?utf-8?B?UkhhTE8wb1ppcGFDT0tNU2NySEd6U25ycmlmcVh5SW16d1JnRjdjZTYrNHlS?=
 =?utf-8?B?OUVQN2dRSk5CUUdqT052b3lFcXppTXRoSklFQlAwUDdlVmxCN0RxWHBMR3d6?=
 =?utf-8?B?SUpwVjVYdU55eG15S0xvY3hLNUxmRSswK0YwYVJ5NEh3dS9tTVpCRk52VEJ1?=
 =?utf-8?B?azBrWTcrMSt0WEV3QkxOUE96QktFVmJtTjZWbWFTTXEzdmRBVUZPSkVnZ0FT?=
 =?utf-8?B?TGZFZjFlek9OQ0N5d01oaVVBaVFwaTBqMVBJQkQvc1F4RCtTUDFjbjBRWUtL?=
 =?utf-8?B?OCtuWFVmZ1I4OGljcWxZeTNQazZkdDNFSXBiQ24wRjZtRVRXWFR0UmlHenBO?=
 =?utf-8?B?aytLajl3YTU5OVpPVytVdSs1aS9ZVlRQWFlnWWFsaG85RGk1Sklvc0gyRnJM?=
 =?utf-8?B?aE0wd0hQZkwrZ2dVdWtQNVZ1aEttU1NKRHRhQmplRUpXZEJOcHVvbFNNUndI?=
 =?utf-8?B?c2JPZnI0ellMSE9KQUFFY3lXR2lBR3diU3BEZDJxS3RHWWJ2amxXbCs1aVFP?=
 =?utf-8?B?b09CTDJkY0ZwbWxpR0pTTHJjQVlMTjlDdUt4NkV4KzR1Mm02bHEycVBqbTNi?=
 =?utf-8?B?VE5nR2x6Wm5UTGdzdndUTXVpeENsSmJLVU8zZER5MGlkeTFTU01wZHpxUVk5?=
 =?utf-8?B?VitHY1VkbXFyYmRLQ0FSVXJseHhwYUNnZmxjMVQrQ3FKcjQ4MlZUTXNMNlpw?=
 =?utf-8?B?bVcrUlk3RGMwK2U1VHJoWkF6aG9OK0haeWtTSUo2dFRIU0VDZ2JYdFhoOThP?=
 =?utf-8?B?UGVZRDVjRTFodmFuQWViRkZvZHVKNmF4MS9La2lSRElPTWZHaHZhaTVBb0tV?=
 =?utf-8?B?a1pqOHExVnFTTFpGRDR5bkkvR3hvVmZwMDlJQ3B3WWJuTXlyOEUwZHNKUUJi?=
 =?utf-8?B?T0pkczB1TmlFNDZJNms4VXY4UkFBNG1ZeTFvdFRDUkVuYzR4OHQxbDFtQ1Vz?=
 =?utf-8?B?SEttRzNJb21QMXVLOGhNMFhCZW5hMVV6R1RWS3UydXVPNGh1eU5KMFQ2WUFi?=
 =?utf-8?B?WW5vNng5QXF4QTBpblhpK21KUUZUQ0gwOFZLcy80N2drT3RGSWhzbG5NWmw2?=
 =?utf-8?B?dEVuWGJlcTF1K3JQYktuQ2xBQlFlSTNGY0JaU3JsQUlxZUM0OVNtV2hMNmhv?=
 =?utf-8?Q?LDQuv6UOaRqRrrRnDtUsC8AWYfWPBXvPZN0I3rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNhVGlrdTVlWCt2Szd6NmU0cGtMaEorZFdXN1JlU3U3bW9pamwzRzhvY0Zp?=
 =?utf-8?B?YUFFNXNHNGE4REQwZVMyZElGekMxNm1YSWF0Tk5USmIwMVd4Ti9NVkt0N0R6?=
 =?utf-8?B?L2pSQnJyRDB0WE1WaDZyRis2T0tZY0hPbUNNYkNPb1h2RkNrMEVjVHdHSkJE?=
 =?utf-8?B?ejRLVGdOMk05R1d1bDNMTEp4REc5MllveVNuaXFMVDBVaWQ0aWFsNG9OeHV4?=
 =?utf-8?B?WmhFY1VhTjYzRE53OG5sNjRQTFo2NlJYa09kTUVySlZ2R2NCTVpoMWRWRlc2?=
 =?utf-8?B?UXJaMS9jNHNyYXlpTXFGOUt3RkZRV3FJb0wxUFZadUUyNno4dmVMcDZCLzkv?=
 =?utf-8?B?N1o0VGhmS25vQlkrQmlHcDRRTmNJVWoycndERTl5bFV1UG9JSHp0VzlGTVVV?=
 =?utf-8?B?dmc0dG5vZ0M4M2VNNlVjc1Zla3BqNE9rOE55eUFrU3c1Rkw4a3RKenA2dWla?=
 =?utf-8?B?WGFrTUxnekhVTTRXL01TUTRySXZ1YS81WnVhR0VmWFYzMVJKbEZTU3RwKy9Q?=
 =?utf-8?B?Nll5YXVWeU9wSDNzTzduRUh6WkI3VUd2UzRzMU9mZEdjZVl3Qks1ZVZZOEl5?=
 =?utf-8?B?MGdUVHBGK1VTRTdEdm1ZQUZuUG5GR3NCbDNKYjhhQzlLVDdNRmxxOXcvazE1?=
 =?utf-8?B?VzNLU1ZXaUM3d0pkUHNnVGJGcElvVENjbnAyUkNPeURjLy84aEZGMlVEb1Qy?=
 =?utf-8?B?WTlTZDdDSVVGNEZrWCtQWXNtTm9kOUs4SWhuOXhyRlNyUjJ1QTlEa2VmUlZn?=
 =?utf-8?B?SEo0SzFJTkx1anR0RHBBa1UyZmsyWFZVbFlSK3lZOC90cVFPUWtpZEN2VWtV?=
 =?utf-8?B?WEFrTnNkTnMvVitCWGFJSklHWEtjVmV5MVZiSjltSnVnNjU5bHAvY1RUUjBD?=
 =?utf-8?B?TEh2SlRxbUp5SWlNcjdmRmxFK2hINU53cGhlaFRxUXVxTU5RVTYzVE1yeUNt?=
 =?utf-8?B?TnU0elV5V0pMV3RwZ0FtUnl4VnU5T0wzZVNmc3dhdXFqRnRsbUM0d0JQdjIv?=
 =?utf-8?B?M1NZeUlQWExnalZGbG1DY3R0RWg3UUY1ejd4MzFwVEdKakRZakFaeVJUZStS?=
 =?utf-8?B?cTkwemJUMGhHWmxmK1FJY0FKZnpjNitkaGVhVzNXYk9ScHlOeCtkZVlvam8v?=
 =?utf-8?B?eU1DeUdaa3RxVXdiWHk3empveStEc09IelpPanRiOUk0aklzS0lOckpGdEpR?=
 =?utf-8?B?UVU0NzB2bHZXalRrUlBTdVo3R1A4ZGR4azNmcE5IblI5ZWY4OENWbW1ITlVJ?=
 =?utf-8?B?d1dhVEtjalZEQ2pYZGxsTzRiVklaeDBEWW5KQ2Vwck5oZHVYNVhwNnhRRUJH?=
 =?utf-8?B?b1VJZ3ZsWi93K2w5QlpwVzNMbktrVnFaMUxNV0RjQ2xtNkxhczg0K2NiZEp3?=
 =?utf-8?B?Y1R6M0lXa1RYY21xTnFnbGNlcHJWNlVhY0JRcTlpZkc0THpxVGJRaFluMjcw?=
 =?utf-8?B?amJkTFlBVHlRNjl6ck9kUUlzSm96bThvTE1CN1JWeStxaE1CdTBDR09HeUYy?=
 =?utf-8?B?Y0RDR29FM1NKN2h1RXNSRkJWTldKOGkxa1l0OXJkTWVtU2xQRHhhS1MwQzRU?=
 =?utf-8?B?OWI0WEtud0lhOUdoZmZxaTdSeUdac1grK2lCUTJLWWhIUEJkUkpNUDZkL0JK?=
 =?utf-8?B?dTVZWWZHUjRNc3gwTzBZZ1JtQi9GdjZsbDlXTUpZNFBIaE5wKzdJWTN4dTh5?=
 =?utf-8?B?THpmTUFPS3NHOGFTbmh0eDRRUFRPTyt2d1N6dFpOeEl4emljc0QvUWFTc2xD?=
 =?utf-8?B?c2Q5ZVFocGVZckp1SWhSV2ZwZjV6UklPZjU5R3phYTVjUUtGaTRNT2JSeDdo?=
 =?utf-8?B?OG5kL3ZsOUtaWlhCelRNUWdNb1VDTDlqdThFSmcveDNKUU5OT20ya0l2eFpn?=
 =?utf-8?B?MDFJQTNhaXZvb0dFNU5nM0lXWVNaOWk0T3NTSmJmRmI0Z0Y1UTlhTXVGLzAw?=
 =?utf-8?B?bnFCeVQzdFhqcXVlQkozNTYvTVVURzUrVllRaldHR0dRSWF1V2lmWG5lNmdY?=
 =?utf-8?B?QkErWDJOTjdjQ2x1L2xURCtma0VMbUhMeUEvWDFpT2kwT2dqSkVlNjVOYUFi?=
 =?utf-8?B?Y3J3ZXBWSHdaWWpneWhYTUtUMGt2Tk9XVkhJK2N4WVF0cVdLS1o1bUM0TzhC?=
 =?utf-8?Q?6XystLXIKFPDUG2HoGcieYfbb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d36b4e-fc07-4deb-6459-08dd089fbfb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:40:36.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/Z+zgvKl5y+1asRKAa1/IhTtYvdp0IQhRe763/B8ux41A12IIAvqWpyypN3l6VM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798
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

Am 15.11.24 um 16:01 schrieb Thomas Hellström:
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
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v13
> ---
>   drivers/gpu/drm/ttm/Makefile     |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup.c | 204 +++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_backup.h     |  74 +++++++++++
>   3 files changed, 279 insertions(+), 1 deletion(-)
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
> index 000000000000..bf16bb0c594e
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -0,0 +1,204 @@
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

Do I get it right that struct ttm_backup is never really defined? What 
purpose does that have?

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
> + * @alloc_gfp: The gpf to be used when allocating memory.

Typo: gfp instead of gpf.

> + *
> + * Context: If called from reclaim context, the caller needs to
> + * assert that the shrinker gfp has __GFP_FS set, to avoid
> + * deadlocking on lock_page(). If @writeback is set to true and
> + * called from reclaim context, the caller also needs to assert
> + * that the shrinker gfp has __GFP_IO set, since without it,
> + * we're not allowed to start backup IO.
> + *
> + * Return: A handle on success. 0 on failure.
> + * (This is following the swp_entry_t convention).
> + *
> + * Note: This function could be extended to back up a folio and
> + * implementations would then split the folio internally if needed.
> + * Drawback is that the caller would then have to keep track of
> + * the folio size- and usage.
> + */
> +unsigned long
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
> +		return handle;

Just that I sleep better: This can never return a folio larger than a 
page, doesn't it?

Apart from those background questions looks good to me.

Regards,
Christian.

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
> +		/* If writepage succeeds, it unlocks the folio */
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
> index 000000000000..20609da7e281
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
> +unsigned long
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

