Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7FE25F593
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4276E3EB;
	Mon,  7 Sep 2020 08:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422F6E3E3;
 Mon,  7 Sep 2020 08:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYFTornnSmTTp8AOtY/2XZLzcDJjMbpXA8E1Ymb9Os+kdpBQ33T5AwFzk56z2L5xmMQN2d6Qw8Q9yqxmRIUr8GchFcHctBHfNPj1hi+gImdddKJXIGypHVQoIAuy2KcQvI7YuNDdmVP+7j9JygkOstC4aMOZwZhKZ9K7qDvK+XaxZN0ZmbKqGne/6pxIIkoTTv3lWS5ZT7vlOROfUFtaJI+QdBFm1TlT30hAUe1/DzcmW8N0EtyQt+SacTAA8SlJOZ4MrX7m2rzxKiwq3HaVJ/nmLtkKgtI9Arg52BAts7LtF849oP+oxmSUsx0qNOz2XkwIwijB1+SNjRVwKfXKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYKzfmtAgNJYEv9UMZTABVfq+W4BpTGw+V6fmG2FxAo=;
 b=lXZw3huTwyoXg/KbEgNTFXHUdJOXFN2ug9vIRYvr6OQPKREWiBBkS5WtDJW+9AX8dD7JiuSzCO8/1p8zAm1EUCEuVYB/vj508sfXOiXRh7cm9tn/zM1pLJs9QLhYVXjjJdZtxmFkskef4aJND/xKEBRSIxIS/TOKNRk4wNN3VB8YkbgQP1Mh06nlyUYKhAjENXoNk7f9wYODP2vW1BjJq3R7P/f8iDII/72nrnKud9+EgRnn87l+Zx4wAdmk7GTkn1XzKUf17Ph89MN1MhDvcSFVfYLalxzuQqOq178Ohyaatpq02ogR/tqsPSH3g2POFHaZV0x516Rt/GNqKtruNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYKzfmtAgNJYEv9UMZTABVfq+W4BpTGw+V6fmG2FxAo=;
 b=SH4Fhd7oIK1Jv6hlhqOZb/2wrxcQ66tM5Lh9ojyDnMhrU2z6QOHHdLYdiqyBv3ZnwHQt3daKLUIkc8hI1nax5nW7ECpkqs469YyydWzxMETd/IuyA/U6x6Ew/g9vI88mesAYUOcIZgU5dmL+ni2kyEOPYqms/PeLakAdXywnJnw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3113.namprd12.prod.outlook.com (2603:10b6:5:11b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Mon, 7 Sep
 2020 08:44:33 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d85e:c081:c3d:9db3]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d85e:c081:c3d:9db3%4]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:44:33 +0000
Subject: Re: [PATCH v2 04/11] drm/fourcc: Add AMD DRM modifiers.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, amd-gfx@lists.freedesktop.org
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
 <20200904160709.123970-5-bas@basnieuwenhuizen.nl>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <290218db-ffbe-0ae7-5a35-33e95d0581c8@amd.com>
Date: Mon, 7 Sep 2020 10:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200904160709.123970-5-bas@basnieuwenhuizen.nl>
Content-Language: fr
X-ClientProxiedBy: PR3P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::31) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.218] (109.190.135.109) by
 PR3P193CA0056.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Mon, 7 Sep 2020 08:44:31 +0000
X-Originating-IP: [109.190.135.109]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6045a960-77b9-4d1a-1e34-08d8530a3e5b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3113E8CA65A440A3C8985B548D280@DM6PR12MB3113.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiOknHD9OhoAecMv3jJEgYUoUqgD/91klJNW4liTImuu75ZePZ2OssGADyAjJBq3tAfHP3Xl7A+iB1ileCQQvzDdrpBPo+PWuLpXNmgwGtuJdegkWPTFUcZLdCQr2wO5u2eOOm9vOSFY2QoJelEByjiSzhF0VNsY+UmrJbxjNf4KZ8YaDIlL0K3aAD36TlwFL3LGGDWnwCzYAsu45K/SSvbUNbzGK3rPlGEiHoqD6FONiNe6JqdkFuYnSqi5eRahRfix/nCHFOkqwx2+uJccvQ9JtmdMNq8aXSZHUuwThbyovb2HYVABeTa3pc3NkFbp6wcQcVZ2kzT1eWbVBf33zY1nC8ZIJEOJ5//ddU6wU0vq2Zf6z4ADomys9NOTwl7a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(6486002)(8936002)(5660300002)(86362001)(36756003)(4326008)(16576012)(53546011)(55236004)(2906002)(6666004)(316002)(66946007)(26005)(186003)(52116002)(31696002)(478600001)(8676002)(31686004)(16526019)(956004)(2616005)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wLJNARR60ygAnQX2hU8r1h+NCdnXWpm/IxuUTlaT8bwRzSgGKfIOWpo6D4vOUwPR+PhNYtB7JeMuMyPuZoZXpqeSU2nSDE1ue4TjUbSkX5A1Plqe0c4GiVtVyLfKe/5COIF3+/20TnY/Q5kIh3RczFvQ7eBNUuHUchw74msCLGQkxQCn1ENY6U2hVYzf5cWGVt8mBXY7ytHWq0Qz24+dQCsymA8I2JhjIs6hXx0DwGd3M86FC/k1sPx1BWzS/j3t+BFlYCupm6BdBa5jovsjJnErt5DAI3w0DXFlA10IsovG4IAP29MRrhtSs1VmamXgOpvGGCYV/KusNRalGbJPI0fUlkDISCBL0fuloqm/1WcwvprlPeWw4MpyI+exBKr2+XEWGMLbygtIk0yWRWtm8ewdlnflyaKNgWMjGaQE/4QFh/AFE3azNkCLJFUzxhrqS4umYsry5/LvYD2i2Wkx3/EqXJoyji1oCGElnHC3hGNqv9s9Il1E7e/cTqkT9eYtFL/lbaOq6Nj+QJ48yX+k0TS9Fgaqhh4Np7ZcK7IXeQSaHjP6tOGgcYc7JcXrGyLYYwWS5n5bHFXBCBCS4NTG194xilt+RFqyGsYTKEYefWCU+JRyJh2QEfbL4kyUEEc2raDXhLc/ER0GZRV+Fx4hew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6045a960-77b9-4d1a-1e34-08d8530a3e5b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 08:44:33.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtdzaKmrX54V5uUdoyhJw3xTnQd08lBbJkTyZcArO47ZqNC4rgYla+Jb1eKhEql5tk1GBuSL0YPLXB++JVMM2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3113
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bas,

2 small typos you may want to fix:

On 04/09/2020 18:07, Bas Nieuwenhuizen wrote:
> This adds modifiers for GFX9+ AMD GPUs.
> 
> As the modifiers need a lot of parameters I split things out in
> getters and setters.
>   - Advantage: simplifies the code a lot
>   - Disadvantage: Makes it harder to check that you're setting all
>                   the required fields.
> 
> The tiling modes seem to change every generatio, but the structure

"generatio" -> "generation"

> of what each tiling mode is good for stays really similar. As such
> the core of the modifier is
>  - the tiling mode
>  - a version. Not explicitly a GPU generation, but splitting out
>    a new set of tiling equations.

[...]
> + * with DCC & DCC_RETILE:
> + *   - main surface in plane 0
> + *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
> + *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
> + *
> + * For multi-plane formats the above surfaces get merged into one plane for
> + * each for format plane, based on the required alignment only.

"for each for format plane" => "for each format plane"?


Pierre-Eric

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
