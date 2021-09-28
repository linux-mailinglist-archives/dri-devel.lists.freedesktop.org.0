Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382C41B298
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 17:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317C86E8A4;
	Tue, 28 Sep 2021 15:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFDF6E092;
 Tue, 28 Sep 2021 15:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSeFTTvvINxp02xhyXKyl2Pr9xZXPjKEmWmyvXa6ejwuMqbQFFZTm1QayJHynH9TGg5cLgcsXtmNtmVzFvvsAkY6YemjDhtwtpVXqU9lormCqNyb2UzmYqtPWulkiwqGH7PoGXaVlrK3lI5LrFp2onb7s63vq+qbDnJR7UCuf9IhpFQp0E0VDP50Dp0aRosVxRn1A+fAMnITG4Dy7ev+yb+P7O0VclM3LrPqLYkyyfdl0WexqH6vKCDIZDAJDO0lKFkuUbNmAZQB1kN/JsN0ZU7qQqaB20fyWcsb053YVqqNTuhSgDDw3OWFUpEO30ZeBq37oNi1jcEIjOzIQNiomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GjN19T+4kePjMQhWKkLkNUYNJ1s9bpmhIWXfMTmy37c=;
 b=dP9XGHdu/wz2elSTCAT3R0VcyhuZ/eiP3PQ6FCwcAVD5IoIC/Ma/PeBCWRyyS51rYaJogoKHmzGrOhVRRqL1F9c5MOOScGLVrQqXxYQwtAeEjZRQoW18Of/DiCA7a4jZBchFtfjku5gDbrzBh9ezIJWVIKgbe/471MG/6P/ofPp52AMK681N3qgAaDs6rxNfk85MJEAb1NfUYhrfLPtuaVeFYV90iW6vaRsiUWy0e228PFu5NqZg5A5T7zJZyM+7qUbvkbvQ4dcMQOu+0ocfEDl+wxxGBIh5vbVSzT7cTE1H9JueZmEG2qVDD0HTvWmjurYsvPrmDUfcoUjG4vPKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjN19T+4kePjMQhWKkLkNUYNJ1s9bpmhIWXfMTmy37c=;
 b=HKCRhQBbgpscuxPMTZOdq28ZQ4zN9JHs1EArhGHqaIbsTpUqhTJnmG3T5pbHDZxkFt8+epmAARMMGimbbnQVOp3zceA1pg052cE2u0up7vR+Wq7ySqWlg5pAm7U3q81F7oAgYIwct7LFsskXeEGhMwr8DG1TWxPnmAeIaHnOzpj2RTl+uC2a/qJmh3bP5Ttovfj/leOK9atk12zgixySep1NNy3hhwFL7Ak6jmYqw9wRD42A5WmbQXxlY7ufvtdmD9ugwp5GFoUX2zwMaFn2kGpB3fn9TPlq29oUM6dTo9fZHwWwcKDULLvADsMG4QDa+OKC7Ly+Z35whG19ZLTrLw==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) by
 DM8PR12MB5415.namprd12.prod.outlook.com (2603:10b6:8:25::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Tue, 28 Sep 2021 15:05:08 +0000
Received: from DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::3817:44ce:52ad:3c0b]) by DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::3817:44ce:52ad:3c0b%5]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 15:05:08 +0000
Date: Tue, 28 Sep 2021 12:05:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210928150507.GM964074@nvidia.com>
References: <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
 <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
