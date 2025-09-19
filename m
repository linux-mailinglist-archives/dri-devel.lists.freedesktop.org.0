Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A89B88C82
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 12:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068410E983;
	Fri, 19 Sep 2025 10:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tEHORSIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77C10E147;
 Fri, 19 Sep 2025 10:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNAHBy4KGh/T7nhYMBSmpntW+bho5i/WaawAfRrXp0TzwbTm7qJBsGGQ701i/5TEAyTNjdm+/9vjHEsCVD2pw3LQentAG3SQgYx1JXZudmwGrCA/INU3xaCFl/mp9lig3+t6b01WyMqxldVzSrut/HA2rCDybsSIXJYZqGN1N9RcPMxq90O+neJTNZD1IJtJcJYyXXAJV2cEzTAVJ46E+VtR4aZtd4YYhV2gdDF3rplh/HwaQT44tZHON1mpXNx7DkTXLoSC+WMCbqegx1fEMtnKJ7IBaYjU02HR0TW4ffby8UX6Q+mR2rw3H1YDsoEvZwPi64eZRibJ6a6oS9T8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyCYQmW+z4FD8DB+mn6r27kBsrOvWRPqr5MsoDaLZ1w=;
 b=PpGTgm3jbKcEjOnIZpV4lYe5Kp8Bja5WLFyBXgwBWmamQpd4YCtBJmcmYQwPFjwel4ezg9Kn7vbFJWAHzn8RXgbXnRatc0o+7SFtjgNTIi0xf5nop9THwf78bhhSSdlScZHB1Xnj4StYjUCjBaqlFMO8mPCPQAnDa6wrdGpkBCzEevni6KN70UFAeaJRgq7KdJJxHixuuAfjCFWw5i5SH4HisChonCDgxoVKGoqJMzVhtM3Tlj8MonT6tWO/Fa3FMJwfR0axlnNIo8wQ7T6EDxnd/rQHymGtA0S+hhGCft7PvtOtrhxm7ARiJ6wI57gnMPGvOwjUe2uZvew0kpSGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyCYQmW+z4FD8DB+mn6r27kBsrOvWRPqr5MsoDaLZ1w=;
 b=tEHORSInLldG8X7w/FjCfCfTnYavZ1QNSGzWWH2RK2SJb/8CTdFv34EvrXgYHTYpE4jyHOVGAn14JfPHsx62hzNpsN1C5QG/YZQdtaTzaLmN26cuUc1QuU++rKeGmLonhYiSU9HEODT9CcaamFAkp4ws9892LAUDwXE2xNzkYC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 10:17:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 10:17:33 +0000
