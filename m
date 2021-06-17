Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95F3AA8A6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 03:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615489483;
	Thu, 17 Jun 2021 01:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA61989483;
 Thu, 17 Jun 2021 01:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbVaTCpA+N02I05JJ5JF5/Fx25sQFJlNWu2YSpTrGS6C9qg2BA7l5dSREV6KvPeP740Rzs0jTj/GbOGpw+pZSjA3GHMXfLb9szKzQi6PdNMTJsOZnYB53HQLqCB5V/E4YqPEXczO50OQqAbVGJJOmA1+iV7iwAJg/3tKiUty7v6Smn/fQGF4Mk0kTcVZD1DWIwFGS6jZx4QlHDthHESbWDIJDSxOeyJQnLDLV1PbfYGSPEQaJO0YO9WgqwOUTXhf3P4J3dYRIxhwzhjXWWiXhrQKEb9r/l40f99tw4A9fXt7pxyH/2TIXLu47gBAmNzpF1PZCLUydkUFDO4qJc6nNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlKxOOj/AlWvHMoZ8DOO/LDTIY/Jx4h3ym5obh4MHLc=;
 b=TydQBzJQAGX8QBtecXbtiJb49nVRx7N3gN4MxNJyhcL1gKbS70hqslDagn4dfuHp26IS2JuXP1H+aKy2mY67hJzBKMwpTrhnBX1Dfz1icsHdrXrDajrQ/AtpeZt9TF00rPNJ5YendRMIKcKn8vEk2if2n7SqoFL+Axc4gxQS6OkO/RubJJlFgWDSg9wOiIyhFnjq6prk0oKlFe4/P2xhOVCG4+1Gii4GDOXfMsF7PeD7RQzWCHklw4oTHhKXyRYOV+hvjd5klAkXU0qblU+pmN1g0r+YQck+LrCfcIgzABNrv1uc0ENqw/z4dYjXham0LKi0/7RGDA6oHCVmcjrNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlKxOOj/AlWvHMoZ8DOO/LDTIY/Jx4h3ym5obh4MHLc=;
 b=JOgN0vY5ibhL6QVJO1g5UsFCe/CHS6lJM1oMfc2H23e5paDDVPEt0ie4khKXbjBRv7DdMx8zB2LryRyHxbzJZQefmMkwN8WsTNtruHiDBa5ZvHvDGXy+Gu8fyFDS6HfR7baNA4CSctB2BGMnoITC86YPJEG2eJGu7oxeFGvH6bxk/xnJh8T1I67CX5CQ9zllkeR6Szgm5PcsQ/e8/B4KGpBvneUVAWAX0NbYTmCGADkTXy0dV+6FAzb8ZBrfIPiD0R3nO/qbNUg7ksNG1oeojSYDk6pzhZ2r8k6NjbAwclfqGpFL1GJBEdsISD+tfk+jW3NbjA5rQvbgyymCZXuEmg==
Received: from MWHPR12CA0069.namprd12.prod.outlook.com (2603:10b6:300:103::31)
 by DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 01:32:52 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::4) by MWHPR12CA0069.outlook.office365.com
 (2603:10b6:300:103::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Thu, 17 Jun 2021 01:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 01:32:52 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 01:32:49 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v11 00/10] Add support for SVM atomics in Nouveau
Date: Thu, 17 Jun 2021 11:32:46 +1000
Message-ID: <2551705.0ki4MfuhJX@nvdebian>
In-Reply-To: <20210616163529.7de2f6e24d395c4ef7a367b6@linux-foundation.org>
References: <20210616105937.23201-1-apopple@nvidia.com>
 <20210616163529.7de2f6e24d395c4ef7a367b6@linux-foundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77e5d6e3-4aa9-4502-0660-08d9312fd320
X-MS-TrafficTypeDiagnostic: DM6PR12MB3355:
X-Microsoft-Antispam-PRVS: <DM6PR12MB33557DFC4C046DE70127C91EDF0E9@DM6PR12MB3355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsS9q+2gn1MR585nd5i7vlqx8Ayu4mqD9z29YOlA7DDk7mliiY/obV5ZBE7W6BCKw5Z6WNJWfqc42IKUa2h9lgINgxWU8MkFdWVss9y3Vz1RREJVF3Olxo7S29BrT9VzzY6e8DhaI8kREx9N6h7r92qPdmmUzu1pDWgba0spwRe+bObOwdb+VAFwxO7cOe9IfdJSlCN9i1Bu2kz8QXy1dVMGn7RcX3QIVmW6A8YuLb6Mwrs8N4EhKf/wuX3L1jPRinXWjd0Em4X8T3hBsfB5DZbkJvc7CpD9GBxym+C/EikG/Jun34r19gvJdaisVUidWv+LUD+sdlPmdHytysNLNn1SvQ0FJkQR/WEKWiA/OiWRa0szDmGQ2lPmW11SZG3wmbHUx7yVNB6BY8CxsKghucSVCu2wM3iPIM4CA0EfZAPQLYkW+OQpLuYYz4nYNlkw1qCT/DxaWANtJ58QK/PrKXFzQ5ZfUEia54ctrb3LFXMlkxYq2jYi+1ix950tGn765CnR9ZMYdFig0mbWWzym5tlKWTpMN4bvqLNegJgoYHN+vQoqJQWkLmlahQ09oXYVAj/vzk1W1xpUguONkJ07auysDC4TePQiWf45VlmXwdcR1T+PlFxlLqONeXNpj1NCTC6pKXIA/einAwqYCfqhrCD0B8VQ8Bp7u9w3omjH7PH+hYa2ujUMpLZzFQ3APRiU
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(82310400003)(86362001)(356005)(70586007)(36906005)(9576002)(2906002)(4326008)(70206006)(107886003)(9686003)(8936002)(83380400001)(7416002)(7636003)(6666004)(26005)(8676002)(82740400003)(4744005)(478600001)(316002)(6916009)(33716001)(54906003)(16526019)(47076005)(5660300002)(426003)(186003)(336012)(36860700001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 01:32:52.3821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e5d6e3-4aa9-4502-0660-08d9312fd320
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3355
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com,
 shakeelb@google.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 jhubbard@nvidia.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 17 June 2021 9:35:29 AM AEST Andrew Morton wrote:
> On Wed, 16 Jun 2021 20:59:27 +1000 Alistair Popple <apopple@nvidia.com> 
wrote:
> 
> > This is my series to add support for SVM atomics in Nouveau
> 
> Can we please have a nice [0/n] overview for this patchset?
> 

Sorry, I forgot to include that this time. Please see the update I just 
posted. Let me know if you need me to resend the whole series with the updated 
cover letter. Thanks.

 - Alistair



