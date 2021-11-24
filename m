Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7645CD6B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 20:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2D26E157;
	Wed, 24 Nov 2021 19:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E7F6E157;
 Wed, 24 Nov 2021 19:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahKEJWSXGDFg6Zw8Z06RCXznPWT1jOHxeB7O04M0TKWmnHZewuLCLZC4kgDbVQju7HT22J8+fR5qk7LhDzxlxmXk2rCYg98Em4GtQa2aRTEnronD/32kQTQ/d1nKw8zKD7UY+OBLJZcHB0tOVsyCG4I+IqRWVPAYezBo27t7iDiULuqUD3GW5/7DJDZcxLrATAsprXAYzonxEORd4s/kEd+6ifvLQL7oAK8eGosqUcU3/bR6AcVppofPXXjvr0IqlCbEsf1k/XT+nUWvhP8oQUm89q8k07BOX0YLR8pyrObKK/fJWeBdtaLXFTWTuZu30sgKNTU0TEwUgybMiu/+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2DNW0At5jQoy7e5O9nmpPAwtSoiukQncX/v6irjAm4=;
 b=OKOUczbBp7yV3w1zZkYPgg0H6FtSgMJHDBCnIkgx+Pz8FLxqgoqVjfqsUrP2lA9UP+Kk4iU6/8nSZNag6NGrwuKutyo+/YWv6CBEEPJu3XJgYxRjhxHxsh+MQU/8sEud5qjqS1bxvcHnmSPbAQdJTryD3s2G3G8DXrGAua0tlQTWTG0BDNUG8jXtTOWJy0A3zarE5kEyJpDOtBT6tZauke62Yx+KUs3VrAgdkZ2sOibKRYB3JikrUP4NUeLgTeB3uRpdlvpntssCxDCY7m+SagkP2PLv6FjdH7ps+lIAqdJHbtKCcs19izvd3avJQbrc7cpEY9pJ6QjYLnA9nVniBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2DNW0At5jQoy7e5O9nmpPAwtSoiukQncX/v6irjAm4=;
 b=QWAhc96tuw+Zg2Jo17ZEn01tgP9BBksW+C1zPsvZjYy9oRJ7Cs/l5Jy4UcOFc916xllTQzSBi4SQZdIWZjnoCaZZ/uO2YMQW/9kqVXBPryTsoadwT3TAYUTLCOO1ezJt3AVFXF7yELshgJx7j7MYv+cl81/uO0S61pb4w7qdIFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 19:40:37 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::6147:a3dc:dba5:60ea]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::6147:a3dc:dba5:60ea%9]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 19:40:37 +0000
