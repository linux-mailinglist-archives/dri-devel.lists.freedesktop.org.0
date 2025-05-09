Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB4AB1E9E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB110EAF4;
	Fri,  9 May 2025 20:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FP2Af3hJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F161410EAF4;
 Fri,  9 May 2025 20:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifVp3yO8qDAFOdbLXPAVi/YBWD+d4cPqYajpFfYlz0FyyxMEcW3k0exIQtQrs8Wav1t9ImyB5fWUv5QRzsxbq5iyQOWUsGgDeKAZ4hiJvQUFt7TluXJV+AAV3X4t3qvr9upaxB6+76hEWrB0AWA+KMLQeQy0bIUgsRcDR0Qdp2hxCxwUIe0O5JLfAgqnmQasSIa9kSRLB1Qr9Tvprw3yUqAkX6G4pR2e2rEWIbZqa1bYLCJ7f+zOhiO8gOs3RXH3LDBNe2leMbd/Y6lvIc2fUy7yJMagzu1xONXofK8oTEnlvivDCm9G2pwBll1RAOLWTQYOxU+ewiHDItCXGDonZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/pSELMOTkPs6jsY9OJvAa+TAjJ+DC7exKbV0/9PNk8=;
 b=Z3DDXvJ84m5o2adB+G6pQmKlO0v8fVsh/J5W2GCHv+Y5Gl5wL8xUMv6U89ObbMrwgX6b4FYtaCgqDjUz4rVPjVjdxyKGAC7LMehX3z9dyTerllQqUrh+1x53JU4/OG7hwuVhDROi5izzbYzxACOoWZqoltetLn+wltZDckf/V1KnEcDDZb2/9WfWrs4PLE+YXnz1s4ece0Xi7isIOyr3Y/Y0Li7NuphUDc5ELutFTwMEclBHtBxc1P7b+xc05ilzZQE8+LnuF5MbQEbOXgwKLMcGjFQqT4QoRvfldoCASDDqKZADFpZOZyE0JOzueZK8mzsrSAPA0ROjweXuOzks9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/pSELMOTkPs6jsY9OJvAa+TAjJ+DC7exKbV0/9PNk8=;
 b=FP2Af3hJKPVPR0xNWobhqvgI1HqlLqPgUal8y6Ho5JvFumiYPMzkzHekqOhd2CM6UHitR37xlz2snXWtRWuHPBFJihlLXqHqBFnoGv0UQdAsCYJY0B4C6PTkDp9OpBZ6TNFcSnGI1pN99iss9Aqz0UyOSnQNk/1H0RGQHWZ+wgqhEMMb4VJgYBXvv0ULojBeBRkbRp9ekEg62sWjjwnqY58EoOd3fNhzRosW3Tkf56rCN6UdIoG9VUXEcKtLdAvKI4aaOZEkD9D8JtDo1lCAwGlh6LKUZwfZ0e0XQE7sZstYNLo1EP4rlGZhffx3q3fxFjz2TkOKKjYxBvWcgC03gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 20:59:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.035; Fri, 9 May 2025
 20:59:30 +0000
