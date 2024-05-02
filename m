Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E878B9B12
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 14:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D32310E5EB;
	Thu,  2 May 2024 12:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L4h3/6b6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC3A10E5EB;
 Thu,  2 May 2024 12:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsU8hbmXyjE1aJ70DEbNcFV9+RVZdx5m0soWlX1Z3d8BRZlVaggCCweD6qzECBvolPbEjZZYQ/6as8sLv15M1ltdRBx3NOoc55w8R/lyqFzWsQ62JHAsqlbMR7pl5GTxeGcC5/mJz5rUh4eCaDY5QdzTmS+d9zLpdZ62nC/3hc8l5oS/s9ivoGlO91ni4jvLTEfRVT0XFJ717Kz8ElbgClkfXPSx+sAo0ypAT7alsbtZIaKuacGDAUHHH578c/LcsZWXGNsx5aAhEzgCy2LLhIuGh7WPtoJFUzaOCq/iqYmhPfH46BGoeOQXJ1JkPvynTJLKXvjrnBPUndFin9T+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu7mOHsFbR2hUDon7Qq6zHBP7s+rxih5eQzsE/stuCY=;
 b=DI6yW3mmi6jMusYVtPtKdgHQrqLTkBmBF5E3IguLLc1ch2jlquRZaFhNAf8p6mmogMNQqiGyWDi4ecSZlDpxQEXv+EYcCKyel835dEqTxaKhPGx/ovIHY6kHyflCej0y0XtaABbx7OgtIAgHnyiHpuID+VED6Z6BXoI2XVom1K8XYgc1rFqzpdt4rLbtObq+zxFJk8t45t0oFDpJ6osg4ftkXR5y6wTbEN6hmbVmLIw6bqKFJ+3FuoZ5VGWGURnC5hz7ESLAhkpIxuJv7FDOtALjBSrFrS4Kq4wlEaMLlyU75+/KXVipaEqK0SjAmCSXYwCBHtM3rSCwnIzBnxwMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu7mOHsFbR2hUDon7Qq6zHBP7s+rxih5eQzsE/stuCY=;
 b=L4h3/6b6xP3m8GU79BXg8Kp4f8Fh7Cy/t//pNV3NZSQT95GkeJFCiNWFfiIm/vbDCi1Y4v8HqE0Zct5v7TZuECPanSNSu8PJ8DdyRdRyD7BlfUQm4HfxPKQYCzFalL7BrQ+g9JKctRYgJfCmduGvyhlJelbF1OGey61ljW00xv4sZK9tLlXsgkWIMyX41TDPbo90B4c+03c62Irf6xTuDxs28UqAWptYd4bvoGYpiYVsMnbKJQYJKexOrLLbO3B8z8xBz6l7h/yue5EvtuD6b8N49hfsnVnZcFbel5DRFos7M4Me4NhppOJUIi0FqYNUikMAPvbJkqSw3UDQgB+vZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.24; Thu, 2 May
 2024 12:46:34 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 12:46:34 +0000
Date: Thu, 2 May 2024 09:46:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240502124632.GB3341011@nvidia.com>
References: <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com>
 <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
