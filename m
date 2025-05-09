Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1BAB1E97
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 22:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EB110E025;
	Fri,  9 May 2025 20:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IusrpqCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0B10E025;
 Fri,  9 May 2025 20:56:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2N5W0m0xsg6BQB1n8thiQcrnr+rY77WFoGk/8fJ7E1wLe3G1AGUeIBtW5F1YQ1Yy+oQezzpmhq/JpdZ5Xk6zATH/BXj9/yb4LWaofYt5ULVFO/HbQEbO6VzwMPhnLS4FiCRsYKMmsZXqzJ46luWoBQ53Ty09xVcTlN435kqxYeWfa3sEl4mrxN6siP7laDe9+V+s2DFc7IzCXNfEAVQTy0gmtC3h3R8cwoq28Lw7ySbWNm/x4Vtv8eeDR9AL50HpuhzVrXyl2nUdBNdMPVnZtmuLHScBklj+UK+kiERXAGkD5sH121EYfoOezGhalXywDQ4WSudzGu419hL+LwQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s55AcDsRPAwyjXbqoLqU3KPmZvLbp6E7NjMC+wzxF3o=;
 b=ynxgqyqD5Rc0Eb7KRQGUBjSBOTCoYiHACWS2VNVNrJYcJje+Guex1LaeH8wHRYvVu5LPuFLzYaZZNzBqdioyR5bsxi9Shjvi67adCz4VB9M2IznVPySLDqknT4jW5xFcHkiDTr0QywQomK+heOtwiDOay5t+tvGU3BEzzDsGVzj+ZJNuBSCiHMBk6PJYvys+XcySos8PR5wlwlKWsSAyoZpwKK8cfFJLVljQQy99UUgDXdoGr1LPUpa3RSSsIWNqYuYh2Pp9stDOwC5evMk85ueirDLCmoYsbqwI8YrZ4vMkSbQynNVHdWInPT9/O/gK8M+UAkXmo8XyPAG/r5RXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s55AcDsRPAwyjXbqoLqU3KPmZvLbp6E7NjMC+wzxF3o=;
 b=IusrpqCr36IoKRVX+nYR6uWJqdDzauqawXAYownFoKmgOmTLqIJta4sEileb17MZRitpD2SVnPkmQPVELBDntPEAZ4ol+GetYa2uUj84ZRFO/S25rdoICmqwh1lr9DxMe6Li0Olsyhp75PtJCLINAv18ZksGxKoKU6lfBhmmP8Ar4WvVSGZr9edGSzKWV5FdgMeN3kor/tAek0JsI/u8XN9vLHFxNVzPlAzmEf2oPRJcMvkRvB4uQo5nqh3BNL0KsCGtPy3TDATrKmcKEKDO4umL3RwnKqFd8TQnGH8aYQ8gvrydr7YSMLN3a062wnMmKY/jAJWiXyPZS90CqzoltA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 20:56:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.035; Fri, 9 May 2025
 20:56:05 +0000
