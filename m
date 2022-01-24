Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015954980E5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2762D10E95D;
	Mon, 24 Jan 2022 13:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26A010E95D;
 Mon, 24 Jan 2022 13:18:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cke3RNWzWprJNQBJWo9BfY1LTnI3kFj8gl9+hFnywBfSv0Q+FNiBdsotooPljRxqylfoAxkvMj0KAUmI7p0itc3ua+/EVcfa2KLny5KgZY3AzngxrA7JbXUBQOOPFNk2GyZg4HGqt/L76vLWC5aPyqusKCcaMxfe76Aq/o2m8JvAb54Ykso3V4Pgcp9v7e/zleuxnvEzJhVFxiFBkVzMPd4W9GB+TkicsLrh0xpU0PI69/JO2OU/JuA8l9YyQOxHRO77dHmfgHXGb7qf9f9AN7M/P1pTj6UJPJjkV+KHxHwyQ0Ujbz9qbAhaQ+DM/7585yoc8ThKLFQXYKCrJagDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ1ctbYWyR7COQ+Vd3WpqAIK34dkCpUvsvES6mASoQ0=;
 b=Rue+17aPsVJjQWGn8dmH+dlg1DibxDom5utxqLkpx8j+RA9itRlrtNy3gcDB8nrIF/WHz69nqxyttOrBXOcbRtdrxJMGZ1JdDzzOjR5vcW00wiePgzSVD+0kKvSz81lcuEyUONzfNPsgWQH7xJm3IYPp/K4vs7LhBYi5EYxtYPfMYVMQtUfj5UYvfqfkDlfE6An9koaYBIZ6ZI/anGg86xcbT22E3gU5Yj8WadBTDcqbFUcSB4Q2IMYC7DsT8iLPKfY1D2qSTLlwuOH08/014J4DPF+Im5GKk2vop+v1tv0MPb9wbkdwoCsswpHVs+xUUkFgwkzYQjO6TX0i/wiing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ1ctbYWyR7COQ+Vd3WpqAIK34dkCpUvsvES6mASoQ0=;
 b=li0jf6UDTeMGeYkinLYa+T9nbpcc0MkkwSYw1ernUxD2Nn46W0bSsqFr3XcFif3XvLWOcG+kSHlp1/feIaPKPOAzwuBYOfxK3u1IbNQubHy4rgUd+aG2tHHr0n4NHPnl8OL87pvtOVCPaCIDfvzOXkiFo0yQ8+jmiqxnif43d0NRZ4V5F+5VOfUBz8tL9S4Z5LtOpu0KeFyV75frAGt8/zYGP8V3ougreVQGjkWbXgTVZPDjvS6dOYkQmJGeJhphXnfdbUSimUGkpqXzqM2WDEBG/qjtEjHLZ4O2fLzM7G9SMKpISoVgJ/WVqBZYM7tpF/4TZbFymj5ucVOa5CDWcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR1201MB0076.namprd12.prod.outlook.com (2603:10b6:4:55::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 13:18:04 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ad3f:373f:b7d3:19c2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ad3f:373f:b7d3:19c2%7]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 13:18:03 +0000
Date: Mon, 24 Jan 2022 09:18:02 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: zhi.wang.linux@gmail.com
Subject: Re: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
 support VFIO new mdev API
Message-ID: <20220124131802.GA966497@nvidia.com>
References: <20211129123832.105196-1-zhi.a.wang@intel.com>
 <20211130164622.GA15150@lst.de>
 <e183b95f-89d1-3a2f-27e2-82aa2b10e8fc@intel.com>
 <20220124094004.GA23537@lst.de>
 <004201d8110a$db3ec9e0$91bc5da0$@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004201d8110a$db3ec9e0$91bc5da0$@gmail.com>
