Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF621B5E91
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53C89C6A;
	Thu, 23 Apr 2020 15:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534D89C6A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkTpic1xOBvHXzvYS4b7gYzs10WZ6bE8Q1jsVWlEbo9dZa3xBnZn39faAUPTUKbIs5j0mP1ms8vcJPLmnFaz9KRwv2tzExGceS/zuTm5fUr2pWMt0mrkWSrmQLNyetkluMoyPxcJPld0Q1v1tCBvksvYlNnXg6yjDYJmYm5VMZCB43RCb9YrBhE5sN1Fs3UYRyMoUpkZ0zEvPbWGvN2yAb8UxKHphzHzDt7kTwWVfZpgWA1J36f42lJpfhNqmJjqHDaUWJf8ii0bPodNM/M/w5/K22RAPFrBnw8+WvnYOrsp/q4gEFafHAiyvRtyRyYeqYCDotrPgRhXYtHVUfMmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcJdeK/yvT3Uhxm21U6TsBbb9jvoRtP5To4vzMnKvCg=;
 b=OTSIqAP7fnR5BdJFe04BAPiO8+5rAlMStvGyey6oP32Z7Eaa9kKFtycESrHVrZuxss8z1F6xS5nhL45lgAyySYDA6d2/KkGZP3ZSF1IblNG+pzCFY7pjB3Gme5G5mofYE10it5R6E2qVLXEqQRVvMAaR/0bvsFcyREACKPheyL7DQLBbXD7Qb0xNoyj+v3BkVfzyyqgQn40pnQQAz9lOrxxeH5Fb9ieG/cAu5KYaLSXejyYhlJLCFXkjVL+vMF4uIibMA+565p/IBctwvboQMdmKzHOA4PYAjX5gMyk0DfZydjrurRlzRNld9w0lHvjaEo5LKSW4rMCd+ntvaL0ChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcJdeK/yvT3Uhxm21U6TsBbb9jvoRtP5To4vzMnKvCg=;
 b=LHFnQrF5/hPRRoexq+PvseMoSSnymgb/XL/MPF25U1G583AG+zoThUTUYUlQonGm2XNk7xPWxviPtIOPUzdzR3gT+J/dcBjqflLEExyNjygPMYt88IOymnhNjJ3ylJfi5PCmKWIifaWQMdT8WgZ0wzQ+KdVVxVUHsxIlTxEGnFg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4546.namprd12.prod.outlook.com (2603:10b6:5:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 23 Apr
 2020 15:04:38 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.033; Thu, 23 Apr 2020
 15:04:38 +0000
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c592baa1-7e0f-688e-1e31-bb7c8c28d8fa@amd.com>
Date: Thu, 23 Apr 2020 17:04:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0058.eurprd07.prod.outlook.com
 (2603:10a6:207:4::16) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:207:4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.10 via Frontend Transport; Thu, 23 Apr 2020 15:04:36 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8d690b8-c07d-464c-d5e2-08d7e797a446
X-MS-TrafficTypeDiagnostic: DM6PR12MB4546:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4546F10F28FC7F7F1300CE2883D30@DM6PR12MB4546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(31686004)(186003)(6666004)(8936002)(478600001)(8676002)(81156014)(5660300002)(36756003)(6486002)(110136005)(66556008)(66946007)(316002)(31696002)(2616005)(16526019)(2906002)(66476007)(86362001)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2KDeyeUKvZqIqGCjysYnb3qACOB9+/wxr49OxxqsqqJ5kbr4FofI97kXKFRP1XOqzIiH4V2r9CCQ/oIiX1qtnKEyRUe1x/j5Br7Mu4a7V1X7PdNcW9STmEN/ENaVd8DfsKSaBdx51OA97nCNPAi6ZMKS1cl6nM/DDX5H27Eac8Z2TuaUM1/Z1jNS7esE8fhkgn4Etynf6ep8EEHqzS+J0QvA5WTd953GWffcyxFGgPcVW8aeKv4IvQ2bqoozryZtf3JNV7jhU4VRFNLr82P1ZX3aJ6w+Je47kcc6Y9vH32kPjbX1xbWbQa4ouNiyHAdFVm/VmdxJGp1m2kaCnhySDm08AvxKIUqt58FThpuMiDKkiIfKOEfuXuxsPV7yz/+EIkchuccX/Ixw7Zh03Txcbs0nB+g2cldnJYysfWlisMHZKCmvwcFdGVsi1qo7YZ2
X-MS-Exchange-AntiSpam-MessageData: FtV+rT8FjDg+7B72RM94xj0QUfVsMqx5fsLixlJzmWVKwJtjC5j9pridJyZfeEAITsRJ0qmdkg60zbPmxGITBLEe9RhJmEeYEW5pqkesuMpj1A2KH42VjwBkaItw4aFe4J1hP1KZHL+H5wZa8X8GQVv5WHE9UGDZGJuwnfCXPMej/XtT8/2PBPcOFYGaO19/rs6BEsiiX9FIEQvmsJ2UJpNzLfQPYVM03dOVZ1QmGmx+bgLjUGS4Eo54ZCKY+6vEefWEU84EOSOQTm6sonoXH238mJts9Sp2nefqd+VRv679HDDcQZqFDxTEw3UEQflR7UjAgq7BaqNLbeH8AvoJEYgzpzIeVK2qgQcvlUmAKuqPTNWecf07fe0K14uND3jll/OD/Gy2vNSuhoFu6N4MXpVxdtaZ/4t3AXqxncW2/yYV8qeCOKe6lSEO69Dfvt+FSPuuaS4265vN/QmMi8kZ4GYP3h2mQ/YK+DjiXjUX0LgL9MmGDj8mkl06ZQV0g7hkY7TCJRmQ4DQwl7JtGdErRp5suqqK+l+Go+qb9+ecrVs5FQLZp/NiPRRflkVAlIXmf74mmS6ITJVnOka7pAiYlY42EDXXBzWfCcGJb77l40yYO8/McRSUlQtXak3cOr/vZwrlHzBDkRdH7qjIP2hWpSQIQ+UoR42IkukWxw0jr1orHZfnNWwcoLd+QwA+cZde5JXXnWWbgmgrTdU8lLVxCqFTRSagnlb/brDB+K52Pz/D3obIJC1PXTrMGfIRvXm1LSAbIah9TeU6q5WJ6do2SaUnOlXDvckWKvvgv4tjLyVSMpLjyMFUYMkcFYxR39VptyX10mluv62iW1WSIDCg/1010ZRqoBvKfgwIut/xX6o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d690b8-c07d-464c-d5e2-08d7e797a446
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 15:04:37.9792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72IP+Cfz6ch+iqbv2zgu8cD8BjZW3Y2bXbJc3WyQ1/LR4nUEHCgmPkWmDL+S2P5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4546
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

one thing you don't seem to have considered yet is that not setting the 
top-down flag also won't get you the bottom-up approach, but rather the 
best fit.

Additional to that the top-down allocations have quite a bit more CPU 
overhead since they don't walk the size tree, but the address tree in 
search for a fitting hole. Nirmoy is currently working on improving this.

Am 23.04.20 um 15:57 schrieb Gerd Hoffmann:
>> But cursor BOs are small, so they don't make much of a difference. What
>> is needed is space for 2 primary framebuffers during pageflips, with one
>> of them pinned. The other framebuffer can be located anywhere.
> The problem isn't the size.  The problem is dynamically allocated cursor
> BOs can also fragment vram, especially if top-bottom allocation is also
> used for large framebuffers so cursor BOs can end up somewhere in the
> middle of vram.

Well maybe instead of a ping/pong approach between top and bottom use a 
size based approach to place small BOs at the top and only the larger 
ones at the bottom (or the other way around).

Cheers,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
