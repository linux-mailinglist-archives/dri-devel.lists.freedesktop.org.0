Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E6D2B558
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EFC10E0CE;
	Fri, 16 Jan 2026 04:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPfXC0dG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631410E0CE;
 Fri, 16 Jan 2026 04:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4aZ6eJuO1kZ9Vws9/0diMs5na3hnDlnDNLfXzA9TPOZ5dwK8Umkpx+iBlCC+yRcK66Cj5j+SXl+QRIXtUsts4UKfUaXyeO68p6kbmJLtt8LXE38ONQIncQbfR9VvFdgUopeOCfDcmuMlMAxgTmsHvrCVmkMzAHVvzrK10YGot1QzzqlGwywEEBCtUW/JTTz+XB67ht/10c+rZc0TvtelUvmun+mA2Fz57d9H3hRBq+uBJic9AykSigpRSoJyZ5ccB3ho8QoY4gsxmOaB001y+8NI4SsaWG8d4BCxefOdsdywNVM6pCrkAiS84Wzh/vj/QSaNk++VIK/ac4BA60xZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1aSG8Z2rbMPJuG9ML4hNEIbvmlGzPzrnmoQI2wCT9Y=;
 b=KmMmNIAtD+uJ+oNqZXNVCo8HAqXRxkKlh3sDGnmrVHM+ts1i3mTYBr/j4H39HtGcVFai7Iw1TPdCQxdCFoVbke5fKYFEMX46JiLZBIcsVwz0M2dn/EyZdglIlnmVcwZe9+V3L/+k+24TouaA1wYmgbmaE88aAR2l8cCDhfH0fNe84uoY0KNWRpn48vZ0qw+R4I3EhC3yyOPEt5168XawnyOMc9jaT6KtTf7QxA5tVKXSXO4rJHwb6OzB9iBtZfDK4jeuURuDOPla7lEwmadesqbSR3anXwlVJb2pU4WT6qeKEmnQwH/BMFo25yl620u7MiuLGl2VeXyWPwGvCS+XiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1aSG8Z2rbMPJuG9ML4hNEIbvmlGzPzrnmoQI2wCT9Y=;
 b=PPfXC0dGR5PMdMWyiDoVM/IjnkdCmIpyZo34JTleGHoCvi0UyQ/g4zgdpAs+SLZmQlxLS8gQ5M2OK39pJdtPSYWvkMvUthAIwJ5fUoNWuVZArYtH7MOjQ/2+iFznVFu5KoFNAM5hx5CXm5VUNYzSn+7ZAppnMntGrEqUNAeSZfnYiTR13F8bikfKLF3a4PYjfIlsM9qyoEzep7+Iw3qLIX9gcMPG0XbWAFOGMwBda/ScR4gZwdWRt/bXjCHGsF6DUIbOp5eoPBTGMY2anHFKrsGUXp1sWbQZpnRLnu3qWCyWmwsUYkBsYcijBVbj6xMnUrCaPaEYMh2b/AOBq/QyfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:14 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:14 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v5 1/6] kernel.h: drop STACK_MAGIC macro
