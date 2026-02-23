Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLcsI3XJm2m56wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:28:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7117184B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622CA10E038;
	Mon, 23 Feb 2026 03:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="koKDrV2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233CE10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FujbKHUv4XrRiL0N24Vgd19CfOkR88tx+tDzR+UfhRkt21RR9DL8mF238aGvzeOPBAWra7eCVcWqQEV4DynWgpkyRekv6+8R1Xrn9Fj3Fy0QRs4PolmqcYznzRV9/x594GkkhOEcxMUMZQ7sBo2YmvUlcS2tQxJCWe3MosII9y28v8J2GCJwirB0op7NvXQ7ZognEVdMME+xXJKQVNHInyfNFMVMnQwT4AU4jLeEgyEttxdwrW4dXk9ltWoA2IW+HXq8KMS3K9p+TLKGQZwuy5VA62xfyUZuo4NgA7ME1TqPVnPOpTUTK7iVfcvImIYa4a7HgBRwD3PFY1YQ7EB8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4I8Fw09M6BpL8BEzycALjDTQVg+sAZljRgrR/y82Dw=;
 b=YyectcXIUI90N8F1ysY3aehByeHV+HleiK/YY4AuKAg1yagteO2f8xqWNMjT16wZgDas2QgDg5iLbNpiqF3vgteYgSdi4Dl0b/A/3kid81yCWZ2j/zZLcIl3c+Sh/5kxpnaeKLSCWhG65514BNY5p8jwlwNOXLoRx5i7QW771a5nMXZfl+VzoNg9RJ9wKUkcNF0pd6mu92q5W8XLougPrMiEBOBUWUDJMTVzcgnUemIlRYEtSxqSQ0ORRqHxds4QuOIqTmmE2wvGhC8zA1cDPj1RJlqevpmZ1rETyIgna5jJxdf7aUxTGttR+2PJcfgU87RosL+31XHgPnkZ3uu8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4I8Fw09M6BpL8BEzycALjDTQVg+sAZljRgrR/y82Dw=;
 b=koKDrV2a5zdHiq8QoknqljTQXURU4/5Cpe3363uotpZGiNhAejntB942HA9z+VspNwe1N8DgW7aoNnyTyXt9Mu57sUk+tzTBcNn7216Igia5lLAmLC9o1y2MXzdwsoVphes3tdItH6MfdSo3iZSldLHsGVGzI2OKUUObyRBVX66Ev7AHInhcwdjOiT2lblsDmawG5SibRIrHYBCXzbWbZepckvB7bA8UxP/+ct8cnuJ46HO7o/NfVXgowbQdS4wwKLIhIllhx2Nr7tQnhjCwMbHqOcMhusH52or2SSlvy4BrYXNWHsynb8yzcicU+r+HMsGI7T0W1CJ/q2pcmkb3Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:28:43 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:28:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jason Xing <kernelxing@tencent.com>,
 Yushan Zhou <katrinzhou@tencent.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Eric Sandeen <sandeen@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Carlos Llamas <cmllamas@google.com>,
 Alice Ryhl <aliceryhl@google.com>, Damien Le Moal <dlemoal@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH v1 00/11] Zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:30 -0500
