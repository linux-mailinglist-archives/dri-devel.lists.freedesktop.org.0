Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993E7BBED8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 20:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6F10E554;
	Fri,  6 Oct 2023 18:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4475310E554
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 18:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSjJ5GhLPoTs6hotVdLjQ8U7UMo0BLXcT/09p2rLc8hG7Xf1UO8QEndc3z5bRjjEON+sQSpVZ5UpJ5KXUU5/4y+TXONQRTJjjpmRsblEc/+92bfI5I+e10T7BlUkVsHFZYuIAZjy14bpRXYnL917da/jiN3sbrTbejdbSszOLr3FDss1O1YU1WzoEQwWW82wURlh+pxXNVLVg1URYxMnf42I/xfhxEfVoLxPkfGgSdmLOBjWm48wEc1/hj0ORf6DaGu/iTMTaUpJDdj0ndJcM1wnoqZjR7uODxur7anZrwMg/uCYDp+mhy7tyM7R8Pu8BMrdlPt1T5KU/+FR0O56EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOpUcMlv+7THhZUanStmUiX8pU04omtUinfzxfp0jik=;
 b=MgcMRLpoSLBbErxmWVvKeK5vtqVS7lGdnDe1hNSe4ZXP/KoqPDYVGkZxRxex0FucyAq8uhxaNJdoNnqX3OKOjMELMSjIK2dvE/1TO+yZ9zgpTLi8S3GX2D1oNVGTcqbC3+R+mwEhJUJnJudYta6fVgGIK48D2/9BSGw++NSmBr50F+iV0CMFekuA4UCwKrWWDpje1L+6Oxqrbg6iHv/A59DYsxoAu3j/Wd90C5hpETH9ugDwhLTxVIwIE6csY7Ay0o5U5SkMoNyfazIH7dcMCSOyfWQmUiMGo1iQv4jz1WBbILA8YYNryKh0hoLcmzkeNWMPyJGvJ48m/M+04wnBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOpUcMlv+7THhZUanStmUiX8pU04omtUinfzxfp0jik=;
 b=P1wMX74mRnXpRiDuTvXevmPE7QgvS3mu0jdG5WA0PAO/QhUP6v8pSj4wq52NnkkxIyYKZfgkJyGES2CloXYfIf9dtkrPSntxj3oTOYQJHuU2kfJJXk4/W8kpsR2EgTfeZi2mvlc94d52zxqllTEWwkbl8MPmG5+YOcnrC6/y9wjrqdnocs5r7Hg/OkOPPFCt9ym6AFA9EOL7BZiq4Ho6P/t3JhOaQEYdRgbPwn+gmfJmV9Z82HmX2X2DcsClEZjvlvnus8HPr80KZjypmJzEr3Dp6AOILPJ0yMOTtV1rWBPv4nxIuxmzANyXkT2zhMvW5yEWAN9HkiF0QxsvmDZ3TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.27; Fri, 6 Oct 2023 18:43:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 18:43:25 +0000
Date: Fri, 6 Oct 2023 15:43:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Message-ID: <20231006184323.GT682044@nvidia.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
 <20231003074447.3245729-2-vivek.kasireddy@intel.com>
 <4c272313-d2cd-fa29-3126-496636e14115@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c272313-d2cd-fa29-3126-496636e14115@redhat.com>
