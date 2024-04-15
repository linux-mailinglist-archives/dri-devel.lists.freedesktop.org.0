Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366098A4C37
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ADC112428;
	Mon, 15 Apr 2024 10:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwdQC77W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9812010EA10;
 Mon, 15 Apr 2024 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713175741; x=1744711741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mk3nARvliZQpgXI/V6AS1NEeRrrsMsnCt0xhUDwuvSA=;
 b=AwdQC77WR+JMdihKr/usaO3jYOombxK3yjqRNWvqOvhA75WnmA+Sgvud
 skqxj17Jxfonc1N8vIxRabUj3GeV2mziaMliaSdHSU2oJVhBrnqEGWBkG
 iS9QSYD6rvs2g/WfmSWdcLuWks1CKMefd+nc3jce0mPIwP3wt58jwOmOu
 YyytI/rWvHT274H+idOYbIDg1KMSDsInuoNjtKvZAw/rV1NZ/bfSUzhdF
 xs60K3dvWLa2oR3ChLXTLlluEabfqScVcKqZXTecb1oKzNnRBmzlMg7Jw
 qcQPkyhTq7vWSjYN1Ygz7Nc/dVEDu9UcEVli+1YzV0XW/6Kq+7EijVumi Q==;
X-CSE-ConnectionGUID: J3IV4yRPTJSt3VXHZic4Ww==
X-CSE-MsgGUID: zgA8kfvCSXaVbL92jpIUKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8416487"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208,217";a="8416487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 03:08:21 -0700
X-CSE-ConnectionGUID: zGEbFuoeTSCcAO4ckg0xSQ==
X-CSE-MsgGUID: iuVOBBrASZGhA1+M+5f55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208,217";a="26663758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 03:08:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:08:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:08:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 03:08:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 03:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZsW6veXIKcpdckp8ZYo4pow1g2AmRiq02aflKJP69XygLL0iIWpzqGni5FgRXyu73zPPkh5vkDYrmNaWd+qEEpXoCYNKDCRuP0EFTKn6UpM0n6qbD4pck7fYtjmf7w5pByjBDUUsHrqcaOv5FC9jrhJyNS4g+lgj3fJSuB3n+ixM7FN+opUhua3OwVhuJC+miTPhvETyptLm8sXrRzthhcNAIUWB5Dqb+nASiApqsJmUdkpCQRasrWr3XTm5tOfSIAjcPe2C+voMUgmdNqX9nOm5mPtdgLT+sYJViB0kjWARe15BHrFbD83Kaw/NdNf2rVVe3IfURiC7TNMSBGZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcIqWV66887iZ4HeeehXAvOtFA1d+4MCQ6kN6QueCEc=;
 b=Nb8lCdCvtCgvlcbeKKyjoH8/Nffev0g+sM20ayEiFjO3yH//veDWfqPgVXbFCd44HBKlRoMjz4OrQfFrZ0F5HV29yQZdTqzmhv6Hw9wSwsP6L/63OSoQ40fR4rYN0tvqBGWb05Zha3HfDvCLm7PFx7Tph+wbuV/TfPMZ04UbV0yYHh9v1lpF0cq5XAhYzzvW0zcW0GLL4So1Xx7px9128MwuwpTOl7g+keV+ncmcnRR6QdaFiEJbXvmHm5JDI92ougcFtqKkJuvyqjujBFvOkx58+gI5Zet1wSoevZ5geHCydWLvPgVOijEtIhQ3bOYoLahSxYE+C2+VxKKJvujrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 10:08:03 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 10:08:03 +0000
Content-Type: multipart/alternative;
 boundary="------------669kF5io0KCE8FXa7pOw0r90"
Message-ID: <d75611bf-3248-4b91-8bab-73effcebdbc8@intel.com>
Date: Mon, 15 Apr 2024 15:37:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/irq: Remove unnecessary semicolon in
 pick_engine_gt()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <lucas.demarchi@intel.com>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
