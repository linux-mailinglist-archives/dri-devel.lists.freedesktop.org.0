Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C807C783420
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 22:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BC310E2B1;
	Mon, 21 Aug 2023 20:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3510E2B1;
 Mon, 21 Aug 2023 20:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gge/98u5K4z7SCvSeSzmyJZZubeAik9CKyLK0rzZvlnYuWYfel71BOHmbi5/cx73VV47J7HTcsBsQP2oF6pqdFrvjpbD+vScUYog6aaYBYooSyL1Gy/XNjQHdeQRJU6t9FPHnOKXNpcTYLFXmjtr7C6e36hMS5rsj/mi1HftSQAgsespdkpyd10NfEVO2i6wI5zG6efJnw2f0fTiMb7qLmSnMt2zQ1XoVvHt4ZefKaoLCEBpr/OoDJPK7jyLoN5FxFTT6EQ445/SO+aLWHjafRtVZsBdo94l2/HcB7+GuaZ1OT5Lwf+tj7jw0qhhwsxiZmXMqcl+ioKX7ZYYXEM8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUfeEyNGWR5pSJ+eBvrAnYp7WviJ49oVkr8VMxMnjX4=;
 b=SPXfJKhQI0kATp1XpiBybtLnJ8DGlIHZua0kJh0N1zxKa6k9K/rnijJm4431ZcVwyicRJRhSCDwt50KntOQFLZD8nL8pQE89muRtZJEEh2GZGZqnu1u4FZTSFKWZaHpid+WJhAGoCPyFDl76AW+W2HKmUg2rYavs4m/e2mKA5qOadp5SnR4OPsg0K28/0+zP3EGWuGjlRFEFLZu+06QO8Y7Igw02TWRDZ7FGBLsT76TzM8EWc7MyqQmBai2bWlsAqrSsXpd16eglO8grODXuStJcsOyGJn72+/ajjrAvWIH94sKZ5vnoxGOK4AmEZ2JJh8TcoBW3mf77gBv8eQfpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUfeEyNGWR5pSJ+eBvrAnYp7WviJ49oVkr8VMxMnjX4=;
 b=qkAVX/kYY85BYoAcg05iMqkW130tjhjBSJeWNHJI4jZnbdPHp0JrWfXJnzDEqeX7InJ/hbsI8NMyvA5AqoleJRFZkRrQfI3QkkxQN6fQ4BPTzJ3AP+KoDi4w+dyyzJo725vAIFeBeA95RJAN86Ko8avrqy5BDHv7cs4auxRgICY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 20:57:14 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 20:57:14 +0000