Date: Thu, 15 Jan 2026 23:25:04 -0500
Message-ID: <20260116042510.241009-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0741.namprd03.prod.outlook.com
 (2603:10b6:408:110::26) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 657ea600-ca76-4926-b139-08de54b73eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5XMXRCQUJ5a1Fsa3RBN1VCOE13THA2SkRhS1YvL0huQ1NjaGF2ellVWENJ?=
 =?utf-8?B?cmdKWllrNmkxa2FlblZuRkd0SkVEYy95b1BKNVZqYnFjTEp3SXU4bnBncy8z?=
 =?utf-8?B?R1FaaE1xdzdGOFhBVU9IcU9pcFBNR0F6SXEwY1hjR3pHWS8yMjFHeUtoeE1u?=
 =?utf-8?B?NFRUNlB0NTA5eTYxcmJMTCtZZG83eXVSVzJqdEdpdHpMTklGK3JsNHRsNDJV?=
 =?utf-8?B?VHFPb0xwa0FZNHA1V284bzVHblBUd0FJdnJ0cnZzSnVnTGo4bHR3NzdRN3hw?=
 =?utf-8?B?WWlrRVFlVm5BWDIzTkhtQnNmQzNYY2FNWEVodXhzdm1zYTFRdkZoczUxSTdG?=
 =?utf-8?B?UGdRbmlVWjhXNWlIeDdET2RpWnl2M09wdUE2NVlmNkI5ZHhUemhzMEsvLzh6?=
 =?utf-8?B?ekJWSFlacHRwNFV3cG1CT3NWRndxZUMraEgybGFyOUtGaEhQNVFtejhPK3NL?=
 =?utf-8?B?RHl3RVpzdm1vZVFtbGMyS3RrMHdwaU9hNjZMK1Zhakhxc3g1NitIOEpmcjlC?=
 =?utf-8?B?OUpOV2VPZUlBYjJ2VXdZdFRaU2N4TFpGRFZpQ0RIUjQ2TlVNMXVzbHVvRklZ?=
 =?utf-8?B?QTdBYjI2ZTZ0OVFPVnp0eE1xWjMwd241MWkwN2xSTUVUZ3phZXFHRXJHeDBu?=
 =?utf-8?B?MnNQbHJMcHFWNk96ekN5TU9ablM1cU1Md25EakIyUkZGZldpNitTMEhwNHUy?=
 =?utf-8?B?OWI1Sy9kVG9QYmxCVEloZTNTWXdqYkFBakJWdmZEU3MzM2NRREF6SW43aWxW?=
 =?utf-8?B?eHgxN0NRZVFBcjN3UFYwa0xlZjhlRGp1SVZnT2w1RnluQ0lXalVOQTV6c2k2?=
 =?utf-8?B?eCtiemJ5L3BoVThLbjZEdTdhUVJEVWl4cjFNaWk3SkhNcFdYTGxycDd4ZHM3?=
 =?utf-8?B?a1l1cFdFOFpHUjY3NS8xNnRqbkJaMkhzazVqRS8zK3N3U0hTSStTR2NCQWxv?=
 =?utf-8?B?Tm84YjhCZG9McnZtUSs2bTZreTFFMkN1OUVab2R4aGJIZTF3SDhyY1RaQ2da?=
 =?utf-8?B?cm5YQ3ZXY2NsSFFGTHRFc1NZN29KTVBpcnU4V1VrNkwvUG1aYkhMcFZvbE04?=
 =?utf-8?B?M3c1Q1IzUjFYSUgxZ3lOR2pMTkJ0RUpLb1d5WnBlY3ZpL0hWM2tiTVloNzV2?=
 =?utf-8?B?U0c3ZFdMbFZjcU1na0NLcmVuRTk0T0FQYms3YU5lRUZic2ROaFdMeWdVL3ps?=
 =?utf-8?B?a0xXQUR0ZVpBeGd3cytzaHRXNGE5UXhPUVBRQ3RTYmJMUnRrb00xMTVJTzg2?=
 =?utf-8?B?eG8yZ3FTTGZDL1pxdEEwVE1iOXdCeThhbXNBZ21EeXVVUlVZeWJnQVhNeTho?=
 =?utf-8?B?NlBOTW9UNkNPVkREV3hLKzRaUGFpOGVUaTY4WG5HaUhQYWJ3aG1HVzdnQ25O?=
 =?utf-8?B?ME5HMlpuN2pxQ21BNk1Pazhpdkk5b1F6ZVJhRzNyc2puQ2FRVVFYRTd2dXlU?=
 =?utf-8?B?ZXQ2bk5LTGxTL3NBeWY0WDA5TXdxNEdIOVVZUkJSRCtJMU1PNnJ1ZGkwWThT?=
 =?utf-8?B?TkY5VTgveDM0SEhZYTF2VEI1R3BsRnA5blFMMDBYZE8yb2RsblYwalN0aXlD?=
 =?utf-8?B?a2VTNmYyajVqYkJuWUJCN3VRYmdjTkN1eDFFVGFqYTFheXhnMTg5UjNwYmJs?=
 =?utf-8?B?dWZyWnVETnVrb3VMS3U5cmNkNGZYTzJ0M1pvVFJNaHFvc1h1cERtRjBGM245?=
 =?utf-8?B?ZThnSVI1bC94WGdOK3R2azQzMUZmOGxhQ0pabnJuMS8rZ2tuMmdJeVV6OGk5?=
 =?utf-8?B?bkl3YVh5bnJ0cFRON08rdlNEN042S2tGdFY2ZTJzSlNhR21aTXJHZDhubkg5?=
 =?utf-8?B?cUlZdm4ycGhvbjRlSFczc3Z6aFJGVnp6djE2ZUs1K09sQ1lNK0NIMDU5REtW?=
 =?utf-8?B?VTNIRGhjRzVVMUduVEgvZ0FwaEJiSXZJWXNTUldBZ0RSL1ZYUjJKcmJ6eXBo?=
 =?utf-8?B?a0s4Q1Q1VjVxNmwybWFxUWRVS3o0RmN1dE9yb0xVNkFzN09pV05oalVZVE5U?=
 =?utf-8?B?Wms2UWg5QytRUkFrcER6WlNCOFFVQjd5Z2V4T21ieVJ0cHdISEJzQnQzUUVI?=
 =?utf-8?B?M1ZEa1ZMY3Q4S0NZSHpMbytNczlMZGVkanhEUHpYU0RLQm1qZ3l1T3lXdmtD?=
 =?utf-8?B?aUUvZjhJcUVrQ0lsaHBIdVpOMWVzZUVaNXNqRkpPSEFOSnAwSVM1YjgyeFlu?=
 =?utf-8?B?cFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG91YVdrR3U5eXMzYTZFNXVhOU9WWjB1UTJvMHVQUU9BSXVxd1o2ZWxIekJz?=
 =?utf-8?B?Z1l1NHdHWE5EMW5ZZXRuKy9mRWR2dW4zZlpCSnJpYUhCeU4xWEhMdUZ6NGpy?=
 =?utf-8?B?VHZzMzcvenZjMEFyTGdSRW5hS0dHSVpsWE1DeDNtNlVKbEFpNWhxcnRkNXhZ?=
 =?utf-8?B?cU5jeHFvYUNsK2E4SlNZclM0RWE0UlcvbWZKeTJVbFRiSHNjUkJXZkpKcnpJ?=
 =?utf-8?B?RU96TmNhNUgySXd5S0lNKy96aUVweldZUUFnTzNvRytMbHdZNFZCajZxR3RK?=
 =?utf-8?B?TXFyQXlPeXFOK2QwanFTdFNsMm5ob3BwWGFXSUdQQkRBWUZJcllCVkZQeGJp?=
 =?utf-8?B?U2Y1M1BSeEF4aDdyejRvVXVOTVhob1RaUUxZaWF4VEJpVTkxUVJ6STd3L0Qv?=
 =?utf-8?B?bUJSSHUzUTBqa3R1UGZzR2RkSTFsYXAwM0k3TllDMm5hYzVYS0FqMk82UGE1?=
 =?utf-8?B?U2FDNGxqM3pQdnZwRmVKWFRvTWN6dzlWVGE1UVowUlZKSVBnSDIyOWliREMr?=
 =?utf-8?B?bHdyZzBkS3l0ZW9xQ1dZeU55eDVydTZ0b2I3SDRCUS9vSjRqUTZ3eWREM2Ja?=
 =?utf-8?B?SVBFMC9DMVptVVRTMy81YVdxUkg0amVYQ1hQc3BuaHY0akQ0dzJZMzEzNlMv?=
 =?utf-8?B?ZXNEamJWVkVCaElNamhRVGtkS0lWbGJXcDNheG9SWUQ0dzRJandnOHBMbFhl?=
 =?utf-8?B?ODVrdG5TZmVqcEJxT0VsMWc5RmJYcHA1bXdKb256REJmVnhhRHZLM0hLeWpv?=
 =?utf-8?B?VVJoQWM3N2toTzFpWWpLaE9NRWFrNWZtaU9yRFE1RmNacmtMVzU1SDd6cEN4?=
 =?utf-8?B?cDdrdU50b0o3V1NjbVltdnZvVzEzOG5LTlIxL0dqelpHRDlmQmhGbG80NSt6?=
 =?utf-8?B?dlJCSmFjT2I1M0d0dzlnTnM0L1E0ZHJwWGRyUHVSemVrK3c1djJyZkRIb3Bv?=
 =?utf-8?B?T1lQOUxTVUtEdEhqN25BeDdITGt6TElybGlMUWhKT214YWlVYlluazFOdHFa?=
 =?utf-8?B?bVZOOVVoUlNjOEI4MGYyUHUyTkswQVBpanF5THJnai93N1U1UXpGZ3l4V25D?=
 =?utf-8?B?cEQxSmFVZnRVUEh4NFR4WjhJcng0N1V3UlR5RXdoZ1N4VWZ4d05jYS9ueUpK?=
 =?utf-8?B?YzNZaS9kVUkrdzdmVzVaYUk5RFd1cm5ZbFdoQlltWGlGMFlqOEFERnpsMkts?=
 =?utf-8?B?VnlBUXJDV1JjeWlRcE9GRHlVS1o0N091bnNrVUdtQnB2ODBlMy83WTZWYU0w?=
 =?utf-8?B?dTlkUXVGVmE2Y093b0MxS2syVXd6TkJNSWpZSVFmaVFET0dMVTBiM0JqeHBy?=
 =?utf-8?B?ZUxMaXdPRXVxZzE3bW5PWG0wb0wzc1Zwam1pYkNZZ3FndFJYenZpRTVpTGVG?=
 =?utf-8?B?VGh6YTZPMnp3amdoTzZmOHhOVFN0UjhJR0RWMk96cnhlaHQ0SHgzbEF4YkdB?=
 =?utf-8?B?M0dLMnZqWVFiaFA5RXR5R2VLTjRYZW4ycm5xSlpCSnBQbDNlRVBFaEUxZFd1?=
 =?utf-8?B?elpYMnI4cG5BUUsvb2JtQ1Y5RHgzQ2YzU2pNektnTTFLSGFtT2dYVmJiY2Zo?=
 =?utf-8?B?UmFHWlpyNHV5NTNFclJsMHpJdnN6K25HbklhNURqa2VLMDJtTXBqZ3BZK28y?=
 =?utf-8?B?eEFJZmdXL2xmR1B0Wjh2MTdPY2lCZ2hoL1FjTW9JQk5jMFpvUnBiWWVuWkph?=
 =?utf-8?B?SHMra0dJa2hKYjJWaWEvMDZ3ekRtMjN4MlFGZ1dsZXBNWFhNQUZzTDB1dzZD?=
 =?utf-8?B?WTVyaFBmK2Q1WTJiU3FVRCt5cExWZjJTN3Bxa0p4NWRPNmw4RE9VUk11b2du?=
 =?utf-8?B?RmUrQWFsajZLaWk0aXZ4eGpOaW9lcTlMSGxRTUtNU2FCSzY2Sklud0dybEx6?=
 =?utf-8?B?RTIrZnVHQWh2OXpqQitMNGhZSTZBbmZGcGJGRmlybjNOZW05MHArVEllOGNj?=
 =?utf-8?B?WVNlWDFLSitvdEhMNCtZWUNjVHB4R0tMRkdRNGxJb29GbHBlMW5KbFV4bUV6?=
 =?utf-8?B?YmhHWXdIditCRDUzck9lcEdXUVllOFpJQWNyeTI0ek52dFp2aVlqbEloY1pl?=
 =?utf-8?B?eXJBcGcyWWJxRDlYQzdGRE9HZUJ4S1JKQUdRcTJkVERJcngxbTd3Y2NRb3RL?=
 =?utf-8?B?aDRSZGM0RitMWTBWa1FCQmUzM2VyMnJIN3I1aTRmaXJIUWw3S29KdHZBMStN?=
 =?utf-8?B?NjlSV29JV043WERHNURPWFlpbGRWbmRuakVDWnBMUXVNT1FybEd5NlVsMWRS?=
 =?utf-8?B?ekFpZHV5RTZQN2cxSm41cm5YRm9ZcVVRaWdDbjRHNE5tOS9oZFdqaXd0UVVp?=
 =?utf-8?B?Q0k2cFlJalQ2UWZ6YXFWK29sWEFha2VMTmczcUtQQXR5OTB4SmpvVnZxNDg4?=
 =?utf-8?Q?fcg4L84wPnN1ojIJ/EhMJ8OUFFJRVh7qZNGwg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657ea600-ca76-4926-b139-08de54b73eff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:14.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YvFEDFM0R2rIQWwvnomh5eBRnCv9xH3u67pFBeJFiqBzNnPdoUNr0Ao74MhGmsBXbsr62HQRk1W1AtgCgepbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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

The macro was introduced in 1994, v1.0.4, for stacks protection. Since
that, people found better ways to protect stacks, and now the macro is
only used by i915 selftests. Move it to a local header and drop from
the kernel.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c | 1 +
 drivers/gpu/drm/i915/i915_selftest.h               | 2 ++
 include/linux/kernel.h                             | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 87ceb0f374b6..600333ae6c8c 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include "i915_selftest.h"
 #include "intel_engine_pm.h"
 #include "selftests/igt_flush_test.h"
 
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index bdf3e22c0a34..72922028f4ba 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -26,6 +26,8 @@
 
 #include <linux/types.h>
 
+#define STACK_MAGIC	0xdeadbeef
+
 struct pci_dev;
 struct drm_i915_private;
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b46924fdff5..61d63c57bc2d 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -40,8 +40,6 @@
 
 #include <uapi/linux/kernel.h>
 
-#define STACK_MAGIC	0xdeadbeef
-
 struct completion;
 struct user;
 
-- 
2.43.0

