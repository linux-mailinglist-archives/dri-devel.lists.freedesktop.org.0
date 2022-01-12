Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B048CE7B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 23:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE1D10E7AB;
	Wed, 12 Jan 2022 22:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477A10E55F;
 Wed, 12 Jan 2022 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642027358; x=1673563358;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3xh8sR9Kq2jwOEAySqkh0BLtiWdE/LUk7H722grpyis=;
 b=cWAfy+84BOTKG7+wa3+oHJoso3MTaKMGuARtRTdG+npucLLI4J8uQZ2f
 XJ8/HRHbOYqa0YL3pZPgbUbvof1T/PS27+rWcm39vWhEQ1O4H/BBG4j6w
 RjnS7HyuDRMuhRfotaLBSjR4Z/CY2nstMDVyC9iWMic9ZiKlJ8I5Tml+R
 MFVeE9+4Xl/mcKosvQiRRrx4nN70P+CaL5LZi5/l7pdAhr9Ef6Kt4BsRQ
 wiu/m76Ha5Eel2yJcFsQ4eHNoTjZ7JFccuKnOq+nRg4Ly07gIYR2p80lh
 yLgYYog194DyFN52B4952Jfdmg+EVXaSY/p42wwa3AeNXGVXsEqd0tVj+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="231211970"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="231211970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 14:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="670312018"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2022 14:42:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 14:42:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 12 Jan 2022 14:42:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 12 Jan 2022 14:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUioFRK+bpV/RJyH+7A8CdzxqCCQrWPhqsWZx4FgmErF5k/XupYFPuhHVANb8A6ZtTDd1FkIfLsQiThPIHgR4MEpqZsV2Jzvgy+HSk4QCvFSvHYjrIa54x5jtVeVj1BbzgmbvSvfnDWS1qlLY581b9RiBzVvs2dP8J3IUUaYJzr+WutOrRrmRzJS9SPm0+ICNJkXhdogtKQ4Emr+XdMd0bTXnexfyl+f+yjKMAEvU/PSUSqog7/94FhKzFfWPIBTZVmUGCgeH1P1X8RxhBA5gAuRSmr2IFyTcdmJv3Ep0/7lIFL3XndDD3yIZL6Uis1Cm9+kLDANZgWolLVzFQjwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfc+RkNqnwqjTgpBOZwaeTEGX83F+C6bLjXSJvnpCtg=;
 b=bQmV8bKvkeTPl7jKsl7Ur6hrlQctG3pOX+aZkVt1kr7brZgE2rp5ccJP1Z5yLoZwqh7hLWLgJqgsmO6dxJkwEOSOU6FafABHGP/ZD3qBaaXXf0Uxy8GWuAFe6TzuzoGEVdpEw0KcSH/Bt4Eo2aTq2HMDX2eJeYjgFXFKeDa9uN2md7Y5s9Y2pNNrXG1x8sErMZmsIbrGNsTSmfJ4y4puLdP4QJSYnTBBYY9YCBCAkbNAvc+gMh9kZjFLGkgcSxE9tDAmpUitKm/BJ9304S0SsjzobDAWROAUncxeFsApStn1o1crDOeRgegH5ha6Fn1LemX+5P0qdTGSNtThnY0c8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:39a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Wed, 12 Jan 2022 22:42:34 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9%5]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 22:42:34 +0000
Message-ID: <a487cfaa-5ac5-b8b9-e103-3e03d2c6368b@intel.com>
Date: Wed, 12 Jan 2022 14:42:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] drm/i915/gt: make a gt sysfs group and move power
 management files
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220112222031.82883-1-andi.shyti@linux.intel.com>
 <20220112222031.82883-3-andi.shyti@linux.intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20220112222031.82883-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85610283-26ee-4a5b-0f0c-08d9d61cd33a
