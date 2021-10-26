Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1A43B5CB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3B89F73;
	Tue, 26 Oct 2021 15:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE3E6E45C;
 Tue, 26 Oct 2021 15:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhe6MZWw8t0e7OUlkSacoxIN5qZT4ZtMVs1/9lYLuL1CsyzL3tXH9AlBID1V69F6hfQp6i7OfFZR8PA5wiRIz6Z3FBPugpnpV5+3qkqBSK0Uz6L2/xMjQnZXBYlALtqEu2lKrHIko4wniS8ov3hLrXh5fOXYydDGjqZG94wCOKb9nuDm9swXQoNHkwqxU79/vUN9txGMv+8fyKuV/DPm4B6AqmP4At2zI800kZxuqoGEuqquUAh2eiVRKdDYUKiAmDjjuAqpCgKcZbRBfYvgos9ID1dYZKcgwa/Dp/Y0DNDEL+lgbud5m8knL/nOqn4Bp+Q9epaSWnQAu6F3VrkunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrEXVnLGEeWHCyy0SFNwpS9ca5vxfvtdELh1r8E5M50=;
 b=OP7IQI8JU4PjG+DJmyNZnSv7dQ/u2o1Ci8/v0jzPehUmepuQ/frgOH0FO16ucciMfEJrVYBya5Hzt40XvZ5WCg/HBXvwEK4KFcPU257S0NC6MIehO/ZuFNmAAAam1n+C2tahblFqu+PYefRId8qAHws/dz9gY9BqHyiyiSfobAV4M/4vMCBD+oiYSFgBzZs2JumaB1WDPmL2XKXnP8w6SMH1gy1MV7BCZJCAq5Wv/+ptidlfE/qAkFyydSoJX4zrzR0N0FHtrnLwjFL7Xd1TU5WW4ypaImY5FJnCxfma7YAoJ1pdRYcovyq4n2TbVxeITrChMhnfiXNG8FYIsvQbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrEXVnLGEeWHCyy0SFNwpS9ca5vxfvtdELh1r8E5M50=;
 b=xhGvxJkXYnTGtz9eqJ5MPuW2mycRoJjYo88BV7F1kt1uw41HH6MVKTIrHKE2doQtvwhdWR+xSSyxekDKHuhJR86TxakcgP+pzkxDAo3IRe5juzhGnIn/j7ykEFs6vYQHrxOXiO4ZXHFvtqxGVOu1E7Su8PgZwnkH+d7ZBgKIPrc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:40:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 15:40:29 +0000
