Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C644FE9A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970F010E756;
	Tue, 12 Apr 2022 20:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92D10E756;
 Tue, 12 Apr 2022 20:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6wyNe9QYtMfezTDVvAkMc4gE/gQLNKIaVOfb3zvLPoivyZ7TXj32YgGPq4VQoeIdZWexY5+YdHA03S4wBJNda/QwrJhb+296QSHXG1kCP7Zqs3vVH7CoEBiDuZdMWsJa9pYPRo2Z9yOTheCUa6tGjg6/sSeI7bPEAM3sBuBE+bM0N2NXSR8ixyntIvHjJ4E3Z3aUQsOPTr2nnGVbgX6SW2xHsG+gJ4MnlDX4I4Ii2RHQctbKE8Il0pyS5YJ4ygMMRXn8ZNhduIEndbMllteUMsguecM87IG7MLFFylkssEwiTnTJlPNq9jx50nZ9QKmqIK3n8HgTfB9ulghy8GS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+J2xv7+6p6wm2YtUCCq2Nz/ey85hCieIZGMvmBIuoU=;
 b=B1CxWDzhWG0O5AgABCiYwyzzDAF/zvscTZGSTrmdvUsmdWyVDedX7JLWH0H0ZTKq9/m7BxzGIFeyfyVE9xdiNZ9DM7x3rLBiz7sdGNJgKKtM+KqiebPtWX3b3fF/K9LM/xpVL+BxkZJ/BBQPXOLNHediAGMPIgY5afWZ87MNG3lNw2jYK9lYWtYDWVPecnsUqcvWlFs0MCb/RtAh6tujhurYdUehd4ieKWlnT8ohpis4kQi0SwmkK1VyNeA+oklANx8QEFiRgVu7gkBBlX49tGZozMgQWYRoUwbF8BagHE9xYttez+4JhsJsnIFKkke693xzOc7rLkMhCO2C5SavUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+J2xv7+6p6wm2YtUCCq2Nz/ey85hCieIZGMvmBIuoU=;
 b=sREbLK59xXnZDMNqs3VPQHtZ1Of7YEelgNo6WPyNiW0h30MWV7Taea0sh79eK2i/8ZePBKG4yXzL+hP114JKpgneowExdniMIq8Bmood6k5wUrLcgrgcZC/By0LZuhpJpzYGgZEZp01T+u/Raa6XAmkVjBuMVmpCpxbCki6AUpTllGu5m/iS44h75vUPXZ8zcuPrtx3cVbm46R4+kRJoUPCEednIs4UHSEP49EbNaYsw+dw/pQ79czuAOS04KMP9Oa0Zdkz1XizJtRy4aYEqHkFDRbFe6qFZ4uINZYZfNYzvaApmWFQWVIN5YDvHR888W027Y2vtF6j81C8J/u4h3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by MWHPR12MB1679.namprd12.prod.outlook.com (2603:10b6:301:f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 20:52:13 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 20:52:13 +0000
Message-ID: <48be3b1e-1707-8867-07ed-7ec7ed18314e@nvidia.com>
Date: Wed, 13 Apr 2022 02:21:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 32/34] vfio/mdev: Remove mdev_parent_ops
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-33-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220411141403.86980-33-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::15) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877639ab-d3f0-4fae-3fdf-08da1cc651dc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1679F582D36C8D1AC27B9323DCED9@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGDb9mGnf09QBdtxxCwsHuFPi4h3S7ps07orFCjXYQHyhFbYNj+zDWYT/xPRQA7q3yNQw13mkHnQz6kfdW5L8QCBMRFP9+8K4yirtOSpEUxZ1anucCs5awdp3lQVZFGDCpmfEuDNObP33vgZlwBldjcUUnj+l26Uw/436NA/xFQBS0obBf0YRok/UwGJH9r5OTA+Ac2QT3NvR/TJGLMkSSmjS6Y/JBvgtI2wacaV7jCnYGmu4e18PH73kxLHZ8gIppkPTIxnF82FpRF1sITnK8NmKdAeLqtvhM1+tUWOk/58PE+XY/VgOGQK2kiJ0jqd5KJVZ2LGOroUMheUtzdBhqUHjx0Pd66cnIdeiJBhLk2chhe5Na9AopuOj0CNWzrXU1RR6P3P0UPgB/9IqAdsYQOGGOAO/yr9u7reqSTbIVKRXix2sVYa5/Uk+h7NYak3HzEa6Uw6YBcgNIKpShWo/4rXzvvXQA5bUNZHsFmFPtbLPxsrQwK5crppltwgZ4IuWu5D68AqmfTYXbKzoLaabQeDSqulHnVWdvofT/58azHmyZkrCREoWgEuNIaTBk4uuFU9SSmCdtMp14+BmPI+c+tzFEWgUXl74Xr2Y3X9YKPtC4rli54bTJhy2LROgXpWcJ6213CSAw7cwUJAU6KxsMoYYt171rX2MRjfSFaGk6+P7zUDvKuY3yuBUxMh+RbxQZZtzuvsBU37EIN+HJDBC9aPcZ14gXJyw4PXgw8Lv4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(2906002)(6512007)(31686004)(66946007)(31696002)(8676002)(186003)(26005)(4326008)(7416002)(53546011)(8936002)(5660300002)(6666004)(86362001)(66556008)(55236004)(2616005)(6506007)(508600001)(83380400001)(66476007)(36756003)(316002)(110136005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBaQnNPaXNqYXBiM0pBL1BMMVFDc3JJT2tCdHRTUEZtbzdrdWpjZlYzbzZ1?=
 =?utf-8?B?NXdnS283b0pnL1NOclBlc2x5cnppd05paVV1cVRHSXdZcUJNdzF6Y3hJa250?=
 =?utf-8?B?ZVQxZWNHRHA0YkhqSkRtK0N4eW81UTlFYmNpU1RFTVM4aE5QdnFGSXlVaEg1?=
 =?utf-8?B?SkFXTmh3UTBBNkNQMG1ycmNmM3RHTk44M2tFaHR5QWxBMFYvMWNTbDVweGt5?=
 =?utf-8?B?c1dKdEJNd2RwcnU5WU5FcExTQzZQSk9ZcjdLa21WMkQwNVl0dXd5bHI5M2da?=
 =?utf-8?B?KzdMcFJWSFdneHRsZmgvOUo2MmdPZXBmLzZSZWo4a2xRWTA1a1YxaXRQWjgr?=
 =?utf-8?B?R0dsWUs5UXByaU0xV0thQTFVNTVweGR5RFFCZkt2c0VFdGl5OEI3RnNoVS9x?=
 =?utf-8?B?RlIvLzNlamRKNC9obVVHNkZvZjRyRlAvSzRXak9nM2c1emkwU2oxRjdoMmx3?=
 =?utf-8?B?cDFtdHZhOVU5ZlZ4MlNuSkphQVdFNXExS29LOG5YcXpRY0NIK3hLYVFiRTRx?=
 =?utf-8?B?SHQ0YS8xVzFXcVN5dVJUZkJsUEJwRHZtbVZTRnFjTGJxQ3BCTVNCOWJoSmJl?=
 =?utf-8?B?YTF4d0N1bTBFWXJDbWdxNmFkYUthVnV0cC9pbEoyWVBUMFBhTk8zNnU5NUpv?=
 =?utf-8?B?cVhQcHRia2MzYTY2Y1hoa0NZTXRFenlUSzkrZ2lDK2YrQitmUFZuT0hhdjA3?=
 =?utf-8?B?S0NYZzVJaU5rT3dxeEZoYmU4dTRHeHhoNVY3UG5RYjkzb3dOcFc4SFlhcDFa?=
 =?utf-8?B?M25INGZoamRza3FMMXRCNS9QQ1FRWVczZUtEZWFHTlp4NjRycVhYNm1RZjN6?=
 =?utf-8?B?M29WZHh3bktNTTJXaW5PNDczOUh3aG14S2hOaWpqVjhFSGl1aGxWTWhHd3FI?=
 =?utf-8?B?TDd1L3NCRk14K1ZpYUtCRUNOOE9PeUVPdXBnM3pVRVpQMitsQjJJWUZQYUlP?=
 =?utf-8?B?Zlpvc1hhVGxYT2tYRFJ4N25xVFBjdDRwalp3amRiMnpMak9VN0dUVDMxTHRz?=
 =?utf-8?B?Ulh6WmpnK3doMmFjMFVobllsMnBNN0V0TUdJMDVtUGc2aWlScTlUNmFHaGNX?=
 =?utf-8?B?dDJXaW5ucEdmQVBOWFhYM1FtN3NtakVnTXhXQXVhK3pDeHNnek5vdi9qRmk4?=
 =?utf-8?B?TTJRZS9GVmFVTE9iRzV6TzVrWUxuL3ZBcjkvUzliUUdrSjl6ZlJySXNtQ3NV?=
 =?utf-8?B?ZE5mb0h6MjhJalAvUENUUXNYdXRQSWpwU2JYeldDSEQ3dUowRUhnZHFTY2dQ?=
 =?utf-8?B?STZvaGhLRC9EbmROUWtER0FzZ3RqZWFHL0lZUDZEVkJ2M2Vja0N3d3RydExY?=
 =?utf-8?B?cWV2YTMxSmxEL2hmSEJJZGlXVklNSHlIQUJ4eG9qQU0vdjVUMElnN3hrKzVp?=
 =?utf-8?B?bXlWSDJaUXRDMlM2TzhwWXczNitDNmFKeHczdHFmNVhzdFlNc3NYL0MwcXlp?=
 =?utf-8?B?NTFsVkUxUkJqdW1wdWJPZDREOHM3T2hnbjlNUXNtQWZpSDQwTEY3YmhsTkl4?=
 =?utf-8?B?eVhpbFNsRVJWY0tGWG4rTUZwK2VpZ3lBdHBQU2N2c3kwYUxTZ3hVU2V0Z3oy?=
 =?utf-8?B?djNUUXA3WTliVWtVQi9HUmp4SmJYMjJXNTVFalRtc0RhWS9VdktGeWdwbHJ2?=
 =?utf-8?B?QlJqVUhXSFlDUm93MjlmNUF0MHBCZWhMTE9rL29wYXRxZTF2enlHdHIrM1BD?=
 =?utf-8?B?cjVJZHJTbGRTNXdGR1RaSVQyVEhJQkNUWGdjSytkRjBrVXNXdHJ3OGl3S2F5?=
 =?utf-8?B?UXdBZ2VMY3BKazZPMzZPRmxQSkMzOXc0aWpMekgxdkdROHdHUEMvME52WHY5?=
 =?utf-8?B?YnR6TkNOMmNCSElBVDFZaEhEcWU5NmpZejNiQzJEL1lqMjVwU0Flb21RRUtO?=
 =?utf-8?B?Y2xraUxHdExHVERqdXUzbk4vVkZuMnZPVnR3SHVrd0NibW04ZnFTRzNDMlZX?=
 =?utf-8?B?bmp4dnhFczlrSEluVEhOeUxqY3F0SzB3VEp1TnBwdHFPYThRYS9rbW5KZFZw?=
 =?utf-8?B?SUpYK25zNXN5ZzkySjVDOWN1RVN1VE9FOWlManBpc0pKTVc5RkRPSWM4ci85?=
 =?utf-8?B?bUdwdTZWZjROc3dJbHhQYzQ4dXJaNDdqb2hPWkFwWEIrdTV5b1ZPNWowaFFz?=
 =?utf-8?B?M2Ziak1BQzJMMmR6LzVoSUpyTkJsd3cwZlBnY2puc3hUTVlWcHd4SklVRkdR?=
 =?utf-8?B?UUo1dkZuNHdDRWYzcGI1QUt3eUlBUzhNSHFqTCtOKzMxbFdHdUt1RW1FZWJR?=
 =?utf-8?B?V0N2MUJDT20vSllIMnZJYytaTERINXRYbjFMdE44Y25MNnFBZ0NrcGkxV3pv?=
 =?utf-8?B?azd0R2l3MmdFTitRUjhSRjM0U1hoYXY0SXd4NW03bGovSUI2MU5CQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877639ab-d3f0-4fae-3fdf-08da1cc651dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 20:52:13.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYsAKMDNvXNdCSbVcTsZ8fw5QWT7UKlmz3grYfezyDevNyzB0a+pRn41/lwmS7KX0YruRitHj1w5NIM9zc7lYw==
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
> The last useful member in this struct is the supported_type_groups, move
> it to the mdev_driver and delete mdev_parent_ops.
> 
> Replace it with mdev_driver as an argument to mdev_register_device()
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   .../driver-api/vfio-mediated-device.rst       | 24 ++++--------------
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |  7 +-----
>   drivers/s390/cio/vfio_ccw_ops.c               |  7 +-----
>   drivers/s390/crypto/vfio_ap_ops.c             |  9 ++-----
>   drivers/vfio/mdev/mdev_core.c                 | 13 ++++------
>   drivers/vfio/mdev/mdev_private.h              |  2 +-
>   drivers/vfio/mdev/mdev_sysfs.c                |  6 ++---
>   include/linux/mdev.h                          | 25 +++----------------
>   samples/vfio-mdev/mbochs.c                    |  9 ++-----
>   samples/vfio-mdev/mdpy.c                      |  9 ++-----
>   samples/vfio-mdev/mtty.c                      |  9 ++-----
>   11 files changed, 28 insertions(+), 92 deletions(-)
> 

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