Message-ID: <a9d08612-c402-68fe-b625-3148e4ce3841@amd.com>
Date: Mon, 21 Aug 2023 16:57:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Dave Airlie <airlied@gmail.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
 <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <637ce3f5-a7a9-6a1f-812a-5987211f84f7@amd.com>
 <SA1PR11MB6991E632AFE2684CEC231321921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SA1PR11MB6991E632AFE2684CEC231321921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: ad98378e-fe8e-4792-6762-08dba28932a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjW0/jVlTsmwrq1TXOQoyQTun1uV2rnXjDDA5i1OSQOqBP5yM7BAjVh4pj/6CE+8n63zklQvwj6xgBllXdPWdK94tReJ1LL3HPjyYffZZMETuJ2LByeaLim3GbzcdI8FU4eJuJMWW23lOwEParlaI4tA6a+G2tN3ZfBZuVFbXkAiICeHKvrxYw4uK9axHMTUH97bPJ5WtTvBdCc6gnj/qcrSyEMCf8CUZ4nchz6oqg/aODN+4ks6PJIvHiG6r65twSQR8JqSzKwZX+Rdnac4kKM3FFb/Y2pO+BPzNN/ST7us/7knMgK3YMznYcBEfuShoOa/pGfKuuYVMhXCe2NxLtsvAk4IhInNMgYXrrgC5xn/lk8GaDsI435stb3PX6XHiLWvQHgLW92EgUpe5/vA9H7yNcbKSLit1FDg3BhECCigvdYvR7wnudSj8T21M9P28etFSr+H6Faxa4hRf8c867NcNBjvaAYIvdH2XI8vjEpalWfxtCUhiX0rCyYjU18k+MrAwwbKyAm4Z+/PW4Mcl8MK426cVYVguM7pyLIioom949PF1ahRd6a0MUwNjLiHYZ15MAj4p/HjBbTptD3z8rd8EnjtBiHE+Q18EIlTzPRXPmuLNYEMAXMEjnL+2bIyZYPogp4Gz5hwq+9XszgkbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(36916002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlUVjJNcUlURHdsT0VyV2FIWFFCa3EvblFRbmVRNDBUbEdXYmg3a1k4TzJZ?=
 =?utf-8?B?ZUZUVUpkWTl0UEVSc1U3SVZmd1hYYnZVYkx0WjFPZS9scEFqTDljSTNRRzRS?=
 =?utf-8?B?eHdER3Z2c1NaUHBZRGl1dmdnZWFZN0gxU2wzeDFhWkp3NXFoWkRLcFh2bHhM?=
 =?utf-8?B?SCt1bEpJU0o5dldsTnBVbndIc0xGRVJ6cFp3L0JaUDF0RitYaWdZQlRva21q?=
 =?utf-8?B?L1lyV2VTWGpuVnVPc3dQZWdUVVIzRzRpVDRCMFU1dVI3VVFQTEJZc2ExeXZO?=
 =?utf-8?B?bFJJdVJOc1lMS0NzRm1qdVRWNUxMa3A2NlRRa3hUMzQwZXdJaUYrN094MVp5?=
 =?utf-8?B?OURqSzArdnp5ajRuOEZ5RlphMXlyZGtFUGNQWFFCaStvMi9UYW5tdHNBTDZU?=
 =?utf-8?B?Q3lYc3lsYVNNRkR6dVh2TW5xNi94dzE1c0NEMGVvL3lmRFB0N015QmZpL0pi?=
 =?utf-8?B?Nit0bmRiUFoySDlHQjhjU3BkaXVabmdnMDltTDNRSGNBa3hISE5LWklXTUdF?=
 =?utf-8?B?V3ZHZWpXTysvaUtkeXBId05XeFlhU1NaSHQ4MWlmbHRvNmJ4NlFjMUp5THpl?=
 =?utf-8?B?bzFDOTNyYUc2TU5WN01LR1g1K0I3aTVOd2hFdjd6bXJrZHA5SENjUHJXY1RY?=
 =?utf-8?B?ZzJnZ0F3S0d1dG5DYjYzYU5RNXR3TWRWMy9rQUtTQU9GdjlHOC9IdnFyL2lQ?=
 =?utf-8?B?MnJGQjFRV2xoRU4xOTJMMWYrRk10MURLblljMVJkZi85SXhHTGJHeE9NdU9z?=
 =?utf-8?B?YlZReU9NVldkcld5c2U2RVZ5bkhCTkcvdTUxUFczeStaWTJrVzFpeTlkTGZv?=
 =?utf-8?B?S2swUlhxSDlzRXhjVXczOTZldTZadk9DYnIzeTluMUR1aWVGSndpT25zNXRo?=
 =?utf-8?B?czh6M3pOditJOWM4N2JWcTZPOTJycmUwdFBRYUR1NkVJZm8xOThmZFlkY2Yx?=
 =?utf-8?B?NmxVNWVtVWRua0ZvUGkrcTIwWHlEUHVDaEFITDl2em5TeFR4dzBMMXJhZ1Ev?=
 =?utf-8?B?UExRRzBxSVdqQVlDZk5kL2JkZG1JUkRmb1VlRStETHJkV2wrWGdkclVoWEVK?=
 =?utf-8?B?QkFmZ2pudGF0VXBScFEwWjNZWE1mRG1ZZVZ0L3I4ZmFNc2FSTlpiNENFU2R0?=
 =?utf-8?B?a1ZxWEhSc1VXRCtXZXdPbm03L2IrNEhwVTQ3eHhFUHNtOHBicnE4SXN6ckRY?=
 =?utf-8?B?eTNtSXpzK0xUR2lvd3Jhb0k1MUJBMjhJTVZ5OEIvd0YvQWwwR1RBUUlVVC9D?=
 =?utf-8?B?TGRlVEE4K1dpNk9SamNlUVNWWHNtZzVFZ0QvZHdxNXRyZzRYOVpYcDM4MXFi?=
 =?utf-8?B?M3drVFlKNUJyMUN4NWNYbW5QLytCSzlXOC9vSDZrN2xTejBEVzMxRGNHTW1T?=
 =?utf-8?B?dnNZeS9PTGRjVjhQKzhIWTlMUGE1UTMxOWZVR3FkaDhwSXR4c290ajcwbm5h?=
 =?utf-8?B?L3JXRjJScHdTbEZ2Q0pDR2k4bFJnajVPQ0NtRktCa3MrUXNaYUR5bUYveklF?=
 =?utf-8?B?UGttOU4yMytnY3B5cWxiWkpFMEc5UldJTGJRdWFIRHRzOHRNaGhleTF0dXEw?=
 =?utf-8?B?OVh4aUdyRjhVOWcxY3diQmhlZXlHSGxkdFpLNnc4eHp1dzA2dGlrQzJ4NkFr?=
 =?utf-8?B?VnZaZ3Z4aHNiV2lhZkVxOG1KVGFQNjJEWlBldUpvWHpiTVJrTDJUaHhNYzZO?=
 =?utf-8?B?V1c4VXRUb3ZJMUt4Z28rN1A1WGlZOThEK2hPS3d1NFIwSTBYU1B0TlIxcys5?=
 =?utf-8?B?ZEwrWmxRSnBKMjdzRUtPS3Bhc05rSkJtRndTaVRBNk1PTG9rQldqeUpCV3pT?=
 =?utf-8?B?Snl4eU1SM2kzT0g2aUE1NzhLUXMwSDlKVFE5dDhvbVU0LzhnWjNpQ1dnREJ4?=
 =?utf-8?B?aTlpU0QwenJyM0xFSHhESlE4R0t4Y3I0RVRRUjI3Vy9iMFhPb0pMR002NFJm?=
 =?utf-8?B?dWdQVlBrZjdaZUtNcHV1RmVRTHhkUWFRMjMyWlgyMDZ2d0hkTDBFY3ZsMzFD?=
 =?utf-8?B?NjYvNDFMMzFDenpkZ2ExNCtrbktobEcwSXdBNExvU2x3UTNlR1dCQjgrN0ZT?=
 =?utf-8?B?VmNGMGNZazdjZ3ZEemQ4WU80bVRkcmVyQXdkTnVhM0hBTkVFL0h1V0Y4Z2w2?=
 =?utf-8?Q?PmDy0xQn5h+mduUtqVYzZQlbQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad98378e-fe8e-4792-6762-08dba28932a5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 20:57:14.8588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8TzkHZYdAHf1lhyL2Kd3wqY3GtpjoRBUgkRTaE1KCZ1e6DwuBCHsUZDQ/u3A7PM67vsu1uUsX3hiKDWE6BeDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-21 15:41, Zeng, Oak wrote:
>> I have thought about emulating BO allocation APIs on top of system SVM.
>> This was in the context of KFD where memory management is not tied into
>> command submissions APIs, which would add a whole other layer of
>> complexity. The main unsolved (unsolvable?) problem I ran into was, that
>> there is no way to share SVM memory as DMABufs. So there is no good way
>> to support applications that expect to share memory in that way.
> Great point. I also discussed the dmabuf thing with Mike (cc'ed). dmabuf is a particular technology created specially for the BO driver (and other driver) to share buffer b/t devices. Hmm/system SVM doesn't need this technology: malloc'ed memory by the nature is already shared b/t different devices (in one process) and CPU. We just can simply submit GPU kernel to all devices with malloc'ed memory and let kmd decide the memory placement (such as map in place or migrate). No need of buffer export/import in hmm/system SVM world.

I disagree. DMABuf can be used for sharing memory between processes. And 
it can be used for sharing memory with 3rd-party devices via PCIe P2P 
(e.g. a Mellanox NIC). You cannot easily do that with malloc'ed memory. 
POSIX IPC requires that you know that you'll be sharing the memory at 
allocation time. It adds overhead. And because it's file-backed, it's 
currently incompatible with migration. And HMM currently doesn't have a 
solution for P2P. Any access by a different device causes a migration to 
system memory.

Regards,
   Felix


>
> So yes from buffer sharing perspective, the design philosophy is also very different.
>
> Thanks,
> Oak
>