X-ClientProxiedBy: MN2PR15CA0048.namprd15.prod.outlook.com
 (2603:10b6:208:237::17) To DM6PR12MB5520.namprd12.prod.outlook.com
 (2603:10b6:5:208::9)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0048.namprd15.prod.outlook.com (2603:10b6:208:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 15:05:08 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mVEfL-0071oy-0t; Tue, 28 Sep 2021 12:05:07 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d49200fc-e252-4986-b7d0-08d982915c60
X-MS-TrafficTypeDiagnostic: DM8PR12MB5415:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5415A7393A6679C7BFCA6585C2A89@DM8PR12MB5415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2k0M8HQ2q+vM07BshbyJuZUUvpfo5+mr60MN6LyLYzFU+F9CVRsmSXBeMPJ0nm5OO0+J5BeMJuIKlU1IMSugQtL0L09U8N2ZEHzi4LcgUTRVPKwYnxTRZpHMVZfja+DNOepH84dLSwywajd9ssFU7uEv8r/EefyEL2MINtreYfx5NJxcTx6HPI8sJWONo7Iw2Ke7EpSYwbfz1rYrSwc9MRWQmzUcw9anjsjReAsl4zPAK4cE/Lvr/wywoM6AXw0JsdG1t9vRyd3QTaFsIOcIU7Yz9t6u+go4UBTWXIRLJSK7GKaIf6PN2vWtHr3+zxMlPYwG9qhCeb+DBK0X+6HiF7DC6ZY72dFYIHK5ohKe21NJW1+LaagtgT/920XONdghJqV1Cqq1+y+nG9hlQRL8xWwKJzVPVBzzaHr7QFLcJnd1eQLubHLDl0TSbaZkU1R7kLZEBgzJWiztVhv9sYpQpSfz0YUsJEFGHI687kpsuGIJ6PjhqejEh/trtGL1PSqLnfezEG9Pf7JuWXPunaBwfnzOFGOPrGAPRi5XPgmOmrkKQuwxaYPBx5LX11wxeAPbzeAMjd+fSwUV1sE7k1/adIi06xVUIUx/KdDo+d/i31rIGN3EmgqUrNRXkWny0RHxc1kxgpdkFL/zko1dod7quhk3ms8YfC+XrTvJw55ZB1yEhZ8oLiRF66B6A9czOnG1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5520.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(2616005)(86362001)(26005)(426003)(186003)(1076003)(9786002)(4744005)(9746002)(7416002)(4326008)(66946007)(66476007)(66556008)(5660300002)(36756003)(316002)(33656002)(54906003)(8936002)(2906002)(6916009)(8676002)(508600001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yuzw+awn1q5+Eb/oFeSRX33+Hmgt6GBGzBEctLEH7L48VO6LddEnDfnnPgP7?=
 =?us-ascii?Q?1LmGza6nA7YCea6NGAtjuIe8daCv+oggTxt+mgYR6bCpzfq0dL9M/YhwRjIG?=
 =?us-ascii?Q?P78Qd3WL9Uq+v6n/ULeY61btyCfianwZgaFZfj1xymUzwgr1Houf95xjZzG6?=
 =?us-ascii?Q?N0CzxJTI1Nn6Sqa7qNUdcC0zt0xPB02bfFFmkWEqp8VRvakktjAEFwjzBPVA?=
 =?us-ascii?Q?fuA2ZnKc74vAanUKdFFUr63KOb99erTop8oZRAgXg9pZ3zImRwN+rHIj4P7u?=
 =?us-ascii?Q?AHeNT54g6KoNpqffCOiYWkHFIlTAsoqlfSB9YELyYLhSn0nsIRGrQK/xRILC?=
 =?us-ascii?Q?0ZzH433jclUN4QBQInqZ9LZ87gtnVux4SpNYF5SZAMmhU7r2C39RapHekfzi?=
 =?us-ascii?Q?8HAip9b+3/2M1Wbrd8Ig7T3FVxB52OP3QGVB+qB+lEpMuAdWoMg9ccihIuZr?=
 =?us-ascii?Q?ICwUM9VuhouRXlczGhleEkvnV3kL6nVQnnPosagOVF/0Vi/ZfLB74IETNBsk?=
 =?us-ascii?Q?DAppQGziauLypvo2g3QD9qr0RhWFuatVFefvwTHQrLezOptt478fhrw0hv2A?=
 =?us-ascii?Q?h8VX+L04gNmNla/Eh186bODKzFgmDePu1SCIS+o2mY5nNbPR3G/qBiSkJhTA?=
 =?us-ascii?Q?7yZb/0FNeMhcWS3uBpBHkvgIGIjdylnrddo7PBm4Z+z+kozCdD1RCaP+Jtrz?=
 =?us-ascii?Q?xfOr+M7eP323JMTsh2NxggQkXMnWU32fYXm77hp0oshily586UqxR9aSE+AK?=
 =?us-ascii?Q?Sa6Ly7xH4wxx5K4bLwsUiyr7XfcvoPBj5Xh++0emLoPT2ve1SvY/YdP6MdnF?=
 =?us-ascii?Q?/gW+CYGahN/NFNn6Clzd8eOn04qoxUP0BSAkfpNrWMb2kAPMKKePq60TnDM+?=
 =?us-ascii?Q?0ZA+iC2iftaYe6GTcNO/uumbwKe7/23qYHid4xGiXC3Vsz7U65WcctX1Pi74?=
 =?us-ascii?Q?eEhf5rbOY228xj73Ev+nFj1XPRGoNGwEvefa8o+USmPj8qzoOkWp2/sf/eYd?=
 =?us-ascii?Q?xg/RLEmNd6TWpySGJSW7UdsjmqTKaYNDZwOsFG1qAkT8UpVTYdSLL1VDhuVu?=
 =?us-ascii?Q?ApQEuWjfpNTPMH1pGt1tmdo9MfzkIwBN1FBRJSis+pL1rXYs4ddwFaI+aVWo?=
 =?us-ascii?Q?Q30a5heiyC/4EbPRd6095IARDGByyVRDFA5HaTEq6aGcq8yt9bmgBkVS57pf?=
 =?us-ascii?Q?rdncRqDtfdR+eG067D9ZJzI2vUtgm8bm1k7OuGhFETD/JUp77cYidk9yuLXc?=
 =?us-ascii?Q?SpnyRHIYS4Y/bB+oO6sucp499X9C4qhBHiszPNSowWCPpLJiKCQ8Gs63YuZD?=
 =?us-ascii?Q?Qnoe6KPhQS4a9/RU3cu0jD16?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49200fc-e252-4986-b7d0-08d982915c60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5520.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:05:08.3437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z205BWTWngIAgLT+yFsAaat/MHLtMcS6kP2Rw/PRiOwMN0J5ulMp7hyJPEMIXLS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5415
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

On Tue, Sep 28, 2021 at 02:35:06PM +0000, Wang, Zhi A wrote:

> Yes. I was thinking of the possibility of putting off some work later so 
> that we don't need to make a lot of changes. GVT-g needs to take a 
> snapshot of GPU registers as the initial virtual states for other vGPUs, 
> which requires the initialization happens at a certain early time of 
> initialization of i915. I was thinking maybe we can take other patches 
> from Christoph like "de-virtualize*" except this one because currently 
> we have to maintain a TEST-ONLY patch on our tree to prevent i915 built 
> as kernel module.

How about just capture these registers in the main module/device and
not try so hard to isolate it to the gvt stuff?

Jason
