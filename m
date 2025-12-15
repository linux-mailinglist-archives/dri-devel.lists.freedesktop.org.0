Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE8CBE698
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79910E442;
	Mon, 15 Dec 2025 14:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4H6uAf/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B033510E442
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgA8R3w/CvYNRqqKje1YEFtCj0YkKNeoiDtH1NS15Qiw5BBpGrViT8aqrcIrYMvL9VoCqKkOQfx+uXt75Wm1EIYQCNik7nNcFxAWsDMf2CmJ2tA11SXPglt4THjctrxJ4miqQQ5MsgrpehH7dOzPY6qa/HVrbqNkgEAyHdXA0EAgVOuo0onmeRwjl54PnLRa0pKvYV9BtFn3V7ucLCZIx9R9fcf60eThCSbIvyy1AYFPLlvNbtP0y8jrJ5XJD5N2VB0ZBaxQkyZ3Zn9uUwxok/5ohiUpCk3VD4AEYC+Has4GoHTcZKA79cSjnDkh+hLBPD6ciyxVQWHwiQumu53LlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdB52pyoPq/3Wb+HhU53o5j1Jn0YeXrhx9opuyMe7Jk=;
 b=VV7w6IRql6RHrxJrP+1iY1VVGsCubszt1L1fD+LXg4e6UsS7KDEyYKlnl650j3ZXOd5d8AX5u8JXrRIc2x3pU/ivHyktw/b7dBvOx8HHEk7V2VhldSTjtjxsX2QhQUoOPCovZVtlJL0l2JFPdXk6H69OWfr6ozOq9H87sPCeN2LH99U/UbSJh+fytoBtJxNUrDp7aW3UxysPGWoT3qI/qLy2pYH/4bIa4/pEIbpB0M1v66Ms27+7qzLi7tJWvtL+YI8UQwfEMICXCNYQnZ6wHRAiaylg57SnqArhAyB7vKfpbUznA+D1tnqjPXDkTy0I55ot5TPQOrLFmB5Hnzu69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdB52pyoPq/3Wb+HhU53o5j1Jn0YeXrhx9opuyMe7Jk=;
 b=4H6uAf/kKP9sLeFJT4mgPbI1vfOHg+TniO2tRKbkzxcNN4+wZSo7pwyCZqff0KZYVX0dDUnaYa3vpCm6J4Uc7sdchfcvgpyrby3g2hQwV4rI2GPIak+Ao/JhoeSa5iIso5Xg6WHb8nOL8X5J1Noh1f2ScLe7prxUYWeaVYjlKU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:53:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 14:53:27 +0000
