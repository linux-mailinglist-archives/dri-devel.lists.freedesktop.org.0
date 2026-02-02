Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF6hNTclgWnsEQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:29:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36132D2242
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B7610E2EB;
	Mon,  2 Feb 2026 22:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iBrlx5Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013012.outbound.protection.outlook.com
 [40.93.196.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74310E0BC;
 Mon,  2 Feb 2026 22:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfEmHX04zu3/A6g8K3E3NyOKqY8JFhC0PYlnf9GJrFbDDcP1lzc9t6QWBDtsah+Eszmf6d1tsDGYx5ZcuPSGc7VCE05x+NOOYBOUmGDnIeAFwI0RAO/K6OjvJWy8lgphw3F5gZIH2rJOnlP7CUzCbQYauIF+StyGLofnAeWy6fCNDw+Y8uLDWAxyiPc8d1v+at29KRFpWd8B8NLATERcWrj0I9eUwrlOHhZ94ZGQD9bKhIyLmd/X5qy2hVg78oO3rrD5T8zyov1ZEc333wHXnhfKoIby+qMd5zR7XeTSBXJgB5H/X94p9aBCEWZarZFwSMtsCLKXoDqP8uE1b6Kmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UMkVDOK9Y8CUvegwBRMip4lcBr6e/wy2g/gsCW/JzA=;
 b=nNVe2ChK5oFH09TlALgQOsiWlBuf+LGKgRqkwy8H38TftTW7SEBH42AhuIJc7olHZDM3FrxVzDe8DI5YBMMZikKvdiG240XcbwVcp4J06GlTMryPJ3uXXM1L5BC6YYcUqX5CNU8Y2AsBAH6oJwm6oXOC0LBIPLTDvPw7dnq2qOkeUjYa/L1Rn6qGIN/aQ4VUXFOdxNCxAivnbrNI4OeH/iSKsNoHpVVR2c8pZ8IGY46NFojKYYiF8ODJOSrdzlBUw8HqZ9DlsWy5roNsC9oVYo8iWbU3n/auPWurGn8A+gyMTGqr9ikmGVhhWv/ONT571A5920HZTcV1083TLDd15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UMkVDOK9Y8CUvegwBRMip4lcBr6e/wy2g/gsCW/JzA=;
 b=iBrlx5ZbOgpz/a+PBAwF+JH9dQAbNa757fkN8LpNNdU23XvKRKopoItLYU0+FsCGb+F3lXv+NjDPHuDQ+yVdr2BpAowp4Shi6MlNE1E2I3EvnXOKt8nTD+1buCAy6ggk6MP0srRB81zOroCQ/RUpWKODzURFKZrm4P5oJDabRAsjOKF6qdWwAt5J6id0A/0EdhOODG8scu9fA8sqwNVR4gJge0qWOoKIMWPO48EzoNYtDM/B6Y3ar2gjaKiXEW6UoJvBVgN/xDro+8Z+Sl04R03TzfAT2E1I50IlmKpvi1R49O5iQqrWYRj7JUTTztj8D+Esv+j1Opfi1+2Xas6Ocg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6827.namprd12.prod.outlook.com (2603:10b6:303:20b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 22:29:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 22:29:00 +0000
Message-ID: <a5b71dbc-9e3a-4098-8821-21a9a02ec235@nvidia.com>
Date: Mon, 2 Feb 2026 14:28:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 2970fdf5-a87f-495e-26c5-08de62aa763f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1k4UkFPbFdTTDYzYmJ6RndaQTV5dTlZbFYzODJ1OFJaeXFjY0U4L3AxTzVq?=
 =?utf-8?B?T0dkMUlhbGtkejJOV1pXYkJqMmpnS0VGeEo3RVJlWmR3Tk9QMHlWb2N3aGQr?=
 =?utf-8?B?amNNRUh6VVErRTFHV1BmUTg4TXpVd1kzWFdITmJRdTJXSGRiTXhoKzBmQXJV?=
 =?utf-8?B?aXhZWlgwTStJelRvOHpYaVZyN2VZSit0Z0YxREN6SmlSMkVpQkpXa0pSZzI4?=
 =?utf-8?B?K2hLM2VOcmtNOVZhQUVLbWpFR3htdXRhMWQ4bXFuNkNLTGVRR3BydEYyd01y?=
 =?utf-8?B?eURWTVhyNkFUUWlCWTBoSFJ4VTNsR2g2SEJwQjZhZTJKODlpY3U4Z1VTWEY3?=
 =?utf-8?B?Yk9Wb2V4QUhjc00vblNxSmlTczJsbWkrNG5tU3NkUmZZSUVGclN1WFhSMlpv?=
 =?utf-8?B?MjdRbUkrWVdQQ2FoNlQ4ZGJUdTZOSGVJY2JOazlaQm52SVhWRDNwbmNBd0Ir?=
 =?utf-8?B?WCtQV3BNOTdyYmgzSzlPeFJ3bUFhVXRPZW8yb3N1OS9HNXFadkFNT3E0VmRL?=
 =?utf-8?B?ZDdRSVBYTThQd1o0S2MyYi9PSXA2eG9za1FTM0o0N3J6SnlEa2FnTnRDcGNZ?=
 =?utf-8?B?bllIUXd5UU9YRElnQ2FQaEhQc0x6Z1pwclI2Q0dwQm9kUWJBMWQ0ejUrNHVu?=
 =?utf-8?B?cFFPZzdTYkgyUUtmallKM0dubDN6amtyblgySmN2Ync2TmVZMlRMSGtCcmlv?=
 =?utf-8?B?dUUrR0JHcllGRTZpdjB4KzVmL0tmajFIc25La3VJa0R6TXJabUQzcXpSdjE3?=
 =?utf-8?B?dFNiNnRCRVNCblFVM3NOUzJVNUxsSlQxZW03NWZUY211Q2VxSDZGc2ptNnVU?=
 =?utf-8?B?Ymo0WmZZTUFOT285MXdldVljbllaNHcyNmc1K0NzRjJ3MzM2clRwdWNhNUd6?=
 =?utf-8?B?TTltQlhYN1RJeXRmeFRJTjlWNlZuZi93SlA3OEdzZmVvYWoyMVFuWXpmRnFY?=
 =?utf-8?B?R2hzcElYSTBYR0JHL3JTQTJhOC9BSWpiQ28zaktQS1F4dHJHblFoRXFwY2JH?=
 =?utf-8?B?UmQ3ZjBqWjM5S3VzcnNNMlBCdFZsTjFQbXNTN2tUalJqR1NMTkFCb2lseWFW?=
 =?utf-8?B?YzRaNncveUFOOEk5OFMySEZoaitWTFNReTZtNGQzdnZIeHRyM3k4TVVUUzhK?=
 =?utf-8?B?REFkNXJidWt2eGNwVUhFb1F6aDNOa2NBSllVblVGMWJ4cWtSMmhKMDl0M3Q5?=
 =?utf-8?B?S1hqbGJNSGtZTERFTjBtaXY0STBtcHNLUTR4Vlh6QzR1czF1ZW5SbVRwYVR4?=
 =?utf-8?B?Vk01ZU92TzhlZW8rYS9QTlNHTEhtTGdPQzByOENJTVJTWVV4ZDlXVmprTFJP?=
 =?utf-8?B?c3pMOEZ6c3RneXo3OHZmdm5FZkZOamRIeWJ1Sk9rZUFaN0xmVW1OUm5SZWdL?=
 =?utf-8?B?SThzZXBHQnpCaTNXblViSEdqS0laUndDVmxiblNqZGpTdGFxakFld3QxT0ds?=
 =?utf-8?B?cEFNLy9OcEJOTzA4Y0xRM3RCcnU3YXlQUlVxMS94VjNZU1BUNHJEdCtkdzVW?=
 =?utf-8?B?RGtCYklOcG1taHlmNDcwejFFSW9aQmZLcndRRW9wekFYcWNpWmNmTkdzREJB?=
 =?utf-8?B?L1h1bDNjNUVBa0ZSUG1Vd0VFWFQvemYyS1l5OHRIdUkwVENnUHl1L3NWMFls?=
 =?utf-8?B?eGxoRHVYbEsrd0RtUXN4K0hBRnFpMHpkNUFpS2hlY0xDVDFVMkJaanNucjJE?=
 =?utf-8?B?Y0xiUHl6OWoyeUtjWGo4dXhDcENucFp2b2s1VWtRTzhnc1AwVmlpWkhUT2ln?=
 =?utf-8?B?bDBFUmVrWU42M1RNN0hoc3FrSVE5WlY5bGF0Q0FVNUorc2NHWFJxdk5EUWpx?=
 =?utf-8?B?Y2dYd2JlM0YzYlpUamluZllmWkVBTlAvTW5ubmJLLzZ3VSt5ZVRwVmhLUldv?=
 =?utf-8?B?UzlYa0JkNUplVmFieHJrdnpqV1NXcXhYZ2cva2x1SUhkSk5ld0tQQXJhNlV3?=
 =?utf-8?B?R0J4YkNEZTdCZXAxNWljNWFvY2ZEU3grZVU2SG5wZUZIeXV6MlU0aUJjcnJq?=
 =?utf-8?B?THNVZjJTM3BUaU1SMlJ2TzcreGZ1NzRmT3hSRmhiLzlXSldUZUNOMGZiUE5p?=
 =?utf-8?B?b0tqSElNN2NRZnR1UzBmZ3JRdnRsSWFOQ1hleFRCOUpZVEtOU0VTd0loZ2pX?=
 =?utf-8?Q?vhXE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm4zMHpjenNOb3BCVTQzWkJtb0NHSm1XVDRCMlM3ZjMzQzZENEVtRTF2RFVt?=
 =?utf-8?B?d2duallnWStqbStmK2JaOXpCVlFWL3RzRUQ2SC9NR2RlUU5WWUsrT3ZVQXRn?=
 =?utf-8?B?NVMvMlhMM2NMQkZKVkJBMjFqZC91dktvL0dQazFtZUVMMndlY1g5VURXWk1q?=
 =?utf-8?B?Z0hqT3l0SGhVZXhVczVBeGlKL0ZwaXBCYXpCTUFZTHFIL1BVd2VOTnBLNmdH?=
 =?utf-8?B?bXd5TnVXL0tDd1pYRjVHQmRtMGdkNWJkcnhjV1JlZ2NCODdzaUhmaCtKMHlU?=
 =?utf-8?B?QVp1NGQ5VVVoYzQ2TlZ4QWUzMTlDZnpCVTBwbXI4L0h3eHlReGZLdEtNblhw?=
 =?utf-8?B?RUg3MVRLbjlNVFptM0IwenZIMlVZb093ajYwY2FVOUJLVmR1SW5TcnEzNHBF?=
 =?utf-8?B?d01ZU1hQbkdpWFZnbTdKa2xZZjVPQ1lsdkVXaDRBTGp3c0FUb29TdkdlMWJU?=
 =?utf-8?B?ZVF2TUxKNUpoR1lBSDZUUDBNWWlaMTVjdDNjbUt6SVJoN3g5OG1veEtvWnRa?=
 =?utf-8?B?UllwUDJaNUMrWnp5Z093UUFVWjc1emx3V1FWTlJ4NWczNndsdmhJZUFucUJs?=
 =?utf-8?B?RFpBZXhyWTBCNFpDOGdNOUMzOGdQQmEvVFVxNTM4MlhiVmdieEFRTHdtQmFV?=
 =?utf-8?B?eEpCY0ZOb1Y1MHpKQTZhTS9kOUc1UEZ6dDlLS3l4cVJQbW5RbDk3SGpNeTZT?=
 =?utf-8?B?b1Y5WlZxSDl3MVBRZmhSZk5sOEQralowVGdaRHdkNEpMRGJvZUZtK2Q3WVFM?=
 =?utf-8?B?cm1BT3A2VFhCS2tScHpmV1hlcWFsdSt6TlFKbFdXNjJCNm1kRlNhcUtmdVp0?=
 =?utf-8?B?OUdDUFZqUFQydVZwaHdEVksxV1p1ZmlaMEU4MGhaZXhxWHJOSW5UU2ZHMUtz?=
 =?utf-8?B?TVhzajdTd1pqL1gxZENmUExacUJSUmU3Y2F2bHhteEltTUFUdzdtYjRMY0RL?=
 =?utf-8?B?czF5V2MxSURvZndFNUIxZ29iZlorMHpYbi9zMml5Q1k2ZTFBL3EwM1dCcWx5?=
 =?utf-8?B?QVJkWkpQbzhGc2lUczQ4UTZPMEFiT3VNMXZMUkd3b3BCa1ZUVzBJN2k3S1Q3?=
 =?utf-8?B?OENQL0ROVDI5T1Z4RHhtRmNUR29zWG9NUVNvclBBSGdlVEY1djQxZEt1RWVW?=
 =?utf-8?B?VTI4NFBDeW55eTJYZmlDMzVkNHE0cDJvdlZUL25HR1lhL05zSm9GcHNFSytB?=
 =?utf-8?B?NXl2cmEyektIOE95RVdTTTZpeksycEdnTzAreWlwNU1xQjhzd1lmOUkydGow?=
 =?utf-8?B?c0toL0J4UnNNWDAxajFIUjNIODU0OWNWUGJKcUFQeEIwSWpqcXRMT0VueDNa?=
 =?utf-8?B?SlMyalpUYmkxSXBjY2JFNzIxekhvTEl1Q1BSMHVBbnhvYmZ4MWJJT0p3MDFk?=
 =?utf-8?B?aWMzektRU3Fuc0JHdkY4WmNpWCs4VEF5cGEvNVFOYm5mMzVxVE9HRFFBMVFP?=
 =?utf-8?B?SUxGZE1HL2FvVFJsV1JmVVQwUFB5VG5mT014ZWdGcXh3a3cvVmRYYlprcGth?=
 =?utf-8?B?cnlKakR6RTRZQ3FGZHpwU2hBTW80dmRtNFh3WmI4aDg3N0Z6QXFuQjNnMVFL?=
 =?utf-8?B?bjRrbWYrdjF2NklWMTlCU1dmZHZVZGlsNnh5WE9Md3R1NkllVDEyZU53blR4?=
 =?utf-8?B?MHM3SDduSHdFNnJ3U3l5T2Q2dG5CYlNYaFFzY2RadnV5Y2dLZEVOendvWnZt?=
 =?utf-8?B?VVQ0YlRBL3RYV1d3N1Jrc3UyYUM4QVQzbkNxNVc3RGFSbVd6NnI3eU9qR0ph?=
 =?utf-8?B?TlpJYWhwd0NsdGdnQkM3cUZIQVBoZFFmV0xNWXBhSnZjWDVqdlNUbjZlT0Iv?=
 =?utf-8?B?MVlGV3diYjBIRGFON2E5QXpua1Y0dHhYV25JMmgwTkRJVE96YU5lTm50ZmR2?=
 =?utf-8?B?ZUhTUk1yTWhGc1pkNi9WWXpjTHlTZzRjOXQyM2VYZS80V0ZQYml2WjBUbWZq?=
 =?utf-8?B?bVZLKzlid2dwaEpHY2tjeDNFM1BFS0pDNGl1cFgzOVQxM3FoRWNVOE1xMDVt?=
 =?utf-8?B?cUl0ci9wa0JYRGJJYnZiTndFN1hFcnhmUkY4MWJoeUdGMWdGeEo3VVpQUksz?=
 =?utf-8?B?dUpIOGlEckVESlkxZHB4RWpsUHZwV0tVeTZZakEyeEo3ei9kVjUxeVg1Y1J2?=
 =?utf-8?B?Zys2VVhXVmIwYi9xamt0dmpiWE9NVy9iQkFhRkE2c1VGTHFmK1B1RUw2NUI5?=
 =?utf-8?B?UXdaSVJrRU8wNGV3b2ljNHpKL3BSODlhNWE4NnVPZHN4ZEZPcys5TjdqYVo2?=
 =?utf-8?B?eVE1UmZzWGp0V24vczhzaDgzSE5SMG1zMHJoclhpblYvQnJEaEZDRHdpRHV0?=
 =?utf-8?B?SCsvcUlSc1NnNjlVWXA2T1hHLzQvaVY1U1dvZWt2UExPUStPaTVYUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2970fdf5-a87f-495e-26c5-08de62aa763f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 22:29:00.2818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwi6FGeMNyWnG5rSsJUFPRhIKtot/3yiVQaRlDV9eHdspy/Q6fHp6YgL/T5AT9hbkKqtj2GHHxdFP6yYMANGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6827
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,intel.com:email,Nvidia.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 36132D2242
X-Rspamd-Action: no action

On 2/2/26 1:13 AM, Thomas Hellström wrote:
> On Sat, 2026-01-31 at 13:42 -0800, John Hubbard wrote:
>> On 1/31/26 11:00 AM, Matthew Brost wrote:
>>> On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
>>>> On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
>>>>> On 1/30/26 10:00 AM, Andrew Morton wrote:
>>>>>> On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>> ...
>>
>>>
>>>> I'm also not sure a folio refcount should block migration after
>>>> the
>>>> introduction of pinned (like in pin_user_pages) pages. Rather
>>>> perhaps a
>>>> folio pin-count should block migration and in that case
>>>> do_swap_page()
>>>> can definitely do a sleeping folio lock and the problem is gone.
>>
>> A problem for that specific point is that pincount and refcount both
>> mean, "the page is pinned" (which in turn literally means "not
>> allowed
>> to migrate/move").
> 
> Yeah this is what I actually want to challenge since this is what
> blocks us from doing a clean robust solution here. From brief reading
> of the docs around the pin-count implementation, I understand it as "If
> you want to access the struct page metadata, get a refcount, If you
> want to access the actual memory of a page, take a pin-count"
> 
> I guess that might still not be true for all old instances in the
> kernel using get_user_pages() instead of pin_user_pages() for things
> like DMA, but perhaps we can set that in stone and document it at least
> for device-private pages for now which would be sufficient for the
> do_swap_pages() refcount not to block migration.
> 

It's an interesting direction to go...

> 
>>
>> (In fact, pincount is implemented in terms of refcount, in most
>> configurations still.)
> 
> Yes but that's only a space optimization never intended to conflict,
> right? Meaning a pin-count will imply a refcount but a refcount will
> never imply a pin-count?
> 
Unfortunately, they are more tightly linked than that today, at least until
someday when specialized folios are everywhere (at which point pincount
gets its own field).

Until then, it's not just a "space optimization", it's "overload refcount
to also do pincounting". And "let core mm continue to treat refcounts as
meaning that the page is pinned".


thanks,
-- 
John Hubbard

