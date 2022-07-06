Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA105690C1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860C113C82;
	Wed,  6 Jul 2022 17:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92221113AB2;
 Wed,  6 Jul 2022 17:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks1UJl9wA6avTUGFtA3mcJaCVvbfpMlqBpRCaknvSoaM1xB8rty+L+a7fsLaJy+NjAuvK15WvJTpCYzvsgU2HZKp0eI8YoQFgbP5/zMHguP9WVf5qyWymqhegxTWnGkL6TiD2qe2mCaUiE0KpO0dhUxS6QTPQFzDXjjqL0TLCkeNgefkftz633+PIpL8FDmirgpUD62lE8nkNopEsyVErul2Lx4FQV9c7tX3QStv2hZJ/rYqdae1Xol8htAZ/bY8rakIBpoK9Lth/3/tSygQWG8rgYSw7EaDrxPIfbsIsZxODWZOXnqWxkAyFmG79nVcdZdiiRi3Q72NfAdXrwByXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6ziMazrL2l45MPwaFk5Dt2cK55YBCC8qVIZb9KFD6o=;
 b=Vw3xODCBGniV0f9C4Uq8wly2fM/AiG4yfKuEobIZ86fRBVYREcoC0G26hLeoxSu63eFLJ7aMpMilWVFE94/2MfoI74SJn8mgMToXhwNjVD4OYmDGCgX7mjcCVKU6XhATUSH/lHwYCokR1NlAjoTris93b8sq+Fq+4M8qBs4T7DNWTKUL9A9Qd7x7oGvPHBfQ/2wkp+z41hXrYTCQZ/j3sasZt9tluq1HxTDXLLKCEKCWWrP96eULTpIe5T7EUPFN422V9p1Hc9JHYQtboLNTXXFzZuqD4hkoPaj96xryFf21QaNFAwbsfnMnDtqpbtT8TNdGZE0N+ZkrelMTYG7TlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6ziMazrL2l45MPwaFk5Dt2cK55YBCC8qVIZb9KFD6o=;
 b=hE0jn/mphFnyimiU/F0702EzeUaS33Rpo1WGwpgzFzOpHE3xZXAQCtMscZ+93ZiIv4bubVP7g1cHNPDQkrW/mr66zuDqk2vyi9DiwNUvytm+T4WwvIXuHwHDTeGH49lEZpJaKQO/9BRe4Sd1+Bkd2H/m+9UWSbPSSzMpmYOLOBErxu7c+/fKbwOmAP7pFXaCMHXHWHRwi7QhJAN0So0uz7i2hdDo5JhEMd3fCvdgQOiqFPkL+J+LbTyno9BM2fMq55M+KB9g24mocfZh3WJr2MLJ99vJU1Io5RVzffEdT28SoCaKEHn18vcqlrSh3SCKgrdSrjMO8oNb2AMg4ZU0nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by BYAPR12MB4776.namprd12.prod.outlook.com (2603:10b6:a03:10d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 17:39:08 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c%3]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 17:39:07 +0000
