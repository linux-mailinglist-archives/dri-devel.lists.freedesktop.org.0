Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A74B1C693
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 15:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F910E3DC;
	Wed,  6 Aug 2025 13:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e0/q12Yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AA10E3DC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 13:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZpt44FMXAcM2ZYouiyATQQ95wB0pU5LLV/OaGbg9kE7Fd/0h70zbB8HONKL0QWlyf9r7skMV7bitYGsGcuSOsYcRQNmYHxdSSPnHdcfvY+42womk2Xnd5BtviVitZyip5NEDU8rVAf93+n++D2L8s5HBJOk27BoQx8VzT+VCoWfYnenqy635WhcUDcIk4PmiR9QPTfsX0/ecK9l00Wa6B6qN+e/5GKfx3R/7CI5dDJNn2UWAbd10SA4gn80xCiHjSiHwJof2uuKO/xH12i6BHD84+J4XDJQ+8aD4YkoM/KoowIKVCOXzZC3VvLxxx8GTsGxt8ocqtPy85qrvZZtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp/btkBldjGt+zbJX0yHPr9fHGslS87W3nVoeM9xaPY=;
 b=y3Of1T13nfhk9JnTgQbotePKNm1YCS935BT7eU8RrJNnNlkXJzLOqQOdHFHgHQIudq8Ijg3Mi3nr5xr0HYqwuARJ7ZazIBzYuw9sMU83Jr6J10jIm4QGFswjKM5fCk9j2naKZ0LaOp1IS+1zHlteg2l8eRqUsghhPmaj/woQJCmKRl6Ty/SLLsdZRRTwmEDkFOuCxGpr6e1L9lZevl5UWk2QOCFFeai0mqR/EEyKnnycx/UZTiZX08dh87PO6YmAbewPjUwyjIDsyF0rgw1fxb3AhW5w1Sf2jn9zugH753owAl8sTuEEa5Z73BEz0FuctPmEPf+e2Q/Ho3NtmFE82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp/btkBldjGt+zbJX0yHPr9fHGslS87W3nVoeM9xaPY=;
 b=e0/q12YlZL7s11e3fXdcMub1FrKPJ/y3vQ1Dqebrt6PS8qoxRWK5DKiPRDGUwZeP/Nuuz3kGHiypgYfQQ2MWH0daNcgK18fmHsmIRmj4sid+RY2kKy8gyomG5OBTIAt0q77MONNvpNUqds537eYyKRsLCjSNuHV7xRaOt9wTK60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 13:04:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 13:04:28 +0000
