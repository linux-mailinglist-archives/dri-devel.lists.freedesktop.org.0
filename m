Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CB4FE9A6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1BE10E6EB;
	Tue, 12 Apr 2022 20:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593B510E6EB;
 Tue, 12 Apr 2022 20:52:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1fVpaXR29IRGij+cOQmVqZnNHiJq4DifdacNZ5Ny+MTu/vCGhdlwgz1+ftKkeq64DOwks+51aN8DWNOZwmC/4EJDPqa6RjD/ubjM+5bAmwWCqQsHwvFcy5BBh6xyy3s5ZKgBujVYLOYoYaQMrRGLEmv4i/NWpYYE7i3bLWU1H6eYMEgInjh8RHfdiTjGqDJmJuRTQNFm+OUJY2MMHeRxBCcEwk2iZ6oqe4JPtB2m3l2gzR95i9KM1giG0aaZzX5YWoVCXxBY142T2QCWQUrnKaQDvdkMCFTv35J8itzlcHHGj5E9Lh8PgKbSBFsSgfj4l+8bAGyrTFVDdQOCAVBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cthwjclGMPbPpnk/MGYP5dDa7WDpfI91BXxxjXyjJRU=;
 b=lZ0oFkZ6WHEfoLmltXozs1eBHNBzfiYgkYAcH/5v3rctuk8RDn0SDvoYOVnMWe6AD9NHY6NdiRLnQfX2dAGUG2NacaosQO4P2E64tfQMIwFu90QMGYbsXNh8W8rQUIEdW6a3jfFlXpLdoEnC+TMvLhFh89Ne2AUlOXy6SRGEFbclw26Hm8eSj3r8Fwy6T+bY4aY3E9KJyDLrkFsElPLtj5xSrF5eXjWM1ayacNg8rRppXlCDw7KFYfYU8ZPRa5npOGiC9gTCCkrWZ8yJ+2t1O6/LCX7K1H+IbtMiP1z0kEqZ4jbaAEWNTFQ5KlZWHF/f93AdoAb9REkI63gMmIYw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cthwjclGMPbPpnk/MGYP5dDa7WDpfI91BXxxjXyjJRU=;
 b=RH8UxS+8bbcVsaic4PU3bBYLakj1zLqgVmKW7yQNR60AeZ3BA/nTNA8MrYrSxMmOJdSl1elQ+TzSxYBaaa/JdMIixJiVWzs8fnMA3cexyqBS9Fk4wNL4Aj4hCeZp/b+roCN2BbyTHEQymbB6DUfM06qoXOXjFlsdTZBmZFG8JI2pfX25mI0M6Cy3MfbN/D9KFUe3GOEeZQRa4I5Fi61rD8g1bO+XWCRaRqPHbatAL68KUlsFivrbvpf2NZFv+p1372H24WyKmCpYu35PUh5evQKlWSnfpAKU4v270zzJyTi5mh8BEx9ns0If0s/OH47j7EQfLxJaPLi+Kw4BkHGrVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by MWHPR12MB1679.namprd12.prod.outlook.com (2603:10b6:301:f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 20:52:02 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 20:52:02 +0000
Message-ID: <adb222bd-cbd4-eab5-78d6-4fa803e20875@nvidia.com>
Date: Wed, 13 Apr 2022 02:21:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 31/34] vfio/mdev: Remove mdev_parent_ops dev_attr_groups
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-32-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220411141403.86980-32-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::25) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df4e8198-8227-44dd-8a5f-08da1cc64b77
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1679751F6F06228005191D97DCED9@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cEcKZnUrrwI7fr5mblA3yfcQ4WXhxhozNzGnbQb8bUVuzRaPC7T3GQFE+pjs0pi6pnPF0FbqTfmJjawGmf8rUS02SyF74qzCFXw0YP+dxtcLUQLluRsGQUKJ5kyjVPHsjQ/HARdAWWA2v4D+ItwaLs8FM0l2SrUaYCzI0hLMMoLUAjnADC8zW7ZGVffwDZ3o3pr8rWIKShuextJnDWyMbrO6+IP+hQSicB1OMS2N3EXadEdLVEtk2m682DsJrXnrKNmaTXm9VbVIH73EK1YeK0VHoIQxYZ4P6gKW+a1/Y/CvLrXrc/8xD21JiF41nghUxcW5fjo46O5NkIkTgZ3QkTvObEY2fs9pidgnmNV3ztTKaCj/6uAFfzXOcb7I40yj3mWssFmG6MeGSw1YOu8cln1r6wx4kFsOZ/9OCDBP0loKYAMAt4qUXdsRf5GNSWBZ2FBXIAs/I1vSwEtB3qrPRpkNzapkb+4cLz5nG8agmc3P9jCPXM/Ctn6fzrxOJC1jiY6AN1EWHyTcjXpV1WcW4gsa1CffqTV1M55T5rf3ESF5l7CTiLf4aPXoKf+kOTfke7aW6Ybf42hUxNWRkgcs3FDxRG6gnGvU1a2Zw0BWG1sIPOldIl/KoNKiBb/DaoyW88YGmV9bMKcjgm7ykJCxe8m2z1DBCJJDnUzbjMBjGcqVajIVcPPXXWPizIHQyc+6S4ldcPcUAZSxLb58CszZPOlx3bk4/B8tGTYjs8SRNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(2906002)(6512007)(31686004)(66946007)(31696002)(8676002)(186003)(26005)(4326008)(7416002)(53546011)(8936002)(5660300002)(6666004)(86362001)(66556008)(55236004)(2616005)(6506007)(508600001)(83380400001)(66476007)(36756003)(316002)(110136005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUx3V1drNGJxOUkxSVFtMVpxck15SEZmaVk1c01CUFNEMDh1RDdWWDlKcUt3?=
 =?utf-8?B?ZDFOdFdMd0J5eUtNRFhOM25ONHc2eG51KzZENzBwT2dnYmxXWVQ2VzFpb0Jv?=
 =?utf-8?B?b3JTMTRPSEJrTEpQa2NZU2pCODkyOHRBLzJ0bHdVdUh3VlRmdlVJbjZjQ1Fp?=
 =?utf-8?B?QmxhZnBqemF0eWJPNXl4U0NIVUFJM2s0ZCsza21Sb0dFYkcrM3VHUUdOWjBn?=
 =?utf-8?B?eS9oamU3SmI2K29vMjNNT0ZBZytOSUI2UVVZU1dMRHIwL1dOQXpBRnJiOStv?=
 =?utf-8?B?bkpzWXZOMTNlWnNGalRjSHNtanpZOWhkbkcvRkxIVHJaazNhT2NZZGVUZlBM?=
 =?utf-8?B?YkdDdkFVMzFaaW1sb0xZOVZRWE54SVJjMS9BTi81ZGtRYklmWmozcVBHZC96?=
 =?utf-8?B?aDNGbG9aUUY3MWpsclNWelZCQkhHSjR1VVgyalpxTlRoUkhONlZXVVMrbUlS?=
 =?utf-8?B?ZEdyN3ExVU9qK0JQUi9zU2tJaU14ZGw3bWZ2R3BCWnRCc2JoeFhpeHU4dTMv?=
 =?utf-8?B?MDNibWV2VVgzVTJIdFY4RHF0Y2diU3VHRnlVNGRBTHdyamZESTFqSzRmYjFa?=
 =?utf-8?B?cXZtZUpoRU9RSm9MV01nbDVHck1HTlJQR0tHcnQvU2dsTmpTemNQcmFTTFJk?=
 =?utf-8?B?NXlGOVUvZkFIQ1lKeVpUUjBTUURsQnJGOWwrYkhIM1ZvVytUQUxqOGs5c2V5?=
 =?utf-8?B?NG9nR0VsakY2dFhxY0tWTk1TSzI5REg1bEtFT01MWWp2aXplSmo3Y3FaSmhS?=
 =?utf-8?B?M2V3M29nK1VHOHVMa05NWjNOV1ZUMWxvTFNaRUR1dXVqVlN6V1RGbmdBV2ds?=
 =?utf-8?B?SkRRRlU2ZnhkVlFLT0I1Q1dVdDl3ZnI2N1hQbE9MKzNEWTQ0UHJVWmxQNzVz?=
 =?utf-8?B?dm8xd0tzRUtDUUt5a01xQ09vS0IrMlRnbXF0ZnlJM0ExMDhZaFZaMG5sQStP?=
 =?utf-8?B?dlVFRDBpeUpXRFI5VG1UaTBXMlFLQ1M1TUU5T1NRV1c2Nkt2d2FzSTZMRXlR?=
 =?utf-8?B?MFl6WUlJQ0p5eDNhdVl3VW4xVGlNeHQzbTVEM1pldjV2djF4Qmx3c2x2eTlv?=
 =?utf-8?B?QWhQSEdjSDlFYjYrRzdOMEh5WFhJeGduU3pYcC9Tb2swSnh1TjdybXZEVEdz?=
 =?utf-8?B?N3htaEpsdEMvRXh5c2UvanBlRThBdk5Ed1M0UFpPSi9YQUFEdklBeXdHaGkz?=
 =?utf-8?B?VWFGT1pFN29ma2pWL0tLOVZibXRHWkV1YW1oSkFWMnpFZC9QVmJ6OFdhQ3hp?=
 =?utf-8?B?Mk5YbUYvWngrS3BFSDFtck5yaE9Rc21NbkhabG8vQ09saHZ5eXFNbWdBMWhP?=
 =?utf-8?B?d0NMaGhpSFR5bDhqSHovV1Y5K0dHYllWbWVTOVd6MlYxUmV5UW04Nzg2d0tm?=
 =?utf-8?B?b2EyTnE3M1JzemhadlhmUnpZMjl6aG1hN2Qrc2JXVTU5ZFl6Y21xL3NWVzk3?=
 =?utf-8?B?M1FibnhBbHp5MGFDMGQyM3h1UzNyYTJsdFJzTlpSdnRxTzZURThSTVhpenNm?=
 =?utf-8?B?SHVKUmpzU29rcXE2VUM5c09EUTVFRU9aTVBOMnhwSDlWVHNLcDBiV0VWZ2d3?=
 =?utf-8?B?N2lXT0RxRDVDeUNCcEdkZkJ5WmRqYUJIOVFGemtGMU9uaXBsMmE1U05Xdy85?=
 =?utf-8?B?UEk2R3dzeWljbDZmekxWbTBvVGlzamRkNGFEbVMwWE0vSTJ3TWtZUWVZTGtC?=
 =?utf-8?B?QW1CM05iSk9Temd1K1BMQTVMTjZsYmt3WW04Z24yRlJRTFJEaXVYTTlkTm9i?=
 =?utf-8?B?SEFRamd6NE1VRzlkNzczUWQ5eFRENDFSZXNJcWNRZnhIM2lXaEFRbFZIa0Fa?=
 =?utf-8?B?UUdoSDluZGhWOXJSc0UvYzY3OUtyZHFHVk1hQ3FkN3NBOTF5Qlk2aVduaU9j?=
 =?utf-8?B?OEFXK3NucHlycktrdzRqNGdMOXo4ZzVlWEx5SmI2ckl0eCtxeG4wd2M5SlBF?=
 =?utf-8?B?WFJ4ODcwSnk1Mk5KOWNFOC85NzRJYWJ6eHdvOFZLRmoxaTJDdWZ2Vlg1WWdG?=
 =?utf-8?B?UFVKQVIvRitWZFlnUjFXeS8yekVJd1BMNXhHVnowcG5JVmxVcDExRVcvU3Mr?=
 =?utf-8?B?cW8wR25aa2tWeWs2REZOM1hDUXhZdk1qeWJlUnJPS2RzQTh0T3RYblkwemJp?=
 =?utf-8?B?cUl3UThvZ1A2NjljQkdQalV5b29SaEVYRUljSkkrb2NKN1MrNk15ZW1KQlBO?=
 =?utf-8?B?RkNLbWpvRzhFemk4aW9Pak1yWXFaUVR1d21RZkNWM0phaDdjY3M5ODRVeWZr?=
 =?utf-8?B?T0dzdTdsa0VHN3VDM1FKbmFjc3FRa0J0L2oyS1JBRGtaYTBxZVRjRjZQbXhF?=
 =?utf-8?B?V0JVbnhGQXEvS09DV3ZWNmtLUFdLUEx3V29URXROQUx3SXUzbXE2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4e8198-8227-44dd-8a5f-08da1cc64b77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 20:52:02.5180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9roXIkzC4UarfrGXlX6hl/5cJcGEKGDr4JruvM0cplhojrYoIe+Zz5jSrP7PuVI9iPgJcKk4n8szmgqrXLCuvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1679
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2022 7:44 PM, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> This is only used by one sample to print a fixed string that is pointless.
> 
> In general, having a device driver attach sysfs attributes to the parent
> is horrific. This should never happen, and always leads to some kind of
> liftime bug as it become very difficult for the sysfs attribute to go back
> to any data owned by the device driver.
> 
> Remove the general mechanism to create this abuse.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/vfio/mdev/mdev_sysfs.c | 12 ++----------
>   include/linux/mdev.h           |  2 --
>   samples/vfio-mdev/mtty.c       | 30 +-----------------------------
>   3 files changed, 3 insertions(+), 41 deletions(-)
> 

Update Documentation/driver-api/vfio-mediated-device.rst where mtty 
sample code explained. Tree command output should be updated, i.e remove 
below 2 lines.
         |-- mtty_dev
         |   `-- sample_mtty_dev

Rest looks good to me.

Thanks,
Kirti