Message-ID: <e73fe624-6e87-673e-b023-80cb8a0cf5f4@nvidia.com>
Date: Wed, 6 Jul 2022 23:08:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, corbet@lwn.net, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, farman@linux.ibm.com, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
From: Kirti Wankhede <kwankhede@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <20220706062759.24946-2-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cbd5933-4a61-427b-f21b-08da5f766d63
X-MS-TrafficTypeDiagnostic: BYAPR12MB4776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HHzjo3hP4I0bzL48f8QuS3SoauEJx0mu/vP90MtuPqMTTB+yq5Qz7KkXoUGpFVLvCzb66+HyVQt1QnHSRwfCsNR15ILfTgqfCJsDCl9SCPdTpKR+U/F/b4t+WTkM2aEG6YBPnQBMYrHnMO+B/c968HUSMQHZWcAbSWk0xeyqK02D67jsMeIFtsasETntYxuxuQLSX7fipJn34R10WNgDK48WG03OA0QqBzVQ+PNUzl9m/pEJg+V5bhAghT4U59kMfe5lwzDXKg2pP0wP5JAkrUdo+oAgtak1KE5Dw/p+qkRgkhOA7GzwiBcWhQ81QbUb4MwruiXFzzQJuKs6YDeFwB7kP3FO9MNDnjG03oa5s3DRCTRyfO1ycGxT72PjzWsuLxBX/UXmn189wY0oO30q0w5KCMkMd87ucJ9LE+YY8Jzb6TEXDGwAJbyElfZmke3APBFwirhFtyj6gyOE5dtSd7rjiUieB7pmzAgYpfWjFAnEDisGOiVAr/VDhcYZ0vjm+7WlRFDQUrFvPXAO+m+HTVQFZ+Y5K6ugU5AK9DXM9fP0eNMa/YczKdId1RfCqNY86HDE8PGkyPLuTyxPIK2CVY96BpCRuCwywSaViFbseKdaW6Unz7azVZtfnO+otRClkxS7CkrPjNJCSuv5ZTnyNgXb43Cz0EMqHlayo6AmEySfk8/zdPxp1kcLt4OUgdPmvzqpYxGuSdsT4PQx/0lfp4q0Srm+o4ZFGWb8LQtW1bTTalwgKk4IPWyWUrL6SvBAYFlHMEG5qMF1xxnGcLyiRPsP3cTABYusb+AiQM0SoALh5IGNyPh8kA0LgPIeOOLlq7pCdAvIXdafjBcTdvkdUd2uOrMiwbq4fG5UX18LQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(2906002)(6666004)(41300700001)(316002)(2616005)(38100700002)(921005)(8676002)(36756003)(66946007)(31686004)(7416002)(4326008)(7406005)(5660300002)(66476007)(66556008)(6512007)(186003)(6486002)(31696002)(107886003)(6506007)(55236004)(53546011)(26005)(8936002)(54906003)(478600001)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjB6dDhxN1dsNTdob21oVkpCN3lHVnAyM2VRVWpQT2FQcnNWSm4wSFR1SmIw?=
 =?utf-8?B?T2dlNjhkS0F0QjFXVjcwR1JnRzhBZzVBL0orUDRWZ01pOExLTURsOHVMK25R?=
 =?utf-8?B?YjlqeHpsWndoajVva3RXS3oxRFY5ZjBFcDdickRTaitaS0hXUm5tSmRZekxp?=
 =?utf-8?B?c3RScVJ0Ym5rZkVLRTZaZmVWRUR6Nlg0eFNkUGtqUjNYSFJ2ajhSRTFDM2tu?=
 =?utf-8?B?YVZLbEhJRVBvN0RvZW95c0xUNWdVdFVtVXozVlJSZmdpRFlhOFRxR2dNa3Qr?=
 =?utf-8?B?K2NmYlRWTFRIVWY5NjQwemFVZW5DMUtkdnBPR0hMUS9iZW02NGJ2MVZXWG1B?=
 =?utf-8?B?Wm1QbzBqNXBmK2pRRjEzdlAycXI4S3F6T1hqMDJOMmRSVGxnUCtGWmtsUjNx?=
 =?utf-8?B?UGR4MlErdFdETGJQVEFWeDhCSVpoZ21MSDJvTVppa0ZTK1J2Qi9hemFPWDMz?=
 =?utf-8?B?VkFaTVFyZlQwRkFOTWZibzVBSGJIblJEV1ZNUU85YkJpUjhwdDhQR1FZc3pr?=
 =?utf-8?B?cWNCZmhqeWNocmY0Ykh5UmI0YjkzclJyUHZBSmNlWjZRdjBUV2xPNlU2SVgz?=
 =?utf-8?B?ekJSYTlWZHJzd2NYUnBPNVcvNkF1eUNRc055OFJrZ0dicTR6S0wwcFpZUWls?=
 =?utf-8?B?NlFITksxb2s0NG5GTVQ5QjdkL1BIelRzRERvSnZjUE9mLzhrSWpxWmYvVDhm?=
 =?utf-8?B?OVBEZnVEU0dqZ3pPNHY1N0x4clBuUjJ5a25HeDNVNC81VXlVajhIUzBDY2NC?=
 =?utf-8?B?aTNXeTJkRXBrOUd3MFNhWnFvOXY0RU5PMExBUzZhcGxJSGtsbXNEc2J3bEJn?=
 =?utf-8?B?T1RLSlZzYTFFeHRNV2dOYlQ4bWRyYlNwTmFDMjlYYUI4QXI1bHo3bW1Ua0hW?=
 =?utf-8?B?cnNSeEpHNWM3cnlSWjJPUWgwcTNyK0tXOGtjVmZMcHM4MzhHVEM2aHBpL080?=
 =?utf-8?B?cjdFODBGbGVCS3pWMmRTMUpZb3JWSWEybWVDYjhaWjhqbEVIaU42RGFCNUhP?=
 =?utf-8?B?ay8wOFpwSDhJaEVUdVZBQnQ3NXZ6S0RlNVVKN2lBeGJVbHhwT0ZvTEg5OHdV?=
 =?utf-8?B?ZnNyRmkxcTRVZFQ4UC9SeHdiazhRMFlNRTBmbGg2anVtOFRHaE5qL0FyS2RM?=
 =?utf-8?B?QU5TQnF2YnM4dnd6MGY0VGFVckY3akloZmZxak5vTmtaZVM0R0k2UlpwYVAy?=
 =?utf-8?B?Uy8yemRiSnoyMXl2bWJqYjVNQk5rR0ZuWmEyaEhyOWtwSjZaeW5wdzBiYm5R?=
 =?utf-8?B?ZHorNlM1WlBCSWtISHJDeC9CMnBMazllS2hUcVVVTE9zcXUvVlp6T0ZXSVl3?=
 =?utf-8?B?clFBSjVPa2FRTkZTeEI1cUdkQjZxdHp5VjJGUWl6YTBnckhrM3BDYTV6czVY?=
 =?utf-8?B?WFNHcnpJRFpkVFJ0TW9NU21ldkhob1R0U1pjTll6c0I0NTFGMkxLYndHOGlW?=
 =?utf-8?B?MXREUzBYNzV6bHE0NE9KZXlhUE5KYUhBTG8wUm1BWmNJU05CdXYycnpEZFR3?=
 =?utf-8?B?QkRlekhYWjlwK0l2a294VmRMQnN0eVN6NWVoUGRlL3c4ZUV1NkpxanhGKzlR?=
 =?utf-8?B?MXhnVURQMG5sRnc5cnZMYWxrRWFMb25WV3pPaTgxbnBwYWVvTXdFWnhTckQr?=
 =?utf-8?B?UlZQUXJrdDloUmNZYXFobnBQc09oc1N1eCtOY25VWmJSRVEzdmg4RXpoUklV?=
 =?utf-8?B?SUxlamhubXlWek9QRUlLVk0zZnZnYWdPS0laSEt5YXN3dlJVY1RXbTV4YmhR?=
 =?utf-8?B?NVBna0NCVnVMM1B2WXNNVDNnT0lsRGw4OUZwdUpzK3Y2WlFZNUR1NW03WUV5?=
 =?utf-8?B?VklZeFc1NmFKMXh3d1Jha0JFbGI5L2NmN3NqVXdsakJVNzVSVkxpZFlkVHBw?=
 =?utf-8?B?YVphWmU4Q2Q0bHFhY0cvR2xUYVNxNWxNRWVyVXFVMWordkpFeVI2aGRIUVBH?=
 =?utf-8?B?a1o3NE5ZanI2WEV0cFdmSFR4dWxydUlFOTV6TFFac0U2ZEw1aml3bmVRT0Vy?=
 =?utf-8?B?ekMwK1VrS2JFbkgvc1BRd3dTVWNaTVdZbm8wN0NYT2NBazFId09uemhOdVNJ?=
 =?utf-8?B?dGk0NGFoRCtYS1BSNFdGUnJnaEZybjE1SFBnRVJ6VStVR3phL25PYlNCbi85?=
 =?utf-8?Q?HOj932Yx2scXgPADdwpFMMxWa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbd5933-4a61-427b-f21b-08da5f766d63
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:39:07.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXYwEWXS8AgUN579iYSQQ5gNXYd9fELIB4Xv7GvLpq9WNDvz5d8PwzAVoYHa0KX2xIB7RsI6Qo71TA584COUkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4776
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
Cc: linux-s390@vger.kernel.org, Neo Jia <cjia@nvidia.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 jchrist@linux.ibm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tarun Gupta <targupta@nvidia.com>,
 Shounak Deshpande <shdeshpande@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

