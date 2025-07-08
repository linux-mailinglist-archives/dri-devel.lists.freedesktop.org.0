Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB39AFCA80
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B39F10E61C;
	Tue,  8 Jul 2025 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NeU/jZrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936DA10E046;
 Tue,  8 Jul 2025 12:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fro6B0kQ5a8ik0LbSyp8UjpTT1KMea6WM+y+ZcttApngHHbCZiNgBFpxaaTSpZpLQ0B65l4d854l1nlMaOBrSanYxJ6LmoUPWaxBjL9wiuIHtRG/O/DE+h8ykE+MKNnJqcAOxLCKaLjA7qWTIsZKpmWspucF0jSmEcKTkhhC8werhbBJ58u4mXCPGqu+ChEGzPUwgaPZqTuMKbow89gR/5N5aC/2fUhLJ1B7cSuhanp7SwuU3KAwBoLa8LgYlzhlvDGundqMvoqylw5NzCSG/n7WzhqyPicQudbLANWYzZnenysPSiJ1cb/KX/AoIsx1Dj93YCZXaG7gpQqGHUjTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGXfxiZpLWHqgFqRE9flfuHqQyJ2CCU8p49RncZI0j0=;
 b=hR/AsLTdbih9efKbkXyhmYp1iJ3rCWdlsCRvOQfRyfI7NNHgc9aTx9N0U8+UdwQMfmRBzmi+PlZaDk0JtIbs/TCy/EtZIT0JOpcLnnCOFuexTFAz9fj8WacPpTizumBH3KoYjmpQUnBrmMP1KcZWCebn35Mw9llMAYrFY9zrlft9jn9Q07s4uNoNsuSElOAPkzNx+qOArgueZWTL5XuX/HXwS9GCDzughY+LUwcNX0xvUD766TD/wH/v68zd59hcEqF5/0NPuMD+zWpK7gnv+ucARRRIuDZRmFFZ5px1AkM8eR/kVkqDkXMdNTlqHYTPk7XmjsNdHSelLXwJOIB7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGXfxiZpLWHqgFqRE9flfuHqQyJ2CCU8p49RncZI0j0=;
 b=NeU/jZrYhmHPgRtnuWW7CTP6SKFkKdIV2Ua8ymrvDZJ2SkMwL9///sWYCmzSYiAb564YyzNzVSuFE0jr3pXqTiy/iV79McpR18NpZd03/UKo45ZTIBcLu7G0Dmk9K5sanaps4mhvc9if6yvIp+IXvrf3IyIYPhtLixoc8qL4CEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 8 Jul
 2025 12:37:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 12:37:37 +0000
