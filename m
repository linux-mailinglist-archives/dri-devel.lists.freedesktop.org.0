Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AA2B89958
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422D10E9EE;
	Fri, 19 Sep 2025 13:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OriFzY6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949F810E999;
 Fri, 19 Sep 2025 12:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AD582V/BZa9pU6CwJjiIJjvvTNdjxLVrJcJAZ4wDujsYTxHicnibNdBX41+7L7y+xN/BjiNP3wu05eucjRsefxwjmXGoRSvN5bDsuYCHf1FdO5zNpemDct8D4JFME6tYEjWUXJbM0NWdt3/FXpESkq5/J2D5TnqxiRfLpctLAydiPByxMjj23yb6N31ZRMkpXPrKva7C3K/SuJqSsAo05pYR4uHCohh/dNLg6OunTCsArUWNpI2E/NsCF4AdM4EUIysrcXH1U9ariWL+M+4Z16WJNhZ/BJVvUz8+ONE+fuZAayA4it0YsxJnC/iPr53wcMJZ6m3IbmrpcxBYdvXQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbVXg5MyCk+7aXzf2aqtq5p3hcfcw9Z+3yObGYsYiy4=;
 b=GNl4eE/M18q6uF+7wngl9tt++sLmOH1dEo+DnV1hhGxl5/Ohp8Uxh3yHO4beFu2EcJqspIqDTelH4Xfo0NObFk9JSid2IK1p1mHuGsYQXZTPAAeEbHxc5qxJXekoFleMev6oYVwtzx3RtmaF6EzK/GryouQObi8gh62H/GsuwMsEhMAH0rbeNusNaFC2XrKdUJgPYVsZMLwXzsEW8gv5Lad9fkxNKdThqMC2SZN0+lr7hUZkQsLgRpFXxuPN4PcwotZ5TN7LChnXe/zOAlS7Gz3dP2Flj/qQGjYfqR5k2p9lumKbkPx6je21y0PiuD+T1Hqmeo8ddN4K0MfTv9l7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbVXg5MyCk+7aXzf2aqtq5p3hcfcw9Z+3yObGYsYiy4=;
 b=OriFzY6kLBgfM9OYuTo2qAYjl8W3DOr9hzny7usAcNpA2yhXN4XLbl1PPLGljQs4l8TiFN6c6GpGfQ46OOVR3bFfybVROkAuOSq36fduPMjXuwR+YrNdURm6XOtsSnywI00zpv6iS+Jz5orH0S+VfpBsX/NROfk0y3DrBJCKz8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 12:12:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 12:12:01 +0000
Message-ID: <184ce83f-0063-43a0-a1c8-da23c5d03cf7@amd.com>
Date: Fri, 19 Sep 2025 14:11:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, tony.luck@intel.com, qiuxu.zhuo@intel.com,
 mchehab@kernel.org, james.morse@arm.com, rric@kernel.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robdclark@gmail.com,
 sean@poorly.run, jdelvare@suse.com, linux@roeck-us.net, fery@cypress.com,
 dmitry.torokhov@gmail.com, agk@redhat.com, snitzer@redhat.com,
 dm-devel@redhat.com, rajur@chelsio.com, davem@davemloft.net,
 kuba@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, malattia@linux.it,
 hdegoede@redhat.com, mgross@linux.intel.com, intel-linux-scu@intel.com,
 artur.paszkiewicz@intel.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, jack@suse.com, tytso@mit.edu,
 adilger.kernel@dilger.ca, dushistov@mail.ru, luc.vanoostenryck@gmail.com,
 rostedt@goodmis.org, pmladek@suse.com, sergey.senozhatsky@gmail.com,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 minchan@kernel.org, ngupta@vflare.org, akpm@linux-foundation.org,
 kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, pablo@netfilter.org,
 kadlec@netfilter.org, fw@strlen.de, jmaloy@redhat.com,
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
 tipc-discussion@lists.sourceforge.net, stable@vger.kernel.org