References: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b3fe05-5294-4151-2bb2-08dc5d33efc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFoPpaaWHaqBLacBfZo+FX0TZTajCGXbjlYYCyagoZ83KtB2Y0chjnK5Dl4L9ebZGGCTDt/hhNu6E+hfzRkgKVvobSDoGUmD9ulgHDyYbulcqa9PWWJT6aiAfEOtP42r6UzcUY4k1dC1NXWIl9Ac2K1vhDTJjEBVCPSSfy9WUYyRIJ2pWvPZdfXnUVjtSasBGCFPt5G94/x/kRp/PkjwOWfb9LKf5hL/hbkQPF0nfOSbHSUr5FLDzOOWaGVAtXiBRecUFGxJhV+weZJbGNL+BS0QA5oOIsJtMGtSpaVq632ymh/I7BQYFDotsAxPf2m+MKX6RlnTS2UijZxwPbHWjlBYYTn98lGsbnNz+dNccJZLlWIODkKcZRWehNBsPANDH8av5kfNgj4Dl9atafJfTiQnw2iXRyHHwJ/ue57tL0P+ozPjLf4QiN5jhLwk2f6cJ3pHAgOl0ntagtLtfkXxYPKzc44nCOtu6cUPR1IYeSG1ZrEg+mpKv18R7ID4LI7674jZ+LUodWtXEWSOIbFgDO0Ql+XiWBRFG3Ab0GrIvyDkYiOX+HcEMN26IDzFF/rf0AOABUvkfllYgqyj1Zz7/GL9skH4ESRv1IgjnXx3EKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlLQ0MwTnVsM01UZU9zcFlyVkpxdnROaU1Md093NXVmb1VnanFPMWJXc2dy?=
 =?utf-8?B?bEdJTFUwNkNNbHdmMUo3VWM4TERJSThqYTNvRWZDQjJ5TU01eU56UnU4aGZv?=
 =?utf-8?B?WUVqVEM0SW84ZC9tNnlwMkRkVHk4VFJEY08wTHB3WTBtZ21GMDV1cGdObkRu?=
 =?utf-8?B?NmF1TTRUZzhIbjNjSWExSmJYYzBCK09jb2g5bjZ5QzRKV0NSaUlHQ3FUc3Zs?=
 =?utf-8?B?ZCtOTEQwVlpjSHlCOG91WWMwZkRJTTZ2OXFDaHJOZTFDMFhVa0ZhOG1nUjky?=
 =?utf-8?B?Z01RbHpZTVlpU2VsMkpFUGFPRXBUbVV4UE02TlgvaERaZHk1dXczUm9ab3hi?=
 =?utf-8?B?ZFkreVNZcXR6RVNUNVNJSkhhK3N3VG05NHRxZHBBSXM0S0pnQmIwWnNncVov?=
 =?utf-8?B?ZlJtUjk2MDJxUXNPT0FqeTlmTnFLZjdyMFRzbmZyUFdUWmZFT2Q0L2Z5eFQ1?=
 =?utf-8?B?WDNQbmFKWFVvTDhEakZ0Myt5eDdqUml1NHZXU3ZhSnZwTkpHb0JVNXR4SStW?=
 =?utf-8?B?d3BTSkJpTkxXaWNmWnRvN0FCNDNFclptLzMxaS9PUzhnOGJna3p0U285dkRh?=
 =?utf-8?B?Q2h0SnNLd2dGZUNDKytjMzlHcjJDbVBoZjBXWFRSRDdDTVg5LzhlVFJiNFdE?=
 =?utf-8?B?VWR4NVBTNjEvZjV2NVprbkd3VnRQc01KdDVBWVZHMnV6NndueXhCV2xoUmtF?=
 =?utf-8?B?c1hHcGpTWFczUHFXV2VVS3B6OUg2WUM5Q1RhRFVueTJOVTQyK0FaR1JMTHJM?=
 =?utf-8?B?ZVdha3pwREdRM1doN0lRR01XLzNBTGJxWXQyVjJnSVA4OG1ZTnAzZGg0ZnYx?=
 =?utf-8?B?NVNxcmZzRkJWZ1cvZk5lM1N1R3RJTElnVkdRNVFLSDBNL0dYU1ljZmlydDlH?=
 =?utf-8?B?WDJTVHZPWTMrK2JDcTF0ei80UlRtb3RBaEVBK3RmRUN4Nm9ML0RxVzdVbk5Y?=
 =?utf-8?B?bUYzdGtOQm1odXhGdVRpb1ZXa1dObTQ1TTUvRjdnWHJHQVRtbklFR2xTSmd3?=
 =?utf-8?B?SWhMTG5ialRTOVJ3TmYzU3JoZk1ZV2o4eEh0cUIySnJSV25neEVKb3p4SERP?=
 =?utf-8?B?RnhUbEN2bllOK0l6SU1YbFR6SnFVSEhIeEtET1c1UmpFWjZuTlBVcFdPdUpu?=
 =?utf-8?B?dmpkWVpwQnd0blQwVGw4OVFHT2xqbVBjSDFUWmxpN1JHRjZhanZoTG5pY3Nx?=
 =?utf-8?B?U2pSS3lGaFFuUEN5OTdlZ0hTTmhTR2dCNnJjT29XeUlTSk9TUmpNbndDYzB2?=
 =?utf-8?B?VDNDWHRxUlhwZnNWQ3p4Qk5hVCsxUnBkNUdSNUFXSHdqM2E0dE9wWjVLWnlj?=
 =?utf-8?B?ZDdjWTNpdVgzS28xdjR2MTZrZ2c5OHk4ZEMzR0dIeDhMMkg2MmNIR1pmVSt0?=
 =?utf-8?B?ZkFEOE5MTWlzV2Z6WTFLa1cvK1FDM2RsMGJmQkVoU0w5MmkyUWVoeWlnazJx?=
 =?utf-8?B?Y3ZMVGRkU0l6R2lDTFZUelNiS3ZaSmphWTRkbitDWE5ZazFUZmhxSzZ1bDBI?=
 =?utf-8?B?RHc1blJVRUZYS2FZVHRaTFJ3aFpEeTJRU3I1dDcyMWsyb21iWGRVRzZnZSsv?=
 =?utf-8?B?eFExNVBtRkh3aEVENTRBQnZ3NklsVkNWcGF3Um5GanBZdHNCRDdIME9Zc2ZW?=
 =?utf-8?B?K2tlc0pueGhzMXU5SXhiQmRrcTJvZUxBVExiY1ZhUjRyMGxlL2VZRjJtUTl4?=
 =?utf-8?B?Z2VOcnpmOXVYSkJsa3RFN0xYSHN5NE4rVXYxbnFlUDJ2R1lpRlRVODhXamlZ?=
 =?utf-8?B?UGlqUndOTmNiem5sYnlETWlGVlNqcU41ZU1tYlV3b1hXOUo5djV5SnUya1lJ?=
 =?utf-8?B?YXZLaTZDUnhab0dNU0h5Wjdhc2Vmc2lsNHp6OHUyMmJhQjUzQnNHS2FKcG96?=
 =?utf-8?B?RE5rMDBpUS9ZREVFYlA2aGVyeTRoQzY3U2JpbjNWK3ZycFpTeDMvd2FIc1h5?=
 =?utf-8?B?bm1uYVVEdmwzS1h2a01odE5QK09SaXVSV1Uwb2NlUUdvT1FCYXlyV2t3VHVY?=
 =?utf-8?B?TTU2alRBQWRlQ1pBRXpGZndwUHZKL2ptRWxROEkxMXB4SlFuYjUzTE1aQjA5?=
 =?utf-8?B?WjZWQkRhSUE1d3RlbzYrMVJ5TlY1cHErWDZMa2tiZ1Rqdm1TaFFHM1RrUEFB?=
 =?utf-8?B?TEZXK1pQM2JUbEN0ekZMR0RvdE1qYmN3V1NqTU5oS3dKaUJ3MDdnTVJyeHBh?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b3fe05-5294-4151-2bb2-08dc5d33efc1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 10:08:02.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6efHfQXq+7YGQEHN39ZcAkThsVinoIDkLzF8Q1sJIc2ET0bPO2J+hXsi4dSuuofS46ZUmXx4wgc/Pi9XhQfeEwb7wkf1vXbbkZuZxCDK3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-OriginatorOrg: intel.com
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

