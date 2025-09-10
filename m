Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F594B51E4B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C3D10E982;
	Wed, 10 Sep 2025 16:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jHBmzOja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C880C10E981;
 Wed, 10 Sep 2025 16:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtKXTJgJJSfLAMZxdf+YW7M+5FP+voVO4DFxPiIO729XPc1YhBx8ISw/xFlAmt/DVaUMbxrTQwM/bR0ptQHXetU2UIVFO/49z+CC2EJvi8VF+OC69/zDZUfPNWpET7d9AbSlpaTFtM+HMJkSk1If2gr7HYecEaAIoil567emuC7HTII40X6/f5q1CDcfxSuCuLHUtlPFW4Shk+5NnJ59iILAu3hbw3Slp9tbYmYMLDZLxaTvUa4gZkwOcQ9p1D97GcOSMuGojnASTabOlzM59nESoC3NKRzgJijKvcqdJU+bxdJk6xMX0xhLpI/HpWNhmNVmYpdOeRTO0oFtw9zLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2QxeDkt3ULLt1PHw6M0/A2Uc0klUtlh4dvPFGx/cMk=;
 b=W6E/gP1xoMxEFFa8SlmzO/SaY9CcGFf9RrKCBMdH6d7TTUrFuQ61zz08DVnz3oFES+kLlZwYA7RtgfzHAFWoGMdyln4E585D/fdt52RfPMnSsxyhPh+MNB+/QvqJp6eH6LNpqCFbVSwtxmvaUWzrGQBcURtC1hPlPZB5aaIcxsRJU7AEUSnJAnHJQyiHXIpK4bSWETCtTYIYYCDtCkVc31mPKatW9l8GPniPdZMFf53eDgN8Do45KPmJPD4XMQfW709LRfqNwzdqQ8WdnJfu3boLxBJFk1UNNMVbWYDBebCx0RAcaVUZp8D0zjMAu5/BflhsTjs+phiuVzx4ps8JNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2QxeDkt3ULLt1PHw6M0/A2Uc0klUtlh4dvPFGx/cMk=;
 b=jHBmzOjaJ6qtGHCeU6IlBJQAVVXkAN+6RRT6Jy8xrFXL6QHtq6OmPKvx2k5tdUN9hwVt7n0AjjIhDonW4mlfr2hMCjY3zMqKZIzE3TEUivWRZ6HfKjArZneaS04OOuILdvhdjyBeoh+7S74VRG/PkgE5owBugQ8jY5Jpo8YyatM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:52:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:52:03 +0000
Message-ID: <e1a46ac1-8e43-4a63-bf59-b9a7c04de40a@amd.com>
Date: Wed, 10 Sep 2025 11:52:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] PCI/PM: Disable device wakeups when halting or
 powering off system