Cc: jonnyc@amazon.com
References: <20250919101727.16152-1-farbere@amazon.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250919101727.16152-1-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 6937c5b9-1962-44a7-1ee6-08ddf775bd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3hLRFVLeVExQmhYODR2ak01bWVFUXNoSXpVYi8rWDdaRzBDN0FpVnpuanZO?=
 =?utf-8?B?RytJRWgzNjErVi93RUtQdEZZUnRjL0ZFUUs0ZGx3NjN2M3NlWUMxRHVPbFdC?=
 =?utf-8?B?V1laRGlBSGlrU05RdFNpRWRUeEpnSmVreDVTOStaSUNSVkcwZlRXdEZXRUF4?=
 =?utf-8?B?Wlg1ZHA1cDNkSnhid3Ftc2lnaWE1YVV1dWxaeG9zbnppZkF5a3dOTlZWZHY3?=
 =?utf-8?B?bUNiWkJpRVMwa25nVCt0a2t1dUFmZEY3elYvQnc5WWdlRlBmNWRGZGJuZE81?=
 =?utf-8?B?cnlGRHF3Y0s2ZnZETXdudUdkK0tvSVZtMGVJMkFTWU4vMVJzVFg2Z05MWEZx?=
 =?utf-8?B?VlpJOStDMDY4YVd4eklyZjFpbGR2aGJnVS9SdjljSjExbkdtZlBoRmZ2dWhH?=
 =?utf-8?B?TFBadkdYQjROWXo2bUR3ODNRQXM0L1VrQVJMSlIrcDQ4c3drWGdqaEFBZEZV?=
 =?utf-8?B?cWVnQ09oSXZ3cVJvbUNyMzRJVE1rV2NyV2UvRGJ6ZStyaXRFbTltajdsL0dt?=
 =?utf-8?B?aElqS1VUc0JObnFucGNLeHp5YyszcWk0TTBmTUVValB0bnlIek0yM1ZyaCtp?=
 =?utf-8?B?QThGVmROY2kySm1BcW9jQ0JXNWFLajEzbkRkVkhLc082QkpPRjZ5ODE3Q2NW?=
 =?utf-8?B?a1hNcHNqWGNCdzlkODFUWHkrVVBpRmRIU0tKU21NbXVQOElZSG4vZTZoSFNt?=
 =?utf-8?B?Ui9qMnllTThYdWFDYWdVR2twcjA3NFNSWUpUT001MHp5Y1FvZ2h2d0d4Vytr?=
 =?utf-8?B?dUkwNHU2Y0IzUTVUTkp2QUZyS0VWQ0hWaEdpUytsQWF0dG00WGVtdjEzNGFT?=
 =?utf-8?B?UWR3MWd3K0RmL1ozeDRXbkJMQnQ4TEZPNUhuKytlZVh0UjhRNEkrMXBHeDMr?=
 =?utf-8?B?TFlGWHdTek8vb2ZDREVwNlFJMjJlQTY4cXhhZFhLWFFVMVU4RU5zKzFhMzNk?=
 =?utf-8?B?WnVRdlFabnhlUHQ0UzRIU29LYVlzbVRlelZ4NFZ6a1pkTVF1eWR4TjB6bHJk?=
 =?utf-8?B?ckJldXpDUGdOaFJlUW1janNkaGw3ZUJ2YnNmcmRrY1Bvajl0R2xCaERHYjU4?=
 =?utf-8?B?OEp0a1ppY0xDL1I1eFEzeGVyemNwWnNUUGhEOGJFeHFuQzVkcXhJMUU1Rjg4?=
 =?utf-8?B?Q0tBOG1QZFNoaThMTDhkemNkUDY1RUc1Rit5VHYxZWgyUW02cUVFWkxNdjVa?=
 =?utf-8?B?QmZiWXF0OHBPNnhnWVVMUGxxay9VSTJ3VThmVzBDQlpZcThVT2g1b09wYnRU?=
 =?utf-8?B?bjFMdi9xSVFubHlXa1ExRXFqTmZSdTl1NmlIa1lzSy9xM25oMUZqTUY3d25E?=
 =?utf-8?B?dWlXWFk3VjhCdis5dDNYYTdscGcxWDliN3gvR2xGV0F4SHhOcjB0NTh5WHlM?=
 =?utf-8?B?ZXRnMnlONEJMRWZucXlMUVNEaXFaNUppWnVTanUzZThuc0g1bSswcjRzdGxM?=
 =?utf-8?B?TGFDbERNcXpTcTY3LzhSbVgrUWZ5Q2RSa2xUd1BRSENDTTFiQ3piaFk5V2h0?=
 =?utf-8?B?RGJyR3ZhaCt4SkpSRG9CTTBCaUVaVy96NEJyUlFHRmV6RzNGWlFFTHVmSzRX?=
 =?utf-8?B?RHhnUXJxWi9POVE5TTltZEhJKzVtS25jQi9WV0pFQWZRZEpzUEV4cnhuSlVR?=
 =?utf-8?B?dDNQSENhSWtULzZpWWc2akZpcFhTUGxRK28ycldrWXkvenFnSXRZUHlTQjZp?=
 =?utf-8?B?emhyTXdjSk83NWhiM0FYalQwMSsyQjRrSkVlaHRJaGFpYkZVZmRmbVdON3h5?=
 =?utf-8?B?ZllielpZZTFxc0NESDNGSE5HZURaT29MR1F5N2h0elAxY2p5WjZ3SkpEd2lv?=
 =?utf-8?B?aXJVMHp5aFVTOThjblhiTC9LNCtFamxvOEhuNVRzSzhGenFsUlNtaGQyd0No?=
 =?utf-8?B?SkZzWFo2dUtkdndFUk9lMWJBR2xZVlZJRXBSL3JWM1RRMU9LTGFyR0VjNWFR?=
 =?utf-8?B?eWxZUFF2dEtyZFkvRnlYclRCZGcyWVlLT3BSS3JUZWdvWTlZcmV2UmVYbjZt?=
 =?utf-8?B?Tk1sNFV6U3lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VydlR5bjl3RFBmQk1PSVJNR1VtNWJKcWRoWnM4VjRqNUtBSjJOVm5HU01a?=
 =?utf-8?B?N0IvZ2RVc3BxVDk1NXdMbjlFUWY2dE9ETlJlMlBaRG9IM2ZpU2lVcXdDZTRX?=
 =?utf-8?B?akhWL21pTkZXMzJDR1FJMk9WTDc3T1l3UndWMkZMQlZDcVcwbnRoc0NrUDMv?=
 =?utf-8?B?Y0hvVmpZczFkUlFCaVhJNkkxc00zZExZalBIdXo1eU81MmpPVlJUWmxaTTJS?=
 =?utf-8?B?QVVFWUtHN3dSOXRORTVrbk5EUUNCVHRlQXdSVUsreS9nSkFXckFOc3dqd0VI?=
 =?utf-8?B?eS9Nb0hrSW9TOVN3c1ZsSTBYYU9iYmlIMy9XRUE5cmRtaC9ZRTF6RXZYNVNJ?=
 =?utf-8?B?dkVua1pQV0F6NStCMHRyZ05wMmVSa1J1UFphY1UzVEdmYm5FVHQ3YVdSM003?=
 =?utf-8?B?YXVDVXpucUNvVk5reE5Ia0lqdWp2Q0w4aUhPQTVUZkdmVTR0T051TXl4V0U4?=
 =?utf-8?B?dkVQdWZJVHdGdGZqQmdQRXM1Q2tucFhpU3F2aTJvY2pmYU1MMVZieWJDSkJw?=
 =?utf-8?B?aUtlcHNONGh6bEZ5dkN0akRLUHVuUUE0c2hSQW51MGJ0eStNM2ZuNVNSL001?=
 =?utf-8?B?YUljbW5Zd0JjcU96Y0EyZm9vMzU2MTF3RENnTzFHazc3MVFxeXRYcll0RWl6?=
 =?utf-8?B?U2tQbzc0ak53QXJLam9tZkgvTC9xcG9WcENMMlYwUkQvbkdDc3JtMDduUzR6?=
 =?utf-8?B?RXZzamR6VG9jb0F5QkZkNWVmVDFFbXhRcTRYMUZoNllHOWhxME5ZaDhpZk1E?=
 =?utf-8?B?cnZCeUJtTEk3TkYwaW50bWxzc1hVY0o2dHkxZ3NZMUhxSi85UlhQNm01eGJ1?=
 =?utf-8?B?ZnJteTB3a0FXN3lxcTBCU3lFRk1WRWhQUG5sV2VlOFJaekp6MzE0Q1B2UXJK?=
 =?utf-8?B?elYxZ3ZFY0kzdFRkZnhHc3prOHY5QnEwZnhQY1ptbzl4QjZXQ0VlUk9zM2Fh?=
 =?utf-8?B?U3ZOTTNSekVJblVzOHNZZDdGYzc4YnkwellNQUw3S0FSQnArc003L21UelBD?=
 =?utf-8?B?dHYrUkhzbzBGQ1pFNXVEeWl6UWIzQkRjT0hod1pWN3J6T09KNHZldE1TWmJr?=
 =?utf-8?B?VURrSDl3QnVlcTJjdE0zdE5DbENiVGFzOFIyQUxhZUt1Qk0ySlgyS2RqR3Ex?=
 =?utf-8?B?ZmtLL2ViRkNML0NhSS94TDFQbWs5V2tMMkNqbE1HSVdHa052S2V0ZXdVeDlv?=
 =?utf-8?B?K01OMFFlNmFSU0ZqUFlwUlE4NmtJL3htUzU3RmdKQTRiVWY2dUZMdXVvUFA5?=
 =?utf-8?B?bDJCOWphTjhzZ1lSM2c5cWZXTnRnOUpHZm9jcEc1YVloRHZ5VTFKT0hEalpz?=
 =?utf-8?B?Zmc2a3hud1R2OE0zdStJZXlZS2gycktPRUdSUUVNZGo2dzZwODFvcEl6MXpo?=
 =?utf-8?B?ckhtbEdYb3dFZE5KMXNSNzd5M25HTlBLV3ZnL1MwanEreHBaZjdSRWJxN2Rq?=
 =?utf-8?B?MWZXNGhEZWxYYXFnK2FTN2czTW16K1dKUE1DSmIwQXlyZ0NMMVlBTEJ1V1cw?=
 =?utf-8?B?RVFUd0RvUGVpQzZIc0pJeUdTL1Q1MVhjS1p4VEcwaU4zNk1HbWJRb0hyOTdt?=
 =?utf-8?B?ODd3U2o5WTU4SFl5VFBqdzIyQ2RlSElUcVloYUZDNWV0V0FObHk4Z1AvWEFv?=
 =?utf-8?B?cG56NEZEOWpSK09ET1prbVFTVFlrMUdxQ3dURlRXbnIvbkJOaUZnRXFhYWFI?=
 =?utf-8?B?b21IRmkwYXJ4QkRxTlhPR01FTXRvRkNjcENnVmZ1OWtvVDkrcDhOK2xvaUZ1?=
 =?utf-8?B?WDlRS01oQkVmZGpsSFVzemtmQzZObkRrY2F2ZU51MHpYc0RtUDVRcE11emMr?=
 =?utf-8?B?SWQvRmxKQ2hUcnF6d3k2K3NteGphZHcwb2wxcGN4ZkhqMEQyMHh3cm83Snho?=
 =?utf-8?B?SC9XdHpSWU1tS0hWS3h0NFVyWTU1Z3dWT1ZOa0pMbmlIQkZpczEySEZoZmwx?=
 =?utf-8?B?Z3EwTVVacyt2dDZjV3dRTnhUR041TmZVS29LaUFOd01SL2NHbjlZUHZFcVVk?=
 =?utf-8?B?MFRRZFhrTmtzL1p2MDZENDlHLzRHMlRmOVA5bVdRSDdCUGJNbmgxTU5UeTlm?=
 =?utf-8?B?dGJHRHdOazVRRTg1RlQ3a1hDazZYYW1HUVhMejFaUmRvWGhpVDY2b24raTZY?=
 =?utf-8?Q?NKiCWZy6KpXV5wwLJmoYbWn+q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6937c5b9-1962-44a7-1ee6-08ddf775bd22
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 12:12:01.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV8yIqWmCjsKi+0mG6kRzonlCfsKYf5LVBwA839a0bMwoG/ldmSYNzTvdItV8cR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699
X-Mailman-Approved-At: Fri, 19 Sep 2025 13:06:01 +0000
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

