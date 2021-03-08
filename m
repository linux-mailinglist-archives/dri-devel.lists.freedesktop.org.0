Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB06331647
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603526E416;
	Mon,  8 Mar 2021 18:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970596E416;
 Mon,  8 Mar 2021 18:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieGdVQU1OihAgWVaOCFfnJjF9opJC4bmklupYDJ6QcbiZEDAQQyRquYhdu9HBux7xVA3ZeTTV8FS339cyBsFh/c0+CoM7NyC2Pg61Vt8w50+TrJ2qOoCDiavtJXH6H4xc+WdsjweZTec2y8cMOP2TDrf+SPQVhQw9wOayKx4ob6tqX9ZLh2U8OfoqHKVHrwqNm8yPGdYSvIEg07q0YOG+J8nMYSoMLtZF5sTr5JwLH4bDK+BOLHKI8W4ekEVAoe80d6cspwiPi+CbYauDD+AJaxvtNC1TQ7Z9weerZ0WwYPDKims1gOgXdFIGtNAQVGDdD3diJEEA5xtZfxIaKqM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOKFWlUk5jJS/g4RQ/98blBj3OKqTPfH1UfZLB0K2DY=;
 b=luG+iPqYDe/IlDP53JfRj7quYXo358yAmBcGZSzNC5HBDd36qtpS18/m14oVkbsqbcbf5/lcCPRU3fGhnwV1vgj+jQRJF2BhEqgTxJyTmIahbRE7AETYGxz76XOUlA/SljBIh20+LfiAJbw3kT3K+VVrNcsmbnvcVs31aVoze2dTo0dQppLVdx52Tq4Rz8UhJWHsIQLA1VCEsag5wXJVQz7rw721TfdTny4sV7HaFCAK/q9x1v1H2rSLWFkEhM4n0Skx5y7T+jmL/U/IhKl6CGCnO6aru1Jt5OKnEdXBpShtIf7cOuvaaJxn8i+0M3YbEN2AmhAp9xXSbvcNdHTvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOKFWlUk5jJS/g4RQ/98blBj3OKqTPfH1UfZLB0K2DY=;
 b=1l8vEJH6c8xH7qr5I2ZLE6LeaILzxOr7HjWMYpLZoqBShTQ95afKEiEACiLI8hkux+fjvPRk0UZ2hCgxQTOUPtRglKFLjL1zXEifCzsqWpvRABc07/opQKW0MQJIqu831nbbRx5C14DFc2TLrAYYF19HhLB+oy7B96RQNE6PwpY=
Received: from DM6PR12CA0007.namprd12.prod.outlook.com (2603:10b6:5:1c0::20)
 by DM6PR12MB2972.namprd12.prod.outlook.com (2603:10b6:5:39::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 8 Mar
 2021 18:39:21 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::14) by DM6PR12CA0007.outlook.office365.com
 (2603:10b6:5:1c0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 18:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 18:39:20 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 18:39:19 +0000
Subject: Re: [PATCH v4 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <akpm@linux-foundation.org>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-4-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <547dda23-ac57-559e-664f-172e3d6749d5@nvidia.com>
Date: Mon, 8 Mar 2021 10:39:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304061645.29747-4-apopple@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9e55d94-475e-4d51-0dad-08d8e2617cb8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2972:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2972A04FA8D153A49E3BDAD3C2939@DM6PR12MB2972.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8wvwHtCoQLUkCbg46v4rf0+RWDrI597HYidIRsmgI/w6ht8f2clSMcdSXdSx+DE/zPV3+vx5cSwfZHRu1ha66RYuFCrXazMF9WHX6V0KKxXGs3MUoTYfdaCUfb4ZKitwl58LRyj+fk/SB11NxsM/crWuL1C8NF4sJKg0EDytwf07u/EVxTdgewn+6FtXbP3hnZS4N8434wChvZrSGipVfum/lL6UsbnKV0vPUgBrVItUxGGfYf3fRjePrV798TpyqXIECyyOwbeQwmhI1Xl9Y3nIN03FDl5fFhN+jDPZ5C2sEajH5xH0nIaYFOi8/vKVdjlXSMYn0HTWURNLPeSWqAvrZWkEv1Cwsao1VMy78/jiUxm9yKSC9OwEXdCjvMPG8J8TRwLCFZgh5inEYL+qjlzGDTXUNj6wmUzX8LdKcAs8cEVB9UTHySCmHGIT5SN1PMO4l4Ws+KDnTkJjaQ0hIj5SHpLZPVbZ9O3tGlhJ2nUb739WQ2kbofKGNPAjVC6LAitzgnfPCcPhrZHydaDVzaVvQ2kj6q7Bj7YTxUQ/Aobh2LkWB1PnrV95eVZcVLS0fvc6AGYnUplx+ax7DEmYdKB9pdNlLUEoX2g6cU3KQHB6g8+7NLnrfGdP4CmbJo/Vuz8ndql8NqUT1Ad/nZcWRpgyy74IALWLWMXOHQt1sPnnOEAv/uEtyBHbKpULHz6InvLte/gd9fgwn4a08KyRxPyAG9uHsnf3dfqlPeXB+M=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(4744005)(70206006)(7696005)(53546011)(7636003)(34020700004)(31696002)(8936002)(31686004)(82310400003)(86362001)(36756003)(356005)(5660300002)(83380400001)(70586007)(478600001)(8676002)(47076005)(336012)(26005)(2616005)(82740400003)(426003)(186003)(4326008)(36860700001)(16526019)(316002)(36906005)(54906003)(110136005)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 18:39:20.4037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e55d94-475e-4d51-0dad-08d8e2617cb8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2972
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
 jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/21 10:16 PM, Alistair Popple wrote:
> The behaviour of try_to_unmap_one() is difficult to follow because it
> performs different operations based on a fairly large set of flags used
> in different combinations.
> 
> TTU_MUNLOCK is one such flag. However it is exclusively used by
> try_to_munlock() which specifies no other flags. Therefore rather than
> overload try_to_unmap_one() with unrelated behaviour split this out into
> it's own function and remove the flag.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Looks good to me.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
