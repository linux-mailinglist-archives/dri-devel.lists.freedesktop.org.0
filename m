Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDJfJniqfGkaOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:56:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE0BAC62
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D3F10E9D7;
	Fri, 30 Jan 2026 12:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JkEpJ7/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314310E9D7;
 Fri, 30 Jan 2026 12:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcGagqNQqPMp+JBnGonnsJm7Hs6fn4XiaHgdUuAJc/KREvZZoi2o/5kvHtxvRSd5oqdOo82ZExK4prTWouJnvHnyQgr/pI9Wd90aIY0+qM3EtPlyRb4/g7prAhwaxdb/k0qbba5kJpP0rr+3Hmy4mwbEVZ7fY21QFVvGyE4qJs/fyCTV0fyvols2rqr47Ub763br1C1S00xyXl1AdDz4AVb5ZHQ4x4yFV3CCDQqPhuObTpfbxQU5gexi8QRdtkXGGOotRgcj0bS/eMEcSm+3ojRa6Krw0UJhI0POKo4Gs2E963VOYRpN+oQ/eli5dN6tEqi5IG2k0imH8hHaFe3eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b867ZJwMnW9imyuyotdX7fg6tbAZzX8vfzb/UbBFF4Q=;
 b=VtjuG1HjebJRmEItuUu1LLeAQHrhzu1IMoOhCcE8w7so8G1dJUimr5dyJuPQwUT7Sm224wLbAixuF4SEgNEpZ3H5LeD6QnDhOJEDpm5ZuiPzELEo68BYVPS+aZaIIL5QLudKTyxvJ1wRdpGq7TDf3qjQN1HWET5auZ/5aQbY+G1prU0oymBhN+ubVsB9Lt8InK3+wGq5aM/SOiE1lQ3y91qmhkzjb2ZGrHLrclB5ZdsilUIhE/NT8Kc+zHVMGbyvRnQiINHQsTAztHG0Xv6O6C8mA6kG8hVoFEXumr0jKixnTb0FuorJ3NIoAF+Tz9mMgud9x+G8kfDs5fPRZzFCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b867ZJwMnW9imyuyotdX7fg6tbAZzX8vfzb/UbBFF4Q=;
 b=JkEpJ7/pJTSqzYbH2HRAFAi6s8blhUcqAv0u3kopjRTkyxlTNh5WX0WrJHyuYDEhK+gyq5W1RwJN4DL4EL9+cy/ZlrCDci8t0k7Eo6/LNDnBMAba89ym2kcww6udab+CDDpZ6RJeNRZNJiRLKth3z0YB0kctO/4gIshDmrieiUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 12:56:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 12:56:17 +0000
