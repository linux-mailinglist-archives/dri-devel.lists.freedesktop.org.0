Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B82328933
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DBF6E87D;
	Mon,  1 Mar 2021 17:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746D06E87A;
 Mon,  1 Mar 2021 17:54:57 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603d2a710000>; Mon, 01 Mar 2021 09:54:57 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 17:54:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 17:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0LNhjCufsFViyiR+sB6Ki7e3MuyD9pWAM2ed7kpoebujZgJeuwQHOb2lNdklQGSl5gb1IA1+n9OPeOqF0qhXUjiPzBrNEVMXxwluwASRfnCtLcJLV4zlBBYrzCWZI1jxXecjjNJ+3kgdirjwtkvOqjU+enli8ndjR0C5i9585mtXOurqgQvUafMb/BcHw/PLm4FCWmNwnFbjlCGWG4zNSbUd78Bevi+bjJM8nAZ3otuzZpdSlmA5HMWCK4fiol+Clp2Wv7VlRnpbZ20VsV4SMTsYxXR8fStYPj1b6olQi0cA5L2pG9XJPKirLiCOvlm2VP6CWMgRZzK6ONrXmqEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y90lc/7CHOvq6P326uUC8A7kFIIiRlcbyV9QLh9EURk=;
 b=AppeGebNaPI4IS67laIXfOndm5AePDB2xPXW34DQVVtXLssf2dpI8I9CAfkX3RPUALVo7KwACYeDin2LOLDGE7DVQMB8IMsxYfc7YVbq5XloQDE+u2519ESt3PvPXo/RuJwclPi5w4Aa/7S+TDb6sfwjy8+qZYNe8BGJbTfP6bEdRULM5KzhRkRdlp7DSFre6L+12uEhtMAdaRHajP68CO0KLLKLnkAov5si99OUnvrvsoDB1c/V8+f2Cs+093pcqYSKGlpjK/jiRxM+roiCpYgVS6WVhq/DvX6TJ4kjZp8BReOj00Dcp3ULM/pIW4CXp/wyKhEG0FKPNI0PKXZWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4780.namprd12.prod.outlook.com (2603:10b6:5:168::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 17:54:54 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3890.026; Mon, 1 Mar 2021
 17:54:54 +0000
Date: Mon, 1 Mar 2021 13:54:52 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 5/8] mm: Device exclusive memory access
Message-ID: <20210301175452.GR4247@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-6-apopple@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-6-apopple@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0252.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0252.namprd13.prod.outlook.com (2603:10b6:208:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.10 via Frontend
 Transport; Mon, 1 Mar 2021 17:54:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lGmku-0033wm-Ji; Mon, 01 Mar 2021 13:54:52 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614621297; bh=y90lc/7CHOvq6P326uUC8A7kFIIiRlcbyV9QLh9EURk=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Header;
 b=dHU8QYtaDHO6367x+GB9IdYqsN0t3wVWNB9OUUjJHC5YXWQLX2JiT8rOTjF4Z0YLU
 vOVys3oX/MbcGavNPVP1Wg6UsswKShG3l1bjayZyVcAkdGy+3HCDaBIekysWrawt3Z
 5ZUKNXxnPZOnonAILP+ROrnWrQN7YpEtj6V1pGf8p6wPVrUm8gh12mR9R8IbA2cQ87
 a01HyhLLIwO2qHeWEnzSRwb8BeR1QcgYBNxfLFsbkgm92d7Hb/yO2WSmZHQR1ME4O6
 9TSSTIrshgyvI+JLKFcs9CEuxf0rjPdQcYrGElsUuKR7EiIOvD5fa5sAnl39agwm0k
 5mGsXvK0wTpig==
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
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 06:18:29PM +1100, Alistair Popple wrote:
> Some devices require exclusive write access to shared virtual
> memory (SVM) ranges to perform atomic operations on that memory. This
> requires CPU page tables to be updated to deny access whilst atomic
> operations are occurring.
> 
> In order to do this introduce a new swap entry
> type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> exclusive access by a device all page table mappings for the particular
> range are replaced with device exclusive swap entries. This causes any
> CPU access to the page to result in a fault.
> 
> Faults are resovled by replacing the faulting entry with the original
> mapping. This results in MMU notifiers being called which a driver uses
> to update access permissions such as revoking atomic access. After
> notifiers have been called the device will no longer have exclusive
> access to the region.

This makes alot more sense than the prior versions!

I don't know the migration area especially well, but nothing caught my
eye in here

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
