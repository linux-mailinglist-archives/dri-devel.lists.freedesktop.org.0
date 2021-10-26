Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C77D43B5B0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCFA6E0B9;
	Tue, 26 Oct 2021 15:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5826E0B9;
 Tue, 26 Oct 2021 15:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/AjDmmDrOFKDJ2xyB5RKjcPS+/Bvbrh39M3EBzc3xSIBby3mx1FstPaF2jvPFSpzjy3129d9jaHd9rTvSE5xo5GFr+WhzJP6ir/vecRVUVvOo3be0tbuvZ49W+fcrbDsBI3zRBNFmGA7bTjiKP2JuuhX1zYNhPgkFP+A6I1AkeTG9JX0FHdXGhKoySghFzE4E6z9LXw0GNJuigcnnGh6oHfNweH9ruQ3MqE73Q8fq2tS6TnNIPiKueSU8oV6/7v+F6Zcm+CsNS28fTdqxt20iib2AReY5x1Yll80aF1v3Sxm5wCJOzo9TZ4VVVJwWs0CtUH8+9Nc3udO2Mkz3DVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3OYqO4koS69R95tB1w4Z6Do4B1wm/QagDBy/JB4vqI=;
 b=df9Be9ZUsse3EVAnxXZf81a7rer9ZcTSVko43ZowLo9UkF7MV2hlb5C6Sc76SMw1B5WhEBrLnQS7ITFVarf0Z+t0S5sLKZ+6IAFoaarV2oyEqROIzlkt2KJ8DCxD10ImEGjnn7PM+GB4DUX1jIGZu8CjQPvG5K9887JdS4xHECBHqI9bPzzdHyiAXkzf7iBZg7GLQukzdLi0RkLBr/jMrkY83vUMJBQhVIPDwOONlxrxySDURL51d0HNiVPizgZBnP1sSrQoURTmbUTzygVgblmWZ9uvUZy9TCcbD2Pv06zfGlTYmFSlvf49+iiNwu2hljjYNFmlPUCcNWnblVpVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3OYqO4koS69R95tB1w4Z6Do4B1wm/QagDBy/JB4vqI=;
 b=FRJn10pR1dOj+lmMcGfSoHHhoXJ6DrjgA3fePGrMDs48RBHcAK8h81Gn2gD0Ucg9+ec5RJz4THZokBTEjZsPrT91MOak2ryw+jzWuwY3LpXN+ISyAqDKNYWizUX/2JiowIFrZbbcQdzjiauRQ2mu3hgOYXrLk+G4QAuzvMcTMCE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 15:36:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 15:36:37 +0000
