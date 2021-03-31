Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C435010E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E916EA92;
	Wed, 31 Mar 2021 13:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606D76EA92;
 Wed, 31 Mar 2021 13:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXILF48PnyFbFkrS1q13mxKQWRFjJqDtZBYWxY0UyrqUo+Xkt3uh2EMFb+bST2wppl30Di+Wp9f1yDMLjj7Yt3Ei6mVtPPqKidXYXyG5llts9JN/XLAHtRw/nzTiuJGkyd44wz5f+8jSFDZJKKPjDxdY3y92nudPZMDFlf3pJNEqLkzWJyTSHhW7T9DxFBR/dhVnm9X4k41lX3XAjTOVlJ3YJ5rPeSCZeGv/gfmhiAGaRw0Vv1gvxHoEG0VCE1WxGptSZ6kawSdNGcc0JdT+qox4+beGEPHPqHYAevh1//S7RugabHnFsKOnxt7szIAdq1zpWYx+HDmRnznmZQSnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlhnMtTkUpX1kA+uKlDmuSSqZMNG49k8FII2Mojvj/w=;
 b=iSq8Gyb1tngyucSZ4Wudtgfz11QohmWjBWZk45nYPsJ9zVKYOZHjrEdW4sjlrjpDkh8fKYOCo8Gikot7Z6AXojMdmuPNOFnmfP1+AjG8WC9AQ4It60JeM1MeA7e4mnswMouA6Ht2cyHd7rChoqe2TSkHHuCS79YOcQlmd4s93PmfI0pBGPd0UnamknBdytH8vhJ8VcJ7wIexPqDW0fSsvU5qAJGSRm1219iIYP73nqiOTSHXeWCVh/sUpfPBqCJDlJlqUWMQaw2tpHOEZ9f+rupKY3nFpTicu1B82/VezD7+hRfV8RPzQaCsqqFM5ovBKo/cgt7B+N/SJ4t4dXs+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlhnMtTkUpX1kA+uKlDmuSSqZMNG49k8FII2Mojvj/w=;
 b=JF+JZ+20w7jDZtOUpFhNddxa1weoWjG+qqhrHGXphKpvfMdq2Nez+Edb390KIuLrNbmWknmK7wPiXS9WA0S37mM7Q3tomErXclbWdLIiCmhN2bHk4m/M3kiyqs+yvw7sccBhoK5aih2Ozps0gDDY1gvhYgZoy8+8BrGLI3bzFNEWuSXmZWCxp+ZkFVJJyFZHOz8HReEWYLkXipUXlRPTrQYwf1I96bMKM08cRQgUTWZSqnLENIj6GhiAcFixF0jcdS7GauUE+GBTnDQHKbaB0kO5vefRkK4apAviXLls+P32yEjnHvmRzmnAGVDzHmb8xkItCqNps5Si2fVzqTC+GA==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BYAPR12MB3015.namprd12.prod.outlook.com (2603:10b6:a03:df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 13:18:56 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 13:18:56 +0000
Date: Wed, 31 Mar 2021 10:18:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Message-ID: <20210331131854.GI1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-6-apopple@nvidia.com>
 <20210330193234.GA2356281@nvidia.com> <2521635.masqiumSp9@nvdebian>
Content-Disposition: inline
In-Reply-To: <2521635.masqiumSp9@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26)
 To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 13:18:56 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRakI-006L3M-IL; Wed, 31 Mar 2021 10:18:54 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfac68ed-7f70-42ce-6c87-08d8f44789b5
