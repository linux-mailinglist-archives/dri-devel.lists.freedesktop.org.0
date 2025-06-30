Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB5AED748
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC610E3B8;
	Mon, 30 Jun 2025 08:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NnKcEymL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266BE10E3B6;
 Mon, 30 Jun 2025 08:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0MLDkej8hoYXlW0p5E37TUGqPmo+1gcOUFnpd7a+6hhuuArukdJzUf2uqh9rk5wcG+HNWouHIBsRTsSEqVoFEf+v+Jn9W8SN/YBo6KjNE5rakiguesIYdu3xNRM5B7fbBMN2V3PLoRw5bbOvF5SxwbyPHoB5d8B3i0rlAjlZRsXSGiIAPK7p5xBxOONzMZg+XgOy1dEvzFTNfMFiQUL3Q9XK7Mk6ovIsZZmpLKWPz9rpyCVYseD7USVOwRW/NJtAfXEGfH45HLmi1YeX8Z6cmrjpFbwAtzV9HpD6XcQOfDTdFR88RVdrKfEB5sgVwFfcqYbed1k4th6i1KbT1+dKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIlaNZlL/kuycpIa4S+uioXid2LfxBArG5OR/8cNxfQ=;
 b=ckrsxoYZMfBGUBRc7NXOpP+pjXOBAs4DYZTYKJFd1JMJJx0O1L85jqtL/DvyqZqa4NxkXOQ8E24+88JD3hnyuBAwfeUHvI+sDllcnuN+YGpEiQoTNibZoHOoHIk2RafqqocE3kiX2bFAYRlxdOyRPdO3p4JWFvl3XSbLRbgQGmpJFjppnsWvG9Kh07y3T5m0YeCXqllCA912BmUgUPiO4lQPeHLVh+4sjAUj3e4qzC+bIQEfGMpcBSd6z3OkfmplQ7kmlQeRyo+SLBIZjCAu/tc8EkC5mCsOWa5sy3foZaSlIF3hrjQ/RXWXN5Jh/jyxp3yGKvZ0nTpaMeqHbE8Lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIlaNZlL/kuycpIa4S+uioXid2LfxBArG5OR/8cNxfQ=;
 b=NnKcEymL6iPji4zCbNfCpazPeNgjl1u0fCdimG1HU457D+dAMu4RNGbms08FjvNZFekV94hfO5SjB+8RGR7W85cMFzsk1pVges2dPtktLjxW2qYXL2kaO5ob5UGjLiuIEwSp/l5N6sNbxSAJgYGH2evjcXytIWn3y46EqyaDIP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 08:29:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:29:17 +0000