Message-ID: <abd47844-c813-465c-af7a-0f44898186a5@amd.com>
Date: Wed, 6 Aug 2025 15:04:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] ttm/pool: enable memcg tracking and shrinker. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-14-airlied@gmail.com>
 <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
 <CAMwc25qP-42wMX4UYhZWiYfvf_1dBVNL9TU9i_Wq7uZPqjQL5Q@mail.gmail.com>
 <CAMwc25pyqhcq-8ubGZT5UX5AYroewBYP6oFN-JmjzEkHgFLTrg@mail.gmail.com>
 <903cbf42-2fde-4e38-89e4-2d7287b845bf@amd.com>
 <CAPM=9twR1S+O9G6gQMJkssTh22KRQ-rb4WsJPnXiXz+y_9oi6w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twR1S+O9G6gQMJkssTh22KRQ-rb4WsJPnXiXz+y_9oi6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: e61d7183-9090-4464-e732-08ddd4e9c6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDMwQTd4SlU4M3RCbkh2UVh6Q3dDR2x0cEhWQWJIZEovRWFpYnAvSDR4UXlq?=
 =?utf-8?B?OXhPaldUYytERXU1YlhPVHBCdUgzYjZlbjJudHFLWHBERGk1cEx2N1FyMkdr?=
 =?utf-8?B?VnJUSG84eVpUOVpaQXQxODB3eGlJd09zNWVkdnh2a1JDOTl1aUczL0RaYnJr?=
 =?utf-8?B?bVg5R1B4Wm5aR1pQUHdWcU9MTUcxWnVzU1hsR2JULy9aT3Jzd29OVStVVndX?=
 =?utf-8?B?RlFtNFFlSWx3NE5Sc1I4THR3QjVOcjZ1L2ltazJBd0tqVEY4MFBhYVZOQkg5?=
 =?utf-8?B?ZzhuNkRKTkF0TWp6TTFMTkhueHV0ZlJ0Q05JSE9MdHFSUW5tMVI2S1VoU0tR?=
 =?utf-8?B?ZnI5QmN6QnhHT3BTOXB0TlUzcXJUdVQ0Q2J0eU42d3FubC91aXNPQ2YxRjRB?=
 =?utf-8?B?OGdBamptSzlNN013RSs4QWljdThIQXpRVWtWT1NxMzBVZDZRWm5QWENyR0c4?=
 =?utf-8?B?ekg2Zlh6dDczeTNCOVFDdHdFSGFlY2R2ZERXcG9vVENQMlVPL1ZKclJaeWsx?=
 =?utf-8?B?MTBOMzVFd0JDUE9vZXdPRWdYWXphWS9LWitPWXoreDhwVUMvUkJ2M3BveE5G?=
 =?utf-8?B?ejRrNU1ET3NEdDBFVmc1S08yTWNzSGlFSkpaL3RmZXY5NDI2Q2VFQldONVk2?=
 =?utf-8?B?MXhhM3lWTHlzNXphWVVRZjZwYm5ub05qQUhQbGZUak82OEdhUGRPSDlLaFZQ?=
 =?utf-8?B?WUxtUVFUc1R3QW1SbEltRVFxN3BRL3AvZncvZk1GTWJhK3N4MEZtV0ZBd1NJ?=
 =?utf-8?B?aytsVTZrUExJOUthdUlWZXpxbG9YTzc0bFM4NzZGTDgxVERGeHVrb1BRQVRk?=
 =?utf-8?B?dUxtSWJ1VzU4bFh0RnljdmdTVEFlK052RGUyNTVjS21aYWR3bm50U3FCeWJO?=
 =?utf-8?B?Mm84RUM5NVFkcTJsTnJ2N2lYSWlHdE5DbjA0TmhwUHlUN0UrWU5wR1Znd093?=
 =?utf-8?B?REhQNDNMNjBsd2pyckNXbHlBb0xUMngwM09CNkZYT3RjQW43NTBsYno0SVV4?=
 =?utf-8?B?NWFtaHM3cHFJMVhuWThMRmJEa2hmejJkc040QTJiL3hVUDFtTzJMclRrcFRq?=
 =?utf-8?B?MjVsdUJuY2lDTDk1K3VjNVNUajk5NXltMlhEMmhtdW95ano5cUZybHRIR280?=
 =?utf-8?B?M2taRUxLV1E0MnAweEI2VkVGT0MzR005aEI0RkFLS3dSWjY1N2IrWnJBWWVX?=
 =?utf-8?B?MkpOVXB1KzVRNG85K0VSbUU4VndyYWFhck9ydS9HYlFiT3JvRjFyRy9iQWFT?=
 =?utf-8?B?ek93R2tSdlRCYWlWdEJLZG16cWVlcG9ZM0FQd2ovM09OVHVzRzROZXo4SDV3?=
 =?utf-8?B?bkVWV0VDeGtwN2FGZ0p5VTU4SnhSZFFyeFdrVG94Tm9nRmhENndya0Viell6?=
 =?utf-8?B?Ums0L0ozR3F2TVBsMXd6UWNzWk9xcUVZR2JJaFRLSG1zd1ZpaGE2eTF4WWNN?=
 =?utf-8?B?SktNMnNYV1ZXb1hlSnZ0S2NJY3NoeDlyMEpKelFTemdFTjd2N05SbGZERUdV?=
 =?utf-8?B?UUNuZUNldlJCemZrbzg4cGlaK1RHSS90c083aTNFMXRMalRsbjUwQXVmWnpK?=
 =?utf-8?B?K2x2UldnZ2dBODZPRDNGVTVia3FmdUNyczB2djJ1M3ZXeERJTDVpb0NaT0x1?=
 =?utf-8?B?ZTZYMHFXbWJKRGIyejc3czhXRlZtR0l0RlJRZHJTRWRjeGFqeHNDc05OQ2cx?=
 =?utf-8?B?Sll3ZlIxdTVMaDRxODF3WmtxNEhjeXdjVjNwZkh2R2J4Y0RUSzZzWUU2TEN6?=
 =?utf-8?B?UGRoQk85RjNjeGdLb2JaTENmSk5ock9BTEhIZkVZblpIbHM3WXVPQUduaDVw?=
 =?utf-8?B?WWtkTDhJdU5lN24yWHBveWptMk1tOS9hKy9UQUxrM3V4V29uQ2thQ3ZCcFNa?=
 =?utf-8?B?bVhuejlwdnN2amJnU2tFY0ZUb2N2ek82MHZNTkI4WWlCZXJLQUhHZVEra0RN?=
 =?utf-8?Q?NlepJdEbXuM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmt2S1dtdkJoU1VsMzRVd3dXODlKejlCMDk0Y0I5VmdDc1YxUmlFVUdXYStm?=
 =?utf-8?B?SjlTWGtYcXl3aW9Ta01UWUNhQ1owcWU2V0dNZDhaWTBUendaWjZpdG5IdlRN?=
 =?utf-8?B?QWc2YlZVeTg0cjJ2TWc4dVlNd0R1MFQxQWFvd0RGYkxZMkNZWk41enlwMFNJ?=
 =?utf-8?B?V2k0T0gzaitueEEvZW9CWnY2b2tEYkxzOG9McGxwWVJvMVBDSnlXNm80cjA1?=
 =?utf-8?B?c1F4SDlHZ1RBRDZENGJKOVllZC9CbUJYQUNwRkozMHJ6QVFic2kzbmR6SlBX?=
 =?utf-8?B?YlRWeVYzZ1d3UlBxNkpYN05rMVdOMVp6bHUvS0xxMjcwUStGWjVVWllUdHB0?=
 =?utf-8?B?WlhGWG9qZ2VpMWZybUd3OVBNdXNzem54ZHRjbWRpWTNDeUh5Q00vSnhtT016?=
 =?utf-8?B?VTRGK09HTU5GMTJpS21oTVRZWXlNcGpHdk1NWDBRM2VLV0J1S0F3MU1xU1NS?=
 =?utf-8?B?UG5vVmlkS2lZL2FTdW5NajN1Z0tZUXplVGtBd2F0VlNyQlpRelF0cWtOT1lr?=
 =?utf-8?B?Y3lvM2ZZZWdtcHRPbjk5SlJ2SUlNdFF4ZGsrenN6RmRPUXpHZ29VaFd3QUJt?=
 =?utf-8?B?ZlhVMjZsMlpvektvRnNoT3BkV0Q1dzBNUW0wc3BnL01JVGVkWGFVU3c0YjBL?=
 =?utf-8?B?VUd3L2htdXVveU1CbDVlcWRYM2lDZEEyWkswYkRVUStZZ3JGS21BbG16NE1h?=
 =?utf-8?B?OW15R3lDeXVpT21IQlNwS3huN21YYklKd0RhNHZScHgxRUZwQWRtWERDV1ZC?=
 =?utf-8?B?VS9LVElmVDNjR1NvckNXaHF1RGFRVlJKU2R0bzluU3hJWjJYRk0zSWhRWjE2?=
 =?utf-8?B?ektIWW1FZVRDZXBrV0hvZmRZeUFjb09GYzBEL25TYThhYktvZHRXYkRvWnVQ?=
 =?utf-8?B?Z1JWcGIrQyt2dFNhZ3ZDUXBZUktpK0tQQmljK0xaMFp3UGtTTkplQUczMU93?=
 =?utf-8?B?Ti9XVjRBQUQ0YUtGemREanUySlEyZXgzYm9pS1M1NmxFYytZRkd1UDFKVTY3?=
 =?utf-8?B?K2grT1phUVVwL2tIcFRPMFhYVExqTEVzWUNnRUwvYWNIamZXNC9vWTlabkN3?=
 =?utf-8?B?L1Bxend4eXNnSHpDck5BZEd6WEM1TTAxNGhGdkpLbWVPSkNsMHNncFpqY3gw?=
 =?utf-8?B?aHVnR2dkUm0vMTFPVjBGYW1pYzh2UEF3cE9JMmhtY3I1c250Y1NUS25IdnZh?=
 =?utf-8?B?VHJ3WGJPbWx6c2hxdHV6QjVlY3JGZmx5OWVvaU00ZVZCZ2xNcHczWmVpZS9O?=
 =?utf-8?B?WjBkdzQ0Si9ENFVYLy96Z3l2VUlHMmFUb0RGMjdoVjRHK3djcWxBanNqV0Fl?=
 =?utf-8?B?NDY3b2hxblgzYlZPVDQzSXFUd0lHUjNmOU1QenpzVktERXBBMFl3N2dHYlZH?=
 =?utf-8?B?Y1lwNk1mcTZqRGNKOVJSZWEzZWFVdUlFampxc29pT2xJS2JnczJSeWpUamsz?=
 =?utf-8?B?K2tjYlBVMXovWldDU0dKa3l0c2FuSmZCQWg2NjFxMVJacGV2QWo5cndHZExS?=
 =?utf-8?B?QW9BYXpwSnRpa2F3cWlnUmFHb0daV0VNd3hhQjBMOGxUZ3NSTGRhZ25OekJz?=
 =?utf-8?B?T1d0Q0ZULzZBMWJVQUhzWll4eldudTE2Tm1GS2xpRkNuODlKL3Z6ZTR1NE5I?=
 =?utf-8?B?aWE4NVVPejF2QmNTU3ljWThmWVRtRFBjYW5PcHRVMzcxMlVMREp5TWxuVlFK?=
 =?utf-8?B?NmhRSXN3c093ZkdEaS9NeFB6OE4wOFBWV3NadHdTTUUraVVaUUhSOThmQVRH?=
 =?utf-8?B?Q0hLa3E3NTFuTHlFSjRHWkhSWm5xWmlXcGJyVS93WUpaYnRGOGF5V25uSmhL?=
 =?utf-8?B?dU5Zc3BpT0tmWjJyWkZrbTlpM0FObWRZdlRqZXFsUDlwTVh1MEt1bWp6MTV4?=
 =?utf-8?B?TnY1Zm5PRE9meGphN1A4dFVmOTVieE9BamNwRzd1K09GcXFVdWJkU2p3Um9n?=
 =?utf-8?B?TXhqTTNNRGRJVWQzbTVNN1dpMFh3TzZyQjhZc2pyeGh2WDZ4WHkyWExKQjJR?=
 =?utf-8?B?VzZkS1VqcnZxamRicWpXU0haQzZBem9CTEZiMjYvRThOZ3FZTXZLczBDNVRz?=
 =?utf-8?B?UERtUUpoL0grb3NzWDBlUE5iYzhWeEkwOUQzZHpkMXlGNWVDaWh5UFRDTUZ5?=
 =?utf-8?Q?r7zrAephK77AYKS5GIBHIwGHd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61d7183-9090-4464-e732-08ddd4e9c6e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 13:04:28.7662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8QIGtjsesdUpBlgliHLgWW09B+2DAQGSYgi88MTWUDuybEyUKwJiWFUQ9BUByrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
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