X-MS-TrafficTypeDiagnostic: DM4PR11MB5568:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB55689259A892C8B9BF33B2CE8C529@DM4PR11MB5568.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OAJ+SLym8UnNNOB7CKE+JydDtM9a3C879oai5TtXyB1gjCb7LUO+3B1kBsNgmu9ZLoiajmsZstE3NbLszUnkmQjuovMcerA2EG9qZ7UIn13ptIN62RevVFrBksEWnHAyQhhfLt2UGefoCMhFhIEQb6c8Vn5qAbUTYgYEdtKhQUFtJqJbb1dczGbUn76nXMGvz4WPNUtpkNxaLkDef0X1USwkQ0rQdEGHq/JYziB7TlPfBQ3ZLkHQj58l2cIp+SGLXef0dUFZ0xDzSWbllF+hK4FnkfTefk6vKsN8/NBpjY2nGrNSNgdbCUiShnTLwWlKAdIFElzR9wkUtim5NIpjsoqTT/243Dssts4jNa1jZs8pb5Y3P1fb3ZZEvKPFnY0jRYlesfWgKJZ8lHQKfx20GSBJns9+a1rMyxe2HR6KNvISNx+JlgA2DzX/Qiqx5fKBhGyYtXiHO06Myh4vJxQhR15T9meZAF/0QMBjDOewDt0hoIVfNrZNLeLVsTkxET6e4Tb1rmJKPteEnO0dOYMiaWozbAZEHioMVNM3kANcqvoE3ZNIBqwoA16K20mX0t3b4IXtSft0be5ahaJhGdNCVpEQmiBkky4JJXP5KCohHvhE/fRLJeYZSvU/fRPml/XyiA0RE0fcXu7ULqJfog3purkF7ErrJO526JGefQGkXYqh6XzekgLfEyJjHVzROCNIpTRoxhJslaXckvxu5CZSr4nvZ6UqVhsMbdpubFXxBy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(110136005)(316002)(8936002)(54906003)(83380400001)(186003)(26005)(82960400001)(508600001)(8676002)(5660300002)(2906002)(2616005)(36756003)(86362001)(6666004)(66946007)(38100700002)(6512007)(30864003)(4326008)(31696002)(66556008)(66476007)(6486002)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTAyZ3JIVWI1enZ6TUs5U2VJdDZNK1VEQy81R2srNC9YS2xtQ3lVQW9PSWZo?=
 =?utf-8?B?b0lib0FNNk5VMmg1V2txVXkwVkZiQVlIeG5ZVzVWaHhPekV5WlBlRVBUTk54?=
 =?utf-8?B?TzIweW9qWnM0RGVhOFVhZTdsajJJOHZZdUoxcVc2Tjl6TXRRWS85RmVVQ1NM?=
 =?utf-8?B?RWNsWEFZa1MrMzhXUmxQbGxCTjNzL1JiMzJWOUx0RzZhN3psZ3ZzQVJjSExr?=
 =?utf-8?B?aHhMWVNzTklxTkt1N0pMMUFma1NJNjAxazMwcE5IbUJaVmlwUDZZaTd3NUZm?=
 =?utf-8?B?QnZlMFA5TVczNi8ramV2dThJUUcxM2pkZ2F3RGJVZjFIaXhQWk1wUmpUT256?=
 =?utf-8?B?ZFc1RHdhSnptc3FQNE5yNGNxdU8wS3hZWVowTExad2Fib1RFZjdyVlVEdGJZ?=
 =?utf-8?B?YkJhT0ovS2FwUmdWeW8xUFEwdkd5cmZmQjFJV21lV1d5R2l2TXdJMlpWQ1R2?=
 =?utf-8?B?NzlaV01aWlR1WHEvZmg3SXU4aDFkN0toc3gxcW40R1NuQSsva2t5KzkwUmZD?=
 =?utf-8?B?WnVvV1pibjUzZEtKUzJaVTFMQlZxUm1TbDBjV2xaM2tiZ1labkNmMHhLMWVO?=
 =?utf-8?B?TDYwWGxzY2xBd2RvZVJhT2N3dFR6V1ViVXcwWHk2QWNFanQvNk10bXJLbFlK?=
 =?utf-8?B?eDcxak5zVFp3b0Z6WkVGNXFTeUJzdjRhSnhiM2xqbEhuSHpPOEFQUUovbjNy?=
 =?utf-8?B?RUdNaGhZbWRIS2dUaWZvQkRjWWJONDFUYzV6ekVXV2M4Q0JxUllJQmpVMUts?=
 =?utf-8?B?N2FzMml3ZDQ1dU9QN2N6S29WMkpFOUE0Qm1GbkNsZHlBU3FhTWQ5bTNHcDk3?=
 =?utf-8?B?ZVhCSXBOVHc1SWExeFp0MU9VV3NicFd4d0krN1NQZXNhdUdYTzhPNE1Zc0Nv?=
 =?utf-8?B?Uk1mWnVuWjJ6c2puMUp5UTBlQXAvNHMzZm5JWG96THRaZjFtSlNBSlNDS3ZN?=
 =?utf-8?B?QVNOTzNNUk85L2RiNGRQZGN2M1RNb1I3UGUxejd1MS8zM2FrYU56d2dxWUJ5?=
 =?utf-8?B?MXFoYTVFQzJkWjZFNUc2QTR6LzZzdTQxVDliakV5S1RSRDFKOTRDb0pUY0Vt?=
 =?utf-8?B?SlBIU0dYMjYvbXBaS0dEc1pxOFVJNVgyZzBrb3lWTzVvclc5WjQ1amlYU0No?=
 =?utf-8?B?WWZzYi9qc04yaGsxZ2NlVmlTcWs1STc2UjNybHVWUEZqbFF1aWhJNnZWMWJW?=
 =?utf-8?B?ckQxaXF5WkdXN05ZeVNKY3Y1cFpxV1JsVWdXZDRSYWFmUTkzc2ZBS3EyU1JN?=
 =?utf-8?B?Z09sbFFkcW1uZGcxYi9zbFRmS2tVd3o3Rk55dFh2OEtFVTg4KzNvd2UwTWx5?=
 =?utf-8?B?V2tvMjZaVVEzYVY3cjJPaDhiNGhud1liMm9Nb0FmMC9tRjQ4K2w0RGcxN1dF?=
 =?utf-8?B?NlNrTHhTK1g3SFg5d3pGQks2UVFoOXllM2dGWW45RWtlNHVaQnJ3Slg3UUVo?=
 =?utf-8?B?K2M5YVBESjNFbFo0V015MVJNRGdPY09BTDNBa3c2bVErNTFDTzBJdk81Qjh0?=
 =?utf-8?B?N2daOXBhSzlWMzdFS3oxQS8xdktKTmxCa0lIUkdzZnIxczFqWFdwRU16a3Zn?=
 =?utf-8?B?YmlaNU42UHZ0Nk9wSHdmMUZuVjllalhIM0JnUkY3WnNaQlJXdXRScXVGSGhG?=
 =?utf-8?B?cWlzK3E0VjNCU1d6SGloNkhldHF5Ui9vdUpxc1A1bHNKVm00RVNNM0dSdFNW?=
 =?utf-8?B?VGJaTGl6Y01kSGpBQ2hMWFpWV29FVlJXbnR0bFIzdlB2Q1FPWDNSZHBlMits?=
 =?utf-8?B?SStUb0lBVE1GUFJLRDJ0cGdRMmwwSXJoSFc0QjFVU0NKMXVuNFRBbUd4RTlK?=
 =?utf-8?B?ME1xTEpUT1Z2L1Mreml0SUF5SEhldVA3K3d5VnZiV3U3NDlZWTZkTGtYRmRw?=
 =?utf-8?B?Z1VDVitjakMrVUVCMGNFejFBeXFWK2lTelplbnVFVVRWcG4zUE5ZU2tFOWgy?=
 =?utf-8?B?dHl5OUFyNFlvR3hYeCtlTy84R3FSYVFOL2JML0l2V0N1UWUzMmNRZm83RFhN?=
 =?utf-8?B?aUk4M1gxbnJWblZMcnltakc2eTNnMXd4dC9KMEI3U255S05aVXh0NGxSb3Za?=
 =?utf-8?B?M2xkTXVkRXI4alhzOTJWa0piNFF3c2xuNnJhWkx4cmxmWTVXS3lVUFFCWndz?=
 =?utf-8?B?c3pnWFhBdkJ1YzBKbEpOTFFWdE14bjVTL3FCRzdGM0srOHp5dlRuMXllVE1T?=
 =?utf-8?B?cWNWM2lENFhzZXViUGJCSCtGZng1dU11eitJMFgrSkZ4ZEpZSmVMckpUSkVH?=
 =?utf-8?B?QXpzZTFGSUpNTkJ2bng1N1YrdURnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85610283-26ee-4a5b-0f0c-08d9d61cd33a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 22:42:34.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkfZI3TV3ekq9lEw1HSnth/Yez0IWkYVkspoolDxCMZq8cPaSDz7rQ6pplulsOommlRVmTUj6Tf1O5uJ8120fK2M/13OCBuPqRSO9a/JznE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/12/2022 2:20 PM, Andi Shyti wrote:
