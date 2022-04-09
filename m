Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE64FA8EE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 16:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A17710E46B;
	Sat,  9 Apr 2022 14:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1C510E46B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 14:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VK8YwXrYz/SL/kpmxEnUqtBIIW2kYfRh9dXlJdxleni9+UJvVz7pOCK1g+NGDmGZRGSDrF1D/YEUu6ffbzRZlkjlywyY+z6f8nmre6NZM7mKfBkI8CSjwJvxpE9IFokDFEJvQOme6FiY5/e7dMjGD89W5G2Qs7PG08xamp2hVxTfuGYHAJChcYJT2uCh3Rh4AdV7dy8JPQMMorRHaH6O3+ymDwQkwtqDeZc2WWNgEcnRLxTvWRaDkJb3aHb6IR27muJj4t+96N6ZBG1a0lqI12hJ+130uZegdP2PTlwLuluiNSnUtTQY0JWEuAzxrE/d2T3I92YssgLCTEXyg9Yhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRyRjtgjvlQX4TweiOIsYJ/HZkPGWtnaJwAYUufePn8=;
 b=MhBkrR7XmrnMXlo4Qpzh8IiIB0tl0M4XKny6ogBwqOPSyh3BU0X0iwsvaib5uUHLIT6N0lSi2hmSpSi8jKPE49+yncSg4YLi6viaKsWxIpXDle0PRsMPoVTTaQypE2NU/HcTsfv33eO0DTnn7stYqbf/2yHAYYF3iABhv/HC7i33u834AJhIHwM192K767ozI78/rBdzn2K3ifF0TFqn/kdJMDxPZi6hPHahsOerYR1EbbCQjPMJVtlI/+Dhzx2H5Pqmv4rkojAyi4OYor6Rn6KxX6qV2SXgSshC99cXAUfWBIC/F6PZX/2t1MnGs1dnQiih9WpDpOXcaPQgXS6qkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRyRjtgjvlQX4TweiOIsYJ/HZkPGWtnaJwAYUufePn8=;
 b=vQRBqS5A2nMGY0HQ9TrTb/5FLtS6/fD4f5XdDl3fhW+s7ezybbtaVuFETaJ8d2PWe8LufqM226mKYrDL+nvi0YN/F9wEg4z5piQ7v8bGq7Q+ojE8ZYLokfVABYQ7082gx6/oPCxZuv+7xzZpbenVJk3+jXKDPS/pKCuMn+ZFD7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4893.namprd12.prod.outlook.com (2603:10b6:5:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sat, 9 Apr
 2022 14:25:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.027; Sat, 9 Apr 2022
 14:25:20 +0000
Message-ID: <694e5499-c9da-d150-6389-5465a85d12cc@amd.com>
Date: Sat, 9 Apr 2022 16:25:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: ttm_bo_move_sync_cleanup() issue
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <CAM0jSHO0NF-U-vxAHUnxp_JERQrywdD713n+G3bVuCBVqax3kQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHO0NF-U-vxAHUnxp_JERQrywdD713n+G3bVuCBVqax3kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0057.eurprd06.prod.outlook.com
 (2603:10a6:206::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b0fe55a-8fdc-4de8-ada5-08da1a34c6a8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4893:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4893A37F20BB3EFFB226895483E89@DM6PR12MB4893.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4A5nsoI+rLlVVFMxN5wC7fizcovuXGU03it+KjpHS87MMhWx6z3J7t7uX7vXidlGN46k3d5v6xsawwKi6JJDL1BGu+UWXukFkz9PCu6FXW6Ayt6SsWP4VqQ3DPviLPk5JE6EZysl/WuNCNEDqUmQQxg1PcuHgNAra0+FSj/hZUFItQGnrGwDPp1Iuzbtga8ktJU0WFLcn1VOwOPl4/v8eJdFBFwlo7dqru2QIchtaD24WT2uAlPDX19J+1rjU08xsCFUimCVy1KuCwOsFPgFtbbBHSFG971gv9D831FgzgpGe2pvKulxD+JZr+aAuKLEY7Z39TYI8lgdlU7R89/qWHeuaU5Qrts5YoQycciECEhDWK7AoJnn7efxxB3rsVyjy/YecsUK3tV+ZQgKnIKDQQBxmsSuzWOb/QzR/1vA/c6aPSXh9C8qRHV2axO5KR6BYrFVEt15xkdEipKC/kdyIvXPDe4jMqjRZmKfu9JUg3reHyigofS0d69Fxswa0Gaa2TGsiPyw3NviPwHY9pCDBHkN2s/bULByi6y5j642REZIJTUAizApjRNnLyw98uqCFRFLAFKqtbxsFdul3zmIlH+lCPn01aJesj1hMwJuM7uBMx4zRfLV1Dsy0khF62edpaxRZpdFazOmrj8gp/tlnwcbD1JoaVPA/nPCSTPXJD8nibo5qtRMr9yyOt5dZUV4h7upDy6h+ohKpdZ2SDTbopFxAd87cDaDFwAJMox1qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(316002)(66946007)(66556008)(38100700002)(4326008)(8676002)(66476007)(86362001)(4744005)(31696002)(110136005)(8936002)(5660300002)(508600001)(6486002)(6512007)(31686004)(6506007)(36756003)(2616005)(186003)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBLV2lIV05udmIxRHhkb2lsV2FaMnZjZjcvbGY0VHJhU29wK2UzekNxRkdw?=
 =?utf-8?B?eTN4ZjRzN0FUb1ZzUXM0Z0tkckFQREVwSjh4WUFYL21wTk5OUCtNa2ovYlJF?=
 =?utf-8?B?Y0ZIMkVzYXcwMmIyTjJqc1dPRHcrV1RGZ2JNeW00SW41SjV0NEpCZWRLSlU1?=
 =?utf-8?B?RGRnemxTaGxOaW5ucEpVV0JUTkxuNGw5Q1ExTFdjTUp6WFRxK1BWV2MwNjY4?=
 =?utf-8?B?MXBvdkZKZWpQOXgxdkZUUmx2QUhQS1ZlelRWZytnSTN0VVZhZUNtU29TR0RI?=
 =?utf-8?B?TTlrK2dOSHhvTGZ4SisraTUwenBwWDRkRG1jRG9KYUZ6MHlJRDk0WHBNaXlj?=
 =?utf-8?B?bWgzM0pjKzYydHE2M0FUUU52UGhadlZTZ2VBaGVIZkd3MktuRUU1dEs5SEU3?=
 =?utf-8?B?aTcxNi9MOS9xSGw3UEcrN0dSR2xFTHhyaHc5ZmVtN2RCZkorSlorblJXM3RY?=
 =?utf-8?B?SHdWVFUxOVRoSngrbWtFekRFRG9PcFRxb0kwQUVYRHJzYmJUOHVKbFEwSzBR?=
 =?utf-8?B?anorYm5ISEtVTmpoWFVCQm81eWd3K3JIRFlUL2p1d1F1YjBHSm1xVklSdEly?=
 =?utf-8?B?b2l2QUtIc1UvTEU4ZFplRVRqbmZFMW5GTGhmUElORW1JbUVmRmdWK0t3dzhH?=
 =?utf-8?B?MHFPSkp0U1NYdVFoUnFKUzR6N2p5RkpFejJxMDN2cndiWHYyc3FNSGN5Z3My?=
 =?utf-8?B?bXVKelZwRDRyanBvNHl3dE5ITU1RbFpCUGNQN3FEbDd2eU9PYXg4YmZQQzcx?=
 =?utf-8?B?M3ZmS3lsY3VReTJZNlJKa0ZqaEJ5U0gxQWIxL2xoUmdXaVhBbFdia2o2L1hY?=
 =?utf-8?B?cmpUU2JldkZDSlMxbHpHT2Z6Q3g4QmZDWVdGK2dKaXVlQ3p4STllaXljMDA2?=
 =?utf-8?B?ZHVaOEFkUU9WanBnemRQaHpNSkREMHhVSG8xUzhSbkxKb0dhd3h5czdVekZU?=
 =?utf-8?B?cUtNUlBFbHI4bENaQSs1YVY2OEt6eURFL0ZaQ3ZSZnlRSFFOYXEzeWY3eEVG?=
 =?utf-8?B?ZGRaS29nZVNJM0owRTdDK1lka2NDbEZ3emVBc2xpQ1VEZDc0akZ0YnNEdHN5?=
 =?utf-8?B?OXpSQU5oRnlteUVKYUdLUnBQQzViZi9OS2tYalVkbXBUM3lXaVNSY2FBRG03?=
 =?utf-8?B?ZzUwRUZObktHUGRFK3R3MlRoOEZjcktNckJBR2wyVjVYT2tNeGpHcWxGVXZE?=
 =?utf-8?B?ODNOb3hMNFRJUkgrM0wrV2VQeGRvamtyYjQzVzMwSVIxNk9PbkpXc09hNUJs?=
 =?utf-8?B?MkczS3hnZm5qMTBSWE5yVkNSUk9YSWtnOFN2Ujc3QnY4b0hZNDByMVNvOXVy?=
 =?utf-8?B?L0o2MTI2UWpxaXc2bHJoZWhmSzhoaHdyZmVudWJOQ2ZXMUZmVUZsUzFmNjQ5?=
 =?utf-8?B?UjJXNDBheWVneVpjMGJON3ZPbGdwWDV5OWZKMGFNUGxYMmtVRGVPeXUwVTUr?=
 =?utf-8?B?RWZNQWk3MDA2Q0d4Y1R6WTMxaVNkcFhUc0dUeGRLWFl3d1g3ZVZqMTY0RUcz?=
 =?utf-8?B?aTFwWTFjZno4bkNNRXNwYmJYSG05OGwvdXJ0T0VWVEY5MFM1UjcySGU0WkFI?=
 =?utf-8?B?clUvUjF1ZW15ZGNkb3RSWUNNclQvTnNoWDdkTlVRTzllK21Tc0RHM0hmK2pM?=
 =?utf-8?B?VW5LeGJsYkdKaFlQdTJYYXMvMHhRTHVrYXN2NGZBUWkvNENCa3UvWFFjT1NJ?=
 =?utf-8?B?ZjZiZjRhTUhEZm9ualFtTUlZY1g0RmNLenZRRTZiNTJLbHBQMExadUkybm9j?=
 =?utf-8?B?Zi9YZVlIN3lkcy9yaTBwbDg3NDQ2c3N1UDk4TFNWR1hwK2l4bEZ3TjlFQzZL?=
 =?utf-8?B?ZU40QVVoT2Iyb1ZNYnI2WklNa2NwcktRbng5WUluRVJ2L1U2N09UTGJkdzll?=
 =?utf-8?B?eHR0ekk2b0VJVWUrODUxODltcmwyWjhCZHA0SHJ0UWpBSUF2WnVYci9wWGF3?=
 =?utf-8?B?aVFwM1dteWoxZUtlWDFodTRlcnVaMTVCeWVmbVJrSnpXcDhEMlh3SGdiUTdD?=
 =?utf-8?B?L0RjRFdPSHFGbENvdmFWT212VGt4TGwzdE9VdkQ1QW9kNGRieHhLNm9uNVlM?=
 =?utf-8?B?dUhmcXBwVHZlL09UT2xuVnc4WEFrUVczWVVuR0xsWjNIaVd4MzUzdk4rZjc1?=
 =?utf-8?B?ZVpFc2J6WlFLQlprRTdoUG5aM1RLRzdINDdVOWVuYlJoeERoelo0R2lsSFBV?=
 =?utf-8?B?cCs4R3lCb3g4VlY0Tm1nUDlBdEFsRmNXUG9XQTAzMEhmR0ZySjBHRGFxb0JI?=
 =?utf-8?B?RTNRdEhxcklJb3JRS0xoc3IvUUY2NzF3aFdnb0g5aWgvNllydmRLaWRGVGdj?=
 =?utf-8?B?OWhjaEJtc0JWenlMT0FibGpnVkpFcFUxS2d4ZjBjeE56L2sxL0VJMXB1Mm85?=
 =?utf-8?Q?jcfnYw4eMRk+0AyKjY9tCMcfK60yHwRwD80G6hwg5yUoN?=
X-MS-Exchange-AntiSpam-MessageData-1: NtnHuYKXFS3z7w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0fe55a-8fdc-4de8-ada5-08da1a34c6a8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 14:25:20.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvL0UeR2k8WnEFFRw665lQsu8Mzv5Mta3pNGBdrJ2Z4JlJBS6csVYI6aDVL7vMkx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4893
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 18:01 schrieb Matthew Auld:
> Hi Christian,
>
> We seem to be hitting a new issue in ttm_bo_move_sync_cleanup(), due
> to passing a NULL fence, and I guess with some recent changes this is
> now blowing up in at least dma_resv_add_fence(). Question is how
> should we handle this? Should we add a special case in
> ttm_bo_move_accel_cleanup() in case of NULL fence, and then maybe just
> always call ttm_bo_wait_free_node() and also skip the add_fence? Or
> maybe this case should rather be moved into the driver, and handled
> with something along the lines of ttm_bo_move_null()? Any thoughts
> here?

Ah, crap I though I've catched all cases where somebody wants to insert 
a NULL fence into the dma_resv object.

For the short term we should probably do as you suggested, e.g. always 
use ttm_bo_wait_free_node().

In the long term we should just completely nuke ttm_bo_wait_free_node() 
and directly cleanup properly here.

Regards,
Christian.
