Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E35332EF
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 23:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7110FAEA;
	Tue, 24 May 2022 21:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01F10FAE9;
 Tue, 24 May 2022 21:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUhqT3dl4q8vrM/cGX6/fHA6vODfU1atNN9sZnx0N9hN+JWZCcbdiMGFxeNSsssG0/p7bmQRn8Yd20vEMj1WR7kscHtAR0sxppY3bBzZuIhTrsy6HZvh9ORB6HLj9PesmBu/GpogCfT8qFs4GPOWLg8yHsrno+9/b9vp51gYhbxwYb4qZlGJSUxamHBhp4p8N8BfHmhbsvd7KVwwp1kI7/oeb1JGHus5JqS97I7J6ULLzLC07czCk3TpN0gTvNWfiIo+sb9yIhJZAfwfRDJPfRWMhjR37svimTiwARZNw8WW0IMaXkGYP2STiCPlsFEIgutUAu78pdUPskITkcPsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NO63I70VqYYwsU6EXYUGmnEVy5HV0QNGQOGXBjL1zaw=;
 b=mIkwDfkG8BoMTY+1IDhGkTb8Mhy6pcdYMIVUsrY3VVmeNGyjIWkZvXdsV0F2vU3gpwcYQvJ3P/CUM5NVy+bvI9DWvRzHofkP2Y0aAaiBYiZriJtSqg8kpmRjhtEz/WJIZMq87ojVRJPAifVcefAcNqDCVw/aSJLnACpqI+ax2Zb8ruq0/6bcWggZQErnVk9wsM6ZaXShsOgEcp1CV8m6RhFTfddAy/jUPfzJJZSPMF+XLzpBQ6Kf2QFKZG2q847aCH7n9J84UjiKO54NGzYL/KIAHUWHIQuy5Zy5CEVj7i+moAyfThWUtcTrLb3QeiRbbREwR2FRdxjQ35QQk1VbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO63I70VqYYwsU6EXYUGmnEVy5HV0QNGQOGXBjL1zaw=;
 b=UAlFE3WGYeVXNoBoKLCg1oPohKWItyzciUY2spO9+0h9iXcLg5TJtejwMsr4YqBVElqvpF+32kqf8bXBWjp3Rc++A+nFO8l5kAowc9dkPyzXXy/0woS/1m7NKQexlWdW5dlUeJvLMRXRjYKT/UAZWxeRG0lWWiAx7Qbsq2AaYLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 21:22:35 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::f85e:63df:8fde:b620]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::f85e:63df:8fde:b620%5]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 21:22:35 +0000
Message-ID: <be333969-560d-36da-79cc-9d223ad675a2@amd.com>
Date: Tue, 24 May 2022 17:22:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amdgpu/discovery: make amdgpu_discovery_get_mall_info
 static
