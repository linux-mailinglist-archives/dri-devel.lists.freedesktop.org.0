Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8677FA1F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6D10E4BD;
	Thu, 17 Aug 2023 15:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290989B57
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS9j49U6S5fUzIC1Rxj21+faS9dCbveKlPdGjaKdlkXHfLgoXPfoX7VDT2uIDb5YqGth3wY5IQM73iphkvY0oSByozq7OAnZePf4wn1KT20VT9fBFFBO+MNDOK1YM3/v50SxriRWQPlacw3MlADiZl23EcW0M6uKp8pt+aYadNP9JWKoM/HuLvO2FznVwHRgEruGMHppLqL8W9Nu2RYWYe6rMg62eEcR5sO/0iQHitCTcX6oZniOwjzdNQrdQeczZcotJRdATyhhjF7qI5+pqCQikMfRc0Rk+VTgfqM7s7AlbI1ickflaBDGrW4NKeYohhthPEmcWP64BWzJEthZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fir8QawX9a2tdixUuURyXXr4Ats4gBptLJbcoqfH5E=;
 b=nFawlzxuNwCmmdYX0qkmuxMqYpCH0HJxHlUZBB/QIfEgLnKHONIVl9+4XB8P3HllBPGlPrhvpJFjqtxNTtrWLUn2r9ONULUGIHo3u540MfcbH0yvGG8NMsPN7GTqVSb/2osM58+pZU0bWFfLcxxrPj0T2Vxv7tknLkoQ/Hs2BjoPExTgyA9skvrfGM+/9Ob5c4ky3VLSU0VeSbqx/d0uxi32DOCqlKBdQxCo2zaQLhHwFxsHYjx9AqrH6LQe2ukXYiBdKrukKZ47Q99L/2+fa/sSpZNkQC2jbKFsyeLdl5sZ8AxP7iaS+YcfsJ13zY4GQtOGQ7jt56CuZ33CgcjvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fir8QawX9a2tdixUuURyXXr4Ats4gBptLJbcoqfH5E=;
 b=gUN3pkLl7H9AQQ2ymWuEI3uZPyT1vssSHZB384r03FlaIeI51FHR6HAXouCcMESbynEpYINuWVLUVWeoUq6GIrjMarYMRHnoo7IzxTa/EYQC6/423cU6GXNWlhq0uDGdsaZy/pNfvaO1t/1doAv5zrgz8Mb1yXZPowLeZRPcdZbsSQMaUfLKoyrbhoTu75a/vt0J16Jb0fNXikF3jy4evKhPr5JEQaS2xf2pTrB92fqCZG8ZOjqMJx4qQAonbMNqM1PB21LeiH99kVsMxz16V2CgZ0b78YFfyAaPJXXSiP8usSzMKRFE0tRuat9aGCq1JzJsNwVxqdcVPKSafAiZBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 17 Aug
 2023 15:01:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 15:01:51 +0000
