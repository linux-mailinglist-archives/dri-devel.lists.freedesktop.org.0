Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046537B15E9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760AF10E5E7;
	Thu, 28 Sep 2023 08:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586D10E5E5;
 Thu, 28 Sep 2023 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695889176; x=1727425176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FAb/XPQLHANjPcWKMqbXy/1cwQ49YPLtLLyhjBCt+H4=;
 b=mVA8D8wJCJeIfp4G0tU0MfHiIO9YulPyTb5bKrzgVsz0Hlzde64l9GHN
 ed9JYLhDjJ0+hriODz3T3v5p9vgium5kyi2ZUcYUG151+F6ZfGMds9j20
 Zn4XaXMmHFnWh7TYLDJ1Yc2g8VA/QJdHCskCxGPAZzFrSMtIMfzHiN77u
 Fie/fQxpyQXZn/bBa8e+to+CqZbcEKroLalN6KQUJGa1TagxRUwEuvXpO
 rYGARaC/SVf0RybnzRpU9nnJup6e5LU/iakomSwMFwSoREoGAJWxHv0Wo
 mKtpB5cdAZspDLdvUhB8qCOP+Qh2ZuupEZ/u/RE1v4dMJXI/F40DA5iD3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372369421"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="372369421"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080492538"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="1080492538"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:19:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:19:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:19:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiM1Pxp02mbncYq1/v18kQ8wct9aEcMpmXl0WWoiQ4D0n+1bX/Blb8DpUNESo+FMSJ00MVotWpzuq4DmpsYXnT1ju0r7Xye6ZuvlS2/avrbvhTLmfh3BiQ2VHd4lq7FnpElh0cKqh20WxW3xRw1ZnNcWb9gDpPJ4UL8WLRdqGuxOjhy9sanQ7ssJkdV6+a25WrbkpH7PzWQMmMDK8YCiu6KzInI1K1Oau5bFm+0abQ5VG3LMxcgo+/rBcG9dRCO3CWfRsCE6LOpZCdOc4zH1OizA4UuyvFjFF8d10mlRTmE2uRcmiHfAVPKwQSn9a4B28FaMzrBAaHCNWIy6rza0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOOBJiv8JXKTyYb0FkJVzlIc+qcf5niVFnYSe2SmDhk=;
 b=BKCgnqfxFumKmp7g1nftSBr8XDoJuBL/MNd67adVSbXA4J+c4S6rkw13TC+/tmmZNYe0AdVXWQTEPHK09EoCUILeBXOnPsCOHuFQGbr3jUSLBMnL5zAMOXx3Bz/3QrGKYefwgBYmxaww86I4AD+VGCISSHx9N/npOE+1DO2oWU8AMuM9EjEqLe1EljgupHyGy1T8Kb7LaRsB+xgr/kc/A/iuoLdqLUthJtT1rwHji7YPxeXvclG8HhodMlWkgPY2gBBpS0HyGLGGHcBBVSqDDmPMF7c60Am3tVkkERNBL7zzLIwH4bev0zhj1eBagjXEToFe9TkR8K2TzwGn0Dmlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 08:19:27 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 08:19:27 +0000
