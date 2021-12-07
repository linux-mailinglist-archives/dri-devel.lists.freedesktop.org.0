Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1CE46C3ED
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 20:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11D6EC88;
	Tue,  7 Dec 2021 19:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E096EC88;
 Tue,  7 Dec 2021 19:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nbd2/oIRa8jMJv5PxkWKiKKxQ4TF1wZVaOp9pVctYqZEjRlJV/nsvMJJrc5X8jh7n1xgLdGnm9Ew6wvZ8y6pKA+tP7vI2HsHG3bBpiUdcsC+ovg9XOLwEvkEB6pqUIl1erOpWR7bxpo6mq5nvQSiOr9tsfnDul47F3c1GzZJzOWQNH87FyaYZHN5FXzBnoayYVT3PGmEZB9WujxjRXijVhwLNKBnWoDvYYx5QIadvkS4xHMp/ifr88T8Ja2Byn5r4TZHHkIvvvQehi/Gy0RAY1uHDHx7n84KbjwbC2g9sLYPIJccFwFOkiYYWQcxLXKKN34sFxskoyKcLgFfsAq18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4B1NAfP8Kh25koFELYPRfy+EN3twVKcy4NB/9BH94Y=;
 b=JEEQJcHiXlZiu+n1MEQXvqEcm96x7PUW9JmzeYFc58u3/kLFQ/X3CP6Xe8KuDWjkx+PaSFaOnkm1hIkM7JIlWhmIKK3jLPh4Yw8HONH6YdfVT93bv9Igt+3k84IBdrqpvPQrksjIgBKTQf3djapFJPkD1XJreKy8bRnBt5ytQUiR6TerbtRkek7mbDQOx5A7T6IPDj9iJHNHnMHhxgWNzkgY2CqnJBTtNt4OIOzBS5Aq9qcnFiXT7DiRM0PVpgH8kFgpjkDLfnIOtbjworAeNCYiuc3tj/D6BS9reQoeASKYr2M/JvgYxrtRsfboy9tUOKkm76a91A3o1Y7Mf0KZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4B1NAfP8Kh25koFELYPRfy+EN3twVKcy4NB/9BH94Y=;
 b=koO27SrP7rrKT97YxcHuW32UKFASh7XsV5Q0AwiIaeGx6CGfv1Tj62Rv44e5xP2SNz03zOs8ZC2yzuaGwAHIFCoMWx6LsRHZ69MAoZuIJeTD3TTZVYJUEBMrZqWVzLw1oEM5wkLX6PSGqGwjuQJCMP/5G4/uzcPOvPPRNyy3TPk8DXstSArIHDUm4N4gQcN06VImQJP8DeajRKzjC1eP6TxjMTyhGhFKUdQdQ2wpwD57V5LK63YAQzSXb1Zvxw15Tu/eG7LKlFrV3JFakBXS1mbAakhZfSpjFD5YSVeqt7fX2oXQLKXYTNKUNBAwMgCgRgghElsqxLGCrS4sHFCJsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 19:31:41 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 19:31:41 +0000
Date: Tue, 7 Dec 2021 15:31:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v2 11/11] tools: add hmm gup test for long term pinned
 device pages