Date: Thu, 17 Aug 2023 12:01:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Message-ID: <ZN42XjuXUyma5uE+@nvidia.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BL1PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 3134e869-6292-4476-a2d8-08db9f32e334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mvKljOZXAixXnnLEMwoOHW70co+FSz4NV8AfmGYwh5nq9Pf5QMKBARQpSP5vYlDYtpbEFAHevez2tQlqXhUCkSskAWZEBNCKCHFnFAKBzrefiwycTzL9F+h3AhhleNbQCT8e2hu+tkTDlb08gXzfJDE0XpOnWA9XzSFQsN0G9+yCLH70OoEz22+QFPWt2LF2MzOfS0BvcHeFGqxO38D+9ibyIVD5alk/ZHGzt7FVG6KknA4XfuIiwui4JDjV3BA6V6Hj1Q2YowbTqBn/V6wlW+Qt+1PCBSweQsKFcshq72rn8xCaLETNlgBds8/caxLclEBLAoTnr+pD2bAo2Aj2DXe+zsxrZkEBYzcdfr6fsCwM6nmN49khLxtXMDwXqa0Fs0yQpxkpZF7wg1fEaTSJuOgOuctPgP+vRl0c7tgnNKIWPbmPrTBGlr5KWYwnz4ok19aR+iT+t96GppM+yhgZZdiACpFEDD6DkAD+n+lFSSLDh9ORmq0lFToO/0ABS7HYQiaWFUMfhhhx5uDCUC+bMloKoWaXERj0a5xTNFoy1YATxu7wxvqsTkCfKGQNSnU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(4744005)(26005)(86362001)(7416002)(478600001)(6506007)(36756003)(2616005)(6486002)(6512007)(5660300002)(41300700001)(316002)(54906003)(66946007)(66476007)(66556008)(6916009)(4326008)(8676002)(8936002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DgswsmRYXFjDirP6gwSi6esSUa1J18jHiE2BlfxlfnxSP++Ml38UGTy02N/K?=
 =?us-ascii?Q?o5+RtvGM3ewofT8uLIQeBF5y+eEFefEWQrMdGCAdhlAzk7mdXHlAngkaXxMX?=
 =?us-ascii?Q?2NWdMwAIea4BWGvXpeczIzJ0yLEbpn9g1pWKu8B1SHCJCbXzLFlF79xuxZVm?=
 =?us-ascii?Q?IO2zUzaToKCQEP6lEIgwVmmFoMHADB8UrBWAWeFxyaXGyOb1hMw0dTCPpRTt?=
 =?us-ascii?Q?kgghIl3ce2QnMczB3+eFLXzbukKbCc2xQKoz0TOSaDH2Pwok05wxX7QfPHnw?=
 =?us-ascii?Q?RtBCM0XKulwn9BY91gBRWSHsIRiMx+lK0ejOShO/kH79f7uo6mycs/PsqTOQ?=
 =?us-ascii?Q?N4I4VqN6SGQ8Wo3aiKbJ0Tc7Ck7PaDIIyzFHHZNt41wH+e2r9zZBup1iHF1E?=
 =?us-ascii?Q?3QB45uZ2eqZiveTbLwRNpdf2DKgPaHbqJqsXYD6FGsV+1GsOSr+7iLHVf25I?=
 =?us-ascii?Q?ZOhZPRTtJcY8Jt4zuvXT47sOUb3sv/XWPHw84T3AKGE/a2LXPNvUHF0M9i7C?=
 =?us-ascii?Q?Oltaxvjzw7nzdWZeB2WIlyxolNL3E7rKL6+VV7knL+vkRJ7HrZnnlAxCUR3h?=
 =?us-ascii?Q?eYBW2WxPpOv0U9c0taqNe14IOATEGGCM7vcwfaB43j/LDzEtmcEE1X/eCWE6?=
 =?us-ascii?Q?YD4dOaEYYkqDc5aARXseYldD66ijAw0FYVgAq1+hVZZWLOOaZURsumTivlDK?=
 =?us-ascii?Q?AkIetB5h7dcbEUum9Vim3ZCqlYrMrkoxLniL6sNMhRNtcO8VsLa7nBe4KNJt?=
 =?us-ascii?Q?1kUYv4KsUTfKxXy9IHfce8u2OjJqYoGPquVz2SmCXukdB0tI/0IKh/LSvHfZ?=
 =?us-ascii?Q?VnMigbl/zU06m+x3jyZDikKbXtmgU+mz1tbW/X0hBrSZqFvfRqball0eSJZw?=
 =?us-ascii?Q?cBTWMAj6JCKts9l2vpKJsKkzVhz1dolSS58DHDbaHbcuSEza9/SsgUK3AAad?=
 =?us-ascii?Q?jB4v6pokpglAy6SrUiuR+e29UAB9tSAaCF3c02NCJnZ6hLWkeIN4UIvrxxqo?=
 =?us-ascii?Q?YddV+cpyKWAh5fe+0SuRMgHrynoCuP35ixsweQPprwCKcbco7El5/VYxsq8X?=
 =?us-ascii?Q?LZnqiNnFEHr9emDBPhPLmIFL+wA03rSGL1S548qo01nXGrNIaZwzdaGBIw9p?=
 =?us-ascii?Q?xejS3oSjIWojLJykD+ueX8Ebzdi1PglsOk999ebpIET0oK+cBx6hC8gMkxdp?=
 =?us-ascii?Q?1DA63c46R0g837lQfThVM9OVGVKjj61pYjAs73mP6PB9h0l1IIBU69TTzQcC?=
 =?us-ascii?Q?1sW+iBOqGEgRVa5ydeDXqZSUDMXyvX3orRkUEHRYTv5gRbpmF2q0IAM7KUkV?=
 =?us-ascii?Q?lYHNyBUk+b7ZjLNxFSWITZBC+4pGiChL3fuSztU+NZWGY4lYbHBjDAmQgNMD?=
 =?us-ascii?Q?H7qg36JNMGNxZqeBCn+w1WZaEWBzfudLqsrE+VTeQBzo15IovmCtoUN0Jo56?=
 =?us-ascii?Q?1s3fX4DkSzdjq+PZxlHa/uqL0zPpkY9tYFxzjwsFVFRh2SwpYx4Mcylk7BC3?=
 =?us-ascii?Q?md6t5PAXbxWHIWzEtUycW/lqi5okXaVwmheWJoVD0FuenmFqtYyDn1KGjbuc?=
 =?us-ascii?Q?lSLm+xhZX0rHJur0PbeV8tC/CDM402F4FzbwKEaM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3134e869-6292-4476-a2d8-08db9f32e334
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:01:51.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Onbvep00CnWgQN1Y9u5BsQvo2OqfD+TrArUAHbPZnGYvUG+OCK5DWs2aboa8Iir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 11:49:31PM -0700, Vivek Kasireddy wrote:
> This patch series adds support for migrating pages associated with
> a udmabuf out of the movable zone or CMA to avoid breaking features
> such as memory hotunplug.
> 
> The first patch exports check_and_migrate_movable_pages() function
> out of GUP so that the udmabuf driver can leverage it for page
> migration that is done as part of the second patch. The last patch
> adds two new udmabuf selftests to verify data coherency after
> page migration.

Please don't do this. If you want to do what GUP does then call
GUP. udmabuf is not so special that it needs to open code its own
weird version of it.

Jason
