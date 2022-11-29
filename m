Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61C63BE54
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07310E3AA;
	Tue, 29 Nov 2022 10:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ADC10E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 10:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2sd5SYITM73Y4auknrODedkD8pfPhGUWuZeKqDGTmzicKEVDA2bitU0Zz3RGffQvqC1hTmD/QvIIkwIQx0y65+Ta/taVIufdua1dC6FETkKrNJo90YN9HBUQHNT6MG2ufic+YoTnJErHCotIaR2UA9PkSL0ueyH1hE161v66ngGb5p1laox232pmbfyGmTr2sKRyOfHRGucO/nJ3Vhq+amgu/LGzRGZd/ilYOYMvD9CQ8sKm9TCmhiKBBFlil3IHM+ok3/ni6K/aeRgsd/mE9DcGUYntG/rtlHmcZS7cSsjMNX6QTwqjXmt1ZYwHMtgIWSO4wl8It+wMZLxTBHNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRP6j5eXbAihf1vywY0NfpDU6sjkiyLfqI1j6sju+rQ=;
 b=i6S66+zf0r9rkVGBwiSO1oRRb21u7Ri5fs6cdSMD1wc3qdMDC9h7zVk//kXWqzkWze6fi5PzydpoIKocVF+27nJWprr8aXY0xQ0AdpVUlCzs53nKa/A3hG2AEl6PL0H9mV4dQG8Wf0bpgbxsmPbO/nrUE/uk/dAyICptjpqyTiSf+Up4AaVhmjWTAddecqu+zYLmoKFPNITCV/5MVGl3BRpXlBeXCigQi5xkQu5CHNXG1c+PqyMJsnsZliwHPYGZ5KBA3nxEGdOM/0+un/Hh6lDcDEU8y0pxEr4/9GFE/E8nNp88JFCrL9RAalHfr00X34zY5rsfs7JXyY+4XitrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRP6j5eXbAihf1vywY0NfpDU6sjkiyLfqI1j6sju+rQ=;
 b=HrdVxJgPZxQu9iIh0e6+DHhDOKs8IZfRlYot3ooEiMj2GNjuJnHPM7b/GYuLIgTKniHrv76iTBx3xe9LJ6tOOseVuwpml9GltnTVHUtT6Y3xX1t11eiavkJxk3gb/+Th54yTw2WYadSd4HXx3f3LD53UlSC4IC5xcNn4rRVzIxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SA0PR03MB5578.namprd03.prod.outlook.com (2603:10b6:806:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 10:57:34 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 10:57:34 +0000
Message-ID: <76147056-e937-8e7d-e589-7fabb3c61345@synaptics.com>
Date: Tue, 29 Nov 2022 18:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC] drm/fourcc: Add a modifier for contiguous memory
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20221129101030.57499-1-randy.li@synaptics.com>
 <CAPj87rOiLoGCnOio7=g9wd4auMuwSQV8PesD3Svf=gOWJAzwOg@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAPj87rOiLoGCnOio7=g9wd4auMuwSQV8PesD3Svf=gOWJAzwOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SA0PR03MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e358296-7526-410f-b734-08dad1f8855c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwVPKWHs0/yO/vHo2lrQmyB6D9UIQEpcfAGJT18IGGTK6cewjtC5c0aqAQrinwe/uZtw0SD6KmmI5iWaLINlnNMrPW/RpHyIecFKQXVNAFsT+Yd8qG/ddR/X3vRI4cthR1PqzxwP7DTY337yfI0UXXb0rR5oOtemLOcFUGTKBNlH7oj7D4+2GUESfAJdGFmQ4KFneHfk/MF/Ztr9JuZKn8/cAAV48Bb5zB+Ngk4RibQb8gup0lynMuTad9CHns2R4C3UWacsP3ep5cEhc447IhaGsu0RSKHtWIIqPgB5Rkex6dgjUw4/okg0jyurbkx/oG0VyHyAAcTQVqjPDe//TsHTimnXxOfkZkC/wEnETqfbpmyJJf8/lMTiGK0CHJLsBb4I4SxxTSuVUcjD4BDD/kevNTNzLGt8D8m7FLB9ntd7NhmHYWlffAAV8dvrU3K9IySPcLlVy2jM9KwqkA70leShk2AjWkh/316j1pEsSaZZtAm9xYk/zBjw8vFDPPvERwa4wP/2AyuWAdbiz8wi55DU9cF281WLJoTJEX+Sj4jzr/mDBdj0ME+sn9Z5UWanqAAVcFzbcyBNHBgmUpCPHEfanPVz0wdxJ9hsAF9FtJCx/NVlP+TavGSVuPk8o/p3RMInhUBeF/fbe6qDZ6ivQ+2VoNnjkzjsB+iTTcsghZ5mLFWZohU1rsP0c3BWgYjcnrURuKLhk66ZnFRlC8OvS/vDcihtje5vLBbrjALYYAGCcobmWUJK24HGuTvyeso8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(38100700002)(8936002)(7416002)(2906002)(31686004)(316002)(86362001)(31696002)(36756003)(6486002)(478600001)(186003)(38350700002)(5660300002)(66946007)(83380400001)(66556008)(6916009)(41300700001)(53546011)(26005)(6666004)(52116002)(2616005)(6512007)(6506007)(4326008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3MyUGxDVUJqL0EyOGFMVGpQdWdBeEFQZDZiTlRtTTh5cHVvRnpyeUVjeFBm?=
 =?utf-8?B?Y0FwL1VhTHJsWHpVdHA2N1kwUnVvd1NXQ3d0RmlEdDU4MzVQOU53T0dRS3Zj?=
 =?utf-8?B?c0trWDZxZTlSS3lQS0xpSnFWcXhpZWZUUU1kdGdyZkg3OS8ycms0U1QvelJs?=
 =?utf-8?B?eG9WcEQvZUlIWFd3djhWZTJ3UmE4L0QxOTcxRktwMHlDa01yOGxtdnFSMUpj?=
 =?utf-8?B?LzdxdlBzc2cvM2w4ZzhBaHY1R2JVV3lPMnZwd0l1TDA1Qm1HSUR2TWMyQXdp?=
 =?utf-8?B?bWhJMFRVUUYraDlKUWs4VEphQzIvazZpTHBjUlc2SURNdlhsaXc1eTFQU2NG?=
 =?utf-8?B?cHc0VFdPMTU3MHBiZkNFbFY4MFAxQ0JLdU5sNHdvMGgzdndOREVmZmo3QlQ2?=
 =?utf-8?B?WjhHZmE2eGQvNld6VXRRTWEvTGNubHZrNlVSV3g4OGl5Q3ArVk1iRG9NZ0E4?=
 =?utf-8?B?bUM4QmlGdnMwSTBnNXlWdTNDWVNuUHR1ZUh4VzlnSE9DZ2Qva1MyRy9TYW9Y?=
 =?utf-8?B?SXFNSjN0b21CcmZqUTEyaXhtdGxTS1I3SXBGWlZCZ291Zy82UnEyTnpZeHZr?=
 =?utf-8?B?MXRxWVE0eEhTdnpoYTF5N2RMdDdxY1ZFbGthZEhER0ZZcHlnekJTYmw4QmIr?=
 =?utf-8?B?SzN1bURacjhxaFN4VTBnRlFSZ3RacTlvR2F6aE1xeklJRHNDMURVaHVRU3Rj?=
 =?utf-8?B?TFF0SmxRYktNS08rQmdYaXVZa28vZ0ZneWxkSWdUK3Jkb3ZNbHpIVXFrd2xw?=
 =?utf-8?B?bDQzanVqMUovQ1BqaDUrK2hyT0FsbWU5bzBhK2dSdEZKWGVFaTFrandlSlBM?=
 =?utf-8?B?U1VXTmFHRXUvajNUcmZqZFkra0loOHduVm1TYXVoVUcwM0pTOWRoOHF0dld1?=
 =?utf-8?B?RlBvQllUcGFnMHd5aVp6ZERjM3R0a205MzFhMkNXbW5vNnRCYW9BWkE3TEx4?=
 =?utf-8?B?Q3NEWVFZQXdROFBZMDB3Q3pMRkE0WGpVSVY3U1VSMTFBNmE5VXU3UjdpLzQy?=
 =?utf-8?B?ZnB6aVEyZk5TY2Fka0psREZoTllqc1EwZzFKYllzVjlVWTN3dlpJSjM4REN4?=
 =?utf-8?B?WGdmRm12NkJraGJHRzVRMzg3VkVUd2wvSEF1UE85RDNKT0pJME9ZR2E3TGVO?=
 =?utf-8?B?ZkU4Yi82RW14YURCOHlOdTYyR3FHb0tObUI5OCtZeFNScXE0cFZTWU5QS2lz?=
 =?utf-8?B?bXhyU2lKMU4xZW9ZYWc0K21oZmlDdzVmcnc2Nm1pSkdGQ0h2Y2VVd1BMS3Zk?=
 =?utf-8?B?ekw2R0VGWEZvZ095LzZWK1JvNklOLzNxanhmWXh2WTNrdzUwbFJnV0gwL1dN?=
 =?utf-8?B?MisyQ25JZ2EwcXJ4bHdHbmZ4RzlKK2R6cmN2TUE2R2lrK0pGQUViUXgyYUtD?=
 =?utf-8?B?aDRmeGxWek4xUFliUVNjYzBpNFZxV3pZeUl0OGJCU2RkZ1drTy80akRXc0hZ?=
 =?utf-8?B?aXZTaXZ1Rkwva3VDUWNKc0V5RHBrc0FVS05idXFxV3JtMmY5KzVpb0Z3MjJv?=
 =?utf-8?B?M2V2ZHY0L2FFNjhIcklMTTJWeGJVaUZoL0gzTVJ2ZnBxZ2E0eWNxcFpiMyt5?=
 =?utf-8?B?T05FR0IvekRFUlpFQWo1dGd5TldaK2pITVJBdGk2TnNUYzQxYXR4RWcyNFpj?=
 =?utf-8?B?QnovNWgxK1JNQU42Q1RHK2txME9mOTJlMlliNWlSaWZNQ2hJVlc3TWNlaWIx?=
 =?utf-8?B?RHk5SmpWbFI2N0lpeWVoOSszRXZndmllU3g4QmFzd0VGbzluQk53UEVDZ0hm?=
 =?utf-8?B?TnJ2eFhWWklSeFJLRDRuVE1NQ1dhYi8yQkJXSzJjK1pBMm9DUU5Nbm1ZRWpo?=
 =?utf-8?B?ZHlmd3YwamFraDQyMGFkK3R1OFdwVjFFdkdaV0NkYXU4d1NESjJ5MVF1dFZ0?=
 =?utf-8?B?bWlZVjc1clZLaXIrQWN3bnVGQU51MXpJYVc0QzJ4YU9WYkMzNUl6S0Zrd1Nt?=
 =?utf-8?B?ODdCNUFlSzNmV3QwVGZzN2RCSWlWSERMK1h4RzF5Y08rdGt2dWFuMlR5U214?=
 =?utf-8?B?RzAvUE5JbUdHS1JEaUdHL3JEazVLaXdVYWswa0FmY0xnZ2JxK0g5bFlMNElD?=
 =?utf-8?B?NFZKcHdOclM0aFRVdFEzbjVxSVJUemZ4aHpNRWM0M3hwTDJjaXU0Y3dpb000?=
 =?utf-8?Q?Qso6nUw3JKP+PgQqhncQWS9LL?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e358296-7526-410f-b734-08dad1f8855c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 10:57:34.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qqjuwYo3XQ+aFjBQFH4EO6HkGGr8qHpK1vGLCJ2KyG31Y24bUdKS/B3ruFiLWtJiSXIu/ZRLwYbDg2/KJyJmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5578
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
Cc: ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 ppaalanen@gmail.com, tzimmermann@suse.de, tfiga@chromium.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/29/22 18:42, Daniel Stone wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Randy,
> 
> On Tue, 29 Nov 2022 at 10:11, Hsia-Jun Li <randy.li@synaptics.com> wrote:
>> Currently, we assume all the pixel formats are multiple planes, devices
>> could support each component has its own memory plane.
>> But that may not apply for any device in the world. We could have a
>> device without IOMMU then this is not impossible.
>>
>> Besides, when we export an handle through the PRIME, the upstream
>> device(likes a capture card or camera) may not support non-contiguous
>> memory. It would be better to allocate the handle in contiguous memory
>> at the first time.
>>
>> We may think the memory allocation is done in user space, we could do
>> the trick there. But the dumb_create() sometimes is not the right API
>> for that.
>>
>> "Note that userspace is not allowed to use such objects for render
>> acceleration - drivers must create their own private ioctls for such a
>> use case."
>> "Note that dumb objects may not be used for gpu acceleration, as has
>> been attempted on some ARM embedded platforms. Such drivers really must
>> have a hardware-specific ioctl to allocate suitable buffer objects."
>>
>> We need to relay on those device custom APIs then. It would be helpful
>> for their library to calculate the right size for contiguous memory. It
>> would be useful for the driver supports rendering dumb buffer as well.
> 
> As a buffer can only have a single modifier, this isn't practical.
Usually only those legacy or low cost devices would request this 
modifier. Unlikely they would support tile format(or we would add 
support for them).

But yes, we would be better not set a trap for us.
> Contiguous needs to be negotiated separately and out of band. See e.g.
> dma-heaps for this.
I don't really like the Android way here. If we are in a world of no 
hot-plug. That would be fine.

V4L2 has had a way to negotiate the memory layout it could support. 
Android gralloc would use the fixed platform sentences to decide the 
memory layout and buffer size. That is not flexible.

So would it be better that I add a common property(a list be the same 
length of the formats property) in drm_plane ?
> 
> Cheers,
> Daniel

-- 
Hsia-Jun(Randy) Li
