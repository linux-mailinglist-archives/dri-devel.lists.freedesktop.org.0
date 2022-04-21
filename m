Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64D50A07D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1447210E642;
	Thu, 21 Apr 2022 13:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6C10E3EA;
 Thu, 21 Apr 2022 13:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2K+dRHqmHuQtyBQzP/mvZBKy6ugHv2xO/RBkeQ5FbJolz2QFamnouFwcEcmN/YARMIeJu6kOD5a/F0nnnVG9+scqCljH6XWJaue+I0p3NLV9u21QknIQLaqKf10wCBgcjWcQEHJBaYLhTvwDk0AnWj/gBbijC3+IAfGNsA5PZZ5FKx3HGcZ+9bZpEf1bfZba2CFWebVc4J5YXFqv9XDhB89BAvDubb+WCzQTLu1xsUzG/dWzOUcPWviYxzQ+vhi6KrSkqe764Gmpk1Du5MZp7AEP8NyGzRtuJJuHASEXq7+ShPzEpBz53JOQ2sHe8A2OSMKdegEtScirrTO/SToVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J9bHztLU4YbLTKClkflag3BWdgA/flFYii4N9p+msk=;
 b=bvOdiE+WihOlfDtzF7+W8twEix/5aBwRexydc6mzEjf5eTPJL9oJ+QgJd3dwQV08H2lNDzFLCvHA8EfQjYaVTFxoSke90QcU/U41+Gi8GoCILAVsrLTMdvcLCtFGhI8NZOWqzamnZ4wexJnLdgWt2bIWRoemvOFugFRCCnxy3JqQQwBkuvYWcZrcru+xtbjXJ0+wHvxLdNcRl78rA3rM5Od+zNi/bIB06f/Mk++Ggc231+60ezGmYffscvo2ddlaN9yyZp/CytmZ4xSZHEyS8Quv/Ou0SwcumekwPj1eKiSEhcw7VG0nDUuKgHxFTlZqqjo2lunzUNmJR6ixBQOPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7J9bHztLU4YbLTKClkflag3BWdgA/flFYii4N9p+msk=;
 b=MNMR78nFoKKSw1wK92f6d22C1MKChjLjut2u+XUjRDREHby5WwWJmZux+pemv/NgPd4zj781vSq4HAO2zKUDORtrQJgDc2Ivrr7m6LfQg1clzIRL+tRO40tIOKB9RqTTN4lGaASoU+s4Hf0qw79AmPoDuy4MoE31NawyKdzZUGN96Vp8Zb9yN2LmS9HXpL3y96YkWjx5W+09M9gnz/HMO59wL2uY1tiZk4RIB+JZUlQozFmNS1m1fjlwYI5VZGNPpSUXv33WvF2mpRN8RowU+aQIj/BC+FR78R58Dz7p5na1bwtHqSKF3h2SpH60SQ8npYzIOfmXm43f6x3sPiVBbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 13:14:05 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:14:05 +0000
Date: Thu, 21 Apr 2022 10:14:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL v2] gvt-next
Message-ID: <20220421131403.GF2120790@nvidia.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
 <20220420114033.7f8b57c7.alex.williamson@redhat.com>
 <20220420174600.GD2120790@nvidia.com>
 <20220420200034.GE2120790@nvidia.com>
 <55cb46db-754e-e339-178c-0a2cfaf65810@intel.com>
 <20220421054738.GA20772@lst.de>
 <165052329083.6597.933445971686511585@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165052329083.6597.933445971686511585@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: MN2PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:208:178::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d2281b-9742-4bbe-8721-08da2398cf3a
