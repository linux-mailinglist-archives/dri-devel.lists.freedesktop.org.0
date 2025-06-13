Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF8AD862A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DDF10E900;
	Fri, 13 Jun 2025 09:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jRCv0fAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9436E10E1CA;
 Fri, 13 Jun 2025 09:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTm+LRsZKpxelvycHz+rsOMAXDugjZT/GwS/Laro4sCKpVP4uns4NYSjupmQky71o5QqRKnYIUdm1XXj0pNpCzjRJLz3FdLN3asGBDZyh5nwM172GYxPunMrdwP+y1Gq8f9DvIYxU/owUwY5GNeV0NyIkN6ox1yfCnRC5lRjWB0Jkl5I0oGna97sALq9ZsCiGYu2aq6BxUIjFZcY6ck119Ad/EzK5E5nX+BUWHWXd1fJ0vCOZ3xaPuCa33+38HGihp9p7BgN97SUlKAoY+kXDgzmlS5vRt4m2ozqExHGdR3EGx0to2elHUOVSU2diYClT5SDqf9lJqCuZ0dcC+lA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkNBC2tl7bxFVM/SqwyCDzCPZ1NSiHz1Lp0gw+T/j9k=;
 b=mxKee19JRxZcAIfcJqGglYiC8RmQkslWT1eOb3dFljmMQanokE71TJ9i1/Tg6goqrISIMUbtDVSZGQX4xRRGRyUMmVcvMCwUYuuRvfD265ab7UuEZ50KFa5N5XyjoBQZGCzavASDWeXM6N0zBTfcxr86hKk6FcmK0mTjhIx4fzm/U3deIVKAV4cmDl/M7uyqf00J4XBlubyBWXYX8elP1J2zF68LTPCyVIUzHZ9mxv/RufJJnyBpRA/p8TgfJMo9u7ps/Bzul1OVo0GZc3jXXosyO8I/c2vAKUQwbUchrC2xEFjwOrzRZtD0wkcowDPdBmDF+bIzGWHgkOrQLQChLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkNBC2tl7bxFVM/SqwyCDzCPZ1NSiHz1Lp0gw+T/j9k=;
 b=jRCv0fAQKOJplAKNo+TF1Qo2wD9MEFR5y+92Q+QCHME2u0viPixxnaHdlqurJTr0vI1SyVqhFsqZenbJ2sM6nv030vRHvyANA1K6E1If/miJajoYDdY1RtEan/1hOi2PnvdQeyvBdT0S9/y3+oq5Vobb0Q9MgIci1+60pmEUUI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Fri, 13 Jun
 2025 09:00:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 09:00:27 +0000