Message-ID: <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
Date: Mon, 30 Jun 2025 10:29:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aF8PZMuMgmWKYJgo@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 80887f24-ea56-4125-bb16-08ddb7b033b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlNKRjZiUXBTcDBaRWZsZHB2VDVSUGp3cjFtL2pqSTZRNGFQWHZxaTQrZnVw?=
 =?utf-8?B?OC84U0FFZjhBMnk3Z29qeHhtNEVPekFNR1dDekJnRndFR0E4dW81MzFCTkd6?=
 =?utf-8?B?c2hzNDVmdVgraitaN1RqZDNxV3lHSktLOW9sTXE3QTRTeVc5b3lGQml2R09t?=
 =?utf-8?B?bmowNk1wQS9USm1QRWx4YVRLUGNhdVZFbHJST1RjRjViY3B6d3ZTbHN0My92?=
 =?utf-8?B?WkR5RklDUFVKNU15bnE0S243ZDVmVW5kWGY2QzljaTZNSXNXN0E4Ri9tR3Jj?=
 =?utf-8?B?amxlb090Zml1aXBLTlUvYSt2b0ZDNzlndTZLQjhZbHVFWFNFbkdCd2cyWnVq?=
 =?utf-8?B?bHFON0RZbXQvVDZ3d21GS3RWZzl1ZTdMR29QcGVUckNaYjVObkVCNjBUclNa?=
 =?utf-8?B?dVRRd21hT1I0WFhCQ2U5MmNETE9KcGVQcEhIR0ZRb2NQTWsrSUlJR0xmajFZ?=
 =?utf-8?B?Q0xnUGVKd1p5RnB4ckFYOXJnaU5ET28ySW9vS2dGTFBWYTlQL29YNzdnTEh6?=
 =?utf-8?B?UDZsNi9Tb0t2aEVDZWVOeUtOZ2JZQVNQeXdsNWV4OU9QU1cweTFxTEZ3SFQy?=
 =?utf-8?B?T29ZRVFhN1hkM0ltYzdqZ1VHNjJpVjlrZ3czWUJOOURqSWtXY2ZYSGhyS0RE?=
 =?utf-8?B?SDZoQk90cnhmbkxtTXdSczZ4OWVKeVhsUDA5a3ZWR05pMGgrN0h1OStDU09x?=
 =?utf-8?B?ZzFTTEhIcU5nVG92QjlYS0ZYSmlwMnZ3UEtqLzJ1V3VCZEQ4cm5HSEtFakoy?=
 =?utf-8?B?dEJEVjRkV0tsYTMxd1J3VEt3eTFVbENrMGxsbzFscERoR1VmRldtNlB6SVF6?=
 =?utf-8?B?alQ1SSthTVI5QXlDeHhneC9rV01pUkdtd3FicWRiR0lnWlZ4Vm5TSTd0ZkRI?=
 =?utf-8?B?Ym5BbTdWaTNVYlQrbGpDeHZoMmRwdmRYU0pqbUcwWGgvWXFNMmZLbytWR3E3?=
 =?utf-8?B?UElOTjNreWxpVVBHNTBoTHpaTElyYnFJRi9MNGNHVTBzQ1B4Ynh2YkF1ZjVy?=
 =?utf-8?B?MURnNXdGajFURTVDOGlUSm4zSzNtQTFEZFk1ZnJxS25neVp5cTU0ZEN2Q3lD?=
 =?utf-8?B?SDdqcmJMWnVBR0wrNDJSSzQxd2lhU09TSVoyYTBkUTlGNEErSHFDWXRXaStw?=
 =?utf-8?B?enRYRk5XdWZRODk0Zk54c2FmUTUxdkdCZGJrN2pIV0RGOFpmTUtiZzFQYktH?=
 =?utf-8?B?M3BhcEg4ZnBHZnFFczBKUUtqcUZTemV0UzgrYjdrNUpWSDhKbWUrNlN5eFhR?=
 =?utf-8?B?QmppaldEeWFLN214SjBpaTZOcTBKQWZsaGhOcTZZNUcrQjRhbWNETXU3MVlk?=
 =?utf-8?B?OHpERXhoMjdGckN4Smc4UlIvbzc2VkJ3ckRiakxoc3dDTVhEN21NcW94QU15?=
 =?utf-8?B?SEhiQzJUNmc3WGRseDlHcWMwWkhKZC8rUTcvYU9EaElCcmk5SDVNbXNzUTR5?=
 =?utf-8?B?ZjJuY2dKN3lvcDZQaU14K2UvZDdnZEk0dWVrRlV4ZzVoYldOb1FPTmNsK0RN?=
 =?utf-8?B?L2FLK3FBampPcUxLSS9JSzF1S095Vm9uNjhrK2NYOFdpMnQwMnJWcDdFWU9K?=
 =?utf-8?B?U2RQVmlLb1RvT0F6Q0M0WTRKcXVWS2NudFYxekZKZGI4aWxoQXh6Q0F2MnFw?=
 =?utf-8?B?Y2hnZitBQXBvQXJudTRwY3MyUzlndk5qbmQwNDYza3FTQnp4QWF3cDhYYS9u?=
 =?utf-8?B?cUswRFcxRFZLc3ZzWG95cVZnOXFvR0NsQUNBSlRaU1JUU3VMWDY3Rk0wQnBk?=
 =?utf-8?B?UEpPaXpaejAyRTVWSk1aeFJ1WFhSdU1Cc0oyZ3dmRmMzaXFEaGowRmhtQTVp?=
 =?utf-8?B?K1hHdWY5UklaYU9qS2xReHdyUytiR3RTQ3VYTVBZblRBRVI5MS9BSEFxSWhO?=
 =?utf-8?B?emlBOHhMbzQ3UUp5S0xyclZZS0hqalpvVEdGTE5RMnQ3cFlYWGFVUjIwNUpt?=
 =?utf-8?Q?ivyMaBYvUWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThPUHRzSzBmT2dNSDdGbUc4WEUvZVFTc2VrQk5TR0dkZ0ZneFMycmltWDdv?=
 =?utf-8?B?Mk9UR0RNeEI2NEJHMDV0aitxczV5QXgzOWVJVFFNbVA5bjk4cVRQa1N6ZFY2?=
 =?utf-8?B?bWVzR0tuZVRESDkxT0sySTNtNms3RFVma3ZTc0hZVnB0dEJzbWJRNWt2Smx1?=
 =?utf-8?B?d2dVOXYwYVU0SWIwdWtOWEFTUXNnTVF6N2NEWlVzN3hhTU5JYUcyMGtNMTht?=
 =?utf-8?B?c0Z0bWpwdFhZd25OVVR4bkROdHV5S01CUCtwdHA0Lzh5RDRUdXozN2crckdV?=
 =?utf-8?B?WlRrWVF5dE5EODJhOTQwclpVY1FBSkNkS2hvUTFOeDE5WDlxekt2U1ZWb29t?=
 =?utf-8?B?ODRReTJrVzBxTDljemFrWTJHTzRKOG4reEFaaWNMa0hVckxITVJ0cVRzT1Fk?=
 =?utf-8?B?ZDVwMWlnQmlaS3QrTW1Eb3NOaUdzWDQ3YTMxcHE4UW91V3RIcGZ6bWd4ZlZ4?=
 =?utf-8?B?ZHl1RHJUZWxVRGpFN1htQVY3NE1zRXRXRzZNRVgvZ2hjVDI5OW1tbzk5d3VE?=
 =?utf-8?B?bFo4alVLWlRHQWFJMWgrWS84RkQvRVNjdG81dUhxSnRUZWNyRFd6VXlVeE80?=
 =?utf-8?B?aUFLMXo5YWs1eTZneGNVcys4WDVVUGhEZml3MlNwaVFyV0NLYlRyWEtYT0w0?=
 =?utf-8?B?dE1QaXVheGJOOGVUUm10VVhRbHJDSElhWkNMQU8xa3R2UW1HNHB3RTZhZTUr?=
 =?utf-8?B?N2hLMkN1b1ZnQ1VhcjJKNm90U3JSZXhsenkzRmhnMlkwYjBpVFBobHY5clZI?=
 =?utf-8?B?bjgzNjR3Z3pQUVpHRFh5TytvcEZ4NjM1eERkOHY2aEtobnBnbGF1cUIwOGRV?=
 =?utf-8?B?djY4cVEyU0dqeCtPLzMvYjVHVFVNY1ZHQUVpWWlHQTliZ2JpYURxdlJIT2Jj?=
 =?utf-8?B?Y0UxYWhqaUNMd0lhOHp4QWV3SG1BKzd5ZXcyV0VieDRBREtGZk4vUHVmSFVE?=
 =?utf-8?B?aW40blZIcHkvSWdZOGM5MzN1ZVo3WGd3d1F2YkZFbUVZcmMzemgzY1F1VXFx?=
 =?utf-8?B?eE1EOHMwUmJiUWN2S3FRMkV5UGdZQnpZZ2tTOGZsMmdKV0w5UlcrZ0RYYy84?=
 =?utf-8?B?L2h5UUNGaEMrY2tKY2luYzY5aUpuN0NCYXoreDh6MitaNVJTZWZqWFhmbzFh?=
 =?utf-8?B?a1FoUXYxRE5WYlRRZHNnemhkWWdUZlNMTDdYUjFyd2lSbzdtVEZDaGhaOTcy?=
 =?utf-8?B?b1VvRXk1ZkhNb3VyUWxsVE52YTMvOUs3U2xybXE1UzQwWWNVMnU0UHBKNjU4?=
 =?utf-8?B?VEIrbGRyY0tNeFdwK3lKYjR0MHhHZnJXQnRxQTVNNTJnMDlsVm1uZWJYVUFn?=
 =?utf-8?B?aXJtZDNYeFpTVmpycVhGL2JXemZ6cjl1VWVCSWlTZjh2L3pJSUtNR05EeGFC?=
 =?utf-8?B?ZEpwRVJvRElNZ2RreXd1d3BCSXY3eWxpT3BQZmVEZzc2T1g2UHVKU0VNQm05?=
 =?utf-8?B?VWtIQmxQTmlFOGFINXdTN2JWMW43WGJxNDIxSVhSc0tQdWw1ZTR5ZWNRQkNi?=
 =?utf-8?B?d1pBM2hNaUxqM2xLOE9sdjRkZk9XUkhzUDl0VDBLSXF4MUNKOWQzRS9LellR?=
 =?utf-8?B?dVJIM0JEd0hPQUVyZzEvbzg4NmMvd0l5a2NoSUpDZVlBSXV6R2pocFRVMERw?=
 =?utf-8?B?YU1CMWZ6dVVYdDUzcFIwMmhXU0t4eW9LVUFJVVdvL3dIQkdMOUt6amt2WE1T?=
 =?utf-8?B?NEJZdE5TQjYva2xweHU4bFhINU9WM2plSVVPMFMzdzNtMFhCUHNSRmFFSHNy?=
 =?utf-8?B?NXd5UUh5UzdpYnNPWTF3Z1F6MmxRUVdsNkZaRlpPQ2FjUlRVVnNwY0VrMEdz?=
 =?utf-8?B?c1B4bjZKRTcyZy83KzdBY2RwN3ZHRndlakJVUnVMTmQ4TmgzaDBJenBLMFBP?=
 =?utf-8?B?cytMTHRzbWZVRzZza293WGE5c3ZmaWpxV2owbHM3UnVVT1lJZTF2SDZROCtZ?=
 =?utf-8?B?TGhvSFlXK2NUMXFVTEJFbnFWZTVNQzZuMXdkbHgvK3J0S1VoV29pZmxwZmp0?=
 =?utf-8?B?U3NjaXh6K1ptOXNTemVnbHFrQzlVNHpzbTZzZDJhNkpFeDk1Qm9FNTJMbHVE?=
 =?utf-8?B?TjZQOXpQS1dqaGpkMWFXZXZkdmZZTjI3bjF3ZjVlZ0xpaHc4V1kyNExyVVp3?=
 =?utf-8?Q?RFX+mD0aCtbcmBY3FZafE34Z3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80887f24-ea56-4125-bb16-08ddb7b033b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:29:16.9032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9doz1Kgao4a6cdCk08xs3NhrdWFuFrjISlZkvc5XfWc7/EQyeTHkBnMWlwet2yz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192
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

On 27.06.25 23:38, Rodrigo Vivi wrote:
>>> Or at least print a big warning into the system log?
>>>
>>> I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.
>>>
>>> I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?
>>
>> The goal is not to do that automatically, but raise the uevent to the admin
>> with enough information that they can decide for the right correctable
>> action.
> 
> Christian, Andre, any concerns with this still?

Well, that sounds not quite the correct use case for wedge events.

See the wedge event is made for automation. For example to allow a process supervising containers get the device working again and re-start the container which used it or gather crash log etc .....

When you want to notify the system administrator which manual intervention is necessary then I would just write that into the system log and raise a device event with WEDGED=unknown.

What we could potentially do is to separate between WEDGED=unknown and WEDGED=manual, e.g. between driver has no idea what to do and driver printed useful info into the system log.

But creating an event with WEDGED=firmware-flash just sounds to specific, when we go down that route we might soon have WEDGE=change-bios-setting, WEDGE=....

Regards,
Christian.

> 
>>
>> Thanks,
>> Rodrigo.
