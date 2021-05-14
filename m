Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27D380AC6
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 15:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA416EE8B;
	Fri, 14 May 2021 13:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDF86EE83;
 Fri, 14 May 2021 13:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiMLr4O2WkNU0oilP0ZB7UR8+aVLuZ89zG+H+IcmWGChNp3D5DVBnTiAeJb9o84Eco+mSZBA24xYeaR1dLhVL2Ns6f2fM+QvuVzY3Zjwd+prRw1AXvXCDPq84JAzv2ehECEOcurcEZl9Rc2hb0evA8d0G00GWWormleVsinUskdU/RptnRX19fbXj1S54pXjy5iUvwA81AT7KB0Omkr90cEjgUlDRnBTV4cW7iMiFl7n5KjCSPQnQEvA0wE1W+nfkTbacfVNQC5XDta0TBDXV8WrICTJazzENZ1nzBYJJHiakuhh7lLvalqZwhzddiNBQ2OJeRTOb+pgqv6mlnyLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ2dsgk6iTJJ+2L6+hLYxPwuqcDjYp3n7F4IN6k8UcE=;
 b=Vr/7o37ZFpQtac4njyQiUI+NOMV+gMSOCt6vrgOVFBd+IDv9dpcmf/kukhNWv8F5IMRNhzO7ArYB9ALze0HPfZLemhyhi0bJ4khVSwXp40Hrrk8DtrYXsQz/RbvrH3XYhyLvIl+u/zSBYTCK6mLXsukXHPwA5MCpucOaxN5j8Hi16/f2KwRCTIG1zDOEBv5+ro5wE19d+q6k7Q+CvQiEYwpEVyxXwIhpw9hHC/tZdC5khL4Wx4aZBhAygKCp5RXyxHS/33E2WigVe1hh6l6Z/ntB6Zah+6822iAclJuNePKlxLot56okuKNzaKtS4Ck0o5WTIRZwXelxInpy1uXs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ2dsgk6iTJJ+2L6+hLYxPwuqcDjYp3n7F4IN6k8UcE=;
 b=Q06SoNhq+RmVzGJ1PFPZ3COfcfl5Xqwv2r9GHoLzv3kOVfzp2saTaa3PjHkxGsAJ3weGR5Rj9Ot89n8znQ27J5NNIGW4CmFs5Vcz5k+kyhfkuZ3jvZwc/3Qs8XtapmMyNWRYqYwI60GXkG0TJzC69SmQeyxFVDUiQKcah9EAwKE=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2385.namprd12.prod.outlook.com (2603:10b6:207:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 13:54:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 13:54:01 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
Date: Fri, 14 May 2021 15:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
X-ClientProxiedBy: AM0PR07CA0032.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
 (2a02:908:1252:fb60:cf70:a0fd:8c48:efd4) by
 AM0PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:208:ac::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Fri, 14 May 2021 13:54:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af35344-2968-403f-aeca-08d916dfba53
X-MS-TrafficTypeDiagnostic: BL0PR12MB2385:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB238535CBCE42A48087802A3E83509@BL0PR12MB2385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwYB/gChxqqQyGsSKcyOZTGRh7aOUCVOGgz5pos2cEX3ldW1n5DdZRLpZe2o1Y+ZCZyqDIHGoMKBujb/y4HSzGPs+1BsS4052qr8X7SKz8sGBIgtOYMQKtGNcq7WkCC1cd0bEHgVFGBMAcbxIO4IgynynBV3NpjUK4jKN1QpDcLej9yzsFIFypxhpwdljuTzUxUnoq+VzquiG/EOX/AgsBAJZeAaNcamnWAIp5iJbRWTFAFt7/BzBnB+2V55eH9cNsVDM4j8n+n7Y2qDY2JGbhswxu6mqopv5M7NYxF4xzccdrylH6/iL0kd+Qt/mBD93LliEbmHp2z66pRp8mdQ7NtLRP42xjPuILbIdPekXZo4TSytzdxy8eTUBdcxQrDB0hd2yLcwxTbexHl9/Ay8kPe0zLIPaonMFN1rBTbMji6KTeP08ab1OyShLLDIh2R/NbIbgpSZVT8kQqG15cTsZH2e8tYlGBYsQsLZ2HyYiSHFZBtETvCeXWkH7jfWmyNpD8q+dD57xooydvhqjxHbCJd4g+G4Qlg5JkeBkFJ1yEIz/AaN98V5F79esJ1IK2SyCD3urvYh/6oIWwmZAfeC3KL69U0rio0cblrj9Wvwp6chJ1ePyoP9LDCDZ7yQcVoPDRiM59/FoiQGJbM6qzvfxkKppGieHx0NyohP0z5lRWgyadqNOJGy50/E4/Ozp6lH0MxWWVUfj5fpKvPuIQrho/42YRw7UflZ3ufJCM6VZWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(66556008)(86362001)(16526019)(8676002)(4326008)(38100700002)(66946007)(6486002)(36756003)(31696002)(54906003)(478600001)(966005)(45080400002)(110136005)(66476007)(53546011)(316002)(6666004)(52116002)(66574015)(83380400001)(30864003)(31686004)(5660300002)(8936002)(2906002)(186003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWFYc0JpejdOT1QwbVZmZGVvWEpJeWdwWUwvbXNwbm1rTzhaTm5uU2VzSWhI?=
 =?utf-8?B?a0pVT2N3d25yZGdwTmoxczd0bytPeDcrQlpWUnRYdWVURG1sOTJPemI0QjJv?=
 =?utf-8?B?VktzemIzWGpWNVFQMXNWVXdmTGtxZUdPNU9iMzBvdzlYSVdXMXYrcHd6WEgz?=
 =?utf-8?B?dDJRcUd3TmVSbGE1TUNFQUxvWHA0MHU2MXRSSzNBVDZWSnJ1U1R4OFdYdm1p?=
 =?utf-8?B?emJRbFdla1M2SnY4SkhEYWtOWGpqdjZqazBnYmx2TlZCSlJpQ0pLZEpra2Yv?=
 =?utf-8?B?M1p3YU4yZ083VklvL21uNEFjeVlrREMwZnM2K3ZWSXR6TVo4aDl0Q1hmZjU2?=
 =?utf-8?B?VkpOWktObnU4d3AzMlp3YWRmSkRZUHFGeXY5Uml0QWtVMWpsZzc3RXpDWW1W?=
 =?utf-8?B?QVQ2WnAzbGFIQTZodGpJNFlnSHhaSDF2RzZma3FqeXhDQ2xYS1Y1YjBvRE1w?=
 =?utf-8?B?VFNLcDBhWEp5b2J6bWs3VFJSOWdPbVZkNlNDeDVDS290c2NiSjZRUUlmbUln?=
 =?utf-8?B?Q2hubElhSWhjK2kyYXN3K2NHYXhld3V1R0grN1EydklGblFSTWRpUFdrRGND?=
 =?utf-8?B?MTlxNEQ3TkxHQ1pVMFlTZVZLT3ByMTdLSUZjQVFkakxDZ2dLNUJ1VFg1OXJn?=
 =?utf-8?B?VVJ0Mzc1QlNzUmJVN3FmS01MS09wZFZZRDRDNkpxWlVTeERKUkE5Vnl1K0Jj?=
 =?utf-8?B?MGtaSC9WY3FKV2MrV0dLbjZ4OU9uSkNMRGd3OWVvVzc2WnRud2JheGVicmY1?=
 =?utf-8?B?ZERrK0ltMmhrM1o1T3ZTbFJDdFdQM2dFazZDSnJCL2Eyb0Q5bW9tSWRGeloz?=
 =?utf-8?B?NFBrRUZqSFk2cVF0NFV5eHJ5TkF6djBHZWJIZGprSUhSSks4VmpFRkphdWtm?=
 =?utf-8?B?WE50bTBtbTQ3Z1c5aEJ1MXJadk1zSkkrQU43UDAyb1FTeW5RUDB2SVdOK3ow?=
 =?utf-8?B?Q0t3b2hZV29nOGk2UFMvTndhMjliamZWREpCU2RVTzlmNVVKKzJSUlJ4dXdK?=
 =?utf-8?B?alJocE9VajdRZXpTSGFEa21yV1pqcmRJbmFud1dKeGFKOGhQUnBCYWhxVkdX?=
 =?utf-8?B?UTVrOHV3UnBKVi95QVJpQ3A4ZE9aeFp2SUtlVC9wZ1M3ck9PaFh4VkNlbit4?=
 =?utf-8?B?TExCZ1dKemtpUXRrR0lHYksrNW04ZW02dHM1dGNvYzF2MHlTOFNrRzZ3Vjhh?=
 =?utf-8?B?TGROUVpPVzJNLzJaL0ovSWJCVE5McG9rU0hXYWM3RlR4NVJRRDZjRnN4Smlj?=
 =?utf-8?B?VXRtTmdRY1dhcitPQkFqNkY3UHpSU3cyemtkL09Dd2ZiNmh0VW9abTNQbEtC?=
 =?utf-8?B?MnNsMU9NLzZiUnBNRlRrdUJudmZTWEhTT2NZU1ppTTdOeHFlUmJYOEZaSWVI?=
 =?utf-8?B?dVBIcHBJU3dvTjZKVXZVcEhsT1ZnVGl5SGFCdC8vVmJHM1dwRmNOL2V2M2Ey?=
 =?utf-8?B?cXliS3NVNVFKMXdzZ0VOaUtXTXVaT3p4bitiakNITmVyRmROaUNFT3BoVmsr?=
 =?utf-8?B?QWg1SDdIR2ZiR3RZcWkzN1l5Yy9sM2VFdWFPRU0vQmJQSVNmbU85cXRvOC9a?=
 =?utf-8?B?QlpZR1ZyUWxGWCs4NldINk5qYndYWkJtcTA1anBBVEszQno3QUU5dmUzOUJk?=
 =?utf-8?B?VEhrUVc1VG4yRm13MkdNMldIUldENzh5VmZQa3gwT1dyMlR3dEhHckVJYysw?=
 =?utf-8?B?TkIvMEo0YXBBaWpnTFlMVC9EcjlsUENUd0xINTBsQkpCdFF6aVNhWHYyNU91?=
 =?utf-8?B?bkRXdGhjN0tvVVVhNFlkSGdFcFVMdlYxTGdTQmYzalJxZ0JNK01Kekp4SWJG?=
 =?utf-8?B?cjVFU25vbkowU0h5VW9JZGs4YXR3TE11TjdXTXloVmtYeVZXTG5wZFBnekFa?=
 =?utf-8?Q?+glS9MwzCZV1Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af35344-2968-403f-aeca-08d916dfba53
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 13:54:01.1868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rmha6VHYabDWJZ/LbMgmhKKT7ce/aHbTc45x7vAzDWoy4vq04HaK8rQb7T15PdiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2385
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> David also said that you considered sysfs but were wary of exposing 
> process info in there. To clarify, my patch is not exposing sysfs 
> entry per process, but one per open drm fd.
>

Yes, we discussed this as well, but then rejected the approach.

To have useful information related to the open drm fd you need to 
related that to process(es) which have that file descriptor open. Just 
tracking who opened it first like DRM does is pretty useless on modern 
systems.

But an "lsof /dev/dri/renderD128" for example does exactly what top does 
as well, it iterates over /proc and sees which process has that file open.

So even with sysfs aid for discovery you are back to just going over all 
files again.

Regards,
Christian.

Am 14.05.21 um 15:42 schrieb Tvrtko Ursulin:
>
> On 14/05/2021 09:04, Christian König wrote:
>> Well in my opinion exposing it through fdinfo turned out to be a 
>> really clean approach.
>>
>> It describes exactly the per file descriptor information we need.
>
> Yeah fdinfo certainly is mostly simple and neat.
>
> I say mostly because main problem I see with it is discoverability. 
> Alex commented in another sub-thread - "If you know the process, you can
> look it up in procfs." - so that's fine for introspection but a bit 
> challenging for a top(1) like tool.
>
> David also said that you considered sysfs but were wary of exposing 
> process info in there. To clarify, my patch is not exposing sysfs 
> entry per process, but one per open drm fd.
>
> Top level hierarchy is under /sys/class/drm/card0/clients/ and each 
> opened drm fd gets a directory in there. Process data I expose there 
> are the name and pid, but these are for convenience, not as a primary 
> information.
>
> But yes, I agree this part of the approach is definitely questionable. 
> (As a side note, I am not sure if I could put a symlink to proc in 
> there. I think sysfs and symlinks did not really work.)
>
> Another data point is that this "client root" we think would be useful 
> for adding other stuff in the future. For instance per client debug 
> log stream is occasionally talked about.
>
>> Making that device driver independent is potentially useful as well.
>
> Alternative to my sysfs approach, the idea of exposing this in proc 
> was floated by Chris in this series 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F86692%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69e215ff2b434ba36ecc08d916de1754%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565965394961215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JsARknf2q%2FwtGfgLM6ZUOSkaivV%2B6yakpqYh%2B6yQlEc%3D&amp;reserved=0.
>
> That would be generic enough so any GPU vendor can slot in, and common 
> enough that GPU agnostic tools should be able to use it. Modulo some 
> discussion around naming the "channels" (GPU engines) or not.
>
> It wouldn't be able to support things like the before mentioned per 
> client debug log stream but I guess that's not the most important 
> thing. Most important would be allowing GPU usage to be wired to 
> top(1) like tools which is probably even overdue given the modern 
> computing landscape.
>
> Would you guys be interested to give a more detailed look over both 
> proposals and see if any would interest you?
>
> Regards,
>
> Tvrtko
>
>> Regards,
>> Christian.
>>
>> Am 14.05.21 um 09:22 schrieb Nieto, David M:
>>>
>>> [AMD Official Use Only - Internal Distribution Only]
>>>
>>>
>>> We had entertained the idea of exposing the processes as sysfs nodes 
>>> as you proposed, but we had concerns about exposing process info in 
>>> there, especially since /proc already exists for that purpose.
>>>
>>> I think if you were to follow that approach, we could have tools 
>>> like top that support exposing GPU engine usage.
>>> ------------------------------------------------------------------------ 
>>>
>>> *From:* Alex Deucher <alexdeucher@gmail.com>
>>> *Sent:* Thursday, May 13, 2021 10:58 PM
>>> *To:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Nieto, David 
>>> M <David.Nieto@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
>>> *Cc:* Intel Graphics Development <Intel-gfx@lists.freedesktop.org>; 
>>> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; 
>>> Daniel Vetter <daniel@ffwll.ch>
>>> *Subject:* Re: [PATCH 0/7] Per client engine busyness
>>> + David, Christian
>>>
>>> On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>> >
>>> >
>>> > Hi,
>>> >
>>> > On 13/05/2021 16:48, Alex Deucher wrote:
>>> > > On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
>>> > > <tvrtko.ursulin@linux.intel.com> wrote:
>>> > >>
>>> > >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> > >>
>>> > >> Resurrect of the previosuly merged per client engine busyness 
>>> patches. In a
>>> > >> nutshell it enables intel_gpu_top to be more top(1) like useful 
>>> and show not
>>> > >> only physical GPU engine usage but per process view as well.
>>> > >>
>>> > >> Example screen capture:
>>> > >> 
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> > >> intel-gpu-top -  906/ 955 MHz;    0% RC6; 5.30 Watts;      933 
>>> irqs/s
>>> > >>
>>> > >>        IMC reads:     4414 MiB/s
>>> > >>       IMC writes:     3805 MiB/s
>>> > >>
>>> > >>            ENGINE BUSY                                      
>>> MI_SEMA MI_WAIT
>>> > >>       Render/3D/0   93.46% |████████████████████████████████▋  
>>> |      0%      0%
>>> > >>         Blitter/0    0.00% |                                   
>>> |      0%      0%
>>> > >>           Video/0    0.00% |                                   
>>> |      0%      0%
>>> > >>    VideoEnhance/0    0.00% |                                   
>>> |      0%      0%
>>> > >>
>>> > >>    PID            NAME  Render/3D Blitter Video      VideoEnhance
>>> > >>   2733       neverball |██████▌ || ||            ||            |
>>> > >>   2047            Xorg |███▊ || ||            ||            |
>>> > >>   2737        glxgears |█▍ || ||            ||            |
>>> > >>   2128           xfwm4 | || ||            ||            |
>>> > >>   2047            Xorg | || ||            ||            |
>>> > >> 
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> > >>
>>> > >> Internally we track time spent on engines for each struct 
>>> intel_context, both
>>> > >> for current and past contexts belonging to each open DRM file.
>>> > >>
>>> > >> This can serve as a building block for several features from 
>>> the wanted list:
>>> > >> smarter scheduler decisions, getrusage(2)-like per-GEM-context 
>>> functionality
>>> > >> wanted by some customers, setrlimit(2) like controls, cgroups 
>>> controller,
>>> > >> dynamic SSEU tuning, ...
>>> > >>
>>> > >> To enable userspace access to the tracked data, we expose time 
>>> spent on GPU per
>>> > >> client and per engine class in sysfs with a hierarchy like the 
>>> below:
>>> > >>
>>> > >>          # cd /sys/class/drm/card0/clients/
>>> > >>          # tree
>>> > >>          .
>>> > >>          ├── 7
>>> > >>          │   ├── busy
>>> > >>          │   │   ├── 0
>>> > >>          │   │   ├── 1
>>> > >>          │   │   ├── 2
>>> > >>          │   │   └── 3
>>> > >>          │   ├── name
>>> > >>          │   └── pid
>>> > >>          ├── 8
>>> > >>          │   ├── busy
>>> > >>          │   │   ├── 0
>>> > >>          │   │   ├── 1
>>> > >>          │   │   ├── 2
>>> > >>          │   │   └── 3
>>> > >>          │   ├── name
>>> > >>          │   └── pid
>>> > >>          └── 9
>>> > >>              ├── busy
>>> > >>              │   ├── 0
>>> > >>              │   ├── 1
>>> > >>              │   ├── 2
>>> > >>              │   └── 3
>>> > >>              ├── name
>>> > >>              └── pid
>>> > >>
>>> > >> Files in 'busy' directories are numbered using the engine class 
>>> ABI values and
>>> > >> they contain accumulated nanoseconds each client spent on 
>>> engines of a
>>> > >> respective class.
>>> > >
>>> > > We did something similar in amdgpu using the gpu scheduler.  We 
>>> then
>>> > > expose the data via fdinfo.  See
>>> > > 
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69e215ff2b434ba36ecc08d916de1754%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565965394961215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=68CUMt7ykOfG4toK8RcLlPnkic%2BNPaagkuMNUWM656w%3D&amp;reserved=0 
>>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69e215ff2b434ba36ecc08d916de1754%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565965394961215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=68CUMt7ykOfG4toK8RcLlPnkic%2BNPaagkuMNUWM656w%3D&amp;reserved=0> 
>>>
>>> > > 
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69e215ff2b434ba36ecc08d916de1754%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565965394961215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1hBQYDiHkjLdJ6Xa7UmUDnPQk67YQ1tbfFfZ6jJZqk8%3D&amp;reserved=0 
>>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69e215ff2b434ba36ecc08d916de1754%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565965394961215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1hBQYDiHkjLdJ6Xa7UmUDnPQk67YQ1tbfFfZ6jJZqk8%3D&amp;reserved=0> 
>>>
>>> >
>>> > Interesting!
>>> >
>>> > Is yours wall time or actual GPU time taking preemption and such into
>>> > account? Do you have some userspace tools parsing this data and 
>>> how to
>>> > do you client discovery? Presumably there has to be a better way that
>>> > going through all open file descriptors?
>>>
>>> Wall time.  It uses the fences in the scheduler to calculate engine
>>> time.  We have some python scripts to make it look pretty, but mainly
>>> just reading the files directly.  If you know the process, you can
>>> look it up in procfs.
>>>
>>> >
>>> > Our implementation was merged in January but Daniel took it out 
>>> recently
>>> > because he wanted to have discussion about a common vendor 
>>> framework for
>>> > this whole story on dri-devel. I think. +Daniel to comment.
>>> >
>>> > I couldn't find the patch you pasted on the mailing list to see if 
>>> there
>>> > was any such discussion around your version.
>>>
>>> It was on the amd-gfx mailing list.
>>>
>>> Alex
>>>
>>> >
>>> > Regards,
>>> >
>>> > Tvrtko
>>> >
>>> > >
>>> > > Alex
>>> > >
>>> > >
>>> > >>
>>> > >> Tvrtko Ursulin (7):
>>> > >>    drm/i915: Expose list of clients in sysfs
>>> > >>    drm/i915: Update client name on context create
>>> > >>    drm/i915: Make GEM contexts track DRM clients
>>> > >>    drm/i915: Track runtime spent in closed and unreachable GEM 
>>> contexts
>>> > >>    drm/i915: Track all user contexts per client
>>> > >>    drm/i915: Track context current active time
>>> > >>    drm/i915: Expose per-engine client busyness
>>> > >>
>>> > >> drivers/gpu/drm/i915/Makefile |   5 +-
>>> > >> drivers/gpu/drm/i915/gem/i915_gem_context.c   | 61 ++-
>>> > >> .../gpu/drm/i915/gem/i915_gem_context_types.h | 16 +-
>>> > >> drivers/gpu/drm/i915/gt/intel_context.c       | 27 +-
>>> > >> drivers/gpu/drm/i915/gt/intel_context.h       | 15 +-
>>> > >> drivers/gpu/drm/i915/gt/intel_context_types.h | 24 +-
>>> > >> .../drm/i915/gt/intel_execlists_submission.c  | 23 +-
>>> > >> .../gpu/drm/i915/gt/intel_gt_clock_utils.c |   4 +
>>> > >> drivers/gpu/drm/i915/gt/intel_lrc.c           | 27 +-
>>> > >> drivers/gpu/drm/i915/gt/intel_lrc.h           | 24 ++
>>> > >> drivers/gpu/drm/i915/gt/selftest_lrc.c        | 10 +-
>>> > >> drivers/gpu/drm/i915/i915_drm_client.c        | 365 
>>> ++++++++++++++++++
>>> > >> drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
>>> > >> drivers/gpu/drm/i915/i915_drv.c |   6 +
>>> > >> drivers/gpu/drm/i915/i915_drv.h |   5 +
>>> > >> drivers/gpu/drm/i915/i915_gem.c               | 21 +-
>>> > >> drivers/gpu/drm/i915/i915_gpu_error.c         | 31 +-
>>> > >> drivers/gpu/drm/i915/i915_gpu_error.h |   2 +-
>>> > >> drivers/gpu/drm/i915/i915_sysfs.c |   8 +
>>> > >>   19 files changed, 716 insertions(+), 81 deletions(-)
>>> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>>> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>>> > >>
>>> > >> --
>>> > >> 2.30.2
>>> > >>
>>

