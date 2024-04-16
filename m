Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50B8A6AA4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81A10F07D;
	Tue, 16 Apr 2024 12:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xSHbRPTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AF210ED0F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd8zXrNBCYshggF1/VCJk6zolhhEFKM54Xuf3UferbFzo+RQ+wf6KRYJGgbWZYumDQOhnU9s7cW41DW04CmT5ApWsCTdXlfGNNXyyZ1AxSrqv7BDkrdmkQZDMaBV67AOMaWfQ2gtTUWH3Re1buRBXulv3h2NtKIJlGTVthBrgxEkT4cXVDaF3Ng4R4G0xFMxHyuYK59YM+AQjJWSXrvFt7Zo9m4oK8OpSpvMnCEA+lTE64r+pN0zuydPZ4nS5Rh3k2hhbYCHv7KemgKZW832FicYoXRLThpXeXhBoGelx+8Se0JYbKA2sGqX7IEs23QHe3mQwr36F80/gMDPCip+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0nyv5xAobUmqEZPeQ1OCbw98LnOqk/mrGvzuzi/IFY=;
 b=m0DlE5fHKn/eoBGYqjCWqw5biHWFesgyISekY22AzJhb8hwQOFBmvJeyDD8zx7blTSsErdLBJfXNrOGQp65sifgmB1OzclZ14maKDOF7p73sjthVvoZG0wy7sdQkd/BxeWu9QW0mLO9E7qeThBPMc1fLcn4Mhl80ALbBF+y6GK1wTWCrVXL6+ttX9KGE3MztgAxMcPQUOJ81/3FvJTZnjWci9qRJq0acnFTikbWE1TLAFZ/KhfBeZhZccWGlvRX+Y50njY87ZZ6dXpNHP4Ktjza7jNYAxmmpuHs8zEvl46SAo7say049HTHwwz97OLgtIHkIpifokzGbfGj5gPDjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0nyv5xAobUmqEZPeQ1OCbw98LnOqk/mrGvzuzi/IFY=;
 b=xSHbRPTRQU0wfY0B2d9XffVvdJDuBqPdxRd2/diGJN0jS2qMTGHdKWR5vTPMUPiayvLiay1Qhc3gQimPmWu/RENNFLUBG2jCZZYcCEcNLY8i2GyDqYfoU1HwSHGzY4XhEYal3ADWHytIAM4o5jbnTyU4aeTuy1HVSJ8eTdCKT6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:18:55 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:18:55 +0000