To: Bjorn Helgaas <helgaas@kernel.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
References: <20250910150603.GA1535543@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250910150603.GA1535543@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0102.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bc817b-0790-410d-2d78-08ddf08a5e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlZyV1p2V0NPaWpyTEFQUERQZGd0RTB1cVVEYTBGTlpnZTIycitmc1hqYTFD?=
 =?utf-8?B?Z2pHOWZxVzVsWU9hamFyNzMzM3k5a3JYZnBRVElwM3UyOCtvTFUwRTJDYnZj?=
 =?utf-8?B?YVpzZW82cERHTkVBMzFJc0lHSTFjR3N1VVJJM3JObU9hazNyQ3BYR09tb0JZ?=
 =?utf-8?B?emF4WHFNcTVDY0dsblVVM3gwYjRkTDU1alRLN0lnVGVJUm9Hb1k5Sy9FVUZR?=
 =?utf-8?B?eW5zaEhQamFiWjhUY2xJdm5EYkorQ2lYTTdxbUZuR0hVQk1aMEpkNDNrVXI5?=
 =?utf-8?B?SXNiMEp2d0ZjMGtDRWgrdk1RZW9iV3crNjBuc3VPMFpxNzNvSkZ1bTNYdkx2?=
 =?utf-8?B?V01yY1dQQlIzazA2OEJrcHJRQmlXVEkzTGIwQnBFTjZBT0VjcWNkNTNGdFFS?=
 =?utf-8?B?U05MUWxpYUhXZXVmOHB3MXdqejJUblFLYkdFb2xQNSs2YllmR1kxRGsrY0gw?=
 =?utf-8?B?SVpvc0FrVU4xbWpxS1dDbEZpUElYd040QUVJYkVlY1NUR1BCZkYwL2h4anBU?=
 =?utf-8?B?TkZZcmU3Mm5pYTNTaXBnRnIydTNuNFoyL2YvRWJVOUtkSDNFS1FsM2dxZnRO?=
 =?utf-8?B?T2NIK1RmZ2Q4Qkc2bnJUZ1dmZWk3SmhvZnQ0V0NLMStCWWxuR2hwMDAvQmJN?=
 =?utf-8?B?eHpjRkdNVGFsRG9ydThkWm5KVFROelNBU2czK2hMc3FWNm43V2pVS2RPSXhu?=
 =?utf-8?B?em52aGpRUzZoWHpYVk1wbFVqeVNzei9ScHFKekdmN2M2RHl2ckpaT096RG5x?=
 =?utf-8?B?czBBa3ZGcDlCRXMwbWtHZ1J5RUJTOFhidTAyQjF0WEtsbW9RdDVlYThWc0tK?=
 =?utf-8?B?amdhOFA1NGFFVG1VK3N3TnJDSE1rTXdrK202Ry9iUUhJaEN5UHB1K3JPQzRF?=
 =?utf-8?B?Q21abGlzWkZSOThhZ2kvbUZNbnlYeFRDd21abXdtRFZyWlo1WHRMSFZ5dEoy?=
 =?utf-8?B?cmdZa01NVkoyS0Y0VmpzbHA5dWhHTTdpckUwQ3dDeWV2bTk2Zk9BcnY3aWpv?=
 =?utf-8?B?L2tGR00rRWpxcjVZcG5IYWg3a2JaUGdES3pRMThqSG5IUm5hbXJDRkovajd5?=
 =?utf-8?B?TEhJWGF2VW9JTlhiV2tVRG9tWHNTQUU2Z2dzYjE2TEFNS0lOaEdnTm1nN2Ji?=
 =?utf-8?B?elBoZk4zOERsU1F2dWtsb0hPQ0JDTXlXQ3FaYnFFUUpQamdqaHZBSFJkelhx?=
 =?utf-8?B?bktHN0taUkU4SDZVMG1VWU9Cb1pseGdEQWRWcUhXYXh5Y05HK0ZJalNSWlZh?=
 =?utf-8?B?NktHNEFrYU43VVNVR21ONkZzem93alNhMGFUNzVrc2FZTXFBS3M0Y2JtVlA0?=
 =?utf-8?B?TGYvUEhQdlV0dytNOFNxUzI0NFMxMHBuRkxoSjFzUHdJbzRiSG1CZm5BV0t1?=
 =?utf-8?B?azRVYzY3VDZxWnN2TXZ4Tk9EM05BQkhUbXpBOVhDZzFPWU1ub0NZZXpoR25U?=
 =?utf-8?B?U2hsbXVYN2Jqd0s3Q2pKajdtd0ZueGx5M252c0ZIL2o3S1JiVE9zS2Nua2FC?=
 =?utf-8?B?cXUvaWdrd0t1Q0NlZ1pGK0N3bElGU1pHVjNHbG9obk8xTnhGZUE3citWUGdh?=
 =?utf-8?B?TDZUUlB5Zkk2QjBPaVpKbkRueEJKZ29qcnpnYzNnczdVZ1MwSGlJd3pSMHRU?=
 =?utf-8?B?SlZiZXArK2NBb1huOTFjSG43WUxHQ0NOTFJoMm40NFJsVVA5Ull5SHBnTVUz?=
 =?utf-8?B?YjhqZldXQVBDZG9lUHRYT252dStVdnZBNFc3WUJndGlSWjJxU2t1T2MyNjhU?=
 =?utf-8?B?NWRLOVI0OHdpS1pPVWNhOGVjL1BFT2xMNHAwSnFYS2VZM1RFaHJxeHhBUXdP?=
 =?utf-8?B?S3NFa3IyN2s3bXNFeTMxR3ZvM3ZFT2lHVTJ1MWNwdW1QeTlLWTZCbkM2ODl1?=
 =?utf-8?B?aW1SM0N1QjFtU0MrN0dVcUEzOU5Dd3A3VW9tZWJuOCtxUEs2NC9GR2ZtekFm?=
 =?utf-8?Q?Nsm4AqYFsP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxKWityRDdoRU1SSUZ1aWFaTmt1VzhOeXNsY0FIMHlpZXV1OE93eXFVaEhI?=
 =?utf-8?B?bDVyeW1tZU8zMmpDS2Fhc1paQU5iOEVzYWVtSitxNFpoalRTTjRac2RpSC8x?=
 =?utf-8?B?NDluSVBaUGxFYmtXM1Q5WlpSS3gvV3JWMTlpc2FhaEtzajhEdzRXWFFEbTY2?=
 =?utf-8?B?ZzQ3aFo3OGZLaGozdU5UbnR0YzdsZFpiemJacWtYdmJGWFFLY3dLTDhzVUdG?=
 =?utf-8?B?Nkg3SXlpSWdJQXdnWlNkbTF3ZzMrazBLUW1TQ3R1cWg1WGh6N2VYdlJoRzZO?=
 =?utf-8?B?Y3R3WGJoaWxDY2VScUMzWXNBZHVVdGsxeDlIZWQ3WXJPajROcE1Dc2VQMkVq?=
 =?utf-8?B?ME0zcVoyT0ViU2dYZnp5ZHh1QTZURjBLVjdQUndkdWdWZXJFWmJWWHIwWXJs?=
 =?utf-8?B?K1VtUHJ5ZkZRdnMveG42YmRjZVNWVWF4V3p2ckl3RjIwTDRZbVdXSE4wTjN4?=
 =?utf-8?B?K3RSOStMNk9rZnA1SEpkNlFoNmJacGVhWi9OemlKemdhdUwyZ3VtN1RYR1Ni?=
 =?utf-8?B?NUxvVmI5aFZTNko5TWh2b3NTTDhLNVorRm9CU1NxWG1acitOVHNXRWVQMG5Z?=
 =?utf-8?B?VnVsOEYxSzlTa0p2b0RveXkwdXdXbmZOOEhjZm1MUGhTMVM0TFo1R2EzMUYv?=
 =?utf-8?B?bkpPeTMwMVVMZEVZTVF6Q1creG1nV0ZlbUUweS9SbUNXNFlEZThNUE1hSlNa?=
 =?utf-8?B?S1BtOEg4SkNQWHBRaDhSbjFtUVZoSGZoMUFoWGtUOGk1TnRKTnNGU09LczN2?=
 =?utf-8?B?SzhGZFFIajZJeUcyZXgva0Y4dy9UQVh4UDdLZ2dMM1BSdVVGRndXTHFHVmJt?=
 =?utf-8?B?TWc2MlBnRXZNd2lRdGpwTHhWSU5JVlV4dzBudnlJYTJ6VU8yWlVDT1hJS3hK?=
 =?utf-8?B?ekVkd0pPMzRRVUdsUWo2R3EwV1RPeFV3SmZPUFZFT2dvalM0RGE5anMzK0xz?=
 =?utf-8?B?MWYySDNIdnFSK0FIMnVldC9OUFJuNnB3SjdyUE14U2FJR29sRFM1b3BjZ2Rx?=
 =?utf-8?B?MmROa3RId0JUL1g2cHBpRVptYUI1cjFTUUw2T2xxRXRhemhEZlVKN0ZJdGIv?=
 =?utf-8?B?YzFwdFN3ak4za2d5OTgvc1BFZ0hyNFdtNmRJYzFtVU1Jc0k0NXFBa3I2T3Q5?=
 =?utf-8?B?Qi9GeEhIcG05K0FQR2dweVVZWWt1L3ZDUWo2aFY4cG1rUytuZDRZR1Qyd01C?=
 =?utf-8?B?Z1gwNkF0NWNCRFRVa1ZIVmRodkJxOWZWSlVQSmw2Wnlta1FnQVcxSEV2QWcx?=
 =?utf-8?B?cEZ2RUV3NkpzemxBRFNqZjh0ZGdtbU9IRVdITC9HWEpvM0JFUFZWNjFRayty?=
 =?utf-8?B?dnFrOGtTSGg3blpsMlNOZVpoZ0ZlaTVCWWhuSUFQSUVNc0QzOUtmNS9Xd0VI?=
 =?utf-8?B?N01zaHhzb1o3L0lXaEtZTE9MbWhHeEE4MmxLUmtEeE55VkllQTJSdGMrVnE2?=
 =?utf-8?B?OUhKWXZqZHJWNEFmS2M1MzhOMmc1THpHTmFFVjQ3TEtJbEVEN21GOUtsclpQ?=
 =?utf-8?B?YUx4dDI5b21abzFjbm5kK3k1WDJVYy9FQmtZNEJHR1JicG9ReitkQy9neXpI?=
 =?utf-8?B?SzF3ZWtybVVFbnViZ0c5Nmc3TFQvM1pWdHRZb3FiVTlPNFlqUm5LVXc1VFFo?=
 =?utf-8?B?NjNyMGExZlNiNEZsbUR3TGJOSEEwN2kwNVFqRmVJYzUzZ2x5eDBCK3J3REsy?=
 =?utf-8?B?ckEvNXFTSmpmQ2JicUdVUHQ5bTlRVkFQTXdMektpNTFaRzJJTGF0NFBjUElk?=
 =?utf-8?B?SW1NWGlaWTg3WnNlanc2VHZTRWhGZEZ6d0dQSSsvYVlkeFpzc3BaRkpWak00?=
 =?utf-8?B?eDBMamJybXRMbWFCdU9MdjA2eDZBQzFYNzlIcHMvVUphQnEzZHl4TldoSzI1?=
 =?utf-8?B?M2xjNCsvVjRsQlU3SVMzSHB3aHRYWFZ6d0dqN3NHOVdHS3BweDF0eVZLbnFw?=
 =?utf-8?B?WUNoV0xRb0dqMEJMQmxFSUFQaUZqQW5tS2xqSFVBVkVKVCtscUpJVCtweENq?=
 =?utf-8?B?d2tCbzJwTFBQOTJUV2liTk4xZ3h1NlYvQ2cremJ2WnN5RnNpdmFhM2Q1OE0r?=
 =?utf-8?B?Z2dpUk5zOEpaSEpYYTJZZDl6MDh3LzRXTzRTamJZNnlBTW9xd245RElrTFpu?=
 =?utf-8?Q?coHBXW19Qq95xHHWlAh/iALRl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bc817b-0790-410d-2d78-08ddf08a5e18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:52:03.3261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFZzCSvRkBWjXzFKwwyzpH721eiZgwFEgq/HEaeu92RpdKq/V0C/R+eSkeGjAI7xkaEVJfuIWmQcfQH/4CHDgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
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