X-ClientProxiedBy: BL0PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:207:3c::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc4ad19-efbb-4589-ee99-08dbc69c1f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cr2Atp4UPN+nOJT+tYImsbG5xbR1t75zLnEMYyNh7ydkC+quCEHbzCdBSZJ1RWh0yDxRTmzWKL4rLjRDb3zIFGQ/gM4VPi6IX3oZamswnCdZAADGKxBteNd/GumoVHyB87yigFIJrITYHDtEGFCfQMXZEGi4nv8h+k3U94uVyfKhXsdxgzTlKbOJevYZPSVA/8sG1NzxB6ktFrsBGsc/+FHHurtLyGNSzkMyuy/vYSQne0prup7ciBSnPWLudEUQnMiaoiH/YXzgqDndQmpB86lD5I1ViIpyFmn0bz02wJCOGtXQ2J338kImk8GGtirALNMOnBx/Fj1tIaFzV8V8tn9tEh819iVRioZ/9igf1Q47fuZWcUTxdSLZ+udGxL7elpWc0eWD4r48+PLG+pPOi92sp4xwWjk8KL40JPmqEd3i6PclpEQyJTtDX4celbMaURj6kr35hy2JxB3MCVXrGFiBZ2uzbnc/BVItyVHJm96rcAznEXURkhzz4Rleonw5pHNaSmS6n+bbTfN+rvRofMXkotwjDme8T9nAehOK9I7m+u2iek/qdiMgUH6NWNIZpei9jLkCrjCJN88C6+zGOmTg/sW/BhkXc9b9dGTQc8HP2E3HIWklD/o/1ELA425u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(83380400001)(38100700002)(86362001)(6512007)(1076003)(36756003)(2616005)(33656002)(26005)(2906002)(4744005)(4326008)(8676002)(8936002)(54906003)(41300700001)(66946007)(6916009)(7416002)(316002)(66476007)(6486002)(66556008)(5660300002)(478600001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqNcxNsdXbpvmZViCkoZ4Zw/hqfE7SI948z78d8Iv3Yg9XXThs47sWclBUgp?=
 =?us-ascii?Q?/0aKncCpmgjH1tKLVru9A2ioWs7fo+jQ7rkr/lZG4Xn8SKhXY/lwJv2kc4SS?=
 =?us-ascii?Q?V9TBWImcDIqBnV9S+2nX3MlpiCsBRzbrA1GzKXVvdqbfIT+enXWK5DExlpOe?=
 =?us-ascii?Q?zDxO9FT7lHza9PriyZuWIM1EsgwWHEXFR0vpmLzEJuzBEEnqJIxEwEb0gwah?=
 =?us-ascii?Q?/p++g3pSpXYiMzoLfqybwY0l5df0IXlXbYBHuuOijAF3P7Wqn2KWW9+6UoYz?=
 =?us-ascii?Q?2tpHWsI9XTpKE/ZFlnTqeFUjb/tzKlHz8fKUZ5iC3CmHun2eIBUJrsfIjwfT?=
 =?us-ascii?Q?g90otGvjQfyggJscIM5D9jYXdBMdBuWUjjFAjF2x3RYvFm4kzGwSt89wV3SM?=
 =?us-ascii?Q?BB8PVeKMnQMEOV9PEoCf7z4wKCYBgZQ1QqWK6jaOn1b5mOHvqD6O6ybKBfQv?=
 =?us-ascii?Q?isX1WShb7eWqWZ+j49RrKdua19YYJW6I6ZygrMAzbKFRP3Umk2hRjf/Ph6OP?=
 =?us-ascii?Q?5P3wPgPqv285eIJD+KX4nnZQ4uUxwdHWmZIxFa5C6g6w9qQjtzEoI+dCUWJk?=
 =?us-ascii?Q?E+PQ4AlbidEuLDabtphNwHFqrsFQV7TfnwgaXn/jF8BPj79wM9+2KREuWIco?=
 =?us-ascii?Q?6LmmvWYEG1RUXFUfCRwLGLO++vFkN9r1qK+fM5N6Qvk9eRwx+8sMsIraBs+l?=
 =?us-ascii?Q?jKu9tNTqIq5EkaLgTtVEgp9jd9AVIfNNMHDRD5N60P8c4U0mz1UM1yjfjiA5?=
 =?us-ascii?Q?fKXysIzsHy9o/EfxojlIXbzSt/K+HZxHsBGA+ezlwkcO+9ldAMvvWcfVAMjU?=
 =?us-ascii?Q?rAFuXk8Mij/bqxBmnqeBqtXUvEGKDy60beJ5t4FSFOzHD8GPo/Xvys59DGkz?=
 =?us-ascii?Q?/zSHNfw7YTG/V8eE9u1P8UYhhzKTK2+KuSIS8RibHl351BdqXTl6+34nvSjM?=
 =?us-ascii?Q?1n3Webc8UfjBh/F9nHKnC0+BqzN6qzY5qwHS+qWF8mE79xP4ryeTBMFykXcn?=
 =?us-ascii?Q?9m382D9C5wBnXkXRehllOML0MqNY2Q/v5rCMGO7S+QioJapZAwMu+wOnk0Wf?=
 =?us-ascii?Q?XRfoyaWS/LZ03abZqeYO1FCp1vhKmGAyFE90xldr8xF0FJoATNjhgApkunm0?=
 =?us-ascii?Q?52itYfdhWvy6uCZY9gBn0508xvGgVLezhVXoX9407Lwq6/I79hhEwR+xSn5h?=
 =?us-ascii?Q?cf32nnmUH5AU0TklgH+1br2ToXxHZNV0m6B/DZxVp1iOhz35HngSeVb3T4uS?=
 =?us-ascii?Q?6qPgxL/rpoaz2uFQA5DGYzIGSFnrndkKjHBB0AjDMRvzADPDWh7f7k8FF3Wf?=
 =?us-ascii?Q?tYK3ltpmB4GFx+zlrhLWE0OfBkeFE2wzP5YUx6vW0Brfz/dsPJb0HuXp298f?=
 =?us-ascii?Q?eOsQcA0cFk0DTorrUlwsasPIs6lHGhJlcn+9VtCktUCzskCDACpDH+kWbBRJ?=
 =?us-ascii?Q?pH9lQdsk1DBtwDIDEXRI11s6aTMIjjLxQvu1AdEYSs2xYG7opbSgcAt1vKdL?=
 =?us-ascii?Q?89c/qIzxOC3qePPZ9NP07O8X+ElegMLAl/dHPkuoLKb9W7FGhZ1gwI1JqRe/?=
 =?us-ascii?Q?YTsRXgHNZd7+eAYbUsszBlNh9xqnZBGs5KvDvnJN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc4ad19-efbb-4589-ee99-08dbc69c1f98
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 18:43:25.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AgLOtaR0vsiUyJJeFmpgXfQTm3JMUZj7xbSbW/sKa4dNrGFNeYOTvsq0jRkhCEj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 10:03:33AM +0200, David Hildenbrand wrote:
> > + *
> > + * Returns number of pages pinned. This would be equal to the number of
> > + * pages requested.
> > + * If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns
> > + * -errno.
> > + */
> > +long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
> > +		       unsigned int gup_flags, struct page **pages)
> > +{
> > +	struct page *page;
> > +	struct file *filep;
> > +	unsigned int flags, i;
> > +	long ret;
> > +
> > +	if (nr_pages <= 0)
> > +		return 0;
> 
> I think we should just forbid that and use a WARN_ON_ONCE() here / return
> -EINVAL. So we'll never end up returning 0.

Why is the check even needed? It looked like it just runs through
normally and returns 0, that is fine..

Jason