Message-ID: <705e8a3b-be01-4c1e-96ad-b1cc9fcf42ca@amd.com>
Date: Fri, 13 Jun 2025 11:00:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] debugfs support for pt base for each vm
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250613071537.701563-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613071537.701563-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:208:23b::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 087e0fd6-df09-4c32-43f9-08ddaa58bdeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1dyU3E1WTBJKzFzU0k2b0dRTDBzU0pET1J3dThXRzZvdFAwVTVzbS9oVmZX?=
 =?utf-8?B?RW9VTGU0UjcvQ3Vzbkp5N2pzUDluWDYvNk9nU2JxY29kakZsU08vN3V1RkZQ?=
 =?utf-8?B?UktmTVN0bkxaZ0V5eTQ0UjN3VklvNjdxQVA1Sk9UVkt0TWVwelluUERzWlJR?=
 =?utf-8?B?T0JvcUlyZVJLejBDSzFENVV5YnlFNTRkMHZ4bm4vcm5qYzlvVjYvMk5hMXpi?=
 =?utf-8?B?WmRNN0RFbmIya09RSW5sZ0pRNjlTZHNGS2hQc2ExTHlPY1JjOENObUthZHQ3?=
 =?utf-8?B?enUzSmJ4M0VvbEowY2Z5RkNDMXhwRjAvQTJXVlhqUlVKRkRwT2RLMDFka25H?=
 =?utf-8?B?OXRSd2l3ZmtIZWNmRjBZeTZ5T0hZRWd2eExRNjNnNGRGM0ZBenFxdVpGajBp?=
 =?utf-8?B?UWk5UHBxcE1ScFdDSVVGZHFRS3JkSWZHRGt5RG5RWmtlbWIzSmlsQUFXNm4x?=
 =?utf-8?B?WnRmWGYrR0ZybVNxaFpuQTVsZ21hUEZ6VHhJS2J3bEdOaVh4eDNUS2tzTkFl?=
 =?utf-8?B?YVIzYWpZT3F4aFNtNUpVOFBFVUN5QU45bmFzL25wY29DemowNVZJTTlrZlVZ?=
 =?utf-8?B?dHpncXh6Zlg2cDZVTG1LeStPQWhMTFNOcitXSVFhU3dSVS9oV01ZT1dlOHBT?=
 =?utf-8?B?TzVmNHFGaGJhT1FpQmJSNnpmOHFnQ2JOOUlaUTNJcDR4K25jWE5qNmhtSTJ4?=
 =?utf-8?B?cEpqRzc0SG5NSmYyNUVFZmhsV3M5YTlFYkorUVJVc0ZpTGJwbzhSMFVrZzJU?=
 =?utf-8?B?RFZ0NDJKb0wzalBtYi9jaVNzcUR3K3JqN0pnSTVGWmt3b3h2bDgvR3dQbUdv?=
 =?utf-8?B?VUhmWE01bGpJdzFUQXFqYUg5MHZjSUtnUng3WkVrL01HNzNvaHpNOXgrZmtq?=
 =?utf-8?B?RzVOTnNUOUZTYUF3bDIrRkNLYmpod0xwTkMwaExoVHdtNW5ERXg2eld0QVVQ?=
 =?utf-8?B?MC8ycTh1V2dKRk8zNEVnNlZEemVSVjZlLzl1bngzcXYxdnpYeUV2OXBWRkh4?=
 =?utf-8?B?NUpjL0VaSXdTeGtJQVRZMEJnVXplTk52ak9rRjV5V3lud0JWMjYzdlBQRk5B?=
 =?utf-8?B?K25CR2RxNUJTQVRGUzhkL0EvL0MzdGhSKythWU44K1E0MXpzTC9TdUpjeVpH?=
 =?utf-8?B?L3pybWFmdWhkaFJUdjVWSGwrd0sxZ2tVQ2QwTzFYSmJTeXNuaXZCWThoTzAr?=
 =?utf-8?B?ZXdyMWZBQmxmZTU4OVN1a3VETVExNVVjY3ZYQThJeU5OMk5SaFJYcHlDWlk5?=
 =?utf-8?B?RXU0cVo0Q1lMMWRnRlROSkk5R2wzN09ZUWg0ajV3bXFrSS81T0pSSG5BdGdi?=
 =?utf-8?B?N253SmNIZWd1UElRekZvR0NTTTBuTFpPVW5QSVN2d3Yva2FSc3hsU2VwQ0Fa?=
 =?utf-8?B?bEtCSmlvYUZrQWE5ZWJkWU1PVCt0THBDbWpKci85Q1hKL1Z5b0tDQ1lpNm9Z?=
 =?utf-8?B?WFkyckttVk5tUFVMT3B5MmFncVFrZTFPWjhRSnVYaHloT1JNY25WMTVEM0Jm?=
 =?utf-8?B?V0c1OHBXQS8zVTA0KytmcVJRblQ2WCtVcDBCdUlLQ2Y4STBYU1R3WkF4Rmd0?=
 =?utf-8?B?SGFkdjJwbkJNYVJnREdFL0xyNGVmaThoN2ZMT1J0bUNzMU5JMVhMNmxSNnNv?=
 =?utf-8?B?eTQwMWlaYTROWXJxR25HV2Q4eldTMFdScWtvbm0rOWUrS0ZKVHRIek5NN2ZF?=
 =?utf-8?B?ZUxTMk1qTHpJSWhBVE5lNGVUdUJDc29jd3V1dVV4YnVMT2YxWWJybGFHcG5P?=
 =?utf-8?B?VndZR2VKcmhtVDM1Q2lzZnhhUzQ2WUo0ZFhxakxDWDJLbGNaeHRXQzZqNHV1?=
 =?utf-8?B?eVJ5bXh0MUcxN3V3WTdtbG53RzdSNURETmtRRWxuOHlVaHpFcHlrUXpuRmph?=
 =?utf-8?B?cXhFZWtRMms2VXdjYnNmZUd0L2pNd3RIbFZBbTZRc2hMamthaHhlc3ROZzl3?=
 =?utf-8?Q?ILwtEqxO4gY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdlSHBSYm43RFBVUWVSODg3MTZlR1pUUEpmblhCWkd6SE1HR2NXcWgxRG0v?=
 =?utf-8?B?cFRKNHRBbFVOeWRYV0tEZUNQak1GYWRXRERJM084WVEzVmw2SUhYMVp3Wm1o?=
 =?utf-8?B?K1dFVzMwdDQ3T3VKOU5pb05SMmZOZWtBQWVJQ3pYZm1OT29VU3JhR0V0SzFI?=
 =?utf-8?B?eWxRcklTZ0dwSE9IWno0emVvSnAwaE1tNEVGeDlDNjNTTW1PcnNqanp5Q3BI?=
 =?utf-8?B?T2xWVnJQWER6NW1MWHB0c0NNSzE0djQycTJ2UXc2a0dhMFd2RnNtNWZaUUxN?=
 =?utf-8?B?aWVpV2MxK0UwTzF5M0FXRi9nNGE1c0JDcVBtSkR3VDlBM3VGSTlRSmRGNkdR?=
 =?utf-8?B?a0I0V0pPR0VPUzVaWWk3dzYxNVNCQ2hJTDc3M0t2MklhQ2ZUNTZNMnVmVHM1?=
 =?utf-8?B?dUZQWkxzaUh5Ui9xaGlLdElzUi94ZWcyKzB2LzZOdDMwdzlpMnNMdlQ3dHQv?=
 =?utf-8?B?SUhQSVN2Ynh0ZUViU3ZoUU9jbmtLUS9TQjJ1cENKQTBLZ3k0c0svalp6UENx?=
 =?utf-8?B?SVNoU0ZDQXRFRUpac3dNV3hRdldnQ2xXQ2FybmNZOFNCYXN2Z1hjQmM3dy9h?=
 =?utf-8?B?SDdHQjMvRnZNQnhGdmV2UFVxOStvWlFDY245UWVCNXppWXYxU085NjlpQzZS?=
 =?utf-8?B?Q2t3MlZWREZwLzh2RHdMaGxHVWxURnVGMUJZUm0vU1lZZE5Bb3BFdFFlVCtj?=
 =?utf-8?B?S3B4NUNQUUNKWVZRWEpTZTJqL2NtaVBtUlVpTEVTOWxITXgydFZlWlRqZzBF?=
 =?utf-8?B?WHc3bEJ4TUxGRjByblR2dVpON1JyTUVYQlhnZS8rV2U2Q1pIRjMrQzdTUWhn?=
 =?utf-8?B?ZzQ5MG1DbVhtYWdsbzUvYkdCc1RkSHI3ZUFKN2NyZFg3eTJiZEZHaXFnc1A0?=
 =?utf-8?B?OE9vUUdUT1dLVjd6TUdubWJtK25VZFBnbzZXRWttdEFYb25TMTlIcldsMnV3?=
 =?utf-8?B?TVpLZ2pXYlRVeXMxZmNMaGVjK1F0UnhuN0VjaXJEL1gwN1BMR0hmb2FEczkx?=
 =?utf-8?B?K3NTbjZncVY2em5lelRmYjhOajdNSndUK2NtWlhiM1pmYW52QWl1UEhkdnYx?=
 =?utf-8?B?ekRyUWtoMExNTlFHSE4wc2QxWHJHQ0tCd0xkQ2xER0FXZ1A3WDFBN284NVM3?=
 =?utf-8?B?SGsrYWZsMy90Z0NTN0IvNDRoRXNLKzVDcFRVL1JHN2pUTDNxTFIrZm5yTmJq?=
 =?utf-8?B?QWJjb0FYczAvVHNlZmMrOHIwZG5aa0xodXJMaU00RDd1R1ZPUTEvVHoxaHRo?=
 =?utf-8?B?ZFBWT3k3Ync3MFNqQ3ZjWUZ6U1h6UVF1bW52NUJwbzZGZWg2RG5rUkQvUG0r?=
 =?utf-8?B?cjluQStNMGdoZy9kVVhxcmJjMEtwSXNYWnl3VEI4WUxVajVLMXBKejBTcTB6?=
 =?utf-8?B?cll1NVhLUm9JTTBsV1VINE5BMU9GdVZESzZlNEpYVnRwaTdVYUh0TXhWQ2xU?=
 =?utf-8?B?Zm5pSDlaaWRWN2drd002a0RaaFdvd0t0Wm1nMWhITEsvMHc4dm1wd29YeThT?=
 =?utf-8?B?cm1rU3IyQzFIVTBoSjZGU2hudTlaQldqc3BXK0RpNnhaeUcvMmhHdGxEZWRs?=
 =?utf-8?B?djhiMEV5VU4vZTBrcVNmY1Z6bzhPOXZNUk9IL3UzYStzN0pTbUVWLzVmMDN4?=
 =?utf-8?B?UDFPZFFvNTU4OXgrVWEzRXJKeTZ0cTFnSUo0WTBYZHFjTVJvYzAySGczbnJh?=
 =?utf-8?B?QUxHS0p1SkR1eWZwZnE4emh5aTBXalNaWGJ1OXd6SzBqV1RPYUU1UEUvWlRn?=
 =?utf-8?B?QW1BZU1kbGtUOHhBQkRUQnVvRU41cjgya1hrV3RoaXpLMjJ0QU1Xcjc4Y3FX?=
 =?utf-8?B?L1pseDBucGJrQTJlLzlxcGNVc2JLK1lWVWQyWDdGcjV4d3JSa0lGand6SXRr?=
 =?utf-8?B?alg3OHpHSERLSXl1NkVSUU5ZdUJ6RUNIQXBGTFVMRUtDb3JLUE84dHVGbzJX?=
 =?utf-8?B?c0pnR1ZkczNXZmdEZVExWkxYcFh4U3hpblo4KzB1c0Rhc2dNQmprSDFFdVda?=
 =?utf-8?B?OUkwTHArRUxtbG51c243MG1qVlpLUXVUY1ZqN1NwcDYrM1lhZFYrdkJva0FT?=
 =?utf-8?B?Nm9UNDNLVkcwNkFzdSs4U0lNeVVIM1MzWWdYMGJIdHJ2cmZFQlJNTFdNTmIy?=
 =?utf-8?Q?gI3/jYomJ94eB7XElBQ/C/C6b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087e0fd6-df09-4c32-43f9-08ddaa58bdeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:00:27.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ly8p1uJrd/Nj1tRpauIEwGoWzFlVa6RdwmbD3II8f3IdDg0GHlpWMOvyIo1UabcA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627
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



