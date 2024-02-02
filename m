Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D62847201
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286610EE90;
	Fri,  2 Feb 2024 14:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qizwYNWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D7A10EE99
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 14:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxth31vTJBy1ajllPO2Q/hUh1CGMhnn8OubQHQTl61gSHhkPUEBbn526P8vI81uxJWwVCOYI7NIEp4CUu4eqaNQJhUz7pKk78wZJ3tr5iEYW0ITr0zd8ddB2tXXVkNBfammGJ9J0SRBQIaUWtOgC09e17Ykh7/vzXJlIAlBFha2LMGdGSX6c+dOpe4jqWsXdnkLwyKkfLWRX5GIXPEKharTKS+F7K3qc+eqbCFyWUs0E0Rhkh53eV93EJEbP3+mvFly6QIIRePARUix7y2DRPpcyeN5VlleRJjbSUc92z2u9jaRyBAM3wUzqjucNGjsrjVl8JEvVsJoG2axi5EmIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WABHMuPehesDTGtE9FYvNOIFKo4V2wzsLSl9ei05TM=;
 b=nVxkZsQ128fRJ5E+76nPJ6gRMPFkcsTe06BbJet1fV3TvxO34dUPRODrJek9cmhGsyn7crgpO4IzUKqR9pCgRckK5M+3xkwmiWM99I9mxI+qfD2Ir2i4Pwo7uAvE/owtvwuXXhCN1Gu+qleqKywGppYm6nUdn6+QH8VBb7LFilS0y9gwoWKMi9/8VDkzhc+vLda9+pVGkIkf4LSQ+7ixGqcCLyTXpphr2IJMHpswvjzfXS4wcda3ESsdZd6MAfirC62/8lVhfL4I/l73NEY5aaUBtR/6ITljHjoomvjqdrthDQsNq6dYofWSrN8KHKDZJj/Yi48YQXtMu/yIV5WdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WABHMuPehesDTGtE9FYvNOIFKo4V2wzsLSl9ei05TM=;
 b=qizwYNWKCaL3Zz+ltMOnSw8/APKUx4alIiY4efK7mqGxfygDGp7F6GEvTYMHLhwz8eu+O733p+u4mQxRWkJQPLrAlog7C1HsX7V0Vf88mauNRTHPuoA7QRJUMZcWviTUAWVYvLnQnpWTU5P9t2SFTrremvSeI2ofgKPwzgOQ52gFA2dA4Xs8rruGZx+kKkkehVXW3w2J3MOA1//ftSe0ZBN+DpXzwGGxw9y0PFvrUAWql7rNk8iTz64tSKgxx6KkHmOdL3nG0Q+1vROOeV5LFnHFwZZtlfNLJyBjWLhKNMoTODUjTx5URI9HvKTlAqILNCLfH9URWZvaCqvX7nF7oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 14:35:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Fri, 2 Feb 2024
 14:35:19 +0000
Date: Fri, 2 Feb 2024 10:35:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Message-ID: <20240202143518.GS1455070@nvidia.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
 <20240201200212.GQ1455070@nvidia.com>
 <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96bc6d37-1000-4651-9a26-a8446dd64803@nvidia.com>
