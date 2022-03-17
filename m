Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E661F4DBFFB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923DC10E0A8;
	Thu, 17 Mar 2022 07:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0678110EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 07:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGdr4JA8PlX0RIPdyiwRruAG0u/x/+HaE7alXICz52EaW5v0g9/o30gBjXxnQGFWfkDa4E50fVEerHQyeflvbmKbw54SBKvgbeyzdRx3MVvTZCPZUxK/bAodxMQQwOOqjJjgczz/eHw6MHzZTZ3iVGcouDFLsQQFGaObpWxcM90nYw2bCjW9XxglOlpm51vfAVV3QGHw/ROabEXSIawZz+NC8mNEE4wvdbq3G3tSb/Z8jv545+Kd4DAK/rwm0LEf91TgdHkXoif0fcZaTbgBJp9FojAE17J2XM4+7JE3u109unk4I/3Ig+ytFy/7XMUjk9es3IHQhdfTb7+JhBfyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpFAN/U676LTkcKVjw5IDgneZZaGkyOwe7yLMas6OiU=;
 b=Ms9Z3a6AQp4MEWoWFlNUXlVlUWJl6xo5ZZ5jvQrTnxf+rgIiHAKGNO0ZBXbgxMyHZXkCNY4Kac3wbbmgxeE0FUeD84yNmhlqLb6YI3Da/e7ewvThJOwP6raMAjDGvpPIhPsinElL877lTB0byGTZNPYS5TiAXxLjRG/+8eO3cTOfiiQtPFnoWnpwr4jVuKshLstrwXVEGuixYJy8X0D/LwoaV2CdQ42Li/h4p+j3yjzJXguwcliraAD1FlL9Xg1sOcE8WSggZcthIOyruIDnKoudls2T+NgMXix1NYkd697Z29ULpNbEfukJ1FpXHBL/4QlUsH5Q4fxQO2fmCL4Nug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpFAN/U676LTkcKVjw5IDgneZZaGkyOwe7yLMas6OiU=;
 b=X5E2lJGjiIBMb+9uEEnAdltx95uRjKV/InglAetHI22lkfkQrr4I9jIP926MYTuZJj7e6RIRXnMoDktuiru0l1WkA1mbrsD0bnhsU3uTrIMSJ1L8ZZrmi63LO/INfsTVNuCN3q/Pak2Hh4xz1b/jfuc5gRdDmJWOjXTXL8uvCgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1352.namprd12.prod.outlook.com (2603:10b6:903:3a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 07:10:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 07:10:03 +0000
Message-ID: <140d1f43-d603-c24e-f72e-878ad10e751c@amd.com>
Date: Thu, 17 Mar 2022 08:09:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/ttm: fix uninit ptr deref in range manager alloc
 error path
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220316195034.3821108-1-bob.beckett@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220316195034.3821108-1-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f856f3fa-a378-43c1-f69f-08da07e52825
X-MS-TrafficTypeDiagnostic: CY4PR12MB1352:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1352DA669F20737DDA0C6A7483129@CY4PR12MB1352.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsM46ka6eIcpReJHRbKsTm4UgYVDGdK8Q1z1j4p39r14aJarjrGjOiBw+PbgU+G8JY8gqwJPPoaI94lbwE7Ljj/J/EAZ6r4VEjxCEpPOl0kTXCdy/T8JgEMQ4zD9tq/eFYy3BCA9tG5ArKKsKcRj+b0ZRd2xdIOJlUk9mU1zJ/Wa+O6whCn7EQWLb9FEtTyuYY5R8AgQjf0oaKXxcJeE8wcCSe7XqxC3zTIwng4p/vdFZpyLB37GDXj44K813FSOo6kPr5LG1KDL5TD1WmNezO6Xx/XvfpuzrWnfkepSgADO/HiGiBSJ+SmZU0dlmozBBH9HfGRP+VhlAgSo+ml9ISSDb/TgCTuUZBF9++Zy/L/QROC2jTy+8QHmI/SQwP2PaM7gin42t8umBS5xFF18F8RagvcHQdclWYBmc+MJsVUWcW466l+7E5dwLVrSlT55CYhayk2xXyPQ4B4e8QF/ZUWiUnmUYlW7fFk/jQHVFzEEjmKn0G6uOBKRrgIJMwJVUqpOqm+tKqYSgmGIb/pOtM2phPP/wAIXS0S9ZJ5/Ur+AANPKlZnfkoQsM3TUbv9JBKtGVjWeUTKVxADyxVTZ+PwrQ1GKhJ+lYxPykzH9poDNSuX2igmNDq+8idA2Ing4Q9arG7PGNestSMIQ0CwzvVzg8lgFPbJSnmDlRwxadtUq8r0dDQDhGeZPLwniOkQUOWQRlUotnoujcgEKHYcr2IMl7t09xBqeUmL2KkiIi3mQzac9WXRPhuw3Y8vKEsmo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(36756003)(66946007)(83380400001)(38100700002)(31686004)(31696002)(66556008)(66574015)(2616005)(66476007)(86362001)(26005)(186003)(2906002)(8676002)(6512007)(4744005)(110136005)(316002)(5660300002)(4326008)(6666004)(8936002)(6506007)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUh4OFNYYWRKUTdydmpIclpYMk00V2c4d3RaTnNNL1BENGF2TGhzNnJYMSsx?=
 =?utf-8?B?WVlXV3hUdVdHQ2lVcGRJYVZyMDdSNWtSODdURnF6UU0xRW9LOXJwT3JsbkJj?=
 =?utf-8?B?YnNjSFJvOFNXWUZwMFhOUFdhU25vRVRCMk1mSW5pckNKd3VmdE9xckx6L2ZV?=
 =?utf-8?B?MURXblp5b2VGTUdYNFNTdjJwbEU4OWhGWlE1WFY0eUFYUWJNTTJpMjdUYm5F?=
 =?utf-8?B?ZGVpSzltOFNvN294K3VrWnhpSjFXbFZwMTZyOEYrT25QbXc4VmNjN0M1cGJk?=
 =?utf-8?B?Um5PcFdpMzdGNTdEdG5sU2o3K2VEK0phN2ZjNGkvSW1TZE9oTG5BdXlTdlhG?=
 =?utf-8?B?ZVB0QWhDYTV4dnJ0OUNlYkZydmN2LzZtNWU3c2R6OVhXZGlNaVZjcllIMGlB?=
 =?utf-8?B?amJDb3h1VEk2ZVNrRnNlbExNZXFQYlIwTFVuN09ldmtvYmQ5VnVCTW93dVZZ?=
 =?utf-8?B?RkZrVWRGUzM1S2x4SzE4N3QwLytaeGp4NHBvM3FyRFN5K3pwYTlOMlA0Z2ZQ?=
 =?utf-8?B?Q2FRRHg3eGxhUjdpTmZGc1NBaWZuWG5xOVhSSXUyck92bExlcjJpRzgyQ2VY?=
 =?utf-8?B?TWgvUW5sN0VORXBlajIyY2QydG8rYnl3dS8wVmpPK1hMa05hZ3N0eEZ6dWtp?=
 =?utf-8?B?cnI4N0xpSGZSUDhjWk9aYUdiT05JK2Z5VlRyS05URXJnNkc3UWRtTERYZjEy?=
 =?utf-8?B?RFJoOWdCM2N5MlpYa1NiODBlaGluWDVueU4yQWRaRmU4a1dDNEpJcDhxaVdw?=
 =?utf-8?B?TGpLUkl6dUZrOTREM1J0SU80NHkwY2orTzQrbnZTY3YyUnZkUjRvTHRYU3RD?=
 =?utf-8?B?dW15empzWklSYjlpZllqOFJrMEQwZ3dIaTlQd2s1RlEvSkthS0pFbHhOKzV1?=
 =?utf-8?B?SXgxaGFONzBOVEwxRUdyOXZJVlc1c243R1NkTUszbGZwdnZkK2RRVjJyNFhC?=
 =?utf-8?B?d2wyMDFBSlo1QjVSbnZLZGpQQXZ3QVVRZFRuQ2sxNFdlTXFZYWZoYk4xc2RR?=
 =?utf-8?B?S1RTN0ZzWTlldUNYVG5yc3lLMDhleTR2OGlvbHhNNUR2bkYwaGF6L2crUFd0?=
 =?utf-8?B?SW4rM20vZVJ3VS9aaDVwTjUvbGhVTFNKN2MwemFrd3VPOGsyaStnMDNJYThP?=
 =?utf-8?B?TUlmRTRVaEhiK2xOZzJvZHVUckc1S3BoakVvdCt2VEN2M0pFSHZrTTh1bnFy?=
 =?utf-8?B?RzEwZEYyY3lFdnlIb0plVDBiR3VDc2pwclNkelgvbkpsZ0pabXFyWnVpbHlN?=
 =?utf-8?B?TDJFRnlGMHg2cjNQMVFyZEtmWi8zaFpZWDBMVUxDRTVpUFpxendoVFdsUkkx?=
 =?utf-8?B?NGl3RHBNSUVETVBrQTFCQXBqNFFpYlo1ejVnWnU5OUtQOENrVHRGd0djQjkw?=
 =?utf-8?B?b05wNzNtNW40eTd0L2FCc2VwOS9GZVNURTd5U2xoeVgzQXhiUCs0OERTcnJO?=
 =?utf-8?B?MzY1em96c0NKN2tXZVoxck5kNDArYVhyYmNjVlhZSmc3ZHk5elZaNmtNcnhz?=
 =?utf-8?B?K2l4MUdPdm8xcko3U0pWTndJZkdMMWtVVzU2ckdrTmVoOHBIaTJYWmRKWkhx?=
 =?utf-8?B?ZlR3ckpZYUFFdDZiRlBqTVpCRUNONzI2OFhIV1RGRWhVY2ZzVUQ2ZUlZV1NQ?=
 =?utf-8?B?Qm9yQ1F4TkswQm5uMDRmY2FBMkFybDJLQVFPRDBUeWRDYkNEVzNVQW8yQ3kr?=
 =?utf-8?B?YXRHTm1ycFdlN1NMMEtZbVdqM296NXBuMkxwTW41S1hnZG9aUGRNV2daS0M2?=
 =?utf-8?B?SnQvRDhFamYybzJyNGltWUlycmxYbk5JeExPOUtKd3NuVUdQNHBGRDhJVmRh?=
 =?utf-8?B?dGNFSy9VNEJRZGJyQ3hqTTYrTEZNTTZNdjNVVERzeHA3V21EUUdvL1NUdk1z?=
 =?utf-8?B?akFmSEhTVVhYeXlZUVpac2U4N2w3Y3RxU1hEeXJoNDJ2cVlhd29YcFVzc1Bm?=
 =?utf-8?Q?jGdP2Jo8F0BmQulwxYHXkK1hlhEsjxXq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f856f3fa-a378-43c1-f69f-08da07e52825
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:10:03.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TP42/H2CANJHqADLk2+UIh6t6wN89IbUGUPaYTe+MruAuftxmxDWRzFSZKRCQidZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1352
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 20:50 schrieb Robert Beckett:
> ttm_range_man_alloc would try to ttm_resource_fini the res pointer
> before it is allocated.
>
> Fixes: de3688e469b0 (drm/ttm: add ttm_resource_fini v2)
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Good catch, going to push that to drm-misc-fixes.

> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 5662627bb933..1b4d8ca52f68 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -89,7 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   	spin_unlock(&rman->lock);
>   
>   	if (unlikely(ret)) {
> -		ttm_resource_fini(man, *res);
> +		ttm_resource_fini(man, &node->base);
>   		kfree(node);
>   		return ret;
>   	}

