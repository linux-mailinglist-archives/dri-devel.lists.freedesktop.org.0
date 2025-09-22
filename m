Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97128B8F9FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ACC10E3FA;
	Mon, 22 Sep 2025 08:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b8ATZj9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E589A10E3D4;
 Mon, 22 Sep 2025 08:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/sq9PdOhrfrhLqqx4F8u+fjPHfhQJY5fpeU5A/gRmoNb+QAaXrJeztpK+Sl6sIfQej1FTMg5M+HcxqAe9xVLy2OhZYiAOPv7/ufYfPCdOQafvYmHaP13at00EdBqAFqdNdIHZttaoyoGEVzjPkDdskCE4vncFE0JmFCS177VpUgClfs0EtUI3Fbqgcb0+Auv+hHJCtMh3md2NicjseWuVmWXWdmE+UhB6qkWGV1UCPHRIO9NjjxX2B6zL5bKb6Umz0QEaRxogEmmErC7mq7E2lsXYM4FzmIgWLlE4pOrP1W3Ros68x/0Th8ncYnL73FHRAzjEvARxeVwbnQQ21Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kcFklthVCxvrFCUz6khfhQXv2P0CQA7xbpE28i0RXU=;
 b=Y3m4h80R/5LIaWW+FxnVgkQQqn/ZOnUcIly+7zLmLEPCIn3TknoJHSVOUmkimHzTXJIzUOtZpwuoWlqMiDIvsU0O15jaFmbYzwe5G08thhlMpHNSM1Nx7qU+cJh0Iozw89oFtWGod4Ek4qEbBAxlSDy92hLsalxRpBeRd3u2mgkR4nsQS2SFzIjupPiV7XEeWGkAkJVeAiOmGFdA/bOnVIHD2yIYVUL2YYVwcR9j5fDSSFVQfz5nNEC6O7aiHf57WZodUxbsOsV2HstI9u67LDDK9qnt4Ax38iTaxPuyQnWtw1BXWYO6hamN69PgdTn89kRSZr1jSfa4V0zk4iuQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kcFklthVCxvrFCUz6khfhQXv2P0CQA7xbpE28i0RXU=;
 b=b8ATZj9ayPIIiSkaqkUPoKUkaWWT1dbtQ7YvxmKyoTg+MdT2e32pQ1yhmuBmwdMjRhIjGQ2pQSbreEXB5d6RQtAw+xhG4XCOjr+rjY4d6COaJ/E9RFNmFdQQ2VotgP+i3Vjrn6FDVwBlb5/TWFEFiPZ/Hh7b6o9gDnZU2dqOJVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:46:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 08:46:13 +0000
Message-ID: <98c8f8f1-8261-4e28-855f-f26e0780030c@amd.com>
Date: Mon, 22 Sep 2025 10:45:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
To: David Laight <david.laight.linux@gmail.com>
Cc: linux@armlinux.org.uk, jdike@addtoit.com,
 anton.ivanov@cambridgegreys.com, dave.hansen@linux.intel.com,
 peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, hpa@zytor.com,
 tony.luck@intel.com, qiuxu.zhuo@intel.com, mchehab@kernel.org,
 james.morse@arm.com, rric@kernel.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robdclark@gmail.com, sean@poorly.run, dmitry.torokhov@gmail.com,
 agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, rajur@chelsio.com,
 davem@davemloft.net, kuba@kernel.org, peppe.cavallaro@st.com,
 alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 malattia@linux.it, hdegoede@redhat.com, mgross@linux.intel.com,
 intel-linux-scu@intel.com, artur.paszkiewicz@intel.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, dushistov@mail.ru, luc.vanoostenryck@gmail.com,
 rostedt@goodmis.org, pmladek@suse.com, sergey.senozhatsky@gmail.com,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 akpm@linux-foundation.org, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
 pablo@netfilter.org, kadlec@netfilter.org, jmaloy@redhat.com,
 ying.xue@windriver.com, willy@infradead.org, sashal@kernel.org,
 ruanjinjie@huawei.com, David.Laight@ACULAB.COM, herve.codina@bootlin.com,
 Jason@zx2c4.com, bvanassche@acm.org, keescook@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-mm@kvack.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, stable@vger.kernel.org,
 jonnyc@amazon.com
