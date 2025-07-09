Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFABAFE8EF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA1910E7C7;
	Wed,  9 Jul 2025 12:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DxJzVER1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14E10E7C7;
 Wed,  9 Jul 2025 12:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEpVbTh00ZY7bUviUwk/+aGNdAgwZOgNO1YZ4OgotWpPGttBKJMcV1iaxF+4bsiRNJXAOMqZD3/LsdG4wZo7pGZf6/5Dt0XbH15ChdU7nEL02u616HuD+USYpfN6mHsrXuE8ZBASnqtIZpwmqgE07AUfJKN7eNyQzFVnmX+e2LQyDD141Og0LGkrSD9wJUl7sEqLc0fUQMiNBg4crdnomrWi5/BwbjPAEtHF1tXD7xM++j1bOoIs+B6zZ2A9Szf5ZgyB4SeBzTkYo+VcfroRXXXwo+VKvVfmQv3I5wPLQP1NdMYdzbSoujtRsdka2MJZu1+F1YkXOIhRFm9BLA7JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJNNHxvTVAFUoEJieU0W6w7ex6k0zmwWiRbCE+xN+OA=;
 b=nS6mGtVeVkEUoM0qKwRLrPK7dX9UuZi9V8vGueTA+hqSCFRdx17u3B4mJJnVkTSTm7miRmAFGYCpeEFr6EB6ChJRF5QoPxlXS+8sY0bijxeCOrhn7E3Xvbzfw0dH1FI0CGKzJ97EMkCX0BD160qMHp0I5SrEdyx9owS2SB/MADrbUvaY4QO7p+82TSAecEsURj+naJzEtRQFCm9R2h3I0wPcnl4akJbtCMOYNycltec92x8zIpeTVxMLjLVV7J8i2kwDkY5IlTPx6LPiO6410da16GdcxrTIiIKi5wmk/RId4/9Fm3MuefF8yn0b6GVsCaa8Cao/4WBqvmBsV/SDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJNNHxvTVAFUoEJieU0W6w7ex6k0zmwWiRbCE+xN+OA=;
 b=DxJzVER1vscinCcCdCXmgk5kf5mU/a9G1T5wo8JnTEyviL295vE4vY5hbqGyFxdeLXGnKCtHZQwnv4zJ9ZgYzeQJcxkUyxAd9ZDlLPnzaPaeNixPY+asbU68bQNUw1bJ3g03wIctfuE5Bb//eqzvXUP1ScduQQYYj/Qea/oHePXGDgtAR7TPN7JFx8RmY+f5kn0ryQ6rSP7qvalZUcEL26+nUb3l3aGhoWca6yW9UgOqnA7j4U9jerr4jvUbzWWsE2GYfpXM7MxaKyOSGfR1dk4Kqz1FPX56LymSE3PbFiYPcENidQZaFpXGQSxyUPBzfHIts/f/pdHLiuWLsBvh6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 12:30:56 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.8901.028; Wed, 9 Jul 2025
 12:30:55 +0000
