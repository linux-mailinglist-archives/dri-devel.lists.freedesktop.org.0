Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87B43CA0E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B75F6E7DC;
	Wed, 27 Oct 2021 12:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852E16E7DC;
 Wed, 27 Oct 2021 12:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCpdtPaU8NICreolmBGWipMjDUG7yK8pw2/ngxmDaQBgkQ4FGbcYaDN1RuW0B+Lsp+lydpmX+XG8gOVn7x17yQ3V7WJgQBbGxyumBI6jGdivLZ8cbDqJpCocIWkJIT3BOmBVHzf5iylQDWAgsX5wyQXZyZoMAIjckuwb8wU0tbxm3QM3jryJIqlCZNHn5Mc96edMsp23e059qBKbHED0Mh6nojxkvSVGewJ1UigfIoqia+M6s7mQfXTQFtsdOwlPk4TH1HeAQTHEqF/zsAQ6PM+0Kmik+6Ha/PtPUmvGvDx4qnPYQ0YSWBjBcEaH/UCo+QmJJmkKNbmRbV6zsQ+XRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyBfV4HighF3fOfP1mBAx+x71FVENpAMSyeDRf7Q/L8=;
 b=L50gfdiVHWKOjQBp0RvFRFhuF1OOgcTO+duDUOR5IuYi6OmJuyiHDzPNyWN1s+mn29JKtOhJUUTwMpEgzATO/CJeR6wmdb4w9VbS9SwI2JkKaDMumjaSzbQsABxgno4iG3rUEbjtT4BxC3jUoNTPt1zeQSDfGwc+kwOKWKy/N3V+XbuaORv2Rl9jrd4rRruMfoxr2E/kkDGtpi9JW0oc/dWtpR+XNP/U/YBONpSdVOFQMcwY0SFHWwG533F3KhlauSQA9andMERyN47Bg6CiFlPS5KGjBFP7eDWUXArQHRrXTYaccwCFrvz1hYwigyMxXEdScsgEYZJPJd25vhgTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyBfV4HighF3fOfP1mBAx+x71FVENpAMSyeDRf7Q/L8=;
 b=NJ5Z37ZdUZxqt13qo0qTzYHoKKHVWq3w3wVWmDOJvfsVreTAJvgGFVY4nJQnT8Ud4STTTsKkdJ7rTG6NzeQNPbeHWySdbOzenMIJRbNXh1vNO2R9OYFd9FHH8VhZfKcD0rFJl0UEueWm0qNo7DzGP0HzZGfnxQ2fYXaosNnId3s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 12:48:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 12:48:17 +0000
Message-ID: <a65548cd-2499-804a-895c-b1e723973f17@amd.com>
Date: Wed, 27 Oct 2021 08:48:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: "Shankar, Uma" <uma.shankar@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "Cyr, Aric" <Aric.Cyr@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
 <20211013113046.7ace2dbd@eldfell>
 <8c1d39bf5d034595aafd8937df259547@intel.com>
 <2df20264-6800-56ec-3ec7-5a319c9c2296@amd.com>
 <20211027110057.72db81fa@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211027110057.72db81fa@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::41) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 12:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f39b1b8f-67e2-4a74-39db-08d999480c28