Message-ID: <cb140d4e-01cd-4cd7-bd7c-5c10b44cf98f@amd.com>
Date: Tue, 8 Jul 2025 14:37:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] drm/sched: Queue all free credits in one worker
 invocation
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aed9148-ca90-4a58-af3a-08ddbe1c3891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHBGS2dweWlmcjhnNDN2dW1KYi9KYUY0czFEMzlEUDdpNWFMNWFZc2FBZ2JD?=
 =?utf-8?B?SmlXWC9wUkdMVEV4RGJUbnhFQ0xLK0JJSHl6Z3B6WXRXdlRrZUFGbEdxeEZl?=
 =?utf-8?B?NzdrWWFXMHN6dmdJYUtyeEtaeEZ2ZFdoQmt4dlpHakoxR1NrMDA4alZtdTRo?=
 =?utf-8?B?NnB5MDVrM2hLYmxpeHFSTmdxU3hZT2xyNjg1SDFJM2FIaFdDK0xjWkJsOXVZ?=
 =?utf-8?B?QVNEMmpIOTdnd3RiVE1CVHhBS2NHTER1ZEFHM1I3ZnkwVlJUd3NrcllIUWpH?=
 =?utf-8?B?Mzc3V3ZFR3grUjVHalB1STl5Unh1WDB6WUp6OTNGSjBhSTB5UXdsbXV1dVNJ?=
 =?utf-8?B?ZkQ3TE1aL2xwRTFmYnNEZ2VPVWFsV3kxL0xQSFFJVTJTdDFjdWZINi9qNXg1?=
 =?utf-8?B?cDIrY1NLbU5HUnlsZFgzdngzb2RtRkpkNGdCQVg2ckJ0a1EwTUhtNnJFWmxE?=
 =?utf-8?B?MTBrcWZ2WGt6SzI3STlpcHNvVzA4QlBQQVRkRHg2dFR5eWxEbDlIbWJMZlh4?=
 =?utf-8?B?WnhhZlVpQyt6SHc0c0w1bjBya0M5V3BwS1B0dE1rTzRkVmxYVjRYN2I0NERU?=
 =?utf-8?B?VkNlRXVmQVRsMFJDSUZ3R2lON09tSWRZbkpLZGpKK3dTbCtYejFzZzkvemcr?=
 =?utf-8?B?eEcvM3VPRy94dmJDSkpLMHBxd1BoL0E1MXFZM1BJWm1kamVOOWd6ZDVUQith?=
 =?utf-8?B?N2RYT292eGU2UjN5VkoyZGRObFFXMHBibE1DaGZoZHAvbkRWZTl3SmRFb2t4?=
 =?utf-8?B?dStld3dMNmZkYUNuc1liRVFwblYxZ3paV3MyTXVtTnBYS3htM3NXcjhIWlR6?=
 =?utf-8?B?bUR6TldoNVZLdWVHTnljNFFOSTJvMTAzZDFqUFFTaGRvQlh2bG5ZSVprM0Vt?=
 =?utf-8?B?aUZ2TTlZVzJrT3c2R2pzZjhtblQ1YlJYSDVjNjhWWmJndG95REp2d0NzQ2kv?=
 =?utf-8?B?eUVnT3lOd1V2KzJZOGJ0SU1EVis0TkUzTDZRRXdYZVd2RW92bXhETUZMVC9x?=
 =?utf-8?B?WGxOTUtDNnB3SnRPRyttSjFLRjFqS285cjFETUJ5OG5pQWJWSWRqSDNTSWZ0?=
 =?utf-8?B?S1dnSlY5SDExWnJqdHFFMFl4OVRzUmx1SlNqZVBVOGFNQlpibG9QNW0zRHB3?=
 =?utf-8?B?WW1NT1MvL3pDTVgxRElhejUxUHdNd0lYOSt3SU5aK0xpd0V3ZlI4Sm1Hc2No?=
 =?utf-8?B?MnpGVDFnL2FRaHc1YXcwbVhYcmZCV1N3VjNsdlBFcWVxU2NHOVpWaEVKeWNs?=
 =?utf-8?B?WThvUkR4Z3ZhQ1VaOHU1Q0RHMTkrL3RBLzlQYS9JMkt1bi9jamZOZGQ3a2pQ?=
 =?utf-8?B?NVRpR2dqT2Q5RmdjZkxYMm9ObzVvTEdDdWg1bncxa08xaFRKN2lqWm1vaG9V?=
 =?utf-8?B?eTd1bThyM0ptaFNGRTdXdk9ITkIvTCs5UVUwTEZBcGo1MytHRzlxRm5oTk04?=
 =?utf-8?B?UlltVjRxQVdUU3IvYXBickxZZ2FyTzZBNWxhNGNtK0RVK0dNamJCWDhTaGRz?=
 =?utf-8?B?M2VuaWpjV3F4dStsTGNLS1NvY3hZVUJYd3ZqUEU0R3JGaDJ0U3poY2k4ZVZF?=
 =?utf-8?B?Y1ltaDdoUm45WDJSMFVRNU0rR3oyc3dlSWUzcXNwYnhGNlVGNHNNeFkvR0lN?=
 =?utf-8?B?djkxU1JlWDJZb0p5RVd4WFF6MDhtSTJiS2lqSlRocGlsSkxLbWlkVzZ1dDAr?=
 =?utf-8?B?REhQNFVheTFRajB6eXdsL1ZJUkQ4V0FPVGdQaXI5N2JMUFMrV25icUdtanR4?=
 =?utf-8?B?STR0dFhZT3N2NkszeHNaaU1OT1IydURHVTQvQmtZRTM2ZUVDeDBqNVVBSmNT?=
 =?utf-8?B?eDJ6VWZteW9MRUdBUjZaUzJKQVoyZHY2NzBUR3hDV3JUUDRmUU16VlliVmFB?=
 =?utf-8?B?am9JUEhXS250cHVzd0V0TmZqeEFPRXZPMTE4YXNoWFNvQVVSZjFnMlMrK1pY?=
 =?utf-8?Q?GxZPrhGTUv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHlObnNkUllJV0YrZUVDRFdDN0gxQkt2K2NEYUpTL05HTnRZMlpteGhWTFJF?=
 =?utf-8?B?cXdLQ0lhNDFDMml5ZkpTWW0zKzNGNnBHcWNrek92QzJuOTl3VEMxQzUzYkZl?=
 =?utf-8?B?MWl4MkFPMnhRZm5jMXdDT1BMbGJKeWRncFRBeWdwZUk5eWRDRktPelJnVzVi?=
 =?utf-8?B?NEVhOHIwOE1CRC9FcGg4OTBKMWxRNUZEK3VnVzlzbkZRVjI5Wno2UG9mUkNn?=
 =?utf-8?B?R2FaMFRGQ3ZMRmI3TFBNNWlTWVk3d2dwaHFEbkViakdaaEJIeUl0VG1TUmlY?=
 =?utf-8?B?eUZVKytGbHV6NlpnUVBnNlphLzJ0MDl5djFNQ0FGN282cE5mZVZpQTFQeXhN?=
 =?utf-8?B?OHorVDBreFBnTm45aXdIVzVYKzYzU1oyNHZsNjFZZDZwbDBXQklhNEZBNWtx?=
 =?utf-8?B?Y053V0ZNbS82NmducTc1cG1na2Y1MFhVZE1wZEQrTVpMaUVlTzAwcE5rOUxZ?=
 =?utf-8?B?WGtmbnY5SldKOTNkZWFyVFhJcWQ3WHowUktTa2llai9vd2NtMVE3S1FlN0xH?=
 =?utf-8?B?NzRxQzJYMXFqZjdOMnhHRGxCTXBBN2R0c3M4ZWxqOHJGekxjYnVTVFV6VStR?=
 =?utf-8?B?THdZanRIdWdFYno5RkJ0blZaS2t1T1VPNGg5SVVkc1hTdDBtbnZweGVwUm1L?=
 =?utf-8?B?N2NjVStuTUJQY0hwU2VRNzRxdWpIZlVoVXlqV1dDcW1JMVZiVURjUHc4emd1?=
 =?utf-8?B?Z2cvYUdmdXR4SDA3dFdVbzd4V1JGMXFieXFyM3ZlRkRneldvemMvcWxBMnhO?=
 =?utf-8?B?bGpGNk9heXdhNm5JcXJodFRpWWtrdzBwcDVLdDlMSFBsTUcvdDVTblBPY2V0?=
 =?utf-8?B?blloKzBqS2RxTnRidTV6Zm0zMFdjNHYvbzJjV0drOHVzMWRHZlE4UmpnYTJ6?=
 =?utf-8?B?dlRFbWVBVEsxa1ZxMWZOS29CUkdjSjdLTFhIQnFva2ViekZScWdzclcwbm55?=
 =?utf-8?B?QmJ1YTNIcXk3bDA2TVloUkltejhhTDVwVWV3cGczbCtGamdTeW81TGRYVC9o?=
 =?utf-8?B?ckxmUGl0c1g3ZlFmUHhFeENDVXIzTi9LTURESWhiTzFtaTh2eXNMSWpWRG1y?=
 =?utf-8?B?d29qWWp1SEYzVWRHT0FyeW50c0g2dXFVTjFwM0drOTlRbXp1WXRRR2E1UE9y?=
 =?utf-8?B?THR1TGpMazZQYWl6RjBNWXAwS002QzZ0UnVtUGgvbFhCNWh2ckFzSlVid2tL?=
 =?utf-8?B?Qk9sTGdzb3JWZ0JGeDVxRnoweG5lSm91YWJMbGRpNm5OOEdTQ1R1aEdyWmVG?=
 =?utf-8?B?U0hjQmtId2FFMUpiaGdubGZBbjludGgvU2RxbHVhdzRZRzkrUFNoQ0ZWeXAr?=
 =?utf-8?B?eHdqTW52ZU5WTWc5dFBjRllyOENCSGs0RDhCOVNLUEsyYmJMSWE0V1VNNEgx?=
 =?utf-8?B?TGJNSnNuTmhkdDhNQjV3RnZLVXZkSldaVE9lRjRuWVZ6ZEJkdElWWVFpeGF4?=
 =?utf-8?B?WGhjT0hoQndRaS9ma0pOZ09QWGxZWU5DUFExdmM3MUZ4MW9sNXkvSXpoOXl3?=
 =?utf-8?B?anQ0WUNoR0dUZmhhZ0gvbGg1SmtRQlphSi9QRUNaaUtlNWFZWmpyMFJ6ajhV?=
 =?utf-8?B?eUlIQVdYdW02am9KYVptUW1ydjhza3dwei9DTFhEYlRub3N0ZnNWYktJdzY1?=
 =?utf-8?B?RG92RlNzdE4vVEROZEpGYVpCa3Rxc3pFd0Zkb3JsdDFQM1RjN2VtUlhFUTFQ?=
 =?utf-8?B?ckFjU3ZQNU5EeUpZUVIzSEt4TEh3dmxka284QWtGZEd4Snd5UkZESkNiRk8z?=
 =?utf-8?B?YmloRHdBZnlpNTFHM0QveWt2ckxOYTViZTg3UnVDR1VrMnJWWlZCUGZHa3Fk?=
 =?utf-8?B?T3l2eTcreVlWaHNGUGJQNGhhb2lXNTVKOFZNbXVKSTV3MlFreUY1U0JBTlpL?=
 =?utf-8?B?RHJRSmt1aTBSK0JKMlQyZUZ5T1RKMUJwTGFpNlkzTE93b0VlL2puQzBSZ3gr?=
 =?utf-8?B?ZEZrbmJkVEJXQ1JkNSttQytwNjQ0N3k3cHhWM2h6L0orVk5Mdk5vai9sRzk1?=
 =?utf-8?B?czFLMUtwRFRxeVgwaS9BSG0yR0lLeXBGYU9tTDJPaGNNQzlsWVRFeHJITndY?=
 =?utf-8?B?M29Sb3JFamVBK1ZIMG1NZlI2QVh4a2RuNE14TllxalJpTys3TWVLazhzWmJ1?=
 =?utf-8?Q?IyNH5BVrtFCvu9zQDdnlTb3/o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aed9148-ca90-4a58-af3a-08ddbe1c3891
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 12:37:37.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LuIMd8THrcsGvDGfU+3UnhC+VFsXHG0RJvS5w8orCtyUZGTcOAHsebSm7LavXSX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
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