On 06.08.25 04:43, Dave Airlie wrote:
>>>>>
>>>>> What we need is to reserve the memory on BO allocation and commit it when the TT backend is populated.
>>>>
>>>> I'm not sure what reserve vs commit is here, mem cgroup is really just
>>>> reserve until you can reserve no more, it's just a single
>>>> charge/uncharge stage. If we try and charge and we are over the limit,
>>>> bad things will happen, either fail allocation or reclaim for the
>>>> cgroup.
>>
>> Yeah, exactly that is what I think is highly problematic.
>>
>> When the allocation of a buffer for an application fails in the display server you basically open up the possibility for a deny of service.
>>
>> E.g. imaging that an application allocates a 4GiB BO while it's cgroup says it can only allocate 2GiB, that will work because the backing store is only allocated delayed. Now send that BO to the display server and the command submission in the display server will fail with an -ENOMEM because we exceed the cgroup of the application.
>>
>> As far as I can see we also need to limit how much an application can overcommit by creating BOs without backing store.
>>
>> Alternatively disallow creating BOs without backing store, but that is an uAPI change and will break at least some use cases.
> 
> This is interesting, because I think the same DOS could exist now if
> the system is low on memory, I could allocate a giant unbacked BO and
> pass it to the display server now, and when it goes to fill in the
> pages it could fail to allocate pages and get ENOMEM?

Yeah that's perfectly possible. IIRC I have already pointed out those problems when I first started to work on radeon years ago.

See the patches for improving the OOM killer I came up ~10 years ago. They don't address exactly that problem, but go into the general direction.

The problem is cgroups makes those issues much worse because you suddenly have not only the general global limit of physically installed memory, but also artificial limits set by the system administrator.

> Should we be considering buffer sharing should cause population?

Good question, haven't though about that approach.

But we don't have a way to figure that out, don't we? Except maybe when exporting the BO as DMA-buf. Mhm, let me take a look at the code.

Christian.

> 
> Dave.