Message-ID: <2df20264-6800-56ec-3ec7-5a319c9c2296@amd.com>
Date: Tue, 26 Oct 2021 11:36:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
 <20211013113046.7ace2dbd@eldfell>
 <8c1d39bf5d034595aafd8937df259547@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <8c1d39bf5d034595aafd8937df259547@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0204.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0204.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:67::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Tue, 26 Oct 2021 15:36:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e74e510-a756-40e0-16ed-08d9989665ed
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54916B590F2663A8A171EF9D8C849@CO6PR12MB5491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLC5lZ1LM2R1hdR9sw0uxmTQIYJEwbyfik03rEKlHExfBN/JrwOfXhh7rhqcm0mtEoW0S79Yky6/XZt53mtpU9ADNuMUrAudOxiozxTpzKd5de9Xrdwc8n3t1/3ktT4LbkOxF8xQaWil6OQg3exNpyZq6F3ZX44Vbwr05Z00XBpZand6FmlPVtiHhMawja7Qz3ygdAZFo9FhHEM0YJ74EmwvjhllA1bo5HH3vfkM8IllXNXv5y3piJiiQdJxH4hpuLyMrZofywlHkigxWZ1nB+opeYSLoIxWFTUi7dkgh21DRAY3YmP6MNIFUp/azwjHGjWotwzlRzBlHVbDdFW0Nel33rZt8KVJmfMtxG1Isu0Lfbj1M/02654jbcEa0/zuT4dA0LsbJQL9deALwQKQnpWAeagZjpOaUr9kn2jwwxxrLCgD1UByrPDat4A9+DKyebZgQt34y4R7IwDBNARTuiUyh3ZAMb13K60AqOSa+OIg2St51XUgHTkLrC6qmroZZN3jCfdHdh5hiojVjny/RPy3U1aUj+6GW8NJ08y2egZuHWmEP31ZACRSMM/OkjyHdqb0wiOXCIb8PhncGheCo2agf/68lmh3YLeZWvv5E99xna6WUSktx+XCteNO60f5GFBdpVbP9+gc4TeYqw1sjlob/OQL3e1Z+e63+Cge4c5vq7XtjDW9P7dwfbxosKfI0vd5DXpVpav8Kz5LlPcyG1WKcL4keLz++lvYQ+DzmLlL4KGFprjxnbw+F5tXyxRt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(66476007)(66556008)(316002)(16576012)(31686004)(66946007)(54906003)(186003)(30864003)(956004)(2616005)(26005)(44832011)(6666004)(38100700002)(36756003)(86362001)(66574015)(83380400001)(31696002)(53546011)(4001150100001)(8936002)(5660300002)(8676002)(2906002)(4326008)(6486002)(966005)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0M0WGs3by9XRHhlUDdCeTFKOTc1WFk1ajh6RnJqRFg0RFRYajJvKzhOaEVQ?=
 =?utf-8?B?RTdYc2ptVmp5T1V2T2dFRzdFa1lEaW1jRXR1ZkkvYlBjSjFqYzVHOHczUXAv?=
 =?utf-8?B?Yk5JeDcycGh5ME1iV1FKaFpoRGIrbVZPekJnUEVjNmJRa2hnZXhWUFAwbi9z?=
 =?utf-8?B?TTFkNWdsdXUzV0NoOW5FdnBmVEpYMUdkbEt1cDhOSWJqMjNmRWd0a2gvUktq?=
 =?utf-8?B?bTNycytSQU1ZSlBWZVBtS3R1SFhSeUtvVGRtTEJHK3NISDJhUjJlc21LaURp?=
 =?utf-8?B?REcvZVhPV3JVSkFMaE1BSWVlaGljL0hpbFc5YU0xbVdtTGMxNmpFMWpscnJN?=
 =?utf-8?B?VGVmVWNnWHZlOFBLL3creGZndGg2VGpRUno0bUF6Yk1QSXJGOEExbTJiVjRa?=
 =?utf-8?B?QWh0cExwdG1lMUpuN0RBb0pMekZpTGw0TWVzNFhRWnc2QVJyTWtVVy92am1v?=
 =?utf-8?B?SFgyZHFVVE9EMkJmRC82MW8yNTNxUEdKUWUzeE43b1haOUhTTVRuZVNjZ3Na?=
 =?utf-8?B?SkpKZmNMUGpIaVZyR2h4ZUdJdUVSdjEwdVBYWGFzRFV1MjBENWl6RmZkMmVa?=
 =?utf-8?B?eHQrYjJsdXVsNjl2N3IxN2hnZ0hNRjN2enlXV1V4bDZlaGZjZDRZVXNGM0Qx?=
 =?utf-8?B?NVBackJtY09HMitqZitIMGVQNFVMNXpsNGVaOFI2QldJazgyV0ZiZWdXY1FZ?=
 =?utf-8?B?b1c5VTVjcUhOaEJMYjZkTllpWEtJVGhobHcyaVNnMFc5MDRCaVJudC9LTXhm?=
 =?utf-8?B?N05DQm9Yb2FidElTYXVKbUxpMWlpWWlQdFViODFGTnBWcEZ6OGxTRDlZNy94?=
 =?utf-8?B?aE12Ulc1c05YY0VxWnp2dkpPMStNbVI5UEVHTll6aVU5b0xyVkFXMVFwdVEz?=
 =?utf-8?B?Y0NhMm42UWJURUxUM0VJUzU4WlpFdDdxdzdKc25nT3NHdWNhUGNYVHkxTVhs?=
 =?utf-8?B?UWplM3JnL3htU3R2QS9Xb013MnBYREFjbGJmdEFyK09WVWhiRGtKZ3M2Rjdr?=
 =?utf-8?B?Y3p4YmZzbVZmcS90cnY3ZzduZk9LeUgrVkgxeFF2aC9qUmNlZzJlMFJBMUZm?=
 =?utf-8?B?bGtHWDlOUFlxM3V3YjFBV2Z2TUtnZVBXZEhLd3F2RC9OenFqRGxSOEtNemh3?=
 =?utf-8?B?ZUV1TE91WlN3am1kWHB6RjJCRW0vR01aWkcxdjNjOXhxYUJNbTJMMzFNd1kr?=
 =?utf-8?B?TWkrU3NIdUNZalRyenppS0xBMDJpdVVRRnJXcWo0c1ZmN3VSR3lodzZuWEZp?=
 =?utf-8?B?a3l6NnRqaElubVY0K004Zmc0amgwRTFHNzFibEFUY202RDJLNGZoamJWSHNH?=
 =?utf-8?B?Ky9aK1NNc3gzeVppUSt6RkJjTm9TbFhPNENRVC8zSnduYTRwZ3ZMVjNMTWMv?=
 =?utf-8?B?M3BYUk9kVktXWVMyS251ZmNNTWJTSDByVkR5VTdtMDlwUXFKR1hEQ1pqZXFz?=
 =?utf-8?B?QTNXNGE4RFlFVWdGM0lyN085TFlsVXdiRG5YSVZ2QXJaZDhVaFQ4NlJEbS82?=
 =?utf-8?B?NGZMS21hRDZEZ3VoSnFmODNxYmNkTm5rYzEwMmU2a204NTV1QUgxb2haNWxH?=
 =?utf-8?B?UHJTUzkrckl0bEgrNWx3d1dUV1V6N0kxYjZuUDlkaVkreU16cks5c043MWQ2?=
 =?utf-8?B?aHI3Mncyb3hxQXJtemdpWG5VYk1qOXFKN2ZYQmJXS1RzZHlWajN3K0NvRTZ0?=
 =?utf-8?B?UzVOMy90MGJrbEIwVjZLUWFuYmVJMnFBdXg5bXNEdEgzaUlPVW4zZ1NzWmdG?=
 =?utf-8?B?bWwvVmozQ1BtZXFiQVhoQkkvdjNlNVluY0ZVWGk2YlJBdkx5ZXhKVW9tQ0lJ?=
 =?utf-8?B?YzRQU01OckkyckMwTER3Y0ZCRkk0YWlXZGI2TDBGUWVIUUNIWU40UDR3WVIz?=
 =?utf-8?B?dEdMUXN3R3ErWUhrWENJN0RVMm9mK05SWnRUYk5uazBCTHRxZFcrYnBuQVF5?=
 =?utf-8?B?c3JITzdwVDFYazRiL1VnMXBUbXVaUmJxY3hCQUtHcjI0VURnbWpPR09yc3Zk?=
 =?utf-8?B?d0F1OU5OUEhld0N3YktrdEV5b1dDdXBycitHSHBpYm1QYVUrc2NlOWlVbjJt?=
 =?utf-8?B?ZEFyc0ZhaFR4a01WU3lNbWlhcVZjcWtNZVVWR3lZbjliRG1lZ0ZIdGhvQmhp?=
 =?utf-8?B?c2V2MTdKenBrUTBMK00zb2R5UEhWNlVmUjh5d3ZrU1FUVVRyZit1STRwOXZH?=
 =?utf-8?Q?QPJ7GXymCyQLiKhlZ0RZ7iE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e74e510-a756-40e0-16ed-08d9989665ed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:36:37.4200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIgzBcT5U6lFF/DJet24TFIy1qwLQP6THOyiz1o86t4tQ1NlW1h7ETs1h+m/ilAFp4UG6PDaAJIGSra/hbDh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
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



