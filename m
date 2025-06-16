Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447DADAB26
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8010E2E7;
	Mon, 16 Jun 2025 08:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wyXbFBHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DE810E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNbjKhsQ8QE8ZGQJNV/z/rougEE8jE8ivjomQOkXt8nQ4HFvTOuH63PMtslraJuB3udK+Lrln7tzt54MVVO+H4jGbnYhDCXgjB2cYMJWEgsVmzJkKINZkaGrGujGJpBluW30Aa6qOmPKu7AgUW4sz1iFHRKvDm6TRJilYTyI4RSKkNk8gbt8pFY4SW+J39eLOHkeKOXXSrtYk06MRAJT8HQEemxorA7GN0xJMBhWYaA/WHguHIVtZjWbGutfkWuH8xvJih0yPuo7Snf9Ja8aBhYMyq7af4MoHPtbOhF1fp2wgG34XqUklJDUxDVajwT2P4LNkRUQquLbz75FeEFdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYu5YFqOWCGLxoda+i++ExOi2sxqKYiNiHH9dEYGVRw=;
 b=V7Gn46Bywkh2YPMNQP419SpdZLSkXAUkGHFUe9ya1b8hXxpIhjJLBnPts5JD4jKPGZiK8sekFq4DckljcKseaQ4GfHcczq46bChkDZYnqlf/LFwUZYw1jp5vr5lydfDlLbbMNZZtBipD1tefQAl3d5UlC4I3+t1H5FzoBMVCtY2HkLO5aeET5qXVCTCzHkZdpUpZJYUA28SK/e2RakADTfgVyu/wch4klm0kvDbiLYMuB4mEMcvB3Y7CCK941FljUWtAQBl3PqeyEHT211Tkz3mzJtOU9oT+WNpRo/sZrSmsLWAGHeqJZAdo8pWuEMXXlJxvAc9/y7LxyFWXoOiP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYu5YFqOWCGLxoda+i++ExOi2sxqKYiNiHH9dEYGVRw=;
 b=wyXbFBHpLCeTnveEgrLe8jkW4t5S7TdEOMnDNOJObfiiVMEI7QtFIvM/f+48H451x4Qf/b6J+fkzy8htIo8x6dBgzc9B267QfsuXUhO1J3VEMD0fFqTJ1SsxUn0hcoBT2uYBK7tc/UrJwIZUFG9Se0sVqGt0U32RnqgHsu+3dv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:51:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 08:51:33 +0000