Message-ID: <f58d843c-77a0-473e-9e24-5494f4326cc9@nvidia.com>
Date: Wed, 9 Jul 2025 22:30:42 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/11] mm/thp: zone_device awareness in THP handling code
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-4-balbirs@nvidia.com>
 <be029205-9d03-43b0-84f7-1dab530639ca@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <be029205-9d03-43b0-84f7-1dab530639ca@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 2374373d-899b-4bf5-3a0f-08ddbee47331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3VMcjhUMHlVYjdBaVM3aEhBN1lrMHZ1dTNKQmxnaWl4c2lQVTY4Zk5td21I?=
 =?utf-8?B?VnBTdXA1a3ByYmdLVnFGdGpoelI2Z3htODRaTUlpVmoxMzFQYndVakVMM29M?=
 =?utf-8?B?YWlTc1BIbS9MQWZqQ2xoWnNleWZhbFNMbWFRZ1dmRUlzZ3hRTFZuMUduaU05?=
 =?utf-8?B?NGZZaFBjd3BsS0RZM1FEYUdLejg5ME9CcHQwS3dPQnphdlpBN2ZNMzJTVmRB?=
 =?utf-8?B?dllnTjZHbnhsWnROVlAxRkN3cXFNZ2pFU0l1bnBUZ3A4ZCt2a1JoSUNSdmJW?=
 =?utf-8?B?Z2JOU1BDMnFDbDVtSXZ3VjNocmoxakVpaVJQTDRVOVlJaXpaTzJvU080YXNU?=
 =?utf-8?B?QkxPWTlPN0daeFhmTUJSMHlVVFBIWnh6bmFLWHkzWUlBS2w3YkhYaTZObHJx?=
 =?utf-8?B?dU1Fb3E4SmV2VG1LcnJxdlR5aEMyWHdaR0RyT2xBRGNRR0NsN3llQ25FemNK?=
 =?utf-8?B?dzJmdXBCcVE5enpkQWsyOUpzNG5XaWkwL3ovRHhrVVg2WnpDWjVvZVErWHo2?=
 =?utf-8?B?aXdEalhjdk5kaVBkUzRsdW1IV2x0ZWxjR0drcVNMSEc3SEpoSHdGdWdlaE4y?=
 =?utf-8?B?TXRpdFpPRmQ3RlFyZ0lTQjU2RG00VFYyT1l3OVJhYkxZQUlCUlFqd25JbS9q?=
 =?utf-8?B?Mm1QRjdqa1pGcUp5RUZ4QkNXdDVxSW9QOXBxMEhpMGk1MnAyNE1nODQ3a3Vm?=
 =?utf-8?B?bUlZVVV2dldPYVVuQ3QyMGFScHBPUi9veFVQeGRKcTViWFhhRkRIejE3dGlS?=
 =?utf-8?B?TmVYUU5uN3dMcFd2blVOQ2tEcEFBM3FiVGVUT2kzQ2piSXFxcldEV2xrcUhy?=
 =?utf-8?B?STAxaHY0REd2d2QwejFsMU1hbUFSN21XUjZzSS92OTlnSTVhOWx1bU5nNTFP?=
 =?utf-8?B?TEhMOThEY21ZT1RoN3dkbHJKMkZBajJQaUlobDNNUEJ5eXQ0bkFuZ01OUWFs?=
 =?utf-8?B?U09oSC82ZTNkUFRNcTZPcHBtamVrZ3p0Um9xbzhZTmFPb3plMVJQYVJLUThL?=
 =?utf-8?B?RFJzaytlbmdISjMxOWRMMTNwL245VFloaTFpWC82Mis5Vi9ZTzg3UHBHcXRO?=
 =?utf-8?B?cTJoc0tTOSttbU5JODdvTHh4YTBpU3RQbmJXcnZGa1RzOVlZeXB0OU1RbEdI?=
 =?utf-8?B?dzBxdFpUb2kxaGtWRHprWjZVQzYwTjUzdmVUVnVnSUJPKzN6bjM5SkNwOEMz?=
 =?utf-8?B?cnh3K1lDQ1pVOWNVWjhYMnYwMUtsMWs3ZmlOdTJpWVhZK2xhQVlSZjFlWkVQ?=
 =?utf-8?B?c1RzS0VQdnNiMGovNkFsZ1VPTVZnNE9RNWpZMUFwbFhsVmVvOFFSRUtodkZX?=
 =?utf-8?B?UHlBeUdGajhxbW9kY1kza3NENjBEeXY1KzZ6emVPMUFNYzZsQUNuOHk5ejdz?=
 =?utf-8?B?SkQ4Z3dvLzE1NGw1L3dmUXdUbERhMlU3MGZkRTlvcFBXTGhDcng3TXVZYVZS?=
 =?utf-8?B?QVhXYWpiVDRPeXk3THBFQ0FMUmZ6WmJpV3lFOURZa0ZxL3BOZWp6b0t5bE4y?=
 =?utf-8?B?aVl4alJyUVAzc1doeXcyQTdUK2h3ZnRaZFBXV2pQNGpJSlVRMFgyU3RrZWZI?=
 =?utf-8?B?eTFpTGxLU09SaUJrSDlES1NjczJRaWVWaUF3ZUhEOGlUWWtRN3N4Vkhja1Zm?=
 =?utf-8?B?NC9oM0dCVGxSaHBJeHVaVTNicmVCODFPOVd1LytvQnRITWZ6L1BldGNjUXBX?=
 =?utf-8?B?SkUvVXBBTGVFUjZxcTN6cFpIUkpBOG1lZEQwWGxieDJEOEFpWFd6L1BqeSti?=
 =?utf-8?B?Z3pkaWFWUXVvYitQMkkvRnVjRFJYMG9TM08vMXZlZ2Qxa0FQdlBPVC9neWJr?=
 =?utf-8?B?YWxpTVJFT1pUK0JxNzRuWmQ3dnBFS1pSaHdiZXpYWnNKYzVmVzd4amJRTjE3?=
 =?utf-8?B?NnZRZ3B1cEhyVkxTRmxCeHo5bytCRjhYVElCanJOV2R3S05XTVhVVmRSdlRa?=
 =?utf-8?Q?VtkLsft1uDQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhPY09nbFAvdFE1YXZIcDFrWkJwVnpNSktHTzJOU2p3M1Q4a3FnMGtvdVJL?=
 =?utf-8?B?ZTZtNUQydGNSWjNvZUJIelBqRm5MNXZabjBrbmtmYjlCTTBFSldqaWFOeURs?=
 =?utf-8?B?Mk5paUczUkRyTjVMZU9oMStTK0VhOEd1YlRlWStTWW95STN4ZE5ybXFRNVVL?=
 =?utf-8?B?VDRGd2NEUGxyeWxIOHhUTUtwbVRRSWtyR2pkQWtjSEVuSFNwcFNwK2kra3ZN?=
 =?utf-8?B?N3lxYTlXeVpYb0RWc29sRkdqYU9UYjhTRHduU1VrRHlWNXBEOXFIcUwwaDhW?=
 =?utf-8?B?ZHNtZ0M3VHNmVFR2RE45U2hGaEhCK1MwUFFWODdPSEExRDVDcHhIRjZtTlBs?=
 =?utf-8?B?bFdaVFBUYmxvR1ExWXJiUzlkRmFBQ05iWmQxODVhQndsa3BYOC92SDZGaTI0?=
 =?utf-8?B?b1pLd00xZDJmSnZPK3Boc2d4WlpQNjhYVXY2ak84b2p4Z1p4b0VIZS93QU1N?=
 =?utf-8?B?UFRnMkJva1FFYTlkamsrdW1JL3FOSytzYnZ3ZEJ3c2hyTXVFd1ZUaHZ3WVhW?=
 =?utf-8?B?S0c0UVpHbDliaFUxWEh6YjI3R1g3dzEvMEcweEpZSzRhZTZRanNTMlZnRWho?=
 =?utf-8?B?bzd2NDcrZGpyZHhoSHNoWWNKRDRuZjdDWjJsR2xNUG03MXRjK0RtN0lkM0RC?=
 =?utf-8?B?N2ZXZ25GdktKWG1LckxicUNVcGtFV0RNLzM5MUROeFBYWW9ZNDd1WmxEZWx3?=
 =?utf-8?B?akxWekFMVEgxSW9rejA2Uy94N2t0L0I1aUErU2c5VFcxd1ZYSi81T2w3MGxj?=
 =?utf-8?B?a3hTMUV0dDRvbk5MVEFZbU8wZ1kzU0xsdkcyc3h2T2lzQjVPcEphWmpiSEFZ?=
 =?utf-8?B?d2Z3WFJwZHE5VDU0RE5OOFpQT2Yyd2Q5ZkNRbitzZWplN2NRWExJcmxoZ1dt?=
 =?utf-8?B?R3Q3Vy9yZHA0RXR5L1RqVHRRSVZleFZrdXRQVVV5dnE2cXJrbDVWZE9NY0d6?=
 =?utf-8?B?bU14WU9jbHZjSTY2UFpKN2M5ZUovUHg0VmZ2MjNpbTBBOFFRZ0JvN21HM0Zz?=
 =?utf-8?B?ZTZTOWtjQTZJQWd6a0tJeEVYRlJ2K2QyaFcxR3RreExvMTlCNEJIbVJzbWRQ?=
 =?utf-8?B?YVB1V0llNXYzVE1HUDBaOFRObUpTeGtNUkZjTnFKMUQzQldyZHZLUkpDYjRR?=
 =?utf-8?B?bVRVUEY1cm9XdDhNNU5naXp1NEFNMlBONVNabE1iMFVQbjBlOE40VVEyanBo?=
 =?utf-8?B?ZmZyV1pCOFpHT0dvSVZ6NGNRSlg1ZnplczZKakhQOEQ3M3Q2MVpuVVEzYXlI?=
 =?utf-8?B?a2lSWXJYYWU0VHJ5MGhRR2w5dEJ5SmtkdFBVcW1QYk84OU5acjJOUkhaVUtX?=
 =?utf-8?B?YUxobTlhY0hiN2JyUmJzOVFMSytpQ2NxQ01pSFR1ajdNVVdxcGh5TnoyQmli?=
 =?utf-8?B?V0lGSWRKM3MxYVRxaXR3czVjZmNyQlFWL25Gd2d6b2c5ZjFoM2tCWnl1RTgr?=
 =?utf-8?B?V3RpWEJ1ZVFXQ3I3SUJmVjMxNWgxaVhSYzF6VjcxTy9NaDFFazJsejNkajBB?=
 =?utf-8?B?b3BQanA5QmIrMHM5Vjhrdk8xM0RjRnN0SWZoV09RN2hWSmUvNHM5UmcrS1Yy?=
 =?utf-8?B?THhOcDBQdnNncDRvNWxQa0FlZSsraEVIRHlId2pjbUowemZqM1ZHSmg0djdj?=
 =?utf-8?B?RlFYdHpTS3JxRG02ZjFLODBqR3ZDWVdORmhKa21XNXBuaDNHOE9OVU5sRUxr?=
 =?utf-8?B?YWU0OTZ0Q0txVUp3cSttK1E5amhBY1pMY0ZsSktEdFpqLzRab2lDcHp2TVZn?=
 =?utf-8?B?V25WM0YzZ0ZYc0tnVnlEeERldUM0VUkwQmZFSkxKRW8yZkRmZHdudzRwdHYz?=
 =?utf-8?B?ZVQ4MDJyclVmd29rdm81V1cwRXRScVhvcGRBUTBmMXdickRvajdrSGNaK0Iv?=
 =?utf-8?B?T2IzY2UxNUJkaXJOSG1od3FlbjVzNk0wUEZNSnFOa1RNQmlzWGcvbUdUSmk0?=
 =?utf-8?B?ODk4VFZIVE43U3BmSVdVSloyWjNoYWV1ZUYrdVNPNmtUNzJiUzlOM0c5eVk5?=
 =?utf-8?B?b3ZSRTZ4akZ3ZHZzM3IwNWg2SHpzM0Z1eFNySlJkUmRReThhem9NZzdZQlNG?=
 =?utf-8?B?UnpQc0dtVy9kNmJlS28yK3NBbTV4L05uS2JTWHZ1c0xnUlpvbmZyMzNQa3Jt?=
 =?utf-8?Q?XO5yy7OhKOi+lOIIXIxCXEGOI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2374373d-899b-4bf5-3a0f-08ddbee47331
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:30:55.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hACz5Cfcs+stJ49ch9cXOBQ++zsnmQCXGtMpvFOPpv8GnjB3EgnJBd4Fp1d1O3weo3mIxrcqw1vYiDoy+mbsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970
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

