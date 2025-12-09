Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349DCB03E1
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24B610E5D4;
	Tue,  9 Dec 2025 14:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yz85dod6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012034.outbound.protection.outlook.com
 [40.107.200.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9741110E5D2;
 Tue,  9 Dec 2025 14:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZVUSxwlo+6RGRM2QMiDg7IqW4dLAmyQWmdfrd+ML+94ixwrEZ7k8+PVt9CUxKE42XRLUyUF6xp1PM/aNh+0bPG1elU5WHnnOxfxo+ssVzjerezlIYlO/b9Pjs2QyI4cuuCI1bH1vAORSw1dTjjoE0urrRXXHStvI8b7ltMM+ZuifNtmlXiQR/iaA8mz/cn7mZahhTufMoCPuM8kxCvuHprluimB2ocbM0KcRNu6Xo+onkUL3xUWXuevvG/Ot5Xy9ADNgSjq3wfR4YpVr/dqwOlSHaAFLwstEKpYdVOnT5aPxolTxMEteJ4Wx8CZz1RMIdzI2Ipk2OPfc+ijwPBSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fegHovuEpRXjvtCX7jXeKBVshkotwpfP8Vs4oaVcyw=;
 b=s2DVQzQduOYdLBlxCbRmigHDXnqpYwarGTxidDNevMmfAkdXHjZ4whl5uPUEVWO9DzXqRD6J7tu1fSce1lb9BBcKbcG4oVcGuShqHomx8HiOemtOvgobWRzRs56Jzz/vLUN+pZzxnj4jga80RHFPXZ97q1DneGYZEcw7fb3mYK/i00YlU1QVQe9fY7HI3Qz2Nl2opfSoz0W4SnAEEYPCWD/cJuOB7bYhvZLCmF8uayv+DaKfpOlolcPkft+S0KmZxWPJ6MVMnP/hHE8/wqnB8TYH1+iNhSKvI6ILLxTuPGKo0W0kz5EVCgI+cXkHU7EvRd6RRl+M+LE2zl+l79CXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fegHovuEpRXjvtCX7jXeKBVshkotwpfP8Vs4oaVcyw=;
 b=Yz85dod67Q4FaEzAH2nHrAy/YD+tBiJNClJaPjR6CX+05Bx3gAhL/jPL5+wZwiiJctFBIGL6CfL0A+HiuFqZs/jF9lHhPiJg3ONmts7WzGgFPFi2f/e2CKQWIojw5U9a3yKqVyTgfpqKzb2xlz71DWyDTmNBCAQg9j+lMhvZU38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:19:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 14:19:52 +0000
Message-ID: <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
Date: Tue, 9 Dec 2025 15:19:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fd0336-8d11-4ed2-8623-08de372e051e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTV0NTBHVzMrdnF1R3JTVUNnek5tbFl2N2NLU2o5YmlnWGJrQVFVVC8vVVRv?=
 =?utf-8?B?MitPUEo3cTNzU2hkS0lkV3NqdXRMR2R2cHVydUFjQjMvUUFpaVJxaUhJb25K?=
 =?utf-8?B?TzFZWk9LQ3c5WmV1VE5TdDE5NlhhR3ZjMHA5c1RaaTB4bUJldFFaV0lBS0J6?=
 =?utf-8?B?VXVEQmRVUnJiTkNHclE3ZzhPU3pIL280K1FVcmlOVWI0OFp5UlM0MDgwRXI4?=
 =?utf-8?B?TVlwckNLdXN1YlFYZUVrQlgrSzRCc05WVC9kbmpHcm5ReS94dmRlNlozSGJu?=
 =?utf-8?B?WG5vb05WSFV3QktpK1BHWVJMRkExVUJTUWQvaUlVcUlxQWxaZFJNT092NU93?=
 =?utf-8?B?ai9VaTh5YXBQbCtnbVJrQzdDdkFTQzFBb3VOQmlpMDhoRS9iWGlnbW1rendS?=
 =?utf-8?B?YURoL0JEdm1mMitYaFJyN0dmUWUycTNBVkxLSjdJZUtZRzV6eDk2bHYxcFhM?=
 =?utf-8?B?bVg1OFRyQU45d3dzWXg3c0ZnNWgvcW4vMVV6VWVNSVMwQitOL2JCNkloeC9K?=
 =?utf-8?B?ZEEzYlE4Y2lWVlh6NkwrVmVQSmRPaTJwQTdBdzk2QVBEQkVKSUtsbXZCM1ls?=
 =?utf-8?B?WEdiVnlob2M0SmE4L3hRV1ZtT0hYcjhNL0drcWNySlM5TEJlWTBjRWR2dlpE?=
 =?utf-8?B?QnMvOE90QlZ5d3ZyY3huN2VmR2xLZEhGVFNlOFAzSWtQTm5QUFFkdzJaakFx?=
 =?utf-8?B?SHM4M3FoZm4xTGVxK1pCSE1ONHRidGdOakY1TC9pYktWVnI1LytHYlE3eGlR?=
 =?utf-8?B?SlA4S1dPclBkLzVrQTlHeG8yaUJaNTJzakNoNjdqQ3o2WUduSllLSlRsMWwr?=
 =?utf-8?B?NmZvTy9Ya0kxSFRCUFFuTjJ1L0h2NklYMG5yYllYZldjMTd6WFljc3ByelQw?=
 =?utf-8?B?Y09YUWUzT2lEYWplb3hOOXgzaDJ3VndFNDRrclMwdnlxb1lTZ2RONVVjZ3JJ?=
 =?utf-8?B?MHc5aG5XTmhOd2ZKaU4xR3QvY0I5K2Z0THRkOVRKY1pTWUtSenpMcXV1Q3dV?=
 =?utf-8?B?RDJvd09sV05Zb1llNFVhbDRaa1owYWw0WmZ5MW5YdzFlTktSaERKTkxBVGRH?=
 =?utf-8?B?YXV0V0xoZm9rT1RHeUNXUkJkSUhadU84T1BsUU8vcC9EQmI4V2YwUmVucTA4?=
 =?utf-8?B?cm5ST2Q0cmovajBpc1R0V2Vjc3pLMUFoNjBiclZjK1k3NFJ4ZWI3WVNFV21o?=
 =?utf-8?B?ek1CKzBmekFTTzF4WmlwRjFlWmJlaGpYSGZXZVAzb2duY1pybTlYQ0ZMMy9T?=
 =?utf-8?B?cjVFcUtXbjhNbHlUeklmc2ROZllhNDF3QmRTUllVRUwrSzJER3VadlVuUEdz?=
 =?utf-8?B?UWhXZUtITHVCZGFobEJ4dFZqNHVhNGpHbTFsNjdIVlNCNFlIcU14ZTJnS0RN?=
 =?utf-8?B?dHQxcVhQSjh0dkpzdVZ2bkIwQWpiQytyQzFJaWo5eStUMlBHaGZLVzJ4Y2Qr?=
 =?utf-8?B?WmwvN0lmdWZpcE5EVkdGdU41ZmJGdmNFa2p0U1BlbTUwQjBWTU1ZSmM5YVBp?=
 =?utf-8?B?REpkeDZ0Ry9BRWhKWFE3Mkd6OTB4N3NRVHV1R1dDU0VKNmx6L011TFdsYm04?=
 =?utf-8?B?ZERiTlNCdWpGM2hoQ0RIZVdidFdXcTFnei9wREp4VkdiZnBleEdpLzFQVE12?=
 =?utf-8?B?eVBGQndna3ZCS2RaaGhuRXdmYy9ZQ0xjMUw1YUVENTR3Q284WXU4S0dDclVK?=
 =?utf-8?B?T09qL1ptdWRmVDdRVVBnRE9EdlRVNlJ2eWYwMTAxK3Z3bE5DSUp4eVBhbVlz?=
 =?utf-8?B?TWgyZzdrRkZzY2JQUmdoUVllRFpUM3BqOXMvZndhc1lRejZvQVlOZGRBM0I5?=
 =?utf-8?B?U0lTZzVQL0Y5LzNJNXdXL3UreTFNSkNQeldSRG5KYkVxdW5icmI4TmExUEx1?=
 =?utf-8?B?d095N0VMMklTZDdmbzVqQUdWUkxRa3ZuVHB5cUZ3dWwxTVFoVTlGZlhUMS85?=
 =?utf-8?Q?D+fKOg87Ec8wueKkZ5RYuKkQk4TXkQ9D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm1MaDd1UzF1SENhRWtEQWdMY0hUQ3REY0tQdmg5ZlF1elBhYTBnaC9IendB?=
 =?utf-8?B?OXVqc2JJYVJ1VXl6dk5TL2gwRUlMSlZKazFkbzRFY2tvN1lzczI0bkxNMENt?=
 =?utf-8?B?Nk82MmpWSDJiM01GeXJFUFpQd2hCbmVwTWQ1emtpL3NUNUhoVkYydWhMRUxr?=
 =?utf-8?B?TDhtL2xzenNlb3lFRVpnVGxrM1dYL3Zpa0pBQVpuOTJvZHpQN25rOE1VMHdi?=
 =?utf-8?B?dVljR3V6eCtiUTJ3NUV1TTcxWVpJVTlubVJnWllqWXFBcDVEWnlHTkJoc1dU?=
 =?utf-8?B?WXlLbVpGNndhcW1aQ0tVTFUrUEYrNitxVlo5RXVaWWw0YStmTFl4Z2NBV1lW?=
 =?utf-8?B?SE02ZjE3Rk5jSU5ZbWJ3aUxubW9RbUV4QytPaGRvbDVCUjBxcGUyQTdKeGw3?=
 =?utf-8?B?UERyekxCM1lPbVFxK21jaW5EcHhxKzFvZXIzbkFTTm01NEZrdmZ4RVdTakhY?=
 =?utf-8?B?azRnOHFaZWJMOGdHdFU3TjlhZ1VEais1bGlvdU56OEE0T1dqKys1ZldmMEZW?=
 =?utf-8?B?TWZweDFaN0xvRHA1emlhcDFGMlBVWlVjMjlBVUdoUjh1QUw5RTc4bXJONldo?=
 =?utf-8?B?VmhUeU5GcldlN3RPU1BJN2FMQ1djbFk4WEs4M3NUZTc4NUk0S2tYODlkT1lU?=
 =?utf-8?B?QnZ4T3dnblRqU3ByZ0poWDN0OFg4MjZNMmpIRFpoZWZWWG9mL0sxeTJ0Mld0?=
 =?utf-8?B?cFVzditIVlAwVEk5M1JaZzhoa3lkcmt4QU04R0tENVVONStndGh4YlFlNVU2?=
 =?utf-8?B?bXV0Q1hjS3ZuaDY3MkRPcEV3UVl6UUVWa05jYXVGWG5BZ2wxUFVMaXdxSUtk?=
 =?utf-8?B?d1NvTjR2M1EvS1VCV1U5TXFrcDNTWFB6TXBrb2RMWEErZVlYSDNqNDBQOUw0?=
 =?utf-8?B?REdyTEFtbFd6aWhxRi9NcnZJcENsU2VEdlorNlMvOGZIYlQvK29Mak9sVzhi?=
 =?utf-8?B?bFJaUTlFRzU2UHRKZ1Rha004QjdCS05wUDk5UHE3Vk9zbUVOdTFlbTdxTVBP?=
 =?utf-8?B?aWhYU2FRRkxvS0lSVHRkYUJSeHgyb05adzJDazczT0VGRE02bjFwSjN0VnZy?=
 =?utf-8?B?ZkJQVXY4YUlsbktubHdHNzMwT0txWDR1SUQyakt4alVCT2g3MDZWMVF2TjFa?=
 =?utf-8?B?WEJIL3FleWoxVlBWbHVSbE9lbnkxc3NKOG8xejdlL2ltenNOT1IvVTdzMUVB?=
 =?utf-8?B?eFFKVnE4UWtPWDkrSGFEclNwRlJma0s5V2hrZ1VQREdYNkJLWVYrdGxGUWJ4?=
 =?utf-8?B?MmVONG0yVDNDMjNpWDIyUWc1aUNKeWxJQ2RxWUdWVW5xdEF0V1pCb2VYVTJJ?=
 =?utf-8?B?SU50MEt3RGU3WW0yaHVJZkt4eWp1c0duVml0VmNtN0pVdnc3NTVQNXE3Rko3?=
 =?utf-8?B?UVB3Y1BRV3VTK2txUTFqL3FFa2R2Tm92ZzVWb0l3VmdYaTFkemx4cWZ2Tk9q?=
 =?utf-8?B?eUZaY3NiL29FRExjRjhSWkp2eDRJanMwRVRFUGpGOWp0cnd4RXlKaFQxekNQ?=
 =?utf-8?B?YkJlaldleUsyNU0zR1BCR09YY0FsV2JWMFhrS2JWZ0xMclozYkthUVBTRFc0?=
 =?utf-8?B?QS9CdUttU3RpNVlSQ2dpcXhzYlBpNDJLalNFeUpHK3lvalZOTitkRXpGVVh4?=
 =?utf-8?B?MXdFY2lSaXU1UERmaFhFTUt1VlJ5aXkxdUYxWlBIQWY1ZnpRMzdBZmZrdDVw?=
 =?utf-8?B?WHZpYzFYb21JL0w4dytUZWViSXp6MmpwVVRrNFlYeVRnbXhWR0tNT0ZKTzJt?=
 =?utf-8?B?U2xlMTVqTGdWckY4OW4wZUdmMWJnVFVOTEtrOFlBcUlwSXMrcXJpcHJYdnZZ?=
 =?utf-8?B?K2NQby9aYjdJd3UxRW0wN09BT1NSeEQ3UFZIendJcTJUKzY3TXZ0bmxXT0Z5?=
 =?utf-8?B?QkN4OG92Zzc5VjlzbnI2QVA1ZDd3L2pmZU5ubzE5akh2eHNLUkFQSGhDYmlC?=
 =?utf-8?B?L1NPR1ZSclJTNFJ0MlFwaWZBcUFJL0RDOEZXU1Z4ZFFDb3Mydk9HTHdRMjkz?=
 =?utf-8?B?STNvZ3dJb0RhR0d5SjZrYjF2dFlLNGJkR0tTcUxsdExwbFQyeWVodll2SXRF?=
 =?utf-8?B?R1F0dCthQlFocHFwN3hJQ3hYVXYvQmV1c29qdDBEZjF2NlN5dzdHMkhsNUVF?=
 =?utf-8?Q?vb84=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fd0336-8d11-4ed2-8623-08de372e051e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 14:19:52.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdCrulvGVgnHY4aimjAEOklG2GOuvaflIC1KX46Eja5UOpkwkHaOQHntKTXZuz8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

On 12/9/25 14:51, Philipp Stanner wrote:
...
>>>>>>>> How can free_job_work, through drm_sched_get_finished_job(), get and
>>>>>>>> free the same job?
>>>>>>>>
>>>>>>>
>>>>>>> It can't.
>>>>>
>>>>> But exactly that happens somehow. Don't ask me how, I have no idea.
>>>
>>> *Philipp refuses to elaborate and asks Christian*
>>>
>>> How are you so sure about that's what's happening? Anyways, assuming it
>>> is true:
>>
>> [  489.134585] ==================================================================
>> [  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>> [  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
>> [  489.158686] 
>> [  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
>> [  489.160285] Tainted: [E]=UNSIGNED_MODULE
>> [  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
>> [  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
>> [  489.160306] Call Trace:
>> [  489.160308]  <TASK>
>> [  489.160311]  dump_stack_lvl+0x64/0x80
>> [  489.160321]  print_report+0xce/0x630
>> [  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
>> [  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>> [  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>> [  489.161044]  kasan_report+0xb8/0xf0
>> [  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>> [  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
>> [  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
>> [  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
>> [  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
>> [  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
>> [  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
>> [  489.165496]  ? _raw_spin_lock+0x75/0xc0
>> [  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
>> [  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]
> 
> That doesn't show that it's free_job() who freed the memory.

[  489.405936] Freed by task 2501:
[  489.409175]  kasan_save_stack+0x20/0x40
[  489.413122]  kasan_save_track+0x14/0x30
[  489.417064]  kasan_save_free_info+0x3b/0x60
[  489.421355]  __kasan_slab_free+0x37/0x50
[  489.425384]  kfree+0x1fe/0x3f0
[  489.428547]  drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
[  489.434326]  process_one_work+0x679/0xff0
 
> @Vitaly: Can you reproduce the bug? If yes, adding debug prints
> printing the jobs' addresses when allocated and when freed in
> free_job() could be a solution.

We can reproduce this pretty reliable in our CI now.

> I repeat, we need more info :)
> 
>>
>>>
>>>>>
>>>>> My educated guess is that the job somehow ends up on the pending list again.
>>>
>>> then the obvious question would be: does amdgpu touch the pending_list
>>> itself, or does it only ever modify it through proper scheduler APIs?
>>
>> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
>>
> 
> And my uneducated guess is that it's happening in amdgpu. It seems a
> sched_job lives inside an amdgpu_job. Can the latter be freed at other
> places than free_job()?

Nope, except for error handling during creation and initialization.

> timedout_job() and free_job() cannot race against each other regarding
> jobs. It's locked.
> 
> But maybe investigate Matthew's suggestion and look into the guilty
> mechanism, too.

That looks just like a leftover from earlier attempts to fix the same problem.

I mean look at the git history of how often that problem came up...

Regards,
Christian.

>>>>>>> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
>>>>>>> call free_job, which performs the final put. Then the run_job work item
>>>>>>> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
>>>>>>> to the timed-out work queue could also cause issues.
>>>>>>>
>>>>>>> If run_job work item took a reference to the job before adding it to the
>>>>>>> pending list and dropped it after it was done touching it in this
>>>>>>> function, then yes, that would be safe. This is an argument for moving
>>>>>>> reference counting into the base DRM scheduler class, it would make
>>>>>>
>>>>>> typo: s/DRM scheduler class/DRM job class
>>>>>
>>>>> That strongly sounds like re-inventing the scheduler fence.
>>>>>
>>>>
>>>> Perhaps.
>>>>
>>>>> What if we completely drop the job object? Or merge it into the scheduler fence?
>>>>>
>>>>> The fence has reference counting, proper state transitions and a well defined lifetime.
>>>>>
>>>>> We would just need ->schedule and ->finished functions instead of ->run_job and ->free_job. Those callbacks would then still be called by the scheduler in work item context instead of the irq context of the dma_fence callbacks.
>>>>
>>>> Yes, definitely no IRQ contexts.
>>>>
>>>>>
>>>>> The job can then be a void* in the scheduler fence where drivers can put anything they want and also drivers control the lifetime of that. E.g. they can free it during ->schedule as well as during ->finished.
>>>>>
>>>>
>>>> I think this is a reasonable idea, but it would require major surgery
>>>> across the subsystem plus the 11 upstream drivers I’m counting that use
>>>> DRM scheduler. This would be a huge coordinated effort.
>>>>
>>>> So I see three options:
>>>>
>>>> 1. Rename free_job to put_job and document usage. Rip out free_guilty.
>>>>    Likely the easiest and least invasive.
>>>
>>> I think I can live with that. It's work-effort wise the best we can do
>>> right now. However, that does need proper documentation.
>>
>> I think that is the worst of all options.
>>
>> It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
>>
> 
> My POV still mostly is that (with the current design) the driver must
> not use jobs after free_job() was invoked. And when that happens is
> unpredictable.
> 
> To be unfair, we already have strange refcount expectations already.
> But I sort of agree that there is no objectively good solution in
> sight.
> 
>>>
>>> Let me respin to my documentation series and upstream that soonish,
>>> than we can build on top of that.
> 
>>>
>>>
>>> P.
>>>
>>>>
>>>> 2. Move reference counting to the base DRM scheduler job object, provide a
>>>>    vfunc for the final job put, and document usage. Medium invasive.
>>
>> I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
>>
>> With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
>>
>> If a driver like XE needs that for some reason than that is perfectly fine.
> 
> Nouveau doesn't need it either.
> 
>>
>>>> 3. Move job (driver) side tracking to the scheduler fence and let it
>>>>    control the lifetime. Very invasive.
>>
>> Thinking about it more that is actually not so much of a problem.
>>
>> Let me try to code something together by the end of next week or so.
> 
> The hero Gotham needs :)
> 
> 
> P.

