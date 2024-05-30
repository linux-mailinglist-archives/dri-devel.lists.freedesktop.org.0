Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983908D446F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 06:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7710FBA5;
	Thu, 30 May 2024 04:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uVeKafbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921C91126D8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 04:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kN2AB8k8JXUmpXcIHz2m0LGCZEbtE0kbkP6zfUDu7E4CvkNTc1RdeBduHUvzsvg+LaAvyOEic0LVl2U/C9yKQpUczPPF88mhfZiEuu0HVUgMck5Pq52cVDbt9ORa6TaNpG6KYZPqzyKEGETCsGbMbtFoZheVOMcpC2IG6QHTPOYFIXutxJIpX7+eLNaLoSk1fdHp2scz7TGIS6QpB7vEAbNp4SRNLQD37PGqcEE9Gg5jmL/w7MOGRxzKrLUhMJT+zmyJs3DZ4875KZeV5K2a8vhDZ5RKhpM2XIGb0ttlWMxBn3j9gkh53wotI7/mGsw2AbD0Z7j5hT8BXPzxUgc+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSikjHDhFsPpokhKlVwMPRUiFecFBjm265mv+IjFDyY=;
 b=PkkMcKOFulGSF47E4B+XJq1M3LHi4oOlRvH4YGhPDUuZ+IaTK9HM8KOLLxpCxkobXfx/DuF5OpNF6Tr4OXBvzX1a2B4WdWVnlZ1oAYVCx4W46Js+w5FB2F89CT8/AeqpluMxZ1wp/4I5+DbRczAzfkLanpUROHORU2kVstuckZCDmAq1JepZT0P24C7KaOwKIcxDSxQT2ELIsSV3cjM0jBCnZRBDiUkgJFWLWN4XhRGbKiFLjtx5r/rRxmjsWWIlApQn6DUXBP7vuPAR/18myO0XZJpukiDu/mzPidLSdNkPRkonAT/7enTYBP9TK9VewGjjONtzgZQNKWtpPmzUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSikjHDhFsPpokhKlVwMPRUiFecFBjm265mv+IjFDyY=;
 b=uVeKafbdDdlKIX6lqTX8iCz7qsad7E/DBKw+x4NiP66oBj15YgDBm9QtbTkg+YFGi/N4WVH+gMh2zfQzXlk74H8/kMD4LrA/OmUWYetnVY3s9/s4RxVu22NogEuey8wZbkl0aiPu/qnc6RaU3FRwF5jHnPwt8t/ech7U7vU3a7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 04:03:11 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::966e:5ccf:b22b:d972]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::966e:5ccf:b22b:d972%6]) with mapi id 15.20.7611.025; Thu, 30 May 2024
 04:03:11 +0000