Message-ID: <79e7f945-8df3-1fae-39ff-06d993e4fe29@amd.com>
Date: Tue, 26 Oct 2021 11:40:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 15:40:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e44f991b-89ba-499d-bf66-08d99896f025
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-Microsoft-Antispam-PRVS: <CO6PR12MB539638E3D026F098E462CEEC8C849@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5vEb11KC6k0I2HIT+mqVAVF74ajI1gtkCQOfYGk1FTkZyqOyqs+KrYptmN7ClWS73urSPLrr43ArNNL94dQupAZKnuh90s6WdOGysYHIQ0jdvsN0QtCLRUupWGELTW5S/9Dv4+tYb+7mZQfruNNXnv5iB+kRILUqrzqvDNdJdDpyj/A+4PPFIgFB9oqnsnxBg63nuRvnTwKvQtUkA0LjrIkaXakAlLltYRVJj7M3MNwYulSmGRFyGqkjIRNJ+YxXKa6SqKs7dP6v6M6O8pi0mQFJZD9i4B+n1RWzHwX28MUGnmSZLGpsfTGjGDHYxjeq9Sk9YScGsus8L9MMFdtapbVC5rx6YVxOt8kCSkjLUngPizeM6qzwMZo0l5mz38ULwr+t22h7LAv1pQPNV0bW9SgYXsaQlt78y/u3rqoYpw+tPcqeZ+O3tOYHfGbL2OIQHcR9vxQz8sKtqa6UXTxr6sHU79J7TKSii9ORwXxMIMjQGimMFdYx9wzDl75lppZqSd3hXkoNDDGBWqs4fbSRhkQvvSO19yQkvmminMi8PU6K55zPCJ5Zaxklggu4DJC+up4Y5ZxE5dKuU8lcat8kMbNI0jrqPzQnnwrZU0J2+6R/v7NeeU0lXKufzWLdp93LdjMCF+mc/KzztoBOjeuKNW12CpAFBS7/KLuNG0yck3MmzsLMblNu8XaGt4fRFBoE0wvOTcT1d5JXqPRNGXLs94BSxaka9i/oPQM2AH5DqZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(83380400001)(36756003)(8676002)(53546011)(8936002)(31696002)(4326008)(316002)(186003)(66946007)(956004)(16576012)(44832011)(38100700002)(31686004)(86362001)(6486002)(66556008)(4001150100001)(508600001)(26005)(54906003)(110136005)(5660300002)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVA2VzFSdnBpU2JFUVhQK3l6N2ZuamZNZldIcDNNdkE5bmRBOUhDYjcybHRV?=
 =?utf-8?B?RWhCeGMreG1zQkk1UHh1allnKzcyL2JwZk9rSVlBT09qSWtzSW5PSU9Dalgw?=
 =?utf-8?B?Y2k1YzJ4d3EvUXA0bWxNNy85dmkyMDI1QlppTmhHZHhVSHFBWG9RRDZvZzI1?=
 =?utf-8?B?RUZKcmhBOGM3ZVJ0bGIvTCsrTUtWaWJxOFZReTh3UUcrQkVCWElsbkl4dEhz?=
 =?utf-8?B?UDhJWDBRTXBjNkxoZDVZVm1IODJZT0JoamIySWJ5YlRjdlkwMDA2Y24wZmx4?=
 =?utf-8?B?SXRPek5kRjBFMVFaUm5xcFM1TEZ5MEI0Y2JlYm85VjErMDVFbUlod2pTQmZU?=
 =?utf-8?B?NXF4QkU5VVVVRGRhUVREWklRSFJ0aWowUzV4SURLQUIzR2EyRHduVndhTlVF?=
 =?utf-8?B?ZnVDMGh0OVhlMWFSc1JSdkI0NTVDbWwxU05OdW5nUUQ2TWNSUTJkVmhkMDYz?=
 =?utf-8?B?R3ZTYjUxbUtjY0xQOWQ2Tk9yRHhDNVphK3I2VE5DMlR5cWNuQzdNNnZrMkpV?=
 =?utf-8?B?dFl6c210VUFoS3pVNE1rL0dya3RDNjF3VWtMejM1ek9hYkh2a1V6NS9tZWta?=
 =?utf-8?B?eUVnNkFFUFpwVE9zeWk4Wk9yQVBHSnhUQnJ0VEcvSHlTQjhQNjdkWFAvME84?=
 =?utf-8?B?TzhwVTdMZDIyVGRoUzZ5cWNtbEpGVk5QM2pUc1NLd1h0eEJRa2VQbER3aWhz?=
 =?utf-8?B?Q3lJOGpmWmM3Y0N0SlV0UFNHbXdCWmcvTThaa3NoN1pIMldEaEhtMTJlVHBD?=
 =?utf-8?B?RW9TckpvbEc3N0pOZXdVcktwdGtWVkFIZWh6RUR6UGdWd2hocno0VmI5aUg2?=
 =?utf-8?B?WGhWK2t5R2FCVk9oOWNHTmJlODZHRlZseSs5alZqTXB3NDVvYmNpa3JVN1JE?=
 =?utf-8?B?REZFUUdWYVdoZlo1NUtRVlF3NXk1bGtFMEtNVEgzaU41U0xKRng3V3p3N1Fi?=
 =?utf-8?B?aHEwZlhwZWhvMW0vc2YwKzA5a25jUTlpUXlwT2NiRm9qWjNTSXZRRkZNOVBi?=
 =?utf-8?B?K3F2UDdsMStJa2RBbUdWSkVUeVAwejNBSXpwUFM1djhjbkhvSlNhV1lmemdF?=
 =?utf-8?B?L0NDcTEvZDJXY21EVnJWRm5tOXV5eVRROGwyVVJkT2ExRVJPeGEzd1ovUm9C?=
 =?utf-8?B?Wld3QXVVWG5GZWxRS2EyOUp0U2o0VFF3ekhKQ0Y3WWlRcUxUNW5zMVdkRVNo?=
 =?utf-8?B?TW9EZ0p4QWM3QmplSVE5Y1ZNZmhUK0krVGNsTW9kc0FZMUdQTjJNNnpjTnBo?=
 =?utf-8?B?V2xjbjFjSkJYM0JkTzB5NkFFbDVDdEk3MWc1dTA4SXF5VkVud0dsaHk0ME9m?=
 =?utf-8?B?R04vL05PU1NhbVN3ZHR0SWV2RHFQWjRJc3BvZXZJMDlENmhsM2d6NXpXUTBn?=
 =?utf-8?B?SjI4dEhvUm9LOFluS0NaYTB2U2FaUzNkbk8vV29BT1BuUFNBNG5JakptUkgx?=
 =?utf-8?B?UE9CRXZIdFBUcStjV0duNytjdm4vbkMzNW0xNDB3N3d1RzIrVzd2TjY2VW9X?=
 =?utf-8?B?U1BZVFR5NHhVUW50LzBPRTNyUlkvS1YxdVYyQ3o5TEJuQWpHemRQNTIydUVI?=
 =?utf-8?B?RTh3b1VBQXFlOVdBSmNaS25EWkZwais2K1BvOTUvUVF6ZG1XWWZsYWp3dXdQ?=
 =?utf-8?B?S2t0cmMrVmF1blB6ZGVEd25GSWhOdW1kZXBlVW5TK1hXTEthdkJGdkErOXZX?=
 =?utf-8?B?VkxEaWhQbzBSTWdNQ1pUek9HMGYrc2c1L1NFY3pjQmhOUUVjd21ublIvckJL?=
 =?utf-8?B?aEZSZ1llYlpac1hkcUp5YmlRdE81ckxCUjdrNnBlT3dsQ085N3lJWnVZN0Rz?=
 =?utf-8?B?MWJ3V1cyVWdQeGJZS044WE4rdEZKVnpiNnZLWUFhY1FSaHBGUXBERmUzRXMz?=
 =?utf-8?B?dGl6M2lYV2Q3V2FwYmtiRDdWSE1sWTIvVnZxSDNmRVVweHdDdWV2bXgvZTE1?=
 =?utf-8?B?QXdlOTVpVStVc0hpMWFPRVUwSWphandKTVhIZ3RHS1JWaDFmRmphMTVWU2Qy?=
 =?utf-8?B?MlJPYVd2eVphdEpzRldKdXJ3WUg0Q3F5QWZsZU5TRjZOc2M1ck1Na0lOdVlv?=
 =?utf-8?B?QjNmejd5OGh1SEZxSWQ2SDNSTVpsWjRxRUJlWUxxaW1CS0xDZmkrNkV3SDB5?=
 =?utf-8?B?N2RxZElCOVc3SFRqazh4TThCV0Fvdmo5UVBaRXF2SzRiWUVvbk1QZGd1UjdU?=
 =?utf-8?Q?lV7MWHb03kiuvh/LGbKAGkw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44f991b-89ba-499d-bf66-08d99896f025
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:40:29.2920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdZvPXLbKA+ndaDkKPj60taqtyocnReYPDRIK71bajvH9FBxwTMqib+aMFc/xhEKI4vhwckujjv+9aHvwtg4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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



