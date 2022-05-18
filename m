Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53CD52BBB6
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2D010EFF0;
	Wed, 18 May 2022 14:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2A10EFF0;
 Wed, 18 May 2022 14:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2c9JAhJnhtxu263BEcjn8dgHUpjX87s5OOXoM+ANBw3k7HYAng8d5bxZRw48Exx5gj5o7kcVOjh87/6CWkJbxZ1GXTaURJWo8xEjqJMHG5Gc4LkMzgMCYB1F8g+9KxXSWpwWqttc8e7r/0YxZxqZ7MCGp1eCElnjdnO3yE4xzSRl2X08l1VMxar5nbb+7cMtmETY+2uCO/91wihDzPHSm+BBZk6JKSbDxMNT4XapM1aaqkXEV1UnDRBycWoUg2+sP3fV0FTBqGtLC5zwcafMPIxHADWkR+qr6PNVifyJx4n9PT8Lf6BPLdQ7AzEDD9AtxvxL0kbcF2MuFcTGJz2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAHLnudMYGSCuegRJLDHot21ZhxLoxod6jwDCcFy6nA=;
 b=UcjXSYaB0fENLW63uFHGS+ccZVAskkAs3d+cpVmhD8nzn7uxxOrkekG7JW8Occj8a/bBfhHStM4Fc0Y1HC0/6OiPrv3gBstQV/H9uSHj8ZQC7KPZflptkj5KToPchviE6TqeitrSfECMwk+8AYENcwoHGBOx3mx1gScymHY8V7CZjbUyUT75QcIGg1Frp2LN8gY3ni5xN3uXHZVLzLywzFhcWvp8NZPG8BMsGzTWupl3suzza4RmU5mqCXq2eocugXLkWB9vyqZ8PWJceZEzKnfMucaY6aR7ayZtRgETjNc8KFIC2wS4LL+eT4zxhALH1xg1ks4lFMx1iJMIQfjnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAHLnudMYGSCuegRJLDHot21ZhxLoxod6jwDCcFy6nA=;
 b=TpkcEJPKYCVqOOuL2ZqGbaOsAOzM2vzyyiGYHp663PCSIhpVoLwIdDrs6mb6aB3VIef4xmHfaFFGGP1zsv0K1ejaZ8tZ6d04tTdofS8XHPUrDxTfqrvVVTVS1Z2zEb8SwsPlVLCvs7eWSoqNyly74FOdH2CRBRECZyzHfUWg7x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 14:08:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 14:08:41 +0000
Message-ID: <8110a6e0-1ba0-35dc-7fb6-1f4282cec4ff@amd.com>
Date: Wed, 18 May 2022 10:08:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
 <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
 <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
 <642bd366-7918-0f0f-a6fb-e6422eb7501d@amd.com> <87mtfhhnx4.fsf@intel.com>
 <7a61da79-90ac-b4e2-d06d-758616b12855@intel.com>
