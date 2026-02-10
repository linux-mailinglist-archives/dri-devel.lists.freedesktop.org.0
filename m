Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SClxBG8Ai2nJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:54:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9611931E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D210E537;
	Tue, 10 Feb 2026 09:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H/uDl4Jl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B36D10E534
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBHKmYNH9kwSTseZjLdUGZlcBEuHODKZ/lQLXzK5lAU6LWD6TzCOJJEEfgoQMpQfoz1eHys+P0MtN7Oc5GCyZcwf/PLscCWn/PkQOXaUHVsX+xyqKaRn7z3eeo4r5jsF0IkBo6FuAkEW1iSZgK/zEwkmNPnT1Nc80eNWNjDR5i0esBh3Zm7BZla4QsOGu/mpSv9u0+Oy3xBgb8PhZeAOHOsz5Whc4gBRqXk7jViLSCtaTPyWASNZ4oFLpwqI0TcgDrb8He1Uqz56m9+rZB/D5id6YanZlhp8EyWkCmmxntpn04JITcVNYUhcFoZcvSdxiwGB/Ck9qQHo/ymeQP7g/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYKbOcuK1ycX45YoiJZR20lPiwFejGPFPCKX6ORc0gQ=;
 b=PKu9fcPgaIoNHonHAf57yb2KOngsGIOnglkRJVtwC2cQj0ueuvAmGc0KE0W4tu6cqsd/TWNql9uP25J/bEmWXq/pkN2F7dsHqcFPgLhpGvWRcG/hHWA9VOQqP4BNJgqynTPP5gyEcc+SDImiY4dzPAUW/lBFHsaYONrfYkz+A/8pZ+LscGL+HzxQkksLPXa/8B2QLGSWWJ3kXyxHqf31hs3V08pS7zZXW1t6vCHvpILeE2Ba4prLa/uB13lm2XoEM/VmqyXnICn2YjELAbn9+wHmGFvpwFpMBi4ZgAQaC/RutzH6s6k1/za3LAnPrd5qpkg7bgPm5XMhVnbD6Q14dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYKbOcuK1ycX45YoiJZR20lPiwFejGPFPCKX6ORc0gQ=;
 b=H/uDl4Jl8Lgy0/jBtlhVfmFN+bhcFeDagrGLeUAl71KMqs6u7aEuuojD6rJMg7ybO7jQ79Ox0zgLBbS66+x3pvUnPbSM+BlVtgG6PUtGpgzMG7kKR7UNqfsJkoZ5T1LJtoHo5lwAGBpPYW6B9SOxqz+s8io4Ajr8CWRRgzIjchU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 09:54:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 09:54:47 +0000
