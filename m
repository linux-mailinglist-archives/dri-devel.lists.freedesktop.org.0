Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C77B01C6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BBD10E05B;
	Wed, 27 Sep 2023 10:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616AE10E05B;
 Wed, 27 Sep 2023 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695810386; x=1727346386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YALdzZOffzf9fXjRDYnYmYgfvRwasVVfzGifjZoQw0w=;
 b=HVHOwSBH+byjaFAAWjj/2/ZoaeVhoy66FVa2Z8l7/l250S1Rb/lTOEbl
 pWJhXpaSl11aoX4sliZ8gn417SA8veiU8oc4isQ9zM0zSH2LQ6NA1Yvtx
 QlunFFBXR35KRbRrNcdbARr0eewpKcTGgxC7JlvJeQj1sb/oIFszEDwtn
 Y6YMA23GE3ZFFjtzSkuVXGuC6Ymb5q/NN9Dchw8j1xQJEICYrqSDKs8/m
 9X1jtFEHpKe7X4n48BHc/Q6Fs2yQO/qBCffJLXxR+nNNguzJU9pQu3EOs
 XqYYHHrqYtwQEN8u5RhA15jats6Awy3+hqJOFmdtFIOf3mzFN3Frf4xuz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385646588"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385646588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="468987"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 03:26:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:26:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:26:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/oFRgKxiL8m6g1n0qvWhXI8LZYB36W9x+C/LwsiBHZwJeXhx+yRFSXI8WlFvl0K9GE5kXS4c12iLVc6OXVXUK3eg8v3rFSzgF7n4dbyeI2TL1qVX1lfGy+cT+acANgGcjFBLOX3VO1xfzp9iasNlPGOxKfLi5E4ktCtMa33U9tgoIDo9+2uWkFd9ObbwMKjnh95zjV3JHhNm030gt3hGf7fHQfQ63DNyjHGt2RnBwS47baUN51P9IYgnl7z5+j6VsJf0qFO2BtpdCTx0SkxsSpT9cuc5fazdZuzjBDPaXNOPUGcS+x+AfkSA9Fnci14bxgDeogRyrpOHkc1nvNz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CzpNKcU/UEHQ1X32pWwpSmwLZKwiuB91Y58e+zpqtI=;
 b=kogl8wWf3dRtmge63SI66ayldhUmsAMCjwsm9G935jQ4FfFduakaUyC91J4ZVLmj5NV3vTGrI8S+bOTzKdVr09hXhexJNSCBYiGC5RpzgjDga5KK9MHAP6GoXoylvyiPOrE0JH1I9uQiEo6/w4C2KqmtHRkM2c0PdCoASA5YcBq7SB1JFiEX4DcH8O/eZ9ifQp7JjQ5lthSfptH5Yhbb61QJ6Lqcf2Pj+cG/xZrvv7PzVkxqZmCU8w+1rfaPbWeKa+FP8L6lnpEn6HYdJw7Z6bBZwrdgY7HoHaDXMYiAZvsHxHce2rn8FsHgn8jPTGmrJcMdB44CDLQpZ5E0y8R2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:26:22 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 10:26:22 +0000
