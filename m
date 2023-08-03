Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53776F3A5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 21:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C310E086;
	Thu,  3 Aug 2023 19:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7016B10E086
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 19:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT0xkEbkeMyBPnGpblvVjr9u4l7UZ2y20opCJLIw5ZQ3pfT4vB5301gJCv3q1Ov6YsiEsWo9fOxW2VU/RW6z8xi+z8f0NbQ44tC/uQXcDFMOBaXMPjGxKjQ4vEsV61C077a+lLfJRKUGw1Zcev5TQ/5Ty07dTsPp3aZOwHTfPfFaTYHXd1aOy1/Ditj5YeTI0Odv4j+Y/0NX9/mRlucq9xx5ONyZaCOeTi9Ouyo4SGeZJTZkktNEgPS17JMU4bAXmdzqy397PJa9PpACmz0B0VO0QLCbEFTybqX+qkX9tDVViX/g/pKmJ7vvzRBYtwk8mzyCpo7gYUK1k46tCXBvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+auXFUuDpkBmoLmWMmBqj+PHhdANWivxQvhmVulqcZs=;
 b=J2p2v0lUxp0qYru3RMrLf+RsYZll+vEGHabSJqxYFjwAvuXqAU55rfcTr9Hmj9LWa6evEJCcw3Audn66iNdWk9EXF1h9B89P3cEbzNmiIz6obmmG2fNZLnvDjjiXwCQHs5dd/Xqsj/eQ4ewLRItpKmFK8aZDbSiftAc9rCeyq5vCkeguuYlDXBEd1gCQ7pGwdN9M2AnV3Xt2ssKRieAhfN4F0iSevf1IwpeaZYKFOo8dci2st6z0sfDIBN7jXZuHvjxyL1koYe4z9beNW9Ark7anIXYsBVHIHEu40jFQ9d4D4Z73oZ7HSPWn2kRX03wjvFIbdoLl2xpZJwSafiuuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+auXFUuDpkBmoLmWMmBqj+PHhdANWivxQvhmVulqcZs=;
 b=nq/bFCqOcj/DYmtaFp1DV5MSq07cptntSKRaHEn+fZ+pZMYpMH/IHga+V37sRBpf8GeZFL5zb6iip/mzekTKL6J9GlMQkcm4z5Hxq+pTCwyU95IVCQ1NW1smxoeUnjo9VbYRWjr8BGR1d58/u2omXw3lBcXtlsw8PYDIkMNemJPJNvgqVY2MFiOtiIIErULhjlws8zUTealfYb0sZRvppmZqtfd6o9qGzMyiI8pnCzyrC53JUezdoD8EB2AZS3NKk4eQaNGx1jQqESu5UAHONlwHTUoKRJppGOnimmQUP138CEx76IJ9K0w/X/2CEoAMtCDd9ePuXdRh3N72o64aXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 19:47:57 +0000
Received: from BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::5d6d:e366:80f1:5c6]) by BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::5d6d:e366:80f1:5c6%3]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 19:47:57 +0000
Message-ID: <6caae8ed-fb8d-f6fa-e94d-5540d7a7acc6@nvidia.com>
Date: Thu, 3 Aug 2023 12:47:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] doc: uapi: Document dma-buf interop design &
 semantics
Content-Language: en-US
To: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
References: <20210905122742.86029-1-daniels@collabora.com>
 <20230803154908.105124-2-daniels@collabora.com>