Message-ID: <98aec218-c636-4dad-86a5-5a62a443afcd@amd.com>
Date: Tue, 10 Feb 2026 10:54:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <29712ecf50a8dbd6ec13865ab4313a745ea16c14.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <29712ecf50a8dbd6ec13865ab4313a745ea16c14.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0344.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c3356b-9915-4957-15dd-08de688a6ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0x2cVVCV0Y2SG45VXAvOG9laEdzbDdFMDlLa20zVGRxMU9oNGplZDdLNWx4?=
 =?utf-8?B?ZHBGUDY0VTJwOStkV0UzeHBGSXZaSnhiUTZFREtqeU96SnRpSG40dzVTR0N0?=
 =?utf-8?B?YXl1K0lRVHl6RzJiME5rbjJOYkRHcXdkdytaL3FiSUJ4YjJYeUdBeEpyRWNI?=
 =?utf-8?B?NFBrcnJRWllPVmtkTit6Wm90TjNMbXNacGRCcmc4b3V1UGpJNzZqSU00VnZD?=
 =?utf-8?B?VkRiN1ZqeWJMUlFGbEcwZlpvVlhBNFNEdUo2eklWaGxmcGRjMG1HVW1mbFE1?=
 =?utf-8?B?ZUk1WVpQUWVHNHQ4ZE9kUmJncGdrTXZRNEpuL1BEWHlhRlFTOC8wdHRjZVBm?=
 =?utf-8?B?QkRFUWJUWlV2SW9FZGF1RExGdFdKdUtUTnU3dnZzK3VQNllyMCtBUzRsazlW?=
 =?utf-8?B?bXJUczh1TEpWRk9EQ2tTU1F1M2hUQVlBRWZkYjVkdGp6WDFEMlZ6eEtSREtU?=
 =?utf-8?B?QTRJbDdYaFFIdFFSZXova3JlUFhIMWVtZUhJRUcwSjk1dG1uTk1pTTk3QnBk?=
 =?utf-8?B?ZEUxOUU1ZkNaRUp1UU84SWNJbVpvUkluaThnZkdMS0xVMW1SRkVSZjdmOURm?=
 =?utf-8?B?N010ajhlRkNZaklMeHdFbTUyRXZ0ODJUSmJjdkpscGpVVE9lbGRkNTNETnMx?=
 =?utf-8?B?SWo4K0ZGdW8vTHplVnFTY3JHNWRNeGJGY3JWWnNRRSswakI5MzdXRC9PUm1Z?=
 =?utf-8?B?bFdVQkR0TC9xWDhESE9HclZxMC9VNy94SUNRdk9xckdZT3YwUmE0NTVBcDZi?=
 =?utf-8?B?MUxhYmxYQWtoLzY2K3RMYmFwRE9zWU5NZE42MlQ2UUZlN0JnSmVrV3N4MUxZ?=
 =?utf-8?B?a3VRdGMwcFlaSmlzdlV1K0hJTzA3ejhpVDM0ZktoUzIzc0NDOGJ0MUlZTXdq?=
 =?utf-8?B?MWlmTGhNOVU1NXVrQ3QzbUJRMUZSaU1DTEkvS0F2KzBGMlNtOXJaa1V0KzhD?=
 =?utf-8?B?VDMrbm1PRFlOclBIK0I2VmNiaGQ4QTV4cFhXV2NId0Q4VEgvdHNrNDhIRndu?=
 =?utf-8?B?WU9rbUdUbVdGMW4yVjhERDYxZ3hKT2Q3ZjJENUl4akk3WkEwUGg2akNvZkFT?=
 =?utf-8?B?TFlnMlpBQWdyN2c3bWVkdG5FbDRyY00veHlzZ2JxZTBTRjIrQ05jQkI5R3Br?=
 =?utf-8?B?QUxNSlJOUG1ZZlh0cmI0SWhyNGpteUsyb3RqNE55S0ZZR0hkUUVySFFGeSto?=
 =?utf-8?B?Y2I5b01ZYkVLeW5nR1BWd1gybXdXNzg5dGhETmpOcm1CdlJsYzFZdG83Mm12?=
 =?utf-8?B?c0ZnU2J0TysrSWRFR3Y4d1pOSitUZitVZHJ6S2RKeHA1Zk5QSjlxQmdkSHF3?=
 =?utf-8?B?SlRTRmgrZFo1UUg2TGo4bVdudDhyaEc3SmEwVnpnNG5ZK2FIQXdwb3FGQ0Na?=
 =?utf-8?B?R0lsdklNUUIrN255Tm8xK3IzRDNDdmlhVTRmSzBZclRWZTRrb1ROR3VJWnBC?=
 =?utf-8?B?bWlibWJ0ZjdtSk9JZ3M2OVh6dml5Qk9YKzNaZER4Yy9TQTF4OGNOT1lCZS9O?=
 =?utf-8?B?TU9oeEppK1hoSTVlUzRtK1pIZHIzbm9xbzl3dUg4cTQ4L0tiNUhZRldaY0kz?=
 =?utf-8?B?aWVIUUFSTDgyV2UvSWgvaDNqdXloS1k2aTFxQVoxbjA5R0h6T1l2T3BZUWNU?=
 =?utf-8?B?ZDU2RWxWTE9NSlNkdUpaU0I1MGY1SURlUzhEYkdXdTNWaDNZUys4TUhnU1dB?=
 =?utf-8?B?YWRVWmhPME55VDlKUzdLZWVmSmY0Y2Exbnl5N3dTUjVkMjREZkwrQ0VPSWZ3?=
 =?utf-8?B?dk52N25yb0YycUtCL3VKbHU3dnZBRXZnZEk1SURjaGtVV0Y2dFFGUEFab2Na?=
 =?utf-8?B?VmRURmhOalg0dmNGbHc3MVRGRTgvMndha3ArMGNFRWpzUm1YOEMveTFXUVNQ?=
 =?utf-8?B?dTJnemp4RU9BRnE2NHpBS2RHalFReEoyVmhTc1Q3S015a282c2twRGxidGRH?=
 =?utf-8?B?c09CY0N1dnMyZXF2RXF3Zi85U2lVWjNPUXFaZHhkeVRhK1NBVjZzUGV1cUVz?=
 =?utf-8?B?S0RJSVcwYlh4Mk5ON25FdTlsLzh6cDZYUVNrbU43VUw4czhZL2tWc21MQkRl?=
 =?utf-8?B?OUJ0UGx3Ny92czhYbENpcXh5Y3N3eFJyQ2FCLzZrTzA0akIxUGVIUy9JdlFY?=
 =?utf-8?Q?AaWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJ3SEdZQ0NQVlRoYTJYVE5iVWo1d3JlWjJjbGVKVXViZ0lZOWs4WmxjZWtG?=
 =?utf-8?B?RkM3NkZrTzgvR0ZNcTZhWkJqWk05dFpza0dEQ1MwMEpBU2h1TWs5dlhZREJY?=
 =?utf-8?B?NWl5bG1PWE9kM3FFUnFISWpHbXZvekhmVno0WjkvKy9KR3lJclJSWjlDUkww?=
 =?utf-8?B?ZnQ2ckFHUjZaWmw5MnRRajgxcEZhRWtDRE85SldpOEJ6SXNzbFJzQ2RmN2dI?=
 =?utf-8?B?MFVQNW8yalg1NXJEd21aRGkyVExPc0V0aTlpcEJTdFJodlphZk0xN3NtWnRW?=
 =?utf-8?B?ZXY2dzBIREZySzRrbkMwak5NSmNQV3hYcnhsc1Q3aStYeFRHN0t3bjBnL0ZF?=
 =?utf-8?B?bmJCZXp1YmRpTHhlRTdmK0xwVm8yc2luRThyZDQ1OW9oeUxEdFJCdkI3MnNI?=
 =?utf-8?B?NWF5cVdYdDFXNE80REtnMFFQWlBVQkhOaFhuTUU2S0t0ZDBGU2NGWGNrR2xJ?=
 =?utf-8?B?eXRVdnNzN1lZZXhQUjgxbEZkZFc0WmdXZlp4VnlISHA1NmpjT1Q3UmwyUWQ3?=
 =?utf-8?B?Q2JJOThUU3gyeURhc0pmUWZjN2lwV1VoeEpNdU94UjVTbUFaek9yUVZ4MUZK?=
 =?utf-8?B?L0t3Y0Z1SzFqTlMydnhLNkN0YlVzOXJlOWRtNllGb0xOc1NkbWl0OXkwOWVu?=
 =?utf-8?B?ZGxIdkNuUGtnM3FDYWpWeE9KS0xNSmVTRk5QcDNlb2E1Nm0vUzdOWTBvOHJY?=
 =?utf-8?B?RUNEYUxuYmU1clhuNmxUWlQ5eW1QQWRLeHNYT3Z4NC9oVWZGUzJ5Y2IwUWVM?=
 =?utf-8?B?dVFDTm5OUGlwMXY5TmtiNldDTWxvd0NiVWhoU0k5ejRTNDlUbjBPanVCY3g0?=
 =?utf-8?B?VkxWd2l0TzFQU2FWWjkvWFE0UjljYU5FeHpYd2xVOThIMnE3eXZuKzFJVUlS?=
 =?utf-8?B?eVdUZ0VlR1dBL3hWQU9aU09JOUxSL3A2RndXSjA3Tm9uejZ2U2xsUXV6Sk1T?=
 =?utf-8?B?NlpVaUdrcnpRa09qci9PNEo1blp5REszV1J2cWI4SGRQdzdTZHVMMkFYMVpm?=
 =?utf-8?B?VlFRM0psVWFVbldhaFNINTVXUEp2ZjlRQkFLekxnMHRmbGZwT052bzduU0Y2?=
 =?utf-8?B?Tzk0TkJwZjRUUlZEUFN4ZUpvQ1N3MjRQMmpOZ0xqN0Roc0ZTUUk2NGJTNTNF?=
 =?utf-8?B?M08xcTZGdXVYTHFTZ2pmYVhoZkFKWTJDQVpmUEVRMy91Q3FUemNPemdIMmR6?=
 =?utf-8?B?cndSWElKcENUZlovNzc2bWtsaUlmSGlYRERIbS9vVHdwTFFvcDBTNnpCcVBL?=
 =?utf-8?B?WFJyVCtQRmFtWlRmQThOY1hOYVFBQ01Td3AwMWJpMlBsTnV4anV3bVNQTXdI?=
 =?utf-8?B?ZUtpanlIdWVRSENEZHZGblJhbzdFRmVGOFFNWmJqZHNOYnp4T04rSXNOQmYw?=
 =?utf-8?B?UHVuUWNOckE0R3dIcUdNKzVZa0ZMdzltUHFjRHNNNFZtN1MwVjJlWVVxZ2lI?=
 =?utf-8?B?eExkWGxNOTIxK0V3NnVTSkpmRXdselRpemltSEhEVU1VTjN0QlNyU3p6RGRB?=
 =?utf-8?B?Mnd6cnFxM1ZZa3Q2aXMxMndGMVA4Rmo3LzVuK0RUZmRtRjdreXBPRHc4a0I0?=
 =?utf-8?B?cGhlTkMxWlEyMStwVUJJaUpxa3kydFZpZXBEbmY1UG5xaWtUdnNtbWdRaVJK?=
 =?utf-8?B?TU9rT0pObUMzS1prZEJDVzdFZ3J2WEV3YkM4WDBySXNSeWtuQmI2aDNUNzVs?=
 =?utf-8?B?OGl5QkhnMkZpaGxmeU9KT3Q0cTBtRnNzeFc3dWFKQWtJODZ3Wk84M2U3U3hX?=
 =?utf-8?B?L3J0TTNaVy9NQXhVSDNwWU4yOE1rMkpWa1RJQ1NaV2hUUXlRWTRkck14aDRS?=
 =?utf-8?B?a2xJTE5xSEFMRGtBNWcxa3VjR1dvVnhMOEorQ1lIV1EzOVhoa3lhTUlFWklP?=
 =?utf-8?B?YUZhbnpqN1ptOU1URm92cEkzQkRuZkhKUlZ6RU9US0xERkpTV0dmdU9OVzZl?=
 =?utf-8?B?WmxyYk44QTBGb0JCSG9GcjEwbk9McnQ2VmtjTVc2UVlSaUplaHNPd09uc1hJ?=
 =?utf-8?B?NmJnWFlkYWFZSUFpVEh5YmdNWTFJZSt5WmZTM3ZuUG1rQ3Z1Mm9XKzNrUUVW?=
 =?utf-8?B?WFVZaDFaS2QydXJuVncvVFUwVzQ4ZW1yMC9CR2d2NDJEUnVtZk1qellhUnBP?=
 =?utf-8?B?TTZyUlgvK1pCc0RsMWM3UXpBOExmS2ZYRkNpUG1UaXdDN2FGb0I4bzZrUTgr?=
 =?utf-8?B?SVhXU2ZlY1dseDh4Uno5VEZJekRxTDkxTTFVQ1JqbWZCdVFaaklLS1BIeHF3?=
 =?utf-8?B?b0NKYkxtMnZpOTdEeTJsbXB0N3krVExiaFZCSGh6Qzh5VTgydWNjS0IydnhN?=
 =?utf-8?Q?BteTOKlpH0CYNZtIdr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c3356b-9915-4957-15dd-08de688a6ccd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:54:47.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6Bmw3Q2tpva74N2q1caGR99DpgrwvFcjkUMo0Tvi+lCUM+oEXHSAb6uWSkpzW+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 74C9611931E