X-MS-TrafficTypeDiagnostic: CO6PR12MB5460:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54604BC88F50179AB0E8AEB38C859@CO6PR12MB5460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+HzBNO9hCou7+g06BvWHViaU1+tYuQ/SdV7gYYYTDkq1GYbLo7+G3LvCOUIRjH2829nFJWO7S8osoL1ncH7moQdF6ku89GqKgNPDhQaALFRtibhJccPbg2Y3AnjhtrHW2Rp9Q3Vw8q9xSLXWzeb6o4D+Z/k4gi4EXNZfzJ0Nx+vac5nb9uCDZRQP80DYcuBXWZDNE1fE8UGTvqc31OWU/NH+2j/2/e0HaSSU9/cScDY8b2tzYmMLV2xKBUmw/KGIHV7B4rfQd6Hs2dsw3xpszAEnSy8wLb59kiYYCjDNok44Z36zXlcbAgNTW1cpztlbSXB10W4NYO7r77XLSpWPHUqZccXKLVA54LDcCxBH0a3osdIgY3AdNmgQ4vQk0P2gjgXhLwqlTXAXWE9qoIJH4M1bhEJ7aJCroeYOihMAQC8ELRqLHy4bvoSY57QKfq+UKxgu88H7oHAseVsPQHdaJLqrSTSI2oHHtudEmBvSjNRzhnVIMKYO6ea4BL5GawysqcrkziERMp6H9RFO3prF+K/YwVJRo1dZ+jtUqnSXOtksBR1BXyLUG9lQSBnvzakJ9JkNal+mH2Nm5YS1dawDmYzXG08XJ5VRorDXjOHfcqZesD2RBL100JIRQ7t4xkXAAj+ZqNXhzTcKWam2XWqNMIGD8ch7k+p4xwVSRuV6cJzRi/cKQhx5ysGbwMKoaMUh2uB0rtkghpUyxg0CpK+INrIVudhI1ZV/WRPolh5FpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(38100700002)(508600001)(2616005)(4326008)(36756003)(54906003)(2906002)(5660300002)(86362001)(66556008)(66476007)(66946007)(44832011)(4001150100001)(956004)(316002)(31696002)(26005)(53546011)(83380400001)(186003)(16576012)(8676002)(6916009)(8936002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJWL1Zvc1JORFErWjJGc052YktDUk5vOUhMVy9ISUdPenNFRzhLRC81NXgw?=
 =?utf-8?B?N1VhdTJ5dVlsT01HM1lTYnJZVDRrTDB1QU1mQXZCcHl6RVhqbkpHZ2JRVy9v?=
 =?utf-8?B?QmFiVjJORDRUT3laQ2h3ajNzZUFxTEhTT3RmYXdGUGpRdXBJd2RwZHgvdDJt?=
 =?utf-8?B?OVlBY1pyLzFORTU3dEkxcEd0L1FwTzhCR2txalV2Q0Rwc3ovRURNeDBxcEpy?=
 =?utf-8?B?aE5rVUVtZWZiZkNEQXdwVndMdW1OYzZYbHh2UC9TdjhPaktFWHZxWVgyMzZL?=
 =?utf-8?B?Y0gvUWdpclFWOW5LMjBnbDJONVdkVit0UUJqaTJ6OU1YdWVsRnFDcnJscTlz?=
 =?utf-8?B?Rk1jdy9RQUYwTC9ZaVpOS0huemlreGNGbUUyb2ZJU3p4b0xmRVRUN21yRHIz?=
 =?utf-8?B?YnNUVWF2ay9sZGxnWTk5NlhDUTNwbU9WR0JvTjRGSVlaeFpVYjdGRDlqUFpq?=
 =?utf-8?B?cG0wVGx4RGJiT0RYSE1FU1dCWGxIVTl1NE9wZklLekk2SkZUNENEQlBKWSt3?=
 =?utf-8?B?Sk9INTVUR3l4TGZHNVJGOUlRQzdOMXEvZDl1Y0FaRkJwbXd2VUsyRVlOelRS?=
 =?utf-8?B?OE9BaE9COGRFc0NrcXV1U3lXMWNHV3VPWTZOcmRaTHV0UVpQUGdsR0w2QklO?=
 =?utf-8?B?ak9qZ3RpVTUveEJrczFwMllkRmgzZldPTnBySjBKZEliK05JWFpuZzBWRXhX?=
 =?utf-8?B?Um1URmlsbHJ1ZE0rSHQ0WEMzakJvS3VpQ3lxRG03cnIvT2IwaGpJcXFuSVMz?=
 =?utf-8?B?K0dkSTkyazkzczJOWDRTeFBMNkM2N1dLWTh4eFJkUWM5TkFEU3BPMEF0dnkv?=
 =?utf-8?B?UkhtVVJvWmNkUXVkR1VPR1o1R3pSY1hRNmxUL3krV01tSEFsdUNrVytEV0sw?=
 =?utf-8?B?cVVkZit5SGpvUDlQNGNkUGszSk1KY1YxbTdsSmNHNUNOSEJXa1lrMzVwaVVM?=
 =?utf-8?B?L3RXbmlyNDQyT3dGNUh0enNmeEd3dVFYTUxmRVdsdXV1Zmh1b3IveGtxVElx?=
 =?utf-8?B?c0lPMnd0TFI1R24xREw3UXAwa2ZGV2dOZ1VWS2hmNzFnY3FrNit5RERiR0Nz?=
 =?utf-8?B?SS9FUTJNZnRSSkdjYmVZSFNEMllUaGlNL3lmaGp2MjJzcDNjWTN3b1RXZklP?=
 =?utf-8?B?UDNRdkNrZ3orcnE0UFo0ZmRoL3hjbWtYNkZOOU10aEFhbjRlYWpQNWViVDhl?=
 =?utf-8?B?M0tYUmhnWDNYalE4ODBZS0k2YWNUWHA3c2htSktDdmM2WHJidloxNm1EaFRV?=
 =?utf-8?B?U3UrUXBMRWszTU1TaUNaQTlxWjRBME14UjlLZnRWanR1bWtxZ1lVL3YxWkFa?=
 =?utf-8?B?cjNncUtqN1ovRmdUazEzWWY1SFM4cnhRVlZ4ZEhFZ2xseHoyTDcvRmZnTEkz?=
 =?utf-8?B?NnNuVjM0SDJHUWdvUS9ueEhjTDZ6N0tyQ1BRWiswc1l4SXpNOVpYUlVvZDJp?=
 =?utf-8?B?TzRBUG9uNlpOZ3FvYTRMMjRUS3pFb0xhSlZnQnJnVlFMNGttNEEwZDQ0OHAz?=
 =?utf-8?B?YUoxRytoUHdJVllnL2d2QnlLdmpudSt0K2ROV3dVME5GV3hhRnRhaytud2hY?=
 =?utf-8?B?MXdFb1VIZUpFWXpCdXIrbjZyUGdkWXZpeUdOU0dmYzh4ZFZXVUpwcVpPUmFK?=
 =?utf-8?B?TTVBTGhtd3FERnBZZWtjdVlqc1cwQWhDU1lsWVNIKzd2cGNWdTdQb1d4ZnRs?=
 =?utf-8?B?WXo3RmxNV2h4NnFGVVF2MVZPRTh0bEt0RkxJWnZzQ1VCRWYwQnk0WnNZbE8z?=
 =?utf-8?B?bHcxZzZ5ZzRtam9sY2pKaWZEclI5STIvRG80TlY0Qms1dWx1MEIrb0d0REQ0?=
 =?utf-8?B?aW5NM3g4TVB3TmNlU3FrU3VvcXg3R05VMUF0RXZxZXVzVmc3OFhQS2w0UGN0?=
 =?utf-8?B?Y2Fnd20rSWkzY0xZRTJjQTBzL25xdnZaY1dCNDU4WWt0bGRIQXl4WWcxdHVS?=
 =?utf-8?B?MkxGdXJKWEx2SUY4WCswcFdRVWNtOEo1OWJ0STZWL0FYbTFWQU1zY01lZkVz?=
 =?utf-8?B?cWlRUUhRWnNxTUxvelplVkhwdWt4SmxzeGxid3RRcjhDNElQTElSeUpHaGhI?=
 =?utf-8?B?d0hmUmFJOEQxc09nNG52MjQxa21zYlJvMFVrUERMdjhqYmxXaThIUGQ1WnRO?=
 =?utf-8?B?TXkwUmMwZHJrMENMb010VDJSK1crOVVGZ3psWFNoekh4VlVIRndzWG5vZlNG?=
 =?utf-8?Q?GB9fV9bq2mRYa2UGEGyUXRs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39b1b8f-67e2-4a74-39db-08d999480c28
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 12:48:17.2185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Fzl57U49Pc5kcw1e2++dCiuRWwAL/u3ur6eJH8JrgpSnW5M/tJ0QAo0+eFehft3OJA369AeDAZ8YsPTXZ4dLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
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



On 2021-10-27 04:00, Pekka Paalanen wrote:
> On Tue, 26 Oct 2021 11:36:33 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-10-14 15:44, Shankar, Uma wrote:
>>>
> 

...

>> FWIW, AMD HW (depending on generation) can do these operations
>> (in this order):
>>
>> 1) 1D LUT (fixed or PWL programmable)
>> 2) simple multiplier (for scaling SDR content to HDR output)
>> 3) CTM matrix
>> 4) 1D LUT (shaper LUT to non-linearize for more effective 3D LUT transform)
>> 5) 3D LUT
>> 6) 1D LUT (for non-linear blending, or to linearize after 3D LUT)
>> 7) blending
>> 8) CTM matrix
>> 9) 1D LUT (shaper LUT like above)
>> 10) 3D LUT
>> 11) 1D LUT (generally for EOTF^-1 for display EOTF)
>>
>> Not all blocks are available on all (current and future) HW.
>>
>> I sketched a few diagrams that show how these might be used by
>> a compositor if we exposed all of these blocks and should
>> really try to add some of them to the color-and-hdr docs
>> repo.
> 
> Yes, please.
> 
> That pipeline looks pretty comprehensive.
> 
> Btw. how about YUV<->RGB conversion? Where would that matrix go? It
> needs to operate on non-linear values, while a color space conversion
> matrix needs to operate on linear color values.
> 