Date: Thu, 30 May 2024 12:02:53 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jingxiang Li <jingxiang.li@ecarxgroup.com>
Subject: Re: [PATCH] drm/ttm: increase ttm pre-fault value to PMD size
Message-ID: <Zlf6be9KcW5xyVC0@amd.com>
References: <20240530034104.338561-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530034104.338561-1-lingshan.zhu@amd.com>
X-ClientProxiedBy: TYBP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::26) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: d8839169-50dd-4aef-9718-08dc805d6c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xeNHGp4zVUTIQzE7KY481uJEn8QXgLz3q8uLwBZ/WyEv5SdlLb1m9Hh32uyy?=
 =?us-ascii?Q?QkpERTMSvIOlFEMpWfB+ATEhhT8x1Bh1syYdIIefP3SC3eHPKbdielxno1ne?=
 =?us-ascii?Q?QJFkGMeqt3A6aElsW7oFQkQCn+Sm4yXFTmdNHU4ygzNbIJB6mgKqfemAQTXW?=
 =?us-ascii?Q?NKnVQWZsVl20ekpsZHfP+nOymToPGaLqM40nPtpx/QXh2isCljUL0Rp6OxI1?=
 =?us-ascii?Q?DC64e7GGUeKZlpKSsHx0AIs8hw3nX4Bt+zvE2k0Ow+iIVeDISb55yeTJuoNK?=
 =?us-ascii?Q?MnqcgU7Rug21zLGj+K+074fprq/xdnBfR/rulAaKwbkyr3fWVnxK1jdVMp+Y?=
 =?us-ascii?Q?2D4fXWzZICsWUTnqUwkJOc2qIIXJhpidIj8x59pRqJCDMBtkza1LX8Bo2cEs?=
 =?us-ascii?Q?2TJJ2rgHCSI8g9nrOdGyzUp87J8VHRrbSJ3+co+XQe6y4KInC5cFsPD3YZI0?=
 =?us-ascii?Q?i8A8d4NLkxTvYzGKbsaxLRz6sjWz1QYRRDVzx+DushzfzLAmhvhe3RGObAlL?=
 =?us-ascii?Q?392GQGUeAy2b9vSDnGEQ65emToP3cvMg7eiC4Ozjor4iOEKWTqA62esEDKFl?=
 =?us-ascii?Q?N32+pB+jMA+31VzMasLnkWvtKDbL+gO899fp38nxzlfDrPCASpx8ylH4C7B3?=
 =?us-ascii?Q?0zIEGT1WDw2dV8jytQTzfCEqVkoUOaomNSkuR/rKRa9JOdjO2HL9lJ3qvcqN?=
 =?us-ascii?Q?cHPUpupm5Ot9h5HSP4T0l5MRQPkxIZF/GDeeVSe0y2KeRxhURB52ENX7ApAx?=
 =?us-ascii?Q?WDu6CKR5dVZ+J1LUEb/Zw29ymkjZB5UuhAm9pJeXJZEen4IvYLVVZymeWx9h?=
 =?us-ascii?Q?/KvJ6oojVR3iS3iIUIn/a10yoNqkR6VLam1Cx/mY+Cp3Azce7CUjJcxPVUCo?=
 =?us-ascii?Q?MmMguV81gba3wuwG1d7PM4LsgL+T/Qo54u9UVJf4q1Db7whR1rvGJqI16cr0?=
 =?us-ascii?Q?WgtEpUus3aesYE0a7CcXIkzaLXAg+47heXUqJABHgTLcNA1ykMh8o6/a7ULS?=
 =?us-ascii?Q?285boC7UVh/qVEUwOPfBqf0o/ENWdbjPlVwRGvZJHr4XZWkNOG0Gdw6Regen?=
 =?us-ascii?Q?E/5xPJVVmoPOY1mkjs2NQzZKpnvSm6kzF/Pw9ZvtWo1RIDz0zl4GpIU0VKZU?=
 =?us-ascii?Q?r3d5LYoVhHHH05gg505pSsm/e0VS/KQtNlSPxkpfqgimg1s3YxUajsCVT28Q?=
 =?us-ascii?Q?RL6K978YjcZTWacVm8GfBr4immcfs81GIyxcH+j3CEChXEOu/V0u3oaKZehj?=
 =?us-ascii?Q?VYDtLlt1YrB4evjKcj8XqO4i7lVTL6KneGJ2Ckrz2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8690.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LNEm2Dx8gWh+3j1DIiupROHwGZV59RFjqk2mQPfY3XFJQOaNFkUFLo3O94Cm?=
 =?us-ascii?Q?0BVlg3h39HWnhLmMup73xO7YO4ajTssIwwFOrHLvKuJFwuPsBHUJUC7AVyeI?=
 =?us-ascii?Q?cZsYOBkx7KlJJeuz04BtpQQNZ3fN5TwLQZHZ2IypBs8m+gTf++FVmLmClNjY?=
 =?us-ascii?Q?rjlI3BIOmjfnhXrtQtR1xCZPGKVGhtPCbRlLoIPcmm9mXaZ1OUVEkGZ8Lnkz?=
 =?us-ascii?Q?P5fHV2S9szVLkQyrmtfe3reBFdnZ2MfUiUoLzCvJk5kuoWcPnwq+/X+O7niB?=
 =?us-ascii?Q?3BR9p+LxWqfan/sKi7kGqQxsQCG5lJyUnXUjxcoXoe1+G1JvZRDmWCBzQBLq?=
 =?us-ascii?Q?UxTaY70qUvCo4q1YDLb02C5qv/9FMa5tZ3+Mj8GISxGEf4zrPkVR+SqQ5xFg?=
 =?us-ascii?Q?iEQh5k72IFiOiWww7R5W8OtL4XC3Ft1fdclwm/Jgdcom+4XdyCnL646ivFXL?=
 =?us-ascii?Q?xu2Xty2LWw2yUIDejptiNWgfOCdK+5I3QY6QOORxcxHYLqh0kWAWT5Y/kDt8?=
 =?us-ascii?Q?tZa0UstGLyRke9lmbp+dHt96VE2SPdL9Jha1Oko05YI/Ewsn5qxoTReqiObl?=
 =?us-ascii?Q?aERTEsxp02TElwfmwC44oV/9wPGrwslZbQswExYh5rOtLRfWLJnzMaVbbdDg?=
 =?us-ascii?Q?gpzmM6cCzM8L3pjevF+pezWgvIcBhNLWfRkEEvQCtxbj+nm+InBknVkDv8AZ?=
 =?us-ascii?Q?DAbxBlp7crz39qMYtsmWdabeAyh+J85mvGxtaPd25X42BEDdgGEoUAn5VS48?=
 =?us-ascii?Q?1B1+oc6O5W3oYDF3/GMDiAx0PGeIwYt6A0U2kceOYJ5uXZQe59QFq1MHk74U?=
 =?us-ascii?Q?cWDlSrqeIjO3ACakuTcxxYHyOftJBNZ9f7tFXWzUPFxt6oJB2t9cftI8KhnB?=
 =?us-ascii?Q?Vbc2hLl+UJTglKtvehbtrq+TPgftf97umj3iz2qWhaTWJrzhHxjRByYKOk07?=
 =?us-ascii?Q?oHQldh4fS5FI7LFr/DJINiN4TTMFb0HEm3PwEiqN7NDiiZZkeW6BnXRhEMdV?=
 =?us-ascii?Q?YtFpMaFq3JH7d5kcIF7CgjOkFvkumO/U1kKd/UZsQIaDLdPIQmcWQFKEDrpK?=
 =?us-ascii?Q?sFFU0BKP92tOlBb+O5oP+6ZIncAPH23P8Bc1vzE0ZsScRqg2V1D5LasWkBNg?=
 =?us-ascii?Q?gz92r23CmRlHsC175y4+NS/cqvQ8pE3+i6tEbeLmu/C+UJdHjyjfbWIJrXTC?=
 =?us-ascii?Q?DFuHFVEaLjv8GpF1ccuraJJ1cwZhm0p/8mbXrdWdOV9JzF6rTJz/TRYrz+42?=
 =?us-ascii?Q?tgufsyBVGxwwZkkj7+LHUfrPuCLn2il44E9Ty0idm83IHDAFdVtuOyumQPq/?=
 =?us-ascii?Q?5VQTysvLenZtRBPLIEKa+oCeTL6ESS99oTgSY8aex2XaGTPeCuNFyPwx8JM8?=
 =?us-ascii?Q?/5cmW38TRG+s7qHs+Wz56LmOon4J0utZpuQooreh2DaoxS8uAlPayAFsymBM?=
 =?us-ascii?Q?BJxnihi52XaGh1vR+HSETzg2Nd3/X86N1gp9zSFlUMaxqIDf3HA742HbfGZp?=
 =?us-ascii?Q?LSPt/nXhN1Okytdjb2S+7r38gN8jYV5mgruQtla4+Ee829hL2NF6ggRXZB2x?=
 =?us-ascii?Q?cwIEmO47K7t7oPPNYMx4qzk8XHDYfxlwcqacpMxQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8839169-50dd-4aef-9718-08dc805d6c18
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 04:03:11.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOqvxuiDV4e+xYyhFCS+RPDA8rF9HQwsQ92ZnKDwkThInFvx8HJwfgjVKcKSj7avNcsv4SLu9y7fONuk5pBaCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870
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

