Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC558461BB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 21:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE3610EB85;
	Thu,  1 Feb 2024 20:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TUEazgj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BB610EB85
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 20:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0ZAMl5XC08k6eGj3viWMjZRsq6QMvc8mmEdeHb4aiaVSM8fHv8iu/M/SZHNjCxtgDV+fVi/t8Fjz8NAevwkZKJxDU/u5GaUxHZPZrJtlRq01Cn8ZWpuvfLOxpXFBWnkf4dnW6UKk2QxuPtLlYAgCLym2So9YU2A8wJTQCTUwpl3r2no1J7l/1YqUjZytqmuMBgl/We/A9RnHgMbPgyoeKUzRsoOOmaH+4f4CMR8lbmjtEC3goGp4LSYBisk326QeKhndKCPs7oAdYkwpYImwfiyI0djuk2A4kAaJGXWnVf2QuKMQOBPXQ6MBlZSgzT14ciPPoBSi4OLTCBdkRKYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j27zIEzFVryWl29oY+IXs2SXAftL1Ch68B3TR+mOfH4=;
 b=TL6TVInbTrKpADjuKaBXw1/iBGm9hr45ISweMMbUSFjt7vVA8iEtZM8wWt4xDWfdpKLasziI/QercJSkbwb5ErIH1GifSGET+i29RytnNjmPfxj6yoOfxOWGaCt7+Nr3ZjoH6eEo7VPqqoCVGlSkEgwpSxlkl63KPajI1igBCZ/YDaby5G3jqMhL26Sv52qaDLYLKA6EN+zMmnbQkHUCst97MZBBUv39NHtFVCVzeHS5JHlyTaRTFFseJyaR/UW4SdjAQSIhwj3qSYkFRiWbBYYvAwzL8o2HE7L1DuZEpx8a4b4pW7AyFd5I/mnZmiWIn4xlx3+2H9irRIodWIhvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j27zIEzFVryWl29oY+IXs2SXAftL1Ch68B3TR+mOfH4=;
 b=TUEazgj9mzj9HbQSrA7vMrNrL0xVb7bpRyJs7HV8pbQFNBjfEJ+JHjZGW8FtDDiG4AOMl2JlMaJ9kd1ZR39EXKIgZszW7JDQ5NA8XhiodGSU9zO19hJTGVBG3XC1GMnWROHIAXzLck/dtSId20fPD2Ujgvygp/Ksth4L4XgAfRU1HHNsK0sFwRK1sO3fJBabG0nbMdpd2iMNpbqEbUskd2oglpzrz107YByawzuNtJSdDGAmnIWxBaccktdp24JVtMdKJl9ftou8xeQe022MZfTRYC1qcQUrVXiWsspP8L2povs/Ye2Pt76AieXShGhL7mZz/vys9xweVou/vJlPHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8; Thu, 1 Feb
 2024 20:02:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 20:02:14 +0000