Message-ID: <20260223032641.1859381-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:208:32e::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f676f7-f50a-418a-0381-08de728ba537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckovbk9zL3Iwdi8zUE1nODhYbjM3b0xQQzRxSDBvSHZvQ3hZRFBQZDZ5NWYx?=
 =?utf-8?B?b1d6cXVWU3VxY2psdVI2VFlqWDUreURLY1dIQ1M2cFlrLzhtL1Z1ek9HUnY3?=
 =?utf-8?B?WXoybksrMU1OYm9EbUwzdjZEdEpGbHdKNURtWUQxUWp1S1VhNE9NSitGZHRS?=
 =?utf-8?B?bFNxaXJiNlJGNDl2WDg2UjFHRlZ2ak1TU2hLdjNydXphVVQvZ0dyUExqcVEr?=
 =?utf-8?B?MURqb2ZNQThQck1yREZOSW1URjJUVzBMbWp3dEQ0VEhCblNxaktqR3dxTzVv?=
 =?utf-8?B?cHUvZ3RUZFpDZ1ZmOW9zSlhCMGtQRjUvNVFSOGF4SldEWUNQNlhEMGxaRlhT?=
 =?utf-8?B?bzhvaE5uSFF6Z1FraUVic3NnTlBVZ0lZNGR1bUlPempNZXNOSmh5K2s2MUNK?=
 =?utf-8?B?dWZIT3NPeFM5dkFrVDlQMDJLeWpwWFRWZHhYcDlIRE44RnFsTHIxUUFIc3h5?=
 =?utf-8?B?OUo1QStvby9MYVhCRjRqeXlKTGttaVhJRVlhR2lKWWVRdkFVZkVkeHRnTm9s?=
 =?utf-8?B?bXJFaWYwbnIvRk5oTktrMHVMQUdFRlZqTDVlWHp4NkE5WWRpMTNtRUJ0M281?=
 =?utf-8?B?Q0ROUDRadFJ6aDZWMVQ5UjN6Q3lEZlVpbytZMTMzb1dtcldmalRwVURkQkUw?=
 =?utf-8?B?eWkzMWVoaVN6ekhQQ2JVY3ZkVDZXcVA5a01NbDhVcDNOM1BjSjVTZ2R2dlBC?=
 =?utf-8?B?Z3NFYm1KT2lnUGthS1dPSmNpaERWOHNiRHZVWjlzc0czZTlueEsrazVmRHBT?=
 =?utf-8?B?RG9BNTRtMys4UHdjeFhtK3lsYlJpb1gxRTFwL29kTzVabFFwSmJDS3Rob2xJ?=
 =?utf-8?B?cWhSWm1ldFRaVFVGNmFkeEFQQkxRUGZobzlwdTFhaHFoZTEyemVsN2xYRHhP?=
 =?utf-8?B?cGtmKzhvajhhNHJXYS9YZXhuU05PcW1MbkhKT0hlUnpJLzA3aW9IM0JPd3Vz?=
 =?utf-8?B?NkhjaG5DUHBkd2hGM09Na2lxOGgwSmZJYWlhS0NFam93N3FCdTRBY0ErUEZP?=
 =?utf-8?B?YXF0eVUzaFRUdHZHL3FOVEp5R0lPaHMwTWdwdWlQVXdWbGFKSHJMamVSbTRY?=
 =?utf-8?B?aXpLV3I2QjN3SHNYZG4vZFByelRxZnJ5T21zc2daU0YyL2t0a0hlck83ZXMw?=
 =?utf-8?B?OGRVSFVBRjROVGtEeW1va3hySXZyYVlDMVVXZWtDa1IxNUh3eXdDeFlaVGg2?=
 =?utf-8?B?RUdzVS9xL2t1TVI0YkpjSVcwSzM3amVMRlk1TzBDcFNBMFA5NVBzWlBoNnBi?=
 =?utf-8?B?OCtxaC9JUWdUdEdQaXE3c1k4aWVCUkxKU0VKblhveWlUMkQ4Wk5ITmUvNkow?=
 =?utf-8?B?bWN3Z3dVVW5ZQ0JjVWwzeFc1WFVqR3BJSGk0NzZvWjJ2RjFmc0ZiZHV1aHZ3?=
 =?utf-8?B?aGpJYzI2TmxHdTRUUXdvTWFDSzlCaEpBQVZGN09PYzdxOTlOaFRTN0MzSlVa?=
 =?utf-8?B?T1h6MmIzSExaalZYbXZINk90bDU2bWRBczFiOUNMa0dQMmhYVG5lR2ZHK1U5?=
 =?utf-8?B?NUpYbjJYRGRBN2xkQklNSzBwWlQ2NGg3SHhEY0NMTEhqdmE3alprUTBGSHlI?=
 =?utf-8?B?M1hPVEI2dzNIMEwxSFF4ZFlMZlFuWENXMmFvSHhjdENpWXpWNEJXTHFaNk5U?=
 =?utf-8?B?RnFsY0RHb2VQbzdaYTZtZ3lkckZOU2VpeXhNcDBXMVlQMzlvdlFSbXlwRnVH?=
 =?utf-8?B?dVNvY3ZBa0tXWUNudTdxNnE4QURvcld0ZkwybjRZNmZvT2lkMTlnMFl6bG9R?=
 =?utf-8?B?WmdxWWlubUN5TlNmVERLY01QN21WUU1ncXZXOVMzRmdmaVNKQjBCRjM5RlU2?=
 =?utf-8?B?emUrWEgzdVBnTzl3U3FCQWs4aGJJZTlTTkNLOVpnWEN3eVJJRjdubzBBQ0lz?=
 =?utf-8?B?UW5SQlpacU5GSnRnd1ZDQVRhN2FwaWtuOW5wNTUvY2RQNHI1ZS9rbFNkWUdq?=
 =?utf-8?B?aTZXbjk1SDFKak5UUVJiaXpNeHFubTZla216VXB0YnhNcUUxSzVGOEJBZjFB?=
 =?utf-8?B?RjRuNFFCSDdMWVVpMmJpcG00TGMzZmNjZ0ltVEZwUkZzMDU0UERVejYrZEhw?=
 =?utf-8?B?cVNBdmhRMUdMQjMzMmgzdGRVNkE4cDVHK3YrNGtRNkJ4ZFVybGwwbkt5ZWNo?=
 =?utf-8?Q?xVxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFhBcWJkL0xTSkVxVS83b1MyTVk5TzZZK3Y0K1MzSldFNkVTZlRFcDJKWEpq?=
 =?utf-8?B?cTRCek9VeFFUUzFUQ1VrWjEvZzNTWWFXbVpwTHhnZS9qcjdQcU9BMDRiS0tB?=
 =?utf-8?B?eEo2Qy85NWRwZ3lvbXNydkM4NlV1emY3SjhDbGVIdGNCRVh6K0paVDBWMzhs?=
 =?utf-8?B?WGs5Y2dZSGpRaXhxS3FMd0VHMS9MQ00xV2MvSHpOS1JzY3VPalBVWmFDUHlH?=
 =?utf-8?B?RDd3TUhta3o2ck9kN3ZhOEI5N1JuczB0bXNJejc2SStodHdUbm5pWUtvWlFN?=
 =?utf-8?B?VDU0eXcvUGVnYlBvcEtBb2M2Q21pSWJ6RTgwTlFieWxqL2RMNFMxamd0eXBr?=
 =?utf-8?B?VkJFR3FKMnNETS9tR2xYT0xsMndRNFp0YVRJbG9mOVhML3lNVVNKV3o0bFIw?=
 =?utf-8?B?TEl4TCtLSGxrN0RLVmNFYUtHWHg5WkxET2Noa0FHT21sREc4U243WUZUSHB4?=
 =?utf-8?B?Wk9KR3Era2txc0dXUFVOTmc4QUNvVkdkcUdBWEtkbzhObU5jcW4vV1UyWmI0?=
 =?utf-8?B?VUlQamQrWUY5S1J1eHFRWHMvODBZNTBVazVuUFBhWjByYU43a3VteWFMREdW?=
 =?utf-8?B?REs2Ymlrd3B4b1ZWaStnQnIzbnQxOXY4bTRmSTFDaTNXNnFwYTIvaUxyRU5V?=
 =?utf-8?B?K29WYkZWa1VPN3VlS2NjeEJKeTFaMkYrdDF0bUFSUklMMmRvQmNndWhIakls?=
 =?utf-8?B?ZEgvQUZndU1Hb2NoTUZ5UGxJc3AzandzS1pwbHkvL3NiZjRySG1JT1kzWklD?=
 =?utf-8?B?citFeDJwU1NNZnJ3YWF2aDUrUHdtSGhxa2RRUE1BRVl5bG1oeHA4ekpSR2I5?=
 =?utf-8?B?WWpsbTVyWnFWd1pnVlNIdFBaMHRKZys2ZlhBRzF2dVhvcW9NUkNqQWVaTUow?=
 =?utf-8?B?YVNnRXBXTXJDQVhoZ3A0M3lFb2JNbmc2enJCRUthWHhUMTdaTEdBNTZhbTlv?=
 =?utf-8?B?akZhOE0yMUVRSWliamxRc1VkL21wSjJqNk9oTWxtZitCakUwSTYxdGVuZ2J5?=
 =?utf-8?B?V2taN051a25VcCszZ2d6V2VYTlcxOEowSlVKbmF6SmdsWWYycXU1dFkrWmlu?=
 =?utf-8?B?bDN3ZG0wbHNDL3V5dHJrdWpmWmFoM29PcEQzSWwydVhVa0RlRW5ZaGllVGhU?=
 =?utf-8?B?L2o4UDZ3TUpDcmNra2FjdUxWV0pNZElFSmVnN2ErU0h2dHlJK0ZwTGVObmhl?=
 =?utf-8?B?UVNpQlM4YUNHeXhlb05JVHNkV1FDZ2liN1g0UXlrMUdla2dScWhNazlRVkRM?=
 =?utf-8?B?QmtOYnNrMitwUDVnNmw3a2dTZitaMElqclIwY21YU2JWdUxKNUFKZEpNRVk4?=
 =?utf-8?B?YWZKK2FmV0twSU8wMGZEVCtHTGdqQlJSd0FIcUZ1LzhtYlk2VS9aRzRPelk3?=
 =?utf-8?B?ZHl5bkNJVmJRaHRHNm1TbFBJQ0ZwNjNwRG5lOVJQVFVTd2tBNytKTkgwQ2Q5?=
 =?utf-8?B?dzRVdHovNmc0S1V1djdlcHhhM3lWTDBHTTRnNHF5Y0MzMjlHZW4rVDBua3dW?=
 =?utf-8?B?empMbUlObDFIVGFTdWVYSTR0T1dHb21DMUo3MDdmUkpQQzZzT1ltV3pzWGhw?=
 =?utf-8?B?c3MrSHhBMXI2YStIMFdhTnVWUjc0S1dzQ2RnR290cHV4MW1idUk4dlFLdEo5?=
 =?utf-8?B?S29JRVA3NHFNaVZHdHpBQ1lNMklWeW4zUThjbVFwMWJUZ3hVZDQ5ZWg1Q2ZX?=
 =?utf-8?B?SjM3MzVTUlorM3dVQzRrWDIwbCtJWm5udVE0S25oVWNqd3AyQ3NWUUg4d2hO?=
 =?utf-8?B?ZUlkU1RKTHhoTS9TLzlaYVN0dVYvQjNxVkpHK3FuWXk0TXNaZU84U2hia2RP?=
 =?utf-8?B?VnZreHEzT0Y1UHU3dGxidkNTOU5uOWVKREpubEF2bWVEUVdPNVEzZFJPcjFH?=
 =?utf-8?B?VlJBTDh5elVBMEhzd0tYYzYyV1Y2QjBGQ0JkclE5K1BCU01sck5UME1tazN4?=
 =?utf-8?B?Q2grVjhPY0tuMzhPVDBQaW0xaXcxZW5nVHU1NlQ1dTVzdnN5d0ExYjRqNXha?=
 =?utf-8?B?RDZWcEI0RGEwVER3SG5BMFM1akpXNlNMVjRCMEh0N3lwTlZoSVRYeXB1emRU?=
 =?utf-8?B?MFhUTWFRSUpldFVUbUkyNzFLWlFvNFNSZDJYeU1JRzJ4WXFpMnE2SUZyb3B2?=
 =?utf-8?B?YUFTcm12cUZvMG5rQlJGYzJzRWlNdnNqcENBMjRPZkhnSVI2M2JkOEFHMk9v?=
 =?utf-8?B?enBZWTNWWTZMMytzbk9pdkYvekVsR3FISUIwNGM1aDFTWm00OGdCMFpRQitn?=
 =?utf-8?B?Skh4dEFLVXhzR3hKdlhCQTdRSFJKcGRvTVppZGR4a1BpNXN2RElDOExzOU5z?=
 =?utf-8?B?azBvcFNHc3B6VXlyc0JOOEY5Vm80cGNwWEh5VG50dHJKUkt5KytGMDY3Sms1?=
 =?utf-8?Q?Jzf1egMLp4BiWteVA/IiPGHEeQUWxTmbSH6rq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f676f7-f50a-418a-0381-08de728ba537
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:28:43.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmXyG1YaIfgQSq0AxSGb81yHvo26Z4Qr0AVL39KT8bSi9UI4W2387iErqh/et62X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,nvidia.com,oracle.com,linux.alibaba.com,redhat.com,arm.com,linux.dev,google.com,suse.com,cmpxchg.org,tencent.com,gentwo.org,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.dk,stgolabs.net,linuxfoundation.org,android.com,wdc.com,huawei.com,vivo.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:kernelxing@tencent.com,m:katrinzhou@tencent.com,m:mhiramat@kernel.org,m:vbabka@kernel.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:axboe@kernel.dk,m:brauner@kernel.org,m:kprateek.nayak@amd.com,m:dave@stgolabs.net,m:sandeen@redhat.com,m:gregkh@linuxfoundatio
 n.org,m:arve@android.com,m:tkjos@android.com,m:cmllamas@google.com,m:aliceryhl@google.com,m:dlemoal@kernel.org,m:johannes.thumshirn@wdc.com,m:dennis@kernel.org,m:tj@kernel.org,m:xiang@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E4E7117184B