That is communicated via drm_framebuffer.format, and drm_plane's
color_range and color_encoding. I expect it to happen before
everything else, i.e. at step 0. It seems like any color management
implementation I've seen is always operating in RGB.

Harry

>>>>>>> +	* This can be used to perform a color space conversion like
>>>>>>> +	* BT2020 to BT709 or BT601 etc.
>>>>>>> +	* This block is generally kept after the degamma unit so that  
>>>>>>
>>>>>> Not "generally". If blocks can change places, then it becomes 
>>>>>> intractable for generic userspace to program.  
>>>>>
>>>>> Sure, will drop this wording here. But one open will still remain 
>>>>> for userspace, as to how it gets the pipeline dynamically for a respective hardware.
>>>>> Currently we have assumed that this would be the logical fixed order 
>>>>> of hardware units.  
>>>>
>>>> If we cannot model the abstract KMS pipeline as a fixed order of units 
>>>> (where each unit may exist or not), we need to take a few steps back 
>>>> here and look at what do we actually want to expose. That is a much 
>>>> bigger design problem which we are currently not even considering.  
>>>
>>> I think most of the hardware vendor platforms have this pipeline, so we can implement the properties which include all the possible hardware blocks. If certain units don't exist, the respective properties should not be exposed which will make things easier for userspace.  
>>
>> I think the color pipeline should be modeled in a way that makes
>> sense from a color science standpoint and in a way that makes sense
>> for compositor implementations. Fortunately HW design generally
>> aligns with these intentions but we should be careful to not
>> let HW design dictate KMS interfaces.
> 
> I'm so happy to hear that!
> 
> 
> Thanks,
> pq
> 