On 9/10/25 10:06 AM, Bjorn Helgaas wrote:
> On Tue, Sep 09, 2025 at 02:16:12PM -0500, Mario Limonciello (AMD) wrote:
>> PCI devices can be configured as wakeup sources from low power states.
>> However, when the system is halting or powering off such wakeups are
>> not expected and may lead to spurious behavior.
> 
> I'm a little unclear on the nomenclature for these low power states,
> so I think it would be helpful to connect to the user action, e.g.,
> suspend/hibernate/etc, and the ACPI state, e.g.,
> 
>    ... when the system is hibernating (e.g., transitioning to ACPI S4
>    and halting) or powering off (e.g., transitioning to ACPI S5 soft
>    off), such wakeups are not expected ...

I will try to firm it up in the commit message.  But yes you're getting 
the intent, having a wakeup occur at S5 would be unexpected, and would 
likely change semantics of what people "think" powering off a machine means.

> 
> When I suspend or power off my laptop from the GUI user interface, I
> want to know if keyboard or mouse activity will resume or if I need to
> press the power button.

The way the kernel is set up today you get a single wakeup sysfs file 
for a device and that wakeup file means 3 things:
* abort the process of entering a suspend state or hibernate
* wake up the machine from a suspend state
* wake up the machine from hibernate