Date: Thu, 1 Feb 2024 16:02:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Message-ID: <20240201200212.GQ1455070@nvidia.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
 <20240131153312.GM1455070@nvidia.com>
 <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1597113-3ec9-445c-90d1-62df97406fb2@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:208:32e::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 847ba5cc-8292-4349-bd9b-08dc2360aeeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CB6ar+MqM+ipwUkwqlmTmWH3nZwpO7Gu6woLyRrvVFBzxlUyvqy5F9SuLLlKn950MtyKvtOEWnBF8D2GnD+6GyU8mCS1j0PqsvwbIsJJfIXd+7G4VUBNc1wLWuemRUh5TxTBOOrf31SjDrtZVAWU02/fEpOwXTxBWqvCPGqIScbVahy50KRIgcnxrowBrAanPZCGBgzqjaDtYqLzBEK93CRBaurUzUe8aeyvSEySIf4xg1z0BH5CSiGfGHYIw4A4T3i0gGIdHw2foTAWDNRWMCLD9J8sfIAsEF8YU9in6XwtlF46+dQv0Mg3uzEPSEfELwXA91GVTfoaw8sPX5tMJ9v2JJ/IYkGX4s6P2oeJIXMy+E9DvYblz25VtUGyc6ghn0bgQLBc8ZLKGqr9W2NE1ML7TngdTXjj9PwCekXMr9m+z6oLLrdfUMtRia7GBRIj2AJhPA++JOtsB2EchlF6BDcbdzev90VFDeBXACu4hqFZYDvCeVcyAlnPC096DiP1jzNjp478VTf2B+Y0oJgS5DTjhoUeUTO7T2JziRp/zcmpNtHni2iLBcW67qNi6y8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(1076003)(26005)(2616005)(41300700001)(66946007)(6636002)(83380400001)(36756003)(66476007)(37006003)(54906003)(66556008)(6506007)(6512007)(6486002)(478600001)(38100700002)(316002)(5660300002)(86362001)(33656002)(8936002)(8676002)(2906002)(6862004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnCJktmpKZ6IgpnENLdHwkySUMQ/kgmrBsOxG4qxH1M8KuvhIo/fENdYUy1B?=
 =?us-ascii?Q?F1/zTQ2lzkjRvWfLSyZOpW2zF/F1wyVFZ346fSA07O27S7l8aEKzh0LhadGI?=
 =?us-ascii?Q?JXHmn8p/eKQPRHpnO7dHm6w+H4to1jzVyVfHyG78UZFWTpCUl67l4BdRMtWr?=
 =?us-ascii?Q?yERzcBWAkSic0sox/4uD89G4q/4/jvxl7IhiTcR0xm55KPhCqaIIkWt6W/xc?=
 =?us-ascii?Q?kA9dXVeQBcFHAXlQ2svwC4xihL0GatxkRDBS1m1IWHVsdfw1xqOQY1pzgSLk?=
 =?us-ascii?Q?k2D0xDIWCQwJH7uyOJ5+i50k+CGgl8E2LSpfVFmDt/uJivaPSznp0UMAPEAY?=
 =?us-ascii?Q?8uRpD4LH/ans9YGVUlsUv2n2I6nXiI34I7pxYMLCT0KODZiwG2Kh0RpQYWt8?=
 =?us-ascii?Q?AuWsvtRLGlorVdN1L8yxGAlnVxOvwJGOb8KeyGSpADiZxyV7ywFOLUC1nqp8?=
 =?us-ascii?Q?3VgmB18gOncTPh2hvJ2EEgQyOk+/6o8i1QbTqYGcMolGhcHP+yEsc+ZYGAc3?=
 =?us-ascii?Q?MmVVAFXiSGe9QIfIaKl3oApwYOM+YHmY6h6ZDj7n7nVdxcmJern3lmGeF2yB?=
 =?us-ascii?Q?wp+S5cdkAn/yKaAxtUPSmHlrrFvU6tjVs3qLhVhEtT/KpJgfFW8wgHULq6U7?=
 =?us-ascii?Q?UpN2KJtaSkzdyVIyYQeySJJ9v2pwLhHljtklC6/PD0GiJahVhJPjp4VenqJr?=
 =?us-ascii?Q?ZcqWJv7XpG4tJmevagZ4Zza+E27+hm2MKoer7BS6oLB3KsobrkQbpxfuWEXV?=
 =?us-ascii?Q?tOB8gi8u2fm8btHMC3/EtK8qbkoAi5DitHQSbAwbBbacHqtEZgMNrb7G//my?=
 =?us-ascii?Q?s/h8zlxfVR99tmV9J1C5T/TiSM05jRXLEDvjqM7dFdFCWDI24ZLPq2CwO5Hx?=
 =?us-ascii?Q?V/PT/I/+q19H7oGxhDzHJoR1RisoHqT/y0gLjIJAzCkITRmgdZcw2GpicrUo?=
 =?us-ascii?Q?MSehHQ8HqHF0LJCiYuySyXhVjSX6eKjAHK8LE6ilDBSITb0oRu8Ymw21W1aB?=
 =?us-ascii?Q?TKkPkhM4ohyu0xzfBlMzoRE0hEyQnjNZDphZw4w7gkdx5GTONUzPgHe6WZf0?=
 =?us-ascii?Q?bTWL8yXGnbyaHbPdnmV2qemrcA+uO+jC4unbvwk8LL1AaDo0r2xriE6OiVgd?=
 =?us-ascii?Q?GKvx/CydealnYPTuDUqsnNBtfOHkmk+Ewa9SuBvtGJOVgOwGk/QiiLLAeKXJ?=
 =?us-ascii?Q?lWFDRWLDrRqQEkgQWceFVOLsA0/XcFFH/pxoMG7XNhLb/K3IUDwI5NAlxDU6?=
 =?us-ascii?Q?/+6ZzfqHJiJVh9TXM9djZABoQ3SDoM9m8XId/Solte1vulNPZFTVeLYDiHwX?=
 =?us-ascii?Q?OQAdLqVsBqAFRt+za5ip9o4L5pPgyda8ghm8BGFpKsV1Ct4T1IZr1BBLonTG?=
 =?us-ascii?Q?1g0voBwTnYROHFhdqnEqTFG9gA6SoqLJGbNgxmgD200LslkbvRB4lxaFS9zQ?=
 =?us-ascii?Q?DaBy5aFJ73376zP4OUANla4Er+W7c7oGXUYek221f9j6hxx7UoGu8X9sFK5B?=
 =?us-ascii?Q?Txt1bX38Aj3fJ2BeumD2hhm/64qYim1+2n716OPOVzyTrx1YRvzpMuOaVVOR?=
 =?us-ascii?Q?uhDK0OqitYfO5TWnTybamBw4T0GaMrkPCGIU2mV6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847ba5cc-8292-4349-bd9b-08dc2360aeeb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 20:02:14.0198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ROuJ7zb0u/+pFfbDtj6ZaRWzPGZqn38fmQzBpW/7EQh3ufvWDxN9Xw3AxoekJp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401
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

On Thu, Feb 01, 2024 at 07:35:24PM +0000, Jon Hunter wrote:
> > You mean this sequence?
> > 
> > 		err = device_add(&ctx->dev);
> > 		if (err) {
> > 			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
> > 			put_device(&ctx->dev);
> > 			goto unreg_devices;
> > 		}
> > 
> > 		err = of_dma_configure_id(&ctx->dev, node, true, &i);
> > 		if (err) {
> > 			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
> > 				i, err);
> > 			device_unregister(&ctx->dev);
> > 			goto unreg_devices;
> > 		}
> 
> Yes this sequence.
> 
> > I didn't seem an obvious place that this would get fixed up later?
> > 
> > device_add() was done before so the iommu_device_link() shouldn't be
> > failing? Are you hitting a duplicate link (ie remove the nowarn from
> > iommu_device_link())
> 
> 
> Removing the '_nowarn' does appear to fix it, although it is not clear to me
> why?

What did you do to remove? Just the letters or the whole line?

I was thinking the letters because it triggers a large debug message.

But, what is the actual log output you see, is it -EEXIST?

If it is coming and going is it a race of some kind?

Jason
