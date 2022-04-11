Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16724FBD50
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65C510F248;
	Mon, 11 Apr 2022 13:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7410F241;
 Mon, 11 Apr 2022 13:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB7sPdSHS5urmOacZmBDoMhPoDnqMKOy8F93tE5f5A4wIwjaAazuADFzjkwgAmpXHe7QwFww5Z0J7mxqIjkqSqNX1bmtKdOcmlWqqSpkI2sUVSYCDsPvlJzAkkbn09mkBQXNmy1XES96Xk+7ruazxm+T7HvL6l8NBuC7rj6a2cwqUrx0RuHK+VE2fBKjaJCtyAIhmpWmU8S7jeoHfc0mFDtZ+vWa7GHAQBiKGi73IWi9wm/R1Wkk1N7patV6xyaT2xkaIL+ZTouofrMHuKqlX/mr0cSUJSpdQjcXfOS8iIi9QE9X2rUB/+03cneKhJdAeIrTvLBUvrEIBExsQaFfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WASUREDzJPMB5rsT5m5hZVnP32pELhgOX5LH5DE0Ajk=;
 b=C45PvskWNJuiBfUD/inatTxu1uEpJ28kSIuVwJ+noyYU2FN/s18RMegvP2WKNZYpUaBdsYXNZgRSCP+yDs43KvRIt6kSfbZ7VOxaLcRsiArpjVMo+0GZQOQ8JrClUmjnusH9g3HBz9h+nkaXdG083PdAJTp/fQTVfncRUDRa8CW5gwhGl0ITZ+tWZ5ix7pf6b+kunLA4JLvlvUgjPpuOOsLsne1h96FIaWWcNr4L3ZLysfhuSYTcVCo3/aDOKgToUxvWDAtblpeBbqWSSj10489YN8b3e/yQFODRRvtHG+uyz5pMkEMy0SyKen9sZH3kcVzdBbEsVYtJ1MCKU91bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WASUREDzJPMB5rsT5m5hZVnP32pELhgOX5LH5DE0Ajk=;
 b=RZBbCQySKRmaCI2LwqOFSC3wGRqFIRtSlMngieKbrNxeASJGgXWs2ZMYUmWpXcHnt0Xd8o/9ZANIIXfVmxxqQJtOvsxHx2SblypQV1r4RWOiQ6t/t8lM8XDML7sSB6cAzfTYyKEdI1wrRyGivEc2NdqCb9WSf5SiO7Q2B1RikIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BYAPR12MB3077.namprd12.prod.outlook.com (2603:10b6:a03:db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 13:38:07 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::1c55:adcf:17e3:3160]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::1c55:adcf:17e3:3160%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 13:38:07 +0000
Message-ID: <8e58d05a-61f0-1e6b-cab5-fcadb661c7e5@amd.com>
Date: Mon, 11 Apr 2022 19:19:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] drm: add a check to verify the size alignment
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
 <9ecac65c-84d9-9965-4fd3-f86ea572bb9d@intel.com>
 <ca280f24-8efe-e972-4a03-700e002cc6f7@gmail.com>
 <5f2a190a-f8ef-9b5f-d6b2-efa30f367612@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <5f2a190a-f8ef-9b5f-d6b2-efa30f367612@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d897265-fcb6-418a-346a-08da1bc082d0
