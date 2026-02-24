Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBgNDdlynWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:43:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93EB184D96
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EBB10E536;
	Tue, 24 Feb 2026 09:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QrLQ5D5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7832010E539;
 Tue, 24 Feb 2026 09:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhMjbyLWmkhXgBVkH3JzijXLYYohu8kbSRpGl8OcvrId6O/AIfkL3oR8u3LkltVxlswkqQygHEGd+3NI2TNCt6ceOargWCFGl2gZUKsbTIuG4jgDtJ7RoHlHAHgK5B5Dtw6rgtblJn/W8cI7RTkWsl97NIrP7wZvQ0g/odor03mvqPVg4SaZjK247fvwym7QBK1TaInamFMteiktZkf90d2fe4UaPVhxZna2WQSgWrBQP9EJjv0HsPACt3brU6/5wfP3HpAfqnHGRJvu8L8ZTi1Qq4Dc+XB391ZRXP6erkS0rHbrXuw0yamOHmQOYkPvPLuFXgP5aHb7v8vtdCEU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvQkqs+ZQFwKQBBl+/sPze2dLL3E5dLIoA+qZOV4OLI=;
 b=lPaPpAZytCGeeuz/PM2xORJEPYp55FK5jHLOA7BMzwbNwYdNhyXvjhZm8Q7jzt5+sbf6Kw7hfPNvBhggrPPCDHsJgT2YmIkdvdGm4BFv/Yk1v0Dhf/PReMiAanD4pWCa1l6VBlaJ8g7HiiNPEq+VTe01fCMu4qUOOXC7nKzqviLPuDWeZ8ReX7vpwLCK1zT0pOBoowuqmwegxDS4ZTq+dC4aarrNzP7PYh8GROqFhA+AGT4nOeI4jiM65y8P99+fOPA2BhSc9wc9+KvIRAVvuBndKG3hK9uvSBOpL7oO1L/t2dO7hWYrXydn0BMv3yZ3qKOhzJiCeaDfLG5SCY06Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvQkqs+ZQFwKQBBl+/sPze2dLL3E5dLIoA+qZOV4OLI=;
 b=QrLQ5D5sGlnyXhG7vv7uEnD8dzt9HVLffdfVi5HVNiIQRoLkxc8aqfZclumeakSTVyW3Ay9t4MQGega1SaZOj40cKK5mIn34IkbyrqvRNfomDdYZ+Qc3ky0M3FzUctiUNE640lkO7xj9KYuBlg4J9qDqGHdNZFN6begoB6HXJYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:43:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:43:46 +0000