Message-ID: <44d50ec7-c56f-49fe-0bc8-a244d1fa9575@intel.com>
Date: Wed, 27 Sep 2023 12:26:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm/i915/mtl: Skip MCR ops for ring fault register
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230926215802.10822-1-nirmoy.das@intel.com>
 <ZRPT5Vpn1uABZ7vc@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZRPT5Vpn1uABZ7vc@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SJ2PR11MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e1a097-0a73-4bea-27df-08dbbf44319f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocV7e5R7zm5MDC/Gm8gcV0t1Jm7L+egs7MueAydXod+hhKs9XDxwsCmLfGSP4jboyPaJks8dHOeSygaB0EPmSKEy6p29JnQ07wYwIcnIqkAZo6kQUpijj4gq4gMwc3sRmhrf6aD3HHcW05o1OzfsKrMnIS2oyQO5SNxYkf++tb3WM0BZkDYnp546Qzb4zZtGIX/xFicSZR3km6FSmqhHVDTt3tjjUQpgeeu+oH2fcIcLIf+2vt++Pqv77jSAJB66bSNykTzwklK/iln3x+1JhaSS27ihNRBkYXjI7V1HlJQzOwEVUHnWAKL2mwGnq1KcFZx0iSb1feJOlmdNfrbo0JAaY/uCHdvjVKyaoblcL3DREUTyEvFKv0BXtvOUJj2pesFHOPx/TmA/nLW+79eGBpZli1TT3GMBWPhf4pRIZZrg9RqjyhfRnvC8DcEnX5P5WTc+Xqo6jBWF+xBM/CfdfjCsZHX3Pxu+9H4x0ScKMPCxPFSQPtlgpDvZzr0nyexlo3Yk1EMlL8T1S8oFyYunv3gXjJYJBnLR5KvqyOpnkIbFLsjAXNaqSlppMJyLs5d/5HcyBPwJ0DlFvNfEeYCC4lOb3JrYZ/z+IjWWxflhr0Vbhbcwl392RxtdADo1a5M7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(31686004)(316002)(4744005)(66476007)(66556008)(66946007)(6916009)(8676002)(6512007)(4326008)(8936002)(2906002)(41300700001)(44832011)(478600001)(26005)(6666004)(6486002)(6506007)(38100700002)(5660300002)(53546011)(2616005)(36756003)(966005)(86362001)(31696002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aloyNW5YTFBSYVFSZjAxZTdCNUh2UUhrVkdMWnNCTTFCOEpVUUMxUS9Fd1N1?=
 =?utf-8?B?VS9WQ0V6NnVMU3NXZThLcm1iZVp2TWJRQUt3TENHUDNPQm5SdkhaYnA0RmE2?=
 =?utf-8?B?UmhPOUEwM2k1eUtqT282Y0JRdUdlSnNRbmt2Z1dUMHpxQitHR0ZzMDQreVFu?=
 =?utf-8?B?dnVPenNKMkIzMjZzNTVDL3Z6aldrQW0xM0NtWWg2enFmazJzUEl3UHNIS1JQ?=
 =?utf-8?B?MWFpZHBGa0tIYjMxMWpsWVBlb21lZzVhMDlmSFdFaFd3ZzB2a3c3WEJFL0tk?=
 =?utf-8?B?YkVVa0FMODlFYWVWcFh5M0FEZmhrTDFVbEJqRENiWU11OVVySW1DaUdubVNU?=
 =?utf-8?B?dnh3b21hUmJ3OGJNZ2lkcU85MkFUV2xheFd0NXY2L0w4R2pQeDZFSUVDdTdV?=
 =?utf-8?B?d3dBcDQwV0xoL3ZheWE0R2FZOU16RDhLZlRQY2tmOHRhUnRMOUk4M2xqMXR3?=
 =?utf-8?B?QmlESWZyczFzMEpzcGorTjlCMXI0NHZTSk1tTGQwM1N6TzVKcE5LT2UzS2U1?=
 =?utf-8?B?clpLUjNZK2Jlb1M2WmFJQjl4YWJvSDJyamJvbXFkcFdXMlBSSmNCRjhVQ25h?=
 =?utf-8?B?Yi9UZjdrL1VheWtwTVhPTklsc0Q3R2RybE54THQzOFlkTytkTFBtWWdNSnU3?=
 =?utf-8?B?Mm8zREh6L2xvRXN3R205d1dFVGxlYVNsMTcvd213YzQxcS9sY2lQQWlwRTY2?=
 =?utf-8?B?a0V6QlJPbVltYlg3cGxtTU1qK2FyaDhMTXpvNTJzMXVvT0E2NXRLRUkwc3hQ?=
 =?utf-8?B?VEtmVlhoVlRTdGp3NFZPZkhYRzNlWUllZ2x2MUltd1pRQWdiNFk1NTJrZS9j?=
 =?utf-8?B?dk03TDRIUVJ4Vm5uM2FMU2owOGk3QjVjNnEvaU8yZ2J1QWN5RjViOHdPRmhn?=
 =?utf-8?B?WFZtd3RjM3QrNGNXWUJvOEFrdEltajQ4RmU4and2YTJ4eHQxZDRzQ3NzdFNz?=
 =?utf-8?B?VElrc0Ura25zaGlycThmb1VEZWxYaWlNS1pLUFRzVHl6cWZ2UCtINk9hWE9P?=
 =?utf-8?B?VisvUGcxckpjUDliVlBWWkxURmloa1dqQnU1N2VXRHR1Yk8zS2t6R001Y011?=
 =?utf-8?B?cThwRGhBUjhJcUV5bGIxU2U5NEMzd2FpRkJqSnNFazhPbktoNUc4K1RaMGI2?=
 =?utf-8?B?LzM2VGFhTk1LT2lvYlV1bDkxak52di9VbTBYNmlJUlUrMTREQ0c4YTVzQU5m?=
 =?utf-8?B?aW13bWs4UU0zOE1DODlTMjNoM2ZlL3YzdHpiRjN4cnJWSHliZ3B3OXllNUdk?=
 =?utf-8?B?VTJ6OTFQNEMwekYyZzBOeDAwSnpjOEdGSDl3TFZMRURyQVNqMGF4S0hFTjlR?=
 =?utf-8?B?VDhpWUJPcGREc2JoUGlhRklYVkY1ZEZjTnZ1ZmNRcDlvN1FzRXArcVM5WWRm?=
 =?utf-8?B?eG5vQmVZMEJwODJGcHA4c3VtTzE2LzAyRm8venhMazI2dXArOEhBY0xhUVk2?=
 =?utf-8?B?aE9NOUNUd3NBejlLMDBwVXIrMVpqUzdTQnpPSDZFVVZGcm5SaW9PUUQxL20r?=
 =?utf-8?B?UnE1Yjh1dmRja1JtTDRxbmlZQytJb2grUjRFYVErSDFiSVBKTTNhUGV3akpm?=
 =?utf-8?B?dVJwTlhDaFVMQmFDT09wMkNqV1VOZDhycU5NYVRZRzdxMjl5K3lMNHN5b0Np?=
 =?utf-8?B?YTl3dW85cWw0R2RhK21CRDhoZW5rMHdJdmMvVko5akR0VTVzZ3U2VGljSjFz?=
 =?utf-8?B?T2EwRE8wVUtBYlptT2xTelNVbFMxa1p4SDN6bWhXYTBWRnpCYzZEQVVkL25t?=
 =?utf-8?B?UFpzQVhoM1U1ZVpmMXJrdDNiMXdhTGZ0L0hKWXh5YUVNUm83bWdLMUJRZ1gy?=
 =?utf-8?B?cUlmR3ROcHRWcnBhdnF5emNBRVlDM0FVUTE0RmhKemQ3ejdkOXg0NVJkM2Qv?=
 =?utf-8?B?WGkxRlJZV3NJdlB5UzBNZWxBby8zT0dBMGdnWHZseGlVckZscFVJNk9iOFRZ?=
 =?utf-8?B?QWE2VzkxUE5sa3VQL0ttV1JQNzhZcEpCZndqRnJlbHhpUHhPL0xyVEVxM3pk?=
 =?utf-8?B?ZWZvZlFsQkE0ZXdtSGVyTkw2OTF1d0s2dnpNL256NFRoakYzcks3ZERUb0Z4?=
 =?utf-8?B?Rm9jS2c2M21iMWtCd2h2bm9Ta2oxVVk2aElFYXpQNzE3d1VEVmlxUU1jb1ZY?=
 =?utf-8?Q?hW97ReUbd1h9NCamiYxxkd8Mg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e1a097-0a73-4bea-27df-08dbbf44319f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:26:22.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRZp8xBilIBrMGNr7svAP7qLHC65PrUxAzEbaYw1vq+cP/53ImH0Rz6wA7iQ/jCJPl0SFokpYDtzlCdx5/nzTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/27/2023 9:04 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Tue, Sep 26, 2023 at 11:58:02PM +0200, Nirmoy Das wrote:
>> On MTL GEN12_RING_FAULT_REG is not replicated so don't
>> do mcr based operation for this register.
>>
>> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> This looks very good!


My tired brain took it as end of mail.

>
>> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>> +	/*
>> +	 * for media tile this ring fault register is not replicated
>> +	 * so skip doing mcr ops on it.
> Can we spare a few more words on "doing mcr ops on it"?
Sent out 
https://patchwork.freedesktop.org/patch/559759/?series=124325&rev=1

to improve this.


Thanks,

Nirmoy

>
> Andi
