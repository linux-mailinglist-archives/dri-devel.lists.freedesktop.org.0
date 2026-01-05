Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7DCF5642
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 20:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5149E10E14E;
	Mon,  5 Jan 2026 19:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TpqytloS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FCB10E14E;
 Mon,  5 Jan 2026 19:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgxCh/jAPsNVo4heVVhO5uC4TIBu89Dg9JEJLwhAUEHSpo9BQoWv2pa58XljbMgVpzxU4KWl28E2H4waGqfneyG3ftv9MA306wEWMUxRlKS6t4sJqAOpisPF6wEp3jMxhcVJJpeNszfIatBtoI4QU0wI/MzWPdysHsXVjw/R0fn63KV8cnW7xipnuzonJbNwiEoP8wpsJocrldZThZ4/NSZ/CWSpamLwi1v6sq1W9NG3wJgtRS4nBp4qtJAuRMbSF7wMcOx0Hf3OV7XxfAM/gBBN1q1jUEt+NCELVVgtILTpJghFZ2SEzkhrIXSsGGHuwclCmuLk6rk/G5F3MaF0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWNUWvoFQ0W6ZxvdtakjT5P9E7l1NSaXlRRSddVx+rQ=;
 b=lLBs97OV1ZsHBXwd1yem7O1OGdTxZrFd4zX3fVBDbDcqWGdonb0HkcpTwhDd1xTvGafvXND81N1Hq+eKDGMZkjbwz78MrVZw8WzIxcdnI5Pe6qJR1Q1R2XB3D6h2dQipJNjXPq9o9Iq5R0t5XSifmf/Fw/6GRZKlWtIbZQ7yaZVjQt2+lomwou+GT9p2LLj4sCH8jsTt87Fm54sz55c4Jjv1ALdAuKtj7K1hdnYCLKiXKeU2f+QDGjLH8Gc0tJE7mRICis7RTkU9S9IWXRv73zho8xysR6R296ubTCR3+7LFdTZ11w86FkxrsStzEjcM46lrgGYY/d0+nP1JT8Y8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWNUWvoFQ0W6ZxvdtakjT5P9E7l1NSaXlRRSddVx+rQ=;
 b=TpqytloS14ptTUy3pAH8HC7wWEp5Riozhhe1ek4VFpmf6psK4edDsQCzVyFC7XTcT6F7yEXkVv4CzR31g+P0i2ilBnOkT3I455YA0fl7lG8XlRhscjFz3zshbAYOUoxmu0WG2Tk07yjquUtIKjGBRWn9d5lF7ytsCk20fljD8MLhDEsbcGDz+kW5oqgwaStnjgu8vDbN66V+DJ6uETcV4McHxOckg5pL+HhdOFmPpSZo13LT62+OH6p40ihfcPhyKEvDMYztIc0Op4vxiUsViVFdjUdTsroJdk1QMal46PeaX9LBByz8AZ0509kqDhiyQ8QvkFfFV9JV4ZbPWCl6oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:33:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:33:38 +0000
