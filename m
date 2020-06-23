Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3223204904
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 07:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27A6E93C;
	Tue, 23 Jun 2020 05:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0A06E388;
 Tue, 23 Jun 2020 05:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSo0U00ubIKuAoC+EyaUscnu6fxjcZWPQQjRGctpM2x6iNTsYAJP3KWrv+6e/3z3cPil6Ib+xfoIOVYYDwZhRUUE5JJE6ADfD4BgHhRZKjeMhV2ThadfMVhrTvRnXbW/GXDbSI8N2iPQNEnkHcmskZ49klkhEp7Kl1ujwk9aQhhUJT85MTQPx/Gj27GnJjQhtGdtd9D4MnNYQu2HwdQMmarxDtzw0UQX/KyQEhtJKWQdsUTIz+hSChaMXXWrUbEckatxnIS6E6FPW1WkKlMNughtwQIZDfEyalaRh5c2Bz7IHC5LoPoKU2dUdxy4dMKZplPaIS+YAX5RidqOPi3xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRPUcgWyWVNkyyLsXNoEiU0XVgUCF3oIzhzkQUFtVzk=;
 b=gtx3Ka4PW54ycnvSZNL0Idf3AcTId7GApYXPtqn1KWVTJKKJwEoV5oaaqgW3iY7k0Nl+K6aFuIeeZYEQJV/fzhIKlm5yX56JK2SsjKgJnVwSiGUyTF5uGU+pDN+ISXhmgHOSVYVtqMCDRZBDQA4ugKZHuEMkEzDhXwPHh8CzpmN/iLpa/pdtqkpIrtLQjXfRFUmjyPLU77QqemDdUFYVDZYGQZaKecfCBG1Pa4jNwF3FyecX2bKj4kM0SGzRjivMNKmLV8fTJyyUSC7c2DrYrXmezX6+Qznhcexbz94TDUciJXesd7wkvbxn5EHHkLvJy2NQpdYxSGYlSJ+XwqdxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRPUcgWyWVNkyyLsXNoEiU0XVgUCF3oIzhzkQUFtVzk=;
 b=DI4TzAqckbAWvPu0vN6O4swRChV+o3bNd5Q8ttqzsbJCwU2rd650NOU5UW/0e8bNjszSRjnxUHweyW4tOfl0oB0sLxxEiKIthD1DAiEIjJt+PS/jdbtflu5Zn7NiNjMW3UWVuWvQvDw6aEZWEEmZc55tIZanzGrsIw+X7Cex7SQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3596.namprd12.prod.outlook.com (2603:10b6:5:3e::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23; Tue, 23 Jun 2020 05:14:49 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 05:14:49 +0000
Subject: Re: [PATCH v2 0/8] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094655.GC20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <a6e58cd8-8219-4997-fbbc-b68b0408cc49@amd.com>
Date: Tue, 23 Jun 2020 01:14:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622094655.GC20149@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0097.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::6) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
 (2607:fea8:3edf:49b0:6818:fffb:5b06:bef1) by
 YT1PR01CA0097.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 05:14:48 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 303ba8d8-9a43-4030-392f-08d817345a2a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3596:
X-Microsoft-Antispam-PRVS: <DM6PR12MB35964F1C5900046FE7A62905EA940@DM6PR12MB3596.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YuWaBlyyzcb/d4WrUhuJNePalaodWAY7/T5zGjNFePHVVOzgs/7GBOUekuJC3fcOHmwDsrl/5gTHs3jghDlkgmCK1aRRwSYIupvkHXpkrt8IqpLKoUUKTeKl5naW2Lmk6p477EZZWGOoNNmBrTzTGYV0PkEKRaKh3QEEMFkH8XZOdejzYFCZaBbVn9XAJQXtRbCqjIAhFQVF3XDvbbWQ90DVQFiKm8uOPuscU3+OKWC3eRz1Zkn+FCFKFT/w3QnVw+AVXL1ZIO4g8+aXIvXFZAmhhTW5UE3k/0pjxIqfpwhdTJSpz0pQNjmr/8spkiDJaxDLRPYVFDhihDRHyzjdEVkDIcvPVNipT0evoI/Ax1y5EUOj0SMdMu5RyCvH4iNF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(16526019)(66946007)(52116002)(186003)(8676002)(4326008)(53546011)(2616005)(8936002)(31696002)(4744005)(86362001)(5660300002)(83380400001)(6486002)(6916009)(31686004)(2906002)(66556008)(66476007)(478600001)(36756003)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IoluWrMQlLHGp1RlvPxF8XY2JApTC0uUnvxQdj57A7b7R9fG9w11AsXzgUqtAtrLmvfrEEQWOEhkBT+I1gbB31+0zvr6gMyqncZBmN+cPm29HjYB3BQgTr9Hhonrkkm7Egn9Klcx4/Ey26C6gg93z2JVNkziVyoDw7G5qOTbW135JIKSvtX7cOUePjdv68Hp0+PIi717Vl2tolUHo7x2s4pf0ZgVeY53G4ttcq6D3QnOWIcCv9uBLnRGg7VOpZXkYLvzuW0Y9/7/eOZs+2IkJqCNwaQj1YEsWrBAV5C1zP+n0D5JtS1CpPHDQaVAUMg8XrYcEhkO7MDd0NJPHpVZEkmGoY97bNPoJKkK9L/oR7ra1kEElykUDeqqcxpnrCoqgBkbZUlxbNSaI/RNTM6EMWokBCGbKBwfgR3Lb//5+LwqpoHPF4scEC5ec6aywr8jSxTju8zaRHzAjzS1ZkbgtPEkeupqlsf7RODmeYDKAuKTKxCsksk5rUOcM/xDLFTWpRLXwlyzXhH49BWXAlBElo10c/virf+FJSzjW5j0Oo5UZZYS51kmIn/GBDz3T7Yy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303ba8d8-9a43-4030-392f-08d817345a2a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 05:14:49.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QNjZL/WLXGw2rdmmHdXaY4lahxAmFJNdStv5lGMPk/KqDejj5rArQB8SmItTdnKeeYYyitgyL8DF/B8O7HNow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am fighting with Thunderbird to make limit a line to 80 chars but nothing 
helps. Any suggestions please.

Andrey

On 6/22/20 5:46 AM, Daniel Vetter wrote:
> Also a nit: Please tell your mailer to break long lines, it looks funny
> and inconsistent otherwise, at least in some of the mailers I use here :-/
> -Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