References: <20250919101727.16152-1-farbere@amazon.com>
 <184ce83f-0063-43a0-a1c8-da23c5d03cf7@amd.com>
 <20250920111904.6d9ecb17@pumpkin>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250920111904.6d9ecb17@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: ef34fb17-e740-4382-7f03-08ddf9b47c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG1RZ1J0eVBnMzFFNXNyRmN4cXlUSUt1aUltb21TcXBvemZiWnF4L2lWRDFY?=
 =?utf-8?B?a0l5dkt3V013VFQwQ1BJTXUwcTFzWmkrd3NKWlBVV1BZS3ZCa3o2ZG5nMjNj?=
 =?utf-8?B?RnNCYkRYOGpiTTFRTi9ZbkVTcGFxZStocEFFUE1yK2d6WUI5Z3ppRFI3K09K?=
 =?utf-8?B?NHF6V1h4WWpGOU1nVjdKYWZLZEpXVE1WN1pRdkx6RWhQWWxKcWxwZGRaNjdr?=
 =?utf-8?B?OWFmcjdlbGRSTHJGZ204V2lFbTg4ZFhMaGZDWUZ1T2NUUUZLTlo3MEx6N2ZF?=
 =?utf-8?B?ZTBFTXhtbXQ4SWROVTEvblF6cytkaFNhM2NXV2dvNjljelpWR2JBU1o5azB0?=
 =?utf-8?B?eTQwcWNiS3VTMWVTaE81QmM3TXh4UWl6dmhKS0lLODRtWmtWUWpFYzJXUlRP?=
 =?utf-8?B?ay9IaHNEWjBORU5hajNvOEV0c3VydmNHRGlENnZFenBOMTliQmlOQloyc3FH?=
 =?utf-8?B?aXFORDBjY2pacFJCVi9BMHlaS29xOWtxY2hnRStXbi90UjRyVGdTK3UyRU9D?=
 =?utf-8?B?aFZEdDRhT2VaTW5vY3NTMzZkeEV5dTRhY2IvdEw0WlNMaGdhQVZ4N0ZlQldx?=
 =?utf-8?B?Qm4vWUhocXZjV0FHbmxqdlRkeVI3M2VUeG9kRlYzRnlWaTd4UDlYZkU0VnNO?=
 =?utf-8?B?Zm8xMHZXOGJJT2FiTFI5SzR6MnlVS1RGWEFHWkMyVERBeDNxbzZtMWlIQkVa?=
 =?utf-8?B?QU9kN3BzY3VMY2JKL2k1NDR4VEFpUC9DcmZLRjkrMlNidVI2Rlp0em8wazNz?=
 =?utf-8?B?V3BZbi84VG9aNXZRU1VJRVpvMXBCSmthMURQNTcrZnNhWnFaNUNhbysvclVs?=
 =?utf-8?B?czVkeXNITDZjT3pXbWRXOUU4WjhiLzlPcnVrS2RxdVNjaTZnc3NKRmk2MTA5?=
 =?utf-8?B?M1o1UUwwdXhzaFE5MEkrMkU1cHBSSjc5d1RndjAwT2MvZnJqaE9aSmZ2djBw?=
 =?utf-8?B?cDd5aFcwclYzU3NKc2s2THYvNGtvalJKVVVGc1AzNE9LSnFkSllGNldyazg5?=
 =?utf-8?B?U0tueGhqQStWeHFzbmRBMDBBRmFNcjlNU1hUNW9tVjNmNUFhTXpvNlducnpC?=
 =?utf-8?B?WDBrMEFlMGFmMndpejdTamw3YlRjSVRYS3BYV2JySmNXS1FOVm1xN0daYnZ0?=
 =?utf-8?B?WVMzVDN5ZTNLUG1rNk5tTFluSUt0aGw3NHhmSUdCbjMyc3JXQkliZmFZSXB6?=
 =?utf-8?B?dU9EeVpsOG5KWVFDWXluYW00dGhZek9nbDVKSVdJTDkraDQzSjRYc0Q4RU9P?=
 =?utf-8?B?dXJHajBLVXIwNFg5S2FZUERQOVR4TVVtQ1hKN2NpS3JKWFZwbk5mN01Bb1N2?=
 =?utf-8?B?NUZTMEpXVXp1TkZBdWh1cTRCejVTdmRCS0srYUlxcjhXeHVuQWw2YVEzRXl5?=
 =?utf-8?B?WWY3ZlRJUG1DemFMQm9aYmhGbWNTZnBPa0hqbVVDT2dDZmpZSGNlcCtMY2FP?=
 =?utf-8?B?OElJdXE5UHNSNGVqVjc0b2xiNjhWQnRMR05sOVloYlVtM0pNbG9vN1M4aXVq?=
 =?utf-8?B?NkNnbXl2TnVtdUxBakZsdlpWWHBwN01TNmduZWpYTkQxNllOOXBrY0VoRTZP?=
 =?utf-8?B?cHVxcHRjdnJ0UUhIc3JmMGtJS0d0QWR0aTdMeEFnNlpGYVZZR0Z5a0J2K1ZY?=
 =?utf-8?B?QlJ5SkdheEVXNnRZeGdaQktXM1poMmJQVll0NENCMmVGcjI2OElpOXhRdlRG?=
 =?utf-8?B?ay9WRm9ibGhhb2Q3cGtibmRhaDlzTGtZcDFvT0RqYnhkMlRIVEcxeGppaElz?=
 =?utf-8?B?ZEZscGN5S291TVBwb0pOVnJYc1h5S09lWmEzMnZFUDEvSHFuMmxwNUM2TGMz?=
 =?utf-8?B?NnVCV1RocE1pYjlNUnExVEZma0xVaE1xTDRvYmZNTEFOZmY2RkRCZkxOcXpq?=
 =?utf-8?B?Z21iSW14SXdkRys5OHRscFhvekpMRzJxQ0k0UlVaV212TVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpWR3VZSWc4UDRoYW0xVitXSnVlRnVQR0c0Vlh2aXhJc3NmRksxU01TQlMv?=
 =?utf-8?B?Q0tKaUpNZmIwaXNzRk14SU1tclpsUjJiazRJK1BsYkRuRG5CTmFOSU5tWUZi?=
 =?utf-8?B?SzlFaW0xa1g3UitJd0d3Z240b3lZenJub291VXV4ek5MbzF0cXNmaW1Mc042?=
 =?utf-8?B?ODZ3ODJtUE01UEJJbEJHK0dNd3RGVEo2aFBlZWxuRitXSmJwam1WZktVWjlO?=
 =?utf-8?B?TitaK0pueUJaOVM1a1lwb2RXdGNDRjJ3Q0E4UDlpMHkyWmpRMVpla3p1ZEwy?=
 =?utf-8?B?N2oyTldrcXFtNFhmRFovenBKNTNKdGd3UDVzbHExWkllaGxGSTR2Sk5OSmQ4?=
 =?utf-8?B?Q2NlNnBLSGRTU0JWdnYzQ1BlNVg0MW9PQ0wyaUVmWG1reHRuVWpKR05zVXYw?=
 =?utf-8?B?ZCs5VXlLMG4wK0xRK1RiMTdxQmc3L0tsajNEOGFFQWF1aHNsZHVFSU5aMmdj?=
 =?utf-8?B?eUcrOFNIR2xWQm5DRm5pbThMZnprR1A2bmJid3hGNnowVi9tWlgzc055U1hm?=
 =?utf-8?B?Tk91Y1E2ZGQwYUVIMFQyc3RJd1FmZnpmdEhpWFczalJQMitBYWswTGlSMVhw?=
 =?utf-8?B?WVlsZGlyZ3hiMkRzOEd0WHZyemtvL3gxUmlQT2g5UkhpeFo1SjAxSENjdjFZ?=
 =?utf-8?B?OHdQQUZIbE1TMzlRc21MQ1BFU1B2SjFYdmZ6czJ2RnZ5Y05RZ0FVNXVHTzRF?=
 =?utf-8?B?MytPU00xdTVSalR5aitoT0hWVk54QWdGVjM4d1lZZXA2Z0dCVTVLYTgzeXAz?=
 =?utf-8?B?YTluaU43MGtrWGhnTzNLdHB3bDZTb0pqTGhqb1hOdFdZWWM1b3VpUFlHUTRF?=
 =?utf-8?B?a2tWaVBlZndXUXc2MHdHck9Tb2x3eWpqWmZ0LzhBQzJPTGVqV2lEeUZrTnMy?=
 =?utf-8?B?V2hIYkpzQ0tUd2duVGc1WnJ6TEZVV0FJZVk5M0dlOUhHai9FVW5KT3VVWVI1?=
 =?utf-8?B?UDljaWtrZXhaWmdnS0ZHV1RoTUlBRFdMMUptclV3Vk9Wcnljcnh5bEZNMDlk?=
 =?utf-8?B?MzllRXIxNzZxMkpEajF6Sk13QnlLbkg0c3R4ejFGb3I3VE8yQ1lHa0l2N3ow?=
 =?utf-8?B?QmtvcmE4Yk9OOHA5K2RQU1VBUFlYdEVJMUJmZERsTVU3WDBsazNjdHgyajNi?=
 =?utf-8?B?dGVoUVVseE9TbTYvTFA2aDE0Y3JtNWp4TEN2a052SktlcDk5NzdCc3Z5NDgy?=
 =?utf-8?B?Ylo1WjdUMlRucVQwWEVRUVhVWFpndm03T2p3azVZckRYaWdzMHRoTU1kYWdH?=
 =?utf-8?B?Nmc2MVBnM09NOTd5Zi9Gc2JIYVhIVmY5bnVsbkQwOURCVkdtN1ZqVnFlb2F0?=
 =?utf-8?B?cy9JTHZNdDNZMGIvZnc3ZTk4OHBqcllRUkdOQXExOTFYYmJjdnN1S3NvS280?=
 =?utf-8?B?QVBSMkZCQnFnd0VvRTF3SmJteWUrdFAwM0NON0F2MmxjWTRiaEw4N2wrampi?=
 =?utf-8?B?Zm5JbGVLaFNhNTFmSkFpb09yNTRXMTZDcGpaOG1SSTlWQnRIcSt2VmNhdXV6?=
 =?utf-8?B?bkQ0QzBGTTBnZGJBOTNBSEdDZVpKazhvUW5rcjZpTUk1RTNqVW13QTBhMDNy?=
 =?utf-8?B?WE93bHlpaU5xckk2ejV3eld0OGIwNlNuV1NJbHpiMXBiU21EaVZINHBtRFgv?=
 =?utf-8?B?bXRab1RSaWdtZ2V1SGlEakVXSi9YUGNvc1N6RlNMeTV2UW9ETC93bVJydU9R?=
 =?utf-8?B?OGRmSjYxK3ppMU1URzV2QVU5a1J4YjBSZlFUcjloS1JxSDg2UytiaVFIWUU2?=
 =?utf-8?B?VS9ZQllsY0xJODFvc3RTMjcrSmtNL1RpUEdpYitFZUJQUnFqWENmSXRUcU1i?=
 =?utf-8?B?akxxRlh6aFM3V1hmV2k3QW9qdEJLVTZRUCtuVjZLN0g3Sm1YYkhhbjduVXly?=
 =?utf-8?B?TldobmdpWDEvYy9YUlBlM1hqRzNiOFZFQ21yY2V1ZFJFV04xYjhVbzVHd0FP?=
 =?utf-8?B?b3VSRjR2UWVIaTNobm5GSCthcmx6UEE3a2JPTmFJSVo0MmVsN2gySkZncjZB?=
 =?utf-8?B?ZnJ3R3U1bDZLTDR0djcrSHo4aFV2UlFRWjVWVkF2d1pXU1pWRHRQNTVBRDJL?=
 =?utf-8?B?Y1llTUh4dlcxYXNQWnVXRnJIMGFOYmwzSEFVQmhUbnhYWmFlU1ZvOVpkMm56?=
 =?utf-8?Q?Zqrwr8uR4YeZSte3ehEFJmFuL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef34fb17-e740-4382-7f03-08ddf9b47c6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:46:13.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oetdwlSlScsefrZU9ffzTGm7uqrLuTCKLiCpWlTi75F7bvsTR/lg3QeYk3Ei0bQc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790
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