X-Rspamd-Action: no action

Hi all,

Based on a recent discussion with David Hildenbrand on page->private
is not zero when a page is freed[1], this patchset is trying to fix all
users do not zero ->private when freeing a page and add checks to make
sure all freed pages have ->private set to zero. For compound pages,
both head page and tail pages need to have ->private set to zero.

People are only cc'd on the cover letter and related patches.
Mailing lists get all patches.

Patch 1 to 9: fix all users do not zero ->private upon freeing pages.
I only tested part of them, so would like to get reviews to make sure I
did the right thing.

Patch 10    : restores page->private check in folio split code, since
the code was removed in a prior commit without a proper reason.

Patch 11    : adds checks in page freeing path, __free_pages_prepare(),
to make sure freed pages have zeroed ->prviate.

Any comment or suggestion is welcome.

Thanks.


Link: https://lore.kernel.org/all/91F2E741-5473-4D34-ADA1-C9E6EDCBF5E0@nvidia.com/ [1]


# MM - THP
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>

# MM - page allocator
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>

# relay
Cc: Jason Xing <kernelxing@tencent.com>
Cc: Yushan Zhou <katrinzhou@tencent.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

# MM - slub
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Harry Yoo <harry.yoo@oracle.com>

# DRM TTM
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

# Block
Cc: Jens Axboe <axboe@kernel.dk>