X-ClientProxiedBy: MN2PR12CA0016.namprd12.prod.outlook.com
 (2603:10b6:208:a8::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d99020-6f32-4a0c-92db-08d9df3bf3de
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0076:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00767D30F1E62C5967BE2728C25E9@DM5PR1201MB0076.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BWc/WfkJ/SMumCaAQwFEVk2Q7TvuHhh2XlykIlZsm86F0O7sh37nZa1E0AjS5MqmhTSVVZe/jh0yoT6UVshiTFkpMUP7Aa65KAoyQjH+fbGYPy7z9f6C1CqEek3C2ObPRLQz1aOI+sDxpzOacYyYNs1TWTRlrxRIASprAfsHjb7ZN7Yg7BUmjX7zM+7GvsQ5+VbfmFdnZM5dHVeRAa7RhQuCmDGZHc2dSufHMXbKkfaC+thU5ndIAzfEOv/0uZGCAXd4SVjEuK1GC/93fhLGYBNfO8NxMqdSPMavudE8wceE1IA9NLCLCQulBYmmuICWlMYRsSif96xhLNfCKTFoxjbnTGmOpK4jmQf8JbgbfpPok0sN1rUXV2M5kRwlPL5LR5C77sJOJhD+3SEDCabgW8Dv6N2Ecyg5V2oXNNKL3R0iyxI0ow2nCZ2vU07ppyO4/38ENMMstFScOwUJ0EueEmlerpD4xO39L3EISEect84CYnPgR/yMEcicmg2Z6Bd+9SsMQ/2urIngeHwhKGSctXpXB5e9IvvnvS0MPrJYowEuS/DOOOruUxjkkn5bhWOvCpSeIvbcqEmrVtBGrPKl2PhbsIgopgl1Pj+7z7Xx2oYizTwgCLLl64ipxoq7MhFbjMlGwKMbFwj0i/XsTYBPXVvqreSNyKrAsP1qFQCl3LbezsItGsToAgf5kymGX6W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(508600001)(86362001)(186003)(66946007)(6916009)(66476007)(66556008)(2906002)(33656002)(558084003)(1076003)(54906003)(6486002)(38100700002)(7416002)(316002)(8676002)(26005)(4326008)(8936002)(6506007)(6512007)(2616005)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?naJgoDZ5K0DuQxmrB44V50FH1O6UYqtHKwvGK6zOrVmPy5x1dbYVGZbTUktn?=
 =?us-ascii?Q?V/c5zxEuxNvJNkJDfyOg8OTc3kCVZfdKE/jywBc/EVmAOWiwjbsZv18AgLvs?=
 =?us-ascii?Q?zzELNgS6QMcYwMmdghBWDyFMG2ub/XfboIJZlOK0HZkEIp3+CxsC2EynUVO3?=
 =?us-ascii?Q?PrfLLxfHGNKtCj8vr/349jfE+K7OP7SLwwAaUQX6hBo6EPmv+YjIrigwc419?=
 =?us-ascii?Q?V/QcfWxYOm/UaTl6aaz25NT3+uR8kGqC7aHkzJKgTHHwAXPb3P2aEHsCxtq0?=
 =?us-ascii?Q?R6FdK6+kkV1/9eNcZWjN7YixoK3rgri6y9/6QEEus9B3JAfvx1DWjVpTUbU8?=
 =?us-ascii?Q?SMBdi+kXmxKmE+Lw4t3fv/wty/GmlUKN3rkKC5ww1Qy52v8IkFonGcOEogi6?=
 =?us-ascii?Q?BYcTZS7But9Myi4fVgS1mQSgQqcL7nrd894qZGDAiO+owAiIwxGF+msiSviF?=
 =?us-ascii?Q?oO3BcnHkZwyJ9B9NpNfrEjiyD7aIcxPuYdjOcZdQ6QsoCMpOsTEJATecdLDO?=
 =?us-ascii?Q?cAFIwnsntNk93pVvIJcq1LavOWlQxZLfYkls/+uKieOX3QyxsP+4mqQ1BbfP?=
 =?us-ascii?Q?4J0WodIoCit1bODSfGbBkTrfsz1MmeAn0sr8Mlb27l2sEjDMePd5BBmXwb/g?=
 =?us-ascii?Q?1jj6hUjiP6SUmWLFo4nwhIrwL393x4pDoyX87lKR9JulwjBBgcYvcSgyTA0K?=
 =?us-ascii?Q?POOFg3x0osKM0HLqvsQaaKCZbF44JfrU8jNWsTzTmGmpuL2Qj1UvMxlq2tx/?=
 =?us-ascii?Q?Wr+x50xXGp5pPRFT2ZCkIRQOTqUWjHRS6uXEUC1UBtL0tlfKFqsdxUrF87Yu?=
 =?us-ascii?Q?/WqUxStYViXfdR/9P03FJr+LGO58sdA8/2D8F5lYRlq3RArb/QgEkVH+SsDE?=
 =?us-ascii?Q?1F+kjcCW1lGTx9V9r1f/BObsW1PbCMoeRC6Pnb91MyZrZC3uLnjnQzbwFsxr?=
 =?us-ascii?Q?/ihOwJVzSK3xnEuFI8/oMLYujVy2sPiuFjtey42/eqBrovmnd+aG58VMFTxi?=
 =?us-ascii?Q?BSZRZA3vdeJMfy2aHf7QgIYYCm1AscEM0c29oLEw062050gVk9ijKQagfCcP?=
 =?us-ascii?Q?EXOIMtWfC+vaxCVFS9TEuuwT+Xp6M1neUFo1WKSMVgO5NZaE0DdWuSPSn4Qf?=
 =?us-ascii?Q?92YbNi8APmllYLxoarwQCr5xCEFkYhKA/gCYagREqsj22iZXP5xxTPf5fn2t?=
 =?us-ascii?Q?g6oK0SC+3jj+DyiP4IfHZo6/szUVgJqkx+Kn2JiLb7QevhmtBAQuw+0cp5pN?=
 =?us-ascii?Q?fIv1mT2HVSVFF9EnVuJp/MfZUDVcxrkdyQNJZZwKA/I31uPZ9PGzYBo4wliA?=
 =?us-ascii?Q?6DgCzcpRG+xFAki13NR+2lanZ0V7TtOraAKVdysh0145Bh3A2T0DIkYx/RJh?=
 =?us-ascii?Q?Q+z5bzRzvh55TcTzPfHUNE2tnqm5Qc5fHj3c2bACsA73c1TLi7MSma4bPV5b?=
 =?us-ascii?Q?o3RkVL3Wy1ma4HrWz1T1UJauLFIgl2Mp2DvBVzc0JErFMgpaOAG64VVRnCHI?=
 =?us-ascii?Q?WpvNbt/vZUYDSUsWWgpMraSSBltwpO1bs98Kwh0SLwQqMCi0HTZNqvMB5TLO?=
 =?us-ascii?Q?v+ztnzdrSssvVNmhLrM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d99020-6f32-4a0c-92db-08d9df3bf3de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 13:18:03.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaQW7fT3zbopg/B13Q5AEFy7QvGVTZQRKT6KTgpydHvgmqoJ9IvsRJXU9aC/SRrL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0076
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "'Vivi, Rodrigo'" <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, 'Christoph Hellwig' <hch@lst.de>, "'Wang,
 Zhi A'" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 12:12:12PM +0200, zhi.wang.linux@gmail.com wrote:
> Hi Christoph and Jason:
> 
> Have been talking with Raj. I am going to work on this series this week. 

Thanks!

Jason