On 20.09.25 12:21, David Laight wrote:
> On Fri, 19 Sep 2025 14:11:37 +0200
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 19.09.25 12:17, Eliav Farber wrote:
>>> This series includes a total of 27 patches, to align minmax.h of
>>> v5.15.y with v6.17-rc6.
>>>
>>> The set consists of 24 commits that directly update minmax.h:
>>> 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() macro
>>>    once")
>>> 2) 5efcecd9a3b1 ("minmax: sanity check constant bounds when clamping")
>>> 3) 2122e2a4efc2 ("minmax: clamp more efficiently by avoiding extra
>>>    comparison")
>>> 4) f9bff0e31881 ("minmax: add in_range() macro")
>>> 5) c952c748c7a9 ("minmax: Introduce {min,max}_array()")
>>> 6) 5e57418a2031 ("minmax: deduplicate __unconst_integer_typeof()")
>>> 7) f6e9d38f8eb0 ("minmax: fix header inclusions")
>>> 8) d03eba99f5bf ("minmax: allow min()/max()/clamp() if the arguments
>>>    have the same signedness.")
>>> 9) f4b84b2ff851 ("minmax: fix indentation of __cmp_once() and
>>>    __clamp_once()")
>>> 10) 4ead534fba42 ("minmax: allow comparisons of 'int' against 'unsigned
>>>     char/short'")
>>> 11) 867046cc7027 ("minmax: relax check to allow comparison between
>>>     unsigned arguments and signed constants")
>>> 12) 3a7e02c040b1 ("minmax: avoid overly complicated constant
>>>     expressions in VM code")
>>> 14) 017fa3e89187 ("minmax: simplify and clarify min_t()/max_t()
>>>     implementation")
>>> 15) 1a251f52cfdc ("minmax: make generic MIN() and MAX() macros
>>>     available everywhere")
>>> 18) dc1c8034e31b ("minmax: simplify min()/max()/clamp()
>>>     implementation")
>>> 19) 22f546873149 ("minmax: improve macro expansion and type
>>>     checking")
>>> 20) 21b136cc63d2 ("minmax: fix up min3() and max3() too")
>>> 21) 71ee9b16251e ("minmax.h: add whitespace around operators and after
>>>     commas")
>>> 22) 10666e992048 ("minmax.h: update some comments")
>>> 23) b280bb27a9f7 ("minmax.h: reduce the #define expansion of min(),
>>>     max() and clamp()")
>>> 24) a5743f32baec ("minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi
>>>     test in clamp()")
>>> 25) c3939872ee4a ("minmax.h: move all the clamp() definitions after the
>>>     min/max() ones")
>>> 26) 495bba17cdf9 ("minmax.h: simplify the variants of clamp()")
>>> 27) 2b97aaf74ed5 ("minmax.h: remove some #defines that are only
>>>     expanded once")
>>>
>>> 2 prerequisite commits that adjust users of MIN and MAX macros (to
>>> prevent compilation issues):
>>> 13) 4477b39c32fd ("minmax: add a few more MIN_T/MAX_T users")
>>> 17) cb04e8b1d2f2 ("minmax: don't use max() in situations that want a C
>>>     constant expression")
>>>
>>> 1 additional commit introduced to resolve a build failures during the
>>> backport:
>>> 16) lib: zstd: drop local MIN/MAX macros in favor of generic ones
>>>
>>> The primary motivation is to bring in commit (8).
>>> In mainline, this change allows min()/max()/clamp() to accept mixed
>>> argument types when both share the same signedness.
>>> Backported patches to v5.10.y that use such forms trigger compiler
>>> warnings, which in turn cause build failures when -Werror is enabled.
>>>
>>> Originaly I aligned 5.10.y to 5.15.y, but David Laight commented that I
>>> need to pick up the later changes (from Linus) as well.
>>>
>>> Andy Shevchenko (2):
>>>   minmax: deduplicate __unconst_integer_typeof()
>>>   minmax: fix header inclusions
>>>
>>> Bart Van Assche (1):
>>>   overflow, tracing: Define the is_signed_type() macro once
>>>
>>> David Laight (11):
>>>   minmax: allow min()/max()/clamp() if the arguments have the same
>>>     signedness.
>>>   minmax: fix indentation of __cmp_once() and __clamp_once()
>>>   minmax: allow comparisons of 'int' against 'unsigned char/short'
>>>   minmax: relax check to allow comparison between unsigned arguments and
>>>     signed constants
>>>   minmax.h: add whitespace around operators and after commas
>>>   minmax.h: update some comments
>>>   minmax.h: reduce the #define expansion of min(), max() and clamp()
>>>   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
>>>   minmax.h: move all the clamp() definitions after the min/max() ones
>>>   minmax.h: simplify the variants of clamp()
>>>   minmax.h: remove some #defines that are only expanded once
>>>
>>> Eliav Farber (1):
>>>   lib: zstd: drop local MIN/MAX macros in favor of generic ones
>>>
>>> Herve Codina (1):
>>>   minmax: Introduce {min,max}_array()
>>>
>>> Jason A. Donenfeld (2):
>>>   minmax: sanity check constant bounds when clamping
>>>   minmax: clamp more efficiently by avoiding extra comparison
>>>
>>> Linus Torvalds (8):
>>>   minmax: avoid overly complicated constant expressions in VM code
>>>   minmax: add a few more MIN_T/MAX_T users
>>>   minmax: simplify and clarify min_t()/max_t() implementation
>>>   minmax: make generic MIN() and MAX() macros available everywhere
>>>   minmax: don't use max() in situations that want a C constant
>>>     expression
>>>   minmax: simplify min()/max()/clamp() implementation
>>>   minmax: improve macro expansion and type checking
>>>   minmax: fix up min3() and max3() too
>>>
>>> Matthew Wilcox (Oracle) (1):
>>>   minmax: add in_range() macro
>>>
>>>  arch/arm/mm/pageattr.c                        |   6 +-
>>>  arch/um/drivers/mconsole_user.c               |   2 +
>>>  arch/x86/mm/pgtable.c                         |   2 +-  
>>
>>>  drivers/edac/sb_edac.c                        |   4 +-
>>>  drivers/edac/skx_common.h                     |   1 -
>>>  .../drm/amd/display/modules/hdcp/hdcp_ddc.c   |   2 +
>>>  .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    |  14 +-
>>>  .../drm/arm/display/include/malidp_utils.h    |   2 +-
>>>  .../display/komeda/komeda_pipeline_state.c    |  24 +-
>>>  drivers/gpu/drm/drm_color_mgmt.c              |   2 +-
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   6 -
>>>  drivers/gpu/drm/radeon/evergreen_cs.c         |   2 +
>>>  drivers/hwmon/adt7475.c                       |  24 +-
>>>  drivers/input/touchscreen/cyttsp4_core.c      |   2 +-
>>>  drivers/md/dm-integrity.c                     |   2 +-
>>>  drivers/media/dvb-frontends/stv0367_priv.h    |   3 +
>>>  .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |  18 +-
>>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
>>>  drivers/net/fjes/fjes_main.c                  |   4 +-
>>>  drivers/nfc/pn544/i2c.c                       |   2 -
>>>  drivers/platform/x86/sony-laptop.c            |   1 -
>>>  drivers/scsi/isci/init.c                      |   6 +-  
>>
>> I do see the value to backport the infrastructure, but why are driver specific changes backported as well?
> 
> They will be about removing local definitions of MIN() and MAX() freeing
> them up for simple implementations (usable as constant initialisers) and then
> using them in places where the compound statements in min() and max() can't
> be used.
> 
> Linus did all those changes - so he didn't have to wait for the maintainers
> to apply the changes (etc).

