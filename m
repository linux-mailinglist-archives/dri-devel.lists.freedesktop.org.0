Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4B72A13D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7610E155;
	Fri,  9 Jun 2023 17:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA97F10E155
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExBSp18Ojy9R8s++jeHlrYsY7LXX0k18DPMJbQ2Wnf8Fop2MpJJYmelSHGHiQy+2tY/cNucn281QmZhmupZx2GKJrwtwS+S0PJD4PT+tSSaVjjAh9fRrnT02RezMOLDpY15l0SLSaP6jwSQfWZ9qTuxMmEdisuMa+VAAlZf6ousagRbyyOW4A64/7ovgAT+I4W0wR6ydVu89hN7kq8/px8u5/6OqdsydfHiYl3tYCvE4VrlviJV9ZGCYbetOOz+AEOPkIm/Yuyx0MMNgcB1gWcRROzPAKyoAyOYx/eLm7oTTa+ivQ8WpD5uDlYmF9vUVu11ZwaQBOvLlm4BQuP7ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQXDtsK71Oyvnkv/hgTRdMyO2lIhXtd6FwnGBMus6LM=;
 b=f8Tymvfokzc8dZTUhPFShS/OOgTVdf9+YjnJ43T8RUb0kMAkT8bJViECq8yMubISkC8y2e27setwQ8KTWTrxVny0njdCWCezVCAvPXykBd4a+L9TdJqLofis7Z5T/sQuX0m0Azr0PoHVssOrjBoZN01n9G14qezsAiFCiub29nL1Cpii1djBk4keFbySDjX7J77W3X4Cq6CI3v0iiWIneTvlewBktnvqo9q6DShclo14D/Hn8kIpJ1zCYFGfRAh6L5RfszTSne+Y4iM0kIBd0OIiB4lk9cdSiI8AYvUbvSbfwBSUWhvQkX94chnGBA4vkfuuyV9NsETRkJq0/+WBUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQXDtsK71Oyvnkv/hgTRdMyO2lIhXtd6FwnGBMus6LM=;
 b=kWmq5nBqxWIlywGCrQdQNpMztN8238lsJIWfKA+hm+5MxqUgktJ6qzR7v3eOGWA+U0vIW39PVjs38ccjqtA6xKZM9D6/iSK7OrJ5FWlWTVkc/rf7VSpLYf6Bux85wWGJlQaduaOuNhXI7L/GtgnSKASW93Q4WWU6eeyAuVQz+k15P/AG2XbeLN3q6rjS0gSKmKZio1u8rTr98rbOsiLP5dUz4YB8Ucjv6o4vek0YkNL8YYbWGC2FnP9JY62sgl20Z3Elk0JINipYC9euv90Fvx1eKtgEqeZHGWuU8GrkqFcTiaiF+Kllgqmua82dADTgRMSsIOuyB9CXN7hRWd3kRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34; Fri, 9 Jun
 2023 17:29:59 +0000