Message-ID: <13184e3e-7d13-4f28-9735-b984e89892b6@amd.com>
Date: Fri, 30 Jan 2026 13:56:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
 <20260129153336.7473-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129153336.7473-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4fe3e9-80b1-4ac3-2642-08de5ffef4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm1JY1NrNEVCdkpXdWNZZVdaNVZzb3VwdTBjUCt1Q085M3pyVHgzaklsMTJE?=
 =?utf-8?B?ZFVFMnltRksvRDhQYTJpdnZCUTIvWTFHUkIzRGF5eXRhcW1la0MrY3o0NjFa?=
 =?utf-8?B?QUhJNnE5MlJycXU4WUF6ZERONUVlaEp6R0sxMmdlb2RIKzgxbk9mTkNvTmNn?=
 =?utf-8?B?cEhTOHp4OWQwZEN4bHgxRUdUNURXN3JzbSsrNjBManFDdytBR3l4TDBFYjNW?=
 =?utf-8?B?b2oxdnk1NGw2Q0czT0UwRG53Zys5YU5QcHZCK21vSEpHMnRjRWcwNFkvOStC?=
 =?utf-8?B?UmF3bDBLRjJIRSs5ak1QbXhCSDU2a3JCSmxMazdYWnBGL0l4VGFpS3dybm80?=
 =?utf-8?B?OHcvWURodDd1MFh1cGxEbGJGTU80QTFod0pUcG0wSEl1c2ZGb1VvbFdLWjJm?=
 =?utf-8?B?Z3VFQm5wK2Vza3J4c3lQZWFyNVhWSno0Smd6UXNYektFc0ZaNkozRVUxRXhy?=
 =?utf-8?B?QWVSQm1iY2NGd0hGSUtRUTBzeVBsSmtvV01na2g1YVNxcjlQbXhBTTB2UDdF?=
 =?utf-8?B?bjYwcmZ0M1ErblJXR1JOdjBSSWpIZmhnSkJ6TDRDSXhCd0pRQWo1RXFLMnIv?=
 =?utf-8?B?T09BNUhxTy9sZ0hWZU9hakxMdjIrelZZVTdPeEFmQlJNckg2Q0NOaXkvanFV?=
 =?utf-8?B?dCtVaG1CYTB5TmR5UWVnanc4bUJZbWVybVloVmxmQkxZcmZFRlE1dzJpUjhR?=
 =?utf-8?B?WkxQMzB1K1h3VityZGRjTHJoQk9MT0xoL2k1N0xURG41cHdWbDYrT3JUSXZH?=
 =?utf-8?B?VnFLTHBhcWdSZU5hd2UxY0lPYlVocExBMDFpNS9pRWVaUjBNWVIvcUF4WjV6?=
 =?utf-8?B?bElDT2NaMjJMNXJOTXIxSEQ2aDVKclhmeVQxSWllOU43ckJOc0JjME9uMkdQ?=
 =?utf-8?B?am5qby83KzBmR3EvL21jUUhYRWh6OENWV2VKR09ZVlRWMy81Y0w1a0JhS0hK?=
 =?utf-8?B?RTdJSTNpdzJNZnE4c01hcUJYSWVyMEhUU1BUTTlVVkswaFVjZWV5bkJHN1Zn?=
 =?utf-8?B?aGVyZG95bUhqNjZCUEp3bG5RQUhwdGlmZE1peHRGWFRKd1k2Z0IzWVFwdXIw?=
 =?utf-8?B?bndSUzA4NWJIeHlHZGlFdFhwbG8vdXhoU1dhdUNJUmVCRlI1OEV4M3EvU2ov?=
 =?utf-8?B?L2dSd1ZBdzBMNVlEeHVjUWh6dm1BUHU5V1FuUnZUR0Jxa3FmcldLbWlnRWcx?=
 =?utf-8?B?VytZeVcwazFJWW9iSGdNVjRvemJ6bG1hbEZrK01vMFM0THc1UHcxb0ZtRW5v?=
 =?utf-8?B?dUlraXY1R3Q4TUgzU0d3WkN0WUg3QldwckhWd09iVUtMeWo2bG9rZVljNlRP?=
 =?utf-8?B?SVFna1RuNEtWOTNmVk1FblJGWk9Jc3ZLVlRDZUJ3MnNSRzh2YWxXL2pBVlJT?=
 =?utf-8?B?ZEJzVXFuVWhvdzRHS3RzUFROZ3k5YlVLYVBDOXdSK1c1Z21nNURrRmtGRXFn?=
 =?utf-8?B?aDhzdVVOb0FjeldOUDJuVUdWL1VzZFAwMU9ua0F1Vy9NT3RNZy9KV2YzN3VN?=
 =?utf-8?B?bWtGaFlrT1pUbVlkMmR1TmhGUkNSb2s3VGVCUzNBb3Nva3FrLzk1cGNwKyt0?=
 =?utf-8?B?aWlhT001UGY1bWVCd202ck01NXdDZDM4c2RnWEF0dHQ3TExjeS9yTGVKZnR5?=
 =?utf-8?B?YjJwK2Q0WWlHdWVWWWlRU2hQUWQxUk5MQTNRbDBLMzRpbU5aMGhGR3pGNlhL?=
 =?utf-8?B?UVlNVUtDNCtLTXlSQ2YzOUJPbldLeDNMeDdKeCtYb0VuYlNoNlZhMXpjb2ti?=
 =?utf-8?B?WlJPY2I4NTJ0akJ6THRLNlVyYmcrakNwUEpXNXAwTlBwUGdLSmo4SHhOZzd0?=
 =?utf-8?B?eUh0SU5iQ0N4ZmVjeVNaQi9PVlBHWE9UWTJES2YwbGtxREZEdEhKaWtCc0RK?=
 =?utf-8?B?ZGNnRGdyTnVVOFlENkF0ZE0vT0VJa0lrK2hiOE00Rm9iRVJ5eHJaZFBQMVpK?=
 =?utf-8?B?bHBYdlRnakROVm5adUMxaHNEc3VmM2NBTFc1b202UFdoaldvclBEQW9tTFY3?=
 =?utf-8?B?ZzUvZ1ArL0R6R1UwTE1ML0ZNOGtLRXdrZ2ZCMHQwYzZNc0tjSGRWNkxoNHZv?=
 =?utf-8?B?VzNKdkJ3V3QxazdUVEhxaWZsNGt6R2ZxanNoQjJQU0ZmQmplR01wNVZsUmdM?=
 =?utf-8?Q?iRNw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtrdVh3VE54cVpXSnF1RDlvazNVeEFOL3FVNi9HaGxINmpGUDJLRXJsVDBR?=
 =?utf-8?B?NXh3UVJ6WjIzY0s2bm5LNnJqZkFwRnhZdGx2UG45YVJ5YndtRkdzMHZnQkhO?=
 =?utf-8?B?V1BDQjlEQkV6bVN4dUs4dFBXRThZZzFVMXVrS25aek05TkF4N1M4L2VMSy91?=
 =?utf-8?B?dGxRcW1KR1RDdi9PRGdOMWtEY1E4eW55S083SWlDemJwdjF4OWFFdGRzd0RF?=
 =?utf-8?B?dDJPaDUrdHhreXRmNkFsbm9wMFRFWi80bVVYMjRZUk04UmdVZlhlTDI3T3A5?=
 =?utf-8?B?TzhOUE42SFo4TlZjNmNQaHFuaVVsbzhiQkZqV1d4MVFaZUJsb1VpL2JhR0J5?=
 =?utf-8?B?c1FuMXJ5MldqZU91THNuYnJObndrOEdySUJPcFBOaVMyMG5oSXdRakV0KzlV?=
 =?utf-8?B?U1BUZkM1U0oxS2lKVnRMajh0cHhRSTJndXNhSFJ0V2p4QjcwVjB4bWNyRG04?=
 =?utf-8?B?SDJtUTUvejFsQ2ZBUTZrT3ByY0JGQllIT05Fc2lUb0VmVlh0WXp4Yk5KUkdZ?=
 =?utf-8?B?bnBVNUs3NzFyVlhLVDJ4bUIrL1VTZ0J6MktZNjdKMzI2WGpRRUhxZ0VQZ2xv?=
 =?utf-8?B?U0ViYkFUZFBadjN4eXFJcnJGZGdId1dLNnVwMjhPOW1qZlRqRE94bUR6ZU5B?=
 =?utf-8?B?YUlrMFRMYzk2bXcvalYwWGF3SmkxYkFFanNuMERmNVlCdzRYUmprWSt0WHpT?=
 =?utf-8?B?VVhjR2tWaE1xUkt3eHJhMWpsRGVXcHhMQUdPaDVBdzBwUWl4WmUyTmJnaEFX?=
 =?utf-8?B?QndVS0U4QitBVTBCRXZvcFRUOWlpM2F6NFNZVmZZVFUzcFA1VnVqY2JTRWg3?=
 =?utf-8?B?WXhJOW8zSjVaR2hSRldhaThDMEVZa25IbTBjWU9VSjJySlVtUXhoelZFSzNp?=
 =?utf-8?B?WVYrWWUvKzZvY1RnZm5ReW5MRUdrYjJRcmgrZTllaXY3VjFLaHg4d1Y2cHI2?=
 =?utf-8?B?Q1hsWVJPcklNTWo1aTBRRExMaUE1RTlJMUc5VW5NbkgrbmRsSGVuQ2V3NFNW?=
 =?utf-8?B?VlhMR2sxTGJmQ2tSVm1FQURvcW04dSs2dkNyeHVCZmhZdlRYejdBblEwOExR?=
 =?utf-8?B?cHVtUDBUMGxZSDJsbmV4L0p3SGh1dExWTjZZRlErcklWQUlKUjliTGNUK0lz?=
 =?utf-8?B?TGNQU3pSQmdiVnZiTStCTDNycEhxTW5iUTVHYWgycGoxYXk5RnRUZmhscENn?=
 =?utf-8?B?eGl1c3pTT1lBS3VWVHNBMWdQbEZHUkZQYWlKZnduN0trVHd6c29SNFphWFBI?=
 =?utf-8?B?UWFMYjJ2UWNneExRaTlkMFhFN3FtbnFsZy9DeWE3QUoyYXVBQm04TkRRbU5x?=
 =?utf-8?B?ZUVYYnUzbHlKRUw5T1hDOUZvNHY1VVlFajdwd0xhYzJVMmgrMDFUNWcyeXRy?=
 =?utf-8?B?QmdOMEJXZkwwSEhtQitYMGdwZmlFa2dKajdJSENtSDBHRDhMWTVWTVA1akZo?=
 =?utf-8?B?MjFhS2x1ekNGc2F0RFM0TDAycUdmdmtZekdSU21yUUluZ2ZndGJjQVB3N2FI?=
 =?utf-8?B?VlZ2MWVkY2o4QWF1KzRNWlZnWGdrU3Nmd2hSWEd6NW5qckMxOHE2MUliQ1pH?=
 =?utf-8?B?dFlGZEdsVFIzZ0dmZGppYkRzQ1ZOUGMza09CczBEOU8zN01YMS9KSmdkYzZF?=
 =?utf-8?B?VW5JRCtCRHNjdEpNOVk2UnB2L05sZEJtbU1mTVZzWDl0TlcvZE5ZWkw2d1l4?=
 =?utf-8?B?NW9XZFpPVjJBd0RjeXdCcFlwOUVGekJ0NWFKNFl5NkNXaWN0RW92U0ovQndN?=
 =?utf-8?B?MWJCa0hvTjNXQjEya2RtNHNMRmJPNWRmalhBM21Ia29nOVJ0cFVOajdLTEJC?=
 =?utf-8?B?dHZDb0FVNVBBU0cwYWYrM0I0NUdqVWVLalh6djNZWGRaZkFCbXJqNlpXa0Zh?=
 =?utf-8?B?aDVQQy9BT1Y2UHZWYU0vc01yb0FxUGRzOW41UEwwTTY2eHFhUVY1YWlhdmVJ?=
 =?utf-8?B?MHhKV1AraVkwNDFQU0s0WFkydC9ydE9BQzEyak5hVVBwRUFvWGxBa2dudzV0?=
 =?utf-8?B?eWcxWWFGM3FIei9JclFNcHNGeVhiMUhxZFpBV2g2Ymp2NG9aU25VNGFOVEFF?=
 =?utf-8?B?b29ZMzdwQ1FUNytpak11QkZEYjhiZlRHSk5peGpWY0wrZ3lUa0tXcWsxc3ZJ?=
 =?utf-8?B?Ri9qMm1DZ24yZkttaHU3dDFzcFB5KysveUZZTXRWYnJMOEJ4VUdlNkwrRWdW?=
 =?utf-8?B?UUt4UWhBbnNwMEFmVVpsU1lxcVp1R05Ua042U3F5UStSMG5UcEZ3MnRsZ2FK?=
 =?utf-8?B?ZHI1Q0FFZENsRU0wYjVrOGZxNlF0Vm9xNDVLdlpDYlB6bUtsUjNSVURwZ2tP?=
 =?utf-8?Q?pir1MmbhY/gFnQvy+U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4fe3e9-80b1-4ac3-2642-08de5ffef4de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:56:16.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fInUKteFH7pGnLEDkHuGkQEnD7SESWGKK6BVjAsrbdq5hRGsE4rIE799P+byQV1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 28DE0BAC62