> The GT has its own properties and in sysfs they should be grouped
> in the 'gt/' directory.
>
> Create a 'gt/' directory in sysfs which will contain gt0...gtN
> directories related to each tile configured in the GPU. Move the
> power management files inside those directories.
>
> The previous power management files are kept in their original
> root directory to avoid breaking the ABI. They point to the tile
> '0' and a warning message is printed whenever accessed to. The
> deprecated interface needs for the CONFIG_SYSFS_DEPRECATED_V2
> flag in order to be generated.
>
> The new sysfs structure will have a similar layout for the 4 tile
> case:
>
> /sys/.../card0
>           ├── gt
>           │   ├── gt0
>           │   │   ├── id
>           │   │   ├── rc6_enable
>           │   │   ├── rc6_residency_ms
>           │   │   ├── rps_act_freq_mhz
>           │   │   ├── rps_boost_freq_mhz
>           │   │   ├── rps_cur_freq_mhz
>           │   │   ├── rps_max_freq_mhz
>           │   │   ├── rps_min_freq_mhz
>           │   │   ├── rps_RP0_freq_mhz
>           │   │   ├── rps_RP1_freq_mhz
>           │   │   └── rps_RPn_freq_mhz
> 	 .   .
> 	 .   .
> 	 .   .
>           │   └── gt3
>           │       ├── id
>           │       ├── rc6_enable
>           │       ├── rc6_residency_ms
>           │       ├── rps_act_freq_mhz
>           │       ├── rps_boost_freq_mhz
>           │       ├── rps_cur_freq_mhz
>           │       ├── rps_max_freq_mhz
>           │       ├── rps_min_freq_mhz
>           │       ├── rps_RP0_freq_mhz
>           │       ├── rps_RP1_freq_mhz
>           │       └── rps_RPn_freq_mhz
>           ├── gt_act_freq_mhz   -+
>           ├── gt_boost_freq_mhz  |
>           ├── gt_cur_freq_mhz    |    Original interface
>           ├── gt_max_freq_mhz    +─-> kept as existing ABI;
>           ├── gt_min_freq_mhz    |    it points to gt0/
>           ├── gt_RP0_freq_mhz    |
>           └── gt_RP1_freq_mhz    |
>           └── gt_RPn_freq_mhz   -+
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile         |   4 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c    |   2 +
>   drivers/gpu/drm/i915/gt/sysfs_gt.c    | 126 +++++++++
>   drivers/gpu/drm/i915/gt/sysfs_gt.h    |  44 +++
>   drivers/gpu/drm/i915/gt/sysfs_gt_pm.c | 393 ++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/sysfs_gt_pm.h |  16 ++
>   drivers/gpu/drm/i915/i915_drv.h       |   2 +
>   drivers/gpu/drm/i915/i915_reg.h       |   1 +
>   drivers/gpu/drm/i915/i915_sysfs.c     | 315 +--------------------
>   drivers/gpu/drm/i915/i915_sysfs.h     |   3 +
>   10 files changed, 600 insertions(+), 306 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.c
>   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.h
>   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
>   create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index aa86ac33effc..5fd203c626fc 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -121,7 +121,9 @@ gt-y += \
>   	gt/intel_timeline.o \
>   	gt/intel_workarounds.o \
>   	gt/shmem_utils.o \
> -	gt/sysfs_engines.o
> +	gt/sysfs_engines.o \
> +	gt/sysfs_gt.o \
> +	gt/sysfs_gt_pm.o
>   # autogenerated null render state
>   gt-y += \
>   	gt/gen6_renderstate.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 17927da9e23e..2584c51c1c14 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -25,6 +25,7 @@
>   #include "intel_rps.h"
>   #include "intel_uncore.h"
>   #include "shmem_utils.h"
> +#include "sysfs_gt.h"
>   #include "pxp/intel_pxp.h"
>   
>   static void
> @@ -453,6 +454,7 @@ void intel_gt_driver_register(struct intel_gt *gt)
>   	intel_rps_driver_register(&gt->rps);
>   
>   	intel_gt_debugfs_register(gt);
> +	intel_gt_sysfs_register(gt);
>   }
>   
>   static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt.c b/drivers/gpu/drm/i915/gt/sysfs_gt.c
> new file mode 100644
> index 000000000000..46cf033a53ec
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/sysfs_gt.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#include <drm/drm_device.h>
> +#include <linux/device.h>
> +#include <linux/kobject.h>
> +#include <linux/printk.h>
> +#include <linux/sysfs.h>
> +
> +#include "i915_drv.h"
> +#include "i915_sysfs.h"
> +#include "intel_gt.h"
> +#include "intel_gt_types.h"
> +#include "intel_rc6.h"
> +
> +#include "sysfs_gt.h"
> +#include "sysfs_gt_pm.h"
> +
> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> +					    const char *name)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	/*
> +	 * We are interested at knowing from where the interface
> +	 * has been called, whether it's called from gt/ or from
> +	 * the parent directory.
> +	 * From the interface position it depends also the value of
> +	 * the private data.
> +	 * If the interface is called from gt/ then private data is
> +	 * of the "struct intel_gt *" type, otherwise it's * a
> +	 * "struct drm_i915_private *" type.
> +	 */
> +	if (!is_object_gt(kobj)) {
> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> +
> +		pr_devel_ratelimited(DEPRECATED
> +			"%s (pid %d) is trying to access deprecated %s "
> +			"sysfs control, please use gt/gt<n>/%s instead\n",
> +			current->comm, task_pid_nr(current), name, name);
> +		return to_gt(i915);
> +	}
> +
> +	return kobj_to_gt(kobj);
> +}
> +
> +static struct kobject *gt_get_parent_obj(struct intel_gt *gt)
> +{
> +	return &gt->i915->drm.primary->kdev->kobj;
> +}
> +
> +static ssize_t id_show(struct device *dev,
> +		       struct device_attribute *attr,
> +		       char *buf)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +
> +	return sysfs_emit(buf, "%u\n", gt->info.id);
> +}
> +
> +static DEVICE_ATTR_RO(id);
> +
> +static void kobj_gt_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type kobj_gt_type = {
> +	.release = kobj_gt_release,
> +	.sysfs_ops = &kobj_sysfs_ops
> +};
> +
> +struct kobject *
> +intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const char *name)
> +{
> +	struct kobj_gt *kg;
> +
> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> +	if (!kg)
> +		return NULL;
> +
> +	kobject_init(&kg->base, &kobj_gt_type);
> +	kg->gt = gt;
> +
> +	/* xfer ownership to sysfs tree */
> +	if (kobject_add(&kg->base, dir, "%s", name)) {
> +		kobject_put(&kg->base);
> +		return NULL;
> +	}
> +
> +	return &kg->base; /* borrowed ref */
> +}
> +
> +void intel_gt_sysfs_register(struct intel_gt *gt)
> +{
> +	struct kobject *dir;
> +	char name[80];
> +
> +	/*
> +	 * We need to make things right with the
> +	 * ABI compatibility. The files were originally
> +	 * generated under the parent directory.
> +	 *
> +	 * We generate the files only for gt 0
> +	 * to avoid duplicates.
> +	 */
> +	if (!gt->info.id)
> +		intel_gt_sysfs_pm_init(gt, gt_get_parent_obj(gt));
> +
> +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
> +
> +	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> +	if (!dir) {
> +		drm_err(&gt->i915->drm,
> +			"failed to initialize %s sysfs root\n", name);
> +		return;
> +	}
> +
> +	if (sysfs_create_file(dir, &dev_attr_id.attr))
> +		drm_err(&gt->i915->drm,
> +			"failed to create sysfs %s info files\n", name);
> +
> +	intel_gt_sysfs_pm_init(gt, dir);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt.h b/drivers/gpu/drm/i915/gt/sysfs_gt.h
> new file mode 100644
> index 000000000000..cd80a14bb14d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/sysfs_gt.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#ifndef __SYSFS_GT_H__
> +#define __SYSFS_GT_H__
> +
> +#include <linux/ctype.h>
> +#include <linux/kobject.h>
> +
> +#include "i915_gem.h" /* GEM_BUG_ON() */
> +
> +struct intel_gt;
> +
> +struct kobj_gt {
> +	struct kobject base;
> +	struct intel_gt *gt;
> +};
> +
> +static inline bool is_object_gt(struct kobject *kobj)
> +{
> +	bool b = !strncmp(kobj->name, "gt", 2);
> +
> +	GEM_BUG_ON(b && !isdigit(kobj->name[2]));
> +
> +	return b;
> +}
> +
> +struct kobject *
> +intel_gt_create_kobj(struct intel_gt *gt,
> +		     struct kobject *dir,
> +		     const char *name);
> +
> +static inline struct intel_gt *kobj_to_gt(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_gt, base)->gt;
> +}
> +
> +void intel_gt_sysfs_register(struct intel_gt *gt);
> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> +					    const char *name);
> +
> +#endif /* SYSFS_GT_H */
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt_pm.c b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
> new file mode 100644
> index 000000000000..6f4424be42d1
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#include <drm/drm_device.h>
> +#include <linux/sysfs.h>
> +#include <linux/printk.h>
> +
> +#include "i915_drv.h"
> +#include "intel_gt.h"
> +#include "intel_rc6.h"
> +#include "intel_rps.h"
> +#include "sysfs_gt.h"
> +#include "sysfs_gt_pm.h"
> +
> +#ifdef CONFIG_PM
> +static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
> +{
> +	intel_wakeref_t wakeref;
> +	u64 res = 0;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		res = intel_rc6_residency_us(&gt->rc6, reg);
> +
> +	return DIV_ROUND_CLOSEST_ULL(res, 1000);
> +}
> +
> +static ssize_t rc6_enable_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u8 mask = 0;
> +
> +	if (HAS_RC6(gt->i915))
> +		mask |= BIT(0);
> +	if (HAS_RC6p(gt->i915))
> +		mask |= BIT(1);
> +	if (HAS_RC6pp(gt->i915))
> +		mask |= BIT(2);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%x\n", mask);
> +}
> +
> +static ssize_t rc6_residency_ms_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u32 rc6_residency = get_residency(gt, GEN6_GT_GFX_RC6);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", rc6_residency);
> +}
> +
> +static ssize_t rc6p_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u32 rc6p_residency = get_residency(gt, GEN6_GT_GFX_RC6p);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", rc6p_residency);
> +}
> +
> +static ssize_t rc6pp_residency_ms_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u32 rc6pp_residency = get_residency(gt, GEN6_GT_GFX_RC6pp);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", rc6pp_residency);
> +}
> +
> +static ssize_t media_rc6_residency_ms_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	u32 rc6_residency = get_residency(gt, VLV_GT_MEDIA_RC6);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", rc6_residency);
> +}
> +
> +static DEVICE_ATTR_RO(rc6_enable);
> +static DEVICE_ATTR_RO(rc6_residency_ms);
> +static DEVICE_ATTR_RO(rc6p_residency_ms);
> +static DEVICE_ATTR_RO(rc6pp_residency_ms);
> +static DEVICE_ATTR_RO(media_rc6_residency_ms);
> +
> +static struct attribute *rc6_attrs[] = {
> +	&dev_attr_rc6_enable.attr,
> +	&dev_attr_rc6_residency_ms.attr,
> +	NULL
> +};
> +
> +static struct attribute *rc6p_attrs[] = {
> +	&dev_attr_rc6p_residency_ms.attr,
> +	&dev_attr_rc6pp_residency_ms.attr,
> +	NULL
> +};
> +
> +static struct attribute *media_rc6_attrs[] = {
> +	&dev_attr_media_rc6_residency_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group rc6_attr_group[] = {
> +	{ .name = power_group_name, .attrs = rc6_attrs },
> +	{ .attrs = rc6_attrs }
> +};
> +
> +static const struct attribute_group rc6p_attr_group[] = {
> +	{ .name = power_group_name, .attrs = rc6p_attrs },
> +	{ .attrs = rc6p_attrs }
> +};
> +
> +static const struct attribute_group media_rc6_attr_group[] = {
> +	{ .name = power_group_name, .attrs = media_rc6_attrs },
> +	{ .attrs = media_rc6_attrs }
> +};
> +
> +static int __intel_gt_sysfs_create_group(struct kobject *kobj,
> +					 const struct attribute_group *grp)
> +{
> +	int i = is_object_gt(kobj);
> +
> +	return i ? sysfs_create_group(kobj, &grp[i]) :
> +		   sysfs_merge_group(kobj, &grp[i]);
> +}
> +
> +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +	int ret;
> +
> +	if (!HAS_RC6(gt->i915))
> +		return;
> +
> +	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> +	if (ret)
> +		drm_err(&gt->i915->drm,
> +			"failed to create gt%u RC6 sysfs files\n", gt->info.id);
> +
> +	if (HAS_RC6p(gt->i915)) {
> +		ret = __intel_gt_sysfs_create_group(kobj, rc6p_attr_group);
> +		if (ret)
> +			drm_err(&gt->i915->drm,
> +				"failed to create gt%u RC6p sysfs files\n",
> +				gt->info.id);
> +	}
> +
> +	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
> +		ret = __intel_gt_sysfs_create_group(kobj, media_rc6_attr_group);
> +		if (ret)
> +			drm_err(&gt->i915->drm,
> +				"failed to create media %u RC6 sysfs files\n",
> +				gt->info.id);
> +	}
> +}
> +#else
> +static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +}
> +#endif /* CONFIG_PM */
> +
> +static ssize_t act_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n",
> +			intel_rps_read_actual_frequency(&gt->rps));
> +}
> +
> +static ssize_t cur_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n",
> +			 intel_rps_get_requested_frequency(rps));
> +}
> +
> +static ssize_t boost_freq_mhz_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n",
> +			 intel_rps_get_boost_frequency(rps));
> +}
> +
> +static ssize_t boost_freq_mhz_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool boost = false;
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Validate against (static) hardware limits */
> +	val = intel_freq_opcode(rps, val);
> +	if (val < rps->min_freq || val > rps->max_freq)
> +		return -EINVAL;
> +
> +	mutex_lock(&rps->lock);
> +	if (val != rps->boost_freq) {
> +		rps->boost_freq = val;
> +		boost = atomic_read(&rps->num_waiters);
> +	}
> +	mutex_unlock(&rps->lock);
> +	if (boost)
> +		schedule_work(&rps->work);
> +
> +	return count;
> +}
> +
> +static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
> +				     struct device_attribute *attr, char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n",
> +			intel_gpu_freq(rps, rps->efficient_freq));
> +}
> +
> +static ssize_t max_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return sysfs_emit(buff, "%d\n", intel_rps_get_max_frequency(rps));
> +}
> +
> +static ssize_t max_freq_mhz_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = intel_rps_set_max_frequency(rps, val);
> +
> +	return ret ?: count;
> +}
> +
> +static ssize_t min_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +
> +	return sysfs_emit(buff, "%d\n", intel_rps_get_min_frequency(rps));
> +}
> +
> +static ssize_t min_freq_mhz_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = intel_rps_set_min_frequency(rps, val);
> +
> +	return ret ?: count;
> +}
> +
> +#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> +	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> +	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
> +
> +#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
> +#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
> +		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
> +
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> +static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
> +
> +static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> +
> +static ssize_t rps_rp_mhz_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff);
> +
> +static INTEL_GT_RPS_SYSFS_ATTR(RP0_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +static INTEL_GT_RPS_SYSFS_ATTR(RP1_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +static INTEL_GT_RPS_SYSFS_ATTR(RPn_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> +
> +#define GEN6_ATTR(s) { \
> +		&dev_attr_##s##_act_freq_mhz.attr, \
> +		&dev_attr_##s##_cur_freq_mhz.attr, \
> +		&dev_attr_##s##_boost_freq_mhz.attr, \
> +		&dev_attr_##s##_max_freq_mhz.attr, \
> +		&dev_attr_##s##_min_freq_mhz.attr, \
> +		&dev_attr_##s##_RP0_freq_mhz.attr, \
> +		&dev_attr_##s##_RP1_freq_mhz.attr, \
> +		&dev_attr_##s##_RPn_freq_mhz.attr, \
> +		NULL, \
> +	}
> +
> +#define GEN6_RPS_ATTR GEN6_ATTR(rps)
> +#define GEN6_GT_ATTR  GEN6_ATTR(gt)
> +
> +/* For now we have a static number of RP states */
> +static ssize_t rps_rp_mhz_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	u32 val;
> +
> +	if (attr == &dev_attr_gt_RP0_freq_mhz ||
> +	    attr == &dev_attr_rps_RP0_freq_mhz) {
> +		val = intel_rps_get_rp0_frequency(rps);
> +	} else if (attr == &dev_attr_gt_RP1_freq_mhz ||
> +		   attr == &dev_attr_rps_RP1_freq_mhz) {
> +		   val = intel_rps_get_rp1_frequency(rps);
> +	} else if (attr == &dev_attr_gt_RPn_freq_mhz ||
> +		   attr == &dev_attr_rps_RPn_freq_mhz) {
> +		   val = intel_rps_get_rpn_frequency(rps);
> +	} else {
> +		GEM_WARN_ON(1);
> +		return -ENODEV;
> +	}
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n", val);
> +}
> +
> +static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
> +static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
> +
> +static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
> +				const struct attribute * const *attrs)
> +{
> +	int ret;
> +
> +	if (GRAPHICS_VER(gt->i915) < 6)
> +		return 0;
> +
> +	ret = sysfs_create_files(kobj, attrs);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
> +		ret = sysfs_create_file(kobj, &dev_attr_vlv_rpe_freq_mhz.attr);
> +
> +	return ret;
> +}
> +
> +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> +{
> +	int ret;
> +
> +	intel_sysfs_rc6_init(gt, kobj);
> +
> +	ret = is_object_gt(kobj) ?
> +	      intel_sysfs_rps_init(gt, kobj, gen6_rps_attrs) :
> +	      intel_sysfs_rps_init(gt, kobj, gen6_gt_attrs);
> +	if (ret)
> +		drm_err(&gt->i915->drm,
> +			"failed to create gt%u RPS sysfs files", gt->info.id);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_gt_pm.h b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.h
> new file mode 100644
> index 000000000000..18c60d929e6d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/sysfs_gt_pm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#ifndef __SYSFS_GT_PM_H__
> +#define __SYSFS_GT_PM_H__
> +
> +#include <linux/kobject.h>
> +
> +#include "intel_gt_types.h"
> +
> +void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj);
> +void intel_gt_sysfs_pm_remove(struct intel_gt *gt, struct kobject *kobj);
> +
> +#endif /* SYSFS_RC6_H */
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 14dbbc5ba9e4..595e2f41ba43 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -997,6 +997,8 @@ struct drm_i915_private {
>   #define I915_MAX_GT 4
>   	struct intel_gt *gt[I915_MAX_GT];
>   
> +	struct kobject *sysfs_gt;
> +
>   	struct {
>   		struct i915_gem_contexts {
>   			spinlock_t lock; /* locks list */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 7c4013a0db61..12b2018e2407 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8480,6 +8480,7 @@ enum {
>   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
>   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT	23
>   #define   GEN9_IGNORE_SLICE_RATIO		(0 << 0)
> +#define   GEN12_SW_REQ_UNSLICE_RATIO_SHIFT	23
>   
>   #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>   #define GEN6_RC_CONTROL				_MMIO(0xA090)
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index fae4d1f4f275..d6687e33f29d 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -38,113 +38,12 @@
>   #include "i915_sysfs.h"
>   #include "intel_pm.h"
>   
> -static inline struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
> +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
>   {
>   	struct drm_minor *minor = dev_get_drvdata(kdev);
>   	return to_i915(minor->dev);
>   }
>   
> -#ifdef CONFIG_PM
> -static u32 calc_residency(struct drm_i915_private *dev_priv,
> -			  i915_reg_t reg)
> -{
> -	intel_wakeref_t wakeref;
> -	u64 res = 0;
> -
> -	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
> -		res = intel_rc6_residency_us(&to_gt(dev_priv)->rc6, reg);
> -
> -	return DIV_ROUND_CLOSEST_ULL(res, 1000);
> -}
> -
> -static ssize_t rc6_enable_show(struct device *kdev,
> -			       struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	unsigned int mask;
> -
> -	mask = 0;
> -	if (HAS_RC6(dev_priv))
> -		mask |= BIT(0);
> -	if (HAS_RC6p(dev_priv))
> -		mask |= BIT(1);
> -	if (HAS_RC6pp(dev_priv))
> -		mask |= BIT(2);
> -
> -	return sysfs_emit(buf, "%x\n", mask);
> -}
> -
> -static ssize_t rc6_residency_ms_show(struct device *kdev,
> -				     struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
> -	return sysfs_emit(buf, "%u\n", rc6_residency);
> -}
> -
> -static ssize_t rc6p_residency_ms_show(struct device *kdev,
> -				      struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
> -	return sysfs_emit(buf, "%u\n", rc6p_residency);
> -}
> -
> -static ssize_t rc6pp_residency_ms_show(struct device *kdev,
> -				       struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
> -	return sysfs_emit(buf, "%u\n", rc6pp_residency);
> -}
> -
> -static ssize_t media_rc6_residency_ms_show(struct device *kdev,
> -					   struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
> -	return sysfs_emit(buf, "%u\n", rc6_residency);
> -}
> -
> -static DEVICE_ATTR_RO(rc6_enable);
> -static DEVICE_ATTR_RO(rc6_residency_ms);
> -static DEVICE_ATTR_RO(rc6p_residency_ms);
> -static DEVICE_ATTR_RO(rc6pp_residency_ms);
> -static DEVICE_ATTR_RO(media_rc6_residency_ms);
> -
> -static struct attribute *rc6_attrs[] = {
> -	&dev_attr_rc6_enable.attr,
> -	&dev_attr_rc6_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group rc6_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  rc6_attrs
> -};
> -
> -static struct attribute *rc6p_attrs[] = {
> -	&dev_attr_rc6p_residency_ms.attr,
> -	&dev_attr_rc6pp_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group rc6p_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  rc6p_attrs
> -};
> -
> -static struct attribute *media_rc6_attrs[] = {
> -	&dev_attr_media_rc6_residency_ms.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group media_rc6_attr_group = {
> -	.name = power_group_name,
> -	.attrs =  media_rc6_attrs
> -};
> -#endif
> -
>   static int l3_access_valid(struct drm_i915_private *i915, loff_t offset)
>   {
>   	if (!HAS_L3_DPF(i915))
> @@ -256,171 +155,6 @@ static const struct bin_attribute dpf_attrs_1 = {
>   	.private = (void *)1
>   };
>   
> -static ssize_t gt_act_freq_mhz_show(struct device *kdev,
> -				    struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
> -}
> -
> -static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
> -				    struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
> -}
> -
> -static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
> -}
> -
> -static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
> -				       struct device_attribute *attr,
> -				       const char *buf, size_t count)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_boost_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
> -				     struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
> -}
> -
> -static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_rps *rps = &gt->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
> -}
> -
> -static ssize_t gt_max_freq_mhz_store(struct device *kdev,
> -				     struct device_attribute *attr,
> -				     const char *buf, size_t count)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_rps *rps = &gt->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_max_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_gt *gt = to_gt(i915);
> -	struct intel_rps *rps = &gt->rps;
> -
> -	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
> -}
> -
> -static ssize_t gt_min_freq_mhz_store(struct device *kdev,
> -				     struct device_attribute *attr,
> -				     const char *buf, size_t count)
> -{
> -	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(i915)->rps;
> -	ssize_t ret;
> -	u32 val;
> -
> -	ret = kstrtou32(buf, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_rps_set_min_frequency(rps, val);
> -
> -	return ret ?: count;
> -}
> -
> -static DEVICE_ATTR_RO(gt_act_freq_mhz);
> -static DEVICE_ATTR_RO(gt_cur_freq_mhz);
> -static DEVICE_ATTR_RW(gt_boost_freq_mhz);
> -static DEVICE_ATTR_RW(gt_max_freq_mhz);
> -static DEVICE_ATTR_RW(gt_min_freq_mhz);
> -
> -static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
> -
> -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf);
> -static DEVICE_ATTR(gt_RP0_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -static DEVICE_ATTR(gt_RP1_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
> -
> -/* For now we have a static number of RP states */
> -static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> -{
> -	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &to_gt(dev_priv)->rps;
> -	u32 val;
> -
> -	if (attr == &dev_attr_gt_RP0_freq_mhz)
> -		val = intel_rps_get_rp0_frequency(rps);
> -	else if (attr == &dev_attr_gt_RP1_freq_mhz)
> -		val = intel_rps_get_rp1_frequency(rps);
> -	else if (attr == &dev_attr_gt_RPn_freq_mhz)
> -		val = intel_rps_get_rpn_frequency(rps);
> -	else
> -		BUG();
> -
> -	return sysfs_emit(buf, "%d\n", val);
> -}
> -
> -static const struct attribute * const gen6_attrs[] = {
> -	&dev_attr_gt_act_freq_mhz.attr,
> -	&dev_attr_gt_cur_freq_mhz.attr,
> -	&dev_attr_gt_boost_freq_mhz.attr,
> -	&dev_attr_gt_max_freq_mhz.attr,
> -	&dev_attr_gt_min_freq_mhz.attr,
> -	&dev_attr_gt_RP0_freq_mhz.attr,
> -	&dev_attr_gt_RP1_freq_mhz.attr,
> -	&dev_attr_gt_RPn_freq_mhz.attr,
> -	NULL,
> -};
> -
> -static const struct attribute * const vlv_attrs[] = {
> -	&dev_attr_gt_act_freq_mhz.attr,
> -	&dev_attr_gt_cur_freq_mhz.attr,
> -	&dev_attr_gt_boost_freq_mhz.attr,
> -	&dev_attr_gt_max_freq_mhz.attr,
> -	&dev_attr_gt_min_freq_mhz.attr,
> -	&dev_attr_gt_RP0_freq_mhz.attr,
> -	&dev_attr_gt_RP1_freq_mhz.attr,
> -	&dev_attr_gt_RPn_freq_mhz.attr,
> -	&dev_attr_vlv_rpe_freq_mhz.attr,
> -	NULL,
> -};
> -
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>   
>   static ssize_t error_state_read(struct file *filp, struct kobject *kobj,
> @@ -486,34 +220,16 @@ static void i915_setup_error_capture(struct device *kdev) {}
>   static void i915_teardown_error_capture(struct device *kdev) {}
>   #endif
>   
> +static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
> +{
> +	return kobject_create_and_add("gt", parent);
> +}
> +
>   void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   {
>   	struct device *kdev = dev_priv->drm.primary->kdev;
>   	int ret;
>   
> -#ifdef CONFIG_PM
> -	if (HAS_RC6(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&rc6_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"RC6 residency sysfs setup failed\n");
> -	}
> -	if (HAS_RC6p(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&rc6p_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"RC6p residency sysfs setup failed\n");
> -	}
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
> -		ret = sysfs_merge_group(&kdev->kobj,
> -					&media_rc6_attr_group);
> -		if (ret)
> -			drm_err(&dev_priv->drm,
> -				"Media RC6 residency sysfs setup failed\n");
> -	}
> -#endif
>   	if (HAS_L3_DPF(dev_priv)) {
>   		ret = device_create_bin_file(kdev, &dpf_attrs);
>   		if (ret)
> @@ -529,13 +245,10 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   		}
>   	}
>   
> -	ret = 0;
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> -		ret = sysfs_create_files(&kdev->kobj, vlv_attrs);
> -	else if (GRAPHICS_VER(dev_priv) >= 6)
> -		ret = sysfs_create_files(&kdev->kobj, gen6_attrs);
> -	if (ret)
> -		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
> +	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
> +	if (!dev_priv->sysfs_gt)
> +		drm_err(&dev_priv->drm,
> +			"failed to register GT sysfs directory\n");
>   
>   	i915_setup_error_capture(kdev);
>   
> @@ -548,14 +261,6 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
>   
>   	i915_teardown_error_capture(kdev);
>   
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
> -		sysfs_remove_files(&kdev->kobj, vlv_attrs);
> -	else
> -		sysfs_remove_files(&kdev->kobj, gen6_attrs);
>   	device_remove_bin_file(kdev,  &dpf_attrs_1);
>   	device_remove_bin_file(kdev,  &dpf_attrs);
> -#ifdef CONFIG_PM
> -	sysfs_unmerge_group(&kdev->kobj, &rc6_attr_group);
> -	sysfs_unmerge_group(&kdev->kobj, &rc6p_attr_group);
> -#endif
>   }
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.h b/drivers/gpu/drm/i915/i915_sysfs.h
> index 41afd4366416..243a17741e3f 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.h
> +++ b/drivers/gpu/drm/i915/i915_sysfs.h
> @@ -6,8 +6,11 @@
>   #ifndef __I915_SYSFS_H__
>   #define __I915_SYSFS_H__
>   
> +struct device;
>   struct drm_i915_private;
>   
> +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev);
> +
>   void i915_setup_sysfs(struct drm_i915_private *i915);
>   void i915_teardown_sysfs(struct drm_i915_private *i915);

Looks good. Will be great to finally have this sysfs framework.

I'm not sure if the CI.CHECKPATCH warnings matter, but otherwise,

Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

>   
