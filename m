Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318CCF57AA
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055DA10E3FE;
	Mon,  5 Jan 2026 20:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K2x9p+Cr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013023.outbound.protection.outlook.com
 [40.93.196.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C42510E3FE;
 Mon,  5 Jan 2026 20:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es/6ncmR3iiIZUmKVI5Og4txLiMUeCxQZ8IyQkOWGfxSXRqJs0yp/DIOyKEBr+R95COwBE8Acv1XRP09ZJJZABvQ7YnYobe9UCXt07Q4Ec8LCB8xGXj3mPgpKwopP/0nx1id9aqSHHtyejpm2l8poBbKgNtWV5nUPAPrcxrwTIeWgH8QVDju6OyDsvg0pwx54dTi456AVgIXvUwLva7X+V0rppO1remGDoPsohXaMyDJruP7iNweVZyRptOYhdZ42WrGgiboDL5fMPiUm3Pr01kx2ILgXNeMj1Reh3fam4pa0OU1qy5dPRnqbE4/OWBlbtkg+N08iGm5fGQSZ0CHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmK7pN+zGC1r2bU48EJQ7Sebjyo3fVmi92hBmPQrweA=;
 b=VfNPoX2AjgXMJEUipUhzCldf9GIgsSBUCG74djQxEIna5VoNh94lqcqT1wv8QeLINkjC5aZW4OmCdGhcFbOfNweqqItyRdt7/2bD0qUEq5aikufR8jDac5DQvV2gXvwiZUByvr3e4w2r+STv5sqeFwUlGRASnFROd7RmoNrPMnVVqwepPsjJGqoCi4LrjqAsqHz9OvksLml0v71K6ob0kXNpIT3StZy89Li21m7Dj5xVcUowTwUP3spjstH+dVXR4DXGk+SgYGVaOwzSzWCmhhkFNXDE2uSISSKWQ9PrUBu9f21S5gfdrx0ZK+2yfexQccLeFXbGPRFpBXSnzzZHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmK7pN+zGC1r2bU48EJQ7Sebjyo3fVmi92hBmPQrweA=;
 b=K2x9p+CrGBFXhbyqLyBRppfonUJ46K4eVh8EX8n9QGGpqmE6JtsU7fAt88DqJvrMZhGKVbynsxAcDeA5itxZrhBq/uD65ECgqwd9WevvDLFIaa5yFZl59TTuxNkh6ACuYQSqOU5Jq6kV071BdYRyeB0xrbWJIuwUFooARBo46/25R1t3ErtCUJZZNq3M1I8d+vBRp2XzXbBh6+5OYfKdc90Fh7d6YlOS0ywlM019tjxbLXva4rz+8aaFJoMPchu86/xbMa6VcqZaGObbM7N0i22nLFKrXOUr/Uy0GTMCl/4lCowJYRBnyXRo80UIgceQNut6bRrDf+Hdem9z7w/PAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:15:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:15:45 +0000
Message-ID: <be346d2a-29b1-4cb9-b335-bd5193cf4cbe@nvidia.com>
Date: Mon, 5 Jan 2026 15:15:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
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
 <e171f94d-060b-448c-aab5-bafc01fea7fe@nvidia.com>
 <20260105150453.127927c9@gandalf.local.home>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260105150453.127927c9@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:208:32f::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fb00b0-dfe6-40bc-6eef-08de4c973525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmE2cDNJdEJRenpTVHc3L1Rlb1N4em1XNTYzVDNhMTNLL3Nlcy9TSkN1T3Vk?=
 =?utf-8?B?ckRtRzc2Vy9qbnBpTU5IRGhNUEVZYU8rdEVWUFAyc252QzhKbjV5MG5KT28y?=
 =?utf-8?B?cGFuYzN0WVVteUpGWGE3Q0V0OURiQmRCNjNycVlFQlNLcnMzVkJHYmFMeGxw?=
 =?utf-8?B?SDZlelRub1JOakViWTI4S2s2d2J4OThZVDk1SFBGa2NxT3FwWmFEQW01OHEv?=
 =?utf-8?B?cjF3ZERpU3E3M3VvSTFJclhaR3hDNEc3djFNclpDZmFzRUlJWWRKY0Y0VHRH?=
 =?utf-8?B?Uk1BUGJwVjZlUGNXVCtKNGhVWEFrc3lZamVYSnhoMUNrY2Z4SzJwcTVpU3ZO?=
 =?utf-8?B?dWRaNlR0R1lPdTQ3UWpaOVJ3TndlSDdMZzBYQytYLzVlK2hxREFoUytnTFp2?=
 =?utf-8?B?U0EwTGpsd0VKRHJVWVNMdllUemR1TGR0T0VXM1Ivcmh1b3lKbW5HYW9lTXFh?=
 =?utf-8?B?TjRlS09HaVdXTDhNSTRob2xzMVM1OGVEZWt4OTdQQ2YrV05WTmF0azFEZkx5?=
 =?utf-8?B?SHRTcWlVTGxuZ1lYcDQxSHA1dFRrK2NVMmszSy92STd5YWNTSTc0eEZDeGIr?=
 =?utf-8?B?M0x1ZFg4MHhFT1dQNmhmaEkyMk8zRmFrNXZpdXFaRDFreHNtaWVvdC9oK3Jm?=
 =?utf-8?B?VWllSVhGcGV1amcyVGZpdzNReU5HT05PUXlzMEdwb2ZKYllOWEo1ZWJRZ01R?=
 =?utf-8?B?U0psaUR6M0E0aDdRcVNMMFpWUTFNUW9tUlpQVTVSSUpFaWR4Z2Q5NmEwODFY?=
 =?utf-8?B?aVFmQ1RUaUY2Y0pKWHRTRGpSUkNQWXFYRXVkKzEreWJFR1UwZEorYW92aitN?=
 =?utf-8?B?R21TcDU2YTNhOUdmOWpMRGhPUXQ2NGpBd3o5U0taZDRxMjhpUlAzeTQ4eW1Y?=
 =?utf-8?B?cUJyTTlqQ3hTNWJOQndmWm9xLzhTQzdBSGxhSDIzcWdhKzNnQXk5RlF6RzVU?=
 =?utf-8?B?N0hHQTVsVThDbkJrY3pZTnd3blZReDNzcG5ZKzlVN0JJTmtIQk1nWVYrZzZQ?=
 =?utf-8?B?VVdzM2ZESC84ZHoyMGFxMGVkRTh3OVVjelU3L0YzMEVGZEhsdldBVzc0ekxn?=
 =?utf-8?B?emp1T1Z1dmFybzJtY3h4Y3kwWnlZVWhRaVAzbG1DdUJYUm1NdmNSMDkyTWZa?=
 =?utf-8?B?VjBPelc5RDlEeTBKelNwTXZiTzdXTHRCNVRzeUVvbEtJMlU3eW9qUUh1V0Vq?=
 =?utf-8?B?ZmpheHNGZnZaT2Z5TDk5Z1gvc1U5c0dMZDVLR3lGR01DMDBTS2pMQmZGSCtk?=
 =?utf-8?B?Z2dLY0JHTEZZQ3lqUGZmOFU3aXpRZXRNdmhka2srNnJaUkcrNlNQdXlxSnRQ?=
 =?utf-8?B?RDkzQ3B2TGVSWWx3dnRETHhwVmlZem1DellTRndGa09ad05sRmtEQVlVenJU?=
 =?utf-8?B?NWRNa0xRYjdCaVYwczJZRUdZbkkxWnM3YWFreDE4dTRSTDZmenNYSXpXbm90?=
 =?utf-8?B?MjJmME9tbkgwWnJsS3RiYnhrSXZWVmdhV1AveUlpSmZXb29nRDZIRklHOUdZ?=
 =?utf-8?B?cXpXelRHUktNVGc1QmdtNlNLMVlGQWxWNlNIMVowTHl5TTV1ZnNUd0ppRlE0?=
 =?utf-8?B?Ujg0Z1NXKzdONUQ1a0h0bERtbHV6KzY5MWwreFpNMXpxRW1aNFI5TFdZbWpB?=
 =?utf-8?B?TGpjTDJhWlp4NnlZczZlL21VRWZaSlNXYnZMZitGUjJqUG1yZ1lvMTdscmVX?=
 =?utf-8?B?UzMrWGxqcmVCSERZZ09Ud0NTejkwOU16dHg4eEZ4RHJpalh2TmdIR1lZeUJB?=
 =?utf-8?B?bk14MXZoMWN2U1ozN3dlV0FaTzFjTVZuUHZaMURqVTZVS2dnamcwSDBDN2pJ?=
 =?utf-8?B?SmdEUTUzL3BHQ1h2WDdFbUhRaHIwMEU2Rm91QnZhd1Avbzc5dnlTNjZZclV1?=
 =?utf-8?B?SFRkdStHK3RCVDVseThra1U3OEJFZ0RFd1l1MzdlMWw2TS84Qm5QVyszZkpD?=
 =?utf-8?Q?1d2AaGdmKWYe5xKBnx2iYLNapNrjnn/X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2krZ2RxaHVZSldDRGlMT0xvYWFQSTNGN201WXdHWHVOalcySUJoN3E2MUp2?=
 =?utf-8?B?V25VRGJoOXdMWFc4RDFQei84TDJZQ0IxVXE5eFhhQkhMU05zU01jdmsrWFlH?=
 =?utf-8?B?VnZPVnpkcWNaSWYrWGxuelUxY3lpaFZxOFlRYjlNR3EzcnBxZ3NmWk5YVzFn?=
 =?utf-8?B?cmVFVlUzSEs0Vk5RRllIL0lxUHduUlVVekRERVBEaGRWT2NBQXFmRHo5ZWIz?=
 =?utf-8?B?R3VsQlcyblVpenljbEhHOWRyQmszV3I0NkdCNDE2dHo4SWxzMlNad2tLaDlM?=
 =?utf-8?B?SEkzOVZ3Q1ZvcXNQa2VWZjBVa0p0YlFaUUUrK2VGcE1HNkZLTVlGeUZEVGRT?=
 =?utf-8?B?MExLQjJ1WEIvS09IR2xKdVNENXA5aUUwWHpNZE5NZTBlclFaU05xRWt6RnM2?=
 =?utf-8?B?K2JuWklWQUo0VVpETXMwRjQrSmFReHZoaE9HTm5SaFZlMnlaYXpXWjNERkRM?=
 =?utf-8?B?UnFYeXRzZWppU3BYS2dESXVLVEk3dlp0Q0R0di9LVFd0RVh2aGFrL2FHMmJE?=
 =?utf-8?B?aEw4SlhDS09uTW50Uk12cFRLMkZ6YThyMmN4TkRtc0hFTFBpbW1NRXhxOU93?=
 =?utf-8?B?RGVielZuTERVVzhCOWFMd3pOWkQxK2Y2WjhEbkJxWGtpTkUya2NYLzhYQnQx?=
 =?utf-8?B?RWpEM1FGbmozdDR1QURXWGJvY1U0YnRBaS91NlJjUFBaYzdlU1phYysyNnNW?=
 =?utf-8?B?MFVRSDkyVkJTa3hucEVtZ1dURWFTNFIwdGZpQ0FVeGtwZWFzODFleFAzK3Jp?=
 =?utf-8?B?Tm1CWWhOUVRaSkUxaXR4bUNOeDZsNnd5QVdUbTVDbHJxb2NGL255RFdKemNU?=
 =?utf-8?B?R3hzOXdMcWFMUk9ZdEUxV0c4KzMyQU9uQVJYRTdwTlQwV2Zndy82WFpVWUJU?=
 =?utf-8?B?U3A2ZkxsMGVWWW9meDA2V3FVZjJlMjdrbW9LcUFpa3BmU2pnZmlQVThGamZO?=
 =?utf-8?B?RloyYy8yNEVBdzUwR2dqcm40OHM2SmFrVm5rSTIxWXJUN211NmVrNHExYzM0?=
 =?utf-8?B?U2VKdEVOdlJjL245MGtGSFVZZ2N0Y0dMSTYvU283cmt0NVhQTnlNandDNVlk?=
 =?utf-8?B?REdsTk1LM1BTQVNHV0tnVlB2Mm9qVnI1UmxVS1JPa0tHbjgwM0JhWFNJUzRD?=
 =?utf-8?B?WGQ1UmREdFpSL3VHaWRQdU5tZTZtUXNYM0xBWEZuRkFWcXJYUmlpVU5BQ2pD?=
 =?utf-8?B?dVAxbHFUMUV0ODF6eDFjVktjdVZZSWMzR0ord0FHa01paXIwcEs5cmU5eldO?=
 =?utf-8?B?ZE1PaFJwUndUZjE2SkQrMWVic0huNDhCc1VKckR5ckhGaTFBREJvVlJIOU5o?=
 =?utf-8?B?MEZyV3dYVzRQZVp0MEsyMmJkLzUweFhtWjlyOGpSR1BnUEd4cVBRaTJzYWFo?=
 =?utf-8?B?eWViOTBuYmRjVFRRNnVacXNzbVBuVVFHMmQ5cFNLZERFeW82dnViOEFidEV4?=
 =?utf-8?B?WEtYNDcySGlFOW1xVHpMSm1HV0RxaUpkWjVmaGtncGl0YTBkWENpbWtOWm1V?=
 =?utf-8?B?bzhhVnY0amJYWEtoTzhRTmsvTWZqQU44NDJHSGVEMVQwUjNvcUJuYURGVkNX?=
 =?utf-8?B?YW50Y1VCQ2ovZ3A2NHhyU0NIZUY5T2NsMWVWK2w3UnVaaHJOK216WEFLMjZZ?=
 =?utf-8?B?Y0Rrdm5wQ3FOdVVQbTcyaE9xNHVHbmt4aEdYdWNqWURhVThHeEYxSGJ2a2xB?=
 =?utf-8?B?OVRaNGhqbFUrRnVCV0xtSkgzZStKN3puZ1lqK25LREdKVzRFTGNJdVU4bzVC?=
 =?utf-8?B?alVwSkxaOGVoNDBOL2NpNGQ2ZDRacWxqam4ydzNBNGtjL2djbGg0UjN5WEFV?=
 =?utf-8?B?aGZsQjBERGhtck4wZXJFQklvQk5xem5JN1YyZ1ZWOFEwRWdhUFRleWNzcnNq?=
 =?utf-8?B?QWkyM1cyU3ZNaUJlQzgwTUZuYk9WZEpqL1UvaTVKNmVnRUcwNUdpbVZvdmNa?=
 =?utf-8?B?QUJMTHRSTTZQMnZPMzFzRUIwalhaMndyWkxOc3ZXSGcrWHFKRWFqTlN1SnFT?=
 =?utf-8?B?SnptMzcwQmZLaU0rY3g0SFp4cDN4d0ZIcm8yOHkwdWt5VFBCL3FicGkvWTJ4?=
 =?utf-8?B?NHZiT3BwcDZ1U1gzcHFCbTI4TmRFZkg4SjBuVTA0WW43a2l5cG1CSHdDRlZC?=
 =?utf-8?B?S0laeWJPVXF5cE1td0FTR1d0SEJFV0pDWVR2Ujh0bEp3eWpYQ2NuUnR2cjAz?=
 =?utf-8?B?SGxUcGVPNnRhMlVBS00xeHN3ZjFHVUt4MmNGTzE3WjhXWXBISjFRbHVVNU9D?=
 =?utf-8?B?Z2dXRE9UNDR5R1pNT05iWlMrVXo4RGlqcUhTdWJQbDRoRnB4b1Nrc0YyaHpl?=
 =?utf-8?B?c29HU0pxNmNlVlJ1VEJTYkVtYnJkQXBaWkd0clVUaXdOcDREN1plQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb00b0-dfe6-40bc-6eef-08de4c973525
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:15:44.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmW7XgjTVoDFB8ZO8Up7k4Ul7v+m96Sb4KwF+w+4mo2dPJeMddc0RbpxEou/bfW5lSV8tZOwkUd/Qp66UNWQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332
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



On 1/5/2026 3:04 PM, Steven Rostedt wrote:
> On Mon, 5 Jan 2026 14:33:35 -0500
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
>>>>> I'm thinking that my proposed config option is the best solution now. For
>>>>> those that do not care about debugging the kernel, you enable the
>>>>> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
>>>>> everyone else, it will not slow down their workflow when they need to debug
>>>>> code.  
>>>>
>>>> 100% agree. We do have people running custom configs for faster builds, so this
>>>> hide thing could be enabled there assuming those don't care about debug.
>>>>
>>>> In other words, "If it aint broke, don't fix it".  
>>>
>>> But if I understand correctly, it would save 2% build time. That means 12
>>> secondes on a 10 minutes build. Is it really worth it ?
>>>   
>> 99% of my kernel builds are usually 90 seconds. I throw a lot of cores at it and
>> with ccache. I care more about trace_printk not being available than saving 2%.
>> But YMMV. I am sure there are people who care a lot about build time, but for me
>> it has not (yet) been a problem.
> 
> I can see Linus enabling this. I don't think he uses trace_printk() to
> debug the kernel, so improving his build times may be useful.

Sounds good to me. Making it an option sounds okay to me. Thanks.