Message-ID: <acacf729-17d5-42f4-94e0-695fd42b4bf2@amd.com>
Date: Tue, 24 Feb 2026 10:43:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Leon Romanovsky <leonro@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aZyhDuaF5vi05KBY@sirena.org.uk> <20260223195715.GF10607@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260223195715.GF10607@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8dadf5-b1a9-4227-7a07-08de738934cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHdYRXMyM2NpNk5jYW5BdndsWDU0Y0N4ZUgzMVB2MVdzMWg1eHR3TVNpTFov?=
 =?utf-8?B?bFZJeThqbkh1WHNxTVVsK1I5aHIvanl1NU83ejhTQUtLR0NvbmhyNjhOZUNF?=
 =?utf-8?B?WHFFU29iSzZEMDdBUmNSTzFXOEhQRHZHaS9hc24vTDVaeXlJNVFnNHZXQ3p4?=
 =?utf-8?B?OW9ERUZNU2JqSGxmSWcwdjVhTERNMWFGT05nSkg2Y1hUUFlubkpvY0dVZVNN?=
 =?utf-8?B?SmZTcjZ2elp1OVRSdnlmYVVXVXJsNTI1Mno1Ui9MVUNkU0VtdzdYL1JBeDcv?=
 =?utf-8?B?ZUpxZFZNYmJ3cGIzanJ1SHdjMkF5S293TUdJSjltNlFUQlUzVWJKc2FjTktB?=
 =?utf-8?B?aC9NVHdaTEZpanB4enRCbDYvRDZoUnpHZndONnFhTEY1WnhFRDgwV1lEL3VW?=
 =?utf-8?B?eThpamc0dXA2Z3RKNUJkVjRsaVZld1lBdUs1Wkw1TmRYdnBKQ3pyekVkeWVK?=
 =?utf-8?B?MEJKNXRBYnhBaysrTWZMQnJSZVpvZ3N3SEVxN0p0WXZqOFZXUExpVVFibXY1?=
 =?utf-8?B?UzlCenBtc2pESUtQWEFUMStNYnI1ODNXMC9teFVEQWV5UnR6b1F2cUwyUjNz?=
 =?utf-8?B?V3paZHFJVW5NeXVWRWRoTUxXbjdwUEJ3QXBBWXZFVzVhWHpqeU5TRFFpU2pB?=
 =?utf-8?B?emJsVE84b1hMZDBwYWVyT1VEUUlNYmN2NzRpY3ZwU0FOUUpLbUVXMDk3Nnhn?=
 =?utf-8?B?VDRJZjlMdFhVSEFyY3J6UVl2QnJhSmpCNjI3RTFpcVczNUh3V0JGMmdxMUto?=
 =?utf-8?B?N2d1K1JwZCsyUmpzZXczQXlBK0hmeXN6aC9BTTRkWkUvY0VXTGVNQkNlVlhK?=
 =?utf-8?B?MVFUSXpxNHJOYnhyb01kRHJ3bDQ1d0pEeGh3V1VvODlrMjFTZWQ4YlZEUndK?=
 =?utf-8?B?TXZ2bGx0aC9sQlZ1VGltR1NFWFlURFFLMFNJdEh6SHJ3YVFzbHZQQXNBZkZi?=
 =?utf-8?B?SXBGYTBQUUJrMTEvSTV1TUMvMGc0VmRlZDhEWWhyZmMxdjdvOWc2MUlqZ05I?=
 =?utf-8?B?U29zaXRrTTRHNUhKUUJkbys2ZjNiVmJmbHZHZ3hQMlZNakhieFRiYlA3WlE0?=
 =?utf-8?B?N3llOHRCdUpyd3ZFWHhrclFpbFlobmFmaHJ6NlV2VExoQ3lkZ25PbEYzZ2pV?=
 =?utf-8?B?a3pHTUYyWGVOQUhJZitoR1l0YVdib2puOStDdzlDcHg0R2pPVk9ia2VzcXY4?=
 =?utf-8?B?VXVaWHdiRUlvM0I2WEgwQXpOZ0ZYZmlSMHVJV3l4N0lxS2ZGY0RRZXkxc0Ez?=
 =?utf-8?B?UXF3b1UvdEZBT3RYUngyczIvZEttL0ZJWDNLeXZNcG53THQ3UDJMbjl1SzFR?=
 =?utf-8?B?dmM2REZ1UkxJZUVHTE1FRUExWktudzEzNkR3b0x5c3ZiZG9Cd3lYczVuYVNC?=
 =?utf-8?B?TEJEb3F1RGd0MGFORm8vb2tzdlFwS2N0NnBLQ2xTc1lhQmx4WkRVWkoxRVh1?=
 =?utf-8?B?bXhBeDY5QVNBcXcrMTg1MnNNUXQyb2JCTlhLNEQrYkVBZWxsVm9QajZ1c0V6?=
 =?utf-8?B?OGUrcDQ5bEp6Qy9lNCsyenp6TDFET1Q5dGZtR21IWGJaRU1obVVTL2ZWL0FX?=
 =?utf-8?B?MDJZZWJMK0lWclJGYldCYnF4QzRhclloRi9MNG1za2xnVnY5bDhPUzA4VWVv?=
 =?utf-8?B?SlNLSHRkaVdNT3d2MWJBWGkyOW5ueW0rYzJlMStVQVdSS3psaEtxNlNrU1Rz?=
 =?utf-8?B?TGtOeklWUDdFQWRuOG9jOWxleE10eERIeUdrL1RGa1pCcC9lUm5Ld3M2OUJj?=
 =?utf-8?B?cWZ4QVNlcWtZSEIybFhUeEFiLzd5OGE0dGlFMnZvWGlyTU1xNTdmeUVVTmR5?=
 =?utf-8?B?ZVVka25VSG42eS9hbFNremx4N0FnNjdqMGI0ci9CWHptZUc4MHQ5U3Rkb29C?=
 =?utf-8?B?c09IZ2dsYUdLUnY1S3dJakQzYjlRVFBFdFBCQXd6VlUvaTJQOTJScjhKem1B?=
 =?utf-8?B?TzkzR2plRU1sZVBDR09pT3ZTRzF0Z005YzA1dlhTdFdaZ2JlRVRwZStiRVlT?=
 =?utf-8?B?STE4cDg0bjRMSDNMRXpUakNjYlVSWXBTOWJWVEFNa3JOSWFOZW5sL3B4bmtK?=
 =?utf-8?B?VVBoUUtZRTZQeEVrZ2s4cTdMd2N2VGdISUlIR0lLbFVGdWlsOWtZYmtpNXVH?=
 =?utf-8?Q?PQis=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9SN3RLM0dyemVyMmgwTWZiOFhjc1NvQktmVmYxZGVyd3VHY3hnRHhHUnlU?=
 =?utf-8?B?bzlvT0UrUW95YnV0VXVsUWVhdDg0U1RkSjlNSS9ISVlaVU5qZmhPSXN0Qncz?=
 =?utf-8?B?dTAvakZoZ3BDU2J5Y3V1Q1lRbTJEa1R5L0htZzV2Q2o5K2FaWjdiem5xZ0FY?=
 =?utf-8?B?YUFMRXkzS2ZycTFrMEhOeEYxbUFhdkZBMlRHVDRxM08reWFZQ3MraHBWaTdU?=
 =?utf-8?B?S1RlejRZeUM3Wjl3eVZMNkdFNFpIeExZNzRndDB4cnJBYWZJYWo5cGxKVWJn?=
 =?utf-8?B?dWF5ZVQ2emZPcHZQamlub2RCam9IUjQyOFB0U2J0QnpnS2R4RVJjWnA5UThN?=
 =?utf-8?B?ekdiNi9uelJJcjQ2YThpQVR2N3VUckVlVU13S2dxTHRkWVlSalFuR1RYQWUr?=
 =?utf-8?B?ZEFFNGFraVNzRittckFhaG5oQWdvbWZoN3c3aXI2bEpvSUhoNGNqVnhhSjFs?=
 =?utf-8?B?d0dSVGhNbTVodWRBQ2N2YURBQlZhYmhxb1c0Rm9lWVdmTHJFWDZ4NHc2d2RH?=
 =?utf-8?B?N2ZpaHlrK3hGSHBKSXp3ZkdPbWcrNm5RKy9BVWxxYmxUR2Zoa0RSNzh2d0JI?=
 =?utf-8?B?TWxOOHcxTmY3dEtrMnEvWEY5dDZLbmZOZGlPVjB2b1ZDbXNSanF1MVZZSm56?=
 =?utf-8?B?NUJGNUx1dXBQSVdEMkNhdkRCYmtRUTJRbWN0RUJ6M212dC9meWRPZk03Wk1o?=
 =?utf-8?B?M3NJVk1LRnI3SXcwMFJXR1hJVS9lbVBIL2dXN3BnbW83dHl6b2ROODFqUlpY?=
 =?utf-8?B?VTFhSFB6V01uL2FxNkl2M0NEU09USkN5dWp5OU5KMUZacFJac05lQ3lXVkR1?=
 =?utf-8?B?YjdJOFQ1ektJVmM2OWZRUUhkQjhHc3owbUhDKzR0Q1V5aFMxY0c0T0V4Sk1L?=
 =?utf-8?B?ak40bFpCeTdyRVhzRk9abFRuZ3ZjWC9XVjZ2ajVBc2UzZFk5S0l5cjl6Zml4?=
 =?utf-8?B?Z0lrWXZLUWxNbkUrNFo5aExoVmdRTFE4RXFmdkJ3WHRIUjNTVmUwQ0w4ZTBk?=
 =?utf-8?B?SHIvQXZpenk5MWZaNWQ3ZVVUZDdOcWFObnJ0K1BQNzlQTkhLRXUxQXlsVjVy?=
 =?utf-8?B?WFNBMURBVWwzTDgwVWdYZFVlanhSQ1ZwV3pIWnJLb1YxR3k3YldZVG9lb3Zk?=
 =?utf-8?B?OW9Ra1NycEU3SUkxWERjalNTWFZKcDZVUmpkdkVjaUVmVDdBbHNjQzJNWUZ6?=
 =?utf-8?B?MHpqL1JMaFRwMjg2OG1xeno5dEdzcW5jT0RJMjVZN1VTVlBweUg3dmY0SXQ2?=
 =?utf-8?B?cEdPZnhrL3ZvZ2tqU0tYZG9KczVmamRPQytZMGRSUm5CalFrNGYybklmUHpJ?=
 =?utf-8?B?Sm5xNy9MWDBRWTRKeUtpMXBlMGYweEF6K1lQeDRzMWNreWJybUNQdGVoQ0RX?=
 =?utf-8?B?RkUxUUZYd3lpNTNaZUlQeWlGU1h5QU9ITDlhZExJN2V3YzJscTduSVZJWlVm?=
 =?utf-8?B?bzE5RHFxQU5ROWNITFJkUGZzM2RpSkYrM2ZRcFZ1N1I3QWxLd1FFbTFLNnA0?=
 =?utf-8?B?emIyc2dYeUtmTjl3d3lBUytnMmdINHNEUytOZHpnallaV1ROUnBmVThlTWt3?=
 =?utf-8?B?cGM5RDZ5MjBSWmIwRTE2THhEU3Riay95MDQ4T25KOEZZSldFTFVrMC96TndR?=
 =?utf-8?B?amdHWE1ObGhXZExEaG0wYXFoc2hpZE9Id1BSakdZeUd1TmlpWFFDM3lKZnVI?=
 =?utf-8?B?azNhOUJCVWpnTU1YRWNJVkdNM0Rva3FhUmRBWkhtNk5LV3U1dmxlbzRCV3JF?=
 =?utf-8?B?RS9ORzQ2RnpvSStJQnlSWGtEK1dWSHlST2dGdDBzaHplaGVWMHFTMWZZR1do?=
 =?utf-8?B?RmVuL1g4bWpCWkRIRkNYQklTTTNIeThjalRQWjViYmVrY1c2c2J1aHJFVU9h?=
 =?utf-8?B?d0ZHYlVWTFo4V24zS3MzRllQOWpLMURIZklXa2VKWEhNYi85MXppZXRWNEJH?=
 =?utf-8?B?WHNGaHpnTStIem4ySTRKZmlmK3A0Z1ZyNDJXQnRmWUsrSXNGaEFnOFlkcis5?=
 =?utf-8?B?V2hLeVZMejZKaVIxS1NNZWV6Zi94SWRMY21MeWJIaVZNenRDc3M3bmpOTy80?=
 =?utf-8?B?Z1cvdWpYdENwcXQrS2F6Um1rZ3A1NkhSSzVLLzZoVG10Smx2R1ZTNHBQQThm?=
 =?utf-8?B?WHRvMDI1bDQ1V29UOGhGdVU3QUVjSXQ1R0NMV3hYTGJpQmhZUUxtaUNBV3d1?=
 =?utf-8?B?QUNwMGpEb0ZKcUhOZlBFUkxiRVRNbHI5SW9lRUpGUmhGZVdJOFhwdGU3NXBa?=
 =?utf-8?B?NlRjeUozOGFSeW0rUnphazl1Ly9VUzhwMzVLeE1uYmk0MHphZGtKS3hHaHB6?=
 =?utf-8?Q?KsqhnCxQqDC22yW/5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8dadf5-b1a9-4227-7a07-08de738934cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:43:46.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t17/wq0w0QF6LF8qd3VxnuvU1K0vzBKdkU48M0x+UqMLo5euN6mzo16KRtPCACK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: D93EB184D96