On 7/9/25 00:10, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
>> Make THP handling code in the mm subsystem for THP pages
>> aware of zone device pages. Although the code is
>> designed to be generic when it comes to handling splitting
>> of pages, the code is designed to work for THP page sizes
>> corresponding to HPAGE_PMD_NR.
>>
>> Modify page_vma_mapped_walk() to return true when a zone
>> device huge entry is present, enabling try_to_migrate()
>> and other code migration paths to appropriately process the
>> entry
>>
>> pmd_pfn() does not work well with zone device entries, use
>> pfn_pmd_entry_to_swap() for checking and comparison as for
>> zone device entries.
>>
>> try_to_map_to_unused_zeropage() does not apply to zone device
>> entries, zone device entries are ignored in the call.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   mm/huge_memory.c     | 151 +++++++++++++++++++++++++++++++------------
>>   mm/migrate.c         |   2 +
>>   mm/page_vma_mapped.c |  10 +++
>>   mm/rmap.c            |  19 +++++-
>>   4 files changed, 138 insertions(+), 44 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 826bfe907017..d8e018d1bdbd 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2247,10 +2247,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>           } else if (thp_migration_supported()) {
>>               swp_entry_t entry;
>>   -            VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>>               entry = pmd_to_swp_entry(orig_pmd);
>>               folio = pfn_swap_entry_folio(entry);
>>               flush_needed = 0;
>> +
>> +            VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
>> +                    !folio_is_device_private(folio));
> 
> Convert that to a VM_WARN_ON_ONCE() while you are at it.
> 