X-MS-TrafficTypeDiagnostic: BYAPR12MB3015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB301508B67B0CD76372A457A8C27C9@BYAPR12MB3015.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be7oShaDiPzydrgxAuVFueGO0Yz8SuMlDnYn1aBKTG7zSePiwzKtJWG3Uo5v9FRE/83dlJXsMkM05hc+kC/XkavQSToQCWOIYgfBKzFWBiLxL4E+GmEj5MnBkfh/6xf7h/2iVi2KlojLbBtPL7O5rI/+1veZd7vjuDtKMVmVmip71qUNjCz/WLadmu5q18yAV16QMrkUQj04rKRgt+7jcQXuk1HWL0viZvU2Fn6lzWLf9yOG5Y/rYTblvsqyfdIWZ9zck01I6oeHokYcH/+uRyhia0tC5HTKFeRjz6UAoZCpyWpgP/+kaW/pMtSyJ1aHfcbVf4V/0zI6BTNFB1lK92SvvlJK4xyvzvBuusd8y7UUOzJ+UgWNSRhvfL2CMnqPaksxKuodCAv10uWfXK7utSYgDIqtkCZjQRg9RbrLX/aUgl1JyFqYXPS2yasjUfhU7uqtvDavS3hv6rFgbFXw0JhA4nLgQ1py9qG5dwwCvAmXwrgRH1P4CVQhUmlomBMR2foHDZwpdDYnXAILQOfPTUALsQMsDehZSuwwrjWkVFn3tt96HlZjLB8L4KzM5FxEebZQfWXhWb/g8+/TDf90ynUWeS7RK19z0RhRjxcxWqCMNhuL+tOZl17z8EzEZdWCWDvqMFgGKng1ckNBS4Jh2n0/R8fxzKghG9jC/BF4ywg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3827.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(478600001)(36756003)(4326008)(66476007)(8936002)(7416002)(9786002)(8676002)(4744005)(2616005)(33656002)(316002)(66556008)(9746002)(186003)(86362001)(38100700001)(6862004)(426003)(6636002)(2906002)(66946007)(37006003)(5660300002)(1076003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DEjhNYEmB85i8x7IAKs1IhnqNfhlzJjbGxWE8ttkh6zuw+OIxQbvw8JAyW7P?=
 =?us-ascii?Q?mqr6GvKjp1z7yOuGqc9pEjnVYV2FxM/sGFFC/CBKfw0D81HmkgyvpA5wZXJq?=
 =?us-ascii?Q?bAnanb42RDjK29MeH1OtVpc4Lm5cNaBDR11DzgQruJi4cgueQQLWRuAMTOQ8?=
 =?us-ascii?Q?QW/DN5rBVMkXtJZ0sPFfUe41qM/DNxz0OtQRm+07ZJwlo7GYBKIwbnaaNTRC?=
 =?us-ascii?Q?rZ5KTT1ClAqOgzxFGEJhFglsDZDxXLsgT1LFPWcJAVQy0uaeVXWqjVj+gaj4?=
 =?us-ascii?Q?hsGYHOzgxWRbG1MLWDS5jdDzagWjTxXp9tJ4vkxcaBi69pyG6ttS80VYVRnD?=
 =?us-ascii?Q?M+SdX9BH5c106/gwrQeEdEpaM/LD3yYx5o3u3j4he10bzlNHEORWuuUc2HJ+?=
 =?us-ascii?Q?9hgmJmyYJKgqO4MbzPOejMfBrB+Lzkp2sno0mDHOknjvVvbHwYwvtcuCvPI7?=
 =?us-ascii?Q?hG21DdsF3taBWUeKaubq0J7QzA/OcWsqTl9T2DY6OHVWhm7wwn2DQoiwvFD/?=
 =?us-ascii?Q?F33WJ9t/D7lRx/KQGp03P1vmt0tuZQXMMj5bAxbhC+CrX8QB/ERZaM85DB7I?=
 =?us-ascii?Q?Hmw9AcFuXmH9+ue2yVe1dpbG0nUG63+AS4dqGBDOHM6Lfuz7cBm2nf005+gU?=
 =?us-ascii?Q?GvmrY+4g6Qxgjik38sz+4FyFv2tfLlBjZ/XQ/9qHH5rfQcQV9WYFn9W57+Ly?=
 =?us-ascii?Q?pdGdmuUemQZR0NrwjASd3GqD6yx1wi6sjbdkPwLnlrjbFQceInW3BIv/3fWb?=
 =?us-ascii?Q?KL1weXKxBtjcKSLJuduJQKSOEt8mZST8y/AoxaRWvFvhNVm4a6HHN9NMO0BY?=
 =?us-ascii?Q?p/JxuoEFwTHrlZyST34XicvjF/q8aePc9LFzNtu3Z9MXd9P+TI3IUjmLlxbc?=
 =?us-ascii?Q?yn01K7eIE8stc3n2Ya8tiK9DV0U2RlIibW2RuwLBoYA7DSh/yKK6CEvURxNU?=
 =?us-ascii?Q?viEjJVtXi+evZ63Tj/iVPl6oUzjc1EgQ2HO5J2VHBBH/UFj9ulSwGT1fV5u+?=
 =?us-ascii?Q?ZO40ESEPkGcyKwsgtVi33k98rCSOlePGNHrymMF04+e6ktWpWt84VTztLqBb?=
 =?us-ascii?Q?skpzKyh9jUhjQOFm2ntt/pCbrAL2s2cp6uLSVBOf1M9JR2rWeY3FLPmREW00?=
 =?us-ascii?Q?XjXwkwHSmnmiyGnRapZxvhYxAQrkaUFgBDY5dZrscEpL5pCC+Jsgp+5Er6eM?=
 =?us-ascii?Q?I9i998Nqq0TKhuj6cq1HisomyWY8N0SNzYRNC7/u4pmbW+XaElHVFDAo4Ty6?=
 =?us-ascii?Q?Ozrqm5aP9MXZfhcawlq9GfrP/ZiVrTaQKsrtFDR+arobQrXodCnZRni/2y5t?=
 =?us-ascii?Q?Q5Sgtv+vKgztc7nkeHo7gHsNPQnWTpbXRbpL4BKZvx9yUg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfac68ed-7f70-42ce-6c87-08d8f44789b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:18:56.5297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV83Cd18wDo72xLjLDdkgq2NoOFWlaPi3FjjlRUbdnswJBmzWukLSe1a93bTuIQ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3015
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:

> I guess that makes sense as the split could go either way at the
> moment but I should add a check to make sure this isn't used with
> pinned pages anyway.

Is it possible to have a pinned page under one of these things? If I
pin it before you migrate it then it remains pinned but hidden under
the swap entry?

So the special logic is needed and the pinned page has to be copied
and written as a normal pte, not dropped as a migration entry

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