X-Rspamd-Action: no action

On 2/23/26 20:57, Leon Romanovsky wrote:
> On Mon, Feb 23, 2026 at 06:48:46PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma_user_mmap_entry_remove':
>> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>>   249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>>       |                 ^~~~~~~~~~~~~~~~~~~
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniband/core/ib_core_uverbs.o] Error 1
>> make[6]: *** Waiting for unfinished jobs....
>> /tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c: In function 'uverbs_dmabuf_fd_destroy_uobj':
>> /tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>>   170 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>>       |                 ^~~~~~~~~~~~~~~~~~~
>> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniband/core/uverbs_std_types_dmabuf.o] Error 1
>>
>> Caused by commit
>>
>>   95308225e5bae (dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings())
>>
>> interacting with
>>
>>   0ac6f4056c4a2 (RDMA/uverbs: Add DMABUF object type and operations)
>>
>> from Linus' tree.  I have fixed this up as below and can carry as
>> needed.
>>
>> From 89e7d4987e08a46f2db151cebba258a1bc01d628 Mon Sep 17 00:00:00 2001
>> From: Mark Brown <broonie@kernel.org>
>> Date: Mon, 23 Feb 2026 18:27:51 +0000
>> Subject: [PATCH] RDMA/uverbs: Update for semantic conflict with drm-misc
>>
>> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma_user_mmap_entry_remove':
>> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>>   249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>>       |                 ^~~~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>  drivers/infiniband/core/ib_core_uverbs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> The change is correct. The
> dma_buf_move_notify->dma_buf_invalidate_mappings rename was merged to
> DRM tree before merge window and ib_core_uverbs change was brought
> during merge window from RDMA tree.
> 
> Christian,
> 
> You should take this fix to your tree. RDMA tree doesn't have rename patches
> yet.