Message-ID: <e171f94d-060b-448c-aab5-bafc01fea7fe@nvidia.com>
Date: Mon, 5 Jan 2026 14:33:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2> <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
 <d642ef4c-145c-4b16-818d-153c8f2e3485@nvidia.com>
 <63a00906-a5c6-43de-82ce-328c8eaa7d3f@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <63a00906-a5c6-43de-82ce-328c8eaa7d3f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f7980a-7272-42eb-9346-08de4c91533d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2dYNW1XS0ZScDVYc2NweXREcWN1blV2dlhZQVdIUnRlZUJ5cXF1NG91Uldv?=
 =?utf-8?B?S0NhODBMenk5ZENoQjFWVlZIc0h4b1BiQmpxeTBiZXZtNlRzTDgvKzVkSnJY?=
 =?utf-8?B?aDJ4QWNTcFB5L0d4cjFaaHJrZ2xodHV2c2VWMTdoTjV4Q0QvbFcxZEl4cit4?=
 =?utf-8?B?WW15R0pLZnFmQ09yVTYyOGRYUlZqWXpwQXZWWlUySlh6WWxodTBISUVuNy9V?=
 =?utf-8?B?bkZ2enRYNHpwNmJrRTFwOWZqcVJ6VTA2ZExVMSs2L3FGcTFvTEdXSzJSNXlJ?=
 =?utf-8?B?U1ZtQ0ZSRjdXbWtZaVZlTDl3OWRKMWtucldqTjFWTUVGZ3N4SzMzQkp6WjEw?=
 =?utf-8?B?NzNHMWwxSnh0NzdUWHJwcTdIakZlc2tsT0FwSkpuWVB5cnNIUnVUWndtdHpY?=
 =?utf-8?B?L3ZINndzem1CcFdXWURFTnlTVmhTWUJYMzcvdkxpRnFRa0duNE4vRmNOb0g0?=
 =?utf-8?B?TVRma0dzMXVYTHc3bG5hY2xXYWt0akZieVdJb0JpSXVIU2laZEFXUm9HUXVw?=
 =?utf-8?B?SXdQbHdDZDNpTlVWTHlqWXlzQ1c3NzJtb3UrbkVnUGIzRGxoNFM2VUcvQW42?=
 =?utf-8?B?MXd4VENmd3hWdFB6Y1k3a3FCaFFPcHBvU0MzNkZSOVdOUlFQaUtXUytBaUUz?=
 =?utf-8?B?QXJZRjhNdGVRclM4aVRIdW9SS2RqVWIrbWg3ZkkzWlBhVHZ5Vk4zNmUwNmhr?=
 =?utf-8?B?U09odlhFanJKRUdkZVRORXFwZHB0clpOeGFWV0lBVE53NnJTRFg5ZURRWUZB?=
 =?utf-8?B?S1ZCOUMyR3JWU2ttSEMvTDRVNW5jLy9kbTN1Wk4vOW9WSnpOR29LYVRFMlRn?=
 =?utf-8?B?c2hzMTkyMTZhNVpyNkxkdjVZYis5WGJ0M2hBL1JrZXBJelJ1ekZUalZOeFNX?=
 =?utf-8?B?UmlRdVFFRVJRS202VVRoc01ZM3lTNG9nbit6Qjd4VTlFNitnVmVKWWE3WlhP?=
 =?utf-8?B?ODhCaHlBREVydExBN1UySExRb0ppNDFnckFzMHJqNFdBL0o3QkJCcmVxZGpN?=
 =?utf-8?B?K2ZSRm5zMzZFeWJEcWppZGhzdjdyRkxySGdyUVUzVFp4K0lyaDZPZkl5VHVW?=
 =?utf-8?B?SmZrcVBSTHVkRW5lUnNVZGV2emZsNldlT1RLdGs4QWxhUnNqSmJSSVAybEhE?=
 =?utf-8?B?bVhYdkFOTUhhQkx0cURxL0FGa1FKSEE1NWJ5dnRoWXhXNVlMa3hOWGxxZWI4?=
 =?utf-8?B?VW9JVE9jK2lscCtQUjRvVVFlNVFjZHlGZVhrSXdCSjdjcWhRSXJyMmVQMXdF?=
 =?utf-8?B?RlRxM051bDZqYS94K2NvVllZajZtOThDVEdFUytMZW5QU2hXcmxNMCtONG52?=
 =?utf-8?B?SnBHZ25KVjd1U0Vmdkd2VStmOW53M1djSHJSaUVJWUV5V3ZxeVZqcG5BUTZr?=
 =?utf-8?B?VEZ3dWpxcE40VEV0VDlQMFd1cW1tblZBdVF0RXNYOTFVc3UyaTljcFd2Vmxl?=
 =?utf-8?B?NEIzeDY3MnRrR2xRaUhndWVOSm9kODdNU3I0bjVuTGZBRSs4ZzdWSHNUWCt5?=
 =?utf-8?B?cmtqRkJuUHNRb2E4QzdkQVBPNDU2WE9kVmxMWmFwVVp5SjB6dWtYYy9aTno3?=
 =?utf-8?B?dk8wdGViYnhIcWMxUHlVdWdzZjlyb05hTFBXYVpINEY0THdFV3dZVU5kK3pQ?=
 =?utf-8?B?dG9YK25lNFV4bkJuNUcyeEVQZGNTU3BQTmp6UVVTb05xNHB3YVNOanAyY1NM?=
 =?utf-8?B?REVVc04ySTl6RUhWSlE1SDFDSFFNYlZSSmRyazgxK3NJUDRUSUlzUEcwWFc1?=
 =?utf-8?B?aEFXTEVvZFlzUWNFOFYzeWpxNUx0R2pyVUhRd2R0TCt3a24rUytCWkVWTk9E?=
 =?utf-8?B?aEhyYWNsbThjdGV3WjMyeEpGV05uODZJekZsQmp1bGlCUWhieXAvMkVWb2Z1?=
 =?utf-8?B?L3Bxbk1aajRhZGxPWXF6aW9VU21rNjVZem1Yb1c4VEFMZ0VPYW14TU5McG1L?=
 =?utf-8?Q?tXbfWQr+pcnW6GvEqx/esM2pJmY5J+4I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1IQkJHazJnR3U0Q1BDdndNZHpUa2FGeHJUNHJCWFlhenE1d296M29ENUd4?=
 =?utf-8?B?c2xBMkp0WE1qMlR0MFJnYlF3Mk5icW4xcGxRbzRVZ3luR1U5ZmpHWDc4ZDd6?=
 =?utf-8?B?L1J4RlE0UzJlQmE4K3p4VEpzZ3MrQk55NFoyQmsvNmdHakxUWVltbFdwYjds?=
 =?utf-8?B?TE5HRGNzNFlmVUNvYmVyQzdrc1I3QXBCbWgzMmhBMUNLQks2RCszblorNUth?=
 =?utf-8?B?MTlsa1A4eTYycVBqRG1DM2NCWXBDVWRCaTN2a3BtcGhiRG1acFp2UWRtMzd1?=
 =?utf-8?B?bjlQWTlBUmUyZFBjKzNBNXVsSTk3dzBETlR3S29RVTRUYU9EMk1YMXkvTU82?=
 =?utf-8?B?SUoyQW1QSm9DZWVKd0ZjVUVhdVVzMTRIZVRDZlZCSEtkQndHT1pTUFBzYkdw?=
 =?utf-8?B?STBKMDRTSjI5Um5GcXBUeHkrc2poTkxuTHNkSkt3T21scGFZR1RTRzM5UVNh?=
 =?utf-8?B?YkRNcG9SVVdXbWV1bFNYVk5CbVVDdURkVUszUzkxZEZxejdRdXk1K3RuVFQ3?=
 =?utf-8?B?akZJZjhTUmhUOUhwMG1JZlYyb1luVU83RG9BZlZkdUR5NUtDVnRIZVFRb3lp?=
 =?utf-8?B?cVlKaGkwU1R0UDZObnFqdlYwYUZjTkJVYm53eXJxWFExeEt1NkZpdm0rcDlu?=
 =?utf-8?B?ZStHV0RTTEFEeENQM211LytNTnNZUkFabG1zUm5VRVROZnpJdGEwN0l1Zk9X?=
 =?utf-8?B?MUhGTVk2RWVkb3RiUGRZNlZFcmdoalQ5VDM3c0ZDZkdzNzFnZXhwVFR6bk81?=
 =?utf-8?B?REZqQXErYjRwWE1HUTQzT3pJTGZUYVNETC9aZFYxT3RtZEtmUUErTWlWOFFP?=
 =?utf-8?B?bjRYdE9iaFA0emxkdnA5cnRIMkV6RlZUU0NwT3hMN0VtMFpCSzRJeUxmaTEy?=
 =?utf-8?B?SHNuZG5NSitQRmpMMi9DdlMrbTBZV1pvTHQzTVZVbFJtMThpakhMdWxpc2Q0?=
 =?utf-8?B?eWxMRjFWTEdTOWl5VlFmS0tOLzBSTFFFakpUaHBMYmp2N1ZhNEJwUzNxOFJr?=
 =?utf-8?B?NkxTT3VSQVVMYlIySG5zZm5ITTZ1TmtLRFgwNUtRVlJVRktySysxK3k0K1JF?=
 =?utf-8?B?YkZOSmRhbGpNdzk3Q2QzZGZ2emFQNmNLek05cjhZbGNKQjl5R3VJQlk0Vm9V?=
 =?utf-8?B?eVU3V3ZCcTI2aDVWb1hQTXpHY2Zlcm5nLzRZSENXZG5OVDdMQyswNkc0OFpr?=
 =?utf-8?B?WUtoYkYvZUErV1NrT2lyV1FEOXI0Z2lQOENITWt1YlZQRWFKaGVMSTZvQ0or?=
 =?utf-8?B?QTRyN1MyL3pkMU5IM2tHL1kwenV6WFU0YmkvaGJTaXBINGg0WFgzMW5IQTgx?=
 =?utf-8?B?aWVzOTBBcmJIaG83SE4xaGxwRTF4Yms1RTFYSjJCYWk0b0VkUWZmWWNSQy9Q?=
 =?utf-8?B?UW50TnRaS3BrUlZzcUl4cU03VEVjRWJLUmo5UEtIU0xETGd2SXZjd3NnYVpF?=
 =?utf-8?B?V29CdEpVRjlHcWU3TkNPVWJZanI1Qi9vYlVmSDZSbVNnTFh6cHN2emlNTERk?=
 =?utf-8?B?UWJCdjdNSEtxQk5FWklRam55M3UxSTdxWDRlVVpWbDdqSkMzMk5nc3pVNVd1?=
 =?utf-8?B?dFRNWXZQdE4xMU5LSCsreVFDckdZbCt6ZkUrSjZHTTQwMmljajBSNjM1THdU?=
 =?utf-8?B?VExIemwxU0RkVkhxUkFhSnFlR3U4SkxWeitGUDdDRlFDUnRaZWpyRHFtUktU?=
 =?utf-8?B?VGExQlhEa2xHeURZRWRGZk1xVkNnUi9WOUVlb0FvWCsrSERoTUtDeitGT1Jm?=
 =?utf-8?B?TFZuLzJ2LzdvMzhHUXpUeVZEbFBWbS84NGpuM1pCUFFiR1Z2M0VNeXFEaUJ3?=
 =?utf-8?B?RWdpSVRMZ0JwTGZ6T2E4OEdxUjN5VnNpelV0bDJSMEVhRW95ekNGb25zK0d1?=
 =?utf-8?B?ZktUVEQyVGJnbkkyaEdpZm1OOFh6WW0zU0hZUzZNeUJnWThwa0J5SldZYVp4?=
 =?utf-8?B?L3VPdVRKV3h0bWNGOUNVK2VEdW1jNmIrSm1TcVY2b2orYk9hL3ovTHhGTjZC?=
 =?utf-8?B?UTJ1NU10QzVoWGYzbjkxRE9YaWhLZzZUdmlRQWpGL2NpYTZna3pQdDlaYXo5?=
 =?utf-8?B?dXhEclhhUWdKMmtKNndibWM1bnVuTlNqQWpyeDBlR0FSV0twMjB4elRqaGkw?=
 =?utf-8?B?WCsxY2FSUjJhR2g5Y1Q1ZldxY0pBMDVSR0JjaG5DVEtVOVRCK3VEMzBuaHky?=
 =?utf-8?B?cTExaXZQUUk1ck5YNHlrYmpYV1NZMUttR2ZzclBEczl5VW42N1pCM0dvdHpM?=
 =?utf-8?B?bjhYOGQ4TDREV3hwemcvc3hIVzA1WTlNTm9WZGtpTURxYWwwd0lCbGYwNnZG?=
 =?utf-8?B?T0xzNFJPMmF6SWZqZVVNTUl4RzlDZzZtZldSYmpvSDlDVTNDa0IvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f7980a-7272-42eb-9346-08de4c91533d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:33:38.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM2DXhS3XafUbHTtFP5SckO7prBX0SEfaYE3eqUXWclwOXbf+T0ZAknNb5x/14DPDTr2L/ddVNDlS51jlibllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582
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