Message-ID: <cfb34506-30d5-4b73-8bac-cf3c1a018901@amd.com>
Date: Fri, 19 Sep 2025 12:17:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
 <96c117bc-389f-42d9-952e-894768aad780@amd.com>
 <76861e33-8d07-4b97-9f91-4c5651732e91@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <76861e33-8d07-4b97-9f91-4c5651732e91@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: d82b8f18-7eb9-45be-0b23-08ddf765bf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0lKVTl6YjNDV1pLWXF6UzRwclZuT1drWGkxUWFQYUlHK0IxU0xHRUc4dTNw?=
 =?utf-8?B?d28xM0c1WnArUzA2czcvWW5DQ040aFM0UHN4Y1E1OVUwekRlTnBIUzBUQTU3?=
 =?utf-8?B?cWZLS2ZCQll0VDU1NFQ5SlJrU0MyOXRwTW9nakN6dUk2bGxPOU1zUGZNR213?=
 =?utf-8?B?NjhCa3hqTUpBakwrclBkN2RFZnNMYzJ3aTdReDlleGlQUkZvREptbXhUQnFB?=
 =?utf-8?B?bm5idElvQng4K01qakVnQWZ3eSs2VlorZndONUc3bXRpTWwzajJGZnA1N2sr?=
 =?utf-8?B?M0NuR2hzdDJNSUwrSWFjUFVrUW54K1UvTzY1a3hycGJzTGxZcGo1RTZ1WnYr?=
 =?utf-8?B?MU5tc29DK1RDOWoyRjA4ejRZR2NmZUhKT0xrRS9rTFVOblE2ZjdFdFkyVmR5?=
 =?utf-8?B?ZUNwSnVldFZXR21pOC9uSDR1clZTclh3SHRyc0hZS29oMlliOCtSMGU5TEFn?=
 =?utf-8?B?dWgvek5jb0ljeGV6dmFJaktwdE9oWW1CRWNnYmtMNkliV2YrMEZ2S3d1RjQ3?=
 =?utf-8?B?dzl6ck9FRWsyUlRGZFRZdEFiR2loeW10amZjQWJFcXAvek5HVC9tSVhxM2ta?=
 =?utf-8?B?aDN6djl4Zm1IbU1BRTFPZk5WVExuaXFMTGxWMjRVZTFEWXE2Z1B0ZDlYMUJY?=
 =?utf-8?B?RUtkWUVKbWJKbitEYUJicTNZS2xaRVYzQnFNam13VTVCZW5pNmg2M2R2UXVX?=
 =?utf-8?B?OHFjNGd5SjJyTXpCd1VMcWUrbkFuYmtBV3hZRTU2aW5GcFRXU3cwaS8rdnhy?=
 =?utf-8?B?S1ZCckVNUldNc2lIZUx0cTNJUk5WRlB4VUxUbGRiclFpWGpqd0VYTHY1NC8y?=
 =?utf-8?B?MXZ2ZldyQTJUUHk1NFE5aWRKTFpKYXc2N3NWOFZBSGNhNlNKMUFUSjl4Qk5M?=
 =?utf-8?B?VTlIY09IUkp3YWFtSEZtSGw5cDRiY1ZIL2R3RnNMVWpQUVpjc3hKcnRGNCtz?=
 =?utf-8?B?WStGeExlVmZ3QjhQMCtVUXlVVkJESDV6TUkvckNEMUNhcEFJcVRhODNzM1VR?=
 =?utf-8?B?SkhQbWptTVFxS2t1WlFkdkU3MlMwQkhYSzJnMGZRWlAxck1SM2lycDFGWndC?=
 =?utf-8?B?SnpWaXRCaE5kRnVxMG80YTZkbXk0R2NCSnlxRld6d2g2Nit0MTQrMTc3R1I0?=
 =?utf-8?B?OFZRRzltSmFId1htMXVaQVFHUW9jK0haajBLeWJRdHJjMzBpU2o1Tm1qUm9j?=
 =?utf-8?B?aDN3MFV2b1M3UFVQMDNWM0hXVlV2cC9WSWh0NmgyVkdpZU1qWm5MWW0zVFhF?=
 =?utf-8?B?V3R3U09LN29md3dnOWY4eDlTTThrRVJRNVdoYVBmbnNORHZPaUM2LzJ3YnhV?=
 =?utf-8?B?NFVYTlF3VkRvZ1JMcTBFTUpwOCtRdGkwMXFlbFFnYlpGcjRUZmFHdHdSUWRO?=
 =?utf-8?B?MUk3aGthR3d1ODQxa1UvSlVHOVRxMW91b21PV0FRTzRvMVNhVEpvYWI3Z0xz?=
 =?utf-8?B?L3hJNUJkcEJZMjE2V0hKeHVWek9CZ1pCelhuZGVHWVEvNlRxQjM2Rmo5SkdJ?=
 =?utf-8?B?S3lja3E1bnJWdFczSXhia1VCRFJlSWZHN05EQnp6eklTeGlKL1BFSk1Sc0FN?=
 =?utf-8?B?TUlXcXUycDNteTdvV1Q3ZWJDNEg0aUJnUGZoVTI0U0V1bEplTXN2VXlyTWlM?=
 =?utf-8?B?aVNkazBZcXdrRzZzaGtBTjhqREgxTUZhYytMUllJT2NPRGtJYmxZKzg2b1VN?=
 =?utf-8?B?NlhLMC9LVW1wMDF3eTlVS2IyVVplamJ5bDZ4Ry9qR3UybWlXZ0ZyTHhzSk9s?=
 =?utf-8?B?ZlVteVdWajNjZXpTc0JDQ0lYZlU1UjBkK3JKa3loOW5ONU9ST2JCcHI2eEhl?=
 =?utf-8?B?STRsL3hkbUZaYWY1dThNUEIrbXg3d2NzREFaVnFHb1N0SVN0Ly9Ic0hobDF6?=
 =?utf-8?B?cUE1VnhjKzBDaXp1dU1NZGRiL0JlWHhFYUZURTlCWkJLZDF6RmFJeWk4NXZ5?=
 =?utf-8?B?ckdVK3JwNmF2Zlo3enlOeG01V056YlphQkRuR2t6TldQa1l2Z2Y4MDdJZnc1?=
 =?utf-8?B?Q0w2OUVuaTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkZMbGVBMzk1MW4rQnVidUhqUTZqU0RhSkFCd20zKzE3UE1XQTU1a2dlRjFR?=
 =?utf-8?B?b21tc3NCODBReTRDSjZra0Y4Qy93UmE1U21JaXY1K2x3SCt4ZHMyRTNna2Nm?=
 =?utf-8?B?dzQ0akVZRkR2RTlKeVdRQkc4alhhVzZ0QTJTU1JZTDI2RDQrUmhtTWlKRmNo?=
 =?utf-8?B?VFBrWHBnZzB5aXJUMHpZektGamVhaElBb3c5bVZBTVRZSUJwVXFaV01McitZ?=
 =?utf-8?B?VWxZd3I4N2hiWjFNeU9sSHpRREp5ZHZxeFJJeHZZTEtxSGRNTGEvSUxKcUtX?=
 =?utf-8?B?ekdHZldLbHFaQ2E0ZGtmTTFUY0IzK0JuQytxT2NEai9UY2o3dGNSczVqemIr?=
 =?utf-8?B?ZnRKWlNNcWwzeWxWRU9ROXp2RXgrZ2NLSmp3UjdrWVpMRis1c0h2NGJ3dDNS?=
 =?utf-8?B?amdFbzlWYnBOU3VscUV6MWVOV1Jwc3cyeEF0dDBXRHlUeVQvWmE5VE1TVVZm?=
 =?utf-8?B?VThJdGE0TWZLMWNoZjZCU3I3bVRISE5TL0NnenMwdnBJNTZEUENBdGN6Ky8z?=
 =?utf-8?B?a2hmTHYvUTN5Sk1JM0s5VzhNZjh4Y2Rzb0Q5aW9HcXV1UGNPUnhKb1V0QTJN?=
 =?utf-8?B?bGhEYlJGZVphc2hIWU1VZWpXVmExWE1LQ2ZqU1B6MExEcWpJL1VES3Fwd2Nh?=
 =?utf-8?B?SVVHaGdMdzJ2djUzTlo2anIyOCtBMGZUQlBoUC9PM29qSzZqdUQ4amxiRlNx?=
 =?utf-8?B?TlNXZDBSaVpZNjdPUDErdUxaUTdxU1YyNi91Q3NOZVNNWWpnZ0NLYkc0NCsx?=
 =?utf-8?B?amZub3pSN2UxMXcxQ3dJUmJxaFczZUFKd1pZeFBuU3lDRUYwOTN5cEgydG9w?=
 =?utf-8?B?a2FMWmNyNkY1SlZSN2Ztak5rN0ZoakZvV2ZtVEhmdUpzU3dBeXVqUDlzUC9C?=
 =?utf-8?B?MTU4Y1FYdlpydU1hNjg4SUFZekM4MjBXVWFYVFBMdWxLeEQzV1ViSjVJLzdL?=
 =?utf-8?B?N0p2a3lENmxPQnREd3QzUUlxQ3RDcE9OT2ZvSDNad2FYTEJEUjZ0RTFUbm9U?=
 =?utf-8?B?UjZrZyswQlBtakc5dHVEVmtlTzZlMnZ6VU9Feks5M2Vzdm5RL0xiTTk5WUZW?=
 =?utf-8?B?T2VRb2dKRkFRQTN6YW9pSk1EcHF3anBJbWVXajBQdVY5Z1Y5T1JoZTgrNzVT?=
 =?utf-8?B?NjJ5TWlkYldpWEZjSXcxOUY4SHZjcjNUbEFVUE0ycFZXTDZKa3VKd1RyMGNy?=
 =?utf-8?B?U1QvQUJjYVVtU3BHc09sTnJYa0c1ejMwL1krNGdmMFhSdUpBdEo4cnJWcXpE?=
 =?utf-8?B?RTd1RE9yTmNFVm9sRGQxU3RvOVY1OUJNWHFHcEgyaUNrZ2xTa2xBMHlHWEN0?=
 =?utf-8?B?UTJzc05lTExIbzdlSVlmMnNYdjVEREdqblNtcDMzb3VnTVM0anJGUlZWSzM5?=
 =?utf-8?B?cktHcThoMlNMOG50bjYwd05GRThTQTBjcm0ycFpvT05STzRMQ3NJS0JUTlJp?=
 =?utf-8?B?UGdNWExQZVlxNFdWUTFyTzhHU2JMMGtIRmVaRFBMMnRuL0xnRWFDckpGcklM?=
 =?utf-8?B?OE1pQjE2TWs0QkJKK3N2cUpCK2JIbW50ZGRNYkh1bW5UWm9GUGYyVFhCaUFQ?=
 =?utf-8?B?MUdqYWFuNXFHdjVVS0RZa1hjNkFqNU9WMnhyMzNsc3orZkR0VWFIWDBXdkpO?=
 =?utf-8?B?ZFNqZTdXWFRoN3Y2bHNxWXNMQTh4T1luSjBBaUt6Ym9BTlFEeTNiWDZERVdB?=
 =?utf-8?B?cGdkSlJibTYxRDYvNEFxZnFBZFpKZzMxcFVRNkFnUEVCY21WVUtLelFwTG9L?=
 =?utf-8?B?VmJ3ZWt0cVNPWFAvY2xQQ2pwYVdxRVRvNHk2Q0lMNUNyRm9vVUNndVJQRGVx?=
 =?utf-8?B?VWpuM3RZUFZieWtDclN4d1QzK1pySFJWS1ZrKzUzbGQ1Tmduem16ZHJnWTNJ?=
 =?utf-8?B?aytVajdhTjBEU2gxYXh1bDE3RGkyMHRQS1NESHN5UUJpTTYrZGdSRFZDaFVu?=
 =?utf-8?B?WHFLazBkWVZQRFJ6REJ6eWtNaFpsalUweXNBOUlMOVBycEhBdHZJOFovek1o?=
 =?utf-8?B?RFZuOHlqTW9xR2FZUUJ1YXNZQWR5cUtTUEcrZTlPTXQrd2pxY3d2Z1FIcjU2?=
 =?utf-8?B?NlFQQzRSb1c1MGpoZmhLb1A4R1p5MXEzRDQzRWsyZjEza3IxYzFTQ0I4THNw?=
 =?utf-8?Q?y1SDubegqAzVVd39M+2sBaR2J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82b8f18-7eb9-45be-0b23-08ddf765bf11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:17:32.9027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgAzjEWLRWuDP90WLmlJNAQOgMeysbndpRzKhrcMgbjlqWFFVsGkyQ7O955H8zO0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993
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