X-ClientProxiedBy: MN2PR19CA0067.namprd19.prod.outlook.com
 (2603:10b6:208:19b::44) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: ce99d4c0-3fd8-42ba-3dec-08dc23fc2e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VlszFuT8uTy4EH++a9rakSOICZGrKt+isCy5ZVGWaGH5V6wAlfFVWDMvmzvsvqQUhRLfeLg4lF+mc19XTXLlAEzKKvrBSUprn9VKLKlEC4XV49JsoKyy39fBG96T1KAyhBVlf7eWJWBeGdLEkjRqOgpo3hFSf1d3CsvR+m9kHySL6EHwZOFtq+WKZk4FVfIeb5nyuWsxt22nmrWGzcGyyGp1wQ5vQrHFWa7L5Ll73V+TwbrmhmiAcTfqxVDLeeSPR2Mc1qRWW/HxBL2ma44WjL8fWpk6yHmvAXC8CrXK+s/2YE8SnybHMv7L8nrjF1xCKFFanLnk0OqowgTNiOf4DuHbfvVjngt39WAEEn4e09jjeGE/1cVEeisGoR1nDJQNk5uKBD1ehD0igzq2rgoZnOvN/hR/kdfOrfElIS1RFWYqdlQorPq9q5ps5FNS8hWakcAE1FdFMYXFQxpDSIDOqEemln+jBFWjhoT4EJ3v2QAOYXU78q06hzYdsg2dQJcE3U5POsj8Rxv7SHOLge05xOAGruK6JOz7tLsm5pyi0DezL0N/0FlKhgWrPTDdDlAfNA5H4f8bcUtb7pbgKroOqsUuhfJNeezLkyfgXb/THL4/vs+q+EIAr/9gLDzoeGzsVEahH9iftSj6XIaEQrfI9oItqFXqd/4wSyWkRkoisfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(33656002)(86362001)(36756003)(41300700001)(1076003)(26005)(38100700002)(2616005)(6512007)(6862004)(2906002)(478600001)(6506007)(4744005)(6486002)(66476007)(66946007)(316002)(66556008)(6636002)(54906003)(37006003)(8676002)(4326008)(5660300002)(8936002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xX5lUHOnYyEVIJ+CJM/Iv+ncWeguimA/xX22tsSBiQ7tt05gLpoLVPQCOZWl?=
 =?us-ascii?Q?E41+tZ8WSyGFrhb8/jJi2pXKT7X1zc+tx3A3baKbDdxRMbv08lniuU1P3cmg?=
 =?us-ascii?Q?uvWBfTBVk8gfMhFgqdWKo2fS9m3ydXWFaJWNAyqU4RmkfuS8wn1rpbjOyOGg?=
 =?us-ascii?Q?wojUNCnwSD9RJ45omaWBA2+uRRAaPkk34vcGSBC8dEE+U0C59nulzdaBSZm7?=
 =?us-ascii?Q?tT09i/D371nNtj5sZ65clPmbE9Sjf2545l6joAXE8o4MDbqb/S5IMP1hcypk?=
 =?us-ascii?Q?o+4C652CoYDQcJPc9PN7xLAlWYA7d3EFn91i/VLL19ew08JdECi8BOJdyppu?=
 =?us-ascii?Q?2a0tz6a04JuSIQf0R7b/ny8hBIGDCtJ859TxVroSaGh0C0gn7X4MIWoFouNU?=
 =?us-ascii?Q?7mxzOVHAusqYZdw6rujhNkcsQPeWdroMxBweymzjfploNp9vhHKB9yK0vOTt?=
 =?us-ascii?Q?N9sToHYuy/NVXBqvqo6CCrn32X6HqljWfwrvr5Ggz5z45g6a0HV9weuCOCke?=
 =?us-ascii?Q?nsbCaBrTLoT5f/aEf5WsKcd+oVGi0q8vtWtXeiIKQgYDq8+OGE9hCEhBbHUX?=
 =?us-ascii?Q?ReuvK5j7xlLWAhZ093borLAYJbJsZ/gm733VybHrPi4mjNVPVAGORa6VSJA/?=
 =?us-ascii?Q?rMk5URRAi7DvTbGBjjbI5PNo9rwz+sZrqJaBqFnySiL8BrNitOhjrO9JzsfX?=
 =?us-ascii?Q?LYwXukESZQG3vmCzZOnmHiejdP34sZHzRMq8sfmRTYb/Xn5eg9WWJmM3AVce?=
 =?us-ascii?Q?Kgwr/xtBDog1xOoAJJVyrjoi6dMkF9uV92Db9gq7f5q1X4Bf53ku3gfv2hlO?=
 =?us-ascii?Q?Zr7Qqp3x9bPOPZsRkQdAqGOypja0yKPxCODH66rgMQl9EM9J9t7QSrQcKf5v?=
 =?us-ascii?Q?T4Q8MTibVraYNi21Jg3p6BXRSLkgGJRvNU6txzdQsr/LAmptUTJTkxd0YSoO?=
 =?us-ascii?Q?sG2bbHlUkLScyUipSnpJIBDa4BkG3jIwNy3scafKOGWCZ3UHPLF0WcQ+WNIo?=
 =?us-ascii?Q?6WWNGNmNpDKBPPDXhcduCW6FBo/0PwCt28v39L9qL39gE4llLcE0NnL8eZ5z?=
 =?us-ascii?Q?cdPcahnmszz7u2LYlR/zczq2vnjFrMmhTgxAIQzXhBnmMd9rrTn84omHptJz?=
 =?us-ascii?Q?c0tnqFuG9uzRoygak5SkjFknek3m9Nz3Nj1ct2ZAOSQmqIYKtDyXBvtEN5gm?=
 =?us-ascii?Q?gzkb5CdazQ0nx1K24fHVB569UDbBGOE0ZamzrAK7qAlEVMUq4cm4AB7QQmMM?=
 =?us-ascii?Q?ZomvIZkgHw3vLfq2x7GOTWEUUpEiglXKF4BhjuHL/eQvydCu3Q/Bf4CxaEI4?=
 =?us-ascii?Q?mpw06Scwpj8jZzces27+noGeumUN9fdCKpa/xVfTovu/Z0AQIeop2m9l8KkM?=
 =?us-ascii?Q?Yb/TUh/1JFMk6jtY1BNnjebhrkOWqeWV5WhJSqljoyq1I3KwNCqHhfPJ5prc?=
 =?us-ascii?Q?EZ3aohb6qvpnSvAjoj9ZQhvYMEuLRlddqCZ0aan9GYxOovBPHnOxq8wH21J6?=
 =?us-ascii?Q?PxyAmnDkDUjpp2XibsUkXjvqkBmgpsLmFEqu491077tR9g95e+SK3+GLWydr?=
 =?us-ascii?Q?usNDeKFXSFz60PLKmBE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce99d4c0-3fd8-42ba-3dec-08dc23fc2e70
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 14:35:19.8641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYQMfNXuu0w4LDLnDJB1G7msOWXRq0uSAfhSxj4iD1SWhbMToSaTaEDETSD67GvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
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

On Fri, Feb 02, 2024 at 10:40:36AM +0000, Jon Hunter wrote:

> > But, what is the actual log output you see, is it -EEXIST?
> 
> I see ...
> 
>  ERR KERN host1x drm: iommu configuration for device failed with -ENOENT

So that shouldn't happen in you case as far as I can tell, the device
is properly added, link->kobj should be fine and ENOENT shouldn't
happen.

> > If it is coming and going is it a race of some kind?
> 
> It is consistent without the above. However, I did not think that the
> above change would change the returning on -ENOENT? I will add more
> debug.

I do not think it can either

Still wonder if there is some odd race..

Let me know when you figure out what is happening - I think there is
some bug here it is not just a harmless warning.

Jason