On Thu, May 30, 2024 at 11:41:04AM +0800, Zhu, Lingshan wrote:
> ttm page fault handler ttm_bo_vm_fault_reserved() maps
> TTM_BO_VM_NUM_PREFAULT more pages beforehand
> due to the principle of locality.
> 
> However, on some platform the page faults are more costly, this
> patch intends to increase the number of ttm pre-fault to relieve
> the number of page faults.
> 
> When multiple levels of page table is supported, the new default
> value would be the PMD size, similar to huge page.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>

Thanks Lingshan.

I suggested to add reported-by from Jiangxiang like that:

Reported-by: Jingxiang Li <jingxiang.li@ecarxgroup.com>

Jingxiang, could you please test this patch? We expect to have a Tested-by. :-)

Thanks,
Ray

> ---
>  include/drm/ttm/ttm_bo.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 6ccf96c91f3a..c20ef44002da 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -39,7 +39,11 @@
>  #include "ttm_device.h"
>  
>  /* Default number of pre-faulted pages in the TTM fault handler */
> -#define TTM_BO_VM_NUM_PREFAULT 16
> +#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
> +#else
> + #define TTM_BO_VM_NUM_PREFAULT 16
> +#endif
>  
>  struct iosys_map;
>  
> -- 
> 2.45.1
> 