Ack

> But really, check that the *pmd* is as expected (device_pritavte entry), and not the folio after the effects.
> 
> Also, hiding all that under the thp_migration_supported() looks wrong.
> 
> Likely you must clean that up first, to have something that expresses that we support PMD swap entries or sth like that. Not just "migration entries".
> 

The logic for the check is

if (pmd_present()) {
   ...
} else if (thp_migration_supported()) {
  ...

}

PMD swap is supported for migration entries (and zone device private after these changes)



> 
>> +
>> +            if (folio_is_device_private(folio)) {
>> +                folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
>> +                WARN_ON_ONCE(folio_mapcount(folio) < 0);
>> +            }
> 
> 
> zap_nonpresent_ptes() does
> 
> if (is_device_private_entry(entry)) {
>     ...
> } else if (is_migration_entry(entry)) {
>     ....
> }
> 
> Can we adjust the same way of foing things? (yes, we might want a thp_migration_supported() check somewhere)

Are you suggesting refactoring of the code to add zap_nonpresent_pmd()? There really isn't much to be
done for specifically for migration entries in this context

> 
>>           } else
>>               WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>>   @@ -2264,6 +2271,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>                          -HPAGE_PMD_NR);
>>           }
>>   +        /*
>> +         * Do a folio put on zone device private pages after
>> +         * changes to mm_counter, because the folio_put() will
>> +         * clean folio->mapping and the folio_test_anon() check
>> +         * will not be usable.
>> +         */
>> +        if (folio_is_device_private(folio))
>> +            folio_put(folio);
>> +
>>           spin_unlock(ptl);
>>           if (flush_needed)
>>               tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
>> @@ -2392,7 +2408,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>           struct folio *folio = pfn_swap_entry_folio(entry);
>>           pmd_t newpmd;
>>   -        VM_BUG_ON(!is_pmd_migration_entry(*pmd));
>> +        VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
>> +              !folio_is_device_private(folio));
>>           if (is_writable_migration_entry(entry)) {
>>               /*
>>                * A protection check is difficult so
>> @@ -2405,9 +2422,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>               newpmd = swp_entry_to_pmd(entry);
>>               if (pmd_swp_soft_dirty(*pmd))
>>                   newpmd = pmd_swp_mksoft_dirty(newpmd);
>> -        } else {
>> +        } else if (is_writable_device_private_entry(entry)) {
>> +            newpmd = swp_entry_to_pmd(entry);
>> +            entry = make_device_exclusive_entry(swp_offset(entry));
>> +        } else
>>               newpmd = *pmd;
>> -        }
>>             if (uffd_wp)
>>               newpmd = pmd_swp_mkuffd_wp(newpmd);
>> @@ -2860,11 +2879,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       struct page *page;
>>       pgtable_t pgtable;
>>       pmd_t old_pmd, _pmd;
>> -    bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
>> -    bool anon_exclusive = false, dirty = false;
>> +    bool young, write, soft_dirty, uffd_wp = false;
>> +    bool anon_exclusive = false, dirty = false, present = false;
>>       unsigned long addr;
>>       pte_t *pte;
>>       int i;
>> +    swp_entry_t swp_entry;
>>         VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>       VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>> @@ -2918,20 +2938,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>           return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>       }
>>   -    pmd_migration = is_pmd_migration_entry(*pmd);
>> -    if (unlikely(pmd_migration)) {
>> -        swp_entry_t entry;
>>   +    present = pmd_present(*pmd);
>> +    if (unlikely(!present)) {
>> +        swp_entry = pmd_to_swp_entry(*pmd);
>>           old_pmd = *pmd;
>> -        entry = pmd_to_swp_entry(old_pmd);
>> -        page = pfn_swap_entry_to_page(entry);
>> -        write = is_writable_migration_entry(entry);
>> +
>> +        folio = pfn_swap_entry_folio(swp_entry);
>> +        VM_BUG_ON(!is_migration_entry(swp_entry) &&
>> +                !is_device_private_entry(swp_entry));
>> +        page = pfn_swap_entry_to_page(swp_entry);
>> +        write = is_writable_migration_entry(swp_entry);
>> +
>>           if (PageAnon(page))
>> -            anon_exclusive = is_readable_exclusive_migration_entry(entry);
>> -        young = is_migration_entry_young(entry);
>> -        dirty = is_migration_entry_dirty(entry);
>> +            anon_exclusive =
>> +                is_readable_exclusive_migration_entry(swp_entry);
>>           soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>           uffd_wp = pmd_swp_uffd_wp(old_pmd);
>> +        young = is_migration_entry_young(swp_entry);
>> +        dirty = is_migration_entry_dirty(swp_entry);
>>       } else {
>>           /*
>>            * Up to this point the pmd is present and huge and userland has
>> @@ -3015,30 +3040,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>        * Note that NUMA hinting access restrictions are not transferred to
>>        * avoid any possibility of altering permissions across VMAs.
>>        */
>> -    if (freeze || pmd_migration) {
>> +    if (freeze || !present) {
>>           for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>>               pte_t entry;
>> -            swp_entry_t swp_entry;
>> -
>> -            if (write)
>> -                swp_entry = make_writable_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            else if (anon_exclusive)
>> -                swp_entry = make_readable_exclusive_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            else
>> -                swp_entry = make_readable_migration_entry(
>> -                            page_to_pfn(page + i));
>> -            if (young)
>> -                swp_entry = make_migration_entry_young(swp_entry);
>> -            if (dirty)
>> -                swp_entry = make_migration_entry_dirty(swp_entry);
>> -            entry = swp_entry_to_pte(swp_entry);
>> -            if (soft_dirty)
>> -                entry = pte_swp_mksoft_dirty(entry);
>> -            if (uffd_wp)
>> -                entry = pte_swp_mkuffd_wp(entry);
>> -
>> +            if (freeze || is_migration_entry(swp_entry)) {
>> +                if (write)
>> +                    swp_entry = make_writable_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                else if (anon_exclusive)
>> +                    swp_entry = make_readable_exclusive_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                else
>> +                    swp_entry = make_readable_migration_entry(
>> +                                page_to_pfn(page + i));
>> +                if (young)
>> +                    swp_entry = make_migration_entry_young(swp_entry);
>> +                if (dirty)
>> +                    swp_entry = make_migration_entry_dirty(swp_entry);
>> +                entry = swp_entry_to_pte(swp_entry);
>> +                if (soft_dirty)
>> +                    entry = pte_swp_mksoft_dirty(entry);
>> +                if (uffd_wp)
>> +                    entry = pte_swp_mkuffd_wp(entry);
>> +            } else {
>> +                VM_BUG_ON(!is_device_private_entry(swp_entry));
>> +                if (write)
>> +                    swp_entry = make_writable_device_private_entry(
>> +                                page_to_pfn(page + i));
>> +                else if (anon_exclusive)
>> +                    swp_entry = make_device_exclusive_entry(
>> +                                page_to_pfn(page + i));
> 
> I am pretty sure this is wrong. You cannot suddenly mix in device-exclusive entries.
> 
> And now I am confused again how device-private, anon and GUP interact.
> 

:)

Yep, this is wrong, we don't need to anything specific for anon_exclusive since
device private pages cannot be pinned. Other reviews have pointed towards fixes
needed as well.

>> +                else
>> +                    swp_entry = make_readable_device_private_entry(
>> +                                page_to_pfn(page + i));
>> +                entry = swp_entry_to_pte(swp_entry);
>> +                if (soft_dirty)
>> +                    entry = pte_swp_mksoft_dirty(entry);
>> +                if (uffd_wp)
>> +                    entry = pte_swp_mkuffd_wp(entry);
>> +            }
>>               VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>>               set_pte_at(mm, addr, pte + i, entry);
>>           }
>> @@ -3065,7 +3105,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       }
>>       pte_unmap(pte);
>>   -    if (!pmd_migration)
>> +    if (present)
>>           folio_remove_rmap_pmd(folio, page, vma);
>>       if (freeze)
>>           put_page(page);
>> @@ -3077,6 +3117,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>                  pmd_t *pmd, bool freeze, struct folio *folio)
>>   {
>> +    struct folio *pmd_folio;
>>       VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>>       VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>>       VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
>> @@ -3089,7 +3130,14 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>        */
>>       if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
>>           is_pmd_migration_entry(*pmd)) {
>> -        if (folio && folio != pmd_folio(*pmd))
>> +        if (folio && !pmd_present(*pmd)) {
>> +            swp_entry_t swp_entry = pmd_to_swp_entry(*pmd);
>> +
>> +            pmd_folio = page_folio(pfn_swap_entry_to_page(swp_entry));
>> +        } else {
>> +            pmd_folio = pmd_folio(*pmd);
>> +        }
>> +        if (folio && folio != pmd_folio)
>>               return;
>>           __split_huge_pmd_locked(vma, pmd, address, freeze);
>>       }
>> @@ -3581,11 +3629,16 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>                        folio_test_swapcache(origin_folio)) ?
>>                            folio_nr_pages(release) : 0));
>>   +            if (folio_is_device_private(release))
>> +                percpu_ref_get_many(&release->pgmap->ref,
>> +                            (1 << new_order) - 1);
>> +
>>               if (release == origin_folio)
>>                   continue;
>>   -            lru_add_page_tail(origin_folio, &release->page,
>> -                        lruvec, list);
>> +            if (!folio_is_device_private(origin_folio))
>> +                lru_add_page_tail(origin_folio, &release->page,
>> +                            lruvec, list);
>>                 /* Some pages can be beyond EOF: drop them from page cache */
>>               if (release->index >= end) {
>> @@ -4625,7 +4678,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>>           return 0;
>>         flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
>> -    pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>> +    if (!folio_is_device_private(folio))
>> +        pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>> +    else
>> +        pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
> 
> Please handle this like we handle the PTE case -- checking for pmd_present() instead.
> 
> Avoid placing these nasty folio_is_device_private() all over the place where avoidable.
> 

Ack, I'll try and use the presence of pmd to create the migration entries as appropriate

>>         /* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>>       anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
>> @@ -4675,6 +4731,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>       entry = pmd_to_swp_entry(*pvmw->pmd);
>>       folio_get(folio);
>>       pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
>> +
>> +    if (unlikely(folio_is_device_private(folio))) {
>> +        if (pmd_write(pmde))
>> +            entry = make_writable_device_private_entry(
>> +                            page_to_pfn(new));
>> +        else
>> +            entry = make_readable_device_private_entry(
>> +                            page_to_pfn(new));
>> +        pmde = swp_entry_to_pmd(entry);
>> +    }
>> +
>>       if (pmd_swp_soft_dirty(*pvmw->pmd))
>>           pmde = pmd_mksoft_dirty(pmde);
>>       if (is_writable_migration_entry(entry))
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 59e39aaa74e7..0aa1bdb711c3 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>>         if (PageCompound(page))
>>           return false;
>> +    if (folio_is_device_private(folio))
>> +        return false;
> 
> Why is that check required when you are adding THP handling and there is a PageCompound check right there?
> 

Fair point, we might not need the check here for THP handling.

>>       VM_BUG_ON_PAGE(!PageAnon(page), page);
>>       VM_BUG_ON_PAGE(!PageLocked(page), page);
>>       VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index e463c3be934a..5dd2e51477d3 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -278,6 +278,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>                * cannot return prematurely, while zap_huge_pmd() has
>>                * cleared *pmd but not decremented compound_mapcount().
>>                */
>> +            swp_entry_t entry;
>> +
>> +            if (!thp_migration_supported())
>> +                return not_found(pvmw);
> 
> This check looks misplaced. We should follow the same model as check_pte().
> 
> Checking for THP migration support when you are actually caring about device-private entries is weird.
> 

The thp migration check is common to the pmd code checks even above the patched code, the
code checks for thp_migration() and PVMW_MIGRATION. If thp migration is not supported
is there any point in returning true?

> That is, I would expect something like
> 
> } else if (is_swap_pmd(pmde)) {
>     swp_entry_t entry;
> 
>     entry = pmd_to_swp_entry(pmde);
>     if (!is_device_private_entry(entry))
>         return false;
> 

I don't think the code above is correct, you'll notice that there is a specific race
that the code handles for the !pmd_present() case and zap_huge_pmd() when PVMW_SYNC is set

I get the idea you're driving towards, I'll see how I can refactor it better.


>     ...
> }
> 
>> +            entry = pmd_to_swp_entry(pmde);
>> +            if (is_device_private_entry(entry)) {
>> +                pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>> +                return true;
>> +            }
>> +
>>               if ((pvmw->flags & PVMW_SYNC) &&
>>                   thp_vma_suitable_order(vma, pvmw->address,
>>                              PMD_ORDER) &&
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 67bb273dfb80..67e99dc5f2ef 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2326,8 +2326,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>           /* PMD-mapped THP migration entry */
>>           if (!pvmw.pte) {
>> -            subpage = folio_page(folio,
>> -                pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
>> +            /*
>> +             * Zone device private folios do not work well with
>> +             * pmd_pfn() on some architectures due to pte
>> +             * inversion.
>> +             */
>> +            if (folio_is_device_private(folio)) {
>> +                swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
>> +                unsigned long pfn = swp_offset_pfn(entry);
>> +
>> +                subpage = folio_page(folio, pfn
>> +                            - folio_pfn(folio));
>> +            } else {
>> +                subpage = folio_page(folio,
>> +                            pmd_pfn(*pvmw.pmd)
>> +                            - folio_pfn(folio));
>> +            }
>> +
> 
> 
> Please follow the same model we use for PTEs.
> 
> /*
>  * Handle PFN swap PMDs, such as device-exclusive ones, that
>  * actually map pages.
>  */
> if (likely(pmd_present(...))) {
> 
> }
> 
> 

Will refactor to check for pmd_present first

Balbir
