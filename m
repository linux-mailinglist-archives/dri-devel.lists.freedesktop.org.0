Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A6782784
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A0210E0D6;
	Mon, 21 Aug 2023 11:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E110E0CD;
 Mon, 21 Aug 2023 11:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWZPk2Xc6NxTcrZrGsBRo5N0O7feyPoD0wlJ/Y6cGmEOpywRdg+5JI2QxQMIMkNEQTBdjbm/010JjujAJHN3DEdgHsPcoY9KrzqZiZo6WHm8Q1R2HtE3PUIK0/sWUlW5rEkhmkHVcfOKRGIfCoKyrqGnregfOTU5JuV+Jy5ym5j4PZAc5BYESquwPeAPppR0Zd/QbelVQmxRLGVQhVSiozMrJdIwmDHL0PiIc6JoC/QvGf69tPW/zVlPzx5L9ZuhtqzHFUe9OjeRTo9qxZbZ9ZO1pLpa9dICKHwLwZiz9iKOzXqt+a1E9CKM+TlXsSR7AADM/enQn9v5/MQn0c6XOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sWZDdytvscZI/TINFn6ssHpiObOGprh0CEGQHJd60g=;
 b=OQ2syjx1Icd0mGAGs++ZlClEZR+83rh9UFh5mUsLmJub2+H8M85g8lcPyUInL2R37KnaB++S6nP9BU4GNrbTvNI0sImatKkSbiOTZZrGGm3GrqJK8Zjb1UXzuS4Nq5Mz0phs8K4n7+Cky8ACq+n9wZHyvYkyem17Zi79oNzPz7aXYQ1ek9HOg+7MeMli5Q5savbHvfQzG/4N6zGbQEXqrDU/cfssagUdIaA6TY6d8eL5Z781/xkNQx00BY4nfZxlD0vBxkZsg5j3/JoqCa4mg+B1l34CFVb3tB5Y1/00Q5CoPYsVN/b7VRZ7WOBX7sNNey4ySy8TdryN7Aru6tVXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sWZDdytvscZI/TINFn6ssHpiObOGprh0CEGQHJd60g=;
 b=MyQmHitCu8hfxNQpKIuY8WeqTFvxZb9LUSIlwjd/bPeHO36f6OUzJ0dtogR9S3QH0gkkN+I9IIUYr5lZ8I1a0gHLKZ5J/6Eh3UxYmWVMy5GX9BCbipcGqflmAJKiBhq+ClCoHzbkNdkKQPRZ6Cfj/lH6CqblwkLzVm6Q7O+FEH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 11:03:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 11:03:53 +0000