On 19.09.25 12:17, Eliav Farber wrote:
> This series includes a total of 27 patches, to align minmax.h of
> v5.15.y with v6.17-rc6.
> 
> The set consists of 24 commits that directly update minmax.h:
> 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() macro
>    once")
> 2) 5efcecd9a3b1 ("minmax: sanity check constant bounds when clamping")
> 3) 2122e2a4efc2 ("minmax: clamp more efficiently by avoiding extra
>    comparison")
> 4) f9bff0e31881 ("minmax: add in_range() macro")
> 5) c952c748c7a9 ("minmax: Introduce {min,max}_array()")
> 6) 5e57418a2031 ("minmax: deduplicate __unconst_integer_typeof()")
> 7) f6e9d38f8eb0 ("minmax: fix header inclusions")
> 8) d03eba99f5bf ("minmax: allow min()/max()/clamp() if the arguments
>    have the same signedness.")
> 9) f4b84b2ff851 ("minmax: fix indentation of __cmp_once() and
>    __clamp_once()")
> 10) 4ead534fba42 ("minmax: allow comparisons of 'int' against 'unsigned
>     char/short'")
> 11) 867046cc7027 ("minmax: relax check to allow comparison between
>     unsigned arguments and signed constants")
> 12) 3a7e02c040b1 ("minmax: avoid overly complicated constant
>     expressions in VM code")
> 14) 017fa3e89187 ("minmax: simplify and clarify min_t()/max_t()
>     implementation")
> 15) 1a251f52cfdc ("minmax: make generic MIN() and MAX() macros
>     available everywhere")
> 18) dc1c8034e31b ("minmax: simplify min()/max()/clamp()
>     implementation")
> 19) 22f546873149 ("minmax: improve macro expansion and type
>     checking")
> 20) 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> 21) 71ee9b16251e ("minmax.h: add whitespace around operators and after
>     commas")
> 22) 10666e992048 ("minmax.h: update some comments")
> 23) b280bb27a9f7 ("minmax.h: reduce the #define expansion of min(),
>     max() and clamp()")
> 24) a5743f32baec ("minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi
>     test in clamp()")
> 25) c3939872ee4a ("minmax.h: move all the clamp() definitions after the
>     min/max() ones")
> 26) 495bba17cdf9 ("minmax.h: simplify the variants of clamp()")
> 27) 2b97aaf74ed5 ("minmax.h: remove some #defines that are only
>     expanded once")
> 
> 2 prerequisite commits that adjust users of MIN and MAX macros (to
> prevent compilation issues):
> 13) 4477b39c32fd ("minmax: add a few more MIN_T/MAX_T users")
> 17) cb04e8b1d2f2 ("minmax: don't use max() in situations that want a C
>     constant expression")
> 
> 1 additional commit introduced to resolve a build failures during the
> backport:
> 16) lib: zstd: drop local MIN/MAX macros in favor of generic ones
> 
> The primary motivation is to bring in commit (8).
> In mainline, this change allows min()/max()/clamp() to accept mixed
> argument types when both share the same signedness.
> Backported patches to v5.10.y that use such forms trigger compiler
> warnings, which in turn cause build failures when -Werror is enabled.
> 
> Originaly I aligned 5.10.y to 5.15.y, but David Laight commented that I
> need to pick up the later changes (from Linus) as well.
> 
> Andy Shevchenko (2):
>   minmax: deduplicate __unconst_integer_typeof()
>   minmax: fix header inclusions
> 
> Bart Van Assche (1):
>   overflow, tracing: Define the is_signed_type() macro once
> 
> David Laight (11):
>   minmax: allow min()/max()/clamp() if the arguments have the same
>     signedness.
>   minmax: fix indentation of __cmp_once() and __clamp_once()
>   minmax: allow comparisons of 'int' against 'unsigned char/short'
>   minmax: relax check to allow comparison between unsigned arguments and
>     signed constants
>   minmax.h: add whitespace around operators and after commas
>   minmax.h: update some comments
>   minmax.h: reduce the #define expansion of min(), max() and clamp()
>   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
>   minmax.h: move all the clamp() definitions after the min/max() ones
>   minmax.h: simplify the variants of clamp()
>   minmax.h: remove some #defines that are only expanded once
> 
> Eliav Farber (1):
>   lib: zstd: drop local MIN/MAX macros in favor of generic ones
> 
> Herve Codina (1):
>   minmax: Introduce {min,max}_array()
> 
> Jason A. Donenfeld (2):
>   minmax: sanity check constant bounds when clamping
>   minmax: clamp more efficiently by avoiding extra comparison
> 
> Linus Torvalds (8):
>   minmax: avoid overly complicated constant expressions in VM code
>   minmax: add a few more MIN_T/MAX_T users
>   minmax: simplify and clarify min_t()/max_t() implementation
>   minmax: make generic MIN() and MAX() macros available everywhere
>   minmax: don't use max() in situations that want a C constant
>     expression
>   minmax: simplify min()/max()/clamp() implementation
>   minmax: improve macro expansion and type checking
>   minmax: fix up min3() and max3() too
> 
> Matthew Wilcox (Oracle) (1):
>   minmax: add in_range() macro
> 
>  arch/arm/mm/pageattr.c                        |   6 +-
>  arch/um/drivers/mconsole_user.c               |   2 +
>  arch/x86/mm/pgtable.c                         |   2 +-