On 08.07.25 11:51, Tvrtko Ursulin wrote:
> There is no reason to queue just a single job if scheduler can take more
> and re-queue the worker to queue more.

That's not correct. This was intentionally avoided.

If more than just the scheduler is using the single threaded workqeueu other workers, especially the timeout worker, can jump in and execute first.

We explicitely removed submitting more than one job in each worker run.

Regards,
Christian.

> We can simply feed the hardware
> with as much as it can take in one go and hopefully win some latency.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_internal.h |   2 -
>  drivers/gpu/drm/scheduler/sched_main.c     | 132 ++++++++++-----------
>  drivers/gpu/drm/scheduler/sched_rq.c       |  12 +-
>  3 files changed, 64 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
> index 15d78abc48df..1a5c2f255223 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
>  	u64		vruntime;
>  };
>  
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>  
>  void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 35025edea669..1fb3f1da4821 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>  	return credits;
>  }
>  
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - * @entity: the scheduler entity
> - *
> - * Return true if we can push at least one more job from @entity, false
> - * otherwise.
> - */
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *s_job;
> -
> -	s_job = drm_sched_entity_queue_peek(entity);
> -	if (!s_job)
> -		return false;
> -
> -	/* If a job exceeds the credit limit, truncate it to the credit limit
> -	 * itself to guarantee forward progress.
> -	 */
> -	if (s_job->credits > sched->credit_limit) {
> -		dev_WARN(sched->dev,
> -			 "Jobs may not exceed the credit limit, truncate.\n");
> -		s_job->credits = sched->credit_limit;
> -	}
> -
> -	return drm_sched_available_credits(sched) >= s_job->credits;
> -}
> -
>  /**
>   * drm_sched_run_job_queue - enqueue run-job work
>   * @sched: scheduler instance
> @@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
>  		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	u32 job_credits, submitted_credits = 0;
>  	struct drm_sched_entity *entity;
> -	struct dma_fence *fence;
>  	struct drm_sched_fence *s_fence;
>  	struct drm_sched_job *sched_job;
> -	int r;
> +	struct dma_fence *fence;
>  
> -	/* Find entity with a ready job */
> -	entity = drm_sched_rq_select_entity(sched, sched->rq);
> -	if (IS_ERR_OR_NULL(entity))
> -		return;	/* No more work */
> +	while (!READ_ONCE(sched->pause_submit)) {
> +		/* Find entity with a ready job */
> +		entity = drm_sched_rq_select_entity(sched, sched->rq);
> +		if (!entity)
> +			break;	/* No more work */
> +
> +		sched_job = drm_sched_entity_queue_peek(entity);
> +		if (!sched_job) {
> +			complete_all(&entity->entity_idle);
> +			continue;
> +		}
> +
> +		job_credits = sched_job->credits;
> +		/*
> +		 * If a job exceeds the credit limit truncate it to guarantee
> +		 * forward progress.
> +		 */
> +		if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
> +				  "Jobs may not exceed the credit limit, truncating.\n"))
> +			job_credits = sched_job->credits = sched->credit_limit;
> +
> +		if (job_credits > drm_sched_available_credits(sched)) {
> +			complete_all(&entity->entity_idle);
> +			break;
> +		}
> +
> +		sched_job = drm_sched_entity_pop_job(entity);
> +		if (!sched_job) {
> +			/* Top entity is not yet runnable after all */
> +			complete_all(&entity->entity_idle);
> +			continue;
> +		}
> +
> +		s_fence = sched_job->s_fence;
> +		drm_sched_job_begin(sched_job);
> +		trace_drm_sched_job_run(sched_job, entity);
> +		submitted_credits += job_credits;
> +		atomic_add(job_credits, &sched->credit_count);
> +
> +		fence = sched->ops->run_job(sched_job);
> +		drm_sched_fence_scheduled(s_fence, fence);
> +
> +		if (!IS_ERR_OR_NULL(fence)) {
> +			int r;
> +
> +			/* Drop for original kref_init of the fence */
> +			dma_fence_put(fence);
> +
> +			r = dma_fence_add_callback(fence, &sched_job->cb,
> +						   drm_sched_job_done_cb);
> +			if (r == -ENOENT)
> +				drm_sched_job_done(sched_job, fence->error);
> +			else if (r)
> +				DRM_DEV_ERROR(sched->dev,
> +					      "fence add callback failed (%d)\n", r);
> +		} else {
> +			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +						      PTR_ERR(fence) : 0);
> +		}
>  
> -	sched_job = drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_run_job_queue(sched);
> -		return;
>  	}
>  
> -	s_fence = sched_job->s_fence;
> -
> -	atomic_add(sched_job->credits, &sched->credit_count);
> -	drm_sched_job_begin(sched_job);
> -
> -	trace_drm_sched_job_run(sched_job, entity);
> -	/*
> -	 * The run_job() callback must by definition return a fence whose
> -	 * refcount has been incremented for the scheduler already.
> -	 */
> -	fence = sched->ops->run_job(sched_job);
> -	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> -
> -	if (!IS_ERR_OR_NULL(fence)) {
> -		r = dma_fence_add_callback(fence, &sched_job->cb,
> -					   drm_sched_job_done_cb);
> -		if (r == -ENOENT)
> -			drm_sched_job_done(sched_job, fence->error);
> -		else if (r)
> -			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> -
> -		dma_fence_put(fence);
> -	} else {
> -		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -				   PTR_ERR(fence) : 0);
> -	}
> -
> -	wake_up(&sched->job_scheduled);
> -	drm_sched_run_job_queue(sched);
> +	if (submitted_credits)
> +		wake_up(&sched->job_scheduled);
>  }
>  
>  static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> index e22f9ff88822..f0afdc0bd417 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>   *
>   * Find oldest waiting ready entity.
>   *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> + * Return an entity if one is found or NULL if no ready entity was found.
>   */
>  struct drm_sched_entity *
>  drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> @@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
>  			reinit_completion(&entity->entity_idle);
>  			break;
>  		}