On 19.09.25 10:46, Tvrtko Ursulin wrote:
> 
> On 19/09/2025 09:01, Christian König wrote:
>> On 19.09.25 09:43, Tvrtko Ursulin wrote:
>>> On 19/09/2025 07:46, Christian König wrote:
>>>> On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
>>>>> On certain workloads, like on ChromeOS when opening multiple tabs and
>>>>> windows, and switching desktops, memory pressure can build up and latency
>>>>> is observed as high order allocations result in memory reclaim. This was
>>>>> observed when running on an amdgpu.
>>>>>
>>>>> This is caused by TTM pool allocations and turning off direct reclaim when
>>>>> doing those higher order allocations leads to lower memory pressure.
>>>>>
>>>>> Since turning direct reclaim off might also lead to lower throughput,
>>>>> make it tunable, both as a module parameter that can be changed in sysfs
>>>>> and as a flag when allocating a GEM object.
>>>>>
>>>>> A latency option will avoid direct reclaim for higher order allocations.
>>>>>
>>>>> The throughput option could be later used to more agressively compact pages
>>>>> or reclaim, by not using __GFP_NORETRY.
>>>>
>>>> Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.
>>>>
>>>> The behavior to allocate huge pages is a must have for the driver.
>>>
>>> Disclaimer that I wouldn't go system-wide but per device - so somewhere in sysfs rather than a modparam. That kind of a toggle would not sound problematic to me since it leaves the policy outside the kernel and allows people to tune to their liking.
>>
>> Yeah I've also wrote before when that is somehow beneficial for nouveau (for example) then I don't have any problem with making the policy device dependent.
>>
>> But for amdgpu we have so many so bad experiences with this approach that I absolutely can't accept that.
>>
>>> One side question thought - does AMD benefit from larger than 2MiB contiguous blocks? IIUC the maximum PTE is 2MiB so maybe not? In which case it may make sense to add some TTM API letting drivers tell the pool allocator what is the maximum order to bother with. Larger than that may have diminishing benefit for the disproportionate pressure on the memory allocator and reclaim.
>>
>> Using 1GiB allocations would allow for the page tables to skip another layer on AMD GPUs, but the most benefit is between 4kiB and 2MiB since that can be handled more efficiently by the L1. Having 2MiB allocations then also has an additional benefit for L2.
>>
>> Apart from performance for AMD GPUs there are also some HW features which only work with huge pages, e.g. on some laptops you can get for example flickering on the display if the scanout buffer is back by to many small pages.
>>
>> NVidia used to work on 1GiB allocations which as far as I know was the kickoff for the whole ongoing switch to using folios instead of pages. And from reading public available documentation I have the impression that NVidia GPUs works more or less the same as AMD GPUs regarding the TLB.
> 
> 1GiB is beyond the TTM pool allocator scope, right?