>  drivers/edac/sb_edac.c                        |   4 +-
>  drivers/edac/skx_common.h                     |   1 -
>  .../drm/amd/display/modules/hdcp/hdcp_ddc.c   |   2 +
>  .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    |  14 +-
>  .../drm/arm/display/include/malidp_utils.h    |   2 +-
>  .../display/komeda/komeda_pipeline_state.c    |  24 +-
>  drivers/gpu/drm/drm_color_mgmt.c              |   2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   6 -
>  drivers/gpu/drm/radeon/evergreen_cs.c         |   2 +
>  drivers/hwmon/adt7475.c                       |  24 +-
>  drivers/input/touchscreen/cyttsp4_core.c      |   2 +-
>  drivers/md/dm-integrity.c                     |   2 +-
>  drivers/media/dvb-frontends/stv0367_priv.h    |   3 +
>  .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |  18 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
>  drivers/net/fjes/fjes_main.c                  |   4 +-
>  drivers/nfc/pn544/i2c.c                       |   2 -
>  drivers/platform/x86/sony-laptop.c            |   1 -
>  drivers/scsi/isci/init.c                      |   6 +-

I do see the value to backport the infrastructure, but why are driver specific changes backported as well?

I mean the changes are most likely correct but also not valuable in anyway as bug fix.

