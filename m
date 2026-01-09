Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79DD0C44D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 22:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ABB10E94B;
	Fri,  9 Jan 2026 21:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x4f/j37Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768510E949;
 Fri,  9 Jan 2026 21:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkWnKRA5ojF9I3V2YAE4ZPJfN4Da54WeHgNNcLf+Vo41z2H6/XgaYK222OqOF074dzj+ZJJiQoReqmp6DmRjm8eICuV869dObhdCkU5KTaNkb0+ehmGPo824psc8GUdPfBcAzd9lqyNKLq5HSyxpFjABVvBLHvm2E8PU6/Q+bIpQ91UKWbcipWydoV1MHw2Xip+T9zVSE2qkmki91ovaJ2y2q31OZomZC1Hc+l+PIPgxht2zd7daXd9uvLiaOSt+FEDSxWB29T6Zr++SP2XibnyxEWPvDzApnHVhKRa/OqxlqmNCKiQseEJuEOPWVxI3s7BGSeR/mvnzcbwXG2CD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvb8DKqMBf0o2frilaZd7JE9cOUAvmxxiPnXJnwzf8w=;
 b=kd8lZbMcVsQKSL8AMdmEdap9HJpCaKbgwydPaut8oAOlVvCFG8/xTpIRvNjv+PcMjZaOcY7Hjwimr+tZCzEIQcD88PSjn5v3bvuTqVwM75Wwhd7EHsIHG02SvYfIpbWARFt5IHNi3zr7xiI4R+j21uUONffetXnc7O0JC6VQ7FykfiK6NK3mZtk+g7tg10cvtR6yzJHsx3ap37BU35rjs2HK48iL/lROZPg6mmNBYgklyFlHInW+4kcw9kASBY8h4VJZCz1ngu6oimuyzDIX8n+ArldBamuck9+CajwKwFJCbSxlbsOXNRTz2rJphgFu27e0AVZMy+JNHnPWsm7k8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvb8DKqMBf0o2frilaZd7JE9cOUAvmxxiPnXJnwzf8w=;
 b=x4f/j37QJXiBjRiUsOYsVQzLiw158K1KSrhQqI96ku/94Jcnw/1oZhE16+NN0HGrTB5As+RJczTMZlxrcj820h4NcmiUP7TNIyCICaNgapdNK15Bo+KxIbRdBMh64NSdlMmDionfZcveGch3iVTEYpTB32uRfwirNh8LQ2jRURA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 21:14:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 21:14:19 +0000