Message-ID: <85a62389-7b08-458b-ae87-b4b2b1f699b7@nvidia.com>
Date: Fri, 9 May 2025 16:59:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] gpu: nova-core: Clarify falcon code
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-8-joelagnelf@nvidia.com>
 <20250506192138.2396aa96@inno-thin-client>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250506192138.2396aa96@inno-thin-client>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:208:530::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2a99d6-2013-41b0-3217-08dd8f3c643c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkEydnNnLzJxREN4d2NVN1dhWFkrWWlzQUpuaHl5WFpDczdjTjdPN3hVdC80?=
 =?utf-8?B?enJiNG45dUFOWnJUbEFCOGswYmw5Z0J1eHZoMWpUSktZbi8zUTVxamgxWlc0?=
 =?utf-8?B?VmU0MFN6MklEMlBaWGhVa0RlVmFZMzRhMExMc3p1TGtPSWRIa1ZzWUlHekdZ?=
 =?utf-8?B?V0JURm0ybFRlZGl0VW8wT2I4bzV0U2M5WjA3b3g0YlJCVVRTNXU5U0NrNVA2?=
 =?utf-8?B?MURWa0pDTVZ5elpyUGVDY2J5TmZyeUtDMGF2NSsyQkNiSU1Od0plcE5yenQ0?=
 =?utf-8?B?S2JZV3B6RTg4eWEzcXV6V2F1dEcxTlIrempCejFJZUFqL0owb1hjUHViQ1Jt?=
 =?utf-8?B?WGRlU28xM0ZJSmxiakg3RTFyd1BFM1hRelVVODJMb0RoaHZ1NVNnRXJQWVVv?=
 =?utf-8?B?c1JDTU9qSmFwNTZ2NG92NklzSElGdE02Y3hxVlRmc01XQWcvYStCYUJjSnZi?=
 =?utf-8?B?ZnpKV3h6R3o4dHZmdlR3UjNTcVFNMThxazBMQk1tbGRDOTZ6TjZPQ2RrTXlL?=
 =?utf-8?B?eEtEclExVEZXclkvSmtlektuWXI2T3Q1TDdmb2JHVXN6dGdVeG93UXVXQjRR?=
 =?utf-8?B?TmVvaFFqdjVlUUxTUnFTdW5MWm9uY2dkTmVFWW1qTWZuMHF3VlFkbC9EcTJm?=
 =?utf-8?B?SE93VWNmME9FYlQ3RjFLRFptcHRsK3BYbjk0QVhuNlJ3YjMzWHZHc3o1NnJK?=
 =?utf-8?B?RVVVdWp5dmJXSmpkdG5MR1lqaWRBbnN5STI2NG5HNDhBbkJvY0RqU25rUHE2?=
 =?utf-8?B?WU5lOWg2MWkxb0RYbzl3eFhUTGtEdkcwanNURVV2dWF5TkJRaUJDZTFPTEhv?=
 =?utf-8?B?S0QvcTZ2RVF2bkxPVzEzSVExRWFWTE00aFNCVEhOR1VoaEswckN5SGRDWHY2?=
 =?utf-8?B?WDZnTnpoYjNNamorQkRaZFMrQkF4WkZjK2U1SlBOZG9pWlUxQ3Z5K2l4MnNl?=
 =?utf-8?B?a1F5VmM5NjFmd28vUnhseFFiNldlenZIcVZ0QVhsdFhwUUVOdEZ0QU9Bak96?=
 =?utf-8?B?dUNQWHVlOTF6YWMyODFNTUxzK3N3Q0c0SGZiQ2lrNXpxbnJGa0F1TTNYVFc1?=
 =?utf-8?B?SGZBYWZaWjhadEd5MVFZVmlXMGRidHR0SVpDTlJXbkFacVV0dFFTcEJhYWZ3?=
 =?utf-8?B?MmFsYWJjSzBVRFBhdG1OOEgvOWw3SnZRL20vNHJ2eVJBWDZ4WmR4VzZMVHhO?=
 =?utf-8?B?VUtGckIyMy9saG8vZmR1Z1FmaGF1MTA5RkYvd2UxZmJHUG9XeW5uTmNBSG9H?=
 =?utf-8?B?QU50dHIzb0E3VFBUQTRSKzFOays3WFRHMFptT2NoeVV1ZUNrWUxWcGxvMkVK?=
 =?utf-8?B?aWExS2RheEN6YWJwTnJoeUJ4SkJpZW41SlFhMWp3T0VwVFRMVGMyMUt5SWo0?=
 =?utf-8?B?TG8wVUt2SzZ6M2VPSitmYlpzMVQwNVZTMWo2ZlBFMUo1aTNNQ3dFSDFNalcx?=
 =?utf-8?B?NVBkVW1YVG1SZWhFeDZWWWN0a2U0bExtN3ZRNy9sZW14ZDNXbjVoWlk4OUEv?=
 =?utf-8?B?ZzZtUi84elFmc0hNMTFwQWRCQS9McitFK3hIcjlNb0N2N1IzQmgrblNqYkhX?=
 =?utf-8?B?ZTgreGlpSFc0SXR3K0FMbWFHMWxjeDQ2ZVg3Q252UHh5ajJXMS9QNWhrSFVz?=
 =?utf-8?B?QTN4VFMxSlpybjRCWGVKb2ZNT3VtWlpGTE9NMk9sc1g0Y083WXlLQjBTaklB?=
 =?utf-8?B?WVpjaXJCaWZsWSsyQlU5Kzk4QnYxZTYrOXp5M1pjMS9KZnJPMCt4eVppN2Fv?=
 =?utf-8?B?WHJQYXRQQVpFSXo1YUhHSzZ0VTNoNzErSHEzdks0dWJHdUY1RVdMaTY2akdx?=
 =?utf-8?B?MXpacU1Ya0dhLzVnZjVyTE9UaHY4b1hrVFA2cnFaUlUyWktBcEFRbWtWWVp6?=
 =?utf-8?B?N05UaU1UWklhNXV6cFpLZ0M5TVJaUG13aDNMWTdrTVdJK09HTDVXTFZqLzM5?=
 =?utf-8?Q?45DR4e1mX4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1OVlNjWHZWbUpZTmJnR1laeFNvZE1yNmIxQVVqU1V2ODN3QWE4cWF3OU1s?=
 =?utf-8?B?a09sTGV5UDBjOEM5NXdWeWhZMDVUblRiZjE5U1dFN2g5Qlp1ZVZkam1wbzBp?=
 =?utf-8?B?TzA4dUZ4RDFUa1hPZ0lPSVhlM2VPeFJSS2pGOHNVd1FyK2RNRC9vUWlXL2g3?=
 =?utf-8?B?ZCtTdnFOZW5aWGFrdDRCQmJ5RUhleVFrdktBbXVOWnJJT2pKMlo2dkN3emdm?=
 =?utf-8?B?MjQxRkQ3dlowTm1rVHFCbmZWMFk3cmJjQ1B1enIzdk9pSTNSTXhUZVFqUUFt?=
 =?utf-8?B?dVR1QTR3UWZIODVmN0tzVDQ1cXVucW9OZEJIblEzRHRQdjN6SzRZKzZLZlZX?=
 =?utf-8?B?QWN6RlFYclF2T3lkeTU1SUl5d25zeFhvQUpjREszTk9OcmwzbXdkcmNTalVB?=
 =?utf-8?B?ZnZzWE9DcnJoeDRkOXYwV2pIVHlaaVpHQUd3YmJLRW9ZZnhyM3Q5VXpSbFBy?=
 =?utf-8?B?ejFSbi9UWXBqOEhtL2VTcDdRcmtoczFPckc4ZkhJNkk5T29iZ3BUbmJNWVZs?=
 =?utf-8?B?NVp6TXRMRE5Fdk9CVTFqTFZ4RENWMER5T0xiMEpGZHMzNHJyY0xZQ1VhemVL?=
 =?utf-8?B?UEpjZlMxWFdqZnMrbHE0ODJEZElNNjlpeDJOR3MzMmlQSkFDdm9lT0FINzVY?=
 =?utf-8?B?dXVuRU53dnZaOEhaVFFIRFNBWlFZZG1lb3VvanBsUFFza0NoaFlQQm13eHUr?=
 =?utf-8?B?eU1aVDVkM09yK2VtZmdEcHNIYmQvUURBZmxndk9nWDNqeDB6T2J4ZGlCMXAz?=
 =?utf-8?B?NlRpOENTdDZ2QVE1dFkrVnhud0QxRFVLUjZHSUpybyt4NG1KTU15NUFBQVJt?=
 =?utf-8?B?RlpXY3V6VWsxZ2tzUzBDc2pJUWtyTTVvYURiY1VYSUgreTlOaFppTUptdWVI?=
 =?utf-8?B?cld1M2RFdVN6YlJRclF6THVicEtvOHJ6T290Z3ZlQjc0MXBFSS9qeUp2T09u?=
 =?utf-8?B?Vk5iZmQ3UjdKTHRzZkVhaitEeWVVZzJLWlFORFVyYk1OcWdRZjdncUIyOXdw?=
 =?utf-8?B?R3NBaWE1Tkh1WUYrdnpRd1VHckN2eXFyb3hmN0FEcmNBVGY1N2cvZFcyblN0?=
 =?utf-8?B?RlJmejd6WUIzaFBiQWZKT2lMVGpTTXBtakNTYnNRV3dzZlpCbDU0cVk5V2c2?=
 =?utf-8?B?cktjM1dyYzJMdTAwWndZdzBuMEcwR09valpRTkc4dTRtM2tXT1REMkZQV0N1?=
 =?utf-8?B?UEhNN2xqRmd4eWVQR2s2enJ2SVJHakhMczFUN01YcWQ1b3cwQ3E5QjhpbmEr?=
 =?utf-8?B?T25sUXpVS2FDNzZKcUFtaUdrT3hEUDlUaW5EZkxZT2xMVDJWalovU0dZZXkr?=
 =?utf-8?B?VTFWS0taOFJScGhpdTZJeFhUK1d4b05CQm9OUHFYdnRKQzM0anp0bVZMaHlP?=
 =?utf-8?B?QVpNT1ZZcCtqZVVaRVk1R3gyZ1JudXFFNzRka1hZbzZ6Qzk2SGc5QytzWlRl?=
 =?utf-8?B?ZzZzVVlMT1NqektUZDdJVFZVeEtRQU4wYzdWVWxralhPTE5SeEJHaVFtd2x4?=
 =?utf-8?B?UEozZ1ZmcEU0dnBhaE1BVjY2Yjk1TU5nRWV5S3ZXemJ4UTFuYk81eFh3S2V4?=
 =?utf-8?B?OTlDTmdlVG5aczNqSUF4NHgzQjhHYm44K1Rqb2t5Y2VibFZwaDBxdFptMVlD?=
 =?utf-8?B?MjVRM0R1cnhYNnlyYmozanZBQUVMOFdjK0pacml3VnhPMVJ0RzlHekdiNmFK?=
 =?utf-8?B?ZFA5cUxjRVlIT1p5UTZnWVIvN2tKNVZmTHhWNVA3Z1lOYTl4Vi9VT2h4SWVI?=
 =?utf-8?B?anU5WnY0N1UwN3NrcGxIL1ZKZ2IwZnU2dU0rcjliYUUyQml4YmgyejBaWlVx?=
 =?utf-8?B?R21pZVNFZ3ZzRG9KcmtSenZjY2U0c3Zld3pQZXd4VXJxdWxmeEErK0psSWEx?=
 =?utf-8?B?S1g5OTArNHNFeFphREVXOGhCSXJScm9YY1p6WUxpbi9VWVMwMlJtZzFGTks4?=
 =?utf-8?B?emtCZG5WV01abWc4ak5VbUlLY3hsWVZkc0RmeWtHa1lkUXZzL1lMK0NlQ2RM?=
 =?utf-8?B?ZkwzYUk0NzBsQXE3eGFwSHAwTmZ1eHRaM3l2Smt6NjJacHZGLzBUcVlVbEVq?=
 =?utf-8?B?RXNNZXZ4V0Z1bnVXV3pGcTZqTlN5NkZpeVJyTjdxamdKZ1VDd0t6YnlDK3Bq?=
 =?utf-8?B?eDlqT3lOa3RUNVFvSHF5czZacHQ4RHVGR1RRWFkrWDRTakp2ZThzeGM2M24v?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2a99d6-2013-41b0-3217-08dd8f3c643c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:59:30.1096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruMkJOXw5m7bEi064MG3c5a4Z5Ab4J6khxtlPfB4joqAR7erS+0kve0pv7WHrKL9TUGO8kdSCjDuTCRo2MxdmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
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



On 5/6/2025 12:21 PM, Zhi Wang wrote:
>> -/// Target/source of a DMA transfer to/from falcon memory.
>> +/// FBIF (Framebuffer Interface) aperture type. Used to determine
>> +/// the memory type of the external memory access for a DMA memory
>> +/// transfer (by the Falcon's FramebufferDMA (FBDMA) engine located
>
>                  Should be Framebuffer DMA?^ So that it will be aligned
> with PATCH 6. 

Makes sense, fixed it and thank you!

 - Joel