Done.

Regards,
Christian.

> 
> Thanks
> 
>>
>> diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/core/ib_core_uverbs.c
>> index d3836a62a0049..d6e99c79cf183 100644
>> --- a/drivers/infiniband/core/ib_core_uverbs.c
>> +++ b/drivers/infiniband/core/ib_core_uverbs.c
>> @@ -246,7 +246,7 @@ void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
>>  		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
>>  		list_del(&uverbs_dmabuf->dmabufs_elm);
>>  		uverbs_dmabuf->revoked = true;
>> -		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>> +		dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
>>  		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
>>  				      DMA_RESV_USAGE_BOOKKEEP, false,
>>  				      MAX_SCHEDULE_TIMEOUT);
>> diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
>> index dfdfcd1d1a446..149220a1599cf 100644
>> --- a/drivers/infiniband/core/uverbs_std_types_dmabuf.c
>> +++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
>> @@ -167,7 +167,7 @@ static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
>>         if (!uverbs_dmabuf->revoked) {
>>                 uverbs_dmabuf->revoked = true;
>>                 list_del(&uverbs_dmabuf->dmabufs_elm);
>> -               dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>> +               dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
>>                 dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
>>                                       DMA_RESV_USAGE_BOOKKEEP, false,
>>                                       MAX_SCHEDULE_TIMEOUT);
>>
>> -- 
>> 2.47.3
>>
> 
> 