Message-ID: <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
Date: Mon, 15 Dec 2025 15:53:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Eric Chanudet
 <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0236.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2739a10d-c8bb-41dd-87d0-08de3be9b44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGdlY2lpRHdSRndqRGQwajBBZmFFZkg4UHZKajRDSnRTZ21xMmhUR2MvMzhV?=
 =?utf-8?B?OVNoWXRRTEdXNXUvOXcvaU9RMDlnaTU5RVMyZ0pPTklsSnFMSWIzaG5VZy90?=
 =?utf-8?B?RDlUakNvV2djWEJpRnJqRmwwc1FTNkw5RVpZMHhPK0xrZzNsUWZaWlg5ZEFX?=
 =?utf-8?B?MkJ5cWZuallyR05HbmhKY2RtV1ZtYVYyMzJvTUNXSzVQYTFvVWIrVEprUHA2?=
 =?utf-8?B?MUI4VjdlM3cvUG9ySzg0WVRCWmtyZHR4NFF2QlV6cFdBUlJjWXY2QnlUOFRi?=
 =?utf-8?B?SXlpb3VwaDZOenU4eFRpZnRQTVQyU0RoVVVTM3piYXN1YlB2aFZ0N20xeFM1?=
 =?utf-8?B?L3NhMDlkZWFGdWNFZHpITG5mUTBlR0dkQXNEb1cxS1J5bml0Y2QzV1U2cVJt?=
 =?utf-8?B?WkNOTWxUSVhIYW9mdUsvazAzbTZaOHU3UUpPdjRub2Y3bENrMk9abktvOVRm?=
 =?utf-8?B?VE16YWRiaWNWeS9NSUp3R2dNYTlCVFlENlI4c2xYSHBKdkxVYTBDODdHWGYv?=
 =?utf-8?B?NyttTG1LK0JaTG8wYmliQzZvTWh3YmNjQ21JbEtsMVd6ZXJsR1ptSzNBdjU1?=
 =?utf-8?B?bVhSUmg5UGNHU2Z2WEFXdFA2Q25ERi9iSnE5YUpnNjRIOFR6cG9TWk5rNGdC?=
 =?utf-8?B?ZVJjYUhpUzV2eW5tN0FVNXp4Y3o1aFR3dW0ycWJEZGtKRDRhU1dzSkl3Q0U4?=
 =?utf-8?B?RmhpWWFUOCs5QWNtZXBFS1dNNi9TOTRqRkduNnRXdUwzQzUvMlFqT1dpQ1ZG?=
 =?utf-8?B?SlB5WmcvdklHcWMweFdmUmlBRW9yK0dpL080b08rWndGd3laTWkxYU42QUxj?=
 =?utf-8?B?S25McXAra0oyRHloOWhXREwwRFA1YXhobi9OUVQ4MHhuVHIrOUNFMmwxZmNx?=
 =?utf-8?B?NmdmQzBwanhSN1BmV2Evdlo5VEhMcTl0U09odE84RXljT25wL1lJdlZFVElG?=
 =?utf-8?B?U1lxM0Mwa3k2VHNsVm5jQklzMkYzb3kydlM3MUEvOXcvNFRnZVhRUnV6bEdm?=
 =?utf-8?B?alRicU9ENURWdmJON0NHeVNNeElRSlc4V1E4WUlwdXAyWnFYdW13K1F6b00w?=
 =?utf-8?B?dHlIL3BsblZ5NitxcEUvOGV2eTVxTGxndWxFZkphQ29oVkdxbGJscDlDbVA1?=
 =?utf-8?B?Y3d0Smo4VWdOYVdibVFFSGtMdSsrVFRYMVFkaEp6SXJNSzN0bG5WUEExQ1Rr?=
 =?utf-8?B?MG5FOVVjcXRTaUgxQjF3aE55emRXRHVkaW0vdFo3aEJGUWhENG5ianJ2ZHhx?=
 =?utf-8?B?R1FDMld2cmJzd29aRVlHbXplRTJEalp0UENOZmlIR2VlN3lCdkFxb045eFBo?=
 =?utf-8?B?Y3J1ZjA5OWRPOTNVQm4wbmlWcitzWnZyeEFQSWsyejQ1RFp1dUdPUEtWQjhR?=
 =?utf-8?B?ZDVPcHo4VVRrRXVLcEZNLytScU1pMUJhZkhKbW9sV2NoM3BrcnlvUEdXN1JZ?=
 =?utf-8?B?VFF3cjlRMGg1UlhBUGM1OUZGUzJKOXQwMkk1d1VpV3JhbTNrV1p4a1BwMDJP?=
 =?utf-8?B?K1VPWTUzZENPbmNPTlpJdVc2YWVyTlZJTmZ2VTBVVUI3eWgrdGx2bkxNMGVX?=
 =?utf-8?B?MHNrdUdBUlZoOEhuckhISU13WDcrN3lrR0QrWGhTa1pRVVRoRXUyTUg3UG0y?=
 =?utf-8?B?UEQza3g3Zm44dGI3YXE2NDdOL2FkbE1hYjlINkI3RzU4U2tBSi9WMmZ5Wm9h?=
 =?utf-8?B?VlhYdC9iczRKcGVBTkhVTFA0NE1Pbk5FQnJIZEpnSm5IdDhabzczZ25mVWRV?=
 =?utf-8?B?MTZuQWp3TVhFV0hWV1dVeTdQYjRkOTVNSzE2MGhGQzhvaisvZ3lXQ28rOTZi?=
 =?utf-8?B?Z3VIZzVPVUZWNUZPa3BxMGE4SjAzRnRKaXo0U3o1aTkvNmZrZFVqaW1IU1hK?=
 =?utf-8?B?aEFzRHJkeEJ4SDErdENCcXZxazlxWXZHVXFrK1pXN0Vrdjdxakt0Vk5LWTNu?=
 =?utf-8?Q?hLhhrYqe0XymonzaEE/sXQhYpCimrp2j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1lJQlFrN2t5a2JRQkErRks2NW4wZHdwM1diajZHQmxscVlJNXMzVVJjNUg4?=
 =?utf-8?B?SFlwNlhhUkpYaDBTOVZLb1VSZG5ERkMvcWpRN1hONExBdWFNNUdnb0dJSk9R?=
 =?utf-8?B?VWUvWk9BYUY1MXpKakx0NkdpcTQ4c08wTjNpTzBtVWFSdzI4QTUzVHhobWhC?=
 =?utf-8?B?cVpEUTF4eTh2U3lpd1F0VndhOFVjRmlQYXFmOXROYzJLSzdvZjd1RHdoOE9W?=
 =?utf-8?B?UndXeWdGRjlveWNOVjF3WmhXVWRKR1ZxcnUzSXI4N3RCMXFhWk1QV09objVC?=
 =?utf-8?B?VXV6UzVHaXI4QklaamduWVdhaDdKNEd3aC9Za0NMTEZWWVI3cVFSQWlYWnFr?=
 =?utf-8?B?V0FzNTArM2dkM21zckN2U1N6eW5FZjhRNG9Wbmh4R1RnbjhaQUk1WGFQWmk4?=
 =?utf-8?B?VDg2Q2JvWEQ2WXZBSDRMdTQ5TkJoMDhhYTV1Q2tBcDVKVzV1Njg3QXg5YWdr?=
 =?utf-8?B?QmRDcXZTZ0IrMjJ6Um5EZ25RTlU0dEdkbTRjRjdaQ0xPcHBUMWFucWo1ZDZn?=
 =?utf-8?B?d0dyajd5YzJrVjJJRDRlenRiUnFlV09DelpGT1JEaEZEYXdzbU50MThiRWw5?=
 =?utf-8?B?WjFFOUpXQmo4N2Q4QUZoWS9hbnFUVEd6Rmg4N2pSNldyY08ya1BuODJOczdK?=
 =?utf-8?B?Y1lrYjJnZlZYYXdXamFidTdlRHRqWjA5VUFlN08yNE5qUllTNUM1enBTS2xI?=
 =?utf-8?B?SUdEZFBJcTZBRDJpNEo3YmhXaWY4ZnQ4UmJDeWlLTzNjSnFKVTN5d0FrS2dO?=
 =?utf-8?B?WEdJRzRKTmVXWW43ODNPNWdYdkV5TmJCendTS3lweGx6NUxydjAvUkkyRGhr?=
 =?utf-8?B?UndQamQ3dWZQQ3RKR2NENUJIcXM3K2ZoMFVRRWlNbk1tcnhDSnpTUmh1TEpr?=
 =?utf-8?B?MjF5T3BBdXhXVE5rbkN2ZFc0SkRIb3lxTFJTSjh1WnRJaHlZZFVpYVBMay9w?=
 =?utf-8?B?bkx0NFNUMmJlY1JSZ0pWQnBScjdWYndRS1RpZkJUK0JuODhGL0F2K3Fid1FL?=
 =?utf-8?B?bHRiQWUyT1p2NmJYR2JpaWhHRDJ3amNTQ0t2VVk3S3YyOERLbHlrVUhzdGNm?=
 =?utf-8?B?eGZMeW1XTTIrVUM2aXk1QlQ3L25RSmsvekF5NGZWcWNsdHZCMzdjbFdKeTJ4?=
 =?utf-8?B?MGVxZXN1dFUzeUpETmdTUEVHVDBmR1AvOUdUVjlIZmx6aWp3WGErMlNtRTJ0?=
 =?utf-8?B?Kyt2Nlk5WGNyM2huenJ2ekNYby8wN3VBbm83MERCK3dUNUoybTY0TUtWdE1y?=
 =?utf-8?B?Wnd5T0tpN2R1UElQaC9XcVFxcHFZZzBZY0VqL04rZDBJSWwyOUNVOW9WRU13?=
 =?utf-8?B?M2ExVW1xd2pqN2NicDBrMGtIekdGWlIza2I1NCtJNlFqdmEwSmkybit1VDNG?=
 =?utf-8?B?TEdleWdaTG5RZ3hzL1dEYk5tNVl3LzZOUVFkSktNOFcxaHplcjM0R0lBZlZT?=
 =?utf-8?B?eVBjbHBPRFl5R0JWNXJTVGp1c3FxdENEckVMS2RMS0lXTUdkczJZOGtISXIz?=
 =?utf-8?B?QkNNYWlHWkhRTGdNOVoxY1ZML2VITWtDSHBrZ0s3bGFudS92amVPbjU1VGxq?=
 =?utf-8?B?dTZyY0VsNmFmMkN3L1MwbmhLYXhEQkZuQllTR1g4QzFXS1FFK0pBUGRTUjEy?=
 =?utf-8?B?NzByNjRXSnZNWkhZZzdneVBRWEtucTVlL2JtcUVlN3dxd0RWVVFYMFpDK09Z?=
 =?utf-8?B?bkZaSTAxR2E4cGVDLzl4eXQ5Qld6ZjdOVzNSYWJZVWU4L2xPdzZrcUdDc3Rq?=
 =?utf-8?B?Q0xJcUtRUlJyRkU4bk41azNoSXVWdGlPbTFxZ1AyWjdYeXpLWDRaekpRTkhj?=
 =?utf-8?B?M2NkNGtma0hoam9mZmhnd3pvNjJscjZmRGgycGxtOVlYbDBQZkk1N2dld3JR?=
 =?utf-8?B?N2tFMlhaZUxic1l1Vm9KeEMzWVhrZHJSMjVldFlVc3ZuVFBmZTMybVRlZExQ?=
 =?utf-8?B?WVR5U3NHRTZ4dWVqcHd5TW5qdUd4anVtSmc5NjVmVUNocERtU01sWUdLbFNk?=
 =?utf-8?B?YzFPRlZQRzBzdjNhYnBqR2JwSUc0ZFNuVDNjdGxieGVYa2ZpVTNXMWxZOVdJ?=
 =?utf-8?B?M242NEl3bjdTSTNjTFhZcXByYkNSNWE3QkdwVi9Lb1FhZU1SZCtkV2xxNkdM?=
 =?utf-8?Q?U9sMRF6dkTHeSKXrTfGrBKl7o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739a10d-c8bb-41dd-87d0-08de3be9b44e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:53:27.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9J6nbpwEgJ3XhPONgv8Bt1bRJ5U2MmXoBVYogt7ug4qYXzD+9/ECqORRHRRCBNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
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