Regards,
Christian.

>  .../pci/hive_isp_css_include/math_support.h   |   5 -
>  fs/btrfs/misc.h                               |   2 -
>  fs/btrfs/tree-checker.c                       |   2 +-
>  fs/ext2/balloc.c                              |   2 -
>  fs/ext4/ext4.h                                |   2 -
>  fs/ufs/util.h                                 |   6 -
>  include/linux/compiler.h                      |  15 +
>  include/linux/minmax.h                        | 267 ++++++++++++++----
>  include/linux/overflow.h                      |   1 -
>  include/linux/trace_events.h                  |   2 -
>  kernel/trace/preemptirq_delay_test.c          |   2 -
>  lib/btree.c                                   |   1 -
>  lib/decompress_unlzma.c                       |   2 +
>  lib/logic_pio.c                               |   3 -
>  lib/vsprintf.c                                |   2 +-
>  lib/zstd/zstd_internal.h                      |   2 -
>  mm/zsmalloc.c                                 |   1 -
>  net/ipv4/proc.c                               |   2 +-
>  net/ipv6/proc.c                               |   2 +-
>  net/netfilter/nf_nat_core.c                   |   6 +-
>  net/tipc/core.h                               |   2 +-
>  net/tipc/link.c                               |  10 +-
>  44 files changed, 306 insertions(+), 164 deletions(-)
> 