Message-ID: <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Date: Mon, 21 Aug 2023 13:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the
 end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Arunpravin.PaneerSelvam@amd.com, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fb0332-b0b0-4246-c9c8-08dba2364e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WK41t8C7mQnv3P1ooMZfOFh8TFNPjCGfOhO9vkSfGSaJTYlGv01sabrQqHMwfjIVafRW3GHtjl/UMmfDorfUKeHdkpeWxQAOwjnORpitHrjFOuOrOuEIhLymPicg+YKEcFQAoorSYs/TbLjhSJt+kSBgwK73qw3gsQB88V/YpRADJ06bYn2kf5+CrzNIXTsF7U1bqqZ7BiYvgQvPgd3BWscePvvYBo+JKES071ZKUvYZlbhs+b+Z8V0X+6S6l6PFjgwHBbXAxMjWTT0M/FU6d+u/k6iHQ0wwVBUE2j4/JxdnYP0Qa7hSapPlxtDr2ZofKqbpKwIeAYVz5v8uaLzqqwcwIEs2cE2C7GWQN51bMy66Y2ymajrnAK9WYkJSpNJeMmuqKeEx0W8JJnKczTs5FnqdDD6TAqyl5tOsEqa96BJQW8BJHexldhivuTgouZjgic4pjiNV/YuSUMqEYwUT6UWHib15s1Bz+RgnyrdiYa4oH4TQkyFYahegHnvdX0gLOKm6pilRylKKnueLJyczmGFRGEq8ZBi4D1xjnN62fPyuk7ZPe2ucDMlBFTRaKZzSvoZ8QleC9EhrvhDULxoZR/031eiGpyhqo4AarEjhB8KX6pCQMl2+19Ux2aNGGjZ4BjbZ6h1sX86VobriLTPJkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(6636002)(66476007)(66556008)(66946007)(6512007)(316002)(110136005)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(4744005)(2906002)(83380400001)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhTdTNBQisrN25ITjN6ZjlWcWdmN3JkOWVxMkl3dXhGQkR4clRrTngrMm1Y?=
 =?utf-8?B?TkZNTlhhL04wTm5jVnR5ZTNTcC9TS3lrUm1hTlR5NTE3MEVncjhqZ2tkTXhy?=
 =?utf-8?B?OEZ0N2lEb093dkRrTFVVUjQzQXRKeDhtTGZUcFQzMktYL0Rod2tDZ0hzOTJ2?=
 =?utf-8?B?ZFJRbU9LWEQ5bG9lVEptcEhRbzk0R1dRZEp3Nkg4Q3lOZVNubjltOEhRQWYv?=
 =?utf-8?B?WEVtWmJQZ053NnlRRmMzNmpKYzl0Q3JDeU41TnpsUjNjdG9uL1NmbkVRbk5M?=
 =?utf-8?B?OExDK0tiL1piVVBqSm83VHE3MkFIUzRabGlPSDJKRVo0MG4vQ09Qc0k1L1dr?=
 =?utf-8?B?Y3QvU2RzMUo5dlMxNHI3d1pqVkN5dytjUUhidlFMOVFvcWV1V3RmamlnKzRP?=
 =?utf-8?B?K1BBTVZLc01YZVljRERrcW5aK1JWUlpKWGFUUVFCSnF2L1dPYTFtVXZzUHVu?=
 =?utf-8?B?OURpWHhLZ2hUd3dRelhyajBMNGc1SDA5RmJMVVhxVERPY3lFckthdFhMRVRC?=
 =?utf-8?B?THB2aHQ0SjhneTZxa3ZpU05hQm9VVjFwcTFRYm1tSGI1MithV0Fpd1JrTTJ5?=
 =?utf-8?B?SERuWmgzRXhZTjRxTk1BZUk2eDR5VHFqNEJicDdBSWVPV2RHSVRKNTZlQkx5?=
 =?utf-8?B?UU1XTkIyNkJ5c1o4YlVtWWtPbEdTNDd6OFA4U2dMNUYrUDVJTmRja0dJdC9j?=
 =?utf-8?B?Wk16dXhoNEI5RTZ2dE41bVh2L2JobEFtbENzdG5WOXN0Ulp6QWU1WWdwNmNJ?=
 =?utf-8?B?bnBRZlFRM1dKaFFaV0pQWW1vby9BcnhaNVAzZ1h4ZFIvV1lsL2toNEZJbmlQ?=
 =?utf-8?B?REhCS3p6eGtHSk8yd3hUTUZQTUtQRDgvaXQ1TCtsVVVjVU9GNWJ2ZlNjblUx?=
 =?utf-8?B?ZGFyNVFyNSsxdVNkdzdsNW5HK05KZ0Uzazl4L3BhUXBoWndzeWFRcTA5WkxJ?=
 =?utf-8?B?SlRkTEsxNmw3MkZlRll0VjRibzh4WkYrQWY4ZTB1ejBtL1hBOTBxbXo5R2Qz?=
 =?utf-8?B?eUpzcjFabllHOGpYTjh5ZlZqcnNLZTVXSHRkMHRvQ01ReXlCdk03VFIrS1Np?=
 =?utf-8?B?RFJTWVNPZmxza2NGZDllWmxnbmtrL1hSYWU4KzdMcVFPOHlUS2h3a2NTNFB4?=
 =?utf-8?B?LzBKMGhZclRqRXhsbHdvVWxUSFMySThOWXo1RHI2UzdwWTBOS1FZRUtXNThx?=
 =?utf-8?B?QzNHOTBZUHV4b3N4VlBFMGI2c040YUE3VlorOStCT2ovQndacXlOM2M5TW5U?=
 =?utf-8?B?c29jZVMyc1dwYmIxYVM4a1FCWGZBek1OM3hQNm5FZEh0Mmt3dGhHS3ZLSldV?=
 =?utf-8?B?TmFhVkxzQWRqejBnTS9oRWlzZU0rV291TCs4MlUyZnFuaDQzWlpFd0FQYUND?=
 =?utf-8?B?MGpnUkRlOUVGMzR5U0V0Y09CVXcybEtGZkUrMlVteGZhc3ZHblZTVXYrZEk0?=
 =?utf-8?B?Znk2c1Q4OGxra3hBd0IzQ0ViSTFFQk5kODhieGpjM2xtbEhodVByQlRQeDZO?=
 =?utf-8?B?S003cG5jKzlGbjhOcFNaYlFYaEswYk9SdkZuUWRLdG1PbWxXb0JOb1FBdThp?=
 =?utf-8?B?Sm9pK0llWGloNndwVzlOL0d1TXI5QnVJSmwwVHQ0czBwblRNUkIrdG04bTRt?=
 =?utf-8?B?Qi9RV2RnNlVkSFRlaEVra2RDRDZRaDZIQTl3Q1A0NHptdUtBbTgxNXA1dks4?=
 =?utf-8?B?dGZmS1F1dTBTMHY1cUw0WUVUZVhCeW9LQW5TSENxSWRQMUpDSnpXRGdqaStT?=
 =?utf-8?B?azZJeUJMQjVGM0Q1Vk9rNTdDVDV5NWRKYkhWaVovTXZ3WWZWVWM0dmE2alFG?=
 =?utf-8?B?MDdwREs1bGptNEZDTGFKTHRoaFkrV2FISzd1a2lvc2t2Q1d0bWhCMFdudENu?=
 =?utf-8?B?dVpURGp3ZkJUMXhrSy8wSVJPL1ZNLzA3MFQyR24xZEV2WjAxWTNNV2hMaklT?=
 =?utf-8?B?ODhLdkNlYU1Pa2IzVk14eUMzd2I5Q3VsbDEvQW9BVC9SZTBWVFJhWlpaUEtU?=
 =?utf-8?B?b2VrN2lWZ0lvSEJUMFFYbit2VExJVVJjYTlGaU5FN3JLeUNtZmc3YnQvS0RN?=
 =?utf-8?B?bnFubEVCVE1OMEtwS2lLeDlUTDVrQklLOS9RK1psYld6Q09SWDNtOE1yU01t?=
 =?utf-8?Q?LVgs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fb0332-b0b0-4246-c9c8-08dba2364e80
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 11:03:53.5521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t61k+TyhndvPozvQZBSIPU0rQrRmv0r+TM5O7+xBBXJ9QeMEIn15yl+c2C0rGQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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
Cc: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.08.23 um 11:51 schrieb Christophe JAILLET:
> This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
> amdgpu_bo_list'.

Oh, yes please. That's something I always wanted to cleanup as well.

> It is compile tested only.

That bothers me a bit. Arun, Vitaly, Shashank can anybody with time run 
a quick test on this? Preferable the IGT tests, but this just some game 
should probably do as well.

Apart from that looks good to me,
Christian.

>
> Christophe JAILLET (4):
>    drm/amdgpu: Explicitly add a flexible array at the end of 'struct
>      amdgpu_bo_list'
>    drm/amdgpu: Remove a redundant sanity check
>    drm/amdgpu: Remove amdgpu_bo_list_array_entry()
>    drm/amdgpu: Use kvzalloc() to simplify code
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
>   2 files changed, 8 insertions(+), 25 deletions(-)
>