X-MS-TrafficTypeDiagnostic: DS7PR12MB5840:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB5840B33D51E1D1CCF68E9C02C2F49@DS7PR12MB5840.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DpB/bxgn/QKCo814bpYq1aimdG4YlCfNj9JbEAKmlSlCb6STsPQSff5Jq1u+TLEK4PInSF8eF0OwExgdFVQ1B99T3FLuTj9L+5mv2wQNnhMshkzDKrByneax+Nazxnl5PssPGvf1+KxEXb8FNormTdX6Y1/Fe0I0aPt4X+b/xs34buBMLyPZnS3Uf5XbeoeZqG8Z9m8Yb5A5A3cPTgpkscj+5x+5ku75mcyd6qf+YuKwdbyXf5MNU0me2jnWwVqWuGndb4rp87uN2+BvwsCZr1uToOxEp6GSCawRuuBdmknE/tvsyCcER/N60X4Fhpe7hI1mRQjDQPOqbhN1LNZrnN1a9KJT2JH6JhZCKZpQSQ78xukoRwj4N2CQ+q31i1E7uw+8VVs/V8qICaUuFzwj0EJPiR6Me6azJWObHof4VU4HrxO6TPxmYZxU10VMiKGCEwC7LgJVEbUf87WTZbLQdSvOW+jgVi4qXylJZJ9tjqsAQXDedlEHDxmYl/0c/df9bYQB4/Sf25EjfvyAqUAXi3ZqIftOqQRllbiuJ5oxXZPor+qW2dKilEzderDWgRZTLtwi1yBNgaQL0HVz70Dln57qAsVt+1xD4zGMdusT7XJ3ZcPlnTPWE5DHAGkqCVUotVSHQJrHlsvY6nl5tRIfqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(186003)(4744005)(5660300002)(54906003)(8676002)(66556008)(66476007)(66946007)(4326008)(6916009)(7416002)(86362001)(316002)(36756003)(2616005)(6486002)(26005)(6506007)(6512007)(38100700002)(508600001)(2906002)(8936002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DJWBYUwXIxjOT4xhkz40soHxdeladFEdVP39+TZB4WQUUKwikcQX2p7BsoA?=
 =?us-ascii?Q?9FnFMbmF+VN8E61xc1IuoxC0/GD/mT/6pWXzDT9zXUAwYysZPXsY+2cSpA0w?=
 =?us-ascii?Q?xcRJ3/i0VGBPI8tkxV+D/kw/ZwbYaZ2PqOqhpOytEHJX/pU+9AiDxDjHMHhd?=
 =?us-ascii?Q?hn82SkH9FXixWQTCqAwwpQwcKxHYJybqWuNovwvL+3rBpNX5zcNQGKLi5WQH?=
 =?us-ascii?Q?gFp4FNeAlI9rQY/3YL/N1TXefyR25xJw17gAwrVoj1+gyMPCbXXNofS7EgwH?=
 =?us-ascii?Q?vBI6Q+OGedCMWN2uQrrG02l6QzjydEo/g7syOSmN4osp0hqzHspxVJCnHQSs?=
 =?us-ascii?Q?mdv/fXqrbKxRhsb0NY18yX7V2M8YsDSsuP7b8T+8K0JP141qcQmt/FJAcT2z?=
 =?us-ascii?Q?V6rmbYBWUH0kuq6ICY46/W9WkXQ8o+d59WUwX3xvcA35ixp27jCnpSB7yXgZ?=
 =?us-ascii?Q?szWX5pMqAOHXZmVqiC0GdmwGkjR0THXNObRe74hMCoBDZQtO2VoJ2TVeUE68?=
 =?us-ascii?Q?vOaRLqRSXSOi5X7B8YYdqdpF2jCfwZbrS6SX8mfzIvYJ+63xMtz2M9Kt4GrG?=
 =?us-ascii?Q?f1Sj3LpgW9w8vuFpin8Jg1pR1hDrVWIgZek/ZiQJx/92WUWUBjEAiWH8/tTg?=
 =?us-ascii?Q?zUC00sjUlQgfCRvc/4F1vcKdPGB/v7Z5zVEgO3NIrDuQe3Flf7ZEhzCvYGec?=
 =?us-ascii?Q?Yn2moq/MIXE9xCuP05xgbZFqf3tx0N08WZ9USf3OGFYlayhbN0cXxvfPGQcL?=
 =?us-ascii?Q?IxTU8bfeBZ3cF+fTI6ho7DsPtJkrl2X8beUL0l9grd5EYRyyvYZdmCtuTTun?=
 =?us-ascii?Q?Nv9enbbbJvzETjuFltmClKrfbyE/4RPQktSMx3u6/pEoduunXEhzUsKhMlGR?=
 =?us-ascii?Q?IiRy3PrFiaXlbfLdK/f8fad87v0jn6BXaY734qIQSrltilyNSHF1neWDHFdW?=
 =?us-ascii?Q?NbRs/kb9ipOBCYaAublCqxxdqMsBD8p2ZAwVWTL/bs30McC9tGmHHrC61L3i?=
 =?us-ascii?Q?V9hRa1TYM+zq3yzA6l6tQ+hRMB2QcipGUc/XxxVpGAppdYYRPDf4Vx43tFg5?=
 =?us-ascii?Q?aqcFxkwBvSKd7bMIQQy9YRa0jBgaroc/t/D+m+U1yqL/4O93TErzjk/8y3wf?=
 =?us-ascii?Q?TkjX24k5BMELLYvwuD45s0NWWSswKbmPFa2WrkHWl7O0ArMvWhHXzJ5PnuIc?=
 =?us-ascii?Q?9JfxscoiR+M4+ZW17DgUtPS86drjlFpsZgOF+UGCmKNoPVHd66rjX3qkkbnh?=
 =?us-ascii?Q?XOnDjaXO8CdTzvXj6PmTMjWyS+Yb1OyZUgCk9gKZhgXcf849xb1I/uyLIus+?=
 =?us-ascii?Q?Rcb+87zjuJSz8rNBLggR8gnBX4Ev4fQJtG9IgANBEczx0KnXqEYKKR/t2F2O?=
 =?us-ascii?Q?bbB+TqZqeI7U0x0Rc7OSAyhA8O1S7/WS55EqjnNwcO1wdZanEbg7r2sGCUWl?=
 =?us-ascii?Q?AAFytcyppCzxN8vVrXnudSKYjtTdewRYaIvmfNj/YjYVJ7ah/71agGlhxsvE?=
 =?us-ascii?Q?6t+NZlIbn39G3vuUW1vn9oboaQfOawUUrqTu9AmCVq1V8D1IcpnwZ4r2AGDw?=
 =?us-ascii?Q?6hIfl4Il9QwoDyw/D7lCdVEyYJbs90vg70Iy9BDhkUjY1YlfcTiZMUzjvKCY?=
 =?us-ascii?Q?wHxta6efEUU7g3Xbi+Ga2jQe2OJltZEYcc0NPGTT8sgYEgr94SMx7i0NCcqc?=
 =?us-ascii?Q?jnbJzejM3FV2TfUqkblfShggWRnrm+g+TKg2A2/Mn+M5rPytmwJjBAsBXdAs?=
 =?us-ascii?Q?Xn574oo2Ng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d2281b-9742-4bbe-8721-08da2398cf3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:14:04.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9j+ug00veX8URcmHy2Lfue+Vap1jcZx/B1xJECUSAR05eVbuMzUFSmcISBn1dlv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 09:41:30AM +0300, Joonas Lahtinen wrote:
> + Tvrtko
> 
> Quoting Christoph Hellwig (2022-04-21 08:47:38)
> > On Thu, Apr 21, 2022 at 04:57:34AM +0000, Wang, Zhi A wrote:
> > > Is it possible that I can send two different pull based on the same branch?
> > > I was thinking I can remove this line in the original patch and then add a
> > > small patch to add this line back on the top. Then make two different tags
> > > before and after that small patch, send one pull with tag that includes that
> > > small patch to i915 and the other pull with tag that doesn't includes it to
> > > VFIO?
> > 
> > Yes, you can do that as long as the small fixup commit is the very last
> > one.

Keep in mind when doing this that best practice is for every commit to
compile.

So if you add a commit with a new #include to this topic branch that
commit will not compile.

Best practice is to fix the compilation breakage in a merge commit,
either created by you or created by your upstream.

Jason