# watch queue
Cc: Christian Brauner <brauner@kernel.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Eric Sandeen <sandeen@redhat.com>

# binder
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Arve Hjønnevåg" <arve@android.com>
Cc: Todd Kjos <tkjos@android.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>

# null_blk
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>

# percpu
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>

# erofs
Cc: Gao Xiang <xiang@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: Sandeep Dhavale <dhavale@google.com>
Cc: Hongbo Li <lihongbo22@huawei.com>
Cc: Chunhai Guo <guochunhai@vivo.com>

# lists
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-block@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Zi Yan (11):
  relay: zero page->private when freeing pages
  mm/slub: zero page->private when freeing pages
  drm/ttm: zero page->private when freeing pages
  blk-mq: zero page->private when freeing pages
  watch_queue: zero page->private when freeing pages
  binder: zero page->private when freeing pages
  null_blk: zero page->private when freeing pages
  percpu: zero page->private when freeing pages
  erofs: zero page->private when freeing pages
  mm/huge_memory: add page->private check back in
    __split_folio_to_order()
  mm/page_alloc: check page->private upon page free

 block/blk-mq-tag.c             |  6 +++++-
 drivers/android/binder_alloc.c |  1 +
 drivers/block/null_blk/main.c  |  1 +
 drivers/gpu/drm/ttm/ttm_pool.c |  1 +
 fs/erofs/zutil.c               |  1 +
 kernel/relay.c                 |  8 ++++++--
 kernel/watch_queue.c           |  8 ++++++--
 mm/huge_memory.c               | 10 ++++++++++
 mm/page_alloc.c                |  3 ++-
 mm/percpu-vm.c                 |  4 +++-
 mm/slub.c                      |  1 +
 11 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.51.0

