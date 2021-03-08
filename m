Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE33316D5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339389C69;
	Mon,  8 Mar 2021 18:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727DD89272;
 Mon,  8 Mar 2021 18:58:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq8qwRpzTXRUKfb9/bz4xaUH3RYEptvD9tCw2pHOQM5wi671rFpV31+/2O+rQqbDKi5UYGf7wikdZN2nntMUEBCW2laT+ZteEYqqXVwdP90yRHC9a3wAjaTRzsqyHBGrG1LNMuyAMYLYJJYaXy3BWQQurkXLsv66Z6V0Eu8c7Wu+3qkQV3Qag0fKTzLiRX0mf3QicGvg3qJUaXMf1npTzdIhUXrnI+EL/U3CBDc6KHxzPaUymyvB5dWJdnAldsT1vvR5dwKPzXaznm4bdR4Tvys7NNNIYJWouMcmjZfbaVIRa8CeG2Fspqd9MPWoO8269wpk3EuxEFQg/+irngzTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZZCYcZXGHtX9c+jh9TQicSi2+rp19p9IJR6nefsyCo=;
 b=CkCDDz9xZNjvFDz6/IfH4R64MYuTy+mgjQK+PhLwZBxxCVQ2uRGVYZKvBJohoop0zZb/3dG0NowWmn/LfRuQwoOkVxkje6YlZlAOnN1HvJivyC2Pp4o1dSnugMYgm+ilTZ5hYcA7/A2sQlCff94HqQEi4/2p/BJ9o1zjxr4NBjGmWULxQ8d64eRfD7wxMo4CZWXvSYa46uoBFl/lUX2JGgKfZVucG/AgX/TzzpBwoOk2O7bMw2I8zhWsAdglR4U2Ztxj0TWRkGgRRAb67L1nNCZwd0G/Gu1fCbQ3ybqof5D1txGALgmRK3WjIifycRCSkKj89dL/FR3rBbO1WKjs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZZCYcZXGHtX9c+jh9TQicSi2+rp19p9IJR6nefsyCo=;
 b=T30A+r+L8zn1yJdHkbuzZCInczyk3/SHyqMnjuKb2Le48jfLdl2UIW6FlNlkFZ9rPirYzbaorgKGcbuC0/3wdC1rTP6bV4YsucMhzaKXHOPGW1K+BVE4i9UL4Rw5ePYivQRgasmYW3sZVbqz3dMgZY4bbiqXcy+Vgnn39zfn4qg=
Received: from MWHPR12CA0064.namprd12.prod.outlook.com (2603:10b6:300:103::26)
 by DM5PR1201MB0074.namprd12.prod.outlook.com (2603:10b6:4:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 18:58:13 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::9d) by MWHPR12CA0064.outlook.office365.com
 (2603:10b6:300:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 18:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux-foundation.org; dkim=none (message not
 signed) header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 18:58:12 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 18:58:12 +0000
Subject: Re: [PATCH v4 4/8] mm/rmap: Split migration into its own function
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <akpm@linux-foundation.org>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-5-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <9fa77684-149a-e6ed-296d-dc852aecea97@nvidia.com>
Date: Mon, 8 Mar 2021 10:58:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304061645.29747-5-apopple@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfe69c7b-7971-444a-46ae-08d8e2641fc9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0074:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0074B3365FE6F193C9A01F84C2939@DM5PR1201MB0074.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7atlL3Eye0cnFJXtYSFbM1Wwc455RV6UQ66DyOvZDEtSafd4hBkbyHKATPZZWJVNBxXQQFsRb98mUqlo7YaifD713Ktk13blBTBEHXf2DzEMLs/0E+sCHJ0Q+jYe2A0hA4eUHy0Zp2DQQiORK7j7lni1si9WyRkaaCKJXqMoICAQgVU3UNVUQKS8tVDzI1ycAYIcbmqIM/MmVB44qrTm4e1YzMcvAIPuqhzE9xQMGmbPZfAmEELDlARo5pUuVcsSKzCOALTzhyQQ2OKFLBMyJxUFYcATGefaqHUx8VCQN3cVtO36XtOq4jsrHgO0YsdEF/FBfQem5ALHJwxhiSZ2A9483JKlnVvANL+bUwwRZ/FqF0v5mNcQH9gmSyIGcJKBo00mEgStKrdnN1yUfdCOx7UnqvIP8FDE4mwqL5F7fWctc/eEyIIpEw1c0e9HYPNg78boWzsBLAxWQiiUuZxZF2OejIOlHCW1bWjdgThYkvvOyhgahwIoRyLPiO+mv+W6LEOTaqvy2WXW8xzMhSTaibCqY8beFd2tPBCrdOODC3NqjIEbqaS84tpE1PteGRw05ihjcPDEHO8iX+gnHF/gMHdyx6ZX7MMpRl2V/xq3bST54YF/4bmFBMO9IQZX3R1LQLtHRN3tWaFM5Ry/EqZqgNeiAfsrUJBOzkj03Zu/4x5wQWYWxJFUlirxqiaOTbHP2m3Wfyc05G9PPDgXCqEI9llkin3V1wJcBT3MtgOLTZt6P5OsE+k2y7OylzRaPfV
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36840700001)(46966006)(31696002)(186003)(36906005)(316002)(34020700004)(54906003)(36756003)(26005)(4326008)(2906002)(82310400003)(7416002)(86362001)(110136005)(70586007)(70206006)(8676002)(36860700001)(16526019)(47076005)(8936002)(7636003)(53546011)(426003)(2616005)(356005)(478600001)(7696005)(83380400001)(31686004)(82740400003)(336012)(5660300002)(21314003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 18:58:12.9807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe69c7b-7971-444a-46ae-08d8e2641fc9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0074
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
Cc: linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/21 10:16 PM, Alistair Popple wrote:
> Migration is currently implemented as a mode of operation for
> try_to_unmap_one() generally specified by passing the TTU_MIGRATION flag
> or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.
> 
> However it does not have much in common with the rest of the unmap
> functionality of try_to_unmap_one() and thus splitting it into a
> separate function reduces the complexity of try_to_unmap_one() making it
> more readable.
> 
> Several simplifications can also be made in try_to_migrate_one() based
> on the following observations:
> 
>   - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
>   - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
>   - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.
> 
> TTU_SPLIT_FREEZE is a special case of migration used when splitting an
> anonymous page. This is most easily dealt with by calling the correct
> function from unmap_page() in mm/huge_memory.c  - either
> try_to_migrate() for PageAnon or try_to_unmap().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks reasonable to me. I do worry a bit about code duplication.
At some point in the future, it might be discovered that other combinations
of TTU_XXX flags are needed in which case a careful check of try_to_migrate()
and try_to_unmap() will be needed.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
