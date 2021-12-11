Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11F470F67
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A558A10E687;
	Sat, 11 Dec 2021 00:23:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0910E406;
 Sat, 11 Dec 2021 00:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639182198; x=1670718198;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0S/z6V+A5bMLQ13mu7dKVkdTc5BbgjZpZnniLEUrMM=;
 b=R1yo7U0aiQzxvXabBjUTT8kbpOc+8t3okFFnoK1hFg/8sdGHCnaDze+C
 aQetMl9whhJADDgLt6AGNQlFGgjZBjxcSInCqYQ22EuH6Nqe6u1RVgo9+
 +QLQdpKWStaRuNONIaILhlHlDePaBgVyGqFNF0XSkU7MKYc7GmMHIGfKU
 fSolSVB/CtfGDbrv91byoXMmRmELvaVywHGk28uNIsQSRRUJwvg9l1nd5
 yaHp5jPXKhoxtxCiU0m3gwPj8UZBE44Zu4hiKZn1TR6UJ+JMaY+JDK+AY
 UlQEv73GElR6Cvstxd/x5JkVKfEVrV9WPENRqJ1KdJQUpgWuxaDkmv4xK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238293607"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238293607"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 16:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517451030"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2021 16:23:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 16:23:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 16:23:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 16:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmrcG2ZxztGrtK/lcfBuIVm9DVmcuO3CSuOwLGPCIMMWcbZRaCuo/vLf57WjRHXTtINn0VtcwAnsCBOv2NyySQkNRsagFYorOVQbKSr54u7VDi76jAxDSQpHkEMHYpmxu2tRq+XAr542hPHm3iRl4QTvBp6ex82gSC4Zr8rvecp60B4FsgSacW7UhrOxv/SAryHHc1AmiqEZ2G3B0sLHd0rwRSiVo/PUTIORnqHTIf6mxznvDOOQWQ5rr+V3iRlcOOWTkYIBMGYG3Pvy+F5uuVRoQam7luYeIALKEy2nn/umXUiHuik3TqeHPgWrmb3UTNW90FuTSwlcqVRol8OIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai3bwQ9V/CEdUxvNmYiL9Ki46Xvtq+N3N2B4vXrcE5g=;
 b=mf/xzcSaCAAhODUx1hgRdJgcZ5kMDdSXUoTC/Wu4AgHzVBe6rIFQDYuW2caiGhG/Oim0UCZcRvkZamK6GO7d+th/R7Deut2GsT4xt8ohP71l0YkJMHg/q7MACC2IX63LtB66ZYOMul3GuXJ3dRYO0VKj4PuzamodbDVD9MfEXEIxt3llVLWkUMm92oB6Rxwfhj1JRK+n3xXXt5yXg4Fx/b2lvIRJfkAf3EyRWDxDoGtIave4UZDPDMbw9sdDAZ3LiK3epdf9C7LjoNakSdvnfIvp3knzJ+/cxBVxwd6yY/efhIh57/HyqAonD78AYVPJjG0f2JT/1uYzWdFHe4aJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai3bwQ9V/CEdUxvNmYiL9Ki46Xvtq+N3N2B4vXrcE5g=;
 b=h86bvtrpKC+RVw6iGxRsY+XMfoYxqYxNH+3KTh28aLxd/uwe+W12bY/yCzFh+d+lcYJufYL5GAYTfcUG0NPEkzXnPiLDmVzLy6VKMCzRvemkhOJNYp1yIosNubAgWCT4GLW486HrqtCQto49PtqfCkEzVCH7KrsVPpacB8eL30A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3082.namprd11.prod.outlook.com (2603:10b6:5:6b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Sat, 11 Dec 2021 00:23:15 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%5]) with mapi id 15.20.4778.015; Sat, 11 Dec 2021
 00:23:15 +0000
Message-ID: <80f0eccc-fd29-16c6-1c08-594eb4502d34@intel.com>
Date: Fri, 10 Dec 2021 16:23:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Speed up GuC log dumps
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211210044022.1842938-1-John.C.Harrison@Intel.com>
 <20211210044022.1842938-3-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211210044022.1842938-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94cdba01-4768-4651-c73e-08d9bc3c6cb0