Content-Language: en-CA
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20220524081154.35061-1-jiapeng.chong@linux.alibaba.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220524081154.35061-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1919e209-3750-4eba-7586-08da3dcb8581
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB41102E7C5DB15058F758155C99D79@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFBvB/bSEuXagkJFHmoFBO6hDo6RM6Gv7UtAzyCd/jE2lWhF9edhAo9ttMJ5TgKIlxkqsY6JqveaZlkO0i9HnFAvYPeuyM+iDfJslFRkTIkGdr3k1JQ/SeTebMjaszf0Qz37gYxt2GpCE/u9+AuerOjoBOnaH4v7mn6HAMZ9AYp6/9JUXxIyhIqgztRMtXeCf1hG1zGtuI1g/kqUmEApZrrzueqYw38ssMwhqQUQE3X1os2bY5B9/NlNgkzwFPqnX2+TXPv/6GAftip7sOWNYTPiVJOl/CHoy9qPDBJYuK4n0jQGc9FrkPA8orv+aA57JXctcfP4bWHjB0lljwXSau6r48i5rFV/oPaWAuRBuoqHhxkdL0J1pqxqqJPB4B5J0oj/t4b/dwoFeXUlApMkCU5kqtlBDf2QQw7iOw1ckxq79NXZjbY8Kak4XK4VTgXbX661T/7rwg3eA8N5aSgQXc9OTXioE4XVbi/jLl5e0UW4umm5ywFDdkEYfxzhejc+jgd44zYn3PaIfR4haTueEMimgdYiZjIWkTzevWNRCVrWvsMDaeSmUIc6OwKSy8yDer8PFs5BOzIJdZkCb753gpl+BsAtOCMEGk6XcYPQJcjJKtjdmcgHBBHLKoOZkrhFyptLUsmhr2lMZQZe5Q+84R/BXhtKw4QR4I6+ZUxsjbxKNNU6/YJDU2YtDWsUjqfUNUBU7zGqsTfpTEYvyDgRMQ/kK36qKYbZK3OqaoqmV4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(31686004)(36756003)(38100700002)(2906002)(66556008)(186003)(508600001)(5660300002)(4326008)(6486002)(316002)(53546011)(6636002)(8676002)(83380400001)(6666004)(31696002)(6512007)(6506007)(8936002)(26005)(86362001)(44832011)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9UbTB3QnRHa0Yrd2kxT1NyaGdyVFU5bHQ2NmpSeGVzb2x4Q2l4VjZ3aVB0?=
 =?utf-8?B?cWJPZCtIOUZBNytKeVlrNUljUnVKNzN2VjZJU3I2VWZPM0RBTnBlVXpSZjFM?=
 =?utf-8?B?N3l1YUZFK29UTVNZZFBhM21ZZHpqcGkwZDNjenQyRmtYZ0NEZ2pIRjBUTEpi?=
 =?utf-8?B?QmExa2VBS0ZzUHVobE5SZ0xmdzR5RVFlVmJXSjF3R1lhWE5pdlZCa2xDcnRM?=
 =?utf-8?B?alovVTd2TjhDcnBQaHVxK3VYYWg3cmlOdjlPcXFhTHdxYmp3NWY2QmRZKzRC?=
 =?utf-8?B?aUNKM0FWdC9XK0JkZmFYeUJrdFpxZGhmNXdUSXZzZzVzbDNwVFVOeGNFS0wy?=
 =?utf-8?B?eUtSOVBFcjNOTFVOK2FoQThJUTNWUmxQVDV1NmVnMDlRdWtVL2F6RWZyYWpm?=
 =?utf-8?B?dUViUWZrZWc4UHhSQzlRWDRPaHMyWS9Fb0VaWEhwQUxTMXNvT2ptaTFDRW1y?=
 =?utf-8?B?SGtpazhIMU1UeUxTTGhrMXNvTFd4akRaVTFtM1RlSXZRTktFb1JnWXoyQ083?=
 =?utf-8?B?bTFaN1dPaWJFc1A1WjAyTVhyK3BIWjNyVTZibDhyRlVhb2sxN2NlL3BZMUZ0?=
 =?utf-8?B?OXdybEY0dXRDSWhhSk5uODBMdk5QeTQzNjhJRDM0bjdHdU5qMjYrTnB2eng0?=
 =?utf-8?B?TDREeHJScXI5VURNaFRkcnI3RkpmbHNnZEJDWnRHa0NpSVcrMHJDcFliSEdl?=
 =?utf-8?B?cWpQdlZiUGxUaW1DbGpaaEdGVk5ENWcrM251Q3M1WDVCMGdUTEVjT1FtSXpx?=
 =?utf-8?B?SXg2WVhaeU5tSXM4cGY3bGhaSjVHaWQ0MkgzTWVFVE1LcDNZblZqQlZFc0R6?=
 =?utf-8?B?aTAyV0hEejJ3Y3NQQ2tacngwbU55RCtPU0JuTFNkOVdhZWkrWlA5MDVaVmhl?=
 =?utf-8?B?ckpCdzBVMDF4TzNoaDFxTUpSN21zMkt6QUpJVHBSTGVURFMyQXRzV250Ukc1?=
 =?utf-8?B?Tm5vd3lQNEgxSU1yVjV6bWNqa01vWDdGcERHQWVwbWh0dGVJTmFsbmFDUmJF?=
 =?utf-8?B?VlMvZmZ3dE53U1hrU1lvNzRIc3Q2VHAyTndPcjJQUG5aWTZtZUVkWVpWZjQz?=
 =?utf-8?B?dTRvN3UrOElTd2hoVG9rTmFtRUkyRUdWMkRyRnIyaVR1b1R6elhGOUg4YWF4?=
 =?utf-8?B?NE5qQnhYMDBTOHhoSnFweXhEU3pZVnFQQ015WlY1azB6OEtWOXpwYlFYVFFO?=
 =?utf-8?B?MDJrTXg2OGhwVXRyUG9JZVdsek9JbHZkbGluZjRSRmhYdHRFckdSa1NHRHFF?=
 =?utf-8?B?cE9XWG9NSk5meCtneVN3ckV4MEJGQ21IdlV3U2swdEhhbG9iWDNiaHMrRURm?=
 =?utf-8?B?ZVdlWjVlUTZUWmxFWmpCMWhZS0FHN3pnMk9ZZ0NaVEFqMW5zVWdUSEVadkw4?=
 =?utf-8?B?T1VTZG1WYWQwSXBKeUM0OFV0aUUxVC9ZN3BEa2dPbXlteE92Y3lNNVZFbDNK?=
 =?utf-8?B?ZmhIaCtTTG12cEZhTHJvbjZscEJqT2drT3NHOTBUS0w5QU4yUWk1S0ZWdExs?=
 =?utf-8?B?eThpaXNsK3pRKzVjQlFCUi90V3lnbG5JRmUxanRtc2lXSnkrMnZ1SW1wVFpo?=
 =?utf-8?B?dkZCK0tmdnA1T2lrUlpWakhPYkpJb29rVlZwY2U3dFpWZkFiTEhrZStDN0U3?=
 =?utf-8?B?ajB5ZGpVNnNnYVZ5QUNodVhaeDRhQVJDVllWWWYyYytNZWpsaEVqKzBqa095?=
 =?utf-8?B?QStsUnhYWXRzeHlyWmJMUG43b3JnS1lmbE5YWmZDUXc1TVVuZjdLMG8wckxC?=
 =?utf-8?B?U2RmVTFUczJQMGRFNDBiemRVeUhQb0RlMk1rSmJzalphUjgrb3hScEl1Rzcv?=
 =?utf-8?B?YW5VdUVZd0VlNWpqSG5yQlJVUVhoc04zWnVnR1lkM3QrT2hDZzIyYTZOZlRG?=
 =?utf-8?B?cmRxRmpxeFh6dFRnMlp3RldwMGI5R3YrUlBlbDJjbTF4cDlsY29tbk1CRE1l?=
 =?utf-8?B?SFpzNDJsYSs3d2VpS2RtbmJZTS9mdmZ2bi9XQitXM0xxa3hhQnQ2MnZBUHJ5?=
 =?utf-8?B?ZSttazkrYTlrK0VGTWVlNU9ZR1k1RHBPaURwazMvdm5QcDNoa0JoT294ZjdG?=
 =?utf-8?B?QnR2eU1pYnBCTXYwMy9UejM2ekQ4RE9EV2FWSnlnNCsyYUhmekY4WkxTT2J0?=
 =?utf-8?B?TDArL3hjM2xRUW9RK1JDclBxZ2YxU3ozNGZqSkdxN1hGaVZIMzlaaStzNzY1?=
 =?utf-8?B?aFVXQzZuTjczYk5mdldJcGtpV2NiQUtwL0lBQk8rU1RPTkJUTWtHbFRkZ0JR?=
 =?utf-8?B?TW4wbjZHSi9JODJtMlRjaG9YcmhHSHBwMmVQUlYzZDB4NXZBb05HZUtCVDFR?=
 =?utf-8?B?Y0xOL2NlOFFrWmZxZUJpd0J2ZHM3WE9PdklmSWlqenhlcDBEYWZ1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1919e209-3750-4eba-7586-08da3dcb8581
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 21:22:35.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBRKFvwvaTCRUu7dTvNMQGPIdJyztqKpgenOL3u+eZYCQeTjix7/Hwuh7tlx5bOZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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
Cc: yifan1.zhang@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Likun.Gao@amd.com, flora.cui@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already static, in our local branch, from this commit:

commit 6852e61a0917a2
Author: Evan Quan <evan.quan@amd.com>
Date:   Thu May 19 17:28:12 2022 +0800

    drm/amdgpu: suppress some compile warnings
    
    Suppress two compile warnings about "no previous prototype".
    
    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Evan Quan <evan.quan@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Regards,
Luben


On 2022-05-24 04:11, Jiapeng Chong wrote:
> This symbol is not used outside of amdgpu_discovery.c, so marks it static.
> 
> Fixes the following w1 warning:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1364:5: warning: no
> previous prototype for ‘amdgpu_discovery_get_mall_info’
> [-Wmissing-prototypes].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 881570dced41..16cdfb30b013 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1361,7 +1361,7 @@ union mall_info {
>  	struct mall_info_v1_0 v1;
>  };
>  
> -int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
> +static int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
>  {
>  	struct binary_header *bhdr;
>  	union mall_info *mall_info;

Regards,
-- 
Luben