Message-ID: <20211207193139.GK6385@nvidia.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-12-alex.sierra@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206185251.20646-12-alex.sierra@amd.com>
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 19:31:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mugBf-000Wov-Bm; Tue, 07 Dec 2021 15:31:39 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78cb335a-e3b6-4c94-93ae-08d9b9b831fd
X-MS-TrafficTypeDiagnostic: BL1PR12MB5361:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5361C4E7BAD2D41A2F7F1A02C26E9@BL1PR12MB5361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9STkpcmQCD/rB/edEso7fT9YhGUXupvive26eT4YlDhTiX6bA5FTDQ0rV5xfTGpYVn5+mnG4UUanrPO8ygratvjIRBoztL3RewKqE98Ck1zRftFN+9+xY1T5Zg5HamcA8NFEtoOHgnS+2zBD97WgNnxJzyUv30BZZecGu+YsvhzjiUowCXAeLSmCz+idXpZU05vuQHjH9PNSXR8o7Qtgyq8CopsluZyn5PIbAUitcPMJP9g9q11zSCSHFVrlK2mL0fWX8uzvCifSNFNLdcRRUdm5LDjVbO3YqzKvg+6HBJvMCE12ByZAYc1errudPKBWwaNDK9u2m6TYYScD/RnKQbIwxKjHMZ53KbhaaXyNdv7Q55KwlwZ/PdAEo5+kAaZdXBRJpTHD0CU6yDbO0pLCtKYiZdzgfI8J/MPfseH4xbZTADE+oXdp1Gfn1KfyCAG6speAgiAEir+KIrr+VXaSIaxMOXf7AhM7I5MORDUhDqHj/AmS9NJXuPA0fwU2ERW45NChJInV7bmx+k5sD9Fn5mVrpRSjSLwOJAj3uH7N3yWvpkHu/0PHfQnrBG/uXHForLEfMBZ5rd0H7OhoKoUZkCyRSsYr2/n3gQP2LK7/Ldp0fipsjHk3q5n9jujr3YgdnR7nn+7OxCrdiMd6NPJvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(33656002)(5660300002)(186003)(66476007)(38100700002)(1076003)(2616005)(66556008)(7416002)(86362001)(9786002)(26005)(508600001)(83380400001)(6916009)(66946007)(316002)(4326008)(9746002)(8676002)(426003)(8936002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2/x9azX4DEWJcXerCpkxkNb+KFqEVcmnr8qQ2MqrhHSZF7kRpeCpK/67zjE3?=
 =?us-ascii?Q?uSvGkaYmMtULMiO1LuYb1ABTggAW9bilUid5XPxm6zIh1m1lU0s9B1gFfYl1?=
 =?us-ascii?Q?owsX2xV3T3mbDGmTRtsFfohi2Fm5usT9ycvjnoOVjd1yggDLuM03zWrsh+24?=
 =?us-ascii?Q?+vzJHfOQ2tmc3348B0Qb9jf+YAxm73nEg5a8bN0v+39PIMtn5l8fXCi8w37E?=
 =?us-ascii?Q?Bm6Q4fhql+pzwfh03YFpCC0goE86pcbDuX2pkpez6V8djoUHEFAHCpmovKss?=
 =?us-ascii?Q?I4fqJ0Rk1IKL423HeLeGfuB9Eu6dH789X/IZkOYKm57WW9+SHUhrQLnKtIpK?=
 =?us-ascii?Q?p4RcjiOo89B+S4OGMfesg0VAEnqVzFw0w+zG55a0ueBDUF2ahk3Ch5Z7ld1C?=
 =?us-ascii?Q?s+uk+cGUCEGnw/+9mFPgELrRY52jFoB2qDoOevA+KhyxZhf4oZBfyRZ1KYxy?=
 =?us-ascii?Q?t44nWtGL0Fd28GUeszzA/DUEhBHBXjYEWxeYkygcuZWENlO1bK60EuXFonRk?=
 =?us-ascii?Q?VCNF1foV4Qxrw8/XWnk2bRYGbbXiKLDZH88qtFGS1dU9tQVJzwkduLaH52i8?=
 =?us-ascii?Q?yt+OcCQC3WEErKM0nDkWm7+MtV9GWjSlTviN4/hC+V/xtr3+r2j8jNq1ein8?=
 =?us-ascii?Q?Sf3v0BLD3oo3j4Q+SAnUUxtGilLnDLhwpy/cYRsLGQx+lPH5vZMKLIxe5Ok3?=
 =?us-ascii?Q?vBPkT85DOtRXV736w4sEHZDjz2zu7LIubh9/unOAI3X4E12iRYXKHB+DM1e3?=
 =?us-ascii?Q?SPDjP3bEi9KONXiOQA1pYVFS3gTDxQ90AFxAVCZvU4T3IIGVWfPRxDjcphuu?=
 =?us-ascii?Q?JfynY8TdYN+rEI7yNbyhxy7TbMiaSdLVS4dzRBoIPeN5cEZmTnhubyrqTThu?=
 =?us-ascii?Q?HB65eIRpZyJouhyWgtzZyhaDbpsxd5TfdVPEcWeysJmHtdgXVv8wLww44P3A?=
 =?us-ascii?Q?ITfcNyGoMZ23bxlWp645QXzU9xEAArF8L/GJFXWPt1VITo3x8koJbqATTR2Y?=
 =?us-ascii?Q?DBeXu2/Qiqg1K/ymuZaJs8SaGcNxkixLClhIfoScwc41C7q94p6ov/7JoCF+?=
 =?us-ascii?Q?kdQ9zJcI8Nh77/Om756cLkI+zFd5gxnThGJX3Ck+W8fkezXLMDxV5rwRePe5?=
 =?us-ascii?Q?4BHLG0I8N4Ab52kQGzy98Ns1RifkwydaEn9kgJua3Iumz+3FNVJtijHEqcoA?=
 =?us-ascii?Q?xuTNw5Kg25fWzl2M2BUKhbcjyUOODXQL5pYNClYl5KUHll1dvgOwyCCcCcL/?=
 =?us-ascii?Q?f3/3U6zW7/wSdhRU1ZEqTHmGlvDdOv8jef5oP1HuXmDdcx3d2vgGROwLnIzJ?=
 =?us-ascii?Q?xNxhGUdOwqYffiHc7o6sdt74AtXmOyNHEMOdQXTraQv7nabAoD9t+YCk7tAB?=
 =?us-ascii?Q?nuBFxQVrAYGUSQpzSjRUZjFKrlZy4Mo+/19DqT4uvY1O4kX5MDaBl5NPb+zv?=
 =?us-ascii?Q?B3RV4lM8JqinGOBF9Sz1OHu8PsI5vcX9lKkzaV70D4BK5AQRIxvFAD2JmgCk?=
 =?us-ascii?Q?/M1DiFok3xjXmsCzQlw5Rz3QLyMBYH44UtnMdJtEOHfPq6wgcOTfoxAGP17K?=
 =?us-ascii?Q?aESjSix8Qbk8vLrwjAI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cb335a-e3b6-4c94-93ae-08d9b9b831fd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 19:31:41.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyXyvdjGF5TmUFTTisORxh9JRuBNm9JPwZxU/z4/FzBXLj9Q7mP+lT8Lywqu1Nc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5361
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 06, 2021 at 12:52:51PM -0600, Alex Sierra wrote:
> The intention is to test device coherent type pages that have been
> called through get user pages with PIN_LONGTERM flag set.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>  tools/testing/selftests/vm/Makefile    |  2 +-
>  tools/testing/selftests/vm/hmm-tests.c | 81 ++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index d9605bd10f2d..527a7bfd80bd 100644
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -141,7 +141,7 @@ $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
>  
>  $(OUTPUT)/gup_test: ../../../../mm/gup_test.h
>  
> -$(OUTPUT)/hmm-tests: local_config.h
> +$(OUTPUT)/hmm-tests: local_config.h ../../../../mm/gup_test.h
>  
>  # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
>  $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 8eb81dfba4b3..9a0b7e44a674 100644
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -36,6 +36,7 @@
>   * in the usual include/uapi/... directory.
>   */
>  #include "../../../../lib/test_hmm_uapi.h"
> +#include "../../../../mm/gup_test.h"
>  
>  struct hmm_buffer {
>  	void		*ptr;
> @@ -60,6 +61,8 @@ enum {
>  #define NTIMES		10
>  
>  #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
> +/* Just the flags we need, copied from mm.h: */
> +#define FOLL_WRITE	0x01	/* check pte is writable */

This is so fragile, you should have a dedicated flag here for asking
for this of PIN_LONGTERM_BENCHMARK

Jason