From: James Jones <jajones@nvidia.com>
In-Reply-To: <20230803154908.105124-2-daniels@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::22) To BYAPR12MB2935.namprd12.prod.outlook.com
 (2603:10b6:a03:131::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2935:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b70cb5-51ff-4f8c-70b9-08db945a8920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0arJfSkRQjKkWccqjs1WumrplUdNURqGcYhYpgVqp7Zt08XXbt8E8CCmqJtf/YEGXBS343FW1hG0sk0zd6wqpAwwtmOgOxHrNBBIz5cEYTvZpbRVc2Icvd5FbfWR3Sw+O6ebIczltvbTtzK4UZHGkF6oE8vAyde7fVpUuYUsF9KgmFDVt3goSJi4qiVON+aXJCOxtM7sO/qNE/4RFe6vVqaPYCukz/qAco9p2pQw6IOKKfBnfRZ8kFv3WrBA7XdIyR4WFNEtv5Mpxnx0MyHVxtskHMT/ubiZkY0l6ltT5EQEwacQzpJj+t3Z97GuycVVkUV6cehKgr8yFw/SWdkxStbF8XDB1HJywS7vh9eGlPkOy0kLoT2XstNC9MU4ZdDxYaacI4wLkW2PjYBrvA8oARqpU9bx+9HOHpW512ngXyg4uWsEtvASGnMyqg/EBHhiB1JvUnGKlew/YLM7LN4NK87WafqHkSwl71yK1892lu90ZpmDv6YD4yIjwdH426s3M2GSROO2ySrIzhkgxnvQPV6sbJ+LJPD9x8wUJzRAvs8AhKta+Jn8UYwa3wMU2RmGZUI+Pn8DMZ+t3hT52GunqAMZ5bp4VjLUDzNHFLcNCurw02IgNN+qTM9zsCFlHLfmBGZ3RASBEfJ22Wf1kj+2iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2935.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(36756003)(86362001)(31696002)(31686004)(478600001)(38100700002)(41300700001)(2616005)(6506007)(26005)(186003)(53546011)(8676002)(8936002)(6512007)(6486002)(6666004)(316002)(4744005)(4326008)(66556008)(66476007)(5660300002)(2906002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b056M0FrUnJtZ2NUSTZNMjBZTmsvUVJMMEhMRkI0eXMrSUNJZXNNcjlFUm9k?=
 =?utf-8?B?Wm9ZRUtXeTQ3TzJ1RjFoeERmendJSnN6a3ZmalRUUytWYXl2VWlkOE14UWpl?=
 =?utf-8?B?L0NiZ2VsUlFjUHVLalp0SUhMdDNpMDZnY2RHYmozdC8zOWZ6WWRIODhGanJh?=
 =?utf-8?B?VUNqdVNFekJkT0duaDhKOFhWUHlreFFKNy84YnJRWVpjdzlhYW0ydTNYdG1v?=
 =?utf-8?B?ZzhKeUpJWFZET0NYN0RqVDB6b3YrcTVvdHkzVkE0K2hGTGJGMGhrYnlkcEdv?=
 =?utf-8?B?L094UHRCY1FRSEtQamNpRTJuc1hBeGcxWXhnQjc1Wk1ISERTUVFvTjNSSllZ?=
 =?utf-8?B?RUxvTFlDYUxveWluTlFtbzNXcWdrV0lEMFRoNEx6R0txU2g2dzl3Y0lxUDVj?=
 =?utf-8?B?dlA3V24xeUxhOCsyL2pxOUVOUTljdGVkeXJzcGEwNEI5VzdKT1NWNDRHSEhP?=
 =?utf-8?B?QTNRa2VHMStKd2VmbUVIRUk2K0tzenBDbzZkcFpIUGJicUdwTHlJeFZOWUVy?=
 =?utf-8?B?T2Y4eGREQ1NVbkJueE04b0lDaXNjTjQ5Q1BzN1lreFZkaUEyUlJOMHZIeW5R?=
 =?utf-8?B?NHJJNWlPVnN1SXZ5b2xoV2hGQVpyUlphZHVLQi9ETVA3aGt1bkg0S1ZZanV6?=
 =?utf-8?B?VUpTZVZKSnVSWklsc2VSL1ovMHUxdlc5d05oZnluTUMwMVlacjFwczVxbTdu?=
 =?utf-8?B?QkY4ZUdPWnR3RC9tcHUwNXpFZ1Q2ZzlPS0dUa2pxcUJ0Tzd2Q25seUcrTk1U?=
 =?utf-8?B?bHhiSGFESTVyaDFHeGJZYXlPNStCOHE5WUZURnRPd3Z2WW9vU1pCVDRtbncy?=
 =?utf-8?B?bXNtQngwajhJNEt0VVVCc2llQmdWbnMxazFIVTIyaHpQcXVUdFZ4ZVZlcVhu?=
 =?utf-8?B?Qm9rOE4wc1lSeFJHVjJtYksvUWFwajBqR2w2cDAvQzRxeGQ2ZldWREtsTUpC?=
 =?utf-8?B?ZzRoU0FmUTRsZmsrU2NObXRBbHI1dFozU3RqektVL3g1ZVNLN3ZQc1ZmSTBZ?=
 =?utf-8?B?TDZFL3VESnZhODU4ZlZyVXF5OEhxcnE3dThpSXN0LzhSMk8rZlIwVDVRZTh4?=
 =?utf-8?B?K1FmcVdTZWNxbG5xUVRoUFJSQ3pNc1M3T2U0NVNjSGVSakVXOUxMTjVIYith?=
 =?utf-8?B?OXVnRTczRlpjbm1tQmVsY0ZQUGVSTXVOb2wvQ21MWk9mVGZyZ1EwZEZOd2dT?=
 =?utf-8?B?NUlIbzVXNWEvOWF3LzZWUktxMVdEZ3VOM2J2WE1LMHdnL2tpRjYxY1FaMkV5?=
 =?utf-8?B?QnlMa1ZLRy9FRFZxc2JXQjZYWHRKZW44MXBiNk9jaGlhSzQvcE5ZUklubEEx?=
 =?utf-8?B?cWdjbGQ2VTdxcG1Rd2lFejVqRXNxdE03bVQzU0Q0dkNabVVGYVk1YW5BR01Y?=
 =?utf-8?B?YW5xZWIwL09ZekU1L2xwODg3TityWEQrRmFGYjQ2RkxVRE5oMUxtMFMxSjBu?=
 =?utf-8?B?ZmRvY1FZaDRLYjlsekVTeDhubFhTa0h5K0JHTEZVWWgrU2JVY2RabjMyck41?=
 =?utf-8?B?aHlhUytTR015dE5MR3ZmTUV0TUVmR0duVTQyZ3BMRjBseW9qeXl1c3pyQ1dv?=
 =?utf-8?B?UTdhbmZkOCtSTGMxSUw0SzZyYXVrV3BoMXJ6UUsxYlhYZzBLZ1VENGNGVTVB?=
 =?utf-8?B?ZTFSbmlZbDVxc240RVYrTVd2U2dsdWNVWGpjdjFDajg4MHk3dVBreElaUjkv?=
 =?utf-8?B?U0VPaFNmZllweVhjbUlGTHlqbzJMa3owYXJOaVFtaXE4cm9aTHF2ZXZkejUz?=
 =?utf-8?B?cWRWTU96aEN5RklxWS9OeStOYktuem9LNDNTUFNQQXVmeDRlR1JZNnZLMWVk?=
 =?utf-8?B?QjJmZ1hsODhrcFhrWXVUcFNDdDc0d0o3bXQ2T1ZhNVpsNFNib1YxNWFHR0cy?=
 =?utf-8?B?T25zVG83YnZ1eXIzMDBqR0NTWUhIUXZodUpPNHpCRXBuQjJUSTk4cnorS21z?=
 =?utf-8?B?TlYxNHNCaG1wUGY0R2h3THJNYTEvRElhQUo3dUwwNWJWc1VJeVg2WTJoc3ky?=
 =?utf-8?B?SGk0R3c1dTRWWDdhay95d2llalBXU2hhZnU5UUw3WlRKeUMzUjhKSnZHZzlq?=
 =?utf-8?B?NkhDMm94VENJTTI1WUpNamRQQWxlODBTN3BDdjRtMVRBMkNiVEFpdko1MUZT?=
 =?utf-8?Q?3lHzBnX9yk1uqYKlQgyGGXeSL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b70cb5-51ff-4f8c-70b9-08db945a8920
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2935.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 19:47:57.3918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gguIGC8LLC7dXZU22+jWjj2BuzGTHI15cV2buPRxVdmL5WiZU2SSyhU9vpwAGmIaw87s5hMTFwbpd+eyNNk4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/23 08:47, Daniel Stone wrote:
> Hi all,
> This is v2 to the linked patch series; thanks to everyone for reviewing
> the initial version. I've moved this out of a pure DRM scope and into
> the general userspace-API design section. Hopefully it helps others and
> answers a bunch of questions.

Again, thanks for writing this up. I think it is great to have all this 
knowledge collected in one place.

For the series:

Reviewed-by: James Jones <jajones@nvidia.com>

> I think it'd be great to have input/links/reflections from other
> subsystems as well here.

Agreed, though I'll reiterate my comment on the v1 series from a few 
years ago: I hope this can be merged relatively soon with additional 
documentation added in follow-up patches as needed. While you can always 
note more interactions, details, etc., everything here appears to be 
correct from my understanding and is strictly an improvement over the 
current lack of documentation.

Thanks,
-James

> Cheers,
> Daniel
> 
> 