On 7/6/2022 11:57 AM, Nicolin Chen wrote:
> There's only one caller that checks its return value with a WARN_ON_ONCE,
> while all other callers do not check return value at all. So simplify the
> API to return void by embedding similar WARN_ON_ONCEs.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  2 +-
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |  5 +---
>   drivers/vfio/vfio.c                           | 24 ++++++++-----------
>   drivers/vfio/vfio.h                           |  2 +-
>   drivers/vfio/vfio_iommu_type1.c               | 16 ++++++-------
>   include/linux/vfio.h                          |  4 ++--
>   6 files changed, 23 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index 1c57815619fd..b0fdf76b339a 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -265,7 +265,7 @@ driver::
>   	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   				  int npage, int prot, unsigned long *phys_pfn);
>   
> -	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   				    int npage);
>   
>   These functions call back into the back-end IOMMU module by using the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e2f6c56ab342..8c67c9aba82d 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,18 +231,15 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>   static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		unsigned long size)
>   {
> -	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
>   	int total_pages;
>   	int npage;
> -	int ret;
>   
>   	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
>   
>   	for (npage = 0; npage < total_pages; npage++) {
>   		unsigned long cur_gfn = gfn + npage;
>   
> -		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -		drm_WARN_ON(&i915->drm, ret != 1);
> +		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
>   	}
>   }
>   
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 61e71c1154be..01f45ec70a3d 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1959,31 +1959,27 @@ EXPORT_SYMBOL(vfio_pin_pages);
>    *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>    * @npage [in]   : count of elements in user_pfn array.  This count should not
>    *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
> - * Return error or number of pages unpinned.
>    */
> -int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		     int npage)
> +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +		      int npage)
>   {
>   	struct vfio_container *container;
>   	struct vfio_iommu_driver *driver;
> -	int ret;
>   
> -	if (!user_pfn || !npage || !vfio_assert_device_open(device))
> -		return -EINVAL;
> +	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
> +		return;
>   
> -	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> -		return -E2BIG;
> +	if (WARN_ON_ONCE(npage > VFIO_PIN_PAGES_MAX_ENTRIES))
> +		return;
>   
>   	/* group->container cannot change while a vfio device is open */
>   	container = device->group->container;
>   	driver = container->iommu_driver;
> -	if (likely(driver && driver->ops->unpin_pages))
> -		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
> -					       npage);
> -	else
> -		ret = -ENOTTY;
>   
> -	return ret;
> +	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
> +		return;
> +
> +	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
>   }
>   EXPORT_SYMBOL(vfio_unpin_pages);
>   
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a67130221151..bef4edf58138 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -53,7 +53,7 @@ struct vfio_iommu_driver_ops {
>   				     unsigned long *user_pfn,
>   				     int npage, int prot,
>   				     unsigned long *phys_pfn);
> -	int		(*unpin_pages)(void *iommu_data,
> +	void		(*unpin_pages)(void *iommu_data,
>   				       unsigned long *user_pfn, int npage);
>   	int		(*register_notifier)(void *iommu_data,
>   					     unsigned long *events,
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e357..08613edaf722 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -948,20 +948,19 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	return ret;
>   }
>   
> -static int vfio_iommu_type1_unpin_pages(void *iommu_data,
> -					unsigned long *user_pfn,
> -					int npage)
> +static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> +					 unsigned long *user_pfn, int npage)
>   {
>   	struct vfio_iommu *iommu = iommu_data;
>   	bool do_accounting;
>   	int i;
>   
> -	if (!iommu || !user_pfn || npage <= 0)
> -		return -EINVAL;
> +	if (WARN_ON_ONCE(!iommu || !user_pfn || npage <= 0))
> +		return;
>   
>   	/* Supported for v2 version only */
> -	if (!iommu->v2)
> -		return -EACCES;
> +	if (WARN_ON_ONCE(!iommu->v2))
> +		return;
>   
>   	mutex_lock(&iommu->lock);
>   
> @@ -979,7 +978,8 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
>   	}
>   
>   	mutex_unlock(&iommu->lock);
> -	return i > 0 ? i : -EINVAL;
> +
> +	WARN_ON_ONCE(i != npage);
>   }
>   
>   static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 49580fa2073a..d0844ecdc961 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -149,8 +149,8 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>   
>   int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   		   int npage, int prot, unsigned long *phys_pfn);
> -int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		     int npage);
> +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +		      int npage);
>   int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>   		void *data, size_t len, bool write);
>   