On 2021-10-14 15:44, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Pekka Paalanen <ppaalanen@gmail.com>
>> Sent: Wednesday, October 13, 2021 2:01 PM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: harry.wentland@amd.com; ville.syrjala@linux.intel.com; intel- 
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>> brian.starkey@arm.com; sebastian@sebastianwick.net; 
>> Shashank.Sharma@amd.com
>> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
>>
>> On Tue, 12 Oct 2021 20:58:27 +0000
>> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>>
>>>> -----Original Message-----
>>>> From: Pekka Paalanen <ppaalanen@gmail.com>
>>>> Sent: Tuesday, October 12, 2021 4:01 PM
>>>> To: Shankar, Uma <uma.shankar@intel.com>
>>>> Cc: intel-gfx@lists.freedesktop.org; 
>>>> dri-devel@lists.freedesktop.org; harry.wentland@amd.com; 
>>>> ville.syrjala@linux.intel.com; brian.starkey@arm.com; 
>>>> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
>>>> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware 
>>>> Pipeline
>>>>
>>>> On Tue,  7 Sep 2021 03:08:43 +0530 Uma Shankar 
>>>> <uma.shankar@intel.com> wrote:
>>>>
>>>>> This is a RFC proposal for plane color hardware blocks.
>>>>> It exposes the property interface to userspace and calls out the 
>>>>> details or interfaces created and the intended purpose.
>>>>>
>>>>> Credits: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>> ---
>>>>>  Documentation/gpu/rfc/drm_color_pipeline.rst | 167
>>>>> +++++++++++++++++++
>>>>>  1 file changed, 167 insertions(+)  create mode 100644 
>>>>> Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>> b/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>> new file mode 100644
>>>>> index 000000000000..0d1ca858783b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
>>>>> @@ -0,0 +1,167 @@
>>>>> +==================================================
>>>>> +Display Color Pipeline: Proposed DRM Properties
>>
>> ...
>>
>>>>> +Proposal is to have below properties for a plane:
>>>>> +
>>>>> +* Plane Degamma or Pre-Curve:
>>>>> +	* This will be used to linearize the input framebuffer data.
>>>>> +	* It will apply the reverse of the color transfer function.
>>>>> +	* It can be a degamma curve or OETF for HDR.
>>>>
>>>> As you want to produce light-linear values, you use EOTF or inverse OETF.
>>>>
>>>> The term OETF has a built-in assumption that that happens in a camera:
>>>> it takes in light and produces and electrical signal. Lately I 
>>>> have personally started talking about non-linear encoding of color 
>>>> values, since EOTF is often associated with displays if nothing 
>>>> else is said (taking
>> in an electrical signal and producing light).
>>>>
>>>> So this would be decoding the color values into light-linear color 
>>>> values. That is what an EOTF does, yes, but I feel there is a 
>>>> nuanced difference. A piece of equipment implements an EOTF by 
>>>> turning an electrical signal into light, hence EOTF often refers 
>>>> to specific equipment. You could talk about content EOTF to denote 
>>>> content value encoding, as opposed to output or display EOTF, but 
>>>> that might be confusing if you look at e.g. the diagrams in
>>>> BT.2100: is it the EOTF
>> or is it the inverse OETF? Is the (inverse?) OOTF included?
>>>>
>>>> So I try to side-step those questions by talking about encoding.
>>>
>>> The idea here is that frame buffer presented to display plane engine 
>>> will be non-
>> linear.
>>> So output of a media decode should result in content with EOTF applied.
>>
>> Hi,
>>
>> sure, but the question is: which EOTF. There can be many different 
>> things called "EOTF" in a single pipeline, and then it's up to the 
>> document writer to make the difference between them. Comparing two 
>> documents with different conventions causes a lot of confusion in my 
>> personal experience, so it is good to define the concepts more carefully.
> 
> Hi Pekka,
> I think you have given some nice inputs to really deep dive and document here.
> Will update this with the right expectations wrt what transfer functions to be used at various stages in the operation pipeline.
> 
>>> So output of a media decode should result in content with EOTF applied.
>>
>> I suspect you have it backwards. Media decode produces electrical
>> (non-linear) pixel color values. If EOTF was applied, they would be 
>> linear instead (and require more memory to achieve the same visual precision).
>>
>> If you want to put it this way, you could say "with inverse EOTF 
>> applied", but that might be slightly confusing because it is already 
>> baked in to the video, it's not something a media decoder has to 
>> specifically apply, I think. However, the (inverse) EOTF in this case is the content EOTF, not the display EOTF.
>>
>> If content and display EOTF differ, then one must apply first content 
>> EOTF and then inverse display EOTF to get values that are correctly 
>> encoded for the display. (This is necessary but not sufficient in
>> general.) Mind, that this is not an OOTF nor an artistic adjustment, 
>> this is purely a value encoding conversion.
>>
> 0
> 
> Got it, thanks for correcting. Will also do some more study around this and update.
> 
>>> Playback transfer function (EOTF): inverse OETF plus rendering intent gamma.
>>
>> Does "rendering intent gamma" refer to artistic adjustments, not OOTF?
>> ]
> 
> This ideally should be OOTF adjustments here.
> 
>> cf. BT.2100 Annex 1, "The relationship between the OETF, the EOTF and 
>> the OOTF", although I find those diagrams somewhat confusing still. It 
>> does not seem to clearly account for transmission non-linear encoding being different from the display EOTF.
>>
>> Different documents use OOTF to refer to different things. Then there 
>> is also the fundamental difference between PQ and HLG systems, where 
>> OOTF is by definition in different places of the camera-transmission-display pipeline.
> 
> Agree this is a bit confusing, I admit I was much more confused than what you were for sure.
> Will do some research to get my understanding in place. Thanks for all the inputs.
> 
>>>
>>> To make it linear, we should apply the OETF. Confusion is whether 
>>> OETF is equivalent to inverse EOTF, we could check this one out to confirm.
>>
>> OETF does not make anything linear. By definition, OETF converts 
>> optical (linear) values into electrical (practically always non-linearly encoded) values.
>>
>> Yes, EOTF is almost always not equal to inverse OETF because of the 
>> existence of OOTF. The applies to inverse EOTF vs. OETF as well.
>>
>> From what I have learned, it is unexpected to assume that inverse of 
>> one is the other. That will cause confusion. Therefore, if you mean 
>> the inverse, spell it out as inverse. I used to make this same 
>> mistake, and some of it may still be left in https://gitlab.freedesktop.org/pq/color-and-hdr .
> 
> Got it.
> 
>>>
>>> Here since the values for the pre-curve (or degamma as we have 
>>> called it in past), accepts programmable lut values which makes it 
>>> flexible enough to
>> accommodate any values.
>>> This will hold for HDR as well as traditional gamma encoded SRGB data as well.
>>
>> Yes.
>>
>>>>> +	* This linear data can be further acted on by the following
>>>>> +	* color hardware blocks in the display hardware pipeline
>>>>
>>>> I think this and the above description ties the intended use down 
>>>> too much. This is one possible way to use degamma, yes, but there 
>>>> may be others. Particularly if CTM can be replaced with a 3D LUT, 
>>>> then the degamma is more likely a shaper (non-linear adjustment to 
>>>> 3D LUT tap
>> positions).
>>>
>>> Yeah agree, this is just one of the usecases. Its just a lut table 
>>> which can be used for other purposes as well and is not just limited 
>>> to a
>> linearization operation. I will update this.
>>>
>>>> I would prefer the name pre-curve to underline that this can be 
>>>> whatever one wants it to be, but I understand that people may be 
>>>> more familiar
>> with the name degamma.
>>>
>>> I feel pre-curve should be fine but yeah it deviates from naming of 
>>> legacy crtc/pipe
>> color properties.
>>> May be we can stay with legacy naming with more documentation to 
>>> have its
>> usecases clearly called out.
>>
>> That is fine by me.
>>
>>>>> +
>>>>> +UAPI Name: PLANE_DEGAMMA_MODE
>>>>> +Description: Enum property with values as blob_id's which 
>>>>> +advertizes
>>>>> the
>>>>
>>>> Is enum with blob id values even a thing?
>>>
>>> Yeah we could have. This is a dynamic enum created with blobs. Each 
>>> entry contains the data structure to extract the full color 
>>> capabilities of the hardware. It’s a very interesting play with 
>>> blobs (@ville.syrjala@linux.intel.com brainchild)
>>
>> Yes, I think I can imagine how that works. The blobs are created 
>> immutable, unable to change once the plane has been advertised to 
>> userspace, because their IDs are used as enum values. But that is ok, 
>> because the blob describes capabilities that cannot change during the 
>> device's lifetime... or can they? What if you would want to extend the 
>> blob format, do you need a KMS client cap to change the format which 
>> would be impossible because you can't change an enum definition after it has been installed so you cannot swap the blob to a new one?
>>
>> This also relies on enums being identified by their string names, 
>> because the numerical value is not a constant but a blob ID and gets 
>> determined when the immutable blob is created.
>>
>> Did I understand correctly?
> 
> Yes that’s right. We are not expecting these structures to change as they represent the platforms capabilities.
> 
>> As a userspace developer, I can totally work with that.
>>
>>>>> +	    possible degamma modes and lut ranges supported by the platform.
>>>>> +	    This  allows userspace to query and get the plane degamma color
>>>>> +	    caps and choose the appropriate degamma mode and create lut values
>>>>> +	    accordingly.
>>>>
>>>> I agree that some sort of "mode" switch is necessary, and 
>>>> advertisement of capabilities as well.
>>>>
>>>
>>> This enum with blob id's is an interesting way to advertise segmented lut tables.
>>>
>>>>> +
>>>>> +UAPI Name: PLANE_DEGAMMA_LUT
>>>>> +Description: Blob property which allows a userspace to provide LUT values
>>>>> +	     to apply degamma curve using the h/w plane degamma processing
>>>>> +	     engine, thereby making the content as linear for further color
>>>>> +	     processing. Userspace gets the size of LUT and precision etc
>>>>> +	     from PLANE_DEGAMA_MODE_PROPERTY
>>>>
>>>> So all degamma modes will always be some kind of LUT? That may be 
>>>> a bit restrictive, as I understand AMD may have predefined or 
>>>> parameterised curves that are not LUTs. So there should be room 
>>>> for an arbitrary structure of parameters, which can be passed in 
>>>> as a blob id, and the contents defined by the degamma mode.
>>>
>>> For Intel's hardware these are luts but yeah AMD hardware seems to 
>>> have these as fixed function units. We should think of a way to have 
>>> this option as well in the UAPI. We could extend the DEGAMMA_MODE 
>>> property to have all the info, and DEGAMMA_LUT_PROPERTY may not be 
>>> needed based on some of the attributes passed via DEGAMMA_MODE. This 
>>> can be
>> one way to have room for both.
>>> @harry.wentland@amd.com thoughts ?
>>
>> Yeah, though I don't think you can use DEGAMMA_MODE property to pass 
>> parameters to fixed-function curves. The parameters need another 
>> property. Would be natural to use the other property for LUT data when mode it set to LUT.
>>
>> A trivial and made-up example of a parameterised fixed-function curve 
>> is pow(x, gamma), where gamma is the parameter.
> 
> We can maybe have a parallel property as well with proper documentation if this helps with flexibility for varying hardware vendors. UAPI document will list what to use and when.
> May be platform will not even list the other one which may make things less complicated to userspace.
> 
>>>>
>>>> LUT size, precision, and other details of each degamma mode would 
>>>> be good to expose somehow. I kind of expected those would have 
>>>> been exposed through the above mentioned "enum with blob id 
>>>> values" where each blob content structure is defined by the respective enum value.
>>>
>>> Yes, you are spot on here.
>>>
>>>>> +
>>>>> +* Plane CTM
>>>>> +	* This is a Property to program the color transformation matrix.
>>>>
>>>> No mode property here? Is there any hardware with something else 
>>>> than a matrix at this point?
>>>
>>> Not that I am aware of.
>>>
>>>> Should we assume there will be hardware with something else, and 
>>>> have a CSC mode property with only a single enum value defined so far:
>>>> "matrix"? Or do we say PLANE_CTM is a matrix and if you have 
>>>> something else in hardware, then invent a new property for it?
>>>
>>> I think this should be good as we have this for crtc with no one complaining.
>>> There may be hardware with fixed function operation for the CSC but 
>>> then its not a matrix and it would be pretty hardware dependent, so 
>>> we can leave that from a generic UAPI.
>>
>> Ok. And if that eventually turns out to be a mistake, it's easy to 
>> invent more properties.
> 
> I feel that is what would be required. This is just another instance of what we have at crtc level.
> 