Message-ID: <ba8e22cf-18d6-407c-9ed5-cc7de0180c29@amd.com>
Date: Mon, 16 Jun 2025 10:51:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Add DRM prime interfaces to reassign GEM handle
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250613182337.3767389-1-David.Francis@amd.com>
 <20250613182337.3767389-2-David.Francis@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613182337.3767389-2-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d4d449-0583-4d20-2a64-08ddacb2feaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjh1NDVScFRhd2dIR3lRMzJaam9aeG5OREZpRFlsa3p4RkZQUlZoMndIZXZy?=
 =?utf-8?B?QXo5V3ZmZjlLV0NTWExvTHRSSnlVTzYweTJKVno3MkdpQUtIYlBSMjlnTUJw?=
 =?utf-8?B?STJtWUJHNGROQ0RUQW02QzFTZm5kWjhHVU1QaUVNOW8wbDE3bDJwRnpVc0w3?=
 =?utf-8?B?OGVlN3ZuU21MUzBFNFpVYmNjcDhORllpVEtzTEpSb2FCQ01IbnhoRUQ2eDh1?=
 =?utf-8?B?SlJudHpoS1cyVW43Q3A2RHpWQnVKUmJzaytJV1REc2ZBTDRFK1dEQTBENlJi?=
 =?utf-8?B?RGVlMWEzak80d1NHMUZkbkhRbW1STGlwc2FVSW00dFNpYnczcHB1bUEzN29r?=
 =?utf-8?B?Uy9veXY4Z0tINGVFeDloZDh0ejJGd0syUzRoejB3UjRXbWlLRzRvR3N0OFNs?=
 =?utf-8?B?aXBGWDNDUHVSL0ZIUUJJa2l4MG4yekkrTnE0b2w3ZmZnbkRZS0c1STJlODEx?=
 =?utf-8?B?SHVJcFh4NkxIZjgyemdYSlNDQU4wRHpDNXpTakFNY242WVV6MXBnaDBIbnU2?=
 =?utf-8?B?ajhjRThJNW01SGs4Q2NVZGgzV1ZmZ3l5dGUxNUw4Yk5pWEgzZGFJeUw0SlRj?=
 =?utf-8?B?aDF1aTBnU1dwOXJHR3FDaUlrWHhjM1JJQ2x4WURpV0xtQ3ZTUzR6MTFXVTRT?=
 =?utf-8?B?U3FzdnhnNldzYStlNHdBZmd0d0JhVEl5NE1abEtYWkd6UUtJVGtwTXRLSGVi?=
 =?utf-8?B?blFyOTFFRFBPNTUzSk9Pdk02YUxQUjE4QUhremNrT2hENlYxbEthMU5iRTVq?=
 =?utf-8?B?dUdIWEREd2lxRURHUlVBK2UyazFmZlh0MWJZS0xKMWM0N2RRWlU2dzlOQWpU?=
 =?utf-8?B?REphazVyZG9iVjVxTExEb3Y4VVhKdTFvbzdDTjcxMkZTV3dpQVpBSHdqOWpy?=
 =?utf-8?B?Yy9jMnBxSlQrbWkyZFBOVlpjV2FuTERFclkxZHhZTVc5WGpVMFF2bmo4VjFW?=
 =?utf-8?B?M0ttdGlKOU53QnJ2WkRISXZQTkZhNklzZi90eTBDMjlQVTN0TWpRcjRCYWVu?=
 =?utf-8?B?NzBlN2RmRUZsN2M5VjR6UEZFemJmcHY4UThNK0RQbHJ4QWZuM2lFa0c5Ykdh?=
 =?utf-8?B?aGRSb1lPd1I5cm5oS25lMHRxb1lDVGc0V2VKcy85clFRb09WTllHQjdua3Yz?=
 =?utf-8?B?MEdXbkFVd1YrNVRBVUJQTnkwaFk5d1Zhd3d3QmY1cUdNdFlUMDJ3M0Z4amJB?=
 =?utf-8?B?cW5STWxhSTBxZW8zSmtxc3ZsM1hGQmNRUmxybWJGQVFzbkVVL3pwYWxyM3NE?=
 =?utf-8?B?czU5Vk8vS0U4RWN2aGcvaWFHazFRQVlFZ0NlU2llcVppOGJCNDByTnlybm1v?=
 =?utf-8?B?YWpxT1lhN29TbmZxUzJmS0tYb3ZNMlJNTXFNdGg4UnZhV25wZCtNeUpUd0Nw?=
 =?utf-8?B?RkdQY2o5VmgvQ3RCOHZwRkZUd3l2L1Mxa0Z6VzZVVDFXU3Y2d0NDVm9vNzNU?=
 =?utf-8?B?RmpaSGRuMEtWaEJNdkUwVXlrZktKUXF0T0RxUEsrOGFxMElVT2VBeVowQmhV?=
 =?utf-8?B?VFdLSWRTSUE3TEVuWG92VksxOHkzZnNEelFsSHFkdVFRNGNpeUM2K0JDaHVN?=
 =?utf-8?B?R2NaMEtLUXBCeHUxNjBNdGhrL0RlUzFlZUs3RkpUOVNJVWFBdGZobFFGYWJk?=
 =?utf-8?B?dEtlNjJHZG9jQ0tSNTdtSlZkeUU3YVFTbVdHQjZEMkt0eTd4ZXpaaTg5MTJO?=
 =?utf-8?B?R3Q0NXNxZ1RnNXZ2cVBzb0ptaEZXL3lMSEdJNFF1M29uS0s1NmJ6OWNlbkFB?=
 =?utf-8?B?aUJQd1RMUm9jQlBXT0FwVFZKS2pTNStpOVJCd2NWZXlzL0dZNHJPSUFQZHVY?=
 =?utf-8?B?NVd6ejJnY2VDYUlrckZKV0RTNS9BbUg4ZGVzZy9pV0d6ekE1VElpWTNOd0I4?=
 =?utf-8?B?ZHVmU0d6dWlWOE5ndFpjT1NkR0o4cHlQT2FIWkxtYndvdGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVVKzZNS2NSZm9IckZONkgwMEp2MFdDMjI1bjlIS1FrUkhuNWJmMVRYZW80?=
 =?utf-8?B?bE44bHRscWQ4eHpsc05ma2VZYURzT0ZpRmZrbk41eDVldGF5SUpqdGpDV1c0?=
 =?utf-8?B?TFdsSFc5ZmtTdloyS3JNUERRbDF5NE9EdkhKZTZHckFPOWRxQnZLK2pBSk1G?=
 =?utf-8?B?U3JWcFJmbnlrbXlLd0FTV3ZWYXFoZFB5aXJWRW1jOGtCdWUwbm94OWc3Z3Fh?=
 =?utf-8?B?dllUQVNLNHNETGF5NDZYSUdTeTBCMGpEbWkweUluL2JHUkxNVHpVaFp4TmhK?=
 =?utf-8?B?NWlsNkF0eXNhTXdkRTA3bjZkNlozVWVtZVVVZTgrUDBJOTlMWThJanpxWE02?=
 =?utf-8?B?TXNBUXpzMG4vNXpVcFFibzUyaEh4bEpHc3NCK2dPQVF1VE5jZzVwMk5IOHpn?=
 =?utf-8?B?T01oUFVXbVpQelVET0RsK2ZBMERNZFZNVHE1UkZyS1Z2THFPNVN3ODZZWEZ6?=
 =?utf-8?B?WStzVy9Vc0tGa1NFQUNka1dEZVc1bU16MkxpSUNUUTFKZ0ZXWjRhVThucUVs?=
 =?utf-8?B?MzhtOXNSNFVvaHdmSTNUQXB4MUQrT3BjTnRFSDlYYWRlZkZyRzJVWHJMRFEz?=
 =?utf-8?B?OU9JVkE1QkRWdmtvdWw0NU5lYktsTHZTOUhybUNTWmtKUUVFczQ3K1VnV3Fh?=
 =?utf-8?B?NThsQUFyYm1URHB2bjBkUUlJaFF6Mzg1amUrakVXNTdlYksrbTBoZDFGVUN6?=
 =?utf-8?B?M1VZYW8ya1JHVFVCcW9KakJ2UUlzT0xyVDUxSlJyazY0ZTBsbG82VzBvanRO?=
 =?utf-8?B?dXFMWENYNDFlRk51dVFDc1pWd04zbms2MlBOdWNjT08zYlpML1VsTlRxUTdo?=
 =?utf-8?B?TWZ6UUZ2VHY0MjA4NHhZRUhUbEo3cUx6UEdiZDFqaHk0eU5TOVZPWXRnSzcz?=
 =?utf-8?B?ZEIvQllyTXp5WW55WHU4dWRHZzBBc2V1Q0lwRnk5Wm5EaFc0aHZyakNHbVYx?=
 =?utf-8?B?SnpTMFIzVVk4UlB3bDcva0k4RUNpMXRSemJSZnlYcy9mY2NsVXpuMDQ4cFBX?=
 =?utf-8?B?dzNsWTQ3dXo1VlNWMWcxdyszQXhqQ0lvM3Z6aVdybXZYaWkvVEZiNEJVcHFl?=
 =?utf-8?B?a2MycUFDY3BwVUJtaC9kRmFIWEZ4MnFwV01hOVV0TS9IOGhJblQzWWhWdUJU?=
 =?utf-8?B?S3BieUk1aUN1eWRGZUJPcWFKVkxPQllDR2p0Ym5XUHd4eGJkQnBXZzd0N245?=
 =?utf-8?B?WlRNWXprT3RUNUM3RldwV0tzYnFTa2MyQU5rdG5Tei9SMXpZdUlkWXE3amc3?=
 =?utf-8?B?Q1pWNkxlR0RlQTliZXFHWkk5TlB5bTlnb25jbUhhWXk1V25wTnhDVFh0eTZq?=
 =?utf-8?B?UXUzN1IyNUN2bHVRQnJVYkYxSlFlaU5LdkViRnhjcWxiVUxZU09GNGhiZGtV?=
 =?utf-8?B?WG1Jd29wVFBqdTFTbkJWa2JQRXBaT1N1N0VzQm9VbTZxNlVaRi9UYWIzUXA4?=
 =?utf-8?B?eElwUERGam4xQ3JJOGsvNlRJQUFSMlZCVlpoQ09HRFY4NWJyZUZESkVRUlRX?=
 =?utf-8?B?eGhZd0hGdnBOM0V2RnN2TXdOcCtMRXQrUi9wQk05N0tTOTdyMWtNL21Saysx?=
 =?utf-8?B?SkU1TEp3VllXenJoUXBVL2pBb1gwMm4vMlZrK21tUmpYTHJOazF3eXE4bitY?=
 =?utf-8?B?QSs1OHJGRGZ3TFBPUW95bmlBT2pOUXp3ODFSczFLYllPV1FRQ3Q2WUFVN1JZ?=
 =?utf-8?B?NzZiL3RESnBzTFMxMUU5N0xjYzVCZWV1enlmcU1WUFMzNTUxKzR2WWlBMlNH?=
 =?utf-8?B?emV5MnlCTnpOaE45Kzg5RWMwbXgrODFlbnBtbmptMjR3NmFKcmNHN0NPNUwv?=
 =?utf-8?B?cXQ1RFdjcUdMWngwSllNUUJPS2MzaXJYWkVIQ3EzdURkVlBTMTRmcmZTWlhH?=
 =?utf-8?B?bG1leXBZeUo3dHRWQThqb25WUUpuVzhOeWJiSUhESkNwaGtHTzZpTDRXTG5t?=
 =?utf-8?B?dWZhK3hETk9ZUzY2UzQzeE9wWlRuZ1VmdFZ5WGVxeGtLdDVWWjdOay9ncXhD?=
 =?utf-8?B?c0FRVm5VWUlkeVVGWUNTMStTVEZSNGt6WEhEbEIvT2hFVlVaZ2ZZWVpma0dZ?=
 =?utf-8?B?RjF4UGVJQ3h5TytvaG1Pa3hHZTV1NVA4bE5PU3lWNnlMY1Vjb2FGTTZuai9D?=
 =?utf-8?Q?uE2cHHqnP5T+Q6B58Zvds8CkO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d4d449-0583-4d20-2a64-08ddacb2feaf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:51:33.5056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWWcReUfwdWUVkPqvRzR7wq/Wf6MptuHjjTdDqGOYyJdSOA8bdn49Q2ODsUX2Pc+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
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