Message-ID: <83bd96b3-45d6-3ef8-612d-f3481374e3eb@amd.com>
Date: Tue, 16 Apr 2024 17:48:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 2/9] drm/ttm/tests: Use an init function from the
 helpers lib
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <422541615a890df92140a6d3328b01a1bac1e691.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <422541615a890df92140a6d3328b01a1bac1e691.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: f3db5946-6d83-4568-e632-08dc5e0f6228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBDt90ECrCuJNZGC3rM9sqftKL9laCMNZex7TJ04jn89784C+5xIb34EKHQRlLMKxhU1l2pYui0WLKVArHicy7KhzfzPfN4ZcKt1+Y2M4SHcOjIZ0LNtjwuprY40Tzpu2miO5cmMuyv+XwscY3UXHew4tMCBw3Yd88uWplPJnGOxnulqkd+uSFRXlzu6fXEm2G6b59gRHiJPuUUhEMMeqozxb40COJB4BPwGtcRDpjHPUKsBmz08biv0+bJefqU5G8OMLMMQkGdvp3UKa1uOD3+YxT+obV9YYoV40Z/thELj4i4UnQip2A/cmOZH+1msbeMRy5jIgGUR9Sn+n6CAVWfJLnnNB4x6nQOUtorJBdMYDo4dOB+FZSGfkPCXjJyhFzOYGhUVuU5G4meT0xP7nLKa2+c1BVBl2+u/Fj61sd/DogzBTe3GXKAhs1H0ARJPWLRL05cdEnf9lId43wpniZlmHJ/hKxHanbXNttk2ap8XxMOE/H7nrcTnyDmbWGvGYlc+uPYtrUXADiHHl7nXwAhNTmzjIYP/W6+hIpdsz8VsH708MK7ARn9QdN+yfWDieiaPE9/DjdmbKTu/1tv6TRukv+xptHEb+4LDqznvQOzGDRytb8mYLyR/rLjwMc6IBwhZE0w/EnUW6fkzHuvc27diFhNbdxfhWS5hndOadiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THF4cWlldHA0eGJ2ejAxK21YeGwwL29EbURVWTN2L3M1RVV3ejVhNm1vd1RU?=
 =?utf-8?B?ZEVkODduUUdGYWFCbFltSEdUMlB2VTl3Q09qRVdjMzFFUmlrdU93b29NT1JV?=
 =?utf-8?B?RTZFVGFoaVZDNEdUVE4vUkRtUzRiMTZPcUFMRlc2UWRLYWxDZGlPRnlObEtQ?=
 =?utf-8?B?YTBJbGhHeFF0RGdOajFqTmFBb2hZay8raU5DVDlBbCtHZlBwaUZmNFgrTExU?=
 =?utf-8?B?dEpyZnplcTRweFUzSzhZT0dHK25xRmY5UVNHMGR0QWxhNWE1c3VKeXhFaGxZ?=
 =?utf-8?B?VXAyMEk0emxONDV5U1Jhb0tiY1JjUHZDNGxpSStxajhuVDF2bnFWNTAxY2Ro?=
 =?utf-8?B?amk3ZGZMVTRXd0tkaWlZUHh3aVNBem1HUUVEaXlzOXdjZzk5aW91OUpBbWs3?=
 =?utf-8?B?bmNHcjR3OXNnUCtmeEw4L1hRRXhCL3NiNGxOaW10TDJKMFJ4NTkxYXN1dW9Q?=
 =?utf-8?B?NjZXOHd1cHl6YWRlazhtS000a3R0N3VWbUxrMHZVM2szQTVlbkU2K0RuRU03?=
 =?utf-8?B?Y0NLU1p5d3MzUGhObzF1K2JveWQ3eVJZV24vS1hzT284U29GdjlMWU1wNGhY?=
 =?utf-8?B?bTlXNE5BZUVQNVVaSnR3ajcrZkJveUIzS21kZ3hua0YyTTI1Q1ZpTzNsRkk3?=
 =?utf-8?B?Q240alJSR3FqN2ZOQVZrazdiQytiZWQ4WC9vaHN0d1RpRmlGcG4yRTdLWTk3?=
 =?utf-8?B?anR4NGdmQzgydUJyNWl5blk1cmp1L3c3Tm8wQnNTbGNBR29OR1IvNVd1RzVW?=
 =?utf-8?B?NmY2ME9ld1grcm9DUUk4ckNqNlJsSWIrb2h2TmF4K3huMUZDUjUvTXB4TXdV?=
 =?utf-8?B?c3BXN2EwVk1PcTRuTUVVeFRHYmsrQzc3OTVDVDFRS2tRc3p6M1JIYXk3SDJG?=
 =?utf-8?B?KzZqUUg4N1kxZjROU2NYbE9zM2VOL3pHMkVyUTlsUUN6SkFPaktSckpBQ0Jy?=
 =?utf-8?B?ZWlOeC9Fc2c3bllDYmxmUUhuMlpFZS9lK3RMSDAwM2V4UEpUMGRWOXViMlA3?=
 =?utf-8?B?aDhqWnU3T0pXeHhZQkIvZkVBS2VVMnI2aFoyNVVjNE80TFRtTzNBOFByRnJP?=
 =?utf-8?B?blllQjMvWklLTEhGbHkxWHJjZThwZVFzRzBtWmw3Y2ZtdldDUnA0dnZVSyt5?=
 =?utf-8?B?MnhaeTYza1YrU0pqcWtkZHVjb3NlUks2NkMxY1pFRFJkRlN1V2lpSEV2SHpO?=
 =?utf-8?B?Uis4eHMxUEVmQ2Z5S0wvc0NQaWw2c2lJK0h0Q2NUTmtuNHFoVmswM3JzTDI2?=
 =?utf-8?B?Vi9pR0lRdW8wYU1pSmNpeFBvTzZsK2QwRGE5Ulh5bnNpM1ZOSERtTDlNbVlJ?=
 =?utf-8?B?T0xRUjBUYkNkbDUvV2lkUjUwRDE5RnpuSkVwT0VSWUNCbkdUM29XUS9SSnhE?=
 =?utf-8?B?cDMvdGg4blppQmxtQ3NweFhEaWdkc2hmWnQyaDVkTXdFaDFHaFhGYTRDaW4z?=
 =?utf-8?B?OEVNVlJrRjFzZzBpOUx2VytnWmtXZXdzV0c4ZmwvYzZkbTNuVVNLV2U1T25Q?=
 =?utf-8?B?aEdOanVZTjlWRUowVjlIeFZmZk1URkdKL2xnMmZwSU5PbGx6bDZldkNNdnNm?=
 =?utf-8?B?RFBObVlVTUlWQnYxVHh4VC92R1UrUlhXd3ZiUDgxQ1RZOW8rdWhUTytuY0l0?=
 =?utf-8?B?QkhFYkNlbkxHTXQwU3V2dkJVeHlSM1NiMmZjOTRKYkZieW1FUnozeTJVL1o5?=
 =?utf-8?B?NURzdnNWbzNNUFdDVnZhZE5XelFMY2YxQWhUQXBPMjlZUThRN0dXaTZhbTdy?=
 =?utf-8?B?OW9rVjZDWVByOEtrR0E2RFRoSnJZVzl6VVFTNUQ1VElscWZLVkd0a2kvNHBW?=
 =?utf-8?B?R0pxVUwzNldYU1FTRGhhSkNCYklEU1VoK0k4cWhBc0p2NUhzc3VNWE9Rb251?=
 =?utf-8?B?d1pxVTllZnQycmw0M0s2bVVoaWhpRUJwOE5ZT0R6dHhNOFkwci8xU1FzdFlP?=
 =?utf-8?B?RzlWNHFUTDRYZytKSDhDNUo1aTJlZExkbHhUWllNemY2MXY5UVlXUU85eitp?=
 =?utf-8?B?cjRMRDJLdWtiQjB4aFZWK0dQMWQxZXFsemdvaWlqMFltQ0ZnQkI4ak5kbVg3?=
 =?utf-8?B?S3ByS0ppQzF3SWNrdVBUb2ViM0NOWVZDemFBYm9vS3VUYU83dHQwRzBwSmdP?=
 =?utf-8?Q?emtuAZvy6CkcYBUKrMNX9p1GX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3db5946-6d83-4568-e632-08dc5e0f6228
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:18:54.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oo4mSHVGSesFHYfFMqei0+AM5Rp5DunYecArkXu/7lky5Pv9rxu7417w3WswGUaMgZy9d8BBb4UTTOqcFPW8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
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

On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add a new helper function that also initializes the device. Use it in
> ttm_tt test suite and delete the local definition.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