X-ClientProxiedBy: SA1PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::27) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: eda72473-d1d6-4157-cf3d-08dc6aa5e663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUZnT201K3ZKaW8vT3VwNnY5bkFQN1QwbDRreloyWUUycHdSRVBJbG1EanNk?=
 =?utf-8?B?S2ZrSGJYcU4vYmQxUm5FZGFjczIyQWZUeE51ZC8rcmFiOXkzR1NOS2h5ajYr?=
 =?utf-8?B?ZlptT1hCc1lNVWdWc2xpVGxFdGI4MHQ1bHg0RFh3bmM0b0FOZFQxdVZFZEJn?=
 =?utf-8?B?eGxjUjZpWXRWVEZvWWVjZkZGOXZjM3JjZWlIWjR1VmxxcDhHYzRjVjUyRXU2?=
 =?utf-8?B?eHVndWkxQ2hhdGRhUVpjZzgvQ09MdWJxYXpCK1ZvVkw5UkJ4dE5sSVRNeTkw?=
 =?utf-8?B?ZWRTVlhDZ1RqRFlld2JGZE1KalRaR2k5VkdjaXEyOFF2S1VzYzA2Q0g2Z3RN?=
 =?utf-8?B?YzR3SGFZYUNBc0xqeXk3a2FkRjhyVkRyOGFYZnhHdFhYclUwTDhyWGtrUWdl?=
 =?utf-8?B?c3JvL1ljZHhOZUtjYllaSGNWUWoxekNuWFk2OS9WWGwvS3VyM0JDZGxkN2dG?=
 =?utf-8?B?T0hTbDdiaXp2VlZnYmtqUzVIUVNYWnZLdDBQWlhuOUJNRmZlbHdRNXZCSjIx?=
 =?utf-8?B?YklOOW9xRXVNUVEwTzNsM2tnandjZUFrOXk2cXdueEQ3S1RweGNDaXZGSkg2?=
 =?utf-8?B?MHRQYTdkMjU0OWNhUzVzazhrTFpLTUpvVmJTM0tmL1RZdDRPT1FhTlhHa3Fo?=
 =?utf-8?B?MjJET2RSY1RQWUxQMDcrQ2F6WmpaRUxYSTliMlhFc0h4TTNhMmFPbXlwUjNo?=
 =?utf-8?B?d28ySjY0RlRLZjFOQTc4Tmc1YWZiT1l2UkZmUW5rL2M1ZmMwdHpqSFF0ZnFi?=
 =?utf-8?B?eCtXRy9EcFZYelg2d0NVV3duRW00Y3U4ajZETVV4Nk40L2srd254L2JIQzQ1?=
 =?utf-8?B?cmVndGFhSmlJS2dVMmpSbHJFbEliVVNNSDNleGVwamNWOFBMV3JSdXlCUlBP?=
 =?utf-8?B?cEg4dFgwaHFBV1YySWdxc0hzL05uYnYxaXVGK3FpZFlMS3JYS0FFNkF3MjBj?=
 =?utf-8?B?Uzh6dGZwaHdJYnF1SXA5UG1IdlhNTzI4R05NWHVHL3N2Sm1obzI4QzhXQzlI?=
 =?utf-8?B?OC9odi9WZjd1UzNDN0JTdDdxd3dFLzZTWGNua2c1VWlSYllrejZJWFdVYkg1?=
 =?utf-8?B?WmhmeXVxdTRJK2M5M1ZxbkM3aEZ4Vk4wZG1EYkR4enJ5NVVpK2FkcTROL1l4?=
 =?utf-8?B?QndlZTFwcVB4b3EyNmZYU29BbksrTm8xS3ZCLzlhM1kvRDh4ODM5S1FQeE9E?=
 =?utf-8?B?TTQ3YTNjREJVS1RxSytNYjF3d00xMGZsSlUyeEoyRWxkeWpiMDBTL2JmOUxp?=
 =?utf-8?B?TFQxV2VRNDhaSkRNNG11SFJFUGJ0Q2V6MVhJVnl2S2sxUVFuN0xjL0JsaUF5?=
 =?utf-8?B?cTZjZERHUFQrTExVNk5ScVNUbGVpc0R5WlV5ZDM3bk5FQzh1SGtnd2JoeWFy?=
 =?utf-8?B?bFcyWDkyWStMd3hycWlublAvMXpnZzVPY0VmWTBoOUNkM1BKRmhzT3hJTHJZ?=
 =?utf-8?B?UEVZNU5EU2lkUFVldGZYQjFEcVZVMk1YRW54V0xSelJYd3lmZTNtdW9uVXhu?=
 =?utf-8?B?Z3haV0lpSDAyd0lOWmpQYjdUVFIzM3BENFdMODJhbVIzSVVwTUIyaGdUQlBy?=
 =?utf-8?B?T00xZWtkSVJYd1lmS2ZyWDh4NUpSZTYzVU5YeTdwVGR2ZEczRmJuZVB6OGRz?=
 =?utf-8?B?Rk5UN0xkVk5xOW1tUkpVZkF2U1BhMFNwNzd4VXR1Z1ZyU3p4T2JrVXQrd3JW?=
 =?utf-8?B?NThoQ0l0UVRLNDlucjVHMGVGZWgxMTYvdXh0d1liM2R0NGhDRzZ5RkNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lVRVk5TE5rZko5ZUJIWXczTWMvczZ4KzhLN0VEK3EwV1dtOExnTTNoVVRD?=
 =?utf-8?B?SnR4Ni9YN3JmR1dIUWMxSjk3bXZONWdOT2ZlVDdVNWJWL0lRWUpJV3gzWkhP?=
 =?utf-8?B?dWU1dmN0YUd4K2hTdk5pVURDdWRSSmJya3hUK3RwRHNselNra0VUdVZxSFRV?=
 =?utf-8?B?c091NHl5d0I2cURsaDUyRno2QnRPelc5VTY5RXYvazU2ZFpZa1NFTXhlSHNO?=
 =?utf-8?B?L2M5N3pZREtPSnNYWU9Oa3U4bkhDTFpLdXJXTmJCZ2l0bUlUdGplSzFqWit1?=
 =?utf-8?B?MzJPRlU5UzZQZ295b1hZNnpqcTBURGJjNHgxSXp6Z1VWQk94STRzZHpxVWcx?=
 =?utf-8?B?dnlHU0JjVDhOMUpiRXRqTEFrY05KZmtJNCt3TDh6eStXRDhCYmhNaVg2YWlS?=
 =?utf-8?B?UXlEN3RSNkljYTY0SURuaG00cVZGUk12dDBzS0lkY1RhM3dnYVpoNUxONE9H?=
 =?utf-8?B?bmJwbUlISFpPbndHMnpXL3A5TFJ1d2RsakR5ZDJBYkIxaWRnS3N3RzdRNitO?=
 =?utf-8?B?ZmFKV1ZaTGVrRzNSbFFpQWgzTDdMVTFMYVVEQ3NJY3RvcHJkSHRhUGhjTUJE?=
 =?utf-8?B?L3N6T0pidzVsaEtva3pwL2lMeFN6WlZmUEhxTGFEU2lpbENjZmlleGk0MnYv?=
 =?utf-8?B?RXloczNvMmZvWWhxOFQ3dmJXd1hXcUhUbS9KVHFUQ1Rsa1VYQ3JoMlpXZGMz?=
 =?utf-8?B?ME9sSERYbkFhalRoTExsTGs4dE1vNHRnSHdQS2lZT3dOdlJkSUxlNWphUzV2?=
 =?utf-8?B?VENaYWV4d2NlbkNrM2JYZkoyS3lxLzk3eTZvTWd2L0s4MWdWS0dhY2ZJOGYw?=
 =?utf-8?B?SWFQZm9jQmlqYVkySjc0OE1YTVhhYXZYWk9TYVBWVHgySlF4a0lqZXJIdnNR?=
 =?utf-8?B?b1NCc0tvVWpoK1BIU1JJK1NwMjljckNuT0FjcWNrZFZmcG1QWDVTYjkrTkZE?=
 =?utf-8?B?dTlQT2NldC9iSFhwUUNnbDNscHFESlVBV0JydVlnZGVsdE9iSDMxY2ZkZ1NR?=
 =?utf-8?B?T1FaVXFZNHBRdU5ScnU4eDhHbDVtYUcwa2dLNldFV21SRDU1WVVxRDJWd1d5?=
 =?utf-8?B?c2MxNXVCanBvU1daYUpxR0xZS25qSElnVFFsZ0hrb1hrQnZEN1ZUQ3JFMGEx?=
 =?utf-8?B?WGNHdVFWa0dkYzZxbTFRNFd6NUtCUTJISVBOTFhCT1I0SFV1NVU0ZU5NeENo?=
 =?utf-8?B?dXZYTng5Zno0b2JpTTl0cDlZZlNIbFdjZ1RwQ29EVmhCTVJkM291b25iMnZV?=
 =?utf-8?B?cWhBSXRORk84Z3A1VFFPelF2aWtNTU56N0pBZkhDM3Z3OWdMOHhta296eWF4?=
 =?utf-8?B?aDEyTWdJc0xyR0RGRk1YNWF6SEUxK215V2swamNwY0ZWZkFXZUpCUE50Y3pF?=
 =?utf-8?B?KzJkcy9kRGNwQWQzVTlSU1QzTkxKRDNwbnpiOWtFZ0hKelBPRWE5ZGRWRnNK?=
 =?utf-8?B?ZmREbmZGZDczUTdqWjIySkowTE4zak9jY1pHM2dmT3NrRUs2aW02SzFmbWtw?=
 =?utf-8?B?emRkbkRqZjJUVCtJQXNvUzk1SmJoam4yZXNoWkIxZTYvak01WFY0Rkw0RFR4?=
 =?utf-8?B?TGZMejJYU2IzdHQ0MjhGamFPZ3JNdTI1UUVhai9lS2k5WjhYd1hpczc4Tm95?=
 =?utf-8?B?UUx0YThJNEVKU0ROKzVJU2lTRkVLTWFHYXNGVml4MGZDV1R0Yk5MRCsvR0dp?=
 =?utf-8?B?SkdvNGwxYzlseHl5ZlVoU2dUazBJRVh1NG5HSTlDdHZybFVreEM1SDROY2Jj?=
 =?utf-8?B?QlhMa29OSkRBQ3lDSnZIeFZydlkwVTR1ZDdjK3MvZGtSVFAxYXFEaUt0VExR?=
 =?utf-8?B?SUdtOTBLWFhkdnZJYmJEOFlVSFVzVWNZVUNBS29FUHBLbCtvMTdPbldXNVBx?=
 =?utf-8?B?RUdpYXdERHRNVjEwVFlNb1NDbkdIMEVrTDVZSzZtZWIxcVovenVnUWRycytt?=
 =?utf-8?B?ZjVlSUZUaHRGVzhDSC9QSGJlMlh3d1I0NFZtZDI5eWJpaFFTWHNrZ0kzSHpn?=
 =?utf-8?B?a2JzY09TaWpZYk43NFBDQjdGTTlTcVFTUU1iU080bnRvNWVvSnNFTFo0aHVq?=
 =?utf-8?B?OHRyK1djRys1eHl0dW5KNThWdVIrUFVpWVUvNWEyenViNE0yUUMyUTM0WHhm?=
 =?utf-8?Q?aoJE9dmzkQWiGwrhocH9kT987?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda72473-d1d6-4157-cf3d-08dc6aa5e663
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:46:34.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpfuJ0kJZkOUb5nOJQV1m4uiQ1Gt/2xcveN2rNHRXrTNQ1fODz+O1uf3xPqnj/1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
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

On Thu, May 02, 2024 at 11:11:04AM +0200, Thomas Hellström wrote:

> It's true the cpu vma lookup is a remnant from amdkfd. The idea here is
> to replace that with fixed prefaulting ranges of tunable size. So far,
> as you mention, the prefaulting range has been determined by the CPU
> vma size. Given previous feedback, this is going to change.

Perhaps limiting prefault to a VMA barrier is a reasonable thing to
do, but the implementation should be pushed into hmm_range_fault and
not open coded in the driver.

> Still the prefaulting range needs to be restricted to avoid -EFAULT
> failures in hmm_range_fault(). That can ofc be done by calling it
> without HMM_PFN_REQ_FAULT for the range and interpret the returned
> pnfs. 

Yes, this is exactly what that feature is for, you mark your prefetch
differently from the fault critical page(s).

> There is a performance concern of this approach as compared to
> peeking at the CPU vmas directly, since hmm_range_fault() would need to
> be called twice. Any guidelines ideas here?

If there is something wrong with hmm_range_fault() then please fix
it. I'm not sure why you'd call it twice, the HMM_PFN_REQ_FAULT is per
PFN?

Jason