X-Rspamd-Action: no action

On 2/10/26 10:06, Philipp Stanner wrote:
> On Tue, 2026-02-10 at 08:38 +0000, Alice Ryhl wrote:
>> On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian König wrote:
>>>
>>>
>>> On the C side I have a patch set which does something very similar.
>>>
>>> It's basically a WARN_ON_ONCE() which triggers as soon as you try to
>>> signal a DMA fence from an IOCTL, or more specific process context.
>>>
>>> Signaling a DMA fence from interrupt context, a work item or kernel
>>> thread is still allowed, there is just the hole that you can schedule
>>> a work item from process context as well.
>>>
>>> The major problem with that patch set is that we have tons of very
>>> hacky signaling paths in drivers already because we initially didn't
>>> knew how much trouble getting this wrong causes.
>>>
>>> I'm strongly in favor of getting this right for the rust side from the
>>> beginning and enforcing strict rules for every code trying to
>>> implement a DMA fence.
>>
>> Hmm. Could you say a bit more about what the rules are? I just re-read
>> the comments in dma-fence.c, but I have some questions.
> 
> The rules need to be written down. Elaborately and in detail, once and
> for all.
> 
> We're having those discussions about the mysterious "dma fence rules"
> for years, but no one has ever seen them, despite knowing that they
> exist.

Well we have this here: https://kernel.org/doc/html/v5.9/driver-api/dma-buf.html#indefinite-dma-fences

> They seem to live only in the heads of a small number of GPU developers
> who figured out through long years of experience what works and what
> doesn't.

It's not even experience you need for that. I've pointed out the problems we would have with this even before the original dma_fence patches were merged.

You just have a very very small number of people who sees the design and immediately realize what that means, while everybody else even with documentation doesn't seem to get the full consequences.

> There are reasons why the state writes the laws on paper somewhere. So
> that you can read them and have a source of authority..

Yeah but you also have an executive who enforces those laws. At some point you just give up on explaining the background.

I think it would help massively when lockdep could point out even more problematic approaches. 

> That would end much of our endless misunderstandings and repetitive
> discussions.

You won't believe how graceful I would be if we could somehow improve the situation.

I've literally had to explain to whole teams who spend men years on developing something that their approach is flawed and they can throw away all their work because of those dma_fence limitations here.

This is a repeating pattern which happens at least once or twice a year.

Regards,
Christian.

> 
> 
> P.