X-MS-TrafficTypeDiagnostic: BYAPR12MB3077:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3077A7CFE66D3D2EF6CBF6E7E4EA9@BYAPR12MB3077.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: htnnhpcLkSdUD1g/XaB9aSULPKh6CwVz6XP1gG7jXgFY+SRaKJjXcPMfcNX4iiosNxlLBRuyZsPjaNZSFQAHrJ5IQyfdPOfFnQoCwlVGMz9amQYymi+/IlI7fsvifUXlIWO8iuhA3S17k3GrC8YXI7gAte+GCWrh3E1oFbJhDbKiju40lhm/tkD4hOho3jtiTWyVvQf6SLW37qckP2sqnVpPNku8EDBBdBaLY/I3fSG2T6F+c06NR0CmxVXlmzm+JC2RI0Hc8yzQJD7Xse6MjX62v8qrBPa/HdoL72fPaLT6ZzhfkAzkEjN5yUzWuQ58IqByyhQV1EOB9KyI1VtH7YIVrbP3iE6MLzzaZkBUE9Re2j2R0MeD8NBdHRzuvIXFm6dfbLx6UBxupautVsbpcGxjqVgl7y7kV+1rMJZdtgz8DFheHnDxUuHbs0+8NHPZsjaHu7s+Z8dqfF0UjgzAsYslMMykvKBGHg3S5BpAf2SxlTanOjZ1Kn2qh+Ma+DemedxoGq9+r1eie9rrkOnLJUAcTF0JaL6DRBvwtK8praYlOtI46ej+/GzKy1KdEEYDrvif6rifqLGgAVOsTjK/7Ye6w7HpWRwgkAO6fOlqfHYmT6mlVFy7VqKvWOzNKnv6dAXz2QpIRATjk2dX3nJEEe6J1HTyTrdinOJw1SbRipULrGA86hpTXgp/NQwfdHWzG9UZ/UI+R3r6EXFtGXMqepHic8yo04Yvc4fazGYJXiY1Vlb9EbLd2jDREKtot9Cm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(8676002)(31686004)(6666004)(2906002)(6506007)(316002)(53546011)(6512007)(4326008)(110136005)(83380400001)(2616005)(66946007)(66476007)(66556008)(5660300002)(508600001)(6486002)(36756003)(38100700002)(66574015)(26005)(186003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFxTytoNElEYlBoOUFTc3d2MjlKbXZOYmJFZTNHeFBmZmxGUHM0NW0wbWNr?=
 =?utf-8?B?em1lNXNnQ3FGUXkzU1NrWDZhc3RXMFVnNVcvbEhWVEZjNkw1aUtWM1E5bkpU?=
 =?utf-8?B?ZllkQSszTElobVZQZ0lzaDFLay9XcWczL2ErL1FjTklaZ2lSNlorbm9tbmdM?=
 =?utf-8?B?Wm02TXpJZzZIdDFmbisxZFdoczRoNW5jcXZvZjBEY3ZXeXdjcDZ4TkxGSEI0?=
 =?utf-8?B?T1VZYVgvb2ZSbVNXcks1L3RtY2o0T2c2d2tTNEc5eGVscGhqK1pYWjV5MDV4?=
 =?utf-8?B?ZktUU2hkcGY1TzlScjZGUURoOUJTb1Q3TWRabDNkYTFQTFBUdUZEdHMyYkFU?=
 =?utf-8?B?dGJ5d09kYnRjT0h5eWdTb3dxWWcxT1M0dUFlNWFVVCtCUjF0T2ptcWJrd0NP?=
 =?utf-8?B?SW0zOUZEamtKUVEzdmNLblVLWi8yQW1CTWJKMFZpSlZyTFRoQ0tQcTAvYzNa?=
 =?utf-8?B?R3gzL0Y5aFpIUE5DcnlpcDJoL2pOLzk3Q3grTDZlVWd6STdpSnFPNjhabjN0?=
 =?utf-8?B?TnpCd3Q1TEtEeU1rQU1udzJyam8ya0pHYlluZ3pKcW43WS9oOW5Camx2NnVz?=
 =?utf-8?B?SE9yZGpBYldja3JFSXExOWxwV2U2MWZET0VvYXFESFFGazM1VUxCVStHY3h6?=
 =?utf-8?B?L0xOdjFjMUUvVExDR3JnUlFscHRMdmpiZWxkamJsZzVRYzRkNEN1cWtpc3ov?=
 =?utf-8?B?U2hPelV1enVTV3diWWxQTmRFMTFsWXF2ZTE1UVNsZnZmT2JWNnE0Sk82WW4r?=
 =?utf-8?B?c0JTbEltM1hneTFCd3YwL3JnbkZGK3lROTlPTjIxd2s2bjNMMnNjZ1VqSGRW?=
 =?utf-8?B?bUh3ekFYdUxITG9MbGpFYmFwemEvT2IwTlptWU1WeW5sLzgrWGZvUDZod0w5?=
 =?utf-8?B?VWh1ZDhUZllBck5IT3FkZGZmaEt3elRJUVlLeHhRb09ET0JyN1pMNnptL3hX?=
 =?utf-8?B?dU96QmM3dlVXSEIzQjV4UGZyQU9sR0ZzQi9qVVp4OVUwYm81TGFYbFB5bDcr?=
 =?utf-8?B?NCswNjdURGlNVDBJTTJwVFpIdTlTUUpiUE94WDd4MEtudVQwWFo4STlhOEdG?=
 =?utf-8?B?eWFkNVk4eGdVeXRKaUJoRUlJbDNBOFh3c0JhR0FmU0d2QUE4dktGZkp0Q1cx?=
 =?utf-8?B?Q1pmbkJwWGg4ZmZIZzZMQk9WRWIwdjZpd1hFNE4rL3pnM0RwNGtONnJQY3Vu?=
 =?utf-8?B?RVpIUXR6MUc3RnVNU1lqcDlMeTN1Yk9zUTRHWW52ZzVtQ1ZjTG02VkFBWFlL?=
 =?utf-8?B?SVRJbEJaUFgvbi9nTUFRa3FERUlLeDlncld5K3Y3TWZtSWltOVJORmcvTEVl?=
 =?utf-8?B?ZHQ2bXdkYVZhcXJYODVUdVpFWHR5UFYwQjVRNWFKMU5mNGtRZ05Ec2dUVFBH?=
 =?utf-8?B?MHE2c3lhY05hTkhxNGRFdHVxV21neVBaY2xkaVBsTWliSGhKMHEwdWhnMUpq?=
 =?utf-8?B?UzNvZEMvUmt3SUxsclRhb1B3KzdmNVdGVE10Tm9iWUxzb3JTQ0c5NUI1eU9I?=
 =?utf-8?B?a3JSVTJ1c0lheUh1d214Zlc2amRoMk1SVTFBa0lEdWNPeDRVNkQ1bzZlYm5E?=
 =?utf-8?B?RjdQcllpYWNmK1ZZZ3AwbE03QmN6QTFjMWtiaXFTSW0rWUFhMGdLdjlmVW1q?=
 =?utf-8?B?cVZSb1FTaDVYaW1NTEtRQWErd0Uyc29mK0ZqOGZ5bzk1UWNJc2hXcDZKZk50?=
 =?utf-8?B?TEVXdUhrTWlNRStyKys3TGRVSVJHUkRscm5WcWNueWltNVk1S2NkTmZXTlhr?=
 =?utf-8?B?UXhzVFRTM3BJajJSTkRFLzFkUmJqNTZPMmppZ3JFQU1WTHlXU29TeHNNcHJj?=
 =?utf-8?B?M0toSWVXeE1WZHNYV0kyYjZtRXNGMGZRYnhIZkhGYnhJcjh2OGZEcEZYclBh?=
 =?utf-8?B?ZFdlNU1ZVlFBTUYraFRuVTBzOG5TTWxodEgrN3ZoVGZzKzkxc2JvS1FmSFht?=
 =?utf-8?B?cmlmM1V0QnZ5NGZBWkdmeHdLWnNIR2dCczVRbXVYemp1anFiTlZ3N1ZCWE9C?=
 =?utf-8?B?NFhyNDg5L2dHcngzTmRkN240Z2UrY1BSdUlFVU5OT09RNGltS2hYVkV4WjMv?=
 =?utf-8?B?aGFPZHpraU9Ib3dCTXVldjFaVG1GUFd0SVVSREZPbHdLV1ZVUGVPOEEvUkps?=
 =?utf-8?B?ZGl6YzdtQzlaV0FoQ2VHNnVESHMraXFuYWZ5S3p4NTFTZXoyc0ZXbFZ4L3BP?=
 =?utf-8?B?K3JOY1g2aVk5T2M2dC9qWWtKeDdCSm1WK01TMnAzU29hTkFka3h3aWdIak5L?=
 =?utf-8?B?QldaYlBxbHFyZ3RxMDUxTnE1amtPcDMyY1U3SUhGd2UzMTVoSHAwclR1VHhz?=
 =?utf-8?B?OWNXUlBicmlnVjU2WTEzN2kvTnFDZkNsUXcyeW14RUpmc1g1ZWRzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d897265-fcb6-418a-346a-08da1bc082d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 13:38:07.3242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Prn8YaML2oDWg/iWOd2js1p79NbyRotokzduzantfjPdaaLefLXDinuIM08E/2VtVcDBnMdX1RDRrG+PmTxAMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3077
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/04/22 7:02 pm, Matthew Auld wrote:
> On 11/04/2022 13:42, Christian König wrote:
>>
>> Am 11.04.22 um 11:47 schrieb Matthew Auld:
>>> On 11/04/2022 08:38, Arunpravin Paneer Selvam wrote:
>>>> Add a simple check to reject any size not aligned to the
>>>> min_page_size.
>>>>
>>>> when size is not aligned to min_page_size, driver module
>>>> should handle in their own way either to round_up() the
>>>> size value to min_page_size or just to enable WARN_ON().
>>>>
>>>> If we dont handle the alignment properly, we may hit the
>>>> following bug, Unigine Heaven has allocation requests for
>>>> example required pages are 257 and alignment request is 256.
>>>> To allocate the left over 1 page, continues the iteration to
>>>> find the order value which is 0 and when it compares with
>>>> min_order = 8, triggers the BUG_ON(order < min_order).
>>>>
>>>> v2: add more commit description
>>>> v3: remove WARN_ON()
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>
>> Question here is who will be pushing that to drm-misc-next? Should I 
>> take care of that?
> 
> Yes, please do.
> 
>>
>> I think it's time that Arun should request push permission for 
>> drm-misc-next.

How to get push permission for drm-misc-next, should I send request mail
to maintainers, may be next time I will push myself.

Thanks,
Arun
>>
>> Thanks,
>> Christian.