> 
>> ACPI r6.5, section 16.1.5 notes:
>>
>>      "Hardware does allow a transition to S0 due to power button press
>>       or a Remote Start."
> 
> Important to note here that sec 16.1.5 is specifically for "S5 Soft
> Off State".
> 
> S4 is a sleeping state and presumably sec 16.1.6 ("Transitioning from
> the Working to the Sleeping State") applies.  That section mentions
> wakeup devices, so it's not obvious to me that PCI device wakeup
> should be disabled for S4.

It actually /shouldn't/ be disabled for S4 - it should only be disabled 
for S5.

Are you implying a bug in the flow?  I didn't think there was one:

During entering hibernate the poweroff() call will have system_state = 
SYSTEM_SUSPEND so wakeups would be enabled.

For powering off the system using hibernate flows poweroff() call would 
have system_state = SYSTEM_HALT or SYSTEM_POWER_OFF.

> 
>> This implies that wakeups from PCI devices should not be relied upon
>> in these states. To align with this expectation and avoid unintended
>> wakeups, disable device wakeup capability during these transitions.
>>
>> Tested-by: Eric Naim <dnaim@cachyos.org>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>> v7:
>>   * Reword title
>>   * Reword commit
>> v5:
>>   * Re-order
>>   * Add tags
>> v4:
>>   * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
>> ---
>>   drivers/pci/pci-driver.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>> index 63665240ae87f..f201d298d7173 100644
>> --- a/drivers/pci/pci-driver.c
>> +++ b/drivers/pci/pci-driver.c
>> @@ -1139,6 +1139,10 @@ static int pci_pm_poweroff(struct device *dev)
>>   	struct pci_dev *pci_dev = to_pci_dev(dev);
>>   	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
>>   
>> +	if (device_may_wakeup(dev) &&
>> +	    (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF))
>> +		device_set_wakeup_enable(dev, false);
>> +
>>   	if (pci_has_legacy_pm_support(pci_dev))
>>   		return pci_legacy_suspend(dev, PMSG_HIBERNATE);
>>   
>> -- 
>> 2.43.0
>>