On 1/5/2026 1:21 PM, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 05/01/2026 à 18:11, Joel Fernandes a écrit :
>>
>>
>> On 1/5/2026 11:39 AM, Steven Rostedt wrote:
>>> On Sun, 4 Jan 2026 02:20:55 +0200
>>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>
>>>>>
>>>>> I do not think it is necessary to move it.
>>>>
>>>> I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
>>>> should be included before use, otherwise compiler won't see it. Which header do
>>>> you want to include to have this API being provided? Note, it's really bad
>>>> situation right now with the header to be included implicitly via non-obvious
>>>> or obscure path. The discussion moved as far as I see it towards the finding a
>>>> good place for the trace_printk.h.
>>>
>>> It's not a normal API. It's for debugging the kernel. Thus it should be
>>> available everywhere without having to add a header. Hence, the best place
>>> to include trace_printk.h, is in kernel.h.
>>>
>>> I'm thinking that my proposed config option is the best solution now. For
>>> those that do not care about debugging the kernel, you enable the
>>> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
>>> everyone else, it will not slow down their workflow when they need to debug
>>> code.
>>
>> 100% agree. We do have people running custom configs for faster builds, so this
>> hide thing could be enabled there assuming those don't care about debug.
>>
>> In other words, "If it aint broke, don't fix it".
> 
> But if I understand correctly, it would save 2% build time. That means 12
> secondes on a 10 minutes build. Is it really worth it ?
> 
99% of my kernel builds are usually 90 seconds. I throw a lot of cores at it and
with ccache. I care more about trace_printk not being available than saving 2%.
But YMMV. I am sure there are people who care a lot about build time, but for me
it has not (yet) been a problem.

 - Joel