On 12/15/25 14:59, Maxime Ripard wrote:
> On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian König wrote:
>> On 12/15/25 11:51, Maxime Ripard wrote:
>>> Hi TJ,
>>>
>>> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
>>>> On Fri, Dec 12, 2025 at 4:31 AM Eric Chanudet <echanude@redhat.com> wrote:
>>>>>
>>>>> The system dma-buf heap lets userspace allocate buffers from the page
>>>>> allocator. However, these allocations are not accounted for in memcg,
>>>>> allowing processes to escape limits that may be configured.
>>>>>
>>>>> Pass the __GFP_ACCOUNT for our allocations to account them into memcg.
>>>>
>>>> We had a discussion just last night in the MM track at LPC about how
>>>> shared memory accounted in memcg is pretty broken. Without a way to
>>>> identify (and possibly transfer) ownership of a shared buffer, this
>>>> makes the accounting of shared memory, and zombie memcg problems
>>>> worse. :\
>>>
>>> Are there notes or a report from that discussion anywhere?
>>>
>>> The way I see it, the dma-buf heaps *trivial* case is non-existent at
>>> the moment and that's definitely broken. Any application can bypass its
>>> cgroups limits trivially, and that's a pretty big hole in the system.
>>
>> Well, that is just the tip of the iceberg.
>>
>> Pretty much all driver interfaces doesn't account to memcg at the
>> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
>> V4L2.
> 
> Yes, I know, and step 1 of the plan we discussed earlier this year is to
> fix the heaps.
> 
>>> The shared ownership is indeed broken, but it's not more or less broken
>>> than, say, memfd + udmabuf, and I'm sure plenty of others.
>>>
>>> So we really improve the common case, but only make the "advanced"
>>> slightly more broken than it already is.
>>>
>>> Would you disagree?
>>
>> I strongly disagree. As far as I can see there is a huge chance we
>> break existing use cases with that.
> 
> Which ones? And what about the ones that are already broken?

Well everybody that expects that driver resources are *not* accounted to memcg.

>> There has been some work on TTM by Dave but I still haven't found time
>> to wrap my head around all possible side effects such a change can
>> have.
>>
>> The fundamental problem is that neither memcg nor the classic resource
>> tracking (e.g. the OOM killer) has a good understanding of shared
>> resources.
> 
> And yet heap allocations don't necessarily have to be shared. But they
> all have to be allocated.
> 
>> For example you can use memfd to basically kill any process in the
>> system because the OOM killer can't identify the process which holds
>> the reference to the memory in question. And that is a *MUCH* bigger
>> problem than just inaccurate memcg accounting.
> 
> When you frame it like that, sure. Also, you can use the system heap to
> DoS any process in the system. I'm not saying that what you're concerned
> about isn't an issue, but let's not brush off other people legitimate
> issues as well.

Completely agree, but we should prioritize.

That driver allocated memory is not memcg accounted is actually uAPI, e.g. that is not something which can easily change.

While fixing the OOM killer looks perfectly doable and will then most likely also show a better path how to fix the memcg accounting.

Christian.

> 
> Maxime