Received: from MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::a029:8008:ffa4:8ef6]) by MN0PR12MB6150.namprd12.prod.outlook.com
 ([fe80::a029:8008:ffa4:8ef6%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 17:29:59 +0000
Message-ID: <09cc666a-bc52-44b3-230c-26dc705c5a56@nvidia.com>
Date: Fri, 9 Jun 2023 10:29:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/edid: Add quirk for OSVR HDK 2.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230609014207.2759720-1-rcampbell@nvidia.com>
 <87y1ktqa75.fsf@intel.com>
From: Ralph Campbell <rcampbell@nvidia.com>
In-Reply-To: <87y1ktqa75.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To MN0PR12MB6150.namprd12.prod.outlook.com
 (2603:10b6:208:3c6::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6150:EE_|BN9PR12MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fbd32b-3e82-47df-7c7c-08db690f2658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLPf7uzm0SyZxMxgMpeQsLaS2APj6LyatL7/LqivJhSxS6uwEBkzbTr+oP6R9EKl6y7xUWkGMIvfCJDE9Shsj5SqtrJg3jcXDp0Lgau2mz1PzeHN2mS4iH1xbJI8yUi0cIHPofgnAnxkP0KFTgdP0x2cQCVPIVmfvIdBcHJtFXSv+RgKJBJucB0bDlIb17vqQbNUBdt8jcnTuroK7pL+vaPQ/3wHbK9CzdxNIrAyVKs2Lx54iBjPmfrS3Cqrbe/iGO6iB/JAc4rvzVo9aVWHjVfNUTU6GWztazK7BB7wh02BFhuIeHu6siJ2Piamc26Vaqgo/qG2MF17iVqavi0V0ozpk7UifGpA52etkGjIqxCw2TGyuQx0SQO8st7fQ+m/8QfpERS+MggQyKcJK7Ps+fK177tiXsTPRLTCNIRL2zmFj1g8BWbZRGHTXZ/tWixza+kP7nWGAWtf4Q28vadkkuMppkk0bPd/UaAetdnH0SrMK8l60TuuFthGlyPaWqj6LxYFQ2rv4QRXH74gFPuIDFMeEOYxWXa7iNvr0xSwdGz3OOrC2dPKzwUyQ2L+Rkb/vtZMnL7yN4JC2/4EpGYssB5e7bVpTTHM9vmjvdi1XQAtLHnJIC3hf1S9jB6JEnQekgeP3mpR3+EqvUwBAE4lSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6150.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(41300700001)(478600001)(6666004)(186003)(83380400001)(8676002)(8936002)(45080400002)(316002)(6506007)(6512007)(31686004)(26005)(4326008)(66946007)(66476007)(66556008)(38100700002)(53546011)(31696002)(2906002)(5660300002)(36756003)(54906003)(86362001)(6486002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU1CbS9EaFB5UmJyT1VmSy9FallTWE4xWjIrS3NIWUg1MERkS01HdnhZcjVT?=
 =?utf-8?B?ZzZxZHF0LytRUFBXSDFrNlpPUVJaYi9yU29qcVRFc3FiVXhxdmhLMERHKys4?=
 =?utf-8?B?TmlmWXhLWDcvL0RXdE93eUFiQmJ5cEtvb1Fqa2JEZVRkOEFmWGRSdmdOL1g4?=
 =?utf-8?B?S3h0Qi9uM2NDSTJGaXhieEE1Q2ZsRkR0UkN6Nit5MkNFdEE1OGhXcXNzeTdT?=
 =?utf-8?B?UEw1Ym5DcnYxa1U5dlJlSEp5T294WEp5VGVKTFhOMXdKeVZtMENCdW5CQnJq?=
 =?utf-8?B?dCt2R3RMMnhLb2d0eXZMcGpPbndnK2ZxeGF4OVpyVVdvNWdKRWJNZFRYKzE4?=
 =?utf-8?B?Q0ZybHRRZmoyQy9ja0RjNmM1aEVSNmZ5dlRldWhDKzdnKzMrTkVRTkRYdDl4?=
 =?utf-8?B?ZnlZem1qSUFkdlhDMy9FQU9ERVRXRUhXSzFzckRjZndSS2E5VmRob1k0RFVk?=
 =?utf-8?B?Y1JyZ2NhV3BacDZWeUx4ZHRzOURYenlKcGJiSC8yYXVBcUhrWU9CMDZPdmlu?=
 =?utf-8?B?UE9vMVZiajZIc2Z1bTY1MWFJb2cvd2NnVS9zN01EUFFteGE5ZTZxMWhVWGJR?=
 =?utf-8?B?WjZQcklvbTY1eXIwY2k0NjAzcEx6eFdNT1MvU2FuaFplUG5NS2k0S2pGYzkw?=
 =?utf-8?B?UkVGTTltTFZ0bS9TWlNhNkt1YjVWaHZ4cCtWZVFrWmptTGt5TkMyV2dkekFl?=
 =?utf-8?B?QktSazZqQmdkYm9qcFp0WWZyMDFYQW5iZVpwMEJkZHA3UUpESVRMU3BaeEg4?=
 =?utf-8?B?L28yU292RXpaL2tJbDlBcXZGaEFJK2kycEJ4MDB4OEZ3REJnWHJiRExFYWh1?=
 =?utf-8?B?TnU0MURwTk80N2pDSjVHT05LVmJyMkpPc2dYVnBTZ2FrMVBiNWZLTngvN2Nu?=
 =?utf-8?B?cE0yYTh5Y29Pa05uZzZHOVdRZEtOQjVjdUtTRWtBUGs3WTdaamIvNlhGSmly?=
 =?utf-8?B?S3E2UkNHK1EzTnpvdkFnUThnTU83Y2JvTmh3NHRsaytYTnRxTzZYTWdYT1lR?=
 =?utf-8?B?UlVvdXZlTk1ocXIzbU5sS1BtWmtRZ1VaY29xZ0NpOWZrYTZqMVlWU3hBeWZU?=
 =?utf-8?B?clBxT0kwRmZFQ3JCRmJXekxiYmluRXVWeXRLb0RYMTU4RitlTkJLUlBWWDdT?=
 =?utf-8?B?cEJlWmczUk50d2U3b2l6M0RpMmx6dERyc3RvVDJ4bmdvNXlnOGJjVnlVZk1P?=
 =?utf-8?B?TW9wSFlkZkFMbkkrRjdHd2NBTmxFTm14UVFpdVlrTUlLNEw4Q29OekpJbE5k?=
 =?utf-8?B?RDZxRitBMERvZ284Y1ZreUpvT0xyQXB2MjdwOEw3L1drRG9lc1lSMFNSY1FX?=
 =?utf-8?B?cHErRGZ3MnRVdzNhRlhwbCtsdEFmeExORU1USlVKUkpOMG1WdXBGb29mZnZ3?=
 =?utf-8?B?eUdGeHV6VTN5UEJWYkRnb1J0OU9kNmNjcFppd2QvNGJKaUxERGt0UENpRlZw?=
 =?utf-8?B?dHkwSUlMZ2R3TTFMVXpNVGNPNHBQdk5tMW5oQUtUVjE3ajF1SVZyWGx2K0I3?=
 =?utf-8?B?VE02OUZ3WEdVU2R2cDZLRC9vN3VVTlIrQlF3aWJCMGJRWGt2Y2R6M1F0cXpG?=
 =?utf-8?B?Wmh1akVLSnRzNzlDNndPeVhTVUg3OC9JdEtVaE84N0UxdklrQm96MUlNMDVU?=
 =?utf-8?B?dGd6TFZDVm1sQjJ6NmMrenhYdElrZDAwQTE1ek9OcnBkZTdVaUlDUUQwMmxq?=
 =?utf-8?B?cytETjUrTkNtZldoSzNONE9RbjQ1VjdWbmh4Y0JGZjJCeEM0S1ZFSFJoTFl5?=
 =?utf-8?B?THFJcUo1RFA4UGRSRUNFclJoOXlEc0lvdVl4clV3OTBEbTJXNGZBRE9pcXcx?=
 =?utf-8?B?SDRkWHJFK0wrU0x3NTVCT3RDOC9HMEJGUHBTUUh5bmJiOWNYT1gwSmpzVC9n?=
 =?utf-8?B?M1RSLzE1ZklBQVVCVDdVa1VzZUc0clAra3dHZDVncWZzMDMwdVhGa00zVjFi?=
 =?utf-8?B?Mnh4dm1NejhPZFhoc3ZUK2tHUmpXYzI1eStoczhPeGJ1UkhyZGV0ejlqL1B5?=
 =?utf-8?B?cDg2azhGbktyZldvaFVESlZWMmhackx6Mm1ZcnQzSWhpcUo5VWNiYTBlcE9B?=
 =?utf-8?B?MytjRCsvSGtjZFEyaStWalBoNTRwMHlLWmpPV2NySFFuN0gwNkpRRzI1a3Jw?=
 =?utf-8?Q?2KjXg1puAgw/x9x6IqNTd1nX7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fbd32b-3e82-47df-7c7c-08db690f2658
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6150.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:29:59.4012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aInh310XFhprHV3bxWOU21Q1en5etRs2VCC1FKizpBslH3//DAHpv5vfStvm1C3nHchFlqW0aaYqLS5PgF7SGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/9/23 02:03, Jani Nikula wrote:
> On Thu, 08 Jun 2023, Ralph Campbell <rcampbell@nvidia.com> wrote:
>> The OSVR virtual reality headset HDK 2.0 uses a different EDID
>> vendor and device identifier than the HDK 1.1 - 1.4 headsets.
>> Add the HDK 2.0 vendor and device identifier to the quirks table so
>> that window managers do not try to display the desktop screen on the
>> headset display.
> At some point in time we requested bugs to be filed about quirks, with
> EDIDs attached, so we could look at them later, and maybe remove the
> quirks.
>
> The headset non-desktop thing started off as a quirk, but since then
> we've added both Microsoft VSDB and DisplayID primary use as ways to
> indicate this without quirks.
>
> BR,
> Jani.

If you want me to file a bug, I can do that and I have the EDID too.
Where would I file it?

I did see the DisplayID 2.0 code. This headset is no longer being
manufactured so updating the EDID is not practical.

>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Tested-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> I don't know how many of these VR headsets are still around but I have a
>> working one and I saw and entry for HDK 1.x so I thought it would be good
>> to add HDK 2.0.
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 0454da505687..3b8cc1fe05e8 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -230,6 +230,7 @@ static const struct edid_quirk {
>>   
>>   	/* OSVR HDK and HDK2 VR Headsets */
>>   	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
>> +	EDID_QUIRK('A', 'O', 'U', 0x1111, EDID_QUIRK_NON_DESKTOP),
>>   };
>>   
>>   /*