Message-ID: <600676ca-0daa-4697-9cb7-b72c082aa5bf@nvidia.com>
Date: Fri, 9 May 2025 16:56:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] nova-core: docs: Document fwsec operation and
 layout
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-5-joelagnelf@nvidia.com>
 <20250506192641.7872cbd0@inno-thin-client>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250506192641.7872cbd0@inno-thin-client>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0887.namprd03.prod.outlook.com
 (2603:10b6:408:13c::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 0123ecba-551d-4990-dd6a-08dd8f3bea5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1hTRGI4YURpZFVSWVUxSUI2a3RVZnUwbnBHS1YrY0FES3VTTW9Telp4T3JI?=
 =?utf-8?B?bzRFVk1mYytzcjNZMzBhUThiMUVrc2IvZUoxdGErb0lYbUFjdXF1dWl2Z0U0?=
 =?utf-8?B?djlMZjkyaFFZdEUzSkdENTMraEJnT0VNSHBoQWNwVGJ6c1NFZmxqdHJ1bC84?=
 =?utf-8?B?a1JrS1FWaDNSQzFtUjhOTDJ5TW40SFBUamo5UlpEV0h3VThQeVFpYmhzeDR5?=
 =?utf-8?B?OGZEOWR3blF6MWdONHpjV3AwL2VRY1VvNTJYY3BSVzBOMUhPNExpR2M0NmNW?=
 =?utf-8?B?OHhmNElkU2Y5QVQ5aUREV3hjTnNUZDlIRHRub1djK0xTelBTanppTVdmRFdO?=
 =?utf-8?B?bTdRRWhhbzljYis1KzBnTGZQY3lLZUcwZFI0WjhkYlNSYTlMR1FkekxDZFRO?=
 =?utf-8?B?eUhVUmpwWG91Szdjd0dyWGZsY3cxMFNXczhWL0lHb2tWbW1tQ1c2M0RJVkVJ?=
 =?utf-8?B?MGY5eWJJSDl2dGRaSytBMjJTeFF6ZDZyblpwRmw4bWUxNElpRWo2dVBKUXpW?=
 =?utf-8?B?WWlTcHJGVWs2TVJiYXR5a2YrSVZGMWgzSzNZVHBHQ3JKbnhxYVBJOUxKS09h?=
 =?utf-8?B?ZjBURklleUtYaWRhWkM0Y1VnNWwyZm41VFExamNxRWZ0TDgweFhrUllvMDlo?=
 =?utf-8?B?c3B3M1RvY2U3NmM1d0k1MmVlZEdMSldKYitIeVVWS3FFOHpWbVdza3U2Nk5L?=
 =?utf-8?B?YzBVVkJyNkpZa3RrVE01ZzFVMjFTWWR0UmlsSzBHbE5nQnI4WmVSUmgxbVA4?=
 =?utf-8?B?YU1jQ0FlbWd5Z3lmMnFmdjFyWHFIQzBMUTNyeGtiN1lRenNmbEhDZU1uaktO?=
 =?utf-8?B?aVBydnArVlo4NnNwMmNYQXkzSFRyaWNXV1BlWWNNeWptK2kvdXdpcytvaGFr?=
 =?utf-8?B?di9IQWhENUtrdllmbGIyVmJVRTJ3ZWxFcHVRaGx0czI1SmtBRGszTnlvdjBm?=
 =?utf-8?B?SmNYRG00OHFlckJIQTZZMVJaeUlOd2ZURTFzVGdMWFBQaHduRjFUaTZQbXBk?=
 =?utf-8?B?UHl2Q000MVh1a1RRMlBLb1BuM3hVdTRZNTBndEVER1NIRUEvZldkL1FJMHNn?=
 =?utf-8?B?SHlvQUdUeWF6VUV0Z1Q4YjduTTF0RFdOSjcwUy80UUhaZWpvRzYzNVR1SjBt?=
 =?utf-8?B?RjRoTFplT0VMUjNia2hOdkY1K3lRRHI5ZkFuTjlyTUtMVWc2WGdLemNXRlFz?=
 =?utf-8?B?RU40SFR2anJlQnd3aExDeWd1ZERaZUpnZkU2VWJaMlBUZEtwWGpMUUtxVGVo?=
 =?utf-8?B?OXVobVBrWktXOGtkNUQxK1Z1cWh1Zjdubi9RN0FvN0NPc01mc0tZeTNuRlZq?=
 =?utf-8?B?c1RYeFMyRk51SUxHajc4SGR0V1d1NVVDWXVyTTM2UFhoT0tPSlF3Qkc4TVgw?=
 =?utf-8?B?LzlWN2JJS1g5d1V5WkpMZytKZ2syQkxKU091MGNaNU84Y3haMWhPL2FxcEJh?=
 =?utf-8?B?aXd6YStyak02VGxickhrSkMwWnp6ZElrYUxPZko3emFpS3pWVGtyRTZobGlz?=
 =?utf-8?B?M0NGUnpXVCthYWhUNEszbkNITjc4Q1dJWlpaMGVGYU9MWnVUQ29PQ1h3THpo?=
 =?utf-8?B?SERidkdpL1pydy9nM0hXOFdHVU16Z0dLK0VUclkzOU0yS3NsT2lrNHh2UVNz?=
 =?utf-8?B?Yk1hcXhlajZCd2xOYXFVKy9vSkFpcU54bzVRRUZONnpUbm1RR1JxQzRGU01Q?=
 =?utf-8?B?UTZWMUsrL29KOWo1aEtkNkI0YkxaRndyY21meElDWktKd2ZDZGlYbnpkWG5G?=
 =?utf-8?B?UlQrQktsR0Q0Q1lhU3piZTVFeFZ0MmRvT2REalhZSStNckFrWTNCV0w1bGtO?=
 =?utf-8?B?d2ZQa2drOTB5eUw4WmVvNjhwWlN1UUswaU9WQUIvOU9RNjdEZFRNc1lKcFN2?=
 =?utf-8?B?V0FWMlo5cmhTME0zMDNIanl6amVGWHo2Z1VxRWhZMXE4WkhFbU1oOTFSS2FM?=
 =?utf-8?Q?y56n0heZRbs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBaVDhmNkx5Yk5hVTBubTlubTl5TkZ1anl5QnNUeHBLSWUzL3poVzRGbE1w?=
 =?utf-8?B?dHV0NEd3Y3M5a05CeXBaZVRUQTlvdUJhYzJ0dk9ld2hPb09xb09tZmpGUUZP?=
 =?utf-8?B?RS9PTjc5T285WjBwZjNoRTBMb0lCS04vMDVVWnNOb3B1T2RFYlhIcFlleFl2?=
 =?utf-8?B?dUthdmNRSVBpQUlHeG82WXZ5VTNCbndBQURUYk1lVFhDdzllWVRrUXNsZkFJ?=
 =?utf-8?B?OSswSkZaNXA3ZVFLakcwT1RWWDhnWmNXSTJuYjBOZ0hvNjN6NDBERjd1SWV5?=
 =?utf-8?B?b0g3RUg4NStOVkl1UXN2M2VnZDZJUHd2dGFNRGJSNHNHRUxMUWpmb1hGNUZw?=
 =?utf-8?B?bDZVcFZ2MHpiRUNpWGJYbXdLOHA4V252RHd2dWFoYUY4eVNPTWFCWlRxbTlC?=
 =?utf-8?B?TGgvdDFHS1BWa0Y0VzkwZlFkNjU0MW1VdmswNUVEWFFPYXR2M0lHa3RMUXlI?=
 =?utf-8?B?dmR1QzJhMWNnakFNTC93NkhjRlorMDBOdkQ5aUg2eUUvZElQRE54dVRhZFFI?=
 =?utf-8?B?eHp1VG1OWUhUR01TU1M1NUhrcFlubklTdFFUVUVBQ0poUUFMV3BQN05WSGxR?=
 =?utf-8?B?ZmFRRjlHU3RlZHpJVk5KQ2wxb1FFeWh6Zm9XY0RraWo0U2pwOFNBMGxaaWFq?=
 =?utf-8?B?aWpKQkZkMzF1bFd5T1diQnUrbGlsa05DTThndnBVRnJ4empleDY1dGNTYjl6?=
 =?utf-8?B?NDBYa1EwbXBjMW9palR0bHQ3bW02RmxtOTBnQzZEVEN2dElhc0ZDUmxTdC9K?=
 =?utf-8?B?bm5IUmc4bEpxSW15dWJSc1pETmpvb3lzRGhINksvYldkbzIyL3VwczVXU21M?=
 =?utf-8?B?ck5hZ3BZUCtybC9YZGVMOGo2L2M5ejF3MVNGSFlScXpaU28yYlJqODNIaUZk?=
 =?utf-8?B?S0hIeGFENklZNEYyS3JJTXJ0RFpMbWNoa1JKU1VXVElwL0JpZUVzdS9xWmtU?=
 =?utf-8?B?MDM5aks5MndrWGVhdkMzdkJad3BGdXpaUnFWMHhXVnVreTl5WWY1bzdhOHd2?=
 =?utf-8?B?b2xWa1Q4WERSSkpuUnA0WlhYeDgwc0twZHZMcXk1S2pjM3dCWmlhMnVMQnpF?=
 =?utf-8?B?MDU5ZDJySFdnMDk5RXUzQVYwdkZVZmp4SHpNN0Y1cTB5NVRWejR0MDMyU1lx?=
 =?utf-8?B?OERmSWhyc1poNU1iQlowVXBELzVKUEFONjhLT0RFS1ZXcEJ4NklDV3lqWFpu?=
 =?utf-8?B?bTE2VDFhWXdLUzl2cG5pcWd4WGQwRDlHYkhTbjVxaXQ0c3NQeFFXOFFuQVRC?=
 =?utf-8?B?enFtd2F1eXFyY1ZlYWswMlpxZm1pa2pBSnlzdUVRK3RxZnJDd1pJejdHZm1j?=
 =?utf-8?B?OURTOWFvMDJNeFJFNktPYkUwTmNRbmN4TEZyQyttZm9qSjNmTXJoRUFwK3JW?=
 =?utf-8?B?NkhKRUVXRVZhd3hZSVhlQ2Z1LzhRMnhkcTVwQWRwdnlLMkk1SkVubVJ0Sm9q?=
 =?utf-8?B?U2labmJCN2xWQjJ4MnRGRUlWMHR4L1F1ZG9yb2Y1MVE0ZWVwcTdOZjhQdEpT?=
 =?utf-8?B?RUVmM2k0TVc5a2YxdlQ1RXRoZThXK0Q4M2lBWng0eFBSR1NJNTJPbDEzWHMr?=
 =?utf-8?B?THdhQXgwWDBOOUtSMUVXQXh0UlA3cnVqbVJPczJadFFhR0VjMHRhV1UveE5C?=
 =?utf-8?B?eWFTalRFOUVOVE9pQXd3ZXBrRlVjZ3dCdWw2VDc3OWRoNHpGSmZESWhUeWxJ?=
 =?utf-8?B?TEJPaGhpTlJtVmNqN1h6Q3F1c1g1NHNXT1I1WGY0eTdCT3NJZFFSU3VnVHkw?=
 =?utf-8?B?SXJhcTBXcXE2ckZseTdyS1loQVBaSldaa3dnSnNHSittMzROd0VMV0RRUHB1?=
 =?utf-8?B?MXBvZGdwQ0c4RGw3WStzbTd0YWdTd0c1TUwrUENVWERqZHVORFkyRHNnSU5L?=
 =?utf-8?B?c1lBRllNZE5KK3VTZWxRMEdJWGRWOFpveHZZT2xSU20zcWNOOVhwMm44NThn?=
 =?utf-8?B?dFNEYzhmeVNuQkM0MWpmUTlheEpZNTZxSnFkQmppMTJ3MW1FUVVhaUNJNm9u?=
 =?utf-8?B?SkpEQk1HR0NrM0tQcWprbkFMbEFiQnp0Wnc3aHNyMjMwblZ0VzNUdGVtRW5v?=
 =?utf-8?B?aUE1OXRSNGh0TXB2VWNYQVN4UmZac2RKTjVVMGl2aHBMdHdOa3JjQWd3dFNw?=
 =?utf-8?B?MVcxRWZNQ2dUN1I0ZEMwajEwdm5xY2U1Tlo4Y1F6aVgzS3dtM3VzdU5aQXhm?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0123ecba-551d-4990-dd6a-08dd8f3bea5a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:56:05.6502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr2ysVpzxISoVj+04H5Fa2NP2uMHdDw366stELB6v3mEip2sJwPGlJ7Ci05YG3/8IF1QduzZnfj0K0Bw5Ns/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
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



On 5/6/2025 12:26 PM, Zhi Wang wrote:
> On Sat,  3 May 2025 00:07:56 -0400
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
>> Add explanation of fwsec with diagrams. This helps clarify how the
>> nova-core falcon boot works.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  Documentation/gpu/nova/core/fwsec.rst | 180
>> ++++++++++++++++++++++++++ Documentation/gpu/nova/index.rst      |
>> 1 + 2 files changed, 181 insertions(+)
>>  create mode 100644 Documentation/gpu/nova/core/fwsec.rst
>>
>> diff --git a/Documentation/gpu/nova/core/fwsec.rst
>> b/Documentation/gpu/nova/core/fwsec.rst new file mode 100644
>> index 000000000000..bed941ac3f2b
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/core/fwsec.rst
>> @@ -0,0 +1,180 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +=========================
>> +FWSEC (Firmware Security)
>> +=========================
>> +This document briefly/conceptually describes the FWSEC (Firmware
>> Security) image +and its role in the GPU boot sequence. As such, this
>> information is subject to +change in the future and is only current
>> as of the Ampere GPU family. However, +hopefully the concepts
>> described will be useful for understanding the kernel code +that
>> deals with it. All the information is derived from publicly available
>> +sources such as public drivers and documentation. +
>> +The role of FWSEC to provide secure boot, it is running in
>> Heavy-secure mode. It does +firmware verification after GPU reset and
>> load various ucode images on to the other +microcontrollers on the
>> GPU such as the PMU and GSP. +
>> +FWSEC itself is an application stored in the VBIOS ROM in the FWSEC
>> partition of +ROM (see vbios.rst for more details). It contains
>> different commands like FRTS +(Firmware Runtime Services) and SB
>> (Secure Booting other microcontrollers after +reset and loading them
>> with other non-FWSEC ucode). The kernel driver only needs to +to do
>> FRTS, since SB is already already after reset by the time the kernel
>> driver +is loaded. +
>> +The FRTS command carves out the WPR2 region (Write protected region)
>> which contains +data data required for power management. Once setup,
>
> repetitive word "data" ^
>

Fixed, thanks!

 - Joel