--------------669kF5io0KCE8FXa7pOw0r90
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/2024 12:37, Jiapeng Chong wrote:
> No functional modification involved.
>
> ./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.

What i meant in the first review, was the commit description. The commit 
subject looks better now, but the issue remains the same: Line numbers 
will change after new code is added, so, it's better to just write it as
"Remove unnecessary semicolon in pick_engine_gt()" instead of 
"./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon."

With that, Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Closes:https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
> Signed-off-by: Jiapeng Chong<jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v2:
>    -Make the commit message more clearer.
>
>   drivers/gpu/drm/xe/xe_irq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 996806353171..5b1a2f46a1b2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>   			return tile->media_gt;
>   		default:
>   			break;
> -		};
> +		}
>   		fallthrough;
>   	default:
>   		return tile->primary_gt;

-- 
-shekhar

--------------669kF5io0KCE8FXa7pOw0r90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/15/2024 12:37, Jiapeng Chong
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240415070722.5131-1-jiapeng.chong@linux.alibaba.com">
      <pre class="moz-quote-pre" wrap="">No functional modification involved.

./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.</pre>
    </blockquote>
    <p>What i meant in the first review, was the commit description. The
      commit subject looks better now, but the issue remains the same:
      Line numbers will change after new code is added, so, it's better
      to just write it as<br>
      &quot;Remove unnecessary semicolon in pick_engine_gt()&quot; instead of &quot;<span style="white-space: pre-wrap">./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.&quot;</span></p>
    <p><span style="white-space: pre-wrap">With that, 
Reviewed-by: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
</span></p>
    <blockquote type="cite" cite="mid:20240415070722.5131-1-jiapeng.chong@linux.alibaba.com">
      <pre class="moz-quote-pre" wrap="">

Reported-by: Abaci Robot <a class="moz-txt-link-rfc2396E" href="mailto:abaci@linux.alibaba.com">&lt;abaci@linux.alibaba.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://bugzilla.openanolis.cn/show_bug.cgi?id=8757">https://bugzilla.openanolis.cn/show_bug.cgi?id=8757</a>
Signed-off-by: Jiapeng Chong <a class="moz-txt-link-rfc2396E" href="mailto:jiapeng.chong@linux.alibaba.com">&lt;jiapeng.chong@linux.alibaba.com&gt;</a>
---
Changes in v2:
  -Make the commit message more clearer.

 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 996806353171..5b1a2f46a1b2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 			return tile-&gt;media_gt;
 		default:
 			break;
-		};
+		}
 		fallthrough;
 	default:
 		return tile-&gt;primary_gt;
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------669kF5io0KCE8FXa7pOw0r90--
