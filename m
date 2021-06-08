Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57139FD97
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987286E296;
	Tue,  8 Jun 2021 17:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D196E296
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=im1oXuFgq6rQy+hnEQumzZSNdLdI9OzM1dOA67nMuxPenRRMchifH4g5WeJ6J327wIYGR4UDBgdNNluw8BGw8KPA0z5fjOhYNOKLiEX018ifMUb6NQXTM/iUk3vGxnmfTpUKdDVqrYoTf76yv9VZcVdWgZSieTR3cSdx8f58NoNcGq7ec4sQam3PuhALtHZ/skT9nOooOXXATFLp6ELh9u+gBZgupfWHdFQM90lB7ntJUo7pyl46aFFemyhpsL+LAliuVFS8xQutzu7x8UVBdVB81DFkFkTFpZJ61FM8hjvcKJ0p8NShGi+7Y3KirKwknO3mKgmwvX8qO3wy+DY2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n6wIN6aks5/AFQsmyIAZhJYvSzkTxfP0fAfHxi2ilw=;
 b=Fa9+5uL2hOXNtkfq1S9uAnKC00yMHOpAQkiYoxckvGJUj6zFfpbAfahzwPtj4dTQnC+2sNMJnvAVpiXqzEKJX7g1CSBrxxj87crlB4sYNTP97VylsFO4qrov4kTNHX7Woes+SCXrVYSxALKNnblo7cKqbAC8bpO0k9LPTtujaWIVPyY5c49kWgvaXsuYqjfBcd5QYrHb+G9yG0lPiPo8ayyZva5Y8jVr3psSZrIqoEq+wVA1qGddz/hlKUFXYzR1yYn2w7ousglUReloJN/oE7mY4XW5IDLgA8v2rDLt6A4nbun3AO9H0MRGpbfneAiL1AYFhEtjckzB3mqEyuU+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n6wIN6aks5/AFQsmyIAZhJYvSzkTxfP0fAfHxi2ilw=;
 b=d4IVyGGlYgkNGXKpO3ZU1xuE8tJw+V0T4k2Uq7bbsPmqwmq1hjrQ146/RrldtnGJMO0WuaSJcHgMqJOrMjvgk+/7xQtNJyYS4qW6rcK+fQrL1lmvEGJg9K1m9vf7w6mts3XAdm/95JMrjh7tTmsggLiMXhqWE2iMf/9mQPW5VY0=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 17:29:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 17:29:00 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: free bo resource before assigning new one
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210608150917.89346-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
Date: Tue, 8 Jun 2021 19:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210608150917.89346-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:197a:8536:afbe:3762]
X-ClientProxiedBy: PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762]
 (2a02:908:1252:fb60:197a:8536:afbe:3762) by
 PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24 via Frontend Transport; Tue, 8 Jun 2021 17:28:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8796be1e-9309-49f9-82a7-08d92aa2e70c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4963:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49638A43D224D8479FFA40A383379@BL0PR12MB4963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QaizXghHVANcwCnMqupNkR6GPR+hb12AV63giGWRSzVNw9+gyBPc4g744X0lI4o7yLj5djZiHZZuSey7EA/byx6VJqnWVdDNRoLJ3s4QD5xWiyLuPsWj/ZBDSwwW9l3Jz1doqno/q0gEL02jSOSsP0uTcRpy6XjpDE7mX65VeDW3OPXS54A5GRP50/pa0HPLijWqZ3WlW+z9XoubS8iFwFzUHXcAGYn1wl+bntjrK805F5VabxPdQ9gq9N0SMNtu1vXM84J708HG80kmaO4w6G7SnLEvrvb7fnaa5GI0III/YUNVXdiIoLR/tb4siCsnfYNm8EECH8g6UGcpNLKH4C1Z31BW+eolBISNhBzsiKIzevLznGhgW5HbkMiq6rED8imuPW5fCtLb+cONSxlEGMCLR/uWoaRl0R+ychbsGWnBjwgViJCKcsJyl/q25lk9EaOQv2FG80br9eZ9aGcmz9lhXRdZVSZt0qMCCkHVANb5i5ErFpepKVPMb/Hdl3Hb2qd/S7lVj8ejiQbmeIY1C5hgFm0KWu0ul+M5QIBoZ7zO/45tgXQqCwsuihSiQsW4X9lewpXsWTghdC+5q7t6pAuQUj5B3ZkZYOQt3UlmaCQdGSJo4E6tVVlMeY4nM6s53Gmt8qnvyHHISLzJmehRnguaNN2D+tcTD1jvsc/EnKmwrULTbYIM51YF+ixCl6bJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(4744005)(2906002)(36756003)(5660300002)(31686004)(478600001)(66476007)(66946007)(66556008)(38100700002)(4326008)(186003)(2616005)(31696002)(86362001)(6666004)(8936002)(316002)(8676002)(6486002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE40R2pEUFhRUXdKWFNiOXFaTTZrbE9LbkJKajFZTlBRQlVXbytRWlM3cS8x?=
 =?utf-8?B?d2VPNlowR3EybFQ4WHVWSWdBalJuTFdOQUhmaFdqZlozV2MxcWlEQnFuTFVF?=
 =?utf-8?B?OFlhMlEyNXA4d1Z3VlBDSDdMWENGUFVjNUEvUVY0YjNVcDBxejRkdWxMcWsx?=
 =?utf-8?B?SU0ydGJ1L3J2TS9uZFBuMGxVWGlvMVN1T01Sc2QvMlNSdVZpek5NaExXY3Fy?=
 =?utf-8?B?RDVQOTJqQ0hJSXBtNHdObER6Q2p3c2x1VDhJWEpxMndJRHJsZjdJRENRWkRw?=
 =?utf-8?B?by9uVkdIRGZmNmx5L25qUUxaOVpYL3lkTUdiRjU4NWNDOVA0VC9acDgxS0Mv?=
 =?utf-8?B?RGRSemExZk11dVk2MjM3MHBSWjBScmNDNnlaWFVObVVZWnVWdU5mUUVzSU5H?=
 =?utf-8?B?Wmp2OTVKS0ZhQTFEQ1JPajNtemNvN2xnbTNlblFva0RGbC9HdUlEb05RNHlP?=
 =?utf-8?B?ZktmVm4zT2lmZGVra0ZkY2haZ1R6VTlqa3lSWkppNldMYTFRN2E2d2xta3h3?=
 =?utf-8?B?bjFRdGdYZUF1emhpamw3TVVrWU1ybGhqVWFiVFY5WkJRZGsvRUpjYmNCaHl3?=
 =?utf-8?B?TE9TN2RYZEhST05ETDg2aXIrOXJzYm54SWtlMCtheU02UlFsc1ZwelE0ZE1E?=
 =?utf-8?B?MWwzQlZxNjRIK0NiekVUby9IR2tkY1FNSGZoMXRxUVRiNk84ei9TK25zejcr?=
 =?utf-8?B?K2tmVTBMZXBCTVl2YkQwV0Ywa1RjOHJQZlBsVmNZWXViNDNJSGd0bEM4Qi84?=
 =?utf-8?B?SThyTmV6SVVFaFFneFlPOUNPdXcvOStNMXk3MU42bVgydXhHWlNpdHQ3VFho?=
 =?utf-8?B?T0Z4dWJQdGZ2NHJPVDNaZ2drK1krNy83STZLREJpVC9icmpvUUIxaDBIZ1d3?=
 =?utf-8?B?Zy9GUFo5QWRiVllySmNtQTlhcWFyWHQydEdZZy9iY285VTErOHFDdEN5TWpC?=
 =?utf-8?B?SGhEaDRHM3BQVmgzVVVaRmVTQ28yQUM2eGhwU24wTUVIaWRwU0RYeWFwOUZZ?=
 =?utf-8?B?eWJFcVMzK2g4SnUwSkFTV1J4TkhJZmR4UjBpc3dKK3NyRFBRSFFsUnlqOTZw?=
 =?utf-8?B?UzZRcy82UUxNeFdIVkgycFdyUlNuR0JENmpka0YvQ1QyZzBQUS93bDVWc3RY?=
 =?utf-8?B?Y3hmQmcxeVdLTVpBN0duSWdMZ3RsVi9HK2piY1FMb2ZrSFRia0l1RTFnM1JP?=
 =?utf-8?B?VjFNU2FWNFFRcjlRaHdsWkRqRWx1VVp5cUJvcGhRNGxTMThJcm05Y3I5bHNY?=
 =?utf-8?B?eVZySUI0dE9rOHdvOTFuL0RFZk9xUGVlSVdhY0g0MGV4bjVNZEFkNmE2VTN5?=
 =?utf-8?B?RGlzTGkrYzhWUEx6SHRkSERXZXpQUkJLdytjbnJmamlUY2wyTWNuUTRTK3Fk?=
 =?utf-8?B?ZkNsYlBYclR0eEFaV2Urc2lqVnB5My84bmNYVGsxUDkyeTJ0ZmtkbTY2ZHBR?=
 =?utf-8?B?b0VjWExTRVlONzR6c212OFJBcTZIYkNscUVvdzlLU1lTMmJxdjczQXJRUUF2?=
 =?utf-8?B?VU1hTnNyZXhwU09TYmxWcFdEQ1hIT1lLV2ptbnpuWHdUbUZpMWowelNvSDYy?=
 =?utf-8?B?b09DUkJWekl4UXZyYVVLTUk1a2pHN3hxOWVhazZTZlB4OERHUmk1bkpZVVJS?=
 =?utf-8?B?NmFpeGlxQ00wbFhBY0h6bFpab1NPKzVqeXdFdTZsUnVVbDZnWGx3dXNVRGpZ?=
 =?utf-8?B?eXM2MnRkVXlFeS8zbXgybU9PeGJxNEZ5Ynh5N25XMHNwZGRyZXk4d1lTR0ds?=
 =?utf-8?B?NmhzbkhiVVRQaFZjdmlSQ0UrTm5lU0lGSmRrUmR6QVhGMW8zN1E3OE4vdnQ4?=
 =?utf-8?B?KzhzRDN4emRpeG1nZGVBWW05MkpFZ3c4SEUyNjBZeWM1RjZTdnBPZVVOb1Za?=
 =?utf-8?Q?WOHpqDh4DeUr0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8796be1e-9309-49f9-82a7-08d92aa2e70c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 17:29:00.1949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fihhpxKsHc2nUxdQWMNXK5hlFuJqjE+zUZFoAQX2fBgTZbvroHLDSYDkZEHTuBUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963
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
Cc: thomas_os@shipmail.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.06.21 um 17:09 schrieb Nirmoy Das:
> ttm_bo_assign_mem() expects bo->resource to be free.
> Fixes: bfa3357ef9abc ("drm/ttm: allocate resource object instead of embedding it v2")
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index bfcf31bf7e37..7281912436bb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -733,6 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   
>   	if (old_man->use_tt && new_man->use_tt) {
>   		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
> +			ttm_resource_free(bo, &bo->resource);
>   			ttm_bo_assign_mem(bo, new_mem);

On second thought we should probably use ttm_bo_move_null() instead here.

Christian.

>   			return 0;
>   		}