Subject: Re: [PATCH] drm/amd/display: Fix warning comparing pointer to 0
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, harry.wentland@amd.com
References: <1637749236-27107-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <5be550b1-361f-1028-764c-62020e1f23ac@amd.com>
Date: Wed, 24 Nov 2021 14:40:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1637749236-27107-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::17) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:56e0:6d60:eb8c:d5ab:cfa1:462]
 (2607:fea8:56e0:6d60:eb8c:d5ab:cfa1:462) by
 BL1PR13CA0222.namprd13.prod.outlook.com (2603:10b6:208:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Wed, 24 Nov 2021 19:40:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18625548-cde6-4509-236e-08d9af8249d7
X-MS-TrafficTypeDiagnostic: CH2PR12MB5564:
X-Microsoft-Antispam-PRVS: <CH2PR12MB5564D1A66BDAB83EA96A25C598619@CH2PR12MB5564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Fc42Ve5ZCO9cLMTgP9JDtbD+TEOyunSt5QSwT751BKyL7IFi3aMmDPL3GDD3Wy2fBPIjqQb2rFmkDZF/5cSHmzwNSzcldpZ+oC0oRwJ4DP9+DpEeQuY8gAdx5/EprpckaTeiDB5hpFH5qiNYWqe2hgMV9zrHWiCVXdNNP7h5EP2hrWPydMS0ROySTnnW3IJLM31OR1rlmOc4JmPKpuZct4exe/lgo3uHHLFNnxeAyliCjOHI2UQS9uLW5+ZpiHfGhDxz38YVh91xwsnZ8dXll+E8WJyxZ5jAlUsZGQdSM8s2EmtlmFH/iZFf43u4JAARHe+/COIheBjSM1W4NrAW8llRB96jSqNTqTkEWzAjhk0s6EG3xdn3udM5kZcVZHQe2gdEfEyT80GkdJNoG2KeuRQZ12Hr3DmAYNFcdyn+USqqs+Q4zKUpS4LqI2C17kPZUWL932X+7tI3WOWlxFYjCrE9L+Y6VfP2uIt+D4HppV1BGPjQ97e7b877AMhcRr+0+daLfazVO+l1FQHUWDA2wfhipIZuEgH+ZC7QHeaH5AxMW8gfCVIE521b9A0TbUzrfaluzusAfLOpCmyRLcSkylHt4RMPHCDw9PL85KN/0swIg3hQh0lT5Qxw8b0hTDyKwlvyfUEJk63bmJDwgxTFcF2K2l0ARZbbH3GWKWhaNa3FIzzXpLu/HMBB+Z1444jie8V0TtN4Lt1bLId6F+m2teZgV7/DuHsLwfZrtvV2qQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(508600001)(53546011)(6636002)(8676002)(6486002)(8936002)(2906002)(31696002)(31686004)(66946007)(4326008)(5660300002)(36756003)(38100700002)(2616005)(316002)(66476007)(83380400001)(4001150100001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTNLM2k1b0hEL054aVFtTkpVbnRDaW1jRVVjMng5Z3ZQUXl4emhncGRQc1Rt?=
 =?utf-8?B?Y1l6blQwaHFZN2dhWkk5cjN6bXlmd0djRm1ic0hHUkNLQjlTdTB4S1d6djZR?=
 =?utf-8?B?VlZjYUxwTUZyU1UyUzRtTmFLN1JGREhiaGg1RHQ5UGprUWxqb0Y2ZjVTaWY0?=
 =?utf-8?B?eEtIOE9LM05qWXkzOU8wemJ3Wlh1K1JEeTF1Y2xKbUNjMVErdGR2ZWs5b2FJ?=
 =?utf-8?B?Vnd6eUVPa3ZpbzZPaHZTQk0vVlE3L3VRTmgyWjhVVVFZaGZzOEhRcUhqSzY2?=
 =?utf-8?B?aEdHbFRCc1I5R0JwOGZXa21DcGJWaDJzMFJoK3pkNWVqMWJWWElQdnBNWFo4?=
 =?utf-8?B?Y1hZMUxONTFEeWpGSUdlVVkwQ2VvZUNPazMydDNldzlsWVI0dVlqR1dBRDZ4?=
 =?utf-8?B?Mnkvb3dEYytEREhsUVlCeFUyVjNOYm5POFZjaHBlQlFCSlRLZ1dxZERXQXBQ?=
 =?utf-8?B?MG82TE8xdzc3VEtHeTZBaXpFT2xEWnlYM0pja0RtRWpqTHUzNStjREY5ZGsw?=
 =?utf-8?B?OTN5cWlYY0tWZEl0SUYwWEpVL0Jabk5BbXJnaXpkVVVISmNiVk1DNFhQYTh3?=
 =?utf-8?B?T2xBaU1VSitRL3cvaWhCalpiUnRKZktnaDM5c0M1ZUJ5elBWQ3BoRlBiNHli?=
 =?utf-8?B?bVBSNnA5dzNrUXhrOGQxVDlSVkZQNlBwOGRPeXdwNmpDakhKendJbHVnM2tD?=
 =?utf-8?B?TXkyZXJDNC9TUlQ2NW15SmI4MHZhaXlQckxQV0tiOTlSR01wMTl4UlpST2p6?=
 =?utf-8?B?d0o1aE1HSllFOHlEMGVuTnAySVVLakxKbHprT0Q5MWdGUE5KdzdxY0IyS2hP?=
 =?utf-8?B?em1IYm53RXBxZ2k0Rks5YTQwWStRTEk1c05mcEdodEVkZWtoUUswdHlmOTBk?=
 =?utf-8?B?YWpNRWdydVBnWFc1SUplc0FsUTMyN3JDVzZvNStmd0JMa0wzV1VFbTF3MkJM?=
 =?utf-8?B?N282bklUTk1PeW1JaENGZ2xFYmd1a0w1N05HS1VSNDYyWXBuejQ4bjcxLzEw?=
 =?utf-8?B?ZW8yU3VYQkRRN2U0NWRFVHJBNjRkdXBIalFlMko4dkhKZXExSjU0cm5vUkdt?=
 =?utf-8?B?bVZyN1RJZ2hwcjFLdlMwS0s0U3huOHZXRXJ1bmtEQ1dyWHQzb2ZkWUs2MWNH?=
 =?utf-8?B?eXgyc3Y4NU5zelo3aEV3YzNPN2ZVWHpONmNhYkNreEt3bG5IdnBtMlBzU3ZU?=
 =?utf-8?B?bW9FcDZ5UFNnaTA5QUtKUTFlME9wTzNkNnNPSW1WRjlIK2w3NXRTVnc0Q1kw?=
 =?utf-8?B?M2hscUVSekJHOXhuK2tyclhmd096UmlydjJlTElHMDJRZW4vUFZwaW1KamZv?=
 =?utf-8?B?dUtDR3NMaGZ1RHBKWWloaVhmbnBRRzBJUUliNmRzZVJZcVUwdGtlc2ZyRTNs?=
 =?utf-8?B?MTd3WFBJWjdjbTlWczV6UG1zRjNrbzI3T3NUdVNmM2paYVd6eS9JL3lXcjlD?=
 =?utf-8?B?Vm5hZ09HRkpRRDdZbmc4dXpNd0FQOWZmRzBxam9tWEd2RjY2ekV3Sm1DcFQ0?=
 =?utf-8?B?T3V3MTQ0UDB3SEtSY1ZlNkFXbUJ3WFZKSDZvaFp1bDVhbnNFK2NzR0V1OC9y?=
 =?utf-8?B?VHdqVHRVSkhiN3VqZmJ4bTdvb3FjNmFhWHYvZFN0cDd6STdNQ2NjY2s1WHBW?=
 =?utf-8?B?MFY1RTVZQnJHdk5rb0JVM2lXbXJqaTlHN0RqOWxXSlUzQzR5Wm4xNTM3RHZl?=
 =?utf-8?B?dURDZGI1MVk3eEt4cW1tdGxtWXZSUmxlaHBuanJIbENvN2h6bVlHYVlqek03?=
 =?utf-8?B?Ym1sa3FTSHBYTUs3Ym9HS3NQOTNEQnJYSHE2YTBaUUVYTmUxbDJUdW1yM0lj?=
 =?utf-8?B?eFV4dnNhN3hwV1RmcUdYR1VvZzVpYU5tS1BlT2VBWmdSazZnN3J2a21kY05s?=
 =?utf-8?B?MHl6MThQVFE3eTRWNGN1V3dzWUR0cHFTVXZua0JiOUxSRVV4Y3JabC8yWXpV?=
 =?utf-8?B?R0VNKzZMNStvT1B5UTBkb0xzSE15aUdyZEhjUHJSZjZkTU9saS9GdU1RbTVv?=
 =?utf-8?B?OVA4Y0kxSUdrS25TN2tJUHU1V0kzVy9IcW15QTU0UExnMzZ2TVNBS3JLNnZi?=
 =?utf-8?B?M3NPUTJyWmovOFJnTDNoUFFzbDdKT3V0TGdPM1Y4bjBZNmJReXVVbmpad2pM?=
 =?utf-8?B?aGIydGYvenhFSlhxL05Nd0lKcERrRTAwdTZIN1BOOExndCtUM3MydWcxbDJo?=
 =?utf-8?B?SVczdTg0Rm5zRW90d1RKa1ptWVRCTTlFR2RQWEZGOXl3YVE5WCtZdVJtOUg2?=
 =?utf-8?Q?xXzvAtjsgUqqf0fRSWo5Go3rx77OF5OrG3pJh6rAcY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18625548-cde6-4509-236e-08d9af8249d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 19:40:37.1560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIbhENKXYhGqkDwwDHMXNxNFNJFhmGUFKA08XNqIQmTmndob2Rzh7nPR3uV+PXjW1JqifNmJK0C7YJsl2Y3NuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5564
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-24 5:20 a.m., Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:96:14-15: WARNING
> comparing pointer to 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> index 122ba29..ec636d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> @@ -93,7 +93,7 @@ static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
>   		TABLE_CASE(420, 12, min);
>   	}
>   
> -	if (table == 0)
> +	if (!table)
>   		return;
>   
>   	index = (bpp - table[0].bpp) * 2;
> 

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Applied to amd-staging-drm-next

Thanks
