Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC403DF050
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 16:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76F66E45C;
	Tue,  3 Aug 2021 14:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5C6E45C;
 Tue,  3 Aug 2021 14:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvZ5+3zTWYL9o9AHQ4tUS32ytSfeh6oWIE90rN3JuuvEuThcRV+rOmU/HMRF58B/DrjcEoLTxcssrt3QVn7K5fpgGh4SVN1ZFmnwnxKW+sKbNnOZk9JWmMun2PGAs7tbD4ouwH2CKs6OyEZX9IOTXVNp4CVZo/alL/9LzbwMdPQYytuKdd6cBDKvrDie/t4VlljumiFEHH0F7XfXLD//T/z8eRfwHSNrzpjHz2GO2Wkrreybj3FHy78N7GzbrgEMLapl0KmsAzc4JkXPwfTLN6kEl8UCnUYsJMmOCN3Xk9Hx7PW0PoZyU4WB1NoXlY2uEUnWnUklvwsQ53j3hbLUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7xsv3+TkxLMjepkn413sgd7yHpbaXXQ+WbkxmPQw3c=;
 b=brnDOoG42jMtgvFjkC9Znv195D5MkEkuc4RUd9sXQ99bsmKjVPHweqnGJGDvQxP8sq1NtTxMzVqVEfHjR8p7hNnzd/NkIklMqDFot3WC3BT8rJ6cUBQ5Kbho5b0T7NKLYs5Bb3Ft8GghNNSoHk/scSXR0PAyQ8UOGOjFT5fyvBoAERUAacsZy8FVsHJvAgqcvq71d43KsrfacTj/FLRUzDqlestq3RL3RcPIKTSqNUlAVt20FZ2ZogaCHPd8oPr1bFrTWrWioHRpAzJGuTwTmfuM0Fr4o9HJgQMHDTtGHvidLqJaabwmWVGyUIZUL+b7koDeB27mKoLRE4Gff/75OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7xsv3+TkxLMjepkn413sgd7yHpbaXXQ+WbkxmPQw3c=;
 b=udUdASCDNFQ76jZYIAmDTitkvPVBk6VHvb+eEFw+zAD/QBuPVakbf01VJCeK3Bpym3GI/ucK/XpnV72Y2WgxCU84SY7ig9W+N9ZhEhNO1nxphAHuxEOyPmNIPjLPBkveJKzBa5Rrj05fLyY7fJXq5O8lrdWP95NvSOoYQLh4OBYNBzRYn6Xj16iFtK0TWFBybKLv0MsEhRl0SBKJun2DLDTLsDrJk+OCf64Ap7k9H0uIWUoLi+XIQZT68lZoU2++OcbZJa5ChEX9jKSZTp3wSNFzitFwwPF58Mv++OKaK1qD2KUCNS84rXye4p2AwQAfEl5Vxx6DS+qsQZTgFeniBQ==
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 14:31:00 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 14:31:00 +0000
Date: Tue, 3 Aug 2021 11:30:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210803143058.GA1721383@nvidia.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803094315.GF13928@zhen-hp.sh.intel.com>
X-ClientProxiedBy: BL0PR0102CA0045.prod.exchangelabs.com
 (2603:10b6:208:25::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0045.prod.exchangelabs.com (2603:10b6:208:25::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 14:30:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mAvRa-00C4PZ-Qc; Tue, 03 Aug 2021 11:30:58 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860f2e2b-6520-4ae4-33fb-08d9568b504e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5141:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51416ED2052D22053F5BF302C2F09@BL1PR12MB5141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACg18K7XEFTnE3BiAwOeUyVKukBrvpdhWA4W3H7ZF/OsafmTaeLxwFWR0eGot+/OpDWO06q5fIJrOuV6FYYu7yeb/y7SuhZToN0TflQWCmFFAuouYP+AUWQXGJRJnYUF/Ofl4mWQ8zgE3JG34yrLD3rhylD/DEfpP4qro4MZIEAKK+bjsHlHEu6PTAdq7oeJv/cqN2WR0E/tt5Kwxh8EFeUlmTGjzKaEGzmMdJPof+FuQHRJFtvcpGGQkniUVNNhHoXILlqgK5ltPTnZ9x4y3Pjda5sTiSKalln+3EV+dcZiVw97NkKJgZof7amvMvvRO/cbvvB/D3mpB6gtD1x8DbwRr8n18wp2WfQ1/clB3vDQU9XE7VVgTZfzCf38BuGZ7C92VXh0okaNZUkN5B/MvG+gCARKKpUuh8iueotb8b41oJl0kBLWe/it8wDGAribV6CDtlGM7ELvC6WUIjVztBCj2cK26Mb2RDb42fG4Dz0k/k8EJeVuwd2XPJd+LxuP/6MaHJIv25HmzTUWjvCCLxMatXlM6DBbLR9ssFI78qACQ/9vaCcT5Q1e5odErS+UMzf3FztxWjhO0RHkQXo9RTIN4+DQ4Hg2WmH1WKbYu9P6RUBfArkNUUPMfcvbFgNjgzHLFBDtkJYeTFjziT9Vzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(426003)(36756003)(7416002)(38100700002)(66556008)(4326008)(66476007)(66946007)(6916009)(9786002)(4744005)(9746002)(1076003)(26005)(86362001)(2616005)(186003)(8936002)(316002)(508600001)(8676002)(5660300002)(54906003)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCE/KqA9vIbiZC9Tc0CFeF7/0y3raSaQsMpZgZAYXXqxia9w0XySG9DDKqeP?=
 =?us-ascii?Q?pxRNS80YNQQmbCjJQDQnDA/8Dv4Ff4k7/t0EsoLcvZa9ohuvPLiQpmtD+cM4?=
 =?us-ascii?Q?RfLIxc5yIYvsYzpJTSw7GxNWW2IsGDI6j/sPDmZsPiPhJbvAqjn1Ydc2h741?=
 =?us-ascii?Q?bE/XrE3/H5S8NylaymxaBudTdqgBJR+saoWuedpNkjVs8XvYYpBoLzyCt5cl?=
 =?us-ascii?Q?tw3DwO9gQfM1/zCgoXx8UuMdAr6EFIBu6iVtvnfsS6kK8BcSzBIbKR76BrMo?=
 =?us-ascii?Q?y3rgIuI3b4Y8Fkqf3vFqr9vehYbmnKXv5RPINY/HpKCTy+2whaWJlVieDSNJ?=
 =?us-ascii?Q?h/23o5wA0TY5gZntR2n+S0013E9CoWXFlY3yioLuUnSdaYGaKw8/CsRVLrpS?=
 =?us-ascii?Q?xuUIigRFQNrv7XNdhUAeb9Y5liwTSz5Jm/EmjOUuC0zryScjT5DZncaPMmZu?=
 =?us-ascii?Q?kKNZN78JoPINC8CSw7p2HawY3f2qquRTUeN3kzhN53+dqRRLZ469pLStIled?=
 =?us-ascii?Q?yBxKlOG0AsGcDhmZLcAoBjWttjkGtWb16sXgxbwkuwdNZg5pwPvrKIrUoUR3?=
 =?us-ascii?Q?0Rd0aqSerq8j6ICToPSjH+qiMHaIXcqSos9IUkbi4hN+i8P3Gy0RnTvW4cw/?=
 =?us-ascii?Q?7zGu8YLposf6jURz+OgRuNS/ts9Wal9KhvjdQ/zZpZVlS0Yv+rCIAIJXSBYT?=
 =?us-ascii?Q?08DIHpyp+loH4uoRCoYwY5O78oI4julgyxKXfjSmHyvaChxQmTTVkiAKNMQI?=
 =?us-ascii?Q?udJPs9W4CJqIhENE2K5HeaSNlJT2ItUd/nEzRQR4UAWyBZqZmGItJTpNPqVV?=
 =?us-ascii?Q?pyBcfUTTMxz0uw6E/BKB53WXsZldi7E2mqLvjD3T/UaievAWWJX8wAEocBJ0?=
 =?us-ascii?Q?vALPp1+lkpqod5rGQE5ZTHIv2OcJbCxQ/0/MGJKtui0vKI0gHGh92l/i6MAF?=
 =?us-ascii?Q?u4WTKTkd6oL+A9zIO4xcvW9fGOxFrlMRXb00iQ6s/JhhqGzeHeWKUeaMoi6u?=
 =?us-ascii?Q?goV9KAh/qti+LemNoPlR/2ydzjOU2MOoKtRgkulZ//8YhxxolYIhbwXBgnyo?=
 =?us-ascii?Q?z7/RX/3Rn43/sakLtNI+Ccp9hzZX8td3H3hZEJYYIl7eqmuXib3ugKEAsX3l?=
 =?us-ascii?Q?g1kiX1TbOk/D1QsshtDC+2BzPXkGsE47XHfVWtTsPYUE8ZLJQzwHzYSOySFp?=
 =?us-ascii?Q?Xzj42ZhBFUDoRcNCH9RE1OMrKCuTcGLKnsVE+nw3/LB4VUVFqe4hMupU32tN?=
 =?us-ascii?Q?fwCpvoIKjhGLUJuBMtcnZU11hPYYuG6LbcNyn7s+qUjHgfWOuLtcCbBcpKV1?=
 =?us-ascii?Q?XeO6yxp/Q7+u3QK9tlpTGPlW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860f2e2b-6520-4ae4-33fb-08d9568b504e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 14:31:00.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQevexVoQJXy53J6hxJlPcKmdJS3Y3se2BUL+wATiQn41SVJQSKM1n6p/+IdwlHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

On Tue, Aug 03, 2021 at 05:43:15PM +0800, Zhenyu Wang wrote:
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> 
> Thanks a lot for this effort!

Great, do we have a submission plan for this? how much does it clash
with my open_device/etc patch? ie does the whole thing have to go
through the vfio tree?

Thanks,
Jason