Sounds reasonable, feel free to add my acked-by for radeon and amdgpu driver changes.

Regards,
Christian.

> 
> 	David
>  
>>
>> I mean the changes are most likely correct but also not valuable in anyway as bug fix.
>>
>> Regards,
>> Christian.
>>
>>>  .../pci/hive_isp_css_include/math_support.h   |   5 -
>>>  fs/btrfs/misc.h                               |   2 -
>>>  fs/btrfs/tree-checker.c                       |   2 +-
>>>  fs/ext2/balloc.c                              |   2 -
>>>  fs/ext4/ext4.h                                |   2 -
>>>  fs/ufs/util.h                                 |   6 -
>>>  include/linux/compiler.h                      |  15 +
>>>  include/linux/minmax.h                        | 267 ++++++++++++++----
>>>  include/linux/overflow.h                      |   1 -
>>>  include/linux/trace_events.h                  |   2 -
>>>  kernel/trace/preemptirq_delay_test.c          |   2 -
>>>  lib/btree.c                                   |   1 -
>>>  lib/decompress_unlzma.c                       |   2 +
>>>  lib/logic_pio.c                               |   3 -
>>>  lib/vsprintf.c                                |   2 +-
>>>  lib/zstd/zstd_internal.h                      |   2 -
>>>  mm/zsmalloc.c                                 |   1 -
>>>  net/ipv4/proc.c                               |   2 +-
>>>  net/ipv6/proc.c                               |   2 +-
>>>  net/netfilter/nf_nat_core.c                   |   6 +-
>>>  net/tipc/core.h                               |   2 +-
>>>  net/tipc/link.c                               |  10 +-
>>>  44 files changed, 306 insertions(+), 164 deletions(-)
>>>   
>>
>>
> 

