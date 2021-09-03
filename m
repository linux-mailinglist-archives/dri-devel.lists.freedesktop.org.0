Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B93FFAD2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 09:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32CC6E84A;
	Fri,  3 Sep 2021 07:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2052.outbound.protection.outlook.com [40.107.212.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6785C6E84A;
 Fri,  3 Sep 2021 07:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awpkeupNRapWP5sMb7LNiI7cjhFNZOEos/e1DUlL7HAUHmTH0e2DoLk+seAmmqymqcACxCHIwFBEo832gRdp6ryInnX26xLeNZemNrR5gRchYMObiCxSvEU4jd7DcDlvK9DW6FNQlL5m+IuK1spEXmP68xsti8WslEYxyr3kmkX55pwRjSAdMQw6RZBJ70rImrOIZnttr8LsbRUMeXphaZmL6c8MGOUFqQd1rVBrHtHSZzJj2tGczkbDQvKh1pviBQ+yMM72sIYVcLnBdiolsUmtK2unNacpkW1pOXOa0ohyL/9NNJ8mwrkJKlymDvxZXJMXTp/L9NcsYyWy1HuKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eyoX/+xdAEGjLk6R+NWA38rwMqrW/nWabNOAZzHq+pE=;
 b=Xo1Il9v6yFTns1eW9Nb7gbkASxoDvmkghqByDtB7pnmYHdPK2NArIXJ1Hxplb4D8VU9mr2gwrQoegW2EocscgTLmcL4BWZqAtQrNP4npNUvndeROlB2FWNh5xxjl/0ItWilhhPXZZ1fQ8HmvemnMoEC6+OTrja90jEIWyNrlUC9ni0jmOQtIUQxecfXnAj9u31UY8PF/kTiuc88u7guV+8nGNLE3wZoLosU5lVlnSz2ZEZyYtMdD2f1MlAnaHLgN+axUyfc0DQex8h/0sycjpo+oEUF6J1WEXT7UaEt6AgqDmaJKR9cO68CD0IJ3gttUiwxGxmN91+r++kWevWjkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyoX/+xdAEGjLk6R+NWA38rwMqrW/nWabNOAZzHq+pE=;
 b=tGB+RepvsfcyqjSYHr+xYUJst3Hlfzdw3y+GMX4LLx7tWkaf7D0AWANJHtZNGZ1Hr0lB6Wo5lM/JIsp+DNrU9OavIgkAMfcoOSJfO+xZyezLZ8e4WAIhQ9mZkYo0mv6afLZ4FPi3byqRRiEO0rsp62GsjECHXaylY66UhvCt+uc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB4319.namprd12.prod.outlook.com (52.135.50.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Fri, 3 Sep 2021 07:04:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 07:04:41 +0000
Subject: Re: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx <amd-gfx-bounces@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <88539BB5-333A-4019-A411-D09859291404@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <627484d5-3cfc-5ac2-125d-5a902c852222@amd.com>
Date: Fri, 3 Sep 2021 09:04:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <88539BB5-333A-4019-A411-D09859291404@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0091.eurprd02.prod.outlook.com
 (2603:10a6:208:154::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0091.eurprd02.prod.outlook.com (2603:10a6:208:154::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Fri, 3 Sep 2021 07:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca21c9df-944d-43d9-7647-08d96ea91a16
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43197C1E441C2D5B3D57986E83CF9@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHJF9fnZzkXrigbf5BzWPbVy6o2bcBJSdzN1PN78T5EwuC2JtkmI2ymkvIVZCEZJ0UoYncvdaszqXW83WYuRfdstjY7vvY1qJRTe+U3bhI618myjMc8DtUIr7IzRxE1sQW2jaBdSboO4f62vUfbu8iY+rJZwmEYIq1d/3oWrYrJFKy2sflUgi6QmbXc53e/yHvsMvxAoheERhCXN5oqUJgIN/NN/btiXzYZMUOAp+xkhHhGmYNScggQNZyHZrIHRP+g4GwRsuJKip8vXI04WNW0JrjWlZrgnhdOJVr4LPoSH0XAzppjJuU7BFsq7DWOdJ0e/8XurTNAITz8+V5O7qHfcLC00PRAx5Pi0P1vTOSOIzTXeCsjzrgGgvN2KboiTxIMnq6pBAFA36B2fDf+NxBcF4XZKvhwVDO0RH5qa0nzpo2X++/TOmxEVYtP1lp4UMH4GHj7Z+M3ilrbf2ZdT5byGlXv7zLqyb81pLqDMx9hn2RL7kRx121+eYlf1LwLkV0swkJ5h8uvzBrh5jwa4CKkey4m3vnXotsF7eVBPYWG7c9bTC5nuzWwux6eRPuk4ImJEs2L/etEQjJ6p6mr7bSiAEvDXMuEYdN0sUTJs/b6NpXRFir3Z1M3IkZBdOrSjjdrueAhT9LAGBvpCZIUlJ03743ep6skOlepm6h54jtniUqRaP9aOyddXoD/LI1+Oid3Dirw8zhAo5KDu92za084alis4u9jIxHKtwNgwZO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(478600001)(54906003)(110136005)(66476007)(2616005)(66556008)(66946007)(86362001)(16576012)(186003)(316002)(26005)(8676002)(6486002)(8936002)(6666004)(31696002)(956004)(83380400001)(4326008)(2906002)(31686004)(36756003)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUI2clFCYjIrTlQ5SG8zcFZCVTA5ZDVFNXBNeTR2MjA4UjNlR0M2RWZXYXEy?=
 =?utf-8?B?YW9QUG85UnE1SkczOE5xUWVrOUJHZVM1cUFRYlJZMmcxWldFOU45Y1J2NENJ?=
 =?utf-8?B?UzlmdktvdDBHVGZ3eHk1blZwb0pzb3hRbEVkYTJVQ3JNUWFRVGlHczNlRVFG?=
 =?utf-8?B?Qk92ZDU5ZXRldlBnZENxRVVWQVdxR1BIUU5qd3lMZ0ZvSFg2Q3QzbEJydXhF?=
 =?utf-8?B?Rms2cmxjN3hldVZxbERsc1crU1BXbFUxSW5RcE5NNmx5ZTVEN2hSQWxwWmNy?=
 =?utf-8?B?ejdMcUtvYTZReVl2WkQyZDcvWjZCSStDRjRERGNsRS9wRDdJdzNueGxMdTVo?=
 =?utf-8?B?UE1qZ2p1TUkxcDFseWtVVmQ5ZjQ3S2NRdmR4cHl3YmI1cjNVRVdzaldwRW9k?=
 =?utf-8?B?bnNjbkdKckRTRUlublE0aGJuaE1PL0ZXQys2VEtoc2xySkdRR3BHcWsveXpw?=
 =?utf-8?B?OXh6cktxcFVKNVMwQ1VwVVZCdnkrQVlweVZYMmR4TUxVVTNBMWVKa1E1OG9q?=
 =?utf-8?B?Z0t0TnZ0dXBqWmdvcjBha0hrWXNTd1RqNW8rRmJmZ3J6SEFtNkorUXE5MEVD?=
 =?utf-8?B?UFI2bTlJNU5RU1doZm1MUzNGWjdIcHV5d1h2cFZFWkJkY3RnYzRLa0E3R3Jj?=
 =?utf-8?B?THlid1BTdm1vYjV1N3YzaGJ2ZHJtSDJ0V3pHb25vVHRIMGg5TXRIbWlBTGJJ?=
 =?utf-8?B?V25VamJNelpBcXBqaUlZdEYyZFdCL3VwNHQzclpBbXl2YkNRajFYbzBvQXhN?=
 =?utf-8?B?Y1FhL1ZWRUR3NituVmZPYTNuTmRodXE3OXhudW5JTEJLUXNMVWxrMTN2RlMx?=
 =?utf-8?B?QzM4VHA0UkdjQkQ5aGRad0t2Rlp1VzMzZC9YTDVTclQ4YXYycDE0dHAzSE5Z?=
 =?utf-8?B?MmROQW9NTGhVbDBIMEd0cGtCWDdCZ3hWbVkyb29LNWRJWTFrUmpzL2NaUkR1?=
 =?utf-8?B?eVV5QUZTRUNzQXZ0SWY1aWR4dXVublhIMkpoS21IS1dRY2lhQUxJaEROUkl3?=
 =?utf-8?B?YW9lZzlrclk3NFJoTWZkSzc3cTROQVdYaHlQa3RKUkNld0VrMEppK2Q3L29t?=
 =?utf-8?B?TWpGSkNFay9yYm9lamtLWWdvdS9PK2VBR0R4c2JJczh5N0NuM0lLSXE3L3E1?=
 =?utf-8?B?YXhxdC9COXhzSEs1cWtyeXR6Z1UwNmZiVmRDRWRZR0NIT2NXdWx0cUFzMmhH?=
 =?utf-8?B?UldYME80bTVBMXdJaUpxZk9CbWhOekgxYTlwQk0ySTZmZC9PZGJWQUNEU1hW?=
 =?utf-8?B?TUhQT3VpdXloU21GNllLWmpvdm8xRm9iWlg1cEV5c0NxSlp2a25YSFNXQjJl?=
 =?utf-8?B?RndRRkZLUjBNYk1aT2xjS0FLSXJMTis5Rk5SV25JQVFrS2hwb2xsSUxTbDRT?=
 =?utf-8?B?ZmErQ3BnYWVYUHRzOVVQUHpDcWs3NXEyV2d4N2h5dHFUQUFaQUxadWs2ZjRW?=
 =?utf-8?B?N0k1cW85THZoNmwvTUhqS3BSRXZtWGJpb09rb2xiWS9hNTVrTEltN0Fhd01H?=
 =?utf-8?B?NXo0bUlwL1lZQ29BTjN4NnhEUUNxRXp2RlA0bnJNeWhnR1U5M0JhZFZKUmtU?=
 =?utf-8?B?eUwwaVk1ZDZpTkFzZXFHYVA1UnpDb3pldmN3c1VoS0hwNk55akxlSVZyMEl0?=
 =?utf-8?B?bVVjK2dHZGdSL3RtZXdYSEZ1cWRkRXMrRmI0MEx3MHhGZ0w0N2kwZHdhMTNv?=
 =?utf-8?B?QTcrVG9IT0FnTktGOVd3bGxieE9PeC81OFduQnBUbFdQWi93Rm4zc09McnRN?=
 =?utf-8?Q?8qfsLajBtc0xZg0FlHaGufd82p++uSHH237pRzL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca21c9df-944d-43d9-7647-08d96ea91a16
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 07:04:41.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +In59qniolkR8oKIHUjpKhVqsxBqnqa2UBfBZVGxLy+MEpA/a2RIN8611Ki4PLMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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

Am 03.09.21 um 08:49 schrieb Pan, Xinhui:
> Like vce/vcn does, visible VRAM is ok for ib test.
> And in ib test stage, VRAM is sufficient.

NAK, that won't work for older hw generations (e.g. SI, maybe CIK as 
well) where the IBs must be in a specific GTT hardware window.

Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index d451c359606a..1c099b79d12c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1178,7 +1178,7 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	int r, i;
>   
>   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
> -				      AMDGPU_GEM_DOMAIN_GTT,
> +				      AMDGPU_GEM_DOMAIN_VRAM,
>   				      &bo, NULL, (void **)&msg);
>   	if (r)
>   		return r;
> @@ -1210,7 +1210,7 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	int r, i;
>   
>   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
> -				      AMDGPU_GEM_DOMAIN_GTT,
> +				      AMDGPU_GEM_DOMAIN_VRAM,
>   				      &bo, NULL, (void **)&msg);
>   	if (r)
>   		return r;