X-MS-TrafficTypeDiagnostic: DM6PR11MB3082:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB30829D403A9A2B7ABD1F46A2F4729@DM6PR11MB3082.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYzq7x60Q+w7P/GjAwORl8dKkUYJ5usEyAWp5sf01rz4ksUq/GGu1eFv0dOk5jXAMqG7Vw7H9egG/RIC95Tvo2aletc54uR4TIEYBF/diBrZtWqhtAsBG+szhZ4DmZqM1vn3rvmcwVCbaOVCpWTj/ZZo0Wqq00glkq1wylBQWwDZOqN/NWwEzD5Al36/OmjEQUxoe0aYhpLE7B7HJQhwEkaLSf9UI3vhPJhS8l3l6MfVhfhha3Dp8/IQE3pY0GJR6bC7mhCu1IRgw4de8UyVhExIE26FzpKQ8veW5r6LlnNpwPoM2mS2buKfzOIj07LWCk3o7oARNLQzTGdgWbDFb48OCcaCiEXpURXL2WUKAzfC4Uekevvbt2NzpZWCEAbLkwjHJjHaQi3B4R5euzYMPh5At6pujk/mt1yMlTjfLLQicd054syOS19d3Ze1jAJr+b4mLoinCkahQX+aDJsDqS/cbNyBVptLaH7YPcNMEwMeOkkFbc6RKAkgsKuWQDDu+/bwBqJeRKtSQX619siLghMSlPwEhGzn0lMPdTC6OCSe7bO+vlTOfbxQHc8BZgPjtG5oqHUVbszUAnD4XrrSar4Du+26w7KTB8p5JPvhVqMhaEQseGLkXTaoVQR5Hv4bkbDUxpdTX4vRidHvDTTLbLSOiX+TW5k+iSh/pnK8Ht0Eq1RhYKasbzq7yVE7q0e2kkds6RV3IU4fO6SBF9p8v+LQaVxueSc78Cd1NPclyaMe3E6XENJFNNcrnaaUqzl3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(508600001)(450100002)(31696002)(2616005)(8936002)(6486002)(83380400001)(31686004)(26005)(38100700002)(53546011)(5660300002)(6506007)(316002)(6512007)(36756003)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNhdUhDVG9WbUFKWnA5eEtoSlEyVXNKSFA3a0NwdU1VaHpnbXFISTZiQWF6?=
 =?utf-8?B?dFlEVDhYUGFmc3FhOG1OY1pSQU1DajFlZXdTYjNhaFVQVzAwYlVUOXgzR0tl?=
 =?utf-8?B?US9tN3VaaFNQYlUyMytSZExNQXFydEVueG5xazY1ajJTdjFjdXJDb1ZkZlJ6?=
 =?utf-8?B?QW5SWmk2MjRFbVZyd05MUXc0c0MrVEpMV1JMZHU5L3BQaGI1VWNhOTZ1UEN4?=
 =?utf-8?B?WkQwYTk1R2RVem5WNUJmSHh6L29ob0FyMERxYks2QlpZYjladU5QeHBqSkt4?=
 =?utf-8?B?ZzdMZFVKZ2YyUmhhVDRBSnRMemVEaEFmOXJQVnh4ZlQwWXF6OTVnbmwzVFdH?=
 =?utf-8?B?SEdwTnpXczFLMWlkbjJOVnJIeGJvajZZQkF6Q1RJdXFmSk1mRWUwVEU2NHJX?=
 =?utf-8?B?cFZCT3pJdGhEK0xVMVVmWUMwL2NOVnFFcGZnckg1WHkvZlZ6K3lNVGRENkpX?=
 =?utf-8?B?RG9ZK1NvZ1dsa1JnL3N2TG1mdEJrK3BoM0pXOFk5eG1Cc0d6ZUFjaE1KUWJt?=
 =?utf-8?B?Z21iU09YL1Exdm44Q3NZMWRjR2QrS3QvL3JJZ0hBUmxKUGFZRFIzN1N3dU93?=
 =?utf-8?B?T2xKeStRcVN1eThhRjJDUE5nMWFheDN0Z09ZaWhWWVhMS054VlkwQXlDQkJU?=
 =?utf-8?B?eVNubWpIYXIrSFhheEZBQXJCQTJHUnBpVHNBUzFXTklVQmJ4NHdGQnJKbVRx?=
 =?utf-8?B?Z1l5dkh6em9vbWdLUUo4QVVJbllXQldBcDNKN1VlRW5RaWgzNzBKL3JLM2xj?=
 =?utf-8?B?M3djZzgweU9QcFlKRy90YnhrUjdObTVtbzFSbFNMdGVUQ3FCL2c5NTFYRVNt?=
 =?utf-8?B?VjFFRENULzZQcGZjaHVTallBTG04enVuZkhjVi9pTTVmUy9IZFVJWUYwQ2FO?=
 =?utf-8?B?ajd2cUNXTytCcjNTZHY4U1owMDcvRU1kN29wdW0wdG1GMDhGUVBkS3VxUStB?=
 =?utf-8?B?OFBLOVA3akZQSXBOTXJjVVRuWWVsUmN2VW84dW40dnZ0NGsrNDNwQy9Gb2pi?=
 =?utf-8?B?aklGeGpXdDJnQVVtOVlsNzdyYW9rTGlYSWtGamozclRhY1JybnhTN05Uek5C?=
 =?utf-8?B?aTBsVm9qRGJuK0JSU0dZZE9adVBudmJGd2hKTFhWdXRaQ2l3TDZxZ2lPdmY2?=
 =?utf-8?B?dXRQb1hvcjFyL3d5Qi9FOU82Rms2Q2RkbHAxTnlUbGhIbURvSXBrODB5UEc1?=
 =?utf-8?B?blo1K0lvTVBUR01LZ1F2cllHZERNenlTaTU1NS9xN0hXVkFXTGNVUjhwcUVI?=
 =?utf-8?B?RnN5UCt0YktsUHkrRENxbHhQZHZnaXI3KzhOeEZ5aThjcS9FY2Z5WjFMc1V0?=
 =?utf-8?B?OEZxTW55dENQZytCWnJWMnl6UzIveHM2b0xaNTAxR0N2MmxZcEZmTG52K01h?=
 =?utf-8?B?emhEUlovVmR4dXN2Y1RDM0wzOGE3OFRId0dxSTIxSFcwUHl1KzE3a0dVWEJL?=
 =?utf-8?B?c0tvN2Q5YWxkYjNMUlJveU1udFoweENkK3lLTWN2THpLR21teFhxQ0t3M3VY?=
 =?utf-8?B?RjB5N0NXazh2YW9iNmZFeWRrSzRVeW5td01CY0xVMG5VMENWdjhLNTVlbWlW?=
 =?utf-8?B?ZlZxOFA3U0RGalNLRi9nWDBwZmE4UEhOUkRGVkE5dytBUHB5SDBwQkJJZlV6?=
 =?utf-8?B?VldQMlUrVTMzTnlJbzBpL0ZrRjkzWk9rbjZFMWtRN0tJUUVDQXd5TnBFYW1y?=
 =?utf-8?B?WGNMWXVpeGVFZ1pNQk8yT3owdXhpTlI4OXNvYmJkbmw0enhvQzRVRGJXalJH?=
 =?utf-8?B?WnJjSGhxT3V5WFZDVHNma0NBMTVlK1NzQnRFQ1RxVXNWeFJtMWllSHlseG1G?=
 =?utf-8?B?bXZGcUxrRmovOEdQN280d0JMUzZ3ai9kbXhoYllVL0w5dysvcWk3WGlXNHEx?=
 =?utf-8?B?a0pXSlJlTXlTWWk3UXZGaXorNVRwSTRoUkNVVzc1Rzg1M1B5eWxPQnBLNldT?=
 =?utf-8?B?NEQyZHRUK21XdUN6WFZTSnE4aEk2YVhCZ05PdXJoSzZ0NFRCZjRxNDNrS3hD?=
 =?utf-8?B?QTNVWlpDRlRvdlpWRlhvc1lxNjZsUzhzNEpMNHZmTytpQzJORnJacmFlZ0Qz?=
 =?utf-8?B?elZDRktydmZOS2FtdS9sWVdTRnpkUm50SHRUdTR6VUlORXBoaVhwMThkZUlB?=
 =?utf-8?B?cFhZOU1BMUhLd0ZIbG84TSt1VDhPQjg1WWllN0tremRUZVk2eitxdTlmZ05H?=
 =?utf-8?B?ZHFhamo0S0JGdmhjNzM5eFAwTXdZZEYwbkVBT21LM1RqSk1qVW45aFZXQW1a?=
 =?utf-8?B?UERYU0dnN1BSQ1NGaTFOdEpJemZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cdba01-4768-4651-c73e-08d9bc3c6cb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 00:23:15.8782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRZQZybKjan3j7W9Y+k+PmRQQgbHrUwpAHxJ7qUOITq5ulq3IbW+BU62nVkWoyjeUBDEOYJXG3XoZePGMGH1FwTvDOsNU9l8PmZoRRPvKVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3082
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2021 8:40 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Add support for telling the debugfs interface the size of the GuC log
> dump in advance. Without that, the underlying framework keeps calling
> the 'show' function with larger and larger buffer allocations until it
> fits. That means reading the log from graphics memory many times - 16
> times with the full 18MB log size.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 ++++++--
>   .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 54 +++++++++++++++++--
>   2 files changed, 67 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> index e307ceb99031..1adea367d99b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> @@ -10,11 +10,7 @@
>   
>   struct intel_gt;
>   
> -#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)				\
> -	static int __name ## _open(struct inode *inode, struct file *file) \
> -{									\
> -	return single_open(file, __name ## _show, inode->i_private);	\
> -}									\
> +#define __GT_DEBUGFS_ATTRIBUTE_FOPS(__name)				\
>   static const struct file_operations __name ## _fops = {			\
>   	.owner = THIS_MODULE,						\
>   	.open = __name ## _open,					\
> @@ -23,6 +19,21 @@ static const struct file_operations __name ## _fops = {			\
>   	.release = single_release,					\
>   }
>   
> +#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)			\
> +static int __name ## _open(struct inode *inode, struct file *file)	\
> +{									\
> +	return single_open(file, __name ## _show, inode->i_private);	\
> +}									\
> +__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
> +
> +#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(__name, __size_vf)	\
> +static int __name ## _open(struct inode *inode, struct file *file)	\
> +{									\
> +    return single_open_size(file, __name ## _show, inode->i_private,	\
> +			    __size_vf(inode->i_private));		\
> +}									\
> +__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
> +
>   void intel_gt_debugfs_register(struct intel_gt *gt);
>   
>   struct intel_gt_debugfs_file {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> index 46026c2c1722..da7dd099fd93 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> @@ -10,14 +10,62 @@
>   #include "intel_guc.h"
>   #include "intel_guc_log.h"
>   #include "intel_guc_log_debugfs.h"
> +#include "intel_uc.h"
> +
> +static u32 obj_to_guc_log_dump_size(struct drm_i915_gem_object *obj)
> +{
> +	u32 size;
> +
> +	if (!obj)
> +		return -ENODEV;
> +
> +	/* "0x%08x 0x%08x 0x%08x 0x%08x\n" => 16 bytes -> 44 chars => x2.75 */
> +	size = ((obj->base.size * 11) + 3) / 4;
> +
> +	/* Add padding for final blank line, any extra header info, etc. */
> +	size = PAGE_ALIGN(size + PAGE_SIZE);
> +
> +	return size;
> +}
> +
> +static u32 guc_log_dump_size(struct intel_guc_log *log)
> +{
> +	struct intel_guc *guc = log_to_guc(log);
> +
> +	if (!intel_guc_is_supported(guc))
> +		return -ENODEV;
> +
> +	if (!log->vma)
> +		return -ENODEV;

You're returning these error codes as a u32 and passing them as a size 
to single_open_size, so they're going to be read as a massive positive 
number. Same for the error code from obj_to_guc_log_dump_size. Either 
return a safe size on error (PAGE_SIZE?) or make the 
DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE smarter and don't even 
attempt to open the file if the function that calculates the size 
returns zero or an error.

> +
> +	return obj_to_guc_log_dump_size(log->vma->obj);
> +}
>   
>   static int guc_log_dump_show(struct seq_file *m, void *data)
>   {
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	int ret;
> +
> +	ret = intel_guc_log_dump(m->private, &p, false);
> +
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) && seq_has_overflowed(m))
> +		pr_warn_once("preallocated size:%zx for %s exceeded\n",
> +			     m->size, __func__);

Do we need this debug log in guc_load_err_log_dump_show as well? or 
maybe just move it at the end of intel_guc_log_dump?

Daniele

> +
> +	return ret;
> +}
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_log_dump, guc_log_dump_size);
> +
> +static u32 guc_load_err_dump_size(struct intel_guc_log *log)
> +{
> +	struct intel_guc *guc = log_to_guc(log);
> +	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
> +
> +	if (!intel_guc_is_supported(guc))
> +		return -ENODEV;
>   
> -	return intel_guc_log_dump(m->private, &p, false);
> +	return obj_to_guc_log_dump_size(uc->load_err_log);
>   }
> -DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
>   
>   static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
>   {
> @@ -25,7 +73,7 @@ static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
>   
>   	return intel_guc_log_dump(m->private, &p, true);
>   }
> -DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_load_err_log_dump, guc_load_err_dump_size);
>   
>   static int guc_log_level_get(void *data, u64 *val)
>   {