Message-ID: <994b1677-1be4-ac34-2d99-a084886b1564@intel.com>
Date: Thu, 28 Sep 2023 10:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/4] drm/i915: Introduce intel_gt_mcr_lock_reset()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <ZRUoytWs/9DIUG+y@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZRUoytWs/9DIUG+y@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a86a1c-c96a-450a-e92e-08dbbffba0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpSjleRtcbotKalpIUOzN98Tf7Vxhngx1D2V/c+QUvfSJDTAQIkHRNXpfHDPj/9OZZAuaqcC5x5c4s2cyqof22V4L9tmwALgbdWpmFRiFzjwGLGZDntk2NfoBvJ4Wly64sQhtUMFZewsRfNSVixyEHJW/tknQRQySLPnWJXl4MBdhZMUs95WF1hzFu1/0E3V5oww01SZz/wa8i1UzMerlba2W2UJCMOniYLooETnjvZmyHkpZZ4TvjP3GxMcwElgH9UpgZnVRWuPRIZtG9IFqZIcT7JfRUpoMsuSHEYv3tkZepDa6KVgKLXBw3Ly3cRjtNEbZPeCEAj7OgogSbwtsVmf4msl7oUEuUUJhD6Yv5GeoSvzAduktzotr3kVG9ijdh9ZhbFDj47ynNcIHWH/0tlIJUCmtE/jOw2j1OIOqK3nIjDmIrkvQEb/aIbtfjakaIbCrBKeR7Re361YyMJcnO7q1NecGa2OW6QtxxVc8dPrZfz4Z7zCH0FJRZLgoi5/IAjP20Ge4V3wF/QTJs/SoDozGK0vFOIXqQ3vANHKbdUGgzoSUTFAb8ONPa5PrSUaCFvzOpPbJ+QBj4o+h6qnNyaib/mje5ETsdyg+W+APOCcbkMrc8BHxodRQGps2/gW+I9xe4OWIJRi5n3QvhOiyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(66476007)(44832011)(66556008)(66946007)(5660300002)(2906002)(4744005)(478600001)(6666004)(6506007)(6486002)(6512007)(86362001)(53546011)(2616005)(41300700001)(26005)(6916009)(316002)(8676002)(4326008)(83380400001)(8936002)(38100700002)(36756003)(82960400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a083OU5tWC9XSnVEK1Qxc05LOHNsRkpWcUFqR09URDJKc2VCRHc2RzgwQ2Rs?=
 =?utf-8?B?NVowOEZGb3VOaWJ6eFFveVRmbXR3RHp0elNPc0t5M0hHZ2FKV3R2REhtYjB6?=
 =?utf-8?B?NzRjdUVWaGgvbGo5WHA3UnpmZXZYcHlQclp3SU1oME9McmFlOTA3R0tXalhD?=
 =?utf-8?B?Nk5pRFpBOE9iMHdoWXU2cnIyendmVFNHQ0JObGRVYllGbXJaUjhRNDZNVFpq?=
 =?utf-8?B?MmNpRlQza3MyV3pLdGVzMjEwNFNTQVN0Q0xodW1mZ2ZncU1mbGt4cStiWFUz?=
 =?utf-8?B?SS8wNCtLQ0xNOUVOVDNDSmdtVktvM0lmRHRJRGRja3BzcWVIZUxBLytqOEdo?=
 =?utf-8?B?dXFBbFN3d3pvUTEwbjdMNnU3VVlaTW91QnNYVTN6R3FKM0lKeWF2NnVySU5S?=
 =?utf-8?B?RDhjM1J0NXpveFlIWnpPYks4cGNYTEl1ZFVvN0hXNmoxaHFuRkhhWFMxU0hx?=
 =?utf-8?B?U0ppdUhSK081VHRwemhEL3owRDlxeVMyRFltWEF6YUoySWtoZFdybk5razF4?=
 =?utf-8?B?OGxUdE0zeFZKS2JrQ0hjWkkwcHFYbzNURnRPamZUZzljWVdaUTZzVG5qQm92?=
 =?utf-8?B?bDdDNG5hTTVMQ0FTWUkwOWYyMm5ZWFY1MkhlVTFQdEhERmNxSy9LZ2NISlg0?=
 =?utf-8?B?cXJ4S3d2REc5eGhVNVMvQ2FCNURMMW1zS2RXeGl3Y2w5REtOaXFPdE1uZEc2?=
 =?utf-8?B?NDlnYWg0VjdROWNDTGMySkIyTlpleWVZb1NBUTYwUFNBQlhsd0cwVXAvVjFm?=
 =?utf-8?B?bzVDL21PUmNUcDFSVk5jdVZ4VW1WSGhFUi9iQTNXODBlaldUS3V5YmlEMW8x?=
 =?utf-8?B?ZVJndmIzZ2FBUjRTbzFJdXN0OTZSdkNEQmFlK2UxTjAwam96enR3TmlDWXAr?=
 =?utf-8?B?Y01iNktvL3hwV3NlN2RRVExOaFNxdHdMUlNQclpJL202V0Nnc1ZXRzduNWxp?=
 =?utf-8?B?YkJuOVFoUVN6Mlc0WDZaSUpuNXprT0V1amM1NG1HM0NIVVNZTGZnKzcwcFVI?=
 =?utf-8?B?Q0t6T3pSU1dlSXJ0eEg4eDJlMFRTWnlSUzdjVGlNMERScDhrYUR0WWptNkt0?=
 =?utf-8?B?NmltOVVPSGg4Y29EWlZzZzlwVzhtZTY2RGUwdlF2ZXluREdKU3RuTlFNdkcv?=
 =?utf-8?B?V0w5VEd6bUxRL1hXN0JGZnU5WXlpZzQydnBTS2RVNytyM04vU2dSNnBaNVVB?=
 =?utf-8?B?dVpoeUthdFdmaVFUSjcrTFcvbmVxRTU1ZEdRZkRac3l4MllDcEpOQUEveThD?=
 =?utf-8?B?RjdZb0xOWUswZVBSZGoxaUt6U1VsNHdmLzdsT1d4c0hJV3dVazl4NmRGTHdn?=
 =?utf-8?B?VGQ0MDdML3FBSUFZeWRwWHpuTSttaDJwaHN4MktJcFFpbHE1OW9jN1ZBRE5h?=
 =?utf-8?B?TURtckZHWjhuRDlWMzVJaXg5azdxV04zMHVwYmN6bmM4L0V6WGJoRmpCMEJ5?=
 =?utf-8?B?bUVhVTlJVWVFVlBaeXFMLzVaMkpsZWJTamE3QURxUVNCbUgreXRhZTdobFVU?=
 =?utf-8?B?NmI5djljaUZXaldwOU15SXZiWWdvbm5FZUZwa1p6TDFYM1dVQXFiT1dtYk1j?=
 =?utf-8?B?Vnk4dzgwc1RUWUQyM3k3S21VZysrcm43QUhFMHdrV0dqcjMrckl2SGdKQmto?=
 =?utf-8?B?YW9CbDY3T3lJYitDbjRpd2tiQkYrV2hKakFTUjJOdkorcTdnWDR3WTJkZ3lC?=
 =?utf-8?B?aWF0TFNzczFtY0k5eHVLaEMzcTZlMGZWd012V2dIRjZCaWgxYU1kZWlZTjZ2?=
 =?utf-8?B?RStuVG5lc3ZNWnNITXk2MW9mYWJVaWh0OU9OR3ZtSGlpZTNKSHhlRHlYbm1S?=
 =?utf-8?B?YmsvaE84OTFlQ2NBSTJDa3BQUk1qclhxTjRwL2hIWVBZTlU5WXp5dzJlMmZo?=
 =?utf-8?B?MXVhTzB2eWRyc24yWEdVcGZQVDk0NjRsT0Y5c1NFTXB4R01jTWt5WUI3SGJo?=
 =?utf-8?B?bGxFank0bHFqeG94RlZFSitBVDdjRFFtSDV3RWQxczZ1R1BXWWNJT0RmQ3Yx?=
 =?utf-8?B?VFp3cFN3QTgzQjNZZkRCZzBaUktRaDRCME0waEZJalcwRTh6eDFLRlEvN3U4?=
 =?utf-8?B?RnZEeEs4aEpGMEtsYzM3a0ZTMDVZcjE0THJkTjdPN2xTb01NWGVYWlFCd1dz?=
 =?utf-8?Q?nNSKQrhB1QEzLCHlAkR2AIHGe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a86a1c-c96a-450a-e92e-08dbbffba0b7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:19:27.1108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L+giWQMTKn3oPkNZeAsOOgl6MhzIJjd281ritgIdtFUFxpadsKw3Qs9cQCN/OSP1YM5ZnyqW5ikwO5bha5ttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
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


On 9/28/2023 9:18 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> your client is still missing my e-mails? :)

I did reply with a question!


>
>> +void intel_gt_mcr_lock_reset(struct intel_gt *gt)
>> +{
>> +	unsigned long __flags;
>> +
>> +	lockdep_assert_not_held(&gt->uncore->lock);
>> +
>> +	spin_lock_irqsave(&gt->mcr_lock, __flags);
>> +
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>> +
>> +	spin_unlock_irqrestore(&gt->mcr_lock, __flags);
> I commented here that probably we don't need the locks. And I
> asked you whether you had any reason for locking here.


I asked the question back to you and I send this before you could reply.

Will remove the lock.


Thanks,

Nirmoy

>
> Andi
>
>> +}