On 6/13/25 20:23, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
> 
> Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
> 
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
> 
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.
> 
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/drm_gem.c      | 56 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  drivers/gpu/drm/drm_prime.c    |  6 +---
>  include/uapi/drm/drm.h         | 17 +++++++++++
>  5 files changed, 79 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..31fe2f1d1137 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> +	mutex_lock(&file_priv->prime.lock);
> +
>  	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> @@ -888,6 +893,57 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +/**
> + * drm_gem_open_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl
> + * @dev: drm_device
> + * @data: ioctl data
> + * @file_priv: drm file-private structure
> + *
> + * Change the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_change_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->handle == args->new_handle)
> +		return 0;
> +
> +	mutex_lock(&file_priv->prime.lock);
> +	spin_lock(&file_priv->table_lock);
> +
> +	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	if (ret < 0)
> +		goto out_unlock_table;
> +
> +	spin_unlock(&file_priv->table_lock);
> +

> +	ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +	if (ret < 0)
> +		goto out_unlock_prime;
> +
> +	drm_prime_remove_buf_handle(&file_priv->prime, args->handle);

We need to put this into an "if (obj->dma_buf)", exporting a GEM handle as DMA-buf is only optional.

@Sima any objections to this? Or can you think of a better approach?

Thanks,
Christian.

> +
> +	spin_lock(&file_priv->table_lock);
> +	idr_remove(&file_priv->object_idr, args->handle);
> +
> +out_unlock_table:
> +	spin_unlock(&file_priv->table_lock);
> +out_unlock_prime:
> +	mutex_unlock(&file_priv->prime.lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>   * @dev: drm_device
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e9d5cdf7e033 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +			     struct dma_buf *dma_buf, uint32_t handle);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				 uint32_t handle);
>  
> @@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
>  int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv);
>  int drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
>  void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..d8a24875a7ba 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..1f2e858e5000 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -93,7 +93,7 @@ struct drm_prime_member {
>  	struct rb_node handle_rb;
>  };
>  
> -static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				    struct dma_buf *dma_buf, uint32_t handle)
>  {
>  	struct drm_prime_member *member;
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  {
>  	struct rb_node *rb;
>  
> -	mutex_lock(&prime_fpriv->lock);
> -
>  	rb = prime_fpriv->handles.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  			rb = rb->rb_left;
>  		}
>  	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>  }
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..84c819c171d2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,15 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +/* DRM_IOCTL_GEM_CHANGE_HANDLE ioctl argument type */
> +struct drm_gem_change_handle {
> +	/** Current handle of object */
> +	__u32 handle;
> +
> +	/** Handle to change that object to */
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1305,6 +1314,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>  
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.