Yes, on x86 64bit the pool allocator can allocate at maximum 2MiB by default IIRC.

> 
> From what you wrote it sounds like my idea would actually be okay. A very gentle approach (minimal change in behaviour) to only disable direct reclaim above the threshold set by the driver.

Well the problem is that the threshold set by amdgpu would be 2MiB and by default there isn't anything above it on x86. So that would be a no-op. On ARM64 that idea could potentially help maybe.

I could look into the HW documentation again what we would need as minimum for functional correctness, but there are quite a number of use cases and lowering from 2MiB to something like 256KiB or 512KiB potentially won't really help and still cause a number of performance issues in the L2.

Regards,
Christian.

> Along the lines of:
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 428265046815..06b243f05edd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1824,7 +1824,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>      for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>          ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>                    adev->gmc.mem_partitions[i].numa.node,
> -                  false, false);
> +                  false, false, get_order(2 * SZ_1M));
>      }
>      return 0;
>  }
> @@ -1865,7 +1865,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>                     adev_to_drm(adev)->anon_inode->i_mapping,
>                     adev_to_drm(adev)->vma_offset_manager,
>                     adev->need_swiotlb,
> -                   dma_addressing_limited(adev->dev));
> +                   dma_addressing_limited(adev->dev),
> +                   get_order(2 * SZ_1M));
>      if (r) {
>          dev_err(adev->dev,
>              "failed initializing buffer object driver(%d).\n", r);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..5d54e8373230 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -726,8 +726,12 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> 
>      page_caching = tt->caching;
>      allow_pools = true;
> -    for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> -         alloc->remaining_pages;
> +
> +    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> +    if (order > pool->max_beneficial_order)
> +        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +
> +    for (; alloc->remaining_pages;
>           order = ttm_pool_alloc_find_order(order, alloc)) {
>          struct ttm_pool_type *pt;
> 
> @@ -745,6 +749,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>          if (!p) {
>              page_caching = ttm_cached;
>              allow_pools = false;
> +            if (order <= pool->max_beneficial_order)
> +                gfp_flags |= __GFP_DIRECT_RECLAIM;
>              p = ttm_pool_alloc_page(pool, gfp_flags, order);
>          }
>          /* If that fails, lower the order if possible and retry. */
> @@ -1064,7 +1070,8 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>   * Initialize the pool and its pool types.
>   */
>  void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -           int nid, bool use_dma_alloc, bool use_dma32)
> +           int nid, bool use_dma_alloc, bool use_dma32,
> +           unsigned int max_beneficial_order)
>  {
>      unsigned int i, j;
> 
> @@ -1074,6 +1081,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>      pool->nid = nid;
>      pool->use_dma_alloc = use_dma_alloc;
>      pool->use_dma32 = use_dma32;
> +    pool->max_beneficial_order = max_beneficial_order;
> 
>      for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>          for (j = 0; j < NR_PAGE_ORDERS; ++j) {
> 
> 
> That should have the page allocator working less hard and lower the latency with large buffers.
> 
> Then a more aggressive change on top could be:
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 5d54e8373230..152164f79927 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -726,12 +726,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> 
>      page_caching = tt->caching;
>      allow_pools = true;
> -
> -    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> -    if (order > pool->max_beneficial_order)
> -        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> -
> -    for (; alloc->remaining_pages;
> +    for (order = ttm_pool_alloc_find_order(pool->max_beneficial_order, alloc);
> +         alloc->remaining_pages;
>           order = ttm_pool_alloc_find_order(order, alloc)) {
>          struct ttm_pool_type *pt;
> 
> @@ -749,8 +745,6 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>          if (!p) {
>              page_caching = ttm_cached;
>              allow_pools = false;
> -            if (order <= pool->max_beneficial_order)
> -                gfp_flags |= __GFP_DIRECT_RECLAIM;
>              p = ttm_pool_alloc_page(pool, gfp_flags, order);
>          }
>          /* If that fails, lower the order if possible and retry. */
> 
> Ie. don't even bother trying to allocate orders above what the driver says is useful. Could be made a drivers choice as well.
> 
> And all could be combined with some sort of a sysfs control, as Cascardo was suggesting, to disable direct reclaim completely if someone wants that.
> 
> Regards,
> 
> Tvrtko
> 
>> Another alternative would be that we add a WARN_ONCE() when we have to fallback to lower order pages, but that wouldn't help the end user either. It just makes it more obvious that you need more memory for a specific use case without triggering the OOM killer.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Other drivers can later opt to use this mechanism too.
>>>>>
>>>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Make disabling direct reclaim an option.
>>>>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
>>>>>
>>>>> ---
>>>>> Thadeu Lima de Souza Cascardo (3):
>>>>>         ttm: pool: allow requests to prefer latency over throughput
>>>>>         ttm: pool: add a module parameter to set latency preference
>>>>>         drm/amdgpu: allow allocation preferences when creating GEM object
>>>>>
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>>>>>    drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>>>>>    drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>>>>>    include/drm/ttm/ttm_bo.h                   |  5 +++++
>>>>>    include/drm/ttm/ttm_pool.h                 |  2 +-
>>>>>    include/drm/ttm/ttm_tt.h                   |  2 +-
>>>>>    include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>>>>>    8 files changed, 38 insertions(+), 11 deletions(-)
>>>>> ---
>>>>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
>>>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>>>
>>>>> Best regards,
>>>>
>>>
>>
> 