On 6/13/25 09:15, Sunil Khatri wrote:
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/clients
>              command  tgid dev master a   uid      magic                                                             name client-id
>       systemd-logind  1056   0   y    y     0          0                                                          <unset>     5
>             Xwayland  1733 128   n    n   120          0                                                          <unset>     8
>      mutter-x11-fram  2048 128   n    n   120          0                                                          <unset>     9
>             ibus-x11  2071 128   n    n   120          0                                                          <unset>    10
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client
> client-1/  client-10/ client-2/  client-5/  client-8/  client-9/  clients
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
> client-1/  client-10/
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
> client-1/  client-10/
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1/pt_base
> 81febf3000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-5/pt_base
> 81febe9000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-8/pt_base
> 81febdc000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-9/pt_base
> 81febb2000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-10/pt_base
> 81febaf000

First of all move the client-* directories one directory up.

You put the directory under the debugfs directory of the device, but the idea here is that we can lockup the client device independent.

If we want to know which device a client belongs to we can easily add a symlink from the client subdirectory to the device (probably a good idea).

Regards,
Christian.

> 
> 
> Sunil Khatri (2):
>   drm: add debugfs support per client-id
>   amdgpu: add debugfs file for pt-base per client-id
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 14 +++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +++-
>  drivers/gpu/drm/drm_file.c              | 13 +++++++++++++
>  include/drm/drm_file.h                  |  7 +++++++
>  5 files changed, 37 insertions(+), 3 deletions(-)
> 