Would a userspace client ever want to use both CTM and 3D LUT?

We could add a mode property to CTM to allow for a CTM or 3D LUT or
we could add new properties for 3D LUT support.

3D LUT might come with shaper 1D LUTs that can be programmed in
conjunction with the 3D LUT. 3D LUTs operating in non-linear
space require less precision than 3D LUTs operating in linear
space, hence the 1D LUT can be used to non-linearize the
pixel data for 3D LUT operation.

FWIW, AMD HW (depending on generation) can do these operations
(in this order):

1) 1D LUT (fixed or PWL programmable)
2) simple multiplier (for scaling SDR content to HDR output)
3) CTM matrix
4) 1D LUT (shaper LUT to non-linearize for more effective 3D LUT transform)
5) 3D LUT
6) 1D LUT (for non-linear blending, or to linearize after 3D LUT)
7) blending
8) CTM matrix
9) 1D LUT (shaper LUT like above)
10) 3D LUT
11) 1D LUT (generally for EOTF^-1 for display EOTF)

Not all blocks are available on all (current and future) HW.

I sketched a few diagrams that show how these might be used by
a compositor if we exposed all of these blocks and should
really try to add some of them to the color-and-hdr docs
repo.


>>>>> +	* This can be used to perform a color space conversion like
>>>>> +	* BT2020 to BT709 or BT601 etc.
>>>>> +	* This block is generally kept after the degamma unit so that
>>>>
>>>> Not "generally". If blocks can change places, then it becomes 
>>>> intractable for generic userspace to program.
>>>
>>> Sure, will drop this wording here. But one open will still remain 
>>> for userspace, as to how it gets the pipeline dynamically for a respective hardware.
>>> Currently we have assumed that this would be the logical fixed order 
>>> of hardware units.
>>
>> If we cannot model the abstract KMS pipeline as a fixed order of units 
>> (where each unit may exist or not), we need to take a few steps back 
>> here and look at what do we actually want to expose. That is a much 
>> bigger design problem which we are currently not even considering.
> 
> I think most of the hardware vendor platforms have this pipeline, so we can implement the properties which include all the possible hardware blocks. If certain units don't exist, the respective properties should not be exposed which will make things easier for userspace.