Message-ID: <ab5d1bb7-7896-49fd-a9ea-19294f4f57ca@amd.com>
Date: Fri, 9 Jan 2026 16:14:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Honglei Huang <honghuan@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0298.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0361ec00-756d-41a9-52ff-08de4fc40d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05uVGlrNXlrRlRWbENRdDFlc0doUTgzaFloUTVJZHZGSHRwaHVhdWkrMGI0?=
 =?utf-8?B?MXZydXFnTkZmbm5IVk01ZzNob1EvK1NlZnk0UWRVaTBDSjQ4bzVwWlpmN0k0?=
 =?utf-8?B?SXc2V0YwME5EZ1dVMlRHMmdQeTcvQWQ5UHpzelRqV0MraVR5ZXFkUVZwS1VU?=
 =?utf-8?B?T2RONDJMcVhtbUk4YTQra1FwdGptOHMzeDhRNmQzeVZyM2J4S2YrTzFhUm5E?=
 =?utf-8?B?UkdCQnIrTkhxUE1Fb0ZXK0FwOUhqTDExeVE0UENQRk84STFkMms0S3BsMVpP?=
 =?utf-8?B?MVhGV2VSNVk4cThrOFlxRUtFekl1cHFRbDZHRDE4YndTRFFzN2UwT3RkbzE4?=
 =?utf-8?B?SzdJNitxUlNVK0J2cnZIN0R2VWdWYzBzd295UE1nbnp3KzlwdUQ0aEZmL1Rw?=
 =?utf-8?B?a1J2TURlanpaQm5QY01GS1ZDbXlYamQvNUpoRkp2cmJZUkZRdTJTYWVmRnpD?=
 =?utf-8?B?MVVGeThHRWdETFNueUloekc0OGNZa1JLbzE1cCtoUWNVVWhuMzJyVnpWTCsv?=
 =?utf-8?B?dGZMd2ZYdkEwTGZrTTFFckFzdHVnZEFDNnZPK2tXTUwrQXlvdzlCeko2TmZL?=
 =?utf-8?B?RlpLZ3lwYXJoTGl0V0o1RnhtMUJTdFpOYzBWclg1LzAzeVhqa3czay92WHlz?=
 =?utf-8?B?UlJ2YjlIK2E1S2RzTm9oRXkvbmFuY0ptazlzTGhLUi9VcHh0bmNIZTBnUG5L?=
 =?utf-8?B?OUFadzlEdk9CZkNMWHVLVXI1U0xOeVZoMC9maWhMZGd1WWFHWWVEU3BmL042?=
 =?utf-8?B?OWl5VDRqOU1xaFAwTGxic01TT0tlV0YvS2tBZlpJOWFzZ01YQnllb2pPVnVS?=
 =?utf-8?B?RWY1WjNYLy9ERUMxNlRra3lQQ1I3Z2lXUGQ2dmlnU2xTQXNUT0lKWFcvVzZo?=
 =?utf-8?B?MVB6RktMVlpsakFxM2l2aUdmbkZVanFpQmUvdks0SlRidytBRWYxeFJPU21S?=
 =?utf-8?B?bFBFU2VSeDdqN2M4OUdHSTJDamh0aUhRdTcrT1ZvUnlBejJpSG9GcUV3Yi8w?=
 =?utf-8?B?LzNBdEN4QXd5V01mSWxQUXBYUitzb1hYWWJDTThUVTM4WnhWUlVZcVllaGNz?=
 =?utf-8?B?VDdGQUg3RU9SWU5QVUdGc2wzR3pwR2ZoN0NkZktwV2tVeVIxRXJoVTgwUElr?=
 =?utf-8?B?WVNQK3c3UmkxRVhSbHM4Wk00VGZyRExGUUZaWWhwSFdpQkNFSHJJbkp0R1Fh?=
 =?utf-8?B?MHJrbjhCaEZKaUJLTTBxeE0rd0cwZTBMVHlJaksrbHFITEpMUHlQVHhQMUFP?=
 =?utf-8?B?aklDWEI1QnF1eExVdU9mK3NxVXVPWEhEUm1JSUk5VjUwVWs4M3VwWGhOZUZS?=
 =?utf-8?B?NnQ0Z3p4UGMrTmN6alk3ZzZhNGkzRWU3eHhMZEFQUEd0c05DbkpPWjIxN3VH?=
 =?utf-8?B?dXl2bi96MnZxc3M1U25ab3ZmR01BeTFrTkliclVqK2RkNHR2TjJoZC9vYzgr?=
 =?utf-8?B?anRQSHkyWHpsdllMTTd2NnE5Y2d6QXFXTm1DbEg0RnBsdFhoWVFtNVdMZW5C?=
 =?utf-8?B?QitMbnB2cHJ6eTVmd3oxVmhrU2k0WEt0QktMYit6S3dyTER6RDY4NmxWZ2N4?=
 =?utf-8?B?Z25lUFYzVEdMNk84Nm51N1YweHFLTm10WGxSaGV2bW0wbXZtcGZvM1NDWWVE?=
 =?utf-8?B?eE5hc2QxWVMwNldNcDQwUEpHYUZvRERtQ2JiV0Via29DRSs0TjFMUUxZU2hw?=
 =?utf-8?B?Z3NYTnEwbFNPdlhOY0w1cFB6aEZxeXh5WEdFWitXYjdiTmp5ZGJucEY5TUts?=
 =?utf-8?B?WGM4T3N2UWsrQnNKaUJTeFkvNzVMSmhRNzRtT0xvR0FTb1paTjUzd2xFU2xk?=
 =?utf-8?B?cUhzSkpBNmhTVzFlaHRrdURKbUlSWnRSOExUZTU0aFFiNmg5aTg0TzREN0tU?=
 =?utf-8?B?RlRHa1ZQMWMzdXVyUkRXemlYNWZQcGxaWkUyOGRYZEdtd3U4d0ZOZHpTOGNo?=
 =?utf-8?Q?KwZwTyRlgQY/aWs9z8B6TZuMLsYUmZ85?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJWSkh2Ly9iWEtnWklzQlJmaTlraU9CRFVnNy9vbXpJeGwwNklHekRuQzNE?=
 =?utf-8?B?cVNKcUNyRWFISExXSDhPQW9wVTV6eHdFeW5DRXFvem9ycWxmaVpiV2xrbHBB?=
 =?utf-8?B?aFN3UHNmN1NkMC8zUUJDOGdQais0S00rVmF0bVhGQ3JIL0tWN0xtNEM5bkcz?=
 =?utf-8?B?cUFWQVJETy9DdUFhcEhyaCszRFR1ZjIxb2V2b3FJbm5tN0VieDF4ejYzWEhh?=
 =?utf-8?B?b252MFJLa2g2dEZYK2k1VHBOMzQwRHYvMENFZnRNZVR2LzJ3QkFSQTJSbmo2?=
 =?utf-8?B?RXRQeXVtK1pHZkc1ZXkyVW5oeHQ5dU1pOTdyRnhvZWFmRnJ0NHA4T1ExM3NT?=
 =?utf-8?B?QlhWcGFmTVJva1ZDUG02ZlpydGxQWjFWODhDd2d2OVFLaE1Mdm13T2ZySk4x?=
 =?utf-8?B?eGhtVkZoK2Z5Z0VSSmRTOXMrUDlOMGFqQkxYOGhNOWlWQVE0QTJuUmlRNGFi?=
 =?utf-8?B?bHRzM0l5UTJBd0dKcDQxclB3SVVCT3UreHJRb1BsSXM5NEgzWVJJTWlnSnV5?=
 =?utf-8?B?bkRmRHg2VDBtR2ZqSUlFejNrWDhhajFyTjl4N0RqNXNSMFl3c0pqMTZ4SlRy?=
 =?utf-8?B?NlJLOGt1bE9JaTFTRTZQOTdzakVoc2o0YjhDL1M2Z0JYUm1YQVdGZzllZ0tq?=
 =?utf-8?B?Y3FiSi9jTEg3OTZickFSbytFblQvTVFwSTY2eklydXhEeUxsVG53VU1aT2kv?=
 =?utf-8?B?a01RZmZ0YzEwM1cxek0wUmtBQy82N2dHcGZtM2srb0NVdnQwMzhDQU94VGZh?=
 =?utf-8?B?MUd5WGp6cUp4U1lKQjVhNVRaejZGMXY4dTFTdWRtWGthdDJNUmE0U3QzTTlz?=
 =?utf-8?B?Ymt6Zkt5anhWbWhzaFhPRWdyRnFpcmVLNUF6MGE5ZDZGK2ljRjV2Ri93QTVP?=
 =?utf-8?B?VFpmcXdDblo1cFd0bS84Zk5MR255WHBZaFpWd1FVYlk3NTIzSmNraXFjcDRN?=
 =?utf-8?B?cndHaTdHdy90Sm5xdjQ3VUo3SkliUlJzaXpJdFQra0tvR25rVVQ0Uk9kUDB0?=
 =?utf-8?B?aUZ1cFI5WGxuL29kSUxjZmpSK3pqaU11aHk1UlV5ZzE1cVRFSHhGalB3VUFS?=
 =?utf-8?B?K1lndkN1MC9JK1dZT0FmRGlIZ2Rqd016cmlOT084cXlqcmhKbWk3VDg1OEZh?=
 =?utf-8?B?MzE3eGRDUWJZbTZCV1RJS3RuVWE1OGp5WmxiWW0vN25RalRlaTRWeWx1eEJ5?=
 =?utf-8?B?d092YVpScmcwTVR6emx5SVFxOWFHNHkrY2lNemc5cHRQeTdZQ1Q5NnBuVWFq?=
 =?utf-8?B?YnpvMmoraU1FRWhrbEVpeDIvbUhJODUxYUlLcFUrVU8rY0k5aGRad1FjQ0RW?=
 =?utf-8?B?MDFITjJ4eGJqMXRuZXc0Qjd6RWJVYkVGbzErZ21FMkZZM3VyVzVnUFJJclVr?=
 =?utf-8?B?VzU0WlNWS1huTkQ3bnVmUTcwVmsxTVEwUWthaFVaMjhNaDk3ckxBT1VsVWFH?=
 =?utf-8?B?ZHBzdGQrTUpDVC9CUWJVV3FFYTk3WGtuRmh4SzJUVWpYelFIcE0rdzBraWo4?=
 =?utf-8?B?T1FnK20zVkdpYzN5TVprRVJQMExHbTNwUXJrSjJHLzA0RHd3NHY2b29OdzNC?=
 =?utf-8?B?Tmk2VGwzakRnaUhBWnJOdmEzMHczdHBWSlkwbkVUOER4RERCYmFSWmMzQ0lh?=
 =?utf-8?B?Nzg5UWdaUkdVejdJYW1LTW9SeGJCc0F6Qy9vd25jN3dRT3R3MlNtTTZoT2xZ?=
 =?utf-8?B?RVNhTGdQeWlFTHR1aHJqU2JaQjd1U0RudzRoeU0yQndERGJjM3FpU3RMNFhn?=
 =?utf-8?B?MElobFdBSjJ1dEJrYUVWTkRoTXN5YlFzNUp6cSs3M3psdG01VldOWXdTekRO?=
 =?utf-8?B?U2RTR0lZZE8zQ3JUOFlwMXRlY3lqYml2d0lIS2FmMDh4YnNkOVpBOVZEekoy?=
 =?utf-8?B?a1BqVUdHMmlCbGFCeUhCN0ROOE1QcDJ1aGw0bnNFNEkzNmJpUldQeEoyVUgr?=
 =?utf-8?B?YkxaOUxJNXVVVDJ2NzVLV2dRWittbkRCdFg2NTEwUDhOSWw5cEt2QXJZYU9G?=
 =?utf-8?B?R3lrQVNnS2lWeUZvdXJETHlXZkI2Z1ZVZVkzUjZBY1BjTmNzU25kUmFJVmlp?=
 =?utf-8?B?K1F4bUJ0QUEvemVWYnFqeDdMS2puYkpNU3ZDWXBwcGRBcHpScGdid2l6MjUr?=
 =?utf-8?B?UmdqcGtUSUNFbzRKYkVXWnY0eTZ0WUJ5NU5DOFVzMXowZDNsdGFaSXlLcnh3?=
 =?utf-8?B?Ym8zeXFLYjd1a21FbGl6K0tyN3gyU3Y2ZmhXdXZPZ0dBcVlYa2ZDRUtZQTBz?=
 =?utf-8?B?eEV0MkNtOXVIbTMybjhUSFdiVUNQL0pXM0wxRTBrUWVYeVJvMnpINkFhR21K?=
 =?utf-8?B?cXQwYmZEV3RXQUhnTGhpd2VpWUZuY2tKaUtBalRubGV2eFcwSHg0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0361ec00-756d-41a9-52ff-08de4fc40d8c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:14:19.3959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPGN9idpa0W8tZYPiM40ONQth+dfQbaNbvZN3RUWbeyv7JoCOliqRQl3b5/qd5kJhtt4DWrACNUp7tFI/OyPNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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