On 2021-10-12 16:58, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Pekka Paalanen <ppaalanen@gmail.com>
>> Sent: Tuesday, October 12, 2021 4:01 PM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>> harry.wentland@amd.com; ville.syrjala@linux.intel.com; 
>> brian.starkey@arm.com; sebastian@sebastianwick.net; 
>> Shashank.Sharma@amd.com
>> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
>>
>> On Tue,  7 Sep 2021 03:08:43 +0530
>> Uma Shankar <uma.shankar@intel.com> wrote:
>>

snip

>>> +
>>> +
>>> +This patch series adds properties for plane color features. It adds 
>>> +properties for degamma used to linearize data and CSC used for 
>>> +gamut conversion. It also includes Gamma support used to again 
>>> +non-linearize data as per panel supported color space. These can be 
>>> +utilize by user space to convert planes from one format to another, 
>>> +one color space to another etc.
>>
>> FWIW, this is exactly the structure I have assumed in the Weston CM&HDR work.
> 
> This is great to hear that we are aligned wrt how the pipeline should work.
> 
> Thanks Pekka for taking time out and providing the feedback.
> 
> @harry.wentland@amd.com We can work together and build our design to accommodate
> both Intel and AMD's hardware needs. This will also make things generic enough for any
> other hardware vendor as well.
> 

Definitely. I think we're on the right path. Personally I would like to
arrive at a solid KMS definition for this by the time Weston guys
get to the HDR enablement with SW composition so we can start looking
at KMS offloading for HDR planes as next step.

Harry

> Thanks & Regards,
> Uma Shankar
> 
>>> +
>>> +Userspace can take smart blending decisions and utilize these 
>>> +hardware supported plane color features to get accurate color 
>>> +profile. The same can help in consistent color quality from source 
>>> +to panel taking advantage of advanced color features in hardware.
>>> +
>>> +These patches add the property interfaces and enable helper functions.
>>> +This series adds Intel's XE_LPD hw specific plane gamma feature. We 
>>> +can build up and add other platform/hardware specific 
>>> +implementation on top of this series.
>>> +
>>> +Credits: Special mention and credits to Ville Syrjala for coming up 
>>> +with a design for this feature and inputs. This series is based on 
>>> +his original design and idea.
>>
>>
>> Thanks,
>> pq

