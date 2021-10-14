Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B380442E0B2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88556E1D2;
	Thu, 14 Oct 2021 18:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286B26E1D2;
 Thu, 14 Oct 2021 18:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgmJ5HRlS4ylOQbQcw1ULWD2QjMdcDZW1ledq4gCrs7j4TmY21eYIaZM+7ws79hwJdk6HHz/aPUt0k0o8mKHDKqOm3gBgaWzkgGjNIVBvJk0Iy4WMXO7A0ySgGRzKp7nJ8Wy5lRh5FnpFmX3YwhoIBILHpwirnGdihL/y8LTk9qCglbnLOvx0BkDNyNQhpOqSmrbdKwY4Jr0S/uQD4eFtFQHJw0zsjbyf8en1V9Cwe07RWOPEyGLXKnG5Nv6rdpmF81vTqZ4Ajzp0QiZeqyilpK4tjHO1EkU5BbXxNo9XCydDvcAOlTTGuJYZ0WmsYYMxPd3uluymgQIdAwV5AMrvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTWeaN6k/Bpt+VIU1uOGBAwXLCiqUfRLhPyU/tj/XHg=;
 b=UAY5ql79CeoPWrA8/Hv+8AK3Mnmvxitl4MSUVs0ZD8m8G7eCn8mk4lFa6ciDALxxH/9tP1k76/DYL0IR3BCHMMpqx7WFcypBLOxtLK05XIytylXAPI4bYSK2xtGt6qTTInkeA+fPMSwiVpz6IHzSgxH4MQig57hGndXQ5Z8bGBhPcKEqu+l4I0GUx0Gu5Gip0vFeU1QDRaMYm2xGva1w1Gwpc0lkx/HsIrXp/E8eztRTTfW+c3nd2TOXEhSoS2n//+JRkSCkza7+XHg449Y3j5KvFmDWezpTsl9uV6nmvmz2WgY2bZEhc9cnfGrLlBwBfSk1x2aJcL2BZV6lOXISsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTWeaN6k/Bpt+VIU1uOGBAwXLCiqUfRLhPyU/tj/XHg=;
 b=g4d3Q+zZ4tXudjsV7dNhuHoG2pD4vVWvUzfwlRy+3oWTCvfuo8rbS8YvWVbpwtwMRRyk/tLe+db13G05aJ6NOG6R76KW1HhBuqVHx5RjovzZpLImfQX23lwntIB1WzfAjFiBBdZqzZmdh95oTc0Eiw5Fvtkp3IPDHaeb1TMWcGo9kjJLtMSm1U823yPxcsYrIz+KPNTXIZjC8v1EZzMh3Hnbvefhjh+3Abnh+vW/YVSxBK42fiIC00Ix9KaxeAuv2wJZcWHNTJ6kAuHMHrsjwHcehd/BUsNAu9fCvjGxI3z/olmr1LoQneg7O7u9UgkSDkSkzD01K4w7o0ECLMic4w==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 18:01:33 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 18:01:33 +0000