From: Harry Wentland <hwentlan@amd.com>
In-Reply-To: <7a61da79-90ac-b4e2-d06d-758616b12855@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:610:60::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f898d05e-33d7-4a0a-0635-08da38d7e907
X-MS-TrafficTypeDiagnostic: SA0PR12MB4432:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB44321EF2C744E4F6490F93BA8CD19@SA0PR12MB4432.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jjeqpIDyaJ9He+EHNZIB0gYdqcpInbRf70yojTvCZB3MTJjy7UCzlNDzA5azBz5CP0r7iwsBuXS2P0V261TtaDWW9YIx/LfcG1CGkbGNypTK2XNCsMWVpcvrRSYQ/IeRi/fQ3MRpLnS8Hv+qH5MIC91C0+4pxxVNEJDqUngb05JrLl1BRqImHj6OO7VBnFwmqLES7B7Ex4coAS1le1Dl+T1fe1iz6LH4ZsPZm7mucnJpAQfl+pryH1rGmaPVezNHqLKBQsc8e/e5gkcUgSVKdp/Xz6Xn9QdKprS8UF/3CU1ukWgXXGvsI1PCIn58qb+5sO80OwJqO/IpuRvews7CzaDpiDxUYD+AuSoA2V5PAYyRMWwZcsWvx9dhjzRIvZcO6yO8j+MuzML7otBvFE0pQFOfn0sugnsz0I33n8gZ9W/L3alU4d1FZHYra5kf5mtxMf442+LoOQd2SmHEudXV99+qT8TrYlhkqYHNY6Ov8dmxF8u6fTUVy4/EJTZYt/GdTtHC4vKZ7KW99egOZg5EfIbHss1NeSoI7fCk7vr7vJtLnKV8M5kHk1QvkXNQlXQZ7UHjCTVAfK/RvRUjdo54lTNRQbiaOMTG2UvLR4s0I4ObEkc1jt2M2AIRIf7fTMNPDG5+zYrK5ONnztsTJdf1UGjzty9UmOrPE4GgSjFDtZ9IDjR6EmXMLlu5F9uG+gvM1bzNXlwUe4V2V827gqLNBNkTzJvsVYZFe+zU+KuEO9XmQob6HzvXD9Ubw2bppZg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(4744005)(5660300002)(316002)(31696002)(8936002)(6512007)(6506007)(26005)(53546011)(6666004)(36756003)(38100700002)(110136005)(186003)(31686004)(2616005)(921005)(8676002)(4326008)(66946007)(66556008)(66476007)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3VmKzFpc0pZdG1nekV6c3krYjNQeTVYR2g1bVp4eFdlN0FUQ29Yck5ZV0d1?=
 =?utf-8?B?NitkaFBKbllJdlphL25BMXJJdmNSNTJYZHJMUjltRXN2SSsvYU04QjgzUlVo?=
 =?utf-8?B?WkJnZzFIYzg0dUtNSytQMml5UENXSkNCWFB4VWNXYmphTXpEdGR5RHU3OVRX?=
 =?utf-8?B?QWluQVRyeTRSNXZQNDhWZjlJYUl0VytGNk9NQkFicHlOOWY1bXJENHdzamtu?=
 =?utf-8?B?K09VZ2ErTmVNcCt3OXd5NzZEbzQ5QnIzTWNGRmszRjJKenFIRzg4UHhSL3Qw?=
 =?utf-8?B?eWhWb25sUmdsNC9JOUp1RFM1cnJPYjFtMnMxakQwY3M3V1o3NDhBbDZQVFlx?=
 =?utf-8?B?VkxpNFpscmhHYmNXYzlMRjl5WXRJM3JMOWV0Z2grRXVvN1BYWVBPczFWR3E4?=
 =?utf-8?B?eURvYlVNQlJoY21yNUpTU2dQWndEKzdRVXMxUWw1eTNPaTQ4N25PdzdlRjRh?=
 =?utf-8?B?b1BtMkIrcmFBcy8zQm5qUzVuVHZPTEpyTWFWOStZYTR2Z2tJMnFBQTZNU1Fj?=
 =?utf-8?B?V29CVjM0OUtYalE3b3pIZEVIck84Sk5yU3VIQ2NVOVZPN0xYcW1JNk55WnR4?=
 =?utf-8?B?SEo4enlDNXdhTm1uYlN4eE1ZRHZJbUxOcTBRZEhLdVEwN1dVNGtlZElGRkV6?=
 =?utf-8?B?VmdYMEt4U2I4bFNkOUZaemVVcExpNUttY09TdVAyY1dscGZsYnczbjU5YzhO?=
 =?utf-8?B?U1JZLzNyMUtkNysxNEdNNm0xQ3ROTlRoM21RUnoyZjZMRENMQjkzT0JtRjhw?=
 =?utf-8?B?SFJ5T0I1MFgrY04vemlnR2tEUml5ZzA3TG1TR2xXU3BEN0U1SGNMZTI1bWFX?=
 =?utf-8?B?TEVwWi9MdVBrUER4Y2xLMW83VmhrazhwUnNkTyt5eS9GS2g1c0dFZHd5RWFP?=
 =?utf-8?B?ak05eE5GRG4xQTEvSlh2TllVdUMzWHFiQlE1QlZ5Wnp0eXlhV0xFMWNvand6?=
 =?utf-8?B?aStYU3l2dUNVOG4vc09DSkNaUzFpM25UVnV2M2VVRDVvdzBFajV6WVZNeUdw?=
 =?utf-8?B?ZVh3eUszVWZEbVBJcE1OVDN1OFhVMGV1SWVtNXRoMUJhcnh6dmw1WkZETzJ1?=
 =?utf-8?B?RXJXOFhtdGw2VVdlTnVKR2xQWXRhVENEYmgwMTVDU01WUllUS1BrRldaUml0?=
 =?utf-8?B?eGt2b2dzdTQxMGJiSVlhZ1NiWk9IanBwN0pJaUZJREIwcTF2ZWF3a2xBcUlF?=
 =?utf-8?B?RUloTll0WTBZQ24vdEtjdWh4a3BJMjVoREpzeXEwU1hjNjZYcXdFNFJicFM5?=
 =?utf-8?B?TEE3dVhoWFh4SnR0NlVRNW9URVBnTmRPc0dJQmxETkI2K25YVmJTMWNIWUF5?=
 =?utf-8?B?bDF5UWk1V2UwQU1jdVNKdFVESDFOeUZDVHpGVElQVm5lUlpPTzg0UGxITDkw?=
 =?utf-8?B?ZWJKRmdhOWxVc2cxa3BvaTlTcHY4ZzhRdmRVOE9UaWlsU3JaVUZHRlNLdWZP?=
 =?utf-8?B?QnY2bWRoLzZQdU1EeGRvZmZieDhFdjZQblFHUnFuZmtiNUlqUWppOWxFZlBa?=
 =?utf-8?B?UTkrSk8ydURqVGs5SDVvd3VMWUJ5YVVzSEdxTFd5eEp0aW9VQ3E1d01yTVcv?=
 =?utf-8?B?VUhRSnI2bE5pRStvWGFxUTlvbVhiNlJiL25VUVBNbDVjYmVjbEVqU3UzRm5O?=
 =?utf-8?B?bDVjZDAwbFJzYkhyWGp6R3pCeU4zNkNNTklrblRYL3drbzI5MTlUU0pCRE9N?=
 =?utf-8?B?eUFzWFROSVVOUXRLdDh1Ky9aU2pPTnA4NEFkTERQbFJRUW9OU1lnZXhMOGVL?=
 =?utf-8?B?QitLTDZHN3UwUHlYZHFDUC9rN0dvcmZqQnZBMngzLzJSditsbHUwWC84Qnln?=
 =?utf-8?B?b1IvQ3hKSHEwVzBDT2dqWmVlUjRSOUhEM1JIdmczOTRFeXBQdjVhV1cvcWpU?=
 =?utf-8?B?V2JvaUJMT2JSSCt0SEdXdGNaOVV3am90ZXpkQUdCalJPNnpZZ1RFcGxRMlV6?=
 =?utf-8?B?UW5QWUJpL1JsOEhtNzd0L0x4TW1GNUU2ZmUrY0ZNM2U0RW44TzNjN3JRNXFr?=
 =?utf-8?B?Qjc5K05EMWJnbjAzR2I2QTg4NU1wUTJIWkUyZ3BuZjJFZk9xb1Bnc0NOZ200?=
 =?utf-8?B?Zmozb1Jnd2wvelB6UlIwMFJPNTFGWEoyZ0U4VStYN0xWL3NGc1RTS08yV0c5?=
 =?utf-8?B?NXlnUW9iTHh2SXJ6TEJnZjVTZHpWWmN0VGVDdmRodGNDNmJTK1VFQmp3eGEz?=
 =?utf-8?B?azF0MUlGVDBkclhWbS9rSXp1SjFWYUJGcENybUI0eTZwa2t1VENzUm1LOFZn?=
 =?utf-8?B?UGh0MVVoWjdhL2FzWDY2TFpRN1htWVRUL0FiOGxwa2E0OU92RXhmME5LSSsx?=
 =?utf-8?B?RnRCQ29ZMkJLSjd4ajQwanZMMGtNdE91T2IrUTl4WkZnNEUzVy9jZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f898d05e-33d7-4a0a-0635-08da38d7e907
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 14:08:41.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4mZNdnMoR5yLIklJezr8wHM87I00k2Y4coejs1+XnzttX+PLjwG6R0tjBNsIlYytDGVtxoiJYScYA07YE0LsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/22 01:38, Modem, Bhanuprakash wrote:
> On Mon-16-05-2022 02:09 pm, Jani Nikula wrote:
>> On Mon, 02 May 2022, Harry Wentland <harry.wentland@amd.com> wrote:
>>> Both the kernel and IGT series look good to me.
>>>
>>> I recommend you merge the entire kernel set as one into drm-next. We
>>> can pull it into amd-staging-drm-next so as not to break our CI once
>>> the IGT patches land.
> 
> @Harry
> 
> Can we have your Ack-by to merge this series via drm-misc-next?
> IGT patches are already landed. :-)

Sure. :)

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
> - Bhanu
> 
>>
>> Can we read that as an ack to merge via drm-misc-next? :)
>>
>> BR,
>> Jani.
>>
>>
> 