I think the color pipeline should be modeled in a way that makes
sense from a color science standpoint and in a way that makes sense
for compositor implementations. Fortunately HW design generally
aligns with these intentions but we should be careful to not
let HW design dictate KMS interfaces.

Harry

> 
>>>>> +	* linear data can be fed to it for conversion.
>>>>> +
>>>>> +UAPI Name: PLANE_CTM
>>>>> +Description: Blob property which allows a userspace to provide 
>>>>> +CTM
>> coefficients
>>>>> +	     to do color space conversion or any other enhancement by doing a
>>>>> +	     matrix multiplication using the h/w CTM processing engine
>>>>> +
>>>>
>>>> Speaking of color space conversions, we should probably define 
>>>> what happens to out-of-range color values. Converting color into 
>>>> smaller gamut or smaller dynamic range always has the risk of 
>>>> ending up with out-of-range values. I suppose those get simply 
>>>> clipped independently on each
>> color channel, right?
>>>
>>> We have standard matrix to convert colorspaces. This is just the 
>>> property of the colorspace, I guess clipping will be the only option 
>>> here (irrespective of hardware)
>>>
>>>> Such clipping can change hue, so userspace would be better avoid 
>>>> triggering clipping at all, but we still need to know what would 
>>>> happen with out-
>> of-range values.
>>>>
>>>> We would also need to know when clipping will happen. If FP16
>>>> (half-float) FB produces out-of-range values and degamma stage is 
>>>> not used, will the CTM see original or clipped values? Or is that 
>>>> something we have to define as hardware-specific?
>>>>
>>>> Generic userspace will try hard to avoid triggering 
>>>> hardware-specific behaviour, so you can expect such behaviour to go unused.
>>>
>>> Here hardware should just operate on the matrix values programmed.
>>> This should be the limitation of the color space conversion 
>>> operation and hardware may not have any role to play apart from just 
>>> honoring the matrix values and producing the resultant output.
>>
>> I'm not talking about the matrix values. I'm talking about the values 
>> originating from the FB, are they clipped or not, before being processed by the matrix?
>>
>> Userspace could want to use the matrix to bring out-of-range FB values 
>> into range, but that plan cannot work if the FB values get clipped already before the matrix.
>>
>> I referred to FP16 format explicitly because that format can express 
>> values outside of the usual [0.0, 1.0] range in a framebuffer.
>>
>> Of course, the matrix values themselves have some limits too, and 
>> userspace should somehow be aware of them.
> 
> AFAIK, the values will not be clipped before being submitted to CSC blocks.
> But this can be confirmed to not leave any misconception here.
> 
>>>
>>>>> +* Plane Gamma or Post-Curve
>>>>> +	* This can be used to perform 2 operations:
>>>>> +		* non-lineralize the framebuffer data. Can be used for
>>>>> +		* non linear blending. It can be a gamma curve or EOTF
>>>>> +		* for HDR.
>>>>> +		* Perform Tone Mapping operation. This is an operation
>>>>> +		* done when blending is done with HDR and SDR content.
>>>>
>>>> I like this wording better than the wording for pre-curve: "can", 
>>>> not "will". It leaves room for creative use of this processing block.
>>>
>>> Ok thanks, will update pre-curve section as well.
>>>
>>>>
>>>> Tone-mapping is needed always when dynamic range differs, so also 
>>>> for HDR to HDR, not just SDR to/from HDR.
>>>
>>> Yes correct, will update.
>>>
>>>>> +
>>>>> +UAPI Name: PLANE_GAMMA_MODE
>>>>> +Description: Enum property with values as blob_id's which advertizes the
>>>>> +	    possible gamma modes and lut ranges supported by the platform.
>>>>> +	    This  allows userspace to query and get the plane gamma color
>>>>> +	    caps and choose the appropriate gamma mode and create lut values
>>>>> +	    accordingly.
>>>>> +
>>>>> +UAPI Name: PLANE_GAMMA_LUT
>>>>> +Description: Blob property which allows a userspace to provide LUT values
>>>>> +	     to apply gamma curve or perform tone mapping using the h/w plane
>>>>> +	     gamma processing engine, thereby making the content as linear
>>>>> +	     for further color processing. Userspace gets the size of LUT and
>>>>> +	     precision etc from PLANE_GAMA_MODE_PROPERTY
>>>>
>>>> The same comments here as with DEGAMMA.
>>>
>>> Noted.
>>>
>>>>> +
>>>>> +This is part of one plane engine. Data from multiple planes 
>>>>> +will be then fed to pipe where it will get blended. There is a 
>>>>> +similar set of properties available at crtc level which acts on this blended data.
>>>>> +
>>>>> +Below is a sample usecase:
>>>>> +
>>>>> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐
>>>> ┌─────────────┐
>>>>> +  │FB1         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │
>>>>> +  │            ├─────►│Linearize-   ├────►│ BT709 to    ├────►│ SDR to HDR
>> │
>>>>> +  │BT709 SDR   │      │BT709 inverse│     │ BT2020      │     │ Tone
>>>> Mapping├────────┐
>>>>> +  └────────────┘      └─────────────┘     └─────────────┘
>>>> └─────────────┘        │
>>>>> +                                                                                     │
>>>>> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐
>>>> ┌─────────────┐        │
>>>>> +  │FB2         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │
>> │
>>>>> +  │            ├─────►│Linearize-   ├────►│ BT601 to    ├────►│ SDR to HDR
>>>> ├─────┐  │
>>>>> +  │BT601 SDR   │      │BT601 inverse│     │ BT2020      │     │ Tone Mapping│     │
>> │
>>>>> +  └────────────┘      └─────────────┘     └─────────────┘
>>>> └─────────────┘     │  │
>>>>> +                                                                                  │  │
>>>>> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐
>>>> ┌─────────────┐     │  │
>>>>> +  │FB3         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │     │
>> │
>>>>> +  │            ├─────►│Linearize-   ├────►│ NOP (Data in├────►│ NOP (Data
>>>> in├───┐ │  │
>>>>> +  │BT2020 HDR  │      │HDR OETF     │     │ BT2020)     │     │ HDR)        │   │ │  │
>>>>> +  └────────────┘      └─────────────┘     └─────────────┘
>>>> └─────────────┘   │ │  │
>>>>
>>>> EOTF, not OETF, since it is converting E to O, electrical to optical.
>>>
>>> I think media decode would have given a EOTF applied data to be 
>>> directly consumed by display sink (in case we have chosen a display pass through).
>> Not sure here though, it’s a bit confusing.
>>
>> I hope I managed to explain this earlier in this email.
>>
>> Display sinks "always" use non-linearly encoded values, because it 
>> saves bandwidth without losing visual quality. For the same reason, 
>> images tend to be stored with non-linear value encoding whenever possible.
> 
> Yeah, thanks for the explanation and useful pointers. Will work on it to put the right expectations in the document.
> 
> Thanks Pekka for the valuable feedback.
> 
> Regards,
> Uma Shankar
>>
>> Thanks,
>> pq
>>
>>>>> +
>>>>> + │ │  │
>>>>> +
>>>>> + │ │  │
>>>>> +
>>>>> +│ │  │
>>>>>
>>>>
>> +┌──────────────────────────────────────────────────────────────────
>>>> ──
>>>>> +───────────┴─┴──┘
>>>>> +│
>>>>> +│ ┌─────────────┐      ┌─────────────┐      ┌───────────────┐
>>>>> +│ │ CRTC Degamma│      │ CRTC CTM    │      │ CRTC Gamma    │
>>>>> +└─┤ Use to make ├─────►│ Use for any ├─────►│ Use for Tone 
>>>>> +├─────►
>>>> TO Port
>>>>> +  │ data linear │      │ Color Space │      │ Mapping/apply │
>>>>> +  │ after blend │      │ Conversion  │      │ transfer func │
>>>>> +  └─────────────┘      └─────────────┘      └───────────────┘
>>>>
>>>> Blending does not change whether the data is linear or not. I 
>>>> suppose in this example, CRTC degamma and CTM would be 
>>>> passthrough, and gamma would be the inverse display EOTF for 
>>>> encoding color values into
>> what the monitor expects.
>>>
>>> Yeah, will update this to make it clear.
>>>
>>>>> +
>>>>> +
>>>>> +This patch series adds properties for plane color features. It 
>>>>> +adds properties for degamma used to linearize data and CSC used 
>>>>> +for gamut conversion. It also includes Gamma support used to 
>>>>> +again non-linearize data as per panel supported color space.
>>>>> +These can be utilize by user space to convert planes from one 
>>>>> +format to another, one color space to another etc.
>>>>
>>>> FWIW, this is exactly the structure I have assumed in the Weston CM&HDR work.
>>>
>>> This is great to hear that we are aligned wrt how the pipeline should work.
>>>
>>> Thanks Pekka for taking time out and providing the feedback.
>>>
>>> @harry.wentland@amd.com We can work together and build our design to 
>>> accommodate both Intel and AMD's hardware needs. This will also make 
>>> things generic enough for any other hardware vendor as well.
>>>
>>> Thanks & Regards,
>>> Uma Shankar
>>>
>>>>> +
>>>>> +Userspace can take smart blending decisions and utilize these 
>>>>> +hardware supported plane color features to get accurate color 
>>>>> +profile. The same can help in consistent color quality from 
>>>>> +source to panel taking advantage of advanced color features in hardware.
>>>>> +
>>>>> +These patches add the property interfaces and enable helper functions.
>>>>> +This series adds Intel's XE_LPD hw specific plane gamma feature.
>>>>> +We can build up and add other platform/hardware specific 
>>>>> +implementation on top of this series.
>>>>> +
>>>>> +Credits: Special mention and credits to Ville Syrjala for 
>>>>> +coming up with a design for this feature and inputs. This 
>>>>> +series is based on his original design and idea.
>>>>
>>>>
>>>> Thanks,
>>>> pq
> 