FWIW, ROCr already uses rendernode APIs for our implementation of the 
CUDA VM API (DMABuf imports into rendernode contexts that share the VA 
space with KFD and VA mappings with more flexibility than what we have 
in the KFD API). So the transition to render node APIs has already 
started, especially in the memory management area. It's not some far-off 
future thing.

Regards,
   Felix

On 2026-01-09 04:07, Christian König wrote:
> Hi Honglei,
>
> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>
> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>
> Regards,
> Christian.
>
> On 1/9/26 08:55, Honglei Huang wrote:
>> Hi Felix,
>>
>> Thank you for the feedback. I understand your concern about API maintenance.
>>
>>  From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>
>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>
>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>> - When flag is set, mmap_offset field points to range array
>> - No new ioctl command, no new structure
>>
>> This changes the API surface from adding a new ioctl to adding just one flag.
>>
>> Actually the implementation modifies DRM's GPU memory management
>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>
>> Would you be willing to review v3 with this approach?
>>
>> Regards,
>> Honglei Huang
>>
>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>
>>> Regards,
>>>     Felix
>>>
>>>
>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>> From: Honglei Huang <honghuan@amd.com>
>>>>
>>>> Hi all,
>>>>
>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>
>>>> **Key improvements over v1:**
>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>
>>>> Based on community feedback, v2 takes a completely different implementation
>>>> approach by leveraging the existing userptr infrastructure rather than
>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>
>>>> Changes from v1
>>>> ===============
>>>>
>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>> - Registering multiple SVM ranges with pinned pages
>>>>
>>>> This approach had significant drawbacks:
>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>> 2. Added complexity to the SVM subsystem
>>>> 3. Prevented memory oversubscription and dynamic migration
>>>> 4. Could cause memory pressure due to locked pages
>>>> 5. Interfered with NUMA optimization and page migration
>>>>
>>>> v2 Implementation Approach
>>>> ==========================
>>>>
>>>> 1. **No memory pinning required**
>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>      - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>      - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>
>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>      - Zero changes to SVM code, limited scope of changes
>>>>
>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>      - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>      - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>        This VA remapping capability makes userptr ideal for scattered allocations
>>>>
>>>> **Implementation Details:**
>>>>      - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>
>>>> Patch Series Overview
>>>> =====================
>>>>
>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>       - UAPI for userspace to request batch userptr allocation
>>>>
>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>       - Data structures for tracking multiple ranges per allocation
>>>>
>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>       - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>       - Per-range eviction/restore handlers with unified management
>>>>       - Integration with existing userptr eviction/validation flows
>>>>
>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>       - Ioctl handler with input validation
>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>       - Integration with kfd_process and process_device infrastructure
>>>>
>>>> Performance Comparison
>>>> ======================
>>>>
>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>> severe performance degradation:
>>>>
>>>> **Userspace Multiple ioctl Approach:**
>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>> - Performance loss: 60% degradation
>>>>
>>>> **This Kernel Batch ioctl Approach:**
>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>> - Achieves near-native performance in virtualized environments
>>>>
>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>> of the performance lost to virtualization.
>>>>
>>>> Testing Results
>>>> ===============
>>>>
>>>> The series has been tested with:
>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>> - GPU compute workloads using the batch-allocated ranges
>>>> - Memory pressure scenarios and eviction/restore cycles
>>>> - OpenCL CTS in KVM guest environment
>>>> - HIP catch tests in KVM guest environment
>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>
>>>> Corresponding userspace patche
>>>> ================================
>>>> Userspace ROCm changes for new ioctl:
>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>
>>>> Thank you for your review and waiting for the feedback.
>>>>
>>>> Best regards,
>>>> Honglei Huang
>>>>
>>>> Honglei Huang (4):
>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>