X-Rspamd-Action: no action

On 1/29/26 16:33, Pierre-Eric Pelloux-Prayer wrote:
> Instead of reserving a number of GTT pages for VCE 1.0 this
> commit now uses amdgpu_gtt_mgr_alloc_entries to allocate
> the pages when initializing vce 1.0.
> 
> While at it remove the "does the VCPU BO already have a
> 32-bit address" check as suggested by Timur.
> 
> This decouples vce init from gtt init.
> 
> ---
> v7: renamed variables (Christian)
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 -----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 33 +++++++++++----------
>  4 files changed, 18 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index dd9b845d5783..f2e89fb4b666 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -332,7 +332,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
>  	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	start += amdgpu_vce_required_gart_pages(adev);
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>  	drm_mm_init(&mgr->mm, start, size);
>  	spin_lock_init(&mgr->lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a7d8f1ce6ac2..eb4a15db2ef2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -450,24 +450,6 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
>  	}
>  }
>  
> -/**
> - * amdgpu_vce_required_gart_pages() - gets number of GART pages required by VCE
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Returns how many GART pages we need before GTT for the VCE IP block.
> - * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
> - * For VCE2+, this is not needed so return zero.
> - */
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
> -{
> -	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
> -	if (adev->family == AMDGPU_FAMILY_SI)
> -		return 512;
> -
> -	return 0;
> -}
> -
>  /**
>   * amdgpu_vce_get_create_msg - generate a VCE create msg
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> index 1c3464ce5037..778c714c8385 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> @@ -52,6 +52,7 @@ struct amdgpu_vce {
>  	uint32_t                srbm_soft_reset;
>  	unsigned		num_rings;
>  	uint32_t		keyselect;
> +	struct drm_mm_node	gart_node;
>  };
>  
>  int amdgpu_vce_early_init(struct amdgpu_device *adev);
> @@ -61,7 +62,6 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
>  int amdgpu_vce_suspend(struct amdgpu_device *adev);
>  int amdgpu_vce_resume(struct amdgpu_device *adev);
>  void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
>  			     struct amdgpu_ib *ib);
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> index 9ae424618556..5b7b46d242c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> @@ -47,11 +47,6 @@
>  #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
>  #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
>  
> -#define VCE_V1_0_GART_PAGE_START \
> -	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
> -#define VCE_V1_0_GART_ADDR_START \
> -	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
> -
>  static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>  
> @@ -535,27 +530,29 @@ static int vce_v1_0_early_init(struct amdgpu_ip_block *ip_block)
>   */
>  static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  {
> -	u64 gpu_addr = amdgpu_bo_gpu_offset(adev->vce.vcpu_bo);
>  	u64 bo_size = amdgpu_bo_size(adev->vce.vcpu_bo);
>  	u64 max_vcpu_bo_addr = 0xffffffff - bo_size;
>  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
>  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
>  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
> +	u64 vce_gart_start_offs;
> +	int r;
>  
> -	/*
> -	 * Check if the VCPU BO already has a 32-bit address.
> -	 * Eg. if MC is configured to put VRAM in the low address range.
> -	 */
> -	if (gpu_addr <= max_vcpu_bo_addr)
> -		return 0;
> +	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
> +					 &adev->vce.gart_node, num_pages,
> +					 DRM_MM_INSERT_LOW);
> +	if (r)
> +		return r;
> +
> +	vce_gart_start_offs = amdgpu_gtt_node_to_byte_offset(&adev->vce.gart_node);
>  
>  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
> -	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
> +	if (adev->gmc.gart_start + vce_gart_start_offs > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> -	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
> +	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_node.start,
>  				   num_pages, flags, adev->gart.ptr);
> -	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
> +	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start_offs;
>  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> @@ -610,7 +607,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
>  	if (r)
>  		return r;
>  
> -	return amdgpu_vce_sw_fini(adev);
> +	r = amdgpu_vce_sw_fini(adev);
> +
> +	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.gart_node);
> +
> +	return r;
>  }
>  
>  /**