Date: Thu, 14 Oct 2021 15:01:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jglisse@redhat.com, apopple@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <20211014180132.GA3567687@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
X-ClientProxiedBy: MN2PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:208:234::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR16CA0064.namprd16.prod.outlook.com (2603:10b6:208:234::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 18:01:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mb52q-00F0Gn-G3; Thu, 14 Oct 2021 15:01:32 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f71548-4169-45a7-d721-08d98f3ca84e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB534938FADF618AD8F90B7974C2B89@BL1PR12MB5349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TAx7q8UJaBbAeNdGpDcObsMuPlCQB561ARegScjE0sDb0xzRaJD+jCwHrW8/jtkK3WmgizXJ6nXPNKc4dwEr8ZAEFwYIoH7ctNDUL+cSAMLOLyugg7qMYCjjrVEXZ4HmmMSFcmMFdXsIj+nnf6C9exFcaMTXcPSgWiOnYbqQOZmfztOJ4sOETxJqQ3I7W5kh7eeOB8owxb3JszjCGjHwk3LG3iYV/2ok55Lyf3HIVhyi0pJ4JvmWfACiRdyI1Bmkv52DArK9AZT+DKakSop1umMNGsRRjh731DHkTg0TwY+1jowHC58mZOGMjOyJwvOGnyne0nBZHxgn7jr31t+CNqCHSDYTqzibJZil5qMNeIzj6T7r2tF20s6VhwxPHFNUyo8s8lcDsKZOxqySboE8BfNs83oijaGK8PGKQJCJU3KD05bWlki9Sf14OtaYolSDAi1Yfc3IccCdRHWwPDazVxGKkLG/p2bC04S1LVh3pZCjuL/S6QZHoJP8JaCvxoCT4IyC47mtct8EiVDJeoVIimeT4cuuz/YzV5eKH94TWNYINRmB0dPnX0YvUf8L6Vsu8LztIR4PyhV+Ahrzh7kXaBzrDBBXvVzwRz+IMCa9CtuSqMj7VDxI0dP1S8hT3N3Ii9ScJLyes0g0rOxrwEfWjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2906002)(426003)(8936002)(2616005)(508600001)(7416002)(9786002)(9746002)(38100700002)(1076003)(6862004)(4744005)(5660300002)(4326008)(6636002)(316002)(66476007)(36756003)(66946007)(8676002)(66556008)(186003)(33656002)(26005)(37006003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?As3jK/DyNCazXR6k/je9X5gZkXzkw1b60WjA67ZCPZm6zc+/CRQi4FeFEK0W?=
 =?us-ascii?Q?uCX+sZEUoFMZpJg8xxfJgu26f9LsM6urVJGYVUPUGaG2oeknmRKU4ZSr/4TH?=
 =?us-ascii?Q?qp+ENGwHY/TSFifyw+uecz5ibM69MqLkev4RqZEHMqdoUDar6bW8fTQoeiNw?=
 =?us-ascii?Q?R5P/2z/jSqg5EMnkonfbiu8I3XmHETLIbgdry9M0/L5X4bMLeVSUIn9iB8Ya?=
 =?us-ascii?Q?PzrYkJO4ngo+gzrUBf29zCJBzWKi5lcb2mdTKFC0+J1Y4EJ/QKC1kjJqshk8?=
 =?us-ascii?Q?1yMz/0oOyodUDS42rxfg0UrcsiRTZaF1/wGJxhOX9fq62TiSIQvpdglXqSZz?=
 =?us-ascii?Q?rO/x1rZbRbkQKUJb0d3HtUolLuPTIbBfyfsGadEBmQGQ9LwHviRiH77QYq6g?=
 =?us-ascii?Q?8uA8NWG9ZYU+HW+GbDjyGasDu/BuTik6LhnUUFTt+q7A7vqvQn4m7vHZTGiB?=
 =?us-ascii?Q?TSi1SjOo0y3cP7VtP/pxlbEahN/P50WtQVCRwAvt1qupBIFdExjEOKsPGGVB?=
 =?us-ascii?Q?VpmVVjNIbAQ2Q/BtEOg8PLXuZhA2bSe4qqp6ZcsfADEFI2hSoVV25KL+pFDw?=
 =?us-ascii?Q?VN7i43p3eJYhGvjuowzVbi+3FJkSKqA6UZN6rNImmBVL66pJUeJ+mQk3lhf3?=
 =?us-ascii?Q?Y+6nsUWXwyFWNA63z5FdlH3s2H+f9C+6zbanFgEKhbuVy/5kTjNbnEDu+RsB?=
 =?us-ascii?Q?/dXFCa51S6gQk8UFQU6nfZ9d7sOxXWehVabrcM1PShM6+UqZR42Bona7J8x+?=
 =?us-ascii?Q?Rls2ueLdk+qkArnUavymr3yoBX5ncfQ+1lra8XG03lZ6m9sY2zdolaGRFe9J?=
 =?us-ascii?Q?Cn+72AKMJHMfu0FKkra7jPIo6v9Lep3BieFUxq8hj2n2TJMEUysMLyrWBuhE?=
 =?us-ascii?Q?MQNqZXjNmpzcPw+v8h8/zXJbLPzlZK9SMB5PTU9eCzOPRy18Y/K5y9Mu6twj?=
 =?us-ascii?Q?2l2pccGerShzMBo4w1Ukr1CLlRLsJzOcR8pRFi7ADk/dDP0iHa6CUa7O/BgD?=
 =?us-ascii?Q?DnLNmvj7ndV0WPZiiKFp88l/mP0Xv+klxwTSXYZw+k4AowYkBQchObAgOHpv?=
 =?us-ascii?Q?FuupqoDCbvahTCoDfAgkDgFT9q2iee9P+g2RQfy7F/lIcjVJFcLtrz+JANYS?=
 =?us-ascii?Q?gjvhe4r1aR9h/yzJbH/F+PKQTITUfDlvoF2z9FjSYP/AdkRwAfP2S0DSgnHJ?=
 =?us-ascii?Q?19DhkTElrMy57w1EmTG2Fal+x85jvhE2jEiil4OKOf3Yc9BcjAquS3lEF+7n?=
 =?us-ascii?Q?/B/rYxy/S+2/iE2eRoH+rxU6CFY/ak9eRuv2OTCfxhj+EIsMBhQR1+JQAlAG?=
 =?us-ascii?Q?zp3h/mpEwgSaZY+M3N9M+uxSfPpswRJkJu5VIGrCT+jP2Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f71548-4169-45a7-d721-08d98f3ca84e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:01:33.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iCqo0/S//TRdR9g3NtiuEnxK/vF5jpwAkJ+fCktAWXkxrcf1zuaqtO/ZZpBRIJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 10:35:27AM -0700, Ralph Campbell wrote:

> I ran xfstests-dev using the kernel boot option to "fake" a pmem device
> when I first posted this patch. The tests ran OK (or at least the same
> tests passed with and without my patch). 

Hmm. I know nothing of xfstests but 

tests/generic/413

Looks kind of like it might cover this situation?

Did it run for you?

Jason
